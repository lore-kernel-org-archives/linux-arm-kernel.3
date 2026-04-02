Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA39CC6B04
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 04:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0JeY4mJA3oacMiL4xmIgM58uTK4IVMVMOGVAYrrZIok=; b=upGiteHAwhqlp/2mWc/E5qHOs4
	AVJreUboSYsYv1LhV9NptbrypeRksH3QktwHOER7rTtbs41UePVloSwcwTp9O2856zf5Fw6DP3dV8
	JhsiYPAPkqmfeUWnquLa8uXD2T5cXrImgKNYT3iPSYT3MFsHv0PAtxYQSd4xPtq4lIhU82ZPH/nkv
	iHPCyw44E3s72mxQy4KzVvxcTc+zpGKZylirBDNy/59OQvFKv3MH1bOfICu6rpGmRXugUDSvQo/bi
	lCOmwJPBfNx3mgOsZX5XeZuEQChld8sNwkymGMIQTsuoG2eVSEEJUKoG+rnUJ/wpOVqbmBGmNBr1i
	2lVoZmaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w89Yz-0000000Gigy-1rF4;
	Thu, 02 Apr 2026 04:21:49 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w89Yu-0000000GicJ-22Ba
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 04:21:45 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631Ik9DT3661500;
	Thu, 2 Apr 2026 04:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=0JeY4mJA3oacMiL4x
	mIgM58uTK4IVMVMOGVAYrrZIok=; b=AmJUAepRtEvs7V2Uf+0lj9Zc9NmA9DUh7
	lKsCSRzqZMiYQSHPZdeABeYz/K0cIDBIfaolsT3MCV9qPx7TWvFHP7PV+zE7CJ3G
	9YnmW1wQ+gPPDMlz56LOKpPTVuiPPPOx7VfgDm57j9EhRcQnywEMi8qZeTmydXRm
	0QhvhhqH/WdlR1p8mMzfsN5IIzanAKhdraOUFDa2gDWwDaACn8wD9VHijLpClKj1
	ozPp29bIFgwUqDplXDJbLDfjI0zi4tRbpXbmNNwEsxjyyMHuZ1gWFkYuj9GNRRbD
	YGdQnZibsrmEx23Jectwz6BDnQNxvLUrQF2H7PcwKPYK+ZFUEA8QA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4d65dcjecu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 04:21:33 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6320Lhpa013936;
	Thu, 2 Apr 2026 04:21:33 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4d6ttkrheq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 04:21:33 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6324LTRv45089136
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Apr 2026 04:21:29 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F74C2004B;
	Thu,  2 Apr 2026 04:21:29 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CEEB92004D;
	Thu,  2 Apr 2026 04:21:28 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 Apr 2026 04:21:28 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org
Cc: Andreas Grapentin <Andreas.Grapentin@ibm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v1 08/27] arm64: Extract pstate definitions from ptrace
Date: Thu,  2 Apr 2026 06:21:04 +0200
Message-ID: <20260402042125.3948963-9-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260402042125.3948963-1-seiden@linux.ibm.com>
References: <20260402042125.3948963-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=RsjI7SmK c=1 sm=1 tr=0 ts=69cdeece cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8 a=i1ah5YvoNV5MJ1hGTMsA:9
X-Proofpoint-GUID: IxaziuGC0ikzOX9RHBQuowTzx3Kd6Das
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAzNCBTYWx0ZWRfX+8fxAomASttw
 XGSF/959DGP6LSUaJTfCGgzADKV5y3N5zZFau/YvcfwkpSn/h8LVk2poAnxNwIKADy+ZNewRqtl
 g6G7baCNrLx1bVmCgIx/7DNQCW+LzjNZblL9hPUQUwx9kVZXbX16H1aaSk9FmDIRV5LKDBnVDvU
 Bn1LD+HdAPN0Kbnw2L0kvJyetBICKTvkktLbfr1DowZ8ghJ30EEdjsqvA0Nk0DVbKrXAeIG3M+y
 kSuM/BgKD7lVQQZKuiJ0xcm4IvxFOfjcEe+hFy75O6NMUijmvGQ81dCGe3rRqK71YJRPN3uJPxa
 RJFsVdboEMhUo3AcJl3HFFcA6H4OhCtmlOImwxDi1tFpYfNBUQzOZNmMdS1uYLOXpi9pLMmQnuU
 6OavvWJHX6jUPu6OqoVe4YK4j2UCKbKLdJwNg9rcj5pYQqkIBMhZsifoWi0ZzPOfpsvWPLRjNUG
 NW7jHAxKNNiuDFKqJYQ==
