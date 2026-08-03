Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF05C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 12:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8449deZzWWvUrdWZNQWJEv7MjXt9tctoupcrsbbFYlI=; b=dbi1G0UWj05emwipVJUdc7NWw5
	A3J1goSI325YKfHb3Nj5tgRe5kUQRms4uEi5AdyAjyWnTDfGHD4Kh/Y/wWv8EW3D29mD+A1WsTAQc
	Zfk95F2xwvmFJAVcRLn+cQ7anhJB+hEV27oxewRZ+5ZYZ4UGa8nZgYwkNWMn5g8SyYRdb1HmU3V3v
	0o6HQiI0F4jENKXwwfYwArQVBiV3JeT9wjGsr0h5drh2yK2ZVsbrv5k2dkPF8mxG2glOjY3Ezmd61
	NcT70kv1uwIwP1b1xdiaFKVnZ9qqXRVVvQLCHQIPmMoyVKtF0DAVxDpiuk2HZ/TxLaxwUNW2zPGPJ
	JFmNNgrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqs0k-0000000H3o6-0jQn;
	Mon, 03 Aug 2026 12:43:18 +0000
Received: from out-172.mta0.migadu.com ([91.218.175.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqs0h-0000000H3kT-1Qmh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 12:43:17 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785760991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8449deZzWWvUrdWZNQWJEv7MjXt9tctoupcrsbbFYlI=;
	b=kufom7Wk8zNEVBVOzbGv1Z3IbOdydRL/B50xpDo4j7BXJ6jsRykAkla61jiFncEILCNIFH
	oalM5q86jzwRveN5eXew/rclc7LztYxRVyKkEYmRsUcIe5t4Um00vkQMoDQceMrDjgdecU
	QFv1lI/Vy0ofOl1+WMbe+g0rjJprSF0=
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	alexandru.elisei@arm.com,
	vdonnefort@google.com,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	qperret@google.com,
	ardb@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	tabba@google.com,
	fuad.tabba@linux.dev
Subject: [PATCH v2 08/11] KVM: arm64: Move the host hypercall interface to its own header
Date: Mon,  3 Aug 2026 13:42:17 +0100
Message-Id: <20260803124220.332248-9-fuad.tabba@linux.dev>
In-Reply-To: <20260803124220.332248-1-fuad.tabba@linux.dev>
References: <20260803124220.332248-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_054315_675093_54FBA310 
X-CRM114-Status: GOOD (  19.13  )
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

Move the kvm_call_hyp() dispatch macros and pkvm_handle_t out of
kvm_host.h into a new kvm_hcall.h, giving the host<->hyp hypercall
interface a single home that subsequent patches build on to restore
type-checking across the boundary. The only adjustment to the moved
code is the checkpatch-mandated space in "while (0)".

No functional change intended.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_hcall.h | 68 ++++++++++++++++++++++++++++++
 arch/arm64/include/asm/kvm_host.h  | 48 +--------------------
 2 files changed, 69 insertions(+), 47 deletions(-)
 create mode 100644 arch/arm64/include/asm/kvm_hcall.h

diff --git a/arch/arm64/include/asm/kvm_hcall.h b/arch/arm64/include/asm/kvm_hcall.h
new file mode 100644
index 0000000000000..d925b2c28a3d8
--- /dev/null
+++ b/arch/arm64/include/asm/kvm_hcall.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * The host<->hyp hypercall interface.
+ *
+ * Copyright (C) 2026 Google LLC
+ * Author: Fuad Tabba <fuad.tabba@linux.dev>
+ */
+
+#ifndef __ARM64_KVM_HCALL_H__
+#define __ARM64_KVM_HCALL_H__
+
+#include <linux/arm-smccc.h>
+#include <linux/bug.h>
+#include <linux/errno.h>
+#include <linux/types.h>
+
+#include <asm/barrier.h>
+#include <asm/kvm_asm.h>
+#include <asm/virt.h>
+
+typedef u16 pkvm_handle_t;
+
+#ifndef __KVM_NVHE_HYPERVISOR__
+#define kvm_call_hyp_nvhe(f, ...)					\
+	({								\
+		struct arm_smccc_res res;				\
+									\
+		arm_smccc_1_1_hvc(KVM_HOST_SMCCC_FUNC(f),		\
+				  ##__VA_ARGS__, &res);			\
+		if (WARN_ON(res.a0 != SMCCC_RET_SUCCESS))		\
+			res.a1 = -EOPNOTSUPP;				\
+									\
+		res.a1;							\
+	})
+
+/*
+ * The isb() below is there to guarantee the same behaviour on VHE as on !VHE,
+ * where the eret to EL1 acts as a context synchronization event.
+ */
+#define kvm_call_hyp(f, ...)						\
+	do {								\
+		if (has_vhe()) {					\
+			f(__VA_ARGS__);					\
+			isb();						\
+		} else {						\
+			kvm_call_hyp_nvhe(f, ##__VA_ARGS__);		\
+		}							\
+	} while (0)
+
+#define kvm_call_hyp_ret(f, ...)					\
+	({								\
+		typeof(f(__VA_ARGS__)) ret;				\
+									\
+		if (has_vhe()) {					\
+			ret = f(__VA_ARGS__);				\
+		} else {						\
+			ret = kvm_call_hyp_nvhe(f, ##__VA_ARGS__);	\
+		}							\
+									\
+		ret;							\
+	})
+#else /* __KVM_NVHE_HYPERVISOR__ */
+#define kvm_call_hyp(f, ...) f(__VA_ARGS__)
+#define kvm_call_hyp_ret(f, ...) f(__VA_ARGS__)
+#define kvm_call_hyp_nvhe(f, ...) f(__VA_ARGS__)
+#endif /* __KVM_NVHE_HYPERVISOR__ */
+
+#endif /* __ARM64_KVM_HCALL_H__ */
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index bae2c4f92ef5c..81d359ac7af14 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -27,6 +27,7 @@
 #include <asm/fpsimd.h>
 #include <asm/kvm.h>
 #include <asm/kvm_asm.h>
+#include <asm/kvm_hcall.h>
 #include <asm/vncr_mapping.h>
 
 #define __KVM_HAVE_ARCH_INTC_INITIALIZED
@@ -251,8 +252,6 @@ struct kvm_smccc_features {
 	unsigned long vendor_hyp_bmap_2; /* Function numbers 64-127 */
 };
 
-typedef u16 pkvm_handle_t;
-
 struct kvm_protected_vm {
 	pkvm_handle_t handle;
 	struct kvm_hyp_memcache teardown_mc;
@@ -1252,51 +1251,6 @@ void kvm_arm_resume_guest(struct kvm *kvm);
 
 #define vcpu_has_run_once(vcpu)	(!!READ_ONCE((vcpu)->pid))
 
-#ifndef __KVM_NVHE_HYPERVISOR__
-#define kvm_call_hyp_nvhe(f, ...)					\
-	({								\
-		struct arm_smccc_res res;				\
-									\
-		arm_smccc_1_1_hvc(KVM_HOST_SMCCC_FUNC(f),		\
-				  ##__VA_ARGS__, &res);			\
-		if (WARN_ON(res.a0 != SMCCC_RET_SUCCESS))		\
-			res.a1 = -EOPNOTSUPP;				\
-									\
-		res.a1;							\
-	})
-
-/*
- * The isb() below is there to guarantee the same behaviour on VHE as on !VHE,
- * where the eret to EL1 acts as a context synchronization event.
- */
-#define kvm_call_hyp(f, ...)						\
-	do {								\
-		if (has_vhe()) {					\
-			f(__VA_ARGS__);					\
-			isb();						\
-		} else {						\
-			kvm_call_hyp_nvhe(f, ##__VA_ARGS__);		\
-		}							\
-	} while(0)
-
-#define kvm_call_hyp_ret(f, ...)					\
-	({								\
-		typeof(f(__VA_ARGS__)) ret;				\
-									\
-		if (has_vhe()) {					\
-			ret = f(__VA_ARGS__);				\
-		} else {						\
-			ret = kvm_call_hyp_nvhe(f, ##__VA_ARGS__);	\
-		}							\
-									\
-		ret;							\
-	})
-#else /* __KVM_NVHE_HYPERVISOR__ */
-#define kvm_call_hyp(f, ...) f(__VA_ARGS__)
-#define kvm_call_hyp_ret(f, ...) f(__VA_ARGS__)
-#define kvm_call_hyp_nvhe(f, ...) f(__VA_ARGS__)
-#endif /* __KVM_NVHE_HYPERVISOR__ */
-
 int handle_exit(struct kvm_vcpu *vcpu, int exception_index);
 void handle_exit_early(struct kvm_vcpu *vcpu, int exception_index);
 
-- 
2.39.5


