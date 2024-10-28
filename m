Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EE8D339AE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 18:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LwL1+fiYE9CgXs4FnG2E5c4i1gEsQ4F2qsJe2WEF6qo=; b=Jfc+lLFN4frLi+h1qjihw+UF0r
	MS83LCA+LNvnQtHKo5MRTHJJuqiEKRks/gbLgqmODEX2SS72tw8RXBHdJQmOea4UZqqtywWepLegi
	fDXbFt0AjDBlsA2qAMMpmyRj86ueyEIToaUFO1eTtyDS0sNkZL9F2A8Y2uPQaei5Em7brkv0ZplA5
	EXqbwRO9wcZJ5x71uB1ZyzOcv0KBaY1Ecqv7WC3yRIB6wCKCNzPFpYw4myaq26kirJ9Ps1TcMW6fQ
	iCCi3UDTyQqNmc3IRmMrSzM8lURrfJ0oV005fS8LFa7DQ0MHTdbNDOmixuXFPp3RCLWzvYTOj87SD
	P+t3yWGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5UGH-0000000BmFj-0j5c;
	Mon, 28 Oct 2024 18:14:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5U17-0000000BjP5-1P3d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 17:59:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DA6316F8;
	Mon, 28 Oct 2024 10:59:27 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8D2133F66E;
	Mon, 28 Oct 2024 10:58:55 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: hns@goldelico.com,
	b-padhi@ti.com,
	andreas@kemnade.info,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH 3/4] iommu/omap: Add minimal fwnode support
Date: Mon, 28 Oct 2024 17:58:37 +0000
Message-Id: <cfd766f96bc799e32b97f4664707adbcf99097b0.1730136799.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1730136799.git.robin.murphy@arm.com>
References: <cover.1730136799.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_105901_472848_6A21CCAA 
X-CRM114-Status: GOOD (  15.10  )
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

The OMAP driver uses the generic "iommus" DT binding but is the final
holdout not implementing a corresponding .of_xlate method. Unfortunately
this now results in __iommu_probe_device() failing to find ops due to
client devices missing the expected IOMMU fwnode association. The legacy
DT parsing in omap_iommu_probe_device() could probably all be delegated
to generic code now, but for the sake of an immediate fix, just add a
minimal .of_xlate implementation to allow client fwspecs to be created
appropriately, and so the ops lookup to work again.

This means we also need to register the additional instances on DRA7 so
that of_iommu_xlate() doesn't defer indefinitely waiting for their ops
either, but we'll continue to hide them from sysfs just in case. This
also renders the bus_iommu_probe() call entirely redundant.

Reported-by: Beleswar Padhi <b-padhi@ti.com>
Link: https://lore.kernel.org/linux-iommu/0dbde87b-593f-4b14-8929-b78e189549ad@ti.com/
Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
Link: https://lore.kernel.org/linux-media/A7C284A9-33A5-4E21-9B57-9C4C213CC13F@goldelico.com/
Fixes: 17de3f5fdd35 ("iommu: Retire bus ops")
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/omap-iommu.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index c9528065a59a..3f72aef8bd5b 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1230,25 +1230,24 @@ static int omap_iommu_probe(struct platform_device *pdev)
 		if (err)
 			return err;
 
-		err = iommu_device_register(&obj->iommu, &omap_iommu_ops, &pdev->dev);
-		if (err)
-			goto out_sysfs;
 		obj->has_iommu_driver = true;
 	}
 
+	err = iommu_device_register(&obj->iommu, &omap_iommu_ops, &pdev->dev);
+	if (err)
+		goto out_sysfs;
+
 	pm_runtime_enable(obj->dev);
 
 	omap_iommu_debugfs_add(obj);
 
 	dev_info(&pdev->dev, "%s registered\n", obj->name);
 
-	/* Re-probe bus to probe device attached to this IOMMU */
-	bus_iommu_probe(&platform_bus_type);
-
 	return 0;
 
 out_sysfs:
-	iommu_device_sysfs_remove(&obj->iommu);
+	if (obj->has_iommu_driver)
+		iommu_device_sysfs_remove(&obj->iommu);
 	return err;
 }
 
@@ -1256,10 +1255,10 @@ static void omap_iommu_remove(struct platform_device *pdev)
 {
 	struct omap_iommu *obj = platform_get_drvdata(pdev);
 
-	if (obj->has_iommu_driver) {
+	if (obj->has_iommu_driver)
 		iommu_device_sysfs_remove(&obj->iommu);
-		iommu_device_unregister(&obj->iommu);
-	}
+
+	iommu_device_unregister(&obj->iommu);
 
 	omap_iommu_debugfs_remove(obj);
 
@@ -1723,12 +1722,19 @@ static void omap_iommu_release_device(struct device *dev)
 
 }
 
+static int omap_iommu_of_xlate(struct device *dev, const struct of_phandle_args *args)
+{
+	/* TODO: collect args->np to save re-parsing in probe above */
+	return 0;
+}
+
 static const struct iommu_ops omap_iommu_ops = {
 	.identity_domain = &omap_iommu_identity_domain,
 	.domain_alloc_paging = omap_iommu_domain_alloc_paging,
 	.probe_device	= omap_iommu_probe_device,
 	.release_device	= omap_iommu_release_device,
 	.device_group	= generic_single_device_group,
+	.of_xlate	= omap_iommu_of_xlate,
 	.pgsize_bitmap	= OMAP_IOMMU_PGSIZES,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= omap_iommu_attach_dev,
-- 
2.39.2.101.g768bb238c484.dirty


