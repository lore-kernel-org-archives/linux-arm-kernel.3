Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC006C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 12:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Djp33DZuJ5kk88PXRco/OjHqQCYStiOV5FS5/ccjyz4=; b=mfLJIMUdmq8p3eAMLQ6joc7yE1
	ELqTPct2uMAwnzdZf7uIFK60EmkqKwJ7V9HrjTfKDM91jnEGFCHq01YcxNuTenzZ/329k2zRdWs/1
	xgofUAheg/6lVCG9T8lLEs9LntpzJjqbQXNeAVTp6rwpFlUU+1JM9xTMzmWkJght/RahhUh8c6+Ni
	UcnThU29wM4797eev76XKidsUKblUp83B1wHWl7AT02eZCn4xFQtA7hYNv3QYyDhMuZ64wV5volOF
	P2L7jQhmpYHmvn9nvBPX/by+pBaYPzqLwZBMMoU/FamClc0ml2HLrmJ/43nJI855fH27QbhB4evZJ
	MtPJCTbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu81P-0000000GBiT-11of;
	Wed, 12 Aug 2026 12:25:27 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu81M-0000000GBhu-1A6V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 12:25:25 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-51c05dcdf49so10833791cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 05:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786537523; x=1787142323; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Djp33DZuJ5kk88PXRco/OjHqQCYStiOV5FS5/ccjyz4=;
        b=V7hQAyCPCejdUsvnM8wtbqE9u49CAOJThi8/twkuhJI1F+IFJVZZvzJ9e2sTKOEHVT
         eCsS/Cvp2SvvnlMJacntrkRGf3+gB/GmpzCQ5lLqNBKkCuMBC5DMQBRUB0At2KJ4Oe3l
         Ocql8EaSdvimfDXraSV4LgKtGMCtAz7waCWN15pcvuS0Ccnq2wNh4ohfVv6Dz36KwwBP
         1hFjwRo5ssn3lCWD4Ms3XhuvvaFzZCsQyMmYB57cRKWJ4uLVtm9oFZwr9bzz4YLNhAum
         47mGc4qKQmewJHL7Bz/+yUCxxcJwH50TEIBxeq4z7WatHa+ocWiZ91v+wP6SgYFKYk4O
         EfCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786537523; x=1787142323;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Djp33DZuJ5kk88PXRco/OjHqQCYStiOV5FS5/ccjyz4=;
        b=AP1WMoLZe6UoU7RBKjMjpiW2AEJClSq3jHFhhZf3dOyUpoh0Q1DYxqKAEhIg9n5cub
         Tp/7ojxApga/DNK25SQEYhn6wrykeqBHr5D56uqEliF4ckRoRU6QwCssdpV7IIqajJyd
         dPOsiNUZLiqkGs3NksNldnBkYGgG6xOeL19akwaoSxQ+GkfOJ7e1AXF4B7DpVr33Qp9+
         hOJ/gyQulLXHyCSQEZALphaxHtpFGkEvmgfomgZltt3MqSqdrYwO7xeDzgXEBU3olFcZ
         Kk0wE4wkRZTzmXrPOycolDKvKtWk9S4nOlYc7yQ1JduD8V+I8gjL3XfZjAKksy+ctvIP
         mZhw==
X-Forwarded-Encrypted: i=1; AHgh+Rolpf2CM6mw2pkNxDc+8nqDgIg24oZuTgWZe6tP1zHMY2xqebMcBvzZi5u4hbj17Ax7WgpxpKyc50pcXVlZ7AKC@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq3a3X63n8gQA6s59XP99zbQ2Ilo6uK7aImnLvRwmi79trpLiw
	OLgIlrh2ZZK0+7SMpnrFYPwa4YiarCaVd4wkZE0Q3n57n8+x6HhHjx+JhqpRzqBoqGk=
X-Gm-Gg: AR+sD12+NV0Pr9V27K7USRF33IiBHqKv0QRYImE9+MM90HVDMr3xPUvzIA+QNLke2QG
	0raDdAeTTZCxhZoNEjexsVAqMloBiSyy6BNpZ7vSNbE+ByVgFm7JppNhOscqgFxXvs03i7bXiRF
	IKuromxZvvIy+HiuP5vHiEkvFGy1obF142MPgRqrTLMtzqubylhr4mwZ9HCzbNTWYevwIkYnY6g
	qUswtQQ3eEB29BlA4ktgBmodm0Mnmj5Rtz7tEG9lSFzQQuv8H7ZhqPKiI+9sXWbP58fGOO0x39v
	lY6MxpcIoSNyCF8l3Z5rgHk0uvyjivZo5P8UVAiqRdK9zFN5G1hn+VjJZGbZ7OV6MQDmvyPnfcC
	Nq4qndRhdvdiPvTlBXX6hjv2pvq7ObV3YDku37ZNhJ0j1Koj+nvc4wcTJXNNQi2/1PDGDpOTgZu
	XL0sVXcIOaeSQ2WlkLKTQT+fJtDPu13xigqu+BMFO8pyofwn4jax8DWGC2Mxlu
