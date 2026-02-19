Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBFDE9A055
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 17:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XL8fX9hewfYWgPgcnjDVqp5mQ+w/UM0YLPBUXR9ueVI=; b=CORzRrVT0aw1/TJabT6oGHwi2r
	Qa8a3KpExtOyxdZCKbna3RvROgHU6Hcz34sDu3MbKYcbepmfz2Q6ijgKY8Ej5omOlbxibkEEiOh+h
	/0rceZeuRUGtleocyN7xPK96kj7zWpAABnwDQuBlRAwobT7MBxyGd9l6aw0zX5vhl+5rfmAv2AXRt
	V099fy+EjGeX6lUIwriK6QLK7k8qaP0fS/ixwTx5YYlkw5LLsUF3p/ruwE7qT2fId/tgSUAIe6IDE
	06joNNQTXib6PYN255WtWF5Q1Zft+R5FX9rJ31gSrkXU2IOhXZdyAwUht4ckhLgZw9KeAtLX49vaM
	xoFsEf7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt7os-0000000BhmI-06em;
	Thu, 19 Feb 2026 17:28:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt7op-0000000Bhkw-3fmr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 17:28:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00D46339;
	Thu, 19 Feb 2026 09:27:54 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4CC603F7D8;
	Thu, 19 Feb 2026 09:27:59 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	ilkka@os.amperecomputing.com,
	James Morse <james.morse@arm.com>
Subject: [PATCH] perf/arm-cmn: Stop claiming entire iomem region
Date: Thu, 19 Feb 2026 17:27:53 +0000
Message-Id: <b6275655818f5af7e5fb07a9e18d1451b08b7e05.1771522073.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_092804_017435_D8B6151A 
X-CRM114-Status: GOOD (  15.79  )
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

So far, the PMU has been the only thing of interest in the vast mass
of CMN registers, so we've gotten away with simply claiming the entire
iomem region. However, now that we can support other features like MPAM
controllers for the system caches, the PMU driver needs to stop being
selfish and learn to share. Similarly to arm-ni, requesting just the
DTC node(s) should suffice for staking our exclusive claim to the PMU
features, as requesting hundreds of tiny regions for all the individual
pmu_event_sel registers is definitely not worth the considerable bother.

As a consequence, we can also streamline the annoying CMN-600 special
cases even more. The ACPI binding has in fact always specified a strict
order for all resources, so we can reasonably drop the ancient pretence
of swapping base and cfg, which IIRC was more just a moment of doubt on
my part than anything else.

Cc: James Morse <james.morse@arm.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm-cmn.c | 70 +++++++++++++++++++-----------------------
 1 file changed, 31 insertions(+), 39 deletions(-)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index 364a4fd8f2c0..6a5eba0be347 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -2132,6 +2132,8 @@ static void arm_cmn_init_dtm(struct arm_cmn_dtm *dtm, struct arm_cmn_node *xp, i
 static int arm_cmn_init_dtc(struct arm_cmn *cmn, struct arm_cmn_node *dn, int idx)
 {
 	struct arm_cmn_dtc *dtc = cmn->dtc + idx;
+	const struct resource *cfg;
+	resource_size_t base, size;
 
 	dtc->pmu_base = dn->pmu_base;
 	dtc->base = dtc->pmu_base - arm_cmn_pmu_offset(cmn, dn);
@@ -2139,6 +2141,13 @@ static int arm_cmn_init_dtc(struct arm_cmn *cmn, struct arm_cmn_node *dn, int id
 	if (dtc->irq < 0)
 		return dtc->irq;
 
+	cfg = platform_get_resource(to_platform_device(cmn->dev), IORESOURCE_MEM, 0);
+	base = dtc->base - cmn->base + cfg->start;
+	size = cmn->part == PART_CMN600 ? SZ_16K : SZ_64K;
+	if (!devm_request_mem_region(cmn->dev, base, size, dev_name(cmn->dev)))
+		return dev_err_probe(cmn->dev, -EBUSY,
+				     "Failed to request DTC region 0x%llx\n", base);
+
 	writel_relaxed(CMN_DT_DTC_CTL_DT_EN, dtc->base + CMN_DT_DTC_CTL);
 	writel_relaxed(CMN_DT_PMCR_PMU_EN | CMN_DT_PMCR_OVFL_INTR_EN, CMN_DT_PMCR(dtc));
 	writeq_relaxed(0, CMN_DT_PMCCNTR(dtc));
@@ -2525,43 +2534,26 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
 	return 0;
 }
 
-static int arm_cmn600_acpi_probe(struct platform_device *pdev, struct arm_cmn *cmn)
-{
-	struct resource *cfg, *root;
-
-	cfg = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!cfg)
-		return -EINVAL;
-
-	root = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (!root)
-		return -EINVAL;
-
-	if (!resource_contains(cfg, root))
-		swap(cfg, root);
-	/*
-	 * Note that devm_ioremap_resource() is dumb and won't let the platform
-	 * device claim cfg when the ACPI companion device has already claimed
-	 * root within it. But since they *are* already both claimed in the
-	 * appropriate name, we don't really need to do it again here anyway.
-	 */
-	cmn->base = devm_ioremap(cmn->dev, cfg->start, resource_size(cfg));
-	if (!cmn->base)
-		return -ENOMEM;
-
-	return root->start - cfg->start;
-}
-
-static int arm_cmn600_of_probe(struct device_node *np)
+static int arm_cmn_get_root(struct arm_cmn *cmn, const struct resource *cfg)
 {
+	const struct device_node *np = cmn->dev->of_node;
+	const struct resource *root;
 	u32 rootnode;
 
-	return of_property_read_u32(np, "arm,root-node", &rootnode) ?: rootnode;
+	if (cmn->part != PART_CMN600)
+		return 0;
+
+	if (np)
+		return of_property_read_u32(np, "arm,root-node", &rootnode) ?: rootnode;
+
+	root = platform_get_resource(to_platform_device(cmn->dev), IORESOURCE_MEM, 1);
+	return root ? root->start - cfg->start : -EINVAL;
 }
 
 static int arm_cmn_probe(struct platform_device *pdev)
 {
 	struct arm_cmn *cmn;
+	const struct resource *cfg;
 	const char *name;
 	static atomic_t id;
 	int err, rootnode, this_id;
@@ -2575,16 +2567,16 @@ static int arm_cmn_probe(struct platform_device *pdev)
 	cmn->cpu = cpumask_local_spread(0, dev_to_node(cmn->dev));
 	platform_set_drvdata(pdev, cmn);
 
-	if (cmn->part == PART_CMN600 && has_acpi_companion(cmn->dev)) {
-		rootnode = arm_cmn600_acpi_probe(pdev, cmn);
-	} else {
-		rootnode = 0;
-		cmn->base = devm_platform_ioremap_resource(pdev, 0);
-		if (IS_ERR(cmn->base))
-			return PTR_ERR(cmn->base);
-		if (cmn->part == PART_CMN600)
-			rootnode = arm_cmn600_of_probe(pdev->dev.of_node);
-	}
+	cfg = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!cfg)
+		return -EINVAL;
+
+	/* Map the whole region now, claim the DTCs once we've found them */
+	cmn->base = devm_ioremap(cmn->dev, cfg->start, resource_size(cfg));
+	if (IS_ERR(cmn->base))
+		return PTR_ERR(cmn->base);
+
+	rootnode = arm_cmn_get_root(cmn, cfg);
 	if (rootnode < 0)
 		return rootnode;
 
-- 
2.39.2.101.g768bb238c484.dirty


