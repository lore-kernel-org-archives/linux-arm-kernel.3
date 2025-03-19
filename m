Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4369FC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 14:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AS2XW5pVq0bthsTGPB5Ou/UximnBEjkkBn7KlYu8Dbk=; b=OQiQELyXdl3nLCyjTl+8QR/Jbp
	uHzL8o3avTGlTIL6Zc5FGN1v1Z7ZwaLz79gkxC9+DHwgUWmdtfO12RtmSYXEIIyK6ZgVbEGGgFLNG
	w5fjciT0Zk4rvmwV7kw115CBzNARUKoRth/c/Dlg/+QFPBcvBz4Yo4OO9Pn0BF/SmFPeFAnMS/D9k
	CSKa8wE+oCaWSqxtG2y80RAs9HyV9YRPEEYFXpIGB3aThTXlqptb4dAg0V4eamLoeF1mp3LzXiAPH
	3TpO0VNjhkVE4qzscbmxeYhC29gLdKzSTxL/ToUoM1kWHRIi5zqkWYQBS5QIZxw35zT9hHDpv9huX
	phMB7ucg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuujF-00000009FzE-2GxF;
	Wed, 19 Mar 2025 14:49:09 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuueP-00000009FGH-2VOC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 14:44:10 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7c553948a30so20390285a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 07:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742395448; x=1743000248; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AS2XW5pVq0bthsTGPB5Ou/UximnBEjkkBn7KlYu8Dbk=;
        b=HVEzrFWUaSkitqG+DRc8sclTt3XnDBhvZEgD2JSPe//57Idj49kxoxpjO3NfQuhqYH
         rpzyYhZy+7vdgitd3gfmyltwM/rwsXQTWagtxeBZTdS1ETm4tjUWIUSoFSZfi6LHfEFv
         TZ79oBkz5mS7d6B87uBaDyGxT4frC3BELyXdl0mTRXOe88K2QxurKkVoAC3fZCE1T+rd
         P8vVTcZw4uBQ+bp93Y81EJoYPfQjUCbX6uitVFkjHzlqg5y9IAHiV3sj5rD0LScO2y6w
         XlZIIexE/L8v2JvwXiK3Djn9+wJ/flWsLPnm/wgb821EXkezSFyy+W2QTKLvxNhNywfG
         lF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742395448; x=1743000248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AS2XW5pVq0bthsTGPB5Ou/UximnBEjkkBn7KlYu8Dbk=;
        b=eYyUoyJpCUdITC7ekHVSiFQS/xTDIzJtgLPlrOE/Q8hzkGe8Tte+ULZ1vN8iWFmF6u
         mJEvjrrzJzW4t3K5H3R4GIt47MD1D4Zhin4W4OfiLTcGKqaRZ8vpcOt8SI0UqRgA2TyJ
         1XNAleIv4z3YWc0/R3IyOfcsSJXztqEv552S7Qmm7SXZvQk3Is4oIl2zIpHJYKXyOV5B
         /U5WJo2MdLiSzmCjk4LM6CCJrAsdyOeQbPseq3uje9otjkuSngBDxAQxuXAjpvlYkqdf
         RyoQ1tGMO47JfzBsGV82a8lFfVrk3VbErEHJ++7SE+rlPOE/EJwrRi8KtPX0lHkt13PV
         OFiA==
X-Forwarded-Encrypted: i=1; AJvYcCUEwRevYj/ggALlu9ZZi6el5B/Gzvf26fdjfB19+cztLzVc9XfQCdgkqjrZqIivpxRh84vNLHGnIl7j/bsDcCmV@lists.infradead.org
X-Gm-Message-State: AOJu0YySnzmqKo7lUAAm+dNzAuFjYmKUlRU9M84Xgq7nzxoCu4sNtsip
	PiSpOgbmPxmCtyitKgzZCie9zDbOYu7yN56dI1XZibgnx/CGlRnF
