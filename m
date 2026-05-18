Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2101CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 11:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WkpifmK+6ysltA7iqZc9Vq/EKsYw/Kcqu79QR56Dnag=; b=Bc9u8T7tK1ddAxbEX+vhM65vEM
	qlnkQiehq9kOSNj6C0Fhi6zA9DXmeEFSxeUMHXZ7EMBUpxMxUf/XSqZ8J6WuskWDuJCITZX4+GYfP
	Qy08UK1FWGzycQS/lbo9LMqYuLlGCJvB6uuTTgdssfzptUW/GQk8Rx6uvyozkqea6ElcQ4Msg2mH7
	LliutYlt0qDcFjVCey0j4N7XkAEnwtTNvnpe8RG7EzQATnv0kYH3df8rAdZHvqKD9MzkNvJyZ9ILG
	ZZFjs3IZTJIzhY7IoAZaSELipwxp6bcgQOlXSmi0wBwvAkczwYuDfWJNcnfFglfJgW8E69ENVl8RO
	4rGPqHzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwcJ-0000000FWtP-3Wuy;
	Mon, 18 May 2026 11:58:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwcC-0000000FWpQ-3Adq
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 11:58:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=WkpifmK+6ysltA7iqZc9Vq/EKsYw/Kcqu79QR56Dnag=; b=kU64zyRM0DZYI5u+I0dRYoPVFN
	By5Ys6zTUpZqHitxkX4FfksloRWFol+TxZjEM+x9WJom/AcpEYaCK7dpgkq4mjl1b7I/CoW4pzZ8i
	9k7KbJqeLuef9TbcEBVe5XZG8+N2te6NJg62wUy/8GeOR5tPYqmSY8CA32M411NaAh7wdLRPtBJUO
	qjK2IhLd7k0NIeS1d2RWu/ZQZ65/yWOHRlUH7OUPEjf5uFSPg/1OKy4OHGJrMEWqjy5CJH37yfPYs
	7jbvgxxxGXhvQDFizoSKQh40RdaaVYlp3FBHlMmwmaPmrhZLHblIuCqv5+HgBfxCtc6cV11vSJx2t
	GbD9VyLg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwc8-0000000B2EG-0mGk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 11:58:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC4F24660;
	Mon, 18 May 2026 04:58:21 -0700 (PDT)
Received: from e134710.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B34D13F85F;
	Mon, 18 May 2026 04:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779105506; bh=JSh+Q/vHoSFoymgLe3sKdFZMl/TXUZwnf/sWaV43igU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sUhk6MY9+0kEI8+FjC3Kx0lRo1Mq+969qciZXu5IqVTZhWR+C3hScBfndozwi/OnF
	 zxvbK/iyOrcA4AH4VfgdNOfc/4AYD9zlt5pcETpmBPrAFLFokfNfOLJAP/7iLifnEf
	 z0Do0VRIn2uLRXoD7ybrlitoSqxKjVThQWGF0aaI=
From: Ahmed Tiba <ahmed.tiba@arm.com>
Date: Mon, 18 May 2026 12:57:45 +0100
Subject: [PATCH v4 02/10] ACPI: APEI: GHES: move CPER read helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-topics-ahmtib01-ras_ffh_arm_internal_review-v4-2-42698675ba61@arm.com>
References: <20260518-topics-ahmtib01-ras_ffh_arm_internal_review-v4-0-42698675ba61@arm.com>
In-Reply-To: <20260518-topics-ahmtib01-ras_ffh_arm_internal_review-v4-0-42698675ba61@arm.com>
To: rafael@kernel.org, bp@alien8.de, saket.dumbre@intel.com, 
 will@kernel.org, xueshuai@linux.alibaba.com, mchehab@kernel.org, 
 krzk+dt@kernel.org, dave@stgolabs.net, conor+dt@kernel.org, 
 vishal.l.verma@intel.com, jic23@kernel.org, corbet@lwn.net, 
 guohanjun@huawei.com, dave.jiang@intel.com, catalin.marinas@arm.com, 
 lenb@kernel.org, tony.luck@intel.com, skhan@linuxfoundation.org, 
 djbw@kernel.org, alison.schofield@intel.com, ira.weiny@intel.com, 
 robh@kernel.org
