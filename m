Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85262C02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 15:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSLZFqeYYNzupLkvhQkP6jOZE1gw3J9u+/ZaTXXZ98M=; b=swBh4Bqx3V7Bqf8gof4i8kq4gO
	PPu1DTsFD0cVdvWnjUzNIAmRPkoTMfKekQ/Qng+hocFxPYm6oFSL0mX6IXzIayS6P1aLF4dB2t6WK
	8rRsgIyzzqh7n8jN13Y/Ufv+grJwfdTTD4kI6iBOVCRdnziklaRsXxsQYUb5Sk2RFaAQqcDcvZVpC
	gLs2J24DicmEPXNF/oQ8vQq8sE/nHY/4VZVw0Diu1lJMaWPgcU7pUkcCxEC5nKmHSmbaUruZV1WaC
	ghQ1CmL05FycTWp55X/gAHUXp3xQ9BXxTf8nzZzCXLAJYN87CxOKvJVxG1vHTMQwSJpfurFhtxp9o
	sWb2C0OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZu1l-00000005vbf-3sNY;
	Mon, 20 Jan 2025 15:49:25 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZtzG-00000005v5N-0SkQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 15:46:51 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7bb849ac4cbso18468385a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 07:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737388009; x=1737992809; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hSLZFqeYYNzupLkvhQkP6jOZE1gw3J9u+/ZaTXXZ98M=;
        b=MuDbF7j9ZXXlwtnFMcIeW99LXEZJZ+Lh03T3BOwUfdIQRj2eTRMbtwzAbwAlv58GZL
         pQIsoJfgdHyho7Hqm1RSW2xgPlv0+47AeQiPtOaGbCb0gcXqu14wVBehW64dDMhPnzcX
         bzvDprMS31pk7RdJ+eh3mqB6woF6v+SjHzZHS2LnvhspUw29a1I9axyzrkR5rqMgmORU
         XLvseTx2B/cetB8pp8nJPWeeTWX+UO/cNWftHfKJSbfxaeN5wpuPtulvUcVcmpv/ksEC
         8wVTBfj6+tLlMx3d7/vDMnxUy/rf5biUe3EeXB46yjYrneg1wUFaxk3K5kWw5gc/ambS
         K4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737388009; x=1737992809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hSLZFqeYYNzupLkvhQkP6jOZE1gw3J9u+/ZaTXXZ98M=;
        b=bZpgraSvoQQEU4UNI7ijVcqpBXwHGULFOVmjPfj6MQVUlIu/80XyPbPbLPyibWEhEA
         WGryPI3Q7PL36oxkr0iKAQZ+ZK2u89Zk+slGl6tHd+TH9iIWJRfUKzUsSK2/QT6r1Dmy
         Z9Mkj8hPEfuPVkZ8ZoyvriQPSV3V7M3GKYn/jSejdw8cc5AIUHu6uUmkVSBsATFrk+Zq
         NgXUz9xFZTYrIdCIA4HYkT/n82j0oZN6vDqMDha28Zf6pZ1iyiSYo3khIlanen38iOVC
         ZshzH1S+rBeFotv4ScDYSLCpjnjU6dLYWjYq9NERD/WDKIb+bJMsGfNIyac1WdQjTcRk
         HO2A==
X-Forwarded-Encrypted: i=1; AJvYcCWjET6Ix2lMxY6CubCM62Wa9ERC/NoWpI122qMH3Kb2zpiaWzJAy9WldDmBhsXDwtA9brFBgw9jjY1dTj1Q2wQV@lists.infradead.org
X-Gm-Message-State: AOJu0YxSzb4wVHdOXDdcaXZmG6S14oMmwCEalhNjTXMiVfNVposR8jne
	v+obed2D5lMuLbzChy57FGUHmPzizcQzNgXC4fgDTMAADEeW97dP
