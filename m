Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFFDCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQ2yLptW2zGeWEvR1p+2JXGqe+EpbEyMP3t7Yk27cmE=; b=oiJKx93OaDruhZ7SH0Kqm8tbde
	uo1f/CsuyUxCETPWfJCQ3TVuevjpkvF6S+gfb87kxq8iC+Ip+RiwX5/qK8Tgil8H+A1EYV2bTnpIj
	7Jq1lnvpuS2f2vY1b0OC75ZF2P8psLfvz+H1r/eI38dlLdIV+eUMZCmceCZxE6aviNVZMu4Bcx414
	ROpgRV9LvzalupgsWhFLjB7vAeDmFO6SNP6yK30gwISIeVcJafUpJ0VbGAh38iP8OwKqZvxh0qKrf
	D8W435Ar6e+wWTkNvhTHrNL/BRmH5Q2Jf0bLlIuzsVxB1cNp9AD6VUPUAt/ufLOdAd2tjp3lqK0C1
	SF0zTf4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9Uy-00000002fN3-1V4j;
	Wed, 13 May 2026 13:19:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9Uk-00000002f2W-0kte
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 May 2026 13:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=lQ2yLptW2zGeWEvR1p+2JXGqe+EpbEyMP3t7Yk27cmE=; b=HIhI5TUA4pA7h71xQiF2YIbRKo
	buTj7HqySnrfAc0X9+7q9ZLbCwJy0+jtk+jruf4kIFSoftAU7QoZ7B4GCE3ka0Lv9J7eLK0VuWnTZ
	pFUjHPNM8MZZ9W5u76B6fjb030M9v9NYJ+oKCrRaGMaemNxsh9Nu2rpr+/CCGxu0UhTt9vE6iF7q6
	uM8XWLRbUqe3WcXV70trB7vwyv7s32JrCSX4xds5/phxVhpoHwbbazVot3Ytc46A8m5fkKvvLNO6j
	TEia4lndM82LC/17rntnWwMFRre2EvpXtV8F0J6j8TpRsb99ND9Mk5Sha7I/Y1GDgnN4iQQ1d727A
	wAR852zw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9Ug-0000000HZ4I-140c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:19:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06D7A2403;
	Wed, 13 May 2026 06:19:16 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.68.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A6333F836;
	Wed, 13 May 2026 06:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778678361; bh=ln64F1hLLRYARnpXaTByx+3uUv5w5vovu0mG8WoHuw0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mY4efkr0CH+hx/SDNBHeU1XtXYdAvX2fvkN6fWbOsZjYoBzzpcPgAlbLQy3gDbyfg
	 NwZ3uY+CrxrnG/M0I7r0SlgfYM3qfHK2fvUpbtL0tXsiGwCCkkBTq4vVcjFCP8y8NL
	 fDR7jEW5hlgQaQi6WLRaGNJbD7oI3uSWle51NiF4=
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>,
	WeiLin.Chang@arm.com,
	Lorenzo.Pieralisi2@arm.com
Subject: [PATCH v14 11/44] arm64: RMI: Check for RMI support at KVM init
Date: Wed, 13 May 2026 14:17:19 +0100
Message-ID: <20260513131757.116630-12-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513131757.116630-1-steven.price@arm.com>
References: <20260513131757.116630-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_141922_923275_E1AAB270 
X-CRM114-Status: GOOD (  21.77  )
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

Check if the RMI support is sufficient for using in KVM. Specifically we
currently only support KVM in VHE mode when for creating realm VMs.

Signed-off-by: Steven Price <steven.price@arm.com>
---
Changes since v13:
 * Most of the init has been moved out of the 'kvm' directory so this is
   much more basic now.
Changes since v12:
 * Drop check for 4k page size.
Changes since v11:
 * Reword slightly the comments on the realm states.
Changes since v10:
 * kvm_is_realm() no longer has a NULL check.
 * Rename from "rme" to "rmi" when referring to the RMM interface.
 * Check for RME (hardware) support before probing for RMI support.
Changes since v8:
 * No need to guard kvm_init_rme() behind 'in_hyp_mode'.
Changes since v6:
 * Improved message for an unsupported RMI ABI version.
Changes since v5:
 * Reword "unsupported" message from "host supports" to "we want" to
   clarify that 'we' are the 'host'.
Changes since v2:
 * Drop return value from kvm_init_rme(), it was always 0.
 * Rely on the RMM return value to identify whether the RSI ABI is
   compatible.
