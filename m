Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC41E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RS8qlDlci8/4Bym+8sOq6f7pGooq251OZRMaf+SOEgY=; b=h+Pfi4KUG6Dc/k8/G8Uyha7se1
	NHeAXjszjatNGxkMzs7FnYtF7NjLvD/RIy9MTJdGh9af/hYC2Avx0FszF3UIT1GxdYb6nQPxwq2Mb
	fb8xv5JPbpIPXsoU2plIbRfvYHo6UyRQ/UNJl8LrX2Q9eclYIPT/4t91XHLZW53+gK7SwByhOrrKD
	+6Jq3PPaNkaKCbHbuxf3ppWsAYFhhapmq+0eQSIuc+m1SHPNcEk1C3Wg9vj4xKDRvfRDpj91QKB/P
	k74c8MnQyGUT4z+3/jz9StXOMBviwJ8rI73I+t3swXd5YQ29Fs0myGbhBtogGrX2g7VXqASQTNOk/
	pdVf1csA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnnA-00000001OKD-1cTI;
	Thu, 12 Dec 2024 18:20:04 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnYn-00000001Jdb-0Vm4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:05:14 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-434fb9646efso8345265e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026711; x=1734631511; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RS8qlDlci8/4Bym+8sOq6f7pGooq251OZRMaf+SOEgY=;
        b=iUWnbuqkhID2HmevacVui/djzSGuA1+b9Ahx0yh+UDEHXz69XZm5dReKp75NIVBolQ
         R3AeNIRAzYjAw5tOcRtyYkQdMgusvXkAaLGghJei6UJyHumAFzJUQo9g0FmyE6utFSs3
         iF9ulx+XFP08nEIXhB4sooZpkdruWd38DX7phpOl11vQmBQNUny5TMJTxPrwcM6vYUOC
         Q4A2+xRL4QOpDufCyT17cZzSzFtVW5LmUDp15ZQ38795C/hO7yYD/Q55UAlJdSBK7K3h
         zxogo3VTqrouc70Rc45j5zLiZHYikVNVWtHgY1cWk2JlPR6xaLaTKKZoOmZ/WgwOHiSE
         nOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026711; x=1734631511;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RS8qlDlci8/4Bym+8sOq6f7pGooq251OZRMaf+SOEgY=;
        b=J1raKTzugKmLKsT1TOrsl2/pkkwO+6pB+59gTXpcRygNz/cthBVcNgwef5hOQVdtg9
         EphJhaHZWcGTGg1ONCuCJp8lpR+rQqQ93M0rzg7FP6XdjbX7DlaNfu81t9GhRUpDcF0d
         7o7V3sZ1QfMT436J0ylcNuUNsy/Zx/UlzVIcKC29DtImeC869PQPSbuKPmELvTtKtaJK
         Op5tC7MKWbY5qTRst7H4Br+n0ci9j644gq8JWISc2QG0H8V9NP1s2zI9hWMMYaFPXMa0
         7IbkigU3342uE3zK1CSyHG3EMOwdX0PnvSgc+7li1G+NyTjnVEsh2STxEadadKHBPwq9
         WCaw==
X-Forwarded-Encrypted: i=1; AJvYcCUcaYYEzOqD0l51n3VZ5Zwki8gqg+fshmFV74oFGuyPXYW0PsbNw9g42zj9n7uz1h2sUprPfOJj8Tuqi0c7bjkS@lists.infradead.org
X-Gm-Message-State: AOJu0YzIZHlsEAz1RrjmNAqA2bV/PX2YDdPPfSI8r3sC1YBYMZ2/a9w7
	jekaQv5oscVuyLD+YmCCQ+vw32kxxCuvQUlnLkoq+9wmch3T6IPJLuLSiYWTo02rjvEkhWF6Di6
	X2Btq/Bcucg==
