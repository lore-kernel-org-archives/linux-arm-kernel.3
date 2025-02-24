Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5611CC19776
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 13:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ejK/8C7FFyT3tSgpfGWkSSasOGDMcKAf9YWEPj8A/I=; b=sNSq+DnV7C6u22BWG6ydYaSyiP
	4CYEFNMAJVoi4bMBn7MtgU2r3dfSLRUV0893f21Pskb10dNIAwzPyo2hihUJ9/qXhcebqNWby/o0H
	UcaD9BAVajEUZfJcTA4xfIUwxt3ZmV3enh7f8Uy3uEfdsc37wSagg25W7Wi8hzxrVplrkvWOiRR2L
	oYRzERjlYQKim9AfPjDdCApyuVQ+ShI9Ar2Duc1RaZoc4rdZe1gio+yDyc9/OA1y1p9t2pwznKOyN
	FhUXG9/2/x+489HDEZVZ//OvbzHVnapqT7I2ZOJz2GY6rMCcdW4ozP48ihCd7kmkCsOhKhR4RDgNf
	hpUvpdxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYHP-0000000Dn6X-3C1E;
	Mon, 24 Feb 2025 13:13:51 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmXMz-0000000DeLE-32u7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 12:15:35 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4398a60b61fso22055735e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 04:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740399332; x=1741004132; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ejK/8C7FFyT3tSgpfGWkSSasOGDMcKAf9YWEPj8A/I=;
        b=3f8zzn/Yqi9Dnhrn7rAYkSLM/Z1G0al/KdKs4C0EPq2UTKOKH8KA68sQoLdRbCBFiO
         NIxsHioye80sPB/izM+ZtfFstBf49yPupwh6vvLyaVsH9KHr3PSZQ4cmk6hTKxAYjbS7
         3bBC4x4s1+T2foY9UzhQmkLlrszAu8mC5YI2bMVL2wo61RRejLldJ63CPItEVnIy9BhV
         /Hea2/v9i4LwR2HUUKI5F+o+Kp888EWZkUtCEguTeu02oIZxXnIdx+fyYSSzWO7tLx6z
         2OsAlyxxh2GS065YlWctERgXplwbFOx5dhWKX7edkOl1LcHDI05UmpwMAVHSnicTrdHX
         Sz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740399332; x=1741004132;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ejK/8C7FFyT3tSgpfGWkSSasOGDMcKAf9YWEPj8A/I=;
        b=VSOnp5MHtm7aZPeh9fQgviu2cQeE2T/oQuVeHKm90+Obf9WNUZEfZUXWGm+lvOxtSA
         Qw0qk33BFWVoN66lMhZ7Vvrv1POsXqmZoNef+LITWflC/vJ1WymbW7wvyV8eBxUEcxC8
         g+nSQjZelnJHGfYEjHgy7sOA1shJ1n/p6cQN0gP2H22jUSbvxdrOE+YBFafE1jsVYHxN
         N/8pllZ28oHrR4x9FdvaKTFY6BaOFpg0HhzCkVy0xTEZMWBQzzg45n6T0ZrPR+wdOfoL
         wFesD+4bgkPLuQ6vV1gJ3waQF1Pqzhicw/Va/rZrbUI43mNu1tOPsKQsmK5x40SEIOl3
         wYhg==
X-Forwarded-Encrypted: i=1; AJvYcCWPjxiuJ5Naa6Cdn93OFDg3GwxogmzrYTRpZvTTCCuEda4mm/SYvFB7RlOb/fyA/RiQO+DiKe0BwbTOwuXvqZMB@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi8pluU78+Z9xX7mj9cCqHa1UZs9fU2BSYOMaS8iIaY5icHw6/
	nXJJ1oQQmTUij/uK0+jXuRhy0R434eW0BOgsQn6eyBiKp52EGLE6RzZLPiO5H0OWh7A3S7vCe85
	D8UmJrGdqAHHQQSqwFg==
X-Google-Smtp-Source: AGHT+IGeFNtDkwoWNu5EnPAqlAhToiw57l/wri43FL+yg/iv8i7KY5/rJKLalMmMg9RRoQsj6qXyYOVqroYVfbye
X-Received: from wmqa20.prod.google.com ([2002:a05:600c:3494:b0:439:8b09:7257])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:674e:b0:439:9a5a:d3c4 with SMTP id 5b1f17b1804b1-439af7f97a4mr100497985e9.2.1740399332141;
 Mon, 24 Feb 2025 04:15:32 -0800 (PST)
Date: Mon, 24 Feb 2025 12:13:46 +0000
In-Reply-To: <20250224121353.98697-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250224121353.98697-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250224121353.98697-5-vdonnefort@google.com>
Subject: [PATCH 04/11] KVM: arm64: Add clock support in the nVHE hyp
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
X-CRM114-CacheID: sfid-20250224_041533_769868_D6E58526 
X-CRM114-Status: GOOD (  17.11  )
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
index c838309e4ec4..355bae0056f0 100644
--- a/arch/arm64/include/asm/kvm_hyp.h
+++ b/arch/arm64/include/asm/kvm_hyp.h
@@ -144,5 +144,4 @@ extern u64 kvm_nvhe_sym(id_aa64smfr0_el1_sys_val);
 extern unsigned long kvm_nvhe_sym(__icache_flags);
 extern unsigned int kvm_nvhe_sym(kvm_arm_vmid_bits);
 extern unsigned int kvm_nvhe_sym(kvm_host_sve_max_vl);
-
 #endif /* __ARM64_KVM_HYP_H__ */
diff --git a/arch/arm64/kvm/hyp/include/nvhe/clock.h b/arch/arm64/kvm/hyp/include/nvhe/clock.h
new file mode 100644
index 000000000000..2bd05b3b89f9
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
+#ifdef CONFIG_TRACING
+void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
+u64 trace_clock(void);
+#else
+static inline void
+trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc) { }
+static inline u64 trace_clock(void) { return 0; }
+#endif
+#endif
diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index b43426a493df..323e992089bd 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -28,6 +28,7 @@ hyp-obj-y := timer-sr.o sysreg-sr.o debug-sr.o switch.o tlb.o hyp-init.o host.o
 hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
 	 ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o
 hyp-obj-$(CONFIG_LIST_HARDENED) += list_debug.o
+hyp-obj-$(CONFIG_TRACING) += clock.o
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
2.48.1.601.g30ceb7b040-goog


