Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA181CCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 23:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jkJQ2Wqv2WIkS8r8m2VU+kwyMn/g5LRAACPYO1/MIBg=; b=irsm3RZt9ImeT3eQiDgTAZ5/xT
	yXyh2Of9KZiN9lm25tdeVeA1sK7/9DOz/hQJQJWokyUTIT1NTqQHNmuH5X2uWfuIMnsZqUWZgFwZ3
	hVmT2wDJnllzuLILApIHIHnqWKjqHgytIjd5KwCtK8XOxVt0+b7+d6TkwkyuDk7MGjpGlkL62NAHv
	JeEoI1NE9Hz/eLNjBAe8lK6N8W4+bJaOjiwJw8LvBsiL5nkEwkITnqEeOlhmZ3/bOtOucKu9m9k6e
	s6/hjanHHxA4tJZGtHgPCLES+JxJp41QMfTCetqTkdriIuw7PUDVDCtIX09VSm83Fl/05qgpIYgdl
	K0WRGAYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAzi4-0000000FIeC-1T44;
	Mon, 20 Oct 2025 23:54:40 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAzi2-0000000FIdl-2CIx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 23:54:39 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-77f343231fcso3333871b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 16:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761004478; x=1761609278; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jkJQ2Wqv2WIkS8r8m2VU+kwyMn/g5LRAACPYO1/MIBg=;
        b=Z+tSZM06HUto96km5Rzp/1rG8w3yGe70paGiPkFFSxQtZGdD1N7B9K5+tzguI2fR6l
         to3mMZeO9zZIAUR66kZpiQYy2RBx0py/i/N1aEgGqirNDmn3AIcMuNIcLJC0covZl4Sp
         qlRJnjw2vyxltKAv7OSbMhRiDW4L8B4rdgAG3neiCDTwg0gra2bMYSgZzvevAQNCijyT
         0B3Lg8F+oxulgVGxbo6o2wQEOOZqsvwZvoiPD0gPV59oskCfVovBZoviE4hk6w5Ouvwh
         yUO71RC92OhCYvjnODBupiWf4BwmmCq5feeILGH7R88TwMim2Lvx7c4TfbP5+0yOrJ41
         8Aqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761004478; x=1761609278;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jkJQ2Wqv2WIkS8r8m2VU+kwyMn/g5LRAACPYO1/MIBg=;
        b=FsyqYFU/9L+Lk9OA1pzMTS2PXbZTuW4sB0zRW7rl0rw1k1NeptCuSZeUZuSfqbwdR4
         tyE4tMbFp748kxd93E1ZsqF4zThEvGPYbkYYO4A20tLeyfqZFFGENBIOQKLR4PHm1DwQ
         19TO/rfPlMvT7MPlcLLAoD5DDMwYTDgblueaA711oMu2v4BFTOe/5L5L+Qivb+9Kl2hY
         d6kxfvlZxU30+vX+72j8mRK83hoUZE3v7s9p2QPAmbaYKWyqckhpuVsOYZi6yvJVB7Ru
         Agh/zGytC4LhJBfgMZxDXeihC4GqNmT+alpNlQixtD4u38+o2hzakw7JNOtKnstahoco
         OSAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw1J7gkVgdrjhK/CJ4wS/fe37LRVyJjv7AG5hkHwyfuXt7ySyFafx7p8rT+Ygkks1vRLkASCLpXFLUXCbsj12F@lists.infradead.org
X-Gm-Message-State: AOJu0YwWUUdWavKgYCkIQx3euzz7F1sotqsJxpBeSPM3Sj3BatSNagjJ
	sEpgQvdIG7LbN6BH9jpvg+WY1s2l9yrPHh1gp2GMGUPr6C4dVIe/VZYV
X-Gm-Gg: ASbGncsyCuLursY7MmMtRJblvpGvDWnNYc06kT6ihc80Rk1iLh58ZizT5M9r6WVqlQr
	3c0X2PpiBQ3Sl9loGpskv8nCPnQFbhJn+rAe75ccCrbvRwayJ25Vc9srXwEOa7lWWtBgxlTQT0N
	Zbk7uVomGwsNFITvM9808Oyu+BjGWs9SNvwmvILncgBs9c7JIe5xgnkF+OQwYlGDAq01AsG+eW6
	gOBMmAM/15CabmXFF8BXHMyrSeYNbJo8hFxDNSaK0lRl6B3Ou2UhkO8W1X+VE21JlXLm/aZaHah
	Fluld7Yw2Cq0GkcRpQ84K0h9BAcuP9B8KG55h7EN7OkX6rUMynTf4jwIA/gsktu7dz63jXgQ/Le
	rR2sdSzuiLXw0MhCa+m1MDGPhmgoK6jaP5iP9l//z3n2VpCrlK3CzrHQ8M45JPMvFHJFEmugTlI
	2diiuE4MlEpG5UYwPm8c0S0g==
X-Google-Smtp-Source: AGHT+IEWbUvYFru0xgeOb8F6Gj2YJIGo2FfUgJ3zMwHaKzd+9qSePGSKb4FX+0Eekq3XescoXtalXQ==
X-Received: by 2002:a05:6a20:918f:b0:334:97dd:c5b4 with SMTP id adf61e73a8af0-334a856e67amr20900400637.27.1761004477385;
        Mon, 20 Oct 2025 16:54:37 -0700 (PDT)
Received: from [192.168.0.150] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff15b0csm9487310b3a.2.2025.10.20.16.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 16:54:36 -0700 (PDT)
Message-ID: <c42e042b-f1b1-453e-a350-dc5c99d38c75@gmail.com>
Date: Tue, 21 Oct 2025 06:54:32 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] lib/crypto: Add SHA3-224, SHA3-256, SHA3-384,
 SHA3-512, SHAKE128, SHAKE256
To: David Howells <dhowells@redhat.com>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-s390@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Stephan Mueller <smueller@chronox.de>
References: <aPXfzd0KBNg-MjXi@archie.me>
 <20251020005038.661542-1-ebiggers@kernel.org>
 <20251020005038.661542-4-ebiggers@kernel.org>
 <1062376.1760956765@warthog.procyon.org.uk>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <1062376.1760956765@warthog.procyon.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_165438_789481_31AF0AD8 
X-CRM114-Status: UNSURE (   8.67  )
X-CRM114-Notice: Please train this message.
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

On 10/20/25 17:39, David Howells wrote:
> Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> 
>>> +If selectable algorithms are required then the crypto_hash API may be used
>>> +instead as this binds each algorithm to a specific C type.
>>
>> What is crypto_hash API then? I can't find any of its documentation beside
>> being mentioned here.
> 
> crypto_shash, then.

OK, thanks!

-- 
An old man doll... just what I always wanted! - Clara

