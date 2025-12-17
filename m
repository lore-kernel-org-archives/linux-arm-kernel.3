Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CDBD6554E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 11:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pepXBqTRObPorUhfu6kwsuA6OQILZDG52wmdCDtRRmE=; b=J6vXhxliTpBEieyM741Kf0v+ho
	0z+MGAN0CheANrOOGSA1d+hAUJN5sBfksSD+4AiwhyDTFl3EV9CyclsbZjWhgYOiamx+PHYRQ1B8p
	q+YzcpKmqUpBcRCboLtCpkfg/QEdx5d14D7SifFBLEfvM1YaN/eCDYoQJBArOBNIPwOBlXYoi35yU
	fc22OBHBhr148v/URUSOVF6p7wWMPAsDI9h9O/rXYR8DAF4/9PGyiMKp5pGQxVS1YePyoOFyKtyCX
	Ncfqh5YnyhniH9PJx+SzahsJljWuKt2+AmpfTnGUj3RiDsFSKLs2JFWPGFtkYUqJk06elA7oTpz+7
	aN/iRnCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVpkF-00000006j6s-0KJ5;
	Wed, 17 Dec 2025 11:31:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVpkC-00000006j5v-32jW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 11:31:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B06B1688;
	Wed, 17 Dec 2025 03:30:52 -0800 (PST)
Received: from e134710.manchester.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 831643F73B;
	Wed, 17 Dec 2025 03:30:57 -0800 (PST)
From: Ahmed Tiba <ahmed.tiba@arm.com>
To: linux-acpi@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: tony.luck@intel.com,
	bp@alien8.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org,
	linux-doc@vger.kernel.org,
	Dmitry.Lamerov@arm.com,
	Michael.Zhao2@arm.com,
	ahmed.tiba@arm.com
Subject: [PATCH 08/12] ghes: add estatus provider ops
Date: Wed, 17 Dec 2025 11:28:41 +0000
Message-ID: <20251217112845.1814119-9-ahmed.tiba@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217112845.1814119-1-ahmed.tiba@arm.com>
References: <20251217112845.1814119-1-ahmed.tiba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_033100_856929_31FADDEB 
X-CRM114-Status: GOOD (  14.60  )
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

Add the estatus_ops implementation that lets GHES present its CPER buffer
through the new core. The helper plugs the existing fixmap read/write code
into the generic callbacks, wires up the acknowledgment path for GHESv2
sources, and exposes the source name/notification attributes. No behaviour
changes yet—the next patch switches the GHES paths over to these hooks.

Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
---
 drivers/acpi/apei/ghes.c | 157 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 157 insertions(+)

diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index 0dc767392a6c..5932542ea942 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -53,6 +53,7 @@
 #include <asm/tlbflush.h>
 #include <cxl/event.h>
 #include <ras/ras_event.h>
+#include <linux/estatus.h>
 
 #include "apei-internal.h"
 
@@ -250,6 +251,8 @@ static void unmap_gen_v2(struct ghes *ghes)
 	apei_unmap_generic_address(&ghes->generic_v2->read_ack_register);
 }
 
+static const struct estatus_ops ghes_estatus_ops;
+
 static void ghes_ack_error(struct acpi_hest_generic_v2 *gv2)
 {
 	int rc;
@@ -276,6 +279,8 @@ static struct ghes *ghes_new(struct acpi_hest_generic *generic)
 		return ERR_PTR(-ENOMEM);
 
 	ghes->generic = generic;
+	scnprintf(ghes->name, sizeof(ghes->name), "GHES source %d",
+		  generic->header.source_id);
 	if (is_hest_type_generic_v2(ghes)) {
 		rc = map_gen_v2(ghes);
 		if (rc)
@@ -299,6 +304,12 @@ static struct ghes *ghes_new(struct acpi_hest_generic *generic)
 		goto err_unmap_status_addr;
 	}
 
+	ghes->estatus_src.ops = &ghes_estatus_ops;
+	ghes->estatus_src.priv = ghes;
+	ghes->estatus_src.estatus = ghes->estatus;
+	ghes->estatus_src.fixmap_idx = FIX_APEI_GHES_IRQ;
+	INIT_LIST_HEAD(&ghes->elist);
+
 	return ghes;
 
 err_unmap_status_addr:
@@ -1844,3 +1855,149 @@ void ghes_unregister_report_chain(struct notifier_block *nb)
 	atomic_notifier_chain_unregister(&ghes_report_chain, nb);
 }
 EXPORT_SYMBOL_GPL(ghes_unregister_report_chain);
