Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62965C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 19:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKwWd1zwn0Yxg+W92eRYpmp+BjoWMge27vduBcQ83sA=; b=yHbtBlT7Ybm2EinyhfxKJ232os
	ftAs2jBmYTyCH2VQ5P/XWM6eZQKHIwwyca/2IlbYdhsAZZxBrG42Uzs9O3/Z6sZjoryVmCjrnVoNg
	gqwh8UhHnV/00Lr7kIlv6wza6Ko2sCcRwD/roqfWA+KqzyMhVdr68Jq1fL5L8ymxFEgk8Fluka9nH
	fzSSQnGG5KoMSP3Dzl0qrlxjWLpHmMmA6wYxkQvNAhoeLBGTyOim9P+C/YriYALD1ldL9S03bdqWE
	Ky4xljaGwwgs324P+SufWpx3PV2lG2a0oaMSXS1YKvwlCsUNEHuNXbqASUipaXg9DwdI8yof4e2xT
	iNME+iVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1s5l-00000001oDW-2CEy;
	Mon, 07 Apr 2025 19:25:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1qww-00000001U53-2BST
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 18:12:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0498AA483FE;
	Mon,  7 Apr 2025 18:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85454C4CEDD;
	Mon,  7 Apr 2025 18:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744049517;
	bh=Pbv0skuYZDrgl8lV7uBRFZi1ziYQNGkyBwUNPQWzd4E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lrgt/2gGESUhtsH9Bn/4F+WClFTBPnMLKYV5LsVAxFAq3x7OshyR0NSKaEcj/BSnZ
	 cdZfIcrebyad+2Di7bNqMc3YM3pzK+WTUK/Us90Bdf6j/KhaOLoVI88BnU+EEbS7fY
	 xmBwdDG/tq8KEdotsHPzXM8ZosAveeQk/Kc7a69mNjoE1CQ63P1X744pdF0giuVByx
	 5fVLCCF0hnz7l406JH6zsHVdCmVeG3NUAZJBsk865DyUJetM/k4Zi6iWPKTIA7aAlh
	 nO44jWnCBjUqIg11FwstpQZuAMzXtg114WHY+AP3za4RsRjMfMEl6cYNDJXtnw4Xjg
	 aEblvCQkgS1kA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nicolin Chen <nicolinc@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Will Deacon <will@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	joro@8bytes.org,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	nathan@kernel.org,
	peterz@infradead.org,
	yi.l.liu@intel.com,
	jsnitsel@redhat.com,
	mshavit@google.com,
	zhangzekun11@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev
Subject: [PATCH AUTOSEL 6.14 24/31] iommu/arm-smmu-v3: Set MEV bit in nested STE for DoS mitigations
Date: Mon,  7 Apr 2025 14:10:40 -0400
Message-Id: <20250407181054.3177479-24-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407181054.3177479-1-sashal@kernel.org>
References: <20250407181054.3177479-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.1
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_111158_683928_C1C352F6 
X-CRM114-Status: GOOD (  13.58  )
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

From: Nicolin Chen <nicolinc@nvidia.com>

[ Upstream commit da0c56520e880441d0503d0cf0d6853dcfb5f1a4 ]

There is a DoS concern on the shared hardware event queue among devices
passed through to VMs, that too many translation failures that belong to
VMs could overflow the shared hardware event queue if those VMs or their
VMMs don't handle/recover the devices properly.

The MEV bit in the STE allows to configure the SMMU HW to merge similar
event records, though there is no guarantee. Set it in a nested STE for
DoS mitigations.

In the future, we might want to enable the MEV for non-nested cases too
such as domain->type == IOMMU_DOMAIN_UNMANAGED or even IOMMU_DOMAIN_DMA.

Link: https://patch.msgid.link/r/8ed12feef67fc65273d0f5925f401a81f56acebe.1741719725.git.nicolinc@nvidia.com
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 2 ++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c         | 4 ++--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h         | 1 +
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
index 5aa2e7af58b47..34a0be59cd919 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -43,6 +43,8 @@ static void arm_smmu_make_nested_cd_table_ste(
 	target->data[0] |= nested_domain->ste[0] &
 			   ~cpu_to_le64(STRTAB_STE_0_CFG);
 	target->data[1] |= nested_domain->ste[1];
+	/* Merge events for DoS mitigations on eventq */
+	target->data[1] |= cpu_to_le64(STRTAB_STE_1_MEV);
 }
 
 /*
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 358072b4e293e..59749e8180afc 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1052,7 +1052,7 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
 			cpu_to_le64(STRTAB_STE_1_S1DSS | STRTAB_STE_1_S1CIR |
 				    STRTAB_STE_1_S1COR | STRTAB_STE_1_S1CSH |
 				    STRTAB_STE_1_S1STALLD | STRTAB_STE_1_STRW |
-				    STRTAB_STE_1_EATS);
+				    STRTAB_STE_1_EATS | STRTAB_STE_1_MEV);
 		used_bits[2] |= cpu_to_le64(STRTAB_STE_2_S2VMID);
 
 		/*
@@ -1068,7 +1068,7 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
 	if (cfg & BIT(1)) {
 		used_bits[1] |=
 			cpu_to_le64(STRTAB_STE_1_S2FWB | STRTAB_STE_1_EATS |
-				    STRTAB_STE_1_SHCFG);
+				    STRTAB_STE_1_SHCFG | STRTAB_STE_1_MEV);
 		used_bits[2] |=
 			cpu_to_le64(STRTAB_STE_2_S2VMID | STRTAB_STE_2_VTCR |
 				    STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2ENDI |
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index bd9d7c85576a2..7290bd4c2bb0a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -266,6 +266,7 @@ static inline u32 arm_smmu_strtab_l2_idx(u32 sid)
 #define STRTAB_STE_1_S1COR		GENMASK_ULL(5, 4)
 #define STRTAB_STE_1_S1CSH		GENMASK_ULL(7, 6)
 
+#define STRTAB_STE_1_MEV		(1UL << 19)
 #define STRTAB_STE_1_S2FWB		(1UL << 25)
 #define STRTAB_STE_1_S1STALLD		(1UL << 27)
 
-- 
2.39.5


