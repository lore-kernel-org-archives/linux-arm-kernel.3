Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A191039895
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 21:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhT3174umwhfAluf32J4rmz2Hi6SsdalIt7g8SIwQGU=; b=gol9wADiEmvoduNuFwTg1pcUfm
	Gae840g54Hojnr69PSj6BKUReaTQocp6ZPCOGHpn9FEPGh9zfEQwNuOFaJhGIcJqG+ItW0vai3fh7
	D53JnxjpCYSraKRjTnH8DctFv+sseJN2EOsXkLoFdMkjWgZnOW9RyYDFVs9XVFNJKfydQyL8hWiy8
	zkzKWFIyWqEofvVmJKXbHhoBelUZ2DGrIa35wTLzNl2WDCO61SjFjE7mWPE8kDEsQnVM692J37YHF
	6l3yF3l+OrXLi9DyEsWN+jyamU+X22/ijK3bZdMPLNV0t+6lDL6Ss9HuTE5NJ+6zZnE3YkCbjCg9T
	GgKBHUfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw5Hw-00000009Ao8-0u9o;
	Fri, 27 Feb 2026 21:22:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw5Hs-00000009Ame-0iUs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 21:22:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D4756012B;
	Fri, 27 Feb 2026 21:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2699C116C6;
	Fri, 27 Feb 2026 21:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772227335;
	bh=JS4Y6gMNrJiL/LX24xhkIUjy4pzMsGcyyYMWRSghIgk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tlidz4tAFMM/OPVPV+LyEHtef5Xlf4otXX99Y1y75Lph9O33zSz7wSjNRJw6FueZi
	 J21uey6oZWSzPVXhNuiZzCcxhaedp1ZrhGFQ1DOkWH1yMlRi9iC6rVsoLHzMqXtDY/
	 zO9F6Lz6lFUSHtmmdxNoTFvdzmH+wYJtQhWeYF0YmHJJqqGtNACAmKQp+3daSHYTTc
	 3sCDPOfp03zn91dD97/U/66X14tPbwEXmeZ9gtu5L6wFzXbYXUzxtyP6YSEXOqzV8p
	 n5GPLkAJZXs9oArno3/F4Ce8Nd2BwADFbupNvMUgk01MHybFtpvkOp9wKiBQa8jfJP
	 9AAxVGAaUVqXg==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Yabin Cui <yabinc@google.com>
Subject: [PATCH v2 2/3] KVM: arm64: Disable SPE Profiling Buffer when running in guest context
Date: Fri, 27 Feb 2026 21:21:34 +0000
Message-ID: <20260227212136.7660-3-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260227212136.7660-1-will@kernel.org>
References: <20260227212136.7660-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The nVHE world-switch code relies on zeroing PMSCR_EL1 to disable
profiling data generation in guest context when SPE is in use by the
host.

Unfortunately, this may leave PMBLIMITR_EL1.E set and consequently we
can end up running in guest/hypervisor context with the Profiling Buffer
enabled. The current "known issues" document for Rev M.a of the Arm ARM
states that this can lead to speculative, out-of-context translations:

  | 2.18 D23136:
  |
  | When the Profiling Buffer is enabled, profiling is not stopped, and
  | Discard mode is not enabled, the Statistical Profiling Unit might
  | cause speculative translations for the owning translation regime,
  | including when the owning translation regime is out-of-context.

