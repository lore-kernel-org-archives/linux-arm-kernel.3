Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FED9C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 11:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ol5Kv9IuMOC5gLvUo+ftrDGNdodUvogtRoPdfqHnaTA=; b=H+eHJpaKcCuL0XkbrglPZ4K/sG
	84DwMgVug46zIYRtyJZNbqc1tL1dtTwXyEgck48sflf4y1TJCEDUMTu3Ehj3sKUKORG05yy+zZ/dp
	kEdBcnSTRb+7xVBiRHGmHAl9HYDi2OPqjI7K2NTFnC02FPospWLVXiVPZxJ1bFNfjg45Q4ZN3+dR/
	mKZN/h6yi2WHPfefLxu6NQ+tyQ+wnbpP2vnjrLz+rsZ4lAkd+Kfk0HEmsERXCLqbjbPj6jdwdsqPm
	KHCAT2xJHHp1bypI/qtFcwPNCeRXKe76S5PwouDhJy2WtLMBcYKBKVZKP82HLpVhtwNyNX0kCLkQB
	vkiOL2Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyGm-0000000Ef0a-1mcr;
	Wed, 15 Jul 2026 11:59:20 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyGk-0000000EeyZ-1kOu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:59:19 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-493c20d0468so22898755e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 04:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784116754; x=1784721554; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ol5Kv9IuMOC5gLvUo+ftrDGNdodUvogtRoPdfqHnaTA=;
        b=YYHgJL1q35fruwGYiuGG5OYz/QPgldvniR7ZSk2wWkDyj9lb61hcfNZCgxOpynF+X4
         S/dgaocoOVKNCmiEbkDQrF8YYQ24o5+QSawbeiZZ+414ulzbfXoNVGHPxMzCi+xdkGs8
         +GKPSTB60mpBe9El9Sjt2J26G9XaURX9Amx2tx0OgK/dNEBgi50vHXQJINwA8QL/IJ1N
         VfRDDNc9BxPuFpxvQADyNW7vytvCL0QYvTdmYYyLz95JBZ6gkcezoCMrnMjaKpCt3U4O
         8422Q9q6On3q0anr6lOuHzBGDEGtVMOXbyNeJV6Y52jNdATsaH4/jCyHCgYLuoe+pmRV
         /dtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784116754; x=1784721554;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ol5Kv9IuMOC5gLvUo+ftrDGNdodUvogtRoPdfqHnaTA=;
        b=EP4sM6MVbFH5KxI+0KVAAOl9Brzf4LV2dw97LduIeFBlXLKJNCz/PxwV/AIB9hSz2U
         ZbdkIqQusZBk5uyaLWCtMgw8dux74lifENynmd/fl1Vedfl3tYGY7pWcamwYi6G7l1Fm
         WxpkVM1nk3MMdn3ReLA5XLz14mBr+a9RiAG4H83AjDj1KNDDoX5883uoo+WRApyDvtTY
         MEG5lnQGsnIaQRFHSrreY6PNLgiVlJBRkFaeHA3csk5YsS8Dtk5h1nTO323R+amDonOu
         syXSoXoyupDgIWrDgxD4cnFLfTnErFAbUNIIwubsvduVTMWLVDe8vW1jMcHEZauz3ekD
         jWWw==
X-Gm-Message-State: AOJu0YyTYI5m7EJGobtdzHqH9SQxjSGklti7X7EAEPoMGRdg58Pyniah
	zgu5Kxf+Tuz5f6RDRuXA73lfbUuwxo5CLhO8IXweVkZ9FOmbV1jPdjnFECMthy8eo0WYwByqmj2
	Hi8bAD3El6ZYiqgmwzuvv/Hn3/O4DcI7xTHAOOzrwjlov1bVbOEgmXpvWbo+r8G4zpeAEBkxqK3
	m4KCmOXZGBPDK5xFH/X5cfDk2u5AhbAHgUL9Rrx5GQmPw+jERqF6hdKxqPsBwqBQzwsA==
X-Received: from wmbe13.prod.google.com ([2002:a05:600c:590d:b0:493:bb14:ecfa])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3f06:b0:495:3c8c:c16a with SMTP id 5b1f17b1804b1-4953c8cc25bmr27537525e9.0.1784116753865;
 Wed, 15 Jul 2026 04:59:13 -0700 (PDT)
Date: Wed, 15 Jul 2026 11:58:42 +0000
In-Reply-To: <20260715115906.2664882-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260715115906.2664882-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
Message-ID: <20260715115906.2664882-2-smostafa@google.com>
Subject: [PATCH v7 01/24] KVM: arm64: Add a generic clock
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_045918_468758_039B9841 
X-CRM114-Status: GOOD (  19.43  )
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

