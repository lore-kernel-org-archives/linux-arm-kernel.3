Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751E5C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+wIzMWf2cSB6EX/Jc8f2fGh3ASjjz6WosFQJCh8Jwc=; b=VZ5K5o4v29IWTSn8pwSVmDK73e
	IeIlwQK57XLvUN5rt+X+942wfMwHMCXNQk0rvi5sTyb04El+VtLBP8qk3Yk8G47YxF6mBtnTu+F95
	kwBEKpFJHE0Pvm6YMWmMv6afMlRQCPyMnndgQrq9LB+ujKx0UbxvJhZL9/16pgYVxJ5WB0AVUx8YH
	ZVYcozM3F+x7+u63ireKshBrjnZ6URLRLhrpoUxi8cNcjYpkw6mOQxnubSRqORw9hJkmkFeqp6xI8
	gSmElTeIMwokBFWzKoiyphkXMJfygnI2WGIgMU+XkMI00TYRnTXc0+/pl2vanXufF0c6i007UMAjF
	gt5bxP9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyHW-0000000EfoB-3Oih;
	Wed, 15 Jul 2026 12:00:06 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyGw-0000000Ef5h-2Pod
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:59:31 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-698b899b53cso1950479a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 04:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784116768; x=1784721568; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U+wIzMWf2cSB6EX/Jc8f2fGh3ASjjz6WosFQJCh8Jwc=;
        b=gK3fGUefGrgJfAYiWPr3v5yu2K03K8E7otYc4Z6yzndQziZuUYScNacjLsyqIlZaj+
         BwRLr2nYulXlUjCaeOpyh6UzP7TAlXiZ1jbxi+wrNdr2aUx/s1z1tWw/CBoriaj0ovIJ
         +u09jn/Eva+yau9WbXYMSkE/cXgBNX4RWocPSfThW7jLi0OY3uA+pe6Q48X6OEIcMNtr
         XtyYvulz3x7b+Axf97k8eyzRoha/GzIGo55YbxqOLmDjZzmN1yZAjhJaTJAOx7MpjdcR
         +GC0Rf76NhB8gzXhipI9tjpSSSYR+IK0ofa5etvyOwqE+CI80bs86Kq2tBvDSYRVrpiw
         nyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784116768; x=1784721568;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U+wIzMWf2cSB6EX/Jc8f2fGh3ASjjz6WosFQJCh8Jwc=;
        b=ihVJYnnTFjOZt2ths1rOsDqjHXZSz40dkBi9zEgovPvLRDQ5AzPJ6Kn9cedoj0NwyA
         UZFtzGQQXr6U4MLSWuSmTUaXFRVKacdXx5i/fPy0SoMrQAomQFTP3XIJzlWFbTsu+aMl
         LIY/5T80aNuSqt+4nCpbFgNxPR3ub36wLPPWpVlqXsOtXzui1q8kt9O5uqdFrszBZxu7
         90t/y9IHlG+Tn0fXsF9PwFBXvVjywajwLFDOBGorwoEAbauf0YkcuqfIokgn/86bkqtH
         5o8Dp34c/fLC9gPqA9liJIkhlwCDJTyMBxPCRy2S+fTKarYUnstq3Pqc3nDnVyzvKVyA
         NkQg==
X-Gm-Message-State: AOJu0Yylgl9iXlsEXrVo1aDQ3jpfDdFe1mp+147+SBwZGlpnJ/Rt6WXX
	sX5J7rS8gjU90dOBpvSjQ1S+a9jjpOquLxH+kWKrmZWmZ4z1tsKhi0dytMw9WmzYabe/tB6yLPi
	pcZPzu5ATpnV1TjT96w+PWWG/48RQ+773jnfMJmGp4UqFWvzHxRcZ/Elu3KMuqOMyd5aEn+OGDm
	evQhpgvDgbXesZa7buX2uZVyCZRRaAIvgN1/A3WwGzUmwW2Djh7iNaKf5jBn5WGny/JQ==
X-Received: from edou7.prod.google.com ([2002:aa7:d0c7:0:b0:69c:458d:1598])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1d4b:b0:69c:7754:f8b7 with SMTP id 4fb4d7f45d1cf-69c7754f940mr8902542a12.38.1784116767878;
 Wed, 15 Jul 2026 04:59:27 -0700 (PDT)
Date: Wed, 15 Jul 2026 11:58:53 +0000
In-Reply-To: <20260715115906.2664882-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260715115906.2664882-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
Message-ID: <20260715115906.2664882-13-smostafa@google.com>
Subject: [PATCH v7 12/24] iommu/arm-smmu-v3-kvm: Probe SMMU HW
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
X-CRM114-CacheID: sfid-20260715_045930_676227_1082C3A4 
X-CRM114-Status: GOOD (  16.99  )
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

Probe SMMU features from the IDR register space, most of
the logic is common with the kernel.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 54 +++++++++++++++++++
 .../iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h  |  6 +++
 2 files changed, 60 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index fee5db6c9c20..be5922d80184 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -10,6 +10,7 @@
 #include <nvhe/mem_protect.h>
 
 #include "arm_smmu_v3.h"
+#include "../arm-smmu-v3.h"
 
 size_t __ro_after_init kvm_hyp_arm_smmu_v3_count;
 struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
@@ -26,6 +27,53 @@ static void smmu_deinit_device(struct hyp_arm_smmu_v3_device *smmu)
 	smmu->base = NULL;
 }
 
+/*
+ * Mini-probe and validation for the hypervisor.
+ */
+static int smmu_probe(struct hyp_arm_smmu_v3_device *smmu)
+{
+	u32 reg;
+
+	/* Similar to the kernel, rely on firmware override. */
+	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
+		return -EINVAL;
+
+	/* IDR0 */
+	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR0);
+
+	smmu->features |= smmu_idr0_features(reg);
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
+	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR3);
+	smmu->features |= smmu_idr3_features(reg);
+
+	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR5);
+	smmu->pgsize_bitmap = smmu_idr5_to_pgsize(reg);
+
+	smmu->oas = smmu_idr5_to_oas(reg);
+	if (smmu->oas == 52)
+		smmu->pgsize_bitmap |= 1ULL << 42;
+	else if (!smmu->oas)
+		smmu->oas = 48;
+
+	reg = readl_relaxed(smmu->base + ARM_SMMU_IIDR);
+	smmu->features = smmu_iidr_features(reg, smmu->features);
+	if (!(smmu->features & ARM_SMMU_FEAT_NESTING))
+		return -ENXIO;
+
+	return 0;
+}
+
 static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 {
 	unsigned long haddr;
@@ -39,8 +87,14 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
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
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
index 744ee2b7f0b4..82b84673e85b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
@@ -12,12 +12,18 @@
  *
  * Other members are filled and used at runtime by the SMMU driver.
  * @base		Virtual address of SMMU registers
+ * @oas			PA size
+ * @pgsize_bitmap	Supported page sizes
+ * @sid_bits		Max number of SID bits supported
  */
 struct hyp_arm_smmu_v3_device {
 	phys_addr_t		mmio_addr;
 	size_t			mmio_size;
 	void __iomem		*base;
 	u32			features;
+	unsigned long		oas;
+	unsigned long		pgsize_bitmap;
+	unsigned int		sid_bits;
 };
 
 extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
-- 
2.55.0.141.g00534a21ce-goog


