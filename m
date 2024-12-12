Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F8EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0p39a77mImTT2bcTUkjv5rHSXECPntFQZjkOUsIrRs=; b=tEBk+D0SUamtmYCZG4V40/Vri5
	EHAjDu+yTk+tpb01nkfY6mVbVDaMp6Efb6+C/Fl6SVLx9+WreLIrIB3bvuF+hPSfcbi9n5J7Y8Au4
	zvONXCVybFDKHlR3Tm2tuJpNQDyUKhAwMu0u9tAlbViSAADug+n9aBcTvsI+hwNM3tq3okSsbNnGK
	O6l/pX71gZoCaOC7kxF6flfGo3LF/scivnKLnUik0YSyuOxsvbNfMhXtLS3FHNA76woGiWFvZPVdU
	RhjMxK3G+oKtjSuos7biEA1y7Sq4Qw1drVUCXruwsQqvFuH+dr1HDMaWmrXcGkzd/yZIP0twqQ++B
	slEyINkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLo74-00000001T3l-48h9;
	Thu, 12 Dec 2024 18:40:38 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnZP-00000001JtG-3vZz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:05:53 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-434fe2b605eso5726055e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026750; x=1734631550; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=i0p39a77mImTT2bcTUkjv5rHSXECPntFQZjkOUsIrRs=;
        b=yB9cz8r5yk1j0W7zvW50hEv1cclM9sU32NuKpg7TXqOoLZ/sTjkOcMZWItoU/mfReD
         bt78FQoQxMfHtiX8oNluxWOE+QAX4U5m5/26vrLfqkMH158UdOsNwZ/a1w0HbFmK2VXH
         +SjiVjUAbfSVwqAinBSwuUHv1dyxplFyS9entdO3SGbXsKucdpmQw5+pLcb1DWes+PFw
         j64cLbkN0mF2jGVJKiGTwtqiEvil7acPX3xIolBRDKxItxlC4p6xoBe+Zu4FrlhFuE5z
         fUhpb9UMDR1aNEe3TBp+j94vmAZaN1os4eIjJFN6HyLCFl60IAUoYTijXi4v8d3ttiiP
         t4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026750; x=1734631550;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i0p39a77mImTT2bcTUkjv5rHSXECPntFQZjkOUsIrRs=;
        b=oVtb1hHB41UvviIIO2wAveZeNhkHK9S98LE4Q08eV67hDzcMc9kF9ZIoKs/AtFG/8C
         62FS0wT9mf+goel1sp/xMeqjrzSlD9I+XMtYlAI69jszg5hk7uoksJOc0vNKZ2fggQzo
         YwXypYo+3A3NLEE1lzhgvdIBXEvSh86dGXUwzDPpla2d91dFOlBbtM09VPYNS4hzufmd
         ELE25ye6l7Jbu7JsGLT1ZKluTBoqF2Zy48TrZAA8zrpSTH/e8yWYXQ48XlpPHFU6I99X
         Eiv68lkRQeBJnxZs1FEaTApIQ8N3ZuRVmXMNe1+35O+HQX5rWX5Kg3mBoDF9qRimvcam
         5f2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV0uPPbJ/y4cqGF6T7o0JMQvn825zw6JPCM+r/lAEY3RR33QIVPIT0JOxEYjTnHxPmzcV8DG9guf+xWJAlofKa5@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg4V14gQmRPnjn6KPsgCawC26Qmh3JprsxCc+JBDucklXBg+T0
	GeCEJoGfw1+DP7aIsGMQp+VWJEpbIOQSF4iksj+Gbj6LwbrgQm5dbgaFNxsyRIljGMUVGFEB6kF
	L43yic+3E7w==
X-Google-Smtp-Source: AGHT+IG1KFj+8kiPF7R9tNS1w0lYL0LFPzKnh4cL4W+DNw5iDRjcSi9WleF5S9ilyTwoZ5oQcyfDOI5ctOSx2A==
X-Received: from wmkz18.prod.google.com ([2002:a7b:c7d2:0:b0:434:a15f:e7ea])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a011:b0:434:f623:9fe3 with SMTP id 5b1f17b1804b1-4361c3755bamr72354245e9.16.1734026750412;
 Thu, 12 Dec 2024 10:05:50 -0800 (PST)
Date: Thu, 12 Dec 2024 18:03:56 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-33-smostafa@google.com>
Subject: [RFC PATCH v2 32/58] KVM: arm64: smmu-v3: Add {alloc/free}_domain
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
X-CRM114-CacheID: sfid-20241212_100551_998598_A0A20EB2 
X-CRM114-Status: GOOD (  15.75  )
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