X-Gm-Gg: ASbGncuQqoal9HifQjfywBgmiF7hzyazNO7hnuBuHMxotXDUUUd6wiRyx1eJ10pY/m3
	5BEbNbf4zYz+fUQvO3E3FCO+vC4Q67T17bGAYkUyHRzqvOhs2WEAIyKJNRkJj1VYDCT5odL1owN
	vwEYaoneInFXUDExeFdDG6Fc2M+7HPI3UnX1YCn7mYpzAlRJ/gWgsm0qW8cueWpAtU+Ew378qu3
	f8dvOayNq5seJowUaPTkUlW99Uc0WXTS281A/dhRkZ69XTpp1A1HwTTMia7xjfknFMtHtJs9qgq
	ESEcCaiedLKvCq9PUkjyVH6KSDYd2YQrBa4Eshx+04sDFCMiU5HF11P8FGuEP8gTCP9r/+zILC/
	dsOA=
X-Google-Smtp-Source: AGHT+IEUBVxNH3Lj7tUjS4Mop+GMxjYMq/idGTGfkbzDE/H+cThDC2WmGJXmJn8+8iyby/rSDnLTuw==
X-Received: by 2002:a05:620a:2907:b0:7c5:606e:763 with SMTP id af79cd13be357-7c5a83dac18mr168535685a.6.1742395448390;
        Wed, 19 Mar 2025 07:44:08 -0700 (PDT)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c573c5201fsm868587485a.23.2025.03.19.07.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:44:07 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 19 Mar 2025 10:44:00 -0400
Subject: [PATCH v5 1/5] iommu/arm-smmu: Save additional information on
 context fault
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-msm-gpu-fault-fixes-next-v5-1-97561209dd8c@gmail.com>
References: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
In-Reply-To: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742395446; l=6457;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=/ySPkR/aTeuRK+/xkC1Wp/+XmiGAN99nf8Z+rdcy/nM=;
 b=pW8dnSeUfSbbfScY5Vu7vapW0rnsWlSENK31M8LwJ9ZeP96qlfErtrGGKpYyBtWsx1mMigWyp
 vKyhFyEZW4TCrO317brQ3fcTSH96lKmKEef17al8GUGD6CWZfeVLay9
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_074409_643853_4E9BCA1E 
X-CRM114-Status: GOOD (  15.02  )
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

This will be used by drm/msm for GPU page faults, replacing the manual
register reading it does.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  6 ++--
 drivers/iommu/arm/arm-smmu/arm-smmu.c            | 35 ++++++++++++++----------
 drivers/iommu/arm/arm-smmu/arm-smmu.h            |  7 +++--
 3 files changed, 29 insertions(+), 19 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
index 548783f3f8e89fd978367afa65c473002f66e2e7..5bf1aa4aa941962710f1f14260e133d560aee86f 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
@@ -393,14 +393,14 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
 				      DEFAULT_RATELIMIT_INTERVAL,
 				      DEFAULT_RATELIMIT_BURST);
 
