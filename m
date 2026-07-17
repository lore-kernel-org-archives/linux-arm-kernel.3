Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71C0C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 14:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YYc5hJyDpXGozemY5+yNPTPEczhQbKUOofGE2WesAxA=; b=quGAIHpXBWD/XshwBqcaDd/ax8
	XErBjll8oO2QJSw68OF+fuZw5mqhaTKIR5/zLp5geA7HVPsk5zl4Ocj/MlffO93xYu4yeVr7SOcQJ
	AIDykqSIo8w1ttyMOl5Mdv/BEYgVS2y0B7pVA4or0Jcx2yS36odJjPcvFYcZV2LVrQLIMOblKEY3I
	QeV5S/ZkwQScfMqw0kT/8sjeydXmEwLTftSSxEFBlqEqZSlE0fnMoL8Kb4ucPXntq9lsVZByEpVIr
	OHn5gIQlU8JDKte6dtSrV1PRjRPLRlLw9sMGZsJQtkBXI0+IhDAttouU5FTJfN1wi0HilcSXioEEH
	/Z6zsz9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjll-00000002V8b-2AjN;
	Fri, 17 Jul 2026 14:42:29 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjlh-00000002V6b-1sGw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 14:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=YYc5hJyDpXGozemY5+yNPTPEczhQbKUOofGE2WesAxA=; b=YCyANhJGY0u/+zoRJNp1IYhhIx
	lxLYawFBPs6IWX4ig+lhEvjNsHl2zPoSOkQce86/dSv2hGzecKviT8m022/V4TzSsuOXV2d/SlH1y
	CJ7tP9mwl/7VrGpGVLl6hcRSm7niwYE5C5LQix3YgH4xvK3Zvfga218KpM9zGeOYAWOy47Jkuk1cM
	LudOFSSION59eCDeifaTpxwHgV3jBC+GPgwG5opJCLmE5opR10Gs41GynKjLALaeLt+DtTThcq27+
	j4goMOqn5voq0Ydml8l/PEyydF08juJQ8qJSS1IAlGUtec9OhzeXEnzO3Vjy+VgCNb68aRIYcTOgC
	+3DCqSIQ==;
Received: from [179.118.191.219] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wkjla-00GdLF-T9; Fri, 17 Jul 2026 16:42:19 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Fri, 17 Jul 2026 11:41:43 -0300
Subject: [PATCH v5 4/4] arm64: vdso32: Implement
 __vdso_futex_robust_try_unlock()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260717-tonyk-robust_arm-v5-4-ffd1ad318d17@igalia.com>
References: <20260717-tonyk-robust_arm-v5-0-ffd1ad318d17@igalia.com>
In-Reply-To: <20260717-tonyk-robust_arm-v5-0-ffd1ad318d17@igalia.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Carlos O'Donell <carlos@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@aerifal.cx>, 
 Torvald Riegel <triegel@redhat.com>, Darren Hart <dvhart@infradead.org>, 
 Ingo Molnar <mingo@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, 
 Arnd Bergmann <arnd@arndb.de>, Uros Bizjak <ubizjak@gmail.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 "Liam R. Howlett" <liam@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, kernel-dev@igalia.com, 
 LKML <linux-kernel@vger.kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_074225_518016_B0D11F24 
X-CRM114-Status: GOOD (  11.40  )
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

Based on aarch64 implementation, provide a 32 bit entry point for
this vDSO.

In order to keep compatibility with arm64_futex_robust_unlock_get_pop(),
make sure to store the pop address at r2 and the compare result value
at r3.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 arch/arm64/kernel/vdso.c            |  9 +++++++++
 arch/arm64/kernel/vdso32/Makefile   |  4 ++++
 arch/arm64/kernel/vdso32/vdso.lds.S |  9 +++++++++
 arch/arm64/kernel/vdso32/vfutex.c   | 33 +++++++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+)

diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
index ff43b74e514e..1e62af9158b9 100644
--- a/arch/arm64/kernel/vdso.c
+++ b/arch/arm64/kernel/vdso.c
@@ -71,6 +71,15 @@ static void vdso_futex_robust_unlock_update_ips(enum vdso_abi abi, struct mm_str
 
 		futex_set_vdso_cs_range(fd, 0, success, end, false);
 	}
