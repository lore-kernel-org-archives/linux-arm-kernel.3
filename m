Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36520C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XqG6KyxkS4f2hG4G8z3RaSsZOjsOwiCtXbB2LyMCJJY=; b=q0iIwB3+IK+waRBxcVL+pKoBKj
	IDfOXURGzopj28Kcv0X1RStHS3nVzqT/tnOUW3z1nsR1ptg7OwFaR7BcBWPeOOTcaT2+Wu0b60RoO
	HMhD8O/0h6WpTxHaY8L0shglBoLtEZtGJWA3Iz4RUILq14euIApC2C498KRhVyInxh4BeSeYgPyz/
	lYnfSp02z69S6Razq2kZMkC7fvhFJXJXkjIuN8K9ZHleaaBUkLQ1Yx8WYvKBoMviZktcXFx4fqF+P
	lg8ZKDLoRmwf0SSzXs6dptxYHEYv9SEovSQZfjh2p0h1s96gnXFIj19tLGDNw1F8Yud6WLJBLlc4J
	cDZhDbXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjhF-00000008TwI-1ncT;
	Thu, 27 Feb 2025 19:37:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnfB7-00000007oRG-0nyg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 14:47:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 181032BCA;
	Thu, 27 Feb 2025 06:48:12 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 69F4D3F673;
	Thu, 27 Feb 2025 06:47:55 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Cc: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	yong.wu@mediatek.com,
	thierry.reding@gmail.com,
	vdumpa@nvidia.com
Subject: [PATCH] iommu: Unexport iommu_fwspec_free()
Date: Thu, 27 Feb 2025 14:47:47 +0000
Message-Id: <36e245489361de2d13db22a510fa5c79e7126278.1740667667.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_064757_311718_F1F6E999 
X-CRM114-Status: GOOD (  17.70  )
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

The drivers doing their own fwspec parsing have no need to call
iommu_fwspec_free() since fwspecs were moved into dev_iommu, as
returning an error from .probe_device will tear down the whole lot
anyway. Move it into the private interface now that it only serves
for of_iommu to clean up in an error case.

I have no idea what mtk_v1 was doing in effectively guaranteeing
a NULL fwspec would be dereferenced if no "iommus" DT property was
found, so add a check for that to at least make the code look sane.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c |  1 -
 drivers/iommu/iommu-priv.h            |  2 ++
 drivers/iommu/iommu.c                 |  1 -
 drivers/iommu/mtk_iommu_v1.c          | 14 ++++----------
 drivers/iommu/tegra-smmu.c            |  1 -
 include/linux/iommu.h                 |  5 -----
 6 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index de205a34ffc6..ea9f8e484e35 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -1486,7 +1486,6 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
 out_cfg_free:
 	kfree(cfg);
 out_free:
-	iommu_fwspec_free(dev);
 	return ERR_PTR(ret);
 }
 
diff --git a/drivers/iommu/iommu-priv.h b/drivers/iommu/iommu-priv.h
index de5b54eaa8bf..17e245cf17bb 100644
--- a/drivers/iommu/iommu-priv.h
+++ b/drivers/iommu/iommu-priv.h
@@ -24,6 +24,8 @@ static inline const struct iommu_ops *iommu_fwspec_ops(struct iommu_fwspec *fwsp
 	return iommu_ops_from_fwnode(fwspec ? fwspec->iommu_fwnode : NULL);
 }
 
+void iommu_fwspec_free(struct device *dev);
+
 int iommu_group_replace_domain(struct iommu_group *group,
 			       struct iommu_domain *new_domain);
 
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 60aed01e54f2..0fce7a1677e6 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2849,7 +2849,6 @@ void iommu_fwspec_free(struct device *dev)
 		dev_iommu_fwspec_set(dev, NULL);
 	}
 }
-EXPORT_SYMBOL_GPL(iommu_fwspec_free);
 
 int iommu_fwspec_add_ids(struct device *dev, const u32 *ids, int num_ids)
 {
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index a565b9e40f4a..09676bd7cb9c 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -446,22 +446,13 @@ static int mtk_iommu_v1_create_mapping(struct device *dev,
 
 static struct iommu_device *mtk_iommu_v1_probe_device(struct device *dev)
 {
-	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct iommu_fwspec *fwspec = NULL
 	struct of_phandle_args iommu_spec;
 	struct mtk_iommu_v1_data *data;
 	int err, idx = 0, larbid, larbidx;
 	struct device_link *link;
 	struct device *larbdev;
 
-	/*
-	 * In the deferred case, free the existed fwspec.
-	 * Always initialize the fwspec internally.
-	 */
-	if (fwspec) {
-		iommu_fwspec_free(dev);
-		fwspec = dev_iommu_fwspec_get(dev);
-	}
-
 	while (!of_parse_phandle_with_args(dev->of_node, "iommus",
 					   "#iommu-cells",
 					   idx, &iommu_spec)) {
@@ -476,6 +467,9 @@ static struct iommu_device *mtk_iommu_v1_probe_device(struct device *dev)
 		idx++;
 	}
 
+	if (!fwspec)
+		return -ENODEV;
+
 	data = dev_iommu_priv_get(dev);
 
 	/* Link the consumer device with the smi-larb device(supplier) */
diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 7f633bb5efef..69d353e1df84 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -846,7 +846,6 @@ static int tegra_smmu_configure(struct tegra_smmu *smmu, struct device *dev,
 	err = ops->of_xlate(dev, args);
 	if (err < 0) {
 		dev_err(dev, "failed to parse SW group ID: %d\n", err);
-		iommu_fwspec_free(dev);
 		return err;
 	}
 
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 38c65e92ecd0..446ca5a5af35 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -1079,7 +1079,6 @@ struct iommu_mm_data {
 };
 
 int iommu_fwspec_init(struct device *dev, struct fwnode_handle *iommu_fwnode);
-void iommu_fwspec_free(struct device *dev);
 int iommu_fwspec_add_ids(struct device *dev, const u32 *ids, int num_ids);
 
 static inline struct iommu_fwspec *dev_iommu_fwspec_get(struct device *dev)
@@ -1390,10 +1389,6 @@ static inline int iommu_fwspec_init(struct device *dev,
 	return -ENODEV;
 }
 
-static inline void iommu_fwspec_free(struct device *dev)
-{
-}
-
 static inline int iommu_fwspec_add_ids(struct device *dev, u32 *ids,
 				       int num_ids)
 {
-- 
2.39.2.101.g768bb238c484.dirty


