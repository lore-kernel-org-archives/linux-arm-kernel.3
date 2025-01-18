Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28A0C02187
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 14:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZ5Pm7uJSWgiHbsmoxlvZ3LbzzSHeTzbUZ13dlbartc=; b=RX6p54eqf1TJnuTea/Iq9ncJDr
	4By3TIeXuZ7JYg1waYCVD/csuR+Yhm39yIvWdxpo63dTDFtz6SxU1Udl1aKlNyLf332TEDT0S/iz7
	lyfzAwpAadXzFlCE1u7HHzCX76jU3O/BBzwPMiYFcWH55huSTe7v9jdobIAwnsLyV1rOhOAvyKqYK
	Et+uzz2E2MktXEV5jekmJBKw886LXC0xUlSXynQhVW5B9ep4hWd0+JdafGcfBTJ6SlD+yrQEcCDkk
	YBN1uBClpOK3sa3MIbFpJ+Ofg6u8c+ZBe4H+hjfqiu1x2wpJJ1QoEz+1FHDEMTQQTJhLbTf8R1bwh
	egLT6h0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZA9K-00000002ZDh-0k60;
	Sat, 18 Jan 2025 14:50:10 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZA82-00000002Z65-2cxs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 14:48:51 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2166360285dso60729335ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 06:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737211729; x=1737816529; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZZ5Pm7uJSWgiHbsmoxlvZ3LbzzSHeTzbUZ13dlbartc=;
        b=QWOzWB+99MK8X5mZMU2cIhWTVW16c4ImCxzE/qTwe24ktcxNE5YQQapIOCjPZ+v150
         +CCQo+tRQrwI+salikVf/kvSo70H7AC5KW/1vXk/z0SJmPFouRD9F5jZZSLKCpHkGJ7Y
         EcU+2Tu/l55TNxwE08CVjfMw31n0YxBSlVcM8Te1wR2R93hvZYU5cL82PQhFWqxu8+GD
         OXxlPXZX4nLXRuDFF9nZ6p0mJjva6gqXuZFiUcB3KSP5LL4hh90UO/rsYvt0nvu2tvJa
         wAHzMO64u15mEhKNC0BflddAIPRbH66tPeWxO/6ZAPMNIYQ9/mB7QQ18ejBOlDanTPW0
         nhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737211729; x=1737816529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZ5Pm7uJSWgiHbsmoxlvZ3LbzzSHeTzbUZ13dlbartc=;
        b=Ga7A7R4VF43atMewOQFZBAdE3kOhOzIrFlpei/Zu1yw+Jh6JNh8Ej7wwPikQ3XRFJ9
         yWkpjpF1nNK8CALjgzxfh30YA5a7mcIaLasV2Vov9US22vui3CQptz8M3f2+0XMCuugw
         hKZS9o+J/O45JJV9ID1kiyHIgRiOABzNAdv/tTkEUbna5zL8bmGPEVabs7kvG58cRhYS
         NSL5pjVuHNsPjv6sg68U1HOSeeCgaIQadr2r2tmq6iid9sYidcWJOb7P1Hec0knWjjN2
         VT5HlVkYlFxZ4KaW8ZJyLZsmJ1cd2KtdAmESYLD6lh6BzmcHAeST5oKitL7I40/sRYdR
         gN2A==
X-Forwarded-Encrypted: i=1; AJvYcCUkumQlXCnF1LdV+I6WnhwPh6yMLND8VrqRYMZNZ0Qk2VjZMGAXng8Mx7MGN4O17L3he5ziF+tyQzuK2Tnp/rHi@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6fFPIVouqFDtGgUXHJB20XekmalhU1T/xAkn02UYV5z4xBqMF
	ETlOdVDdLlYbedMOyd85qgIlIbQLIHNTsfRqMtnSTRYMQ4Hqhr0LXhBmJmAt