Add SMMUv3 alloc/free domain, as this operations are not
tied to the IOMMU, we can't do much with the io-pgtable
allocation or configuration.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c | 64 +++++++++++++++++++++
 include/kvm/arm_smmu_v3.h                   |  6 ++
 2 files changed, 70 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c b/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
index 58662c2c4c97..3181933e9a34 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
@@ -7,6 +7,8 @@
 #include <asm/arm-smmu-v3-common.h>
 #include <asm/kvm_hyp.h>
 #include <kvm/arm_smmu_v3.h>
+#include <linux/io-pgtable-arm.h>
+#include <nvhe/alloc.h>
 #include <nvhe/iommu.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/mm.h>
@@ -50,6 +52,22 @@ struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
 	smmu_wait(_cond);					\
 })
 
+/*
+ * SMMUv3 domain:
+ * @domain: Pointer to the IOMMU domain.
+ * @smmu: SMMU instance for this domain.
+ * @type: Type of domain (S1, S2)
+ * @pgt_lock: Lock for page table
+ * @pgtable: io_pgtable instance for this domain
+ */
+struct hyp_arm_smmu_v3_domain {
+	struct kvm_hyp_iommu_domain     *domain;
+	struct hyp_arm_smmu_v3_device	*smmu;
+	u32				type;
+	hyp_spinlock_t			pgt_lock;
+	struct io_pgtable		*pgtable;
+};
+
 static int smmu_write_cr0(struct hyp_arm_smmu_v3_device *smmu, u32 val)
 {
 	writel_relaxed(val, smmu->base + ARM_SMMU_CR0);
@@ -541,7 +559,53 @@ static int smmu_init(void)
 	return ret;
 }
 
+static struct kvm_hyp_iommu *smmu_id_to_iommu(pkvm_handle_t smmu_id)
+{
+	if (smmu_id >= kvm_hyp_arm_smmu_v3_count)
+		return NULL;
+	smmu_id = array_index_nospec(smmu_id, kvm_hyp_arm_smmu_v3_count);
+
+	return &kvm_hyp_arm_smmu_v3_smmus[smmu_id].iommu;
+}
+
+static int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, int type)
+{
+	struct hyp_arm_smmu_v3_domain *smmu_domain;
+
+	if (type >= KVM_ARM_SMMU_DOMAIN_MAX)
+		return -EINVAL;
+
+	smmu_domain = hyp_alloc(sizeof(*smmu_domain));
+	if (!smmu_domain)
+		return -ENOMEM;
+
+	/*
+	 * Can't do much without knowing the SMMUv3.
+	 * Page table will be allocated at attach_dev, but can be
+	 * freed from free domain.
+	 */
+	smmu_domain->domain = domain;
+	smmu_domain->type = type;
+	hyp_spin_lock_init(&smmu_domain->pgt_lock);
+	domain->priv = (void *)smmu_domain;
+
+	return 0;
+}
+
+static void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
+{
+	struct hyp_arm_smmu_v3_domain *smmu_domain = domain->priv;
+
+	if (smmu_domain->pgtable)
+		kvm_arm_io_pgtable_free(smmu_domain->pgtable);
+
+	hyp_free(smmu_domain);
+}
+
 /* Shared with the kernel driver in EL1 */
 struct kvm_iommu_ops smmu_ops = {
 	.init				= smmu_init,
+	.get_iommu_by_id		= smmu_id_to_iommu,
+	.alloc_domain			= smmu_alloc_domain,
+	.free_domain			= smmu_free_domain,
 };
diff --git a/include/kvm/arm_smmu_v3.h b/include/kvm/arm_smmu_v3.h
index 352c1b2dc72a..ded98cbaebc1 100644
--- a/include/kvm/arm_smmu_v3.h
+++ b/include/kvm/arm_smmu_v3.h
@@ -33,4 +33,10 @@ extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
 extern struct hyp_arm_smmu_v3_device *kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_smmus);
 #define kvm_hyp_arm_smmu_v3_smmus kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_smmus)
 
+enum kvm_arm_smmu_domain_type {
+	KVM_ARM_SMMU_DOMAIN_S1,
+	KVM_ARM_SMMU_DOMAIN_S2,
+	KVM_ARM_SMMU_DOMAIN_MAX,
+};
+
 #endif /* __KVM_ARM_SMMU_V3_H */
-- 
2.47.0.338.g60cca15819-goog


