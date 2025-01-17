Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DC5C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 18:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7cXS8jZh32k3xn1O/NOhZ8hhmDw8Y92QQ/WTT5FTNxU=; b=EMCLKl+NsKZQknKEiyAAUorVpf
	RFrjMH4hpU/qfKsJbVQBmKCSIXe02LU4tEyg4No8UtE4UwVOUzvoDt1bZwYHCoDhlYA8bZLdy9hIl
	vMC8O+1XtpEc/fFhtFn4nueoh7Xc9vYcIVAGkJHPh8Y4aamgVGHLL88D4EcRVzz3U4XYUcgXx1Rpo
	NBOQkWstVS7z2ACcIHbX6nHyW+2FMo/GKsRCApUolC7lEKhWop9aeHdt2haf7lvwsCc+fPYOyPSAb
	OXf1P383bFwR33QTfyuUwWJRU/CgxRBiloY22/jPnSTuOEsoV67qNLkeJJvPE+S/uBS/hzjZp5BRv
	cvr9moDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYrSl-00000001ATZ-1jKX;
	Fri, 17 Jan 2025 18:52:59 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYrNe-000000018ua-00q1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 18:47:43 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6d8de4407f3so3525296d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jan 2025 10:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737139661; x=1737744461; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7cXS8jZh32k3xn1O/NOhZ8hhmDw8Y92QQ/WTT5FTNxU=;
        b=MgY8mNTxbYA628H1kEN41GaxaD5nkYh9Q5eibVEh/AtqPQOD9LYdPl9wQ7gMaiGXQn
         P31QQBnvlacQevlRZLgBuAom6YllNIofwP/NI6WIERNX45tp8XgXWth7wVWVgbT5HPFz
         DoZPofeSAiC6v8jjk5iHuv70B+0HNA4KhlPeFhiZVmKyPAb1AqivglmgcyNVk3HcszVj
         Guthb1KcGkFMDshwDxgR+bz9rlNeezp7PC+dFc3aI6Gz8KpQpiLyUgqady8c4jE9/LEv
         5IFmeQSCWOI1AoIN1Wd4WWIChC7MYnGhT1qsXZW/CIjWqsYHHbuGpzDPoOUs6noIKlDt
         aW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737139661; x=1737744461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cXS8jZh32k3xn1O/NOhZ8hhmDw8Y92QQ/WTT5FTNxU=;
        b=sMGaGie7LvxuN8Ah8McXl3Jdh41JpM2w6eeX6pnV7SH0niNyhyHgamtyxyApALLIOB
         wgx7gNFCxRwv2o2wQTN6uWygWx7b9di1qPCSIIWThkiaZShwQ3CwVNCIdGqxC5c7l8aL
         ++jjEU5vzaTXKUig3txslE9C2q0tnMHUDjp/iLqcDqJk1k3p4PTGNZwQIqMShIv3cPN0
         e1F501PeQabFzHh+wH1s0eZpvKIMNK0n0cSOAW5wYKuMaX2xhdURaCRh7tqni7iN5cTJ
         rvbKaepUsBpNbi/4ZLmEn+QYRWHek7RK/YOhWEQy2H0JcVbwUViEuqN7iJYuqSOTkVao
         PXPw==
X-Forwarded-Encrypted: i=1; AJvYcCVaOLZpN5upVjSM1jPnEpMkmG1/vcnWDOhEwXEKXKRj0qrTYlW/yeoZT9phl5+THimJBfqg+sMOT/dT5gsDTu3z@lists.infradead.org
X-Gm-Message-State: AOJu0YzFg87GdrF3XQs+lwCxUsaLkhm2om11d+F5405A4YbbiNvikHkr
	mWnpH3zI6+auHG4LleWK2SD/iLVZZewoXXkDlxjf1K4LXbx3sq9CGFIssw==
X-Gm-Gg: ASbGncteMawDB+j2NBEptcZuG4X9KgVP+FGmhG7W0Zuh7ucj/iq77qxq2t2qZsCMncM
	sRx+82wJM+HXfRrwwjFh2D8LcIgUegR79xtX4/dvTdeC1K6x6J+tWcpA7P36jPPvvD862QkbWzT
	e//t6q1RC36XRkwMCd72A35MpmLPGQaO6d15lqe5TtddoZzzJhZUcS6UC9KHDMEWvZBbWHwIp1k
	2YoGo9dbAiJ1VCHOy74WTcCIWPgFhUNiDcNUzCCBke8rZijzxMyXn7jFQCSm/RBxMnIXoWsW+p/
	LbH4XdWgq+te3b8=
X-Google-Smtp-Source: AGHT+IFkED0JQTC0Xpd5G1Q8mAnhBtwFYNMO1jthK556QYFx0lYcOPWbJ2YYI/wogCp8QUtnRASS4Q==
X-Received: by 2002:a05:6214:528b:b0:6d8:7d84:a514 with SMTP id 6a1803df08f44-6e1b2175b9dmr23314216d6.5.1737139659256;
        Fri, 17 Jan 2025 10:47:39 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afcd3859sm13992176d6.74.2025.01.17.10.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 10:47:38 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 17 Jan 2025 13:47:08 -0500
Subject: [PATCH 2/3] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-msm-gpu-fault-fixes-next-v1-2-bc9b332b5d0b@gmail.com>
References: <20250117-msm-gpu-fault-fixes-next-v1-0-bc9b332b5d0b@gmail.com>
In-Reply-To: <20250117-msm-gpu-fault-fixes-next-v1-0-bc9b332b5d0b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737139656; l=2114;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=JyOLVh0gEkcPnnA/qjt0Kfj3pqe9UFDopPZk8F1e/x0=;
 b=Z8mukskVxG/5911ObuOE8aZjxBMyoMMxQL49HUEn1UzKTTkKUCl1YqM1Kdm1q24jL47h7A9xL
 sQTHHPy79i0CWIRIUNZjb06P1taEZ4QbjZs13mX8cjDTJoodH+OmmrC
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_104742_045606_058B2FE9 
X-CRM114-Status: GOOD (  13.45  )
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
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 31 +++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index ee2fdf7e79a6d04bc2700e454253c96b573c5569..54be27f7b49d78b7542fd714d6aade2b23c65fc0 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -112,12 +112,37 @@ static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
 {
 	struct arm_smmu_domain *smmu_domain = (void *)cookie;
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
-	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu_domain->smmu);
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
+	u32 mask = BIT(cfg->cbndx);
+	bool stall_changed = !!(qsmmu->stall_enabled & mask) != enabled;
 
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
+		u32 reg = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR);
+
+		if (enabled)
+			reg |= ARM_SMMU_SCTLR_CFCFG;
+		else
+			reg &= ~ARM_SMMU_SCTLR_CFCFG;
+
+		arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, reg);
+
+		/*
+		 * If doing this in the context fault handler, make sure the
+		 * update lands before we acknowledge the fault.
+		 */
+		wmb();
+
+		pm_runtime_put_autosuspend(smmu->dev);
+	}
 }
 
 static void qcom_adreno_smmu_resume_translation(const void *cookie, bool terminate)

-- 
2.47.1


