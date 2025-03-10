Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E15C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 12:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0VFIoufxWOj2EZNmXlX8ZSlNnqu0GiLu1Q4YbiP+2Z8=; b=3kDBSBZRwPlhdWmnbI0AJXSSD1
	n3Zd1xOgJ2Q3Cw4JFPDnKgGpDTe6nvPZmpiPt4cqPcICq0XN1YEEh8PT1CSIbpnGPwTX6ppEPGUkT
	/zd9ZhSC0prjWo4mcvP/USKvBF1A6t6AIDGyT97xODA1KWKcIP64vl3LCx3p3w7POSKb/OO4jshre
	0xE+Y04B26/xmfOcDhyP1eY2noIVS9MLb26Oi/IDBgGtMtvaQTdixUuaIcsmiJ5Xhkevdf4VcEoIj
	IjThB9J/lSfCwKEppEwrXm2ze/AcOgEZi5I4dVrUKwpoc2HWmXQYSlWmCdrYLErftUZxSQGSUg7fN
	isfN9oSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trcbq-00000002gmo-270T;
	Mon, 10 Mar 2025 12:51:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcC1-00000002bRd-1zQR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:25:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2C98A5C628D;
	Mon, 10 Mar 2025 12:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A78EC4CEEE;
	Mon, 10 Mar 2025 12:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741609512;
	bh=nANChlgvXq6Ho7EA9CsgTK6VxHa4Lr3IZqCf6g7TMzk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LMWSWd9Ay1WquI6PR65BfgLrvGdrlN3uVB3qD/ssHswfZCWTjA+pTx/E1kG/Q5Ybz
	 vK7pEDUHpSan5h93n5xNBa5lI8iYPUvFM08QiluotqzxobaZW9VIZGytpiY4uB3mrM
	 zkeYNSEPCxVY6DD32k/VZWRKO/9WDB6Lewpo2g3I9trQ6oqAu714WRQt4S87De5Sxv
	 FlV8Gom+IpuQEbUdlpjkmUawR5DLX9nk12Whi9RjYuiipBiWDT147Bir7RV1B1fRQm
	 bTG0MPOM0p0Ox1TIxdGGoPNn+p0X7iXVFrDEgjlSTPfd7ei92CDliaZo7X42yi8k7O
	 IlUYY6cOy7Nkw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1trcBy-00CAea-IU;
	Mon, 10 Mar 2025 12:25:10 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 03/23] arm64: sysreg: Add layout for HCR_EL2
Date: Mon, 10 Mar 2025 12:24:45 +0000
Message-Id: <20250310122505.2857610-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250310122505.2857610-1-maz@kernel.org>
References: <20250310122505.2857610-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_052513_596139_BB421571 
X-CRM114-Status: GOOD (  13.84  )
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

Add HCR_EL2 to the sysreg file, more or less directly generated
from the JSON file.

Since the generated names significantly differ from the existing
naming, express the old names in terms of the new one. One day, we'll
fix this mess, but I'm not in any hurry.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_arm.h | 125 ++++++++++++++++---------------
 arch/arm64/tools/sysreg          |  68 +++++++++++++++++
 2 files changed, 132 insertions(+), 61 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 8d94a6c0ed5c4..52bd4abc2a85d 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -12,67 +12,70 @@
 #include <asm/sysreg.h>
 #include <asm/types.h>
 
