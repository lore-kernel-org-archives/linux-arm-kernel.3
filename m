Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DFCFA3758
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 20:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QAiES4ydkx/sE81xhOe/Mnr1MZ9dy5PjroYTENfcCYY=; b=MefMWlqFOlJafouRN7Cui+o1wm
	OgIMvg57pkHZKFaaF+ka1JeXK8sGS5wNC8frp5vL3AaS8+AYdAlqlzmsfGcynjID5Jxz2poYYAG7J
	06z5mbrSFh1lQZSS3AymcxBsiQNPP1XwDRktljOMaQNqDx8mCu+FTtfjIeHY9YDiSEWFjvo8+bFu9
	FCdUQ/ETqesffu0CVPkuEOUAm3wiO2bpsau+3YsWm2sjNORuvMIiKnKzuuIO5dAJhcBtPlIxpYnrB
	W3GTtTNtgPshbUAA/W3JYw4/QNsEp+Idea1jgrFh778+N6PPbEXsBvTwMiwVGpRx1Kyxjj+39HfUZ
	xbvrVUEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbm9u-00000008iB8-3RJk;
	Fri, 02 Jan 2026 20:54:06 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbm9s-00000008iAk-1S25
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 20:54:05 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-430fe16b481so6295902f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 12:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767387241; x=1767992041; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QAiES4ydkx/sE81xhOe/Mnr1MZ9dy5PjroYTENfcCYY=;
        b=37XB5ltu72UKs7YcSrUp/cGBZiQjbrkMcFwxdricfkTCilgaUEp8glK+53LVBVUHpF
         R7HGuZPY/oO+ejsX/lnfzi3kh7XETxaXVQMhqpLra0uOy1hO6TnCq0vhEqg1nudk9fVa
         RYV9YMWinpuqEXyaEq8rVHZh3Qttyj8isK9j2VlxprNEoy/ekEsTkEWl1XVtKovVA8pI
         Vkp+n8jmoGaZu332hDBu6aSCgYH4qnCLoTSK17jri1XNjMJxLqJ+zx12gNGmoZrRD/f5
         P9qXfDORNVKMMMifTuwbHgcVi3OZRmjfS/Tyu8+TKtdLEi42DStWrPQCDExkuKKcA8FD
         D5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767387241; x=1767992041;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QAiES4ydkx/sE81xhOe/Mnr1MZ9dy5PjroYTENfcCYY=;
        b=MExmOWQn6SG4qBVBSeEcMvDgqqkaAxs2SLAn2/Lc/f1W2VkkGjE1+3K2WOC6vPA3Zm
         /XnMwf1mZfRZaHHeJWu9iGRb6IeepygG8qB4t3a32joZTc5xkYFmEJX9qdFXom11LABt
         NzMWoRx1yMjc2dIGnybZuaiqJS3kTEij2zMBo5NtPTC4WXNEFAEsEseA4fEaxpVpIuOb
         /oTcv+d/lb/sBA+MZZGeNs4vxZ2wyutRrD4ObJKC5vI0OghiQsxNLDJf+a6xwrfN8WFK
         pgQEfiXSreyuIU/jsLrstLVYDUfJy0hdNvxTE5igK46mcf9GQP7l2shOKW57pS7LUg5H
         TjAw==
X-Forwarded-Encrypted: i=1; AJvYcCUFHxFW5fS8sKz5e20iOxoI5MQbmjCWUpNlkhZYQ12CEpMwmryr7LAh5hhjCBtzVyuvwsjE+KQOG0/ivP9VurVT@lists.infradead.org
X-Gm-Message-State: AOJu0YwKH7CN+CLvqvqNRzKG/3pYioYG0lMC1qTgRuXwh9oUInkRgDBq
	Zt624ADOUVJca2B2uou7671j9TSnd6qqwLG/iDYS7KgPiVl0TWHlQqG+LtvXfYqFHwtRZuW2dAG
	SzeNG5kYYAu6OoA==
X-Google-Smtp-Source: AGHT+IFCfqRVI6Uhl1ADxzrnaLqH6bdZb69W6Eaty3oAr+lEqEgaoNlylt3n+Pn7rT0RzZhlQc+mMngowh5RnA==
X-Received: from wrgb4.prod.google.com ([2002:a05:6000:3c4:b0:432:88c1:541b])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:430b:b0:431:808:2d32 with SMTP id ffacd0b85a97d-4324e4c716dmr50567943f8f.7.1767387241484;
 Fri, 02 Jan 2026 12:54:01 -0800 (PST)
