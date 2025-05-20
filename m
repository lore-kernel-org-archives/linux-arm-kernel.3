Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B74BC54E71
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 19:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlMnByBJdLmm3G9/G0GQ/d4DyVfZJhKLZ7MqYnU+doc=; b=Zs10f5kah6/cIgX3o1PJAmO8zP
	opoEFXhvf5o3uY3SZ/HlwDnL6FNL7K+8MdyV18oLJkhAo9FWetVMyN1n0vztULZIvJ7h4QLoFDjCz
	osvgKvbXgT+QW6oZuz0O7tJvaVrLEDgARNPQl9VAnf1mCICwlK8apTKpZzkw0C0psneOnNPrqu+ai
	MRAYluLY00mmT2nt/+MyT2Kf3SbMfsonDDKRwpS36yWJPmBxYt84y9J7tuNpPvGgZ6J7jW6UbMVJg
	mFnozD6E4OQ6mCgdHSPsKi34JdFZGfXeyWfFkpkFiI1JLIOo4WAyjAljbd8tUmodpQvJJGTOBxiyR
	ra160PXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSTC-0000000DuPo-0t4H;
	Tue, 20 May 2025 19:17:46 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSKl-0000000DtVQ-3S5l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 19:09:04 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7c964e8710eso40818485a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 12:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747768143; x=1748372943; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rlMnByBJdLmm3G9/G0GQ/d4DyVfZJhKLZ7MqYnU+doc=;
        b=d5ugysRUUT0jzPKf5vM67oQjpgpO/EwNKOvqUi4cAr3q5CV/Yzp6YNO8ub5vIhMH0Y
         Z+cC0PFjLX9+FjVWWs0Klm5R71f/UeIoU2PHON7fxTWZDncdmZgFiVgHDDPdOFJZuHJF
         PJQXfOVQwSTOwwhk24vi7G2B/LBCRS59L63jWx0+ONCOKUgVawxPnOMvBPHF1/0wyDmV
         59UOC4CPnZ/bmwjBov484AGHbtzwywyYP8fZT4yxlK74hvWn1b/ho/FOPxXG5VPw/Zgo
         8vzcz7VZjGvOfrkmQbI9kKT4i6TjBw/Bur6/+DrRX5AP1X2ZQJUiRqf1de70f+Th2Cio
         gmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747768143; x=1748372943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlMnByBJdLmm3G9/G0GQ/d4DyVfZJhKLZ7MqYnU+doc=;
        b=Ef/scBcgKlbs5o2kolBYi3nFyoDCAIteqhNJYXy8yKVheSW1LeqSijWzfrdVEK+tdw
         YwPWPXurm+UJGfb4WUClI1MoOTaiQOB+pB+A+zNpSLFIhCu9bj7w9RLo1fJKWx+7FAIc
         5zrdErhtcaBXLFPUl4BEdpQetZNZqG1/80s0E+aFFhQBTs5LKW8dGibahHYLiQMnAEzJ
         3HhB/lB4/oSMeP+NVz5wF/kfykP5153ejrv1JpaUEFtSkxOtbzHpboKeWAhTLSKB3YnK
         FOFhjmpoMBf9j1Xl8hhyFpgDgFNIBVKSGQi2UAKWJFLVTvFRHcmbKc0mACZdT5xKLua4
         HHYA==
X-Forwarded-Encrypted: i=1; AJvYcCU75pwiF1L0hcXtOubpbyJfh6whQ8jMsBKHBNBrp9NlvSuStArMsiN457rw7pOwSG0BvAVW2Ehj05uvyl6rJK3S@lists.infradead.org
X-Gm-Message-State: AOJu0Yw60NaWrbT+hhO0MKxKuhwqvXA3LnMGrudHiWzdm5lTCPspEpm2
	+OfQiArafV8rmSY8So8uOzPEhahl06kBEuvu2A3FFac+MrNiE2d1kzCo
X-Gm-Gg: ASbGncu/f8l56aOTklV2O1Zg4F6qw+ayopy4lek+QyQ87BUajWrRqJ12fRMrCq/92Fm
	F5ULBTVYfP3nL41ed2FUrlC10LhlpbmI07sP2rJ5nFjN5tW29z0+7lmFSy8fG9ReOB22YgMdRh6
	Kgt06FqICrHcI233jaGqUKteduJOL1bX1CJnRHEKOAtG2Pp8MouSlEr37IeoF4CsxkNewSzRlJ6
	P09uozLiBSgen6hc2/saT6keRdSz4ilBgNtsqybrwowyuRYnYnDUebZ4jmXEISSJsfgA7iP5czE
	QTDv9JAY5q4IdMzqoRHVX5sjO2/KgLol6EFkdlt1zgrXRt8yHfgrtPdG6EY6T9xXESdtK7zFQ0w
	uAY7nDEL0rP3yWDTndVU=
X-Google-Smtp-Source: AGHT+IGIrgJ2dmANNY3EjX9kZvxGmi8VdnrE3uOp5o3gsUKwQp+d16sgiHehsoeADCEn10ddqVWxMg==
X-Received: by 2002:a05:622a:587:b0:48b:6eeb:f98e with SMTP id d75a77b69052e-494ae330988mr104811741cf.2.1747768142906;
        Tue, 20 May 2025 12:09:02 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae445b99sm76554051cf.48.2025.05.20.12.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:09:02 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 15:08:56 -0400
Subject: [PATCH v8 3/7] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v8-3-fce6ee218787@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747768138; l=3453;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=RnNUWR8apEx6WPWRc8HjEOtdMZqQUWqHrofPXnVy62Q=;
 b=Gva2s5Z7Ds/ygUrvduDeZ/TWE6RzxCRXnJg0Zhx6Z4wRmr7VRKNIHU/2xJaO+oPPC4dZhG1Tb
 GdN7Dm+NI2yANHk93Y3MujPoXjVnGL92q+a8IWtX3FmhfkHr+wCKih3
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_120903_860472_E529DE2E 
X-CRM114-Status: GOOD (  19.11  )
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
index c84730d33a30c013a37e603d10319fb83203eaa5..f7430c131c21f40308df36fe25fe75d31558c817 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -112,12 +112,39 @@ static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
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
 
 static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
index abec23c7744f49bea70f3352da9385304ed3702e..d83c9175828f792f1f43bcc8056102a43d822c96 100644
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
  * @set_prr_bit:   [optional] Configure the GPU's Partially Resident

-- 
2.47.1


