Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2496AC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 20:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=20DcKlS2hTvAgodxaUTpKC1CD/IfYxghOMwo8wKmU7s=; b=0EJKpv4M+McwkhCrdLKOjsOfVe
	/SniISl9eiM+pxBInWiDhiX+L6S1zg3mRDZfS+TCAnK7bollwMg8sPh/cqmpQMoH6hq3c5szvo03s
	jBYga4+zrD1EfJ/3T1jqLG38TFpAL8HrJpE+qcOJVME4t25eeOXJoPBGmHUUXUfjC57mgEV0FVqML
	CoifdLV5zUnUsTBh5zNWqHPqOkzAk3HS7XzxCtwIRJovqmZzsVmglRNxBwLe1E0HqIVp9FCRjtpIq
	xjCsTCp1AwNux8eeqk4ZgtuWqkANtHF5Pex8Ja8B7exIoZTi5oKYLxpvFxeKdb2VhoNiEk7bLQoio
	L0k9UE0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFeq2-00000001kza-0BB7;
	Thu, 15 May 2025 20:05:54 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFek0-00000001k6G-0m3F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 19:59:41 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-47680c117fdso2308671cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 12:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747339179; x=1747943979; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=20DcKlS2hTvAgodxaUTpKC1CD/IfYxghOMwo8wKmU7s=;
        b=nJVXDsqw5pgbeIkk1kQNGGXxl7CS3VorLGD80xRhOKPUWvneK+/v4EEbnwbjybrCBV
         NRl8WZMTS4Um6oCx7HbZi3bHqaOZL7w9ICBkOiZsaYntu1CGHcZhTkqGeBfKF8wOpA/J
         mKCcLlWmsiNBVdmy1Oq5lOxNthePeTK32gGwv2hbP780CyYd9MC8PwnkD2fEni4eUBpP
         hiDbrmnMHcDtapf6qDo5ffM/JlItboWEjJ49n5VSkjW6XbjC/H/kZpSoe5G+Bm8ckp9H
         XQa38UWjMQoZ5Pdh0leOJdPa4hfzs+SQMTkQgTp6WQfxcIPOs/8+ciKx/x6nDoK1oPjm
         onnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747339179; x=1747943979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=20DcKlS2hTvAgodxaUTpKC1CD/IfYxghOMwo8wKmU7s=;
        b=krEz7+Os4UdtWzmMN99+kQCCfQJk43Q7ysDXIf/h9SKYBzsHrtj0BL6ldQ89ezduQE
         FuK/hscxRR0nHXE5T9uJ9Hpj4voIv48FgOVQPqYZjjwZfE8WLdGl0iyb0lPVDylLhiUu
         YNztijxPI1JW21oV+iM2yoNJWJeEH72GCJ/i+gMAXNixn0m17mZFJYzjYEI4H87KoMgl
         1jgT7K1eLV1vHLh5kQ4t+YwmDFfHTy14ShdFh9l+eGeexvop8DXIUAZLbVLf8nF/ezjS
         pM0E0DjrDjp0Lbe4s/fSR7jNqsw6hrqvTi3iRCqmx9fWGMcC3GghylZ1vOsXASnZ1z2n
         V4cg==
X-Forwarded-Encrypted: i=1; AJvYcCUbbFiguKTzwb4THcd025suJWCBTIvBGNV0/ywghVKGT6RpVfwKObc/zg6MVJCrpiVKjMZVbduH6NInagbwxHKn@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm/v4r3kQPWO1IlTWh+xt+N48/PVfLmloLAmNAvSKGE6x7Aj46
	FRhnGGHGN8hlDZnekI4nrtT/07jYiIPquE3+paEbDQIduCwmvJ6YALMR
X-Gm-Gg: ASbGncuQNOxmRSODbNGPVjvVBv+1anA43Xu+aa2UOlQA4vXyRpbZW6jESRWRy77z8bw
	YGRFh/VPPtLGtD2UOHxf3NEH0qnYymhC/Ya2tldWJxqso9xAot7YZJES0F3nfZWBPSCMyoe0VLZ
	Hn6iOWhaJVlbR5SU6kyWB7pOstrsHWQnOsjTlELaH/avUaNDKEyZQlZSJiG5KOhMl2uZ/0N8alj
	LZVhlZ8IJG7zJeqfapr79zxhmP0r5++Veyc0JYWEkRMf97U1wDbWJMCT/mnc3Vj+OeVM7Ne3kgG
	dd6Pd/Hy6XNiscMlzqYqrQox+LgfL1VSOH9j1kHTPYEHX9wYd2aHyoXYdmMs7DAxfOMvy9RrHnS
	Xb3DI7UeOO2ieLoGDINQ=
X-Google-Smtp-Source: AGHT+IEiZCk//3KnZJ9QFraR8/9r40L9GjGgn7adTJxnnP/o4rKsmZ4SlZHA8YvdjcwS+Khc00ipDg==
X-Received: by 2002:a05:622a:43:b0:476:add4:d2b6 with SMTP id d75a77b69052e-494ae339167mr4150621cf.1.1747339179131;
        Thu, 15 May 2025 12:59:39 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae4fd80bsm1957231cf.56.2025.05.15.12.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 12:59:38 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 15 May 2025 15:58:44 -0400
