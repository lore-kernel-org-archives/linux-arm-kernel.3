Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454F61090234
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 14:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62uEef/BkeK/5loUdRkhgtOa4Jww3WVIsDAkK87TFQ4=; b=hbG6XZANGet4WxUYWInHbsZdWJ
	m8UrNwZ58nOPEbtwBTB6u1PvaFJMrbw7J7ElyURDPh2A5DjHV1/sjM4wso0A0WDv9xm6u4QYEvIfr
	PujodYY/qq9BranJ+81Qa8vhowbqntFDGJm+VmvtSmuUChLP5WmYW6bLMsT7uM7Q2k+n7R2uY47Vi
	7uNGtElVsWqjQFlv+tr8mdThCl1o4gEHjnmFYQzlBcgPBUPDgARWsS37U8qCPXadQl+dzJsWmylXx
	4rRfgD+rCzx5FI9JrZDpuGshHFkun0DmIYX27WBjYYc/USTWuuz5/dRqOR+3ReveYafyWdHzhPrdm
	5XHIztkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3E6J-0000000AkR2-0DpW;
	Thu, 19 Mar 2026 14:11:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3E6G-0000000AkQL-0lLw;
	Thu, 19 Mar 2026 14:11:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B92D440BCE;
	Thu, 19 Mar 2026 14:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 664A8C19424;
	Thu, 19 Mar 2026 14:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773929507;
	bh=MivZjiW5NvagivYMYH70K18NXOP+4XjdCcrtxZRKzWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UerHPcIhZf5iw1L4uJ064Sm5pT3BEiIczGzptBjlWHw2pf3d+tNXIabR0FlPqyIRk
	 i5A/s8jANJQ+6DUKj9E72Pk/lWL3jerwH8bHCa5SFCaU4jhsmeb+7/x+Ua9i0WELOr
	 Ul+vuoba3lTnp86TRF2Gqt6t+s9MBbPodYgntONPFxSLb6c4CzdLpTzVBK9FDDgtpb
	 GtbHzfXlvHPbrSvV7xXFxD3nRPfQ6pzF6z2CrsaJL1o1mZx8i0TVCMMHxmzlmccQr2
	 TxqxhEmmNyEKoFOHBIAHTBuL5gqIQSxljyLvzzcUAdFWSowUlBD6xMHugYmz7rRveT
	 VQko93pO+Dwtw==
Date: Thu, 19 Mar 2026 14:11:34 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>, 
	Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-mm@kvack.org, 
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 1/2] mm: remove CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE
Message-ID: <2b23080c-0af9-4269-958b-957e7c093258@lucifer.local>
References: <20260319-config_migration-v1-0-42270124966f@kernel.org>
 <20260319-config_migration-v1-1-42270124966f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-config_migration-v1-1-42270124966f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_071148_260773_528ACD23 
X-CRM114-Status: GOOD (  20.40  )
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

On Thu, Mar 19, 2026 at 09:19:40AM +0100, David Hildenbrand (Arm) wrote:
> All architectures that select CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE also
> select CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG. So we can just remove
> CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE.
>
> For CONFIG_MIGRATION, make it depend on CONFIG_MEMORY_HOTREMOVE instead,
> and make CONFIG_MEMORY_HOTREMOVE select CONFIG_MIGRATION (just like
> CONFIG_CMA and CONFIG_COMPACTION already do).

Makes sense!

>
> We'll clean up CONFIG_MIGRATION next.
>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

LGTM, so:

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

