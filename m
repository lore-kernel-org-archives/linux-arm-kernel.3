Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5385C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 14:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVIOe6YO1QFlgbOaSVSB9MxST2MN7teDfhAEgXLqPn8=; b=zJr2FbBfbMj6Fn/Wm3lBcAuA8m
	OofT0VrLz81GgYUPOPSTk6OdWJI7x0qeET3mK5CwR3GvPe3MgLbcyjxnRPsGhYRCQrr5wxrkz61GA
	VDffntP+GhY438GH57uJyfiyaxOgIVP6pUztFDa83gbE2DNcOLVlWP16Wajk56wMboXgA/qo4Vbmr
	pzL+hdqhRPpnyzs+Wlyqw1XVPU9jVgq/huYOUkMAskqh6PyvRCvnQp0tvsfQTg/HrG7M2lgoQ4oCl
	3ku+st0mlxf+zj6l9CVIVVeVAXbGzuAu0hUI7o6KHj3fLR/aqvHzuO6ab+z8EVG7VhincJVEcufYS
	V6WE8bpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuuku-00000009GBF-0rRE;
	Wed, 19 Mar 2025 14:50:52 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuueQ-00000009FGs-3QNs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 14:44:12 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7c23aede3deso93204885a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 07:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742395450; x=1743000250; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LVIOe6YO1QFlgbOaSVSB9MxST2MN7teDfhAEgXLqPn8=;
        b=Hh2LzXT8jbv8xMFSWQ8zccWiXaqPACNkqEwPa6bMB4ljq/mq2H/KdXU7N1xlNCZ68i
         Qc3YxVcY7CbVC8nd5v2DcdVkmPQ4CfkUnF8KjfDA14hTm5WdW5JLzYsFb1/KA++wXEN5
         tukqusVqliSdTHIRoQK2nR+BBprJjB2uHKMvzctUwcqveogdulUSchX0cq200+CR+45B
         KNkOQxqCRsRoUdbAITXqVVT/DM8LBF8OQxcTOEQCEM7tDmTyDx+/Mf8WBdWALRH2PByj
         CNHKDO72wv78K2Ypb721n+gQ72W4M1DB3rMug0dZz1KLFnAMks2ErJlBMu/8FYuILBX/
         cXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742395450; x=1743000250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVIOe6YO1QFlgbOaSVSB9MxST2MN7teDfhAEgXLqPn8=;
        b=r9bDr3XNYQmCJhSWXCfVUs+kbq/yFx1LXEj3Uj1tta1+X2gr7QHY00WMlHW+ESAP2t
         xXPetNsN71a0ID9o+0ljQEnz+R456FdPbhx33gHhA9cfoFD4IM65rLUyD7vmVnkdM9Fs
         Rtypia70C/Wn7+VqCHc2gNhtFx7CrLBPzBGri24cEEQ55p8XbtyiWPspfYvzcZz7D7sU
         V9fenfyMuwWQcZlgXxHUFC1x8E8OSU06FSCrBw4CknQvCRnovscasEfkaif5pyFpLbVD
         CDDvoH3J4/KVI52wFflbFWJxzTFP1ah1ZhgpKgjLIuEQ/k/yDgbdvkd/kfeiLwUGApl5
         4m0A==
X-Forwarded-Encrypted: i=1; AJvYcCVGRefall5JMUcbt354Lsi+bhfrZfeQY1B3jI6fU3xoFNG+TvP9MNXe2rO69uF8hWzy4ruN5yMz8ajr95CtCs6z@lists.infradead.org
X-Gm-Message-State: AOJu0YxlEpbpiifh2FYsV0Kzf495EMUWeMpi2aamYkPHwaiCHEgLN+XA
	m+8tFre2KaY0TS2A7fe7k/Kmwh4fbco8w017+jL7lEn+zTJeryh+
X-Gm-Gg: ASbGnctrZSjRFHV/xEFfbgJPpipzCA3jMbWy2wolz50Y3MEGYeEWkh9d5NmMh44Sf0I
	lYKVgxFAR9C2IosKIhVrL3O8DEd+VjEiRtoDlMpfrreFhp0UKN5ihsBzn+eZxLefcNCS2XzhzmF
	dZ1K+P7y4vcuSaOY+lAouSPMKw84S8eKI8VEKm0RTJMRbORWBMpNAm+qTZPWAf8cb734mxtS8Kb
	djto0cah7Znr5CRGn/Iep5bwS5arxC3U26vO2qUvhE6OL+TuCs5vcLbnDZjma+hdgLQqWA2Q6pQ
	9rmfp9ecXhhaTR+e4eVeQC4cSeoitGpk6QmgZAzkENhoIDI/8cnfJ4kbjz4HmZ7h+y50hRI+fxT
	x2k8=
X-Google-Smtp-Source: AGHT+IFNRUs3nv+7+hsvhyD1099wEYjZlC8bdXc8Jfmcl+lTK2hcYAEosbvXtZXZvJ/hQAwsmaiwrg==
X-Received: by 2002:a05:620a:2485:b0:7c0:b018:5930 with SMTP id af79cd13be357-7c5a849ceb4mr150552885a.15.1742395449476;
        Wed, 19 Mar 2025 07:44:09 -0700 (PDT)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c573c5201fsm868587485a.23.2025.03.19.07.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:44:09 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 19 Mar 2025 10:44:01 -0400
