Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF3EC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 17:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ii8Ima0T9o2vsm/Kvny8YHfjV8PP21HFA5Cwpdauwc4=; b=1O3nUtz4GW5GZzVr0kUhFpvbMU
	nheyqJKuXcTp1ISp6agTEzMaiKlgFNZRnXFKI4x1oHXsR3FN8FYhdD4rB8WueY3EE1Jg62c7O7LZW
	KgY24dbFgrzxBypy/5v5ZwjzAJ+3RzJpuXUp3aX35a0/kG8XEEESdZ+G6FHdHqRdOm7h8vMIuk8+h
	k1KBOPzrZawbVgzAqYOC62VSOBMvjKblMfYqHt0bmhAf1DG++XYedCZ+v3iX949EL8CfAegLI6V48
	psc0jGVgIi+3nd8ioUzmkuf4zZX3t9EQL/+sGEc2GA5zfbVSZAIoqENvzf7Eu7CPwcLdlfIp8u0ys
	QuvNGKYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHR7q-0000000DjMl-1J3r;
	Tue, 20 May 2025 17:51:38 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHR1T-0000000DiAX-2o4x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 17:45:04 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6f2b58f0d09so8731766d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 10:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747763102; x=1748367902; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ii8Ima0T9o2vsm/Kvny8YHfjV8PP21HFA5Cwpdauwc4=;
        b=ma61hc4eVj/DmBalu9osZoVHhBiL7TWlgklaJVnhoOjWWDvCbJ0I7CL60omwnXKPSZ
         uoaYE6u4Oqszm+VhLpiUFvoYIDthXsx10Cz/LW6+OmsGmIJVYL37DuKmRPGz3LBBioqQ
         a184YQLgtfow9iHY06Upr1IzxlfbEvGA2MUn8oUHXAWIH9HTjlhFDGEIW198jAIEqIvd
         YeORExE3lkxC08+vPeGl8NX6jwEYu+Voqr/6IEd5rj70PfJJnsyMgtKi2y9DPTewFoJ3
         r4A7jDb/PlzIBssbrnzzdfmvBTfTCJFEBNGXSdxGLlnPdFPVgC5wCATxFbeDo1oNdCXW
         kLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747763102; x=1748367902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ii8Ima0T9o2vsm/Kvny8YHfjV8PP21HFA5Cwpdauwc4=;
        b=pA///FDXQspuh25hn05fyTHalE//YO4+RKr6LI+aTLdzlScdnjjLPBkBTzG7Peve2S
         5z8gqfLWCRsiTn/j0Aq+gCtseRw2I+PnbGtOYSSzeuYMQEz3hAM5jEB3TKBjYxtvg3rn
         SHYefAdhEH0Mg07r55jspnupXweeQ/S8kMiR1ddBXnPHJx+AWkE5tcIY+Es/PFJcq8xU
         PrXRt+LaeGk1vBl2ddCeTQF3r4a1PrXzbqTA4v5FyVyCaEqVgPDqV9lqvkUFFMmRb+RK
         eSsLgEtwI2SLkqGWocvTJyrzQxzvnDbVb0t6libUpRFjdSqIiOmj5ftJ/8j2NoDqzITk
         pfBw==
X-Forwarded-Encrypted: i=1; AJvYcCV/BWkK8OGutH+XovCYnJtv2X1a5W8T6kwJUGUu06Cs0YXC3au/pPxPvtIRgXIPmoibDCOSzQiSD1R5jC9Y5hUz@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfto5bZiz80siD9TTpgLzbbg0rnUFvhBTqzYbTbeeJ2F9KJk32
	GmAbjgHxLjVU8j4tMnqJntRJaROjSkPoZs0F6D+bWScVWzAo1i4S/jSU
X-Gm-Gg: ASbGncv5Fk2xhM5YbG8tTVMQvqa2fa/gS+9zQtr1i19v+ZBGjasaL9hMWCoctH9lB4/
	W+77vyAfslkEQwqwrWoo67tzOn6Xj+bPgy8nl/grrlXH+DC/bEacw87T4a5ueQj5chDwjKpEOcf
	uyqqxTU1DJw/7Lf3XhA82eVIM61nYGhNP/GMIXWxupiyGXTz95yw04BauL6/epM95QKKtbP0RL3
	Kv3oNGlWXQv5SMjNvcrpOlBoQkBZwbLybOUTqQUCxStgcMzsQRr1CJqwAq12OmEBGRy+VDxtjFk
	gI89vIB7kgSjNN1fksSBzdBTZ5prfrPqoz7BZfV8ZHKm7YK9JztBdPrND3A2vHYgwJ8ysliWnbI
	W3NLlMZ599RYxyaR178o=
X-Google-Smtp-Source: AGHT+IGHjNqtL4ML4K6mgFG8Y9ysSdvcdDlvh9TXE8IuhX0uhbekGYa67m2VZbTWJPgCHebVjAgMOg==
X-Received: by 2002:a05:6214:e66:b0:6f8:c773:367 with SMTP id 6a1803df08f44-6f8c773156emr75941506d6.10.1747763102259;
        Tue, 20 May 2025 10:45:02 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b096ddb4sm74126586d6.78.2025.05.20.10.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 10:45:01 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 13:44:51 -0400
Subject: [PATCH v7 2/7] iommu/arm-smmu: Move handing of RESUME to the
 context fault handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v7-2-96cd1cc9ae05@gmail.com>
References: <20250520-msm-gpu-fault-fixes-next-v7-0-96cd1cc9ae05@gmail.com>
In-Reply-To: <20250520-msm-gpu-fault-fixes-next-v7-0-96cd1cc9ae05@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747763098; l=5304;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=xmVtxKp7l1nH9HRMvlhp+AXA8iIyclW4FjVkhjfpiJg=;
 b=PbqlKooG9WJYSUN66hnuD7Hs/WXVtPXW5O42qPXoWh9DeILsAkZl1dC2cj4pxrwKSl2Dy/a6j
 6Xw2i7fjiClCzQcHWFkZHeFDoj6GJLgXfQwNHeoaudrBrkhd0nC7Eg+
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_104503_722007_25C949AA 
X-CRM114-Status: GOOD (  19.74  )
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


