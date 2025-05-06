Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CC6C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 11:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wxtTsA4QklcizN8YDpNxBKefp4yr2C2T/GjifCCGDUA=; b=lbWSKDmWK0obbX1mJelLk6tcpZ
	BYBg8FELPah6r99jYP5uzdkFcvYkwtvHur0DW4KQquOcZ6ZC9HTuLisIB1BKumkZJPpTRLCCGqB1F
	Y2uOfW4gIUx0gNDqD9LNgck7cPtgBDUfqUlMnH+vU8KeikFfehFXEtDDgZ+FujzLGndGv1HuKCoXr
	tRBTXmU7Ng+as71C6Ha9AQHkFMyhAiSL7+mAd3IewMV8i9JmIytczqR4W3ohWpiNkkik2PN67gvdd
	5/fj82MNTQFVM3505TDbr9qO1rMw6G4l9dvL/wH6hF8Apjx98XY/kqQSY4dLSgfELu4UkmvCzstki
	w4AKM9hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCG5M-0000000BelH-23TA;
	Tue, 06 May 2025 11:03:40 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEcu-0000000BNlO-32uY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:30:14 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so45217125e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 02:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746523811; x=1747128611; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wxtTsA4QklcizN8YDpNxBKefp4yr2C2T/GjifCCGDUA=;
        b=X1FUKSXVRTh6ey8YXEgZuRGlqbQ1kWC72un7tFmL4HEbrqTRZBvQJwQkMuDJ6Jlhp9
         pkShOcrgMUPvVnpXcyQbD9q8HiihDDSB66CMl/lJjmWEMUUs5fADPtZD5N4VsQ8zj8HR
         Ech1oMOUxe4ZcoVDpxfs+T3N5Vlq3f4HkPCkyB1NVxmPxDq6SueUr4RHlp7SdVN1IXIn
         6SXSjHfj6zngTb2SsFMyEM8YkWEIDHPjMK5V0O31YlHmypVDzgwnCERWjO5fHtIboBtS
         3ZgSn+zeBBcQ8F8oF2lYq18j9qZxSObWKQ0mvjfwCiHSyuw682tpBWck7dIp4ZAQ4gHt
         N72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746523811; x=1747128611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wxtTsA4QklcizN8YDpNxBKefp4yr2C2T/GjifCCGDUA=;
        b=vFobqhd2cVZFaCk7k2hPdKn7gy6a0yZwGRSyh2gwm/TwJnehn98YiATJHCkenvQS4y
         GwoE0PLNFcI/Y/TRvWU15YyI1IuPfPuX4gN74xl9s3y6a8XQt25kXMrsYlmpcr+OLF2F
         X9Aaqjqb3S6uuGTH/BhSqTaDY+tkDCxuQ5fByzMV6gWYRV90tfAUG49RGZiVt8rj8yob
         PPLTOgk8G1/vLaiWH/zp0qcg9UHCWCPgbsiz4qsKvxsAjjgDEpGHU04fePuREu/dXn2+
         dLXWvD6eAS5+K5XBMUnnc1cq3dbAarXMxPeumkY2nQZ4TmtBatn6hsWqjTUCAe83d7G0
         oNXw==
X-Forwarded-Encrypted: i=1; AJvYcCXCx1mSVE4zFb/EA6Bf51OROgA2X0GZEyZt+c6RZoOwA1aFoaqPQbuMZ2GbTN657t7dKmC2Pe28rtZTRhqfzO+G@lists.infradead.org
X-Gm-Message-State: AOJu0YwOaNE9A0PkLPrp4fSQa4Fq43oguEo9bXLIYeHfbKf2tjoo5Rr/
	SgaO0nsCU9L8TCJouI7pu8AQajTzYF1BFMkj7hPGrOufOpXdyu7bl/+LgYyhoZQ=
X-Gm-Gg: ASbGncuF4nA3XylzaHaBt6lDBgSwkIq16dMjoL95UUB5l/Yx2lfyjvZoeuoNpjE7dh9
	/T+tdM4YdC1ERkyErZ//d8vMe0Ga+WQjlRyEsrTss8zMor8ld+z195M4hYXqM32nikwjZ4+q9tX
	577gxakfQ5blys78IQ+uqH2nF5OBNnzZkiTPByicKUuFdMuMbJdQivLK5TAt+9CwaGpj73ZCo7k
	7grC/+WI8jn+LAL3HoH+i5H6+G1zVAblCkUK9avH/3xJgqHHrcM91X9cpTyps6W0U3kelatCaUs
	fPwnX6fdXDXX28ydHrWFvepz6zjcwJXlimoYlc3p2bCUzu2bJBG5YlYR/uP6Nclh3btB16gArT8
	+4G8B
