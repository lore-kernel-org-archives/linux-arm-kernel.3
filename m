Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17135C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 03:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CXPfrI60oNrK5u6bCV3aNX+XsdZR+asWKl3bKnq3y88=; b=N48y6wAYuRPg6Zh6gCCHUL37dl
	7Bq4ORp2DVzE8NlDhKLrVQm+jshAWWH34OMPKxOyU3F4RVJ8XMac5gf7qQvwuvhd894brn+/hfcn3
	+b5X7bZi++WVUODgzAGu2m7qeezK9bEktDXX+v+miK47lhFmZEKHjif9BdoQbBAO0jdUZSI9eTRoV
	/S4WQikQnhbr1E5Q44/K08SVA3o9Hs1U/KZlm+7UXztnrNEW4tYjfiTSY4qIHLfJ2uV9VD8k5Fl09
	bpvw/GhftIndTmcSM3nJk15UCqbjptOALmDtcADdHpqjWoRNUfI7sk9pDITftdBBH9VDSPyok4ljo
	ONSIhxgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1zpu-00000002e58-18yK;
	Tue, 08 Apr 2025 03:41:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1zj2-00000002dNK-3VuT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 03:34:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6708B6115B;
	Tue,  8 Apr 2025 03:34:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9841C4CEE5;
	Tue,  8 Apr 2025 03:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744083251;
	bh=TRxqNba1FVNttWXGyNADBZI4wo3jt4eA8mooq34DEqA=;
	h=From:To:Cc:Subject:Date:From;
	b=MkH0jsbEibXql9rWea8fM6DvGfJCXnaKvnY2KK7uAlW0WLmZX7A7Rya5MtvtOTxE8
	 b+2zFVPdiG0/g53IWf7F9Z3uu0p+Yxe+PmFE2df6tNYfe8pW3wTYLxp4hN3f0ojIVw
	 60YyYjiPIIRgyKNAZgaGgNoPvGSo0qcpLNygQGq71KamztoOPfmR/+hlfEqZDUfTlF
	 V1be6zCj7QreIaS2ldBZMjAIYJT7QHTXymtMzwFxLdUILxQevzlA/zEixv4cFF6VUL
	 sG/5vSVODbkTkyx/sPQFIPLOtr4eeFVMQDF44Uy2+sZdrSWTlGpfRibXMgbm+dchrK
	 ir3PFrZpX1Sxw==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org,
	robin.murphy@arm.com,
	jgg@ziepe.ca,
	nicolinc@nvidia.com,
	jsnitsel@redhat.com,
	praan@google.com,
	kevin.tian@intel.com,
	ddutile@redhat.com,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Subject: [PATCH] iommu/arm-smmu-v3: Add missing S2FWB feature detection
Date: Tue,  8 Apr 2025 09:03:51 +0530
Message-ID: <20250408033351.1012411-1-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Commit 67e4fe398513 ("iommu/arm-smmu-v3: Use S2FWB for NESTED domains")
introduced S2FWB usage but omitted the corresponding feature detection.
As a result, vIOMMU allocation fails on FVP in arm_vsmmu_alloc(), due to
the following check:

	if (!arm_smmu_master_canwbs(master) &&
	    !(smmu->features & ARM_SMMU_FEAT_S2FWB))
		return ERR_PTR(-EOPNOTSUPP);

This patch adds the missing detection logic to prevent allocation
failure when S2FWB is supported.

Fixes: 67e4fe398513 ("iommu/arm-smmu-v3: Use S2FWB for NESTED domains")
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 358072b4e293..c7d297ceabdb 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4405,6 +4405,8 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR3);
 	if (FIELD_GET(IDR3_RIL, reg))
 		smmu->features |= ARM_SMMU_FEAT_RANGE_INV;
+	if (FIELD_GET(IDR3_FWB, reg))
+		smmu->features |= ARM_SMMU_FEAT_S2FWB;
 
 	/* IDR5 */
 	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR5);
-- 
2.43.0