Subject: [PATCH v6 2/7] iommu/arm-smmu: Move handing of RESUME to the
 context fault handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-msm-gpu-fault-fixes-next-v6-2-4fe2a583a878@gmail.com>
References: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com>
In-Reply-To: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747339176; l=5231;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=yKFBdsoANpail9eN0dLOxr2jAWKJ9zute64DqhO2lxc=;
 b=tuXpSyUWL02D4yi11LDbI98odEa/K1GIb7KgJHtYoH2rfOsfAexwNEoBtysuOMrgQmJQBgNIq
 7yU62f0j+OqDJs/HwcLdtj+Mw72LGRQBJhNrGx5ApqAFYflwvH73z4v
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_125940_227944_F46A243E 
X-CRM114-Status: GOOD (  19.28  )
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

The upper layer fault handler is now expected to handle everything
required to retry the transaction or dump state related to it, since we
enable threaded IRQs. This means that we can take charge of writing
RESUME, making sure that we always write it after writing FSR as
recommended by the specification.

The iommu handler should write -EAGAIN if a transaction needs to be
retried. This avoids tricky cross-tree changes in drm/msm, since it
never wants to retry the transaction and it already returns 0 from its
fault handler. Therefore it will continue to correctly terminate the
transaction without any changes required.

devcoredumps from drm/msm will temporarily be broken until it is fixed
to collect devcoredumps inside its fault handler, but fixing that first
would actually be worse because MMU-500 ignores writes to RESUME unless
all fields of FSR (except SS of course) are clear and raises an
interrupt when only SS is asserted. Right now, things happen to work
most of the time if we collect a devcoredump, because RESUME is written
asynchronously in the fault worker after the fault handler clears FSR
and finishes, although there will be some spurious faults, but if this
is changed before this commit fixes the FSR/RESUME write order then SS
will never be cleared, the interrupt will never be cleared, and the
whole system will hang every time a fault happens. It will therefore
help bisectability if this commit goes first.

I've changed the TBU path to also accept -EAGAIN and do the same thing,
while keeping the old -EBUSY behavior. Although the old path was broken
because you'd get a storm of interrupts due to returning IRQ_NONE that
would eventually result in the interrupt being disabled, and I think it
was dead code anyway, so it should eventually be deleted. Note that
drm/msm never uses TBU so this is untested.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  9 +++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c       | 14 --------------
 drivers/iommu/arm/arm-smmu/arm-smmu.c            |  6 ++++++
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
index 548783f3f8e89fd978367afa65c473002f66e2e7..3e0c2c7c639b0c09243578ebb95129398c630ef2 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
@@ -406,6 +406,12 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
 			arm_smmu_print_context_fault_info(smmu, idx, &cfi);
 
 		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
+
+		if (cfi.fsr & ARM_SMMU_CB_FSR_SS) {
+			arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_RESUME,
+					  ret == -EAGAIN ? 0 : ARM_SMMU_RESUME_TERMINATE);
+		}
+
 		return IRQ_HANDLED;
 	}
 
@@ -416,6 +422,9 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
 	if (!tmp || tmp == -EBUSY) {
 		ret = IRQ_HANDLED;
 		resume = ARM_SMMU_RESUME_TERMINATE;
+	} else if (tmp == -EAGAIN) {
+		ret = IRQ_HANDLED;
+		resume = 0;
 	} else {
 		phys_addr_t phys_atos = qcom_smmu_verify_fault(smmu_domain, cfi.iova, cfi.fsr);
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 2b21b7208bc7b439d69e36ca678acd2eacbd5b85..d71404ad90376b2c258d67e07ec380674961a429 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -86,19 +86,6 @@ static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
 		qsmmu->stall_enabled &= ~BIT(cfg->cbndx);
 }
 
-static void qcom_adreno_smmu_resume_translation(const void *cookie, bool terminate)
-{
-	struct arm_smmu_domain *smmu_domain = (void *)cookie;
-	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
-	struct arm_smmu_device *smmu = smmu_domain->smmu;
-	u32 reg = 0;
-
-	if (terminate)
-		reg |= ARM_SMMU_RESUME_TERMINATE;
-
-	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
-}
-
 #define QCOM_ADRENO_SMMU_GPU_SID 0
 
 static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
@@ -238,7 +225,6 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
 	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
 	priv->set_stall = qcom_adreno_smmu_set_stall;
-	priv->resume_translation = qcom_adreno_smmu_resume_translation;
 
 	return 0;
 }
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index ade4684c14c9b2724a71e2457288dbfaf7562c83..90a1b23223b4c25cfa033c28a2823e60e8b0c5a4 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -470,6 +470,12 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 		arm_smmu_print_context_fault_info(smmu, idx, &cfi);
 
 	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
+
+	if (cfi.fsr & ARM_SMMU_CB_FSR_SS) {
+		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_RESUME,
+				  ret == -EAGAIN ? 0 : ARM_SMMU_RESUME_TERMINATE);
+	}
+
 	return IRQ_HANDLED;
 }
 

-- 
2.47.1


