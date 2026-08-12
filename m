Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3710CC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 15:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rJrLyzddm9CEpE2TZZohj7jwwyh45qkZ85dZIflvNdE=; b=2M/TP//db9AwfiyD9FMPTD1URd
	8vPwhj5tGDSYRYWcni5+7IqkYfHMI8iGqzilKSt9zZSe7cbXzk7RKXQvMhxfKRJn1uL0c97nG1TdT
	vTyrKVFiumZ1yzTApum6vU+BWtGuzW7oAgIDVDY/y2BLEgEWt/LGRo34uwxR8iKGW8tjxCCQoOD34
	F/Qk2VSYPTRQFC8brDgCDYCL7KRyszwc0Z25TDHqCVgf+8GO6W7UmjgX6kReHxGzwppOZLRM/gVic
	yOMDzbrVtYZlvgAk66qWlHSd/bXFhea8Scy+9oLBY32b3FVqOuTfzay2/iW4g6H3MW9ZcLJKeuuem
	pGa5Lu+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuB0m-0000000GTzF-01xj;
	Wed, 12 Aug 2026 15:37:00 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuB0f-0000000GTsz-2YCR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 15:36:57 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CE1pHC3640585;
	Wed, 12 Aug 2026 15:36:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=rJrLyzddm9CEpE2TZ
	Zohj7jwwyh45qkZ85dZIflvNdE=; b=rlEXqtgPpJxQnGEBAEYtV8jtCkb5LbI0W
	GOy1nWe7BvFfcByl9X8O3mm1mBNe+AW11AA4/fL8GKzQ6zof6StHFLp/R2ADbcrN
	xG2JPIVQvskACbkfTL/cG1a0VqEkNaLXG0EZnwTiMnQzGPQA6KcCabVX9zFpgLJ7
	DEBnriGwMii/SMfxHvsxjGeq5MDKWCZDbLYM8KAyYTZkUjtBHn5qSntSYnY0Bgm1
	fKJXS8CfO4e1NfTJWQOcKf9luQXdW0VV1MYDmehSfxL7sOtTApPtU7ADJKys1oXM
	xKzdiljjDq9BTJY0lN6hkpb6b4IlBZk/HdE4xIs5nZosVQN1pH+yA==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fwvq9k7bg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 15:36:39 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67CFBKqN018660;
	Wed, 12 Aug 2026 15:36:38 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fxf5w6tcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 15:36:38 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67CFaYE148693686
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Aug 2026 15:36:34 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 46D6220040;
	Wed, 12 Aug 2026 15:36:34 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF1642004D;
	Wed, 12 Aug 2026 15:36:33 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 12 Aug 2026 15:36:33 +0000 (GMT)
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
Subject: [PATCH v6 05/33] arm64: ptrace: Use constants for compat register numbers
Date: Wed, 12 Aug 2026 17:36:01 +0200
Message-ID: <20260812153631.3376090-6-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812153631.3376090-1-seiden@linux.ibm.com>
References: <20260812153631.3376090-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: XxRMhA5t4KAqrWvUZzivpLuljWJk0Lzz
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a7c9308 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=8sKaXpLx0aSSeG29UzUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEyNiBTYWx0ZWRfX9zkNOYox4fBp
 Uuvky4U1aRpnkBfvNenjPz4iMYWUKb1jEzdwn/u9z894jXTideB3xIJWqGXGGibH5hQ0xlGI0OD
 u/TwQu0htUNNtcy1VlAGbVCqpUA81OpNJfbT0QyQNo530zVBuu7n4H4wZJ16fyRoRfA0+Fgco1o
 rlZHaI6N3qMHkK0q735j9BJKETpSvEqznxUF94aEVOV/CksLd5UfMVH2flvRN3NBaGSNJGuCGgw
 CTrk7Nz+K2Cw1ObcDXLoYsPzgWHGufNt1kA7H1tipK0N5DsA0hVQZiPnHW2vuCHbt4WDQB6EMkM
 FrEJCmjof74ri367kWN85/N1asbhdAxI9tZnrVA5yrY7yErEHHCC4ns/uezFi9BPNwSRmkjjcd8
 Bee6+ISQ1wDouUfGjgE1j5xXYy9nBUyqYrYIxogHGPC7NrnMO2WD/5anaLZERDTKtQia6iqfwHz
 dMOetXE2cGDDGRmw2Vg==
