Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C30CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1LT/Mb/Sfs44X9B8Ig0vb/HJTQO30W2MOyUxAtXASeU=; b=XUVz+lY0HQwQ2yTpUWK/Y2h7IV
	6tocDt1FDGBFkAvCdvoUw9twSizIxZFzBezEsiL8NMEUab6Y5cszL1qdvn4K7axiwdRCFX+QGUHzb
	a+YrXqC0nmWzdUJOnS8Gig4f1zlRC69yOwCTjTWlLGcxKjxB2s8nnkmjeyNrkH2FiZa84heWk0bTz
	M1VWaANvkcYDESnK3CiQCR7vtj5XKiO6fUfAEZNDXZdJAWI2lVmLbaZH6keKq25zKaPN4eTGvR1I/
	idCAkC57ssOw6zZNxck0oJXUtSD4qDB2kB2ilU3/GrJZUbu/fp9CAtMoJMu9juXMp1j/N86exTcpb
	kjms6irQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo05v-00000007YRt-0zux;
	Mon, 18 Aug 2025 13:40:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unvx7-000000071ug-136F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 09:14:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AFA31424;
	Mon, 18 Aug 2025 02:14:44 -0700 (PDT)
Received: from a076716.blr.arm.com (a076716.blr.arm.com [10.164.21.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 60BC93F58B;
	Mon, 18 Aug 2025 02:14:50 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC 3/3] arm64/ptdump: Add ARM64_PTDUMP_CONSOLE
Date: Mon, 18 Aug 2025 14:44:36 +0530
Message-Id: <20250818091436.938517-4-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250818091436.938517-1-anshuman.khandual@arm.com>
References: <20250818091436.938517-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_021453_428014_EE7ADEC2 
X-CRM114-Status: GOOD (  12.28  )
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

Enable early kernel page table dump for debug purpose when required via new
config ARM64_PDUMP_CONSOLE. This calls existing ptdump_walk() early on just
after ptdump has been initialized with ptdump_init().

Suggested-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/Kconfig.debug        | 12 ++++++++++++
 arch/arm64/include/asm/ptdump.h |  7 +++++++
 arch/arm64/kernel/setup.c       |  1 +
 arch/arm64/mm/ptdump.c          |  7 +++++++
 4 files changed, 27 insertions(+)

diff --git a/arch/arm64/Kconfig.debug b/arch/arm64/Kconfig.debug
index 265c4461031f..0f8af0dd0f4c 100644
--- a/arch/arm64/Kconfig.debug
+++ b/arch/arm64/Kconfig.debug
@@ -20,4 +20,16 @@ config ARM64_RELOC_TEST
 	depends on m
 	tristate "Relocation testing module"
 
+config ARM64_PTDUMP_CONSOLE
+	bool "Dump early kernel page table"
+	depends on DEBUG_KERNEL
+	depends on ARCH_HAS_PTDUMP
+	select PTDUMP
+	help
+	  Enable this option to dump early kernel page table entries during
+	  boot using the PTDUMP framework. This helps in examining kernel's
+	  page table mapping entries and their attributes etc.
+
+	  If in doubt, say N.
+
 source "drivers/hwtracing/coresight/Kconfig"
diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
index 27e774134e7f..81dc53ca9643 100644
--- a/arch/arm64/include/asm/ptdump.h
+++ b/arch/arm64/include/asm/ptdump.h
@@ -74,8 +74,15 @@ void __init ptdump_debugfs_register(struct ptdump_info *info, const char *name);
 static inline void ptdump_debugfs_register(struct ptdump_info *info,
 					   const char *name) { }
 #endif /* CONFIG_PTDUMP_DEBUGFS */
+
+#ifdef CONFIG_ARM64_PTDUMP_CONSOLE
+void __init arm64_kernel_pgtable_dump(void);
+#else
+static inline void __init arm64_kernel_pgtable_dump(void) { }
+#endif /* CONFIG_ARM64_PTDUMP_CONSOLE */
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
index c78e6b496dea..f6d22462add6 100644
--- a/arch/arm64/mm/ptdump.c
+++ b/arch/arm64/mm/ptdump.c
@@ -407,6 +407,13 @@ void __init ptdump_init(void)
 	ptdump_initialize();
 }
 
+#ifdef CONFIG_ARM64_PTDUMP_CONSOLE
+void __init arm64_kernel_pgtable_dump(void)
+{
+	ptdump_walk(CONSOLE, &kernel_ptdump_info);
+}
+#endif
+
 static int __init ptdump_debugfs_init(void)
 {
 	ptdump_debugfs_register(&kernel_ptdump_info, "kernel_page_tables");
-- 
2.25.1


