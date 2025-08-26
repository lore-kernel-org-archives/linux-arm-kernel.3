Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1409CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 17:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7YHGBfWDVADI2xpT7SSYdJvgJ+u1HlsYJPIUxDj/3o=; b=1/eefzTucBA6NxqH28G6I+oAjS
	9R0bIwpBACNQVGqbbB6R8QzgFqkNENMLbmhrqk5d9KjB9baonZJFkhvFU8LKxBl4XnXzgHSG54DPu
	SDsbjQDUy+OCdjuYKpGbILk8WnTmXMG/XpNkLOOvECm2ihE7l0EQMc4ElFvTZ3eQ4umWbVybOP3Ua
	T8pDrMPdmQM6s4KdZCsM/TeDEJV5Fxh6wehbnBgjLLG8GFFgdQx5CYooURRLAZw7wi/+Izyr0ZyM4
	n0u080/TnJ3vP9Hea8A4CRKCTAD9mKTJnkPfRc60ioQXRtdpehntIqeioeKp1EDlhzwAYzF7eUMX+
	/dMEqj6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqxOA-0000000Cl4J-1Zm2;
	Tue, 26 Aug 2025 17:23:18 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqwGY-0000000CbEC-023b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 16:11:23 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2445827be70so57990015ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 09:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756224681; x=1756829481; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x7YHGBfWDVADI2xpT7SSYdJvgJ+u1HlsYJPIUxDj/3o=;
        b=SjY/0nkZ+5J2+X2zg3jaa8NoYasSD1DViBKcU3LnHeorNr1w7uAsS/gHFpTR0nWalW
         WGPbu+85lqIvkvZzpXFtfEjJSTiTwX4Mwv9ezvakd6+lxMqeBt9Rel9NyvREawVC1NAv
         tMe2gqmJXZvUC8AxrlatWxp3MWhxvqn1YTiNR/RzPaONMgsAiEtKxbafxLxyg9nkNXat
         dZfbqvloO+gAMQjy3emzqL9MkLMbil5zQZ2AJVspYim6FftDX4dNSLzSSGLUFf40l16o
         9zgqjb2bknGjfvgFkL4yXJxUtbo+7e6iqauMa+sxwaX7F+m91LtBQA4M8bINv3FR0XZM
         9nCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756224681; x=1756829481;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x7YHGBfWDVADI2xpT7SSYdJvgJ+u1HlsYJPIUxDj/3o=;
        b=YMwOmeEYDQyK3nQB1wjFkt54sIH1PKCiKybyjyxRm3qg77qb2jYQBcVrkqlxCszJVR
         XxWe9ygjpkeIEMVpqFVR8NttxPnJHLU7Jw4dp2S7EaYw8OZcrX7mhkNaZFK1//+6qyBN
         ZeRHNj3aGlkdcQCO5gohFc/oppnhro7JQ+/1ankx/UwMBajjduvgYAswHkhlELJenWR/
         hiAzJugxj+uxg+nga45mdmtG4wneGWpfFe5JkoOtCVUHj5Vx4QPMt2A6yH6rVn3RLmdO
         MocH2X4sFjL78EZ1eF2w5C/jw8x43dYIm2+y0PS6C7o4f/VEXxrjShsxO/O/pLi0Wbu/
         ZP1g==
X-Forwarded-Encrypted: i=1; AJvYcCVXhpPurqGqwoIbSL53rrm5crIIXHm9V+85Y0p4b/9w8uI4gtepiwXFH9DUtj1+VlT5CBL3XEMw2Gi5eRrhJQPb@lists.infradead.org
X-Gm-Message-State: AOJu0Yzeg30qYnL9iICn4jbMUVrQla4ON/n0jw8PWiYz/6FwXP5EKonv
	BPZKbsKxk4DhiX+xCR4J0FIpf5XIBalqtY6b4APlS/7ABN312egtJlrp
X-Gm-Gg: ASbGncsaHF7ZBvWDiS4Jo0vBgxB4AJJu92t8CCCB4r0gbzgkNza2zn71qD9NrVbhW0E
	ALIq2aSKfDlHSwVUABv2koQTmOWZi1l8B6VNJB1/bvmaZUcMHhMCJ4TjERYCDK7Hv0FszvEPm4/
	u9XGM+0DzN1aDPWE2xaLZZDMg/rqQVrLHkGpRfKAuE7pFcHApIKh3bH4MSz35n7yiw+mVqy0Nk1
	7wZPSuox65acquvPe0VTBIAbbG8t7se7w4e2+9iwsWxfxJ5OjB7L03xaMDHjIQWvV94sPJDITZR
	+/G4QdZM712Vn+PVKCWeIlud6egtFTaUy0A2dzTvjoUW+LSNnY7kvka1fRTyWIeevsNotL25kGn
	zVO1BS1PpY0cxYCNGPYNaBg8+
X-Google-Smtp-Source: AGHT+IG8j7nkE/RFr7BQwCiAtTrjb1Yni0bb2N7tgW2dyTywLJuPO1I0dLGiPUq7BkTRDYyaGss91w==
X-Received: by 2002:a17:902:f70a:b0:246:d703:cf7f with SMTP id d9443c01a7336-246d703e121mr117052065ad.5.1756224680346;
        Tue, 26 Aug 2025 09:11:20 -0700 (PDT)
