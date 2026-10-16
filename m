Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6872CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sf5mNV00o+lGDyI9JqU7bAnCuIzXEFZ1o+IyRJ4mbCg=; b=ziTefnIjWvBS52
	UlVymst6sw1UXoeMxVqj0hnC5AtOivZS4G5qtxfvMNon0+ezUOqDDDhvWRATlf/dBcpwsMjnWZxNO
	fEgvyfV/eSQxx5ne2B5aQInlps4WndrlsffmSh7puFftKDFeJvFyHqlKGTb2ekMfMO0ps7ID/9Vtk
	FxE3tJQl16By9LjcV5dgwE8hHlev29HQgGvl9W6HgcxMYzhaM3bM/1+vAYMAlHojCDawI7erjj5Pw
	wIrKMECEFY9mCkxOyXtN735L8yIU1OrJJAkdT54Qa0mSPV9K4gwTZT59dy14bnH4RXQs9rexe+hHH
	f3M7Ss90BnnGTFoVh3pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHl5L-00000003S7B-0AS0;
	Fri, 16 Oct 2026 16:47:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHl5C-00000003S2d-2qNA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:47:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA3C31691;
	Fri, 16 Oct 2026 09:46:58 -0700 (PDT)
Received: from e137867.arm.com (unknown [10.57.15.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AE6633F7B4;
	Fri, 16 Oct 2026 09:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169221; bh=qXBUaA5KxL5AWjSLYun7xW85mAuFz3llcknF2KTjWFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V1oKCD6lJLYUBL2/H4PPBABwwwmw3yvMgPiHJY50kP9sa2qCmUpqHGTkFErsYjUku
	 zxzOMh12/pg6AeDbZAo1yNBy0H7oclh6ErJ2j5JQZMfile+PlWWkfM5dsKKHhVhkpu
	 iVwmFfFJx8Ozjdv/VRghinBzPBgmLMks+pWCsYUY=
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] arm64: sysreg: generate TPIDR, SP and DAIF encodings
Date: Fri, 16 Oct 2026 17:46:45 +0100
Message-ID: <20261016164648.251258-2-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016164648.251258-1-ada.coupriediaz@arm.com>
References: <20261016164648.251258-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_094702_792707_62868667 
X-CRM114-Status: UNSURE (   9.99  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Barry Song <baohua@kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Lucas Wei <lucaswei@google.com>, Mark Brown <broonie@kernel.org>, Andre Przywara <andre.przywara@arm.com>, Tejun Heo <tj@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Introduce missing SYS_DAIF and SYS_SP_EL0 encodings in preparation
for a future commit.
While we are here, replace SYS_SP_EL{1,2} manual encodings with
automatically generated ones.

As the future commit will make use of SYS_TPIDR_EL{1,2} encodings,
replace their and related registers manual encodings with
automatically generated ones as well.

Clean up manual `SYS_CONTEXTIDR_EL2` definition, as it was already
generated.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/sysreg.h |  8 -------
 arch/arm64/tools/sysreg         | 37 +++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 7aa08d59d4944..7948b8c74cf49 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -418,10 +418,6 @@
 #define SYS_PMUSERENR_EL0		sys_reg(3, 3, 9, 14, 0)
 #define SYS_PMOVSSET_EL0		sys_reg(3, 3, 9, 14, 3)
 
-#define SYS_TPIDR_EL0			sys_reg(3, 3, 13, 0, 2)
-#define SYS_TPIDRRO_EL0			sys_reg(3, 3, 13, 0, 3)
-#define SYS_TPIDR2_EL0			sys_reg(3, 3, 13, 0, 5)
-
 #define SYS_SCXTNUM_EL0			sys_reg(3, 3, 13, 0, 7)
 
 /* Definitions for system register interface to AMU for ARMv8.4 onwards */
@@ -520,7 +516,6 @@
 #define SYS_HAFGRTR_EL2			sys_reg(3, 4, 3, 1, 6)
 #define SYS_SPSR_EL2			sys_reg(3, 4, 4, 0, 0)
 #define SYS_ELR_EL2			sys_reg(3, 4, 4, 0, 1)
-#define SYS_SP_EL1			sys_reg(3, 4, 4, 1, 0)
 #define SYS_SPSR_irq			sys_reg(3, 4, 4, 3, 0)
 #define SYS_SPSR_abt			sys_reg(3, 4, 4, 3, 1)
 #define SYS_SPSR_und			sys_reg(3, 4, 4, 3, 2)
@@ -580,8 +575,6 @@
 #define SYS_ICH_LR14_EL2		__SYS__LR8_EL2(6)
 #define SYS_ICH_LR15_EL2		__SYS__LR8_EL2(7)
 
-#define SYS_CONTEXTIDR_EL2		sys_reg(3, 4, 13, 0, 1)
-#define SYS_TPIDR_EL2			sys_reg(3, 4, 13, 0, 2)
 #define SYS_SCXTNUM_EL2			sys_reg(3, 4, 13, 0, 7)
 
 #define __AMEV_op2(m)			(m & 0x7)
@@ -623,7 +616,6 @@
 #define SYS_CNTV_CTL_EL02		sys_reg(3, 5, 14, 3, 1)
 #define SYS_CNTV_CVAL_EL02		sys_reg(3, 5, 14, 3, 2)
 
-#define SYS_SP_EL2			sys_reg(3, 6,  4, 1, 0)
 
 /* AT instructions */
 #define AT_Op0 1
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index e2d37ee221b84..7349744f14211 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2958,6 +2958,10 @@ Res0	4:1
 Field	0	PCRSEL
 EndSysreg
 
+Sysreg	SP_EL0	3	0	4	1	0
+Field	63:0	SP
+EndSysreg
+
 Sysreg	ALLINT	3	0	4	3	0
 Res0	63:14
 Field	13	ALLINT
@@ -3811,6 +3815,15 @@ Sysreg	GCSPR_EL0	3	3	2	5	1
 Fields	GCSPR_ELx
 EndSysreg
 
+Sysreg	DAIF	3	3	4	2	1
+Res0	63:10
+Field	9	D
+Field	8	A
+Field	7	I
+Field	6	F
+Res0	5:0
+EndSysreg
+
 Sysreg	SVCR	3	3	4	2	2
 Res0	63:2
 Field	1	ZA
@@ -3885,6 +3898,22 @@ UnsignedEnum	2:0	F8S1
 EndEnum
 EndSysreg
 
+Sysreg	TPIDR_EL0	3	3	13	0	2
+Field	63:0	ThreadID
+EndSysreg
+
+Sysreg	TPIDRRO_EL0	3	3	13	0	3
+Field	63:0	ThreadID
+EndSysreg
+
+Sysreg	TPIDR2_EL0	3	3	13	0	5
+Field	63:0	ThreadID
+EndSysreg
+
+Sysreg	SP_EL1	3	4	4	1	0
+Field	63:0	SP
+EndSysreg
+
 Sysreg	SCTLR_EL2	3	4	1	0	0
 Field	63	TIDCP
 Field	62	SPINTMASK
@@ -5425,6 +5454,10 @@ Sysreg	CONTEXTIDR_EL2	3	4	13	0	1
 Fields	CONTEXTIDR_ELx
 EndSysreg
 
+Sysreg	TPIDR_EL2	3	4	13	0	2
+Field	63:0	ThreadID
+EndSysreg
+
 Sysreg	CNTPOFF_EL2	3	4	14	0	6
 Field	63:0	PhysicalOffset
 EndSysreg
@@ -5465,6 +5498,10 @@ Sysreg	CONTEXTIDR_EL12	3	5	13	0	1
 Mapping	CONTEXTIDR_EL1
 EndSysreg
 
+Sysreg	SP_EL2	3	6	4	1	0
+Field	63:0	SP
+EndSysreg
+
 SysregFields TTBRx_EL1
 Field	63:48	ASID
 Field	47:1	BADDR
-- 
2.43.0


