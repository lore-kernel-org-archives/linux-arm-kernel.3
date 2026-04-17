Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A89F436B6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 15:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+8lIijQhG6N6RcEpGO5kMYNzpa3Tr+MHEu9UN5CrDU=; b=rp41xgf0+ZROlrWKSzkGT6650o
	KjoTyyEixkmp2VwNZ8nciMy9aCKOcg6oUKRAQld8G4l1mSvZvlvr+jQMXT4DPnPbS42jmfiIW2Pvl
	1bXoZoAOXR7iPXYhs6eMwViQonzd8B2oa6D+09HXgEflNe3KobM6WlPgWYKqrYUU/GwpasT7CO4eG
	jGTkqGyNbjXvHmpBuDtcPBLirZKvq0z5fMN4f4uvIwW2M7kASrBeB/3JC/7Zfj+9TdxVp6tVgrq/g
	GUR9Sr7cXjbTOHbsVAOPd/X31HiUgp8+OUW3dDd9TuA6AMdgu2+WJgr0wQMMaGippX5lyM0qtEP7o
	N8jAUy0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDkoQ-00000004Aqn-33Tf;
	Fri, 17 Apr 2026 15:08:54 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDkoJ-00000004Any-1z4U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 15:08:49 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HDdOH61842914;
	Fri, 17 Apr 2026 15:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=D+8lIijQhG6N6RcEp
	GO5kMYNzpa3Tr+MHEu9UN5CrDU=; b=S/Sokx9BBw2YRJBjcAxlBUDYJ5VO/6zKD
	Op46RHP0Y1ygyrMBASAGbvLp3py715Gs2hjxAcFLR0La8JkNCkaAIJ2SXp7RzfX9
	vy1H4SaXJFRgFkEa4HRhmEX5DBMVjzyPADdqpDUvUM2RcG8m1AAagKxHs81QisfI
	Gj0GO9yD3CGtFTXy4BDIkuYqKuc2LPWs9dvzeXNFvzaYypU6i3/Yz7g3imVImnVt
	XqbhBP7BszzulpFC1TRn8zjVcTQVSDbwLWlYxaX50gukopAokinxd0WOu/1vtta2
	0o7zZq4lCEaGHyr74l4Lc9M2O22lFQCaKvw74TVLfRxTeSPviVMeQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dh89n36da-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Apr 2026 15:08:34 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 63HE2bCa026284;
	Fri, 17 Apr 2026 15:08:33 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4dg2ujyg5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Apr 2026 15:08:33 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63HF8TKL6685086
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Apr 2026 15:08:30 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB2C420043;
	Fri, 17 Apr 2026 15:08:29 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 96FD72004D;
	Fri, 17 Apr 2026 15:08:29 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 17 Apr 2026 15:08:29 +0000 (GMT)
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
Subject: [PATCH v1 1/4] arm64/unwind_user/fp: Enable HAVE_UNWIND_USER_FP
Date: Fri, 17 Apr 2026 17:08:24 +0200
Message-ID: <20260417150827.1183376-2-jremus@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417150827.1183376-1-jremus@linux.ibm.com>
References: <20260417150827.1183376-1-jremus@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE0OSBTYWx0ZWRfXyL+AaX4sW4c1
 IztvbvVAcInJEcSMTLTanbumNJLLsJiBjUgjAmn8ghNfyA/+AouV2PHxMofVcMIDkm2HU4nY0cm
 tlanb96m53gZggVYlfy20dZ6a40ihAVdxCBz/Y2XuVfNEm0w6Dh18etXo9KmMMz2EmPfi9tsGiW
 FFHJmOuAUzJxsm0n/FJSC/qTY3326BZ0lQpZDMan6Z2r3U8UFDkInqNJqS48b1WODPCvGulSi0l
 d99ESZkNkbMAN+bthqbsL91qnUGEXT2E53OstsEceUQ7l2Nzm0Joiw9z68A9zpxNytH6kfelfDF
 zlt5OftCTkHRTyfommkYaHX2VOOD4jv5kvKoJrCctBlHL2wTNnnGOZu10nJuLkUx32oYwFSLq+g
 3i0A1ulVfTAxdg5njXZKUINvvGLUyioM0tDMSZQfcXL11nX+gFMvFcBsIR8IjGTQPZV8s9ejDON
 BJd8zO3iM8zWD4jXZww==
