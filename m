Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA65CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 00:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=No5rZzETEpiSYrnAp/3rx5tnKsAcr1mN2J0hRF7T4gc=; b=YWs2Ax7YiRlb8l2pAQr4ZsfZ6o
	EGbt27Qy69mABT/Y8uWkw+ZLfrgIYXA4vsshhiiNdZvFZDv+zTh15h2/R0cq6z1TnW61Yr+vKeKDA
	O9D6guFe4b2EfozeLAQ2LeV9u40ucW4tdMyk6Tt8xHBL+yGuKiwr2oE7VFr35qsjYqStsv4I9NCYa
	yZuaJWHQGqwKvVUTkEY8cBAjtXB1BB0Qx3B3eZ4PAKrzVXwveECjZXY5AXspXv5E6FX0ihX8BGvdo
	YXrjcw7Y1ibsGFkExH8KtuYcXwKVsvkAwuhwaABffs9J9HuHjk56AM91aasuRFnzgeBnOzx57ysAm
	BVLteZmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoWTw-0000000BvmU-2bA8;
	Wed, 20 Aug 2025 00:15:12 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoUG2-0000000BfUF-2Gfr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 21:52:43 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3b9d41cec2cso4560882f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 14:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755640360; x=1756245160; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=No5rZzETEpiSYrnAp/3rx5tnKsAcr1mN2J0hRF7T4gc=;
        b=DzZVa+pDaBOPsaUNg/vk3i+kxhH8MMPtfQuH6HA44K3zvsDWCYELmAcIQP0f0D3s+a
         urx8iO1cTi+L5dC4gzCRtckvcL+oLOlafix10pP9lPiCduLUyumE4l+5CaJl976k2AF4
         fZTNy5ZeALD9VK9g8z3BGgTudLNgO0omeFqufpq/eadqOttgCr/UZWrTQHs2yJAaCIem
         0TqVnOnvxujlsTvkXPy+ivpJgzpxM3mO5O2N8QdcmzVN2EJCBGrfGyKpA8FL6QfQRG26
         h5FIP2KQcCrqTQ6LDBW5vvQeV0unUinr8zAJWDT6mB1fLA8qA8VDOFyEjWiB6FlSNT4v
         B+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755640360; x=1756245160;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=No5rZzETEpiSYrnAp/3rx5tnKsAcr1mN2J0hRF7T4gc=;
        b=hx4TJpGEzC2v11OkNDCN2C5FbgJrTifpLAz4ZGCdIYpymoGADBXqleh7Xh28Ce3BGF
         yB28mGF1vuzvF5QpDmnzjJlIi+ErQwrFIB5uPH4KsjGFfoBHBX+Rm+cQE75G8G0LsuOC
         D9nicXIe95F7wLJFJMWNgJ/gT7cr4OfcxYYu0xnX5DHlOJj7mKGazeLcQ03oAM0U90WY
         Hbz7tFDejEVJstOfkzEfA2kJQNk2kahDNijSjoy3Fs10FUPe2wZ2BGbtRLu67RQkUfIO
         RT2/OhLP6FxYuRtjvr8NOhe+w+szhObAcZpFAvyxWRABvdbIomaWjFT4xw7ndq6jHJOb
         gJQw==
X-Forwarded-Encrypted: i=1; AJvYcCU8yobdJMIdAKuY5dm0ZaZ0YBBsYr4BNOXMyuRhUZwc7dw5+1JtdyJp6XyoaLvXJt7jXSefPzszoGfh7ZC91dlx@lists.infradead.org
X-Gm-Message-State: AOJu0YyhB1SHIkQ0x8BslqdxlL9Mryhd0DAe1YhdRsedwG3rdHoxjvEB
	I83gg6vpV0DYMepZfYsOHwiu/WTJEDxAG2C88Wnbh/mm48C7Xc37pGZ5kJX3tFD5P0eRQL8INYN
	BJwGfW7php+wD+A==
