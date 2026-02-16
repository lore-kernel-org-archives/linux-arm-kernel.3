Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE4EE81A30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 14:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9bx2SVNA6p6zRS/D5nNjpug9N+EIaRo9Qayx0T8s/E=; b=KJR95uAXOnTEXD24NERRxumapy
	gF6hcRfXlnWWKlxH296dTgX/HRYHkhhqnMJsWIXuVZAECM09hcZtsBJEVgjFYgsiTkVWbb5meFSrU
	Xt+5ImGhq9WdjCj/kaLR2acGtXoYNvD/bSSs5LrD4s8WeGVp/5N8ojFYRXUEGy7KxU3aem9ssj9rY
	xe+Q+SY5Qwe0GaWmvEdyy5b2O5zyh5UEAWbTphH85pogIVSXVBOizsUNhxSNxWPkNTcZ/w57KxwS+
	sWaYHlwU6mlHzCuZvI9BfQDZWwdKT3ZvdPInCihsnwFsKXduGGIAeOYtL33o1P5EjsJaADqwUq7AK
	O4bwRa4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrzwE-00000006oy3-1Zyc;
	Mon, 16 Feb 2026 14:51:02 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrzw7-00000006ovI-2KX5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 14:50:57 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4837246211bso34013995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 06:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771253436; x=1771858236; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=a9bx2SVNA6p6zRS/D5nNjpug9N+EIaRo9Qayx0T8s/E=;
        b=pPZ8r2VJDlm2Tlhdk9hwG8Yy2SBxFSJCt4Sx8e+a6EPZ0/0bfFYD7ru6CDWRikPzZE
         m9uySGv133mvRuuSpskWnpZrTDnXfmDU/JN1So0ZSP2uvivnzzqyZJC+RgyU7uEnqbcB
         OTB9vr1rVYbvCC0VIXzC4I0SHA/YVwrlA2PG49HBbH0cOSsPq5PKC5wsha3+6siVZ1Vk
         jz+fATiN+sUUGs64VbMI/AnLPzOvmOKWw3pvZV/fBBsPI5Qlr9Xw8gsBT5nvEbUqpCWE
         fiSU9QQFHWH0CMGFc2WNZCykq/YKonVtqmGq5DpAIQYrOFQ1sth/DyNufQzskbvg8rx+
         thcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771253436; x=1771858236;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a9bx2SVNA6p6zRS/D5nNjpug9N+EIaRo9Qayx0T8s/E=;
        b=EbUW9Hqfu1hnoaH9E67/cxOouOnTiPmSut8ZfMq0POgo+YetrGlqWlKF8d9P7QavSn
         qtvtVo4jTDW+irZJCf0FkQ2Rcn/RS5BhlwV8qpM6NAR4Tp7u0+6ey/8YiH81aqK/A3II
         9LV8Xm/33a6sXBpfdn18cwZVHQoowPvGtRvqPIH0g1LMODf1154bAwp1E3Vn3SY8zsll
         fsKRc71pyLke70RPSqVOJY9P3k/jlpQoUy0pyJRIcwZI2VfSG1oRrlKA0XiMDO1T3DUO
         HhLGvr6aYrFdKMKxVLsnwEtvGFeVq7yvjxpCZYS59ve2nB1a1M1tJzFovujMqJMdbHUP
         uMtg==
X-Forwarded-Encrypted: i=1; AJvYcCWfrEvcRt5U6EuQyMMkMKKhn8n4120hMA6Jst0h5rWpla1f2mJMqjescpac79djNk65JbNICIMDwFSHNrmUMu6W@lists.infradead.org
X-Gm-Message-State: AOJu0Yym2a2hS5D0a6lDl0zFew3ddeYYHNLk2O1ofgpDzYnAbxQnoFdD
	YckqiizUrFCquiYnK3ykp4iXX++73VCZz42MCxoehZSEdbWjYiu4F+FcpeUDNKb52sBTGW/Rp6f
	ftw==
X-Received: from wmbfj12.prod.google.com ([2002:a05:600c:c8c:b0:480:69c2:3949])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1f8d:b0:47e:e87b:af8
 with SMTP id 5b1f17b1804b1-48373a5ba01mr192805505e9.21.1771253436108; Mon, 16
 Feb 2026 06:50:36 -0800 (PST)
Date: Mon, 16 Feb 2026 15:16:22 +0100
In-Reply-To: <20260216142436.2207937-2-elver@google.com>
Mime-Version: 1.0
References: <20260216142436.2207937-2-elver@google.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
Message-ID: <20260216142436.2207937-3-elver@google.com>
Subject: [PATCH v4 1/2] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	David Laight <david.laight.linux@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_065055_624711_AEE42357 
X-CRM114-Status: GOOD (  22.01  )
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

Rework arm64 LTO __READ_ONCE() to improve code generation as follows:

