Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDDFCAC589
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjQ5+oMfNA1z8X7OxHRV6oMq0vnVY8/Ms0Vhwhb2pfo=; b=b7aYad2E+iubb8bPahJUnTN1C8
	m186414j9IDMHBnR+suFWYjdlu6MkDNcro2+HWrdl9ybKcjinLCWU9whdIRu1oxMqVTJivbhRvicd
	qY5JWok6VgpTQO6gouWMoFRouWqnzCgXnjdKR39SkAr5BxOIp6PxdzC/ou+SccMTGRzqapgVnzwqU
	/bc+Zn1UALpc/JxvbRLDgIXfQZg2f33cbWPgQeM/ukaGKKyhS4ayu6sAfniqdfP09RhmmlDLcsBrP
	uDD7R+d87PLgqZW2vZm4+PN4FctpEXsS8Frpca7EhHiOH6ZhQp3EEQbzek1Ss1eZD6R5bDeE6utVz
	CxM+I/wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsBl-00000004pA1-2UH0;
	Tue, 09 Sep 2025 06:50:49 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uviGd-000000027a1-35p1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 20:15:13 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45de2b517a3so17224055e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 13:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757362510; x=1757967310; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jjQ5+oMfNA1z8X7OxHRV6oMq0vnVY8/Ms0Vhwhb2pfo=;
        b=Qt1ykCOYomvr2R/kquBXMB6C6vFvmSU+/yhD1HhanMrcvWqTC+jdxMsP5EIW13Btti
         XdQWJcRJcxyVZCc3MHQCSJveWV89B3TJ4UBW6CNLXo3R6QOzDjF+PgCfYQwwKtZ0KEtD
         dQc+Qk6wRDi/s7Hrn+Xx+79+9VwWGDmq+HseEzKjn6+BNLJKsXA3yrNXaYWxxT/Gn/JX
         Ncn/c++ZluB2fzHnsfPZ3f/PxCUXTgGYiu8Mrn48+dkv4fgaScvsXRKX0HD46FdDuYwu
         Cf1kdm7m3EkWt77bRqJTqZkw7iB2qzMMn4HkG7WIImeO+8L098ApFyYq5q265ikC+wOK
         agpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757362510; x=1757967310;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jjQ5+oMfNA1z8X7OxHRV6oMq0vnVY8/Ms0Vhwhb2pfo=;
        b=J8ku0n/FfIQyv8/ritemIlhUXxN9tXpLKtTMngwlz1KX/MeZ/oj9n42BATQJRAWvou
         lKaflkaKervvArleyKe7bpkmrVtBEkdwUY05yv5Oz7oblZ1zmLoQfOExR0GG0yuDbquE
         3KVNSLvMTxQhs4UUHyec+J+6OSz2awX3IJ3PVDFIuTO1AfqURjguFaMvrSe3FdKdp3AM
         nJv2f6JQ6EtTLnEUL5oOX2sRz7FWR8oOWUqp2bvIfgmQtoRuU80rB43RdxEMqKqjJjDh
         NH505LCO4NVbCKhHCGrCRAK6sr4HSAwfEkUpzcJafZcDiwXQ+b2ETt5C8nQ0Ia+eFcEj
         O1vQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSDgKl/JKHiiVEUnTpRliq0t6f4+SmGLGRzEmVeu6OM5VGtFFO3jaKBlcYF+naDrdGfX+NAK6uPXhA+qGGvLoy@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3pSa9euBXBZyWJroGg7lbTyW921G94YsNyshyqnRkxQE3Fn9r
	TnoyOGRXoOH0cTXFoZutwsq+xbBqEiVOiXPdahvSVAD4jXSzD2iTE13rbyT2C0G5wHg=
X-Gm-Gg: ASbGncutbn7LomVI16iCCNwKpXEqA50Tnxdt0gUh1izXuE1/zSqkXAoPkty06ISAA2v
	kQSvzOacYif24e3nJZ9Qx3gJT6gcjwlFL3aNXm5+ybsuFSvKl5VE8mrJO5T6oiAPWpTkoBAWS2Y
	w2WdiY4df4wv6gMYtZ6md+GSOTD9jA9ivpOFtzR6WDe7HnGAFdjbtgAIxDbmxbtO8m/SEwBQAUu
	FFW9CLYpJQMbvzx88ou2jkHIsk14PWPIAXVJrJc/arVliBAbD8Dz/i393kWQCmpC4N8UzjC8kwS
	Fpca1C5F8JTPR/xFyyG9WWq5I4KPsufao3m8KRKkhUT943BFyo8p+S7NQQOwLN5YtyB76YTmrSK
	Eko83Aac/qUN04oB/JpLB+dYyWg==
X-Google-Smtp-Source: AGHT+IEUXK+5uzEYEeWM2C4ugYvoTxY9jWpw3+DQwWpEwD7U8BI+a4nggbRKv+GtES+a6PSycdGhyA==
X-Received: by 2002:a5d:5f87:0:b0:3e2:804b:bfed with SMTP id ffacd0b85a97d-3e64c1c2183mr8374205f8f.42.1757362509754;
        Mon, 08 Sep 2025 13:15:09 -0700 (PDT)
Received: from [192.168.3.100] ([151.42.66.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e411219ddfsm13631814f8f.57.2025.09.08.13.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 13:15:09 -0700 (PDT)
Message-ID: <29a776da-cd28-46e4-8b64-400f462d8670@baylibre.com>
Date: Mon, 8 Sep 2025 22:15:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: amlogic: gxbb-odroidc2: remove UHS capability
 for SD card
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250907-fix-reboot-v1-1-7606fc91254e@baylibre.com>
 <1jecsi3ywb.fsf@starbuckisacylon.baylibre.com>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <1jecsi3ywb.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_131511_892545_2E4AB23F 
X-CRM114-Status: GOOD (  17.25  )
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

Thanks a lot for the review!

> The above should be enough.
> 
>>   	max-frequency = <100000000>;
>>   	disable-wp;
>>   
>>   	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
>>   
>>   	vmmc-supply = <&tflash_vdd>;
>> -	vqmmc-supply = <&tf_io>;
> 
> ... but do not remove that.
> 
> That way the description is complete and the kernel is able to verify
> the regulator is properly configured.

Thanks for the hint! I didn't thought about this while working on it, 
but I tried it today and it worked perfectly.

> It is also easier for a bootloader to alter DT to add the UHS modes back
> (it is safe to do so if booting from another device that SD, such as
> eMMC)

This sounds like a nice improvement as well.

-- 
Valerio


