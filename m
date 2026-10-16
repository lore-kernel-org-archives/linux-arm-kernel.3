Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CA1CCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 14:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYrfBARzjSJRwgwnu3KNkkTr5qVQ7Erdz8gVXYHy7jU=; b=bI9IkyTl3587OIvKbf/+fC6foA
	i9lPMTBkrNbRSRCe7Fs49eb4vEyK2TqhmEEaY8WVf+4lhm5Z/itlEubc5qVt9Uq2p6kfJEHRUAcLX
	6ONf7TJNwkcHDqF6NGE+AxCwqJ9sYcsaJWJD18KeCZfzXk4pAfWeNSzvbWO/D9AEant5Yivk2q/Ay
	Ovb6IYN5lrdnlZSJQ2jkt06bFGMawJa0YkHPNSHOqLFADrA2wnSazRqZ7h47QAYgZq0x+kEZjHaJ0
	4Csgc6CSCkGsBhL9DQLVcqIHRyNYlcOWWAaXruvmQ7cfhSeO20QT72x6Ieh/tXjQT3j4LjW1NWUqr
	8WNDJYPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHihX-0000000376b-0rNc;
	Fri, 16 Oct 2026 14:14:27 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHihT-0000000373Q-32Yy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 14:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=vY
	rfBARzjSJRwgwnu3KNkkTr5qVQ7Erdz8gVXYHy7jU=; b=eBLD4gdMcEjnkWBKpr
	rTE2HBiX9dpgOVTvIpCS2zCPomXN0xbg8Mvv636iWwL40SapC7s1+2X2g4Tf/81Q
	CM3gHZ1xHGeHkGBnezF8rJjoh4D3K/dn5N1zJ1wxnC2M+i7WmRVzwxIbtEp+Eb+z
	EkJsxy7+gXiqqz3A7gxAonUww=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3NysnMdJq1dUUAg--.27711S5;
	Fri, 16 Oct 2026 22:14:03 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 3/6] irqchip/gic-v3: validate MADT records before use
Date: Fri, 16 Oct 2026 22:13:54 +0800
Message-Id: <20261016141357.2793046-4-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016141357.2793046-1-yaojiale02@163.com>
References: <20261016141357.2793046-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3NysnMdJq1dUUAg--.27711S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxGryxWF45tryxCw18ury7GFg_yoW5Aw4xpF
	4UKF90kw43trWSqr48Jw45Zay5Jw4IyF9FqFWxC343Kw45KrWjvFWI9Fya9Fn7JF48ua12
	vr4FqayUCF48A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z_zVbPUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8Aul32rSMSurZwAA3v
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_071424_741584_825735BB 
X-CRM114-Status: GOOD (  10.94  )
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

The GICv3 ACPI paths cast generic MADT headers to distributor,
redistributor, and CPU interface records before confirming that the
corresponding fixed-size structures are present. Truncated records can
therefore cause out-of-bounds field reads while probing or setting up
virtualization data.

Check each typed MADT record before its first field access. Also reject
a short distributor record in the version validator, which runs before
the probe callback.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/irqchip/irq-gic-v3.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 6e1fa5b247fc..0588d6d83b31 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -2299,6 +2299,9 @@ gic_acpi_parse_madt_redist(union acpi_subtable_headers *header,
 			(struct acpi_madt_generic_redistributor *)header;
 	void __iomem *redist_base;
 
+	if (BAD_MADT_ENTRY(redist, end))
+		return -EINVAL;
+
 	redist_base = ioremap(redist->base_address, redist->length);
 	if (!redist_base) {
 		pr_err("Couldn't map GICR region @%llx\n", redist->base_address);
@@ -2325,6 +2328,9 @@ gic_acpi_parse_madt_gicc(union acpi_subtable_headers *header,
 	u32 size = reg == GIC_PIDR2_ARCH_GICv4 ? SZ_64K * 4 : SZ_64K * 2;
 	void __iomem *redist_base;
 
+	if (BAD_MADT_ENTRY(gicc, end))
+		return -EINVAL;
+
 	/* Neither enabled or online capable means it doesn't exist, skip it */
 	if (!(gicc->flags & (ACPI_MADT_ENABLED | ACPI_MADT_GICC_ONLINE_CAPABLE)))
 		return 0;
@@ -2391,6 +2397,9 @@ static int __init gic_acpi_match_gicc(union acpi_subtable_headers *header,
 	struct acpi_madt_generic_interrupt *gicc =
 				(struct acpi_madt_generic_interrupt *)header;
 
+	if (BAD_MADT_ENTRY(gicc, end))
+		return -EINVAL;
+
 	/*
 	 * If GICC is enabled and has valid gicr base address, then it means
 	 * GICR base is presented via GICC. The redistributor is only known to
@@ -2437,6 +2446,9 @@ static bool __init acpi_validate_gic_table(struct acpi_subtable_header *header,
 	int count;
 
 	dist = (struct acpi_madt_generic_distributor *)header;
+	if (header->length < sizeof(*dist))
+		return false;
+
 	if (dist->version != ape->driver_data)
 		return false;
 
@@ -2457,6 +2469,9 @@ static int __init gic_acpi_parse_virt_madt_gicc(union acpi_subtable_headers *hea
 	int maint_irq_mode;
 	static int first_madt = true;
 
+	if (BAD_MADT_ENTRY(gicc, end))
+		return -EINVAL;
+
 	if (!(gicc->flags &
 	      (ACPI_MADT_ENABLED | ACPI_MADT_GICC_ONLINE_CAPABLE)))
 		return 0;
@@ -2547,6 +2562,9 @@ gic_acpi_init(union acpi_subtable_headers *header, const unsigned long end)
 
 	/* Get distributor base address */
 	dist = (struct acpi_madt_generic_distributor *)header;
+	if (BAD_MADT_ENTRY(dist, end))
+		return -EINVAL;
+
 	acpi_data.dist_base = ioremap(dist->base_address,
 				      ACPI_GICV3_DIST_MEM_SIZE);
 	if (!acpi_data.dist_base) {
-- 
2.34.1


