Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7399AF588C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 12:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hBlYexUNc8pBpd537ZoQqmp0AEkwoNJqJ+RE5ujTZPM=; b=JqA1EAYk8Tv2ER7VqQ2ollxG+x
	qcXqopjjkt5c43sF5FVXW6YwON2grYxLb9Y6r0zY+iiMrtPUWUucDJcG+YWnezH0sa93QfV+b+g2D
	Vt7GoxoywYNJ7LkZe3h07e6IGyl3dNCRXQpOAEd97wPGJNKrjc9fQEDzzPANk5OMyYJBOTw9Uqh4P
	fwn5Lx/TP2zG/sqktwGeb+9KaqGilxmnYef97+1NidFvBt+wSh4yryjOtPSyq4Cje9RYV9m5c0V+/
	gJ0+moYanapsGo6H2zfbn1srRjhHctlKU1CSNSVAvvbYMOSdpv/G4m1Icbvu9wThFIMuOt7rH3Old
	Izk1sqSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnxS-00000006tqX-0S3v;
	Mon, 20 Apr 2026 12:42:34 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnxP-00000006tpw-1lIE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 12:42:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=hBlYexUNc8pBpd537ZoQqmp0AEkwoNJqJ+RE5ujTZPM=; b=lqi5VH7Q3LGbsjR5ynpxjeT9xd
	6LHnMskNbb+Pytj5lZEMAapzCP0WUsmZRszZcTXklyrfZWQ/q57jnzIVEJ84U+xOMCS6jvbYTCCoB
	g7ngJADxiYSA31n1RySzsD1wjy6hqRaZvXezO/B1G4DS888d0G6EQG3VnIn84dooRYxBAb9e/kLyN
	/lxD+sSqYMlP+fweyroC1Q3GAZhBFnt36ZdFTV+Cv55E0f2uzTERePJjzwElDPVVmS6QOwPfAejPB
	i2Cm55seiE1UTi+z25mpaxtdllFjsHk2LWDs2SULDbtzmRywBzMmkCVfkidcf5VrzFjON8TDkrPlM
	4IpjK/LQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wEnxE-0005Rb-2W;
	Mon, 20 Apr 2026 12:42:21 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 20 Apr 2026 05:42:11 -0700
Subject: [PATCH RFC] arm64/irqflags: force inline of
 arch_local_irq_enable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-arm64_always_inline-v1-1-dba919cf46bc@debian.org>
X-B4-Tracking: v=1; b=H4sIACMf5mkC/yXMTQrCMBAG0KuEb91AGkvEbAUP4FZKSZNRR2oqm
 fpH6d1F3b7FmyFUmARezSj0YOExw6u6UojnkE+kOcErWGOdaazRoVxd04XhGd7ScR44k3Z93KS
 0ivWaHCqFW6Ejv37rAfvdFu0f5d5fKE7fD8vyAVssf3V8AAAA
X-Change-ID: 20260420-arm64_always_inline-6bc9dd3c17e6
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: leo.bras@arm.com, mark.rutland@arm.com, leo.yan@arm.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 palmer@dabbelt.com, paulmck@kernel.org, puranjay@kernel.org, 
 usama.arif@linux.dev, kernel-team@meta.com, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.16-dev-453a6
X-Developer-Signature: v=1; a=openpgp-sha256; l=3883; i=leitao@debian.org;
 h=from:subject:message-id; bh=sa6jaJW8VhkpkA8WVNaQ+/lVqhiagfrKify4okg9W60=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBp5h8oZzRWuiNUQ6ZF3p6Y2qVpj2yWNfl/OIrru
 qZBqY9KpkiJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaeYfKAAKCRA1o5Of/Hh3
 bcueD/9ucwvFKwRx3/XSllb3spiKdNiqM85CPY1/QBStFNFsC1lb2dFbyGKGCl1KAmLFDxnHYSN
 YeWY5DBbRgyHl8XEpuP+Bbnv4oPj+1RyKlovLlaterD64i+jpirBlpO6Dd+mOFazHOMlUDB3Xjv
 MGpgiSKkccrJTQL+m4y5ZY19vEDOlg6Efd5UAR7GxltMhHdMSm5u3kjGIKC+QivuWNAnzChdpcO
 hjnyuktjjQkpUt+j0iWpe3wScwfQKl5RUhBX7fCI3aDHo7m4GtMB+8ZQE1qXibC9vuXmDclh3KF
 fHXqYtmhE1t/CB34JVLu0rwCq9U0zl3pCF1k2/oHgCyo1SdpwLoMD8YWfosbPjbvU4sGGg0OuqG
 UyriGnNc6gJ8N0foRPOD1ywC1fD412dj9LKVPHMneNnnHzvO/gkqjBbBs8DqrYEIQpg0KjthiRI
 Vme2sDNTj27Le8c5b6SJlW3+uk0wiI4LTRVB5saXFSGAtee6h0l6mijD7UcFV2f0BQuaN9225aB
 O1n4ZvAWqG8ZGHcTNSIP4P95lM5MvYJ1aC3/CUBCMp3GUOKKysqLuco0BTztgin/1oSmcixdrTM
 Us0lbZOjgI3s8aoQxnETMceyTT1laagbGmbaDxeRrNdRaPcFcCmDu7DuK8H/pw6NsIe6LOH1Buj
 ibK9ZLMM1jddYLg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_054231_467896_D9A53B3D 
