Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D29CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 12:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQCDKBQNearl7mAgYMgRVjkBiOBiur5AJMNVRUQy2q4=; b=0LUWAuw2+BXkrMtbocm/ezBHQA
	a7M4xPjL+pRSv681krmp11esDNoxiXjmC7vAVevTZ0RnnuuDPBXme3g4O9Bmn+bKUDbxGEauK5yLs
	mfzOcUf1JA9GCjv8j480ZjMGUbk350q2EqX2g1VXrDVGUUXxtBJ2BDh4KQLds93wyNzT68IjSHsGf
	pCYAw6DR65jRuWKvcbaC3e8Jh6rI80XFk6MSYy38IwPwXf0LdWjwJm+fhqggmyHZU8MIVOy/Lfn/a
	2acBVHxCF6xq0HzhUvH2PFNFA4tFNGPqWUgRcWfeyvWmQA5Z+v3gVnRILcflruI39XUrCsyMhL8aK
	XOvLmIWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6uL-0000000EFPI-09Vw;
	Mon, 15 Jun 2026 12:59:17 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6uG-0000000EFOh-2fza
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 12:59:16 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8422a92b6d6so1625573b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 05:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781528351; x=1782133151; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQCDKBQNearl7mAgYMgRVjkBiOBiur5AJMNVRUQy2q4=;
        b=WznBI5/2oMWoJ4J2DvdqTYawYNDFRKrTbNG28Mpk4SYYcPd8KHr3O4omdBUY7HuRH7
         TjhKwVjfNablyDQBm0L8B84dwiMagcUOx1quMXPUPDIKOIGB8qImYtX1SskYKEcpgoS2
         xsEperV6R2bWCnF7HZQjMsYIvvLHcPhuEA93+7cIK23bSbOfx/B3RhHvHH/e+yB6tXAn
         cbf8d4vjbxMHIAScHo7vaMvFjb7UiGPTqu78c2YKwxG7ajVHXIi4xQVJ3JMIB69mi4hB
         AtWJTZmxjiXYNoYWToQ7R/1NHovFHnwprfFJiQ5/qUPo66jY6p5XqZUtNIbPPjC6Ku8E
         r9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781528351; x=1782133151;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQCDKBQNearl7mAgYMgRVjkBiOBiur5AJMNVRUQy2q4=;
        b=QHobNujSEV+HECgK3KbrogKGT7vXDOeZz9zA/GJHu9s5EBE3hfZuqy4Ho7UA4+JeIT
         tmbAP8kstiYZHkrpHnxPl+xjQL1SVqyc1m5mMyG7Utabw/HQRpWUlLCDV8Qd9srY9YdO
         kiHpomFpJoRqfxcPGRoV+BUMPGiArWAbl6MVRRSyDtaA8hdRUAurXKtn1bXywOKVBllk
         bOFvvMgXCnzD1NnE9vQ6j3gMWUZCK90emZkeo1V6TUmj9X4C7VvSBQreaxQilfFfnYf5
         Yzl6BCc2zLmLSZkDNZQzkWImHz/i/qkytKdDBgO8l4L4KgCXq44TQpIBi3+sNafC1APH
         6MEw==
X-Gm-Message-State: AOJu0Yyxg20/NhDri5CFe0yoR2KHSYHyvVg+iNtf5XmUFhZTJtXgXwka
	Pur7GpaAXfEsUpJmrvaY/Me7Hv9ywmCndcqTFLXD1jxOI9M94KrFtz9M
X-Gm-Gg: Acq92OGQuCArhkPO7CgO1qONf9pQktAMI8hWESidGaeBu0Up5Jk9Qf7WFH6ZJ/eVTbm
	Q8uLMpJJHyMUhpkjH0HX6ubyp2o4zJCtOia8q7SzmqOhxJoYVW+2U8CYwD/5OBUyZHQ956KAgfR
	nCIpVhQdt971iC8bnGuuLmJJfRtpCLVg9OknddsUcEKU2MaWLVh8sckIUyOsRgmfLpo5adelk5F
	MuU2ODuHWjqYrg3Y95MTlJAVyc7QO6RyqPWcZ05Z+4jvVpLb0xpuedOhAYH9MrpxRIY2ufj/NZa
	78G6Au73+jwmM8wXkuiAmPrPpUgTOjWc0rhZrhUHl4CJVFAIPPHtOxCpy9X/vGK+lzjCZ3ckf/n
	xOP/5exPVihox0ofv58XmNQ0P+TQL1D7X3OZhg0P5c7d458jRWd8mUiYQNNan1xb8MLRIBeru/+
	50NhGm4InBmc9xfB+AXgQ/oG2Kt3uycCo=
