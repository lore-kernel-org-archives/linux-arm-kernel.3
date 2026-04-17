Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E458F436B6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 15:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c2KqLQFtOA7xOWG1Z7g0t9kBHx5RFlh45SgvQkjyRMc=; b=uCMI+DDYL8W5RzT/Oglmju+7o+
	TwsPihsLgAB/2+DIotUIL+Oexq8INuyFdQjIrnCQ3VwG+xRpHkyUYRbxJ3w3fRT+o8Op7LksMYJQX
	npcEZjN7JbRpiSfO47M3HjOwVuXMHPBGW81RcHG0OzuEkqkdAFm+MSoEZdBg2ndkD2i5bGiGxZ17D
	Caoa/eocYGck8//3+zp4PHyEAQ3ZrfrqLIvSjmFbzeAweQOvK/J1/7H5ptS++7IL0+r9tME97UW6f
	NuCTW7P/imkYFRY8ZNEB4G1XpH0xccioe9imQXCHEu96GiJ0VEO/JqOoUCuW5E7WDdyjJgiAj0KL2
	Jch9imJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDkoR-00000004ArK-1KSv;
	Fri, 17 Apr 2026 15:08:55 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDkoK-00000004Aoh-1Ftz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 15:08:50 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HDJvAA2130601;
	Fri, 17 Apr 2026 15:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=c2KqLQFtOA7xOWG1Z
	7g0t9kBHx5RFlh45SgvQkjyRMc=; b=Nxx+GH1CMmATMYkcD/+4WJgkE+x99gtNE
	08dhDndO3epRr8Vy3gAGF6xCFC3HhhNet4gx3dyUZKF1/xYZKPsnyMjSmoDMtqcW
	8GxxhoOfbPJNn6wV3/PMBtuxwLSDrj+uMTfQcxZWJfKrsvXVCQ+UbJ9Pnw4GYRJk
	5pcFNLVtEBO7v9jhOah81RC3+ac/uMosc32frxeG4plmUYjRTpqxeNBe0QkXmwAk
	gaX6cs0+Y/JGM+512xWRsM6EAuvdfLnwVmyvqj6qPTuhtXuylfVdP1SmqNuAvf91
	v1GE2C3EXKQUXNWoEylYMAVYRFX9gn+RcO9ty/XtfcAlQHqbsaKmA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dh89nu8ug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Apr 2026 15:08:34 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 63HAehHm015158;
	Fri, 17 Apr 2026 15:08:33 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4dg0msyvc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Apr 2026 15:08:33 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63HF8Uui37421502
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Apr 2026 15:08:30 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 41FAF20043;
	Fri, 17 Apr 2026 15:08:30 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1164F2004D;
	Fri, 17 Apr 2026 15:08:30 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 17 Apr 2026 15:08:30 +0000 (GMT)
From: Jens Remus <jremus@linux.ibm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Steven Rostedt <rostedt@kernel.org>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Indu Bhagat <ibhagatgnu@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Dylan Hatch <dylanbhatch@google.com>, Weinan Liu <wnliu@google.com>
Cc: Jens Remus <jremus@linux.ibm.com>, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v1 3/4] arm64/vdso: Enable SFrame generation in vDSO
Date: Fri, 17 Apr 2026 17:08:26 +0200
Message-ID: <20260417150827.1183376-4-jremus@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417150827.1183376-1-jremus@linux.ibm.com>
References: <20260417150827.1183376-1-jremus@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: G_x5xLLkMNudAsXFhMgzlKdlMokhecXW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE0OSBTYWx0ZWRfX/x5GO7m+k+Og
 YF0KZGON/xPyEotPWDCReR+wJHo5E/AlKHiX5i9FS17LqiS3rYk9xfNfHKTLV/J/r3ZuCvGiVGx
 mcudwQ59PXwD4D1mMACOK+S7ifrKxnyyARBqVaBtMx/eRUn5upl2dOyj9zQ0+Zj2s+FotIK3L+K
 hPiOfuv/qMutl8ZTkgF9GYYdxRM8YMWTEr8bC1tz0XYuAM05wEEq+upFNkLMnukpFsdCxLXA91i
 PtZ0ZeEm3YoribXvQl/KQGFXTcZDbxmrIOBuZclXv3azpuabYWJrEct3nd/f5+ujssa3yzj0XGN
 8nE1OFbsXFpMwbMIM2bYDXHda4UCpUkuNjgnU5p3aqhwbYrmOZd/O24iHu+r4pTTsRiO4gGqnSt
 EEemMqaORYRV8wnfPpSUyNNLmfZTvInwSCuCwjx+eZNEniOMJLBd1zyFAqdOyogph1w0HdwGvb1
 cAtOLEOILtagoRAGnGw==
