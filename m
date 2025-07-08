Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D4AC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 20:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJoKGMixdxbuoBQZf38SMFzcAORtomA8uvkcfR18me0=; b=eVNTNHzjHToaiS03TB5WvYUpPF
	v++M3n00+hwpEnZ2Mp32kBY2xFx06Lhw4bqDwPk2A9UaplFUTTiXagQc+MQEtmoazrByV8ygSkmHN
	aP8LTJkywxmsGJB+BFumzCN3bJhn4hiyhjpKti44H7S9X67rVwAd35BoqmVUH1QTxAuiMzWDU5L7q
	WTRzQ5LgRJ5qZgjA34soz3vZQSZr1RVHGZ4b3tUbX/2vNRqBzPniZPW97xI0xRJJz0e7Pn2pNAPLv
	Dmysxa1zC1d43dtJsNiAYVoyahTAbER1RSkxrGffrQyHkOwwtvp3mS8chrWwOhPqzwH2TX2f4CakL
	5XRflWxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZF1f-00000006Woa-3ItT;
	Tue, 08 Jul 2025 20:34:51 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEcg-00000006T3o-2kDn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 20:09:03 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ae0e0271d82so977796866b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 13:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752005341; x=1752610141; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SJoKGMixdxbuoBQZf38SMFzcAORtomA8uvkcfR18me0=;
        b=A/HLL9Gyfhy5mVtCjOXOFq9ez3WpwAV3Bzj5lPtFSYxcSGja5NX4qggaWVK3GCF+5P
         sVdDchXXSRj1DaQSzm7v8l68wgu8mQ8KKsBwl0WtFQqrygs5w/iWKDOk173jstcttKgS
         2Mj+MyZEFDzNcVKpMYQV3W6N8GN1r0PYb7ZUmuShy7hXfnEGu6HHInK+aflpcEbHi/a5
         qlkLAUSPpIpRtJhQLzEqlZdLuxg/meLucRMZqqx3+klW3Gj628d/lXSbh3juNgRzbwJc
         dWe3+fWEkOnT5alHjP3Q+o8nVIa5gB+tAopGHAGjG7TE7p8dITg9wFii+L8PQiEbjnF7
         5mPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752005341; x=1752610141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SJoKGMixdxbuoBQZf38SMFzcAORtomA8uvkcfR18me0=;
        b=MeJZ1ozq78Y3KRRFzkq7HdGNIAwYFfjJSyO/O6PWpiBqXUW7n2uXZwTZfGSJSazO7W
         ywri5pLG/4pLhVzycuuLsOvBS8NyHNZ6AdCodDCzFq/dqUDO1g5sZe7yLoq9GI0iN0no
         7HZStrFcKEH3zWGWFwpWB36iga06I0l3IUbVw9Sahe3V9JyGeLQ9D7LSqo3HEigWmKZw
         IOlNk6J+HGYEfGEhs29lpv/fzCM/4Dk4W+KRgWt2zzoO8QWpQ73pjvSKrlYhEQdXxYUD
         lSzv/j7FelCRePe8JGLkeEHZp6HUg/Ii2TAIfTU6raVJMZYRDLWYueEO4vGXJANBWekG
         SjNw==
X-Forwarded-Encrypted: i=1; AJvYcCWiHFCXoyONKz2uGZq1nArX+ItzTzM2w6X5/MkxKuTLvqyYOZwwwwsM4hwLxQeJLSjh2nJfKg/HfG5CeZRz4MpG@lists.infradead.org
X-Gm-Message-State: AOJu0Yy767B5SjUvl36+dk1mhRsomA0kBupOc1nUfYKrZaZF9OsaffFI
	h73E/gTQ++EnOUMypXowmaKIXtlbbV8zkwtfaw+hQANUL7zXdjLSUsRx
