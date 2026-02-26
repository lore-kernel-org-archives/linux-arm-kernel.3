Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93224FD8FDA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 18:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q64LJa1hptSYLaVrmk2INQeLb45gXE4GwXs1wzqq0wE=; b=2hGhquSyy2Yq5KQ602PQ/ZajoH
	5z+29abjexSs7z+UOk1lj4RLUyRb/mxikT+PFMBwDOcTKFWqwdOFzucxFciOEjYrxvj1V8GDSot5z
	KZ8/3PJrL/YMOnYsIMbWJ0dtAvNzNckeBK6gzsMX8S9N7Xyht2CRHqNpyaaGMl8745/BUV/Zp2E6S
	FY4/UV2+A87OhQxvkB+M4xZEh63f0NEvqaYyd3ixHftooT1iX7GPyb/Dm+6+X9cW0GqGC9nbzriwC
	GwjE08XNqhRKS7jNJZLoYNUrGzrSdKiQO55ODaX1AQYXy5Dc1+43K2UhDkFLfVIq2LGlgHB8VUUk5
	NPyAF14w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfpO-00000006vWT-0JvY;
	Thu, 26 Feb 2026 18:11:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfpJ-00000006vUM-1eKK
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 18:11:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Q64LJa1hptSYLaVrmk2INQeLb45gXE4GwXs1wzqq0wE=; b=Yl0eWQ6NrhwcKdFArO4EpeU9+U
	OTCe8siBEhT38VTENp5grQzaDFGImkjGbamkaaPIJbBbCmNVwQprzjl0GsvCNdv27fgz0cpq0OAog
	1ZhrCsoS80yh28k+cTfJCUy8quLw7XcrLRv93JQ+jresiAjIhQyBbjJqfgnXv0zRE8ty9AMj1NVvN
	d9U+WgUAADaAird1VDEp+diMfi33gvNMdRcKGlWFOWTUMXARK/mdca6S1B93lhe+XerFB468A2F41
	ysO9tL/IkcYGHyTMRZbKKZsR/IuOSHhzx46zNPRsPtzslR/klx9CmJGXqm7QdSrL3j8FTD1PTnxjo
	zpNnx4aQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfpG-0000000BkwA-0ba0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 18:11:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA6841762;
	Thu, 26 Feb 2026 10:10:24 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0DC893F73B;
	Thu, 26 Feb 2026 10:10:29 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	catalin.marinas@arm.com,
	joro@8bytes.org
Cc: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	daizhiyuan@phytium.com.cn
Subject: [PATCH 2/3] iommu/arm-smmu-v3: Update Arm errata
Date: Thu, 26 Feb 2026 18:10:21 +0000
Message-Id: <06b86c11a4642ee64a7735eca02406e43ee2105f.1772125743.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1772125743.git.robin.murphy@arm.com>
References: <cover.1772125743.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_181102_607707_D5933A6A 
X-CRM114-Status: UNSURE (   9.92  )
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

MMU-700 r1p1 has subsequently fixed some of the errata for which we've
been applying the workarounds unconditionally, so we can now make those
conditional. However, there have also been some more new cases
identified where we must rely on range invalidation commands, and thus
still nominally avoid DVM being inadvertently enabled.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 Documentation/arch/arm64/silicon-errata.rst | 10 ++++++++--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 18 ++++++++++++++----
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 2e8f57657de7..745ff25f5854 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -212,8 +212,14 @@ stable kernels.
 | ARM            | MMU-600         | #1076982,       | N/A                         |
 |                |                 | #1209401        |                             |
 +----------------+-----------------+-----------------+-----------------------------+
-| ARM            | MMU-700         | #2268618,       | N/A                         |
-|                |                 | #2812531        |                             |
+| ARM            | MMU-700         | #2133013,       | N/A                         |
+|                |                 | #2268618,       |                             |
+|                |                 | #2812531,       |                             |
+|                |                 | #3777127        |                             |
++----------------+-----------------+-----------------+-----------------------------+
+| ARM            | MMU L1          | #3878312        | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
+| ARM            | MMU S3          | #3995052        | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | GIC-700         | #2941627        | ARM64_ERRATUM_2941627       |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 4d00d796f078..3d816c67508d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4308,6 +4308,8 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 #define IIDR_IMPLEMENTER_ARM		0x43b
 #define IIDR_PRODUCTID_ARM_MMU_600	0x483
 #define IIDR_PRODUCTID_ARM_MMU_700	0x487
+#define IIDR_PRODUCTID_ARM_MMU_L1	0x48a
+#define IIDR_PRODUCTID_ARM_MMU_S3	0x498
 
 static void arm_smmu_device_iidr_probe(struct arm_smmu_device *smmu)
 {
@@ -4332,11 +4334,19 @@ static void arm_smmu_device_iidr_probe(struct arm_smmu_device *smmu)
 				smmu->features &= ~ARM_SMMU_FEAT_NESTING;
 			break;
 		case IIDR_PRODUCTID_ARM_MMU_700:
-			/* Arm erratum 2812531 */
+			/* Many errata... */
+			smmu->features &= ~ARM_SMMU_FEAT_BTM;
+			if (variant < 1 || revision < 1) {
+				/* Arm erratum 2812531 */
+				smmu->options |= ARM_SMMU_OPT_CMDQ_FORCE_SYNC;
+				/* Arm errata 2268618, 2812531 */
+				smmu->features &= ~ARM_SMMU_FEAT_NESTING;
+			}
+			break;
+		case IIDR_PRODUCTID_ARM_MMU_L1:
+		case IIDR_PRODUCTID_ARM_MMU_S3:
+			/* Arm errata 3878312/3995052 */
 			smmu->features &= ~ARM_SMMU_FEAT_BTM;
-			smmu->options |= ARM_SMMU_OPT_CMDQ_FORCE_SYNC;
-			/* Arm errata 2268618, 2812531 */
-			smmu->features &= ~ARM_SMMU_FEAT_NESTING;
 			break;
 		}
 		break;
-- 
2.39.2.101.g768bb238c484.dirty


