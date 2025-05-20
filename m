Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3E7C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 19:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ii8Ima0T9o2vsm/Kvny8YHfjV8PP21HFA5Cwpdauwc4=; b=gbUUdIR1Y4O6f7CGaXkj6oZPIW
	YFyz8tmtec+tOdb7A2SJt0jbbgNwu3CO3mJ4eCujxvoBOaYKJK7J9H49Zd7xRgvoIGig9fWjb6E8R
	CDUUO0ovbEQ1eUXjPYij3Pxy0CxMO+VnmdwaIEvVv0hjHOw6bPgX4qS2flpMqd5bcWSafo34JiK3Q
	JjTauIN4SLfc0rwvOsyynWg8Px1eB94Q2o1RNjq0KWz/dEa37BHr/iieyiHf4V1E81NkJS3wHWz6v
	o8sJ3zJaDbLWi+ACoJnfAKYv9XkVeyXgikyWTcqqMZrqJEqqTPbMH2blAMHA9RuaTYVEcDgNagyeD
	6vPaxJ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSR5-0000000DuFK-1itA;
	Tue, 20 May 2025 19:15:35 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSKl-0000000DtV5-0Zje
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 19:09:04 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7cd43fd56bcso76914685a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 12:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747768142; x=1748372942; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ii8Ima0T9o2vsm/Kvny8YHfjV8PP21HFA5Cwpdauwc4=;
        b=TubsPXknfTbPLBj+gle+OXoRWxRX48eop0n3XsJdNUzwsvoBKQq9EpVQimQbxMcShV
         UUHiXIDq8wcuGuLY9rPvSyo3D4OALiRYNLy5MquKZcLGNg2Z1o8y1wpcIhhm8+++9YXa
         bwHH18dUF9kXbm5ZtbY+zLYf9A51zbQR8am2UC/r1g6GdJfs8wvPfeNZL5x+4yy+0Sa7
         aP6sbyj9mk4Id77teUGP6EGbSfqYLV5aKAWtNol172AQbj1zUg3m8z/crn33dleNbYqp
         ekS9OmsmwPFfU1Zkr9UGIqmZw8azJ4PwNT7QgvhWgkaPr1NkuslS5yh/r7eKTXMooOYs
         pkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747768142; x=1748372942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ii8Ima0T9o2vsm/Kvny8YHfjV8PP21HFA5Cwpdauwc4=;
        b=U/+iKLY/D8XFobl477rxz28h9qtqn8P8UoI9qvU5GKFpx2G25y+zr9hpxJPI1jWGfQ
         u0ll2Aw0plGYtq7MrObqegJ/VJQ3PuKpUi+cxBzGZoUANANkhsABE3SRFBn0iqlnPbcZ
         P1vgcyV8yuDxW4Hf/HbvMZWrMb8lVWKgpVbhCSJWX0mbNCWImTOABDllREwX55bFte8c
         KMYmFNYKH6XwjgvY/pREE/86nAWJi8Hzg2L9hd9Snw5Qm//0uTXyNnSZcg60cpm3rQm0
         Dqqcr1kvsGW0FfuZQthtxd/4oxX+PHR+JBBNql+Jh26/6i8cjtDGDZ72ZMerL2H1iQ9r
         +eNA==
X-Forwarded-Encrypted: i=1; AJvYcCUuAMjkytMiQmkBsVB0MjKVADLfHsXlMwwfUNDAgMjPyOFKuyeSAnTBpvKPIt5rdIOjq8z5yU7o4iZc0SXll+lc@lists.infradead.org
X-Gm-Message-State: AOJu0YywkVubTncuuPO28Al8bmBuj5DawGGhcnQ0dejHovs670SW638L
	7353L12vJzhuT30gwfPV1ATBNg7CKYCX7yGuNBcM98+zxURpAscVa+iS
X-Gm-Gg: ASbGncvaOPDtHgv+ZFhfctjQUo/XQ9EAit08tXzy6MZqmD/jbJ6cB5fGJ4LcRL+NpSj
	DlymlgjlP//uxjGfZIdT9cnt0V9Hqb+F2H1Ft0N7cNjuH9oy6+Na9tk6nXVmECCmX/LQWzupAAl
	aCMG84fEIjzUIvD4MjrzOLZ2VabJHjN4JcSlSh6rWwzNe1PQklVgiFXvCwnWq2IPlzomB3x26Ru
	vyFnP03uQNXZi2YyP/QfG6k5lcnhPlpQPe+BPxkRyts65q/PkuEOJppltrROjYJLeNeagSy9Wqp
	RKkx8EZg5Mzen5faQa1L7YqbIrigVDYcHpMdeaTsPEWPrY+MxdVcuwsgh2mXt6JWfChJCKNtiNY
	JdfUCqkLvvfaSUH/FB5A=
X-Google-Smtp-Source: AGHT+IFjLmYqaKLHPS+01zHa2///cFu/CXjL/ulMSueMZ2cjR11HyScFFNVGZ0K50+a/0b0pvW5/Nw==
X-Received: by 2002:a05:622a:1444:b0:471:ea1a:d9e with SMTP id d75a77b69052e-494ae3f24abmr103477651cf.12.1747768141896;
        Tue, 20 May 2025 12:09:01 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae445b99sm76554051cf.48.2025.05.20.12.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:09:01 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 15:08:55 -0400
Subject: [PATCH v8 2/7] iommu/arm-smmu: Move handing of RESUME to the
 context fault handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v8-2-fce6ee218787@gmail.com>
References: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
In-Reply-To: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747768138; l=5304;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=xmVtxKp7l1nH9HRMvlhp+AXA8iIyclW4FjVkhjfpiJg=;
 b=R9Qrdk+aCSBCIG9HTDvSktf7A7GtrulqV4E10X0kJ7Yd5pExhrEumGzEbGK+ajvv2fm2NcdnU
 zCVQ7U/1Bn6Coy3wGGCl4TjDEVPJPXR5CoRuRTG6lRNa2ucwCE6WGoU
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_120903_172715_DC7C72C5 
X-CRM114-Status: GOOD (  19.84  )
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
index d03b2239baad48680eb6c3201c85f924ec4a0e07..65e0ef6539fe70aabffa0c8fbe444c34c620d367 100644
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
index 4d3b99babd3584ec971bef30cd533c35904fe7f5..c84730d33a30c013a37e603d10319fb83203eaa5 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -120,19 +120,6 @@ static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
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
 static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
 {
 	struct arm_smmu_domain *smmu_domain = (void *)cookie;
@@ -337,7 +324,6 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
 	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
 	priv->set_stall = qcom_adreno_smmu_set_stall;
-	priv->resume_translation = qcom_adreno_smmu_resume_translation;
 	priv->set_prr_bit = NULL;
 	priv->set_prr_addr = NULL;
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 8f439c265a23f16bd11801a93dae12fd476ddfb2..8d95b14c7d5a4040bb8add56475e297beb16b162 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -474,6 +474,12 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
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


