Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C10CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 21:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/ZQDb9So2gKQ/FkPvqKAWsxEXamgfK1EXFZjJht5XQI=; b=LhSYLBtAUlW40uyjqX4sz6mDTQ
	cbQWMiDvmHatKI28iH+EfrLx66Ufdq99dVE+x7egvDrYHnHYccxxk2S/JDvJcYfBdIq3ghniMzyep
	z6R0Pd8wTaF8M6NUcDTm918CNsHfeKxNsEisgd4a1cmO7SwQBTjwhekgojfnFsHAgCzm6buTaYPRe
	x19E3OsXvrPrbA0+s4sAbHT889QXl8w9rGJK/i7dUefdcFi8gdutVUeUo2gDqDPXq80iQBF7x4eTN
	rkS4ATANDhqW+vhAIyHUVXqpZjJIENuohtQyAlkCdDbUoiqoDj6kgfeB+vs2YqfkaiDw3rw4Mkie+
	XLUSvwtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzieB-000000045Ob-0151;
	Fri, 19 Sep 2025 21:28:03 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzie8-000000045NY-3Hm5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 21:28:02 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b47174b335bso310327a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 14:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1758317280; x=1758922080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZQDb9So2gKQ/FkPvqKAWsxEXamgfK1EXFZjJht5XQI=;
        b=t7aIRkgRXNYN9LrKQD5+Zh/qFhEonP04a0Zzvo+QFWBCn59b218m6gCgQr/Ass8ylq
         pU7RtzJ2MDrKYNayv0hkmNcTjNAKYAkIr9GTxCdS0U6US95ipXRy2DKBcIc0N8x9uLgE
         5jRwH2vvfVYQkeGWNOWm9FrrczVtkUSMyZsbPcTAdTYYZwkOBnwl9l9LhLSSpEHsOzDw
         94iGvj+m/88d82o0ox08qMXG8YS6Ga04QnR13JzeTRFJF6y2Yosg15cDjZKjO3WfxdYj
         zFHoQacTYedifhmRczu94n6Qey6C9iOzNWFUvP8X8pDbbU8yLpXj9CpICcWC2fcwRxI4
         nspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758317280; x=1758922080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ZQDb9So2gKQ/FkPvqKAWsxEXamgfK1EXFZjJht5XQI=;
        b=E40HtlDgmcErVPzSpYU9IfygzFGfmkcPGkxWnrDLp/8PkV8LnWLgynkK5+UtndO8im
         vCpJCJaMbxi8R2EvkZQbotztirVaIxXFeNrlCCiU0qyhz+mpK5v5RcBwBde6btZbLtOY
         vlWvt7VskDx3WHf/F8YPuhNbPkJNssWZVijC2zFTTP46gKp8Vfwcdv1x5bscwnZAyra3
         hY79CFqxgBYlwCUt8oG2V7CkUILfi30SYnuxGv9F9hWaNmJP3VTU4nOvWnlhEYaSPEbQ
         gSfZIx6R344vu52Do2Y3ci1NWmiDIsyKNJIJox8Qyry6dl9OyM/KYeYTXe+yr2JzShOp
         ANEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGV+s5E4sNXUiwp3lwuNA+ebmGDlAvDM/Z3keojE0zVvvf1gdH+ER9CwTbHGskDqmAD3+g/olPtZ9gJzolNs1X@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6CXIj9+r3ClrNrog1MDAjBlq5hx/u67UN65ItswO4lBMMenrG
	8bmeTPEUnwyRrQdbv7YI8SmGVGXMGHyoVf0iA6me5xtZdkI52Dg/13G2hUTcP0dOEAA=
X-Gm-Gg: ASbGncvSnw8IpSjMEnZp3Cr/1gn3lsCzfFFa6BzjEsKfPxKf/P5VjOMdh/QA03+AFXa
	2+ai1xa+ShoP6J+btBQoo4+mlkq1HHmNouLunCtWkFkHFuCpsj+iLICkl6c5XYYx9QIwy2onWI9
	0VcDHOVDEZ8MOpOCKLsWSFV4rgiG7jtwZaVBTDrw1fA6ggzD5OH/UfBH2u3JpZ/xuQSJM6d18Nw
	zUeTFfBMzrhtSeRMtGiwSjukh7v3LBV5CPu/CRNMYv9yfwRw/yiSNuxRrtvkXSrtrqz0nZXKZnl
	f0+Sza73hyOaIpxa7NhqQq7JlvUHWCPH9qp/gVirJi/IqiAk5UW6UiBMxcZC82RzwDQk2/cfdc4
	EBvSRssmxSIQQUxWak5V4v7DnMjc=
