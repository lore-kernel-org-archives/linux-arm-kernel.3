Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E97C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gLKA5ZqrCoYNFtJDAb4FxTuJKcFNr0bWkCPJJJzFwTU=; b=NVC9uT4QtOPPUVpJ5U2wHMxyTx
	Bnw7Dcm2EQFWW7mujDoM2qC1gmvp5Af1VCmRtTv9XcQArMdrQpK0ecgvSDAglg6CxyDAPCwqD17nz
	xah3Gkuu0qRM6igTLlVVdxUw9SYeVCA3c01AhKvq2L9uwKwvl1Mug5N+/n3J+xb5SUkPybOEBMTqb
	+jnzqUMU7pqHO8y8xGwl/tbpjtyURH+UrBARPpewNDGa9gcMUiYgXVkRRwpBXpmvClapGGeDtiXMT
	x/KQz+Su3MfrRHzcRkrJ6HYFofuh8VVWItiWWX4H7qYvQ0ndVIBaD1l4EuqV3noYHopm7nNtnpEA4
	Q9fOuXAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyGw-0000000Ef87-1MUc;
	Wed, 15 Jul 2026 11:59:30 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyGo-0000000Ef1O-3osj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:59:24 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-493dc8408fdso16995775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 04:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784116760; x=1784721560; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gLKA5ZqrCoYNFtJDAb4FxTuJKcFNr0bWkCPJJJzFwTU=;
        b=agXcZ3SMhIi+A/F5EdD/o7q5ZRvtja88B3n1P8TpAt7KINWI5m4ZpPgAvMCU44O/pr
         HbZ8gPVq7Kgn/JmpY2WoQIs4VeGvwqjWID0wMiVQPoA/BUJFGmj4hwRPjgeh9NANLruv
         /vfwo7F9AWqtgpPxcKozsLxEUtf3eFMPbayVoFNg8SDR1gHn81yzV3CljKNUrextrqCl
         DdkUDHKGkK9bRtXx7ZCGbNQ6LNW7bjNF/k0BIXee6X4fxaT6Z+OeI9nNWcR5S9DhCtNx
         14WeLrOmmqe2JjlUaZmiCE4lM5kIX7Calx64RIh0fxOeCNLGNysOMJjzEbTVBWB3kZC5
         LLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784116760; x=1784721560;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gLKA5ZqrCoYNFtJDAb4FxTuJKcFNr0bWkCPJJJzFwTU=;
        b=hbeb2LPHE6zZxJh8CRKf2qN95QoezJYDmbQuC4U6PSrGGOhFT6cwBqDMq/l/SSIAto
         CNm9ktUYVOt9POmekXQbz2E/xXyS2k1FBrG5ty2s4DJFwjYXX+R4sIwqjUr8r/GhNr76
         yFd4dF3FlwLWaiuDMGUVjXVZHoheuqsvtJfNwsWkEY7IJBzsWOtpZMK1e3AWCITRJ/+Y
         T480OHZ/M8AxF10VIYveZmDN4j/tCW2T90aX4DivBDadRVFhLPu8MHtOSlHPTvrPTL84
         AmUS01nIqWg4fbJEo1fRBkV2rAqH5/civnPX6aQdeFIlNE8Wtd7jC0o5RkezVUwwJUm1
         +8Tg==
X-Gm-Message-State: AOJu0YydFMBkpAX5kXUlg1Lk4sibQmDONnp56rStYZsf/utmkQj8YnGC
	CmGhzpCoUpsPkKCBugRCH4H3FizMG+4mlvZS0omg/hAoosDPqREeFu3Y1gWeBXj1ZdGmSMM22zc
	0vPdvsRXnVSMupDI6jhIRqzDFlWejJBC5xRHHZYyFBDCyB+b2w9QrVewOqQ4UutpGnRlDzkNmW/
	ePB/i+Ltu8gKinVRH4J8WCNzUAjjyd4Si2D3rEWepH2XarmMoKTfdg0A3Xmcr9ZAdVKw==
X-Received: from wmrc3.prod.google.com ([2002:a05:600c:ac3:b0:493:b91c:52cb])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4205:b0:493:f7bc:26e4 with SMTP id 5b1f17b1804b1-493f8829970mr106991555e9.31.1784116760105;
 Wed, 15 Jul 2026 04:59:20 -0700 (PDT)
Date: Wed, 15 Jul 2026 11:58:47 +0000
In-Reply-To: <20260715115906.2664882-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260715115906.2664882-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
Message-ID: <20260715115906.2664882-7-smostafa@google.com>
Subject: [PATCH v7 06/24] KVM: arm64: iommu: Introduce IOMMU driver infrastructure
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_045923_022168_5DC07405 
X-CRM114-Status: GOOD (  22.69  )
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

To establish DMA isolation, KVM needs an IOMMU driver which provides
ops implemented at EL2.

Only one driver can be used and is registered with
pkvm_iommu_register_driver() by passing pointer to the ops.