X-Gm-Gg: ASbGncsM/2NR9jct8Ijx437vezdWy4EmpyDfevY6lUoejA00ZVZvw+nR+lbbdIA+NSU
	v1n85ST2knt6ya0drabjdQO2gsroRbMbTgTqm3IiNsjJQXRhthXw1AlIVBr3KwnowlaNs5fm19j
	cB/jBsx+bOjshTR8vZ+pcBh1mJD72Gl9URuu8zo+q2f/aYTY58wZB4++RsXTRvWbrH3Iy42VaoV
	8+dfPaP9CYEWi/aFZD46ssK5qcO52TfChjOK/lu5tzgd9OlSdhYWqHAw0S9yBsTKwPGsAflJVQF
	8X8pSLHktYFk1zw0nQ==
X-Google-Smtp-Source: AGHT+IFnrsNOUiSzk4s4t7y52klnwjzMxfS985Z5YG9DDee9EIIJ78Nl4bVqPlnBpD32vnlbMarWvw==
X-Received: by 2002:a05:6a00:4fcb:b0:727:99a8:cd31 with SMTP id d2e1a72fcca58-72daf97b5d3mr10770196b3a.14.1737211729445;
        Sat, 18 Jan 2025 06:48:49 -0800 (PST)
Received: from [192.168.0.101] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72daba48bc5sm3922488b3a.133.2025.01.18.06.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jan 2025 06:48:48 -0800 (PST)
Message-ID: <89307020-cc96-41e5-b0c9-998958b9844c@gmail.com>
Date: Sat, 18 Jan 2025 22:48:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/apple-aic: Only handle PMC interrupt as FIQ when
 configured to fire FIQ
To: Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250117170227.45243-1-towinchenmi@gmail.com>
 <aef452c6-1e12-4510-8fb9-1dc597cf69bf@app.fastmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <aef452c6-1e12-4510-8fb9-1dc597cf69bf@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_064850_666819_24C7140B 
X-CRM114-Status: GOOD (  18.04  )
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


Sven Peter 於 2025/1/18 夜晚8:24 寫道:
> Hi,
>
>
> On Fri, Jan 17, 2025, at 18:02, Nick Chan wrote:
>> The CPU PMU in Apple SoCs can be configured to fire its interrupt in one
>> of several ways, and since Apple A11 one of the method is FIQ. Only handle
>> the PMC interrupt as a FIQ when the CPU PMU has been configured to fire
>> FIQs.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: c7708816c944 ("irqchip/apple-aic: Wire PMU interrupts")
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
>> ---
>>  drivers/irqchip/irq-apple-aic.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/irqchip/irq-apple-aic.c 
>> b/drivers/irqchip/irq-apple-aic.c
>> index da5250f0155c..c3d435103d6d 100644
>> --- a/drivers/irqchip/irq-apple-aic.c
>> +++ b/drivers/irqchip/irq-apple-aic.c
>> @@ -577,7 +577,8 @@ static void __exception_irq_entry 
>> aic_handle_fiq(struct pt_regs *regs)
>>  						  AIC_FIQ_HWIRQ(AIC_TMR_EL02_VIRT));
>>  	}
>>
>> -	if (read_sysreg_s(SYS_IMP_APL_PMCR0_EL1) & PMCR0_IACT) {
>> +	if (read_sysreg_s(SYS_IMP_APL_PMCR0_EL1) &
>> +	    (FIELD_PREP(PMCR0_IMODE, PMCR0_IMODE_FIQ) | PMCR0_IACT)) {
> That's a somewhat unusual way to use FIELD_PREP and I'm not sure the
> expression even does what you want. It's true when only PMCR0_IACT is set and
> your commit description mentions that you only when to handle these when
> FIQ have been configured. Am I missing something here?
On a closer look the condition will evaluate to true when imode is between 7 and 4 inclusive and
PMCR0_IACT  is set. The intended behavior is to have it evaluate to true when imode is 4 and
PMCR0_IACT is set. Will send a v2.
>
>
> Best,
>
>
> Sven


Nick Chan