Add 2 new functions to nvhe/clock.c:
- hyp_clock_init(): Get the system timer frequency at boot
- hyp_clock_ns(): Get current time in nano seconds.

This is mainly used for timeouts, so a malicious host can DoS the
system or cause premature timeouts which likely end up in hyp panic,
that should be acceptable as neither of those would undermine the
security guarantees.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/clock.h |  3 +++
 arch/arm64/kvm/hyp/nvhe/Makefile        |  4 ++--
 arch/arm64/kvm/hyp/nvhe/clock.c         | 29 +++++++++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/setup.c         |  5 +++++
 4 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/clock.h b/arch/arm64/kvm/hyp/include/nvhe/clock.h
index ae03ec6965af..7ef982939bf9 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/clock.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/clock.h
@@ -13,4 +13,7 @@ static inline void
 trace_hyp_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc) { }
 static inline u64 trace_hyp_clock(void) { return 0; }
 #endif
+
+u64 hyp_clock_ns(void);
+int hyp_clock_init(void);
 #endif
diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index f57450ebcb49..7c879292974d 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -26,10 +26,10 @@ hyp-obj-y := timer-sr.o sysreg-sr.o debug-sr.o switch.o tlb.o hyp-init.o host.o
 	 hyp-main.o hyp-smp.o psci-relay.o early_alloc.o page_alloc.o \
 	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o
 hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
-	 ../hyp-entry.o ../exception.o ../pgtable.o ../vgic-v5-sr.o
+	 ../hyp-entry.o ../exception.o ../pgtable.o ../vgic-v5-sr.o clock.o
 hyp-obj-y += ../../../kernel/smccc-call.o
 hyp-obj-$(CONFIG_LIST_HARDENED) += list_debug.o
-hyp-obj-$(CONFIG_NVHE_EL2_TRACING) += clock.o trace.o events.o
+hyp-obj-$(CONFIG_NVHE_EL2_TRACING) += trace.o events.o
 hyp-obj-y += $(lib-objs)
 
 # Path to simple_ring_buffer.c
diff --git a/arch/arm64/kvm/hyp/nvhe/clock.c b/arch/arm64/kvm/hyp/nvhe/clock.c
index f3e2619db4e4..43d2cba4f810 100644
--- a/arch/arm64/kvm/hyp/nvhe/clock.c
+++ b/arch/arm64/kvm/hyp/nvhe/clock.c
@@ -8,7 +8,12 @@
 
 #include <asm/arch_timer.h>
 #include <asm/div64.h>
+#include <linux/math64.h>
+#include <vdso/time64.h>
 
+static u32 timer_freq;
+
+#ifdef CONFIG_NVHE_EL2_TRACING
 static struct clock_data {
 	struct {
 		u32 mult;
@@ -66,3 +71,27 @@ u64 trace_hyp_clock(void)
 
 	return (u64)ns + clock->data[bank].epoch_ns;
 }
+#endif /* CONFIG_NVHE_EL2_TRACING */
+
+int hyp_clock_init(void)
+{
+	timer_freq = read_sysreg(cntfrq_el0);
+	/*
+	 * KVM will not initialize if FW didn't set cntfrq_el0, that is already
+	 * part of the boot protocol.
+	 */
+	if (!timer_freq)
+		return -ENODEV;
+
+	/* Timer freq can't be larger than 1Ghz by spec. */
+	if (timer_freq > NSEC_PER_SEC)
+		return -EINVAL;
+
+	return 0;
+}
+
+/* Return time in ns. */
+u64 hyp_clock_ns(void)
+{
+	return mul_u64_u32_div(__arch_counter_get_cntvct(), NSEC_PER_SEC, timer_freq);
+}
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index 75b00c323310..970c5cf342f5 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -10,6 +10,7 @@
 #include <asm/kvm_pgtable.h>
 #include <asm/kvm_pkvm.h>
 
+#include <nvhe/clock.h>
 #include <nvhe/early_alloc.h>
 #include <nvhe/ffa.h>
 #include <nvhe/gfp.h>
@@ -320,6 +321,10 @@ void __noreturn __pkvm_init_finalise(void)
 	if (ret)
 		goto out;
 
+	ret = hyp_clock_init();
+	if (ret)
+		goto out;
+
 	ret = fix_host_ownership();
 	if (ret)
 		goto out;
-- 
2.55.0.141.g00534a21ce-goog