X-Proofpoint-ORIG-GUID: X0ZmsxiAiusL7OWHw_TdbYTeb-nD_QuH
X-Authority-Analysis: v=2.4 cv=FY4HAp+6 c=1 sm=1 tr=0 ts=69e24cf3 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=1XWaLZrsAAAA:8
 a=XY4kb5VVk54sx2ePs7AA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1011 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_080848_340136_040F2412 
X-CRM114-Status: GOOD (  18.18  )
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

This replicates Josh's x86 patch "x86/vdso: Enable sframe generation
in VDSO" [1] for arm64.

Enable .sframe generation in the vDSO library so kernel and user space
can unwind through it.  Keep all function symbols in the vDSO .symtab
for stack trace purposes.  This enables perf to lookup these function
symbols in addition to those already exported in vDSO .dynsym.

Starting with binutils 2.46 both GNU assembler and GNU linker
exclusively support generating and merging .sframe in SFrame V3 format.
For vDSO, only if supported by the assembler, generate .sframe, collect
it, mark it as KEEP, and generate a GNU_SFRAME program table entry.
Otherwise explicitly discard any .sframe.

[1]: x86/vdso: Enable sframe generation in VDSO,
     https://lore.kernel.org/all/20260211141357.271402-7-jremus@linux.ibm.com/

Signed-off-by: Jens Remus <jremus@linux.ibm.com>
---

Notes (jremus):
    @Dylan:  Adding -Wa,--gsframe-3 to the VDSO CC_FLAGS_ADD_VDSO (and
    AS_FLAGS_ADD_VDSO) may clash with your patch [1] that adds likewise
    to the CC_FLAGS_REMOVE_VDSO.  Any idea how to resolve?
    
    [1]: [PATCH v3 2/8] arm64, unwind: build kernel with sframe V3 info,
         https://lore.kernel.org/all/20260406185000.1378082-3-dylanbhatch@google.com/

 arch/arm64/kernel/vdso/Makefile   | 14 ++++++++++++--
 arch/arm64/kernel/vdso/vdso.lds.S | 21 +++++++++++++++++++++
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
index 7dec05dd33b7..1f2f01673397 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -15,6 +15,10 @@ obj-vdso := vgettimeofday.o note.o sigreturn.o vgetrandom.o vgetrandom-chacha.o
 targets := $(obj-vdso) vdso.so vdso.so.dbg
 obj-vdso := $(addprefix $(obj)/, $(obj-vdso))
 
+ifeq ($(CONFIG_AS_SFRAME3),y)
+  SFRAME_CFLAGS := -Wa,--gsframe-3
+endif
+
 btildflags-$(CONFIG_ARM64_BTI_KERNEL) += -z force-bti
 
 # -Bsymbolic has been added for consistency with arm, the compat vDSO and
@@ -41,7 +45,9 @@ CC_FLAGS_REMOVE_VDSO := $(CC_FLAGS_FTRACE) -Os $(CC_FLAGS_SCS) \
 			$(CC_FLAGS_LTO) $(CC_FLAGS_CFI) \
 			-Wmissing-prototypes -Wmissing-declarations
 
