Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DE0E9A04A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 15:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+WeYCHm29WX1Oz+Ipz9cvL1JwZd5S77G6D55KrRRUU=; b=VDOv1p8XzFlh8OKLSiuzLlTq+k
	seSjWa5LxIkVi9pD/mTdqyYerVE6CTDUY8pHZmePJETGMOYGOnHxXl/nfscbdg0Hms6Hpy33gfDQS
	6NMbYTVxxidTLiV1abVo8cyu41UIU8vHRSWxWRTuP7Tb2nAtZgeaiJD+HGuPfP/lJUpTQlg2mOzDQ
	hIoPzE4Y6qU3Ih2VrlS/PbNw0ggx/qjUzZzm9eR+rzL0r/habAyp6zfMgXnBleVFx/hIyLQ7pplHY
	NfjmVL0ApZ5NH00gE5Nhlp26pFbxu+oeAgUQ4/i93IaDuqEIG6phvSh3CF7dnAp4ifcNBNlz/dEHU
	ZTjKAnEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5Zc-0000000BVW7-1QBL;
	Thu, 19 Feb 2026 15:04:12 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5ZF-0000000BV3F-3Cn0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 15:03:57 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4837b6f6b93so8945405e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 07:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771513427; x=1772118227; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4+WeYCHm29WX1Oz+Ipz9cvL1JwZd5S77G6D55KrRRUU=;
        b=le+lD+UJKnOGIrvfTgSRx5wmxPw8KMk6apRxj4j5GT4hIavEF03mNaOxKmQKo7Vp5z
         R51ymHXTB57xty6VyRGXXSq3pAOl+XQb4B5IP9oXdpEptoBDmBjcq74+OYSHOciafs4p
         Iq7tiZoh+eMfHF/WMLNe8c9T2j2yzEJIt+iFJ52r8mCHEwfD8vxGKchJkqFgNQpPTiuh
         DsXhL9PcHOMbny/Pu+J6kwam0GRm9BB/k/lB7A7fDXX4RGPQB7ltP5NMDvFv0zEI5olW
         LO02ViMctlaQW+gCfCsnwFcp2rs1Hqvd8kmib5cvicNz68ngLfi4OrtXOeuGigDzqtWe
         NbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771513427; x=1772118227;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+WeYCHm29WX1Oz+Ipz9cvL1JwZd5S77G6D55KrRRUU=;
        b=vXiV7A4dMncIk6Csy4JU2VjfeKcm96hzvmA+PYUHkyXMUJl5BRMdZfAHsOMg0ibMOD
         YRgpOKc29iSP5I0zjAnNpQxqhoAN5l8aDjFSL0bxyiD7+ddLYsP1D+bmHmJcEbl3Oqe3
         Ck5c53k/tn17X2h2TkicqIT/G+Bz/QGYzffE9NW9RqG0iRUTq90tt+P1MgZPl+tF1Lwb
         hN6aVXCrK4ij1K664Cpfdiwf3n932Ig/sM1Fl9Fu8PPKsAtYrJkuKjnLRGxfTuu9YRPn
         m8XM0ZrI5LgNdr++b6eiMYKbwYMEiZOYlEKPHdGT5GsnyZUMe0dbDSYptZVcA699WUc+
         aHqw==
X-Forwarded-Encrypted: i=1; AJvYcCWcLv+k0ghoCKzygV+YADe4ClZLqMdMuR8LuSCrQwkopDs/vYhpbH3aFq/y62RZ0TvZ/Qh7+CkmjTN6nWzGKeg+@lists.infradead.org
X-Gm-Message-State: AOJu0YwQCyKNwUlHc0wHXZe9LTD1G2uwt9M5PfpO0ebryVtGaCE/QAh3
	Mi843ktTZysJ1WAkHAlaEp3bYI/OHaghnIgJweSSgJYkXkfMLYgIwmL1VkwQjMuFE8hOltRdwhq
	CfreGClk4tEOfp/Elg07fKw==
