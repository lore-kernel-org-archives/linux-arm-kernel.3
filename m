Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4257CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SPgM8pFySMpBzoU0tQSRtWXbtV3WXjZpxKdn14a2X+Q=; b=yAGG7iRLq8GjIIymdPSQe9qnZl
	SIKtgseUXAXhOZBIpjRPch6rhHB293w5+a+ix5vEBXlmENzA4MdbgGikqAgLad8hBMGljzL1/HbY1
	rE+3AaKNMSaR6ts3uJriuBnj6yZQAOMkFbGaC68IzaDYrIZVmtzAqEoa1xWtz3PH156idvl+d7QzQ
	nXwman0FQ253o6UqLRs8gihOA2kD5u104udcls3F3UugFfzwrOMaDg2iQu4GcjEMfA0cDTgHFIA/s
	QrLtJ0ce0xCSOe2vXAvomTF3RHe/UBFdY01dZ1B86TbboDVuYBVnuBELo7ssaSVU1i4vwAthk0Ygb
	YFRixvlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRlh-00000001IIO-1eY2;
	Thu, 15 Oct 2026 20:09:37 +0000
Received: from mail-ed1-f70.google.com ([209.85.208.70])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRlR-00000001I06-35OZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:09:23 +0000
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6b1c95904c2so2711665a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 13:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094958; x=1792699758; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SPgM8pFySMpBzoU0tQSRtWXbtV3WXjZpxKdn14a2X+Q=;
        b=ih6JwnGTvXPfMb546UWB8POJ5rlu9FqrqwJMyt5l7F8ZL1Y63zqgZRtsETUGuxBA0e
         MuMRTm3hjWjmz5p3qUEfLh6tPCTd7bSVK0vniEQdPUpiDoCtObZ3KwsU++fI6lHQBOCA
         V6J/l8FM8a+UCpwBRF+b2lxKBbaYBARC/siWFwzROqb2yAlUs4fRxHh2rPjQOsPj4Q/V
         2m4mPFzYBlwEe7dM+nEFvzRQoeUzc9vAkiVWJpM56rKVSHpzixEtRdn2yS7fVVt0OmwU
         UPhk4Y5lnBVrok1SE8g4o8kWTnwI4Or44p/Yfugf6C2V2VjCpDm5+evrw3r/WsJOuHHH
         edag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094958; x=1792699758;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPgM8pFySMpBzoU0tQSRtWXbtV3WXjZpxKdn14a2X+Q=;
        b=b0+lZGDhFcqZRAUKkToxp5WKaSXtou2aXxZMRzzgjw5BBTmeE6OO3JDteKbzw4hbku
         mybOKmgqPBNoi4gMAEI4F7d7qK849NLAc1Dzrh9jzZshJoQSI2KLLDxY2F2go/unpE9e
         qpypAfb/L0kIXIloOobox5XoQH1G/7uYXXdDCy3IKE/UV8tgW34DBnZut8+KgqhREETM
         U/f7dXeBB+nnpjDohyPOiQomxpkSMGD2tNraa0+LW3h+Dj2O08CbayDQxvEuACDIIhxb
         zmKAYD9GseQsL5UG8C2EsWGq9h0gyj/KToYXtSjWYzyDbovQZlu+oM3qjF/F5A27aSYP
         xXXw==
X-Gm-Message-State: AFq9FYL30uc00m3Rdp8CrkQlACH6nZxUQpLkS6t0NUQDOsDe29lLAY5W
	4+FAEo+inaROcbJL/0Upz620M/Fl8CH/jZjzWOBq0LkNxWo8ghPmRVsFcffKZDFdDUdlUa/yvdw
	gx0YDjvKWD2ECnOdrHAsyL1W+Q7OnMjqrRUkTzPVuaIqWJGaZp2+vC+x+Om8fTjgXgnt+6kCYwJ
	QqXiHPPchdYRF+6kFNT9wGycWBN12FGSFpVZivBMOvexjPgElTEXzQ1qOWImXxbHmIeg==
X-Received: from edv13.prod.google.com ([2002:a05:6402:15cd:b0:6ac:bd3a:5051])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2489:b0:6ac:8dce:5a8a with SMTP id 4fb4d7f45d1cf-6b17c25d1dbmr16505883a12.9.1792094957800;
 Thu, 15 Oct 2026 13:09:17 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:37 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-7-smostafa@google.com>
Subject: [PATCH v9 06/25] KVM: arm64: iommu: Introduce IOMMU driver infrastructure
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	nicolinc@nvidia.com, Mostafa Saleh <smostafa@google.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_130921_862230_955415A2 
X-CRM114-Status: GOOD (  22.82  )
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

To establish DMA isolation, pKVM needs an IOMMU driver that provides
ops implemented at EL2.

