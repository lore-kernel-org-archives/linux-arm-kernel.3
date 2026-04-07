Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA513FEEF51
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 14:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PdHySec6Mij8BOk3fWQotzJxd+/wyaA9koke7ETN1IA=; b=QYf409y+khBsznxmQXPVQJXlCP
	J9WvjqR3HiTU7mtIIHCr3k+S94Tijj8+pMCKf/+XdBon4vadNsFoT/Lnp/oyCxnn+KUDUMptCOoUR
	R+/BaVTObXpoHshu29m/c593Y69++k2QEUcHonvXNbRxbAK17BX7avf9DyHjds6NEdTDkHA+IwMvc
	/EjdqMSN/b3FxsE7r8W/hXr9ZncYnRbXnjcAvXJDHQuhZ0QujdMn9CmDUCpLLD0LIhYcZ1VJvB4oy
	OOQxLppkbVDmynjVyGWuPTwNQvFw1aMPMmFP5C13IfMcogWR6XYbPBJYfXVk+ykAV6IydBiV7/N07
	sbNvHj4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7Rb-00000006bkq-2xgN;
	Tue, 07 Apr 2026 14:30:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7Ra-00000006bjG-0xsK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 14:30:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AB095600AC;
	Tue,  7 Apr 2026 14:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2794CC19424;
	Tue,  7 Apr 2026 14:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775572217;
	bh=S2a66R25M2ED9iApd77nQWSljUUEXLR9ndadmbDuSus=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BtTCSSexqqOVxXwcQ414Ny61PUY9mAcMdzGtvv4DmvWPbKwDzO3QUKIOZawG4NDBb
	 27cpDSCJqdFlxHkKlEEb0cm4OE+pvfqM2BcaTdmMwHXRkKx8p6x4Qds7OGnitTRCyL
	 c+2q63xzYl2N+RWGeOg8aONVk+gRTVX21H96AF6if+3FyFs1a+/SnK89JNa4DDY+eN
	 rJ6mB/4gyXQcScgfPE+ruhjydng5z5fWep7FOTW/8ffKw6QKM37R01tNh5/nzowm3t
	 /FXODuhHIQ5sS6lu3xtkgOM4HHWlbiwvfOVoF9fAy9nG/u4qJDy5BVjsA6ltQ1ZN79
	 +FTX5kl9dXb0A==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 07 Apr 2026 09:29:47 -0500
Subject: [PATCH v4 5/6] arm64/boot: Enable EL2 requirements for
 FEAT_Debugv8p9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-arm-debug-8-9-v4-5-a4864e69b0ea@kernel.org>
References: <20260407-arm-debug-8-9-v4-0-a4864e69b0ea@kernel.org>
In-Reply-To: <20260407-arm-debug-8-9-v4-0-a4864e69b0ea@kernel.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
 Oliver Upton <oupton@kernel.org>
X-Mailer: b4 0.15-dev
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

From: Anshuman Khandual <anshuman.khandual@arm.com>

Fine grained trap control for MDSELR_EL1 register needs to be configured in
HDFGRTR2_EL2, and HDFGWTR2_EL2 registers when kernel enters at EL1, but EL2
is also present.

MDCR_EL2.EBWE needs to be enabled for additional (beyond 16) breakpoint and
watchpoint exceptions when kernel enters at EL1, but EL2 is also present.

While here, also update booting.rst with MDCR_EL3 and SCR_EL3 requirements.

Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: kvmarm@lists.linux.dev
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v4:
 - Add that the requirements only apply when there are >16
   breakpoints/watchpoints
 - Adapt to changes in v7.0-rc1
---
 Documentation/arch/arm64/booting.rst | 13 +++++++++++++
 arch/arm64/include/asm/el2_setup.h   | 14 ++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index 13ef311dace8..00ba91bbd278 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -369,6 +369,19 @@ Before jumping into the kernel, the following conditions must be met:
     - ZCR_EL2.LEN must be initialised to the same value for all CPUs the
       kernel will execute on.
 
+  For CPUs with FEAT_Debugv8p9 extension present and >16 breakpoints or
+  watchpoints:
+
+  - If the kernel is entered at EL1 and EL2 is present:
+
+    - HDFGRTR2_EL2.nMDSELR_EL1 (bit 5) must be initialized to 0b1
+    - HDFGWTR2_EL2.nMDSELR_EL1 (bit 5) must be initialized to 0b1
+    - MDCR_EL2.EBWE (bit 43) must be initialized to 0b1
+
+  - If EL3 is present:
+
+    - MDCR_EL3.EBWE (bit 43) must be initialized to 0b1
+
   For CPUs with the Scalable Matrix Extension (FEAT_SME):
 
   - If EL3 is present:
diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 85f4c1615472..b51a280c18c0 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -174,6 +174,13 @@
 						// to own it.
 
 .Lskip_trace_\@:
+	mrs	x1, id_aa64dfr0_el1
+	ubfx	x1, x1, #ID_AA64DFR0_EL1_DebugVer_SHIFT, #4
+	cmp	x1, #ID_AA64DFR0_EL1_DebugVer_V8P9
+	b.lt	.Lskip_dbg_v8p9_\@
+
+	orr	x2, x2, #MDCR_EL2_EBWE
+.Lskip_dbg_v8p9_\@:
 	msr	mdcr_el2, x2			// Configure debug traps
 .endm
 
@@ -438,6 +445,13 @@
 	orr	x0, x0, #HDFGRTR2_EL2_nPMSDSFR_EL1
 
 .Lskip_spefds_\@:
+	mrs	x1, id_aa64dfr0_el1
+	ubfx	x1, x1, #ID_AA64DFR0_EL1_DebugVer_SHIFT, #4
+	cmp	x1, #ID_AA64DFR0_EL1_DebugVer_V8P9
+	b.lt	.Lskip_dbg_v8p9_\@
+
+	mov_q   x0, HDFGWTR2_EL2_nMDSELR_EL1
+.Lskip_dbg_v8p9_\@:
 	msr_s   SYS_HDFGRTR2_EL2, x0
 	msr_s   SYS_HDFGWTR2_EL2, x0
 	msr_s   SYS_HFGRTR2_EL2, xzr

-- 
2.53.0


