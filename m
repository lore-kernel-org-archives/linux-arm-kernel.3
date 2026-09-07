Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2423FC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 15:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AQlaDcTakC6mCvyGWi5enhbjbBFVdjTH0o/87MLG6l8=; b=mZ0gogF7DzP6du0M1FnwlLRZUr
	3Bz6nE0N/qr+d+HvAbykBmf9bFrdePg/fUXzz50j61FEI2Vt+z5QQUvp/ixHdtfL8NxFuiGYZ41vB
	7cKAvz/cLqS5KoHQ/KBJ7k5qZLzsrpZJAjbXIKc05ChZCwOPx9fnc48uKa4E0O6q0FzkLehlaIj5U
	op0NzpomPU50qWUdGpE3JJT6nRgQ+9Z6v3AMO/u3YPJMIWhDz1x4TDKubESYJRTq4LupwW/LDLBob
	znby3qzrHYeLGKRKUxwSJphTzP1RyLQxr2BXALy7b23Mnkv1/IiV/uNKaeZY+MvZd1B79EgyDLkbq
	cDCk7Ykg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bbt-00000007ES0-1srL;
	Mon, 07 Sep 2026 15:50:17 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bbr-00000007ERS-14Ys
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 15:50:16 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-49b7c1dcc82so22180925e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 08:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788796212; x=1789401012; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AQlaDcTakC6mCvyGWi5enhbjbBFVdjTH0o/87MLG6l8=;
        b=Oh6KTuWi8/RXmuSOOJFezDN0vyItE0DlvLhvaXR5cm920W/FvNhdpCk4t0Et9wJQGM
         DhplJuptPXLZPLGLMgYgi9pYVWJzcqrvBIxUU/QagyU0My0sAhLVtD/ff6oOHL6RY2b0
         q87UJyDUWZzmfdYQRQv8J4f++dvP0mnZri73tet395RuZSrEda/7mGsaqtr5rC2UgmDm
         ICdGrPNa4xU9MF3qklyj4+3Ru6XATrOzm4+OnzDU+OPBbqe2aT4HNjDS6cgm06LmFA8J
         bAzwL1YGJ2OlMR/d/XE6+gL7C+blHDMkefs/U3YSJG5HwDtu0p3oLrT0WnJrlFplCQWg
         KYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788796212; x=1789401012;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AQlaDcTakC6mCvyGWi5enhbjbBFVdjTH0o/87MLG6l8=;
        b=De0GupTiHkchk/w4LtSjVZmjMOkr+68Olwo1iWKhy0hixXkNOYx8kn74C39brszhn9
         YT55qZybkTqn1E1VDdwF1TQx7n8elHutXikSUkNOFPFWRUukqN/jdWRUAE8ihcyYbVfy
         43XbxqYG2h8TA6RK3O+ER1DVpz+54IPB9NyXJObWII/YSVAudrSqkaLI3yUs3WVkdcZ1
         g+Grln+QO/b/bxswl4TehgvdimApM5rCQOU+pjyl7fR/2R54A4uzUILNIuB0zyFmYx3r
         /sKQD/z4pMVJjVVc+LioDYto/ESJ2eYU4w6iMltJX0PQRok7H5YAdG+RkC+wjijUwimy
         yASg==
X-Forwarded-Encrypted: i=1; AKwUvBwLtC7l3B9L9Vi1bqCdwNgv8JEL5r5vM5MYgCUyvWiVnxHHlNLCOvs1IHDN0K8nj+Tpn7DSxhEjDWSDEWkgScZV@lists.infradead.org
X-Gm-Message-State: AFuF++lJ3Z+FRu3272DJUo4/mSKXuHRHKECmPzO/z0dGha2EFvIxrWUm
	SnPyvkpY63wrOqMAnTsmXGTmNJ8LK+DsNTn4A1kmf0YO9DYSntEc6QkNT9apKBs613SS3OZHwl0
	zVw4L4LnsYqA6/g==
X-Received: from wmte7.prod.google.com ([2002:a05:600c:8b27:b0:49c:f186:4fa4])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f91:b0:49d:e0c:e560 with SMTP id 5b1f17b1804b1-49d0e0ce65emr77546445e9.4.1788796210294;
 Mon, 07 Sep 2026 08:50:10 -0700 (PDT)
Date: Mon,  7 Sep 2026 15:49:28 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260907154928.4012151-1-smostafa@google.com>
Subject: [PATCH] iommu/arm-smmu-v3-sva: Relax ASID requirements
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: jpb@kernel.org, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	jgg@ziepe.ca, nicolinc@nvidia.com, praan@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_085015_302915_C96D2F47 
X-CRM114-Status: GOOD (  13.26  )
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

arm_smmu_sva_supported() have some residual checks for ASID from the
original commit d744f9e6c222 ("iommu/arm-smmu-v3: Check for SVA features")

As DVM was used for TLB invalidation and the ASID of the domain was shared
with the CPU process.

However, the commit
d38c28dbefee ("iommu/arm-smmu-v3: Put the SVA mmu notifier in the smmu_domain")
removed that support.

So matching the SMMU ASID space to the CPU is unnecessary and can be
relaxed.

Remove the CPU ASID related code, and update the print for the SMMUv3.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
index 0a429c64fbf3..a071f9841839 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
@@ -199,7 +199,6 @@ bool arm_smmu_sva_supported(struct arm_smmu_device *smmu)
 {
 	unsigned long reg, fld;
 	unsigned long oas;
-	unsigned long asid_bits;
 	u32 feat_mask = ARM_SMMU_FEAT_COHERENCY;
 
 	if (vabits_actual == 52) {
@@ -232,20 +231,7 @@ bool arm_smmu_sva_supported(struct arm_smmu_device *smmu)
 	if (smmu->oas < oas)
 		return false;
 
-	/* We can support bigger ASIDs than the CPU, but not smaller */
-	fld = cpuid_feature_extract_unsigned_field(reg, ID_AA64MMFR0_EL1_ASIDBITS_SHIFT);
-	asid_bits = fld ? 16 : 8;
-	if (smmu->asid_bits < asid_bits)
-		return false;
-
-	/*
-	 * See max_pinned_asids in arch/arm64/mm/context.c. The following is
-	 * generally the maximum number of bindable processes.
-	 */
-	if (arm64_kernel_unmapped_at_el0())
-		asid_bits--;
-	dev_dbg(smmu->dev, "%d shared contexts\n", (1 << asid_bits) -
-		num_possible_cpus() - 2);
+	dev_dbg(smmu->dev, "Max SMMUv3 SVA contexts: %u\n", 1 << smmu->asid_bits);
 
 	return true;
 }
-- 
2.55.0.979.g7e5102b832-goog


