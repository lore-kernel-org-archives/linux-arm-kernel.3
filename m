Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C39CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 22:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8gsMt/qJYcRL9ucHkcs+vvKUOXqHjlbxlLPWzRbnpQ0=; b=zsVqnCrGzPC2d8BE9e2XbRRrn5
	YqEhG8qH037DRFpzKzmVxWJ6L6f1X9FCTHK0NEPQYPejCDrfrp9dHwW3KftTMwsaHL44XmQ7Dd6do
	bpWTf+VMk9Ozmekl6wABtIps/782wIRyiJdV+A4IUCgwNGg0GDUl+b1IhFphfV1ybxqTwOrsZp1ss
	kS3h76/Tw+4ocGkK01QJlvyeshKSeqzCvVffE8QKR3Pk701cp5qjdzTsLi0y0VGZaZqD8NEXzDiMt
	Bm6/Rc+DPdiwzaT7tlu5AH9ll+UbgaIJkNH54mxFsyqKPy3jF3JMB6H5csCI9ipj3c7m4G4w1ilxj
	PH5711IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSMWG-00000004mR0-13rA;
	Wed, 27 May 2026 22:14:32 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSMW5-00000004mM8-043s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 22:14:22 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2bc6899bfb1so129787525ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 15:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779920060; x=1780524860; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8gsMt/qJYcRL9ucHkcs+vvKUOXqHjlbxlLPWzRbnpQ0=;
        b=bKJmuqtUZn6djOgVkGVdggrvnHfxeJ5mFIjEwFKq24938zo7D/w+tEBB8IvioPrWhm
         P5+4efyXJQ3VRkyl8O8xyzLF+HKjMaNvCcnlK/7fiOdGNp6nFIJ5KnFtCV2v7l/s6chy
         vnuSJb5HaQBWUE9nRRfhLKkN3KylIb7QFn9Lh45fXRdtZEkdwEWN+OaRTCG7CYmTEyuK
         evKMxm9b/li37M6tXea84r6mM2iHjhdWZCYOof4aEuWAFyCTn6UoNXik7/gGAaYj+mDv
         IzfiaskU0g2yEVq/9PyB+YgPUAF/3UwrMzcCj/ueS1uq1oES4C7AuI6aw/tGhnuJEJTG
         Le2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779920060; x=1780524860;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8gsMt/qJYcRL9ucHkcs+vvKUOXqHjlbxlLPWzRbnpQ0=;
        b=DYK3S1H+4Plr49LgfDRAqVm+32lWj/U+8J7VYpp44EzQI9wx1LU6jd+HL8R3hQ5KQq
         7irSolHwwNq/pKiVqAjrxTuIrhfleujKVcLx5BVxKernv0sHvgnJrriDa3jrmnY5c4wQ
         47JhUz3acMLL/H1FRLMiY/sAIfUMFtLMVYuPK8nKchDm46PhcUvM01iEEb8RPsQhaXYj
         b9lDK1t3WwczotrJn9+x1x8VqqYY+DffPd0ZoI/FzCTOaOBSVxEKAKSTR6Hk67L+OQHj
         mUYP9TK5YEmWvwGT0c4IeE3aVbR/zcSmyu6G16DQ3WMWqPmM8I1R8l5kxYXeVwZvYFYG
         ElBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8kuwfOZOvAN1J+eNKr2NPhEeIMs2F3Oj52O8b+Ykx0XwKuy2kzvt4DSk3EF7WpoDUtm7Ed9xMBaeSaZYMUudiA@lists.infradead.org
X-Gm-Message-State: AOJu0YyLv39XDsCGLvJuhWQlwNlUR+bIo/sJ1qqvy/wYhyqcnGPCiPlB
	Lqr3UI955Oy0n3yasH70qFH0oYQ4Ah/U6dqbJ7boNcaIAlxCXTy5cTFuUJhPsEIN5K47jw0Zs4d
	P7A==