X-Proofpoint-ORIG-GUID: dbaGJcJQZP5wv0qSovhsnwwl7zprjDUF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEyNiBTYWx0ZWRfX+Oc2q8yfDASJ
 zjOhW+KMaKrLuIwGsAxixDhLVAQHnmVBxkAIJUvDpdJfjT0jhnBNfFZy3w+E/2sqBCgbPSZQiOg
 ggAY2IN3+EC3hr1L+ApLaVSxFijskKw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_083653_664336_B05427F4 
X-CRM114-Status: GOOD (  13.51  )
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

Define an enum to determine the register number for the mapping from
AArch32 and AArch64 registers. This allows for a more flexible use of
the register mappings.

Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/arm64/include/asm/ptrace.h | 60 ++++++++++++++++++++++-----------
 1 file changed, 41 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index f7dc5fb9427d..49a83a0636b9 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -102,26 +102,48 @@
 #define COMPAT_USER_SZ	296
 
 /* Architecturally defined mapping between AArch32 and AArch64 registers */
+enum {
+	__compat_fp		= 11,
+	__compat_sp		= 13,
+	__compat_lr		= 14,
+	__compat_sp_hyp		= 15,
+	__compat_lr_irq		= 16,
+	__compat_sp_irq		= 17,
+	__compat_lr_svc		= 18,
+	__compat_sp_svc		= 19,
+	__compat_lr_abt		= 20,
+	__compat_sp_abt		= 21,
+	__compat_lr_und		= 22,
+	__compat_sp_und		= 23,
+	__compat_r8_fiq		= 24,
+	__compat_r9_fiq		= 25,
+	__compat_r10_fiq	= 26,
+	__compat_r11_fiq	= 27,
+	__compat_r12_fiq	= 28,
+	__compat_sp_fiq		= 29,
+	__compat_lr_fiq		= 30,
+};
+
 #define compat_usr(x)	regs[(x)]
-#define compat_fp	regs[11]
-#define compat_sp	regs[13]
-#define compat_lr	regs[14]
-#define compat_sp_hyp	regs[15]
-#define compat_lr_irq	regs[16]
-#define compat_sp_irq	regs[17]
-#define compat_lr_svc	regs[18]
-#define compat_sp_svc	regs[19]
-#define compat_lr_abt	regs[20]
-#define compat_sp_abt	regs[21]
-#define compat_lr_und	regs[22]
-#define compat_sp_und	regs[23]
-#define compat_r8_fiq	regs[24]
-#define compat_r9_fiq	regs[25]
-#define compat_r10_fiq	regs[26]
-#define compat_r11_fiq	regs[27]
-#define compat_r12_fiq	regs[28]
-#define compat_sp_fiq	regs[29]
-#define compat_lr_fiq	regs[30]
+#define compat_fp	regs[__compat_fp]
+#define compat_sp	regs[__compat_sp]
+#define compat_lr	regs[__compat_lr]
+#define compat_sp_hyp	regs[__compat_sp_hyp]
+#define compat_lr_irq	regs[__compat_lr_irq]
+#define compat_sp_irq	regs[__compat_sp_irq]
+#define compat_lr_svc	regs[__compat_lr_svc]
+#define compat_sp_svc	regs[__compat_sp_svc]
+#define compat_lr_abt	regs[__compat_lr_abt]
+#define compat_sp_abt	regs[__compat_sp_abt]
+#define compat_lr_und	regs[__compat_lr_und]
+#define compat_sp_und	regs[__compat_sp_und]
+#define compat_r8_fiq	regs[__compat_r8_fiq]
+#define compat_r9_fiq	regs[__compat_r9_fiq]
+#define compat_r10_fiq	regs[__compat_r10_fiq]
+#define compat_r11_fiq	regs[__compat_r11_fiq]
+#define compat_r12_fiq	regs[__compat_r12_fiq]
+#define compat_sp_fiq	regs[__compat_sp_fiq]
+#define compat_lr_fiq	regs[__compat_lr_fiq]
 
 static inline unsigned long compat_psr_to_pstate(const unsigned long psr)
 {
-- 
2.53.0


