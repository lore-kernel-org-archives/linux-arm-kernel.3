Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBC9D64077
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 18:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T1xFh2AnyCqOFuub1Bu+3PinQnKDjqOQaTMMzOtRqpA=; b=DcodkgIdvdy4oQPKkNngeYoN7p
	jbHCLyUTCaiw1DvV+fTfeeMFzNqSOOSXyVzNwTX8S9rnr5mMFaNMM/iiM2w1H8OgFu7RuHMhnYYZ6
	zd6xl1yZmgPugn2rFAUZ7AG4BKopnfgBfaULPeCzjboeT6esWDzf8S+5jLHsBfMY0hFQSAxLlfajo
	0fKbcubFfdmLDsSg77OLWOjdGYjmCMGbLaTIwb8xBa1Isbg6iIiHDB/H8DhBhR6nr70mPD50KtLTB
	qd79LeAM9Z5t6Cn9xjI4srKpDSvn9uhrzLgi155EQ2CGiQ4h+/rB26z2+ZsHzcUe106o+P0bm2B3V
	TZGKCNiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9TrW-0000000BcAO-2bWS;
	Fri, 08 Nov 2024 18:37:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Tka-0000000BbKe-0Por
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 18:30:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D95091691;
	Fri,  8 Nov 2024 10:30:56 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 443B93F6A8;
	Fri,  8 Nov 2024 10:30:26 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	joro@8bytes.org
Cc: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] iommu: Manage driver probe deferral better
Date: Fri,  8 Nov 2024 18:30:17 +0000
Message-Id: <2da0ae7f76c7466176e906fa5d7a0ae5210e8650.1731088789.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1731088789.git.robin.murphy@arm.com>
References: <cover.1731088789.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_103028_199701_663F5A16 
X-CRM114-Status: GOOD (  10.57  )
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

Since iommu_fwspec_init() absorbed the basic driver probe deferral
check to wait for an IOMMU to register, we may as well handle the probe
deferral timeout there as well. The current inconsistency of callers
results in client devices deferring forever on an arm64 ACPI system
where an SMMU has failed its own driver probe.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/iommu.c    | 2 +-
 drivers/iommu/of_iommu.c | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 83c8e617a2c5..dc8d11b585cd 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2842,7 +2842,7 @@ int iommu_fwspec_init(struct device *dev, struct fwnode_handle *iommu_fwnode)
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 
 	if (!ops)
-		return -EPROBE_DEFER;
+		return driver_deferred_probe_check_state(dev);
 
 	if (fwspec)
 		return ops == iommu_fwspec_ops(fwspec) ? 0 : -EINVAL;
diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index e7a6a1611d19..97987cd78da9 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -29,8 +29,6 @@ static int of_iommu_xlate(struct device *dev,
 		return -ENODEV;
 
 	ret = iommu_fwspec_init(dev, of_fwnode_handle(iommu_spec->np));
-	if (ret == -EPROBE_DEFER)
-		return driver_deferred_probe_check_state(dev);
 	if (ret)
 		return ret;
 
-- 
2.39.2.101.g768bb238c484.dirty


