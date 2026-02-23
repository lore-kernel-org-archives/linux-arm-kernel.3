Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B0DEEC29E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 22:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lk2jKRuiBJT7yz1bWI44iFLgMmGHslXT4HWXfr9PQjI=; b=JsZZ6AjBd80TU+2o7diMj2gJtS
	UovyST5sKKzqPOLD6sAeNsUnFJ8XLqjFL8hqeTjw1OQa6fx+JxgHTC63pi2lx10jA05tdWY6kDkiE
	nVLYfvPGjL8/5kAx2/7sMGxei4Cdxz/uIfDsnAECgZzejwr2EbDGbQv3gJotMWtqiax/CYrgNE+Zj
	VmMMI5YyShym489FCACDmXtsyaDgC3/2aX+BgVBGFmlTGvYWOrUokuIfuJD8tOZcm5tQQYVti/UtO
	A0IfdnYTAAUUz9SGZBv835XBPbGtWpYkBOhbRfvJxpf0z/RFHhP43DWBZcA1/sk6lPyH0KXhUqsue
	wjyVMktw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vue8H-000000015v6-1GUi;
	Mon, 23 Feb 2026 22:10:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vue8D-000000015u2-3e4R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 22:10:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 00DAF60141;
	Mon, 23 Feb 2026 22:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51763C116C6;
	Mon, 23 Feb 2026 22:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771884620;
	bh=hRUAsRV745xMXS8TZv6y/nqPSr37ITEqxiqt3zC+gQc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NI8xxirhH7BmgaUWZVC7Jzw6DKyxjktQciM/EHcIK4Etih2qZqfXaGV50ssE6H+1b
	 JKPGTuFtLP5TYObwoKCiAPGlA+rm0rzupyMTEa/0GX2XtqdcndZ+mbY3qUeMoHRNTY
	 v25cUYitdU5VYg0gqBeCFUrbIhW+/I/WUAtN4OeRvT8vcbyppJG0P8M5wX/XEGl0j7
	 zgZ9jIUlj0WoVc9weTj1gQ8koZXVOsPh1/ncfQeOWGA1sAWcRijIwdr39dO/0vktPK
	 cuuZEFHn8tRnqRjfw+YVVGQRxU3mAGRZzlerCTHIfGWCMGhLmKDPFmsvVa0LXbYTXg
	 Gd3Rd+V8Xt3ng==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	Zeng Heng <zengheng4@huawei.com>,
	Jinjiang Tu <tujinjiang@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 1/2] arm64: io: Rename ioremap_prot() to __ioremap_prot()
Date: Mon, 23 Feb 2026 22:10:10 +0000
Message-ID: <20260223221012.31962-2-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223221012.31962-1-will@kernel.org>
References: <20260223221012.31962-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Rename our ioremap_prot() implementation to __ioremap_prot() and convert
all arch-internal callers over to the new function.

ioremap_prot() remains as a #define to __ioremap_prot() for
generic_access_phys() and will be subsequently extended to handle user
permissions in 'prot'.

Cc: Zeng Heng <zengheng4@huawei.com>
Cc: Jinjiang Tu <tujinjiang@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/io.h | 11 ++++++-----
 arch/arm64/kernel/acpi.c    |  2 +-
 arch/arm64/mm/ioremap.c     |  6 +++---
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
index 83e03abbb2ca..cd2fddfe814a 100644
--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -264,19 +264,20 @@ __iowrite64_copy(void __iomem *to, const void *from, size_t count)
 typedef int (*ioremap_prot_hook_t)(phys_addr_t phys_addr, size_t size,
 				   pgprot_t *prot);
 int arm64_ioremap_prot_hook_register(const ioremap_prot_hook_t hook);
+void __iomem *__ioremap_prot(phys_addr_t phys, size_t size, pgprot_t prot);
 
-#define ioremap_prot ioremap_prot
+#define ioremap_prot __ioremap_prot
 
 #define _PAGE_IOREMAP PROT_DEVICE_nGnRE
 
 #define ioremap_wc(addr, size)	\
-	ioremap_prot((addr), (size), __pgprot(PROT_NORMAL_NC))
+	__ioremap_prot((addr), (size), __pgprot(PROT_NORMAL_NC))
 #define ioremap_np(addr, size)	\
-	ioremap_prot((addr), (size), __pgprot(PROT_DEVICE_nGnRnE))
+	__ioremap_prot((addr), (size), __pgprot(PROT_DEVICE_nGnRnE))
 
 
 #define ioremap_encrypted(addr, size)	\
-	ioremap_prot((addr), (size), PAGE_KERNEL)
+	__ioremap_prot((addr), (size), PAGE_KERNEL)
 
 /*
  * io{read,write}{16,32,64}be() macros
@@ -297,7 +298,7 @@ static inline void __iomem *ioremap_cache(phys_addr_t addr, size_t size)
 	if (pfn_is_map_memory(__phys_to_pfn(addr)))
 		return (void __iomem *)__phys_to_virt(addr);
 
-	return ioremap_prot(addr, size, __pgprot(PROT_NORMAL));
+	return __ioremap_prot(addr, size, __pgprot(PROT_NORMAL));
 }
 
 /*
diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index af90128cfed5..a9d884fd1d00 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -377,7 +377,7 @@ void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
 				prot = __acpi_get_writethrough_mem_attribute();
 		}
 	}
-	return ioremap_prot(phys, size, prot);
+	return __ioremap_prot(phys, size, prot);
 }
 
 /*
diff --git a/arch/arm64/mm/ioremap.c b/arch/arm64/mm/ioremap.c
index b12cbed9b5ad..6eef48ef6278 100644
--- a/arch/arm64/mm/ioremap.c
+++ b/arch/arm64/mm/ioremap.c
@@ -14,8 +14,8 @@ int arm64_ioremap_prot_hook_register(ioremap_prot_hook_t hook)
 	return 0;
 }
 
-void __iomem *ioremap_prot(phys_addr_t phys_addr, size_t size,
-			   pgprot_t pgprot)
+void __iomem *__ioremap_prot(phys_addr_t phys_addr, size_t size,
+			     pgprot_t pgprot)
 {
 	unsigned long last_addr = phys_addr + size - 1;
 
@@ -39,7 +39,7 @@ void __iomem *ioremap_prot(phys_addr_t phys_addr, size_t size,
 
 	return generic_ioremap_prot(phys_addr, size, pgprot);
 }
-EXPORT_SYMBOL(ioremap_prot);
+EXPORT_SYMBOL(__ioremap_prot);
 
 /*
  * Must be called after early_fixmap_init
-- 
2.53.0.371.g1d285c8824-goog


