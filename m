Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C87C624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 14:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wcayY45f6tm/SBULYCcZZVx122y7WQ+qbJJad3Mp8eI=; b=N4s3kgkOzdqo4ss6VFxMwT+CGv
	nzTwrNIYwWiETF3DWmZ4flPXGaPuQTN+bWm6FDhwcg2+p1ocEV9lOJ/ttQ5NkHO5Z+yrUBSWjLsCx
	x8xQWtySu0z4itipiHEoBgagtXUpDBxz9/jaxk83+3ddMYvDH8MA7uY/dOHbLH4JCNIsRkZz30Xmt
	EPP2yTuqfaieAzD278dgRr5ZNyvKNH8Pg49j/G8viP0y5RiIjdIRe/NzhOFtczTuJMEEBEtKQdKSD
	oQIQiNwX+XH7iCWoISDYEQ3kKIETP9CGyZoJPDto7jWsISgMYhiWrIpF9lF50PdmghhV8CsO9c2nC
	snCT1gwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13JL-00000009gSB-0n9z;
	Mon, 31 Aug 2026 14:48:35 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13JE-00000009gIc-2Ct4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 14:48:30 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VEZG2c2583359;
	Mon, 31 Aug 2026 14:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=wcayY45f6tm/SBULY
	CcZZVx122y7WQ+qbJJad3Mp8eI=; b=LuelOpKfyXOkkKU6Llotk4pq0cqZxZ7eI
	qiZGZ0KhPsS1YcA7cgrFr4CK2+okcwpkf56UQGi2e9/mwqueEI1yqmKsSWgV8Xdb
	6u/1VF3zXwiE9Gqbk5nYDRsx4R253MY7Qnx9j2zz5eQVZM6uegspnfQzTWXrx+iR
	ueXsMwkEWB1fx4ph5IEOWRETFLWWHgpKKaPFOetOET5UYs7KJYZGqY5mLfjfibZ4
	sPVGHHfxnJOqxd5GkTX1b4azBtUfzPtapaD5LQe9zswno9oaKAJZqSkI/pHEnBGL
	F27Zhx395542jgJ1l93VXCrwWkrrwGmj/CB8aWaWT6nPlA2oqIusA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbq2t1swc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 14:48:13 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67VEfbm9015527;
	Mon, 31 Aug 2026 14:48:13 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gc9rq6m6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 14:48:12 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67VEm9Zc13238772
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Aug 2026 14:48:09 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0656D20043;
	Mon, 31 Aug 2026 14:48:09 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 981072004E;
	Mon, 31 Aug 2026 14:48:08 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 31 Aug 2026 14:48:08 +0000 (GMT)
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
        Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hariharan Mari <hari55@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v7 13/23] KVM: s390: Use arm64 code
Date: Mon, 31 Aug 2026 16:47:50 +0200
Message-ID: <20260831144802.834315-14-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831144802.834315-1-seiden@linux.ibm.com>
References: <20260831144802.834315-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=bc1bluPB c=1 sm=1 tr=0 ts=6a95942e cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8 a=x1b9RNJZmR4nZInT6RoA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyNSBTYWx0ZWRfX+j6iD69HI84S
 4u45reHGT9PVDIHRmoTulFTdIsTSS0Fsm2vPP7W4hzMvB4uj9vPHqnFL0BNKbNShziXtfuocBlL
 Aqt54tNlxz4LMu5f1BTt028qepKn1Sk=
