Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED83CC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTKmizrXds5p9DE6J3WP7/kKkm1zSi2V0hVoZxXRS+Y=; b=txDn1ZawKB6hmi1UH0kR5ntxLN
	cLnPPbVz1vBKSfmIpskvI4kJOijNIBLXYbm7wPRnVjtuHPL7hQdJvOl9jq0PSV+/Pb7BKtmn9wCtt
	nDi8MXA/VNF7UTZW5PyhcErTcSPEnY/pEYaRpJ3ovmfOFqTgC8TvAnv3KyaIttgRv/FfLsUGgULRN
	DVRnFxB6xAxKXSOL3eDINKsD/dTEShn30tS4IhUdqOFnNCMk5xVY+JEqewgrSSl23TgTIgh9AdglZ
	6TvolpLp/Ox9wUA2qv1/aTBApnUZ8qbff7FBdqZ8oa6hqThd10TGwd8g9fxr2f7lg5u4g0nbN4G0E
	w0GPkG4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQht-0000000DYYo-37yD;
	Tue, 06 May 2025 22:24:09 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLTi-0000000Cjzp-3DGn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:49:12 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43d733063cdso43213855e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 09:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746550149; x=1747154949; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PTKmizrXds5p9DE6J3WP7/kKkm1zSi2V0hVoZxXRS+Y=;
        b=ELiSKIwQP4n8Aswmf2yXECKtkJuysrRRh2eesym9ySk3cwJSLpMVcV3DEFa/q8c1sD
         P67LB61ESEGpxJITb4hevTBXr5qHjij9BgK7l3t5dMkyk9yrvQkzKMOgdg0mp3/AaSFS
         YyLUvYYF7QaR3vPTlBCvEgnDDVWJ7tN7CcZ6ipH6oKVhL03F2ttUHGRWbdukKl5bx1Km
         /3KO/u4njuFMV+PwU5TGGyMVG6Pz8qqp82zV+3wAlLNj5mHDashgXbQ2KA95Z8rgWLym
         B/NG/7TwyyLlK6rzEqZW3d98pDqmq4SyFCidTSXGx4V8N8L9UB7YktFy6XDhKGexFCF6
         KhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550149; x=1747154949;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PTKmizrXds5p9DE6J3WP7/kKkm1zSi2V0hVoZxXRS+Y=;
        b=SGKLMbNJYeCV5GJ5OUYBH7wi2Vr0RQV927rmbuEiAHCkTBZOfKVCO7Cl8TE67KBvo7
         6gDmu4j9tpiT7fzyFy/XUIjvakpiCwBI4/ZgF1B0ui4XwkEQohJardkX1fpUqX3BLief
         DW7eT/nL5U+B/5TI1WriE8S3i3rXSxWCzvgTcNhLgqnwsRvJGBxELsrnUENBswh0pSbD
         n2pxmDsA9LpL0hxC1OYkJxj7y25fX9jYsSh0S1o/oE3WC/1uaTYJkZrmizngeqQ+jnpx
         FKZK1w8mUneUfO4S1xDN3uGnl+1UTZthI1AEOPMX2z7CQL8pnvhzjoQfaeJb8G/J0wN+
         7OWw==
X-Forwarded-Encrypted: i=1; AJvYcCV867/stgiwsFGRGMsmtXFkeh/QXxdqcqqzVRfRBKDOCdBR67H3b2uZOJNBoLsbUa4znoJAU2JrM3i/7/BqnhAF@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9MGcTxWZCNdW8cS8qz2BUORELN2m3Lm2uVewlk7UcYeVQ0K2V
	IO8KbwqLxKvCA2DVRrt86hfSuUFh1EopW+CxRjwPimAAlvYl5ryUCjyrpfhaoqJ0Q+pn8U/v/fq
	V9kQVmPskS/nYamaYag==
X-Google-Smtp-Source: AGHT+IE2t1cIjH9YYJy8Ayf9wJ/0y3Ak3eh6UWYMS00LUPr9De3lPaQ9ChoJojhjdULWg+br9k0N5dgvgMI3890q
X-Received: from wmben3.prod.google.com ([2002:a05:600c:8283:b0:43e:9aac:5a49])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3552:b0:43c:fc04:6d35 with SMTP id 5b1f17b1804b1-441d0fbd626mr38701485e9.4.1746550148999;
 Tue, 06 May 2025 09:49:08 -0700 (PDT)
Date: Tue,  6 May 2025 17:48:12 +0100
In-Reply-To: <20250506164820.515876-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250506164820.515876-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250506164820.515876-17-vdonnefort@google.com>
Subject: [PATCH v4 16/24] KVM: arm64: Add clock support for the pKVM hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_094910_814524_C69EFC5A 
X-CRM114-Status: GOOD (  17.08  )
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

By default, the arm64 host kernel is using the arch timer as a source
for sched_clock. Conveniently, EL2 has access to that same counter,
allowing to generate clock values that are synchronized.

The clock needs nonetheless to be setup with the same slope values as
the kernel. Introducing at the same time trace_clock() which is expected
to be later configured by the hypervisor tracing.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
index e6be1f5d0967..d46621d936e3 100644
--- a/arch/arm64/include/asm/kvm_hyp.h
+++ b/arch/arm64/include/asm/kvm_hyp.h
@@ -146,5 +146,4 @@ extern u64 kvm_nvhe_sym(id_aa64smfr0_el1_sys_val);
 extern unsigned long kvm_nvhe_sym(__icache_flags);
 extern unsigned int kvm_nvhe_sym(kvm_arm_vmid_bits);
 extern unsigned int kvm_nvhe_sym(kvm_host_sve_max_vl);
-
 #endif /* __ARM64_KVM_HYP_H__ */
diff --git a/arch/arm64/kvm/hyp/include/nvhe/clock.h b/arch/arm64/kvm/hyp/include/nvhe/clock.h
new file mode 100644
index 000000000000..9e152521f345
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
+#ifdef CONFIG_PKVM_TRACING
+void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
+u64 trace_clock(void);
+#else
+static inline void
+trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc) { }
+static inline u64 trace_clock(void) { return 0; }
+#endif
+#endif
diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index b43426a493df..68d14258165c 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -28,6 +28,7 @@ hyp-obj-y := timer-sr.o sysreg-sr.o debug-sr.o switch.o tlb.o hyp-init.o host.o
 hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
 	 ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o
 hyp-obj-$(CONFIG_LIST_HARDENED) += list_debug.o
+hyp-obj-$(CONFIG_PKVM_TRACING) += clock.o
 hyp-obj-y += $(lib-objs)
 
 ##
diff --git a/arch/arm64/kvm/hyp/nvhe/clock.c b/arch/arm64/kvm/hyp/nvhe/clock.c
new file mode 100644
index 000000000000..879c6b09d9ca
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
+/* Using host provided data. Do not use for anything else than debugging. */
+u64 trace_clock(void)
+{
+	struct clock_data *clock = &trace_clock_data;
+	u64 bank = smp_load_acquire(&clock->cur);
+	u64 cyc, ns;
+
+	cyc = __arch_counter_get_cntpct() - clock->data[bank].epoch_cyc;
+
+	if (likely(cyc < clock->data[bank].cyc_overflow64)) {
+		ns = cyc * clock->data[bank].mult;
+		ns >>= clock->data[bank].shift;
+	} else {
+		ns = __clock_mult_uint128(cyc, clock->data[bank].mult,
+					   clock->data[bank].shift);
+	}
+
+	return (u64)ns + clock->data[bank].epoch_ns;
+}
-- 
2.49.0.967.g6a0df3ecc3-goog


