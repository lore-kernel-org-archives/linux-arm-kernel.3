Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67AED13570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 05:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qfVQwuNFh5Mq/KtdzzfRfMAH0+mhGQ+tJsN+VKfP5lk=; b=GyUxQPUXjU6kq6lKuiC5YPnGM9
	h1+pkFpIm7fKfriUXTkPKp6ijBtKvwo/aH2Dr28GfKURxLqZ7zFHuO/7RfkLIe0WDg5YkOc6AWYjq
	Q4tUJEdracgRbc0TfqCEyZJOjyoWbLwqk1kdpdZq88qVqmIbcl8LEmTvUs/z896Df+cRpN73e5+FR
	vd/Phh2Qdy0c0g8GaBprm911qosJSioqJd1aHcJWpT80n2NnACHDN5S3R2PJkznKZwIgBGxrF7BcK
	ELyzhAHSm4MhIQPwOnw2kscVDVBmr27eeHZjzZaJK5AdjXXij1mmtLCVkm8NmPejCzx/HHLOrNlDA
	uGiQJJuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Idf-00000009ee0-107y;
	Mon, 28 Oct 2024 05:50:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5IP9-00000009bc6-1hKF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 05:35:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F7CA497;
	Sun, 27 Oct 2024 22:35:32 -0700 (PDT)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.16.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C87843F66E;
	Sun, 27 Oct 2024 22:34:58 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	kvmarm@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: [PATCH V2 6/7] arm64/boot: Enable EL2 requirements for FEAT_Debugv8p9
Date: Mon, 28 Oct 2024 11:04:25 +0530
Message-Id: <20241028053426.2486633-7-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241028053426.2486633-1-anshuman.khandual@arm.com>
References: <20241028053426.2486633-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_223503_595480_E59CAE02 
X-CRM114-Status: GOOD (  11.35  )
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

Fine grained trap control for MDSELR_EL1 register needs to be configured in
HDFGRTR2_EL2, and HDFGWTR2_EL2 registers when kernel enters at EL1, but EL2
is also present. This adds a new helper __init_el2_fgt2() initializing this
new FEAT_FGT2 based fine grained registers.

MDCR_EL2.EBWE needs to be enabled for additional (beyond 16) breakpoint and
watchpoint exceptions when kernel enters at EL1, but EL2 is also present.
This updates __init_el2_debug() as required for FEAT_Debugv8p9.

While here, also update booting.rst with MDCR_EL3 and SCR_EL3 requirements.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: kvmarm@lists.linux.dev
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
Changes in V2:

- Orr MDCR_EL2_EBWE directly without an intermittent register

 Documentation/arch/arm64/booting.rst | 19 +++++++++++++++++++
 arch/arm64/include/asm/el2_setup.h   | 26 ++++++++++++++++++++++++++
 arch/arm64/include/asm/kvm_arm.h     |  1 +
 3 files changed, 46 insertions(+)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index b57776a68f15..e69d972018cf 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -285,6 +285,12 @@ Before jumping into the kernel, the following conditions must be met:
 
     - SCR_EL3.FGTEn (bit 27) must be initialised to 0b1.
 
+  For CPUs with the Fine Grained Traps (FEAT_FGT2) extension present:
+
+  - If EL3 is present and the kernel is entered at EL2:
+
+    - SCR_EL3.FGTEn2 (bit 59) must be initialised to 0b1.
+
   For CPUs with support for HCRX_EL2 (FEAT_HCX) present:
 
   - If EL3 is present and the kernel is entered at EL2:
@@ -319,6 +325,19 @@ Before jumping into the kernel, the following conditions must be met:
     - ZCR_EL2.LEN must be initialised to the same value for all CPUs the
       kernel will execute on.
 
+  For CPUs with FEAT_Debugv8p9 extension present:
+
+  - If the kernel is entered at EL1 and EL2 is present:
+
+    - HDFGRTR2_EL2.nMDSELR_EL1 (bit 5) must be initialized to 0b1
+    - HDFGWTR2_EL2.nMDSELR_EL1 (bit 5) must be initialized to 0b1
+    - MDCR_EL2.EBWE (bit 43) must be initialized to 0b1
+
+  - If EL3 is present:
+
+    - MDCR_EL3.TDA (bit 9) must be initialized to 0b0
+    - MDCR_EL3.EBWE (bit 43) must be initialized to 0b1
+
   For CPUs with the Scalable Matrix Extension (FEAT_SME):
 
   - If EL3 is present:
diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index e0ffdf13a18b..289e9d8f8ee6 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -97,6 +97,13 @@
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
 
@@ -215,6 +222,24 @@
 .Lskip_fgt_\@:
 .endm
 
+.macro __init_el2_fgt2
+	mrs	x1, id_aa64mmfr0_el1
+	ubfx	x1, x1, #ID_AA64MMFR0_EL1_FGT_SHIFT, #4
+	cmp	x1, #ID_AA64MMFR0_EL1_FGT_FGT2
+	b.lt	.Lskip_fgt2_\@
+
+	mrs	x1, id_aa64dfr0_el1
+	ubfx	x1, x1, #ID_AA64DFR0_EL1_DebugVer_SHIFT, #4
+	cmp	x1, #ID_AA64DFR0_EL1_DebugVer_V8P9
+	b.lt	.Lskip_dbg_v8p9_\@
+
+	mov_q   x0, HDFGWTR2_EL2_nMDSELR_EL1
+	msr_s	SYS_HDFGWTR2_EL2, x0
+	msr_s	SYS_HDFGRTR2_EL2, x0
+.Lskip_dbg_v8p9_\@:
+.Lskip_fgt2_\@:
+.endm
+
 .macro __init_el2_nvhe_prepare_eret
 	mov	x0, #INIT_PSTATE_EL1
 	msr	spsr_el2, x0
@@ -240,6 +265,7 @@
 	__init_el2_nvhe_idregs
 	__init_el2_cptr
 	__init_el2_fgt
+	__init_el2_fgt2
 .endm
 
 #ifndef __KVM_NVHE_HYPERVISOR__
diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 109a85ee6910..34936f550118 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -312,6 +312,7 @@
 				 GENMASK(15, 0))
 
 /* Hyp Debug Configuration Register bits */
+#define MDCR_EL2_EBWE		(UL(1) << 43)
 #define MDCR_EL2_E2TB_MASK	(UL(0x3))
 #define MDCR_EL2_E2TB_SHIFT	(UL(24))
 #define MDCR_EL2_HPMFZS		(UL(1) << 36)
-- 
2.25.1


