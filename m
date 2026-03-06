Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC534FCB600
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xnACahr8ULD6CcAQo9gjmAw66hUMbPmLgQ2wO/RqDz0=; b=H9Eh4lZwLag04PtWXqL6v2ths6
	+dzQt5UCqAG4RE90MhOnvfhW5DxZd2J79yrs8brksIM5iS+jxoJxcvDChxdQVia2UN22o8Aj2eVKx
	mIWczwDte3doJaVAfbLfhlp4TZgCxuOhgF7OtNN1IrKmBLZ3Xozo8P8l0dd4FchfuWhT2p1LwuiLv
	yCNLrN4a2iX6EexK++ZArdHyk+UVgByZX90jPfFLnPnijXFRo1qlBYsmDUMAtRK7cPaYMUuJ9Tp6P
	eprabQmC3TuXSCNTuewCTK9uWk7+Y3NBG5zljMoLq24/1Ij/KbBqSdKQnrg2VE8Oe6fQDvnB4nMkd
	lL22rRzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWIH-00000003vpd-2Ox3;
	Fri, 06 Mar 2026 14:36:45 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWHn-00000003vD7-4C2z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:36:17 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-661ad73d41eso1295090a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772807773; x=1773412573; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xnACahr8ULD6CcAQo9gjmAw66hUMbPmLgQ2wO/RqDz0=;
        b=M3uPcHEtVDb4sxYY8oi/bXMqLGxsxk2dFg+jtkFsuqwqV8XdemNqooJlveKq0ZeyOW
         bwl0UyZivMPCAKsr5Y9Zx0OGkI1oB2QG4UQtklM+UszdFvfKn99Fs4K0DOUfA9DJKynI
         0O3m6uF90wUGl4O7KTAwEOk4bk7m6Ac2S61nFoBRd1p9RbkCIXnm3UMtYqlKow+gUquZ
         llxmIHd4l58JpgaRyIQ1n3sH8z+NoRPWQJBm6Qq2o4ocvFlzRR6ZK52gmsjzZatfCvkE
         kIft7JCjdEW17LzyRT238WMeuHAxGWw0RXyAulvnuAmdZ+OkL2PZagfvPlszX0RViLis
         4T4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772807773; x=1773412573;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xnACahr8ULD6CcAQo9gjmAw66hUMbPmLgQ2wO/RqDz0=;
        b=LBSBnofo0DelD2JPapMiiTl6AgCeJU1/Ge7TOwJVzOTVgydsiFHcL3HY7F4u4TmmOM
         AB4keC0cIPzc94ITED3nkVcUoeiUA2s2xVIBhnpa+H0dgDlC3UWmp+mv8rLMinsQTyEL
         zZqWoSH+Sagdl6Ztydt3lfWDVVfnGMQ1qptOyZCeIsdBFIFaB6O6CNQqSqs6rf8bVAgn
         /yulZTb+KoHaQtJlJipQs3cLhxbXSELdgKUNQ9RJ1fGBISMdkH/8n4f6OMXOaVWlzhvF
         ydglkBrYc2yOmEtFSq1pY7WQUFcGHyJr99nJioF6TmxmVKwXIaXo0ErCFx1q0K6Tb6Vr
         MZrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuPLSLgbKK14+bIcGDD9x7IoLaq7/B0US81EQ+xUQPq3+ReE2JX76YE4xFhap1jAXC+e111QmsXhLrLd6RydEP@lists.infradead.org
X-Gm-Message-State: AOJu0YyN20hi4osFiO1nQ0fZhMZ/cVgAolkRMc6n4oXqHV+L7oZWhJkt
	mASS8RE55aciEIxrL6AADWvtV0sXGV+fl6ldZYDDvsfdnZntMssmilxFMi5KMq6nb1sj3eRfncu
	X2uhHVBIioqTYF8dh/dmjnw==
X-Received: from edrs15.prod.google.com ([2002:aa7:c54f:0:b0:660:a4e3:2ed2])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:430c:b0:65a:2ec5:99c0 with SMTP id 4fb4d7f45d1cf-6619d4565b4mr1408474a12.3.1772807772463;
 Fri, 06 Mar 2026 06:36:12 -0800 (PST)
Date: Fri,  6 Mar 2026 14:35:24 +0000
In-Reply-To: <20260306143536.339777-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260306143536.339777-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306143536.339777-21-vdonnefort@google.com>
Subject: [PATCH v13 20/32] KVM: arm64: Add clock support to nVHE/pKVM hyp
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
X-CRM114-CacheID: sfid-20260306_063616_100040_1ACEA71C 
X-CRM114-Status: GOOD (  14.78  )
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
2.53.0.473.g4a7958ca14-goog