Date: Fri,  2 Jan 2026 20:53:52 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20260102205353.2725509-1-smostafa@google.com>
Subject: [PATCH RESEND] iommu/arm-smmu-v3: Remove IAS
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: robin.murphy@arm.com, will@kernel.org, joro@8bytes.org, 
	Mostafa Saleh <smostafa@google.com>, Tomasz Nowicki <tnowicki@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_125404_431571_4D470B28 
X-CRM114-Status: GOOD (  15.17  )
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

The driver only supports AArch64 page tables where OAS == IAS.

Remove the extra IAS tracking for AArch32 as this feature was
never implemented and that was creating BAD_STEs for SMMUv3
with stage-2 and OAS < 40.

Further discussion on this in:
https://lore.kernel.org/linux-iommu/20251130194506.593700-1-smostafa@google.com/

Reported-by: Tomasz Nowicki <tnowicki@google.com>
Fixes: f0c453dbcce7 ("iommu/arm-smmu: Ensure IAS is set correctly for AArch32-capable SMMUs")
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 18 +++++-------------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  2 --
 2 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index d16d35c78c06..019211db621d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2551,7 +2551,7 @@ static int arm_smmu_domain_finalise(struct arm_smmu_domain *smmu_domain,
 				     ARM_SMMU_FEAT_VAX) ? 52 : 48;
 
 		pgtbl_cfg.ias = min_t(unsigned long, ias, VA_BITS);
-		pgtbl_cfg.oas = smmu->ias;
+		pgtbl_cfg.oas = smmu->oas;
 		if (enable_dirty)
 			pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_ARM_HD;
 		fmt = ARM_64_LPAE_S1;
@@ -2561,7 +2561,7 @@ static int arm_smmu_domain_finalise(struct arm_smmu_domain *smmu_domain,
 	case ARM_SMMU_DOMAIN_S2:
 		if (enable_dirty)
 			return -EOPNOTSUPP;
-		pgtbl_cfg.ias = smmu->ias;
+		pgtbl_cfg.ias = smmu->oas;
 		pgtbl_cfg.oas = smmu->oas;
 		fmt = ARM_64_LPAE_S2;
 		finalise_stage_fn = arm_smmu_domain_finalise_s2;
@@ -4395,13 +4395,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	}
 
 	/* We only support the AArch64 table format at present */
-	switch (FIELD_GET(IDR0_TTF, reg)) {
-	case IDR0_TTF_AARCH32_64:
-		smmu->ias = 40;
-		fallthrough;
-	case IDR0_TTF_AARCH64:
-		break;
-	default:
+	if (!(FIELD_GET(IDR0_TTF, reg) & IDR0_TTF_AARCH64)) {
 		dev_err(smmu->dev, "AArch64 table format not supported!\n");
 		return -ENXIO;
 	}
@@ -4514,8 +4508,6 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 		dev_warn(smmu->dev,
 			 "failed to set DMA mask for table walker\n");
 
-	smmu->ias = max(smmu->ias, smmu->oas);
-
 	if ((smmu->features & ARM_SMMU_FEAT_TRANS_S1) &&
 	    (smmu->features & ARM_SMMU_FEAT_TRANS_S2))
 		smmu->features |= ARM_SMMU_FEAT_NESTING;
@@ -4525,8 +4517,8 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	if (arm_smmu_sva_supported(smmu))
 		smmu->features |= ARM_SMMU_FEAT_SVA;
 
-	dev_info(smmu->dev, "ias %lu-bit, oas %lu-bit (features 0x%08x)\n",
-		 smmu->ias, smmu->oas, smmu->features);
+	dev_info(smmu->dev, "oas %lu-bit (features 0x%08x)\n",
+		 smmu->oas, smmu->features);
 	return 0;
 }
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index ae23aacc3840..0a5bb57dbdfe 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -43,7 +43,6 @@ struct arm_vsmmu;
 #define IDR0_COHACC			(1 << 4)
 #define IDR0_TTF			GENMASK(3, 2)
 #define IDR0_TTF_AARCH64		2
-#define IDR0_TTF_AARCH32_64		3
 #define IDR0_S1P			(1 << 1)
 #define IDR0_S2P			(1 << 0)
 
@@ -784,7 +783,6 @@ struct arm_smmu_device {
 	int				gerr_irq;
 	int				combined_irq;
 
-	unsigned long			ias; /* IPA */
 	unsigned long			oas; /* PA */
 	unsigned long			pgsize_bitmap;
 
-- 
2.52.0.351.gbe84eed79e-goog


