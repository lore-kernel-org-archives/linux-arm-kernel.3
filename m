Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E13BEA3F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 16:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L3mzE9q9JZeLiz5qheXEKidJ4W/5JZW1PBYdqCp5RPU=; b=YGO6W9xKk+A7MlmxmXLUWLZDjI
	JwF5B2EyTIgllWWvj0YtrpnYQxkg68jXNaHhsHpjrdyjfWpv1/4qaJZUFKkHFQg1nsM4PJIZEFTmw
	JxucOWvD/+NKQ/vRXlsveatdjmtpHnp3RVcLH6XqGJQTh7MQTqXoQb1bLhDkCqLLUHvKIx4dfUXl8
	0nG1YM5dg0/+1paRrHvpWOVk3CzWzjXL7jBn4PwljNgfpEcr/JEsMCyWbJKdccWGr48tuC5O6Xify
	sVXbCMwEFR2nfnf37fSRZ9E4Gi+tWUS/Eua5WuHeMabF9mxt5FXI30UJUA48Q4ZtIvaSc502FGDwP
	eH9r3Spw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqRN-0000000HD8O-0phT;
	Tue, 10 Feb 2026 16:18:17 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqRK-0000000HD7u-3bZ4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 16:18:15 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4376c0bffc1so1987523f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 08:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770740292; x=1771345092; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L3mzE9q9JZeLiz5qheXEKidJ4W/5JZW1PBYdqCp5RPU=;
        b=WTDj/8oldK6+aqbKd8bzIdNjjKGqATp6dkwVJrs6Hdmh6+jD/b1i3ZavWC4LIQkx28
         xmQYOgxip9wSbWQJQiMj1ylkR9xTE/5iSvBt+IGFzycOTQGBeUJTT8fAJRS/v3gQQXtg
         qJnrs6RhhQC27thPaL4rHAUED7tybL6aCDkBoofyOE6Xi098fFdiEittqtQuiP+rh7bK
         17S4XqMhks25BRnDvbU+XqhlvCllCSpHusBN3hcD08RSDw52rC/ZJdbnm2MmwAuAITFQ
         OGHkHOn4svmF6w4PbCZz/zQ5EtUQgKTEgs2/QNCGxUt/Ycuq+urlJo+oC6rabL1vlxUv
         ne/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770740292; x=1771345092;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3mzE9q9JZeLiz5qheXEKidJ4W/5JZW1PBYdqCp5RPU=;
        b=EyFTl1xCQuoLM5TAAN4YxvNill6EGZssH74dds/MVDlzLH1kkLLMOQOYlLwd9IF/l2
         piXeBRK2wniS3VR+3m1pFSVn4obAuR0pq/+JSqYgk9EVABdSIddtUW4VfMHKpJpuhh5P
         BWtOwStUHbzFozjw74XR1BBtqjRJi4oxuo+g8ZTqO1b6J65Uu/5RdlqNR+Bnu3hPddTH
         rzj9dz0pxS0CejSJMKnXdyiagtaUOVqgbrIUVmxIUQ+3SLAW3gnrDJkuXVmL9JPcYizx
         H2+FP+MfhjbPniGoQyXzVv0TTajpz8ssTp2UoyRSKE5Ktk0jkN8R2qUO5/j3pev5IlYa
         gdsw==
X-Forwarded-Encrypted: i=1; AJvYcCWGyvPxirMArSts4e/47x0DQVXv1mKSQBBE7RhSWU74Vp3cQfQcA0BSNQGEsynEHy9kqunrlhKi5wq/vbG34JVn@lists.infradead.org
X-Gm-Message-State: AOJu0YzYw2iUdvDCLO8z3zEzpfve80wFtA2I7M6F433q7gM/8sNEJITP
	nzVOGCX4+gMR8mv0/Mu+Yw/VEWgnQXNEKnOEQjnqSHdFiZh+qcWfA+I=
X-Gm-Gg: AZuq6aJs5W7aJL2wAQfYhGqDgtI6vKgSrtR0fwkq/keqBacwkHDUUvj7eO7xTJYOrmB
	ChFHKZ7IJvtyDsd/rFDf60z2NC4BuPr1lVW4L1pAkOBncR8wRg4poftMLHO/oaRGbYvbSQv3MXN
	SyFccenquZkXfK2PRYe9479EHi/uYYdnKnuz+VHhT0lBu8DwstnWtdGErRNd2brMV6VA1/sHScX
	cHuN9qg9w9MLNRzCHOYTtq547mL2tyJK18ujjEFhJZaEjU+z3HApWvR2uncteDUYQo3xUjdVFQx
	GqwSthKQXeWa+fdyKGLN7akq3mNEWJ09gs5QA05paCS5uNlz36sfCNQhJNYiK4dj3K4ijnmF8qX
	Mz52rgv2iZIguispju0bbq6c2d33lzpD4ZdpFR8y1dHLjGCgxWw+e3cr8pM4vewVM/2mHJ7ygnz
	Zzl0seyqNGnS3w8jJ7r+6RnexH1T50cAZNkWyCT73SPge3DNa2e2ZLON6p6vrELHanWf/ZPszJj
	NxlDBt+XVa4Hg==