Received: from dw-tp ([171.76.82.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466885efc8sm99434355ad.90.2025.08.26.09.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 09:11:19 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC 3/3] arm64/ptdump: Add ARM64_PTDUMP_CONSOLE
In-Reply-To: <20250818091436.938517-4-anshuman.khandual@arm.com>
Date: Tue, 26 Aug 2025 21:16:19 +0530
Message-ID: <87bjo2qe5w.fsf@gmail.com>
References: <20250818091436.938517-1-anshuman.khandual@arm.com> <20250818091436.938517-4-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_091122_046780_ADEC05FF 
X-CRM114-Status: GOOD (  24.21  )
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

Anshuman Khandual <anshuman.khandual@arm.com> writes:

> Enable early kernel page table dump for debug purpose when required via new
> config ARM64_PDUMP_CONSOLE. This calls existing ptdump_walk() early on just
> after ptdump has been initialized with ptdump_init().

I happen to stumble upon this while looking for something else related
to ptdump and was curious to understand where this will be really
useful? 

So instead of dumping it via cat /sys/kernel/debug/kernel_page_tables,
this will dump at early boot during arch setup and before start_kernel().

I was curious, since this anyway gets enabled only in debug kernels.
There we can always just boot with minimal busybox image which can jump
to shell quickly and dump the kernel page tables, correct?

Also is ARM64_PTDUMP_CONSOLE config option added on purpose? A kernel cmdline
like early_ptdump=yes|1|true could come much handy, right?

(Since I am fixing few issues on powerpc ptdump - hence was just curious
to know whether this can come useful for me too or not :) )

Thanks!
-ritesh

>
> Suggested-by: Ryan Roberts <ryan.roberts@arm.com>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/Kconfig.debug        | 12 ++++++++++++
>  arch/arm64/include/asm/ptdump.h |  7 +++++++
>  arch/arm64/kernel/setup.c       |  1 +
>  arch/arm64/mm/ptdump.c          |  7 +++++++
>  4 files changed, 27 insertions(+)
>
> diff --git a/arch/arm64/Kconfig.debug b/arch/arm64/Kconfig.debug
> index 265c4461031f..0f8af0dd0f4c 100644
> --- a/arch/arm64/Kconfig.debug
> +++ b/arch/arm64/Kconfig.debug
> @@ -20,4 +20,16 @@ config ARM64_RELOC_TEST
>  	depends on m
>  	tristate "Relocation testing module"
>  
> +config ARM64_PTDUMP_CONSOLE
> +	bool "Dump early kernel page table"
> +	depends on DEBUG_KERNEL
> +	depends on ARCH_HAS_PTDUMP
> +	select PTDUMP
> +	help
> +	  Enable this option to dump early kernel page table entries during
> +	  boot using the PTDUMP framework. This helps in examining kernel's
> +	  page table mapping entries and their attributes etc.
> +
> +	  If in doubt, say N.
> +
>  source "drivers/hwtracing/coresight/Kconfig"
> diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
> index 27e774134e7f..81dc53ca9643 100644
> --- a/arch/arm64/include/asm/ptdump.h
> +++ b/arch/arm64/include/asm/ptdump.h
> @@ -74,8 +74,15 @@ void __init ptdump_debugfs_register(struct ptdump_info *info, const char *name);
>  static inline void ptdump_debugfs_register(struct ptdump_info *info,
>  					   const char *name) { }
>  #endif /* CONFIG_PTDUMP_DEBUGFS */
> +
> +#ifdef CONFIG_ARM64_PTDUMP_CONSOLE
> +void __init arm64_kernel_pgtable_dump(void);
> +#else
> +static inline void __init arm64_kernel_pgtable_dump(void) { }
> +#endif /* CONFIG_ARM64_PTDUMP_CONSOLE */
>  #else
>  static inline void __init ptdump_init(void) { }
> +static inline void __init arm64_kernel_pgtable_dump(void) { }
>  static inline void note_page(struct ptdump_state *pt_st, unsigned long addr,
>  			     int level, pteval_t val) { }
>  static inline void note_page_pte(struct ptdump_state *st, unsigned long addr, pte_t pte) { }
> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> index 0a3812c8e177..86bf7607d304 100644
> --- a/arch/arm64/kernel/setup.c
> +++ b/arch/arm64/kernel/setup.c
> @@ -361,6 +361,7 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
>  	init_bootcpu_ops();
>  	smp_init_cpus();
>  	smp_build_mpidr_hash();
> +	arm64_kernel_pgtable_dump();
>  
>  #ifdef CONFIG_ARM64_SW_TTBR0_PAN
>  	/*
> diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
> index c78e6b496dea..f6d22462add6 100644
> --- a/arch/arm64/mm/ptdump.c
> +++ b/arch/arm64/mm/ptdump.c
> @@ -407,6 +407,13 @@ void __init ptdump_init(void)
>  	ptdump_initialize();
>  }
>  
> +#ifdef CONFIG_ARM64_PTDUMP_CONSOLE
> +void __init arm64_kernel_pgtable_dump(void)
> +{
> +	ptdump_walk(CONSOLE, &kernel_ptdump_info);
> +}
> +#endif
> +
>  static int __init ptdump_debugfs_init(void)
>  {
>  	ptdump_debugfs_register(&kernel_ptdump_info, "kernel_page_tables");
> -- 
> 2.25.1