In a similar fashion to TRBE, ensure that the Profiling Buffer is
disabled during the nVHE world switch before we start messing with the
stage-2 MMU and trap configuration.

Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: James Clark <james.clark@linaro.org>
Cc: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>
Fixes: f85279b4bd48 ("arm64: KVM: Save/restore the host SPE state when entering/leaving a VM")
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h  |  1 +
 arch/arm64/kvm/hyp/nvhe/debug-sr.c | 33 ++++++++++++++++++++----------
 arch/arm64/kvm/hyp/nvhe/switch.c   |  2 +-
 3 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 1532ad2b2ec2..d527c77977dd 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -768,6 +768,7 @@ struct kvm_host_data {
 		struct kvm_guest_debug_arch regs;
 		/* Statistical profiling extension */
 		u64 pmscr_el1;
+		u64 pmblimitr_el1;
 		/* Self-hosted trace */
 		u64 trfcr_el1;
 		u64 trblimitr_el1;
diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
index 3dbdee1148d3..75158a9cd06a 100644
--- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
+++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
@@ -14,20 +14,20 @@
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_mmu.h>
 
-static void __debug_save_spe(u64 *pmscr_el1)
+static void __debug_save_spe(void)
 {
-	u64 reg;
+	u64 *pmscr_el1, *pmblimitr_el1;
 
-	/* Clear pmscr in case of early return */
-	*pmscr_el1 = 0;
+	pmscr_el1 = host_data_ptr(host_debug_state.pmscr_el1);
+	pmblimitr_el1 = host_data_ptr(host_debug_state.pmblimitr_el1);
 
 	/*
 	 * At this point, we know that this CPU implements
 	 * SPE and is available to the host.
 	 * Check if the host is actually using it ?
 	 */
-	reg = read_sysreg_s(SYS_PMBLIMITR_EL1);
-	if (!(reg & BIT(PMBLIMITR_EL1_E_SHIFT)))
+	*pmblimitr_el1 = read_sysreg_s(SYS_PMBLIMITR_EL1);
+	if (!(*pmblimitr_el1 & BIT(PMBLIMITR_EL1_E_SHIFT)))
 		return;
 
 	/* Yes; save the control register and disable data generation */
@@ -37,18 +37,29 @@ static void __debug_save_spe(u64 *pmscr_el1)
 
 	/* Now drain all buffered data to memory */
 	psb_csync();
+	dsb(nsh);
+
+	/* And disable the profiling buffer */
+	write_sysreg_s(0, SYS_PMBLIMITR_EL1);
+	isb();
 }
 
-static void __debug_restore_spe(u64 pmscr_el1)
+static void __debug_restore_spe(void)
 {
-	if (!pmscr_el1)
+	u64 pmblimitr_el1 = *host_data_ptr(host_debug_state.pmblimitr_el1);
+
+	if (!(pmblimitr_el1 & BIT(PMBLIMITR_EL1_E_SHIFT)))
 		return;
 
 	/* The host page table is installed, but not yet synchronised */
 	isb();
 
+	/* Re-enable the profiling buffer. */
+	write_sysreg_s(pmblimitr_el1, SYS_PMBLIMITR_EL1);
+	isb();
+
 	/* Re-enable data generation */
-	write_sysreg_el1(pmscr_el1, SYS_PMSCR);
+	write_sysreg_el1(*host_data_ptr(host_debug_state.pmscr_el1), SYS_PMSCR);
 }
 
 static void __trace_do_switch(u64 *saved_trfcr, u64 new_trfcr)
@@ -177,7 +188,7 @@ void __debug_save_host_buffers_nvhe(struct kvm_vcpu *vcpu)
 {
 	/* Disable and flush SPE data generation */
 	if (host_data_test_flag(HAS_SPE))
-		__debug_save_spe(host_data_ptr(host_debug_state.pmscr_el1));
+		__debug_save_spe();
 
 	/* Disable BRBE branch records */
 	if (host_data_test_flag(HAS_BRBE))
@@ -195,7 +206,7 @@ void __debug_switch_to_guest(struct kvm_vcpu *vcpu)
 void __debug_restore_host_buffers_nvhe(struct kvm_vcpu *vcpu)
 {
 	if (host_data_test_flag(HAS_SPE))
-		__debug_restore_spe(*host_data_ptr(host_debug_state.pmscr_el1));
+		__debug_restore_spe();
 	if (host_data_test_flag(HAS_BRBE))
 		__debug_restore_brbe(*host_data_ptr(host_debug_state.brbcr_el1));
 	if (__trace_needs_switch())
diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index f00688e69d88..9b6e87dac3b9 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -278,7 +278,7 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	 * We're about to restore some new MMU state. Make sure
 	 * ongoing page-table walks that have started before we
 	 * trapped to EL2 have completed. This also synchronises the
-	 * above disabling of BRBE and SPE.
+	 * above disabling of BRBE.
 	 *
 	 * See DDI0487I.a D8.1.5 "Out-of-context translation regimes",
 	 * rule R_LFHQG and subsequent information statements.
-- 
2.53.0.473.g4a7958ca14-goog


