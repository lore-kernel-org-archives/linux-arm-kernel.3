Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3408CD41C33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 13:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fCP4+P1Uat64E8FLxH7dgYB4wgA5K2BDbEnRT5pBDjU=; b=V6L9P5OgruQVcY/TizEy2Hu0Tm
	iFoswkHT7IDs8hne5jolD07oqiKaMx97C99T4FHRMv7GsNANRw3sewyiB9kyIzhIW68y3L+eR6Cxe
	YSeA2eOg8x1pvR4Ku0KTAl08eQJ6u3rluzVsykugf/1o/3DgJ5jVm82RxfmOdnDX/oid0YeaI56fu
	iq5zaGeK+ZdQec9bJKR81IUFrn08d10yyohAdge+pazdKmM3u8shmSF5+0DSK+DbXQH79MH6RnfL9
	Ss8M4BIWGE1EqER8b3vMfXZkidV9YgO9hfK3Ang6o9Dg58CNZ9AyitCgOYH3RPbN6+G8gQVba0QuX
	WoWm/lug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTgZG-0000000GdAX-0MW1;
	Thu, 11 Dec 2025 13:18:50 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTgZE-0000000Gd9c-22Gt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 13:18:49 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-47799717212so669585e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 05:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765459126; x=1766063926; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fCP4+P1Uat64E8FLxH7dgYB4wgA5K2BDbEnRT5pBDjU=;
        b=4uWV/E3oydI6JlMiEMmR60xW7phNDMf0PjuissNAwY9DIPCZuMBdg/OgWjNjdjQD7P
         5j/xy6OnL5PuWGPkYXl3EqxKpZGktV8tyVkT4wU/HfzoA3cY+Jqm8fSzGi2RittDOASY
         5g1EF8mXl64c5+hHbygonMTEQCRUq0c82ZMVgf2EjVPgh0LYCqFTALRpt6FbFVltwJUv
         ifDEV5z7WGg5e+7syXaOVJxjxhShE9mtRDX2MF7yJiKBTmZlB49l4iEH7Hd8lEB0fz1Y
         WgWgRWNQHYgTqkxBkkUD3CXadUSSSuTEWH3LvRx+PF01FoUdeLXOElnRomBQEZG0x1ez
         kPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765459126; x=1766063926;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fCP4+P1Uat64E8FLxH7dgYB4wgA5K2BDbEnRT5pBDjU=;
        b=Xu+l0Ltp6pUnTGSOO0fRELBeshNocKQ3g3jbLUsqqRjJr0opktPYRUCjZYo2aUBhBk
         8IHaTfx6xoBOuPfZSu9d+uh4Gc+tpn5veK1KoEYjtAN8Po7mmBI8NPHeelMGJj5142Dd
         Qkucgzk1OjiG/9CRaIPclhQjvR5coqUDnF1o0sO12J+UmPUXIGHH1jeUP5o/o8wqojh+
         kb1xMABIb7A5G0vKquKrC7lUK+0n1qhpsN1yF0wX07XkBsm5ZDTxjpsEtzjw0gn4fclo
         Buau2o1iwQIbPN5gaL0sLvUG4Cj72gHa/+jntvJfxk1Qk4QZqFi3AQRznfih46ytYWFg
         f7fw==
X-Forwarded-Encrypted: i=1; AJvYcCXi3x+M6QC0kZFweHOAd2kFBNBQ0yNfmYtLwkt5/0Z2/9jJogw1nACYlYW/S7cckCtRD4mPD80o6SaigWExsom2@lists.infradead.org
X-Gm-Message-State: AOJu0YyM4ifJlMu0dp9Ulbj/4Qs5IpJ3wCBCEaJjsZ2BnHPYLVaFwzg+
	vPtEYWfpaokOLxHlHYr9IZVnK1H5tR2OsFeL9A4m8aol2oeobHWfeYveHQv/9ZBjdAvHPIM+Pfn
	GRXp0jbMpUndHJg==
X-Google-Smtp-Source: AGHT+IHxQzCKoPeh6QNrsoFvProfgVB+npSZJAPrg1Gr3F0q1Y23acQghLVWzGrQIXSd6SL6PIvTg2IKVEi2Kg==
X-Received: from wmgp17.prod.google.com ([2002:a05:600c:2051:b0:477:9b36:954d])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1389:b0:471:1765:839c with SMTP id 5b1f17b1804b1-47a8383c89amr54081315e9.20.1765459126513;
 Thu, 11 Dec 2025 05:18:46 -0800 (PST)