X-Received: from plwp4.prod.google.com ([2002:a17:903:2484:b0:2be:fc8f:7217])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2f05:b0:2be:1eb1:eaf7
 with SMTP id d9443c01a7336-2beb05b5f70mr289297455ad.24.1779920059380; Wed, 27
 May 2026 15:14:19 -0700 (PDT)
Date: Wed, 27 May 2026 22:13:59 +0000
In-Reply-To: <20260527221407.1756491-1-praan@google.com>
Mime-Version: 1.0
References: <20260527221407.1756491-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260527221407.1756491-4-praan@google.com>
Subject: [PATCH v7 03/11] iommu/tegra241-cmdqv: Add a helper to drain VCMDQs
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_151421_060737_6147630C 
X-CRM114-Status: GOOD (  17.15  )
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

The tegra241-cmdqv driver supports vCMDQs which need to be drained
before suspending the SMMU. The current driver implementation only uses
VINTF0 for vCMDQs owned by the kernel which need to be drained. Add a
helper that drains all the enabled vCMDQs under VINTF0.

Add another function ptr to arm_smmu_impl_ops to drain implementation
specified queues and call it within `arm_smmu_drain_queues`.

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  7 +++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  1 +
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    | 27 +++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 0e77ef1e4523..8682be5060ed 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -915,6 +915,13 @@ static int arm_smmu_drain_queues(struct arm_smmu_device *smmu)
 	 */
 	ret = arm_smmu_queue_poll_until_empty(smmu, &smmu->cmdq.q);
 
+	if (ret)
+		goto out;
+
+	/* Drain all implementation-specific queues */
+	if (smmu->impl_ops && smmu->impl_ops->drain_queues)
+		ret = smmu->impl_ops->drain_queues(smmu);
+out:
 	return ret;
 }
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index c855ab4962ed..24d5e28eea88 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -885,6 +885,7 @@ struct arm_smmu_impl_ops {
 	size_t (*get_viommu_size)(enum iommu_viommu_type viommu_type);
 	int (*vsmmu_init)(struct arm_vsmmu *vsmmu,
 			  const struct iommu_user_data *user_data);
+	int (*drain_queues)(struct arm_smmu_device *smmu);
 };
 
 /* An SMMUv3 instance */
diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index 67be62a6e764..cb1e75e4ee91 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -414,6 +414,32 @@ tegra241_cmdqv_get_cmdq(struct arm_smmu_device *smmu,
 	return &vcmdq->cmdq;
 }
 
+static int tegra241_cmdqv_drain_vintf0_lvcmdqs(struct arm_smmu_device *smmu)
+{
+	struct tegra241_cmdqv *cmdqv =
+		container_of(smmu, struct tegra241_cmdqv, smmu);
+	struct tegra241_vintf *vintf = cmdqv->vintfs[0];
+	int ret = 0;
+	u16 lidx;
+
+	/* Kernel only uses VINTF0. Return if it's disabled */
+	if (!READ_ONCE(vintf->enabled))
+		return 0;
+
+	for (lidx = 0; lidx < cmdqv->num_lvcmdqs_per_vintf; lidx++) {
+		struct tegra241_vcmdq *vcmdq = vintf->lvcmdqs[lidx];
+
+		if (!vcmdq || !READ_ONCE(vcmdq->enabled))
+			continue;
+
+		ret = arm_smmu_queue_poll_until_empty(smmu, &vcmdq->cmdq.q);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
 /* HW Reset Functions */
 
 /*
@@ -845,6 +871,7 @@ static struct arm_smmu_impl_ops tegra241_cmdqv_impl_ops = {
 	.get_secondary_cmdq = tegra241_cmdqv_get_cmdq,
 	.device_reset = tegra241_cmdqv_hw_reset,
 	.device_remove = tegra241_cmdqv_remove,
+	.drain_queues = tegra241_cmdqv_drain_vintf0_lvcmdqs,
 	/* For user-space use */
 	.hw_info = tegra241_cmdqv_hw_info,
 	.get_viommu_size = tegra241_cmdqv_get_vintf_size,
-- 
2.54.0.794.g4f17f83d09-goog


