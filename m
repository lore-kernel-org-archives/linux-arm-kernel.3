Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5375EC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 14:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HPN0fQB0H/8KK70kj8NlZTzNxC/Qn5H/Tut0vpbeXbg=; b=hbvW5UUKb57YiyGOXaf92YXjHz
	ioqacxChXu7dkAhBESft4grXHQoXCCusnBIkyvu6nl/gI2RHKu+f7E+SB7bsxPdKPv78ACIoAL58Z
	uzyYfLlKv6miGu57DvOwO524oBZTwaGHBLU+HwAKczRupSWEuAKJ4FKKjVqCZn4qsyZPIeojebVB1
	yIKOeJN2h2XUUq6nOrIwCKsyE5EDxOwJJakNP94WDZTvJ3LtZl0CbKkwPY4gur0vszoLxb7WtgYUJ
	sOCpaNhFBVMYYWm7Bfw4cLeZrO+3W+0sgbsow+O4WvR7il0KBNVzDJycQSRJkSjfwD4wlNhA/UKRb
	IOSsx0RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuuoE-00000009Gap-2WUc;
	Wed, 19 Mar 2025 14:54:18 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuueS-00000009FHj-3LyU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 14:44:13 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7c0b5065557so16624985a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 07:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742395451; x=1743000251; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HPN0fQB0H/8KK70kj8NlZTzNxC/Qn5H/Tut0vpbeXbg=;
        b=hO64IbbvCEm1ahiGWdNfriAfhWPIQFCI3nmlOPIh4IjS6meZGTcN7Fs/I1/oH7JnfU
         /hBX4rSC9i/9IlHwaYRGqnhmLnhlVI70wR/W5RQMsCwewg/dc9Gtzgk59KVtf/CYIDGQ
         1K2s6+FaAFeqyvfWGbipv+7lI/2XtuhDYVeez8+lL5jQ3qV7B/CtbgXA++sSIvwQvjkz
         nbwpABls0eQWn9OzMAH281JoBYc7N5o312xGWsV0wmmMkNHGLEO3pBkSeBONL/9XoOCI
         b4YUEWeDbERNz+W9XkjqApgmKph/v4XzVina69+1Lumjg47wuyUSlGV2Gg77kkmTTeyL
         ypLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742395451; x=1743000251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPN0fQB0H/8KK70kj8NlZTzNxC/Qn5H/Tut0vpbeXbg=;
        b=Gul8GoyV87rP3JaPgzEp8+aorWPkBbmQhJIPo2qU5+s9Ljox1QnCD8diT2qgFvbngN
         GY1sD6Djun4sZ3zRuUNi/DcPi8wXOR4eKt+C1QtQAiGgKrHoKJUHGPgn4qRbuAg1isXD
         j07zujfMPCyjlRcJWziAbDbciNcRMHyT7m//aaKBDygs84A5C4qVgCk7D4bMI2RnEyta
         i8ZUvUBMleJHpan31EQaXIkGWx2pHd+Y2CCBS0+EeiI0WI+efsPZVWH2gl3lLPwavueD
         Sius5qRrfS6sxhGrg2QH1OAil4LtIxCdjOvis2lG7Kod7fVYf/QaZIYxFli3uUsOwlAt
         6ZxA==
X-Forwarded-Encrypted: i=1; AJvYcCVVmxvdoelMn7lX8AOK1JwEzWdkPvEPoNu/dJr+OJK8QwjBS6MLWwd7FAAbIziMnTjU/wlPVxD18Zh+5ing4wE/@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7S1D/6F4bZ1dnCUcC8pxRrOtX3jB2Gru94uCq80Wrhp2sLjkG
	0iRJFgucNLXxQPbIRqKoxRKrelgUPw3dRL+0WQsa5xsEVdDbMS+G
X-Gm-Gg: ASbGncuh5tGXctSH2jc5ZHJLwoWSh079aiMBFZ2M5Rhy6PfCRiyZJ71h+/HSQzkp/Y4
	jSFpusDXGpQrpD9XNt8YTCT4EjDLDabKEX0P8LQkn4Gifkh9SqwllX4Fw0rwDm6AhdkQQtPGo3B
	o5C0iHMS6166bIkPMSItik9DCoNguPGeWzOEDnUZxptJpSmoEFIjbNzbvrpV8EmorbNq3lj8wID
	quwW4A4IdVL3RennMt+lqyDW67Eo+EgLkWze9wrl/BL2RTZsJ6MLovxlJCLJONaCO5QfEsIVAjL
	sGqjpulRPM8RrxdLvaWqfB8olgocyDaOyUMq00NQ5dAwgS1zoy6KI6jkfDVf/HSUSJYTgs+s58E
	IR5g=
X-Google-Smtp-Source: AGHT+IEpDQ6Iq7EL34BOyUpZMWjHvcPvh/lkrIFcpZHlUwWtyFmoiBx6pZ8T713YT9KI50QLqxMdOA==
X-Received: by 2002:a05:620a:25cb:b0:7c3:e399:3289 with SMTP id af79cd13be357-7c5a83d609amr122312985a.4.1742395451490;
        Wed, 19 Mar 2025 07:44:11 -0700 (PDT)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c573c5201fsm868587485a.23.2025.03.19.07.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:44:11 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 19 Mar 2025 10:44:03 -0400
Subject: [PATCH v5 4/5] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-msm-gpu-fault-fixes-next-v5-4-97561209dd8c@gmail.com>
References: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
In-Reply-To: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742395446; l=2356;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=dyr7GkrtgLsig+n5TUngdYzO6eV3oK7bTiLJtUDHAnM=;
 b=RKN5nvvDGIxbm5UBumrBYsNQjDxpkr0KCnP1Iaw92xOCRP/yvUGsivMyDJOaRMEhdhlM/3hlS
 Gw3WyY2nTiICpPLJZ1sNNIRZU6cstKEpnuXrASFBZYibV9DoVEO/0gX
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_074412_846183_A1E4E3F3 
X-CRM114-Status: GOOD (  16.00  )
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
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index a428e53add08d451fb2152e3ab80e0fba936e214..f6bb405573be0ed480a2587a5a780dd711b8d2aa 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -77,12 +77,39 @@ static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
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
 
 static void qcom_adreno_smmu_resume_translation(const void *cookie, bool terminate)

-- 
2.47.1


