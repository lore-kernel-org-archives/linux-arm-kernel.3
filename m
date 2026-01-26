Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3BFCF65DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+meh5z0/4QwnO6LSl7j279PrriMLEbu2DSgtDyqQa7E=; b=zDPjGVuVPAnuUeMmb9+wi7MwZD
	qw0oxlKYmkcoqfYBShMrYK20uGwVphWbetI15eKRfYtTDVpIYvPtTlBegqy2bmVzJoqfzXgL0GNYs
	N4nXj+pp1EEoxLylmXtnnf/LlKm4bzqRi1aBi60F6cpCEL9uEugqqj4v7VhPzijt4aYshSUO6q2gK
	qzCNbupRApgLIoqfL8gd26A8FRSHsaFkeZY1NuhiWIsuxMAi4UsYRjb/3JCFivDDocd8kT04RPfC/
	1P5upMZEhQ6tetoV0EXZdxSHwZDXrJGQFGeH3MgHCQL+aY4hLzzDGpkH+rAYx/Zs5qF/F8Mdo6qRZ
	AwgNboBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK5x-0000000CKDI-4A82;
	Mon, 26 Jan 2026 10:45:22 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK5Q-0000000CJY2-0Mpu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:44:51 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-435ab907109so1981390f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 02:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769424284; x=1770029084; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+meh5z0/4QwnO6LSl7j279PrriMLEbu2DSgtDyqQa7E=;
        b=ePoeK0FAxpnDwPasaQv4QLQpDrOCwDiG3iabIezM7FlHPIU8a4cx43+Kt83vjzn0Qr
         O8RPuszy/xQAkTLHD/hHJ+EysoqKA4uI4NufP4Q1ebXQExVQ0/Un+BFzD8x+4KxymL20
         5wZsZRXlGdQCmfT3e2sm9LO6Qby9dYoiL/yP6vkiwKMsSfqbGgF6g8uscSNCzbU/7hp2
         /wWe9S4BSJSZB166f0C30eoepXUGaAzJx3sfZ/UOVASQ4Jx2ShRUP0teBL0o13NMYZ9n
         MDBd245NNI9X+ONgokGYP51ycxQ3H0J/5tiRwUr16GOMTfm369KM/wk0zL/MWWqu8W9G
         N/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769424284; x=1770029084;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+meh5z0/4QwnO6LSl7j279PrriMLEbu2DSgtDyqQa7E=;
        b=v1WYukChyc0ALjv7XLKKsGFPiEw0Q1J2c9ezde/gWMXd/NYFfEbJknmv37Jhmu6O1q
         kjZ9Fnsb879vjHveY8/ybVW5acI7wtw/fWeTM+h/kVDqaqv1zvHkEgpFwQsXj4Fhk28k
         pmsyvBqHNyl1+PNpSIKsth/loINMKMryJvCnkKelhNfUuJ30Zi4XXNBDHfIKv0niLtX9
         tr71YQuqLkW1+3TeuZqWk5Pc4weM8I374RsJ+jd4YxwhcUDwlIfQfjHx8qm59NF3ZWsP
         ztJlD5+7ff529HWhsjy+KQi1fvqUPYxLAUz5dLPdTmh4z61fCCvDutBVob8Xy0AN+9Np
         bXyw==
X-Forwarded-Encrypted: i=1; AJvYcCVr7buA9UgzHX2RAVeddYI54E7J+bplKvWfDAZ0eCvvdv6L/hY/hQtRQuzjhy2XoX6h8tukaWqDDDwzQC341wUl@lists.infradead.org
X-Gm-Message-State: AOJu0YxVhPi5klh5fTB3jLbxi1WA2LWkKO4tn+bQE7+/jKGmY/PJNQxn
	eUBa+VRdzhQ2KCyfxLRqCLIC6TQKDvCxcEptH2rWYDC1EYVFH6h0bnI3sJYWfH4DvzmqTt53ja0
	U4azjzTE1FSZjeh7v+flSTQ==
X-Received: from wrbei6.prod.google.com ([2002:a05:6000:4186:b0:435:c02a:cdd4])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f44:0:b0:432:85eb:a3cc with SMTP id ffacd0b85a97d-435ca145617mr7262377f8f.19.1769424284248;
 Mon, 26 Jan 2026 02:44:44 -0800 (PST)
Date: Mon, 26 Jan 2026 10:44:09 +0000
In-Reply-To: <20260126104419.1649811-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260126104419.1649811-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126104419.1649811-21-vdonnefort@google.com>
Subject: [PATCH v10 20/30] KVM: arm64: Add clock support to nVHE/pKVM hyp
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
X-CRM114-CacheID: sfid-20260126_024448_358913_480ABCF3 
X-CRM114-Status: GOOD (  15.27  )
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
2.52.0.457.g6b5491de43-goog


