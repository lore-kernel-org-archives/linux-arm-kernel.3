Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F800CD3425
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 11:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycktJLz1KBPXSpg6NVU24LQdR/O3V/jOKSZRApslagY=; b=a1PRYCzGlL9jjmHKb/Qxjw17zV
	FDY5X/6BGvINqNJMx+SRsDinlbxRxuNcJTOXZ1gI1c+/xOnI02F14tFHd0lytfKD7cOjLiktMCuMK
	XTQUWXsPShjoAljEHR6ONYzvkR05Q4J4Ie1HIDEe5TWYWBv1ve0mIi6B7TlOhg8Xs/x/YVh+C6BAn
	mkk+fsv3IYlKrbiMQ4hiOkOfCmf6vf1W+5wY6r+8p2/0K42GbrsdcRSC3rtGV6uhcQIgRpAGcQLXv
	1M3/aQndEUTAH+PCrMw3c1gRctbVvGJah5OfNx1OxXivjndUH3SFcqC8PrqNfOefgAp1wwEZKcqYw
	wnGuy+7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIluW-00000006cY0-05RG;
	Fri, 01 May 2026 11:19:56 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIluT-00000006cWD-1srl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 11:19:54 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-6729caff479so1912098a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 04:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777634391; x=1778239191; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ycktJLz1KBPXSpg6NVU24LQdR/O3V/jOKSZRApslagY=;
        b=FJdMj8hCPZQnkz4MpC7zUn51ogooThOIoM3GfAPtzpCIMH32B94d+Fsi32LtsdsTld
         50seKCZKuLLhGRH4utQagfRKfnVROZBaWJ2m5oatxopO6u5HXKW4shgO4TZ0uDJFEh25
         QcWynMcm17hOfZJb4DZCVXQjPGUXUH6EbeNQLkiYRSpfvomF6L9+juyJBTcD4byGXmrz
         R+zSBWS0/nie5U8UiQkiYtaZxmQge+C8Pfyr8JZXATBQbczn0XXOqiSa0ZYwn9EdUFCB
         vmwXszWDSRDLJ68bNtEGc9JZh/BOAnYVWWQ/BaL5XsdprsVWDlOawpKE2HO7b3a3j+rq
         hwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634391; x=1778239191;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ycktJLz1KBPXSpg6NVU24LQdR/O3V/jOKSZRApslagY=;
        b=AN+yJOtaiXORlRDrsVsk522Pw+I3CEdQUUCHWkrol6qUl5qapnV7hu4QAMhZarMc3+
         FpKPooZT0Qqot3XpinP2DpbuDmZT8qGgulC6UFvvAhC4sPF7xalsU0xjOKMSs8epBepY
         bCIkjZkEDQZ5Cyw6mDai8Ga/OJaJSg5ytqBSL05YUKPK42FVqEDWoZvDGjpYUYR2gs1N
         pT3CRzdLm69czgu6mLrF1fBRSdDdZft5Ft9DrRyIOiTzSFX09BusEmTc5yk1OKa5pO/4
         aUO+u8doRPiFAWLPvhu1OIS9CqOoe1Q9n9n7gfj6o96V0LrvrnhN1Q7CwHf1wtgCL2zi
         azSg==
X-Gm-Message-State: AOJu0Yy7UiBDLPoe8UEuMc+g3P4yzd/8ay6DcIcw7qu7mzix9eXZlJZY
	0gYboYesQAvEjG4vRSzETbMo2k6GGDifLmKjWRtUuGrlthxerMzqIuMMA5OhJIU4qDaQxJNR7oD
	OEf5qzF1VnTuhPA+xSjy2xLq16AyBCE87yOXk++QhrThgS3+B+d7FTsgFoxKI/ksXW5ALBADNIf
	NkE1SqXyGy5SdGS2jLULYpSos0bJbpYouQgBNyBm8F8RldmHTDDOt962fsacBNz5An7Q==
X-Received: from edag36.prod.google.com ([2002:a05:6402:3224:b0:66e:76b4:2912])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:46d8:b0:678:a507:e81b with SMTP id 4fb4d7f45d1cf-67b5d97defdmr2810112a12.21.1777634390386;
 Fri, 01 May 2026 04:19:50 -0700 (PDT)
Date: Fri,  1 May 2026 11:19:03 +0000
In-Reply-To: <20260501111928.259252-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260501111928.259252-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260501111928.259252-2-smostafa@google.com>
Subject: [PATCH v6 01/25] KVM: arm64: Generalize trace clock
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	mark.rutland@arm.com, qperret@google.com, tabba@google.com, 
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_041953_523984_8FDC3A1F 
X-CRM114-Status: GOOD (  21.14  )
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

IOMMU drivers need to track time, mainly for timeouts.
Generalize the tracing clock functions in the hypervsior, so they can
be used from IOMMU drivers.

1) Make the compilation independent from tracing.

2) As drivers might need to use that quite early, provide default
   values for the clock data based on cntfrq_el0, the driver can
   keep using these values without calling hyp_clock_update() as
   they don't need to sync with the host timers.

This is mainly used for timeouts, so a malicious host can DoS the
system or cause premature timeouts which likely end up in hyp panic,
that should be acceptable as neither of those would undermine the
security guarantees.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/clock.h | 11 ++-----
 arch/arm64/kvm/hyp/nvhe/Makefile        |  4 +--
 arch/arm64/kvm/hyp/nvhe/clock.c         | 44 ++++++++++++++++++++++---
 arch/arm64/kvm/hyp/nvhe/setup.c         |  5 +++
 arch/arm64/kvm/hyp/nvhe/trace.c         |  4 +--
 5 files changed, 51 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/clock.h b/arch/arm64/kvm/hyp/include/nvhe/clock.h