X-Proofpoint-ORIG-GUID: IxaziuGC0ikzOX9RHBQuowTzx3Kd6Das
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_212144_648963_92AADBFF 
X-CRM114-Status: GOOD (  21.14  )
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

From: Nina Schoetterl-Glausch <nsg@linux.ibm.com>

Split all definitions that can be used by non-native architectures into a
separate file pstate.h. This allows other architectures using
the pstate definitions. While at it refactor SPSR related definitions
to use the BIT(n) macro and move them into sysreg-defs.h

Signed-off-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/arm64/include/asm/ptrace.h      | 34 +-----------------
 arch/arm64/include/uapi/asm/Kbuild   |  1 +
 arch/arm64/include/uapi/asm/ptrace.h | 49 +------------------------
 include/arch/arm64/asm/pstate.h      | 46 ++++++++++++++++++++++++
 include/arch/arm64/asm/sysreg-defs.h | 42 ++++++++++++++++++++++
 include/uapi/arch/arm64/asm/pstate.h | 53 ++++++++++++++++++++++++++++
 6 files changed, 144 insertions(+), 81 deletions(-)
 create mode 100644 include/arch/arm64/asm/pstate.h
 create mode 100644 include/uapi/arch/arm64/asm/pstate.h

diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index 39582511ad72..72ea0a8af960 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -9,6 +9,7 @@
 #define __ASM_PTRACE_H
 
 #include <asm/cpufeature.h>
+#include <asm/pstate.h>
 
 #include <uapi/asm/ptrace.h>
 
@@ -28,10 +29,6 @@
 
 #define GIC_PRIO_PSR_I_SET	GICV3_PRIO_PSR_I_SET
 
-/* Additional SPSR bits not exposed in the UABI */
-#define PSR_MODE_THREAD_BIT	(1 << 0)
-#define PSR_IL_BIT		(1 << 20)
-
 /* AArch32-specific ptrace requests */
 #define COMPAT_PTRACE_GETREGS		12
 #define COMPAT_PTRACE_SETREGS		13
@@ -42,41 +39,12 @@
 #define COMPAT_PTRACE_GETHBPREGS	29
 #define COMPAT_PTRACE_SETHBPREGS	30
 
-/* SPSR_ELx bits for exceptions taken from AArch32 */
-#define PSR_AA32_MODE_MASK	0x0000001f
-#define PSR_AA32_MODE_USR	0x00000010
-#define PSR_AA32_MODE_FIQ	0x00000011
-#define PSR_AA32_MODE_IRQ	0x00000012
-#define PSR_AA32_MODE_SVC	0x00000013
-#define PSR_AA32_MODE_ABT	0x00000017
-#define PSR_AA32_MODE_HYP	0x0000001a
-#define PSR_AA32_MODE_UND	0x0000001b
-#define PSR_AA32_MODE_SYS	0x0000001f
-#define PSR_AA32_T_BIT		0x00000020
-#define PSR_AA32_F_BIT		0x00000040
-#define PSR_AA32_I_BIT		0x00000080
-#define PSR_AA32_A_BIT		0x00000100
-#define PSR_AA32_E_BIT		0x00000200
-#define PSR_AA32_PAN_BIT	0x00400000
-#define PSR_AA32_SSBS_BIT	0x00800000
-#define PSR_AA32_DIT_BIT	0x01000000
-#define PSR_AA32_Q_BIT		0x08000000
-#define PSR_AA32_V_BIT		0x10000000
-#define PSR_AA32_C_BIT		0x20000000
-#define PSR_AA32_Z_BIT		0x40000000
-#define PSR_AA32_N_BIT		0x80000000
-#define PSR_AA32_IT_MASK	0x0600fc00	/* If-Then execution state mask */
-#define PSR_AA32_GE_MASK	0x000f0000
-
 #ifdef CONFIG_CPU_BIG_ENDIAN
 #define PSR_AA32_ENDSTATE	PSR_AA32_E_BIT
 #else
 #define PSR_AA32_ENDSTATE	0
 #endif
 
