Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F01606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 03:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2LfGRQtj;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=EdUHF6SF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mw9T2EB/SxtZoCtzyHz1gLKbCKIVEvLwZOs7MyBa88c=; b=2LfGRQtjo/rV8T
	3NmI7fDlFj4cFBn/Qnnb/O9jwPufHY5xZnmC+PyB/CCC82+FBFA9bYeQVhjd1xk/HQGPzwsVEGPvc
	9s7eMVSCC3Q8oAO+8llul0omh0nIO5xaasKrXbTaYYVN0V9YKkdZZQUBPgOa+0PSNbnNeO4bn6IO3
	Zg9wu1uoaacwgt7lSAF97xvn3CmWte/uwIRczIr4/L9emUu2m1V6cvMc/4zeJXdhAw9pg9a8p6fZ5
	lgaqzG+M9OVA1OXZqkfjSHkgOJRaZqUudnDhOTzCydHmIR9Q4DFMzPV6RZyLHsknRXBIf/w92C1kd
	3W/ntu2NXkEjASe3RpHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHCl-00000008H8x-1Xn5;
	Thu, 29 Oct 2026 03:53:31 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHCY-00000008H50-3ZJi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 03:53:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=mw
	9T2EB/SxtZoCtzyHz1gLKbCKIVEvLwZOs7MyBa88c=; b=EdUHF6SFQgaDHU7kPY
	lrnp6kWbhdX7xlB2Hxfnx3rsaYe64ZC7WOGZWuTDY60FpDZX128O30xyHLTBiFfT
	KB6d/Ca5rdiCX7zqwJQC4PNpynWqaEBdQ9F4J5YqMs/dHaH0D7LlA/3QeZZti5Ff
	q92g+3D6Jn40UAgNcDWo7NwA0=
Received: from pc.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCnsSkVw+JqTWv_Cg--.16381S5;
	Thu, 29 Oct 2026 11:53:00 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Hanjun Guo <guohanjun@huawei.com>,
	Tomasz Nowicki <tn@semihalf.com>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	Julien Grall <julien.grall@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 03/20] irqchip/gic-v3: validate MADT records before use
Date: Thu, 29 Oct 2026 11:52:34 +0800
Message-Id: <20261029035253.2333852-4-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029035253.2333852-1-yaojiale02@163.com>
References: <20261029035253.2333852-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgCnsSkVw+JqTWv_Cg--.16381S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxGryxXF43ZF48XrW7Ary7Wrg_yoW5ZryDpF
	4UK3s0yw43tr4agws8Jw4UZFW5Ars2yFZFqFWxCa43Kw4rKryjvFWIvFyYgF1xJF4ruw42
	vr4FqFyUCFW8ZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jw9N3UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRxLhWriwxzjNwAA3c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_205319_314849_2BBE7BC3 
X-CRM114-Status: GOOD (  11.14  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The GICv3 ACPI paths cast generic MADT headers to distributor,
redistributor, and CPU interface records before confirming that the
required fields are present. Truncated records can therefore cause
out-of-bounds field reads while probing or setting up virtualization data.

Validate fixed-size distributor and redistributor records before their
first field access. Use the version-aware GICC minimum size for CPU
interface records so valid entries from older ACPI revisions remain
accepted. Validate the distributor in the version callback, which runs
before the probe callback uses the same record.

Fixes: ffa7d6166a96 ("irqchip/gic-v3: Add ACPI support for GICv3/4 initialization")
Fixes: b70fb7af6715 ("irqchip/gic-v3: ACPI: Add redistributor support via GICC structures")
Fixes: 1839e576968f ("irqchip/gic-v3: Parse and export virtual GIC information")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/irqchip/irq-gic-v3.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 94873646d46f..3d10818593df 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -2301,6 +2301,9 @@ gic_acpi_parse_madt_redist(union acpi_subtable_headers *header,
 			(struct acpi_madt_generic_redistributor *)header;
 	void __iomem *redist_base;
 
+	if (BAD_MADT_ENTRY(redist, end))
+		return -EINVAL;
+
 	redist_base = ioremap(redist->base_address, redist->length);
 	if (!redist_base) {
 		pr_err("Couldn't map GICR region @%llx\n", redist->base_address);
@@ -2327,6 +2330,9 @@ gic_acpi_parse_madt_gicc(union acpi_subtable_headers *header,
 	u32 size = reg == GIC_PIDR2_ARCH_GICv4 ? SZ_64K * 4 : SZ_64K * 2;
 	void __iomem *redist_base;
 
+	if (BAD_MADT_GICC_ENTRY(gicc, end))
+		return -EINVAL;
+
 	/* Neither enabled or online capable means it doesn't exist, skip it */
 	if (!(gicc->flags & (ACPI_MADT_ENABLED | ACPI_MADT_GICC_ONLINE_CAPABLE)))
 		return 0;
@@ -2404,6 +2410,9 @@ static int __init gic_acpi_match_gicc(union acpi_subtable_headers *header,
 	struct acpi_madt_generic_interrupt *gicc =
 				(struct acpi_madt_generic_interrupt *)header;
 
+	if (BAD_MADT_GICC_ENTRY(gicc, end))
+		return -EINVAL;
+
 	/*
 	 * If GICC is enabled and has valid gicr base address, then it means
 	 * GICR base is presented via GICC. The redistributor is only known to
@@ -2450,6 +2459,9 @@ static bool __init acpi_validate_gic_table(struct acpi_subtable_header *header,
 	int count;
 
 	dist = (struct acpi_madt_generic_distributor *)header;
+	if (BAD_MADT_ENTRY(dist, (unsigned long)header + header->length))
+		return false;
+
 	if (dist->version != ape->driver_data)
 		return false;
 
@@ -2469,6 +2481,9 @@ static int __init gic_acpi_parse_virt_madt_gicc(union acpi_subtable_headers *hea
 		(struct acpi_madt_generic_interrupt *)header;
 	static int first_madt = true;
 
+	if (BAD_MADT_GICC_ENTRY(gicc, end))
+		return -EINVAL;
+
 	if (!(gicc->flags &
 	      (ACPI_MADT_ENABLED | ACPI_MADT_GICC_ONLINE_CAPABLE)))
 		return 0;
-- 
2.34.1


