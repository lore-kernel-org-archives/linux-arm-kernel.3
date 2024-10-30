Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E117D6B6A7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 16:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFKAhMEVCCsdgk8LvjTPhIHNfYJ4u5sOfTSXLAGvoNg=; b=c/5Kxytwl63km/kj150sesUo/9
	bVKLG7zhaLjO2mQ68PrmrjrgMKLLA2WYwUWWB91ZM5uM8tgqm4yTZam2+dOiwaLYvY5WNL5Wqd47q
	NNWEUcasi5QzrJFy1BnwvfELs7eQtHo8c048u8yCgHhljqL31qYOeIxx2pmCSEAoSgWAAHQ1I4Baz
	4arMRB7fnUA7Zqwgs4ciY6kta3t5ajZ8wahYMn6ubitwlXLBtnQniNbuwYaTGfxXZCqnfKjNC+MVa
	JAXGZRiHJ4YxVj54gkrMJEYIo2w3F+zZVjXacGL6aQPKPIxy232IvXqZPTxro26XB3ZnM0FKpyPwq
	pq+oDQ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BKg-00000001240-0mwM;
	Wed, 30 Oct 2024 16:14:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BAP-0000000103Z-3iAy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 16:03:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7949511FB;
	Wed, 30 Oct 2024 09:03:57 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 907A93F528;
	Wed, 30 Oct 2024 09:03:25 -0700 (PDT)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: anshuman.khandual@arm.com,
	gshan@redhat.com,
	james.morse@arm.com,
	joey.gouly@arm.com,
	shameerali.kolothum.thodi@huawei.com,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jing Zhang <jingzhangos@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v6 1/7] arm64/sysreg: Convert existing MPAM sysregs and add the remaining entries
Date: Wed, 30 Oct 2024 16:03:11 +0000
Message-Id: <20241030160317.2528209-2-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241030160317.2528209-1-joey.gouly@arm.com>
References: <20241030160317.2528209-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_090330_111747_2CB23288 
X-CRM114-Status: UNSURE (   8.94  )
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

From: James Morse <james.morse@arm.com>

Move the existing MPAM system register defines from sysreg.h to
tools/sysreg and add the remaining system registers.

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 arch/arm64/include/asm/sysreg.h |  12 ---
 arch/arm64/tools/sysreg         | 161 ++++++++++++++++++++++++++++++++
 2 files changed, 161 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 9ea97dddefc4..345e81e0d2b3 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -542,18 +542,6 @@
 
 #define SYS_MAIR_EL2			sys_reg(3, 4, 10, 2, 0)
 #define SYS_AMAIR_EL2			sys_reg(3, 4, 10, 3, 0)
-#define SYS_MPAMHCR_EL2			sys_reg(3, 4, 10, 4, 0)
-#define SYS_MPAMVPMV_EL2		sys_reg(3, 4, 10, 4, 1)
-#define SYS_MPAM2_EL2			sys_reg(3, 4, 10, 5, 0)
-#define __SYS__MPAMVPMx_EL2(x)		sys_reg(3, 4, 10, 6, x)
-#define SYS_MPAMVPM0_EL2		__SYS__MPAMVPMx_EL2(0)
-#define SYS_MPAMVPM1_EL2		__SYS__MPAMVPMx_EL2(1)
-#define SYS_MPAMVPM2_EL2		__SYS__MPAMVPMx_EL2(2)
-#define SYS_MPAMVPM3_EL2		__SYS__MPAMVPMx_EL2(3)
-#define SYS_MPAMVPM4_EL2		__SYS__MPAMVPMx_EL2(4)
-#define SYS_MPAMVPM5_EL2		__SYS__MPAMVPMx_EL2(5)
-#define SYS_MPAMVPM6_EL2		__SYS__MPAMVPMx_EL2(6)
-#define SYS_MPAMVPM7_EL2		__SYS__MPAMVPMx_EL2(7)
 
 #define SYS_VBAR_EL2			sys_reg(3, 4, 12, 0, 0)
 #define SYS_RVBAR_EL2			sys_reg(3, 4, 12, 0, 1)
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 8d637ac4b7c6..05d04a45db65 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2737,6 +2737,126 @@ Field	1	E2SPE
 Field	0	E0HSPE
 EndSysreg
 