index 9f429f5c0664..e6a0e43af88d 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/clock.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/clock.h
@@ -5,12 +5,7 @@
 
 #include <asm/kvm_hyp.h>
 
-#ifdef CONFIG_NVHE_EL2_TRACING
-void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
-u64 trace_clock(void);
-#else
-static inline void
-trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc) { }
-static inline u64 trace_clock(void) { return 0; }
-#endif
+void hyp_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
+u64 hyp_clock_ns(void);
+int hyp_clock_init(void);
 #endif
diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index 62cdfbff7562..89d0533921f9 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -26,10 +26,10 @@ hyp-obj-y := timer-sr.o sysreg-sr.o debug-sr.o switch.o tlb.o hyp-init.o host.o
 	 hyp-main.o hyp-smp.o psci-relay.o early_alloc.o page_alloc.o \
 	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o
 hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
-	 ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o ../vgic-v5-sr.o
+	 ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o ../vgic-v5-sr.o clock.o
 hyp-obj-y += ../../../kernel/smccc-call.o
 hyp-obj-$(CONFIG_LIST_HARDENED) += list_debug.o
-hyp-obj-$(CONFIG_NVHE_EL2_TRACING) += clock.o trace.o events.o
+hyp-obj-$(CONFIG_NVHE_EL2_TRACING) += trace.o events.o
 hyp-obj-y += $(lib-objs)
 
 # Path to simple_ring_buffer.c
diff --git a/arch/arm64/kvm/hyp/nvhe/clock.c b/arch/arm64/kvm/hyp/nvhe/clock.c
index 32fc4313fe43..53d0bd55e866 100644
--- a/arch/arm64/kvm/hyp/nvhe/clock.c
+++ b/arch/arm64/kvm/hyp/nvhe/clock.c
@@ -18,7 +18,41 @@ static struct clock_data {
 		u64 cyc_overflow64;
 	} data[2];
 	u64 cur;
-} trace_clock_data;
+} clock_data;
+
+#define HYP_CLK_SEC_TO_NS 1000000000UL
+
+int hyp_clock_init(void)
+{
+	u32 timer_freq = read_sysreg(cntfrq_el0);
+	u32 shift = 32;
+	u64 mult;
+
+	/*
+	 * KVM will not initialize if FW didn't set cntfrq_el0, that is already
+	 * part of the boot protocol.
+	 */
+	if (!timer_freq)
+		return -ENODEV;
+
+	/* Timer freq can't be larger than 1Ghz by spec. */
+	if (timer_freq > HYP_CLK_SEC_TO_NS)
+		return -EINVAL;
+
+	/* Simplified logic from clocks_calc_mult_shift() */
+	do {
+		mult = (HYP_CLK_SEC_TO_NS << shift);
+		mult = div_u64(mult, timer_freq);
+		if (mult <= (~0U))
+			break;
+		shift--;
+	} while (shift > 0);
+
+	clock_data.data[0].shift = shift;
+	clock_data.data[0].mult = mult;
+	clock_data.data[0].cyc_overflow64 = ULONG_MAX / mult;
+	return 0;
+}
 
 static u64 __clock_mult_uint128(u64 cyc, u32 mult, u32 shift)
 {
@@ -30,9 +64,9 @@ static u64 __clock_mult_uint128(u64 cyc, u32 mult, u32 shift)
 }
 
 /* Does not guarantee no reader on the modified bank. */
-void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
+void hyp_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
 {
-	struct clock_data *clock = &trace_clock_data;
+	struct clock_data *clock = &clock_data;
 	u64 bank = clock->cur ^ 1;
 
 	clock->data[bank].mult			= mult;
@@ -45,9 +79,9 @@ void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
 }
 
 /* Use untrusted host data */
-u64 trace_clock(void)
+u64 hyp_clock_ns(void)
 {
-	struct clock_data *clock = &trace_clock_data;
+	struct clock_data *clock = &clock_data;
 	u64 bank = smp_load_acquire(&clock->cur);
 	u64 cyc, ns;
 
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index d8e5b563fd3d..8041f6e80cd1 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -10,6 +10,7 @@
 #include <asm/kvm_pgtable.h>
 #include <asm/kvm_pkvm.h>
 
+#include <nvhe/clock.h>
 #include <nvhe/early_alloc.h>
 #include <nvhe/ffa.h>
 #include <nvhe/gfp.h>
@@ -312,6 +313,10 @@ void __noreturn __pkvm_init_finalise(void)
 	};
 	pkvm_pgtable.mm_ops = &pkvm_pgtable_mm_ops;
 
+	ret = hyp_clock_init();
+	if (ret)
+		goto out;
+
 	ret = fix_host_ownership();
 	if (ret)
 		goto out;
diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
index a6ca27b18e15..e30de840e6c2 100644
--- a/arch/arm64/kvm/hyp/nvhe/trace.c
+++ b/arch/arm64/kvm/hyp/nvhe/trace.c
@@ -35,7 +35,7 @@ static bool hyp_trace_buffer_loaded(struct hyp_trace_buffer *trace_buffer)
 void *tracing_reserve_entry(unsigned long length)
 {
 	return simple_ring_buffer_reserve(this_cpu_ptr(trace_buffer.simple_rbs), length,
-					  trace_clock());
+					  hyp_clock_ns());
 }
 
 void tracing_commit_entry(void)
@@ -285,7 +285,7 @@ void __tracing_update_clock(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
 	}
 
 	/* ...we can now override the old one and swap. */
-	trace_clock_update(mult, shift, epoch_ns, epoch_cyc);
+	hyp_clock_update(mult, shift, epoch_ns, epoch_cyc);
 }
 
 int __tracing_reset(unsigned int cpu)
-- 
2.54.0.545.g6539524ca2-goog


