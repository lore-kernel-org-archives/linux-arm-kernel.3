Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12128C71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 15:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xEgelSD5Y6cjUjzsLRZYNoWzpw2Y3t/tsaVt3vKT1wo=; b=315e3kcUWUwgAxC/84Rp46fL4h
	7RN93R/HdgYnwKSlHlBtYg6xPtl0zwTjL/gBuZYAXc8SSVSV6pfTAsVFvTp+tOWsb8+KNUkKkI+5p
	QuUtBKhZ39Q0iL3Gcyn5ZDKTsK+QFVVJpbRU0uiwKJqjUiHUPBnMNYerZ4AZWgM/mRIlqPQo6lO48
	W0LNlpx1ukx/J/mXvsrdeshY4QDpzvSOxxfKcsvQEVH+B/Wz4ZDROMUAeiM+0X9SXbNx6S7ke/geh
	dV+n5DrPkTWrJwviT3p036F3u8JBwG2Zfbp33Du46xOjkFiQJVU1pbg4sT7nxu2bJqtpCLSsDoNjW
	9PsbkS1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6Fe-0000000Gs3g-0q6v;
	Fri, 13 Jun 2025 15:23:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5G9-0000000Gfm4-2uTc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 14:19:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ADFD9A511AF;
	Fri, 13 Jun 2025 14:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E50C4CEE3;
	Fri, 13 Jun 2025 14:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749824396;
	bh=G3QUvE9fVBj/4xzIusLt/Z6WDoefDqStXRa6WM8E3hA=;
	h=From:To:Cc:Subject:Date:From;
	b=nHeLn86wfhg+II2r5HBdwXvxucDtnfYggKiM3diLS3V//sRZ/hdCyqMdlNrnT/2IE
	 L5r8iOK5Xa9cES4i2hdPrHLVI2gUNVXQpj66g/x/hV91YdeRWP3MwmoP+z9ALFBUBq
	 ps7jRfsPbCqqQMYDF2Lbs2DHCeHIN1FaCgM6jyC2hAZa6aIymHzdiSMoUDEAkNoUwZ
	 02C/EwbzW8oWExUX/NxF0+K0M71ZC0BGF0ovYM0pWuRdy3sUwgC/A+Qpd3FQ4+IueT
	 tghZ99sqhC1mqGlataXPxaa4kA/LegTDMT2DJnx+uIBhgi/zhMDqCn2D2TmxrCKAil
	 ueizbu1cLTcZQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uQ5G1-006cHs-5h;
	Fri, 13 Jun 2025 15:19:49 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Mostafa Saleh <smostafa@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH] arm64: Unconditionally select CONFIG_JUMP_LABEL
Date: Fri, 13 Jun 2025 15:19:36 +0100
Message-Id: <20250613141936.2219895-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, aneesh.kumar@kernel.org, smostafa@google.com, will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, ardb@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_071957_863018_DE8C316D 
X-CRM114-Status: GOOD (  12.63  )
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

Aneesh reports that his kernel fails to boot in nVHE mode with
KVM's protected mode enabled. Further investigation by Mostafa
reveals that this fails because CONFIG_JUMP_LABEL=n and that
we have static keys shared between EL1 and EL2.

While this can be worked around, it is obvious that we have long
relied on having CONFIG_JUMP_LABEL enabled at all times, as all
supported compilers now have 'asm goto' (which is the basic block
for jump labels).

Let's simplify our lives once and for all by mandating jump labels.
It's not like anyone else is testing anything without them, and
we already rely on them for other things (kfence, xfs, preempt).

Link: https://lore.kernel.org/r/yq5ah60pkq03.fsf@kernel.org
Reported-by: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Reported-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin marinas <catalin.marinas@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/Kconfig         | 1 +
 arch/arm64/kernel/Makefile | 3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 55fc331af3371..393d71124f5d2 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -256,6 +256,7 @@ config ARM64
 	select HOTPLUG_SMT if HOTPLUG_CPU
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
+	select JUMP_LABEL
 	select KASAN_VMALLOC if KASAN
 	select LOCK_MM_AND_FIND_VMA
 	select MODULES_USE_ELF_RELA
diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
index 2920b0a514037..a2faf0049dab1 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -34,7 +34,7 @@ obj-y			:= debug-monitors.o entry.o irq.o fpsimd.o		\
 			   cpufeature.o alternative.o cacheinfo.o		\
 			   smp.o smp_spin_table.o topology.o smccc-call.o	\
 			   syscall.o proton-pack.o idle.o patching.o pi/	\
-			   rsi.o
+			   rsi.o jump_label.o
 
 obj-$(CONFIG_COMPAT)			+= sys32.o signal32.o			\
 					   sys_compat.o
@@ -47,7 +47,6 @@ obj-$(CONFIG_PERF_EVENTS)		+= perf_regs.o perf_callchain.o
 obj-$(CONFIG_HARDLOCKUP_DETECTOR_PERF)	+= watchdog_hld.o
 obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
 obj-$(CONFIG_CPU_PM)			+= sleep.o suspend.o
-obj-$(CONFIG_JUMP_LABEL)		+= jump_label.o
 obj-$(CONFIG_KGDB)			+= kgdb.o
 obj-$(CONFIG_EFI)			+= efi.o efi-rt-wrapper.o
 obj-$(CONFIG_PCI)			+= pci.o
-- 
2.39.2