X-Google-Smtp-Source: AGHT+IFejZ2I69Eqlg88g8PwiPvQhSLUEBHZrSmUeIH84olhnRxAOXDRbUsOIXtbc95r4ewB/WJLIdwuVFgT6Q==
X-Received: from wmbdw4.prod.google.com ([2002:a05:600c:6384:b0:459:dcf5:1b54])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:22c5:b0:3b8:f863:672c with SMTP id ffacd0b85a97d-3c32e13359bmr316604f8f.33.1755640360470;
 Tue, 19 Aug 2025 14:52:40 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:51:45 +0000
In-Reply-To: <20250819215156.2494305-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250819215156.2494305-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250819215156.2494305-18-smostafa@google.com>
Subject: [PATCH v4 17/28] iommu/arm-smmu-v3-kvm: Take over SMMUs
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, robin.murphy@arm.com, jean-philippe@linaro.org, 
	qperret@google.com, tabba@google.com, jgg@ziepe.ca, mark.rutland@arm.com, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_145242_579678_FB1E701C 
X-CRM114-Status: GOOD (  17.77  )
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

Donate the array with SMMU description to the hypervisor as it
can't be changed by the host after de-privileges.

Also, donate the SMMU resources to the hypervisor.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 81 ++++++++++++++++++-
 1 file changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index fa8b71152560..b56feae81dda 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -7,15 +7,94 @@
 #include <asm/kvm_hyp.h>
 
 #include <nvhe/iommu.h>
+#include <nvhe/mem_protect.h>
 
 #include "arm_smmu_v3.h"
 
 size_t __ro_after_init kvm_hyp_arm_smmu_v3_count;
 struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
 
+#define for_each_smmu(smmu) \
+	for ((smmu) = kvm_hyp_arm_smmu_v3_smmus; \
+	     (smmu) != &kvm_hyp_arm_smmu_v3_smmus[kvm_hyp_arm_smmu_v3_count]; \
+	     (smmu)++)
+
+/* Transfer ownership of memory */
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
+/* Put the device in a state that can be probed by the host driver. */
+static void smmu_deinit_device(struct hyp_arm_smmu_v3_device *smmu)
+{
+	int i;
+	size_t nr_pages = smmu->mmio_size >> PAGE_SHIFT;
+
+	for (i = 0 ; i < nr_pages ; ++i) {
+		u64 pfn = (smmu->mmio_addr >> PAGE_SHIFT) + i;
+
+		WARN_ON(__pkvm_hyp_donate_host_mmio(pfn));
+	}
+}
+
+static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
+{
+	int i;
+	size_t nr_pages;
+
+	if (!PAGE_ALIGNED(smmu->mmio_addr | smmu->mmio_size))
+		return -EINVAL;
+
+	nr_pages = smmu->mmio_size >> PAGE_SHIFT;
+	for (i = 0 ; i < nr_pages ; ++i) {
+		u64 pfn = (smmu->mmio_addr >> PAGE_SHIFT) + i;
+
+		/*
+		 * This should never happen, so it's fine to be strict to avoid
+		 * complicated error handling.
+		 */
+		WARN_ON(__pkvm_host_donate_hyp_mmio(pfn));
+	}
+	smmu->base = hyp_phys_to_virt(smmu->mmio_addr);
+
+	return 0;
+}
+
 static int smmu_init(void)
 {
-	return -ENOSYS;
+	int ret;
+	struct hyp_arm_smmu_v3_device *smmu;
+	size_t smmu_arr_size = PAGE_ALIGN(sizeof(*kvm_hyp_arm_smmu_v3_smmus) *
+					  kvm_hyp_arm_smmu_v3_count);
+
+	kvm_hyp_arm_smmu_v3_smmus = kern_hyp_va(kvm_hyp_arm_smmu_v3_smmus);
+	ret = smmu_take_pages(hyp_virt_to_phys(kvm_hyp_arm_smmu_v3_smmus),
+			      smmu_arr_size);
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
+
+out_reclaim_smmu:
+	while (smmu != kvm_hyp_arm_smmu_v3_smmus)
+		smmu_deinit_device(--smmu);
+	smmu_reclaim_pages(hyp_virt_to_phys(kvm_hyp_arm_smmu_v3_smmus),
+			   smmu_arr_size);
+	return ret;
 }
 
 static void smmu_host_stage2_idmap(phys_addr_t start, phys_addr_t end, int prot)
-- 
2.51.0.rc1.167.g924127e9c0-goog


