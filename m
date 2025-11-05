Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85931CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 15:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DkVRaa7s7VXIQ+R3dS7uFD2VK8mY1bhgcgXZNkaeHTY=; b=4jInEWWOMJfHWZp3ULPU49sG++
	FVV99G0fXPaL83tp9jJKcTG0gIvgwxFrsa10TDfK4lAzbl+SEaEcFFuLyJmIBtGgagmIpyJNVxNiU
	615LPf3YwDw1Z2OgNx3m5kgNDpFWsscvhoSr3/rBXMSBtDjEBC3Z+tNrQ5htTAPUoR53KuOj9QO77
	66db8SDYGNTe43T7eTwUIRie4pXrIfX2gPWZoaQsVT8ELut7IOfAnz2DnXyfGO8uKUAKqZL9pNpEd
	nXE1db2Lp2IGribGngmsu4gIs383+bnb0W0vOhh8WFpQV29XflWSihh0RAwBTXkz8htRJ/2m5GaOR
	uAHKxQwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfqX-0000000Dzwd-0l01;
	Wed, 05 Nov 2025 15:54:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfqV-0000000DzwH-0zjs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 15:54:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2DA11446A9;
	Wed,  5 Nov 2025 15:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 193C3C4CEF5;
	Wed,  5 Nov 2025 15:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762358090;
	bh=bDmEE2pN81Z2g2YR6bc8i2bpngqkwZUwaRFhJlKpZyg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AhPg/B8VjNxHnaY9m3hnZIhVsfN/3ger3hDaKJ9juGhQPT7Q31FIKz1GfEfLm9lBa
	 wrAPYeNff06W8A4sFdAO2lNwEpLpU2ajxjJ9dUcwuY7m+SscGOKuC5fdhsbPghxw74
	 zSGTeyl4KBT41Udl3hjxU4mDyLdsKUAgFuNDFVCS8iiV9ISY9HTyt6CmPEaFPFnZGx
	 QAon7Q7JSmhdpin7RYleSsDcCrNAmrM8ZAI8nmv/Z8dDncdspGea3eRv71ydSLjWyK
	 0NxQojLJ76Y7QBH+SFUUgf3k5GPK/BjpWc7DYQ28wGu7ZTgORMYRsfITRpaiAuNk/F
	 eweO4CzhLS7Ug==
Message-ID: <11b93504-c0a1-4a2a-9061-034e92f84bb4@kernel.org>
Date: Wed, 5 Nov 2025 16:54:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net V2 2/2] veth: more robust handing of race to avoid txq
 getting stuck
To: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: Eric Dumazet <eric.dumazet@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 ihor.solodrai@linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
 makita.toshiaki@lab.ntt.co.jp, toshiaki.makita1@gmail.com,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-team@cloudflare.com
References: <176159549627.5396.15971398227283515867.stgit@firesoul>
 <176159553930.5396.4492315010562655785.stgit@firesoul>
 <154ebe12-6e3c-4b16-9f55-e10a30f5c989@redhat.com>
Content-Language: en-US
From: Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <154ebe12-6e3c-4b16-9f55-e10a30f5c989@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_075451_342549_151D1D86 
X-CRM114-Status: GOOD (  18.52  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 30/10/2025 13.28, Paolo Abeni wrote:
> On 10/27/25 9:05 PM, Jesper Dangaard Brouer wrote:
>> (3) Finally, the NAPI completion check in veth_poll() is updated. If NAPI is
>> about to complete (napi_complete_done), it now also checks if the peer TXQ
>> is stopped. If the ring is empty but the peer TXQ is stopped, NAPI will
>> reschedule itself. This prevents a new race where the producer stops the
>> queue just as the consumer is finishing its poll, ensuring the wakeup is not
>> missed.
> 
> [...]
> 
>> @@ -986,7 +979,8 @@ static int veth_poll(struct napi_struct *napi, int budget)
>>   	if (done < budget && napi_complete_done(napi, done)) {
>>   		/* Write rx_notify_masked before reading ptr_ring */
>>   		smp_store_mb(rq->rx_notify_masked, false);
>> -		if (unlikely(!__ptr_ring_empty(&rq->xdp_ring))) {
>> +		if (unlikely(!__ptr_ring_empty(&rq->xdp_ring) ||
>> +			     (peer_txq && netif_tx_queue_stopped(peer_txq)))) {
>>   			if (napi_schedule_prep(&rq->xdp_napi)) {
>>   				WRITE_ONCE(rq->rx_notify_masked, true);
>>   				__napi_schedule(&rq->xdp_napi);
> 
> Double checking I'm read the code correctly. The above is supposed to
> trigger when something alike the following happens
> 
> [producer]				[consumer]
> 					veth_poll()
> 					[ring empty]
> veth_xmit
>    veth_forward_skb
>    [NETDEV_TX_BUSY]		
> 					napi_complete_done()
> 					
>    netif_tx_stop_queue
>    __veth_xdp_flush()
>    rq->rx_notify_masked == true
> 					WRITE_ONCE(rq->rx_notify_masked,
> 						   false);
> 
> ?
> 
> I think the above can't happen, the producer should need to fill the
> whole ring in-between the ring check and napi_complete_done().

The race I can see is slightly different.  It is centered around the
consumer manage to empty the ring after [NETDEV_TX_BUSY].
We have 256 packets in queue and I observe NAPI packet processing time
of 7.64 usec on a given ARM64 metal. This means it takes 1956 usec or
1.96 ms to empty the queue (which is the time needed for the race to
occur in below during "(something interrupts)").

It would look like this:

  [producer]			[consumer]
				veth_poll() - already running
  veth_xmit
   veth_forward_skb
   [ring full]
   [NETDEV_TX_BUSY]
   (something interrupts)
				veth_poll()
				manage to [empty ring]
				napi_complete_done()
   netif_tx_stop_queue
   __veth_xdp_flush()
    - No effect of flush as:
    - rq->rx_notify_masked == true
				WRITE_ONCE(rq->rx_notify_masked, false)
				[empty ring] don't restart NAPI
				Observe netif_tx_queue_stopped == true


Notice: at end (the consumer) do observe netif_tx_queue_stopped is true.
This is leveraged in the patch by moving the netif_tx_queue_stopped
check to the end of veth_poll(). This now happens after rx_notify_masked
is changed to false, which is the race fix.

Other cases where veth_poll() stop NAPI and exits, is recovered by
__veth_xdp_flush() in producer.

--Jesper


