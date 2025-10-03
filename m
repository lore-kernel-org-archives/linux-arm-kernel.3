Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88382CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 13:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ylDyk9s+5460dWO0uwqzLTOwTHPUFfBCKGnbJPl3EJ0=; b=iZ0VETVHMimkLNWF9ZwtlKfpM5
	w6kUlDzOFlQnaHdaBQ6ZjEk7mvL5WscqAaQ3KBaBGVX8Dr9pnKZG4hLvxfQ3xPCZYUYOcACDxESFT
	u4zV5FGIxXSLFJ8FLA2d4AbgOKWkUf8FCB7l4qfubuKo1bJ9+aFQ+yttZfbaGZjnaIwPj7hVePbnM
	O5LH4RCDsDjCBODdSv9OfipSZ29WwuewA02N35gYU3GSumYNTZyo2fEyzuwbiEejsO4KRDRDRLBR7
	71v8HoPudcchkonbAzq2DC82cqdSlFXym9z6TR9VXjabKn2hPYt68n+lJ4sS840Sq90MizSm5A+R9
	stP/81tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g0b-0000000CQz9-37Gx;
	Fri, 03 Oct 2025 13:39:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g0H-0000000CQTX-3ESL
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 03 Oct 2025 13:39:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ylDyk9s+5460dWO0uwqzLTOwTHPUFfBCKGnbJPl3EJ0=; b=kcd0w3n+UEx+QrEZJzorspbwUz
	8Bx7teFTRyzaSC9+P+G36QOxZHrQlXt8YFOOeWlGrbCxVhfdl76T0ikK5R5ic6Jx6gGRNvhIRUxVW
	VWKvnCIstwiaRu8w6SqvHV5bPMihi50BXllmSAnvbYKdaSUaeCctuAl6JOTO37ftB6OKU/LMISIzb
	d9Cu3Wb4i9WvZ3xmePuuje6FQZkcKZsToIwQHvQ/2ezAF8hzidUnqkXJqRKdzLi7wtmKbe4Mii4t/
	BYr1pbKOs7CLDCj2QRsLJtahvdtTGaN5eM8+5chM/BS4whJlQpQ+UK+YbsSFT6HDFd5mTOG8kyKQz
	MyHo+C4A==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g0E-0000000Exlx-0xlH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 13:39:19 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-46e47d14dceso8887035e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 06:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759498756; x=1760103556; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ylDyk9s+5460dWO0uwqzLTOwTHPUFfBCKGnbJPl3EJ0=;
        b=Q75ifdvMLbhoOrQhk+2VhkHTVxCQHKMfmPs4+G8ky5vHVy/tMMbllQKcddcE0kGfO1
         qEgN/3rE7pDS9winouVrA3RPt95mI3QBU64zu0O6xPeBP3t6pGVJQe04dNFkYXxqAMMe
         17S4YPMKLW+xAYdzWo9F0AlR/QqvVBbgeBzJUgzhdgwi5DJvTsIegu0OqyDH9xrjgWI4
         LbxitvtqKjIt5lOBoFvKnQUiC2mIWvit2zusLL2Nc5kLz/FSFVrQDwAPvcf5qYiSgtqw
         3daI4NbrC65lVi7z7t9he5eh+qfYO8boq14ZcDxnLE4cfSwaWQ+KS1sto2HBkFD+yOxh
         4wZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759498756; x=1760103556;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ylDyk9s+5460dWO0uwqzLTOwTHPUFfBCKGnbJPl3EJ0=;
        b=a1Fk1whvedp93YQJcr/Ve0+BYYP0sbGtGxv/NEq1Q8HHMUm/OXBM+RrQY9olPmrKM5
         zBKwdgRazZ4aZ4hxhj7QPVBJev8WpMmdZGwK4sgyJLOJiVuDRqplXzVGUgWxieCGVXqz
         61RyOHoctjw8ofaoi+VJ7ioLQxijiP4xX0G/mDUjxzosX2+g2r9hTFu19HpTqXzIdVcu
         aLfQ4B6cfEi7/qNBuD5F9bFDlGfkMojrupdVBVIClYmiExF8f1EQClQ6PIAdU5GlnW8L
         YdaiLXhGbDCRRmK01BLoEckDqxUFl4OAsALreqfT/AIJHyI025aM1j8Bt0Kf9tE3YGWW
         V/bA==
X-Forwarded-Encrypted: i=1; AJvYcCW92pCzFdGUfRFW2jRe7H64PvV9XJdVj2n1p0L2WyK2eV5xaP1gA8CqCbKEW7KgT5uGZkfNg30uGtxJ/43zSIO5@lists.infradead.org
X-Gm-Message-State: AOJu0YzYT32lvjfpwkY/hsupf6rXCDQHtfDm7ZZo2H74cBaQ9bTap+vC
	wXydESZBp2zyDXp3tzD4YIj2JKTyZsPBcaYJR9iUNV2sp1N3qc2QeUIKYck8JX0qghCwjFbCXEo
	471tGKBOvd3WP+OtWz3/KkA==
X-Google-Smtp-Source: AGHT+IFhcfElMZQqoCh3Cq6hmENi8kEnMvrnlOccnmd1TZhS72DJCQ0YPYUh2/TUKvb4CJDArB7pSvRYLVze8uJU
X-Received: from wmjf9.prod.google.com ([2002:a7b:cd09:0:b0:46b:7c6d:220])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:468e:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-46e71102467mr22982065e9.10.1759498755769;
 Fri, 03 Oct 2025 06:39:15 -0700 (PDT)
Date: Fri,  3 Oct 2025 14:38:17 +0100
In-Reply-To: <20251003133825.2068970-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251003133825.2068970-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251003133825.2068970-21-vdonnefort@google.com>
Subject: [PATCH v7 20/28] KVM: arm64: Add clock support for the pKVM hyp
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
X-CRM114-CacheID: sfid-20251003_143918_392607_12C7D3E8 
X-CRM114-Status: GOOD (  17.15  )
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
index 0b0a68b663d4..607357e36026 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -17,7 +17,7 @@ ccflags-y += -fno-stack-protector	\
 hostprogs := gen-hyprel
 HOST_EXTRACFLAGS += -I$(objtree)/include
 
-lib-objs := clear_page.o copy_page.o memcpy.o memset.o
+lib-objs := clear_page.o copy_page.o memcpy.o memset.o tishift.o
 lib-objs := $(addprefix ../../../lib/, $(lib-objs))
 
 CFLAGS_switch.nvhe.o += -Wno-override-init
@@ -28,6 +28,7 @@ hyp-obj-y := timer-sr.o sysreg-sr.o debug-sr.o switch.o tlb.o hyp-init.o host.o
 hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
 	 ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o
 hyp-obj-$(CONFIG_LIST_HARDENED) += list_debug.o
+hyp-obj-$(CONFIG_PKVM_TRACING) += clock.o
 hyp-obj-y += $(lib-objs)
 
 ##
diff --git a/arch/arm64/kvm/hyp/nvhe/clock.c b/arch/arm64/kvm/hyp/nvhe/clock.c
new file mode 100644
index 000000000000..600a300bece7
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
+					  clock->data[bank].shift);
+	}
+
+	return (u64)ns + clock->data[bank].epoch_ns;
+}
-- 
2.51.0.618.g983fd99d29-goog


