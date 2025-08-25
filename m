Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39470CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 20:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Yt+mqKBC1lScZpff+gMSGHqLsfTkvQErLtkG0vCOeI=; b=DuJryw3ZQ4QNACjQ6+ds04ymX3
	I0n3RBC+IqJQ5WiXeW6EkRxv5uKJoo9X3I7cTFTxF8ZVE1ig/YO/HbXypQ/RoRLuEVzAsbnifdhtn
	2II3C0GqGKHCGSyqhXG5Rfrq05rnyHN1YDAdTl0+DaamexRpDcaB8oMcCd6txinGYveLgfhx9WhoF
	4BOcrO+Np/DJuXKI2Goyoq/oVwKewrXlJGvOEjQd2aLrNkg6rI9znehNYsaiPqVlsss8V2CxiQlhV
	cjrskw04gUg1fP9UxHtmbzRrEeyUf2Mp2uKB6mIkbIwDsSFUyH+PGrCQJpagW8CHSMdXiD0kNbL2S
	M5rY5SIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqdbg-00000009XEj-1cWh;
	Mon, 25 Aug 2025 20:15:56 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqdSa-00000009UrI-28MD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 20:06:34 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-246f49067bdso10090455ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 13:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756152391; x=1756757191; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=8Yt+mqKBC1lScZpff+gMSGHqLsfTkvQErLtkG0vCOeI=;
        b=u8F67CpzUXobyIjQbW0thZ3aFvtgzJiU0v0X9anSjYPaZG0Ys17gzqjtog+HySbK2y
         aNuHpeEbF2+S88ffEfAm/AD4RoWXUZB7T/a/in3jfo3v7Hfr32N44NDMaFXWWQk3Zkmu
         N2wWalpO1ZVZ+eVgi8YxMeFZN75aq/rYFPQpkQyS5IWjNHENc4crWz7FUBNLp7qVJaou
         IFuJne4dTeoAT803UpPxuvj0n4Qa64zURaxsSNWA3kz5pFpHTzVpsCEXkBZRlnuvBQLG
         1BtJ8WWv7ae2SnFwVpUp1zAL3mDL4a3CmxLfxO5XMfXp3A96Wgfw1BMOysNTQMQqQ2Xh
         5cJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756152391; x=1756757191;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Yt+mqKBC1lScZpff+gMSGHqLsfTkvQErLtkG0vCOeI=;
        b=Shg8NZVaLJY6U+YWA2+QfXME0FCKpwfw1pDjqNawtFuDND4xS9AjXrRoFarwh+Pa5x
         p6KepoibKbCEXvipD+gUdiXP4MKeIiz/7UxjiIa8gPn2dEK9tjNdFnNE8YZyFa7aEXat
         AlRiz0GdkSg/+e4GSkABXY8PgpNYAZ8G0Dxsz5R2kCJopriqonAI+AnDAIBRX8HXcPSb
         DiByZg1bykrTdvBfCgCwwMRe8BTR8D0NeWcBZ+b3Ur0MVBtknrUJmXug1vRvkbke1KlT
         sqkpu7ElBIULkS/thqXr8IgkzQ0BG4klbz1gOBRj35ycmWn/Uuj0pBeS0c4eTC1qDTDS
         7e3A==
X-Forwarded-Encrypted: i=1; AJvYcCUt6TytY4uXITVn8QXleErNlkdWLlZBHWfz0rQEC0Q2+Sy0eyU8c0MReK57Jd9sV3komTKf0yYUMIPpG8rXVwLN@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ9UXez3dp5ok6ZhNx6vUKlWHtKkGnnThRxu4K5XqvHG/nLTf6
	ja71aZLCRFm1Ni1Ukmug83ke4X1a8l9ZmfkbbMLGdLO/BnoVuK4N/dshGDNloejnJGWcYHwJcrR
	kzFq09g==
