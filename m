Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CB0F588C3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 12:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=syaahfr1AvjeTrgpecRtNBtBP+GrrbQJ3jcGHB9nAds=; b=Wdd0+quXcEr3k/2l+DDzi7RHOS
	D9+04pBMhLmnkqNWG/KJxsCSkiZFBgtt9ThA7YMtdry+DF5Eg9IYW/mIVR37iIZKDvMcgHrBahGYL
	iyOd81L0CMdWC+wEmmEV3Y51oQyl3BY2gYX+CmaPUqKLmrcfRp6DHyVAUXK4NeYWWINRtu0wjAy7K
	1zjkV4qbfAaExv6zpZ+pUR7WmICxT8sIJyAWTyQN9mZeOlK3COERfVepTQFsYjtvZZRam5PhXxvR0
	egfNulUXLlAaHT6S8Q4NMf2f+7XjQDdzr1NiNpTT1WfLyI/k91uSBNGwSGGJ5RqK7JcjAWmeG04z3
	+Vw8kXow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEno0-00000006t2k-1lMF;
	Mon, 20 Apr 2026 12:32:48 +0000
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.83.148.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnnw-00000006t1H-0v3C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 12:32:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1776688364; x=1808224364;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=syaahfr1AvjeTrgpecRtNBtBP+GrrbQJ3jcGHB9nAds=;
  b=YyEShXTQJ5T7g9cH89Paz9azRxkiqj1q0w19SGVwSs+fj3YZY7l8SJAZ
   C9BKxURohwYCYM4MVNr7ICewhQ1gtssZMQiSZ2NSUTscPlED5q1LkATOk
   sszoQzbBYqnPkVCbTFg4Hs84y4iBpZCZDG9tfCvMopiB4w4Ybtfo92hYW
   G76ggFTqR1tg5YcAzGpC/TYv4ODHDY/YV3xidMJVpv5Pr2oYb+rLxpgqO
   4XIsKDFTrZMfNtrJtvuT5EiKfBql6SntHiRsiIIcqVqYtX15RwqUXbH4z
   THB5kFpPWhos5jpgNR6o5QghFWleg+TUVEP3ImzgXp2jVwN3w9hN5QZgN
   Q==;
X-CSE-ConnectionGUID: QzW1fbjyTASzVH90g2euCQ==
X-CSE-MsgGUID: TT2won87QKSxh/RpnfGOUw==
X-IronPort-AV: E=Sophos;i="6.23,189,1770595200"; 
   d="scan'208";a="17503804"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 12:32:38 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:30295]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.29.81:2525] with esmtp (Farcaster)
 id 057c323d-5e62-472c-83db-4447edd78fdd; Mon, 20 Apr 2026 12:32:38 +0000 (UTC)
X-Farcaster-Flow-ID: 057c323d-5e62-472c-83db-4447edd78fdd
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Mon, 20 Apr 2026 12:32:37 +0000
Received: from dev-dsk-epetron-1c-1d4d9719.eu-west-1.amazon.com
 (10.253.109.105) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Mon, 20 Apr 2026
 12:32:35 +0000
From: Evangelos Petrongonas <epetron@amazon.de>
To: Will Deacon <will@kernel.org>
CC: Evangelos Petrongonas <epetron@amazon.de>, Robin Murphy
	<robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe
	<jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>, Pranjal Shrivastava
	<praan@google.com>, Lu Baolu <baolu.lu@linux.intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <nh-open-source@amazon.com>, Zeev Zilberman
	<zeev@amazon.com>
Subject: [PATCH] iommu/arm-smmu-v3: Allow disabling Stage 1 translation
Date: Mon, 20 Apr 2026 12:32:01 +0000
Message-ID: <20260420123221.20801-1-epetron@amazon.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Originating-IP: [10.253.109.105]
X-ClientProxiedBy: EX19D032UWA004.ant.amazon.com (10.13.139.56) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_053244_318156_B4E26C0A 
X-CRM114-Status: GOOD (  11.27  )
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

When the hardware advertises both Stage 1 and Stage 2 translation, the
driver prefers Stage 1 for DMA domain allocation and only falls back to
Stage 2 if Stage 1 is not supported.

Some configurations may want to force Stage 2 translation even when the
hardware supports Stage 1. Introduce a module parameter 'disable_s1'
that, when set, prevents the driver from advertising
ARM_SMMU_FEAT_TRANS_S1, causing all DMA domains to use Stage 2 instead.

Co-developed-by: Zeev Zilberman <zeev@amazon.com>
Signed-off-by: Zeev Zilberman <zeev@amazon.com>
Signed-off-by: Evangelos Petrongonas <epetron@amazon.de>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index e8d7dbe495f0..afb21c210e24 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -39,6 +39,11 @@ module_param(disable_msipolling, bool, 0444);
 MODULE_PARM_DESC(disable_msipolling,
 	"Disable MSI-based polling for CMD_SYNC completion.");
 
+static bool disable_s1;
+module_param(disable_s1, bool, 0444);
+MODULE_PARM_DESC(disable_s1,
+	"Disable Stage 1 translation even if supported by hardware.");
+
 static const struct iommu_ops arm_smmu_ops;
 static struct iommu_dirty_ops arm_smmu_dirty_ops;
 
@@ -5087,13 +5092,13 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 		smmu->features |= ARM_SMMU_FEAT_STALLS;
 	}
 
-	if (reg & IDR0_S1P)
+	if ((reg & IDR0_S1P) && !disable_s1)
 		smmu->features |= ARM_SMMU_FEAT_TRANS_S1;
 
 	if (reg & IDR0_S2P)
 		smmu->features |= ARM_SMMU_FEAT_TRANS_S2;
 
-	if (!(reg & (IDR0_S1P | IDR0_S2P))) {
+	if (!(smmu->features & (ARM_SMMU_FEAT_TRANS_S1 | ARM_SMMU_FEAT_TRANS_S2))) {
 		dev_err(smmu->dev, "no translation support!\n");
 		return -ENXIO;
 	}
-- 
2.47.3




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christof Hellmis, Andreas Stieger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


