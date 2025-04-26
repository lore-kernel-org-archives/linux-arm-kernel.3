Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07398C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 12:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jFkkkxxDldsPIR1qiT8R/5aYEYgW3Z3oXIFL9WqN0bc=; b=i93FCWfBI9cckPfuaC6yiqt+Dx
	YULSG+DR7pS6e5Egn4mymmiTosn8MyGJyHdCfbF6kWt7CXOZr/M1x+TclXcuvjgNjLbenxrKQrsq3
	5lRkIuRNFxvpEGFIynAzpnPbqTdQHzXfU7n3oocYufZKRGY8Waj4sM//RaiD4VNs0ejjSrIPmIaMX
	x3NByR4tDLWtgvFvX55p8zStRrdbjCAZFnSSz0spQj5B03SP9O9uPqwzVBYdhLyRTcZH9T4LBa3/x
	RGODONYz3ziRhp6oqbYEJ7a152gPIhhaC/zukhhs+H6ItBU5MKy4gtF0VPQdOdnMiXkt5ajnyqDIp
	wb+NU2aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8et7-000000021G1-0TlF;
	Sat, 26 Apr 2025 12:44:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8eeL-00000001yzE-3Irc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 12:28:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EE72D4A6CB;
	Sat, 26 Apr 2025 12:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 802AFC4CEEC;
	Sat, 26 Apr 2025 12:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745670532;
	bh=I8LXTh145/CDUVs4jB5/X8ldpUcvQmrWss1LtJsyoMM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lDGUkHb8VRWmVlUwBpHsBWdt1Kjly9r+jrAbuWlmZIJ4DmVQb33ZJq2BhDMdtwnY3
	 KuD3hY8SWDFvUaFTSxeAwLASLUHDcngzk2wJKyu8A+INMtONTre9X4MLBzWolCEE2D
	 F4TXnr6wnCOCji+jixyvYGgtitOD8BUhhM8mYKg4YJQsLrKwqxX+D9GwDgugiwH37y
	 hh1B3S1RzY3QzlI1XDynJMMmqB8bWrw57R8mha4F58jygIZjiw35QI95KqF/lDXYTx
	 bcCBnLa14RYA9Z7usnaGUJNP06Ge1DxjuMCcQLZkYfA3jaJEqUADokELaTosjU9llf
	 1uvw0RhGAVtjg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u8eeI-0092VH-Cj;
	Sat, 26 Apr 2025 13:28:50 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v3 08/42] arm64: sysreg: Add registers trapped by HFG{R,W}TR2_EL2
Date: Sat, 26 Apr 2025 13:28:02 +0100
Message-Id: <20250426122836.3341523-9-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250426122836.3341523-1-maz@kernel.org>
References: <20250426122836.3341523-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_052853_916316_9FDCF59F 
X-CRM114-Status: UNSURE (   9.06  )
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

Bulk addition of all the system registers trapped by HFG{R,W}TR2_EL2.

The descriptions are extracted from the BSD-licenced JSON file part
of the 2025-03 drop from ARM.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 395 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 395 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 6433a3ebcef49..7969e632492bb 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2068,6 +2068,26 @@ Field	1	A
 Field	0	M
 EndSysreg
 
+Sysreg	SCTLR_EL12      3	5	1	0	0
+Mapping	SCTLR_EL1
+EndSysreg
+
+Sysreg	SCTLRALIAS_EL1  3	0	1	4	6
+Mapping	SCTLR_EL1
+EndSysreg
+
+Sysreg	ACTLR_EL1	3	0	1	0	1
+Field   63:0    IMPDEF
+EndSysreg
+
+Sysreg	ACTLR_EL12      3	5	1	0	1
+Mapping	ACTLR_EL1
+EndSysreg
+
+Sysreg	ACTLRALIAS_EL1  3	0	1	4	5
+Mapping	ACTLR_EL1
+EndSysreg
+
 Sysreg	CPACR_EL1	3	0	1	0	2
 Res0	63:30
 Field	29	E0POE
@@ -2081,6 +2101,323 @@ Field	17:16	ZEN
 Res0	15:0
 EndSysreg
 
