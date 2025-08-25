Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72A4C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 21:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CT7JgTEeo8ssIUb6BIDGd5TM5agUhLYUjQZKEJ9GRpQ=; b=P36TGQrFeOiDST1Di9IvynSxqY
	WGD7bfhN4Dujx4uTzzs4qV5idDvZ1yR5KX0l+Nyi9hW8WZfx/sNxbPCzFIbd7GsWhJhzibs8HcxFj
	kvNW5wNsVqz9GzcvFa/cEwrZs7WDK/G/KFTpFHTUNCc94SnxU5SJMRuosBBo51QOCxsJIi+a0CkPJ
	7e4kWxs8tDu84auVLvCka5JNWhRqhRzIHifa04IOk7uwpJCCJN6Alkr1j9RHLL8azXGYJ8a5ROcPw
	/wciGfYcMQtSPwNYwRo4E2Vn/a4vYbo7tUtDo5OsfXcaPEynF6g06cQvYulTogCxxYMefJXV2nD4v
	g/e9iQrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqetG-00000009mzR-1NTT;
	Mon, 25 Aug 2025 21:38:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqdSh-00000009Uuz-1fxz
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 25 Aug 2025 20:06:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CT7JgTEeo8ssIUb6BIDGd5TM5agUhLYUjQZKEJ9GRpQ=; b=NAzRBXPbrs3rkajg1XYqEyq116
	0fPN7n9EgC1DZjaU0nuN8bLAPEp2Ite8fVSpaveLcOfJ4JaqNvctUFYDiMW1ck6m3/iWlXzczNrzz
	NQpJ83FVTMPnbgBjEvAIKvKtHnAZm9CDScDmTLut0TzTORGDsswGuI0Q2yIx+7pOH8R3W8RZwlkgf
	Vd99u6JUXqMJGHjevB/l5grJ0x1NxFtrt8jIJZAeQ9l45yHkJEfkE3hj/jDx6kR0RIHtNhYLu/evC
	+ckYzzrkBrfmK8TNrH0i1mfnC2k5r5TaW64HL0IqxEmbXrvLZfyLEEM+Lg4t/5ErHhbnTNNDmA4Yo
	N9bvMfpw==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqdSe-000000021wo-2iSs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 20:06:38 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-24640dae139so27351925ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 13:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756152394; x=1756757194; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=CT7JgTEeo8ssIUb6BIDGd5TM5agUhLYUjQZKEJ9GRpQ=;
        b=TjExNoqkXZGm9N46XQzvrXNFJL4oBHLkesXD7rtzSfifMdOcuKJzjnwPgd420lI/PZ
         +Y1g6A6JwiUQcDGARtU8Ssty1VfnFzzqbOWLRzSxnFUa8vVO4yLDo87CS6cc73a40oBU
         AinoF8ibTby2QVkpNJ8lYq1IUm8qef3NvtyEeBIixXglZZH9MXnLhw3REl6j+vqIeAZJ
         5RS8luecW3MfdfZfyF83S4wO21QJY8RH6PEnYkfO0H40LEf7p/TURIuY1lP44+yoaG1J
         cdgIgjwZyKO4SSosF24kFkEDd41PoFtrTTKY+n3WobyodieVNynG1+Z/TOcWGnx7XuMQ
         T7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756152394; x=1756757194;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CT7JgTEeo8ssIUb6BIDGd5TM5agUhLYUjQZKEJ9GRpQ=;
        b=JIwUjuHIdYoRMVp49EqM2EuW3BPH3akqOakw+WGk0Fg9hhQXBf4z/vB98O3+saXX37
         RM14+8SYCScQfUH9X+Lgyh4YAzwCiXcsfmX8HJ3ThnJMQIj7S27u0yfyPZ8WPy2TAshG
         3054Z5fGNkF9D0lTEJ3AldcF4rkwOmpfNvJb695Vm25ZtWwl7psgNzcXm4h1Sb6U+WIm
         N5fDiEL7XHd5Qx+h6R74HWbwj7y9d+Ux3s992PnH6WE9wYEZ/29fI9eL3sRhLK0xGfRY
         PsT2kdCSHCUClbW/tJA5ewKmpExWCZKMjBYozp9bWRZ3BYmDFBqbNQa3bzliLlD9lWj3
         blwA==
X-Forwarded-Encrypted: i=1; AJvYcCXg4LcmShNsp1u+/iJs3wDLwvDX5HA1fFzUOrsZAG5XbJk00pzqHE/fYF0G2sbKPssUBa8nqlNCk+QdQZPe9OQt@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9sVIyjGcH1BpovTuKuUSojgqdNLTUKLcgjWFIKD2jwrcO/y/z
	PkZw1y0ydd0XEj95VgWt14eJFKj7RlVhc41Gsz+aq4Wk0iO6z3xjAvNAJRH559ECe4l44dXZSlq
	vqEVlRg==
