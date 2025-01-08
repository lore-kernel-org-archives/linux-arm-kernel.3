Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3525E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 12:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lFoDVO2sboF9A596nrExr9aJp/lO52iU9r4yQmzzS9o=; b=yav2iv85PUyQQD8xlN7yTLbHAU
	cygnyAszRwlbQ42Y4fGVT0ec62DijmbDP36J1QQDrqrJgg6x3lE8Ncq8bZ3f1YnIMmsHTEzfs550z
	E/teL1nbgNhUDa68WBEUyDl9qaIl+Gz0V9P9XTaIihOy3efAgUsg7wE3+xyx+BO7+ybu+mj7QB8yR
	NgYVd9B5pcLFRwLYQBJkqD/ee8SXE425BG+ZqFw518t/0g1cqJZ/zN8MtafuDA8UJEEfiJuNgNOFG
	Bori49kpHjZfej0bhRuuEPEyl/uZIBnq4hjUTpSX8OyYhRAbuF9rbhK2TpPBH9UXvgwKTyyYUTW3m
	Al572I4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVV5H-00000008PQS-2Jf3;
	Wed, 08 Jan 2025 12:22:51 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUVp-00000008H1I-0ZgJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 11:46:14 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4361fc2b2d6so53253115e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 03:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736336771; x=1736941571; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lFoDVO2sboF9A596nrExr9aJp/lO52iU9r4yQmzzS9o=;
        b=Mmh9nnA+shbmRMl9QDAa1FzIb3eKS8+e/m93k4pQPAEY+KXP7ThJfVklU9jdTP5YSx
         5rSA+dqLV63lscF+RQ74VVs0KhzJpFYZxsYeLnB0eu+4qSU/GAkqS9OuwiW7lfnMuU/+
         A5g/AEBQd0itKFu2RiA6EorMaaUT5tW4+nTtaOEJZDY5Wo12ki0vpIKrepyDrgUjt8ih
         oDNi4N4zJiPaOiRKUwMN4Fv/zaTYFc3ssFZWqr431yZ8qy87fmkiV+b40HetzEVxQ/vS
         CQOdV9M2dCn8hN1I7i6z6PS0rfgSLkS3Zpt9DC2OfzenjEEkyCqtmalEuLQmd+G14Bcg
         1IbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736336771; x=1736941571;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lFoDVO2sboF9A596nrExr9aJp/lO52iU9r4yQmzzS9o=;
        b=ZhpxUeCALnAWTuW3vp2geYVyn/EHJ38K1+l/dGKFFHZ0+ttxByN8rqsBzcn0ktGRbC
         UcbdZRlZTJ9tjfUvvSlHQWsf2DcIa776D9wqDdsVIvgzo4f03h3j5Ewgxj4Bmwy0xbt2
         FBqXe/DKdeAjr2a+Xb/E23DXI5IZlXOaFSdQshpQ0Vs4YbMAoW3GHwPhX5eNHfB6zO18
         +bEEu2w1NCW41AF06iZRfnqe6jAm2BFDGRF7wT/jqehve5P150YjSrek4UDrzZYJjHFG
         Xlc/Eb5KXrDq5lZ3mIdRDTG6pDJfium1Ng0vSuKiVZgLCCNVtZ3qYTIRr6fcocFRz60J
         Indw==
X-Forwarded-Encrypted: i=1; AJvYcCX2y2lImaNLXt1u0Kv4wrHHVIMHD0i6AqWX0grly9KU++lQnu3346HXwJW80sMch9Ilw7PlvSIKn9/Vfn9vHqzE@lists.infradead.org
X-Gm-Message-State: AOJu0YzbpHopTXEvR8eePRjlioe/Ep2YlGG2muTfxBbpouLFX3AVG0jJ
	9PTY8dFw62cwORkOCHEu8hlScBfKHnsetgvbtJBhODw4LzbBnbCK4ymUnDmqabgKNQD2UWrfX7w
	YLd81lNFeOlH2MMm/5Q==
X-Google-Smtp-Source: AGHT+IEjSqSCT6S4wJl/5AvcxkxahzrQOCMS5JRwX1yiSxDeFUJuQmOVNRQv8CYBXied1Fm8HU++hGMx8KCrSkFu
X-Received: from wmsd9.prod.google.com ([2002:a05:600c:3ac9:b0:434:9e7b:42c1])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f09:b0:434:f82b:c5e6 with SMTP id 5b1f17b1804b1-436e266ee5bmr18589025e9.1.1736336771623;
 Wed, 08 Jan 2025 03:46:11 -0800 (PST)
Date: Wed,  8 Jan 2025 11:45:29 +0000
In-Reply-To: <20250108114536.627715-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250108114536.627715-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250108114536.627715-6-vdonnefort@google.com>
Subject: [PATCH v2 05/12] KVM: arm64: Add clock support in the nVHE hyp
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
X-CRM114-CacheID: sfid-20250108_034613_172937_9F3322E4 
X-CRM114-Status: GOOD (  17.47  )
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
index 000000000000..c0d3784386ed
--- /dev/null
+++ b/arch/arm64/kvm/hyp/nvhe/clock.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 Google LLC
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
2.47.1.613.gc27f4b7a9f-goog


