Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B045109449E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 21:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VwI+iFC+os0LZiR8h0XoComz3kCMJYNiLXeP8+W/HoQ=; b=cOPKpzWw11nFJZdg9OcwCKwghq
	FIJ7mUHk/IpB7pxJUhvUo/r/kGja4UOowG1Kui7cYkBkpfPi1OfoamYIN2I/RzYz2rUSc9fLDhtsh
	95/QVxbZ+EEYCeUIeFQ74E5pkf/zREOXf7FRo76ZS2wE3CpV0iPF0vUe02rHmzyGBrYcQSBvgnyXu
	BTx7POEqQh1RoFhFl8VmIDvVXujBKciTnCsEWzrqyojL9/v/J92FybaSXPaWd4NCiqVomqFLhjVZu
	ou1DKQBlxz0HG/PPN6Aj+643YPuqqLRAaDF9L/NJbA4xBav8Q0bxmf/3gQmcAE0LW/PpcetqSv0Xw
	wpGyNCjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w43oN-0000000EnqI-0VOO;
	Sat, 21 Mar 2026 21:24:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w43oG-0000000EnnC-1DNY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 21:24:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE2A344592;
	Sat, 21 Mar 2026 21:24:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1ABC19421;
	Sat, 21 Mar 2026 21:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774128278;
	bh=8bzD2dk+uDzAASOAfcr9mx9j08i2ZacZn3lcDkDtgcI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J/qjAeiUXbzQ6Ihtts0wvJIaBxgcU8nZ1ymWN86N26Su5HuC8vECXupgUP9rcd8Rk
	 2dDTrcI6HCMEm6NUXDvmIHm9HODPslNfrn8QvW58L/uYxYJkVW6XeUwhDPtczhgDP0
	 edE9qpPx8me7UNYUIHQy7XPXKX27QNSTYDOn9WaM8gDx1k2hpzV7vZu6rTjgDysXLX
	 FwmyJSkBZEwIik/BDgAkvY8xogXgGkeZLofyW6yWueST51BCfldeho3pd9i/VKw8su
	 LNUNxwvO0cAQlL5FY82/eyvJsx3u3rW5jAMBAeyyb+lUDSTa8ghA/htXohtvByrD5J
	 ATRYhxH5p9G9g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w43oD-00000004NPB-00TM;
	Sat, 21 Mar 2026 21:24:37 +0000
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
Subject: [PATCH 5/5] KVM: arm64: Remove extra ISBs when using msr_hcr_el2
Date: Sat, 21 Mar 2026 21:24:19 +0000
Message-ID: <20260321212419.2803972-6-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20260321_142440_365406_C6B55880 
X-CRM114-Status: GOOD (  12.13  )
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

The msr_hcr_el2 macro is slightly awkward, as it provides an ISB
when CONFIG_AMPERE_ERRATUM_AC04_CPU_23 is present, and none
otherwise. Note that this this option is 'default y', meaning that
it is likely to be selected.

Most instances of msr_hcr_el2 are also immediately followed by an ISB,
meaning that in most cases, you end-up with two back-to-back ISBs.
This isn't a big deal, but once you have seen that, you can't unsee it.

Rework the msr_hcr_el2 macro to always provide the ISB, and drop
the superfluous ISBs everywhere else.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/el2_setup.h | 2 --
 arch/arm64/include/asm/sysreg.h    | 6 ++----
 arch/arm64/kernel/hyp-stub.S       | 1 -
 arch/arm64/kvm/hyp/nvhe/host.S     | 1 -
 4 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 85f4c1615472d..3e58d6264581e 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -50,7 +50,6 @@
 	 * effectively VHE-only or not.
 	 */
 	msr_hcr_el2 x0		// Setup HCR_EL2 as nVHE
-	isb
 	mov	x1, #1		// Write something to FAR_EL1
 	msr	far_el1, x1
 	isb
@@ -64,7 +63,6 @@
 .LnE2H0_\@:
 	orr	x0, x0, #HCR_E2H
 	msr_hcr_el2 x0
-	isb
 .LnVHE_\@:
 .endm
 
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index f4436ecc630cd..ca66b8017fa87 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -1114,11 +1114,9 @@
 	.macro	msr_hcr_el2, reg
 #if IS_ENABLED(CONFIG_AMPERE_ERRATUM_AC04_CPU_23)
 	dsb	nsh
-	msr	hcr_el2, \reg
-	isb
-#else
-	msr	hcr_el2, \reg
 #endif
+	msr	hcr_el2, \reg
+	isb			// Required by AMPERE_ERRATUM_AC04_CPU_23
 	.endm
 #else
 
diff --git a/arch/arm64/kernel/hyp-stub.S b/arch/arm64/kernel/hyp-stub.S
index 085bc9972f6bb..634ddc9042444 100644
--- a/arch/arm64/kernel/hyp-stub.S
+++ b/arch/arm64/kernel/hyp-stub.S
@@ -103,7 +103,6 @@ SYM_CODE_START_LOCAL(__finalise_el2)
 	// Engage the VHE magic!
 	mov_q	x0, HCR_HOST_VHE_FLAGS
 	msr_hcr_el2 x0
-	isb
 
 	// Use the EL1 allocated stack, per-cpu offset
 	mrs	x0, sp_el1
diff --git a/arch/arm64/kvm/hyp/nvhe/host.S b/arch/arm64/kvm/hyp/nvhe/host.S
index 465f6f1dd6414..ff10cafa0ca81 100644
--- a/arch/arm64/kvm/hyp/nvhe/host.S
+++ b/arch/arm64/kvm/hyp/nvhe/host.S
@@ -125,7 +125,6 @@ SYM_FUNC_START(__hyp_do_panic)
 	mrs	x0, hcr_el2
 	bic	x0, x0, #HCR_VM
 	msr_hcr_el2 x0
-	isb
 	tlbi	vmalls12e1
 	dsb	nsh
 #endif
-- 
2.47.3