Date: Thu, 11 Dec 2025 13:18:35 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251211131835.3267022-1-smostafa@google.com>
Subject: [PATCH] iommu/arm-smmu-v3: Remove IAS
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: robin.murphy@arm.com, will@kernel.org, joro@8bytes.org, 
	Mostafa Saleh <smostafa@google.com>, Tomasz Nowicki <tnowicki@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_051848_539409_A8D61618 
X-CRM114-Status: GOOD (  13.84  )
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

The driver only supports AArch64 page tables where OAS == IAS.

Remove the extra IAS tracking for AArch32 as this feature was
never implemented and that was creating BAD_STEs for SMMUv3
with stage-2 and OAS < 40.

Further discussion on this in:
https://lore.kernel.org/linux-iommu/20251130194506.593700-1-smostafa@google.com/

Reported-by: Tomasz Nowicki <tnowicki@google.com>
Fixes: f0c453dbcce7 ("iommu/arm-smmu: Ensure IAS is set correctly for AArch32-capable SMMUs")
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 18 +++++-------------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  2 --
 2 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index d16d35c78c06..019211db621d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2551,7 +2551,7 @@ static int arm_smmu_domain_finalise(struct arm_smmu_domain *smmu_domain,
 				     ARM_SMMU_FEAT_VAX) ? 52 : 48;
 
 		pgtbl_cfg.ias = min_t(unsigned long, ias, VA_BITS);
-		pgtbl_cfg.oas = smmu->ias;
+		pgtbl_cfg.oas = smmu->oas;
 		if (enable_dirty)
 			pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_ARM_HD;
 		fmt = ARM_64_LPAE_S1;
@@ -2561,7 +2561,7 @@ static int arm_smmu_domain_finalise(struct arm_smmu_domain *smmu_domain,
 	case ARM_SMMU_DOMAIN_S2:
 		if (enable_dirty)
 			return -EOPNOTSUPP;
-		pgtbl_cfg.ias = smmu->ias;
+		pgtbl_cfg.ias = smmu->oas;
 		pgtbl_cfg.oas = smmu->oas;
 		fmt = ARM_64_LPAE_S2;
 		finalise_stage_fn = arm_smmu_domain_finalise_s2;
@@ -4395,13 +4395,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	}
 
 	/* We only support the AArch64 table format at present */
-	switch (FIELD_GET(IDR0_TTF, reg)) {
-	case IDR0_TTF_AARCH32_64:
-		smmu->ias = 40;
-		fallthrough;
-	case IDR0_TTF_AARCH64:
-		break;
-	default:
+	if (!(FIELD_GET(IDR0_TTF, reg) & IDR0_TTF_AARCH64)) {
 		dev_err(smmu->dev, "AArch64 table format not supported!\n");
 		return -ENXIO;
 	}
@@ -4514,8 +4508,6 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 		dev_warn(smmu->dev,
 			 "failed to set DMA mask for table walker\n");
 
-	smmu->ias = max(smmu->ias, smmu->oas);
-
 	if ((smmu->features & ARM_SMMU_FEAT_TRANS_S1) &&
 	    (smmu->features & ARM_SMMU_FEAT_TRANS_S2))
 		smmu->features |= ARM_SMMU_FEAT_NESTING;
@@ -4525,8 +4517,8 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	if (arm_smmu_sva_supported(smmu))
 		smmu->features |= ARM_SMMU_FEAT_SVA;
 
-	dev_info(smmu->dev, "ias %lu-bit, oas %lu-bit (features 0x%08x)\n",
-		 smmu->ias, smmu->oas, smmu->features);
+	dev_info(smmu->dev, "oas %lu-bit (features 0x%08x)\n",
+		 smmu->oas, smmu->features);
 	return 0;
 }
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index ae23aacc3840..0a5bb57dbdfe 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -43,7 +43,6 @@ struct arm_vsmmu;
 #define IDR0_COHACC			(1 << 4)
 #define IDR0_TTF			GENMASK(3, 2)
 #define IDR0_TTF_AARCH64		2
-#define IDR0_TTF_AARCH32_64		3
 #define IDR0_S1P			(1 << 1)
 #define IDR0_S2P			(1 << 0)
 
@@ -784,7 +783,6 @@ struct arm_smmu_device {
 	int				gerr_irq;
 	int				combined_irq;
 
-	unsigned long			ias; /* IPA */
 	unsigned long			oas; /* PA */
 	unsigned long			pgsize_bitmap;
 
-- 
2.52.0.223.gf5cc29aaa4-goog