This must be called before module_init() which is the point KVM
initializes.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/include/asm/kvm_host.h       |  5 +++++
 arch/arm64/kvm/Makefile                 |  2 +-
 arch/arm64/kvm/hyp/include/nvhe/iommu.h | 13 +++++++++++++
 arch/arm64/kvm/hyp/nvhe/Makefile        |  3 ++-
 arch/arm64/kvm/hyp/nvhe/iommu.c         | 19 +++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/setup.c         | 10 ++++++++++
 arch/arm64/kvm/iommu.c                  | 25 +++++++++++++++++++++++++
 7 files changed, 75 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/iommu.h
 create mode 100644 arch/arm64/kvm/hyp/nvhe/iommu.c
 create mode 100644 arch/arm64/kvm/iommu.c

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index bae2c4f92ef5..43821767ccab 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1711,4 +1711,9 @@ static __always_inline enum fgt_group_id __fgt_reg_to_group_id(enum vcpu_sysreg
 
 long kvm_get_cap_for_kvm_ioctl(unsigned int ioctl, long *ext);
 
+#ifndef __KVM_NVHE_HYPERVISOR__
+struct pkvm_iommu_ops;
+int pkvm_iommu_register_driver(struct pkvm_iommu_ops *hyp_ops);
+#endif
+
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 59612d2f277c..0ddef54f7434 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -24,7 +24,7 @@ kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
 	 vgic/vgic-mmio.o vgic/vgic-mmio-v2.o \
 	 vgic/vgic-mmio-v3.o vgic/vgic-kvm-device.o \
 	 vgic/vgic-its.o vgic/vgic-debug.o vgic/vgic-v3-nested.o \
-	 vgic/vgic-v5.o
+	 vgic/vgic-v5.o iommu.o
 
 kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
 kvm-$(CONFIG_ARM64_PTR_AUTH)  += pauth.o
diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
new file mode 100644
index 000000000000..df3d0cc5d4db
--- /dev/null
+++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ARM64_KVM_NVHE_IOMMU_H__
+#define __ARM64_KVM_NVHE_IOMMU_H__
+
+#include <asm/kvm_host.h>
+
+struct pkvm_iommu_ops {
+	int (*init)(void);
+};
+
+int pkvm_iommu_init(void);
+
+#endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index 7c879292974d..b3e7473f18d2 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -24,7 +24,8 @@ CFLAGS_switch.nvhe.o += -Wno-override-init
 
 hyp-obj-y := timer-sr.o sysreg-sr.o debug-sr.o switch.o tlb.o hyp-init.o host.o \
 	 hyp-main.o hyp-smp.o psci-relay.o early_alloc.o page_alloc.o \
-	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o
+	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o \
+	 iommu.o
 hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
 	 ../hyp-entry.o ../exception.o ../pgtable.o ../vgic-v5-sr.o clock.o
 hyp-obj-y += ../../../kernel/smccc-call.o
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu.c
new file mode 100644
index 000000000000..ef456eff42d2
--- /dev/null
+++ b/arch/arm64/kvm/hyp/nvhe/iommu.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * IOMMU operations for pKVM
+ *
+ * Copyright (C) 2022 Linaro Ltd.
+ */
+#include <nvhe/iommu.h>
+
+/* Only one set of ops supported */
+struct pkvm_iommu_ops *pkvm_iommu_ops;
+
+int pkvm_iommu_init(void)
+{
+	/* Keep DMA isolation optional. */
+	if (!pkvm_iommu_ops || !pkvm_iommu_ops->init)
+		return 0;
+
+	return pkvm_iommu_ops->init();
+}
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index 970c5cf342f5..c6698ecea4a2 100644
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
@@ -333,6 +334,15 @@ void __noreturn __pkvm_init_finalise(void)
 	if (ret)
 		goto out;
 
+	/*
+	 * IOMMU init is done at the the end as it setups and initializes many resources
+	 * that would be leaked if the hypervisor fails after as there is no
+	 * remove_iommu_driver() ops at the moment, that can be added later if necessary.
+	 */
+	ret = pkvm_iommu_init();
+	if (ret)
+		goto out;
+
 	pkvm_hyp_vm_table_init(vm_table_base);
 
 	pkvm_ownership_selftest(selftest_base);
diff --git a/arch/arm64/kvm/iommu.c b/arch/arm64/kvm/iommu.c
new file mode 100644
index 000000000000..6492285012a4
--- /dev/null
+++ b/arch/arm64/kvm/iommu.c
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Google LLC
+ * Author: Mostafa Saleh <smostafa@google.com>
+ */
+
+#include <linux/kvm_host.h>
+
+extern struct pkvm_iommu_ops *kvm_nvhe_sym(pkvm_iommu_ops);
+
+static DEFINE_MUTEX(pkvm_iommu_reg_lock);
+
+int __init pkvm_iommu_register_driver(struct pkvm_iommu_ops *hyp_ops)
+{
+	guard(mutex)(&pkvm_iommu_reg_lock);
+
+	if (!is_protected_kvm_enabled() || is_kvm_arm_initialised())
+		return -EPERM;
+
+	if (kvm_nvhe_sym(pkvm_iommu_ops))
+		return -EBUSY;
+
+	kvm_nvhe_sym(pkvm_iommu_ops) = hyp_ops;
+	return 0;
+}
-- 
2.55.0.141.g00534a21ce-goog