X-Received: by 2002:a05:6a00:4b55:b0:842:307b:b9d0 with SMTP id d2e1a72fcca58-843497c819dmr11672053b3a.30.1781528350979;
        Mon, 15 Jun 2026 05:59:10 -0700 (PDT)
Received: from [192.168.1.111] ([223.122.38.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b009e67sm12056399b3a.42.2026.06.15.05.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 05:59:10 -0700 (PDT)
Message-ID: <7d9eef31-2193-4593-8976-7c7659843bf2@gmail.com>
Date: Mon, 15 Jun 2026 20:59:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: errata: Handle Apple WFI State Loss
Content-Language: en-MW
To: Yureka Lilian <yureka@cyberchaos.dev>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, Sasha Finkelstein <k@chaosmail.tech>
References: <20260615-wfi-erratum-v2-1-59a73467f70d@cyberchaos.dev>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20260615-wfi-erratum-v2-1-59a73467f70d@cyberchaos.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_055912_681568_E743F79B 
X-CRM114-Status: GOOD (  32.50  )
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



Yureka Lilian 於 2026/6/15 晚上8:21 寫道:
> Apple Silicon CPUs can lose register state in WFI, leading to crashes
> in the idle loop early in the boot process.
> This applies to any previous Apple Silicon CPUs too, but is worked
> around by configuring the WFI mode in SYS_IMP_APL_CYC_OVRD sysreg
> during m1n1's chickens setup.
> This workaround no longer exists since M4.
> 
> Add a workaround capability for replacing wfi and wfit with nop, and
> an erratum to enable it on the affected CPUs if the workaround using the
> sysreg is not already applied. Leave the decision whether the sysreg
> workaround can be used up to the earlier parts of the boot chain which
> already configure the Apple Silicon chicken bits.
> 
> This alternative has to be applied in early boot, since otherwise some
> cores might enter the idle loop before apply_alternatives_all() is run.
> 
> Reviewed-by: Sasha Finkelstein <k@chaosmail.tech>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
> Changes since v1:
> Restricted the erratum to EL2 only, since in EL1 we'd expect the
> hypervisor to trap WFI and handle the erratum.
> 
> Tested on M4 and M4 Pro (which now sometimes nondeterministically
> crash later during boot).
> Successfully booted on M3 Max with the SYS_IMP_APL_CYC_OVRD
> workaround disabled in the bootloader, as well as A18 Pro (which,
> like M4 / M4 Pro, doesn't have SYS_IMP_APL_CYC_OVRD).
> 
> There is probably a better place for the SYS_IMP_APL_CYC_OVRD
> defines, which I currently put in the middle of cpu_errata.c, but I
> wouldn't know where.
> ---
>  arch/arm64/Kconfig               | 12 ++++++++++++
>  arch/arm64/include/asm/barrier.h | 19 ++++++++++++++++---
>  arch/arm64/kernel/cpu_errata.c   | 21 +++++++++++++++++++++
>  arch/arm64/tools/cpucaps         |  1 +
>  4 files changed, 50 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index b3afe0688919..8c8ff069856f 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -453,6 +453,18 @@ config AMPERE_ERRATUM_AC04_CPU_23
>  
>  	  If unsure, say Y.
>  
> +config APPLE_ERRATUM_WFI_STATE
> +	bool "Apple Silicon: WFI loses state"
> +	default y
> +	help
> +	  This option adds an alternative code sequence to work around some
> +	  Apple Silicon CPUs losing register state during wfi and wfit
> +	  instructions.
> +
> +	  As a workaround, the wfi and wfit instructions are replaced with nop
> +	  operations via the alternative framework if an affected CPU is
> +	  detected.
> +
>  config ARM64_WORKAROUND_CLEAN_CACHE
>  	bool
>  
> diff --git a/arch/arm64/include/asm/barrier.h b/arch/arm64/include/asm/barrier.h
> index 9495c4441a46..f72eddc7c434 100644
> --- a/arch/arm64/include/asm/barrier.h
> +++ b/arch/arm64/include/asm/barrier.h
> @@ -20,9 +20,22 @@
>  #define wfe()		asm volatile("wfe" : : : "memory")
>  #define wfet(val)	asm volatile("msr s0_3_c1_c0_0, %0"	\
>  				     : : "r" (val) : "memory")
> -#define wfi()		asm volatile("wfi" : : : "memory")
> -#define wfit(val)	asm volatile("msr s0_3_c1_c0_1, %0"	\
> -				     : : "r" (val) : "memory")
> +#define wfi()							\
> +	do {							\
> +		asm volatile(					\
> +		ALTERNATIVE("wfi",				\
> +			    "nop",				\
> +			    ARM64_WORKAROUND_WFI_STATE)		\
> +		: : : "memory");				\
> +	} while (0)
> +#define wfit(val)						\
> +	do {							\
> +		asm volatile(					\
> +		ALTERNATIVE("msr s0_3_c1_c0_1, %0",		\
> +			    "nop",				\
> +			    ARM64_WORKAROUND_WFI_STATE)		\
> +		: : "r" (val) : "memory");			\
> +	} while (0)
>  
>  #define isb()		asm volatile("isb" : : : "memory")
>  #define dmb(opt)	asm volatile("dmb " #opt : : : "memory")
> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index 1995e1198648..8c9a194eddc4 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -309,6 +309,19 @@ static void cpu_enable_impdef_pmuv3_traps(const struct arm64_cpu_capabilities *_
>  	sysreg_clear_set_s(SYS_HACR_EL2, 0, BIT(56));
>  }
>  
> +#ifdef CONFIG_APPLE_ERRATUM_WFI_STATE
> +static bool has_apple_erratum_wfi_state(const struct arm64_cpu_capabilities *entry, int scope)
> +{
> +#define SYS_IMP_APL_CYC_OVRD   sys_reg(3, 5, 15, 5, 0)
> +#define CYC_OVRD_WFI_MODE_MASK GENMASK(26, 24)
> +	if (read_cpuid_implementor() != ARM_CPU_IMP_APPLE)
> +		return false;
> +	if ((read_sysreg(CurrentEL) >> 2) != 2)
> +		return false;

Nested vitrualization exists, and may be supported by KVM or macOS HVF.
Additionally, presumably the workaround should be applied under m1n1 hypervisor.

The solution is less clear. A reliable way to detect bare metal or
"almost bare metal" is checking for "apple,arm-platform" using
of_machine_is_compatible(), but that involves performing a non-CPU check inside a
CPU errata function, so that do not feel right to me.

Best Regards,
Nick Chan


> +	return FIELD_GET(CYC_OVRD_WFI_MODE_MASK, read_sysreg_s(SYS_IMP_APL_CYC_OVRD)) != 2;
> +}
> +#endif
> +
>  #ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
>  static const struct arm64_cpu_capabilities arm64_repeat_tlbi_list[] = {
>  #ifdef CONFIG_QCOM_FALKOR_ERRATUM_1009
> @@ -1009,6 +1022,14 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
>  		.matches = has_impdef_pmuv3,
>  		.cpu_enable = cpu_enable_impdef_pmuv3_traps,
>  	},
> +#ifdef CONFIG_APPLE_ERRATUM_WFI_STATE
> +	{
> +		.desc = "Apple WFI loses state",
> +		.capability = ARM64_WORKAROUND_WFI_STATE,
> +		.type = ARM64_CPUCAP_SCOPE_BOOT_CPU | ARM64_CPUCAP_OPTIONAL_FOR_LATE_CPU,
> +		.matches = has_apple_erratum_wfi_state,
> +	},
> +#endif
>  	{
>  	}
>  };
> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> index 9b85a84f6fd4..bbf8c15d79b0 100644
> --- a/arch/arm64/tools/cpucaps
> +++ b/arch/arm64/tools/cpucaps
> @@ -128,3 +128,4 @@ WORKAROUND_REPEAT_TLBI
>  WORKAROUND_SPECULATIVE_AT
>  WORKAROUND_SPECULATIVE_SSBS
>  WORKAROUND_SPECULATIVE_UNPRIV_LOAD
> +WORKAROUND_WFI_STATE
> 
> ---
> base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
> change-id: 20260614-wfi-erratum-7a9f305f601f
> 
> Best regards,
> --  
> Yureka Lilian <yureka@cyberchaos.dev>
> 
> 