Only one driver can be used. It is registered before KVM initialises
with pkvm_iommu_register_driver().
Registration must come from an initcall between core_initcall() and
fs_initcall(): earlier and the CPU capabilities are not finalised,
later and kvm_arm_init() at device_initcall level has already consumed
the ops.

The hypervisor calls the driver's init last in __pkvm_init_finalise(),
so that no step that can fail runs after it, as drivers have no
teardown. DMA isolation stays optional: without a registered driver
pKVM initialises as before.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/include/asm/kvm_host.h       |  7 +++++
 arch/arm64/kvm/Makefile                 |  2 +-
 arch/arm64/kvm/hyp/include/nvhe/iommu.h | 13 +++++++++
 arch/arm64/kvm/hyp/nvhe/Makefile        |  3 ++-
 arch/arm64/kvm/hyp/nvhe/iommu.c         | 19 ++++++++++++++
 arch/arm64/kvm/hyp/nvhe/setup.c         | 10 +++++++
 arch/arm64/kvm/iommu.c                  | 35 +++++++++++++++++++++++++
 7 files changed, 87 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/iommu.h
 create mode 100644 arch/arm64/kvm/hyp/nvhe/iommu.c
 create mode 100644 arch/arm64/kvm/iommu.c

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index cd9b9d2462f9..0c7fb6fa24f5 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1717,4 +1717,11 @@ static __always_inline enum fgt_group_id __fgt_reg_to_group_id(enum vcpu_sysreg
 
 long kvm_get_cap_for_kvm_ioctl(unsigned int ioctl, long *ext);
 
+struct pkvm_iommu_ops;
+extern struct pkvm_iommu_ops *kvm_nvhe_sym(pkvm_iommu_ops);
+
+#ifndef __KVM_NVHE_HYPERVISOR__
+int __init pkvm_iommu_register_driver(struct pkvm_iommu_ops *hyp_ops);
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
index f57450ebcb49..7cb79db9bc47 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -24,7 +24,8 @@ CFLAGS_switch.nvhe.o += -Wno-override-init
 
 hyp-obj-y := timer-sr.o sysreg-sr.o debug-sr.o switch.o tlb.o hyp-init.o host.o \
 	 hyp-main.o hyp-smp.o psci-relay.o early_alloc.o page_alloc.o \
-	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o
+	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o \
+	 iommu.o
 hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
 	 ../hyp-entry.o ../exception.o ../pgtable.o ../vgic-v5-sr.o
 hyp-obj-y += ../../../kernel/smccc-call.o
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu.c
new file mode 100644
index 000000000000..f4572b2dba76
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
+struct pkvm_iommu_ops *pkvm_iommu_ops __ro_after_init;
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
index 45ac5f2ba4f7..620b05c2799a 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -13,6 +13,7 @@
 #include <nvhe/early_alloc.h>
 #include <nvhe/ffa.h>
 #include <nvhe/gfp.h>
+#include <nvhe/iommu.h>
 #include <nvhe/memory.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/mm.h>
@@ -342,6 +343,15 @@ void __noreturn __pkvm_init_finalise(void)
 	if (ret)
 		goto out;
 
+	/*
+	 * IOMMU init is done at the end, as it sets up and initializes many
+	 * resources that would be leaked if the hypervisor fails after as there
+	 * is no remove_iommu_driver() at the moment.
+	 */
+	ret = pkvm_iommu_init();
+	if (ret)
+		goto out;
+
 	pkvm_hyp_vm_table_init(vm_table_base);
 
 	pkvm_ownership_selftest(selftest_base);
diff --git a/arch/arm64/kvm/iommu.c b/arch/arm64/kvm/iommu.c
new file mode 100644
index 000000000000..ab3f37d61579
--- /dev/null
+++ b/arch/arm64/kvm/iommu.c
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Google LLC
+ * Author: Mostafa Saleh <smostafa@google.com>
+ */
+
+#include <linux/kvm_host.h>
+
+#include <asm/kvm_mmu.h>
+
+static DEFINE_MUTEX(pkvm_iommu_reg_lock);
+
+/**
+ * pkvm_iommu_register_driver() - Register the hypervisor IOMMU driver
+ * @hyp_ops: Kernel address of the ops, which live in the hypervisor image,
+ *           i.e. &kvm_nvhe_sym(ops).
+ *
+ * Only one driver can be registered. Call from an initcall between
+ * core_initcall() and fs_initcall().
+ *
+ * Return: 0 on success.
+ */
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
+	kvm_nvhe_sym(pkvm_iommu_ops) = kern_hyp_va(kvm_ksym_ref(hyp_ops));
+	return 0;
+}
-- 
2.56.0.176.g3575e65682-goog


