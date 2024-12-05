Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A12E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 16:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IC1wtMjyo1HtH+XoCfZpi0yaYTaMWsPlw3uW5ro0VoI=; b=yszYyYJcFzNh5B9O1SXUcZQ2su
	ogI2bm/GB7+Qs1rXWdz2Qb8oOVISmGpIACjIfhS88bkJtn0PefQI/ZBQnsrmygu3ivASh9l1HLKxH
	pWfVPq6FX0wKzDHGdtGZXMpo+UBXLsW5wvsjqB8p2RtkLqBoogp1h+Pqj8rtVbBKD+xBRNy45s0U3
	dUZheeIfzNN1grucGElUTTzPUjrMK+ycFyfqYtxuAo2KcEFQgou05Uao1i9GAi1qGV4l7O0ivedBL
	vGnxIXC6PdiZcMUYz53r0Wq40uV0gAAEm4aWTTflucNHV1LYHMaIw7bZqwDPCQfoFblIMm80L8MCE
	wVAks8Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEsn-0000000GmNy-1MmU;
	Thu, 05 Dec 2024 16:39:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEny-0000000GlcI-1H5F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 16:34:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE6F01758;
	Thu,  5 Dec 2024 08:34:45 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 017423F5A1;
	Thu,  5 Dec 2024 08:34:16 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	joro@8bytes.org
Cc: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	quic_pbrahma@quicinc.com
Subject: [PATCH v2 4/4] iommu: Manage driver probe deferral better
Date: Thu,  5 Dec 2024 16:33:58 +0000
Message-Id: <41fa59f156ef8d196d08fa75c4901e6d4b12e6c4.1733406914.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1733406914.git.robin.murphy@arm.com>
References: <cover.1733406914.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_083418_380944_4E0E1F62 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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

Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

v2: No change

 drivers/iommu/iommu.c    | 2 +-
 drivers/iommu/of_iommu.c | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 9bc0c74cca3c..7cd433803bd6 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2819,7 +2819,7 @@ int iommu_fwspec_init(struct device *dev, struct fwnode_handle *iommu_fwnode)
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


