Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F01DCFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NElJUUivXewr9qr1zG4n3pnbZgrgkOxER+Z6nnzxCU0=; b=kimeDGhQVok7fohQNbSK4vKT9d
	AhjIVUgj8ow1ApRcNSVAHpDXcw5JILEf60hqDy/dma/fc/LxUPoxMHYk25xT3GL94XheO+w79VI5v
	XcSLp11qZvAzTJDJMSg/Ir/a+Qg99IuJqLENodm33kzsae9nvW8dYfGmbzxeBvO6wY6+ci9C3NqoA
	/t05ys/zCclDvRfU/kRLaSyNlLEuIE5PQ2rNk+F54xpFlKd/KjYvJtdWBTQL31IHNQYlAsp9iKV3U
	CGmjm19A+TV42S7C5AM08vtOiuH+9RJ29jxpvLpexWWAWKzYuXMiYw4qs5mX5cwg8qzVxRJ+D3gW+
	kf1GE3sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMow-000000058mA-2Bxv;
	Tue, 02 Dec 2025 09:37:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMob-000000058Ky-138e
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 02 Dec 2025 09:36:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NElJUUivXewr9qr1zG4n3pnbZgrgkOxER+Z6nnzxCU0=; b=qvePvIaH0wKNgEDf+te1csbHk8
	hAm71AHqlLDvLntIZJXs5/akMTwlxJmEJXr3qGBvWBzUiVnw8FKQ9zLzpeAUb3P32F58XFhR1lMbc
	Ncw5LSpshTLvIaKwFuBuGMBv6ZV5AvgRyUSirkNdAXr0XQ3EkPbxJVhTTe+KBqSyLIOVEGLnW80fp
	sjhcWqt7Y3VqENMxFDqDbnmHpS2+ARZXV8gK0gP0a562r4F/ZgrHt1CAn9kKhPKCnLXyFVUe25+cu
	c/LwUAlktbBmCL27ncQCHO0mFduYorkgE+OTkOs7RIo13wHSqlr7D0RG2w2jwLE1v+TgAhBH75e2s
	g5sREtYQ==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLwy-0000000HaIe-426I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 08:41:35 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4779393221aso28968055e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 01:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764668211; x=1765273011; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NElJUUivXewr9qr1zG4n3pnbZgrgkOxER+Z6nnzxCU0=;
        b=zECRqOrzvoKzFVpJEQKAioJImanJtAC/e6QQDdN9ddcpwQOunyPrRjTKsqTaBQTmkI
         7pLZJnNt3NNw8A57AgmntIhzd0EZWRgYYiUkjeNbc4Ti7AiXdRrjSWVPaaxZ8HkEr0CV
         nZ82rwV3JJvo+0/2TL11KWDG9sVfD//rdy1q8SY2top8zB0mT01DnDpMr1D4WECCqQf0
         ae0HQOo2aHSgqnoKcZAgcXHw20XmMh0JzbAmiRHJp8mAwHQwKTs362loeLmN+MAqsa96
         OyLXQTLCkE+9iD8abDJ1Ly5FxWb7EgJSYCK9M8rYmncJym1IKmh3ZO2f4A5BdeiBfFl2
         Ww2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764668211; x=1765273011;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NElJUUivXewr9qr1zG4n3pnbZgrgkOxER+Z6nnzxCU0=;
        b=UfmbGkPhc2MGdX65CoUbtZra+lbOAeO31gPUpy6N+jzUboGmGeqAXPHrN9zALq8LJj
         CATN5Wk02Qf5Q3EiVYnV+SPJfdIt5pLBAvTg8Lq0RKqFKZ0E2grlAz/4NNxb1y0e7Dgp
         SjJpvCKgku27pYeWpjT4Nksa04Qn04+9aDebumu8GTm+I/6aWVWvbrAKL6a4ktH5/IK6
         uSSuBKk/XafRUn0sCmbDy2DyXRQPI2Ili2FSUb6i9+jte6J6bwuO3hqPG2MumwNPqk+s
         UIp2uAN2OfOfMU33Bih1YxgNDmxYNR4flZF4H97THmW9gnUtUuHn3hqxw2yHTw9h0+bb
         ToGA==
X-Forwarded-Encrypted: i=1; AJvYcCWmavt7OFjJeUHgs/PA4/2q73c/OgZxa8Pd/aIGu9x70r0ok8nh4w1KrIPsFFQaKwR56LfNXtX7DLkUfAodVg6z@lists.infradead.org
X-Gm-Message-State: AOJu0YxGYTxFofVkvVkwK3t6WEbdyHKdYLp7Zuag+qmgWrjSjr2z0EIc
	E0yqwenZqIBYqKA7+tY6BBlO2MTsUSXawossnIjMMsHBFvR0XJ33pkMR15QIRaEF5Q17Prv+FE5
	OKSYS4crQ4pZCEUl2x42Umw==
X-Google-Smtp-Source: AGHT+IGBBJ9ZKyVEXt6XGTNMrn5BtibPGIAljJk4FuV2zHz3VorRA+b/HT0CYv4OlfvdksSWqdGiSdjCCrfe5NcS
X-Received: from wmdd21.prod.google.com ([2002:a05:600c:a215:b0:477:14b8:19f6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:45cf:b0:477:8ba7:fe0a with SMTP id 5b1f17b1804b1-477c01c001bmr470590905e9.24.1764668210877;
 Tue, 02 Dec 2025 01:36:50 -0800 (PST)
Date: Tue,  2 Dec 2025 09:36:13 +0000
In-Reply-To: <20251202093623.2337860-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251202093623.2337860-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
Message-ID: <20251202093623.2337860-21-vdonnefort@google.com>
Subject: [PATCH v9 20/30] KVM: arm64: Add clock support to nVHE/pKVM hyp
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
X-CRM114-CacheID: sfid-20251202_084133_106454_DFEEEE68 
X-CRM114-Status: GOOD (  15.13  )
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
dependant on the upcoming CONFIG_NVHE_EL2_TRACING.

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
2.52.0.107.ga0afd4fd5b-goog


