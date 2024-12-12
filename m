Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29AEE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ybNvGVgl/hoCzKNXbffTwzQBiR9JZU3Un5nM2P0DGi4=; b=I4wzYEmCM2tUUYWJr6xDH8eCES
	0uly25J2phgmmRcguCqU30tT97T61LLiR/WiidflzJy1anqzDpkcp5CJ6guXVNWvMaCv1eFHouwZE
	Wz0KbhAKxJ+1EWsCDGp1nkxGxC6AQ8VRklerFPjL32l1ppIUyRMq0w5r3xzN3hY23HWPmqnHMh78i
	Q3JomHGd1biK+pL2fxDyQkD+526Fd6Ifzmx0Fr+lUc2LPa4IGVIJa6wc222SRSt+4Og+09DKEp5XX
	qau+KX+6G/syxYgL/NSatZkmWnBTNMjCqZOOJO8phs9pxlWV30P15BGSysDDbgKYO36GlwCb88luZ
	79LIFr/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLo0o-00000001RNS-0PrS;
	Thu, 12 Dec 2024 18:34:10 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnZD-00000001Jos-1dno
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:05:40 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3862b364578so1090298f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026738; x=1734631538; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ybNvGVgl/hoCzKNXbffTwzQBiR9JZU3Un5nM2P0DGi4=;
        b=ru+WOsC3gNjdAQ8mKNTiIB9OpV+qVRjDrSUid4KNkyyiBNNIdbDHUDp+0WBPfpkYPT
         nMInR6DyJ/U7qXbA/uRmBJgje+N9a7LGIisU9T8Q1LWzolS8AneQ51YDx9WZMBmiNuXF
         n+FuHH+nh2Xj79Y3dUgJIUQz9902pm1ATmAABoKfXHg4O2aO7z2p/h/69RP6y3CfEi+c
         mnemHD2+rTjShQct8IbAEbX3xD9Nb4abgWaB7xy0sMP75637P7nnsE3H5c7RVRW/Fvb/
         eSNVNqVrjfPvcyYWjXXskEE20Hq6UqV1tQrG8NSdQMU2pmXHwgHQtK+tSHlN1uZi5MEc
         qtTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026738; x=1734631538;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ybNvGVgl/hoCzKNXbffTwzQBiR9JZU3Un5nM2P0DGi4=;
        b=S3OjZqcoqkmvW6b5VISsfiUPPG6icyrqBXe3+6wwsBt7MGne4+fv92HCBB9ZJEWkTd
         /txf5rbTKplLonO1XX2jMfq3SE0NFarhpxMvyBk32rOUKjG36RPduYaw/uIAhlQ1NmQa
         OKfVgvMV9r0wpKQatcRMAA5TfiTzZoLcMNh7Ag9MEWqu6qOEKcm9B6N429XTVeHZMeyG
         mOJ5PGLVkS6IvLhdUbIfyJuobXgGTcCmoWMtYE0B9frTx16MP8yHm+hvP/b2KFpfclmX
         FmKKECpoiIUfLPtpJDJFUVp+zF0FhIASRxUdIf3whuO4S7Fy82mIglWuIDZ+s/F9/Cn4
         KaBA==
X-Forwarded-Encrypted: i=1; AJvYcCW9VZDPsVEletJQ3NMjbyM8+XvVpYLXTaiYlhaQ0GVHJMgyB62Z1YdpCU97WdYR3cxNk2gXzlx3gDFBQD817Ski@lists.infradead.org
X-Gm-Message-State: AOJu0YwsV//MCGMeIbllSmxn1dlgGXXEeqkunYJBGIQeZl3puDBtsgnC
	+XS6GJoEU1nXElNo6OGZ+X9FJ5ITCOt7AnAse7CWp1fDHJ9Q09wXsLYWKZuCp4A66RVZgm9FbLX
	HhiSlaHPgZA==
