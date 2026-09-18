Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79D2C982DF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kkUuBtQh7OlhH3THIaN3BECiqBALGTcSbqHwQf9XXw=; b=36nlZlZ0zDeM5mRy8ne+fueoEa
	AiS3c00GkrrOZRDK68xjwkLWrtTMBJwmqKqHy8IZ37KXtDfSzwb/slBTarpP7s21Rop61mnZS96R9
	9LFPBxLdkavUDxqAKjte9PXmS/RzQyDnEXG9nbu+I+PP0VUv4ZZhngpio6JFdBv+Q8gq9mlK53FTs
	tURr3TYuzXLxkulJxfF7/szESKBI5zTatjAVlcvWjq6k+bl9FaQiISacg1Ng7sPpqlxsOMbFWmKu6
	5Gf7oDtfoITuxwWqgIFxPtRbjVDEeo/+y9m58VbjgrDvcMJfik9PlXarqQaOvpSqtLbUkrT2gGwMq
	fLnEstGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YiG-0000000EY6y-1Etp;
	Fri, 18 Sep 2026 13:33:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ygq-0000000EWwd-1gVc
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 13:31:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6kkUuBtQh7OlhH3THIaN3BECiqBALGTcSbqHwQf9XXw=; b=VH4+1PjpYnKdqujbsju5yqqjLd
	7YqCjagCTHf1PcO+NqTAWXubzYpm0eZVIW0m8lBAJYTz4qtj64EXGgZDnG6RSybmW3b5XPSEbOAE5
	Y5qJVSXMiv8Jh9v1XmfhOM3CCzrZSmFOipCtIfoCegPVXyAsW7ZFhp53EILxpoAxBl9YG8zHpneVb
	GjSo3q/xP/KtHss8ZOQrQL8h60YiQJ94RD1IT8pbUG+kPAOKs0E5qIAeAHcVRDwwgYBt20JCq/hSx
	PSlLsCfzA6PLvr0b+A7yHUb8JSFK6QXtgY8+V0SeurhndEhV+UA0dhmKxT47DyKzzmioPk+bSvbZY
	7NhYiYhA==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7Ygm-0000000A8aD-32NT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:31:43 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDVPwo1378486;
	Fri, 18 Sep 2026 13:31:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=6kkUuBtQh7OlhH3TH
	IaN3BECiqBALGTcSbqHwQf9XXw=; b=dDeFysFvwhN6ZeT7hO77ICIqsIxHCgLuG
	cZYIL3mceklZ+ydaG1C1l3MR44Lj79XbwwS09ftoKsPmO7VGhIyCmhaMmFnMiOiv
	UOBfX+CZCYO2jZ/8Ure/vi5xlijJq1EIXkGXw+BpG1KtbH06jiWdrwB4uAqirMK5
	KFK03/+KmNfmNA0c9Gvvq7Ge0VtZ1oGCZG/AT4oU1qF5h76U2c3pO0x74OoRBbIF
	QUURVQ8s2DfT8c1D5QaBRiu+zUFBoVJVEOzFgUC/q2lKPEg+QSS5ZbCggxVhY5dq
	pxCtnGOhn/2Z+v9+ASDDF8IFH+vPstD+o3U00M5GrQZ/2I2K22V4w==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmx848a66-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 13:31:24 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDO1fX722844;
	Fri, 18 Sep 2026 13:31:21 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gr5fjqgvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 13:31:20 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68IDVC6849152392
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Sep 2026 13:31:12 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 277DD20040;
	Fri, 18 Sep 2026 13:31:12 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCDBD20049;
	Fri, 18 Sep 2026 13:31:11 +0000 (GMT)
Received: from tuxmaker.lnxne.boe (unknown [9.87.85.9])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Sep 2026 13:31:11 +0000 (GMT)
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
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v8 11/29] arm64: ptrace: Use constants for compat register numbers
Date: Fri, 18 Sep 2026 15:30:48 +0200
Message-ID: <20260918133107.1042730-12-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918133107.1042730-1-seiden@linux.ibm.com>
References: <20260918133107.1042730-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE5MiBTYWx0ZWRfX3oHdTM0RcM9M
 lJA/QRIcr2gycnElpo/MDeE2zEa/GHQIylJu8moeaG9G0rL5XqCLPB3TcdMk75TJfOPH7wd5uA2
 12T+ArQ0VYltavLHTvLNJwriHMxpLe52i3M9sZ7oVCrkD+ahn/8vhbtKBQfD9xXxCDGMu3mMSoD
 CIG21Za8Lv9fwHNDXpBiK99JdvVFE74DCjcSnbGlHopkZOfAl8VvyEcWAiWOLZUGYrfRcx64HVm
 3Sy1NhBOAg4XrfyFqDYErSYKLBCbiJBsfXz84J7u2O8H8py6vY+XsOUP6/QJ1NSoPD/hrBzWc8n
 vSu7u9U/gIS3dzZwvgTkKK7WXj4Kmhgx1cq/JNxR7MzjABiPnbzAjcv9i+024blZV6I7cqAsBfu
 T4Eh/mFQEGhmTbfmLOULX6OFejk0Kg0yGyWC8MbwO2WKaVP3qdehPEtD+oRl3k270uMSq6/PeBC
 R1DurimcSDSxTOzw6Rg==
X-Proofpoint-ORIG-GUID: 8p8JeldyMPn5HZt2Ye27SKz3ElNncAyV
X-Proofpoint-GUID: _WjLFTjcQpS3C97htwFQBPucWAYwRzl5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE5MiBTYWx0ZWRfX1JVlF1JJiUpF
 MpkoXI2Yb2IHIE1je1OHNCRP/sORPGCJ4XY2+VOzfbf/9ozdZDXut91oYhiEI5AkpB1WMrxurKE
 Iu3MCS/OmPCs+V1FGjTP+wv3wSt3nEo=
X-Authority-Analysis: v=2.4 cv=cY9HPXDM c=1 sm=1 tr=0 ts=6aad3d2c cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=8sKaXpLx0aSSeG29UzUA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_143141_856770_077E5DAD 
X-CRM114-Status: GOOD (  13.72  )
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

Reviewed-by: Marc Zyngier <maz@kernel.org>
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


