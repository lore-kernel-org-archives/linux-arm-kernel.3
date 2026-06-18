Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCCCCD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 15:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhtrSbHirGTn3X9GtoAgD1uJ6365h6axZEkDGXJnLig=; b=PQuOojdTUNKUc2UycR5CMRmK1t
	wqnG/2RjZ8/j8goprQ/iv+OKBV404BX5h8UKNm4EmSHDhyOabBz1fFz1VCis2Gwu1443iF9393F92
	V6Bwlhko8n+Fxg1TdT5Ln8z0xzNg3ETvseJ0oKul+x3IKY30ct0fLMHAtoF/TBJypMkp5/5b/CxA6
	dJoFDY/uHo0KPGlJR1xH2nIJqR1vNxlCg+l9QasUL5H3e/jVh1Y2+pIYOSC4V8T5R3YTgSIg+BBhr
	o7iBZDutelRLRpts8nOUMSxmpJNw4nnqletgGThGDp1bEOiOvbw1qHFKaot8oCxfErBVulth762Qn
	sXUSF87w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waF0A-00000001VuG-12nQ;
	Thu, 18 Jun 2026 15:49:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waF08-00000001Vu4-4B3c;
	Thu, 18 Jun 2026 15:49:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B98044119;
	Thu, 18 Jun 2026 15:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A481F000E9;
	Thu, 18 Jun 2026 15:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781797796;
	bh=qhtrSbHirGTn3X9GtoAgD1uJ6365h6axZEkDGXJnLig=;
	h=From:To:Subject:In-Reply-To:References:Date;
	b=YZa46pD7DMphteXc9fyJEfzFDN3v9hbCr5E3KSw+xc2sAGO2FB84BSaEGhnN5Xw3Q
	 00UIrqFbWsiyD3eR3T3l53dWgRFpsuZeXBFJyAm9BVsdoCkc1Ih7TfOifDe0BzAkeE
	 /GmN/ZEFazUmwf3Te43GzWUKLCLbUVGTq1IQw13XqE1gXoKE+74gvPQCGh+xNzfkrx
	 5Mf97X4K6K2zTq9ygbtvyHPSeb+VNcppHGhK8pLQo6P4t+s9XGtQiPFdcpZKWeqaLf
	 S98IH43bTqjGuG1bC+2bMvt4Y38nQdaDitJxuo/sTcZHwhEqzGWeH27rNxOCQ9Oala
	 zPIOCmXJaCRuA==
From: Thomas Gleixner <tglx@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, tsbogend@alpha.franken.de, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 hpa@zytor.com, peterz@infradead.org, kees@kernel.org, nathan@kernel.org,
 linusw@kernel.org, ojeda@kernel.org, ruanjinjie@huawei.com,
 david.kaplan@amd.com, lukas.bulwahn@redhat.com, ryan.roberts@arm.com,
 maz@kernel.org, timothy.hayes@arm.com, lpieralisi@kernel.org,
 thuth@redhat.com, oupton@kernel.org, yeoreum.yun@arm.com,
 miko.lenczewski@arm.com, broonie@kernel.org, kevin.brodsky@arm.com,
 james.clark@linaro.org, tabba@google.com, mrigendra.chaubey@gmail.com,
 arnd@arndb.de, anshuman.khandual@arm.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH RFC 3/3] arm64: Add HOTPLUG_PARALLEL support for
 secondary CPUs
In-Reply-To: <20260611133809.3854977-4-ruanjinjie@huawei.com>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-4-ruanjinjie@huawei.com>
Date: Thu, 18 Jun 2026 17:49:53 +0200
Message-ID: <877bnvdf1a.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, Jun 11 2026 at 21:38, Jinjie Ruan wrote:
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -113,6 +113,7 @@ config ARM64
>  	select CPUMASK_OFFSTACK if NR_CPUS > 256
>  	select DCACHE_WORD_ACCESS
>  	select HAVE_EXTRA_IPI_TRACEPOINTS
> +	select HOTPLUG_PARALLEL if SMP && HOTPLUG_CPU

Why do you tie that to HOTPLUG_CPU? HOTPLUG_CPU lets you unplug/plug
CPUs at runtime, but if its disabled then a SMP system still has to
bring up the APs. So why should that fall back to the existing variant?

> +#ifdef CONFIG_HOTPLUG_PARALLEL
> +extern struct secondary_data cpu_boot_data[NR_CPUS];
> +#endif
> +
>  extern struct secondary_data secondary_data;
>  extern long __early_cpu_boot_status;
>  extern void secondary_entry(void);
> @@ -124,7 +128,11 @@ static inline void __noreturn cpu_park_loop(void)
>  
>  static inline void update_cpu_boot_status(unsigned int cpu, int val)
>  {
> +#ifdef CONFIG_HOTPLUG_PARALLEL
> +	WRITE_ONCE(cpu_boot_data[cpu].status, val);
> +#else
>  	WRITE_ONCE(secondary_data.status, val);
> +#endif

You're really a great fan of #ifdefs, right?

Just convert it over to the parallel mode unconditionally and get rid of
the existing cruft.

>  	/*
>  	 * TTBR0 is only used for the identity mapping at this stage. Make it
>  	 * point to zero page to avoid speculatively fetching new entries.
> @@ -254,7 +276,9 @@ asmlinkage notrace void secondary_start_kernel(void)
>  					 read_cpuid_id());
>  	update_cpu_boot_status(cpu, CPU_BOOT_SUCCESS);
>  	set_cpu_online(cpu, true);
> +#ifndef CONFIG_HOTPLUG_PARALLEL
>  	complete(&cpu_running);
> +#endif

Just for the record. You can get rid of this completion w/o PARALLEL
hotplug by selecting HOTPLUG_SPLIT_STARTUP and implementing the
kick/sync parts.
  
Thanks,

        tglx

