Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E88CA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 07:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QktHaXKadHoMs1gey1RTjhTLhMxdrZ90tKam6CWs+X0=; b=2TEBipU+cAfvvsncOPaTB34IBp
	VGLTvWRqiaFsXddZC01ITAeRJoJLMEt8bWHIdqbKefbdJ5J3YcciVRprosqp+2aoMPYk3acglwgBd
	4sTbXjrIkpCL1liCxqlG6Sd5T+Y3j1ZFMFc8pyDbQQowykof2ZE+wdJ8DH77QdKEVZ5gvbEkq2W7M
	gBBi84rLL52geANi0ulF5xr/JE8d75ulCqbukvJGe4FblfANATZ+ea3WRhw/uhUbR0VC3TSAzmalo
	y8khMeW2Fk30DlHdl2wj4sQHUnrSbxXasx8N2tw6JP0In8A6Ot9jmv2qB5biHTaZyz9MvLlnJwYXh
	Ojf98OCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4vX-00000005iHB-2qAc;
	Fri, 09 Oct 2026 07:21:59 +0000
Received: from out-216.mta0.migadu.com ([2001:41d0:1004:224b::d8] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4vS-00000005iG3-3sIy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 07:21:57 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=eDr9qjbDolMTro9PuTSl1NUMeg1X4qjYnOhBaA6KHn0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791530512; v=1; x=1792135312;
 b=QBamTnqegQZF2tA8Df/34tbz2lyvUTdLGhl5uhL2NPbxzgg130RZAvRe/gsN8ZWCTwOtZSy8
 CgLO1fHJXlnc7RBkqjs5aTVDUL8GNEIen2W0UE08AWzobddBn/4x+4tvUVDy3AxddNbVLwfQrWY
 3NKqOQV8sDiiRd8Xt+buNmi8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 0e4ce33aa79cbb04;
	Fri, 09 Oct 2026 07:21:52 +0000
X-Mizu-Trace-ID: 0e4ce33aa79cbb04
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	anshuman.khandual@arm.com,
	tabba@google.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: Use symbolic constants for the ccmp NZCV immediates
Date: Fri,  9 Oct 2026 08:21:47 +0100
Message-Id: <20261009072147.474952-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_002155_251496_0285DF09 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

The ccmp instructions in the EL2 setup code, reset_pmuserenr_el0 and
the hyp vectors give the flags to set when their condition fails as a
raw NZCV immediate, #4 or #8. Which condition that leaves true for the
branch that follows has to be worked out from the pseudocode each time.

Define CCMP_NZCV_EQ and CCMP_NZCV_LT from the PSR bits, named for the
condition each leaves true, and pass those instead.

No functional change intended.

Suggested-by: Will Deacon <will@kernel.org>
Link: https://lore.kernel.org/all/asIQ1ZwUjkmNJbRP@willie-the-truck/
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/assembler.h | 2 +-
 arch/arm64/include/asm/el2_setup.h | 4 ++--
 arch/arm64/include/asm/ptrace.h    | 4 ++++
 arch/arm64/kvm/hyp/hyp-entry.S     | 2 +-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index 0b58b550e8dce..b4b97e03db828 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -500,7 +500,7 @@ alternative_else_nop_endif
 	mrs	\tmpreg, id_aa64dfr0_el1
 	ubfx	\tmpreg, \tmpreg, #ID_AA64DFR0_EL1_PMUVer_SHIFT, #4
 	cmp	\tmpreg, #ID_AA64DFR0_EL1_PMUVer_NI
-	ccmp	\tmpreg, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF, #4, ne
+	ccmp	\tmpreg, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF, #CCMP_NZCV_EQ, ne
 	b.eq	9000f				// Skip if no PMU present or IMP_DEF
 	msr	pmuserenr_el0, xzr		// Disable PMU access from EL0
 9000:
diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 1da277baacf78..c0ece880e85bd 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -137,7 +137,7 @@
 	mrs	x1, id_aa64dfr0_el1
 	ubfx	x0, x1, #ID_AA64DFR0_EL1_PMUVer_SHIFT, #4
 	cmp	x0, #ID_AA64DFR0_EL1_PMUVer_NI
-	ccmp	x0, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF, #4, ne
+	ccmp	x0, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF, #CCMP_NZCV_EQ, ne
 	b.eq	.Lskip_pmu_\@			// Skip if no PMU present or IMP_DEF
 	mrs	x0, pmcr_el0			// Disable debug access traps
 	ubfx	x0, x0, #11, #5			// to EL2 and allow access to
@@ -422,7 +422,7 @@
 	mrs	x1, id_aa64dfr0_el1
 	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMUVer_SHIFT, #4
 	cmp	x1, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF
-	ccmp	x1, #ID_AA64DFR0_EL1_PMUVer_V3P9, #8, ne
+	ccmp	x1, #ID_AA64DFR0_EL1_PMUVer_V3P9, #CCMP_NZCV_LT, ne
 	b.lt	.Lskip_pmuv3p9_\@		// Skip if < PMUv3p9 or IMP_DEF
 
 	orr	x0, x0, #HDFGRTR2_EL2_nPMICNTR_EL0
diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index f7dc5fb9427d6..15c381ef7d2c2 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -30,6 +30,10 @@
 #define PSR_MODE_THREAD_BIT	(1 << 0)
 #define PSR_IL_BIT		(1 << 20)
 
+/* CCMP NZCV immediates that make the named condition hold */
+#define CCMP_NZCV_EQ		(PSR_Z_BIT >> 28)
+#define CCMP_NZCV_LT		(PSR_N_BIT >> 28)
+
 /* AArch32-specific ptrace requests */
 #define COMPAT_PTRACE_GETREGS		12
 #define COMPAT_PTRACE_SETREGS		13
diff --git a/arch/arm64/kvm/hyp/hyp-entry.S b/arch/arm64/kvm/hyp/hyp-entry.S
index 03f97d71984c4..8621eacd13738 100644
--- a/arch/arm64/kvm/hyp/hyp-entry.S
+++ b/arch/arm64/kvm/hyp/hyp-entry.S
@@ -46,7 +46,7 @@ el1_sync:				// Guest trapped into EL2
 	mrs	x0, esr_el2
 	ubfx	x0, x0, #ESR_ELx_EC_SHIFT, #ESR_ELx_EC_WIDTH
 	cmp	x0, #ESR_ELx_EC_HVC64
-	ccmp	x0, #ESR_ELx_EC_HVC32, #4, ne
+	ccmp	x0, #ESR_ELx_EC_HVC32, #CCMP_NZCV_EQ, ne
 	b.ne	el1_trap
 
 	/*
-- 
2.39.5


