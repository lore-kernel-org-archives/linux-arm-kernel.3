Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3519C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 16:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ubeHaXbMbCOzTTinYD2VelpFhUrhVALfoKhm+KzrKis=; b=X1d6YUErr0ZfcD9uiQo8MxIvwh
	I8ITcX1DUAE13WFzykdwtVLVzCfXUrN8Zy6UR55dOWm7wCiqHsZhB/6ERHRgBMTTxCnSDZRtQH8h3
	IZ+ujsP1Ue5YEzksS4yIfHUX3p2BRbmhe2il8Dps6z5bfhGDLPvEBU1gJWf1+8RnK4CYwMJRke4mI
	nbKwTGHM6M7TJgq8LjA1eWhCn1PF/UB9cOf+2eL5Ku3VOwCIo0vJWxI5CVlcajxAbwfIBD23zKPtm
	ywtKYZhek2gkg5MPFKHIu/CLu4RjYs/Cls0OOEshwDfPq9/m3iff23jAQxR+7GtDRcdsKL+pNo8EA
	105QC4Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNfk-00000008S7B-3SBt;
	Fri, 07 Aug 2026 16:43:52 +0000
Received: from mail-ej1-x648.google.com ([2a00:1450:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNfe-00000008S0r-3jUF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 16:43:48 +0000
Received: by mail-ej1-x648.google.com with SMTP id a640c23a62f3a-c20262b5e10so449067566b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 09:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786121024; x=1786725824; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ubeHaXbMbCOzTTinYD2VelpFhUrhVALfoKhm+KzrKis=;
        b=r/fiHKKkq4QreV4lZYR5VidWCKXhz0WB+ez+NkL9DQ9HUmJXFtTZOtPig1DmKph+x0
         Fywpty1Wm2yGtzMWy6NO6hiUmSY2549X7fQqQIaQ2O2TjAY2kRYvFGlcRJgC+XLEhVMR
         OVBtD691ateErYG3e3O1QxNBH1H1FshjWemi/TNPfkieudySkIajubx6zfGU0aAkYIY/
         EYo41q+Sc6Fa1Zbq0Kh0oZaYovIGsnavpLN+aGEk+hCdi68Y04GqG0Md82s+CiBaBJ/S
         zX+O0u2xhwVtPApxUJ+cJlUCUdi8FEYzxtPz83rOdMw2JBhe+ANBaRqMEGrMTibWxzTF
         wB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786121024; x=1786725824;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ubeHaXbMbCOzTTinYD2VelpFhUrhVALfoKhm+KzrKis=;
        b=qF/8xSEd0aDSKU15oJapJSDM2xCM+e2bimPJL8CRZiaQmvFsHYcgOSUKz3+UxgVZfB
         HJzzFowbcqGORKycYnV70sDQdc3fpbi1t+BvFxcbAAxOoUuBRRLiSQiShks3aHOPay4x
         yA8WnnuRPYXmw4zkuYFF6tC0C9NvV05P9mdq8mf0h5INjSuS7QzWZBuT16lG6jfnB5nw
         LLfumJvQKov9T31sl06bS95gHdfXwXD+SYB/2usZH06HS9l+m25yACNSceXjqnUi80Yb
         bOUPTlrOOlKkTGi/UIZYhk7rtoGieyQyiYBwoOCEpZNmcYLPf/6DYkb0/aPvSP6pJjBx
         5SIw==
X-Forwarded-Encrypted: i=1; AHgh+Rp8ZZ0DpGR8HtiJwMRYFmL9GUIhO9FwUbg3dTqeHtwibJFHcTTshVqJCjua/z+xTRqhDeKPG5OrTxNgyaNcQyqj@lists.infradead.org
X-Gm-Message-State: AOJu0YyZSOaNNa6zfGvPCzB6OkNAcv9OlpcyhkbVVUmuu/RJ5ZJ7JjZv
	Le1ocqNz5lU7EvwxQLjaXk+nFvXWw9e151KDF/xfIRAN0d9YYveT0V4jJuaADPLLa8CB+FTA4uJ
	LaXIh3t5tF/6hRFgp3kWmBHYIUrl5bw==
X-Received: from ejfv7.prod.google.com ([2002:a17:906:3bc7:b0:c12:8ea1:b062])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:1b24:b0:c12:8b1c:454f with SMTP id a640c23a62f3a-c2039c0264bmr1298937866b.2.1786121023739;
 Fri, 07 Aug 2026 09:43:43 -0700 (PDT)
Date: Fri,  7 Aug 2026 16:43:14 +0000
In-Reply-To: <20260807164322.2970811-2-sebastianene@google.com>
Mime-Version: 1.0
References: <20260807164322.2970811-2-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.654.g21b8a5bc05-goog
Message-ID: <20260807164322.2970811-6-sebastianene@google.com>
Subject: [PATCH v2 04/13] KVM: Parse the device tree and register the ITS
 region with pKVM
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, fuad.tabba@linux.dev, joey.gouly@arm.com, 
	mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, rananta@google.com, 
	Sascha.Bischoff@arm.com, suzuki.poulose@arm.com, will@kernel.org
Cc: kvmarm@lists.linux.dev, android-kvm@google.com, bgrzesik@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nathan@kernel.org, perlarsen@google.com, sebastianene@google.com, 
	seiden@linux.ibm.com, smostafa@google.com, tglx@kernel.org, 
	vdonnefort@google.com, vladimir.murzin@arm.com, yuzenghui@huawei.com, 
	zenghui.yu@linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_094346_987853_BC8F409E 
X-CRM114-Status: GOOD (  23.95  )
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

Identify the ITS base address from the device tree and store it in the
pkvm_protected_regs array so that it will be unmapped from the host
address space.
Register a callback to forward all the MMIO requests to the device to
prevent breaking ITS functionality in this patch. The patch by itself
shouldn't break any existing functionality even though all the accesses
from the gic-ITS driver are now mediated inside pKVM.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/include/asm/kvm_pkvm.h     |  2 ++
 arch/arm64/kvm/hyp/nvhe/Makefile      |  3 +-
 arch/arm64/kvm/hyp/nvhe/its_emulate.c | 37 +++++++++++++++++++
 arch/arm64/kvm/pkvm.c                 | 52 +++++++++++++++++++++++++++
 4 files changed, 93 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/kvm/hyp/nvhe/its_emulate.c

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 0a471564be00..370225f0e72c 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -31,6 +31,8 @@ struct pkvm_protected_reg {
 
 extern struct pkvm_protected_reg kvm_nvhe_sym(pkvm_protected_regs)[];
 extern unsigned int kvm_nvhe_sym(num_protected_reg);
+extern void kvm_nvhe_sym(its_emulate_forward_req)(struct pkvm_protected_reg *region, u64 offset,
+						  bool write, u64 *reg, u8 reg_size);
 
 int pkvm_init_host_vm(struct kvm *kvm, unsigned long type);
 int pkvm_create_hyp_vm(struct kvm *kvm);
diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index f57450ebcb49..70fbca325852 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -24,7 +24,8 @@ CFLAGS_switch.nvhe.o += -Wno-override-init
 
 hyp-obj-y := timer-sr.o sysreg-sr.o debug-sr.o switch.o tlb.o hyp-init.o host.o \
 	 hyp-main.o hyp-smp.o psci-relay.o early_alloc.o page_alloc.o \
-	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o
+	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o \
+	 its_emulate.o
 hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
 	 ../hyp-entry.o ../exception.o ../pgtable.o ../vgic-v5-sr.o
 hyp-obj-y += ../../../kernel/smccc-call.o
diff --git a/arch/arm64/kvm/hyp/nvhe/its_emulate.c b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
new file mode 100644
index 000000000000..63a42f520ed2
--- /dev/null
+++ b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <asm/kvm_pkvm.h>
+#include <nvhe/mem_protect.h>
+
+void its_emulate_forward_req(struct pkvm_protected_reg *region, u64 offset, bool write, u64 *reg,
+			     u8 reg_size)
+{
+	void __iomem *addr = __hyp_va(PFN_PHYS(region->pfn) + offset);
+
+	switch (reg_size) {
+	case 1:
+		if (!write)
+			*reg = readb_relaxed(addr);
+		else
+			writeb_relaxed(*reg, addr);
+		break;
+	case 2:
+		if (!write)
+			*reg = readw_relaxed(addr);
+		else
+			writew_relaxed(*reg, addr);
+		break;
+	case 4:
+		if (!write)
+			*reg = readl_relaxed(addr);
+		else
+			writel_relaxed(*reg, addr);
+		break;
+	case 8:
+		if (!write)
+			*reg = readq_relaxed(addr);
+		else
+			writeq_relaxed(*reg, addr);
+		break;
+	}
+}
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 428723b1b0f5..4bfffbedac4c 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -9,8 +9,13 @@
 #include <linux/kmemleak.h>
 #include <linux/kvm_host.h>
 #include <asm/kvm_mmu.h>
+#include <asm/kvm_pkvm.h>
 #include <linux/memblock.h>
 #include <linux/mutex.h>
+#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/irqchip/arm-gic-v3.h>
 
 #include <asm/kvm_pkvm.h>
 
@@ -39,6 +44,47 @@ static int __init register_memblock_regions(void)
 	return 0;
 }
 
+static int __init register_its_emulated_region(void)
+{
+	struct device_node *np;
+	struct resource res;
+	int i = 0;
+	int ret;
+
+	for_each_compatible_node(np, NULL, "arm,gic-v3-its") {
+		ret = of_address_to_resource(np, 0, &res);
+		if (ret)
+			goto out_fail;
+
+		if (i >= PKVM_PROTECTED_REGS_NUM) {
+			kvm_err("Out of protected region slots\n");
+			ret = -ENOSPC;
+			goto out_fail;
+		}
+
+		/*
+		 * Note: don't unmap the entire animal from the host because devices need
+		 * to be able to access GITS_TRANSLATER to raise MSIs. If the
+		 * page where GITS_TRANSLATER is given to HYP, devices won't be
+		 * able to map it in their IOMMU when the IOMMU is managed by
+		 * pKVM.
+		 */
+		kvm_nvhe_sym(pkvm_protected_regs)[i].pfn = PHYS_PFN(res.start);
+		kvm_nvhe_sym(pkvm_protected_regs)[i].cb =
+			lm_alias(&kvm_nvhe_sym(its_emulate_forward_req));
+		kvm_nvhe_sym(pkvm_protected_regs)[i].nr_pages =
+			PFN_DOWN(min_t(u64, resource_size(&res), PAGE_ALIGN_DOWN(GITS_TRANSLATER)));
+
+		i++;
+	}
+
+	kvm_nvhe_sym(num_protected_reg) = i;
+	return 0;
+out_fail:
+	of_node_put(np);
+	return ret;
+}
+
 void __init kvm_hyp_reserve(void)
 {
 	u64 hyp_mem_pages = 0;
@@ -57,6 +103,12 @@ void __init kvm_hyp_reserve(void)
 		return;
 	}
 
+	ret = register_its_emulated_region();
+	if (ret) {
+		kvm_err("Failed to register ITS region %d\n", ret);
+		return;
+	}
+
 	hyp_mem_pages += hyp_s1_pgtable_pages();
 	hyp_mem_pages += host_s2_pgtable_pages();
 	hyp_mem_pages += hyp_vm_table_pages();
-- 
2.55.0.654.g21b8a5bc05-goog


