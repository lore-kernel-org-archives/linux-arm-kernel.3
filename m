Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3DAC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 08:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i14rM4vcwrX517qmRBfd+AHM+6Me9WyF7fJHKq5CWXg=; b=jNn+wuUqSm0C6I1e5n7ZegewpW
	QJQ0cUKqYLmV+R1U6Y1Umc0V1DKVIelDFy7bHNj9IHWqemWE/B6fCrTX4XFjg0vgpwUe4UAByHyfA
	PFrIL+/03AYVELmoq9fOWc65v0tiy8QVfur881SzpBilkWcgpumHBr1yVEtNnknO4vhIgTHC5jXCe
	q1QKtjv5LnOp8Dz3Z9y+3gNbXIKpSgsSVKeWjyqXOVyHMklP20Tv9e4LvxrNzEuRKyoT7/FIIyd7q
	BtAxZ4GJe3FxSzedGQP4re8fd2+MFBhl8nVaa2lzownNq+2sOHEjfZrbdEXO74ewL1LyOZT5ATdyI
	SiMHzJYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgf4l-0000000Buox-1uJU;
	Mon, 06 Jul 2026 08:53:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgf4V-0000000BuUd-2zB1
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 06 Jul 2026 08:52:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=i14rM4vcwrX517qmRBfd+AHM+6Me9WyF7fJHKq5CWXg=; b=ixMpCLhnBzGR8CKMRh8z4aUcA5
	RN3Da9nGPJ6UNPOkVZPFCoxQRAozyRz1lpXSXl0qFDg+NNK9eyDJoZeJa3oHq4tp1WogVosIfTdbZ
	kaYMl/QxfpqbAn1Co13hoBfKFXD/A3RPrJa7U8Fd1I9EXc4c10vzkXbiXN3ywK4k/Zgg/lD5c/sJA
	EHC1lhWc48EW+SuoZmssQqNqC2gbLPZAqUfy/1N0MwD7dPD9h4/XzbTIdYN60Gc4rUSEY5jHizSXb
	UtxFIJEjgaycopMPuxisng6BPWeGI0UFmfXv4OlR8sjJ6kqVUMxdXR1gfM6XcKxObSuU8cfoD1m2y
	9oMHTyVw==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wgf4R-00000006LFd-1PgL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 08:52:58 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665MIZ6h2250769;
	Mon, 6 Jul 2026 08:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=i14rM4vcwrX517qmR
	Bfd+AHM+6Me9WyF7fJHKq5CWXg=; b=kiK84WloisksP17fH8yV+G+qmgeXMpPJJ
	05G23oz7cbfxzlQgrsNvddC7fpNFIKO/uc8WX3Cdd0q4YJkpfKJ7M87L+LDSXYdu
	44+nzja+dU5INlQtgBsJY/78tECmXyy8y/UYr3aqz5rKu2UYso8iF0wv/q+t4Vhk
	q6YKLhOZb6QW7XLaAnpETesCZUW8tawcpqGmL9AfrLdfEs7+Iz+ZNoj/Fr5nugXi
	+4eQTN8RPvz1usUfL5MQt9H+6tZngZPAmPD9b1960Us36mUOXwOAazuYrhNZvRHO
	6xsvItnItOJ3+X+n2qVpCnGqDkbMq1b0iFXIwIOyNPFVnyO7dIL6w==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6qkn8p60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 08:52:43 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6668nc6c023202;
	Mon, 6 Jul 2026 08:52:42 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f7cvvvyhe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 08:52:42 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6668qZlR47382966
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jul 2026 08:52:35 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF1A020040;
	Mon,  6 Jul 2026 08:52:34 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 847E92004D;
	Mon,  6 Jul 2026 08:52:34 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Jul 2026 08:52:34 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
        Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Friedrich Welter <fritz@linux.ibm.com>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hariharan Mari <hari55@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v4 12/27] KVM: s390: Use arm64 code
Date: Mon,  6 Jul 2026 10:52:12 +0200
Message-ID: <20260706085229.979525-13-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706085229.979525-1-seiden@linux.ibm.com>
References: <20260706085229.979525-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Q/XiJY2a c=1 sm=1 tr=0 ts=6a4b6cdb cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=f4bS4SikUpCF4YNHCQsA:9
X-Proofpoint-GUID: 5TO-cAI8mLp1RRudQdtIhYEZKiPnnbQS
X-Proofpoint-ORIG-GUID: 5TO-cAI8mLp1RRudQdtIhYEZKiPnnbQS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4OCBTYWx0ZWRfX4a+aNNvC55HN
 dO6UNUqbhv+90NGDnkE/qwZ2EgI5xt16C94dcRe7VZDGU1Oo8aoooym2qwFuCd1JTFINUuUPunQ
 ySLl4Ad3IXGYo6tio8Y8KAAfb9hJzjY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4OCBTYWx0ZWRfXw2OlDKjf75Yb
 0L2drh7kkw2osCOtlrSIwbHQsbJZrQ1qY4mxVGQQR9doH9gvjoJQBCUOVSI/fuv8VSO77RQaeJx
 A62K+Z0P/TJ+rx5S0uW3XxkCr2DY/kSkzT3UJcUm8dxBHwFmFjT3P2zpRWQ+QuQ4nA9nYOuArNK
 H3MbIS6cweOuiFT6dZ5pNsglX/PHNdo1eONGJ8YRFJqtwCiVgRb1Kh0Q3PSqA9EE6QPrf87aVLA
 +q0I/tVZEAVuzyTPuPQ2FZsQ9nOoTLh6fvlJ1AlzizhqjGInBcVd2UY1ONupCkeb+DsUmUHka7t
 CvD2Xg3hdZsRfqT066XXZgrTqtZfbYlXrNW7jFEiDsj2DjUViRAzt/0mXMTXF0vaABgSMXIBns+
 OIizSrcA4vMrWE9LDk52JJzbT7b5tst12sa5lhpWoOrTmR+J0bZafz94ra8Sex4nTC11e+vYga/
 cVLnT3szOGWU24K0nww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_095256_317456_1926F1A3 
