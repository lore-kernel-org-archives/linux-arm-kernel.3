Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8E3C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 20:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aRX2mmgMKg0kWmEalfWfPxyKsLjxoohp0lPvLbYN2U4=; b=rFgLulphP620+OxOTaBZajuEsS
	zrcaT2XjPRZ8xYCPDPPlRe0JEj1ijvv6oZQDGC9tEqGwri7f+53UXBQGov+kvcRskznWS4Xz7ed5X
	6Gp2Jh3JFGOIlJsVi4czyfiSQVo7dH6oZ6zVw3eVm5dsR7wJOYJErl4YWYDTvJ0E6AsIs9Qui3drM
	kHMDyNaUUXezu8Fgv/HJB/7mfpYmTZ/uQ3wp0qH7Zm6xRVOq6N/7mdRYan21FfxlSoEhs8Zl7PXc3
	sPj1umTwQRNpRMZ/bsMJ4sIWphawAnqGIyRtS1XDLRAQlyl9DupPVV1x0d0W0Z6Y4hMBqT6apvbhB
	9SENEKqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFes1-00000001l8Q-3Nyp;
	Thu, 15 May 2025 20:07:57 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFek1-00000001k6w-3ism
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 19:59:43 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6f8adf56370so899066d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 12:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747339181; x=1747943981; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRX2mmgMKg0kWmEalfWfPxyKsLjxoohp0lPvLbYN2U4=;
        b=fNRqkqRTzpMEpyoT+4gHpakpMR29ZrNqKtT9ftS3+Hlq/4p3O3H9qN+7zW2xUoC8gl
         grHAoGcY5Efacy9gzVqEWB6HKI6xtn8u/Viws9f5s0fs8Y2lmwFXBHwMtJSc4SHhfbl+
         +Ml7VwEOBDQa+yoqB1RY+fBNAXTNpTR8UwLDzayy0jDriKP3Q70i5RCaT7xH9m7n7L4r
         Q9ttC9GSjYGu7cYYKxlstKC0tLVjejneBqc32QeWxbWsSXqra++s6xNTpgIoFMruv1Ca
         aOAnx3QPqnCQ1QRNeODx7C7jauCPFSc+XfNSQ5m01Ml/YVTXuluRrVrCUc78f1G51G7O
         3tYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747339181; x=1747943981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aRX2mmgMKg0kWmEalfWfPxyKsLjxoohp0lPvLbYN2U4=;
        b=lG/IwafRgPE/dGT3eRLr4YTImWiSrjRFdtXO6rw1akjw4+OpzH8OAnTkeMt6ZkJFcg
         fQBm+6f/4B1cIqVikTt7uWW0aMy60ZCy01pPSu2E+7TTVS9NvVDf0fSs7r94skvAAoJl
         EaqSLJvkERsj4XKP2vUG+ev/1GDyV4iE43bdDg8MQ1Q6DKpq30aqDRuhTUtSIXUystND
         0hNMYMaDSzWI6cSmsowQG02JpOblMPHxAZDbkao9ZG/VFd6TEt8pk6ZZOCyX89TlmybF
         cJRqLgfBNrpFgmtrjL9Q4NCjROFZjOpo6CegDs2+GCFJ1Q0vj20so57IgLM3WfyoEtoy
         KYUw==
X-Forwarded-Encrypted: i=1; AJvYcCVGks18DaMYcDd/4T1Js/NSm/dLMmV5hXkfi8/NA9aKZ85yIIZdMH69NcmP/FwjBz0+hhFnhZr+vVKIKoLhliIb@lists.infradead.org
X-Gm-Message-State: AOJu0YywYfHEzqh1o1kUAt9DVZd+vNbWkH6ICl3HJFkGeuAVB5c1OaFc
	CqGND9lcPG/PJclbdCT7NoovYAlVI8z3yKAKWGcF8HBXYUO8rXfM/w7g
X-Gm-Gg: ASbGncvcqjr/qtB3vf0v1G5tFLFevxyWwxrEgOdvi4exyMJUL+Jk80255QvaT8jLF4h
	qWICyGmxKKf70PveS0Kf+9CdylbRrPK/P75p+MuyPPQVanlG275E0vhbEadjHedHIiYDP5eBgNS
	BI2Y1iPHDE/PNMr80uh7taCFzfTSJ0L+4fjrInoxoLL5Fxvoj+Q49XTQDv3AAfLd55wV+EAqVBf
	7BI6WId5NlUo0FAfZjXJR44K/0Je+JgFJY0EsiBXC6kIydfIhVo5TtgcCvQwBkjx72B7b538G+G
	ZGuMa05a42/u/IINkHvJ+7q04+OqDeVdLjvzdR6SP3Akjl5ZaeYunn/BzpousomkbouqgX6foHY
	obbl2pxHBF6Adhm0+JiA=