X-Google-Smtp-Source: AGHT+IHfBbVUXQztG4xcJ+8aXPPjjnJpBA+jqNiJZvuMravmup3swJ9oylnciy13R3aKiPcwGzmYXXd0xTE=
X-Received: from pjvb15.prod.google.com ([2002:a17:90a:d88f:b0:311:c197:70a4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f611:b0:246:60d4:8708
 with SMTP id d9443c01a7336-24660d4883amr156063605ad.49.1756152394181; Mon, 25
 Aug 2025 13:06:34 -0700 (PDT)
Date: Mon, 25 Aug 2025 13:06:22 -0700
In-Reply-To: <20250825200622.3759571-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250825200622.3759571-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250825200622.3759571-6-seanjc@google.com>
Subject: [PATCH 5/5] Drivers: hv: Use common "entry virt" APIs to do work
 before running guest
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
X-CRM114-CacheID: sfid-20250825_210636_816341_827B6603 
X-CRM114-Status: GOOD (  16.56  )
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

Use the kernel's common "entry virt" APIs to handle pending work prior to
(re)entering guest mode, now that the virt APIs don't have a superfluous
dependency on KVM.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/hv/Kconfig          |  1 +
 drivers/hv/mshv.h           |  2 --
 drivers/hv/mshv_common.c    | 45 -------------------------------------
 drivers/hv/mshv_root_main.c |  9 +++++---
 4 files changed, 7 insertions(+), 50 deletions(-)

diff --git a/drivers/hv/Kconfig b/drivers/hv/Kconfig
index 57623ca7f350..cdb210cd3710 100644
--- a/drivers/hv/Kconfig
+++ b/drivers/hv/Kconfig
@@ -66,6 +66,7 @@ config MSHV_ROOT
 	# no particular order, making it impossible to reassemble larger pages
 	depends on PAGE_SIZE_4KB
 	select EVENTFD
+	select VIRT_XFER_TO_GUEST_WORK
 	default n
 	help
 	  Select this option to enable support for booting and running as root
diff --git a/drivers/hv/mshv.h b/drivers/hv/mshv.h
index db3aa3831c43..d4813df92b9c 100644
--- a/drivers/hv/mshv.h
+++ b/drivers/hv/mshv.h
@@ -25,6 +25,4 @@ int hv_call_set_vp_registers(u32 vp_index, u64 partition_id, u16 count,
 int hv_call_get_partition_property(u64 partition_id, u64 property_code,
 				   u64 *property_value);
 
-int mshv_do_pre_guest_mode_work(void);
-
 #endif /* _MSHV_H */
diff --git a/drivers/hv/mshv_common.c b/drivers/hv/mshv_common.c
index b953b5e21110..aa2be51979fd 100644
--- a/drivers/hv/mshv_common.c
+++ b/drivers/hv/mshv_common.c
@@ -138,48 +138,3 @@ int hv_call_get_partition_property(u64 partition_id,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(hv_call_get_partition_property);
-
-/*
- * Handle any pre-processing before going into the guest mode on this cpu, most
- * notably call schedule(). Must be invoked with both preemption and
- * interrupts enabled.
- *
- * Returns: 0 on success, -errno on error.
- */
-static int __mshv_do_pre_guest_mode_work(ulong th_flags)
-{
-	if (th_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
-		return -EINTR;
-
-	if (th_flags & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY))
-		schedule();
-
-	if (th_flags & _TIF_NOTIFY_RESUME)
-		resume_user_mode_work(NULL);
-
-	return 0;
-}
-
-int mshv_do_pre_guest_mode_work(void)
-{
-	const ulong work_flags = _TIF_NOTIFY_SIGNAL | _TIF_SIGPENDING |
-				 _TIF_NEED_RESCHED  | _TIF_NEED_RESCHED_LAZY |
-				 _TIF_NOTIFY_RESUME;
-	ulong th_flags;
-
-	th_flags = read_thread_flags();
-	while (th_flags & work_flags) {
-		int ret;
-
-		/* nb: following will call schedule */
-		ret = __mshv_do_pre_guest_mode_work(th_flags);
-		if (ret)
-			return ret;
-
-		th_flags = read_thread_flags();
-	}
-
-	return 0;
-
-}
-EXPORT_SYMBOL_GPL(mshv_do_pre_guest_mode_work);
diff --git a/drivers/hv/mshv_root_main.c b/drivers/hv/mshv_root_main.c
index 6f677fb93af0..387491ca16d6 100644
--- a/drivers/hv/mshv_root_main.c
+++ b/drivers/hv/mshv_root_main.c
@@ -8,6 +8,7 @@
  * Authors: Microsoft Linux virtualization team
  */
 
+#include <linux/entry-virt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/fs.h>
@@ -507,9 +508,11 @@ static long mshv_run_vp_with_root_scheduler(struct mshv_vp *vp)
 		u32 flags = 0;
 		struct hv_output_dispatch_vp output;
 
-		ret = mshv_do_pre_guest_mode_work();
-		if (ret)
-			break;
+		if (__xfer_to_guest_mode_work_pending()) {
+			ret = xfer_to_guest_mode_handle_work();
+			if (ret)
+				break;
+		}
 
 		if (vp->run.flags.intercept_suspend)
 			flags |= HV_DISPATCH_VP_FLAG_CLEAR_INTERCEPT_SUSPEND;
-- 
2.51.0.261.g7ce5a0a67e-goog