-	arm_smmu_read_context_fault_info(smmu, idx, &cfi);
+	arm_smmu_read_context_fault_info(smmu_domain, &cfi);
 
 	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT))
 		return IRQ_NONE;
 
 	if (list_empty(&tbu_list)) {
 		ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
-					 cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
+					 cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 
 		if (ret == -ENOSYS)
 			arm_smmu_print_context_fault_info(smmu, idx, &cfi);
@@ -412,7 +412,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
 	phys_soft = ops->iova_to_phys(ops, cfi.iova);
 
 	tmp = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
-				 cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
+				 cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 	if (!tmp || tmp == -EBUSY) {
 		ret = IRQ_HANDLED;
 		resume = ARM_SMMU_RESUME_TERMINATE;
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index ade4684c14c9b2724a71e2457288dbfaf7562c83..a02078eb968b81a35c1c086ed7007ea2a453ef94 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -405,13 +405,20 @@ static const struct iommu_flush_ops arm_smmu_s2_tlb_ops_v1 = {
 };
 
 
-void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int idx,
+void arm_smmu_read_context_fault_info(struct arm_smmu_domain *smmu_domain,
 				      struct arm_smmu_context_fault_info *cfi)
 {
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	int idx = smmu_domain->cfg.cbndx;
+
 	cfi->iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
+	cfi->ttbr0 = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTBR0);
 	cfi->fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
-	cfi->fsynr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
+	cfi->fsynr0 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
+	cfi->fsynr1 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR1);
 	cfi->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
+	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1)
+		cfi->contextidr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_CONTEXTIDR);
 }
 
 void arm_smmu_print_context_fault_info(struct arm_smmu_device *smmu, int idx,
@@ -419,7 +426,7 @@ void arm_smmu_print_context_fault_info(struct arm_smmu_device *smmu, int idx,
 {
 	dev_err(smmu->dev,
 		"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
-		cfi->fsr, cfi->iova, cfi->fsynr, cfi->cbfrsynra, idx);
+		cfi->fsr, cfi->iova, cfi->fsynr0, cfi->cbfrsynra, idx);
 
 	dev_err(smmu->dev, "FSR    = %08x [%s%sFormat=%u%s%s%s%s%s%s%s%s], SID=0x%x\n",
 		cfi->fsr,
@@ -437,15 +444,15 @@ void arm_smmu_print_context_fault_info(struct arm_smmu_device *smmu, int idx,
 		cfi->cbfrsynra);
 
 	dev_err(smmu->dev, "FSYNR0 = %08x [S1CBNDX=%u%s%s%s%s%s%s PLVL=%u]\n",
-		cfi->fsynr,
-		(u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_S1CBNDX, cfi->fsynr),
-		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_AFR) ? " AFR" : "",
-		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_PTWF) ? " PTWF" : "",
-		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_NSATTR) ? " NSATTR" : "",
-		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_IND) ? " IND" : "",
-		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_PNU) ? " PNU" : "",
-		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_WNR) ? " WNR" : "",
-		(u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_PLVL, cfi->fsynr));
+		cfi->fsynr0,
+		(u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_S1CBNDX, cfi->fsynr0),
+		(cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_AFR) ? " AFR" : "",
+		(cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_PTWF) ? " PTWF" : "",
+		(cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_NSATTR) ? " NSATTR" : "",
+		(cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_IND) ? " IND" : "",
+		(cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_PNU) ? " PNU" : "",
+		(cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_WNR) ? " WNR" : "",
+		(u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_PLVL, cfi->fsynr0));
 }
 
 static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
@@ -458,13 +465,13 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 	int idx = smmu_domain->cfg.cbndx;
 	int ret;
 
-	arm_smmu_read_context_fault_info(smmu, idx, &cfi);
+	arm_smmu_read_context_fault_info(smmu_domain, &cfi);
 
 	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT))
 		return IRQ_NONE;
 
 	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
-		cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
+		cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 
 	if (ret == -ENOSYS && __ratelimit(&rs))
 		arm_smmu_print_context_fault_info(smmu, idx, &cfi);
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index e2aeb511ae903302e3c15d2cf5f22e2a26ac2346..ef6915a0d9f62b0a1734a3ee57ea422615036094 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -543,12 +543,15 @@ int arm_mmu500_reset(struct arm_smmu_device *smmu);
 
 struct arm_smmu_context_fault_info {
 	unsigned long iova;
+	u64 ttbr0;
 	u32 fsr;
-	u32 fsynr;
+	u32 fsynr0;
+	u32 fsynr1;
 	u32 cbfrsynra;
+	u32 contextidr;
 };
 
-void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int idx,
+void arm_smmu_read_context_fault_info(struct arm_smmu_domain *smmu_domain,
 				      struct arm_smmu_context_fault_info *cfi);
 
 void arm_smmu_print_context_fault_info(struct arm_smmu_device *smmu, int idx,

-- 
2.47.1


