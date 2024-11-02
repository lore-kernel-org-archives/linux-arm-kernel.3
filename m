Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF97E67807
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 17:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8t9oRS8jqFz7JqVHrKzcZwls154V3gx6wMcbOAYsmHY=; b=luYEyh5ciPYBFoqkmmc7ajkpgA
	N/aUPXh+0QcsJF+oLqTsR5NogyH4sLYUsey9LCnx0ptc2j75/9w0wp1kqlU1r+9Ago0jZ2btBt/Qp
	BaLBJGRMugAqyH0U8QikiVhdKKMI4Ree9/fwTCk8M3ZAmgBmAf95g+zfrsjNB+xMZAWdp7/K06ziv
	PPrcZWMniMra9bzPPROEmCwl1LNM54xS92EsKd2ymRWe7HRd/LpI/jYsDOQlBt0KW4JTHjnt0gI5N
	EUZFetvROegfNQWomoKx5q4QfF/bMJE/TEBLM/1NIeOv6Q7P8cLUcHNTl5XlYGafzJHlLoXM3F4n8
	ohlw2rbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Hqb-0000000A6rZ-34u6;
	Sat, 02 Nov 2024 17:23:37 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7How-0000000A6dN-0mmX;
	Sat, 02 Nov 2024 17:21:55 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-37d63a79bb6so1914111f8f.0;
        Sat, 02 Nov 2024 10:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730568112; x=1731172912; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8t9oRS8jqFz7JqVHrKzcZwls154V3gx6wMcbOAYsmHY=;
        b=XWIAb94p4/iTp4K4f18R/BYg9BVxOCC1aL2ej4ioxCOkISipe1/45OrBCwNocLJool
         hVgHDysHquPGarEygfKTImQyV+MazsgB3HGYm74fSX0/8niKC/RAsw+kXfkUUFIRhDq7
         TluZNs3z9+O128ojwgoqD5fIvWc/GLfDoHG9VTGlMU9+2C8m8CpCVS0GR4OnEYmxUX22
         03eVYWFyVrqPx47zM2THfeEddDBzELQ+eopGoWyHa0JuRJkVzhdFfCVlvsX63o6rBz1p
         OpIgHDnl7nmQsqnX5qtHuE4Wu1AqMWvaBquGzhtlw9F27AhG2puQCqnUMJudXGTw1prB
         pXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730568112; x=1731172912;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8t9oRS8jqFz7JqVHrKzcZwls154V3gx6wMcbOAYsmHY=;
        b=MzV36x3KVj9RP4h+4mIVxtfB7qCPZg3GasI6BbT8PQUPAtzBKNe3cICeUI+xRlMUi6
         z5/SxzKwmhphw+pDTLf4HTfLw/GnhrbaNoSZoTDN+Rj0x0oKa44AajLcT5aYNKhq7OtH
         XH0tM2H08IiY68uWgmaC7aJIJBgc1SYG1LiwoR4kMCfqD2q1kDF/XhUs7STUTmTnyJCt
         51leUBWN1Kdpyf3Dq3vTd4DzkpD8VRaYPaSd9RrXXhuYOepnUqSbtdpLJ3JR9DPaNdqx
         CJTZS5BuiEI8r1fD81ygOzSmSIaB0W936T1A9Gdnmd/InGZH4WDAQn16cjz+prSEg+Xb
         wnow==
X-Forwarded-Encrypted: i=1; AJvYcCVLayPGU59VOAkxGplPrA/yxVcbhpufa5GqLt2LbETmJmggl7E4GYqkLu2oFdF9fUkABgn75+iE4uumiE2RQLDB@lists.infradead.org, AJvYcCWe+2Fr8gBGmUv/pIz2fnnRAvrD64BLW9i74ksIroZDAzgTzp/eMXdstF66fU7XdZCeFr3x+qF/dAuc2/o=@lists.infradead.org
X-Gm-Message-State: AOJu0YyS+GXkupcaf5+cRKCIuRw8ayIFcygqHRf4CQYSUs1XsXH24vbu
	MJndFIwCalqQ5VBrA9EFDixEJzco0WwEYNiDuFHzqXVZS4nBzqQl
X-Google-Smtp-Source: AGHT+IGi2uIS+syMjf4Zb3uVjiFcNrb793MRtp10AmIBh8gU8g/TTGAjyc3KAIibvpjiJFec6IflZQ==
X-Received: by 2002:a5d:5f96:0:b0:37d:324f:d3a9 with SMTP id ffacd0b85a97d-381be7add20mr8712682f8f.9.1730568111468;
        Sat, 02 Nov 2024 10:21:51 -0700 (PDT)
Received: from [192.168.8.100] (89-24-32-122.nat.epc.tmcz.cz. [89.24.32.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7b80sm8686121f8f.10.2024.11.02.10.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 10:21:50 -0700 (PDT)
Message-ID: <8784622f-ccdc-4086-83f7-50462d6369df@gmail.com>
Date: Sat, 2 Nov 2024 18:21:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 04/18] crypto: crc32 - don't unnecessarily register
 arch algorithms
To: Eric Biggers <ebiggers@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>
Cc: Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
References: <20241026040958.GA34351@sol.localdomain>
 <ZyX0uGHg4Cmsk2oz@gondor.apana.org.au>
 <CAMj1kXFfPtO0vd1KqTa+QNSkRWNR7SUJ_A_zX6-Hz5HVLtLYtw@mail.gmail.com>
 <ZyX8yEqnjXjJ5itO@gondor.apana.org.au>
 <CAMj1kXHje-BwJVffAxN9G96Gy4Gom3Ca7dJ-_K7sgcrz7_k7Kw@mail.gmail.com>
 <CAMj1kXG8Nqw_f8OsFTq_UKRbca6w58g4uyRAZXCoCr=OwC2sWA@mail.gmail.com>
 <ZyYIO6RpjTFteaxH@gondor.apana.org.au>
 <20241102163605.GA28213@sol.localdomain>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <20241102163605.GA28213@sol.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_102154_265908_006460F9 
X-CRM114-Status: GOOD (  15.43  )
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

On 11/2/24 5:36 PM, Eric Biggers wrote:
> On Sat, Nov 02, 2024 at 07:08:43PM +0800, Herbert Xu wrote:
>> On Sat, Nov 02, 2024 at 12:05:01PM +0100, Ard Biesheuvel wrote:
>>>
>>> The only issue resulting from *not* taking this patch is that btrfs
>>> may misidentify the CRC32 implementation as being 'slow' and take an
>>> alternative code path, which does not necessarily result in worse
>>> performance.
>>
>> If we were removing crc32* (or at least crc32*-arch) from the Crypto
>> API then these patches would be redundant.  But if we're keeping them
>> because btrfs uses them then we should definitely make crc32*-arch
>> do the right thing.  IOW they should not be registered if they're
>> the same as crc32*-generic.
>>
>> Thanks,
> 
> I would like to eventually remove crc32 and crc32c from the crypto API, but it
> will take some time to get all the users converted.  If there are AF_ALG users
> it could even be impossible, though the usual culprit, iwd, doesn't appear to
> use any CRCs, so hopefully we are fine there.

Hi,

Please do not forget about dm-integrity, it can use crc32/crc32c for non-cryptographic
integrity through crypto API.
To test it, cryptsetup testsuite should cover these variants (integrity-compat-test).

Also, libcryptsetup can be compiled with userspace kernel crypto (AF_ALG) as a crypto backend.
At least, I think we never used CRC32 though AF_ALG from userspace there...

Thanks,
Milan