X-Google-Smtp-Source: AGHT+IEXzXpQhlLFADFsSKXZo9irA4liP3Y9eVpRtNsKhNXeGfOrD877Mo3P2mHA18Npm95BG/JFoGOJUDSq9w==
X-Received: from wmbd18.prod.google.com ([2002:a05:600c:58d2:b0:434:a98d:6a1c])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:cc7:b0:434:f753:600f with SMTP id 5b1f17b1804b1-4361c3a6062mr66983595e9.19.1734026711336;
 Thu, 12 Dec 2024 10:05:11 -0800 (PST)
Date: Thu, 12 Dec 2024 18:03:37 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-14-smostafa@google.com>
Subject: [RFC PATCH v2 13/58] KVM: arm64: Introduce IOMMU driver infrastructure
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
X-CRM114-CacheID: sfid-20241212_100513_166537_13DED840 
X-CRM114-Status: GOOD (  25.99  )
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

To establish DMA isolation, KVM needs an IOMMU driver which provide
certain ops, these ops are defined outside of the iommu_ops,
and has 2 components:
- kvm_iommu_driver (kernel): Implements simple interaction with
  the kernel (init, remove,...)
- kvm_iommu_ops (hypervisor): Implements paravirtual interface
  (map, unmap, attach, detach,...)

Only one driver can be used and is registered with
kvm_iommu_register_driver() by passing pointers to both ops.

KVM will initialise the driver after it initialises and before the
de-privilege point, which is a suitable point to establish trusted
interaction between the host and the hypervisor, this also allows
the host kernel to do one initialization from the kernel and avoid
such complexity in the hypervisor as the kernel is still trusted at
this point.

Also, during the registration call, the pointer for the hypervisor
ops will be initialised.

The hypervisor init part is called from the finalise hypercall which
is executed after the kernel kvm IOMMU driver init.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 arch/arm64/include/asm/kvm_host.h       | 11 ++++++
 arch/arm64/kvm/Makefile                 |  2 +-
 arch/arm64/kvm/arm.c                    |  8 ++++-
 arch/arm64/kvm/hyp/include/nvhe/iommu.h | 13 +++++++
 arch/arm64/kvm/hyp/nvhe/Makefile        |  2 +-
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c   | 18 ++++++++++
 arch/arm64/kvm/hyp/nvhe/setup.c         |  5 +++
 arch/arm64/kvm/iommu.c                  | 47 +++++++++++++++++++++++++
 8 files changed, 103 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/iommu.h
 create mode 100644 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
 create mode 100644 arch/arm64/kvm/iommu.c

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 53916a7f0def..54416cfea573 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1628,4 +1628,15 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
 
 unsigned long __pkvm_reclaim_hyp_alloc_mgt(unsigned long nr_pages);
 
+struct kvm_iommu_driver {
+	int (*init_driver)(void);
+	void (*remove_driver)(void);
+};
+
+struct kvm_iommu_ops;
+int kvm_iommu_register_driver(struct kvm_iommu_driver *kern_ops,
+			      struct kvm_iommu_ops *el2_ops);
+int kvm_iommu_init_driver(void);
+void kvm_iommu_remove_driver(void);
+
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index f9e208273031..440897366e88 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -23,7 +23,7 @@ kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
 	 vgic/vgic-v3.o vgic/vgic-v4.o \
 	 vgic/vgic-mmio.o vgic/vgic-mmio-v2.o \
 	 vgic/vgic-mmio-v3.o vgic/vgic-kvm-device.o \
-	 vgic/vgic-its.o vgic/vgic-debug.o
+	 vgic/vgic-its.o vgic/vgic-debug.o iommu.o
 
 kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
 kvm-$(CONFIG_ARM64_PTR_AUTH)  += pauth.o
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 94b210f36573..4b486323c0c9 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2510,9 +2510,15 @@ static int __init kvm_hyp_init_protection(u32 hyp_va_bits)
 	if (ret)
 		return ret;
 
+	ret = kvm_iommu_init_driver();
+	if (ret < 0)
+		return ret;
+
 	ret = do_pkvm_init(hyp_va_bits);
-	if (ret)
+	if (ret) {
+		kvm_iommu_remove_driver();
 		return ret;
+	}
 
 	free_hyp_pgds();
 
diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
new file mode 100644
index 000000000000..1ac70cc28a9e
--- /dev/null
+++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ARM64_KVM_NVHE_IOMMU_H__
+#define __ARM64_KVM_NVHE_IOMMU_H__
+
+#include <asm/kvm_host.h>
+
+struct kvm_iommu_ops {
+	int (*init)(void);
+};
+
+int kvm_iommu_init(void);
+
+#endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index 415cc51fe391..9e1b74c661d2 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -8,7 +8,7 @@ CFLAGS_switch.nvhe.o += -Wno-override-init
 hyp-obj-y := timer-sr.o sysreg-sr.o debug-sr.o switch.o tlb.o hyp-init.o host.o \
 	 hyp-main.o hyp-smp.o psci-relay.o alloc.o early_alloc.o page_alloc.o \
 	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o \
-	 serial.o alloc_mgt.o
+	 serial.o alloc_mgt.o iommu/iommu.o
 hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
 	 ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o
 hyp-obj-$(CONFIG_LIST_HARDENED) += list_debug.o
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
new file mode 100644
index 000000000000..3bd87d2084e9
--- /dev/null
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * IOMMU operations for pKVM
+ *
+ * Copyright (C) 2022 Linaro Ltd.
+ */
+#include <nvhe/iommu.h>
+
+/* Only one set of ops supported, similary to the kernel */
+struct kvm_iommu_ops *kvm_iommu_ops;
+
+int kvm_iommu_init(void)
+{
+	if (!kvm_iommu_ops || !kvm_iommu_ops->init)
+		return -ENODEV;
+
+	return kvm_iommu_ops->init();
+}
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index 9d09f5f471b9..4d36616a7f02 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -14,6 +14,7 @@
 #include <nvhe/early_alloc.h>
 #include <nvhe/ffa.h>
 #include <nvhe/gfp.h>
+#include <nvhe/iommu.h>
 #include <nvhe/memory.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/mm.h>
@@ -360,6 +361,10 @@ void __noreturn __pkvm_init_finalise(void)
 	if (ret)
 		goto out;
 
+	ret = kvm_iommu_init();
+	if (ret)
+		goto out;
+
 	ret = fix_host_ownership();
 	if (ret)
 		goto out;
diff --git a/arch/arm64/kvm/iommu.c b/arch/arm64/kvm/iommu.c
new file mode 100644
index 000000000000..ed77ea0d12bb
--- /dev/null
+++ b/arch/arm64/kvm/iommu.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023 Google LLC
+ * Author: Mostafa Saleh <smostafa@google.com>
+ */
+
+#include <asm/kvm_mmu.h>
+#include <linux/kvm_host.h>
+
+struct kvm_iommu_driver *iommu_driver;
+extern struct kvm_iommu_ops *kvm_nvhe_sym(kvm_iommu_ops);
+
+int kvm_iommu_register_driver(struct kvm_iommu_driver *kern_ops, struct kvm_iommu_ops *el2_ops)
+{
+	int ret;
+
+	if (WARN_ON(!kern_ops || !el2_ops))
+		return -EINVAL;
+
+	/*
+	 * Paired with smp_load_acquire(&iommu_driver)
+	 * Ensure memory stores happening during a driver
+	 * init are observed before executing kvm iommu callbacks.
+	 */
+	ret = cmpxchg_release(&iommu_driver, NULL, kern_ops) ? -EBUSY : 0;
+	if (ret)
+		return ret;
+
+	kvm_nvhe_sym(kvm_iommu_ops) = el2_ops;
+	return 0;
+}
+
+int kvm_iommu_init_driver(void)
+{
+	if (WARN_ON(!smp_load_acquire(&iommu_driver))) {
+		kvm_err("pKVM enabled without an IOMMU driver, do not run confidential workloads in virtual machines\n");
+		return -ENODEV;
+	}
+
+	return iommu_driver->init_driver();
+}
+
+void kvm_iommu_remove_driver(void)
+{
+	if (smp_load_acquire(&iommu_driver))
+		iommu_driver->remove_driver();
+}
-- 
2.47.0.338.g60cca15819-goog