Cc: Ahmed Tiba <ahmed.tiba@arm.com>, devicetree@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org, 
 Dmitry.Lamerov@arm.com, linux-cxl@vger.kernel.org, Michael.Zhao2@arm.com, 
 acpica-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779105490; l=11668;
 i=ahmed.tiba@arm.com; s=20260219; h=from:subject:message-id;
 bh=JSh+Q/vHoSFoymgLe3sKdFZMl/TXUZwnf/sWaV43igU=;
 b=OxO040hm0b+3wPjfRGp8dkn+d1oPv0nuoX2ovDWTk7ceySITvcFZmlmnr9YObuPTeGaoUoUPK
 Epd/m55KYZ+A0CWuQAOMXj0SLWBIvG/lWR5CksZ2fPM9uWMCVbXx/YD
X-Developer-Key: i=ahmed.tiba@arm.com; a=ed25519;
 pk=xVOtd+Qklh/4tuM3tB+BEZD4jj5a6W59C3KCNX6v7OE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_125829_026191_CD472A16 
X-CRM114-Status: GOOD (  23.12  )
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

Relocate the CPER buffer mapping, peek, and clear helpers from ghes.c into
ghes_cper.c so they can be shared with other firmware-first providers.
This commit only shuffles code; behavior stays the same.

Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
---
 drivers/acpi/apei/Makefile    |   2 +-
 drivers/acpi/apei/ghes.c      | 166 -----------------------------------
 drivers/acpi/apei/ghes_cper.c | 195 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 196 insertions(+), 167 deletions(-)

diff --git a/drivers/acpi/apei/Makefile b/drivers/acpi/apei/Makefile
index 66588d6be56f..f57f3b009d8e 100644
--- a/drivers/acpi/apei/Makefile
+++ b/drivers/acpi/apei/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_ACPI_APEI)		+= apei.o
-obj-$(CONFIG_ACPI_APEI_GHES)	+= ghes.o
+obj-$(CONFIG_ACPI_APEI_GHES)	+= ghes.o ghes_cper.o
 # clang versions prior to 18 may blow out the stack with KASAN
 ifeq ($(CONFIG_COMPILE_TEST)_$(CONFIG_CC_IS_CLANG)_$(call clang-min-version, 180000),y_y_)
 KASAN_SANITIZE_ghes.o := n
diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index 4f67f46410c4..3f35580e8efd 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -118,26 +118,6 @@ static struct gen_pool *ghes_estatus_pool;
 static struct ghes_estatus_cache __rcu *ghes_estatus_caches[GHES_ESTATUS_CACHES_SIZE];
 static atomic_t ghes_estatus_cache_alloced;
 
-static void __iomem *ghes_map(u64 pfn, enum fixed_addresses fixmap_idx)
-{
-	phys_addr_t paddr;
-	pgprot_t prot;
-
-	paddr = PFN_PHYS(pfn);
-	prot = arch_apei_get_mem_attribute(paddr);
-	__set_fixmap(fixmap_idx, paddr, prot);
-
-	return (void __iomem *) __fix_to_virt(fixmap_idx);
-}
-
-static void ghes_unmap(void __iomem *vaddr, enum fixed_addresses fixmap_idx)
-{
-	int _idx = virt_to_fix((unsigned long)vaddr);
-
-	WARN_ON_ONCE(fixmap_idx != _idx);
-	clear_fixmap(fixmap_idx);
-}
-
 int ghes_estatus_pool_init(unsigned int num_ghes)
 {
 	unsigned long addr, len;
@@ -193,21 +173,6 @@ static void unmap_gen_v2(struct ghes *ghes)
 	apei_unmap_generic_address(&ghes->generic_v2->read_ack_register);
 }
 
