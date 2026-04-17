Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E050F436B4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 15:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZ3/ORV9RtymMCSRua+nR0oD5sT1rbjTBBVsIvLeDmI=; b=KRPA+bY4cAE7pbNv/gO+eKKLla
	wpeys7LQHc8r/eWqFjLdZfNXyzaJgoy+zFiFGCu0uOqvPpqRd5/5ysg7sXwlwhlp/WX4VMx54Hicr
	9Z9DcI4ovUmfPVLT9YJZ83HVqLGBcy6AUEbUCRQ9tIyjdaW5tejIGvTtbV9bXWUBGOwlR2Lv8p/Hv
	xQ7uJhDVoZl5I+/Z9n99nSGeWyHIohJlnw0tdWvRF8u81KzDo+YPsvnJOnJ5B/2LqIpmi4gGKOW1U
	QZLnxF1leVVAB/pLCsgIHtQPbHG2kxow75Y/x6d0iRDC6kK+1Rs8sQPYGikAN/PjWToUXqqFVEK38
	wvD4B3jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDkoM-00000004Apc-0Ued;
	Fri, 17 Apr 2026 15:08:50 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDkoJ-00000004Anv-015H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 15:08:48 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HEYWbW1804477;
	Fri, 17 Apr 2026 15:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=hZ3/ORV9RtymMCSRu
	a+nR0oD5sT1rbjTBBVsIvLeDmI=; b=IVJU2MgtNtdl8k7XKk+x8hM8YCITAqs+u
	VBzN+2qfsz97p+QMav64omqQ9/jyTgj9oyqLCXRMAl6xZrAZUn47RsmgXaZQBP8R
	8cV8I63fLrMwyMZo0yMC20cZuBCR0B2taINZOGgOLrt9QPKtaSH/VrpFU+X/9L61
	se2pXBPrpxAZyS1N08Pzfnav9EYv3INYdS3Z0ZjlsYN59mnAWsXEVR/ANj4o9pSv
	0v52YWlvYompQu7h7bwfEfdALuXgninCSnrAMYg7JU6Wm/wABnUXnWJJttZVbyLX
	smMRwo2zmyPZFSKcDKRpv1IPyYbwDCtDy5bZJ64qVflN6gUt7g61g==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dh89khxeq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Apr 2026 15:08:34 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 63HDKHwg025643;
	Fri, 17 Apr 2026 15:08:34 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4dg2ujyg5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Apr 2026 15:08:33 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63HF8Um348365950
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Apr 2026 15:08:30 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E0DB20043;
	Fri, 17 Apr 2026 15:08:30 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 49DC92004B;
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
Subject: [PATCH v1 4/4] arm64/unwind_user/sframe: Enable sframe unwinding on arm64
Date: Fri, 17 Apr 2026 17:08:27 +0200
Message-ID: <20260417150827.1183376-5-jremus@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417150827.1183376-1-jremus@linux.ibm.com>
References: <20260417150827.1183376-1-jremus@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: BfedFkVZO-xnB-Fo-fQ4KpLIcJFkapuE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE0OSBTYWx0ZWRfX67ZZy41hE9XF
 NVV+6dQU1UONeBOOqW+BZOWiydgr8aOfnE86SBbqe1xH1ukpNTzU3PgiFTOy0oxwpOQ1e0OpTLD
 qjhsGcq8Oowb4vnDlfFeQVqm3C7SpfCeWLt+Bi2dQQAx6oJyOqEoPiQuggfYnDqD8gSmPvHdxl+
 0NnUTOvt7RtKOoteh83gTzaLoNNVXKRXj7FGrzuzOz2yISt+FOtPgbDMLa3Y/Y6ckoqFgd6CGWk
 8yeFuK3pAmbDw+lrhK8fEkDet2+2CACH9UAHS0kxIQd9BtBANAISabpvyMEDuxAvhAn+DFvN42k
 Zb5mtRqrfz49XZPnuVTKjmucfqZDB+2CxAyvNTwN5xGfUXyVpX2l6EzAQut2rSJG4Nh9/qNUYJz
 Bd7e/NE/tNcGZIJK+XfD0yKO8ATdRGam7EwvQrm5cOVsm8axx8Z6wYF1+eYduGNIsRmk04UOB/N
 c77UZwOJhWtLTFgz1iQ==