X-Gm-Gg: ASbGncu+jSsRnV3JVfev9eSNjRcxcwzJWxE1AZv/OEeYuKq0n8/ViNH4IU5B/mkDFjG
	HyvEJZqs3DW6LmE7l/WDPa5aP5M+l6JriUNUVgZ+Kk1AOdAe17g0Iu50bMVp5romK+AJnyS7lbz
	pNCWj21X7GxDmAhhV+gTsqXV+QNMxinHT63hA+BKoR4bfpbMtHgRYW54Jp8l9wrygnSnYdHGGwJ
	jOzQATxrbo3Y3ump42LnvmY9jY+mc8u4KXIXITSUGYGCx1Qz3RJWq9c1lCamf4fkNBKQ4KgUnFN
	t541FIrsamJER7yiZ2X2LNH+JhSweCFbdQBkQcqtjvK0b8sa8zruhIwY2oiK7uq7+N4A8qmkwij
	iJett4vKzz31m0f2KAfAXK0hBOwkL3k6X+gd+Scvh5Te/Auleonzsxqw4Ug==
X-Google-Smtp-Source: AGHT+IFMUIFhAFLtzXXbjGIvBhyVU4xR5NCQSkIi81NSZsJ4W1pu9KoFPlGV7XT3Rq6mPNLnbiIOLA==
X-Received: by 2002:a17:907:7e9c:b0:ae0:a483:39bc with SMTP id a640c23a62f3a-ae6c6cdfdabmr52787066b.46.1752005340445;
        Tue, 08 Jul 2025 13:09:00 -0700 (PDT)
Received: from ?IPV6:2a02:2f07:6009:b200:8bc2:7901:5231:7913? ([2a02:2f07:6009:b200:8bc2:7901:5231:7913])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66e7f68sm961243066b.13.2025.07.08.13.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 13:09:00 -0700 (PDT)
Message-ID: <95f4ded3-f649-4bdc-a3ca-cade77aa2e92@gmail.com>
Date: Tue, 8 Jul 2025 23:08:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/10] crypto: sun8i-ce - move bounce_iv and backup_iv
 to request context
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
 linux-crypto@vger.kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
 <20250626095813.83963-4-ovidiu.panait.oss@gmail.com> <aG1lN94feb4OJVsI@Red>
Content-Language: en-US
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
In-Reply-To: <aG1lN94feb4OJVsI@Red>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_130902_695463_C5B51353 
X-CRM114-Status: GOOD (  16.12  )
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



On 7/8/25 9:36 PM, Corentin Labbe wrote:
> Le Thu, Jun 26, 2025 at 12:58:06PM +0300, Ovidiu Panait a écrit :
>> Currently, the iv buffers are allocated once per flow during driver probe.
>> Having a single iv buffer for all requests works with the current setup
>> where requests are processed one by one, but it wouldn't work if multiple
>> requests are chained together and processed in one go.
>>
>> In preparation for introducing request batching, allocate iv buffers per
>> request, rather than per flow.
>>
>> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
>> ---
>>  .../allwinner/sun8i-ce/sun8i-ce-cipher.c       | 18 +++++++++---------
>>  .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c  | 12 ------------
>>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h   |  8 ++++----
>>  3 files changed, 13 insertions(+), 25 deletions(-)
>>

[...]

>> @@ -273,6 +271,8 @@ struct sun8i_cipher_req_ctx {
>>  	int nr_sgd;
>>  	dma_addr_t addr_iv;
>>  	dma_addr_t addr_key;
>> +	u8 bounce_iv[AES_BLOCK_SIZE] ____cacheline_aligned;
>> +	u8 backup_iv[AES_BLOCK_SIZE] ____cacheline_aligned;
>>  	struct skcipher_request fallback_req;   // keep at the end
> 
> Hello
> 
> Are you sure you could do DMA on sun8i_cipher_req_ctx ?
> 

Yes, that is my understanding. Request ctx memory is allocated in
skcipher_request_alloc() by calling kmalloc(), which returns memory that
should be suitable for DMA.

Also, there are multiple drivers doing this already. You can grep for
____cacheline_aligned inside drivers/crypto to see other examples.

Ovidiu

> Regards