+
+#ifdef CONFIG_COMPAT_VDSO
+	if (abi == VDSO_ABI_AA32) {
+		success = (uintptr_t) VDSO_SYMBOL(vdso, futex_list32_try_unlock_cs_start);
+		end = (uintptr_t) VDSO_SYMBOL(vdso, futex_list32_try_unlock_cs_end);
+
+		futex_set_vdso_cs_range(fd, 1, success, end, true);
+	}
+#endif
 }
 #else
 static inline void vdso_futex_robust_unlock_update_ips(enum vdso_abi abi, struct mm_struct *mm) { }
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index 4bd60f059f4a..f3190125c68b 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -97,6 +97,10 @@ munge := ../../../arm/vdso/vdsomunge
 hostprogs := $(munge)
 
 c-obj-vdso := note.o
+ifdef CONFIG_FUTEX_ROBUST_UNLOCK
+  c-obj-vdso += vfutex.o
+endif
+
 c-obj-vdso-gettimeofday := vgettimeofday.o
 
 ifneq ($(c-gettimeofday-y),)
diff --git a/arch/arm64/kernel/vdso32/vdso.lds.S b/arch/arm64/kernel/vdso32/vdso.lds.S
index c374fb0146f3..46c0123b2684 100644
--- a/arch/arm64/kernel/vdso32/vdso.lds.S
+++ b/arch/arm64/kernel/vdso32/vdso.lds.S
@@ -87,6 +87,15 @@ VERSION
 		__vdso_clock_getres;
 		__vdso_clock_gettime64;
 		__vdso_clock_getres_time64;
+#ifdef CONFIG_FUTEX_ROBUST_UNLOCK
+		__vdso_futex_robust_list32_try_unlock;
+#endif
 	local: *;
 	};
 }
+
+#ifdef CONFIG_FUTEX_ROBUST_UNLOCK
+VDSO_futex_list32_try_unlock_cs_success = __futex_list32_try_unlock_cs_success;
+VDSO_futex_list32_try_unlock_cs_start = __futex_list32_try_unlock_cs_start;
+VDSO_futex_list32_try_unlock_cs_end = __futex_list32_try_unlock_cs_end;
+#endif
diff --git a/arch/arm64/kernel/vdso32/vfutex.c b/arch/arm64/kernel/vdso32/vfutex.c
new file mode 100644
index 000000000000..b6ca4b678108
--- /dev/null
+++ b/arch/arm64/kernel/vdso32/vfutex.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#include <linux/stringify.h>
+#include <vdso/futex.h>
+
+#define LABEL(name, sz) __stringify(__futex_list##sz##_try_unlock_cs_##name)
+
+#define GLOBLS(sz) ".globl " LABEL(start, sz) ", " LABEL(success, sz) ", " LABEL(end, sz) "\n"
+
+__u32 __vdso_futex_robust_list32_try_unlock(__u32 *lock, __u32 tid, __u32 *pop)
+{
+	register __u32 *pop_reg asm("r2") = pop, result_reg asm("r3") = 0;
+	__u32 val, zero = 0;
+
+	asm volatile (
+		GLOBLS(32)
+		"retry:						\n"
+		"	ldrex %[val], %[lock]			\n"
+		"	cmp %[tid], %[val]			\n"
+		"	bne " LABEL(end, 32)"			\n"
+		"	strex %[result], %[zero], %[lock]	\n"
+		LABEL(start, 32)":				\n"
+		"	cmp %[result], #0			\n"
+		"	bne retry				\n"
+		LABEL(success, 32)":				\n"
+		"	str %[zero], %[pop_reg]			\n"
+		LABEL(end, 32)":				\n"
+		: [val] "=&r" (val), [result] "=r" (result_reg)
+		: [tid] "r" (tid), [lock] "Q" (*lock), [pop_reg] "Q" (*pop_reg), [zero] "r" (zero)
+		: "cc", "memory"
+	);
+
+	return val;
+}

-- 
2.55.0