X-Google-Smtp-Source: AGHT+IE0b7txsRIOyvGxW20/4w0Q8YO5iAlMJIT7VhEN6QmR2/Vq39IVy03R+zOk9tpZ9g+gCkzVceXKRYZllw==
X-Received: from wmbg5.prod.google.com ([2002:a05:600c:a405:b0:434:fddf:5c1a])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:18a2:b0:385:faf5:ebc8 with SMTP id ffacd0b85a97d-38788847313mr3909644f8f.21.1734026737836;
 Thu, 12 Dec 2024 10:05:37 -0800 (PST)
Date: Thu, 12 Dec 2024 18:03:50 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-27-smostafa@google.com>
Subject: [RFC PATCH v2 26/58] KVM: arm64: smmu-v3: Initialize registers
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org, 
	robin.murphy@arm.com, jean-philippe@linaro.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, vdonnefort@google.com, qperret@google.com, 
	tabba@google.com, danielmentz@google.com, tzukui@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_100539_430088_F8DA6FDF 
X-CRM114-Status: GOOD (  19.46  )
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Ensure all writable registers are properly initialized. We do not touch
registers that will not be read by the SMMU due to disabled features.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c | 130 +++++++++++++++++++-
 include/kvm/arm_smmu_v3.h                   |  11 ++
 2 files changed, 140 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c b/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
index d2a570c9f3ec..f7e60c188cb0 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
@@ -4,16 +4,144 @@
  *
  * Copyright (C) 2022 Linaro Ltd.
  */
+#include <asm/arm-smmu-v3-common.h>
 #include <asm/kvm_hyp.h>
 #include <kvm/arm_smmu_v3.h>
 #include <nvhe/iommu.h>
+#include <nvhe/mem_protect.h>
+#include <nvhe/mm.h>
+#include <nvhe/pkvm.h>
+
+#define ARM_SMMU_POLL_TIMEOUT_US	100000 /* 100ms arbitrary timeout */
 
 size_t __ro_after_init kvm_hyp_arm_smmu_v3_count;
 struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
 
