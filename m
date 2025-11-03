Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EDACCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 08:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9IlYd8PBv158GdcOw6rn4rqU0pymAVgCcTAXsADiI14=; b=jV5OtkO7FPZ+AlbDuGOWQXgTva
	oesGkc/iI1P1IIBeDqKYNNJPQvIGOHfuO0P/Pn5fF2DDPtu3cWqNWtiIN/ZpIbxgQ7Izp4Y2Htr5I
	PRe3eq2d1n0Wi2MkDAQL8Gl74XwKwHbcYk7iw/hvafBYExiAe6PiMohsFPBTMqLL6Oqzv5DDKYOwK
	mk7OwDIuVbhrGUaCKqX85anI0G/e87A9ggAbS72Q1QRoAlZ3VeXqiz29cX4qyfleBycpbQTyyGwCc
	oC7TNGdLZpe2QOT0ETpSey87lP+F5ngjLOypfFZNhCrbufwQGgqoYYsUqN1C/fptRtSiad0BCoXJo
	/zWiMFDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFq8I-00000009Rzp-38K9;
	Mon, 03 Nov 2025 08:41:46 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFq8G-00000009Rz2-2OPW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 08:41:45 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-794e300e20dso4094251b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 00:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762159303; x=1762764103; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9IlYd8PBv158GdcOw6rn4rqU0pymAVgCcTAXsADiI14=;
        b=EyVAmG4JFHxNGZvTpF2uv4KAofWHLfgVmyf0IZFoaCGF2adCeFG41mb2Dv6PCtkJve
         NQyL6YKtVpupCmfyqXJ5gdW42mGJmOAt+twN+rp1lhtKCE82jC/X9MM1nMN/Swo8prJF
         3BkYNXzhy1D5vCXe+IoH6b7PAtlbwpXLBrs3BQEmWYpaxLICFF3dVvTawYbRlU7T4nvp
         AP1ylwrmgDEK8mtAmhGfU2rA1FP107Jqx47TBY2QXeYbbqAO5UJC8NrG6ZtbgeEq7Ivf
         BLikeDCjUWfB+YHgsw72NCdwFR7XG16bViLLw8MAtwm7idNWFJsvvR9kARncsd4rhbCb
         4qig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762159303; x=1762764103;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9IlYd8PBv158GdcOw6rn4rqU0pymAVgCcTAXsADiI14=;
        b=okuxr+tvVhJDMfsgP/Tx2zZb0+/wWk58W3vNHRP3J5C2KmnSr6RD4pVhnGzuxu0Aeq
         ODmYMMw3cElnxtJ/bcmJKmWWXGQIs8CzGGMkCiLchbR3D8KRnrHbz0/vqcaGdYaMADZT
         ngBs6o6NcOzAYszdrSoF3ojZlX9AdooEQOkHj+aOBRNzKQz6pv5IlxXZJip27QNQOLgT
         Aeu/rpxZsEZ7vb+i/aEAi/z4MAUdUMhex51StcyDnO4O6H3GwgFeluO/EyHJVLWUkjP7
         7gRs28L5Y1xQmZPT31ufuUT5aZrlT68jaLQDXjCHkKWuP4blsVfBlUdyir8oL4q0YaHS
         AIdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnyOD/bIlVyXXRRBWJPS+57iWfebnf6s8Y9bn4SHEHOklnbD6yMH2CjK0ZwrVmWQrB63Huv3QrxLL784+BGA2X@lists.infradead.org
X-Gm-Message-State: AOJu0YyNnYff406SzXWaE19nldUQQpUqvz9TKPWG10KluCyOJoNIi7Ge
	N7Lb9ySB7E8jInYZOe4Q/Sx995EehQD7K8nG8dfYxdQYumH86I43UhmR
X-Gm-Gg: ASbGncvNOocjmSOKy15iumumbocindpc0T1DlDywcgUKHGXK2+bE7R63/qfxBr8hBn5
	eMZpOonKaQHpSz4BHXUkeBjQ2mz81FfBfVESuc2wMzRdyin8Ira8MPl7kxJL6rBOZELlJqhjnBB
	1sHOSDRdsvBb/84154Z4uBrJaMBADNQ4qtHtqVonMHfYMecLri8UDVE9kt5XjUVDZfYiJSgLvUO
	vk8kReVQKJg7PX2uwB1wT6z4kcyACW5vpbsEoMGe/1DUlKiSWvQE4RdhuVLBDRRN3FH2tdNEzuM
	MiAUkFukU5YjqgNxHXV0CKkPU4AsgaFNSAPXfTjCYsxGyUe4xMKu8mzDEEmhnFkG7NU7+2Ginvz
	Z3t4I2A6vSOC9WNbirYFJf+FLC1KlnfzqDTZ/7kaCybkYLIlIiEzaMkLOEhSkEqyFegrYmaN2R7
	rvrFVyWrGSViBBTZ/QwrZQf279bzPwdHbxDWREbw1atOwORMypRlZ6YGeQkyx9xuu5tAxiQMlKw
	6DrcJf7p/Y=