X-Google-Smtp-Source: AGHT+IFrLc3vg7pW3fKZ2PwyEo2/VqlPtOfTzZE+fhi6HGHFBrj8XYf3MbD8MvcP68Gv9K7iWYq3MA==
X-Received: by 2002:a17:90b:4a46:b0:330:944e:4814 with SMTP id 98e67ed59e1d1-330983587e1mr3504387a91.5.1758317279731;
        Fri, 19 Sep 2025 14:27:59 -0700 (PDT)
Received: from telecaster.thefacebook.com ([2620:10d:c090:500::6:e352])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-330654bf948sm3247297a91.0.2025.09.19.14.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 14:27:59 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Cc: linux-debuggers@vger.kernel.org,
	kernel-team@fb.com
Subject: [PATCH v2] arm64: map [_text, _stext) virtual address range non-executable+read-only
Date: Fri, 19 Sep 2025 14:27:51 -0700
Message-ID: <93a6f8e47cce118493e250b719a927f517be12cf.1758316750.git.osandov@osandov.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_142800_837235_D194D708 
X-CRM114-Status: GOOD (  20.78  )
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

From: Omar Sandoval <osandov@fb.com>

Since the referenced fixes commit, the kernel's .text section is only
mapped starting from _stext; the region [_text, _stext) is omitted. As a
result, other vmalloc/vmap allocations may use the virtual addresses
nominally in the range [_text, _stext). This address reuse confuses
multiple things:

1. crash_prepare_elf64_headers() sets up a segment in /proc/vmcore
   mapping the entire range [_text, _end) to
   [__pa_symbol(_text), __pa_symbol(_end)). Reading an address in
   [_text, _stext) from /proc/vmcore therefore gives the incorrect
   result.
2. Tools doing symbolization (either by reading /proc/kallsyms or based
   on the vmlinux ELF file) will incorrectly identify vmalloc/vmap
   allocations in [_text, _stext) as kernel symbols.

In practice, both of these issues affect the drgn debugger.
Specifically, there were cases where the vmap IRQ stacks for some CPUs
were allocated in [_text, _stext). As a result, drgn could not get the
stack trace for a crash in an IRQ handler because the core dump
contained invalid data for the IRQ stack address. The stack addresses
were also symbolized as being in the _text symbol.

Fix this by bringing back the mapping of [_text, _stext), but now make
it non-executable and read-only. This prevents other allocations from
using it while still achieving the original goal of not mapping
unpredictable data as executable. Other than the changed protection,
this is effectively a revert of the fixes commit.

Fixes: e2a073dde921 ("arm64: omit [_text, _stext) from permanent kernel mapping")
Cc: stable@vger.kernel.org
Signed-off-by: Omar Sandoval <osandov@fb.com>
---
Hi,

We're working on our AArch64 stack tracing reliability in drgn [1], so I
finally got back around to this patch from March [2]. I reworked it as
Will suggested to map the range non-executable instead of leaving it
unmapped.

1: https://github.com/osandov/drgn/pull/547
2: https://lore.kernel.org/all/ec2d02358eee53f095ad9a7d9c96af8f4d0d4eeb.1741636880.git.osandov@osandov.com/

Based on v6.17-rc6.

Thanks!

 arch/arm64/kernel/pi/map_kernel.c |  6 ++++++
 arch/arm64/kernel/setup.c         |  4 ++--
 arch/arm64/mm/init.c              |  2 +-
 arch/arm64/mm/mmu.c               | 14 +++++++++-----
 4 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/pi/map_kernel.c b/arch/arm64/kernel/pi/map_kernel.c
index 0f4bd7771859..a8d76d0354da 100644
--- a/arch/arm64/kernel/pi/map_kernel.c
+++ b/arch/arm64/kernel/pi/map_kernel.c
@@ -78,6 +78,12 @@ static void __init map_kernel(u64 kaslr_offset, u64 va_offset, int root_level)
 	twopass |= enable_scs;
 	prot = twopass ? data_prot : text_prot;
 