Subject: [PATCH v5 2/5] iommu/arm-smmu-qcom: Don't read fault registers
 directly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-msm-gpu-fault-fixes-next-v5-2-97561209dd8c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742395446; l=5867;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=tTTpB0Ao5UrDtWkZT9tEFwgF3Yy2+aFm7zr2QcY9Sdk=;
 b=SbxyVBfCazjMcZnOBvSnP6XYVUpV1d+ECUu5MQSlhmDcQ2Sqe2AtsfGxR81gtgborBDdYHY9U
 6zMkNpecHzPArS1lpqtpzbf/QtWVL0UWm99pJ9QFFbo6w9vGuBQfa1U
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_074410_871868_7F8511E9 
X-CRM114-Status: GOOD (  17.87  )
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

In some cases drm/msm has to resume a stalled transaction directly in
its fault handler. Experimentally this doesn't work on SMMU500 if the
fault hasn't already been acknowledged by clearing FSR. Rather than
trying to clear FSR in msm's fault handler and implementing a
tricky handshake to avoid accidentally clearing FSR twice, we want to
clear FSR before calling the fault handlers, but this means that the
contents of registers can change underneath us in the fault handler and
msm currently uses a private function to read the register contents for
its own purposes in its fault handler, such as using the
implementation-defined FSYNR1 to determine which block caused the fault.
Fix this by making msm use the register values already read by arm-smmu
itself before clearing FSR rather than messing around with reading
registers directly.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 19 +++++++++----------
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 14 +++++++-------
 drivers/iommu/arm/arm-smmu/arm-smmu.h      | 21 +++++++++++----------
 3 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 6372f3e25c4bc24cb52f9233095170e8aa510a53..186d6ad4fd1c990398df4dec53f4d58ada9e658c 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -62,16 +62,15 @@ static void qcom_adreno_smmu_get_fault_info(const void *cookie,
 		struct adreno_smmu_fault_info *info)
 {
 	struct arm_smmu_domain *smmu_domain = (void *)cookie;
-	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
-	struct arm_smmu_device *smmu = smmu_domain->smmu;
-
-	info->fsr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSR);
-	info->fsynr0 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR0);
-	info->fsynr1 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR1);
-	info->far = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_FAR);
-	info->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(cfg->cbndx));
-	info->ttbr0 = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_TTBR0);
-	info->contextidr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_CONTEXTIDR);
+	struct arm_smmu_context_fault_info *cfi = &smmu_domain->cfi;
+
+	info->fsr = cfi->fsr;
+	info->fsynr0 = cfi->fsynr0;
+	info->fsynr1 = cfi->fsynr1;
+	info->far = cfi->iova;
+	info->cbfrsynra = cfi->cbfrsynra;
+	info->ttbr0 = cfi->ttbr0;
+	info->contextidr = cfi->contextidr;
 }
 
 static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index a02078eb968b81a35c1c086ed7007ea2a453ef94..c7b5d7c093e71050d29a834c8d33125e96b04d81 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -457,26 +457,26 @@ void arm_smmu_print_context_fault_info(struct arm_smmu_device *smmu, int idx,
 
 static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 {
-	struct arm_smmu_context_fault_info cfi;
 	struct arm_smmu_domain *smmu_domain = dev;
+	struct arm_smmu_context_fault_info *cfi = &smmu_domain->cfi;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
 				      DEFAULT_RATELIMIT_BURST);
 	int idx = smmu_domain->cfg.cbndx;
 	int ret;
 
-	arm_smmu_read_context_fault_info(smmu_domain, &cfi);
+	arm_smmu_read_context_fault_info(smmu_domain, cfi);
 
-	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT))
+	if (!(cfi->fsr & ARM_SMMU_CB_FSR_FAULT))
 		return IRQ_NONE;
 
-	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
-		cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
+	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi->iova,
+		cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 
 	if (ret == -ENOSYS && __ratelimit(&rs))
-		arm_smmu_print_context_fault_info(smmu, idx, &cfi);
+		arm_smmu_print_context_fault_info(smmu, idx, cfi);
 
-	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
+	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi->fsr);
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index ef6915a0d9f62b0a1734a3ee57ea422615036094..ff84ce3b8d8567d3402e945e8277ca2a87df9a4e 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -373,6 +373,16 @@ enum arm_smmu_domain_stage {
 	ARM_SMMU_DOMAIN_NESTED,
 };
 
+struct arm_smmu_context_fault_info {
+	unsigned long iova;
+	u64 ttbr0;
+	u32 fsr;
+	u32 fsynr0;
+	u32 fsynr1;
+	u32 cbfrsynra;
+	u32 contextidr;
+};
+
 struct arm_smmu_domain {
 	struct arm_smmu_device		*smmu;
 	struct io_pgtable_ops		*pgtbl_ops;
@@ -380,6 +390,7 @@ struct arm_smmu_domain {
 	const struct iommu_flush_ops	*flush_ops;
 	struct arm_smmu_cfg		cfg;
 	enum arm_smmu_domain_stage	stage;
+	struct arm_smmu_context_fault_info cfi;
 	struct mutex			init_mutex; /* Protects smmu pointer */
 	spinlock_t			cb_lock; /* Serialises ATS1* ops and TLB syncs */
 	struct iommu_domain		domain;
@@ -541,16 +552,6 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu);
 void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx);
 int arm_mmu500_reset(struct arm_smmu_device *smmu);
 
-struct arm_smmu_context_fault_info {
-	unsigned long iova;
-	u64 ttbr0;
-	u32 fsr;
-	u32 fsynr0;
-	u32 fsynr1;
-	u32 cbfrsynra;
-	u32 contextidr;
-};
-
 void arm_smmu_read_context_fault_info(struct arm_smmu_domain *smmu_domain,
 				      struct arm_smmu_context_fault_info *cfi);
 

-- 
2.47.1


