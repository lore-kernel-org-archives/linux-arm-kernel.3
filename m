Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D9ACCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 19:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jHBk+PRXZR9KrZCHnOAgqqD6q66BZnTC7WM0gH+o3Iw=; b=joLAoyxPjyT6QkcRMI7FBRhA7C
	OhOV6H3Y5Fsdfxeg0vJXpZpOjhiTfqdfjEbSpyAhIOtjqn+IG/qOBzaImKlAYLhlU1RAmfwRdWcSi
	gmsZshxmTQ+Wio2NCWYaH6zzmXVpm55zJehnHSHpE7aB6VAAEZJsf58scNXy+P09/aL/RfCg57Apm
	+V0wWDGfvddsD61CtRfSNkfCnrZwBFLrCucCIVGcfEj5lgGyy9wlhegSd+rJYq8FJMkdgS8sqd7yX
	966fAjPQ0WJPf44NM9GBNSQzRInavcjG5py74a8Zvoe/JcTmT5Ysh+OzebQZ+/EJ3MZXGuwMnxlw7
	pyZTr/iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEXyh-00000004e73-3Qne;
	Thu, 30 Oct 2025 19:06:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEXye-00000004e6R-0iNN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 19:06:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A4DD40852;
	Thu, 30 Oct 2025 19:06:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B77C4CEFD;
	Thu, 30 Oct 2025 19:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761851185;
	bh=v8FQqTUg+Nt8i5VWhtx46IW0ZcboKKiKlIr0lZaJEXY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QNIzBf2df2ob42+FAYkoqWOQD/8Ooxsw5WCOeMfJ00wfguWLLixv/Bk00HOdROVYL
	 XUEV1G1rPGsHNo94hBYIit4p0J8FpztL4NMNo8X4LXytOeCWV5KVCjkN4YHU4k1nGN
	 7YmLfaDBwdszUJ5mNmhnQyUKZHJlwotnBGawdPE5qvD0K1nz/rjR1wZzTM96WWZIgM
	 V/L8JcolF1ZqvyZ8joehI73SqE+t/YhP0R7ov0dxLFkMbmlMkvflMLpLtxdyQUFgyh
	 eaEJxFqcUuryG51oJA5fhuoDzEGseEjyTxcIWzXn923ZFQYjXziFWOmhBuTMiX52IY
	 BUlu5FKZEL4mA==
Message-ID: <e3abd249-f348-4504-b1d9-4b5cd3df5822@kernel.org>
Date: Thu, 30 Oct 2025 20:06:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net V2 2/2] veth: more robust handing of race to avoid txq
 getting stuck
To: Toshiaki Makita <toshiaki.makita1@gmail.com>
Cc: Eric Dumazet <eric.dumazet@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, ihor.solodrai@linux.dev,
 "Michael S. Tsirkin" <mst@redhat.com>, makita.toshiaki@lab.ntt.co.jp,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-team@cloudflare.com,
 netdev@vger.kernel.org, =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?=
 <toke@toke.dk>
References: <176159549627.5396.15971398227283515867.stgit@firesoul>
 <176159553930.5396.4492315010562655785.stgit@firesoul>
 <aacc9c56-bea9-44eb-90fd-726d41b418dd@gmail.com>
 <27e74aeb-89f5-4547-8ecc-232570e2644c@kernel.org>
 <4aa74767-082c-4407-8677-70508eb53a5d@gmail.com>
Content-Language: en-US
From: Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <4aa74767-082c-4407-8677-70508eb53a5d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_120628_273251_FA7F112D 
X-CRM114-Status: GOOD (  23.52  )
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



On 29/10/2025 16.00, Toshiaki Makita wrote:
> On 2025/10/29 19:33, Jesper Dangaard Brouer wrote:
>> On 28/10/2025 15.56, Toshiaki Makita wrote:
>>> On 2025/10/28 5:05, Jesper Dangaard Brouer wrote:
>>>> (3) Finally, the NAPI completion check in veth_poll() is updated. If 
>>>> NAPI is
>>>> about to complete (napi_complete_done), it now also checks if the 
>>>> peer TXQ
>>>> is stopped. If the ring is empty but the peer TXQ is stopped, NAPI will
>>>> reschedule itself. This prevents a new race where the producer stops 
>>>> the
>>>> queue just as the consumer is finishing its poll, ensuring the 
>>>> wakeup is not missed.
>>> ...
>>>
>>>> @@ -986,7 +979,8 @@ static int veth_poll(struct napi_struct *napi, 
>>>> int budget)
>>>>       if (done < budget && napi_complete_done(napi, done)) {
>>>>           /* Write rx_notify_masked before reading ptr_ring */
>>>>           smp_store_mb(rq->rx_notify_masked, false);
>>>> -        if (unlikely(!__ptr_ring_empty(&rq->xdp_ring))) {
>>>> +        if (unlikely(!__ptr_ring_empty(&rq->xdp_ring) ||
>>>> +                 (peer_txq && netif_tx_queue_stopped(peer_txq)))) {
>>>
>>> Not sure if this is necessary.
>>
>> How sure are you that this isn't necessary?
>>
>>>  From commitlog, your intention seems to be making sure to wake up 
>>> the queue,
>>> but you wake up the queue immediately after this hunk in the same 
>>> function,
>>> so isn't it guaranteed without scheduling another napi?
>>>
>>
>> The above code catches the case, where the ptr_ring is empty and the
>> tx_queue is stopped.  It feels wrong not to reach in this case, but you
>> *might* be right that it isn't strictly necessary, because below code
>> will also call netif_tx_wake_queue() which *should* have a SKB stored
>> that will *indirectly* trigger a restart of the NAPI.
> 
> I'm a bit confused.
> Wrt (3), what you want is waking up the queue, right?
> Or, what you want is actually NAPI reschedule itself?

I want NAPI to reschedule itself, the queue it woken up later close to
the exit of the function.  Maybe it is unnecessary to for NAPI to
reschedule itself here... and that is what you are objecting to?

> My understanding was the former (wake up the queue).
> If it's correct, (3) seems not necessary because you have already woken 
> up the queue in the same function.
> 
> First NAPI
>   veth_poll()
>     // ptr_ring_empty() and queue_stopped()
>    __napi_schedule() ... schedule second NAPI
>    netif_tx_wake_queue() ... wake up the queue if queue_stopped()
> 
> Second NAPI
>   veth_poll()
>    netif_tx_wake_queue() ... this is what you want,
>                              but the queue has been woken up in the 
> first NAPI
>                              What's the point?
> 

So, yes I agree that there is a potential for restarting NAPI one time
too many.  But only *potential* because if NAPI is already/still running
then the producer will not actually start NAPI.

I guess this is a kind of optimization, to avoid the time it takes to
restart NAPI. When we see that TXQ is stopped and ptr_ring is empty,
then we know that a packet will be sitting in the qdisc requeue queue,
and netif_tx_wake_queue() will very soon fill "produce" a packet into
ptr_ring (via calling ndo_start_xmit/veth_xmit).

As this is a fixes patch I can drop this optimization. It seems both
Paolo and you thinks this isn't necessary.

--Jesper

