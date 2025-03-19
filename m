Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283CDC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 14:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LLdaHjk6LfckJUTjGZM3sRGKIR5OKfK0XW8wTVhaxM=; b=nbfoDHnFnWlANlo2q83RfELcOz
	klUWP7dUzflbf+ZWB6BsEMGOc/Tb98ColYZcxYnOI2Aoq3CfZsHyrQkwhMcEA7Ul+mtYa2Vg37egf
	mI3B5EDviuA0+wt7y/u/w8VvOSq77aDGUh9owvGpSI+Yehk3GEyIIbLK8+R1sOaG48OQFfUHp4tid
	oaDfuf48CUzJYC7qvL49a1zJSH5IaC1VNrcAFFiJWoh2hHqGarQTOYaCgvcTN0OGKDzFKk2CKT8uX
	brfF8M+OnoeVCqCinFslxPyb136HsaZDZPbtkSGwG1aOjYd6eoiNt2/oz19Gpei48gYYcfAu8HrVd
	p66PimKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuumY-00000009GNP-3ZCt;
	Wed, 19 Mar 2025 14:52:34 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuueR-00000009FHO-3Gpi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 14:44:12 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7c0e36b823fso109633285a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 07:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742395450; x=1743000250; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+LLdaHjk6LfckJUTjGZM3sRGKIR5OKfK0XW8wTVhaxM=;
        b=ez0YhtGxag/9hR6X3wapf7IInw11VF0swh6CXVrwUXKZBeP3Q2lUvZoNbvGaTQp3bY
         /Ap54Ymdfk3rMJAMBPjCW0FOY8gwf42NFoVwoAFFcRqQ9y33TIhCBFOxnHysyc6JvwEB
         WH6+d55Wz78qBLbCtuibeYfI7/05BUhgdpSEXPR4AEj+n9YwVmKdsC0gVT+UhGuOhsJy
         MDJ7T4rll0Kpei+uoamI1vZzNDLEGidOaIVBZWscciyK8sQdKejFclA15bNkUGOXQlL8
         k3XtV9Y8Loe2pDrYuLGSX/YRse9iwEXoTdc69p7W2mNThXTqmSJc7pzOhV70j6M5Guhb
         /XZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742395450; x=1743000250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+LLdaHjk6LfckJUTjGZM3sRGKIR5OKfK0XW8wTVhaxM=;
        b=VrjUOzfIeXQ1tEFe46xYdLsS0dIkfq3pBE/hW6DGdv6JvX4ZiNgEHlIgeU43303ffm
         KqrkE5ryHC9e7/ET6mvwDXA9Q51yMJBj8KuxJAj0AdPNsnrB1nbMn4waOz26EbtwzN82
         gSwewl7+aBMgaAVV0qhi3+znp8GOXgIs95lMUjEvdCamiLSdgDgAVn97y2OImUBRuOd7
         75whHYO/CcE7PjAVtETUvPESdOOhlWWM5b0r6CAIP/s9TOJDwpCkKXJVQ/GGvSRozoV7
         c564umr2UefmHNusv9wvRqM8hgS1+s1j8zmUNInMlaSay53EzAd0LMx1VV1U8FqwuL8Y
         nHCg==
X-Forwarded-Encrypted: i=1; AJvYcCUS7me5Cyjx9GMsb5iluaJT5Dmsisp2M68PEnzDfCdD4vw3V+sr4LY5tMDfbnZJ6DWeE+omqpKcpfuCUk6EoiTm@lists.infradead.org
X-Gm-Message-State: AOJu0YyaPT569JNpM5T6m/sFUsQd0yYedrSyv1vBvXCrVmqf70oZKBZ4
	fMsK9MeeM1lBhYs+BhDOGyTb6WrG/nrxCBjbawDDWIM7kDEJf9yp
X-Gm-Gg: ASbGnctl+iBj2bOCkxRo7eK3uSYFPuYeboiIKujpEoZOul13LRUcD8p+n0CnGjTfMwl
	FTXAloALBePkC6CrrVRhwySZ4h4h2NjZ3fCVfIMrf0+YTdp7xR8o26FNNL9MAq8pikdXUFSu88X
	si8CrTN679WHpwDWf1shZ5DTLrkx5kwBiLTAUsGEICrbjy49VCytC7qhDiDmbIWP1bLySxnPA/G
	CK26/4zowDhJ2m6m6B3tegzM7YStcO1Kv99BfW/kqWSUhHINISYRHRMVPk9kPeSpsIPE0WaMFuo
	VZpNZHVe2CwV9PTcc8bW59k/fDFlQRcvN+cirP0lgYsQ3egESK4h+4YBVEYfuUHU2Ad4K+PktwX
	ug9MQbLZXY4aLlg==
X-Google-Smtp-Source: AGHT+IGJzwPA7xFugV/gHd8kGB+HC3gNYxm8R5XDRyDYRFdFlfsw4mDQ1M7uG0fiXgibnbX/DsVqqQ==
X-Received: by 2002:a05:620a:2950:b0:7c3:d3a0:578d with SMTP id af79cd13be357-7c5a849d18cmr170321485a.14.1742395450533;
        Wed, 19 Mar 2025 07:44:10 -0700 (PDT)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c573c5201fsm868587485a.23.2025.03.19.07.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:44:10 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 19 Mar 2025 10:44:02 -0400
