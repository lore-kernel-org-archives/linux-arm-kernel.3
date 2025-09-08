Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE41CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6qKY0nCLPjAVj97JAJTEBY9a1IQX5ZGEgei29S7wJzg=; b=fOkpLJ8up4CUN8ZwwWXK0dwrNf
	+aNRHW5CecIuZ7lYosot2G0AGwIECtFeGe00x23jadwcgBN2mQAxf1iWwfuPhs3HhioJw93Lr1P1Q
	HBpz8v/ME6xpFccl7cLsKmkqVBSw4qU2JDvIQpICIcgfGonkMwkcSoGaJXpVPcLARKpwcZa3Qmfz5
	gp8XJWkiBpgFlTAcHeH4DLN/rVgMH+XvnLwS4eTjx5l+ZW+KM4407dA5hkBF+LAMkH9FkfOAFOan3
	u5qzp9iQLLm9jwlLemECuFyXBYQZFzIxXOmfJ9iv4HJzVVmGuFMku2c74VBZOvAu2anq7Ah/evimt
	t0zIdudA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvs6s-00000004mK5-0TnO;
	Tue, 09 Sep 2025 06:45:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvemT-00000000lNt-1xIJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 16:31:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 18A3944A20;
	Mon,  8 Sep 2025 16:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E97C6C4CEFA;
	Mon,  8 Sep 2025 16:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757349109;
	bh=t2t1XQhmTu4QwWw1Mvj257XNXGFyRkE9ARKAhPe4oJM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PZGJjwXa4GgFgzXH4FhpcpgeXYYGFHaTE8JKKorNoWhuxqrV+ph71/Wxqz50OWlym
	 fYMU32cIM91+bFkjMDOQh8oFz9ZMg7qtYCcw0Gh/feKnM2DcicJ3IXiX72tXZl6FtB
	 oAqZh0l0J5XNQB5Eb/jRHZ/tdlktjD0U4tA8+UkfAFxgRj4Pi9lrXQEJtzahwgAcU5
	 TXtMJRHerwY2TRCDoWozvylBTU3zuZmX/iOb5/cu3dMuqgWpFo1T7O9Yl9527BBE7g
	 Z2JJIVGdpT0+j59lajuZtnE4WumAelcS87NXt2JF8JOiGAdRNzv9QZyfBLrb0T5pSY
	 Qu7riyUNDJKTg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uvemQ-00000004NTm-3YV5;
	Mon, 08 Sep 2025 16:31:46 +0000
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
	James Clark <james.clark@linaro.org>
Subject: [PATCH 05/25] irqchip/gic-v3: Add FW info retrieval support
Date: Mon,  8 Sep 2025 17:31:07 +0100
Message-Id: <20250908163127.2462948-6-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250908163127.2462948-1-maz@kernel.org>
References: <20250908163127.2462948-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_093149_620990_701B88F2 
X-CRM114-Status: GOOD (  19.78  )
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

Plug the new .get_info() callback into the GICv3 core driver,
using some of the existing PPI affinity handling infrastructure.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v3.c | 55 ++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index dbeb85677b08c..4a90dbf9daedb 100644
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
@@ -1796,11 +1798,60 @@ static int gic_irq_domain_select(struct irq_domain *d,
 	return d == partition_get_domain(gic_data.ppi_descs[ppi_idx]);
 }
 
+static int gic_irq_get_info(struct irq_fwspec_info *info)
+{
+	struct irq_fwspec *fwspec = &info->fwspec;
+	const struct cpumask *mask = NULL;
+
+	info->flags = 0;
+	info->affinity = NULL;
+
+	/* ACPI is not capable of describing PPI affinity -- yet */
+	if (!is_of_node(fwspec->fwnode))
+		goto out;
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
+			goto out;
+		}
+
+		fw = of_node_to_fwnode(of_find_node_by_phandle(fwspec->param[3]));
+		if (!fw)
+			goto out;
+
+		for (int i = 0; i < gic_data.nr_parts; i++) {
+			if (gic_data.parts[i].partition_id == fw) {
+				mask = &gic_data.parts[i].mask;
+				break;
+			}
+		}
+
+		if (!mask)
+			goto out;
+	} else {
+		mask = cpu_possible_mask;
+	}
+
+	info->affinity = mask;
+	info->flags = (IRQ_FWSPEC_INFO_FWSPEC_VALID |
+		       IRQ_FWSPEC_INFO_AFFINITY_VALID);
+out:
+	return 0;
+}
+
 static const struct irq_domain_ops gic_irq_domain_ops = {
 	.translate = gic_irq_domain_translate,
 	.alloc = gic_irq_domain_alloc,
 	.free = gic_irq_domain_free,
 	.select = gic_irq_domain_select,
+	.get_info = gic_irq_get_info,
 };
 
 static int partition_domain_translate(struct irq_domain *d,
@@ -1839,6 +1890,7 @@ static int partition_domain_translate(struct irq_domain *d,
 static const struct irq_domain_ops partition_domain_ops = {
 	.translate = partition_domain_translate,
 	.select = gic_irq_domain_select,
+	.get_info = gic_irq_get_info,
 };
 
 static bool gic_enable_quirk_msm8996(void *data)
@@ -2231,6 +2283,9 @@ static void __init gic_populate_ppi_partitions(struct device_node *gic_node)
 		part_idx++;
 	}
 
+	gic_data.parts = parts;
+	gic_data.nr_parts = nr_parts;
+
 	for (i = 0; i < gic_data.ppi_nr; i++) {
 		unsigned int irq;
 		struct partition_desc *desc;
-- 
2.39.2


