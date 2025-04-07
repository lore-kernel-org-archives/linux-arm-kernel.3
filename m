Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE17C3601A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 06:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7vcZaHtT0Bdp7jhNpBVwgeNyTw0QbyKnO+4kb1PkgZw=; b=FPToc9qm05M57DiDCaB7MYhb/b
	OhqQthJgYCgZfJUroEYWlipXtfIiQB7FC2hIDWC5r/xuvSk5wSASGlKidHVkTrLHnDOJt8kJRWmnf
	7epDkMQz4Vn0ucbu8g1QG1t8V/eCgZTlMg8qaPGVhU7c8rY4grqiXLHkH1hyCKOrXJpVnLAdI3zK6
	mBJaYNzGdwry8FNih/WaKhcKLgaj6FIapJpnkrlNn4DVsju0OsYv0DRnmCViUaigr3b/4b6PcQkGS
	Iv7vlaQ9JslMdLqjX4KWQQBGHnnwS7I+hcleDVuFbTSTrgOVZFCeZVaoiObsdzAtVFwS2VK9yn+1j
	I8Aofw0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1fy1-0000000GZW5-2jEl;
	Mon, 07 Apr 2025 06:28:21 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1fw4-0000000GZ23-2ML2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 06:26:21 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so34585975e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 23:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744007179; x=1744611979; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7vcZaHtT0Bdp7jhNpBVwgeNyTw0QbyKnO+4kb1PkgZw=;
        b=eFN2Vcn0cmiprpfH068jKkV5wlQ70X++8kfV9VDKPUJNQfA4FK8G1v96c5wcZk9yML
         io970ab4S0xWPmbmeq21R5IXSo81yBMDAG1BSHyP5UEBJwjo5GqgNhYtgpKvqzyA+4fP
         wGhM3fXmlDDytqZRIW4M/gsoBiFkum85ky+7aUmhGZss/KvtbGCk8zpZg0S+J2CCE3kx
         WC57pfNDhbS+EwjQVCrI2xLtehu23R/J9L+RbZcT0fpL41yrj8dyWeBXCIh00eosO3fq
         v1i5qA7HyWo4eoGsAVoVD5sU8p/rTyuiE4YS7YhijEezX+Y2VZuCWsPnXcn+30W3wb2e
         GURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744007179; x=1744611979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7vcZaHtT0Bdp7jhNpBVwgeNyTw0QbyKnO+4kb1PkgZw=;
        b=EHv1C7ZHy4Z0tJTnJMjt90wI9D5144f+q60ZtZwM7kFpM8fts5GEnNhJYlCiW2OMIN
         1kk/ULimZvYcCORF0VqSd2VxqEDxVmwy89AlRj9hXSu7mNa8Bbf9DC6RyrENgJQq0TDq
         qpdA9oA317N6uTWfO5YxNabxJ//14rSOWoGo3Vn+DbKNOR8Zc0GSO7vv/TWgiBNh6Vin
         8sfSs+WXytl79EqUtoyXekupS9Kp43+ozQAaN+yPhmYPpebWM3QEl2jm3tFq5uIDqXlQ
         nsESDPgK0gVKoZRphYJTDMOgBPhyXNMdrkmX8iYvtprIpiJ7BQt7cZPJ3xO1q+2Tlrnx
         rkKA==
X-Forwarded-Encrypted: i=1; AJvYcCUParZorZia1c82RCcZ8h2aqRb8XRuJ8IKKkljbdWx3IXqRRVFfICSufKcobq9DHzoPaZT25Wfw+xUyzyreaqmc@lists.infradead.org
X-Gm-Message-State: AOJu0YyLyWbv1IyPChVX2RgPThHZDsfCetjY4/eD9n5cU1JQn+3F+SHR
	1htuQ2U5zpykSosxYC/A04l0ij/YEy0PhRpfBGPmIXA0H08b764g
X-Gm-Gg: ASbGncs45fLnlpPGXtwtGJPw34QdIEoYU80QgtTGI3j7He8UgKZnCXCowoZUMWcvpxo
	nix1WnUw0osCG3f7qOGJcRlA3yjVYa+G6CZDYq7QjELjBxHtZznfwl5YzkFbWMS1D5ouKvzgHxo
	IEUfuuNLd9aPcl1xI8b5TCjfG6f1hMLCFcXtKEYmx6HfCgmFDvWv7dOFSS6sgeT9bQX+Z2PzbzP
	xyy4XgXDYiFCfiVEceVvAvbfEMp83OliirhvN3Rox/WfmBm7uhVByI6m3nLZLbO1zElT3Y4jFuc
	4T0x33ioaH/2UiJ5wuBsdEBF6DhQUNg8164z+o1xjo9Av9ZHQwRpP4qz9yzf/5HvAiDokLEoI1W
	PD+nzfHEX3v1x0uM4Yln8mV98zOLnHA==
X-Google-Smtp-Source: AGHT+IGNAbuqm5FmxluF5wtjWawmF2WQ5tcvDHorTjnjuiAauWPbvFZ5uA5beNY4uy00YPPjFwGD/g==
X-Received: by 2002:a05:600c:a04:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-43ee06401a7mr54753425e9.14.1744007178599;
        Sun, 06 Apr 2025 23:26:18 -0700 (PDT)
Received: from ?IPV6:2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6? ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a9da1sm10916991f8f.22.2025.04.06.23.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 23:26:18 -0700 (PDT)
Message-ID: <115a9838-faf0-4607-87f9-c952b43bca78@gmail.com>
Date: Mon, 7 Apr 2025 09:26:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] crypto: sun8i-ce-hash - drop
 CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG ifdefs
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: clabbe.montjoie@gmail.com, davem@davemloft.net,
 linux-crypto@vger.kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250401192321.3370188-1-ovidiu.panait.oss@gmail.com>
 <20250401192321.3370188-4-ovidiu.panait.oss@gmail.com>
 <Z_NM9LnUF6Gpv_iz@gondor.apana.org.au>
Content-Language: en-US
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
In-Reply-To: <Z_NM9LnUF6Gpv_iz@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_232620_601575_AC62D93B 
X-CRM114-Status: GOOD (  14.42  )
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

On 4/7/25 6:56 AM, Herbert Xu wrote:
> On Tue, Apr 01, 2025 at 10:23:19PM +0300, Ovidiu Panait wrote:
>> 'struct sun8i_ce_alg_template' is always defined, even with
>> CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG disabled, so the ifdef guards
>> are not needed.
>>
>> Make sure the statistics have IS_ENABLED() checks instead.
>>
>> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
>> ---
>>   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 8 +++-----
>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
>> index b0959d8218cb..530c5181d73c 100644
>> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
>> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
>> @@ -31,9 +31,7 @@ static void sun8i_ce_hash_stat_fb_inc(struct crypto_ahash *tfm)
>>   
>>   		algt = container_of(alg, struct sun8i_ce_alg_template,
>>   				    alg.hash.base);
>> -#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
>>   		algt->stat_fb++;
>> -#endif
> 
> Should this go under IS_ENABLED as well?
> 

This is already part of an IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG) 
block, so no need to add an extra IS_ENABLED() check here. Just the 
ifdef was dropped:

	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)) {
		struct sun8i_ce_alg_template *algt __maybe_unused;
		struct ahash_alg *alg = crypto_ahash_alg(tfm);

		algt = container_of(alg, struct sun8i_ce_alg_template,
				    alg.hash.base);
#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
		algt->stat_fb++;
#endif
	}

Thanks,

> Thanks,