X-Proofpoint-ORIG-GUID: 6rw_PrP8qaW0qAdBYcCHTi3CgosDnQh9
X-Proofpoint-GUID: 1QdcAan5lJduifdpptSbzUojg8jeTdg2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyNSBTYWx0ZWRfX8Vuw6NpOjrPi
 ok8mlu0x0XaUPpqUBMDv3Dim86kuMGKwMRIcTDbtYxwMS7xKV71wpZ7TjBeQ3nnKHZcKLdDXRy5
 bv6GhhCm0KjvnLI5tgU3c0g909Vs8lRc6VCPLIlpbXmpUojm6VDGC+gomqQWCzN16Piw3VYXgFK
 mcPnt8viLMvP9A7n/IJXwcVZUJ+dPfNosv3L+kDhPOhi3MWsrzJJUnOa5NZQrpsMZa8CfGqaNvU
 19ivnaibRRt3sPPJIMTmMAxD6cskqHf+3aHPeINkuf5SyIHdlA2yGZw1oVRgQ6A5NsFLCEDNUMM
 35yR3ksOM4D1AuRlQi24XvEL6Zv4Q//E4bPFR0LO1J2pTUuBslKbUqvte0jCfuSrl9NgtiuyuQc
 X2b4GN7Qh9gnM+jwpM4V7moM7ZVAG/GqG3rnH1W95NIh9o0Z6zyc1NlZWb4bljlmjAfu1uDmio2
 M8evNXcJtsndX47mJtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_074828_701485_E75B37BF 
X-CRM114-Status: GOOD (  21.38  )
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
 arch/s390/kvm/arm64/.gitignore      |  2 +
 arch/s390/kvm/arm64/Makefile.gen    | 27 +++++++++++
 arch/s390/kvm/arm64/copy-arm64c.awk | 72 +++++++++++++++++++++++++++++
 3 files changed, 101 insertions(+)
 create mode 100644 arch/s390/kvm/arm64/.gitignore
 create mode 100644 arch/s390/kvm/arm64/Makefile.gen
 create mode 100644 arch/s390/kvm/arm64/copy-arm64c.awk

diff --git a/arch/s390/kvm/arm64/.gitignore b/arch/s390/kvm/arm64/.gitignore
new file mode 100644
index 000000000000..bd9d90694676
--- /dev/null
+++ b/arch/s390/kvm/arm64/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+generated/*
diff --git a/arch/s390/kvm/arm64/Makefile.gen b/arch/s390/kvm/arm64/Makefile.gen
new file mode 100644
index 000000000000..6ac7602b57cb
--- /dev/null
+++ b/arch/s390/kvm/arm64/Makefile.gen
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Extracts ARM64 marked sections to .inc files that are included by main source
+# files
+
+# List of ARM64 C files to extract
+ARM64_CFILES := \
+	arm.c \
+	guest.c \
+	handle_exit.c \
+	mmio.c \
+
+quiet_cmd_extract_inc = GEN     $@
+      cmd_extract_inc = mkdir -p $(dir $@); \
+                        $(AWK) -f $(src)/copy-arm64c.awk $< > $@ || \
+                        { echo "Error: No or unbalanced ARM64_S390_COMMON markers in $<" >&2; rm -f $@; exit 1; }
+
+$(obj)/generated/%.inc: $(srctree)/arch/arm64/kvm/%.c $(src)/copy-arm64c.awk FORCE
+	$(call if_changed,extract_inc)
+
+ARM64_INC_FILES := $(foreach cfile,$(ARM64_CFILES),generated/$(basename $(cfile)).inc)
+
+targets += $(ARM64_INC_FILES)
+clean-files += generated/*.inc
+
+$(foreach cfile,$(basename $(ARM64_CFILES)),\
+	$(eval $(obj)/$(cfile).o: $(obj)/generated/$(cfile).inc))
diff --git a/arch/s390/kvm/arm64/copy-arm64c.awk b/arch/s390/kvm/arm64/copy-arm64c.awk
new file mode 100644
index 000000000000..20bd73c52ec4
--- /dev/null
+++ b/arch/s390/kvm/arm64/copy-arm64c.awk
@@ -0,0 +1,72 @@
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
+	print "#else"
+	print "#undef __INCL_GEN_ARM_FILE"
+	print "#endif /* __INCL_GEN_ARM_FILE */"
+	print ""
+
+	file_header_done = 1
+}
+
+$0 ~ start_pattern {
+	if (copying) { exit 1 }
+	copying = found_marker = 1
+	next
+}
+
+$0 ~ end_pattern {
+	if (!copying) { exit 1 }
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
+	exit !found_marker || copying
+}
-- 
2.53.0