X-CRM114-Status: GOOD (  21.13  )
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

Add the infrastructure to extract KVM/arm64 code into s390 at built
time similar to the arm64 header sharing. Add copy-arm64c.awk hat
detects ARM64_S390_COMMON markers and extracts marked section into an
.inc file that can be consumed by arm on s390 host code. If no marker is
found make will fail.

To ensure that no code is consumed twice by accident a guard is added
during file generation. A s390 C file wanting to consume such an inc
file must first define __INCL_GEN_ARM_FILE otherwise the inc file will
emit a compile error.

Example:
	#define __INCL_GEN_ARM_FILE
	#include <generated/arm.inc>
	#undef __INCL_GEN_ARM_FILE

Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/s390/kvm/arm64/Makefile.gen    | 30 +++++++++++++
 arch/s390/kvm/arm64/copy-arm64c.awk | 69 +++++++++++++++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 arch/s390/kvm/arm64/Makefile.gen
 create mode 100644 arch/s390/kvm/arm64/copy-arm64c.awk

diff --git a/arch/s390/kvm/arm64/Makefile.gen b/arch/s390/kvm/arm64/Makefile.gen
new file mode 100644
index 000000000000..2e8838bc6921
--- /dev/null
+++ b/arch/s390/kvm/arm64/Makefile.gen
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Extracts ARM64 marked sections to .inc files that are included by main source
+# files
+
+# List of ARM64 C files to extract
+ARM64_CFILES := \
+	arm.c \
+	guest.c \
+	reset.c \
+	handle_exit.c \
+	mmio.c \
+
+quiet_cmd_extract_inc = GEN     $@
+      cmd_extract_inc = mkdir -p $(dir $@); \
+                        $(AWK) -f $(src)/copy-arm64c.awk $< > $@ || \
+                        { echo "Error: No ARM64_S390_COMMON markers in $<" >&2; rm -f $@; exit 1; }
+
+$(obj)/generated/%.inc: $(srctree)/arch/arm64/kvm/%.c $(src)/copy-arm64c.awk FORCE
+	$(call if_changed,extract_inc)
+
+ARM64_INC_FILES := $(foreach cfile,$(ARM64_CFILES),generated/$(basename $(cfile)).inc)
+
+targets += $(ARM64_INC_FILES)
+clean-files += generated/*.inc
+
+$(addprefix $(obj)/,$(kvm-arm64-obj)): $(addprefix $(obj)/,$(ARM64_INC_FILES))
+
+$(foreach cfile,$(basename $(ARM64_CFILES)),\
+	$(eval $(obj)/$(cfile).o: $(obj)/generated/$(cfile).inc))
diff --git a/arch/s390/kvm/arm64/copy-arm64c.awk b/arch/s390/kvm/arm64/copy-arm64c.awk
new file mode 100644
index 000000000000..45d9c7034c17
--- /dev/null
+++ b/arch/s390/kvm/arm64/copy-arm64c.awk
@@ -0,0 +1,69 @@
+#!/usr/bin/awk -f
+# SPDX-License-Identifier: GPL-2.0
+#
+# Extract marked sections from ARM64 C files for sharing with s390 KVM
+#
+# Usage: share-arm64-cfile.awk <input_file>
+#
+# Extracts all sections between start/end markers. If no markers found, signals failure.
+
+BEGIN {
+	# Constants
+	start_pattern = "^#ifdef ARM64_S390_COMMON$"
+	end_pattern = "^#endif /\\* ARM64_S390_COMMON \\*/$"
+
+	# State variables
+	copying = found_marker = 0
+	file_header_done = 0
+}
+
+!file_header_done {
+	if (/^\/\*/ || /^\/\/ SPDX-License-Identifier:/) {
+		print
+		next
+	}
+	if (/[[:space:]]\*([[:space:]]|$)/) {
+		print
+		next
+	}
+	if (/\*\//) {
+		print " *"
+	} else {
+		print "/*"
+	}
+
+	filename = FILENAME
+	sub(/^.*arch\/arm64\//, "arch/arm64/", filename)
+	print " * This file was automatically generated from " filename
+	print " * Do not modify this file directly."
+	print " */"
+	print ""
+	print "#ifndef __INCL_GEN_ARM_FILE"
+	print "#error included .inc file w/o proper guard definition"
+	print "#undef __INCL_GEN_ARM_FILE"
+	print "#endif /* __INCL_GEN_ARM_FILE */"
+	print ""
+
+	file_header_done = 1
+}
+
+$0 ~ start_pattern {
+	copying = found_marker = 1
+	next
+}
+
+$0 ~ end_pattern {
+	copying = 0
+	next
+}
+
+copying {
+	gsub(/#include <asm\//, "#include <arm64/")
+	gsub(/#include <uapi\/asm\//, "#include <uapi/arm64/")
+	print
+	next
+}
+
+END {
+	exit !found_marker
+}
-- 
2.53.0