X-CRM114-Status: GOOD (  18.92  )
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

arch_local_irq_enable() is a small wrapper that dispatches between two
unmask paths: __daif_local_irq_enable() on most systems, and
__pmr_local_irq_enable() on builds that use GIC PMR-based masking
(Pseudo-NMI). Both leaf primitives are already __always_inline; the
wrapper itself is plain "static inline".

In practice the compiler does not always inline the wrapper. When it
gets emitted out-of-line, samples taken inside it during the post-WFI
IRQ unmask in default_idle_call() show up as arch_local_irq_enable
overhead in profiles, with default_idle_call() lost from the unwound
chain.

This matters most at fleet scale. On a large arm64 fleet, the
aggregate effect is that idle CPUs show up in fleet-wide profilers as
"busy stuck in arch_local_irq_enable" instead of as idle
(default_idle_call / cpu_startup_entry). Engineers looking at
fleet-wide top-symbol dashboards see what looks like significant
CPU-bound work in IRQ unmasking and chase a phantom hot path, when in
fact the cost is the WFI wake-up cycle being attributed to the wrong
function. Tooling has to special-case this symbol to suppress it,
which is fragile across kernel versions. Inlining the wrapper makes
idle CPUs appear idle in profiles - which is what they are.

The same misattribution affects driver stalls. arm64 PMU overflow is
delivered as a regular IRQ (no NMI on default builds), so a driver
that holds local_irq_disable() for milliseconds defers every PMU
sample to the moment it calls local_irq_enable(). With the wrapper
out-of-line, the resulting fat sample is credited to
arch_local_irq_enable rather than to the driver, and the FP-unwinder
points the call chain at the driver's caller instead of the driver
itself (the immediate caller is skipped because arch_local_irq_enable
is a leaf with no saved frame). The driver is still visible in the
profile from its other samples, but the stall cost itself is
mis-attributed and the chain leading to it is one frame off, making
fleet-wide root-cause analysis harder than it needs to be. Inlining
the wrapper attributes the stall sample to the driver function that
actually held IRQs disabled.

Trade-offs:

 - Minor .text effect: every caller now expands the dispatch +
   underlying primitive at its call site. system_uses_irq_prio_masking()
   is a static-key check, so on non-pNMI systems the inlined body
   collapses to a single MSR daifclr; on pNMI systems it collapses to a
   single sysreg write.

 - Loss of a debugging convenience: there is no longer an
   arch_local_irq_enable symbol to set a breakpoint on. Callers must be
   targeted individually.

 - Compiler trust: __always_inline overrides size heuristics. The body
   is small enough that this should be unobjectionable, but it is a
   policy change.

This patch only flips arch_local_irq_enable(). The same reasoning
applies to arch_local_irq_disable()/save()/restore() which share the
identical static-inline-wrapper-around-__always_inline-primitives
pattern. Holding those off until profiles motivate them.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 arch/arm64/include/asm/irqflags.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
index d4d7451c2c129..505ef5be53a71 100644
--- a/arch/arm64/include/asm/irqflags.h
+++ b/arch/arm64/include/asm/irqflags.h
@@ -40,7 +40,7 @@ static __always_inline void __pmr_local_irq_enable(void)
 	barrier();
 }
 
-static inline void arch_local_irq_enable(void)
+static __always_inline void arch_local_irq_enable(void)
 {
 	if (system_uses_irq_prio_masking()) {
 		__pmr_local_irq_enable();

---
base-commit: 615aad0f61e0c7a898184a394dc895c610100d4f
change-id: 20260420-arm64_always_inline-6bc9dd3c17e6

Best regards,
--  
Breno Leitao <leitao@debian.org>


