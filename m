Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE00DC9832A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 19:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WFiz624ouLEyAAyXLCnZKvLJThEjNkHlXSnv7jS5fHY=; b=eCdnsEre4wioo+/TcS/IZz1MTk
	Xk8R6xZdjT1SikK6dRk+jPghF/dxnhkBFfEM3+HiHsf0L2RPVggxisR18XVFmIVdXzbDaN6YOkVLa
	Rz6dkBbDBdN5Dx/cxXMKTs2P4VBmM/dRUuxApZNQn+qZpkqeC5aSDq+stqX9w7xI/5oJ6eYWobm0i
	bBZg7veu1RwGG6I6lCRFpQySoGZshpn0dc35LVe9LQkCeB3FD3zcf1JwoDiDMrE9wlnmeL9HIzahS
	zEr/wwisRjKkGMWtSoQulIz8U3T56d1UzsUnUjOGYTgVOsoPuaLl8/kmMmNK9YOCLwMGuXATqcWCR
	cBb2fPNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAXqD-0000000FkTX-36bj;
	Sat, 26 Sep 2026 19:13:45 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAXqB-0000000FkT9-0wXJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 19:13:44 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-48449f62b93so613906f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 12:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790450021; x=1791054821; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WFiz624ouLEyAAyXLCnZKvLJThEjNkHlXSnv7jS5fHY=;
        b=eso9dPljR/AikXwi4IkSmOgdUTSvb5N8Y4NtLkfTy/7El2evZAA5lkJSXkzTZVtS7/
         3DTD2E04XCE3yAhQD4NbWFjk0QJGsvEe/mqYInhEUKEFEkZ+Fj/Ub5gSuGr/t6tPq83y
         LBOib0NkWyU6qyWY8TH0e430O0oIppXhE1GHCjL9QWVkKLYOJhZFes5l5vlMSRmAdlad
         3TK/Q+DbBCALKqbMCKmgV1Tg/ZfanfXU+c91/N6ne6/Snnz4/mVklhaoTKaCQf+xr/S9
         Mn3D6Nqgm/afv9WR/M2LkdauBuJXL7k256zPVb7+rA1HDocZQluQEuZSoJwUVfGLs7IH
         RF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790450021; x=1791054821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFiz624ouLEyAAyXLCnZKvLJThEjNkHlXSnv7jS5fHY=;
        b=OfJhYvoS2YbAvDCp0VBke3eF6xsEGCAfmXyju4DkcUXpmiGv+8OCuEy/Hk/8TEFTAh
         ul/Mlpkh5OtES3HizQEbvLSZ/lL2mraf8pA/KCy4XIAyzJKldXO5FArwsEo0ZabTrIK0
         RNmtvY32iB429fTBg+G8TGOhKGDk2uxY79sgdC0UsvQF4+opFGe8YafZycfcMs43Rmp4
         7ADzQ10/HxGfCo2tP6NnTq1KA7EObSmxDaNYXQ0t0GuLIDnt/VD+78mhatgzpwi5haQN
         idA7isHtfQnNk/hooAr6FWGvJuem6BqeeONI6fvezR/SDwrQYfAMuDIphhBP9Emff/Vi
         Ahwg==
X-Forwarded-Encrypted: i=1; AKwUvByH2/fOCqaszUH5bOyTD5cFcBd1IBHcq3RlCCFSC1UP7Am/mU0xzq6d9bdnrtu2xYxh6AxaFPClLVMFxQoXaeD0@lists.infradead.org
X-Gm-Message-State: AFq9FYJ85W6TmjtdwcTHL7/xCl4lCXK/FaTxi06fmVOViRWQ+JYEA7Di
	82J72VWQTQEiq5JTqB3gha+0Of/IMCXu4j5yEA5l0iYIIz9LlHx83RON
X-Gm-Gg: AYBFou29Bb8FQ2C30Dihkf+NpV3/6Lfxuu0LYmMKlmrL2ElJlHGTORmMSW/Q+cw88vt
	p2TBX9pIJF8wtUepRRCsvizflgB156VFkd6q+u3B2FfSnXz8fwisZL6WiWumEipTJ2a5VQaP4NS
	kV9OAY5JR7dImAlgObxnYpO9th3P9ll4gNQacAgXPvM8jI0NDwOHFLAWzyeNhN3Sk9BsEWnoU7K
	UVYQimMOM5eroIq6Ig6WdT8jqhjdhWzkKeyaVBAQ2hgr2z6/rMAx7ZdzkDpl4zWAD/zgiu/5mLb
	mt8/JQo0k7GjtVB3kdCRYXzt43Cg+5WXUPbN7Fuk0S8THADQ9VlwyO/TVKNURSQHnJUOX46+L3I
	+U5wUHllds6MhPAwBdqok/d5LMCheZbNsCHhollIwqbaIQLY8wIl6YZyLjI7O9bwmLr/0f0+oZB
	A85qvqz6VFppOEnrYNg0LCmOxRApKnMXIx6JgCgwcK6h+CTOocIR7kOIiqm6RvArpIhcLnx4Tq6
	RwyLvrd8E1H6I7HJYQIeMRVVMXQupBlujADLMw+1zoSZcO4D+080DfYAmaPJEKkaQAeZrIedsYI
	DB9IcdtIJpmd+WP0Ifb7n2D/K70I8XNJxMe5AcInZoi1XjVeD3iGvfCGPv0BaI+N9LjA6TFhNKP
	z9w==
