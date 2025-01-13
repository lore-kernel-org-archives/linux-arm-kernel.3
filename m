Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEDFC02183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 16:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0Q399qQBeFwQ2AAFvg5rIHC8O+bRX8lVMzO2SMae/g=; b=e1V/d4e0tyHgICE+JQCf0v7LcR
	VtTf3+/1krC9fJwsj8RrpYK0lbiE65oNYsMpaNvSAGQt6cFt7gc0RJYVbqpSme2x4INbkz7XMJiEq
	7kEfwmJYge/rdk5f6aYKsYTgfSpO7Ex1ckN4txUMhfWFtmfDOhPNY6W5sk6ZTK1eMoxE1Z1UHOhfI
	07upZDdJ03ThclnCj9/vvhXd0N0PcAMQSr7HWJJzsVz6sHoNYtymvigFPduS74YxxDVYfhWMRBTZx
	CrB0foHWB/KlRikV1aQPvm9JaJSpsp8XG029lAwFLk63K73qyHHz9lgfRQTz1GZz1biK3Qab2cYzm
	knry6Zng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNZC-00000005ufB-2Jwy;
	Mon, 13 Jan 2025 16:45:30 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNJI-00000005r8X-466b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 16:29:06 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-385e0e224cbso2402211f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 08:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736785743; x=1737390543; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z0Q399qQBeFwQ2AAFvg5rIHC8O+bRX8lVMzO2SMae/g=;
        b=j4WYh1VEKwieoAIAqnJFwvlwKz483WTpGDTjNh64K4zXRU2QH6qUwhaH3BCYC3gJ3N
         GWydaoLL2x7Fl8oFPfVnVidmIpma18AP9UCsopuXYmwnyCFFA/ZJxLyeHeZyrrJzfady
         8YQIUzBN1QsXn3Xc9zhTcf+EnEVap3XVvCKeqe0PgAf6arE3Tf6bAmdUX62ZjsGVW0fe
         wcUf0WSqQHj8bgtcG0QB3kjrXjPtHUFO7v0j+LN/QSJLfeNgcoRqEzVtJJ6ShPs5Sv6q
         QBQqlsOfGqOS3ic4zMGg8aNA1lXXqbjrLZXJ1RycPTRXwEIyA9fF6fxXpmKo+rdzaEt1
         qJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736785743; x=1737390543;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z0Q399qQBeFwQ2AAFvg5rIHC8O+bRX8lVMzO2SMae/g=;
        b=wzXILtNXyNS3Ik6xhdHH7hZky3B4TWopRrA2q1Daid4tGYGxQwaHjC6KliQ5tIZLjI
         wPRb4FR/yViE2hMjeFkW4HqMUhvnz5HzYrVrNTGmRj8Uq9xixkHpy6AEeCM/w2+TSFEb
         /pLYRFRcgBQ9rIhfy9KnlZFKmu2TnNS4JyHNNBU/HZFSXm96xnPqCW1dQzGW875ebOoQ
         gy13/svQJWn/PWNioUkY5oED+G7mjDQ1QeO7IU5U51QKKkHroX0fRpbvFMaQgskoBVVU
         Zntkw0VjFSh11+EvYiyOmNeiXvAwQMfmB6gs0ceH7g7lLMUeUAB48Tg8dHPEcRdIaf6t
         wRWA==
X-Forwarded-Encrypted: i=1; AJvYcCU8cCK7J02Qh4ZmumLCN7jW31NA9PFnUha7TUKVDKglCmpN3MMVYga9vmrXP10FhOsjjPziaRZNeVfBzWE4wkzK@lists.infradead.org
X-Gm-Message-State: AOJu0YzoT+rCr0XnpZw3Alx8+bWwmpkKUJPrD0KeqfKUNNL/MBWpCb27
	ihQiA2Gyxojxv86J4QmI1XIf7qa8Acx7JlEF4bYkK73Ieq5pod0sm3jmgCPtse0=
X-Gm-Gg: ASbGncs/9o4FBGx37APUEj24VpAbxxM+dpauVizPPrv+xIO//Yg2LFuhwtSYB/PD4N+
	mSyEKUAmLyvmI4qSd2Xny9jRglXsdkQb7O7rC+mLKUzLrDI0eyLI2mLMPTrC5zYZn4LBqfp+CfP
	JgfiwV/4NUJYdD8IHPNSR7LpUAMSpPAwA88awWzuVUVq5uynQa+mKpWVKWDB7+2TdP4Bnw3KIyn
	Bn6MGNtloHvzz4C7pMpuTeQHNpG/IXdfEZTHISJgE1ypSL4WuFy7+PCW65Y23WicH+s
X-Google-Smtp-Source: AGHT+IGulicDFCac9I2VZC0TgSd73omPyF97o27BxwW8eg456AUs6gMtMhOv1+x4cJrRYaETRuDLmA==
X-Received: by 2002:a5d:64a1:0:b0:38a:4b8a:ffec with SMTP id ffacd0b85a97d-38a872ef24cmr19513809f8f.33.1736785743184;
        Mon, 13 Jan 2025 08:29:03 -0800 (PST)
