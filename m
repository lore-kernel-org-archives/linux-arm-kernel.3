Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D1FFF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 08:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5Y9tCp87R5OEATyVvxp5xmQHQzwSbqjDEuvyjPvH2k=; b=MEvQ+u/AtSQhgxNP7lv/KK2kpm
	rJhpU7vAlzrFIgWeYU4yBU/AsyIIqKJ+giUT6s+aoOlEmrDLafxk93s620GS3S97JyOSadtaiGpdu
	7MEz6BAfQQ0jj5OkdxkjXX6yiwo8qo4UMkCURDOym2ITjtfvKnIiujLdkupCfvfxhJgcIb9H1E7vd
	KXc0Uvv7bXjFGXZGN0KBHa7kQVKkSJ9MFRUKMiAoiIabOtXA/vofAi/v/txv8gbKjC48Hm5zZtmZN
	u1g8d32cuLu7J2lECH31jXSraVWX/a794W5ckP4CT94q2U+TpTp8rLlkuwdSPtlnWX7oFJ3HV2thr
	eoDEv4Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHjG-0000000GUkM-3m8q;
	Mon, 27 Apr 2026 08:54:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHjG-0000000GUk0-2MyB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 08:54:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 09C7860581;
	Mon, 27 Apr 2026 08:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 233AAC19425;
	Mon, 27 Apr 2026 08:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777280049;
	bh=Bo7WyqkDkmCNfV2kNVREL1QfabEb/FOXWjg40u50nEo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KAoPPgkhwpgN1Eg4Z1cqoyhOog3uD8niofmCtPhbELIDud647rXoZjo5QB+ihkZA/
	 zUYjwTfj/hBQ5aZnlWrgVIWRBiGYc2PHXFZdFxQ+vkRUaASfjXW2lyLBdb08LBCjBq
	 Q+nZccSEmUCeAu76CJR462hTAwxBO8i0ZGMIj1XlvmfA5Vf0FtWpQbBUrp9TFrHrFC
	 1MBpKKoiu+GCC39QmraCM4PT7f6nfGawbelRaquNJoOGVNz2ZHX2JC98LcHTRh350k
	 GKZ1F0G5SoagHIioNTF3c/OdoJpAsqm/joUxGUJKchN1TgcPRi2sHCQX99PursRBoe
	 Az4YHikYFWg6g==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Joerg Roedel <joro@8bytes.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: [RFC PATCH v4 02/16] iommu/arm-smmu-v3: Save the programmed MSI message in msi_desc
Date: Mon, 27 Apr 2026 14:23:30 +0530
Message-ID: <20260427085344.941627-3-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427085344.941627-1-aneesh.kumar@kernel.org>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
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

Cache the MSI message in desc->msg from arm_smmu_write_msi_msg(). The
realm support code later reads the MSI address and data through
irq_get_msi_desc(), so it needs the descriptor to reflect the last
programmed message.

This matches the caching done by __pci_write_msi_msg().

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index d5b9ab95beea..17fd99887aab 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4012,6 +4012,9 @@ static void arm_smmu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
 	if (smmu->features & ARM_SMMU_FEAT_PRI)
 		max_config_index = PRIQ_MSI_INDEX;
 
+	/* save the programmed msi message details */
+	desc->msg = *msg;
+
 	/* Don't try to config for Realm interrupts. */
 	if (desc->msi_index > max_config_index)
 		return;
-- 
2.43.0


