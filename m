Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7CDC55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 16:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OlVco+inngiGEnvknyK5vR66wpHcUHEUtQhbuVIVbBw=; b=SpPhA0nuxwo3WifnW7pgoN09hs
	/GDUGKCsStDbBI8DnyUNhbFSPbXiKQyRtPN9tgtM+PqCpLmRm5hUaYiajbrNbLQya7hQDowjGI6gz
	no9rF0yLYFI31X/yQ4p/wGlGdPCM5RrkHOSn0aMQfmFGBfvg4BVGVccRaufyzosWyRU3rHi/S9woP
	RNwC9I/iiUyp07/kCHzo7LFUOeBg/ifXtJ5UR3TpPpdj9pUd5ylMiii3PQjXc09wn2LljnRRsEZih
	cnCuwOul9fbJCrUQv/iqDsv1TOGAve0mHCSveftDo6K3Yv/xEMmC1L6hHV9MsMAFZtXXGplOXZ02j
	DW4YhU8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqCgT-0000000Es6y-2WT5;
	Sat, 01 Aug 2026 16:35:37 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqCgQ-0000000Es6Y-2C0r
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 16:35:35 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47f633e6058so2055637f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 09:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785602132; x=1786206932; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OlVco+inngiGEnvknyK5vR66wpHcUHEUtQhbuVIVbBw=;
        b=g9D2wlClVac6Gq0Ay4/ln8TJ/bi1xA/2OvuScJCNgSMZ4wokW+/0svsOi0FpwkP3S+
         8dUYrdA2vetHDAqehMXSdlTv7qzGzqLQsn2yRdYeXP+bFnT2H21u4AoUKR5Fbbc60BvP
         c4TKElqeSQGb0JcU2+TwV1A0WE0eOCxhO8HQMe86olDPhReqjhsZKAJHTc85q89D3KZa
         8nnGOig5NxhfvWxasGvKBOZcEP9kVlsydQoWhnF2XJKhEtbUPzQeadiF2gn7nZKgE4Wi
         BJmxRewCj445exjqM1jO4JuVjsgi7l/LUP4KO8tqayNGlyu0P8e2X7a5BM9F4se2kHAh
         uthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785602132; x=1786206932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OlVco+inngiGEnvknyK5vR66wpHcUHEUtQhbuVIVbBw=;
        b=GoYGKRpGxNHQyRfVVyzp6j1Zqi03QbjoKYJoOrNeiPF0OZ7wiIuQYlGuZ29SGE6s+k
         QFvo0LGZpM53qx0B2uZIMHWmkPh6PRXKM0r88G7tS76vG4QMlnno1sulV4gJLJk9LFyV
         KQ169vDsPN6dzXciCxYYmqLnMw1iFp84Bg85RHzSLxvyRC6gXgU8Aml62l66IRWU7+g2
         ahO54C5pwRS2m3ATZmPKSBze9NlR7IVMpY3+5MCOluNDtEFjT33N761+uKqsReKvMIcw
         ch6eAbUkQ/ZPMsdsmU8DMFc+AyQCfufY8rdQpZcbh58E/tUcDtthvsrMZtcDIPONgtrs
         MELQ==
X-Forwarded-Encrypted: i=1; AHgh+RodgEprYsE+9unQ4td1PzGaHdhER3pv31BeLos7Dc0g54cHOm7uH/4dkaeFLm88LDHxBOfJFQ4EMM2A4rWt4eHZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxSRPKKoMXa30iUuiNLhA/L0pJdj0EfkRKBW+w8NJqrAuWUsACA
	dgC35YyR0C7ygdG5/MB1720qlgN7cFoye9BDwy55TGFFirl2ssqYY0J0
X-Gm-Gg: AR+sD13V2INQJ/rNWrwFwkJVG+4asolq7R9SZahpRu4HMwis4ruBzldRqDUAAEIufa4
	rG0klVbRvqfpR3rjpeM2/Syj7SKbfuCyKqS8+Q+g1Q6p6oOCuryepXuyY8pDW7xOmPdduxl4VTs
	oSiFJpF2sFZwAzh6y2w8zeKAp+ZFC0Yo9ro9XVLasXd92jnQVWU1wny4faGb7q1gV1mtVMfvQTy
	nRURaApZlUbGpS7ek/aXqZHc9wZCHs8bQQ1jDdo8y3vEH7VwM3MhNSdzBqqjp5iOoW8t7IVorFx
	QTsgcgjq2JtHIdPJix+QJz4x+zIP+iIVD8H0ZhoukvqYGQK8+tB4W6E2lWjRoScIgWbUQmK7diT
	G92xAkeJL73UMzXM0WAcKBmN0bOwvtzSa2nXPkWpKv9OrlJpabS+r2hcaIFIbG0H5+9mnVkny39
	YYjQT0uBOpfpdpPIrRsW79mulS2yHqBDs80irTWTj60nVdd0fJjdJS2i9vg9J3qRhFpJG/nuHy3
	y/xJDGt/lWR5TCeISKly2I4C95GHnEUxwDAC3BRPR3+i6o0vMw/eTLHIHSCV68UZw9W0avvVKjO
	E3PCCJ39Y1R0ke+MnPl6IUAIFK5IpiLDcOuLYAQoO38uGSY7X7RoSUe9t65ow3rSlA==
