Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7A5CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 09:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vivi74geGDm8fm6sz0ZcrWx3L8lpvsJ6P5k+1K6PnLQ=; b=fAULxQpfzXaTetMUAFLY3sru1p
	F+xj0XLlZg/75iM7wAkla8ZBTY8uHXDbzx4ALdJ1OD343NW5DVTKanJhb4seItk0sV3L1fPaHRvpl
	0uim9yNbtzw5r2l2+fjfu+BjvPKCvK9QQVGNLpR2iRG16t06LaiE06QMfDcTgf+SjLDgQDnMbubF3
	fJpkJElq5cjKAmhtTmJelaxSY4GPpwtboOjbaTi7EUzEbTePo9xF5X62eg5W2Eh6Nu9qeJN0BujRq
	G8Gp3dyz+hdWIRCyn8FRXo847HFYh6iIHsI0GVvVS1vYhIsJvRthfb50UxsD9TbDZFGzGX958axW0
	0w9hOfTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHPm-0000000DK87-3tP7;
	Wed, 10 Sep 2025 09:46:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHPl-0000000DK77-3Xca
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 10 Sep 2025 09:46:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Vivi74geGDm8fm6sz0ZcrWx3L8lpvsJ6P5k+1K6PnLQ=; b=Ex8tnBIDU0u4lS69hPHI2r4CBs
	pBWnhsjK5TFUu6hzCBm2NKtvHuVkMMx1epn1X4vm+5F/NQ2+eQe4KZrk9+IddvKhYRGI6GtrBp7sl
	DNYQMYq2bHtYPverr7ZFtU9FY8JPYOf+gbJ1+rNS5sjrSPXzqnOfbgpjOssrKBLo3lmGhk/vldwlj
	vIj44/dC+jUWG1gZVAukLPrchWjSywj9qWyZ5TRtTD09vRONj18+H08du5x4b6k/9qJAs8VUvQ2Qe
	VPIeB2XYaaV8m2qIXs5y0hL7mqtrMXc/Mks4nG/YKp+6wko9kEAq1md6iLU1jeU6b45MAMrTxdPrt
	4IMWxtEw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHPi-00000005okP-2ONy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 09:46:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B328D16F8;
	Wed, 10 Sep 2025 02:46:43 -0700 (PDT)
Received: from a076716.blr.arm.com (a076716.blr.arm.com [10.164.21.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8AE313F63F;
	Wed, 10 Sep 2025 02:46:46 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH 3/3] arm64/ptdump: Add 'early_ptdump' kernel command line option
Date: Wed, 10 Sep 2025 15:16:23 +0530
Message-Id: <20250910094623.2356282-4-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250910094623.2356282-1-anshuman.khandual@arm.com>
References: <20250910094623.2356282-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_104654_985678_5AA56CDE 
X-CRM114-Status: GOOD (  14.13  )
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

Enable kernel pgtable dump during boot via a new kernel command line option
'early_ptdump'. This calls ptdump_walk() during boot right after ptdump has
been initialized with ptdump_init().

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Suggested-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  4 ++++
 arch/arm64/include/asm/ptdump.h                 |  2 ++
 arch/arm64/kernel/setup.c                       |  1 +
 arch/arm64/mm/ptdump.c                          | 16 ++++++++++++++++
 4 files changed, 23 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 747a55abf494..f8e916750e2e 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1295,6 +1295,10 @@
 			Enable debug messages in early_ioremap support. This
 			is useful for tracking down temporary early mappings
 			which are not unmapped.
+	early_ptdump[=on]
+			Enable kernel page table dump during boot in current
+			ptdump format. This helps analyze early boot mapping
+			kernel regions.
 
 	earlycon=	[KNL,EARLY] Output early console device and options.
 
diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
index 27e774134e7f..ed30d25ca9de 100644
--- a/arch/arm64/include/asm/ptdump.h
+++ b/arch/arm64/include/asm/ptdump.h
@@ -74,8 +74,10 @@ void __init ptdump_debugfs_register(struct ptdump_info *info, const char *name);
 static inline void ptdump_debugfs_register(struct ptdump_info *info,
 					   const char *name) { }
 #endif /* CONFIG_PTDUMP_DEBUGFS */
+void __init arm64_kernel_pgtable_dump(void);
 #else
 static inline void __init ptdump_init(void) { }
+static inline void __init arm64_kernel_pgtable_dump(void) { }
 static inline void note_page(struct ptdump_state *pt_st, unsigned long addr,
 			     int level, pteval_t val) { }
 static inline void note_page_pte(struct ptdump_state *st, unsigned long addr, pte_t pte) { }
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 0a3812c8e177..86bf7607d304 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -361,6 +361,7 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
 	init_bootcpu_ops();
 	smp_init_cpus();
 	smp_build_mpidr_hash();
+	arm64_kernel_pgtable_dump();
 
 #ifdef CONFIG_ARM64_SW_TTBR0_PAN
 	/*
diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
index c78e6b496dea..1624be5160e4 100644
--- a/arch/arm64/mm/ptdump.c
+++ b/arch/arm64/mm/ptdump.c
@@ -407,6 +407,22 @@ void __init ptdump_init(void)
 	ptdump_initialize();
 }
 
+static bool early_ptdump __initdata;
+
+static int __init parse_early_ptdump(char *arg)
+{
+	if (strcmp(arg, "on") == 0)
+		early_ptdump = true;
+	return 0;
+}
+early_param("early_ptdump", parse_early_ptdump);
+
+void __init arm64_kernel_pgtable_dump(void)
+{
+	if (early_ptdump)
+		ptdump_walk(CONSOLE, &kernel_ptdump_info);
+}
+
 static int __init ptdump_debugfs_init(void)
 {
 	ptdump_debugfs_register(&kernel_ptdump_info, "kernel_page_tables");
-- 
2.25.1


