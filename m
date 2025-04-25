Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113E0C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 15:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7b2k/0/MRDFBkYnkScGuwVZ9DXdXvkWRFpO84oyIems=; b=dU5GITwk2Mt2BJ8tRMmAHOhMib
	xmRQBqQFOxpxDoguMpDAxsUx40vzgQjcjjCRzxzMFb17NGG/w5lmz5WSKl8ehB/m27uwOWX/DQqKi
	QH82WGUVWdIMNLHIRanwhJOEZAmmiESc6quXyGHt51UIHsy7fjscHh/ZVf2GmbRXZPAVKmxTyVO9L
	e7FiCnKUUp0skCLEGBJiAuIXvCvHMtglG9l09iAWXa91iv3nDZPpjCkkjvhcZIksfa4zhG+fNVxgr
	VjnphZW5bEd9qpoGcthZANPdJFVZ0yj8+pN8XooH9bBadIKU3k2gOfXxsjm1yHNPuD519sZelq0Ih
	Fn9ZrYuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8L5A-0000000040s-2il7;
	Fri, 25 Apr 2025 15:35:16 +0000
Received: from mail-ed1-f49.google.com ([209.85.208.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8JP1-0000000HLB3-0TEH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 13:47:40 +0000
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so2925890a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 06:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745588857; x=1746193657; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7b2k/0/MRDFBkYnkScGuwVZ9DXdXvkWRFpO84oyIems=;
        b=IjIf7BtKOPwrGSCzinomsWUJbKINW+CYIM0gyMlQyT5+4wc+cwkBJN0yZHuWq5+6Yp
         1jMU3pAI29dP9Ace3hZVGNkZDIo8Hdjs+v29IOuiFtPe3yjt9dA5f3wJYqEXnK4NOVk5
         zAPxEiuyQGDQhJH/8ZmvP6LRbDKfkaHtjhYlQZIcgPCxxARKYMvqI1zo/esw5UVJMl5N
         WKR/om552+3j1OOyQiZRuSfOydo90IX4SF6kPe0gPQbkYqO5aoVY4ndwtZ2CmCQYVkeI
         u2P8dC0Zk/4wUOWkKKh23jLJ+M2stMMfQavOoJLPAbx10X9cxkcTkWvzVbBisgALJEFK
         f2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745588857; x=1746193657;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7b2k/0/MRDFBkYnkScGuwVZ9DXdXvkWRFpO84oyIems=;
        b=vdO4QHvgKn3ba2NddpBHw3F3npe736qeh8NhTFmHmsH9/MpH8HFqU4dL/4biF/zjlK
         vYj1JG5U78ISUPfte0v+OYesgYGjsGvYKaG0dpbXhEydNVJUciaQmB+xSXwO5E/1x68Y
         mvk/TmBNaj/QLAMdyoGrqtmazDRxOI1IO1GhLSHio7rQu5LO9EIlANQm/JqQRbltIyz6
         9Nh4GtYjNInfbVI28wiQwY9Gp19cMjmBPhq2BM7YkHhsNZv9EOth9hWr2V1Ka5/M7ywt
         paT3yL8TY1USfAzGT98eB6UfvALdY0b/457niKCB/eFADfWvrsnv4ENnsD49TslEvV2S
         KoIw==
X-Forwarded-Encrypted: i=1; AJvYcCU2mrG0Ttgtti3dp7Rt206h3c1MZWzxwd0eQHKPw3ffT5ygA+U9rWN1LtGFUwiLTY+C5Wc6028n2fGBdUdNpqIx@lists.infradead.org
X-Gm-Message-State: AOJu0YxE6GY8VeGTX+4OO6S96Ym7NQDvW9a2w1gFbLJ5o5UNMpB+Dvte
	qRBbbm9PMjwTIYLpjH7jjV96jI92gX9xk9W3j96gR8I0vRqucp0aUE4Spg==
X-Gm-Gg: ASbGncu3Sobrpx/b3CEn+RKT2y3LzyXk07ZTw7VD249T2XeLHnyRiIvwcCM15cRNXtD
	dEs3C+QrrlomuKpva+xAzyIWbSQIsnaB+FUzisq9LtqEosd5WgiVBe0TVJlP3tQF+Ub4OKFGFA3
	fPeYfXzgh5sxT9LMWVwF+a3VnU3E7FhJZfhroN5plSyp29P2ooXZxOlGoXTaKD9MqIMFGDGAeNO
	TEY+BU55kezUvUNOHto+8jN2lyiZ3qcdA2rxSuqlOVdSzFBpwg1QKFLVlrUeA6xvJpsjIBOro/I
	BEo0WAw3fcJz0PiMUuOh0Lz+d29UuSDb78bpVMXE3b/eVA9s2QIG5rL9+TsBz0cDLUOjKTsxK5y
	zNHCC6+KPRpHcA1ZYQp9wFelLk3issP4B3NBK
X-Google-Smtp-Source: AGHT+IE3+U9lKdyIw2HglYpHlU5Ju6Jvd02RlixVwiVpib47lTMUqn1jZXSuE/LNf8JT5D2FHFI2jQ==
X-Received: by 2002:a17:907:3f0b:b0:ac3:3e40:e182 with SMTP id a640c23a62f3a-ace7109ff27mr235634766b.19.1745588856499;
        Fri, 25 Apr 2025 06:47:36 -0700 (PDT)
Received: from ?IPV6:2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6? ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41cb2asm143227566b.10.2025.04.25.06.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 06:47:36 -0700 (PDT)
Message-ID: <7653bf7c-03ac-4f94-a80c-2bfa3004d287@gmail.com>
Date: Fri, 25 Apr 2025 16:47:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] crypto: sun8i-ce-cipher - use IS_ENABLED() checks for
 debugfs stats
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
 linux-crypto@vger.kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250425124517.2225963-1-ovidiu.panait.oss@gmail.com>
 <20250425124517.2225963-3-ovidiu.panait.oss@gmail.com> <aAuOdDhpnLE5bM_y@Red>
Content-Language: en-US
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
In-Reply-To: <aAuOdDhpnLE5bM_y@Red>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_064739_149215_CEACD912 
X-CRM114-Status: GOOD (  15.72  )
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

Hi,

On 4/25/25 4:30 PM, Corentin Labbe wrote:
> Le Fri, Apr 25, 2025 at 03:45:16PM +0300, Ovidiu Panait a écrit :
>> Add IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG) checks before the
>> fallback counter updates to make sure the code is not included when
>> debugfs statistics support is not enabled.
>>
>> Also, drop the existing ifdef guards, since 'struct sun8i_ce_alg_template'
>> is always defined, even with CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG disabled.
>>
>> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
>> ---
>>  .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 46 ++++++++++++-------
>>  1 file changed, 30 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
>> index f03a8fa7bfa2..433cd18f0b5b 100644
>> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
>> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
>> @@ -34,22 +34,30 @@ static int sun8i_ce_cipher_need_fallback(struct skcipher_request *areq)
>>  
...
>> @@ -101,9 +117,7 @@ static int sun8i_ce_cipher_fallback(struct skcipher_request *areq)
>>  		algt = container_of(alg, struct sun8i_ce_alg_template,
>>  				    alg.skcipher.base);
>>  
>> -#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
>>  		algt->stat_fb++;
>> -#endif
> 
> Hello
> 
> You put IS_ENABLED everywhere, but here you remove it, why ?
> I think you forgot it.
> 

This is already part of an IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)
block, so no need to add an extra IS_ENABLED() check here. Just the
ifdef was dropped, as it was not really necessary.

Original code:

	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)) {
		struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
		struct sun8i_ce_alg_template *algt __maybe_unused;

		algt = container_of(alg, struct sun8i_ce_alg_template,
				    alg.skcipher.base);

#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
		algt->stat_fb++;
#endif
	}

Thanks,
Ovidiu


> Thanks
> Regards
> 