---
 arch/arm64/include/asm/kvm_host.h |  4 ++++
 arch/arm64/include/asm/kvm_rmi.h  | 17 +++++++++++++++++
 arch/arm64/include/asm/virt.h     |  1 +
 arch/arm64/kvm/Makefile           |  2 +-
 arch/arm64/kvm/arm.c              |  5 +++++
 arch/arm64/kvm/rmi.c              | 24 ++++++++++++++++++++++++
 6 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/include/asm/kvm_rmi.h
 create mode 100644 arch/arm64/kvm/rmi.c

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 851f6171751c..3512696ed506 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -27,6 +27,7 @@
 #include <asm/fpsimd.h>
 #include <asm/kvm.h>
 #include <asm/kvm_asm.h>
+#include <asm/kvm_rmi.h>
 #include <asm/vncr_mapping.h>
 
 #define __KVM_HAVE_ARCH_INTC_INITIALIZED
@@ -424,6 +425,9 @@ struct kvm_arch {
 	/* Nested virtualization info */
 	struct dentry *debugfs_nv_dentry;
 #endif
+
+	bool is_realm;
+	struct realm realm;
 };
 
 struct kvm_vcpu_fault_info {
diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
new file mode 100644
index 000000000000..4936007947fd
--- /dev/null
+++ b/arch/arm64/include/asm/kvm_rmi.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023-2025 ARM Ltd.
+ */
+
+#ifndef __ASM_KVM_RMI_H
+#define __ASM_KVM_RMI_H
+
+/**
+ * struct realm - Additional per VM data for a Realm
+ */
+struct realm {
+};
+
+void kvm_init_rmi(void);
+
+#endif /* __ASM_KVM_RMI_H */
diff --git a/arch/arm64/include/asm/virt.h b/arch/arm64/include/asm/virt.h
index b546703c3ab9..92cec42952f4 100644
--- a/arch/arm64/include/asm/virt.h
+++ b/arch/arm64/include/asm/virt.h
@@ -87,6 +87,7 @@ void __hyp_reset_vectors(void);
 bool is_kvm_arm_initialised(void);
 
 DECLARE_STATIC_KEY_FALSE(kvm_protected_mode_initialized);
+DECLARE_STATIC_KEY_FALSE(kvm_rmi_is_available);
 
 static inline bool is_pkvm_initialized(void)
 {
diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 59612d2f277c..ed3cf30eb06e 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -16,7 +16,7 @@ CFLAGS_handle_exit.o += -Wno-override-init
 kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
 	 inject_fault.o va_layout.o handle_exit.o config.o \
 	 guest.o debug.o reset.o sys_regs.o stacktrace.o \
-	 vgic-sys-reg-v3.o fpsimd.o pkvm.o \
+	 vgic-sys-reg-v3.o fpsimd.o pkvm.o rmi.o \
 	 arch_timer.o trng.o vmid.o emulate-nested.o nested.o at.o \
 	 vgic/vgic.o vgic/vgic-init.o \
 	 vgic/vgic-irqfd.o vgic/vgic-v2.o \
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 176cbe8baad3..247e03b33035 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -41,6 +41,7 @@
 #include <asm/kvm_nested.h>
 #include <asm/kvm_pkvm.h>
 #include <asm/kvm_ptrauth.h>
+#include <asm/kvm_rmi.h>
 #include <asm/sections.h>
 #include <asm/stacktrace/nvhe.h>
 
@@ -109,6 +110,8 @@ long kvm_get_cap_for_kvm_ioctl(unsigned int ioctl, long *ext)
 	return -EINVAL;
 }
 
+DEFINE_STATIC_KEY_FALSE(kvm_rmi_is_available);
+
 DECLARE_KVM_HYP_PER_CPU(unsigned long, kvm_hyp_vector);
 
 DEFINE_PER_CPU(unsigned long, kvm_arm_hyp_stack_base);
@@ -2975,6 +2978,8 @@ static __init int kvm_arm_init(void)
 
 	in_hyp_mode = is_kernel_in_hyp_mode();
 
+	kvm_init_rmi();
+
 	if (cpus_have_final_cap(ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE) ||
 	    cpus_have_final_cap(ARM64_WORKAROUND_1508412))
 		kvm_info("Guests without required CPU erratum workarounds can deadlock system!\n" \
diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
new file mode 100644
index 000000000000..1acc972a4b92
--- /dev/null
+++ b/arch/arm64/kvm/rmi.c
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023-2025 ARM Ltd.
+ */
+
+#include <linux/kvm_host.h>
+
+#include <asm/rmi_cmds.h>
+#include <asm/virt.h>
+
+void kvm_init_rmi(void)
+{
+	/*
+	 * TODO: Support Realm guests in nVHE mode, this will require adding
+	 * EL2 stub(s) for REC entry and possibly other things.
+	 */
+	if (!is_kernel_in_hyp_mode())
+		return;
+
+	if (!rmi_is_available())
+		return;
+
+	/* Future patch will enable static branch kvm_rmi_is_available */
+}
-- 
2.43.0