1. Replace _Generic-based __unqual_scalar_typeof() with more complete
   __rwonce_typeof_unqual(). This strips qualifiers from all types, not
   just integer types, which is required to be able to assign (must be
   non-const) to __u.__val in the non-atomic case (required for #2).

One subtle point here is that non-integer types of __val could be const
or volatile within the union with the old __unqual_scalar_typeof(), if
the passed variable is const or volatile. This would then result in a
forced load from the stack if __u.__val is volatile; in the case of
const, it does look odd if the underlying storage changes, but the
compiler is told said member is "const" -- it smells like UB.

2. Eliminate the atomic flag and ternary conditional expression. Move
   the fallback volatile load into the default case of the switch,
   ensuring __u is unconditionally initialized across all paths.
   The statement expression now unconditionally returns __u.__val.

This refactoring appears to help the compiler improve (or fix) code
generation.

With a defconfig + LTO + debug options builds, we observe different
codegen for the following functions:

	btrfs_reclaim_sweep (708 -> 1032 bytes)
	btrfs_sinfo_bg_reclaim_threshold_store (200 -> 204 bytes)
	check_mem_access (3652 -> 3692 bytes) [inlined bpf_map_is_rdonly]
	console_flush_all (1268 -> 1264 bytes)
	console_lock_spinning_disable_and_check (180 -> 176 bytes)
	igb_add_filter (640 -> 636 bytes)
	igb_config_tx_modes (2404 -> 2400 bytes)
	kvm_vcpu_on_spin (480 -> 476 bytes)
	map_freeze (376 -> 380 bytes)
	netlink_bind (1664 -> 1656 bytes)
	nmi_cpu_backtrace (404 -> 400 bytes)
	set_rps_cpu (516 -> 520 bytes)
	swap_cluster_readahead (944 -> 932 bytes)
	tcp_accecn_third_ack (328 -> 336 bytes)
	tcp_create_openreq_child (1764 -> 1772 bytes)
	tcp_data_queue (5784 -> 5892 bytes)
	tcp_ecn_rcv_synack (620 -> 628 bytes)
	xen_manage_runstate_time (944 -> 896 bytes)
	xen_steal_clock (340 -> 296 bytes)

Increase of some functions are due to more aggressive inlining due to
better codegen (in this build, e.g. bpf_map_is_rdonly is no longer
present due to being inlined completely).

NOTE: The return-value-of-function-drops-qualifiers hack was first
suggested by Al Viro in [1], which notes some of its limitations which
make it unsuitable for a general __unqual_scalar_typeof() replacement.
Notably, array types are not supported, and GCC 8.1-8.3 still fail. Why
should we use it here? READ_ONCE() does not support reading whole
arrays, and the GCC version problem only affects 3 minor releases of a
very ancient still-supported GCC version; not only that, this arm64
READ_ONCE() version is currently only activated by LTO builds, which
to-date are *only supported by Clang*!

Link: https://lore.kernel.org/all/20260111182010.GH3634291@ZenIV/ [1]
Signed-off-by: Marco Elver <elver@google.com>
---
v4:
* Use the return-value-of-function-drops-qualifiers hack to paint the
  bikeshed.

v3:
* Comment.

v2:
* Add __rwonce_typeof_unqual() as fallback for old compilers.
---
 arch/arm64/include/asm/rwonce.h | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
index fc0fb42b0b64..9fd24cef3376 100644
--- a/arch/arm64/include/asm/rwonce.h
+++ b/arch/arm64/include/asm/rwonce.h
@@ -19,6 +19,17 @@
 		"ldapr"	#sfx "\t" #regs,				\
 	ARM64_HAS_LDAPR)
 
+/*
+ * Replace this with typeof_unqual() when minimum compiler versions are
+ * increased to GCC 14 and Clang 19. For the time being, we need this
+ * workaround, which relies on function return values dropping qualifiers.
+ */
+#define __rwonce_typeof_unqual(x) typeof(({				\
+	__diag_push()							\
+	__diag_ignore_all("-Wignored-qualifiers", "")			\
+	((typeof(x)(*)(void))0)();					\
+	__diag_pop() }))
+
 /*
  * When building with LTO, there is an increased risk of the compiler
  * converting an address dependency headed by a READ_ONCE() invocation
@@ -32,8 +43,7 @@
 #define __READ_ONCE(x)							\
 ({									\
 	typeof(&(x)) __x = &(x);					\
-	int atomic = 1;							\
-	union { __unqual_scalar_typeof(*__x) __val; char __c[1]; } __u;	\
+	union { __rwonce_typeof_unqual(*__x) __val; char __c[1]; } __u;	\
 	switch (sizeof(x)) {						\
 	case 1:								\
 		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
@@ -56,9 +66,9 @@
 			: "Q" (*__x) : "memory");			\
 		break;							\
 	default:							\
-		atomic = 0;						\
+		__u.__val = *(volatile typeof(*__x) *)__x;		\
 	}								\
-	atomic ? (typeof(*__x))__u.__val : (*(volatile typeof(*__x) *)__x);\
+	__u.__val;							\
 })
 
 #endif	/* !BUILD_VDSO */
-- 
2.53.0.335.g19a08e0c02-goog