X-Received: by 2002:a5d:5f54:0:b0:435:9ce0:f93c with SMTP id ffacd0b85a97d-4362969509amr24592397f8f.62.1770740291496;
        Tue, 10 Feb 2026 08:18:11 -0800 (PST)
Received: from [192.168.1.17] (host-79-19-172-190.retail.telecomitalia.it. [79.19.172.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fa41sm39165771f8f.23.2026.02.10.08.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 08:18:10 -0800 (PST)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Tue, 10 Feb 2026 17:17:38 +0100
Subject: [PATCH] iommu: arm-smmu-qcom: Ensure smmu is powered up in
 set_ttbr0_cfg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-qcom_smmu_pmfix-v1-1-78b7143ac053@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvyJ7TtAlOvSVCDHdag9aKUUg/j3pO
 AMzBTIlpgyjKJDo4cxHbKA7AW63cSPJvjGgwkGhVvJyRzA5hNucYeVXoiXrcbE9oYJWnYma/o/
 TXOsHqLYDBGEAAAA=
X-Change-ID: 20260210-qcom_smmu_pmfix-2aead2ba4e20
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770740289; l=2426;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=VRL/E7nK1fyZMX83uu6bt4FiGrPrpeuaTEztrOQsu9U=;
 b=3pZgXNEhwfzftk2Cfw8XXJ8nneEtPReIYQm7FPKnhsBaAF4wvq6oc6yGwv56OjIaVfHmJkCqc
 mZihmSR2ywFBaJPn3/li3OAgz3sQw2TocZC9SOPytLYad1lKiiWdrfF
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_081814_927723_F61A8838 
X-CRM114-Status: GOOD (  16.19  )
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

Previously the device was being accessed while potentially in a
suspended state.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 573085349df3..ca34b7a141e6 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -231,16 +231,27 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const void *cookie,
 	struct io_pgtable *pgtable = io_pgtable_ops_to_pgtable(smmu_domain->pgtbl_ops);
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
 	struct arm_smmu_cb *cb = &smmu_domain->smmu->cbs[cfg->cbndx];
+	int ret;
+
+	ret = pm_runtime_resume_and_get(smmu_domain->smmu->dev);
+	if (ret < 0) {
+		dev_err(smmu_domain->smmu->dev, "failed to get runtime PM: %d\n", ret);
+		return -ENODEV;
+	}
 
 	/* The domain must have split pagetables already enabled */
-	if (cb->tcr[0] & ARM_SMMU_TCR_EPD1)
-		return -EINVAL;
+	if (cb->tcr[0] & ARM_SMMU_TCR_EPD1) {
+		ret = -EINVAL;
+		goto out;
+	}
 
 	/* If the pagetable config is NULL, disable TTBR0 */
 	if (!pgtbl_cfg) {
 		/* Do nothing if it is already disabled */
-		if ((cb->tcr[0] & ARM_SMMU_TCR_EPD0))
-			return -EINVAL;
+		if ((cb->tcr[0] & ARM_SMMU_TCR_EPD0)) {
+			ret = -EINVAL;
+			goto out;
+		}
 
 		/* Set TCR to the original configuration */
 		cb->tcr[0] = arm_smmu_lpae_tcr(&pgtable->cfg);
@@ -249,8 +260,10 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const void *cookie,
 		u32 tcr = cb->tcr[0];
 
 		/* Don't call this again if TTBR0 is already enabled */
-		if (!(cb->tcr[0] & ARM_SMMU_TCR_EPD0))
-			return -EINVAL;
+		if (!(cb->tcr[0] & ARM_SMMU_TCR_EPD0)) {
+			ret = -EINVAL;
+			goto out;
+		}
 
 		tcr |= arm_smmu_lpae_tcr(pgtbl_cfg);
 		tcr &= ~(ARM_SMMU_TCR_EPD0 | ARM_SMMU_TCR_EPD1);
@@ -262,6 +275,8 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const void *cookie,
 
 	arm_smmu_write_context_bank(smmu_domain->smmu, cb->cfg->cbndx);
 
+out:
+	pm_runtime_put_autosuspend(smmu_domain->smmu->dev);
 	return 0;
 }
 

---
base-commit: 50c4a49f7292b33b454ea1a16c4f77d6965405dc
change-id: 20260210-qcom_smmu_pmfix-2aead2ba4e20

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