-static void ghes_ack_error(struct acpi_hest_generic_v2 *gv2)
-{
-	int rc;
-	u64 val = 0;
-
-	rc = apei_read(&val, &gv2->read_ack_register);
-	if (rc)
-		return;
-
-	val &= gv2->read_ack_preserve << gv2->read_ack_register.bit_offset;
-	val |= gv2->read_ack_write    << gv2->read_ack_register.bit_offset;
-
-	apei_write(val, &gv2->read_ack_register);
-}
-
 struct ghes *ghes_new(struct acpi_hest_generic *generic)
 {
 	struct ghes *ghes;
@@ -280,137 +245,6 @@ static inline int ghes_severity(int severity)
 	}
 }
 
-static void ghes_copy_tofrom_phys(void *buffer, u64 paddr, u32 len,
-				  int from_phys,
-				  enum fixed_addresses fixmap_idx)
-{
-	void __iomem *vaddr;
-	u64 offset;
-	u32 trunk;
-
-	while (len > 0) {
-		offset = paddr - (paddr & PAGE_MASK);
-		vaddr = ghes_map(PHYS_PFN(paddr), fixmap_idx);
-		trunk = PAGE_SIZE - offset;
-		trunk = min(trunk, len);
-		if (from_phys)
-			memcpy_fromio(buffer, vaddr + offset, trunk);
-		else
-			memcpy_toio(vaddr + offset, buffer, trunk);
-		len -= trunk;
-		paddr += trunk;
-		buffer += trunk;
-		ghes_unmap(vaddr, fixmap_idx);
-	}
-}
-
-/* Check the top-level record header has an appropriate size. */
-int __ghes_check_estatus(struct ghes *ghes,
-			 struct acpi_hest_generic_status *estatus)
-{
-	u32 len = cper_estatus_len(estatus);
-	u32 max_len = min(ghes->generic->error_block_length,
-			  ghes->estatus_length);
-
-	if (len < sizeof(*estatus)) {
-		pr_warn_ratelimited(FW_WARN GHES_PFX "Truncated error status block!\n");
-		return -EIO;
-	}
-
-	if (!len || len > max_len) {
-		pr_warn_ratelimited(FW_WARN GHES_PFX "Invalid error status block length!\n");
-		return -EIO;
-	}
-
-	if (cper_estatus_check_header(estatus)) {
-		pr_warn_ratelimited(FW_WARN GHES_PFX "Invalid CPER header!\n");
-		return -EIO;
-	}
-
-	return 0;
-}
-
-/* Read the CPER block, returning its address, and header in estatus. */
-int __ghes_peek_estatus(struct ghes *ghes,
-			struct acpi_hest_generic_status *estatus,
-			u64 *buf_paddr, enum fixed_addresses fixmap_idx)
-{
-	struct acpi_hest_generic *g = ghes->generic;
-	int rc;
-
-	rc = apei_read(buf_paddr, &g->error_status_address);
-	if (rc) {
-		*buf_paddr = 0;
-		pr_warn_ratelimited(FW_WARN GHES_PFX
-				    "Failed to read error status block address for hardware error source: %d.\n",
-				   g->header.source_id);
-		return -EIO;
-	}
-	if (!*buf_paddr)
-		return -ENOENT;
-
-	ghes_copy_tofrom_phys(estatus, *buf_paddr, sizeof(*estatus), 1,
-			      fixmap_idx);
-	if (!estatus->block_status) {
-		*buf_paddr = 0;
-		return -ENOENT;
-	}
-
-	return 0;
-}
-
-int __ghes_read_estatus(struct acpi_hest_generic_status *estatus,
-			u64 buf_paddr, enum fixed_addresses fixmap_idx,
-			size_t buf_len)
-{
-	ghes_copy_tofrom_phys(estatus, buf_paddr, buf_len, 1, fixmap_idx);
-	if (cper_estatus_check(estatus)) {
-		pr_warn_ratelimited(FW_WARN GHES_PFX
-				    "Failed to read error status block!\n");
-		return -EIO;
-	}
-
-	return 0;
-}
-
-int ghes_read_estatus(struct ghes *ghes,
-		      struct acpi_hest_generic_status *estatus,
-		      u64 *buf_paddr, enum fixed_addresses fixmap_idx)
-{
-	int rc;
-
-	rc = __ghes_peek_estatus(ghes, estatus, buf_paddr, fixmap_idx);
-	if (rc)
-		return rc;
-
-	rc = __ghes_check_estatus(ghes, estatus);
-	if (rc)
-		return rc;
-
-	return __ghes_read_estatus(estatus, *buf_paddr, fixmap_idx,
-				   cper_estatus_len(estatus));
-}
-
-void ghes_clear_estatus(struct ghes *ghes,
-			struct acpi_hest_generic_status *estatus,
-			u64 buf_paddr, enum fixed_addresses fixmap_idx)
-{
-	estatus->block_status = 0;
-
-	if (!buf_paddr)
-		return;
-
-	ghes_copy_tofrom_phys(estatus, buf_paddr,
-			      sizeof(estatus->block_status), 0,
-			      fixmap_idx);
-
-	/*
-	 * GHESv2 type HEST entries introduce support for error acknowledgment,
-	 * so only acknowledge the error if this support is present.
-	 */
-	if (is_hest_type_generic_v2(ghes))
-		ghes_ack_error(ghes->generic_v2);
-}
 
 /**
  * struct ghes_task_work - for synchronous RAS event
diff --git a/drivers/acpi/apei/ghes_cper.c b/drivers/acpi/apei/ghes_cper.c
new file mode 100644
index 000000000000..7bb72fe57838
--- /dev/null
+++ b/drivers/acpi/apei/ghes_cper.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Shared GHES helpers for firmware-first CPER error handling.
+ *
+ * This file holds the GHES helper code that is shared by the in-tree GHES
+ * driver and by other firmware-first error sources that reuse the same CPER
+ * handling flow.
+ *
+ * Derived from the ACPI APEI GHES driver.
+ *
+ * Copyright 2010,2011 Intel Corp.
+ *   Author: Huang Ying <ying.huang@intel.com>
+ */
+
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mm.h>
+#include <linux/ratelimit.h>
+#include <linux/slab.h>
+
+#include <acpi/apei.h>
+#include <acpi/ghes_cper.h>
+
+#include <asm/fixmap.h>
+#include <asm/tlbflush.h>
+
+#include "apei-internal.h"
+
+static void __iomem *ghes_map(u64 pfn, enum fixed_addresses fixmap_idx)
+{
+	phys_addr_t paddr;
+	pgprot_t prot;
+
+	paddr = PFN_PHYS(pfn);
+	prot = arch_apei_get_mem_attribute(paddr);
+	__set_fixmap(fixmap_idx, paddr, prot);
+
+	return (void __iomem *) __fix_to_virt(fixmap_idx);
+}
+
+static void ghes_unmap(void __iomem *vaddr, enum fixed_addresses fixmap_idx)
+{
+	int _idx = virt_to_fix((unsigned long)vaddr);
+
+	WARN_ON_ONCE(fixmap_idx != _idx);
+	clear_fixmap(fixmap_idx);
+}
+
+static void ghes_ack_error(struct acpi_hest_generic_v2 *gv2)
+{
+	int rc;
+	u64 val = 0;
+
+	rc = apei_read(&val, &gv2->read_ack_register);
+	if (rc)
+		return;
+
+	val &= gv2->read_ack_preserve << gv2->read_ack_register.bit_offset;
+	val |= gv2->read_ack_write    << gv2->read_ack_register.bit_offset;
+
+	apei_write(val, &gv2->read_ack_register);
+}
+
+static void ghes_copy_tofrom_phys(void *buffer, u64 paddr, u32 len,
+				  int from_phys,
+				  enum fixed_addresses fixmap_idx)
+{
+	void __iomem *vaddr;
+	u64 offset;
+	u32 trunk;
+
+	while (len > 0) {
+		offset = paddr - (paddr & PAGE_MASK);
+		vaddr = ghes_map(PHYS_PFN(paddr), fixmap_idx);
+		trunk = PAGE_SIZE - offset;
+		trunk = min(trunk, len);
+		if (from_phys)
+			memcpy_fromio(buffer, vaddr + offset, trunk);
+		else
+			memcpy_toio(vaddr + offset, buffer, trunk);
+		len -= trunk;
+		paddr += trunk;
+		buffer += trunk;
+		ghes_unmap(vaddr, fixmap_idx);
+	}
+}
+
+/* Check the top-level record header has an appropriate size. */
+int __ghes_check_estatus(struct ghes *ghes,
+			 struct acpi_hest_generic_status *estatus)
+{
+	u32 len = cper_estatus_len(estatus);
+	u32 max_len = min(ghes->generic->error_block_length,
+			  ghes->estatus_length);
+
+	if (len < sizeof(*estatus)) {
+		pr_warn_ratelimited(FW_WARN GHES_PFX "Truncated error status block!\n");
+		return -EIO;
+	}
+
+	if (!len || len > max_len) {
+		pr_warn_ratelimited(FW_WARN GHES_PFX "Invalid error status block length!\n");
+		return -EIO;
+	}
+
+	if (cper_estatus_check_header(estatus)) {
+		pr_warn_ratelimited(FW_WARN GHES_PFX "Invalid CPER header!\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+/* Read the CPER block, returning its address, and header in estatus. */
+int __ghes_peek_estatus(struct ghes *ghes,
+			struct acpi_hest_generic_status *estatus,
+			u64 *buf_paddr, enum fixed_addresses fixmap_idx)
+{
+	struct acpi_hest_generic *g = ghes->generic;
+	int rc;
+
+	rc = apei_read(buf_paddr, &g->error_status_address);
+	if (rc) {
+		*buf_paddr = 0;
+		pr_warn_ratelimited(FW_WARN GHES_PFX
+				    "Failed to read error status block address for hardware error source: %d.\n",
+				   g->header.source_id);
+		return -EIO;
+	}
+	if (!*buf_paddr)
+		return -ENOENT;
+
+	ghes_copy_tofrom_phys(estatus, *buf_paddr, sizeof(*estatus), 1,
+			      fixmap_idx);
+	if (!estatus->block_status) {
+		*buf_paddr = 0;
+		return -ENOENT;
+	}
+
+	return 0;
+}
+
+int __ghes_read_estatus(struct acpi_hest_generic_status *estatus,
+			u64 buf_paddr, enum fixed_addresses fixmap_idx,
+			size_t buf_len)
+{
+	ghes_copy_tofrom_phys(estatus, buf_paddr, buf_len, 1, fixmap_idx);
+	if (cper_estatus_check(estatus)) {
+		pr_warn_ratelimited(FW_WARN GHES_PFX
+				    "Failed to read error status block!\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+int ghes_read_estatus(struct ghes *ghes,
+		      struct acpi_hest_generic_status *estatus,
+		      u64 *buf_paddr, enum fixed_addresses fixmap_idx)
+{
+	int rc;
+
+	rc = __ghes_peek_estatus(ghes, estatus, buf_paddr, fixmap_idx);
+	if (rc)
+		return rc;
+
+	rc = __ghes_check_estatus(ghes, estatus);
+	if (rc)
+		return rc;
+
+	return __ghes_read_estatus(estatus, *buf_paddr, fixmap_idx,
+				   cper_estatus_len(estatus));
+}
+
+void ghes_clear_estatus(struct ghes *ghes,
+			struct acpi_hest_generic_status *estatus,
+			u64 buf_paddr, enum fixed_addresses fixmap_idx)
+{
+	estatus->block_status = 0;
+
+	if (!buf_paddr)
+		return;
+
+	ghes_copy_tofrom_phys(estatus, buf_paddr,
+			      sizeof(estatus->block_status), 0,
+			      fixmap_idx);
+
+	/*
+	 * GHESv2 type HEST entries introduce support for error acknowledgment,
+	 * so only acknowledge the error if this support is present.
+	 */
+	if (is_hest_type_generic_v2(ghes))
+		ghes_ack_error(ghes->generic_v2);
+}

-- 
2.43.0