Subject: [PATCH v5 3/5] iommu/arm-smmu: Fix spurious interrupts with
 stall-on-fault
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-msm-gpu-fault-fixes-next-v5-3-97561209dd8c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742395446; l=5823;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=cvbBfcrcrYk3UnmMx/KO0uUo0M7TL3yWEuY4tEPNpHg=;
 b=UZQkmNfH0RGJd1lvBOxnDXADDr5RhY1byqdtyjRjpdnp5UCv9mXjLsS9upst5mGaXUMBilPnv
 v4blVUGBABuDPjzrloGXgW0NMFK7fU5241VJJj2bb9qgGouKFPpoJZT
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_074411_824698_0DF35225 
X-CRM114-Status: GOOD (  24.66  )
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

On some SMMUv2 implementations, including MMU-500, SMMU_CBn_FSR.SS
asserts an interrupt. The only way to clear that bit is to resume the
transaction by writing SMMU_CBn_RESUME, but typically resuming the
transaction requires complex operations (copying in pages, etc.) that
can't be done in IRQ context. drm/msm already has a problem, because
its fault handler sometimes schedules a job to dump the GPU state and
doesn't resume translation until this is complete.

Work around this by disabling context fault interrupts until after the
transaction is resumed. Because other context banks can share an IRQ
line, we may still get an interrupt intended for another context bank,
but in this case only SMMU_CBn_FSR.SS will be asserted and we can skip
it assuming that interrupts are disabled which is accomplished by
removing the bit from ARM_SMMU_CB_FSR_FAULT. SMMU_CBn_FSR.SS won't be
asserted unless an external user enabled stall-on-fault, and they are
expected to resume the translation and re-enable interrupts.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
Reviewed-by Robin Murphy <robin.murphy@arm.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 15 ++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 41 +++++++++++++++++++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  1 -
 3 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 186d6ad4fd1c990398df4dec53f4d58ada9e658c..a428e53add08d451fb2152e3ab80e0fba936e214 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -90,12 +90,25 @@ static void qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
 	struct arm_smmu_domain *smmu_domain = (void *)cookie;
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
-	u32 reg = 0;
+	u32 reg = 0, sctlr;
+	unsigned long flags;
 
 	if (terminate)
 		reg |= ARM_SMMU_RESUME_TERMINATE;
 
+	spin_lock_irqsave(&smmu_domain->cb_lock, flags);
+
 	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
+
+	/*
+	 * Re-enable interrupts after they were disabled by
+	 * arm_smmu_context_fault().
+	 */
+	sctlr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR);
+	sctlr |= ARM_SMMU_SCTLR_CFIE;
+	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, sctlr);
+
+	spin_unlock_irqrestore(&smmu_domain->cb_lock, flags);
 }
 
 #define QCOM_ADRENO_SMMU_GPU_SID 0
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index c7b5d7c093e71050d29a834c8d33125e96b04d81..9927f3431a2eab913750e6079edc6393d1938c98 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -470,13 +470,52 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 	if (!(cfi->fsr & ARM_SMMU_CB_FSR_FAULT))
 		return IRQ_NONE;
 
+	/*
+	 * On some implementations FSR.SS asserts a context fault
+	 * interrupt. We do not want this behavior, because resolving the
+	 * original context fault typically requires operations that cannot be
+	 * performed in IRQ context but leaving the stall unacknowledged will
+	 * immediately lead to another spurious interrupt as FSR.SS is still
+	 * set. Work around this by disabling interrupts for this context bank.
+	 * It's expected that interrupts are re-enabled after resuming the
+	 * translation.
+	 *
+	 * We have to do this before report_iommu_fault() so that we don't
+	 * leave interrupts disabled in case the downstream user decides the
+	 * fault can be resolved inside its fault handler.
+	 *
+	 * There is a possible race if there are multiple context banks sharing
+	 * the same interrupt and both signal an interrupt in between writing
+	 * RESUME and SCTLR. We could disable interrupts here before we
+	 * re-enable them in the resume handler, leaving interrupts enabled.
+	 * Lock the write to serialize it with the resume handler.
+	 */
+	if (cfi->fsr & ARM_SMMU_CB_FSR_SS) {
+		u32 val;
+
+		spin_lock(&smmu_domain->cb_lock);
+		val = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_SCTLR);
+		val &= ~ARM_SMMU_SCTLR_CFIE;
+		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, val);
+		spin_unlock(&smmu_domain->cb_lock);
+	}
+
+	/*
+	 * The SMMUv2 architecture specification says that if stall-on-fault is
+	 * enabled the correct sequence is to write to SMMU_CBn_FSR to clear
+	 * the fault and then write to SMMU_CBn_RESUME. Clear the interrupt
+	 * first before running the user's fault handler to make sure we follow
+	 * this sequence. It should be ok if there is another fault in the
+	 * meantime because we have already read the fault info.
+	 */
+	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi->fsr);
+
 	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi->iova,
 		cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 
 	if (ret == -ENOSYS && __ratelimit(&rs))
 		arm_smmu_print_context_fault_info(smmu, idx, cfi);
 
-	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi->fsr);
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index ff84ce3b8d8567d3402e945e8277ca2a87df9a4e..5fe8e482457f905529a08aea14ea5656d3e31328 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -214,7 +214,6 @@ enum arm_smmu_cbar_type {
 					 ARM_SMMU_CB_FSR_TLBLKF)
 
 #define ARM_SMMU_CB_FSR_FAULT		(ARM_SMMU_CB_FSR_MULTI |	\
-					 ARM_SMMU_CB_FSR_SS |		\
 					 ARM_SMMU_CB_FSR_UUT |		\
 					 ARM_SMMU_CB_FSR_EF |		\
 					 ARM_SMMU_CB_FSR_PF |		\

-- 
2.47.1


