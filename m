Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E34ED46C18
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 00:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39tQtLJhBsKv56fU5nhbcwIq1x9fDO/7QHDSaFgeP0Q=; b=jBCngIG1/BAm2fDC7Mpn/mritT
	tl4/zroZeYxYDjYMBMqVPLQAKI9N4vVKKHZKY+JfzGEYpESTQ9TbWGwuEgRed+J0g4vYSUB4RRO5h
	pwDPk8ujQuqdLDjYr3ygkYS7i6ZFlLzvyUZJpiVr0b6qKRV/R7E5wNsANHGj8avLkofPygXHwBbS0
	JlvyvvO8gPCVM+daPgn0UH2KSE3IeH0Ow6Vn/3r+qQbSZ5Wt/sgryhZ1NP+ngakKlBm+wdIhigIMs
	HxeayK79VN9WdBRL3oP/y5lxqQ09d9WXz9O44DtrgnnWSbbLljqCv9gg1yNxNwmJBezoMTZP14/51
	0LXq3T4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGLN-0000000H0Rh-03rT;
	Thu, 29 Jan 2026 00:57:09 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGLK-0000000H0Qi-1nOR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 00:57:07 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-480711d09f1so4584725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 16:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769648224; x=1770253024; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=39tQtLJhBsKv56fU5nhbcwIq1x9fDO/7QHDSaFgeP0Q=;
        b=K5ejoEiEMo6sllrHCqgDQV4igF+1GDFoVln33kqMlND7P1qWlOFZHNxzSoEEyPsBjy
         qkWLnNTX2o68eqXJGZPbSRrWCy0dYGj1pE8ecZTjpWWy9MActMH94NeqMStYL0EMftYW
         F5QWkCWugBJgbn4D2ve9vSPjbcC5glQj5hwoz5zvtESjkUUno3cIzGw+vS3HcnPCNp6+
         ejFmKBsBi87E4v9z0TE4kgRzCSjvARp37OhyAZc4tj/YVyl4w65HJqTnoDfhpzflq6l/
         BfOh7N62p4tMCSGRSvjPTxe2ZCarmvWIFM9K3mT4TAZYzfQ3b2AiXiZLLOL/42EqmhjK
         eG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769648224; x=1770253024;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=39tQtLJhBsKv56fU5nhbcwIq1x9fDO/7QHDSaFgeP0Q=;
        b=RtmdQ28cpGlKZo4EfOYd+mdSaCKLihHYzr803gSlLler/nO5AbBEJjwdLT446pl56x
         dSwSd4XPuQfUh90o43a2+BEiJ3Iq0XAGt827P9Ql0iFtUPCTYAlgHE0TyCL1x3MhyFI4
         2AocdNQl4XSGrYpC85YcIaL0KecAz+UOUQbATxKJ4oLcCjyl6ClgDEh90eUBKDn9dKdi
         BKkvrrg7gQMkgrwVEsKM17WIXBA0h5j7/W3JPl6ZfNOC2mnIkFY5MSqjrC68Qgko3FjK
         UlDa3+nUnIB1B/LBPELFpG5uGYu8Tw3+0GZtcJZWroO2IDhpYdNUvgVMwO35tERvnKd5
         2EdA==
X-Forwarded-Encrypted: i=1; AJvYcCWnSkmk1aNHlc86pp7wTJKUVqqFIF/wtbd7yFxa+8DxJm8ZQbTSLwkcXq0x4X8LBEo8ByN8yQK3ZPYe3yDJgSip@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3wVLWIejIcWk6QBQRNg9znPwFaRtqQ9aWiWJMqcYJVXCt1UYd
	wWj5LZIbg/eN5+RNmvTibu7owiR2xgDJXGDwQe4xou+33E6EyWcULz/5VkqTpj12YrN75A+VxfN
	Z3g==
X-Received: from wmor21.prod.google.com ([2002:a05:600c:4595:b0:480:6ccb:80fd])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8217:b0:47e:de9c:92ec
 with SMTP id 5b1f17b1804b1-48069c21045mr85583175e9.14.1769648224306; Wed, 28
 Jan 2026 16:57:04 -0800 (PST)
Date: Thu, 29 Jan 2026 01:52:33 +0100
In-Reply-To: <20260129005645.747680-1-elver@google.com>
Mime-Version: 1.0
References: <20260129005645.747680-1-elver@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129005645.747680-3-elver@google.com>
Subject: [PATCH v2 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_165706_495439_63E34C92 
X-CRM114-Status: GOOD (  20.67  )
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

Once our minimum compiler versions are bumped, this just becomes
TYPEOF_UNQUAL() (or typeof_unqual() should we decide to adopt C23
naming).  Sadly the fallback version of __rwonce_typeof_unqual() cannot
be used as a general TYPEOF_UNQUAL() fallback (see code comments).

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

Signed-off-by: Marco Elver <elver@google.com>
---
v2:
* Add __rwonce_typeof_unqual() as fallback for old compilers.
---
 arch/arm64/include/asm/rwonce.h | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
index fc0fb42b0b64..712de3238f9a 100644
--- a/arch/arm64/include/asm/rwonce.h
+++ b/arch/arm64/include/asm/rwonce.h
@@ -19,6 +19,23 @@
 		"ldapr"	#sfx "\t" #regs,				\
 	ARM64_HAS_LDAPR)
 
+#ifdef USE_TYPEOF_UNQUAL
+#define __rwonce_typeof_unqual(x) TYPEOF_UNQUAL(x)
+#else
+/*
+ * Fallback for older compilers to infer an unqualified type.
+ *
+ * Uses the fact that auto is supposed to drop qualifiers. Unlike
+ * typeof_unqual(), the type must be complete (defines an unevaluated local
+ * variable); this must trivially hold because __READ_ONCE() returns a value.
+ *
+ * Another caveat is that because of array-to-pointer decay, an array is
+ * inferred as a pointer type; this is fine for __READ_ONCE usage, but is
+ * unsuitable as a general fallback implementation for TYPEOF_UNQUAL.
+ */
+#define __rwonce_typeof_unqual(x) typeof(({ auto ____t = (x); ____t; }))
+#endif
+
 /*
  * When building with LTO, there is an increased risk of the compiler
  * converting an address dependency headed by a READ_ONCE() invocation
@@ -32,8 +49,7 @@
 #define __READ_ONCE(x)							\
 ({									\
 	typeof(&(x)) __x = &(x);					\
-	int atomic = 1;							\
-	union { __unqual_scalar_typeof(*__x) __val; char __c[1]; } __u;	\
+	union { __rwonce_typeof_unqual(*__x) __val; char __c[1]; } __u;	\
 	switch (sizeof(x)) {						\
 	case 1:								\
 		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
@@ -56,9 +72,9 @@
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
2.53.0.rc1.217.geba53bf80e-goog


