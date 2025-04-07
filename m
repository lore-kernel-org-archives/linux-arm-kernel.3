Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E0DC369A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVnAGMUSTYDJOyrcXnEm0dONHzPaMOATMF9mkSE1I2s=; b=XHN4v1wMKE2dtAq7HD03JbMYjR
	AJLhGkINknS23T+ON6/pRzX1NbGUWM8497yHMPvFOXE29hxZgdAKB6y1xTgBS50MfZq4I9B87tvEB
	ybQFJH6MWMT5u0wTdMGmWjGG0OTnQKfdk6UrS4OYalQBPanwzSuNqo9Rub0mWMNWWarA296WNKPRA
	bB6zgg7+RC+YAtW9YKlIPINUke8nRLUQDOLIvg0TEqQk5jPOZ7/mKt2nMcv/qLyMb6GJ0KE5QJrmD
	BEgdys5E8Vg76EVZ/sy5W8dTzUkOVWk/535jSiHLi4ltnYRbcs6o0HHGUtBanoG9Vl6jOkNokBRZG
	FFK8W85g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rZg-00000001fJF-0UCr;
	Mon, 07 Apr 2025 18:52:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1qUQ-00000001P8S-1XZf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 17:42:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 39E0361365;
	Mon,  7 Apr 2025 17:42:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC88CC4CEDD;
	Mon,  7 Apr 2025 17:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744047749;
	bh=+1HqJO4cLaLllQi418UI/9GswP/adaWlCJaOEPk8HU0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kQAJ1BdAc54CGfUqizsbhpus/6rmV+qOGnt7L3o9MaT6OXOKY8FncNrgfyINeSUTg
	 tvTUJNfSB2gh6ajjLNwCV++KM/hjU/bUKIfG/2QSjEp0t7dbTcqbFd1RmUXs7n+r4a
	 dAePrhjlDrGz9EglHTyLFfEW7e3X1ZIZzANU3rqsaoa5/Im5LGaysr+H9Uz8lBs/Ub
	 0tyMUxi37f1wdByiQvEM1GlUM34bu31zWGg8lcuyeRma3AYVJJmm1OM0K46FYu7RWg
	 vvV24VYcwyokRYSqUcRjF8TWvoDSMdlkjFhzAEwIEA4zw26JftpP9HEMKf4JlxqDEz
	 hB1cyXDNaM/lg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Mon, 07 Apr 2025 12:41:30 -0500
Subject: [PATCH v21 1/4] arm64/sysreg: Add BRBE registers and fields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-arm-brbe-v19-v21-1-ff187ff6c928@kernel.org>
References: <20250407-arm-brbe-v19-v21-0-ff187ff6c928@kernel.org>
In-Reply-To: <20250407-arm-brbe-v19-v21-0-ff187ff6c928@kernel.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, Mark Brown <broonie@kernel.org>
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

This patch adds definitions related to the Branch Record Buffer Extension
(BRBE) as per ARM DDI 0487K.a. These will be used by KVM and a BRBE driver
in subsequent patches.

Some existing BRBE definitions in asm/sysreg.h are replaced with equivalent
generated definitions.

Cc: Marc Zyngier <maz@kernel.org>
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: "Rob Herring (Arm)" <robh@kernel.org>
Tested-by: James Clark <james.clark@linaro.org>
---
v19:
- split BRBINF.CC field into mantissa and exponent
---
 arch/arm64/include/asm/sysreg.h |  17 ++----
 arch/arm64/tools/sysreg         | 132 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 138 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 2639d3633073..67e96494749e 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -198,16 +198,8 @@
 #define SYS_DBGVCR32_EL2		sys_reg(2, 4, 0, 7, 0)
 
 #define SYS_BRBINF_EL1(n)		sys_reg(2, 1, 8, (n & 15), (((n & 16) >> 2) | 0))
-#define SYS_BRBINFINJ_EL1		sys_reg(2, 1, 9, 1, 0)
 #define SYS_BRBSRC_EL1(n)		sys_reg(2, 1, 8, (n & 15), (((n & 16) >> 2) | 1))
-#define SYS_BRBSRCINJ_EL1		sys_reg(2, 1, 9, 1, 1)
 #define SYS_BRBTGT_EL1(n)		sys_reg(2, 1, 8, (n & 15), (((n & 16) >> 2) | 2))
-#define SYS_BRBTGTINJ_EL1		sys_reg(2, 1, 9, 1, 2)
-#define SYS_BRBTS_EL1			sys_reg(2, 1, 9, 0, 2)
-
-#define SYS_BRBCR_EL1			sys_reg(2, 1, 9, 0, 0)
-#define SYS_BRBFCR_EL1			sys_reg(2, 1, 9, 0, 1)
-#define SYS_BRBIDR0_EL1			sys_reg(2, 1, 9, 2, 0)
 
 #define SYS_TRCITECR_EL1		sys_reg(3, 0, 1, 2, 3)
 #define SYS_TRCACATR(m)			sys_reg(2, 1, 2, ((m & 7) << 1), (2 | (m >> 3)))
@@ -273,8 +265,6 @@
 /* ETM */
 #define SYS_TRCOSLAR			sys_reg(2, 1, 1, 0, 4)
 
-#define SYS_BRBCR_EL2			sys_reg(2, 4, 9, 0, 0)
-
 #define SYS_MIDR_EL1			sys_reg(3, 0, 0, 0, 0)
 #define SYS_MPIDR_EL1			sys_reg(3, 0, 0, 0, 5)
 #define SYS_REVIDR_EL1			sys_reg(3, 0, 0, 0, 6)
