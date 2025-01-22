Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E02C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 20:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=clItPhIQuRHdt/X/5Yn3hkPoRrPZ3x4kk0mvqKl7Y8o=; b=x2XdV0TrEAL+Vvqcbai7/Alscu
	MlbsDV61c65vbPYAjg/4SUNGhmnIYdvtmgp0MFmoBWCNwHWgnl8QNHfJcAdFo30GuojuLill7EKe8
	YHvR3ykXGCe2dr57P5HG64JrreBJCZM5ji7X6D7H0tv/Qe3vcaeJVSM9qPkoIdpCLEekU3//3EO3I
	ASzmOMy5Ouj2qU9qatrUKGFIKP0PnAHinas3OMnl4wzVHjmLKEuJU1QQTLICJhebvmJVQ2JWXoVuj
	XV0kkgufgRb6RCuOp/PAJ2hqrO8fQhpE8CI8WpWv8Qu3C1Y6OiZLAaX9RvHQIqwSnrchaWLHSSqsE
	4pxAGYxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tagxF-0000000B7z7-1rRX;
	Wed, 22 Jan 2025 20:04:01 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taguV-0000000B7bV-1r49
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 20:01:12 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7b858357124so1338585a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 12:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737576070; x=1738180870; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=clItPhIQuRHdt/X/5Yn3hkPoRrPZ3x4kk0mvqKl7Y8o=;
        b=ll9jhOE+Q5hqNVqm/wm7ooUgxKNQ89nIG21Axq+bjVCreiekB5apH91IFwTawM+ufI
         mXT3WYzDqfRvt51XTgjij/ovI8l0jZbOGkv054YUpHWF4l6eao9k9AAi85NcfBDoKhd8
         EoQBWP52BkR0HJ4uvnGWl06LgUZaLQBLXfspeLLR6CgRrTcu1BoRKlHOoOkbpHdNlv+o
         ND5VE1QmseRamb74FXk/kUaAMqMHNIhGXEk/ygJLpubZ7KemUKFE0SRQpJKuKsGl+Wzf
         mbXtsQDIdzlkgFJs7npDD+tbPj15Nvjp+nNMxBpTwv8aVWFFZTBGf4nvVBIDrUoOSbv+
         Rs2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737576070; x=1738180870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clItPhIQuRHdt/X/5Yn3hkPoRrPZ3x4kk0mvqKl7Y8o=;
        b=rCS/MqZRGuXJ4TeGNDRayqdeMIVQBL+ylH3mbyTAlbUrLwnvhHuxmolN1PbjoZnhTj
         EMFrpTU3bLuwV6WCwUao1ET/RLN8Y3ZokY1rvImLBs0J8BrINHzEAC6+bDQVmuemXDb5
         KdgsrMdFnEmSqHENe6dHHLeMiIpHRq9hYDsukLskb/QC0tjvEMI+EbySl6rr2CPwT1HG
         RdHKA8mwzFFKZhBk6SEXAwymWQuFFzOeZq1wuPmIw2Xq43+c6hnsAFQncKzAMH/p06kN
         ZEDkbeimmw0kw4D1qlIQZfT0QaNxC34ycAN8sqOdmsMC5joOOZKOQQf3SBSUeJm58YRJ
         gNeQ==
X-Forwarded-Encrypted: i=1; AJvYcCX313A5lRXMwyYnHnDmWk4f7L4R06VRJdFkzwuMQpGbHeWgB5fWNubnM7S6w89P5IXgTr+6440iDUvUe30nT8Co@lists.infradead.org
X-Gm-Message-State: AOJu0YxOsXB0qixmpHl49Q+pZzQ2INAXVXGVOTs54NrZj+DY4GaV7isw
	gdAI5HbKM8CaVoa4NcmuxWXCzl5iU7bYL/i6TZInhnOmjIRj2hW8
X-Gm-Gg: ASbGncvuyOKT0hiiuanTHRTFD5xoH0GDXju0ntP464nBdtIexrnD6SBYgFjh2ffzjzV
	lpR31+NMwKQp52bpEetqDAX0SMZFToiHrW3PqhWBgqFzfUli5Gz8nR1Dge/bDLGS47dw58lf1Xh
	SwDzGcu6hsT1ewVC6U97T9H7FPztOgSC/9yTnP0kkTRmXgP99Ag9StTCIIqwjCo+QJAvT13drI9
	iUcxTTHq5mPOFYZr+h92svuegwFOlQUyraDm0quUTPsRzcSvxn1fkaUHUBS5mgs1WD/ewER59WX
	2LdzGic5qQEgqdNiLYppHFcIbGBD
X-Google-Smtp-Source: AGHT+IFbsQgN+OYWoJ8tGUrhqTk3b6gEBJi7yaE4oLpHOAjzYS5P1remXjUXmLoR8liW70biIpVbJQ==
X-Received: by 2002:a05:620a:1911:b0:7be:3cf2:5b46 with SMTP id af79cd13be357-7be6320bc70mr1391147185a.8.1737576070653;
        Wed, 22 Jan 2025 12:01:10 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be6147e30asm694606385a.31.2025.01.22.12.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 12:01:10 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 22 Jan 2025 15:00:59 -0500
Subject: [PATCH v3 2/3] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-msm-gpu-fault-fixes-next-v3-2-0afa00158521@gmail.com>
References: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
In-Reply-To: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737576067; l=2108;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=4obbXrvjN1YYsEVfq8apmOVUt5dXPe6TwBqzW1FSgs0=;
 b=UtLt9Gxw8iQpbRsxeRyHyMb7Pm7ArBDOREehdF+WX9yPMugQJ3Icy/92gYrtsug8VrkLc1is8
 CiXL67DhVUCAGFOPZCD8bglUB3zCsRgXLnoLC4DgfCG1QTviaTVY5MT
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_120111_477028_7FAEB608 
X-CRM114-Status: GOOD (  14.05  )
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