-/* AArch32 CPSR bits, as seen in AArch32 */
-#define COMPAT_PSR_DIT_BIT	0x00200000
-
 /*
  * These are 'magic' values for PTRACE_PEEKUSR that return info about where a
  * process is located in memory.
diff --git a/arch/arm64/include/uapi/asm/Kbuild b/arch/arm64/include/uapi/asm/Kbuild
index b45584e83448..43d1a8ab98e1 100644
--- a/arch/arm64/include/uapi/asm/Kbuild
+++ b/arch/arm64/include/uapi/asm/Kbuild
@@ -5,3 +5,4 @@ generic-y += kvm_para.h
 
 shared-uapi-y += kvm.h
 shared-uapi-y += sve_context.h
+shared-uapi-y += pstate.h
diff --git a/arch/arm64/include/uapi/asm/ptrace.h b/arch/arm64/include/uapi/asm/ptrace.h
index 6fed93fb2536..6e743eb021e8 100644
--- a/arch/arm64/include/uapi/asm/ptrace.h
+++ b/arch/arm64/include/uapi/asm/ptrace.h
@@ -24,54 +24,7 @@
 
 #include <asm/hwcap.h>
 #include <asm/sve_context.h>
-
-
-/*
- * PSR bits
- */
-#define PSR_MODE_EL0t	0x00000000
-#define PSR_MODE_EL1t	0x00000004
-#define PSR_MODE_EL1h	0x00000005
-#define PSR_MODE_EL2t	0x00000008
-#define PSR_MODE_EL2h	0x00000009
-#define PSR_MODE_EL3t	0x0000000c
-#define PSR_MODE_EL3h	0x0000000d
-#define PSR_MODE_MASK	0x0000000f
-
-/* AArch32 CPSR bits */
-#define PSR_MODE32_BIT		0x00000010
-
-/* AArch64 SPSR bits */
-#define PSR_F_BIT	0x00000040
-#define PSR_I_BIT	0x00000080
-#define PSR_A_BIT	0x00000100
-#define PSR_D_BIT	0x00000200
-#define PSR_BTYPE_MASK	0x00000c00
-#define PSR_SSBS_BIT	0x00001000
-#define PSR_PAN_BIT	0x00400000
-#define PSR_UAO_BIT	0x00800000
-#define PSR_DIT_BIT	0x01000000
-#define PSR_TCO_BIT	0x02000000
-#define PSR_V_BIT	0x10000000
-#define PSR_C_BIT	0x20000000
-#define PSR_Z_BIT	0x40000000
-#define PSR_N_BIT	0x80000000
-
-#define PSR_BTYPE_SHIFT		10
-
-/*
- * Groups of PSR bits
- */
-#define PSR_f		0xff000000	/* Flags		*/
-#define PSR_s		0x00ff0000	/* Status		*/
-#define PSR_x		0x0000ff00	/* Extension		*/
-#define PSR_c		0x000000ff	/* Control		*/
-
-/* Convenience names for the values of PSTATE.BTYPE */
-#define PSR_BTYPE_NONE		(0b00 << PSR_BTYPE_SHIFT)
-#define PSR_BTYPE_JC		(0b01 << PSR_BTYPE_SHIFT)
-#define PSR_BTYPE_C		(0b10 << PSR_BTYPE_SHIFT)
-#define PSR_BTYPE_J		(0b11 << PSR_BTYPE_SHIFT)
+#include <asm/pstate.h>
 
 /* syscall emulation path in ptrace */
 #define PTRACE_SYSEMU		  31
