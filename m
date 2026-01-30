Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA79DE6BF0E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 13:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=scSVMH9or2TMfZesMIFkbkxALtorvxefZYfnvMnEqKA=; b=hUzzW57ZaUO0FqC5MdsL3dm4rC
	aedkVUS0WCvjslIWk6jAqJjOQ3cvc/bXWjeu3dLXrvGrd8q93Cr7ZsfOPct2YwqzQmCOQDtW3Az7E
	3wspaCpMdXzRpy4UVpC8CsT9zcCw+gPeC/1t2H/mtL/80Q6j2D/LBb/3gtb/CrmH8+pcRBKaKJdFQ
	QyRdHRIvW/Zamsa+b25T9r02CpsCwUB8+Udsy8Y168VSwriS3Y4MyoBv92rW7cCfFs7EyR4geS+Z1
	LHm1BW3xGim39Yg3bOtvUi7Tokdccd9QCFE48ea4zlJau3UYRIBK/oOhQ/ilyOZG1cTrj3yWGTdCu
	D33XCDkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vloZk-00000001XDe-2iXJ;
	Fri, 30 Jan 2026 13:30:16 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vloZg-00000001XBR-2LMj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 13:30:13 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-47ee3dd7fc8so23145355e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 05:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769779810; x=1770384610; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=scSVMH9or2TMfZesMIFkbkxALtorvxefZYfnvMnEqKA=;
        b=y7S9inwXnT4qRDBNgJiODZcAB9nltCd7S20iDNskBaRtG/rwmTJzSKhHn5XfEUssN6
         tUhdtXbwlzE6m9i4R+0IkuWFpc/6jjiygHy08FtL09VvOm1a26qGhtgEy0BWpGducKoC
         VIFRM3NNh2DChZx9wn2euZTlx15tOM2N++9Zw91gct2HNG90Ybnnp4XqnK5kuzt1uV+7
         s8bE1bDWIlBnvevKsHQ6L+xDyfir0T5Qt6kX8vVK3bxfpj+PhyLDYkgaG05ymz4CzYzr
         SmdhTjr/lMfhrxWKL+QQUgOvGyIlLQxY8LmbC2g9D4yQRTwIVOE6eKYVHZLAqdM/yHzE
         SmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769779810; x=1770384610;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=scSVMH9or2TMfZesMIFkbkxALtorvxefZYfnvMnEqKA=;
        b=PJatcmflyfs+aj8HHe6Qrra3YwVBShTcvB/7dudb6CGKUeC0Y27jSsiXau5MTLK4Pi
         63rMAP8V2K9x7PvVu8/s1a5g9dCwyoJs9UnNW/WDsRASd6zoMZB5c5jkMSdDc2MW/iUj
         DNAUri6k++n6gvCKbGLvQdJbzU/1LI1xdgpLiwTqYveCOuT/97lE9pLyy5Dh+NjJcMKR
         rLgzuXpBd5PQRMFbeE/6e3XszyK3J5JNM8mGqClUfjNLlGK21yfcZj6/f9ffGbHk+3h7
         txwu+CqpId3zH8NFWuwMpXLm9XckLm1UXypuLdm0ppUeSM7naGCJUm5TxUkGCaoe9Af+
         5HUA==
X-Forwarded-Encrypted: i=1; AJvYcCXwp+Ipx/XscTrsyKSIiRZhLojlrH3QgLhCGk3MdNCSXhfXHpTyMlTrmokp3E4IP8/1Kucs1yjFhbFNflyjHFTq@lists.infradead.org
X-Gm-Message-State: AOJu0YwQMiHzJr8KmNsRFM38dzV7UpGKTYycnoiIPajqMTmBZDkTeMEs
	grw+ukCWpXsXarjagH6OgB2bNx/O3oIFE+OZnQ0DePaCVO/dVG//NUSzwxeqTJZuybk2QKQInfl
	M1g==
X-Received: from wmpx5.prod.google.com ([2002:a05:600c:1885:b0:480:4a03:7b7f])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4507:b0:475:dcbb:7903
 with SMTP id 5b1f17b1804b1-482db45ea8emr33261705e9.9.1769779810315; Fri, 30
 Jan 2026 05:30:10 -0800 (PST)
Date: Fri, 30 Jan 2026 14:28:25 +0100
In-Reply-To: <20260130132951.2714396-1-elver@google.com>
Mime-Version: 1.0
References: <20260130132951.2714396-1-elver@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260130132951.2714396-3-elver@google.com>
Subject: [PATCH v3 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	David Laight <david.laight.linux@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_053012_626624_E1A34957 
X-CRM114-Status: GOOD (  19.93  )
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
v3:
* Comment.

v2:
* Add __rwonce_typeof_unqual() as fallback for old compilers.
---
 arch/arm64/include/asm/rwonce.h | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
index fc0fb42b0b64..42c9e8429274 100644
--- a/arch/arm64/include/asm/rwonce.h
+++ b/arch/arm64/include/asm/rwonce.h
@@ -19,6 +19,20 @@
 		"ldapr"	#sfx "\t" #regs,				\
 	ARM64_HAS_LDAPR)
 
+#ifdef USE_TYPEOF_UNQUAL
+#define __rwonce_typeof_unqual(x) TYPEOF_UNQUAL(x)
+#else
+/*
+ * Fallback for older compilers (Clang < 19).
+ *
+ * Uses the fact that, for all supported Clang versions, 'auto' correctly drops
+ * qualifiers. Unlike typeof_unqual(), the type must be completely defined, i.e.
+ * no forward-declared struct pointer dereferences.  The array-to-pointer decay
+ * case does not matter for usage in READ_ONCE() either.
+ */
+#define __rwonce_typeof_unqual(x) typeof(({ auto ____t = (x); ____t; }))
+#endif
+
 /*
  * When building with LTO, there is an increased risk of the compiler
  * converting an address dependency headed by a READ_ONCE() invocation
@@ -32,8 +46,7 @@
 #define __READ_ONCE(x)							\
 ({									\
 	typeof(&(x)) __x = &(x);					\
-	int atomic = 1;							\
-	union { __unqual_scalar_typeof(*__x) __val; char __c[1]; } __u;	\
+	union { __rwonce_typeof_unqual(*__x) __val; char __c[1]; } __u;	\
 	switch (sizeof(x)) {						\
 	case 1:								\
 		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
@@ -56,9 +69,9 @@
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
2.53.0.rc1.225.gd81095ad13-goog


