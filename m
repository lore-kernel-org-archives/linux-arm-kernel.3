Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6491810398B2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 21:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W7IN1jKPtj/fqNEIRruGs+PBh5CVKVYUV8INgKA9SXY=; b=vAxwB4qWEnYrFWHl9UqVOH1SuO
	CzJy2xZ4qQO9E1XkYmO0+pPy4fHmVTTpH7t2NJxXrHYaJ5EhPrCRs/DjS8a3bv1dQv+Lqpr4eBqAG
	5cnNhhAnuCX08SJb1qR5rRkgP0gvVP5iEu08E5dOu01gxp1cvOuKEE0uuNivJD7fSmmTM3CWyIDei
	rIN1rX4oqAihRLg2mQJvDJ6nO5yO2NLMQwhixRRuv43boJW1m1USmNltgYJM2mnacH760B7jfDAwB
	HMSMR4xM8l+QF9daGFNJrPnIjszo46WAnSO0jsRD/1AU7xmikmgzNxEs4fOU0bGrwBa6sgsArF1PX
	GjZ/+gAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw5Hu-00000009AnA-01Xp;
	Fri, 27 Feb 2026 21:22:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw5Hp-00000009Alm-0tZ9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 21:22:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D4A1441B2;
	Fri, 27 Feb 2026 21:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD410C116C6;
	Fri, 27 Feb 2026 21:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772227332;
	bh=eEg0WdjvlJmJnK77X/yDqNwpaJn5v62ZlBjoFNlgH2U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sBBD6N+eIzSk3HcFAmlk1V2E76j4sKUUJbGutHVh5XWcsAwvuW+t9UkAzJLW6l2HZ
	 9DIn21IktVxCPRItgHwngFDxNa8aJ/ITLGvqb7gm38AoLo66pQguG/diSgxGkNdKIY
	 vmxv7qzX1sut+/YrgYUCQseGyzdVA0GrwrPZx0uSXCLANtIrc6OBvwvsUCsGdkGY/o
	 i+9dWUYb8vOaTDLnC+43HPePd3T0dhUVN7pI4QPU36w4fbwn4r/CloatTIDWzYNZfY
	 ibzIAaKBHapdwezI3+875eHObLjsO4lE7YJsHh1khR1TSyCxTCV8dxRTxvYVMAdgYY
	 u2mISm88tmA5A==
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
Subject: [PATCH v2 1/3] KVM: arm64: Disable TRBE Trace Buffer Unit when running in guest context
Date: Fri, 27 Feb 2026 21:21:33 +0000
Message-ID: <20260227212136.7660-2-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260227212136.7660-1-will@kernel.org>
References: <20260227212136.7660-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_132213_289560_65FBB02A 
X-CRM114-Status: GOOD (  21.84  )
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

The nVHE world-switch code relies on zeroing TRFCR_EL1 to disable trace
generation in guest context when self-hosted TRBE is in use by the host.

Per D3.2.1 ("Controls to prohibit trace at Exception levels"), clearing
TRFCR_EL1 means that trace generation is prohibited at EL1 and EL0 but
per R_YCHKJ the Trace Buffer Unit will still be enabled if
TRBLIMITR_EL1.E is set. R_SJFRQ goes on to state that, when enabled, the
Trace Buffer Unit can perform address translation for the "owning
exception level" even when it is out of context.

Consequently, we can end up in a state where TRBE performs speculative
page-table walks for a host VA/IPA in guest/hypervisor context depending
on the value of MDCR_EL2.E2TB, which changes over world-switch. The
potential result appears to be a heady mixture of SErrors, data
corruption and hardware lockups.

Extend the TRBE world-switch code to clear TRBLIMITR_EL1.E after
draining the buffer, restoring the register on return to the host. This
unfortunately means we need to tackle CPU errata #2064142 and #2038923
which add additional synchronisation requirements around manipulations
of the limit register. Hopefully this doesn't need to be fast.

Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: James Clark <james.clark@linaro.org>
Cc: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>
Fixes: a1319260bf62 ("arm64: KVM: Enable access to TRBE support for host")
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h  |  1 +
 arch/arm64/kvm/hyp/nvhe/debug-sr.c | 73 ++++++++++++++++++++++++++----
 arch/arm64/kvm/hyp/nvhe/switch.c   |  2 +-
 3 files changed, 66 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 5d5a3bbdb95e..1532ad2b2ec2 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -770,6 +770,7 @@ struct kvm_host_data {
 		u64 pmscr_el1;
 		/* Self-hosted trace */
 		u64 trfcr_el1;
+		u64 trblimitr_el1;
 		/* Values of trap registers for the host before guest entry. */
 		u64 mdcr_el2;
 		u64 brbcr_el1;
diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
index 2a1c0f49792b..3dbdee1148d3 100644
--- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
+++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
@@ -57,12 +57,56 @@ static void __trace_do_switch(u64 *saved_trfcr, u64 new_trfcr)
 	write_sysreg_el1(new_trfcr, SYS_TRFCR);
 }
 