diff --git a/include/arch/arm64/asm/pstate.h b/include/arch/arm64/asm/pstate.h
new file mode 100644
index 000000000000..3ff6073a0eaa
--- /dev/null
+++ b/include/arch/arm64/asm/pstate.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_PSTATE_H
+#define __ASM_PSTATE_H
+
+#include <asm/sysreg-defs.h>
+#ifdef __arm64__
+#include <uapi/asm/pstate.h>
+#else
+#include <uapi/arch/arm64/asm/pstate.h>
+#endif // __arm64__
+
+/* Additional SPSR bits not exposed in the UABI */
+#define PSR_MODE_THREAD_BIT	BIT(0)
+#define PSR_IL_BIT		SPSR_IL
+
+/* SPSR_ELx bits for exceptions taken from AArch32 */
+#define PSR_AA32_MODE_MASK	SPSR_MODE_MASK
+#define PSR_AA32_MODE_USR	(SPSR_MODE_32BIT | SPSR32_MODE_USR)
+#define PSR_AA32_MODE_FIQ	(SPSR_MODE_32BIT | SPSR32_MODE_FIQ)
+#define PSR_AA32_MODE_IRQ	(SPSR_MODE_32BIT | SPSR32_MODE_IRQ)
+#define PSR_AA32_MODE_SVC	(SPSR_MODE_32BIT | SPSR32_MODE_SVC)
+#define PSR_AA32_MODE_ABT	(SPSR_MODE_32BIT | SPSR32_MODE_ABT)
+#define PSR_AA32_MODE_HYP	(SPSR_MODE_32BIT | SPSR32_MODE_HYP)
+#define PSR_AA32_MODE_UND	(SPSR_MODE_32BIT | SPSR32_MODE_UND)
+#define PSR_AA32_MODE_SYS	(SPSR_MODE_32BIT | SPSR32_MODE_SYS)
+#define PSR_AA32_T_BIT		SPSR32_T
+#define PSR_AA32_F_BIT		SPSR_F
+#define PSR_AA32_I_BIT		SPSR_I
+#define PSR_AA32_A_BIT		SPSR_A
+#define PSR_AA32_E_BIT		SPSR32_E
+#define PSR_AA32_PAN_BIT	SPSR_PAN
+#define PSR_AA32_SSBS_BIT	SPSR32_SSBS
+#define PSR_AA32_DIT_BIT	SPSR_DIT
+#define PSR_AA32_Q_BIT		SPSR32_Q
+#define PSR_AA32_V_BIT		SPSR_V
+#define PSR_AA32_C_BIT		SPSR_C
+#define PSR_AA32_Z_BIT		SPSR_Z
+#define PSR_AA32_N_BIT		SPSR_N
+#define PSR_AA32_IT_MASK	SPSR32_IT_MASK	/* If-Then execution state mask */
+#define PSR_AA32_GE_MASK	SPSR32_GE_MASK
+
+/* AArch32 CPSR bits, as seen in AArch32 */
+#define COMPAT_PSR_DIT_BIT	0x00200000
+
+#endif /* __ASM_PSTATE_H */
diff --git a/include/arch/arm64/asm/sysreg-defs.h b/include/arch/arm64/asm/sysreg-defs.h
index d5196f293e19..4460fae38623 100644
--- a/include/arch/arm64/asm/sysreg-defs.h
+++ b/include/arch/arm64/asm/sysreg-defs.h
@@ -470,6 +470,48 @@
 #define SYS_FPEXC32_EL2			sys_reg(3, 4, 5, 3, 0)
 #define SYS_TFSR_EL2			sys_reg(3, 4, 5, 6, 0)
 