Received: from [192.168.68.163] ([212.105.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a9362947dsm11055865f8f.40.2025.01.13.08.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 08:29:02 -0800 (PST)
Message-ID: <e9331167-dd9c-44a6-8c59-7e95660959cd@linaro.org>
Date: Mon, 13 Jan 2025 16:29:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 06/10] arm64/sysreg/tools: Move TRFCR definitions to
 sysreg
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, oliver.upton@linux.dev, suzuki.poulose@arm.com,
 coresight@lists.linaro.org, James Clark <james.clark@arm.com>,
 Mark Brown <broonie@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>, Shiqi Liu <shiqiliu@hust.edu.cn>,
 James Morse <james.morse@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Fuad Tabba
 <tabba@google.com>, "Rob Herring (Arm)" <robh@kernel.org>,
 Raghavendra Rao Ananta <rananta@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250107113252.260631-1-james.clark@linaro.org>
 <20250107113252.260631-7-james.clark@linaro.org>
 <87cygsqgkh.wl-maz@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <87cygsqgkh.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_082905_041553_45C81321 
X-CRM114-Status: GOOD (  35.99  )
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



On 12/01/2025 1:58 pm, Marc Zyngier wrote:
> On Tue, 07 Jan 2025 11:32:43 +0000,
> James Clark <james.clark@linaro.org> wrote:
>>
>> From: James Clark <james.clark@arm.com>
>>
>> Convert TRFCR to automatic generation. Add separate definitions for ELx
>> and EL2 as TRFCR_EL1 doesn't have CX. This also mirrors the previous
>> definition so no code change is required.
>>
>> Also add TRFCR_EL12 which will start to be used in a later commit.
>>
>> Unfortunately, to avoid breaking the Perf build with duplicate
>> definition errors, the tools copy of the sysreg.h header needs to be
>> updated at the same time rather than the usual second commit. This is
>> because the generated version of sysreg
>> (arch/arm64/include/generated/asm/sysreg-defs.h), is currently shared
>> and tools/ does not have its own copy.
>>
>> Reviewed-by: Mark Brown <broonie@kernel.org>
>> Signed-off-by: James Clark <james.clark@arm.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
> 
> I've added the following patch to the series, dropping the TCFCR_ELx
> construct and fixing the code that makes use of it.
> 
> 	M.
> 
>  From fc77862e06ca1c15e44b0c915da193bd8ed855bc Mon Sep 17 00:00:00 2001
> From: Marc Zyngier <maz@kernel.org>
> Date: Sun, 12 Jan 2025 13:08:59 +0000
> Subject: [PATCH] arm64/sysreg: Get rid of TRFCR_ELx SysregFields
> 
> There is no such thing as TRFCR_ELx in the architecture.
> What we have is TRFCR_EL1, for which TRFCR_EL12 is an accessor.
> 
> Rename TRFCR_ELx_* to TRFCR_EL1_*, and fix the bit of code using
> these names.
> 
> Similarly, TRFCR_EL12 is redefined as a mapping to TRFCR_EL1.
> 

I saw your 'mapping' patch but didn't pull it in for whatever reason. LGTM.

Reviewed-by: James Clark <james.clark@linaro.org>

> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: James Clark <james.clark@linaro.org>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> ---
>   arch/arm64/tools/sysreg                          |  8 ++------
>   .../hwtracing/coresight/coresight-etm4x-core.c   | 16 ++++++++--------
>   .../hwtracing/coresight/coresight-etm4x-sysfs.c  | 10 +++++-----
>   drivers/hwtracing/coresight/coresight-trbe.c     |  2 +-
>   4 files changed, 16 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 4c2c9c6767c93..ac5202e1df862 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -1999,7 +1999,7 @@ Field	17:16	ZEN
>   Res0	15:0
>   EndSysreg
>   
> -SysregFields TRFCR_ELx
> +Sysreg	TRFCR_EL1	3	0	1	2	1
>   Res0	63:7
>   UnsignedEnum	6:5	TS
>   	0b0001	VIRTUAL
> @@ -2011,10 +2011,6 @@ Field	1	ExTRE
>   Field	0	E0TRE
>   EndSysregFields
>   
> -Sysreg	TRFCR_EL1	3	0	1	2	1
> -Fields	TRFCR_ELx
> -EndSysreg
> -
>   Sysreg	SMPRI_EL1	3	0	1	2	4
>   Res0	63:4
>   Field	3:0	PRIORITY
> @@ -2991,7 +2987,7 @@ Mapping	ZCR_EL1
>   EndSysreg
>   
>   Sysreg	TRFCR_EL12	3	5	1	2	1
> -Fields	TRFCR_ELx
> +Mapping	TRFCR_EL1
>   EndSysreg
>   
>   Sysreg	SMCR_EL12	3	5	1	2	6
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index fbc4aa3785279..2c1a60577728e 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -275,7 +275,7 @@ static void etm4x_prohibit_trace(struct etmv4_drvdata *drvdata)
>   	if (!drvdata->trfcr)
>   		return;
>   
> -	trfcr = drvdata->trfcr & ~(TRFCR_ELx_ExTRE | TRFCR_ELx_E0TRE);
> +	trfcr = drvdata->trfcr & ~(TRFCR_EL1_ExTRE | TRFCR_EL1_E0TRE);
>   
>   	write_trfcr(trfcr);
>   	kvm_tracing_set_el1_configuration(trfcr);
> @@ -286,9 +286,9 @@ static u64 etm4x_get_kern_user_filter(struct etmv4_drvdata *drvdata)
>   	u64 trfcr = drvdata->trfcr;
>   
>   	if (drvdata->config.mode & ETM_MODE_EXCL_KERN)
> -		trfcr &= ~TRFCR_ELx_ExTRE;
> +		trfcr &= ~TRFCR_EL1_ExTRE;
>   	if (drvdata->config.mode & ETM_MODE_EXCL_USER)
> -		trfcr &= ~TRFCR_ELx_E0TRE;
> +		trfcr &= ~TRFCR_EL1_E0TRE;
>   
>   	return trfcr;
>   }
> @@ -312,7 +312,7 @@ static void etm4x_allow_trace(struct etmv4_drvdata *drvdata)
>   		return;
>   
>   	if (drvdata->config.mode & ETM_MODE_EXCL_HOST)
> -		trfcr = drvdata->trfcr & ~(TRFCR_ELx_ExTRE | TRFCR_ELx_E0TRE);
> +		trfcr = drvdata->trfcr & ~(TRFCR_EL1_ExTRE | TRFCR_EL1_E0TRE);
>   	else
>   		trfcr = etm4x_get_kern_user_filter(drvdata);
>   
> @@ -320,7 +320,7 @@ static void etm4x_allow_trace(struct etmv4_drvdata *drvdata)
>   
>   	/* Set filters for guests and pass to KVM */
>   	if (drvdata->config.mode & ETM_MODE_EXCL_GUEST)
> -		guest_trfcr = drvdata->trfcr & ~(TRFCR_ELx_ExTRE | TRFCR_ELx_E0TRE);
> +		guest_trfcr = drvdata->trfcr & ~(TRFCR_EL1_ExTRE | TRFCR_EL1_E0TRE);
>   	else
>   		guest_trfcr = etm4x_get_kern_user_filter(drvdata);
>   
> @@ -1176,9 +1176,9 @@ static void cpu_detect_trace_filtering(struct etmv4_drvdata *drvdata)
>   	 * tracing at the kernel EL and EL0, forcing to use the
>   	 * virtual time as the timestamp.
>   	 */
> -	trfcr = (TRFCR_ELx_TS_VIRTUAL |
> -		 TRFCR_ELx_ExTRE |
> -		 TRFCR_ELx_E0TRE);
> +	trfcr = (TRFCR_EL1_TS_VIRTUAL |
> +		 TRFCR_EL1_ExTRE |
> +		 TRFCR_EL1_E0TRE);
>   
>   	/* If we are running at EL2, allow tracing the CONTEXTIDR_EL2. */
>   	if (is_kernel_in_hyp_mode())
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index a9f19629f3f84..c767f8ae4cf1d 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -2319,11 +2319,11 @@ static ssize_t ts_source_show(struct device *dev,
>   		goto out;
>   	}
>   
> -	switch (drvdata->trfcr & TRFCR_ELx_TS_MASK) {
> -	case TRFCR_ELx_TS_VIRTUAL:
> -	case TRFCR_ELx_TS_GUEST_PHYSICAL:
> -	case TRFCR_ELx_TS_PHYSICAL:
> -		val = FIELD_GET(TRFCR_ELx_TS_MASK, drvdata->trfcr);
> +	switch (drvdata->trfcr & TRFCR_EL1_TS_MASK) {
> +	case TRFCR_EL1_TS_VIRTUAL:
> +	case TRFCR_EL1_TS_GUEST_PHYSICAL:
> +	case TRFCR_EL1_TS_PHYSICAL:
> +		val = FIELD_GET(TRFCR_EL1_TS_MASK, drvdata->trfcr);
>   		break;
>   	default:
>   		val = -1;
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index d6eb0d525a4d6..fff67aac84181 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -1118,7 +1118,7 @@ static u64 cpu_prohibit_trace(void)
>   	u64 trfcr = read_trfcr();
>   
>   	/* Prohibit tracing at EL0 & the kernel EL */
> -	write_trfcr(trfcr & ~(TRFCR_ELx_ExTRE | TRFCR_ELx_E0TRE));
> +	write_trfcr(trfcr & ~(TRFCR_EL1_ExTRE | TRFCR_EL1_E0TRE));
>   	/* Return the original value of the TRFCR */
>   	return trfcr;
>   }


