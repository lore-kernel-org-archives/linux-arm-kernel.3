Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6A5F436B2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 15:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKca5QJQ1hxgTQwHYK4x+LZXd06rJ/B93mnhlgY1RYI=; b=G2JsmMo7cdNcmXsLoSju6BhMH8
	MBiGdWUtfps9sv7AJF2c7Xvz0J2AEd+JCIEUnz/nEJBDfgQu1F8oMtv7B9D+RMrtSfhlQkVR+sg3r
	xUyGQtDsZvCOJSC1Mil9S81WLOsYtZONvbGvMDXH20bTcf9Rb4zGOno4xrhQ6mcgoHJW9oKVLBM8u
	UsrdpSQO/JDN23o+omo1YIdTa8STHMthVS3/KBbwUOsRKJCcl1w4BStioB4UZuSARt8jjrUmHSMC6
	TaFNfjJJDr0yGqhNkefDJ2P1NmGIGW43ReN3e/kHBAjyTCXmRXJjkQvqaZcuquMD0dNr1AU52dUCT
	TjQ7hP1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDkoM-00000004Apl-1oAs;
	Fri, 17 Apr 2026 15:08:50 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDkoJ-00000004Anx-0BJ3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 15:08:48 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H9fZku1733164;
	Fri, 17 Apr 2026 15:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=UKca5QJQ1hxgTQwHY
	K4x+LZXd06rJ/B93mnhlgY1RYI=; b=XtWcRed5o6MfKsH6GiH1k3GOFR1dcvfHd
	N8kuTawPEG3JQy5Qigxb4ABu4RjjQXsfWeMaogbBNUl0GzUtLSJvSmSHAkmvfwt2
	A1AsV0fyxJfeCKgh7z4njQB43ndofe+1xpxHT6LGNq6R7Fj7QQJV3tGDVl7IHuZT
	FXxyRuwhuLJUNCErvwpp9o4SLtHGxD+jdNl/P5jJFedTzjNLZsBnncP9LFAKwHsu
	P4+z9EfEPgxgiOLTvx2bRwUfwlvkOpu88Z3YVjS9w9K7gik3vSqASOPSK6hMdWlG
	/2zyKnKJyRJFEH1y6L8zypQ28O5tFFFUrECsYa3ErEkeg5RhznTzQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dh89mhw5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Apr 2026 15:08:34 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 63HCQfqh003586;
	Fri, 17 Apr 2026 15:08:34 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dg1mnqpda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Apr 2026 15:08:33 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63HF8U8737421500
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Apr 2026 15:08:30 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B8A120043;
	Fri, 17 Apr 2026 15:08:30 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D09E42004B;
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
Subject: [PATCH v1 2/4] arm64/uaccess: Add unsafe_copy_from_user() implementation
Date: Fri, 17 Apr 2026 17:08:25 +0200
Message-ID: <20260417150827.1183376-3-jremus@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417150827.1183376-1-jremus@linux.ibm.com>
References: <20260417150827.1183376-1-jremus@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=I/dVgtgg c=1 sm=1 tr=0 ts=69e24cf3 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=DR0qyCAueFOdPjQfhtcA:9
X-Proofpoint-GUID: VN9voE7jdsiIXsDy1wB_9tHxLAk6-xBY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE0OSBTYWx0ZWRfX8Y4dfi4g+C4l
 LIqjVSU/ldhZASrP7sosUM6uB6+TgFVMy765zyYhcLmysM5RhlC8VYnven32mUaUdk4pua/womj
 gTxVXgAbZdPPcFxMYgG3qeZZmP7hbcXKIU2T7vGAMvUoBsp0XB8NggB5oLxiiNZLVGHIasS+Smg
 yhQ/I74huTn/vfD+J9FSlX3sFsjeZR+X7mn4bE68+2wCJO58Lru7yFFBJltds7yfzqDek88nOad
 /nX75gbqcQhFMBXTifZ9H8EiXqt50j+oZeafMgcsHYsrbp5EW5UiPMTMBLitr3PWJUcoRLppgLD
 MW84nipmN1R71sLWTapTUzwFNtgdq36L/p08qi6yaZBcOXWxdlKOeTRD5XLe0nUOREn2H5nKoqP
 6bwlttkIRVyLcRNBPvwQ1gg5BOdrno1dskGEwJOlB1oJyR4lz2KJBSHeEPvkRAhIA7y3Pq1dLTV
 GeOKM04tNJAcY6MVxUA==
