Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FFCC83013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 08:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oYgO9gPGPFem/ue3nHcSi2VYa5driBXGjHPtXbD9tHw=; b=HPDKKCohMnx4AD/yDHUFLOq4ji
	OOxcdfIvtH6ip3TKNdKzN4jGk14tFqP8KZduQljIwbf4Nqib4fxIXdPCxMeW7qhwqObfkfMiAIcPx
	FVfXI8XWTUIN6BN9asx1BhvK4eUaa7LuacnZe6+r89bF4XFtgjWn69Wb3/l08hiH4TZXNzKInxLe4
	Hj0dM4zvXG4u5F5c7nxEp/LXkaAN6tb3qR9LHB+F+KPyUacKYg+POtNE3p/PW/V/TdZmblFcBqitx
	I4X/B8o3PikETt1V8ldQG5251Bm/33YGsQynU6YTn6cv40jO+M8UQdrsBbFVaQm/rbZjXfX5P4XCT
	Cut90YFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWsuj-00000007cn9-0Bh1;
	Wed, 02 Jul 2025 08:33:57 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWssO-00000007cSE-28jc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 08:31:33 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ae3b336e936so269843266b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 01:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751445090; x=1752049890; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oYgO9gPGPFem/ue3nHcSi2VYa5driBXGjHPtXbD9tHw=;
        b=ce+rD+ntbZFfoIueqiD1WoGNj5Z+t5ucEe1rbbcYeWk7nJdL60901gAvHhU81WxjRa
         EQkCLgkfxiQqRPkPxWktptHd+vATdEndwsR+hRcSw0A03rsGypEbyxZrEO0vCugRXQMV
         m15DQCMKM4hzY2cntu0nGc3Urm2frjB0n6Wq2DzjjgQlo5VkorIVZ1GBEdaEokvRdNkf
         AGqJD2fhGq/J9JgCXj73qz9nQitqWDxwiImuu9I6sd3AqYrOksdy0ExB8eSXEw3Es9wM
         tB5eUYyZMN4nNMphML98c2EAgMgHuKVWHM98T5Te92JuVkSEL4kCYRjg2pboz7KSHcbH
         smWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751445090; x=1752049890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oYgO9gPGPFem/ue3nHcSi2VYa5driBXGjHPtXbD9tHw=;
        b=J1O166IMGZlrHPSpt6dWy1jNkyrOtfRpBMZXBZF3qkxObmp9mSJecSRM8b2qKPc2PS
         LnZIMvIRb9B3DauRPZjufu6Jfi8lEOD/pfypJM+WlVJIqC8IOiuQxHrpaXBMr+d1gP7R
         TAiNtrjl8/09CHMEtzy51LLj07Km8KNCIdJ/vkpUm5LM4kqG8xDmmtXMxtQ3jJGxAZ6c
         2yOGPYHzbz6Ilu3MtlVlFUNYLVXCd004OXqAJVcsTKcQTVlNwGjkQkSWUe4jO3N2AuDI
         YJiNX64TGZ1vERE5gySGsA/HClJMmrdqMgtv+SJ7vUg23h3+FLTzvODe6YDNsRophLNZ
         gdpQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3HU4I3ZPTlNb1T3kJDU89+nAkAoJ+i3DalDN4Xz3sVR3cDgvJiYdrbCWKZYE4njtXCx+3k9q4RW1ilSH3i5U6@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1zELDvXGhLJYciUu2XgznlgeONmheN/p+j20wNGKoR9tQhMej
	x27cmMqCrt+DZGnhT8b9J51ZUsEoIywiACYM872oEr1Jp8VhH7mO5jEn
X-Gm-Gg: ASbGncs3sGwo8v3kAZ5WWKLJR9PE7RbSHwb4LnbfTKn1afz5A2L/NvKmoAFjax7Kr2d
	cWxBLk3X0hU1S3doYCgtdgcMfFj5wjM/q3irqYD5vPh3hCByHBBuJucMbI8ceNM1YZwCtvPLlkW
	uxxZQ7qFfsFbcIvP1P/PoJB0ctKsMc8lWyxN/M+br7avZqpQL8oc1+WkT5gd4QZu1RXypreTfDa
	1Qy6Z06cwOFBITgMvjme9Ppmld3v+idvXqqLmBPtjEnIkpMYmBhDnAhwctyxj/k7ogv7RpUl8A6
	tVzFOican4/+VsbnpoxliDFjBuD2BNFjkajy9tFGH1g7KWxcOuhgR8H+SKBatpti/iVoOXLdGRk
	6jMkJK4MwBowtEPTKiKhHMvY=