X-Google-Smtp-Source: AGHT+IFDWp8u+QjgmXSWCzrAKUKVyvuRDbgutIyJGTYJ63yX5WXLYpLuZEG+9WHmxaOHRSYMoJ0INw==
X-Received: by 2002:a05:622a:1306:b0:474:e664:691b with SMTP id d75a77b69052e-494ae37764emr4557401cf.8.1747339180611;
        Thu, 15 May 2025 12:59:40 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae4fd80bsm1957231cf.56.2025.05.15.12.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 12:59:40 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 15 May 2025 15:58:45 -0400
Subject: [PATCH v6 3/7] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-msm-gpu-fault-fixes-next-v6-3-4fe2a583a878@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747339176; l=3349;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=NuuNOSzcg6T6eP7lLDMW2wQqpv+M7MyGEuNFao145fo=;
 b=G8f7cSFchFa6Ol5NZmbPn25aQKQkCTssSAZn+8lrwlFIh1x96h6u6Eq2OveCkRVCprigujkFM
 gF8bATUpx0qDSrjfTkYolsLQIxjAjr3aU2RLL0cOv0MsHcy5zrhpUHQ
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_125941_931923_82D903C4 
X-CRM114-Status: GOOD (  18.70  )
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

Up until now we have only called the set_stall callback during
initialization when the device is off. But we will soon start calling it
to temporarily disable stall-on-fault when the device is on, so handle
that by checking if the device is on and writing SCTLR.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 33 +++++++++++++++++++++++++++---
 include/linux/adreno-smmu-priv.h           |  6 +++---
 2 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index d71404ad90376b2c258d67e07ec380674961a429..98927be42bd1af25dcc3f667cb75d250a320c447 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -78,12 +78,39 @@ static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
 {
 	struct arm_smmu_domain *smmu_domain = (void *)cookie;
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
-	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu_domain->smmu);
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
+	u32 mask = BIT(cfg->cbndx);
+	bool stall_changed = !!(qsmmu->stall_enabled & mask) != enabled;
+	unsigned long flags;
 
 	if (enabled)
-		qsmmu->stall_enabled |= BIT(cfg->cbndx);
+		qsmmu->stall_enabled |= mask;
 	else
-		qsmmu->stall_enabled &= ~BIT(cfg->cbndx);
+		qsmmu->stall_enabled &= ~mask;
+
+	/*
+	 * If the device is on and we changed the setting, update the register.
+	 * The spec pseudocode says that CFCFG is resampled after a fault, and
+	 * we believe that no implementations cache it in the TLB, so it should
+	 * be safe to change it without a TLB invalidation.
+	 */
+	if (stall_changed && pm_runtime_get_if_active(smmu->dev) > 0) {
+		spin_lock_irqsave(&smmu_domain->cb_lock, flags);
+
+		u32 reg = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR);
+
+		if (enabled)
+			reg |= ARM_SMMU_SCTLR_CFCFG;
+		else
+			reg &= ~ARM_SMMU_SCTLR_CFCFG;
+
+		arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, reg);
+
+		spin_unlock_irqrestore(&smmu_domain->cb_lock, flags);
+
+		pm_runtime_put_autosuspend(smmu->dev);
+	}
 }
 
 #define QCOM_ADRENO_SMMU_GPU_SID 0
diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
index c637e0997f6d8eedcc42a03a9d303700f62f8cf2..8ed94fb39e6ec6a3d8e6fabe61ff142682f1764c 100644
--- a/include/linux/adreno-smmu-priv.h
+++ b/include/linux/adreno-smmu-priv.h
@@ -45,9 +45,9 @@ struct adreno_smmu_fault_info {
  *                 TTBR0 translation is enabled with the specified cfg
  * @get_fault_info: Called by the GPU fault handler to get information about
  *                  the fault
- * @set_stall:     Configure whether stall on fault (CFCFG) is enabled.  Call
- *                 before set_ttbr0_cfg().  If stalling on fault is enabled,
- *                 the GPU driver must call resume_translation()
+ * @set_stall:     Configure whether stall on fault (CFCFG) is enabled. If
+ *                 stalling on fault is enabled, the GPU driver must call
+ *                 resume_translation()
  * @resume_translation: Resume translation after a fault
  *
  *

-- 
2.47.1


