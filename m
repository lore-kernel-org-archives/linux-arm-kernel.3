Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CBBE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 04:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yoQqgnWoTkVYpGd8wWmLfhgo2tVJm3TvVbDKpGIah0g=; b=LSKFGCWQr5MUVMcQXYN9V39ahy
	CTBduMCLlHKbiZpW2oImeHMIy+I7fpTdgNGDnLBAUKMpcRixj36OLbkhdYOAbdPWNB06f4A0MBqFH
	k8TbsqeponUGG5Eik4bH3HrSl9LZFPQlL8K0scFHgX/9lBtNOcL5jbTmLor0DneQkUH5x8L/BGzR9
	Y0r4f/uPs94oWJEVhllpfkgfNJPGbB4ZwawLMRifmyNAqWKpS6CFMHZuZmV6OwnT2kTvTH6zOBpYB
	kDNgXPs8D8zl3hqtk93uYHIK8kCb0nACgcDy4fUNE+ujnl1PncfC40XFlIUyaTXafdSv0uwE1hbr/
	3rY81ndQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN2Tz-00000008zV7-4BFF;
	Mon, 16 Dec 2024 04:13:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN2Pt-00000008yoP-2UbL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 04:09:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52D011AED;
	Sun, 15 Dec 2024 20:09:36 -0800 (PST)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.16.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1A3A13F58B;
	Sun, 15 Dec 2024 20:09:03 -0800 (PST)
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
Subject: [PATCH V3 6/7] arm64/boot: Enable EL2 requirements for FEAT_Debugv8p9
Date: Mon, 16 Dec 2024 09:38:30 +0530
Message-Id: <20241216040831.2448257-7-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241216040831.2448257-1-anshuman.khandual@arm.com>
References: <20241216040831.2448257-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_200909_717832_EA608C5A 
X-CRM114-Status: GOOD (  11.50  )
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
Changes in V3:

- Dropped MDCR_EL3.TDA boot requirement from documentation (separate series)
- Dropped MDCR_EL2_EBWE definition as MDCR_EL2 is now defined in tools sysreg

https://lore.kernel.org/all/20241211065425.1106683-1-anshuman.khandual@arm.com/

 Documentation/arch/arm64/booting.rst | 18 ++++++++++++++++++
 arch/arm64/include/asm/el2_setup.h   | 26 ++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index 3278fb4bf219..054cfe1cad18 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -288,6 +288,12 @@ Before jumping into the kernel, the following conditions must be met:
 
     - SCR_EL3.FGTEn (bit 27) must be initialised to 0b1.
 
+  For CPUs with the Fine Grained Traps (FEAT_FGT2) extension present:
+
+  - If EL3 is present and the kernel is entered at EL2:
+
+    - SCR_EL3.FGTEn2 (bit 59) must be initialised to 0b1.
+
   For CPUs with support for HCRX_EL2 (FEAT_HCX) present:
 
   - If EL3 is present and the kernel is entered at EL2:
@@ -322,6 +328,18 @@ Before jumping into the kernel, the following conditions must be met:
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
+    - MDCR_EL3.EBWE (bit 43) must be initialized to 0b1
+
   For CPUs with the Scalable Matrix Extension (FEAT_SME):
 
   - If EL3 is present:
diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 4ef52d7245bb..2fbfe27d38b5 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -105,6 +105,13 @@
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
 
@@ -244,6 +251,24 @@
 .Lskip_gcs_\@:
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
@@ -283,6 +308,7 @@
 	__init_el2_nvhe_idregs
 	__init_el2_cptr
 	__init_el2_fgt
+	__init_el2_fgt2
         __init_el2_gcs
 .endm
 
-- 
2.25.1