X-Gm-Gg: ASbGnctqfuf43dxR9/69gswDar/xUoxhGej1cE04QgPuGfG3OeNRE3vWaCKX8yvz2mD
	g2Us7zHS6puQ0qVjMqHokw357CjoWYMhO98+NI398X0dDl62vaHu+QZMOvzsrK6ZvWbRTywB26o
	u2McKIzKU0o6W54N/GcCmdVCSc6QRP9QnRDJRXFSuMNXTOhEOzNn8yGrLZBpvfejt+wWu6/8Q7K
	lRZ8+fXXTjugjZVH+cpOAxNRWDLpyjjondOyXB9sfgrw8E0byAlj0h2v8MbKHctMPCSxorKypyZ
	s202OAXnUBlR7dSQ1IVpjlG9i8ga
X-Google-Smtp-Source: AGHT+IGRsLr/plYsivjFW9Wg8gre0DgIcAGugN+vGYfCVVtZ4j/IBlWDl4kSNHtp3nt9yDagfFdlpg==
X-Received: by 2002:a05:622a:1b92:b0:467:692b:754f with SMTP id d75a77b69052e-46e12ba7bbcmr75029041cf.13.1737388008704;
        Mon, 20 Jan 2025 07:46:48 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e258c82a6sm24230501cf.59.2025.01.20.07.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 07:46:48 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Mon, 20 Jan 2025 10:46:45 -0500
Subject: [PATCH v2 1/3] iommu/arm-smmu: Fix spurious interrupts with
 stall-on-fault
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-msm-gpu-fault-fixes-next-v2-1-d636c4027042@gmail.com>
References: <20250120-msm-gpu-fault-fixes-next-v2-0-d636c4027042@gmail.com>
In-Reply-To: <20250120-msm-gpu-fault-fixes-next-v2-0-d636c4027042@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737388006; l=4916;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=/R/KwmLG8BNK0A9MSvTs3s46WR5S+uGDge+4KTr0h7A=;
 b=i7N/dXDgmGRIUd5U3WyV/nZ1JYDRziJEUikvzGMd1shfUJc6J9lsKpEdwN1swebrd3bgyVDHe
 ji9jXgXa20LAFM5UdplIavb/r9aoVLZzBohatVWjp8A6USt4YLtjmui
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_074650_153536_1CC9E135 
X-CRM114-Status: GOOD (  22.20  )
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
removing the bit from ARM_SMMU_CB_FSR_FAULT.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 15 ++++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 30 ++++++++++++++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  1 -
 3 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 59d02687280e8d37b5e944619fcfe4ebd1bd6926..7d86e9972094eb4d304b24259f4ed9a4820cabc7 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -125,12 +125,25 @@ static void qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
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
 
 static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 79afc92e1d8b984dd35c469a3f283ad0c78f3d26..fe3d77984533eb1a0e0e211021598bc808f2a6b2 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -463,6 +463,36 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT))
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
+	if (cfi.fsr & ARM_SMMU_CB_FSR_SS) {
+		u32 val;
+
+		spin_lock(&smmu_domain->cb_lock);
+		val = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_SCTLR);
+		val &= ~ARM_SMMU_SCTLR_CFIE;
+		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, val);
+		spin_unlock(&smmu_domain->cb_lock);
+	}
+
 	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
 		cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 2dbf3243b5ad2db01e17fb26c26c838942a491be..789c64ff3eb9944c8af37426e005241a8288da20 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -216,7 +216,6 @@ enum arm_smmu_cbar_type {
 					 ARM_SMMU_CB_FSR_TLBLKF)
 
 #define ARM_SMMU_CB_FSR_FAULT		(ARM_SMMU_CB_FSR_MULTI |	\
-					 ARM_SMMU_CB_FSR_SS |		\
 					 ARM_SMMU_CB_FSR_UUT |		\
 					 ARM_SMMU_CB_FSR_EF |		\
 					 ARM_SMMU_CB_FSR_PF |		\

-- 
2.47.1