X-Received: by 2002:a05:622a:83:b0:517:8d24:64d8 with SMTP id d75a77b69052e-52d646edbedmr31554961cf.13.1786537522952;
        Wed, 12 Aug 2026 05:25:22 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d61dc9245sm16460631cf.25.2026.08.12.05.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 05:25:22 -0700 (PDT)
Message-ID: <72848f5d-768a-4d06-82d1-1168cae8c5b6@riscstar.com>
Date: Wed, 12 Aug 2026 07:25:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: stmmac: use dma_addr_t for DMA addresses
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sashiko <sashiko-bot@kernel.org>
References: <20260811192703.1765416-1-elder@riscstar.com>
 <65494f6d-50fe-4bdb-98d9-7150d9a4fc91@bootlin.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <65494f6d-50fe-4bdb-98d9-7150d9a4fc91@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_052524_585656_03B0DB8D 
X-CRM114-Status: GOOD (  26.87  )
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

On 8/12/26 2:23 AM, Maxime Chevallier wrote:
> Hi Alex,
> 
> On 8/11/26 21:27, Alex Elder wrote:
>> In jumbo_frm() (implemented in both "chain_mode.c" and "ring_mode.c"),
>> an unsigned integer local variable is used to hold the value returned
>> by dma_map_single().  On systems where a dma_addr_t is 64 bits, the
>> subsequent dma_mapping_error() check of the returned value operates
>> only on the low 32 bits (whose high bit won't be sign-extended).  In
>> this case, dma_mapping_error() would return 0 (no error) even if there
>> were one.
>>
>> Fix this in both spots by using a dma_addr_t for the local variable.
> 
> Thanks :)
> 
> I was wondering if it would silently hides another address size related
> issue a little bit lower, as we now have :
> 
>    dma_addr_t des2;
> 
>    des2 = dma_map_single(...);
> 
>    desc->des2 = cpu_to_le32(des2);
> 
> desc->des2 is __le32, so for 64 bit addresses we silently truncate the
> address.

I saw that too.  Everything is unsigned, and only the lower
32 bits will be used, but I'd rather see the dma_addr_t
explicitly converted to u32 before being passed to cpu_to_le32().
This should work regardless of the size of dma_addr_t:

	desc->des2 = cpu_to_le32(lower_32_bits(des2));

I didn't look, but there could be other places where this occurs.
Tell me if you'd like me to send another patch that does this
(here and in any other spots I find.)
> However I don't see how jumbo would work on 64-bits anyways as des3 is the next
> chunk of the jumbo frame...
> 
> I think this is good as-is, so
> 
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thank you.

					-Alex

> Maxime
> 
>>
>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> Link: https://lore.kernel.org/linux-devicetree/20260606010122.21A211F00899@smtp.kernel.org/
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/net/ethernet/stmicro/stmmac/chain_mode.c | 3 ++-
>>   drivers/net/ethernet/stmicro/stmmac/ring_mode.c  | 3 ++-
>>   2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
>> index fc04a23342cfc..ec25193d287bb 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
>> @@ -20,9 +20,10 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
>>   	unsigned int nopaged_len = skb_headlen(skb);
>>   	struct stmmac_priv *priv = tx_q->priv_data;
>>   	unsigned int entry = tx_q->cur_tx;
>> -	unsigned int bmax, buf_len, des2;
>> +	unsigned int bmax, buf_len;
>>   	unsigned int i = 1, len;
>>   	struct dma_desc *desc;
>> +	dma_addr_t des2;
>>   
>>   	desc = tx_q->dma_tx + entry;
>>   
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
>> index 78fc6aa5bbe95..664d8cfb58cdc 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
>> @@ -20,8 +20,9 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
>>   	unsigned int nopaged_len = skb_headlen(skb);
>>   	struct stmmac_priv *priv = tx_q->priv_data;
>>   	unsigned int entry = tx_q->cur_tx;
>> -	unsigned int bmax, len, des2;
>> +	unsigned int bmax, len;
>>   	struct dma_desc *desc;
>> +	dma_addr_t des2;
>>   
>>   	if (priv->extend_desc)
>>   		desc = (struct dma_desc *)(tx_q->dma_etx + entry);
>>
>> base-commit: 31397cf1819210bd63fa3d2c7d8c24f7c8667d99
> 


