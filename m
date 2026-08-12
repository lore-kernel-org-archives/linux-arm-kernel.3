Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11B8C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 09:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6pTgz0DwXr00MMfnrP29fVFPwkvrVf5WWN8ziQhZvNw=; b=kuRgS8DC6Tz0ukG2vVADhQ/Yvv
	tHO8vV8uThGYbSl7C7dSKSDAKQvUOrX2ZKhezX02nT4xEUfHDwCcVpcfj21F0MD0RwESywB+M8wET
	Ogmk6nPMdRwv/n20c27sPGshh95m6TAnD/FgSleQRVQTZ/KmP7fmRBMsWXWpomlPwzmA6GEH0HWqs
	WzCBb3daD9c+sXxPwjO4rpvqnCTU3JPSX9luVFh3NMV7c3nWbm1F13kEKQvRLhM/OxNGE6IYs0NJx
	RntVUOrgp8SOgr/yty909OTwSVRFMXGi9ZcRM0NIHXpjcevVHoGFW+6ybMy4B8uqDqhn2GXF1rLjr
	LiJuIg/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4zg-0000000Fhfr-2MjC;
	Wed, 12 Aug 2026 09:11:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4zP-0000000FhWS-1Tle
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 09:11:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7CE6F60DC0;
	Wed, 12 Aug 2026 09:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED0DE1F00A3D;
	Wed, 12 Aug 2026 09:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786525870;
	bh=6pTgz0DwXr00MMfnrP29fVFPwkvrVf5WWN8ziQhZvNw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bHWaS+pe+PGo4w02tTxnqsEfAcujAyPCKixf0RwpPhU+bRLQukzY/CXJ+9gvxaawG
	 bucgvPGs+vNJkJ31JbdaZV6U6eQLoqe7/927QZ40A1udLxucbwWRb3Vx1a95w9Ve/b
	 XGUJSkCoZyNmIAH72gjbSZ3hfkKqODX9GaMxJQ3DiOXEQGRl+NkSE/iNAIqzYEBqmd
	 0CkZUxdnd/UTmHDPFCzRxYvIBlgjuxzhTz58fhhIOiiDVjKdcNuIb2wGplmlQT83pj
	 +WI1U7bnCdvW0UOmz+8Lyarg0l4D3pKUDi7c7LF00QRLxI36YjBfJ0TCA4rf1SyOke
	 yApQA0gaU176w==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Wed, 12 Aug 2026 11:10:33 +0200
Subject: [PATCH 5/7] irqchip/gic-v5: Release IRS iomem region on driver
 init failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-gicv5-7-2-fixes-v1-5-3743e82c69a4@kernel.org>
References: <20260812-gicv5-7-2-fixes-v1-0-3743e82c69a4@kernel.org>
In-Reply-To: <20260812-gicv5-7-2-fixes-v1-0-3743e82c69a4@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Jonathan Cameron <jic23@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>
Cc: Sascha Bischoff <Sascha.Bischoff@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15.2
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

In gicv5_irs_of_init(), an IRS is set-up using of_io_request_and_map() to
request its memory region (corresponding to the configuration frame) and
map the IRS configuration frame.

On gicv5_irs_of_init() failure, the driver unmaps the IRS iomem region but
does not release the requested memory region leaving it allocated in the
iomem resource tree.

Fix it by releasing the iomem region on gicv5_irs_of_init() probe failure.

Likewise, on both OF and ACPI driver init failure, IRS iomem regions are
requested but never released in gicv5_irs_remove().

Stash a copy of the IRS iomem region in a struct resource in
struct gicv5_irs_chip_data and use it to release the requested region in
gicv5_irs_remove() if the driver probe fails.

Fixes: 5cb1b6dab2de ("irqchip/gic-v5: Add GICv5 IRS/SPI support")
Fixes: 35866efa52fe ("irqchip/gic-v5: Add ACPI IRS probing")
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Link: https://sashiko.dev/#/message/20260810104747.E5CE71F000E9%40smtp.kernel.org
---
 drivers/irqchip/irq-gic-v5-irs.c   | 10 ++++++++++
 include/linux/irqchip/arm-gic-v5.h |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
index 9d25ce8bfd8c..86da9f82a7b0 100644
--- a/drivers/irqchip/irq-gic-v5-irs.c
+++ b/drivers/irqchip/irq-gic-v5-irs.c
@@ -740,6 +740,7 @@ static int __init gicv5_irs_init(struct gicv5_irs_chip_data *irs_data)
 static int __init gicv5_irs_of_init(struct device_node *node)
 {
 	struct gicv5_irs_chip_data *irs_data;
+	struct resource res;
 	void __iomem *irs_base;
 	u8 iaffid_bits;
 	u32 idr;
@@ -757,6 +758,11 @@ static int __init gicv5_irs_of_init(struct device_node *node)
 		goto out_err;
 	}
 
+	if (of_address_to_resource(node, ret, &res)) {
+		ret = -EINVAL;
+		goto out_err;
+	}
+
 	irs_base = of_io_request_and_map(node, ret, of_node_full_name(node));
 	if (IS_ERR(irs_base)) {
 		pr_err("%pOF: unable to map GICv5 IRS registers\n", node);
@@ -765,6 +771,7 @@ static int __init gicv5_irs_of_init(struct device_node *node)
 	}
 
 	irs_data->fwnode = of_fwnode_handle(node);
+	irs_data->res = res;
 	gicv5_irs_init_bases(irs_data, irs_base, of_property_read_bool(node, "dma-noncoherent"));
 
 	idr = irs_readl_relaxed(irs_data, GICV5_IRS_IDR1);
@@ -794,6 +801,7 @@ static int __init gicv5_irs_of_init(struct device_node *node)
 	gicv5_irs_clear_affinity(irs_data);
 	gicv5_irs_disable(irs_data);
 	iounmap(irs_base);
+	release_mem_region(res.start, resource_size(&res));
 out_err:
 	kfree(irs_data);
 	return ret;
@@ -810,6 +818,7 @@ void __init gicv5_irs_remove(void)
 		gicv5_irs_clear_affinity(irs_data);
 		gicv5_irs_disable(irs_data);
 		iounmap(irs_data->irs_base);
+		release_mem_region(irs_data->res.start, resource_size(&irs_data->res));
 		list_del(&irs_data->entry);
 		kfree(irs_data);
 	}
@@ -958,6 +967,7 @@ static int __init gic_acpi_parse_madt_irs(union acpi_subtable_headers *header,
 	}
 
 	gicv5_irs_init_bases(irs_data, irs_base, irs->flags & ACPI_MADT_IRS_NON_COHERENT);
+	irs_data->res = *r;
 
 	gicv5_irs_acpi_init_affinity(irs->irs_id, irs_data);
 
diff --git a/include/linux/irqchip/arm-gic-v5.h b/include/linux/irqchip/arm-gic-v5.h
index f78787e654f4..2c2fb39f049c 100644
--- a/include/linux/irqchip/arm-gic-v5.h
+++ b/include/linux/irqchip/arm-gic-v5.h
@@ -6,6 +6,7 @@
 #define __LINUX_IRQCHIP_ARM_GIC_V5_H
 
 #include <linux/iopoll.h>
+#include <linux/ioport.h>
 
 #include <asm/cacheflush.h>
 #include <asm/smp.h>
@@ -324,6 +325,7 @@ struct gicv5_irs_chip_data {
 	struct list_head	entry;
 	struct fwnode_handle	*fwnode;
 	void __iomem		*irs_base;
+	struct resource		res;
 	u32			flags;
 	u32			spi_min;
 	u32			spi_range;

-- 
2.53.0


