Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53832C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvoQA8X3jDn0rRsmVdAwT+tCU9aeM3PwPyd0xfJ5Z9Q=; b=WPZWZWqn1wtbbOgnPp32BYMaxM
	/zjfG5HJg0+5AX8YN/pzL90SjbEw3KiryDCR907LNlxTS0LzhY7Vx78r6VkJbm9hfQzKnJvroHRKV
	XTpRBSgH41zfp7rdUqO/QAVX+VFKQBoQLUusskgxaHnbXyhogasqtF8vmVAfr1x6GTb1LLDbmxJrR
	GpxMxEuqKE9RE4+t6cwSFBL6UvIJDyrUB88LK5h/wtecJZ4y6vT1lGt9d5BMJWNJsZmYBPi3mnKgU
	PKOvKDXcQiZxtcSSWIITvweTL7bc/qCOueDmElsS23RNlARCuowH566A+2ntHp63tS8wHegGA5uuH
	R2UyYhcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Je-00000005San-2opF;
	Tue, 22 Sep 2026 13:13:46 +0000
Received: from mail-ej1-x645.google.com ([2a00:1450:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90JD-00000005SF9-44m4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:13:21 +0000
Received: by mail-ej1-x645.google.com with SMTP id a640c23a62f3a-c2967165d94so255366766b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082797; x=1790687597; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tvoQA8X3jDn0rRsmVdAwT+tCU9aeM3PwPyd0xfJ5Z9Q=;
        b=kOmaOIFF+0az6vunCjEQ1cskqneZuw6Jz5pCdgYFPpzAtAuRye85f1NkiCoi9uowgu
         VptdZ6GnJ8pgLByjTGm+b39CPUsR/ZIhJa7gpqHr60c7ZmDBnFr2ZTbtySUDnzZwmDRf
         v3c2IFSX4WmqnoA+ixeQpHRShN4J92tIO8rq56kjkJbz35y8+sJeew0X2Me8OtsJm5/3
         27WG7SjFfJodCR1RiKSPL2rVTjdn2rBDFRwGjoTro3EIwcZJ1S/muCflz4orch/xqRex
         PnL8nj4AiWn+9EuQhHNgutpD8BfZyv9oWfgYUYL2k8bQyZo75AY4DraPfVpz+TUUVoxs
         Xxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082797; x=1790687597;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tvoQA8X3jDn0rRsmVdAwT+tCU9aeM3PwPyd0xfJ5Z9Q=;
        b=J9eElNNmkCpB17kpRU7blWNufr3bY5nhLm/aaaZaiZyVJBCde83ScJ5ZPfMiW4V5EA
         iaa7i2zRiPOhGUegsnq+AeRePVkFroqcKhW7tTooFqQqIxe1XMvznqA79+CZUfipJ1XE
         VRCvTCFxKvfaajU6ekxIer+6lA/h3vwAAiPUWVdsZTNb3/hM7l7awwbbUx4ed1m46Uxu
         WwBroPJ9/Dnjve4tXX2IMzSyEgODtRNkB0JUB7rZT62u0BssrYC8nBMneW8B0hxjrrOi
         Av/4JeUXIyEfFLIii33NLk9+vFRTeSjLSNKBEOjd4myGF1AtAThq4aJ4R65M95X8r/hE
         xg1A==
X-Gm-Message-State: AFuF++kutFhmMABXUPERC9v0W4/zLbGyG3o7itU/eaiuEmVsB+cBtrZi
	HMrEfs6eL7kcKknuHY0WyKlry/bpIbDrYazEHTNlsvB42r+PPYAy4X0ZEniPn1pwtHj1020wmwz
	secsug/F2d/qVCBCEpyi1c+9HC2y6dJ44PyDRnu+FEXg93iopWI25VvAiLMK7a5aUme4VVdRBbg
	WvVitE9RWbRjDwhKQzygJom3K6xiyF5kCIe9gX1VZad2M+sKe5me7sH7EqVk/tvMAB3g==
X-Received: from ejra17.prod.google.com ([2002:a17:906:4691:b0:c26:2953:6831])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9620:b0:c29:3821:ae6c with SMTP id a640c23a62f3a-c2a15b94662mr1235917766b.37.1790082796869;
 Tue, 22 Sep 2026 06:13:16 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:12:45 +0000
In-Reply-To: <20260922131259.2975334-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260922131259.2975334-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922131259.2975334-13-smostafa@google.com>
Subject: [PATCH v8 12/25] iommu/arm-smmu-v3-kvm: Probe SMMU HW
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_061320_470359_1B34494D 
X-CRM114-Status: GOOD (  16.05  )
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

Probe SMMU features from the IDR register space. Most of
the logic is common with the kernel.

The hypervisor enforces 2 extra requirements:
- Cache coherency.
- Nested translation support.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h    |  4 ++
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 47 +++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
index 17b9454dab85..91177f00fa97 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
@@ -11,6 +11,9 @@
  *
  * Other members are filled and used at runtime by the SMMU driver.
  * @base		Virtual address of SMMU registers
+ * @oas			PA size
+ * @pgsize_bitmap	Supported page sizes
+ * @sid_bits		Max number of SID bits supported
  */
 struct hyp_arm_smmu_v3_device {
 	phys_addr_t		mmio_addr;
@@ -20,6 +23,7 @@ struct hyp_arm_smmu_v3_device {
 	u32			options;
 	unsigned long		oas;
 	unsigned long		pgsize_bitmap;
+	unsigned int		sid_bits;
 };
 
 extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index 7022d38e75c4..f8b7c5406017 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -29,6 +29,47 @@ static void smmu_deinit_device(struct hyp_arm_smmu_v3_device *smmu)
 	smmu->base = NULL;
 }
 
+/*
+ * Mini-probe and validation for the hypervisor.
+ */
+static int smmu_probe(struct hyp_arm_smmu_v3_device *smmu)
+{
+	u32 reg;
+
+	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
+		return -EINVAL;
+
+	reg = arm_smmu_idr0_probe(smmu);
+
+	if (!(FIELD_GET(IDR0_TTF, reg) & IDR0_TTF_AARCH64))
+		return -ENXIO;
+
+	if (!(smmu->features & (ARM_SMMU_FEAT_TT_LE | ARM_SMMU_FEAT_TT_BE)))
+		return -ENXIO;
+
+	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR1);
+	if (reg & (IDR1_TABLES_PRESET | IDR1_QUEUES_PRESET | IDR1_REL))
+		return -EINVAL;
+
+	smmu->sid_bits = FIELD_GET(IDR1_SIDSIZE, reg);
+	/* Follows the kernel logic */
+	if (smmu->sid_bits <= STRTAB_SPLIT)
+		smmu->features &= ~ARM_SMMU_FEAT_2_LVL_STRTAB;
+
+	arm_smmu_idr3_probe(smmu);
+
+	arm_smmu_idr5_probe(smmu);
+	if (!smmu->oas)
+		smmu->oas = 48;
+
+	arm_smmu_device_iidr_probe(smmu);
+
+	if (!(smmu->features & ARM_SMMU_FEAT_NESTING))
+		return -ENXIO;
+
+	return 0;
+}
+
 static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 {
 	unsigned long haddr;
@@ -43,8 +84,14 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 		return ret;
 
 	smmu->base = (void __iomem *)haddr;
+	ret = smmu_probe(smmu);
+	if (ret)
+		goto out_ret;
 
 	return 0;
+out_ret:
+	smmu_deinit_device(smmu);
+	return ret;
 }
 
 /* Called while is the host is still trusted. */
-- 
2.55.0.1082.g2b9226bbc0-goog