X-Received: by 2002:a5d:5f48:0:b0:46a:8fab:eb44 with SMTP id ffacd0b85a97d-47fd729e7b8mr8907476f8f.1.1785602132433;
        Sat, 01 Aug 2026 09:35:32 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b118-f401-004d-3df1-8834-8499.310.pool.telefonica.de. [2a02:3100:b118:f401:4d:3df1:8834:8499])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1956sm17607243f8f.6.2026.08.01.09.35.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 01 Aug 2026 09:35:31 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] ARM: smp: set current pointer in assembly before jumping into C
Date: Sat,  1 Aug 2026 18:35:20 +0200
Message-Id: <20260801163520.74751-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_093534_591571_9776199B 
X-CRM114-Status: GOOD (  16.33  )
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

With CONFIG_KCOV_INSTRUMENT_ALL=y, secondary CPUs fail to come online
on ARMv6K/ARMv7 SMP:

  CPU1: failed to boot: -38

The compiler inserts a call to __sanitizer_cov_trace_pc() at the entry
of secondary_start_kernel(), before set_current(task). The KCOV hook
dereferences current while TPIDRURO is still uninitialized, causing a
data abort before cpu_init() has installed the exception stacks. The
secondary CPU consequently never completes startup.

Initialize current in the secondary assembly handoff, as
__mmap_switched already does for the boot CPU.

With current set in assembly, the set_current() call in
secondary_start_kernel() is redundant. Drop it together with the
function and the task argument. The hotplug resuscitate path in
arch_cpu_idle_dead() needs no hand-off either, as smp_ops.cpu_die()
can only return if the CPU kept its register state, TPIDRURO included.

Fixes: 50596b7559bf ("ARM: smp: Store current pointer in TPIDRURO register if available")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
v2: drop the redundant set_current() call and helper (Ard), along with
the now-unused task argument to secondary_start_kernel()
v1: https://lore.kernel.org/r/20260718091600.92021-1-kmehltretter@gmail.com/

Tested on QEMU vexpress-a15 (v6.16) with CONFIG_KCOV_INSTRUMENT_ALL=y,
covering SMP bringup and 10 CPU1 offline/online cycles through the
arch_cpu_idle_dead() resuscitate path.

The head-nommu.S change is untested because no currently reachable
Kconfig combination enables non-MMU SMP.

 arch/arm/include/asm/smp.h   |  2 +-
 arch/arm/kernel/head-nommu.S |  1 +
 arch/arm/kernel/head.S       |  1 +
 arch/arm/kernel/smp.c        | 15 ++-------------
 4 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/arch/arm/include/asm/smp.h b/arch/arm/include/asm/smp.h
index 8c05a7f374d8..84aa6a663e81 100644
--- a/arch/arm/include/asm/smp.h
+++ b/arch/arm/include/asm/smp.h
@@ -43,7 +43,7 @@ extern void set_smp_ipi_range(int ipi_base, int nr_ipi);
  * Called from platform specific assembly code, this is the
  * secondary CPU entry point.
  */
-asmlinkage void secondary_start_kernel(struct task_struct *task);
+asmlinkage void secondary_start_kernel(void);
 
 
 /*
diff --git a/arch/arm/kernel/head-nommu.S b/arch/arm/kernel/head-nommu.S
index b9d6818f1ee1..f80bbfbd3a6f 100644
--- a/arch/arm/kernel/head-nommu.S
+++ b/arch/arm/kernel/head-nommu.S
@@ -116,6 +116,7 @@ ENTRY(secondary_startup)
 	ldr	r7, __secondary_data		@ reload r7
 	ldr	sp, [r7, #12]			@ set up the stack pointer
 	ldr	r0, [r7, #16]			@ set up task pointer
+	set_current r0, r1
 	mov	fp, #0
 	b	secondary_start_kernel
 ENDPROC(secondary_startup)
diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
index f22c50d4bd41..a22403a629ef 100644
--- a/arch/arm/kernel/head.S
+++ b/arch/arm/kernel/head.S
@@ -442,6 +442,7 @@ ENTRY(__secondary_switched)
 	adr_l	r7, secondary_data + 12		@ get secondary_data.stack
 	ldr	sp, [r7]
 	ldr	r0, [r7, #4]			@ get secondary_data.task
+	set_current r0, r1
 	mov	fp, #0
 	b	secondary_start_kernel
 ENDPROC(__secondary_switched)
diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
index 50999886a8b5..e30206365877 100644
--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@ -371,12 +371,9 @@ void __noreturn arch_cpu_idle_dead(void)
 	 */
 	__asm__("mov	sp, %0\n"
 	"	mov	fp, #0\n"
-	"	mov	r0, %1\n"
 	"	b	secondary_start_kernel"
 		:
-		: "r" (task_stack_page(current) + THREAD_SIZE - 8),
-		  "r" (current)
-		: "r0");
+		: "r" (task_stack_page(current) + THREAD_SIZE - 8));
 
 	unreachable();
 }
@@ -397,23 +394,15 @@ static void smp_store_cpu_info(unsigned int cpuid)
 	check_cpu_icache_size(cpuid);
 }
 
-static void set_current(struct task_struct *cur)
-{
-	/* Set TPIDRURO */
-	asm("mcr p15, 0, %0, c13, c0, 3" :: "r"(cur) : "memory");
-}
-
 /*
  * This is the secondary CPU boot entry.  We're using this CPUs
  * idle thread stack, but a set of temporary page tables.
  */
-asmlinkage void secondary_start_kernel(struct task_struct *task)
+asmlinkage void secondary_start_kernel(void)
 {
 	struct mm_struct *mm = &init_mm;
 	unsigned int cpu;
 
-	set_current(task);
-
 	secondary_biglittle_init();
 
 	/*
-- 
2.43.0