X-Proofpoint-ORIG-GUID: baHr-ceya3FGTbt7zWUuPEtJIg5w4-or
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1011 adultscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_080847_197126_BD3B53AF 
X-CRM114-Status: GOOD (  14.05  )
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

This replicates Josh's x86 patch "x86/uaccess:
Add unsafe_copy_from_user() implementation" [1] for arm64.

Add an arm64 implementation of unsafe_copy_from_user() similar to the
existing unsafe_copy_to_user().

For this purpose rename the unsafe_copy_loop() helper to
unsafe_copy_to_user_loop() and introduce a unsafe_copy_from_user_loop()
helper.

While at it rename the unsafe_copy_to_user() local variables
__ucu_{dst|src|len} to __{dst|src|len} and change their pointer
type to void * to align to the x86 patch.

[1]: x86/uaccess: Add unsafe_copy_from_user() implementation,
     https://lore.kernel.org/all/20251119132323.1281768-4-jremus@linux.ibm.com/

Signed-off-by: Jens Remus <jremus@linux.ibm.com>
---
 arch/arm64/include/asm/uaccess.h | 39 ++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 9810106a3f66..37d7d16b86a9 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -437,7 +437,7 @@ static inline void user_access_restore(unsigned long enabled) { }
  * We want the unsafe accessors to always be inlined and use
  * the error labels - thus the macro games.
  */
-#define unsafe_copy_loop(dst, src, len, type, label)				\
+#define unsafe_copy_to_user_loop(dst, src, len, type, label)			\
 	while (len >= sizeof(type)) {						\
 		unsafe_put_user(*(type *)(src),(type __user *)(dst),label);	\
 		dst += sizeof(type);						\
@@ -445,15 +445,34 @@ static inline void user_access_restore(unsigned long enabled) { }
 		len -= sizeof(type);						\
 	}
 
-#define unsafe_copy_to_user(_dst,_src,_len,label)			\
-do {									\
-	char __user *__ucu_dst = (_dst);				\
-	const char *__ucu_src = (_src);					\
-	size_t __ucu_len = (_len);					\
-	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u64, label);	\
-	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u32, label);	\
-	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u16, label);	\
-	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u8, label);	\
+#define unsafe_copy_to_user(_dst, _src, _len, label)				\
+do {										\
+	void __user *__dst = (_dst);						\
+	const void *__src = (_src);						\
+	size_t __len = (_len);							\
+	unsafe_copy_to_user_loop(__dst, __src, __len, u64, label);		\
+	unsafe_copy_to_user_loop(__dst, __src, __len, u32, label);		\
+	unsafe_copy_to_user_loop(__dst, __src, __len, u16, label);		\
+	unsafe_copy_to_user_loop(__dst, __src, __len, u8,  label);		\
+} while (0)
+
+#define unsafe_copy_from_user_loop(dst, src, len, type, label)			\
+	while (len >= sizeof(type)) {						\
+		unsafe_get_user(*(type *)(dst), (type __user *)(src), label);	\
+		dst += sizeof(type);						\
+		src += sizeof(type);						\
+		len -= sizeof(type);						\
+	}
+
+#define unsafe_copy_from_user(_dst, _src, _len, label)				\
+do {										\
+	void *__dst = (_dst);							\
+	void __user *__src = (_src);						\
+	size_t __len = (_len);							\
+	unsafe_copy_from_user_loop(__dst, __src, __len, u64, label);		\
+	unsafe_copy_from_user_loop(__dst, __src, __len, u32, label);		\
+	unsafe_copy_from_user_loop(__dst, __src, __len, u16, label);		\
+	unsafe_copy_from_user_loop(__dst, __src, __len, u8,  label);		\
 } while (0)
 
 #define INLINE_COPY_TO_USER
-- 
2.51.0