X-Received: from wmep7.prod.google.com ([2002:a05:600c:4307:b0:47f:941a:613d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e8f:b0:45c:4470:271c with SMTP id 5b1f17b1804b1-4838f15c50dmr167483695e9.18.1771513426701;
 Thu, 19 Feb 2026 07:03:46 -0800 (PST)
Date: Thu, 19 Feb 2026 15:02:57 +0000
In-Reply-To: <20260219150307.14538-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260219150307.14538-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
Message-ID: <20260219150307.14538-21-vdonnefort@google.com>
Subject: [PATCH v12 20/30] KVM: arm64: Add clock support to nVHE/pKVM hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	aneesh.kumar@kernel.org, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_070350_026150_8550731D 
X-CRM114-Status: GOOD (  15.20  )
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

In preparation for supporting tracing from the nVHE hyp, add support to
generate timestamps with a clock fed by the CNTCVT counter. The clock
can be kept in sync with the kernel's by updating the slope values. This
will be done later.

As current we do only create a trace clock, make the whole support
dependent on the upcoming CONFIG_NVHE_EL2_TRACING.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/clock.h b/arch/arm64/kvm/hyp/include/nvhe/clock.h
new file mode 100644
index 000000000000..9f429f5c0664
--- /dev/null
+++ b/arch/arm64/kvm/hyp/include/nvhe/clock.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ARM64_KVM_HYP_NVHE_CLOCK_H
+#define __ARM64_KVM_HYP_NVHE_CLOCK_H
+#include <linux/types.h>
+
+#include <asm/kvm_hyp.h>
+
+#ifdef CONFIG_NVHE_EL2_TRACING
+void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
+u64 trace_clock(void);
+#else
+static inline void
+trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc) { }
+static inline u64 trace_clock(void) { return 0; }
+#endif
+#endif
diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index a244ec25f8c5..8dc95257c291 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -17,7 +17,7 @@ ccflags-y += -fno-stack-protector	\
 hostprogs := gen-hyprel
 HOST_EXTRACFLAGS += -I$(objtree)/include
 
-lib-objs := clear_page.o copy_page.o memcpy.o memset.o
+lib-objs := clear_page.o copy_page.o memcpy.o memset.o tishift.o
 lib-objs := $(addprefix ../../../lib/, $(lib-objs))
 
 CFLAGS_switch.nvhe.o += -Wno-override-init
@@ -29,6 +29,7 @@ hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
 	 ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o
 hyp-obj-y += ../../../kernel/smccc-call.o
 hyp-obj-$(CONFIG_LIST_HARDENED) += list_debug.o
+hyp-obj-$(CONFIG_NVHE_EL2_TRACING) += clock.o
 hyp-obj-y += $(lib-objs)
 
 ##
diff --git a/arch/arm64/kvm/hyp/nvhe/clock.c b/arch/arm64/kvm/hyp/nvhe/clock.c
new file mode 100644
index 000000000000..32fc4313fe43
--- /dev/null
+++ b/arch/arm64/kvm/hyp/nvhe/clock.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Google LLC
+ * Author: Vincent Donnefort <vdonnefort@google.com>
+ */
+
+#include <nvhe/clock.h>
+
+#include <asm/arch_timer.h>
+#include <asm/div64.h>
+
+static struct clock_data {
+	struct {
+		u32 mult;
+		u32 shift;
+		u64 epoch_ns;
+		u64 epoch_cyc;
+		u64 cyc_overflow64;
+	} data[2];
+	u64 cur;
+} trace_clock_data;
+
+static u64 __clock_mult_uint128(u64 cyc, u32 mult, u32 shift)
+{
+	__uint128_t ns = (__uint128_t)cyc * mult;
+
+	ns >>= shift;
+
+	return (u64)ns;
+}
+
+/* Does not guarantee no reader on the modified bank. */
+void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
+{
+	struct clock_data *clock = &trace_clock_data;
+	u64 bank = clock->cur ^ 1;
+
+	clock->data[bank].mult			= mult;
+	clock->data[bank].shift			= shift;
+	clock->data[bank].epoch_ns		= epoch_ns;
+	clock->data[bank].epoch_cyc		= epoch_cyc;
+	clock->data[bank].cyc_overflow64	= ULONG_MAX / mult;
+
+	smp_store_release(&clock->cur, bank);
+}
+
+/* Use untrusted host data */
+u64 trace_clock(void)
+{
+	struct clock_data *clock = &trace_clock_data;
+	u64 bank = smp_load_acquire(&clock->cur);
+	u64 cyc, ns;
+
+	cyc = __arch_counter_get_cntvct() - clock->data[bank].epoch_cyc;
+
+	if (likely(cyc < clock->data[bank].cyc_overflow64)) {
+		ns = cyc * clock->data[bank].mult;
+		ns >>= clock->data[bank].shift;
+	} else {
+		ns = __clock_mult_uint128(cyc, clock->data[bank].mult,
+					  clock->data[bank].shift);
+	}
+
+	return (u64)ns + clock->data[bank].epoch_ns;
+}
-- 
2.53.0.335.g19a08e0c02-goog


