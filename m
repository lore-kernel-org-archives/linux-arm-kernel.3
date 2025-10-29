Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027B5CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 10:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2WcE3Y4XkfclPcZV/02bANFD9Yub0YoIQsGcCdAiZwU=; b=TbVCdCU5RpyzXLUhb7XT9faLSH
	3hEoqUZgdZvc5qWBt4qwlUVGiQXvkeepbRR4S1BQBmmB/YviAlWmXUpxVZ29v8cPloBqYsMi9iacD
	o14umMY0Cud+5Os9bItmuT2weE7NkTpkQQSYDYO/0l3oYzEwgBNIagYNbDvbP/vetO2sNpWhvzQeK
	IPAnTqvrWmdzUve0v7tqcA75u16EyUM/U9ktrCoImAVF1ucjmmv/Yj4ehljShQkZr2l4EFf60T1zt
	bWV2R8YknVWf3XLhPVehiUzGvFm65101jjbOBY1fyZEjuS0lXmv6p1cx6jRRzGwrwY5p4l5sa1N4X
	IlSogA2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3Uh-00000000nFZ-2Doj;
	Wed, 29 Oct 2025 10:33:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3Uf-00000000nDp-0IPP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 10:33:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 562FD41E4B;
	Wed, 29 Oct 2025 10:33:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C7FDC4CEF7;
	Wed, 29 Oct 2025 10:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761734008;
	bh=jW3t4Dky05lPY8vwEMeUV64HgYZv3cbkpNkYWRVtEJE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lYsynUJxVZiUiCsmJM0jypLVG7AcY0ZwK0hhpZtHLY6Gb1fUIUoP24nwcWYogF0rs
	 KotIuWsLPWMrJuCRUnf/UHrSc6uHEHm1jaOrWH3j38g7KeogP0z1LexU8fo4uqXQ37
	 qRJOTW0tRn5kpA0fclgSw3dolaQMxr9fPJR9kKBXDUrQ5AW9BfykY2Mky+tVwWLfpe
	 MseGeTQuouCXLWoRc5ZBeXf6ltgs5io7YwrEocfyMEX+pOjnCCy0EAQANYLGBsk47T
	 BkVKgzR9DB8sJfzHKO822WiHkLJPoRCZLm9f78e9vfGtWmOYu2F3OZwWkmOli3aS5m
	 e7AYebJxPTesA==
Message-ID: <27e74aeb-89f5-4547-8ecc-232570e2644c@kernel.org>
Date: Wed, 29 Oct 2025 11:33:23 +0100
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
Content-Language: en-US
From: Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <aacc9c56-bea9-44eb-90fd-726d41b418dd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_033329_147121_906628E8 
X-CRM114-Status: GOOD (  23.25  )
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




On 28/10/2025 15.56, Toshiaki Makita wrote:
> On 2025/10/28 5:05, Jesper Dangaard Brouer wrote:
> 
>> (1) In veth_xmit(), the racy conditional wake-up logic and its memory 
>> barrier
>> are removed. Instead, after stopping the queue, we unconditionally call
>> __veth_xdp_flush(rq). This guarantees that the NAPI consumer is 
>> scheduled,
>> making it solely responsible for re-waking the TXQ.
> 
> Maybe another option is to use !ptr_ring_full() instead of 
> ptr_ring_empty()?

Nope, that will not work.
I think MST will agree.

> I'm not sure which is better. Anyway I'm ok with your approach.
> 
> ...
> 
>> (3) Finally, the NAPI completion check in veth_poll() is updated. If NAPI is
>> about to complete (napi_complete_done), it now also checks if the peer TXQ
>> is stopped. If the ring is empty but the peer TXQ is stopped, NAPI will
>> reschedule itself. This prevents a new race where the producer stops the
>> queue just as the consumer is finishing its poll, ensuring the wakeup 
>> is not missed.
> ...
> 
>> @@ -986,7 +979,8 @@ static int veth_poll(struct napi_struct *napi, int 
>> budget)
>>       if (done < budget && napi_complete_done(napi, done)) {
>>           /* Write rx_notify_masked before reading ptr_ring */
>>           smp_store_mb(rq->rx_notify_masked, false);
>> -        if (unlikely(!__ptr_ring_empty(&rq->xdp_ring))) {
>> +        if (unlikely(!__ptr_ring_empty(&rq->xdp_ring) ||
>> +                 (peer_txq && netif_tx_queue_stopped(peer_txq)))) {
> 
> Not sure if this is necessary.

How sure are you that this isn't necessary?

>  From commitlog, your intention seems to be making sure to wake up the 
> queue,
> but you wake up the queue immediately after this hunk in the same function,
> so isn't it guaranteed without scheduling another napi?
> 

The above code catches the case, where the ptr_ring is empty and the
tx_queue is stopped.  It feels wrong not to reach in this case, but you
*might* be right that it isn't strictly necessary, because below code
will also call netif_tx_wake_queue() which *should* have a SKB stored
that will *indirectly* trigger a restart of the NAPI.

I will stare some more at the code to see if I can convince myself that
we don't have to catch this case.

Please, also provide "How sure are you that this isn't necessary?"


>>               if (napi_schedule_prep(&rq->xdp_napi)) {
>>                   WRITE_ONCE(rq->rx_notify_masked, true);
>>                   __napi_schedule(&rq->xdp_napi);
>> @@ -998,6 +992,13 @@ static int veth_poll(struct napi_struct *napi, 
>> int budget)
>>           veth_xdp_flush(rq, &bq);
>>       xdp_clear_return_frame_no_direct();
>> +    /* Release backpressure per NAPI poll */
>> +    smp_rmb(); /* Paired with netif_tx_stop_queue set_bit */
>> +    if (peer_txq && netif_tx_queue_stopped(peer_txq)) {
>> +        txq_trans_cond_update(peer_txq);
>> +        netif_tx_wake_queue(peer_txq);
>> +    }
>> +
>>       return done;
>>   }
> 
> -- 
> Toshiaki Makita