+Sysreg	CPACR_EL12      3	5	1	0	2
+Mapping	CPACR_EL1
+EndSysreg
+
+Sysreg	CPACRALIAS_EL1  3	0	1	4	4
+Mapping	CPACR_EL1
+EndSysreg
+
+Sysreg	ACTLRMASK_EL1	3	0	1	4	1
+Field	63:0	IMPDEF
+EndSysreg
+
+Sysreg	ACTLRMASK_EL12	3	5	1	4	1
+Mapping	ACTLRMASK_EL1
+EndSysreg
+
+Sysreg	CPACRMASK_EL1	3	0	1	4	2
+Res0	63:32
+Field	31	TCPAC
+Field	30	TAM
+Field	29	E0POE
+Field	28	TTA
+Res0	27:25	
+Field	24	SMEN
+Res0	23:21	
+Field	20	FPEN
+Res0	19:17	
+Field	16	ZEN
+Res0	15:0
+EndSysreg
+
+Sysreg	CPACRMASK_EL12	3	5	1	4	2
+Mapping CPACRMASK_EL1
+EndSysreg
+
+Sysreg	PFAR_EL1	3	0	6	0	5
+Field	63	NS
+Field	62	NSE
+Res0	61:56	
+Field	55:52	PA_55_52
+Field	51:48	PA_51_48
+Field	47:0	PA
+EndSysreg
+
+Sysreg	PFAR_EL12	3	5	6	0	5
+Mapping	PFAR_EL1
+EndSysreg
+
+Sysreg	RCWSMASK_EL1	3	0	13	0	3
+Field	63:0	RCWSMASK
+EndSysreg
+
+Sysreg	SCTLR2_EL1      3	0	1	0	3
+Res0    63:13
+Field   12      CPTM0
+Field   11      CPTM
+Field   10      CPTA0
+Field   9       CPTA
+Field   8       EnPACM0
+Field   7       EnPACM
+Field   6       EnIDCP128
+Field   5       EASE
+Field   4       EnANERR
+Field   3       EnADERR
+Field   2       NMEA
+Res0    1:0
+EndSysreg
+
+Sysreg	SCTLR2_EL12     3	5	1	0	3
+Mapping	SCTLR2_EL1
+EndSysreg
+
+Sysreg	SCTLR2ALIAS_EL1 3	0	1	4	7
+Mapping	SCTLR2_EL1
+EndSysreg
+
+Sysreg	SCTLR2MASK_EL1	3	0	1	4	3
+Res0	63:13
+Field	12	CPTM0
+Field	11	CPTM
+Field	10	CPTA0
+Field	9	CPTA
+Field	8	EnPACM0
+Field	7	EnPACM
+Field	6	EnIDCP128
+Field	5	EASE
+Field	4	EnANERR
+Field	3	EnADERR
+Field	2	NMEA
+Res0	1:0
+EndSysreg
+
+Sysreg	SCTLR2MASK_EL12	3	5	1	4	3
+Mapping	SCTLR2MASK_EL1
+EndSysreg
+
+Sysreg	SCTLRMASK_EL1	3	0	1	4	0
+Field	63	TIDCP
+Field	62	SPINTMASK
+Field	61	NMI
+Field	60	EnTP2
+Field	59	TCSO
+Field	58	TCSO0
+Field	57	EPAN
+Field	56	EnALS
+Field	55	EnAS0
+Field	54	EnASR
+Field	53	TME
+Field	52	TME0
+Field	51	TMT
+Field	50	TMT0
+Res0	49:47	
+Field	46	TWEDEL
+Field	45	TWEDEn
+Field	44	DSSBS
+Field	43	ATA
+Field	42	ATA0
+Res0	41	
+Field	40	TCF
+Res0	39	
+Field	38	TCF0
+Field	37	ITFSB
+Field	36	BT1
+Field	35	BT0
+Field	34	EnFPM
+Field	33	MSCEn
+Field	32	CMOW
+Field	31	EnIA
+Field	30	EnIB
+Field	29	LSMAOE
+Field	28	nTLSMD
+Field	27	EnDA
+Field	26	UCI
+Field	25	EE
+Field	24	E0E
+Field	23	SPAN
+Field	22	EIS
+Field	21	IESB
+Field	20	TSCXT
+Field	19	WXN
+Field	18	nTWE
+Res0	17	
+Field	16	nTWI
+Field	15	UCT
+Field	14	DZE
+Field	13	EnDB
+Field	12	I
+Field	11	EOS
+Field	10	EnRCTX
+Field	9	UMA
+Field	8	SED
+Field	7	ITD
+Field	6	nAA
+Field	5	CP15BEN
+Field	4	SA0
+Field	3	SA
+Field	2	C
+Field	1	A
+Field	0	M
+EndSysreg
+
+Sysreg	SCTLRMASK_EL12	3	5	1	4	0
+Mapping	SCTLRMASK_EL1
+EndSysreg
+
+Sysreg	TCR2MASK_EL1	3	0	2	7	3
+Res0	63:22
+Field	21	FNGNA1
+Field	20	FNGNA0
+Res0	19	
+Field	18	FNG1
+Field	17	FNG0
+Field	16	A2
+Field	15	DisCH1
+Field	14	DisCH0
+Res0	13:12	
+Field	11	HAFT
+Field	10	PTTWI
+Res0	9:6	
+Field	5	D128
+Field	4	AIE
+Field	3	POE
+Field	2	E0POE
+Field	1	PIE
+Field	0	PnCH
+EndSysreg
+
+Sysreg	TCR2MASK_EL12	3	5	2	7	3
+Mapping	TCR2MASK_EL1
+EndSysreg
+
+Sysreg	TCRMASK_EL1	3	0	2	7	2
+Res0	63:62
+Field	61	MTX1
+Field	60	MTX0
+Field	59	DS
+Field	58	TCMA1
+Field	57	TCMA0
+Field	56	E0PD1
+Field	55	E0PD0
+Field	54	NFD1
+Field	53	NFD0
+Field	52	TBID1
+Field	51	TBID0
+Field	50	HWU162
+Field	49	HWU161
+Field	48	HWU160
+Field	47	HWU159
+Field	46	HWU062
+Field	45	HWU061
+Field	44	HWU060
+Field	43	HWU059
+Field	42	HPD1
+Field	41	HPD0
+Field	40	HD
+Field	39	HA
+Field	38	TBI1
+Field	37	TBI0
+Field	36	AS
+Res0	35:33	
+Field	32	IPS
+Res0	31	
+Field	30	TG1
+Res0	29	
+Field	28	SH1
+Res0	27	
+Field	26	ORGN1
+Res0	25	
+Field	24	IRGN1
+Field	23	EPD1
+Field	22	A1
+Res0	21:17	
+Field	16	T1SZ
+Res0	15	
+Field	14	TG0
+Res0	13	
+Field	12	SH0
+Res0	11	
+Field	10	ORGN0
+Res0	9	
+Field	8	IRGN0
+Field	7	EPD0
+Res0	6:1	
+Field	0	T0SZ
+EndSysreg
+
+Sysreg	TCRMASK_EL12	3	5	2	7	2
+Mapping TCRMASK_EL1
+EndSysreg
+
+Sysreg	ERXGSR_EL1	3	0	5	3	2
+Field	63	S63
+Field	62	S62
+Field	61	S61
+Field	60	S60
+Field	59	S59
+Field	58	S58
+Field	57	S57
+Field	56	S56
+Field	55	S55
+Field	54	S54
+Field	53	S53
+Field	52	S52
+Field	51	S51
+Field	50	S50
+Field	49	S49
+Field	48	S48
+Field	47	S47
+Field	46	S46
+Field	45	S45
+Field	44	S44
+Field	43	S43
+Field	42	S42
+Field	41	S41
+Field	40	S40
+Field	39	S39
+Field	38	S38
+Field	37	S37
+Field	36	S36
+Field	35	S35
+Field	34	S34
+Field	33	S33
+Field	32	S32
+Field	31	S31
+Field	30	S30
+Field	29	S29
+Field	28	S28
+Field	27	S27
+Field	26	S26
+Field	25	S25
+Field	24	S24
+Field	23	S23
+Field	22	S22
+Field	21	S21
+Field	20	S20
+Field	19	S19
+Field	18	S18
+Field	17	S17
+Field	16	S16
+Field	15	S15
+Field	14	S14
+Field	13	S13
+Field	12	S12
+Field	11	S11
+Field	10	S10
+Field	9	S9
+Field	8	S8
+Field	7	S7
+Field	6	S6
+Field	5	S5
+Field	4	S4
+Field	3	S3
+Field	2	S2
+Field	1	S1
+Field	0	S0
+EndSysreg
+
 Sysreg	TRFCR_EL1	3	0	1	2	1
 Res0	63:7
 UnsignedEnum	6:5	TS