+Sysreg	MPAMHCR_EL2	3	4	10	4	0
+Res0	63:32
+Field	31	TRAP_MPAMIDR_EL1
+Res0	30:9
+Field	8	GSTAPP_PLK
+Res0	7:2
+Field	1	EL1_VPMEN
+Field	0	EL0_VPMEN
+EndSysreg
+
+Sysreg	MPAMVPMV_EL2	3	4	10	4	1
+Res0	63:32
+Field	31	VPM_V31
+Field	30	VPM_V30
+Field	29	VPM_V29
+Field	28	VPM_V28
+Field	27	VPM_V27
+Field	26	VPM_V26
+Field	25	VPM_V25
+Field	24	VPM_V24
+Field	23	VPM_V23
+Field	22	VPM_V22
+Field	21	VPM_V21
+Field	20	VPM_V20
+Field	19	VPM_V19
+Field	18	VPM_V18
+Field	17	VPM_V17
+Field	16	VPM_V16
+Field	15	VPM_V15
+Field	14	VPM_V14
+Field	13	VPM_V13
+Field	12	VPM_V12
+Field	11	VPM_V11
+Field	10	VPM_V10
+Field	9	VPM_V9
+Field	8	VPM_V8
+Field	7	VPM_V7
+Field	6	VPM_V6
+Field	5	VPM_V5
+Field	4	VPM_V4
+Field	3	VPM_V3
+Field	2	VPM_V2
+Field	1	VPM_V1
+Field	0	VPM_V0
+EndSysreg
+
+Sysreg	MPAM2_EL2	3	4	10	5	0
+Field	63	MPAMEN
+Res0	62:59
+Field	58	TIDR
+Res0	57
+Field	56	ALTSP_HFC
+Field	55	ALTSP_EL2
+Field	54	ALTSP_FRCD
+Res0	53:51
+Field	50	EnMPAMSM
+Field	49	TRAPMPAM0EL1
+Field	48	TRAPMPAM1EL1
+Field	47:40	PMG_D
+Field	39:32	PMG_I
+Field	31:16	PARTID_D
+Field	15:0	PARTID_I
+EndSysreg
+
+Sysreg	MPAMVPM0_EL2	3	4	10	6	0
+Field	63:48	PhyPARTID3
+Field	47:32	PhyPARTID2
+Field	31:16	PhyPARTID1
+Field	15:0	PhyPARTID0
+EndSysreg
+
+Sysreg	MPAMVPM1_EL2	3	4	10	6	1
+Field	63:48	PhyPARTID7
+Field	47:32	PhyPARTID6
+Field	31:16	PhyPARTID5
+Field	15:0	PhyPARTID4
+EndSysreg
+
+Sysreg	MPAMVPM2_EL2	3	4	10	6	2
+Field	63:48	PhyPARTID11
+Field	47:32	PhyPARTID10
+Field	31:16	PhyPARTID9
+Field	15:0	PhyPARTID8
+EndSysreg
+
+Sysreg	MPAMVPM3_EL2	3	4	10	6	3
+Field	63:48	PhyPARTID15
+Field	47:32	PhyPARTID14
+Field	31:16	PhyPARTID13
+Field	15:0	PhyPARTID12
+EndSysreg
+
+Sysreg	MPAMVPM4_EL2	3	4	10	6	4
+Field	63:48	PhyPARTID19
+Field	47:32	PhyPARTID18
+Field	31:16	PhyPARTID17
+Field	15:0	PhyPARTID16
+EndSysreg
+
+Sysreg	MPAMVPM5_EL2	3	4	10	6	5
+Field	63:48	PhyPARTID23
+Field	47:32	PhyPARTID22
+Field	31:16	PhyPARTID21
+Field	15:0	PhyPARTID20
+EndSysreg
+
+Sysreg	MPAMVPM6_EL2	3	4	10	6	6
+Field	63:48	PhyPARTID27
+Field	47:32	PhyPARTID26
+Field	31:16	PhyPARTID25
+Field	15:0	PhyPARTID24
+EndSysreg
+
+Sysreg	MPAMVPM7_EL2	3	4	10	6	7
+Field	63:48	PhyPARTID31
+Field	47:32	PhyPARTID30
+Field	31:16	PhyPARTID29
+Field	15:0	PhyPARTID28
+EndSysreg
+
 Sysreg	CONTEXTIDR_EL2	3	4	13	0	1
 Fields	CONTEXTIDR_ELx
 EndSysreg
@@ -2769,6 +2889,10 @@ Sysreg	FAR_EL12	3	5	6	0	0
 Field	63:0	ADDR
 EndSysreg
 
+Sysreg	MPAM1_EL12	3	5	10	5	0
+Fields	MPAM1_ELx
+EndSysreg
+
 Sysreg	CONTEXTIDR_EL12	3	5	13	0	1
 Fields	CONTEXTIDR_ELx
 EndSysreg
@@ -2941,6 +3065,22 @@ Res0	1
 Field	0	EN
 EndSysreg
 
+Sysreg	MPAMIDR_EL1	3	0	10	4	4
+Res0	63:62
+Field	61	HAS_SDEFLT
+Field	60	HAS_FORCE_NS
+Field	59	SP4
+Field	58	HAS_TIDR
+Field	57	HAS_ALTSP
+Res0	56:40
+Field	39:32	PMG_MAX
+Res0	31:21
+Field	20:18	VPMR_MAX
+Field	17	HAS_HCR
+Res0	16
+Field	15:0	PARTID_MAX
+EndSysreg
+
 Sysreg	LORID_EL1	3	0	10	4	7
 Res0	63:24
 Field	23:16	LD
@@ -2948,6 +3088,27 @@ Res0	15:8
 Field	7:0	LR
 EndSysreg
 
+Sysreg	MPAM1_EL1	3	0	10	5	0
+Field	63	MPAMEN
+Res0	62:61
+Field	60 FORCED_NS
+Res0	59:55
+Field	54	ALTSP_FRCD
+Res0	53:48
+Field	47:40	PMG_D
+Field	39:32	PMG_I
+Field	31:16	PARTID_D
+Field	15:0	PARTID_I
+EndSysreg
+
+Sysreg	MPAM0_EL1	3	0	10	5	1
+Res0	63:48
+Field	47:40	PMG_D
+Field	39:32	PMG_I
+Field	31:16	PARTID_D
+Field	15:0	PARTID_I
+EndSysreg
+
 Sysreg	ISR_EL1	3	0	12	1	0
 Res0	63:11
 Field	10	IS
-- 
2.25.1


