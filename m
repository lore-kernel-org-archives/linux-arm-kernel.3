Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE032CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2e8AJ/3qpxCOMqh4v7dKF/r5F0keF6BFA14sDMtgseA=; b=rOAjVSxCDHFPoeB2y2ZBa1R/ff
	kiZx624Wi2ISVPLGVBo3kZCbkqZs1MXq/JDF04rywQfyaiYMxtAP6lBGg5FdsqwNoYlYWnhtsooJ3
	M1/2OChUvfhP9J7Q0Qf1rCEFgGCRTiJ9aabdwL9APSLxWy8ecMaD4FD1xkXuF74FCSRI+LqiiFSPz
	ftPbNF5ifvl3c7yUPiCVeZ48Wvsc5keyYBRH77xYjuHI+I2iSSYeUMBhh4RKpjWu4MWMbb1oqk76/
	8nk+Ygi+2vKgj9ReX7CDaBoqg87pvZijS/7RWsb4m2eqFcR2tuQyEfwHmbIJfyg5IBYFX2pcY8xaC
	7US8w7Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4IL-0000000GelY-3svc;
	Mon, 17 Nov 2025 18:49:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HZ-0000000GdnH-0FmU
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Nov 2025 18:48:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2e8AJ/3qpxCOMqh4v7dKF/r5F0keF6BFA14sDMtgseA=; b=R/t7pdj7wUhpgfAdhcnGera7aA
	+Ll5whJyKc3Ox5PqopQXHjEf/t0P5jE5DeUWElBI58VVxMxb0wJ/iqVHG06tj1RUNe07iUgoAK0ZV
	ZHBxCkGW+5GW+b/ABnUYHVCjCnrbFwfhV/cEl4EHaVwm40+Uef84h7ueA8PKY92hf0H5SksDJQamk
	l7CoBjtIn5QTd6cpV9IHELgAzk+sFDqiJPSDN7obfybWZiiV9aQH4W1K6Y6ox3lv6jQmR4JAxhemK
	eBDU5dkbhRH12w5dZXjHC9B+TPjCJNw4y5gH6hzuMNkdPFc0x6WiR1xt78S6hgDt9BkB9V+z+zuhN
	GZSErVWg==;
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HV-0000000EHiX-1Q9Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 18:48:55 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-42b2fb13b79so2204434f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763405331; x=1764010131; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2e8AJ/3qpxCOMqh4v7dKF/r5F0keF6BFA14sDMtgseA=;
        b=eCHC+s819RB0vrNjN08Cfjx9wStbRJFGfoDwRc55aB54TG8444ak20t2nUQjwRn5sF
         kF4oF9Iz3UeT1WFULeaGXkFX01KqPsgjw4drhYSO7pk+TdA20b/08DYV9IP8JQT5mM5D
         GL/+iM3yyUa8hVoSnSbHbNsd4lZoEQ9WuqZ7uaRHHZVoIQDc4T4GvGzcJ244dmTyw+p1
         jzIpW3Km3hpPErGnqA9AakHylR7WjCGXDveHBUBSnB34yQ5zyQ3RwXalD786yPvCSka1
         OqZWFAsOkxXtuB629PUjNzDxMYU0q8wn5QtaPD79FGgdNDQ6SUFdnd871SbV1ZNi7XjS
         zIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763405331; x=1764010131;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2e8AJ/3qpxCOMqh4v7dKF/r5F0keF6BFA14sDMtgseA=;
        b=JP5mTZ+bULytBHAT/TKxLjKlzs+qtB0Xh5NiofKHUwBGZ2Bl5Mkpvlo6eM4a7rVIQE
         Q+IPn1eK8RTKLgqpAsjWh0+yCStjps+Mn1AavCXK7uu/FjF0+TqleKJnfa1qvXkhFsMC
         IaQnV6E63rAbIGx/x10JP6MWF+wyIQ50JgFTtNcIhrz9C0oJyytfDPiMVuhJXmyNokkY
         dA2mlp28pWE/1M7BxLCG/+dX78RbIow3UIHPYUolEB7kwWBRh2CnthAOFVmftORutNo/
         PITrH0QRjZTB44Iz37PZCdCnb/Z/UKk/wnFgwpCeny+cN5bhsbjflu7mKPO5B5jLBqAc
         VndA==
X-Gm-Message-State: AOJu0Yz2rOiQyBCVLZMEum6z1Z7mS8Mi9SidlFhfeV/1GVyjdxjnSbJv
	J2o2r5frej8TKqzNINgtR625RPdLXGNQKYtyFIqGmBtDLxjnbUyLtzvD7FOuD5gzaQFItFvkroR
	wGACtZdzWPwf+LovmIFXJ3fPn6yg+2CaljNxK5ua2uHKSldem2o7iMGcFpckPrXds9tPrkKYnrv
	lAB/LmS5c083bx+RtZ14Ikh7nh7tabmwsD7i7KjdMt7sI+mQMl7+Ewruo8NzQc1GgOhw==
