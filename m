Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3231DCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 15:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EhQrAQa75d2J0YA5KpT6AkN5xsQFVAOM6cWXJDqCQUw=; b=e4DHD+lz6n03WR19XLBSkWm0CH
	KldsyJEXsZwrd5wuyzjpiuVO9njAV6zyqia9lv6STCvR4fLKVZI93Ghsq4UOv5CA9fw4IRXUldLkQ
	uGNtlYMF3iXA4h2kJO6LaGQWsNYWbsUdMZ642YMobRsOMUk95TWc5lhecXUbzd4GLGR288pW5xnew
	L7uYA6QtRY6RLSKhkNg48ujvWFU0/yCWTJOWayA8mknrWcH1OV6QyvRv1XsN4NvZnf/SZwjj+iiAI
	8SadFm3vE2260a1ZSuNvD0sdN8Pvh6T5aOh8zSKiZNxz3ic2pXaX9/HpTDf6X9aBTjuUYN6oaAtVa
	7i/ENvBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0tL-00000004EbE-3lr5;
	Thu, 07 May 2026 15:43:59 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0tJ-00000004EZo-1B6i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 15:43:58 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so11909485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 08:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778168635; x=1778773435; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EhQrAQa75d2J0YA5KpT6AkN5xsQFVAOM6cWXJDqCQUw=;
        b=a0uXZr5oPkdBrPup/7kY3VOXd7C+z5kAfgqPwOfpJ+o1MA/XwoYet5UgOTmG45BywX
         xzt9pz0zH2NLo+urgA0Wg9RWd1UIVvHiuaMp4BeNfBA/P8TQX1nkt3Bx+cSqv2s1L5cy
         WIXKNCRFEXbLln8V0twYsZ+90v57AQcBz2pIHE3PPlfF1YzKDzEgL7GoikAkM9ebht5D
         GOnt7Puwi0ZT4xatmXShPT0RVnLeqmtXDuA/6GPtSnjoj/KiDyP71NWqZf3DkRg/Lh/W
         UoQBT2hMoiIK2RmZmBxOfOAdHzhXv/kTGj7yM8FQVX0RGPAdInVr2P5t973K6am9NHdg
         Wbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778168635; x=1778773435;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhQrAQa75d2J0YA5KpT6AkN5xsQFVAOM6cWXJDqCQUw=;
        b=Vs2vI3NqOQSjMmdtBb+04gBGAUa36VQf0sCXi+8eemMyt7KQQakNgrAmyDYg3LaVf9
         4e4fAyfmbVF/jnHV5y8jW4AmCweOG3RrZ+yk0PXy5qlhDe/RVKRy5Cjiz9+77UvccT+O
         GIzBuZfl4NkzuN3NHE1ZchdvKP+XudrE7991OQKXYwsBEHWmgadt+uffGEFOJHmQKPbx
         TH9CMTXIPqrvudSBtdXw9iA6/XLzQmPeCZqVJ/aoaUXpzmmDVT7u4UjuoGqxrhNRtlLo
         ttO3CftPmJtDSCE0sixr8Ft1vzUbh7oApfhNmbXYXiH0+6KHP6/BMs2ez9x+Fs3Yn74C
         CePg==
X-Forwarded-Encrypted: i=1; AFNElJ8171FY94/Jpri+de0i9eScclC5QkyHxyG68gT6OOMDDk1+MuhFsEPG1IeiH/kL/Wq/QCFSxdEnKpjUuWvmhi/D@lists.infradead.org
X-Gm-Message-State: AOJu0YwrZXwmZp64YE5ROIH2AtLV0eImChmnVeaE0a3TtWM/+rX1MktP
	fP3HmD1QWoeo67IVDDEnqjLLhGySsjnM5nn121SSzxaN93rCsFO0KtqTso+C
X-Gm-Gg: AeBDievKdv8Jiu3JT2ThXnVlvzE0p3/7s64UNDopjLs8SkauO0WNRr1DgOPjE/UbYYk
	UCUX3KqWwQPiSvUadx0GGLJS1cbiQtfSQ8t2zaJcvAFdG83/cqaeOyp/dMCPQKGBXZCtuvXMdLe
	FxC3+sM7gsc/yqtkh8K6/xC7GMUSfCrSzGHTYm3J1DTzF57Te2jNzychDBO41GWwOO9vprhTBWo
	nsUNC1pjU7XLXPArVmTBivw+p9eUE2Can0rV8sxbd7NXZhCfX9W2AOuvYlVwaBFmZ27RIFgz8qr
	qq7WgK+xoAgEnbMQyxSrWhdPSmwBM5XUCVm1whBSLqe/DIW/aVvPHYiES2t82w+S7sh/wXJ4elb
	cIQ6SJkr3GND0Uo60h+w5wx1FV5lfugfuG+qvTECuKYeiHylQ6cZVMaWUg950HpYJS+8sXhzMEL
	gtIlFqmVAq0ZZfrIgrQt9KzAZiD2LPSBm87cv2WsLPUMor1xZeb4a+hCT4amG8PjiLxdl2OhqSR
	sfe0pbKx/WXawXfZo4=
