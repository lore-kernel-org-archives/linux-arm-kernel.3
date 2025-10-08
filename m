Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99654CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 21:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qLh4JfqdToTCSFHPlw/HO3cQZJoXYFuBoaG7iGYgs6U=; b=3LklypylFAGxpkL9fCRmnuu2By
	A6b9Haz5kJ2bXrqokuOhw1AMrsj/W2Hl0/M47UT/mlPqQtXjgEhrzoIke9lqVr4sVYy1EdmmX79HO
	6IIKTDw+kNYVtq140r6S7UrIApRiuDy7EWk2Ow2nEqXqecATCrTkrvPKE0nKCXMNFjdPP6Fb4bfmO
	jehds2TnjP6FP++euBVTchCmRXEQHKr6nFSPa1UTwEBWIF5XWALkJTp45qW+4bUDq2bBttvrD7HeF
	nemHD3xgngTrcAgyRJR6EAJLJyPPwWl2O1L8eNACqNc8DOOKLm0jdPgE1Z3iBZCugawR0MdkpdBaJ
	Gmx3xJJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6bTP-00000004gkJ-2AsN;
	Wed, 08 Oct 2025 21:13:23 +0000
Received: from mail-pf1-f172.google.com ([209.85.210.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6bTM-00000004gjt-2EK2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 21:13:22 +0000
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7810214dda9so49347b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 14:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759957999; x=1760562799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLh4JfqdToTCSFHPlw/HO3cQZJoXYFuBoaG7iGYgs6U=;
        b=WG7vW8E1GM3RCee8Wrwg6ziklTBw7m65O0edAN8kGOB5GgGWDDRX17F02bNZBlbQR7
         /JUR+IbV9aMnD489Z0I5oX801YCPsPNb4ojKFthqSZoYoz86ZaXVkSD2ahIHyRRw+u/E
         cAI+yoQruwAMyFDC/QvzhwqwifXtZCkESF7n6sgtvUue8EKAOdw//ptIgRBxKKxNCsYw
         YRhlUnSkTfWdAPKy0gaMx26aGwYgcr07683Y64lxZyabd4q1e9K6L5C9ofk5YQqxSttB
         rxqk+zLFe9vRkYxLfbcVSeoqqn4PA5GakRLMvOmfHBUrRFDTOYHkHGTGU7vJ9ocYi0IS
         4NSg==
X-Forwarded-Encrypted: i=1; AJvYcCW8NzehdtXeXmwBhJ/35//qMt8qM2B46s6JWTjhAuwn0FGwTHMf/s9Xcd3ak15m8Z6s9LA/tg822RJilLXtbwCC@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+wNGpSyXIKp7anXGVpMq9apEHEXDyLS/hdm3CfxsS71Epnxsc
	ZV+yuQer4SZxCIXTcphssPz8K2g8skqqmM+vZ/Ed1s2ZEh3cAiYxjIFq
X-Gm-Gg: ASbGnct95OnTy2BhgMKg9j0GJM8VdqSmJhHjr3STggtzN0GE8NHiEPJm3P8Oo/gypzq
	KM+FzXlsmUR9U/F10avp8SKAldsWJR+UNvmmimufuwYsTwOW7UqwdRSnWgDUGZEaVbaG2GA4x1h
	fMXpgjwkqsJ3Qoom6P5CrEF+II6vWQ/QKf0tp1DnKyVHUp1qcuSISy8aWqNBqhlaiAL3BHs+NT3
	tw3qguXqwwKIQ0pfGAGibtVMl2Q660wHJUbBEKt8OLXo3poPLDwr/gTHUzlywmFXbIIEltyUFnb
	3hxu6mjcJ26WHSWFYbDErf6P8K26gEHxMbXbwyg/sOQnURWcm5nIi3ajsMBnQX1fLuBOnd2ytR1
	3eKMG/IC/NCm3R3zJ1xNcsj+dyms9hVN9qiI3y61NvgfFcDYsEi/mPbb3uGupwfzFxbhz41WG5y
	x8msqVKZ5cMJm+sZDD6dCHdz0=
X-Google-Smtp-Source: AGHT+IFSVR1KgZV2nCh81HvRh5o+4N6nOInRYrHDDvVbq5J5rsHIk6/TNC0RmNewXwvlmXbU/eC8yw==
X-Received: by 2002:a05:6a00:a589:b0:781:21db:4e06 with SMTP id d2e1a72fcca58-79382794da2mr3112777b3a.0.1759957998850;
        Wed, 08 Oct 2025 14:13:18 -0700 (PDT)
Received: from localhost ([218.152.98.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794e33efc46sm666364b3a.74.2025.10.08.14.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 14:13:18 -0700 (PDT)
From: Yunseong Kim <ysk@kzalloc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Ard Biesheuvel <ardb@kernel.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	Yunseong Kim <ysk@kzalloc.com>
Subject: [PATCH] arm64: cpufeature: Don't cpu_enable_mte() when KASAN_GENERIC is active
Date: Wed,  8 Oct 2025 21:04:27 +0000
Message-ID: <20251008210425.125021-3-ysk@kzalloc.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_141320_577527_68E579A9 
X-CRM114-Status: GOOD (  18.63  )
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

When a kernel built with CONFIG_KASAN_GENERIC=y is booted on MTE-capable
hardware, a kernel panic occurs early in the boot process. The crash
happens when the CPU feature detection logic attempts to enable the Memory
Tagging Extension (MTE) via cpu_enable_mte().

Because the kernel is instrumented by the software-only Generic KASAN,
the code within cpu_enable_mte() itself is instrumented. This leads to
a fatal memory access fault within KASAN's shadow memory region when
the MTE initialization is attempted. Currently, the only workaround is
to boot with the "arm64.nomte" kernel parameter.

This bug was discovered during work on supporting the Debian debug kernel
on the Arm v9.2 RADXA Orion O6 board:

 https://salsa.debian.org/kernel-team/linux/-/merge_requests/1670

Related kernel configs:

 CONFIG_ARM64_AS_HAS_MTE=y
 CONFIG_ARM64_MTE=y

 CONFIG_KASAN_SHADOW_OFFSET=0xdfff800000000000
 CONFIG_HAVE_ARCH_KASAN=y
 CONFIG_HAVE_ARCH_KASAN_SW_TAGS=y
 CONFIG_HAVE_ARCH_KASAN_HW_TAGS=y
 CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
 CONFIG_CC_HAS_KASAN_GENERIC=y
 CONFIG_CC_HAS_KASAN_SW_TAGS=y

 CONFIG_KASAN=y
 CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX=y
 CONFIG_KASAN_GENERIC=y

The panic log clearly shows the conflict:

[    0.000000] kasan: KernelAddressSanitizer initialized (generic)
[    0.000000] psci: probing for conduit method from ACPI.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS migration not required
[    0.000000] psci: SMC Calling Convention v1.2
[    0.000000] percpu: Embedded 486 pages/cpu s1950104 r8192 d32360 u1990656
[    0.000000] pcpu-alloc: s1950104 r8192 d32360 u1990656 alloc=486*4096
[    0.000000] pcpu-alloc: [0] 00 [0] 01 [0] 02 [0] 03 [0] 04 [0] 05 [0] 06 [0] 07
[    0.000000] pcpu-alloc: [0] 08 [0] 09 [0] 10 [0] 11
[    0.000000] Detected PIPT I-cache on CPU0
[    0.000000] CPU features: detected: Address authentication (architected QARMA3 algorithm)
[    0.000000] CPU features: detected: GICv3 CPU interface
[    0.000000] CPU features: detected: HCRX_EL2 register
[    0.000000] CPU features: detected: Virtualization Host Extensions
[    0.000000] CPU features: detected: Memory Tagging Extension
[    0.000000] CPU features: detected: Asymmetric MTE Tag Check Fault
[    0.000000] CPU features: detected: Spectre-v4
[    0.000000] CPU features: detected: Spectre-BHB
[    0.000000] CPU features: detected: SSBS not fully self-synchronizing
[    0.000000] Unable to handle kernel paging request at virtual address dfff800000000005
[    0.000000] KASAN: null-ptr-deref in range [0x0000000000000028-0x000000000000002f]
[    0.000000] Mem abort info:
[    0.000000]   ESR = 0x0000000096000005
[    0.000000]   EC = 0x25: DABT (current EL), IL = 32 bits
[    0.000000]   SET = 0, FnV = 0
[    0.000000]   EA = 0, S1PTW = 0
[    0.000000]   FSC = 0x05: level 1 translation fault
[    0.000000] Data abort info:
[    0.000000]   ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
[    0.000000]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    0.000000]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    0.000000] [dfff800000000005] address between user and kernel address ranges
[    0.000000] Internal error: Oops: 0000000096000005 [#1]  SMP
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.17+unreleased-debug-arm64 #1 PREEMPTLAZY  Debian 6.17-1~exp1
[    0.000000] pstate: 800000c9 (Nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.000000] pc : cpu_enable_mte+0x104/0x440
[    0.000000] lr : cpu_enable_mte+0xf4/0x440
[    0.000000] sp : ffff800084f67d80
[    0.000000] x29: ffff800084f67d80 x28: 0000000000000043 x27: 0000000000000001
[    0.000000] x26: 0000000000000001 x25: ffff800084204008 x24: ffff800084203da8
[    0.000000] x23: ffff800084204000 x22: ffff800084203000 x21: ffff8000865a8000
[    0.000000] x20: fffffffffffffffe x19: fffffdffddaa6a00 x18: 0000000000000011
[    0.000000] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[    0.000000] x14: 0000000000000000 x13: 0000000000000001 x12: ffff700010a04829
[    0.000000] x11: 1ffff00010a04828 x10: ffff700010a04828 x9 : dfff800000000000
[    0.000000] x8 : ffff800085024143 x7 : 0000000000000001 x6 : ffff700010a04828
[    0.000000] x5 : ffff800084f9d200 x4 : 0000000000000000 x3 : ffff8000800794ac
[    0.000000] x2 : 0000000000000005 x1 : dfff800000000000 x0 : 000000000000002e
[    0.000000] Call trace:
[    0.000000]  cpu_enable_mte+0x104/0x440 (P)
[    0.000000]  enable_cpu_capabilities+0x188/0x208
[    0.000000]  setup_boot_cpu_features+0x44/0x60
[    0.000000]  smp_prepare_boot_cpu+0x9c/0xb8
[    0.000000]  start_kernel+0xc8/0x528
[    0.000000]  __primary_switched+0x8c/0xa0
[    0.000000] Code: 9100c280 d2d00001 f2fbffe1 d343fc02 (38e16841)
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
[    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---

Signed-off-by: Yunseong Kim <ysk@kzalloc.com>
---
 arch/arm64/kernel/cpufeature.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 5ed401ff79e3..a0a9fa1b376d 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2340,6 +2340,24 @@ static void cpu_enable_mte(struct arm64_cpu_capabilities const *cap)
 
 	kasan_init_hw_tags_cpu();
 }
+
+static bool has_usable_mte(const struct arm64_cpu_capabilities *entry, int scope)
+{
+	if (!has_cpuid_feature(entry, scope))
+		return false;
+
+	/*
+	 * MTE and Generic KASAN are mutually exclusive. Generic KASAN is a
+	 * software-only mode that is incompatible with the MTE hardware.
+	 * Do not enable MTE if Generic KASAN is active.
+	 */
+	if (IS_ENABLED(CONFIG_KASAN_GENERIC) && kasan_enabled()) {
+		pr_warn_once("MTE capability disabled due to Generic KASAN conflict\n");
+		return false;
+	}
+
+	return true;
+}
 #endif /* CONFIG_ARM64_MTE */
 
 static void user_feature_fixup(void)
@@ -2850,7 +2868,7 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.desc = "Memory Tagging Extension",
 		.capability = ARM64_MTE,
 		.type = ARM64_CPUCAP_STRICT_BOOT_CPU_FEATURE,
-		.matches = has_cpuid_feature,
+		.matches = has_usable_mte,
 		.cpu_enable = cpu_enable_mte,
 		ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, MTE, MTE2)
 	},
@@ -2858,21 +2876,21 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.desc = "Asymmetric MTE Tag Check Fault",
 		.capability = ARM64_MTE_ASYMM,
 		.type = ARM64_CPUCAP_BOOT_CPU_FEATURE,
-		.matches = has_cpuid_feature,
+		.matches = has_usable_mte,
 		ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, MTE, MTE3)
 	},
 	{
 		.desc = "FAR on MTE Tag Check Fault",
 		.capability = ARM64_MTE_FAR,
 		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
-		.matches = has_cpuid_feature,
+		.matches = has_usable_mte,
 		ARM64_CPUID_FIELDS(ID_AA64PFR2_EL1, MTEFAR, IMP)
 	},
 	{
 		.desc = "Store Only MTE Tag Check",
 		.capability = ARM64_MTE_STORE_ONLY,
 		.type = ARM64_CPUCAP_BOOT_CPU_FEATURE,
-		.matches = has_cpuid_feature,
+		.matches = has_usable_mte,
 		ARM64_CPUID_FIELDS(ID_AA64PFR2_EL1, MTESTOREONLY, IMP)
 	},
 #endif /* CONFIG_ARM64_MTE */
-- 
2.51.0