X-Google-Smtp-Source: AGHT+IFpif+qSrRTApHUVcDoxXrKID7abzqZ2HIETxhr80u7rcgLHGd48r0VmjGtaI8HxmY7d6CElw==
X-Received: by 2002:a05:6000:200d:b0:3a0:82d4:ba90 with SMTP id ffacd0b85a97d-3a0ac0da280mr1767727f8f.21.1746523810868;
        Tue, 06 May 2025 02:30:10 -0700 (PDT)
Received: from [192.168.5.157] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b16f92sm12768416f8f.81.2025.05.06.02.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 02:30:10 -0700 (PDT)
Message-ID: <99febf26-2ada-4fed-b4b3-596ac4abf581@baylibre.com>
Date: Tue, 6 May 2025 11:30:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt6357: Drop regulator-fixed
 compatibles
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Fabien Parent <fparent@baylibre.com>, Conor Dooley <conor+dt@kernel.org>
References: <20250502-mt6357-regulator-fixed-compatibles-removal-v1-1-a582c16743fe@collabora.com>
 <174652097090.119919.16240846809714782858.b4-ty@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <174652097090.119919.16240846809714782858.b4-ty@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_023012_901019_6CB4FC28 
X-CRM114-Status: GOOD (  22.08  )
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

Hello Nícolas and Angelo,

On 06/05/2025 10:42, AngeloGioacchino Del Regno wrote:
> On Fri, 02 May 2025 11:32:10 -0400, Nícolas F. R. A. Prado wrote:
>> Some of the regulators in the MT6357 PMIC dtsi have compatible set to
>> regulator-fixed, even though they don't serve any purpose: all those
>> regulators are handled as a whole by the mt6357-regulator driver. In
>> fact this is the only dtsi in this family of chips where this is the
>> case: mt6359 and mt6358 don't have any such compatibles.
>>
>> A side-effect caused by this is that the DT kselftest, which is supposed
>> to identify nodes with compatibles that can be probed, but haven't,
>> shows these nodes as failures.
>>
>> [...]
> 
> Applied to v6.15-next/dts64, thanks!
> 
> [1/1] arm64: dts: mediatek: mt6357: Drop regulator-fixed compatibles
>        commit: d77e89b7b03fb945b4353f2dcc4a70b34baa7bcb

I'm surprised that patch is applied after the Rob's bot reply.
Also, I've some concern:

On 02/05/2025 17:32, Nícolas F. R. A. Prado wrote:
 > Some of the regulators in the MT6357 PMIC dtsi have compatible set to
 > regulator-fixed, even though they don't serve any purpose: all those
 > regulators are handled as a whole by the mt6357-regulator driver. In
 > fact this is the only dtsi in this family of chips where this is the
 > case: mt6359 and mt6358 don't have any such compatibles.
This is the only dtsi in this family to do this, yes. But according to
all other vendor DTSI, which use regulator-fixed when a regulator can't
support a range of voltage, IMHO, it make sense to use it, isn't it ?
If other DTSI from the family of chips doesn't, why don't fix them to be
aligned with the other families?

 >
 > A side-effect caused by this is that the DT kselftest, which is supposed
 > to identify nodes with compatibles that can be probed, but haven't,
 > shows these nodes as failures.
 >
I lack of data about kselftest, but according to what is reported here, it
appear to me this is something which could be fixed in the test itself. It make
sense for a DTS, but not for a DTSI because it expose HW capability of a
device, not the board, so it isn't mandatory to probe all DTSI node.
Again, I'm not an expert, the test shouldn't show the DTSI node as failure,
but maybe more a warning.

 > Remove the useless compatibles to move the dtsi in line with the others
 > in its family and fix the DT kselftest failures.
If you remove compatible from these regulators, I think mediatek,mt6357-regulator.yaml
documentation file should be modified to be consistent and avoid dt-check error.

> 
> Cheers,
> Angelo
> 
> 

-- 
Regards,
Alexandre

