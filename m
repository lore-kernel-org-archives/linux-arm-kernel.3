Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A534CAC5B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 08:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zlgQ5XtHyCUy8uM0kNRIjeIEC/fZPa79xijgRXGp5ME=; b=DxeU6FG4vfNlIDLbeqDIK0PJqY
	gULLoUf1M+u3+U7eIgic+cJ2akx8twxZcOR/MHRk54gBXWMJXvu8dLgELN/wl5ydG9hmfp33sVl17
	j9CJ9BiQ1QubjNUyXoEBXVYeDBEer6gpzbM73U1cIOuF8iazCyMBe7XTBKdSDPMO+q/pmYL1TVuJ7
	UHoDNo5sTpgw7WrHgneb0uIfwLl9RN6sqK4SlPLh++QTxSV1fFvqGkn5QBwczN0+0ZJUgyfHR9DZr
	YfuaoI8S9TotemWU7Iep5KJlCGWozY7NlzO8l2FsjFhoBf0wjQNCp7BjjwRTYgLBSBSAdtlXU34Wp
	4b3+VQvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bup-00000009hss-2SjJ;
	Mon, 22 Sep 2025 08:28:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0buf-00000009hg2-3FAk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 08:28:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F3C244ED3;
	Mon, 22 Sep 2025 08:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A2A8C116B1;
	Mon, 22 Sep 2025 08:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758529725;
	bh=5IBVXncBJM26KBDVMYIUqVm5RyJ3XQl6A/mbG+QlK9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oX1fLqJEwsS3j2MUHRThVKoYjSlFOCw5Vzzv+l5JZsWhB0jOGXpEn50JjeiPZk1TR
	 eetVE0jRiWNbT/jzI4OPBGFO9TpOOUItkgBLhnLp7irks8MzDVTEn0d14j1bSvj64G
	 I60XQaW4YSKZPk+cAa3r7On243LEOiDWRyrXriKydi13vikcj9xljq7va4m1dQAPAk
	 CtWzOXU0OFZBvEjGdbAKUyH4GCPBXjBzmCw6EmjUhNc5tOX71z6qIzfNSVCO3Xjvcd
	 YuAutRDZv6cIs8i8pXbMaGMoaT521ZNDWNHWmeSlfdNWuPlfkbQJm0n/WQIU9z/+k5
	 koocJZTyWM2eg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v0bud-00000008Kds-0NMH;
	Mon, 22 Sep 2025 08:28:43 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v3 05/26] irqchip/gic-v3: Add FW info retrieval support
Date: Mon, 22 Sep 2025 09:28:12 +0100
Message-ID: <20250922082833.2038905-6-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922082833.2038905-1-maz@kernel.org>
References: <20250922082833.2038905-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org, jonathan.cameron@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_012845_848406_F2579BFE 
X-CRM114-Status: GOOD (  19.62  )
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

Plug the new .get_fwspec_info() callback into the GICv3 core driver,
using some of the existing PPI affinity handling infrastructure.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v3.c | 53 ++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index dbeb85677b08c..23ef0c285f30b 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -69,6 +69,8 @@ struct gic_chip_data {
 	bool			has_rss;
 	unsigned int		ppi_nr;
 	struct partition_desc	**ppi_descs;
+	struct partition_affinity *parts;
+	unsigned int		nr_parts;
 };
 
 #define T241_CHIPS_MAX		4
@@ -1796,11 +1798,58 @@ static int gic_irq_domain_select(struct irq_domain *d,
 	return d == partition_get_domain(gic_data.ppi_descs[ppi_idx]);
 }
 
+static int gic_irq_get_fwspec_info(struct irq_fwspec *fwspec, struct irq_fwspec_info *info)
+{
+	const struct cpumask *mask = NULL;
+
+	info->flags = 0;
+	info->affinity = NULL;
+
+	/* ACPI is not capable of describing PPI affinity -- yet */
+	if (!is_of_node(fwspec->fwnode))
+		return 0;
+
+	/* If the specifier provides an affinity, use it */
+	if (fwspec->param_count == 4 && fwspec->param[3]) {
+		struct fwnode_handle *fw;
+
+		switch (fwspec->param[0]) {
+		case 1:			/* PPI */
+		case 3:			/* EPPI */
+			break;
+		default:
+			return 0;
+		}
+
+		fw = of_fwnode_handle(of_find_node_by_phandle(fwspec->param[3]));
+		if (!fw)
+			return -ENOENT;
+
+		for (int i = 0; i < gic_data.nr_parts; i++) {
+			if (gic_data.parts[i].partition_id == fw) {
+				mask = &gic_data.parts[i].mask;
+				break;
+			}
+		}
+
+		if (!mask)
+			return -ENOENT;
+	} else {
+		mask = cpu_possible_mask;
+	}
+
+	info->affinity = mask;
+	info->flags = IRQ_FWSPEC_INFO_AFFINITY_VALID;
+
+	return 0;
+}
+
 static const struct irq_domain_ops gic_irq_domain_ops = {
 	.translate = gic_irq_domain_translate,
 	.alloc = gic_irq_domain_alloc,
 	.free = gic_irq_domain_free,
 	.select = gic_irq_domain_select,
+	.get_fwspec_info = gic_irq_get_fwspec_info,
 };
 
 static int partition_domain_translate(struct irq_domain *d,
@@ -1839,6 +1888,7 @@ static int partition_domain_translate(struct irq_domain *d,
 static const struct irq_domain_ops partition_domain_ops = {
 	.translate = partition_domain_translate,
 	.select = gic_irq_domain_select,
+	.get_fwspec_info = gic_irq_get_fwspec_info,
 };
 
 static bool gic_enable_quirk_msm8996(void *data)
@@ -2231,6 +2281,9 @@ static void __init gic_populate_ppi_partitions(struct device_node *gic_node)
 		part_idx++;
 	}
 
+	gic_data.parts = parts;
+	gic_data.nr_parts = nr_parts;
+
 	for (i = 0; i < gic_data.ppi_nr; i++) {
 		unsigned int irq;
 		struct partition_desc *desc;
-- 
2.47.3