-CC_FLAGS_ADD_VDSO := -O2 -mcmodel=tiny -fasynchronous-unwind-tables
+CC_FLAGS_ADD_VDSO := -O2 -mcmodel=tiny -fasynchronous-unwind-tables $(SFRAME_CFLAGS)
+
+AS_FLAGS_ADD_VDSO := $(SFRAME_CFLAGS)
 
 CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_REMOVE_VDSO)
 CFLAGS_REMOVE_vgetrandom.o = $(CC_FLAGS_REMOVE_VDSO)
@@ -49,6 +55,10 @@ CFLAGS_REMOVE_vgetrandom.o = $(CC_FLAGS_REMOVE_VDSO)
 CFLAGS_vgettimeofday.o = $(CC_FLAGS_ADD_VDSO)
 CFLAGS_vgetrandom.o = $(CC_FLAGS_ADD_VDSO)
 
+AFLAGS_sigreturn.o = $(AS_FLAGS_ADD_VDSO)
+
+AFLAGS_vgetrandom-chacha.o = $(AS_FLAGS_ADD_VDSO)
+
 ifneq ($(c-gettimeofday-y),)
   CFLAGS_vgettimeofday.o += -include $(c-gettimeofday-y)
 endif
@@ -65,7 +75,7 @@ $(obj)/vdso.so.dbg: $(obj)/vdso.lds $(obj-vdso) FORCE
 	$(call if_changed,vdsold_and_vdso_check)
 
 # Strip rule for the .so file
-$(obj)/%.so: OBJCOPYFLAGS := -S
+$(obj)/%.so: OBJCOPYFLAGS := -g
 $(obj)/%.so: $(obj)/%.so.dbg FORCE
 	$(call if_changed,objcopy)
 
diff --git a/arch/arm64/kernel/vdso/vdso.lds.S b/arch/arm64/kernel/vdso/vdso.lds.S
index 52314be29191..527e107ca4b5 100644
--- a/arch/arm64/kernel/vdso/vdso.lds.S
+++ b/arch/arm64/kernel/vdso/vdso.lds.S
@@ -15,6 +15,8 @@
 #include <asm-generic/vmlinux.lds.h>
 #include <vdso/datapage.h>
 
+#define KEEP_SFRAME	IS_ENABLED(CONFIG_AS_SFRAME)
+
 OUTPUT_FORMAT("elf64-littleaarch64", "elf64-bigaarch64", "elf64-littleaarch64")
 OUTPUT_ARCH(aarch64)
 
@@ -68,6 +70,13 @@ SECTIONS
 		*(.igot .igot.plt)
 	}						:text
 
+#if KEEP_SFRAME
+	.sframe		: {
+		KEEP (*(.sframe))
+		*(.sframe.*)
+	}						:text	:sframe
+#endif
+
 	_end = .;
 	PROVIDE(end = .);
 
@@ -78,9 +87,18 @@ SECTIONS
 		*(.data .data.* .gnu.linkonce.d.* .sdata*)
 		*(.bss .sbss .dynbss .dynsbss)
 		*(.eh_frame .eh_frame_hdr)
+#if !KEEP_SFRAME
+		*(.sframe)
+		*(.sframe.*)
+#endif
 	}
 }
 
+/*
+ * Very old versions of ld do not recognize this name token; use the constant.
+ */
+#define PT_GNU_SFRAME	0x6474e554
+
 /*
  * We must supply the ELF program headers explicitly to get just one
  * PT_LOAD segment, and set the flags explicitly to make segments read-only.
@@ -90,6 +108,9 @@ PHDRS
 	text		PT_LOAD		FLAGS(5) FILEHDR PHDRS; /* PF_R|PF_X */
 	dynamic		PT_DYNAMIC	FLAGS(4);		/* PF_R */
 	note		PT_NOTE		FLAGS(4);		/* PF_R */
+#if KEEP_SFRAME
+	sframe		PT_GNU_SFRAME	FLAGS(4);		/* PF_R */
+#endif
 }
 
 /*
-- 
2.51.0