X-Authority-Analysis: v=2.4 cv=eJ4jSnp1 c=1 sm=1 tr=0 ts=69e24cf2 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8 a=5cNvg9WSwcz2foiWP2IA:9
X-Proofpoint-GUID: iyloqNsP97RSgzY5YMWBlOh_W7aeqEgQ
X-Proofpoint-ORIG-GUID: bOd7EevnKLOJgcOLxkyOZ266bQ2hrW3I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1011 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_080847_515276_21BE6385 
X-CRM114-Status: GOOD (  19.04  )
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

Add arm64 support for unwinding of user space using frame pointer (FP).

For this purpose enable the config option HAVE_UNWIND_USER_FP and
provide an arm64-specific ARCH_INIT_USER_FP_FRAME definition (specifying
the CFA offset from FP and the FP and RA offsets from CFA).  Unlike x86,
as there is no mean to determine whether the user space IP in the
topmost frame is at function entry, rely on the common definition of
unwind_user_at_function_start(), which always returns false, and common
dummy definition of ARCH_INIT_USER_FP_ENTRY_FRAME.

For unwind user in general provide an arm64-specific implementation
of unwind_user_word_size().

Signed-off-by: Jens Remus <jremus@linux.ibm.com>
---
 arch/arm64/Kconfig                   |  1 +
 arch/arm64/include/asm/unwind_user.h | 42 ++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 arch/arm64/include/asm/unwind_user.h

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 38dba5f7e4d2..994fd5162a1d 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -253,6 +253,7 @@ config ARM64
 	select HAVE_RUST if RUSTC_SUPPORTS_ARM64
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
+	select HAVE_UNWIND_USER_FP
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
 	select HAVE_GENERIC_VDSO
diff --git a/arch/arm64/include/asm/unwind_user.h b/arch/arm64/include/asm/unwind_user.h
new file mode 100644
index 000000000000..0641d4d97b0f
--- /dev/null
+++ b/arch/arm64/include/asm/unwind_user.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_ARM64_UNWIND_USER_H
+#define _ASM_ARM64_UNWIND_USER_H
+
+#include <linux/sched/task_stack.h>
+#include <linux/types.h>
+
+#ifdef CONFIG_UNWIND_USER
+
+static inline int unwind_user_word_size(struct pt_regs *regs)
+{
+#ifdef COMPAT
+	if (compat_user_mode(regs))
+		return sizeof(int);
+#endif
+	return sizeof(long);
+}
+
+#endif /* CONFIG_UNWIND_USER */
+
+#ifdef CONFIG_HAVE_UNWIND_USER_FP
+
+#define ARCH_INIT_USER_FP_FRAME(ws)					\
+	.cfa		=  {						\
+		.rule		= UNWIND_USER_CFA_RULE_FP_OFFSET,	\
+		.offset		= 2*(ws),				\
+			},						\
+	.ra		= {						\
+		.rule		= UNWIND_USER_RULE_CFA_OFFSET_DEREF,	\
+		.offset		= -1*(ws),				\
+			},						\
+	.fp		= {						\
+		.rule		= UNWIND_USER_RULE_CFA_OFFSET_DEREF,	\
+		.offset		= -2*(ws),				\
+			},						\
+	.outermost	= false,
+
+#endif /* CONFIG_HAVE_UNWIND_USER_FP */
+
+#include <asm-generic/unwind_user.h>
+
+#endif /* _ASM_ARM64_UNWIND_USER_H */
-- 
2.51.0


