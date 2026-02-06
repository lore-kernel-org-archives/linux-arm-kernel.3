Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8760FEB28E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 08:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sM0W5e4FQQ3NGCwRisZQpeOaeqXRq2V9g+tiE6EzMVI=; b=DoDCsWXJQ6ljd7GBVYQxbrmJdR
	rJpSHuTYQE3Kt4VJ4hgRsGG0P5RgQwAq3y8rTM1IaiIOQx2UbAZlp9TZ6wFoOG6Bl0SHV7oaTg2Nl
	Y5DWZFAElguC5KK5F/JSZtOdUsgjKxqD89T/Gg0WUZm5zpheMppVeOWxUo2tnkobGCzQtyAQI6LzQ
	vyMPr9FmNqEU4XaRZdMuVDq5BPQ/d8Lv1A4FgR+qButPUeqVLxqsfRS7Z3dGAO3AlxjFbnWrKBbsc
	ASSnRiR2UMN6pD1D12rtaVKdfERrq9KXBVchYtqIqNEgef7nBnKApUVCnZgY0CnBXc1ohL506w8Yi
	kVfkMeFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voH2o-0000000B1So-0Wjz;
	Fri, 06 Feb 2026 08:18:26 +0000
Received: from sgoci-sdnproxy-4.icoremail.net ([129.150.39.64])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voH2j-0000000B1RU-0eU1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 08:18:25 +0000
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
	by hzbj-icmmx-6 (Coremail) with SMTP id AQAAfwDnPNDBo4Vp5MolAA--.30876S2;
	Fri, 06 Feb 2026 16:18:09 +0800 (CST)
Received: from [127.0.0.1] (unknown [219.142.137.151])
	by mail (Coremail) with SMTP id AQAAfwDXLeu9o4VpOmwZAA--.29724S3;
	Fri, 06 Feb 2026 16:18:05 +0800 (CST)
From: Zhiyuan Dai <daizhiyuan@phytium.com.cn>
Date: Fri, 06 Feb 2026 16:18:05 +0800
Subject: [PATCH v2] iommu/arm-smmu-v3: Restrict MMU-700 errata 2268618 and
 2812531 to affected
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-smmuv3-v2-1-f381a2125392@phytium.com.cn>
X-B4-Tracking: v=1; b=H4sIALyjhWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDIwMz3eLc3NIyY91ECwtzcyNjc/NkIwMloOKCotS0zAqwQdGxtbUAqH5
 JqFgAAAA=
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Zhiyuan Dai <daizhiyuan@phytium.com.cn>
X-Mailer: b4 0.13.0
X-CM-TRANSID: AQAAfwDXLeu9o4VpOmwZAA--.29724S3
X-CM-SenderInfo: hgdl6xpl1xt0o6sk53xlxphulrpou0/
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=daizhiyuan
	@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoW7Kw1DCF17CFy7ZFy3KF1kGrg_yoW8Aryrpa
	n3Gwn5uw1UWF1fZa9Fv39rZF15Ga4kAFWFqF4UWa90gw1qkry3GryIgFWYgF4kCrWUZF1f
	ZF1vqrW5CF1UArJanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
	UUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_001821_619660_9D6F0C94 
X-CRM114-Status: UNSURE (   8.69  )
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
Changelog:
- Change the revision threshold from < 0 to < 1 to correctly.
- Link to v1: https://lore.kernel.org/linux-iommu/3f22f7b8-449c-40d9-b4c8-fff3e520d563@arm.com/raw
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index d16d35c78c06..d5c35be5c858 100644
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
+			if (variant <= 1 && revision < 1) {
+				/* Arm erratum 2812531 */
+				smmu->features &= ~ARM_SMMU_FEAT_BTM;
+				smmu->options |= ARM_SMMU_OPT_CMDQ_FORCE_SYNC;
+				/* Arm errata 2268618, 2812531 */
+				smmu->features &= ~ARM_SMMU_FEAT_NESTING;
+			}
 			break;
 		}
 		break;

---
base-commit: b7ff7151e653aa296ab6c5495b2c1ab7c21eb250
change-id: 20260206-smmuv3-a88772377c20

Best regards,
-- 
Zhiyuan Dai <daizhiyuan@phytium.com.cn>


