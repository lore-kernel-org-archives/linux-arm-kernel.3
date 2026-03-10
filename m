Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A14AFD2D70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 12:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6n5Y9iqY7rq1n5Q/lgdkU3SuBp6Rv+RQlbX0vgQT/A=; b=qgCN9lKQ+uvSpvPPbqc+j+GKYh
	C4eMIXzhLaXkrQ6imQlieLdT52lECrCzzq7rr3xpzbxNMFiofqQvukqKwQSmPxxx+sNmFAOv4KN+4
	ontw82hefOoG5REgmoKVeRa3zyXe35tlXE3jhJmq2Mh66zR7QbmvmT9Yx1buS0esgj3pUB2Ns6Z0K
	/spvzbDA7dpzop8KNRi5Kz/SklFXbzMAHa+h9iEtj0VwWrTOlPSRLaOFiTvS0yqmbfdyAXTPzsZWN
	yIJsnAky+BTF8cZ2j3Db7VFqk7nLWmZYi2ntEzynUgVUvFvLILunfnbhQ6YYudtwW+uhawLOtDSEV
	QDEwhhMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwX5-00000009W8K-0wW1;
	Tue, 10 Mar 2026 12:49:55 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwWy-00000009W3c-2zBU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 12:49:49 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4853ab1cae0so20355025e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 05:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773146987; x=1773751787; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=l6n5Y9iqY7rq1n5Q/lgdkU3SuBp6Rv+RQlbX0vgQT/A=;
        b=A2JJvcEF5wB1q8SAOfpfbtpwfQhfRbK0VZQlLr9QC1QSjQsdxFOBzWqChjWliLO8eE
         7N+AR9CoypiTQxA0UrBCK2bYxfHLv0GswcHbyjablVXUFSXTcSnmk7stdxc5mSZui2n9
         /9Q7IQCzjUtg+uowtxwO9zQe0pIvCjwutYG5mvEIJGZd1bjsR+vmc7BikcjqBGbIrS0t
         S+lts59ReiFemeNjTqtMuo20Y0TKEBvUslc2/UmHFaJ3JL8jjFhK8VxS24JylstK46MW
         8BYJxY6dkCgluT+xcsm3HBBzbIzDBfKj67bmgzBKUtxsEOPr65KhWSMvjK9dcLg89nWy
         D7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773146987; x=1773751787;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l6n5Y9iqY7rq1n5Q/lgdkU3SuBp6Rv+RQlbX0vgQT/A=;
        b=hUY9NyeoPQdzpvEerHddk6vP2XDk3xSZdhIGvDLsZxiw0uk6917KmKn1NiPvM7/47q
         taObbzqiiQ02Yga+GEALYa5txEYETvkNcc0CPYMgHV8nCdS0nFJSg+ChD5R4zAoqQZ8r
         npGqQ7u1AHusSZe0d6qvrgLYeP8mvFgw6wefN+OIeCoGatU4eeFu1rwAFSlEmXiGajgy
         uPHhfc1N2mSvM3+DTPiy32cJo1zgE08Glo9i96df7p/oIzKREQMls9Lac4MBlq2AG/uz
         eizIOa7PgPcQpRLFwQiPCqsj5WeYrNwCAvwK7liW71VeW5+1R68yWQGPTfuGjjLFZKGZ
         TQdg==
X-Forwarded-Encrypted: i=1; AJvYcCXpQ6UcEllLa42TJxUDprnx8ZSOnrjNSEmKZqq6tdMk9e0dynYB4fWYMILgRbvJuvViolses2JL3rQUurBo2oQF@lists.infradead.org
X-Gm-Message-State: AOJu0YxN2K8qnqw5XjRjx4vWd8y55fMe6hGobVOOXeP7qDMM6CbH/7IW
	PyQxH7/oo0Mbhsq6zX5YD64nOW8PqBl2YhneIODwi3fHnaqJ6sTLlnUUqKUPLqyMBa3mVszvTML
	DNHrQKrlrszEcoIggPWvu5RhUlYv/dg==
X-Received: from wmby21.prod.google.com ([2002:a05:600c:c055:b0:485:343f:9fb3])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:138a:b0:477:7ae0:cd6e with SMTP id 5b1f17b1804b1-485269196ffmr271672925e9.5.1773146986648;
 Tue, 10 Mar 2026 05:49:46 -0700 (PDT)
Date: Tue, 10 Mar 2026 12:49:23 +0000
In-Reply-To: <20260310124933.830025-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260310124933.830025-1-sebastianene@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260310124933.830025-5-sebastianene@google.com>
Subject: [PATCH 04/14] KVM: arm64: Mediate host access to GIC/ITS MMIO via unmapping
From: Sebastian Ene <sebastianene@google.com>
To: alexandru.elisei@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com
Cc: catalin.marinas@arm.com, dbrazdil@google.com, joey.gouly@arm.com, 
	kees@kernel.org, mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, 
	perlarsen@google.com, qperret@google.com, rananta@google.com, 
	sebastianene@google.com, smostafa@google.com, suzuki.poulose@arm.com, 
	tabba@google.com, tglx@kernel.org, vdonnefort@google.com, bgrzesik@google.com, 
	will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_054948_802075_0BB1363A 
X-CRM114-Status: GOOD (  22.10  )
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

