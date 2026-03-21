Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B0A1094481
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 21:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpKGwSyMQkT1wK6PI/j1WmC2VQwOqjtNhXWUyRdyc+0=; b=wOpL1vo1xwze4SswemHYF3fA/1
	nTY2InmlafCeM2Wyf1IJrwg3tDroEWPsLFRfcDcDTQuGzZc5oIcjV35b8J0LG4h5Xcj1OWqdatb1J
	WxFmgrWTCm6QN2GhwfRDfP4ml7mjH0GUJBo+7NoHl8rXVdFH0FBRj4N5UOJ9v1FdQ3AZvqQNA86Vc
	mOWGaH+L8WJngOTWiKkxEaR0NwEOi10BlkVLnehDBQ+jTmFVc5V1lSq/DXkqf+vdg5XFCfs1BW/jC
	I0TtT/DlXH9XmCdfHcJhb0eY1b/p8naLVQiP6FYExGTNZHmxmNGbhRnVmKugPV8UFdjMQ1nlfKF/m
	z4NhS3Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w43oM-0000000Enpl-2BJR;
	Sat, 21 Mar 2026 21:24:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w43oF-0000000EnnA-1ihL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 21:24:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E3FC442F1;
	Sat, 21 Mar 2026 21:24:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C15C2BCB1;
	Sat, 21 Mar 2026 21:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774128278;
	bh=WQrWlxVg8SmXK8lkMbKrshFoo5+NBp6RYI0FqhBZNwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eVLxuQhuEcX1p7sqe9QYw/2blkhng8bVeDps796WgTk6wU8ZFu50SW/QHKsrB/N24
	 rXub3JS26UCNb3FNsDQ1ec7RDa2Lr2pCq3zfbTDorNTKSMwpYUl7nRWLmXKwMPRvvy
	 f1gsiOWOGqU5VzcZVSMNQ/LSyTgSdirUhdqkmSRhrMJOU2pZB0ZvFfMedFW2JfDfl6
	 Xpc+BD5yOQW1lPb1wvanxFvp6G61SIiWvbgoUd2Ar8pivFyvHlJ3xXA7oW3HqR5vsA
	 O6v4O3auASO1SU7+dUwdarnrS/ePbryuu7YTcd0Gj4NPBWxuqaAhYBg04src41soYx
	 +LEKHaV8HGnIA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w43oC-00000004NPB-17gK;
	Sat, 21 Mar 2026 21:24:36 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Mostafa Saleh <smostafa@google.com>,
	Quentin Perret <qperret@google.com>
Subject: [PATCH 2/5] KVM: arm64: pkvm: Simplify BTI handling on CPU boot
Date: Sat, 21 Mar 2026 21:24:16 +0000
Message-ID: <20260321212419.2803972-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260321212419.2803972-1-maz@kernel.org>
References: <20260321212419.2803972-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, smostafa@google.com, qperret@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_142439_483373_AEC2A887 
X-CRM114-Status: GOOD (  12.80  )
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

In order to perform an indirect branch to kvm_host_psci_cpu_entry()
on a BTI-aware system, we first branch to a 'BTI j' landing pad,
and from there branch again to the target.

While this works, this is really not required:

- BLR works with 'BTI c' and 'PACIASP' as the landing pad

- Even if LR gets clobbered by BLR, we are going to restore the
  host's registers, so it is pointless to try and avoid touching
  LR

Given the above, drop the veneer and directly call into C code.
If we were to come back from it, we'd directly enter the error
handler.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/host.S     | 10 ----------
 arch/arm64/kvm/hyp/nvhe/hyp-init.S |  9 +++++----
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/host.S b/arch/arm64/kvm/hyp/nvhe/host.S
index eef15b374abb0..465f6f1dd6414 100644
--- a/arch/arm64/kvm/hyp/nvhe/host.S
+++ b/arch/arm64/kvm/hyp/nvhe/host.S
@@ -291,13 +291,3 @@ SYM_CODE_START(__kvm_hyp_host_forward_smc)
 
 	ret
 SYM_CODE_END(__kvm_hyp_host_forward_smc)
-
-/*
- * kvm_host_psci_cpu_entry is called through br instruction, which requires
- * bti j instruction as compilers (gcc and llvm) doesn't insert bti j for external
- * functions, but bti c instead.
- */
-SYM_CODE_START(kvm_host_psci_cpu_entry)
-       bti j
-       b __kvm_host_psci_cpu_entry
-SYM_CODE_END(kvm_host_psci_cpu_entry)
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-init.S b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
index 5d00bde092010..55e0dce65dc56 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-init.S
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
@@ -213,12 +213,13 @@ SYM_CODE_START_LOCAL(__kvm_hyp_init_cpu)
 	mov	x0, x28
 	bl	___kvm_hyp_init			// Clobbers x0..x2
 
-	/* Leave idmap. */
+	/* Leave idmap -- using BLR is OK, LR is restored from host context */
 	mov	x0, x29
-	ldr	x1, =kvm_host_psci_cpu_entry
-	br	x1
+	ldr	x1, =__kvm_host_psci_cpu_entry
+	blr	x1
 
-	// The core booted in EL1. KVM cannot be initialized on it.
+	// The core booted in EL1, or the C code unexpectedly returned.
+	// Either way, KVM cannot be initialized on it.
 1:	wfe
 	wfi
 	b	1b
-- 
2.47.3