+
+#define GHES_ESTATUS_RW_FROM_PHYS	1
+#define GHES_ESTATUS_RW_TO_PHYS		0
+
+static void __iomem *ghes_estatus_map(struct ghes *ghes, u64 pfn,
+				      enum fixed_addresses fixmap_idx)
+{
+	phys_addr_t paddr = PFN_PHYS(pfn);
+	pgprot_t prot = arch_apei_get_mem_attribute(paddr);
+
+	__set_fixmap(fixmap_idx, paddr, prot);
+
+	return (void __iomem *)__fix_to_virt(fixmap_idx);
+}
+
+static void ghes_estatus_unmap(void __iomem *vaddr,
+			       enum fixed_addresses fixmap_idx)
+{
+	int _idx = virt_to_fix((unsigned long)vaddr);
+
+	WARN_ON_ONCE(fixmap_idx != _idx);
+	clear_fixmap(fixmap_idx);
+}
+
+static void ghes_estatus_copy_buffer(struct ghes *ghes, void *buffer,
+				     phys_addr_t paddr, size_t len,
+				     int from_phys,
+				     enum fixed_addresses fixmap_idx)
+{
+	void __iomem *vaddr;
+	u64 offset;
+	u32 chunk;
+
+	while (len > 0) {
+		offset = paddr - (paddr & PAGE_MASK);
+		vaddr = ghes_estatus_map(ghes, PHYS_PFN(paddr), fixmap_idx);
+		chunk = PAGE_SIZE - offset;
+		chunk = min_t(u32, chunk, len);
+		if (from_phys == GHES_ESTATUS_RW_FROM_PHYS)
+			memcpy_fromio(buffer, vaddr + offset, chunk);
+		else
+			memcpy_toio(vaddr + offset, buffer, chunk);
+
+		len -= chunk;
+		paddr += chunk;
+		buffer += chunk;
+		ghes_estatus_unmap(vaddr, fixmap_idx);
+	}
+}
+
+static int ghes_estatus_get_phys(struct estatus_source *source,
+				 phys_addr_t *addr)
+{
+	struct ghes *ghes = source->priv;
+	u64 value = 0;
+	int rc;
+
+	rc = apei_read(&value, &ghes->generic->error_status_address);
+	if (rc)
+		return rc;
+
+	*addr = value;
+	return 0;
+}
+
+static int ghes_estatus_read(struct estatus_source *source, phys_addr_t addr,
+			     void *buf, size_t len,
+			     enum fixed_addresses fixmap_idx)
+{
+	struct ghes *ghes = source->priv;
+
+	ghes_estatus_copy_buffer(ghes, buf, addr, len,
+				 GHES_ESTATUS_RW_FROM_PHYS, fixmap_idx);
+	return 0;
+}
+
+static int ghes_estatus_write(struct estatus_source *source, phys_addr_t addr,
+			      const void *buf, size_t len,
+			      enum fixed_addresses fixmap_idx)
+{
+	struct ghes *ghes = source->priv;
+
+	ghes_estatus_copy_buffer(ghes, (void *)buf, addr, len,
+				 GHES_ESTATUS_RW_TO_PHYS, fixmap_idx);
+	return 0;
+}
+
+static void ghes_estatus_ack(struct estatus_source *source)
+{
+	struct ghes *ghes = source->priv;
+	struct acpi_hest_generic_v2 *gv2;
+	u64 val = 0;
+	int rc;
+
+	if (ghes->generic->header.type != ACPI_HEST_TYPE_GENERIC_ERROR_V2)
+		return;
+
+	gv2 = ghes->generic_v2;
+	rc = apei_read(&val, &gv2->read_ack_register);
+	if (rc)
+		return;
+
+	val &= gv2->read_ack_preserve << gv2->read_ack_register.bit_offset;
+	val |= gv2->read_ack_write << gv2->read_ack_register.bit_offset;
+
+	apei_write(val, &gv2->read_ack_register);
+}
+
+static size_t ghes_estatus_get_max_len(struct estatus_source *source)
+{
+	struct ghes *ghes = source->priv;
+
+	return ghes->generic->error_block_length;
+}
+
+static enum estatus_notify_mode
+ghes_estatus_get_notify_mode(struct estatus_source *source)
+{
+	struct ghes *ghes = source->priv;
+	u8 notify_type = ghes->generic->notify.type;
+
+	if (notify_type == ACPI_HEST_NOTIFY_SEA)
+		return ESTATUS_NOTIFY_SEA;
+
+	return ESTATUS_NOTIFY_ASYNC;
+}
+
+static const char *ghes_estatus_get_name(struct estatus_source *source)
+{
+	struct ghes *ghes = source->priv;
+
+	if (ghes->dev)
+		return dev_name(ghes->dev);
+
+	return ghes->name;
+}
+
+static const struct estatus_ops ghes_estatus_ops = {
+	.get_phys	= ghes_estatus_get_phys,
+	.read		= ghes_estatus_read,
+	.write		= ghes_estatus_write,
+	.ack		= ghes_estatus_ack,
+	.get_max_len	= ghes_estatus_get_max_len,
+	.get_notify_mode = ghes_estatus_get_notify_mode,
+	.get_name	= ghes_estatus_get_name,
+};
-- 
2.43.0