+#define for_each_smmu(smmu) \
+	for ((smmu) = kvm_hyp_arm_smmu_v3_smmus; \
+	     (smmu) != &kvm_hyp_arm_smmu_v3_smmus[kvm_hyp_arm_smmu_v3_count]; \
+	     (smmu)++)
+
+/*
+ * Wait until @cond is true.
+ * Return 0 on success, or -ETIMEDOUT
+ */
+#define smmu_wait(_cond)					\
+({								\
+	int __i = 0;						\
+	int __ret = 0;						\
+								\
+	while (!(_cond)) {					\
+		if (++__i > ARM_SMMU_POLL_TIMEOUT_US) {		\
+			__ret = -ETIMEDOUT;			\
+			break;					\
+		}						\
+		pkvm_udelay(1);					\
+	}							\
+	__ret;							\
+})
+
+static int smmu_write_cr0(struct hyp_arm_smmu_v3_device *smmu, u32 val)
+{
+	writel_relaxed(val, smmu->base + ARM_SMMU_CR0);
+	return smmu_wait(readl_relaxed(smmu->base + ARM_SMMU_CR0ACK) == val);
+}
+
+/* Transfer ownership of structures from host to hyp */
+static int smmu_take_pages(u64 phys, size_t size)
+{
+	WARN_ON(!PAGE_ALIGNED(phys) || !PAGE_ALIGNED(size));
+	return __pkvm_host_donate_hyp(phys >> PAGE_SHIFT, size >> PAGE_SHIFT);
+}
+
+static void smmu_reclaim_pages(u64 phys, size_t size)
+{
+	WARN_ON(!PAGE_ALIGNED(phys) || !PAGE_ALIGNED(size));
+	WARN_ON(__pkvm_hyp_donate_host(phys >> PAGE_SHIFT, size >> PAGE_SHIFT));
+}
+
+static int smmu_init_registers(struct hyp_arm_smmu_v3_device *smmu)
+{
+	u64 val, old;
+	int ret;
+
+	if (!(readl_relaxed(smmu->base + ARM_SMMU_GBPA) & GBPA_ABORT))
+		return -EINVAL;
+
+	/* Initialize all RW registers that will be read by the SMMU */
+	ret = smmu_write_cr0(smmu, 0);
+	if (ret)
+		return ret;
+
+	val = FIELD_PREP(CR1_TABLE_SH, ARM_SMMU_SH_ISH) |
+	      FIELD_PREP(CR1_TABLE_OC, CR1_CACHE_WB) |
+	      FIELD_PREP(CR1_TABLE_IC, CR1_CACHE_WB) |
+	      FIELD_PREP(CR1_QUEUE_SH, ARM_SMMU_SH_ISH) |
+	      FIELD_PREP(CR1_QUEUE_OC, CR1_CACHE_WB) |
+	      FIELD_PREP(CR1_QUEUE_IC, CR1_CACHE_WB);
+	writel_relaxed(val, smmu->base + ARM_SMMU_CR1);
+	writel_relaxed(CR2_PTM, smmu->base + ARM_SMMU_CR2);
+	writel_relaxed(0, smmu->base + ARM_SMMU_IRQ_CTRL);
+
+	val = readl_relaxed(smmu->base + ARM_SMMU_GERROR);
+	old = readl_relaxed(smmu->base + ARM_SMMU_GERRORN);
+	/* Service Failure Mode is fatal */
+	if ((val ^ old) & GERROR_SFM_ERR)
+		return -EIO;
+	/* Clear pending errors */
+	writel_relaxed(val, smmu->base + ARM_SMMU_GERRORN);
+
+	return 0;
+}
+
+static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
+{
+	int ret;
+
+	if (!PAGE_ALIGNED(smmu->mmio_addr | smmu->mmio_size))
+		return -EINVAL;
+
+	ret = ___pkvm_host_donate_hyp(smmu->mmio_addr >> PAGE_SHIFT,
+				      smmu->mmio_size >> PAGE_SHIFT,
+				      /* accept_mmio */ true);
+	if (ret)
+		return ret;
+
+	smmu->base = hyp_phys_to_virt(smmu->mmio_addr);
+
+	ret = smmu_init_registers(smmu);
+	if (ret)
+		return ret;
+
+	return kvm_iommu_init_device(&smmu->iommu);
+}
+
 static int smmu_init(void)
 {
-	return -ENOSYS;
+	int ret;
+	struct hyp_arm_smmu_v3_device *smmu;
+	size_t smmu_arr_size = PAGE_ALIGN(sizeof(*kvm_hyp_arm_smmu_v3_smmus) *
+					  kvm_hyp_arm_smmu_v3_count);
+	phys_addr_t smmu_arr_phys;
+
+	kvm_hyp_arm_smmu_v3_smmus = kern_hyp_va(kvm_hyp_arm_smmu_v3_smmus);
+
+	smmu_arr_phys = hyp_virt_to_phys(kvm_hyp_arm_smmu_v3_smmus);
+
+	ret = smmu_take_pages(smmu_arr_phys, smmu_arr_size);
+	if (ret)
+		return ret;
+
+	for_each_smmu(smmu) {
+		ret = smmu_init_device(smmu);
+		if (ret)
+			goto out_reclaim_smmu;
+	}
+
+	return 0;
+out_reclaim_smmu:
+	smmu_reclaim_pages(smmu_arr_phys, smmu_arr_size);
+	return ret;
 }
 
 /* Shared with the kernel driver in EL1 */
diff --git a/include/kvm/arm_smmu_v3.h b/include/kvm/arm_smmu_v3.h
index 521028b3ff71..fb24bcef1624 100644
--- a/include/kvm/arm_smmu_v3.h
+++ b/include/kvm/arm_smmu_v3.h
@@ -5,8 +5,19 @@
 #include <asm/kvm_asm.h>
 #include <kvm/iommu.h>
 
+/*
+ * Parameters from the trusted host:
+ * @mmio_addr		base address of the SMMU registers
+ * @mmio_size		size of the registers resource
+ *
+ * Other members are filled and used at runtime by the SMMU driver.
+ */
 struct hyp_arm_smmu_v3_device {
 	struct kvm_hyp_iommu	iommu;
+	phys_addr_t		mmio_addr;
+	size_t			mmio_size;
+
+	void __iomem		*base;
 };
 
 extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
-- 
2.47.0.338.g60cca15819-goog