> ---
>  arch/arm64/Kconfig     | 1 -
>  arch/loongarch/Kconfig | 1 -
>  arch/powerpc/Kconfig   | 1 -
>  arch/riscv/Kconfig     | 1 -
>  arch/s390/Kconfig      | 1 -
>  arch/x86/Kconfig       | 1 -
>  mm/Kconfig             | 9 +++------
>  7 files changed, 3 insertions(+), 12 deletions(-)
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 38dba5f7e4d2..bcd9f5bc66e2 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -16,7 +16,6 @@ config ARM64
>  	select ARCH_BINFMT_ELF_STATE
>  	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
>  	select ARCH_ENABLE_MEMORY_HOTPLUG
> -	select ARCH_ENABLE_MEMORY_HOTREMOVE
>  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
>  	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
>  	select ARCH_HAS_CACHE_LINE_SIZE
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index d211c6572b0a..dbf65ad512f1 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -12,7 +12,6 @@ config LOONGARCH
>  	select ARCH_NEEDS_DEFER_KASAN
>  	select ARCH_DISABLE_KASAN_INLINE
>  	select ARCH_ENABLE_MEMORY_HOTPLUG
> -	select ARCH_ENABLE_MEMORY_HOTREMOVE
>  	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
>  	select ARCH_HAS_ACPI_TABLE_UPGRADE	if ACPI
>  	select ARCH_HAS_CPU_FINALIZE_INIT
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index ad7a2fe63a2a..9f3417b75b2b 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -126,7 +126,6 @@ config PPC
>  	select ARCH_DISABLE_KASAN_INLINE	if PPC_RADIX_MMU
>  	select ARCH_DMA_DEFAULT_COHERENT	if !NOT_COHERENT_CACHE
>  	select ARCH_ENABLE_MEMORY_HOTPLUG
> -	select ARCH_ENABLE_MEMORY_HOTREMOVE
>  	select ARCH_HAS_COPY_MC			if PPC64
>  	select ARCH_HAS_CURRENT_STACK_POINTER
>  	select ARCH_HAS_DEBUG_VIRTUAL
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 90c531e6abf5..61a9d8d3ea64 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -21,7 +21,6 @@ config RISCV
>  	select ARCH_DMA_DEFAULT_COHERENT
>  	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
>  	select ARCH_ENABLE_MEMORY_HOTPLUG if SPARSEMEM_VMEMMAP
> -	select ARCH_ENABLE_MEMORY_HOTREMOVE if MEMORY_HOTPLUG
>  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
>  	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
>  	select ARCH_HAS_BINFMT_FLAT
> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
> index edc927d9e85a..d01800962d84 100644
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -85,7 +85,6 @@ config S390
>  	select ARCH_32BIT_USTAT_F_TINODE
>  	select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE
>  	select ARCH_ENABLE_MEMORY_HOTPLUG if SPARSEMEM
> -	select ARCH_ENABLE_MEMORY_HOTREMOVE
>  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
>  	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
>  	select ARCH_HAS_CC_CAN_LINK
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index e2df1b147184..c290fe363f27 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -69,7 +69,6 @@ config X86
>  	select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE
>  	select ARCH_ENABLE_HUGEPAGE_MIGRATION if X86_64 && HUGETLB_PAGE && MIGRATION
>  	select ARCH_ENABLE_MEMORY_HOTPLUG if X86_64
> -	select ARCH_ENABLE_MEMORY_HOTREMOVE if MEMORY_HOTPLUG
>  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if (PGTABLE_LEVELS > 2) && (X86_64 || X86_PAE)
>  	select ARCH_ENABLE_THP_MIGRATION if X86_64 && TRANSPARENT_HUGEPAGE
>  	select ARCH_HAS_ACPI_TABLE_UPGRADE	if ACPI
> diff --git a/mm/Kconfig b/mm/Kconfig
> index c012944938a7..b2e21d873d3f 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -465,9 +465,6 @@ config HAVE_BOOTMEM_INFO_NODE
>  config ARCH_ENABLE_MEMORY_HOTPLUG
>  	bool
>
> -config ARCH_ENABLE_MEMORY_HOTREMOVE
> -	bool
> -
>  # eventually, we can have this option just 'select SPARSEMEM'
>  menuconfig MEMORY_HOTPLUG
>  	bool "Memory hotplug"
> @@ -540,8 +537,8 @@ endchoice
>  config MEMORY_HOTREMOVE
>  	bool "Allow for memory hot remove"
>  	select HAVE_BOOTMEM_INFO_NODE if (X86_64 || PPC64)
> -	depends on MEMORY_HOTPLUG && ARCH_ENABLE_MEMORY_HOTREMOVE
> -	depends on MIGRATION
> +	depends on MEMORY_HOTPLUG
> +	select MIGRATION
>
>  config MHP_MEMMAP_ON_MEMORY
>  	def_bool y
> @@ -636,7 +633,7 @@ config PAGE_REPORTING
>  config MIGRATION
>  	bool "Page migration"
>  	default y
> -	depends on (NUMA || ARCH_ENABLE_MEMORY_HOTREMOVE || COMPACTION || CMA) && MMU
> +	depends on (NUMA || MEMORY_HOTREMOVE || COMPACTION || CMA) && MMU
>  	help
>  	  Allows the migration of the physical location of pages of processes
>  	  while the virtual addresses are not changed. This is useful in
>
> --
> 2.43.0
>

