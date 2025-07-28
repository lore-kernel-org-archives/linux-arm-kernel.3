Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851CFC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MUJpMDg7+jrfduLQADckxGjuFStn70Ay5xAwWuNr1tg=; b=r7kCEPghlwG43KFvXGYYDtWxeE
	m9NT48zQ9z831WTOwiU/IxkpwBo/rW5Pp/8IgrHxM8o1B88xOgl1SGcoXfn2Ae351vXENq+fml5C7
	XnEFnGRwAswVYBXyGtzNa2MxEw/PGNhdgTGX7GKyOrr1Mc8GWrCvdBwcQniIAioGB/aPDAIYrVV0L
	o7mZgV84+UGGk6+gwYmgfFJnZcuv87l3iAs27n3zXejkas4xDQ4U+TxpJdMHQpp6mN3A8cWiMc0I/
	e7n6oUcbduIMTJZAEaM4/W+vY1yCMy7Ytn+RzJYZBEgM+JqNMG0SkJYOt+a336/rbcQ8icDho2bxs
	+P22xR0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTiq-0000000FI4l-2vq8;
	Mon, 28 Jul 2025 19:41:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS2v-0000000F910-1JbZ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Jul 2025 17:53:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MUJpMDg7+jrfduLQADckxGjuFStn70Ay5xAwWuNr1tg=; b=O7N910H+OpQcji4xANrt6m4i+z
	pO7EZfVi0YZR3Cr9t8Eje6ZDMNjwp59ZlToaA/fHkVFLej0rw2rQEaIymvoymCiNTrgCotpIm6gOM
	fBVnGbwDS3EdqaWf1TElwhMFI9/V5OdLaGeyDT2oUnOAGbOHGme7PUg3TQMEX61x27UkxFHkUFNQo
	GhTfd82ufwWQf0NMspgwXilh3sLPOQDzdJuPQAg+sJdJOZEpPPNyMwsqptmBIr1HukiFgCdpmx6Fn
	76B47PSj3nNYo8wgTMgMCkNRLb6JqxwU4/7pjPsC2YwFHODcJWl5h/B972SPSqQbdIJuXrrS0wZbX
	PmTgP3wQ==;
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS2r-0000000CWI0-3UEl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:53:55 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3b785d52c19so787614f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 10:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753725232; x=1754330032; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MUJpMDg7+jrfduLQADckxGjuFStn70Ay5xAwWuNr1tg=;
        b=OWhgL8S8gmFnY9kKEFBciGshj2s8sHghEsbvC42ezVNU2bmlXSh5wUwITRyYC8VFDN
         /r5XeXyrpUOGX4TLN55l9QXDoT3IWvkZqvm1lMv3LBIqbajDNl7oBdrIl6e11gkjwsOF
         SaNS3JSByUi6fW+vPmwC1xQ9jUcfJNc5VYTrsbKqj24dFQkcfSYPb0BGSNtSA8tpDzo/
         KwLnMzF1ANPgHa6fJEeuB0utoo0fATDm5j2oRU47vIC+C3tFSCoYVERhoDtZrcxAvP1t
         MWmbGtzS5SCZpyCwG85gJrS35s24QdiASfNMxLoXiQ53DBo10KqFH+1NAzdQJzGfd5pG
         FbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753725232; x=1754330032;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MUJpMDg7+jrfduLQADckxGjuFStn70Ay5xAwWuNr1tg=;
        b=jEkAoUoWBvGdg6nyYOSo+lu0M29dDknyJxWE/7bBrf3FR0+nTFP1bs7kZxeW19l815
         flVeLisimC90PzcUbwrIrz1xiQYvthAaBvUVHRDMdRJqSoMEb3u2Q5Z5hGcIuUmRm61M
         /TqhgA+lF2q+J8DkWNPcK7CvKAMx42arNl9b6YUQW5oarNbHYdrCKlrY/pZ2AvVaLwYf
         lVVRJRUHZ3FjA91xVBvwPn+oscpiBg0YlilJefGPjeWJheIYWD6Nww1ThNcnSHwT+Wil
         T31SacmhcLX8UZKv4YtP1Bj5Dft5YgRgr8zPqS+q/D4d7tWHFbEwEjb5YgcojmZEcZaB
         GDTw==