@@ -607,7 +597,6 @@
 #define SYS_CNTHV_CVAL_EL2		sys_reg(3, 4, 14, 3, 2)
 
 /* VHE encodings for architectural EL0/1 system registers */
-#define SYS_BRBCR_EL12			sys_reg(2, 5, 9, 0, 0)
 #define SYS_SCTLR_EL12			sys_reg(3, 5, 1, 0, 0)
 #define SYS_CPACR_EL12			sys_reg(3, 5, 1, 0, 2)
 #define SYS_SCTLR2_EL12			sys_reg(3, 5, 1, 0, 3)
@@ -818,6 +807,12 @@
 #define OP_COSP_RCTX			sys_insn(1, 3, 7, 3, 6)
 #define OP_CPP_RCTX			sys_insn(1, 3, 7, 3, 7)
 
+/*
+ * BRBE Instructions
+ */
+#define BRB_IALL_INSN	__emit_inst(0xd5000000 | OP_BRB_IALL | (0x1f))
+#define BRB_INJ_INSN	__emit_inst(0xd5000000 | OP_BRB_INJ  | (0x1f))
+
 /* Common SCTLR_ELx flags. */
 #define SCTLR_ELx_ENTP2	(BIT(60))
 #define SCTLR_ELx_DSSBS	(BIT(44))
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index f9476848a2ed..ec74419dc1ae 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1038,6 +1038,138 @@ UnsignedEnum	3:0	MTEPERM
 EndEnum
 EndSysreg
 
+
+SysregFields BRBINFx_EL1
+Res0	63:47
+Field	46	CCU
+Field	45:40	CC_EXP
+Field	39:32	CC_MANT
+Res0	31:18
+Field	17	LASTFAILED
+Field	16	T
+Res0	15:14
+Enum	13:8		TYPE
+	0b000000	DIRECT_UNCOND
+	0b000001	INDIRECT
+	0b000010	DIRECT_LINK
+	0b000011	INDIRECT_LINK
+	0b000101	RET
+	0b000111	ERET
+	0b001000	DIRECT_COND
+	0b100001	DEBUG_HALT
+	0b100010	CALL
+	0b100011	TRAP
+	0b100100	SERROR
+	0b100110	INSN_DEBUG
+	0b100111	DATA_DEBUG
+	0b101010	ALIGN_FAULT
+	0b101011	INSN_FAULT
+	0b101100	DATA_FAULT
+	0b101110	IRQ
+	0b101111	FIQ
+	0b110000	IMPDEF_TRAP_EL3
+	0b111001	DEBUG_EXIT
+EndEnum
+Enum	7:6	EL
+	0b00	EL0
+	0b01	EL1
+	0b10	EL2
+	0b11	EL3
+EndEnum
+Field	5	MPRED
+Res0	4:2
+Enum	1:0	VALID
+	0b00	NONE
+	0b01	TARGET
+	0b10	SOURCE
+	0b11	FULL
+EndEnum
+EndSysregFields
+
+SysregFields	BRBCR_ELx
+Res0	63:24
+Field	23 	EXCEPTION
+Field	22 	ERTN
+Res0	21:10
+Field	9	FZPSS
+Field	8 	FZP
+Res0	7
+Enum	6:5	TS
+	0b01	VIRTUAL
+	0b10	GUEST_PHYSICAL
+	0b11	PHYSICAL
+EndEnum
+Field	4	MPRED
+Field	3	CC
+Res0	2
+Field	1	ExBRE
+Field	0	E0BRE
+EndSysregFields
+
+Sysreg	BRBCR_EL1	2	1	9	0	0
+Fields	BRBCR_ELx
+EndSysreg
+
+Sysreg	BRBFCR_EL1	2	1	9	0	1
+Res0	63:30
+Enum	29:28	BANK
+	0b00	BANK_0
+	0b01	BANK_1
+EndEnum
+Res0	27:23
+Field	22	CONDDIR
+Field	21	DIRCALL
+Field	20	INDCALL
+Field	19	RTN
+Field	18	INDIRECT
+Field	17	DIRECT
+Field	16	EnI
+Res0	15:8
+Field	7	PAUSED
+Field	6	LASTFAILED
+Res0	5:0
+EndSysreg
+
+Sysreg	BRBTS_EL1	2	1	9	0	2
+Field	63:0	TS
+EndSysreg
+
+Sysreg	BRBINFINJ_EL1	2	1	9	1	0
+Fields BRBINFx_EL1
+EndSysreg
+
+Sysreg	BRBSRCINJ_EL1	2	1	9	1	1
+Field	63:0 ADDRESS
+EndSysreg
+
+Sysreg	BRBTGTINJ_EL1	2	1	9	1	2
+Field	63:0 ADDRESS
+EndSysreg
+
+Sysreg	BRBIDR0_EL1	2	1	9	2	0
+Res0	63:16
+Enum	15:12	CC
+	0b0101	20_BIT
+EndEnum
+Enum	11:8	FORMAT
+	0b0000	FORMAT_0
+EndEnum
+Enum	7:0		NUMREC
+	0b00001000	8
+	0b00010000	16
+	0b00100000	32
+	0b01000000	64
+EndEnum
+EndSysreg
+
+Sysreg	BRBCR_EL2	2	4	9	0	0
+Fields	BRBCR_ELx
+EndSysreg
+
+Sysreg	BRBCR_EL12	2	5	9	0	0
+Fields	BRBCR_ELx
+EndSysreg
+
 Sysreg	ID_AA64ZFR0_EL1	3	0	0	4	4
 Res0	63:60
 UnsignedEnum	59:56	F64MM

-- 
2.47.2


