Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EDBCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAQOjPEVWA2TfccVf2/HZW3u6cEXsOTsgM/h72fP/80=; b=teSwK0czRqsIBWtx+79+h9zUu1
	2MjZnl0iPYn8N9I8/XJYjfPFQcmJL7FBvX2GD/1ipzj6n7b/au0EGBh/MyoKJVsSM1gza5wo3chMp
	Yo5er6by+QOpViJoskd5MHHk8pEaxLBD3ErUgfHYxVZfM9wU5qfAXfe2Td17cbrhdh56/vVJwhhET
	CMEe/6F/wdJkuTpM+xK8NcLX60P81lYSbvakjJzBbLTscW9zyhWuoCfHXJO4FOWq+KnCXDEJkouql
	sHEl/WgFbDTS8o+VM4iDibPPFCT0NVhYuI3dN/62RFOe6xK2iu01v1VTagYFa5LiWfDmo0x4xDOE6
	qPu6LAdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo05p-00000007YJf-1dCY;
	Mon, 18 Aug 2025 13:40:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unvx1-000000071tU-1KPd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 09:14:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5ACA1424;
	Mon, 18 Aug 2025 02:14:38 -0700 (PDT)
Received: from a076716.blr.arm.com (a076716.blr.arm.com [10.164.21.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9A21E3F58B;
	Mon, 18 Aug 2025 02:14:44 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC 1/3] arm64/ptdump: Re-organize ptdump_init()
Date: Mon, 18 Aug 2025 14:44:34 +0530
Message-Id: <20250818091436.938517-2-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250818091436.938517-1-anshuman.khandual@arm.com>
References: <20250818091436.938517-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_021447_470406_58D1BE53 
X-CRM114-Status: GOOD (  13.34  )
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

Split ptdump_debugfs_register() from ptdump_init() which there after can be
called early on during the boot and also enable dump kernel page table when
required. While here rename ptdump_init() as ptdump_debugfs_init() to avoid
name space collision.

Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/ptdump.h    | 2 ++
 arch/arm64/kernel/setup.c          | 2 ++
 arch/arm64/mm/ptdump.c             | 8 ++++++--
 drivers/firmware/efi/arm-runtime.c | 4 ++--
 4 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
index fded5358641f..27e774134e7f 100644
--- a/arch/arm64/include/asm/ptdump.h
+++ b/arch/arm64/include/asm/ptdump.h
@@ -57,6 +57,7 @@ struct ptdump_pg_state {
 	unsigned long uxn_pages;
 };
 
+void __init ptdump_init(void);
 void ptdump_walk(struct seq_file *s, struct ptdump_info *info);
 void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
 	       pteval_t val);
@@ -74,6 +75,7 @@ static inline void ptdump_debugfs_register(struct ptdump_info *info,
 					   const char *name) { }
 #endif /* CONFIG_PTDUMP_DEBUGFS */
 #else
+static inline void __init ptdump_init(void) { }
 static inline void note_page(struct ptdump_state *pt_st, unsigned long addr,
 			     int level, pteval_t val) { }
 static inline void note_page_pte(struct ptdump_state *st, unsigned long addr, pte_t pte) { }
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 77c7926a4df6..0a3812c8e177 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -43,6 +43,7 @@
 #include <asm/cpu_ops.h>
 #include <asm/kasan.h>
 #include <asm/numa.h>
+#include <asm/ptdump.h>
 #include <asm/rsi.h>
 #include <asm/scs.h>
 #include <asm/sections.h>
@@ -332,6 +333,7 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
 	arm64_memblock_init();
 
 	paging_init();
+	ptdump_init();
 
 	acpi_table_upgrade();
 
diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
index 421a5de806c6..7c42be62898b 100644
--- a/arch/arm64/mm/ptdump.c
+++ b/arch/arm64/mm/ptdump.c
@@ -367,7 +367,7 @@ bool ptdump_check_wx(void)
 	}
 }
 
-static int __init ptdump_init(void)
+void __init ptdump_init(void)
 {
 	u64 page_offset = _PAGE_OFFSET(vabits_actual);
 	u64 vmemmap_start = (u64)virt_to_page((void *)page_offset);
@@ -396,7 +396,11 @@ static int __init ptdump_init(void)
 	kernel_ptdump_info.base_addr = page_offset;
 
 	ptdump_initialize();
+}
+
+static int __init ptdump_debugfs_init(void)
+{
 	ptdump_debugfs_register(&kernel_ptdump_info, "kernel_page_tables");
 	return 0;
 }
-device_initcall(ptdump_init);
+device_initcall(ptdump_debugfs_init);
diff --git a/drivers/firmware/efi/arm-runtime.c b/drivers/firmware/efi/arm-runtime.c
index 83092d93f36a..3c84e84dc6ea 100644
--- a/drivers/firmware/efi/arm-runtime.c
+++ b/drivers/firmware/efi/arm-runtime.c
@@ -38,14 +38,14 @@ static struct ptdump_info efi_ptdump_info = {
 	.base_addr	= 0,
 };
 
-static int __init ptdump_init(void)
+static int __init ptdump_debugfs_init(void)
 {
 	if (efi_enabled(EFI_RUNTIME_SERVICES))
 		ptdump_debugfs_register(&efi_ptdump_info, "efi_page_tables");
 
 	return 0;
 }
-device_initcall(ptdump_init);
+device_initcall(ptdump_debugfs_init);
 
 #endif
 
-- 
2.25.1