-static bool __trace_needs_drain(void)
+static void __trace_drain_and_disable(void)
 {
-	if (is_protected_kvm_enabled() && host_data_test_flag(HAS_TRBE))
-		return read_sysreg_s(SYS_TRBLIMITR_EL1) & TRBLIMITR_EL1_E;
+	u64 *trblimitr_el1 = host_data_ptr(host_debug_state.trblimitr_el1);
 
-	return host_data_test_flag(TRBE_ENABLED);
+	*trblimitr_el1 = 0;
+
+	if (is_protected_kvm_enabled()) {
+		if (!host_data_test_flag(HAS_TRBE))
+			return;
+	} else {
+		if (!host_data_test_flag(TRBE_ENABLED))
+			return;
+	}
+
+	*trblimitr_el1 = read_sysreg_s(SYS_TRBLIMITR_EL1);
+	if (*trblimitr_el1 & TRBLIMITR_EL1_E) {
+		/*
+		 * The host has enabled the Trace Buffer Unit so we have
+		 * to beat the CPU with a stick until it stops accessing
+		 * memory.
+		 */
+
+		/* First, ensure that our prior write to TRFCR has stuck. */
+		isb();
+
+		/* Now synchronise with the trace and drain the buffer. */
+		tsb_csync();
+		dsb(nsh);
+
+		/*
+		 * With no more trace being generated, we can disable the
+		 * Trace Buffer Unit.
+		 */
+		write_sysreg_s(0, SYS_TRBLIMITR_EL1);
+		if (cpus_have_final_cap(ARM64_WORKAROUND_2064142)) {
+			/*
+			 * Some CPUs are so good, we have to drain 'em
+			 * twice.
+			 */
+			tsb_csync();
+			dsb(nsh);
+		}
+
+		/*
+		 * Ensure that the Trace Buffer Unit is disabled before
+		 * we start mucking with the stage-2 and trap
+		 * configuration.
+		 */
+		isb();
+	}
 }
 
 static bool __trace_needs_switch(void)
@@ -79,15 +123,26 @@ static void __trace_switch_to_guest(void)
 
 	__trace_do_switch(host_data_ptr(host_debug_state.trfcr_el1),
 			  *host_data_ptr(trfcr_while_in_guest));
-
-	if (__trace_needs_drain()) {
-		isb();
-		tsb_csync();
-	}
+	__trace_drain_and_disable();
 }
 
 static void __trace_switch_to_host(void)
 {
+	u64 trblimitr_el1 = *host_data_ptr(host_debug_state.trblimitr_el1);
+
+	if (trblimitr_el1 & TRBLIMITR_EL1_E) {
+		/* Re-enable the Trace Buffer Unit for the host. */
+		write_sysreg_s(trblimitr_el1, SYS_TRBLIMITR_EL1);
+		isb();
+		if (cpus_have_final_cap(ARM64_WORKAROUND_2038923)) {
+			/*
+			 * Make sure the unit is re-enabled before we
+			 * poke TRFCR.
+			 */
+			isb();
+		}
+	}
+
 	__trace_do_switch(host_data_ptr(trfcr_while_in_guest),
 			  *host_data_ptr(host_debug_state.trfcr_el1));
 }
diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index 779089e42681..f00688e69d88 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -278,7 +278,7 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	 * We're about to restore some new MMU state. Make sure
 	 * ongoing page-table walks that have started before we
 	 * trapped to EL2 have completed. This also synchronises the
-	 * above disabling of BRBE, SPE and TRBE.
+	 * above disabling of BRBE and SPE.
 	 *
 	 * See DDI0487I.a D8.1.5 "Out-of-context translation regimes",
 	 * rule R_LFHQG and subsequent information statements.
-- 
2.53.0.473.g4a7958ca14-goog


