Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2306EC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 17:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlMnByBJdLmm3G9/G0GQ/d4DyVfZJhKLZ7MqYnU+doc=; b=drgb9ObeS1qIl5zy91Ukahlq87
	DfqIMzMM4e2J5euUN6y/CzFOpISDal3GKu2AODaD/hjqHytyDz27zbZGSy7FU/1hgKT5h1DGXCvPg
	6Tb+N2u/LzqOzDpbhgZhtObtO1Imhx3JS8W6VjKl0blPxsaAGM+DGC3yZjwuBPUo2AkueDnGfAgl1
	dBAQvQevZoS9eFCnrIsobHbeaOSTVGr5Nds0qS4zJUOveigB96mRLuAnv5GHiS5sVXVmgp8RuH7vJ
	yqd1uhvLxpvK3YAZPc5UFIt5oiE4SC1//tw8Lkk89xVmWP6HTVdfMDufRkka1+W+f5WgYkWY0MO36
	Zpkm8iPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHR9y-0000000Djem-0QNb;
	Tue, 20 May 2025 17:53:50 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHR1U-0000000DiBC-2QjL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 17:45:05 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6f4bfa29e00so7960176d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 10:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747763103; x=1748367903; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rlMnByBJdLmm3G9/G0GQ/d4DyVfZJhKLZ7MqYnU+doc=;
        b=bfe23jdYsYKha9/ZaOCqbhPEB9SOLdMLHRPC33urbKjn9yO8hjj9VuOyK9HYcYLOK7
         w20IBmcbDP3QBE7L1fj00sHDgne+vg9UDJroX6zP/ecWWXGZX6oRk83GNl0H72LurJjh
         5uok9//2XWuGuqZmIdpVIEjS6o16GdRgIy9W18MY8WQq3E/BkHpdkUeploi+9IdF5dxA
         49s7MaFLpqt+OdRVAbx2bE4ECWkgzke53tFeuwfGLhIrGgqY3CSU0jP/Q8/DXrqKuk3m
         PK87ITY+F4bfXUQwrwXAXEJNtl/DRsB1Y2ff6wadBxwcabBjvCKvngITyH1IjGL0MVSh
         Zcrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747763103; x=1748367903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlMnByBJdLmm3G9/G0GQ/d4DyVfZJhKLZ7MqYnU+doc=;
        b=BEtJtmCzzXGe8P/td3AA29vddMudtYVarxMUgFatNsyRkIr6w9GykJGV6EWFPIPhVl
         GSXDdjhtMzxRS/QddcX6RZ470/O0kUI0F/JpZYbZVtKKIkHbvhCwZemZztYa878mPk17
         DLrqwHuGE8qfsAxRjGvPjxmQ8+8C1svotLnIG9GemuhATM+zhGmqcptDDXng3tgk4EkK
         7uPh0C70aOU6f3EHpvpydTg3LiKNcDnXL8upY9weXJVJ0xPtkcJwnsl5PU8kztoHUV+S
         xcS09k5BY8SGgrC9pwhBW81pon4LKtk/Co6VDfeXNe5SwdCGO/wU29m2+WdWvW5eHLff
         DDgA==
X-Forwarded-Encrypted: i=1; AJvYcCUALeeR4EJ8y9XbJSPLAk5bGfDsyRBi8A/EKKQT1RmBJatTBZVKimFc2TNXmZH/CRrogbpf2Hi6Vyri2Eadoybs@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1q8YG+yEG6tAbVxiSjNc/7MxgspUjeM4p60r2NJNmEuZbg8Vz
	R06LdVXlD+A8TJ1B8B2i/B6cYBVxwrh1+t7ruAYP4AWOpcxDTOsYCoEb
X-Gm-Gg: ASbGncuB5F6x5K5y/J9K/UGVXi2smioXpW6LcYVYN/tb+AxyPXaj9G51lgCmzfkfHPr
	puPYFPoSyhK+gVxataWX9Yy0+lxYgxGXVgmhYbzA9SyEgkQxj+xSE/L1G15crQhByI3llDlEgBt
	nflSrblseE36SCv0NGL7wvnWJNH0tbRPoyvobEmg8nS6MvCA9ez1AEjMABKXknQUsjrITviRXdR
	naPS9Re7XD2zehFr6o4rKO2PgWvlv7/mludavhDajwt0yfbNAGIDfzalbnhpXy98gg7xOJpflCT
	fBrX/8/zFy9PTiQDWkJaVAFe5Dpx7hjdNB2F3gbrAAfEk6krm8+YLV/Ye+G4QuMj/3eom+kr+rY
	wC5+rnHAJv9OJ/uEIREP5SExJl4PBXw==
X-Google-Smtp-Source: AGHT+IE97Zxos5az8cXO2o92+oaDSt/gpfACDdIypt80WhX1ZCXMDiAGP2cn+7N7wTHFzmRR7CT4jg==
X-Received: by 2002:ad4:5f8e:0:b0:6f2:b095:a79b with SMTP id 6a1803df08f44-6f8b0847d1cmr100255236d6.3.1747763103301;
        Tue, 20 May 2025 10:45:03 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b096ddb4sm74126586d6.78.2025.05.20.10.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 10:45:02 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 13:44:52 -0400
Subject: [PATCH v7 3/7] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v7-3-96cd1cc9ae05@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747763098; l=3453;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=RnNUWR8apEx6WPWRc8HjEOtdMZqQUWqHrofPXnVy62Q=;
 b=tD3WtT4vxh3vXzx33GeuNyl5hmvn+QJsiqPwD8bbM2tFraZ2f8cV83+Pw3p37JhvR3WUGpJVu
 Jc3NWPlszKkCay4kWpB4ilL1RekYJZqNSrPXTsclNz4Cevm67LPekiu
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_104504_624602_1DE9023F 
X-CRM114-Status: GOOD (  19.00  )
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


