Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D63C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 18:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tz8w4kDb+vNicTDLDyVXgyrGlaWBUBamCstFPGHL+6k=; b=J06WtCUOAiZjFGMYbHfrrgT7nk
	Kvwb6mcuVc8VMqvgwFKdQoj86rQPPNGjfWQv3MXqrglhx7Pc1pS0fqjXxZsx99QAsXI6pz9nuLOA1
	Jcjk04rvcBryw6+pQr0GDzsTteDZ01manU09SnxTM2VGlxm6sMROZAtPQxwzPPfvjQTGprN9mPfEm
	LnKMPnl/zkFeLVasY5jAzAt69NB2e9lpXEnXbpLd7s7clP4N4goQiDiH6fdsPfGfIEQkuVaSB0k+D
	tgzFy0murueeqCUTZEFSyzXzLIgmYxu8IJck1zNyjRv/Vq1kkg5899KbwNsqgLquf2RZNSk0P6MVO
	XO4V+7+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWuL-00000005pGt-0YRc;
	Tue, 04 Mar 2025 18:22:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVaP-00000005WFG-280s
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 16:57:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=tz8w4kDb+vNicTDLDyVXgyrGlaWBUBamCstFPGHL+6k=; b=MtDEBT7iLJyUKAOiDSWR16NVQX
	bSrmvW9IC/EUJTnNJNLZTYiFPt8z0ZmYgzEcMcPwjxhhHYhckz9bdz+0qhzPcoeQXVA0U7EVl0EsL
	U59Nu9SR+9VEQc+nVIWDvnUG/OHfbCsAUqRXBc+2/QC6xOv638OthktLTxEqN5jxT8nzLeNfR1kmU
	VcVKuxHSoh8Ot5jGLFCNVmEZBWuaAVdhpDGxlV/dJiruL/k07Ee/0uW5+U/KmJDl7mybXFQ9gfQn5
	aCHz8EqAZ5Xd9Ioih+8d5u3VHJnOS5af3AN1JLtM9H5SXNGh3/l0CBM2FF2Q//COHjcUDdGdqB9ZC
	56oPpSPA==;
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVaJ-00000002AbO-0p2U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 16:57:39 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6e8965f8051so8022446d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 08:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741107444; x=1741712244; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tz8w4kDb+vNicTDLDyVXgyrGlaWBUBamCstFPGHL+6k=;
        b=LQ36ik01hhLffV/9bhh5dGq49Zc5qyyjvd8Ju1KHaTJuP493TFSlS1I3z3S6ygxCY6
         O4FmAYC1eru7gBRxuXPNhL9LMAXwcFgCb/zNt+yKykc/9FWDpRsPtJ4acUR0viGW2OVU
         qdUHboc2yFM0jiHULwrydE+526MudWe2TVw0wmi1VpteW2ggDhxMXcYnNZ6gwbcf0sBT
         DHqShjOHN/aKaWLLmoLhp5PyOT4vWQ5WW2jiyZm9pBDWMEuNwfTOqaABFdHLR5iY3Ooq
         5df+up2KGklOzjZovlaxJekQusafVajOLa+2iRxI5Svao6d+LY8YjbANkaoT9zYDj5Qs
         0H3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107444; x=1741712244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tz8w4kDb+vNicTDLDyVXgyrGlaWBUBamCstFPGHL+6k=;
        b=vhdE7vkGuJ9RWEhlbjGeEVAxZLlQioW0uJ5FyqOZ0+DlVw4gOezvtFxmbmZfC3xUAV
         hv3pT/DNS/1xK7/U1JRB0NtCXpX5hyZAHnNekx6gsNhV7QXWY9VfVV3Kp2vU43w5Brif
         NVFNzA3Rn1xaaYMskZnnPGhYA2u3iNsSkzxp4WkQj0ZF2nFEp6il0naQDsXNrY9yIUDU
         27JG2AK08S3lsrHG5sSJjNRCqMFy9RWyLHdfFJdPhlpQkDreCWKP3JReBN1xpadqEUIK
         L4d3s5yDjzQXqmTkupNYMJucYzaPKiMQK2YFeXNP5Hkrkd+wvJerHC8lFycVoD0vcDJo
         EVZA==
X-Forwarded-Encrypted: i=1; AJvYcCWTfBPbqPTD1zku0tl5ZC5ZmXdE0JYY0/akMlnZ9j6WomJHnecK5WxYVNZEllLdYGI/kK6OqESLriub5J3kdG/g@lists.infradead.org
X-Gm-Message-State: AOJu0YwwsaUg3Vih0QJbOnGXF9DErhfCMVNl9ifDdiu1KTAeYZKrWOlR
	LOITg1pnuwsOY/qNSfMdLlUDCbOh7QxaS9/NILxgTYQ/v8INx2OA
X-Gm-Gg: ASbGnctn/t4sahtUDwwqcnWyG9cnYWat2jBXovm/x+nEyt1f9o8Fw2YJgcEvGrHlmbP
	4q9Ywm8KUWvBTt0x4UTwwH5TcKQOVhz8v3u750cxuodu7QmYTYYNe45U7CUqRbNVFQ0oKuvu4Ls
	YXretaRiHXe/vEs/ZsOtbxVXWsEO3qu08rT1csx32fZVmF/6MmryDj+AAGyu9t/eXgrDFPxkaRg
	aZmfPE/XQCXcezivzrzDLWOhnHxWjUn3fuhDt+ldEx7cpGTfCtZDZ/tKNsfWMjY9wuKi2uxzFjy
	p2ng5eaL2WtaRKxDhmCspBHhGqPJkJ4IBbXULeqytfIjQThbQXkBtfTXBiC88+VKEwxwhE3QLGn
	vbrM=
X-Google-Smtp-Source: AGHT+IGX+RhV/Giv/+riLU1NZc5RpUqeZvB0d4P0/Z/QJ0oUGooasJgjc40zbomuWlTikveGaN/ADw==
X-Received: by 2002:a05:6214:f02:b0:6d9:2fac:c208 with SMTP id 6a1803df08f44-6e8dc252aa1mr16326906d6.6.1741107443720;
        Tue, 04 Mar 2025 08:57:23 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8976ec3b6sm68915966d6.125.2025.03.04.08.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 08:57:23 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 04 Mar 2025 11:56:49 -0500
Subject: [PATCH v4 3/5] iommu/arm-smmu: Fix spurious interrupts with
 stall-on-fault
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-msm-gpu-fault-fixes-next-v4-3-be14be37f4c3@gmail.com>
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
In-Reply-To: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741107439; l=5777;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=lREsE9qBpuBOvxRn1Al6spv7zBw81cKds9oUzoZ9Rk0=;
 b=Edw7Jd3oWdgjh3lOT944zup9heTrKBEqqSb98hqpPcYfCRyt0+NAdBSz2Lfz/IGq7oUaZQXZa
 chdOfLLBveDA6Q0x3oHRtGMbFmfc5pEBYPcsS4SMF6TGji2fHYSunZL
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_165735_988168_5824EF5E 
X-CRM114-Status: GOOD (  19.43  )
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
index 498b96e95cb4fdb67c246ef13de1eb8f40d68f7d..284079ef95cd2deeb71816a284850523897badd8 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -466,13 +466,52 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
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
index 411d807e0a7033833716635efb3968a0bd3ff237..4235b772c2cb032778816578c9e6644512543a5e 100644
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


