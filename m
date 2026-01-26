Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE39D778B1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 00:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26BDCJEdJLp7RpCdQh1+Gie1UpBf3nEsfBaL4sC4xLw=; b=Mof5sy2lu5lVQ0bt5aziMQgPAA
	T43FVEK2HHX3r7oZIc9s7Ekmtp58Xja5lhXKands4nGJcNrDA0Y0hY2ANDcI2fXwlgHFwMD3Y4EtA
	oyp04eNBOoTNxqyQ9UpHERq6R1d0Vn3MCoLD9DFus+8oM83amwr9eZzM3KkYVCG1NC16hEqOlTi2/
	KoJiBQn/Q8vADPCVSKFfK6KKwM9BTw/AI5RsHRuvl/W3j6sES1M2qVxaI+G35C8CryMcH5P4L8k+L
	8trwbbmKOQcjnE/4JX4998WSgRMEt64j4qrWLQrGhMB6jbA9sif5cSZOUv9PMEN82xswxTUyuVM+T
	Sb+xNY7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkAXd-0000000BiP0-3UCY;
	Mon, 26 Jan 2026 00:33:17 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkAXY-0000000BiNb-2LNa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 00:33:13 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-47ee8808ffbso29378285e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 16:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769387590; x=1769992390; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=26BDCJEdJLp7RpCdQh1+Gie1UpBf3nEsfBaL4sC4xLw=;
        b=ULZY/WNog2/9xK4r3JYjjIUrYCC564/p4V+gRtC5oEJpqZkwqN1Bg5kOm+eYBBrTOW
         iti44NRvQ2oUWI0aHprOJK96PlG9LIIwMNUpke26vJJZjwSpqaR4u0p+3T9fPLZK5o5J
         GiEvHKN5AkQ/LKMh532WGG2gvVD0Ons6YJg6mMqDRHqxGTgquFhscohMylkGg76OwmrE
         ye5reKF9mukI845i5gUWQLv9OqIw9MA22jydnG+E+iR4xD6efHj+LOwphw6Lc2qPcccx
         oLig6ClUyFlxB6EPIQrziBA1Y+SQz14l8PK9wxAzTOEBtjtZwqRDlIdKnOBZzGnVeihR
         ZCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769387590; x=1769992390;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=26BDCJEdJLp7RpCdQh1+Gie1UpBf3nEsfBaL4sC4xLw=;
        b=HA61TFYrfptR6jPo8XvsWF9+Oot7rAd0VkIykx5+C7z9kNMff+Aj67YGCAPzoUJuYw
         MPrSJc4Z1/jmvo+GPtuJ/Edck9EnS6JgHwvW8qEjPbGFf9kT9ZiYWGVMvYS5BKoZy20k
         /GkR7RRFdt3Ql9vQ7fa5t3GEWcFSIGSK7keqdPRLv2u6hhkvBNa5PT4wUFx4yUPjJ+6X
         YoYYCVT5G/ZBp8uW5K+8ZkOu5Q098NlFrEemWJGDHlBE7/7JNVoJQTIPmJSAuQBPam7I
         oRP9cE9wRx4ieChVd7Dxd2DeSAh+AaGmClW0Y0vVLHJb3i/Xm1K7EZxvMuhaZVYd7VJ4
         DE9g==
X-Forwarded-Encrypted: i=1; AJvYcCXMDyHen363on9ucTnqMEAnEN8MwtjeFPVODFyTvUbvc4XcxE0SSUk+v4/F/pvqojgEjHWKZ05ZCyQ9e7vKSSst@lists.infradead.org
X-Gm-Message-State: AOJu0YwQki3K6pqlIze3cG8/r+SxUsT/JOUnNBp7D5/qhJa8ISqsB/uU
	gyg/vAWAaQlkfcoEyLShR1aNBw2w6KJ7TWxdxsET23BpdL6HiUJlT2RTehLAM7gszkPxqSM+3wo
	2cQ==
X-Received: from wmbjw5.prod.google.com ([2002:a05:600c:5745:b0:47e:e4f5:36ca])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:190c:b0:477:9dc1:b706
 with SMTP id 5b1f17b1804b1-4805ce67eb4mr48399755e9.19.1769387590378; Sun, 25
 Jan 2026 16:33:10 -0800 (PST)
Date: Mon, 26 Jan 2026 01:25:11 +0100
In-Reply-To: <20260126002936.2676435-1-elver@google.com>
Mime-Version: 1.0
References: <20260126002936.2676435-1-elver@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126002936.2676435-3-elver@google.com>
Subject: [PATCH 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_163312_622498_5A20BA65 
X-CRM114-Status: GOOD (  18.30  )
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

1. Replace the _Generic-based __unqual_scalar_typeof() with the builtin
   typeof_unqual(). This strips qualifiers from all types, not just
   integer types, which is required to be able to assign (must be
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

Signed-off-by: Marco Elver <elver@google.com>
---
 arch/arm64/include/asm/rwonce.h | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
index fc0fb42b0b64..9963948f4b44 100644
--- a/arch/arm64/include/asm/rwonce.h
+++ b/arch/arm64/include/asm/rwonce.h
@@ -32,8 +32,7 @@
 #define __READ_ONCE(x)							\
 ({									\
 	typeof(&(x)) __x = &(x);					\
-	int atomic = 1;							\
-	union { __unqual_scalar_typeof(*__x) __val; char __c[1]; } __u;	\
+	union { TYPEOF_UNQUAL(*__x) __val; char __c[1]; } __u;		\
 	switch (sizeof(x)) {						\
 	case 1:								\
 		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
@@ -56,9 +55,9 @@
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
2.52.0.457.g6b5491de43-goog


