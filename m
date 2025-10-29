Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C984CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 15:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bT40LJu6oxRypwozP+xYaDg978cHnaPf0JK9Yp1+9Sw=; b=TXDfb/DaCX1YZLCmx9bGMWUuy/
	boGVuk2bmekff6W6SlJqs8K6+oIaB2/QLWp2TfN6zYu5LtBlkFaUnqYPbHTAvW1HV40+TreDGimO9
	d/RqZCjJrDEbP3YWsdRMcxr3bFMtDrIiJy0NAGetjG/bvFESEsfRhAImr0FasUBZvQ+3Jldys+V5O
	DQlqlGo8KvkMTHZzs/t1V+D88Hb/kY4OzJSC1wHsgXTpSCXJxbnPMNE9VsKF4Hw0GNtQJNwGrHfYz
	phKfHh84yTuhFoRVtnhy7qSgrFzcxzS2rWrdsi9Ju3p5pZm2dDpQ6eg8FrO0PdcCqbNjbFbBRDVYB
	/gp46lOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7fF-00000001hwX-0bSD;
	Wed, 29 Oct 2025 15:00:41 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7fC-00000001hvz-3mFO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 15:00:40 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-340299e56fbso7260a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 08:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761750037; x=1762354837; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bT40LJu6oxRypwozP+xYaDg978cHnaPf0JK9Yp1+9Sw=;
        b=OGwYQpY8bgrSmboYljv0qQqOu69hgg7SsTEyQBR2hnMX3RcUPnKvk8rRHx4VjCBC9k
         Xmsz++H6X7ezTskGHxyAVCdjJS/QgTpg6v1E7vZYTyovMcyV656LI/0PPleyCGmlJuEp
         g9ZpTbNwzz5jTXjDlabje+5hWcgrPlAMKDcPo0Rk0J1L9K1rNHg/yB1O9D8ERRrpoqE7
         VQJ5UMwNcPu7EigXssmCoxVSm5qlm+OuX6acAEDlEQ3h2HV7E1DgWIT1YaeRfNIaSE8c
         YIkIhif3+behcSHaNffxzcFN+IBdUuOj8L1z9HgygvoKB1lHI5febLSWgKRPg3zDKPXW
         u6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761750037; x=1762354837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bT40LJu6oxRypwozP+xYaDg978cHnaPf0JK9Yp1+9Sw=;
        b=nvHSej+v6GLKYPK31CNMeZ3UakoXHV/OWfD2kP78eNdfX2OQ5p/rflP3Y2uvgJ+qjy
         Qr4eT8iHEjLdF8VAPfoKMIvna9IEenMfA3xdVaUxn2K3YPFvyVB+VHTJcN2S4e4gGeQC
         xHjNJGpeTlTfoILBZSHSaTbvmzmS6l9th03HDl1JKxCs9dYoPC4G5fH81qliX5kTYVL7
         /ZLp0bQGQK2oZbDu21v2qrvu1Ol5cIoPaTgegMCZO12qZKMVXIMqUIytl2DM792eS1cc
         c15OjHBZvl34LlcoEM+Q6/5reB83BfbNDdVQKG7bfnbw/M8Wqb3gU8YSMjcn7MlkYDdk
         /Gow==
X-Forwarded-Encrypted: i=1; AJvYcCWuKaEXmNaX/qoqJaO4pMHgKy6OWZGtCsfS6ZDYQ4CQYsGbBa/zttU4XofisNILqCx5cfN1Q2rGOuzFYhJMqRAA@lists.infradead.org
X-Gm-Message-State: AOJu0YxRcZ0eM1BujgXKRYevK+7ZPnPng72nOqh1nJTAGXYo1kMsePJ8
	G4CHyT84ouBL31NFPz3F80E5b1HBfL87bU2W4Hes93hvurb1i+qOcs+w
X-Gm-Gg: ASbGncvCznAGf64aBGCUK0ZpC1b24ioApsD2l+nxftAfCHZkrfnZtB4Iei5cFht8yvc
	PatKmaIuBVVOsBPbXOKKnpXvuGNZSA1R+f747AbDNnXcyoL50GuM7RxrW8OgixtH8wUrUcxAQ1L
	WCBmpehZLs7yd4a+MiIUyMYx0hxznAvUPkmbw+0UbhijzoJwhZEZKMc8HHGJR+pK0qpGUIa1VDG
	FDQzejurZOs+cPsGZzgzM31ZPDtFzkClnzwopRWOamOV3IT9RSuWRu22nLuVQH2JKYZMVuJR2gq
	lzfSkZsPGMEGm9aALe39hBp68EhoYpeHv9DMti495P1kJHDVP/21r1wClQ5Oq0NVAHto5TVM2uh
	If+R3STR2LkKZvTW1s05/fSBORFfuOkK9Krra2FVq9ph6G6dNZz7EdWqAoSBFjpV3MfTCgUJMTz
	Xy3EEnJj2g9CT9IwMZOHuscb/Vn/CeGlPXUdow8afFbdiDkGze1ifhuMIVXtAgADGJ0GYZoPQOJ
	rw=