X-Forwarded-Encrypted: i=1; AJvYcCXdD97fPSwKDhnOhVoZfPHjE+Ba2MMzaCdg4UeOpl7ciC7uHp8FCkkvLKO4poeJkRn4sVY1n0iS0QSkKtiY2lyO@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe8dnuoDbhNRoz3SntsrFZwFXyywJSL1JxARDtf1OjQDvo2hyf
	CnnCIyylxly/ILJaIyawk6vFHnMCaERwUmTv6yvL3OCO/3BOBSdgTQffBI7w9e5N6rG6qS9dLzu
	dK2IdIaiS47oMIw==
X-Google-Smtp-Source: AGHT+IGDhfh9EZSr8jP5okRTWnaalP3+f821EZxOUa7CIqVojw478qp+8MJe9Yk1pfl+ivqJv6Pn45G8dO2iWQ==
X-Received: from wmbay2.prod.google.com ([2002:a05:600c:1e02:b0:455:fdc1:e6])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40dd:b0:3b7:8362:fed8 with SMTP id ffacd0b85a97d-3b78362ff93mr5355358f8f.2.1753725232196;
 Mon, 28 Jul 2025 10:53:52 -0700 (PDT)
Date: Mon, 28 Jul 2025 17:53:10 +0000
In-Reply-To: <20250728175316.3706196-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250728175316.3706196-1-smostafa@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250728175316.3706196-24-smostafa@google.com>
Subject: [PATCH v3 23/29] iommu/arm-smmu-v3-kvm: Support io-pgtable
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
X-CRM114-CacheID: sfid-20250728_185354_119595_F1D50764 
X-CRM114-Status: GOOD (  18.46  )
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

Implement the hypervisor version of io-pgtable allocation functions,
mirroring drivers/iommu/io-pgtable-arm.c. Page allocation uses the
IOMMU pool filled by the host.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/Makefile              |   4 +-
 .../arm/arm-smmu-v3/pkvm/io-pgtable-arm.c     | 115 ++++++++++++++++++
 drivers/iommu/io-pgtable-arm.h                |  15 ++-
 3 files changed, 131 insertions(+), 3 deletions(-)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm.c

diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index c71c96262378..d641a9987152 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -34,7 +34,9 @@ hyp-obj-y += $(lib-objs)
 HYP_SMMU_V3_DRV_PATH = ../../../../../drivers/iommu/arm/arm-smmu-v3
 
 hyp-obj-$(CONFIG_ARM_SMMU_V3_PKVM) += $(HYP_SMMU_V3_DRV_PATH)/pkvm/arm-smmu-v3.o \
