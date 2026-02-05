Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C37AEC1E81
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 09:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qneZW9L7gDazzyI+MygrSGV36rUIl9w8mKCRbWGP4l8=; b=ekFMlboeU+HR9NnPtcRvrb8AYq
	a6+THZgP3lyg/2RtQR1pLrjfeNk3Ng78qlHQz43ChvANWjeTCbBftLcf/wJccm7zS9bbPUtt7dnYt
	MYTmEtAWXPsxSHmftMP3fj/6BOgl+udKs8QLoMCEZXaO/nZzdjQzQ22RZCzuwQqC22kOARvg7Hys/
	ZCBmAcQ097VFEBrA10cUeH7uQ5WTaM0HwYmPUTI9bgxKId37npDXdL4nVia4/jyr/bZsvk9rdFbq6
	wECMPoLe8vkxNgeXV3A68SUiRSiiGvD5yNH2bvAgXmGwvsMQZzuFoiXY/KqeOHXVtgcCVVt55O08f
	y8ku1JaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvkl-00000009iCv-3P1c;
	Thu, 05 Feb 2026 09:34:23 +0000
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvki-00000009iBM-2Kgt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 09:34:23 +0000
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
	by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwAnL2MNZIRp9xfLBg--.57S2;
	Thu, 05 Feb 2026 17:34:05 +0800 (CST)
Received: from localhost.localdomain (unknown [219.142.137.151])
	by mail (Coremail) with SMTP id AQAAfwBXse4HZIRpuDMZAA--.29205S2;
	Thu, 05 Feb 2026 17:34:00 +0800 (CST)
From: Zhiyuan Dai <daizhiyuan@phytium.com.cn>
To: will@kernel.org,
	joro@8bytes.org
Cc: robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhiyuan Dai <daizhiyuan@phytium.com.cn>
Subject: [PATCH] iommu/arm-smmu-v3: Restrict MMU-700 errata 2268618 and 2812531 to affected
Date: Thu,  5 Feb 2026 17:33:56 +0800
Message-ID: <20260205093356.4328-1-daizhiyuan@phytium.com.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwBXse4HZIRpuDMZAA--.29205S2
X-CM-SenderInfo: hgdl6xpl1xt0o6sk53xlxphulrpou0/
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=daizhiyuan
	@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoW7Kw4UAr47Kry3tw43tFW5KFg_yoW8GrW8p3
	Z5G3sY93s8WF1fAa9rJ3yDZw15Gas5Aa15Jay5u390gryDKry5GryxKayjgF4kCrWUXF1f
	AF1vq3y5CF15ArJanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
	UUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_013420_734201_72081FB1 
X-CRM114-Status: UNSURE (   8.46  )
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

According to SDEN-1786925, Arm errata 2268618 and 2812531 are present in
r0p0, r0p1, and r1p0, and fixed in r1p1.

Introduce this patch to avoid performance degradation caused by
restricting features on unaffected revisions.

Signed-off-by: Zhiyuan Dai <daizhiyuan@phytium.com.cn>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index d16d35c78c06..7eadb27eb9be 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4272,11 +4272,13 @@ static void arm_smmu_device_iidr_probe(struct arm_smmu_device *smmu)
 				smmu->features &= ~ARM_SMMU_FEAT_NESTING;
 			break;
 		case IIDR_PRODUCTID_ARM_MMU_700:
-			/* Arm erratum 2812531 */
-			smmu->features &= ~ARM_SMMU_FEAT_BTM;
-			smmu->options |= ARM_SMMU_OPT_CMDQ_FORCE_SYNC;
-			/* Arm errata 2268618, 2812531 */
-			smmu->features &= ~ARM_SMMU_FEAT_NESTING;
+			if (variant <= 1 && revision < 0) {
+				/* Arm erratum 2812531 */
+				smmu->features &= ~ARM_SMMU_FEAT_BTM;
+				smmu->options |= ARM_SMMU_OPT_CMDQ_FORCE_SYNC;
+				/* Arm errata 2268618, 2812531 */
+				smmu->features &= ~ARM_SMMU_FEAT_NESTING;
+			}
 			break;
 		}
 		break;
-- 
2.51.0