X-Proofpoint-ORIG-GUID: dlX5btp-3IlROH6HW2RI-JoRUw0W6BWx
X-Authority-Analysis: v=2.4 cv=W60IkxWk c=1 sm=1 tr=0 ts=69e24cf3 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8 a=8cyZKrTVTJG3FlwYzZ0A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_080847_163081_3CF43C9E 
X-CRM114-Status: GOOD (  22.35  )
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

Add arm64 support for unwinding of user space using SFrame.

This leverages the unwind user (sframe) support for s390 which
enables architectures that pass the return address in a register,
may not necessarily save the return address on the stack (for
instance in leaf functions), and have SP at call site equal
SP at entry.

For this purpose provide arm64-specific unwind_user_get_ra_reg() and
unwind_user_get_reg() implementations, which return the value of the
link register (LR) or an arbitrary register in the topmost user space
frame.  Define the arm64 SP and FP DWARF register numbers.

Signed-off-by: Jens Remus <jremus@linux.ibm.com>
---

Notes (jremus):
    Note:  An arm64 implementation of unwind_user_get_reg() is strictly
    only needed, if SFrame V3 flexible FDE would get generated for aarch64,
    which is currently not the case in GNU Binutils 2.46.

 arch/arm64/Kconfig                          |  1 +
 arch/arm64/include/asm/unwind_user.h        | 23 +++++++++++++++++++++
 arch/arm64/include/asm/unwind_user_sframe.h |  8 +++++++
 3 files changed, 32 insertions(+)
 create mode 100644 arch/arm64/include/asm/unwind_user_sframe.h

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 994fd5162a1d..641a3a5fe5c9 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -254,6 +254,7 @@ config ARM64
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_UNWIND_USER_FP
+	select HAVE_UNWIND_USER_SFRAME
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
 	select HAVE_GENERIC_VDSO
diff --git a/arch/arm64/include/asm/unwind_user.h b/arch/arm64/include/asm/unwind_user.h
index 0641d4d97b0f..3c7fd8c4ba5b 100644
--- a/arch/arm64/include/asm/unwind_user.h
+++ b/arch/arm64/include/asm/unwind_user.h
@@ -4,6 +4,7 @@
 
 #include <linux/sched/task_stack.h>
 #include <linux/types.h>
+#include <asm/insn.h>
 
 #ifdef CONFIG_UNWIND_USER
 
@@ -16,6 +17,28 @@ static inline int unwind_user_word_size(struct pt_regs *regs)
 	return sizeof(long);
 }
 
+static inline int unwind_user_get_ra_reg(unsigned long *val)
+{
+	struct pt_regs *regs = task_pt_regs(current);
+	*val = regs->regs[AARCH64_INSN_REG_LR];
+	return 0;
+}
+#define unwind_user_get_ra_reg unwind_user_get_ra_reg
+
+static inline int unwind_user_get_reg(unsigned long *val, unsigned int regnum)
+{
+	const struct pt_regs *regs = task_pt_regs(current);
+
+	if (regnum <= 30)
+		/* DWARF register numbers 0..15 */
+		*val = regs->regs[regnum];
+	else
+		return -EINVAL;
+
+	return 0;
+}
+#define unwind_user_get_reg unwind_user_get_reg
+
 #endif /* CONFIG_UNWIND_USER */
 
 #ifdef CONFIG_HAVE_UNWIND_USER_FP
diff --git a/arch/arm64/include/asm/unwind_user_sframe.h b/arch/arm64/include/asm/unwind_user_sframe.h
new file mode 100644
index 000000000000..65c0a6b6c835
--- /dev/null
+++ b/arch/arm64/include/asm/unwind_user_sframe.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_ARM64_UNWIND_USER_SFRAME_H
+#define _ASM_ARM64_UNWIND_USER_SFRAME_H
+
+#define SFRAME_REG_SP	31
+#define SFRAME_REG_FP	29
+
+#endif /* _ASM_ARM64_UNWIND_USER_SFRAME_H */
-- 
2.51.0