X-Google-Smtp-Source: AGHT+IFYxGMytoDZZlTDHtwywr4/Pi+/xR6UqlI0u6DlCyyeGT+QjWCV1nogGfL6thKzA2YoXGlkE2OMke9X7g==
X-Received: from wrqa7.prod.google.com ([2002:adf:f7c7:0:b0:42b:33e5:eba1])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:240d:b0:3ea:80ec:8552 with SMTP id ffacd0b85a97d-42b59387fbfmr14696008f8f.57.1763405331039;
 Mon, 17 Nov 2025 10:48:51 -0800 (PST)
Date: Mon, 17 Nov 2025 18:48:12 +0000
In-Reply-To: <20251117184815.1027271-1-smostafa@google.com>
Mime-Version: 1.0
References: <20251117184815.1027271-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251117184815.1027271-26-smostafa@google.com>
Subject: [PATCH v5 25/27] iommu/arm-smmu-v3-kvm: Support io-pgtable
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_184853_413598_4C2DA1A9 
X-CRM114-Status: GOOD (  16.03  )
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

Add hooks needed to support io-pgtable-arm, mostly about
memory allocation.

Also add a function to allocate s2 64 bit page table.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/Makefile              |  4 +-
 .../arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.c | 68 +++++++++++++++++++
 drivers/iommu/io-pgtable-arm.c                |  2 +-
 drivers/iommu/io-pgtable-arm.h                | 11 +++
 4 files changed, 83 insertions(+), 2 deletions(-)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.c

diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index 197685817546..99c2ce941146 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -35,7 +35,9 @@ hyp-obj-y += $(lib-objs)
 HYP_SMMU_V3_DRV_PATH = ../../../../../drivers/iommu/arm/arm-smmu-v3
 
 hyp-obj-$(CONFIG_ARM_SMMU_V3_PKVM) += $(HYP_SMMU_V3_DRV_PATH)/pkvm/arm-smmu-v3.o \
-	$(HYP_SMMU_V3_DRV_PATH)/arm-smmu-v3-common-lib.o
+	$(HYP_SMMU_V3_DRV_PATH)/arm-smmu-v3-common-lib.o \
+	$(HYP_SMMU_V3_DRV_PATH)/pkvm/io-pgtable-arm-hyp.o \
+	$(HYP_SMMU_V3_DRV_PATH)/../../io-pgtable-arm.o
 
 ##
 ## Build rules for compiling nVHE hyp code
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.c
new file mode 100644
index 000000000000..fc2006dc0b82
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022 Arm Ltd.
+ */
+#include <nvhe/iommu.h>
+
+#include <linux/io-pgtable.h>
+#include "../../../io-pgtable-arm.h"
+
+struct io_pgtable_ops *kvm_alloc_io_pgtable_ops(enum io_pgtable_fmt fmt,
+						struct io_pgtable_cfg *cfg,
+						void *cookie)
+{
+	struct io_pgtable *iop;
+
+	if (fmt != ARM_64_LPAE_S2)
+		return NULL;
+
+	iop = arm_64_lpae_alloc_pgtable_s2(cfg, cookie);
+	if (!iop)
+		return NULL;
+
+	iop->fmt	= fmt;
+	iop->cookie	= cookie;
+	iop->cfg	= *cfg;
+
+	return &iop->ops;
+}
+
+void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
+			     struct io_pgtable_cfg *cfg, void *cookie)
+{
+	void *addr;
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
+/* At the moment this is only used once, so rounding up to a page is not really a problem. */
+void *__arm_lpae_alloc_data(size_t size, gfp_t gfp)
+{
+	return kvm_iommu_donate_pages(get_order(size));
+}
+
+void __arm_lpae_free_data(void *p)
+{
+	return kvm_iommu_reclaim_pages(p);
+}
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 377c15bc8350..dbb1a58a5ce6 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -980,7 +980,7 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
 	return NULL;
 }
 
-static struct io_pgtable *
+struct io_pgtable *
 arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
 {
 	u64 sl;
diff --git a/drivers/iommu/io-pgtable-arm.h b/drivers/iommu/io-pgtable-arm.h
index 62d127dae1c2..742a6ed9ae3c 100644
--- a/drivers/iommu/io-pgtable-arm.h
+++ b/drivers/iommu/io-pgtable-arm.h
@@ -41,9 +41,20 @@ void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
 			     void *cookie);
 void *__arm_lpae_alloc_data(size_t size, gfp_t gfp);
 void __arm_lpae_free_data(void *p);
+struct io_pgtable *
+arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie);
 #ifndef __KVM_NVHE_HYPERVISOR__
 #define __arm_lpae_virt_to_phys	__pa
 #define __arm_lpae_phys_to_virt	__va
+#else
+#include <nvhe/memory.h>
+#define __arm_lpae_virt_to_phys	hyp_virt_to_phys
+#define __arm_lpae_phys_to_virt	hyp_phys_to_virt
+#undef WARN_ONCE
+#define WARN_ONCE(condition, format...)	WARN_ON(1)
+struct io_pgtable_ops *kvm_alloc_io_pgtable_ops(enum io_pgtable_fmt fmt,
+						struct io_pgtable_cfg *cfg,
+						void *cookie);
 #endif /* !__KVM_NVHE_HYPERVISOR__ */
 
 #endif /* IO_PGTABLE_ARM_H_ */
-- 
2.52.0.rc1.455.g30608eb744-goog


