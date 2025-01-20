Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4611C02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 15:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=clItPhIQuRHdt/X/5Yn3hkPoRrPZ3x4kk0mvqKl7Y8o=; b=muN8f61CgALdwl7iMHUl/OwivI
	7bu1k5TibHCtJyrWkx8h8r7D+h6X4fv4L29Ii3wA/XuxL3BRxJ0OOVTNCVvm/2/iajh4B1lIOOwUF
	QrWuAO28ZOOQ7VXu03J/D6EONN4cGO7dxfAlcYOI4BNSqhexZUfSezb+w3pdaEo2WXOA2BSuly1Qy
	jkQWLRRKdMLnL1Bw4Oxi2OGbz4dYsE2eV1JXAUORokhbkjOb1zgIGbtbw6hwfQT56A2f6wzLntZAq
	H1+gX0jQ8Zl0J7nIL7MJbfdTq2A4ioAzpOzJtZUNUAH3xiYy82XwQGKrO6RYaRC46JsiZu91LD9uk
	Y9FJfHXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZu31-00000005vlc-2dcZ;
	Mon, 20 Jan 2025 15:50:43 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZtzG-00000005v5r-390B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 15:46:51 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-467ab37b46dso3506821cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 07:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737388010; x=1737992810; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=clItPhIQuRHdt/X/5Yn3hkPoRrPZ3x4kk0mvqKl7Y8o=;
        b=nftKIjftWOliz9u8fOE3Izdv2F+n4LxQCpYQ66AVy5McORciFEzl856W6KeoG0d+hl
         xFKq2OHfYv8wqMHB53xYpgmPU6JcuCwIhNN/GjS2L5oeHyNjAh53wcdWEmIVI9w23XMw
         YUHQUekVB60QTPCEOD3Ovurm3kbUy9yXjfew1zle2QoyFYBC+bBVb1BPslzwxFC89jdW
         Eli+BJxaLb5JZTIEBIYvkKP6ySGESXcNUMZVI3QrtBrdAGpd+jyioXR4qmxykACsyujR
         LKT5K3cN6G5I1oxtp66znYGvVnhyaOpVpM74gx+HtkUfG8f6SMI0O4TQ9dZx+VyM2YFS
         fGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737388010; x=1737992810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clItPhIQuRHdt/X/5Yn3hkPoRrPZ3x4kk0mvqKl7Y8o=;
        b=DJ6BdTs9SexhesEMpC1vn3cNNGaIqnVmGC3x1T0AUwi8wk8wSOCm0Z0Eg90Ty5jCgh
         Erk3inQ1BGVMYUhDuttgoqim6QHz4LlG7qmy0dOMBGHfteBsLRsVwGzQ3LYZ/+dp4f3S
         9/5iuDcLB0+LeNRLFuCQmDygThiFOiAgwy9z9UdJqnbkuPHRlmKokWa0bZIydLez+wVt
         OK3uJcD1r6LT4lAfn8P4PgtmellLCfFaqj+eImOgT3NB0SkK8NR0xWVshrwguILpyQ1l
         lQIfH4j1cH7ElWVSmqQzRa8LMFdYqSzbMGDtIKTiusLZ+hVWO4uBGr7prirhq2FXxET4
         oOkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnDGnTuVhYcAaV+oPd80sTGSQeF1Xv3O4cN/yDkvsuG4Jm60PkkKy5J6RKyx8ty9gSlDtnSZFnxZh3283aG7xk@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg+qZ6e8HT6AYkpFnuj5UVWYKbRQmdrC35iAFVSGPVfcjB3W7Z
	izbsasLOeu9pMSpaIMbOS3TzwRy4L2A6i47vrD3uFFlO+9E/glAH
X-Gm-Gg: ASbGncvjp6KxAjwhGjpdSYgxemg9pcqA5xt9QuFtpQpyZbrlUWsHn5T+QKj993+q/za
	K3r0xVnz7uVnyy0duwoVaHWtarXny5Kd7Tbm8Gdjw9TxnxDtLm3B14d6VkBYPLPwrp1HO5QCfKY
	77XqaoEdOfoEUfy/wvs+HTGQoXjw2k9YJ+PKzht3u+0XUYHcsLGEj10cAeGzaagK8eUtnzb7qId
	Ee8i6TCciGvqUxc89GChf7DcaSBbQvfG3oe4/3Xp8An+nE9nJrt+RQAplI3FI7O8+rlEUvHfpJ4
	EHZ3erZHc405M4IRBMC2NKxR+PE0
X-Google-Smtp-Source: AGHT+IGO83HWcFHvsj2Z+GtJHgpwBYQ5v8L6QYl9DTIkrCF/MppDtKtDUAn/rsAhdmobjhxCpwFbMA==
X-Received: by 2002:a05:622a:608a:b0:46e:12fc:6c83 with SMTP id d75a77b69052e-46e12fc733cmr80827391cf.0.1737388009957;
        Mon, 20 Jan 2025 07:46:49 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e258c82a6sm24230501cf.59.2025.01.20.07.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 07:46:49 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Mon, 20 Jan 2025 10:46:46 -0500
Subject: [PATCH v2 2/3] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-msm-gpu-fault-fixes-next-v2-2-d636c4027042@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737388006; l=2108;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=4obbXrvjN1YYsEVfq8apmOVUt5dXPe6TwBqzW1FSgs0=;
 b=1hM2Wj1hNgl2mwr4iWI4WCaP5p+MmlgGs0igxClq5lMDY3J0i7z9MPcdLw38a+qq6t3MdsGRN
 stHBB5mOzQLDWO2MTNS3tPbd/ElnrF/+O0xip/h7iEzq0A8p8RLFyl4
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_074650_791353_DAAAC5B3 
X-CRM114-Status: GOOD (  14.30  )
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
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 7d86e9972094eb4d304b24259f4ed9a4820cabc7..6693d8f8e3ae4e970ca9d7f549321ab4f59e8b32 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -112,12 +112,36 @@ static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
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
 
 static void qcom_adreno_smmu_resume_translation(const void *cookie, bool terminate)

-- 
2.47.1