-	$(HYP_SMMU_V3_DRV_PATH)/arm-smmu-v3-common-hyp.o
+	$(HYP_SMMU_V3_DRV_PATH)/arm-smmu-v3-common-hyp.o \
+	$(HYP_SMMU_V3_DRV_PATH)/pkvm/io-pgtable-arm.o \
+	$(HYP_SMMU_V3_DRV_PATH)/../../io-pgtable-arm-common.o
 
 ##
 ## Build rules for compiling nVHE hyp code
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm.c
new file mode 100644
index 000000000000..ce17f21238c8
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022 Arm Ltd.
+ */
+#include <nvhe/iommu.h>
+
+#include "../../../io-pgtable-arm.h"
+
+void arm_lpae_split_blk(void)
+{
+	WARN_ON(1);
+}
+
+void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
+			     struct io_pgtable_cfg *cfg, void *cookie)
+{
+	void *addr;
+
+	if (!PAGE_ALIGNED(size))
+		return NULL;
+
+	addr = kvm_iommu_donate_pages(get_order(size));
+
+	if (addr && !cfg->coherent_walk)
+		kvm_flush_dcache_to_poc(addr, size);
+
+	return addr;
+}
+
+void __arm_lpae_free_pages(void *addr, size_t size, struct io_pgtable_cfg *cfg,
+			   void *cookie)
+{
+	if (!cfg->coherent_walk)
+		kvm_flush_dcache_to_poc(addr, size);
+
+	kvm_iommu_reclaim_pages(addr);
+}
+
+void __arm_lpae_sync_pte(arm_lpae_iopte *ptep, int num_entries,
+			 struct io_pgtable_cfg *cfg)
+{
+	if (!cfg->coherent_walk)
+		kvm_flush_dcache_to_poc(ptep, sizeof(*ptep) * num_entries);
+}
+
+static int kvm_arm_io_pgtable_init(struct io_pgtable_cfg *cfg,
+				   enum io_pgtable_fmt fmt,
+				   struct arm_lpae_io_pgtable *data,
+				   void *cookie)
+{
+	int ret = -EINVAL;
+
+	if (fmt == ARM_64_LPAE_S2)
+		ret = arm_lpae_init_pgtable_s2(cfg, data, cookie);
+	else if (fmt == ARM_64_LPAE_S1)
+		ret = arm_lpae_init_pgtable_s1(cfg, data, cookie);
+
+	if (ret)
+		return ret;
+
+	data->iop.cfg = *cfg;
+	data->iop.fmt	= fmt;
+	return 0;
+}
+
+struct io_pgtable *kvm_arm_io_pgtable_alloc(struct io_pgtable_cfg *cfg,
+					    void *cookie,
+					    enum io_pgtable_fmt fmt,
+					    int *out_ret)
+{
+	size_t pgd_size;
+	struct arm_lpae_io_pgtable *data;
+	int ret;
+
+	data = kvm_iommu_donate_pages(get_order(sizeof(*data)));
+	if (!data) {
+		*out_ret = -ENOMEM;
+		return NULL;
+	}
+
+	data->iop.ops = (struct io_pgtable_ops) {
+		.map_pages	= arm_lpae_map_pages,
+		.unmap_pages	= arm_lpae_unmap_pages,
+	};
+
+	ret = kvm_arm_io_pgtable_init(cfg, fmt, data, cookie);
+	if (ret) {
+		*out_ret = ret;
+		goto out_free;
+	}
+	pgd_size = PAGE_ALIGN(ARM_LPAE_PGD_SIZE(data));
+	data->pgd = __arm_lpae_alloc_pages(pgd_size, 0, &data->iop.cfg, cookie);
+	if (!data->pgd) {
+		ret = -ENOMEM;
+		goto out_free;
+	}
+
+	if (fmt == ARM_64_LPAE_S2)
+		data->iop.cfg.arm_lpae_s2_cfg.vttbr = __arm_lpae_virt_to_phys(data->pgd);
+	else if (fmt == ARM_64_LPAE_S1)
+		data->iop.cfg.arm_lpae_s1_cfg.ttbr = __arm_lpae_virt_to_phys(data->pgd);
+
+	if (!data->iop.cfg.coherent_walk)
+		kvm_flush_dcache_to_poc(data->pgd, pgd_size);
+
+	/* Ensure the empty pgd is visible before any actual TTBR write */
+	wmb();
+
+	*out_ret = 0;
+	return &data->iop;
+out_free:
+	kvm_iommu_reclaim_pages(data);
+	*out_ret = ret;
+	return NULL;
+}
diff --git a/drivers/iommu/io-pgtable-arm.h b/drivers/iommu/io-pgtable-arm.h
index 2807cf563f11..c1450eca934f 100644
--- a/drivers/iommu/io-pgtable-arm.h
+++ b/drivers/iommu/io-pgtable-arm.h
@@ -188,8 +188,19 @@ static inline bool iopte_table(arm_lpae_iopte pte, int lvl)
 	return iopte_type(pte) == ARM_LPAE_PTE_TYPE_TABLE;
 }
 
-#define __arm_lpae_virt_to_phys        __pa
-#define __arm_lpae_phys_to_virt        __va
+#ifdef __KVM_NVHE_HYPERVISOR__
+#include <nvhe/memory.h>
+#define __arm_lpae_virt_to_phys	hyp_virt_to_phys
+#define __arm_lpae_phys_to_virt	hyp_phys_to_virt
+
+struct io_pgtable *kvm_arm_io_pgtable_alloc(struct io_pgtable_cfg *cfg,
+					    void *cookie,
+					    enum io_pgtable_fmt fmt,
+					    int *out_ret);
+#else
+#define __arm_lpae_virt_to_phys	__pa
+#define __arm_lpae_phys_to_virt	__va
+#endif
 
 static inline phys_addr_t iopte_to_paddr(arm_lpae_iopte pte,
 					 struct arm_lpae_io_pgtable *data)
-- 
2.50.1.552.g942d659e1b-goog