+#define SPSR_PPEND			BIT(33)
+#define SPSR_N				BIT(31)
+#define SPSR_Z				BIT(30)
+#define SPSR_C				BIT(29)
+#define SPSR_V				BIT(28)
+#define SPSR32_Q			BIT(27)
+#define SPSR32_IT_MASK			(GENMASK(26, 25) | GENMASK(15, 10))
+#define SPSR64_TCO			BIT(25)
+#define SPSR_DIT			BIT(24)
+#define SPSR64_UAO			BIT(23)
+#define SPSR32_SSBS			BIT(23)
+#define SPSR_PAN			BIT(22)
+#define SPSR_SS				BIT(21)
+#define SPSR_IL				BIT(20)
+#define SPSR32_GE_MASK			GENMASK(19, 16)
+#define SPSR64_SSBS			BIT(12)
+#define SPSR64_BTYPE_SHIFT		10
+#define SPSR64_BTYPE_MASK		(UL(3) << SPSR64_BTYPE_SHIFT)
+#define SPSR64_D			BIT(9)
+#define SPSR32_E			BIT(9)
+#define SPSR_A				BIT(8)
+#define SPSR_I				BIT(7)
+#define SPSR_F				BIT(6)
+#define SPSR32_T			BIT(5)
+#define SPSR_MODE_MASK			UL(0x1f)
+#define SPSR_MODE_32BIT			BIT(4)
+#define SPSR64_MODE_EL0			UL(0x0)
+#define SPSR64_MODE_EL1t		UL(0x4)
+#define SPSR64_MODE_EL1h		UL(0x5)
+#define SPSR64_MODE_EL2t		UL(0x8)
+#define SPSR64_MODE_EL2h		UL(0x9)
+#define SPSR64_MODE_EL3t		UL(0xc)
+#define SPSR64_MODE_EL3h		UL(0xd)
+#define SPSR32_MODE_USR			UL(0x0)
+#define SPSR32_MODE_FIQ			UL(0x1)
+#define SPSR32_MODE_IRQ			UL(0x2)
+#define SPSR32_MODE_SVC			UL(0x3)
+#define SPSR32_MODE_ABT			UL(0x7)
+#define SPSR32_MODE_HYP			UL(0xa)
+#define SPSR32_MODE_UND			UL(0xb)
+#define SPSR32_MODE_SYS			UL(0xf)
+
 #define SYS_FAR_EL2			sys_reg(3, 4, 6, 0, 0)
 #define SYS_HPFAR_EL2			sys_reg(3, 4, 6, 0, 4)
 
diff --git a/include/uapi/arch/arm64/asm/pstate.h b/include/uapi/arch/arm64/asm/pstate.h
new file mode 100644
index 000000000000..87b2acec9ac2
--- /dev/null
+++ b/include/uapi/arch/arm64/asm/pstate.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
+#ifndef _UAPI__ASM_PSTATE_H
+#define _UAPI__ASM_PSTATE_H
+
+/*
+ * PSR bits
+ */
+#define PSR_MODE_EL0t  0x00000000
+#define PSR_MODE_EL1t  0x00000004
+#define PSR_MODE_EL1h  0x00000005
+#define PSR_MODE_EL2t  0x00000008
+#define PSR_MODE_EL2h  0x00000009
+#define PSR_MODE_EL3t  0x0000000c
+#define PSR_MODE_EL3h  0x0000000d
+#define PSR_MODE_MASK  0x0000000f
+
+/* AArch32 CPSR bits */
+#define PSR_MODE32_BIT         0x00000010
+
+/* AArch64 SPSR bits */
+#define PSR_F_BIT      0x00000040
+#define PSR_I_BIT      0x00000080
+#define PSR_A_BIT      0x00000100
+#define PSR_D_BIT      0x00000200
+#define PSR_BTYPE_MASK 0x00000c00
+#define PSR_SSBS_BIT   0x00001000
+#define PSR_PAN_BIT    0x00400000
+#define PSR_UAO_BIT    0x00800000
+#define PSR_DIT_BIT    0x01000000
+#define PSR_TCO_BIT    0x02000000
+#define PSR_V_BIT      0x10000000
+#define PSR_C_BIT      0x20000000
+#define PSR_Z_BIT      0x40000000
+#define PSR_N_BIT      0x80000000
+
+#define PSR_BTYPE_SHIFT                10
+
+/*
+ * Groups of PSR bits
+ */
+#define PSR_f          0xff000000      /* Flags                */
+#define PSR_s          0x00ff0000      /* Status               */
+#define PSR_x          0x0000ff00      /* Extension            */
+#define PSR_c          0x000000ff      /* Control              */
+
+/* Convenience names for the values of PSTATE.BTYPE */
+#define PSR_BTYPE_NONE         (0b00 << PSR_BTYPE_SHIFT)
+#define PSR_BTYPE_JC           (0b01 << PSR_BTYPE_SHIFT)
+#define PSR_BTYPE_C            (0b10 << PSR_BTYPE_SHIFT)
+#define PSR_BTYPE_J            (0b11 << PSR_BTYPE_SHIFT)
+
+#endif /* _UAPI__ASM_PSTATE_H */
-- 
2.51.0