X-Google-Smtp-Source: AGHT+IHVqhieNuVGLPgUB+hpjN6Vf9ZUu7T1hKfxCCQidwT8I97GOgul3IVD0bS7e1uzQqBSFCZNtw==
X-Received: by 2002:a17:902:d4ce:b0:295:6b98:6d65 with SMTP id d9443c01a7336-2956b986f84mr76085715ad.22.1762159303320;
        Mon, 03 Nov 2025 00:41:43 -0800 (PST)
Received: from [192.168.99.24] (i218-47-167-230.s42.a013.ap.plala.or.jp. [218.47.167.230])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2952689f15csm110200325ad.29.2025.11.03.00.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 00:41:42 -0800 (PST)
Message-ID: <8b70ba1d-323b-4e76-be7f-9df45b8f53d5@gmail.com>
Date: Mon, 3 Nov 2025 17:41:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Toshiaki Makita <toshiaki.makita1@gmail.com>
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
 <4aa74767-082c-4407-8677-70508eb53a5d@gmail.com>
 <e3abd249-f348-4504-b1d9-4b5cd3df5822@kernel.org>
Content-Language: en-US
In-Reply-To: <e3abd249-f348-4504-b1d9-4b5cd3df5822@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_004144_614113_D3B77B8A 
X-CRM114-Status: GOOD (  25.84  )
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

On 2025/10/31 4:06, Jesper Dangaard Brouer wrote:
> On 29/10/2025 16.00, Toshiaki Makita wrote:
>> On 2025/10/29 19:33, Jesper Dangaard Brouer wrote:
>>> On 28/10/2025 15.56, Toshiaki Makita wrote:
>>>> On 2025/10/28 5:05, Jesper Dangaard Brouer wrote:
>>>>> (3) Finally, the NAPI completion check in veth_poll() is updated. If NAPI is
>>>>> about to complete (napi_complete_done), it now also checks if the peer TXQ
>>>>> is stopped. If the ring is empty but the peer TXQ is stopped, NAPI will
>>>>> reschedule itself. This prevents a new race where the producer stops the
>>>>> queue just as the consumer is finishing its poll, ensuring the wakeup is not 
>>>>> missed.
>>>> ...
>>>>
>>>>> @@ -986,7 +979,8 @@ static int veth_poll(struct napi_struct *napi, int budget)
>>>>>       if (done < budget && napi_complete_done(napi, done)) {
>>>>>           /* Write rx_notify_masked before reading ptr_ring */
>>>>>           smp_store_mb(rq->rx_notify_masked, false);
>>>>> -        if (unlikely(!__ptr_ring_empty(&rq->xdp_ring))) {
>>>>> +        if (unlikely(!__ptr_ring_empty(&rq->xdp_ring) ||
>>>>> +                 (peer_txq && netif_tx_queue_stopped(peer_txq)))) {
>>>>
>>>> Not sure if this is necessary.
>>>
>>> How sure are you that this isn't necessary?
>>>
>>>>  From commitlog, your intention seems to be making sure to wake up the queue,
>>>> but you wake up the queue immediately after this hunk in the same function,
>>>> so isn't it guaranteed without scheduling another napi?
>>>>
>>>
>>> The above code catches the case, where the ptr_ring is empty and the
>>> tx_queue is stopped.  It feels wrong not to reach in this case, but you
>>> *might* be right that it isn't strictly necessary, because below code
>>> will also call netif_tx_wake_queue() which *should* have a SKB stored
>>> that will *indirectly* trigger a restart of the NAPI.
>>
>> I'm a bit confused.
>> Wrt (3), what you want is waking up the queue, right?
>> Or, what you want is actually NAPI reschedule itself?
> 
> I want NAPI to reschedule itself, the queue it woken up later close to
> the exit of the function.  Maybe it is unnecessary to for NAPI to
> reschedule itself here... and that is what you are objecting to?
> 
>> My understanding was the former (wake up the queue).
>> If it's correct, (3) seems not necessary because you have already woken up the 
>> queue in the same function.
>>
>> First NAPI
>>   veth_poll()
>>     // ptr_ring_empty() and queue_stopped()
>>    __napi_schedule() ... schedule second NAPI
>>    netif_tx_wake_queue() ... wake up the queue if queue_stopped()
>>
>> Second NAPI
>>   veth_poll()
>>    netif_tx_wake_queue() ... this is what you want,
>>                              but the queue has been woken up in the first NAPI
>>                              What's the point?
>>
> 
> So, yes I agree that there is a potential for restarting NAPI one time
> too many.  But only *potential* because if NAPI is already/still running
> then the producer will not actually start NAPI.
> 
> I guess this is a kind of optimization, to avoid the time it takes to
> restart NAPI. When we see that TXQ is stopped and ptr_ring is empty,
> then we know that a packet will be sitting in the qdisc requeue queue,
> and netif_tx_wake_queue() will very soon fill "produce" a packet into
> ptr_ring (via calling ndo_start_xmit/veth_xmit).

In some cases it may be an optimization but not in every case because it can 
prematurely start NAPI before tx side fills packets?

> As this is a fixes patch I can drop this optimization. It seems both
> Paolo and you thinks this isn't necessary.

I think it's better to drop (3) as a fix.

Toshiaki Makita