X-Google-Smtp-Source: AGHT+IEhWmQ2UlZ+VF2FZhFLY+yV2efXko8WF7SGmUugSmFKrlZDlQSYCijahvsEl8VwXvH23VQtDtjdo6U=
X-Received: from pjbsx15.prod.google.com ([2002:a17:90b:2ccf:b0:31f:1707:80f6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e888:b0:23d:d0e7:754b
 with SMTP id d9443c01a7336-2462ee0853dmr157742075ad.18.1756152390785; Mon, 25
 Aug 2025 13:06:30 -0700 (PDT)
Date: Mon, 25 Aug 2025 13:06:20 -0700
In-Reply-To: <20250825200622.3759571-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250825200622.3759571-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250825200622.3759571-4-seanjc@google.com>
Subject: [PATCH 3/5] entry/kvm: KVM: Move KVM details related to signal/-EINTR
 into KVM proper
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Peter Zijlstra <peterz@infradead.org>, 
	Andy Lutomirski <luto@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_130632_543473_023427F4 
X-CRM114-Status: GOOD (  21.81  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Move KVM's morphing of pending signals into userspace exits into KVM
proper, and drop the @vcpu param from xfer_to_guest_mode_handle_work().
How KVM responds to -EINTR is a detail that really belongs in KVM itself,
and invoking kvm_handle_signal_exit() from kernel code creates an inverted
module dependency.  E.g. attempting to move kvm_handle_signal_exit() into
kvm_main.c would generate an linker error when building kvm.ko as a module.

Dropping KVM details will also converting the KVM "entry" code into a more
generic virtualization framework so that it can be used when running as a
Hyper-V root partition.

Lastly, eliminating usage of "struct kvm_vcpu" outside of KVM is also nice
to have for KVM x86 developers, as keeping the details of kvm_vcpu purely
within KVM allows changing the layout of the structure without having to
boot into a new kernel, e.g. allows rebuilding and reloading kvm.ko with a
modified kvm_vcpu structure as part of debug/development.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c      |  3 +--
 arch/loongarch/kvm/vcpu.c |  3 +--
 arch/riscv/kvm/vcpu.c     |  3 +--
 arch/x86/kvm/vmx/vmx.c    |  1 -
 arch/x86/kvm/x86.c        |  3 +--
 include/linux/entry-kvm.h | 11 +++--------
 include/linux/kvm_host.h  | 13 ++++++++++++-
 kernel/entry/kvm.c        | 13 +++++--------
 8 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 888f7c7abf54..418fd3043467 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -6,7 +6,6 @@
 
 #include <linux/bug.h>
 #include <linux/cpu_pm.h>
-#include <linux/entry-kvm.h>
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/kvm_host.h>
@@ -1177,7 +1176,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		/*
 		 * Check conditions before entering the guest
 		 */
-		ret = xfer_to_guest_mode_handle_work(vcpu);
+		ret = kvm_xfer_to_guest_mode_handle_work(vcpu);
 		if (!ret)
 			ret = 1;
 
diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index ce478151466c..450545d2fc70 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -4,7 +4,6 @@
  */
 
 #include <linux/kvm_host.h>
-#include <linux/entry-kvm.h>
 #include <asm/fpu.h>
 #include <asm/lbt.h>
 #include <asm/loongarch.h>
@@ -251,7 +250,7 @@ static int kvm_enter_guest_check(struct kvm_vcpu *vcpu)
 	/*
 	 * Check conditions before entering the guest
 	 */
-	ret = xfer_to_guest_mode_handle_work(vcpu);
+	ret = kvm_xfer_to_guest_mode_handle_work(vcpu);
 	if (ret < 0)
 		return ret;
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index f001e56403f9..251e787f2ebc 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -7,7 +7,6 @@
  */
 
 #include <linux/bitops.h>
-#include <linux/entry-kvm.h>
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/kdebug.h>
@@ -910,7 +909,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 	run->exit_reason = KVM_EXIT_UNKNOWN;
 	while (ret > 0) {
 		/* Check conditions before entering the guest */
-		ret = xfer_to_guest_mode_handle_work(vcpu);
+		ret = kvm_xfer_to_guest_mode_handle_work(vcpu);
 		if (ret)
 			continue;
 		ret = 1;
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index aa157fe5b7b3..d7c86613e50a 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -28,7 +28,6 @@
 #include <linux/slab.h>
 #include <linux/tboot.h>
 #include <linux/trace_events.h>
-#include <linux/entry-kvm.h>
 
 #include <asm/apic.h>
 #include <asm/asm.h>
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index a1c49bc681c4..0b13b8bf69e5 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -59,7 +59,6 @@
 #include <linux/sched/stat.h>
 #include <linux/sched/isolation.h>
 #include <linux/mem_encrypt.h>
-#include <linux/entry-kvm.h>
 #include <linux/suspend.h>
 #include <linux/smp.h>
 
@@ -11241,7 +11240,7 @@ static int vcpu_run(struct kvm_vcpu *vcpu)
 
 		if (__xfer_to_guest_mode_work_pending()) {
 			kvm_vcpu_srcu_read_unlock(vcpu);
-			r = xfer_to_guest_mode_handle_work(vcpu);
+			r = kvm_xfer_to_guest_mode_handle_work(vcpu);
 			kvm_vcpu_srcu_read_lock(vcpu);
 			if (r)
 				return r;
diff --git a/include/linux/entry-kvm.h b/include/linux/entry-kvm.h
index 16149f6625e4..3644de7e6019 100644
--- a/include/linux/entry-kvm.h
+++ b/include/linux/entry-kvm.h
@@ -21,8 +21,6 @@
 	 _TIF_NOTIFY_SIGNAL | _TIF_NOTIFY_RESUME |			\
 	 ARCH_XFER_TO_GUEST_MODE_WORK)
 
-struct kvm_vcpu;
-
 /**
  * arch_xfer_to_guest_mode_handle_work - Architecture specific xfer to guest
  *					 mode work handling function.
@@ -32,12 +30,10 @@ struct kvm_vcpu;
  * Invoked from xfer_to_guest_mode_handle_work(). Defaults to NOOP. Can be
  * replaced by architecture specific code.
  */
-static inline int arch_xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcpu,
-						      unsigned long ti_work);
+static inline int arch_xfer_to_guest_mode_handle_work(unsigned long ti_work);
 
 #ifndef arch_xfer_to_guest_mode_work
-static inline int arch_xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcpu,
-						      unsigned long ti_work)
+static inline int arch_xfer_to_guest_mode_handle_work(unsigned long ti_work)
 {
 	return 0;
 }
@@ -46,11 +42,10 @@ static inline int arch_xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcpu,
 /**
  * xfer_to_guest_mode_handle_work - Check and handle pending work which needs
  *				    to be handled before going to guest mode
- * @vcpu:	Pointer to current's VCPU data
  *
  * Returns: 0 or an error code
  */
-int xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcpu);
+int xfer_to_guest_mode_handle_work(void);
 
 /**
  * xfer_to_guest_mode_prepare - Perform last minute preparation work that
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 15656b7fba6c..598b9473e46d 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2,7 +2,7 @@
 #ifndef __KVM_HOST_H
 #define __KVM_HOST_H
 
-
+#include <linux/entry-kvm.h>
 #include <linux/types.h>
 #include <linux/hardirq.h>
 #include <linux/list.h>
@@ -2450,6 +2450,17 @@ static inline void kvm_handle_signal_exit(struct kvm_vcpu *vcpu)
 	vcpu->run->exit_reason = KVM_EXIT_INTR;
 	vcpu->stat.signal_exits++;
 }
+
+static inline int kvm_xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcpu)
+{
+	int r = xfer_to_guest_mode_handle_work();
+
+	if (r) {
+		WARN_ON_ONCE(r != -EINTR);
+		kvm_handle_signal_exit(vcpu);
+	}
+	return r;
+}
 #endif /* CONFIG_KVM_XFER_TO_GUEST_WORK */
 
 /*
diff --git a/kernel/entry/kvm.c b/kernel/entry/kvm.c
index 8485f63863af..6fc762eaacca 100644
--- a/kernel/entry/kvm.c
+++ b/kernel/entry/kvm.c
@@ -1,17 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/entry-kvm.h>
-#include <linux/kvm_host.h>
 
-static int xfer_to_guest_mode_work(struct kvm_vcpu *vcpu, unsigned long ti_work)
+static int xfer_to_guest_mode_work(unsigned long ti_work)
 {
 	do {
 		int ret;
 
-		if (ti_work & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL)) {
-			kvm_handle_signal_exit(vcpu);
+		if (ti_work & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
 			return -EINTR;
-		}
 
 		if (ti_work & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY))
 			schedule();
@@ -19,7 +16,7 @@ static int xfer_to_guest_mode_work(struct kvm_vcpu *vcpu, unsigned long ti_work)
 		if (ti_work & _TIF_NOTIFY_RESUME)
 			resume_user_mode_work(NULL);
 
-		ret = arch_xfer_to_guest_mode_handle_work(vcpu, ti_work);
+		ret = arch_xfer_to_guest_mode_handle_work(ti_work);
 		if (ret)
 			return ret;
 
@@ -28,7 +25,7 @@ static int xfer_to_guest_mode_work(struct kvm_vcpu *vcpu, unsigned long ti_work)
 	return 0;
 }
 
-int xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcpu)
+int xfer_to_guest_mode_handle_work(void)
 {
 	unsigned long ti_work;
 
@@ -44,6 +41,6 @@ int xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcpu)
 	if (!(ti_work & XFER_TO_GUEST_MODE_WORK))
 		return 0;
 
-	return xfer_to_guest_mode_work(vcpu, ti_work);
+	return xfer_to_guest_mode_work(ti_work);
 }
 EXPORT_SYMBOL_GPL(xfer_to_guest_mode_handle_work);
-- 
2.51.0.261.g7ce5a0a67e-goog