X-Received: by 2002:a05:6000:2383:b0:488:81d4:8bfc with SMTP id ffacd0b85a97d-48881d48c0bmr10171258f8f.11.1790450020913;
        Sat, 26 Sep 2026 12:13:40 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b162-c701-4960-a998-3de8-2fce.310.pool.telefonica.de. [2a02:3100:b162:c701:4960:a998:3de8:2fce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a36189bsm15364391f8f.21.2026.09.26.12.13.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 26 Sep 2026 12:13:40 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: irq: exclude the softirq stack switch from KCOV
Date: Sat, 26 Sep 2026 21:13:25 +0200
Message-Id: <20260926191325.79047-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_121343_294179_BE409239 
X-CRM114-Status: GOOD (  13.95  )
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

On IRQ exit, __irq_exit_rcu() drops HARDIRQ_OFFSET before calling
invoke_softirq(). The arm64 do_softirq_own_stack() wrapper and its
____do_softirq() trampoline run before __do_softirq() establishes
softirq context, so KCOV records their PCs in the interrupted task's
coverage buffer. They also run outside softirq accounting when
local_bh_enable() reaches do_softirq().

The IRQ-exit coverage makes the KCOV boot selftest fail even after
the scheduler and timer coverage leaks are suppressed. The generic
softirq.o is already excluded from KCOV, but that exclusion does not
cover the separately compiled arm64 wrappers.

Exclude irq.o from KCOV instrumentation, as is already done for the
arm64 entry code. This covers both wrappers even with compilers that
lack the no_sanitize_coverage attribute. The softirq action functions
remain instrumented for explicit remote coverage.

Fixes: 8eb858c44b98 ("arm64: run softirqs on the per-CPU IRQ stack")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
This patch applies without my other pending KCOV or softirq patches.
For testing, the pause series [1] suppresses the other known
timer/scheduler leaks, and the selftest diagnostic [2] reports the
remaining PCs.

Tested on mainline 40288c9206c17 with both prerequisites applied:
- GCC 15.2 arm64 builds, KCOV_INSTRUMENT_ALL and KCOV_SELFTEST enabled.
- QEMU virt/cortex-a76: baseline reports 15 PCs alternating between
  the two wrappers and panics. The fix passes three boots with KASLR
  and three with nokaslr. All KASLR boots have nonzero relocation.
- Raspberry Pi 500, BCM2712 D0: baseline records seven PCs from each
  wrapper. The fixed kernel completes the strict selftest with zero
  PCs. The baseline alone replaces the final panic with a diagnostic
  and return so SSH can retrieve its log. Recording is unchanged.
- Clang 21 W=1 object builds: irq.o has no KCOV callbacks after the
  change, while syscall.o retains its instrumentation.
- Fixed QEMU image: positive PC and comparison coverage remains live
  for getpid() and close(-1), with neither buffer saturated.

My softirq IRQ-exit v3 patch [3] makes the boot selftest pass in QEMU
and on the Pi without this patch. It does not cover the task-context
path through local_bh_enable(). A five-send loopback UDP test shows:

                                    v3    v3 + this patch
  Wrapper PC entries (five sends)  10    0
  Sends covering udp_sendmsg()     5/5   5/5

A bounded syzkaller replay compared my softirq v4 patch [4] alone
against v4 plus this patch. It used 18 reviewed programs with 40
executions per program and variant across four fresh boots in A-B-B-A
order. A is v4 alone; B adds this patch:

                                    v4          v4 + this patch
  Program executions               720         720
  Wrapper PC entries (40 sends)    80          0
  Stable non-wrapper locations     7,172       7,172
  Executions to reach 99%          17          17
  Greedy fixed corpus              16/4,068 B  16/4,068 B
  Executor time                    3.932 s     3.956 s

This fixed replay measures coverage cleanup, not syz-manager discovery
or corpus growth.

A longer replay used the same A-B-B-A order and ran the workload for
30 minutes per variant. Excluding a 30-second warmup from each 15-minute
session left 29 measured minutes per variant:

                                    v4          v4 + this patch
  Program executions               119,883     119,868
  Programs/s                       68.898      68.890
  Mean executor time/program       5.256 ms    5.285 ms
  90%-stable non-wrapper locations 6,959       6,953
  Wrapper PC entries (40 sends)    80          0
  KCOV overflows                   0           0

The 80 entries are 40 instances of each wrapper PC. The variants shared
6,952 stable non-wrapper locations; the six unmatched locations were
route-lookup PCs. The timing differences were not material.

Apply checks pass on v6.1, v6.6, v6.12 and v6.18; those older kernels
have not been built or boot-tested here.

[1] https://lore.kernel.org/all/20260914054632.12877-1-kmehltretter@gmail.com/
[2] https://lore.kernel.org/all/20260919080220.37633-1-kmehltretter@gmail.com/
[3] https://lore.kernel.org/all/20260924041538.52574-1-kmehltretter@gmail.com/
[4] https://lore.kernel.org/r/20260926143505.66024-1-kmehltretter@gmail.com/

 arch/arm64/kernel/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
index d2690c3ec5288..ea66339435bf0 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -25,6 +25,9 @@ KASAN_SANITIZE_stacktrace.o := n
 KCOV_INSTRUMENT_entry-common.o := n
 KCOV_INSTRUMENT_idle.o := n
 
+# Softirq stack switching can run outside interrupt context.
+KCOV_INSTRUMENT_irq.o := n
+
 # Object file lists.
 obj-y			:= debug-monitors.o entry.o irq.o fpsimd.o		\
 			   entry-common.o process.o ptrace.o			\
-- 
2.53.0