X-Google-Smtp-Source: AGHT+IHTkNofjDYYCSUvcwrFzhudLkajYIpTI8Ehsx/uXD1wcmUENfXD8vGHxIX5mKjdzFiMwoBquQ==
X-Received: by 2002:a17:90b:3d0b:b0:335:2b15:7f46 with SMTP id 98e67ed59e1d1-3403a2a68dcmr3998093a91.21.1761750036781;
        Wed, 29 Oct 2025 08:00:36 -0700 (PDT)
Received: from [192.168.99.24] (i223-218-244-253.s42.a013.ap.plala.or.jp. [223.218.244.253])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3402a5540absm3353475a91.5.2025.10.29.08.00.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 08:00:36 -0700 (PDT)
Message-ID: <4aa74767-082c-4407-8677-70508eb53a5d@gmail.com>
Date: Thu, 30 Oct 2025 00:00:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net V2 2/2] veth: more robust handing of race to avoid txq
 getting stuck
To: Jesper Dangaard Brouer <hawk@kernel.org>
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
Content-Language: en-US
From: Toshiaki Makita <toshiaki.makita1@gmail.com>
In-Reply-To: <27e74aeb-89f5-4547-8ecc-232570e2644c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_080038_964516_1C3F10BC 
X-CRM114-Status: GOOD (  23.13  )
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

On 2025/10/29 19:33, Jesper Dangaard Brouer wrote:
> On 28/10/2025 15.56, Toshiaki Makita wrote:
>> On 2025/10/28 5:05, Jesper Dangaard Brouer wrote:
>>> (3) Finally, the NAPI completion check in veth_poll() is updated. If NAPI is
>>> about to complete (napi_complete_done), it now also checks if the peer TXQ
>>> is stopped. If the ring is empty but the peer TXQ is stopped, NAPI will
>>> reschedule itself. This prevents a new race where the producer stops the
>>> queue just as the consumer is finishing its poll, ensuring the wakeup is not missed.
>> ...
>>
>>> @@ -986,7 +979,8 @@ static int veth_poll(struct napi_struct *napi, int budget)
>>>       if (done < budget && napi_complete_done(napi, done)) {
>>>           /* Write rx_notify_masked before reading ptr_ring */
>>>           smp_store_mb(rq->rx_notify_masked, false);
>>> -        if (unlikely(!__ptr_ring_empty(&rq->xdp_ring))) {
>>> +        if (unlikely(!__ptr_ring_empty(&rq->xdp_ring) ||
>>> +                 (peer_txq && netif_tx_queue_stopped(peer_txq)))) {
>>
>> Not sure if this is necessary.
> 
> How sure are you that this isn't necessary?
> 
>>  From commitlog, your intention seems to be making sure to wake up the queue,
>> but you wake up the queue immediately after this hunk in the same function,
>> so isn't it guaranteed without scheduling another napi?
>>
> 
> The above code catches the case, where the ptr_ring is empty and the
> tx_queue is stopped.  It feels wrong not to reach in this case, but you
> *might* be right that it isn't strictly necessary, because below code
> will also call netif_tx_wake_queue() which *should* have a SKB stored
> that will *indirectly* trigger a restart of the NAPI.

I'm a bit confused.
Wrt (3), what you want is waking up the queue, right?
Or, what you want is actually NAPI reschedule itself?

My understanding was the former (wake up the queue).
If it's correct, (3) seems not necessary because you have already woken up the queue 
in the same function.

First NAPI
  veth_poll()
    // ptr_ring_empty() and queue_stopped()
   __napi_schedule() ... schedule second NAPI
   netif_tx_wake_queue() ... wake up the queue if queue_stopped()

Second NAPI
  veth_poll()
   netif_tx_wake_queue() ... this is what you want,
                             but the queue has been woken up in the first NAPI
                             What's the point?

> I will stare some more at the code to see if I can convince myself that
> we don't have to catch this case.
> 
> Please, also provide "How sure are you that this isn't necessary?"

I could not find the case we need (3) as I explained above.

--
Toshiaki Makita