@@ -3407,6 +3744,60 @@ Sysreg	TTBR1_EL1	3	0	2	0	1
 Fields	TTBRx_EL1
 EndSysreg
 
+Sysreg	TCR_EL1		3	0	2	0	2
+Res0    63:62
+Field   61      MTX1
+Field   60      MTX0
+Field   59      DS
+Field   58      TCMA1
+Field   57      TCMA0
+Field   56      E0PD1
+Field   55      E0PD0
+Field   54      NFD1
+Field   53      NFD0
+Field   52      TBID1
+Field   51      TBID0
+Field   50      HWU162
+Field   49      HWU161
+Field   48      HWU160
+Field   47      HWU159
+Field   46      HWU062
+Field   45      HWU061
+Field   44      HWU060
+Field   43      HWU059
+Field   42      HPD1
+Field   41      HPD0
+Field   40      HD
+Field   39      HA
+Field   38      TBI1
+Field   37      TBI0
+Field   36      AS
+Res0    35
+Field   34:32   IPS
+Field   31:30   TG1
+Field   29:28   SH1
+Field   27:26   ORGN1
+Field   25:24   IRGN1
+Field   23      EPD1
+Field   22      A1
+Field   21:16   T1SZ
+Field   15:14   TG0
+Field   13:12   SH0
+Field   11:10   ORGN0
+Field   9:8     IRGN0
+Field   7       EPD0
+Res0    6
+Field   5:0     T0SZ
+EndSysreg
+
+Sysreg	TCR_EL12        3	5	2	0	2
+Mapping	TCR_EL1
+EndSysreg
+
+Sysreg	TCRALIAS_EL1    3	0	2	7	6
+Mapping	TCR_EL1
+EndSysreg
+
 Sysreg	TCR2_EL1	3	0	2	0	3
 Res0	63:16
 Field	15	DisCH1
@@ -3427,6 +3818,10 @@ Sysreg	TCR2_EL12	3	5	2	0	3
 Mapping	TCR2_EL1
 EndSysreg
 
+Sysreg	TCR2ALIAS_EL1   3	0	2	7	7
+Mapping	TCR2_EL1
+EndSysreg
+
 Sysreg	TCR2_EL2	3	4	2	0	3
 Res0	63:16
 Field	15	DisCH1
-- 
2.39.2