Unmap the ITS MMIO region from the host address space to enforce
hypervisor mediation.
Identify the ITS base address from the device tree and store it in a
protected region. A callback is registered to handle host accesses to
this region; currently, the handler simply forwards all MMIO requests
to the physical hardware. This provides the infrastructure for future
hardware state validation without changing current behavior.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/include/asm/kvm_pkvm.h     |  2 ++
 arch/arm64/kvm/hyp/nvhe/Makefile      |  3 ++-
 arch/arm64/kvm/hyp/nvhe/its_emulate.c | 23 ++++++++++++++++
 arch/arm64/kvm/pkvm.c                 | 38 +++++++++++++++++++++++++++
 4 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/kvm/hyp/nvhe/its_emulate.c

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 5321ced2f50a..ef00c1bf7d00 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -32,6 +32,8 @@ struct pkvm_protected_reg {
 
 extern struct pkvm_protected_reg kvm_nvhe_sym(pkvm_protected_regs)[];
 extern unsigned int kvm_nvhe_sym(num_protected_reg);
+extern void kvm_nvhe_sym(pkvm_handle_forward_req)(struct pkvm_protected_reg *region, u64 offset,
+						  bool write, u64 *reg, u8 reg_size);
 
 int pkvm_init_host_vm(struct kvm *kvm);
 int pkvm_create_hyp_vm(struct kvm *kvm);
diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index a244ec25f8c5..eb43269fbac2 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -24,7 +24,8 @@ CFLAGS_switch.nvhe.o += -Wno-override-init
 
 hyp-obj-y := timer-sr.o sysreg-sr.o debug-sr.o switch.o tlb.o hyp-init.o host.o \
 	 hyp-main.o hyp-smp.o psci-relay.o early_alloc.o page_alloc.o \
-	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o
+	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o \
+	 its_emulate.o
 hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
 	 ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o
 hyp-obj-y += ../../../kernel/smccc-call.o
diff --git a/arch/arm64/kvm/hyp/nvhe/its_emulate.c b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
new file mode 100644
index 000000000000..0eecbb011898
--- /dev/null
+++ b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <asm/kvm_pkvm.h>
+#include <nvhe/mem_protect.h>
+
+
+void pkvm_handle_forward_req(struct pkvm_protected_reg *region, u64 offset, bool write,
+			     u64 *reg, u8 reg_size)
+{
+	void __iomem *addr = __hyp_va((region->start_pfn << PAGE_SHIFT) + offset);
+
+	if (reg_size == sizeof(u32)) {
+		if (!write)
+			*reg = readl_relaxed(addr);
+		else
+			writel_relaxed(*reg, addr);
+	} else if (reg_size == sizeof(u64)) {
+		if (!write)
+			*reg = readq_relaxed(addr);
+		else
+			writeq_relaxed(*reg, addr);
+	}
+}
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index d7a0f69a9982..a766be6de735 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -11,6 +11,9 @@
 #include <asm/kvm_mmu.h>
 #include <linux/memblock.h>
 #include <linux/mutex.h>
+#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
 
 #include <asm/kvm_pkvm.h>
 
@@ -18,6 +21,7 @@
 
 DEFINE_STATIC_KEY_FALSE(kvm_protected_mode_initialized);
 
+static struct pkvm_protected_reg *pkvm_protected_regs = kvm_nvhe_sym(pkvm_protected_regs);
 static struct memblock_region *hyp_memory = kvm_nvhe_sym(hyp_memory);
 static unsigned int *hyp_memblock_nr_ptr = &kvm_nvhe_sym(hyp_memblock_nr);
 
@@ -39,6 +43,34 @@ static int __init register_memblock_regions(void)
 	return 0;
 }
 
+static int __init register_protected_regions(void)
+{
+	int i = 0, ret;
+	struct device_node *np;
+	struct resource res;
+
+	for_each_compatible_node(np, NULL, "arm,gic-v3-its") {
+		ret = of_address_to_resource(np, i, &res);
+		if (ret)
+			return ret;
+
+		if (i >= PKVM_PROTECTED_REGS_NUM)
+			return -ENOMEM;
+
+		if (!PAGE_ALIGNED(res.start) || !PAGE_ALIGNED(resource_size(&res)))
+			return -EINVAL;
+
+		pkvm_protected_regs[i].start_pfn = res.start >> PAGE_SHIFT;
+		pkvm_protected_regs[i].num_pages = resource_size(&res) >> PAGE_SHIFT;
+		pkvm_protected_regs[i].cb = lm_alias(&kvm_nvhe_sym(pkvm_handle_forward_req));
+		i++;
+	}
+
+	kvm_nvhe_sym(num_protected_reg) = i;
+
+	return 0;
+}
+
 void __init kvm_hyp_reserve(void)
 {
 	u64 hyp_mem_pages = 0;
@@ -57,6 +89,12 @@ void __init kvm_hyp_reserve(void)
 		return;
 	}
 
+	ret = register_protected_regions();
+	if (ret) {
+		kvm_err("Failed to register protected reg: %d\n", ret);
+		return;
+	}
+
 	hyp_mem_pages += hyp_s1_pgtable_pages();
 	hyp_mem_pages += host_s2_pgtable_pages();
 	hyp_mem_pages += hyp_vm_table_pages();
-- 
2.53.0.473.g4a7958ca14-goog