-/* Hyp Configuration Register (HCR) bits */
-
-#define HCR_TID5	(UL(1) << 58)
-#define HCR_DCT		(UL(1) << 57)
-#define HCR_ATA_SHIFT	56
-#define HCR_ATA		(UL(1) << HCR_ATA_SHIFT)
-#define HCR_TTLBOS	(UL(1) << 55)
-#define HCR_TTLBIS	(UL(1) << 54)
-#define HCR_ENSCXT	(UL(1) << 53)
-#define HCR_TOCU	(UL(1) << 52)
-#define HCR_AMVOFFEN	(UL(1) << 51)
-#define HCR_TICAB	(UL(1) << 50)
-#define HCR_TID4	(UL(1) << 49)
-#define HCR_FIEN	(UL(1) << 47)
-#define HCR_FWB		(UL(1) << 46)
-#define HCR_NV2		(UL(1) << 45)
-#define HCR_AT		(UL(1) << 44)
-#define HCR_NV1		(UL(1) << 43)
-#define HCR_NV		(UL(1) << 42)
-#define HCR_API		(UL(1) << 41)
-#define HCR_APK		(UL(1) << 40)
-#define HCR_TEA		(UL(1) << 37)
-#define HCR_TERR	(UL(1) << 36)
-#define HCR_TLOR	(UL(1) << 35)
-#define HCR_E2H		(UL(1) << 34)
-#define HCR_ID		(UL(1) << 33)
-#define HCR_CD		(UL(1) << 32)
-#define HCR_RW_SHIFT	31
-#define HCR_RW		(UL(1) << HCR_RW_SHIFT)
-#define HCR_TRVM	(UL(1) << 30)
-#define HCR_HCD		(UL(1) << 29)
-#define HCR_TDZ		(UL(1) << 28)
-#define HCR_TGE		(UL(1) << 27)
-#define HCR_TVM		(UL(1) << 26)
-#define HCR_TTLB	(UL(1) << 25)
-#define HCR_TPU		(UL(1) << 24)
-#define HCR_TPC		(UL(1) << 23) /* HCR_TPCP if FEAT_DPB */
-#define HCR_TSW		(UL(1) << 22)
-#define HCR_TACR	(UL(1) << 21)
-#define HCR_TIDCP	(UL(1) << 20)
-#define HCR_TSC		(UL(1) << 19)
-#define HCR_TID3	(UL(1) << 18)
-#define HCR_TID2	(UL(1) << 17)
-#define HCR_TID1	(UL(1) << 16)
-#define HCR_TID0	(UL(1) << 15)
-#define HCR_TWE		(UL(1) << 14)
-#define HCR_TWI		(UL(1) << 13)
-#define HCR_DC		(UL(1) << 12)
-#define HCR_BSU		(3 << 10)
-#define HCR_BSU_IS	(UL(1) << 10)
-#define HCR_FB		(UL(1) << 9)
-#define HCR_VSE		(UL(1) << 8)
-#define HCR_VI		(UL(1) << 7)
-#define HCR_VF		(UL(1) << 6)
-#define HCR_AMO		(UL(1) << 5)
-#define HCR_IMO		(UL(1) << 4)
-#define HCR_FMO		(UL(1) << 3)
-#define HCR_PTW		(UL(1) << 2)
-#define HCR_SWIO	(UL(1) << 1)
-#define HCR_VM		(UL(1) << 0)
-#define HCR_RES0	((UL(1) << 48) | (UL(1) << 39))
+/*
+ * Because I'm terribly lazy and that repainting the whole of the KVM
+ * code with the proper names is a pain, use a helper to map the names
+ * inherited from AArch32 with the new fancy nomenclature. One day...
+ */
+#define	__HCR(x)	HCR_EL2_##x
+
+#define HCR_TID5	__HCR(TID5)
+#define HCR_DCT		__HCR(DCT)
+#define HCR_ATA_SHIFT	__HCR(ATA_SHIFT)
+#define HCR_ATA		__HCR(ATA)
+#define HCR_TTLBOS	__HCR(TTLBOS)
+#define HCR_TTLBIS	__HCR(TTLBIS)
+#define HCR_ENSCXT	__HCR(EnSCXT)
+#define HCR_TOCU	__HCR(TOCU)
+#define HCR_AMVOFFEN	__HCR(AMVOFFEN)
+#define HCR_TICAB	__HCR(TICAB)
+#define HCR_TID4	__HCR(TID4)
+#define HCR_FIEN	__HCR(FIEN)
+#define HCR_FWB		__HCR(FWB)
+#define HCR_NV2		__HCR(NV2)
+#define HCR_AT		__HCR(AT)
+#define HCR_NV1		__HCR(NV1)
+#define HCR_NV		__HCR(NV)
+#define HCR_API		__HCR(API)
+#define HCR_APK		__HCR(APK)
+#define HCR_TEA		__HCR(TEA)
+#define HCR_TERR	__HCR(TERR)
+#define HCR_TLOR	__HCR(TLOR)
+#define HCR_E2H		__HCR(E2H)
+#define HCR_ID		__HCR(ID)
+#define HCR_CD		__HCR(CD)
+#define HCR_RW		__HCR(RW)
+#define HCR_TRVM	__HCR(TRVM)
+#define HCR_HCD		__HCR(HCD)
+#define HCR_TDZ		__HCR(TDZ)
+#define HCR_TGE		__HCR(TGE)
+#define HCR_TVM		__HCR(TVM)
+#define HCR_TTLB	__HCR(TTLB)
+#define HCR_TPU		__HCR(TPU)
+#define HCR_TPC		__HCR(TPCP)
+#define HCR_TSW		__HCR(TSW)
+#define HCR_TACR	__HCR(TACR)
+#define HCR_TIDCP	__HCR(TIDCP)
+#define HCR_TSC		__HCR(TSC)
+#define HCR_TID3	__HCR(TID3)
+#define HCR_TID2	__HCR(TID2)
+#define HCR_TID1	__HCR(TID1)
+#define HCR_TID0	__HCR(TID0)
+#define HCR_TWE		__HCR(TWE)
+#define HCR_TWI		__HCR(TWI)
+#define HCR_DC		__HCR(DC)
+#define HCR_BSU		__HCR(BSU)
+#define HCR_BSU_IS	__HCR(BSU_IS)
+#define HCR_FB		__HCR(FB)
+#define HCR_VSE		__HCR(VSE)
+#define HCR_VI		__HCR(VI)
+#define HCR_VF		__HCR(VF)
+#define HCR_AMO		__HCR(AMO)
+#define HCR_IMO		__HCR(IMO)
+#define HCR_FMO		__HCR(FMO)
+#define HCR_PTW		__HCR(PTW)
+#define HCR_SWIO	__HCR(SWIO)
+#define HCR_VM		__HCR(VM)
 
 /*
  * The bits we set in HCR:
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 3598ddd84942d..1cf9a07cce522 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2529,6 +2529,74 @@ Field	1	AFSR1_EL1
 Field	0	AFSR0_EL1
 EndSysregFields
 
+Sysreg	HCR_EL2		3	4	1	1	0
+Field	63:60	TWEDEL
+Field	59	TWEDEn
+Field	58	TID5
+Field	57	DCT
+Field	56	ATA
+Field	55	TTLBOS
+Field	54	TTLBIS
+Field	53	EnSCXT
+Field	52	TOCU
+Field	51	AMVOFFEN
+Field	50	TICAB
+Field	49	TID4
+Field	48	GPF
+Field	47	FIEN
+Field	46	FWB
+Field	45	NV2
+Field	44	AT
+Field	43	NV1
+Field	42	NV
+Field	41	API
+Field	40	APK
+Field	39	TME
+Field	38	MIOCNCE
+Field	37	TEA
+Field	36	TERR
+Field	35	TLOR
+Field	34	E2H
+Field	33	ID
+Field	32	CD
+Field	31	RW
+Field	30	TRVM
+Field	29	HCD
+Field	28	TDZ
+Field	27	TGE
+Field	26	TVM
+Field	25	TTLB
+Field	24	TPU
+Field	23	TPCP
+Field	22	TSW
+Field	21	TACR
+Field	20	TIDCP
+Field	19	TSC
+Field	18	TID3
+Field	17	TID2
+Field	16	TID1
+Field	15	TID0
+Field	14	TWE
+Field	13	TWI
+Field	12	DC
+UnsignedEnum	11:10	BSU
+	0b00	NONE
+	0b01	IS
+	0b10	OS
+	0b11	FS
+EndEnum
+Field	9	FB
+Field	8	VSE
+Field	7	VI
+Field	6	VF
+Field	5	AMO
+Field	4	IMO
+Field	3	FMO
+Field	2	PTW
+Field	1	SWIO
+Field	0	VM
+EndSysreg
+
 Sysreg MDCR_EL2		3	4	1	1	1
 Res0	63:51
 Field	50	EnSTEPOP
-- 
2.39.2