X-Google-Smtp-Source: AGHT+IHLIAeFsGaHxS4ciQ6iWXJqr5BcWAMimCo+KVlmSdchXq5TGkILRI11lt2Dhr4SijLUwuD1pA==
X-Received: by 2002:a17:907:96a8:b0:ae0:34d4:28a5 with SMTP id a640c23a62f3a-ae3c28bcd88mr187429266b.0.1751445090007;
        Wed, 02 Jul 2025 01:31:30 -0700 (PDT)
Received: from [192.168.7.237] ([92.120.5.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b24fsm1032167466b.34.2025.07.02.01.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 01:31:29 -0700 (PDT)
Message-ID: <a1b6039e-7020-4d17-8186-d40ac17ba730@gmail.com>
Date: Wed, 2 Jul 2025 11:31:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pwm: imx-tpm: reset counter if CMOD is 0
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-pwm@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
References: <20250701220147.1007786-1-laurentiumihalcea111@gmail.com>
 <vwozlwajisjw5qomwtmnfdklmucevyxncsxl2cdmixn2yixxrk@x6j3r2lrl5qz>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <vwozlwajisjw5qomwtmnfdklmucevyxncsxl2cdmixn2yixxrk@x6j3r2lrl5qz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_013132_547151_6871D3F6 
X-CRM114-Status: GOOD (  24.93  )
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



On 7/2/2025 8:51 AM, Uwe Kleine-König wrote:
> Hello,
>
> On Tue, Jul 01, 2025 at 06:01:47PM -0400, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> As per the i.MX93 TRM, section 67.3.2.1 "MOD register update", the value
>> of the TPM counter does NOT get updated when writing MOD.MOD unless
>> SC.CMOD != 0. Therefore, with the current code, assuming the following
>> sequence:
>>
>> 	1) pwm_disable()
>> 	2) pwm_apply_might_sleep() /* period is changed here */
>> 	3) pwm_enable()
>>
>> and assuming only one channel is active, if CNT.COUNT is higher than the
>> MOD.MOD value written during the pwm_apply_might_sleep() call then, when
>> re-enabling the PWM during pwm_enable(), the counter will end up resetting
>> after UINT32_MAX - CNT.COUNT + MOD.MOD cycles instead of MOD.MOD cycles as
>> normally expected.
>>
>> Fix this problem by forcing a reset of the TPM counter before MOD.MOD is
>> written.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  drivers/pwm/pwm-imx-tpm.c | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/pwm/pwm-imx-tpm.c b/drivers/pwm/pwm-imx-tpm.c
>> index 7ee7b65b9b90..30f271826aed 100644
>> --- a/drivers/pwm/pwm-imx-tpm.c
>> +++ b/drivers/pwm/pwm-imx-tpm.c
>> @@ -204,6 +204,19 @@ static int pwm_imx_tpm_apply_hw(struct pwm_chip *chip,
>>  		val |= FIELD_PREP(PWM_IMX_TPM_SC_PS, p->prescale);
>>  		writel(val, tpm->base + PWM_IMX_TPM_SC);
>>  
>> +		/*
>> +		 * VERY IMPORTANT: if CMOD is set to 0 then writing
> The "VERY IMPORTANT" is correct today as this is missing and so
> disturbing operation. However once this patch is applied, it's only
> normal to have it. So I suggest to drop this.

ACK

>
>> +		 * MOD will NOT reset the value of the TPM counter.
>> +		 *
>> +		 * Therefore, if CNT.COUNT > MOD.MOD, the counter will reset
>> +		 * after UINT32_MAX - CNT.COUNT + MOD.MOD cycles, which is
>> +		 * incorrect.
>> +		 *
>> +		 * To avoid this, we need to force a reset of the
>> +		 * counter before writing the new MOD value.
>> +		 */
> Without the reference manual at hand or a deeper understanding of the
> hardware this isn't understandable. What is MOD? What is CMOD?

so, MOD is the reference value for the counter. The counter needs to count until this
value is reached, at which point the counter value gets reset to 0 and the output signal
is driven HIGH or LOW (depends on the configured polarity). This value is used to define
the period of the PWM.


CMOD, on the other hand, is a clocking-related configuration option. I'd say what we're most
interested in here is the fact that if CMOD is 0 then the counter will be disabled. Otherwise,
it will be enabled.

>
>> +		if (!cmod)
>> +			writel(0x0, tpm->base + PWM_IMX_TPM_CNT);
>>  		/*
>>  		 * set period count:
>>  		 * if the PWM is disabled (CMOD[1:0] = 2b00), then MOD register
> Best regards
> Uwe