X-Received: by 2002:a05:600c:a305:b0:48d:364:6c54 with SMTP id 5b1f17b1804b1-48e51f4144amr102180955e9.23.1778168635011;
        Thu, 07 May 2026 08:43:55 -0700 (PDT)
Received: from [192.168.1.17] (host-79-50-55-97.retail.telecomitalia.it. [79.50.55.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53891d62sm209994895e9.1.2026.05.07.08.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:43:54 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 07 May 2026 17:43:15 +0200
Subject: [PATCH v3] iommu: arm-smmu-qcom: Ensure smmu is powered up in
 set_ttbr0_cfg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-qcom_smmu_pmfix-v3-1-af8cd05831a2@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNzQrCMBAGX6XkbCTZ9Ec9+R4iZdOubcA0NdGgl
 L67aS8K4nE+dmYnFsgbCuyQTcxTNMG4IYHaZKzpceiImzYxAwGlACn4rXG2DtY+6tFezJMDEra
 gMScQLFmjpzSvxdM5cW/C3fnX+iDKZf3fipJLXu10JXOFjSjUsbNortt0xpZWhI+voPj1Ifkaq
 3KPJbZC07c/z/Mb6SbGKO4AAAA=
X-Change-ID: 20260210-qcom_smmu_pmfix-2aead2ba4e20
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Anna Maniscalco <anna.maniscalco2000@gmail.com>, 
 Rob Clark <rob.clark@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778168633; l=2650;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=JvTfGtQt/QzZHDNLS/mKUWRZZK3nInAjvOmIg4zwlgw=;
 b=78r+QvfiiQHi317bGaK1Vp3B2bi2od5HUfeBqAj9XVv3eh8gwkCyaKS+hC7krNXwwLSK/Ustd
 uBpdiT/GZqBDZ8rCiOrpauIwtCS2Vf4qswB9VZB1iXJHovt55TZVPwy
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_084357_342335_D2463757 
X-CRM114-Status: GOOD (  17.11  )
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

arm_smmu_write_context_bank() assumes it is being called with RPM
active, but it turns out that is not guaranteed in the path from
qcom_adreno_smmu_set_ttbr0_cfg(), so it's possible for the register
writes to get lost when configuring the context bank while the GPU is
idle, leading to page faults later.
Add the RPM calls here to make sure the SMMU is active before we touch
it.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
---
Changes in v3:
- Changed commit message to be more self-contained as suggested.
- Collected RBs
- Link to v2: https://lore.kernel.org/r/20260325-qcom_smmu_pmfix-v2-1-ba769a6ad0be@gmail.com

Changes in v2:
- Simplify patch by acquiring device just around the call that needs it
- Link to v1: https://lore.kernel.org/r/20260210-qcom_smmu_pmfix-v1-1-78b7143ac053@gmail.com

To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 573085349df3..cab7d110aaf5 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -231,6 +231,7 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const void *cookie,
 	struct io_pgtable *pgtable = io_pgtable_ops_to_pgtable(smmu_domain->pgtbl_ops);
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
 	struct arm_smmu_cb *cb = &smmu_domain->smmu->cbs[cfg->cbndx];
+	int ret;
 
 	/* The domain must have split pagetables already enabled */
 	if (cb->tcr[0] & ARM_SMMU_TCR_EPD1)
@@ -260,8 +261,16 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const void *cookie,
 		cb->ttbr[0] |= FIELD_PREP(ARM_SMMU_TTBRn_ASID, cb->cfg->asid);
 	}
 
+	ret = pm_runtime_resume_and_get(smmu_domain->smmu->dev);
+	if (ret < 0) {
+		dev_err(smmu_domain->smmu->dev, "failed to get runtime PM: %d\n", ret);
+		return -ENODEV;
+	}
+
 	arm_smmu_write_context_bank(smmu_domain->smmu, cb->cfg->cbndx);
 
+	pm_runtime_put_autosuspend(smmu_domain->smmu->dev);
+
 	return 0;
 }
 

---
base-commit: 50c4a49f7292b33b454ea1a16c4f77d6965405dc
change-id: 20260210-qcom_smmu_pmfix-2aead2ba4e20

Best regards,
--  
Anna Maniscalco <anna.maniscalco2000@gmail.com>