+	/*
+	 * [_stext, _text) isn't executed after boot and contains some
+	 * non-executable, unpredictable data, so map it non-executable.
+	 */
+	map_segment(init_pg_dir, &pgdp, va_offset, _text, _stext, data_prot,
+		    false, root_level);
 	map_segment(init_pg_dir, &pgdp, va_offset, _stext, _etext, prot,
 		    !twopass, root_level);
 	map_segment(init_pg_dir, &pgdp, va_offset, __start_rodata,
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 77c7926a4df6..23c05dc7a8f2 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -214,7 +214,7 @@ static void __init request_standard_resources(void)
 	unsigned long i = 0;
 	size_t res_size;
 
-	kernel_code.start   = __pa_symbol(_stext);
+	kernel_code.start   = __pa_symbol(_text);
 	kernel_code.end     = __pa_symbol(__init_begin - 1);
 	kernel_data.start   = __pa_symbol(_sdata);
 	kernel_data.end     = __pa_symbol(_end - 1);
@@ -280,7 +280,7 @@ u64 cpu_logical_map(unsigned int cpu)
 
 void __init __no_sanitize_address setup_arch(char **cmdline_p)
 {
-	setup_initial_init_mm(_stext, _etext, _edata, _end);
+	setup_initial_init_mm(_text, _etext, _edata, _end);
 
 	*cmdline_p = boot_command_line;
 
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index ea84a61ed508..0dd558613bd7 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -279,7 +279,7 @@ void __init arm64_memblock_init(void)
 	 * Register the kernel text, kernel data, initrd, and initial
 	 * pagetables with memblock.
 	 */
-	memblock_reserve(__pa_symbol(_stext), _end - _stext);
+	memblock_reserve(__pa_symbol(_text), _end - _text);
 	if (IS_ENABLED(CONFIG_BLK_DEV_INITRD) && phys_initrd_size) {
 		/* the generic initrd code expects virtual addresses */
 		initrd_start = __phys_to_virt(phys_initrd_start);
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 183801520740..324b96e3632c 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -574,8 +574,8 @@ void __init mark_linear_text_alias_ro(void)
 	/*
 	 * Remove the write permissions from the linear alias of .text/.rodata
 	 */
-	update_mapping_prot(__pa_symbol(_stext), (unsigned long)lm_alias(_stext),
-			    (unsigned long)__init_begin - (unsigned long)_stext,
+	update_mapping_prot(__pa_symbol(_text), (unsigned long)lm_alias(_text),
+			    (unsigned long)__init_begin - (unsigned long)_text,
 			    PAGE_KERNEL_RO);
 }
 
@@ -636,7 +636,7 @@ static inline void arm64_kfence_map_pool(phys_addr_t kfence_pool, pgd_t *pgdp) {
 static void __init map_mem(pgd_t *pgdp)
 {
 	static const u64 direct_map_end = _PAGE_END(VA_BITS_MIN);
-	phys_addr_t kernel_start = __pa_symbol(_stext);
+	phys_addr_t kernel_start = __pa_symbol(_text);
 	phys_addr_t kernel_end = __pa_symbol(__init_begin);
 	phys_addr_t start, end;
 	phys_addr_t early_kfence_pool;
@@ -683,7 +683,7 @@ static void __init map_mem(pgd_t *pgdp)
 	}
 
 	/*
-	 * Map the linear alias of the [_stext, __init_begin) interval
+	 * Map the linear alias of the [_text, __init_begin) interval
 	 * as non-executable now, and remove the write permission in
 	 * mark_linear_text_alias_ro() below (which will be called after
 	 * alternative patching has completed). This makes the contents
@@ -710,6 +710,10 @@ void mark_rodata_ro(void)
 	WRITE_ONCE(rodata_is_rw, false);
 	update_mapping_prot(__pa_symbol(__start_rodata), (unsigned long)__start_rodata,
 			    section_size, PAGE_KERNEL_RO);
+	/* mark the range between _text and _stext as read only. */
+	update_mapping_prot(__pa_symbol(_text), (unsigned long)_text,
+			    (unsigned long)_stext - (unsigned long)_text,
+			    PAGE_KERNEL_RO);
 }
 
 static void __init declare_vma(struct vm_struct *vma,
@@ -780,7 +784,7 @@ static void __init declare_kernel_vmas(void)
 {
 	static struct vm_struct vmlinux_seg[KERNEL_SEGMENT_COUNT];
 
-	declare_vma(&vmlinux_seg[0], _stext, _etext, VM_NO_GUARD);
+	declare_vma(&vmlinux_seg[0], _text, _etext, VM_NO_GUARD);
 	declare_vma(&vmlinux_seg[1], __start_rodata, __inittext_begin, VM_NO_GUARD);
 	declare_vma(&vmlinux_seg[2], __inittext_begin, __inittext_end, VM_NO_GUARD);
 	declare_vma(&vmlinux_seg[3], __initdata_begin, __initdata_end, VM_NO_GUARD);
-- 
2.51.0


