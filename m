Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C71DCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AcKYUB8TSCMvkXvZyOu6BnDrmtLpILo5gW6XD+S5Ygw=; b=rZO7UitlOEzYbPceuGWh58b39z
	2BDCULDOd0h5/y+TeXivM4NaTdFh8UrPzxS6tO5xaye1V/ByHgHQvRNU3uXGCOSvJCAEG/lyn7EQU
	iw8o9LEn+XSeSIdlCC0sFTmO5P9BwgivnKq9B88BdlkWjTCK5YR+7tQ+ZVQSwSkRxAJcterMMbOCG
	WlisfU1yYgWWESnAuvsSEszA2XYEFh0U75mK3IM4ztRl37q7qpjKuxSGGC9XRXA9pAIDApFBRZRBW
	gyY9iy8inyrHiJUD/sWqpmilxW8xL3s6fMVq4w3DICJr7oiHqD1kEI4nYV0dFeKXPWcyFjVgA1gll
	Qoeb6jFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzUl-00000007jdb-2rPj;
	Fri, 29 May 2026 15:51:35 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzUX-00000007jU1-0qXn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:51:23 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TFAXNo2419213;
	Fri, 29 May 2026 15:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=AcKYUB8TSCMvkXvZy
	Ou6BnDrmtLpILo5gW6XD+S5Ygw=; b=NYjWw73Lnf+9sh6PHUyFEippgHmtsfL6q
	uWDUnDYH8gW/Ehm7JZOH2wGNsMzVQ6/KRCyugDALXfKcOmOoL5ln5KwTD/o6uY9U
	FjFpwLSrEbHvlCS+5zYPjJfMkiq7rpPNyu2ienoab+1mXu8J12cRB0d6bmBPoqQT
	M1+6/vXA769apBPKni6ftmPk3syXg9WS6xxwK+W9POF/ALsAllSJw8c87J2iYs5l
	FnyC+JnmrTCitRhtBDG7+ppeoKf5OLHubj+wx5gFPRZwfbVwy7hqTRyRTGAu43Fi
	JftewjpO+fUrw5SHiAGwR/BdPx0MAnBoHtLPx1uK3SREd2D231o1A==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ee884ve4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 15:51:07 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64TFd6cM018485;
	Fri, 29 May 2026 15:51:06 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4edjrc0fd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 15:51:06 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64TFowUQ27197710
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 May 2026 15:50:58 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B4BF20043;
	Fri, 29 May 2026 15:50:58 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 339112005A;
	Fri, 29 May 2026 15:50:58 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 May 2026 15:50:58 +0000 (GMT)
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
Subject: [PATCH v3 21/27] s390/hwcaps: Report SAE support as hwcap
Date: Fri, 29 May 2026 17:50:35 +0200
Message-ID: <20260529155050.2902245-22-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529155050.2902245-1-seiden@linux.ibm.com>
References: <20260529155050.2902245-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=L4MtheT8 c=1 sm=1 tr=0 ts=6a19b5eb cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=MMtvGDNtdIwsdepEW5QA:9
X-Proofpoint-ORIG-GUID: 3uwzx4Tr4Fe_xcL8X3gP91u-LAqXm7G1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE1NiBTYWx0ZWRfX9bvtkGDHkPDY
 IzyC7EQNW9x5G3+0/veWMQMhhqhviflID4RJSFNWKpjrsHcegQoQra0OwFJT7OLxtEluSAS1JGk
 4CeKw0f5O8rofNszXZzBkgQaRpHhgtUtphPcBigPVLOw7vwtNKTT+LOyqHEFrPDGXU+d+kQEnK8
 GfZamRBoEia5Mm1J3FlGbKuCuVtslQJLpB/8gsrQeCO38EZuEsEbJ1QtdmMr7sBT4xO65CAB5bL
 MtXnFIdFHpde4gFrZcOopOoKblEGDo2Y79PJMDc6cZIXjo0s+87Szeb/Ln3qdI3acSnFu7zBVGS
 RPVLUyPhMEvimWITU4lxmCjUF7JkvznntEhsWXuEyy1yixTf6/QU9kpNdhngdrmmx02S9DdGtPJ
 48eysvv+Pnwkm+6YAiKuLvnpNZqtQll+uRwlEuKH++RpuVUqgCgjV6i1g/aMirowj90GMKxxb7N
 F1ocTsHlJjE/0qKoDAA==
X-Proofpoint-GUID: 3uwzx4Tr4Fe_xcL8X3gP91u-LAqXm7G1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_085121_290993_3F107BB8 
X-CRM114-Status: GOOD (  17.35  )
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

From: Hendrik Brueckner <brueckner@linux.ibm.com>

Report SAE support as hwcap (and /proc/cpuinfo)

Signed-off-by: Hendrik Brueckner <brueckner@linux.ibm.com>
Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/s390/include/asm/elf.h    | 2 ++
 arch/s390/include/asm/sclp.h   | 5 ++++-
 arch/s390/kernel/processor.c   | 3 +++
 drivers/s390/char/sclp_early.c | 1 +
 4 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/s390/include/asm/elf.h b/arch/s390/include/asm/elf.h
index bb63fa4d20bb..ad3108ecfb07 100644
--- a/arch/s390/include/asm/elf.h
+++ b/arch/s390/include/asm/elf.h
@@ -123,6 +123,7 @@ enum {
 	HWCAP_NR_NNPA		= 20,
 	HWCAP_NR_PCI_MIO	= 21,
 	HWCAP_NR_SIE		= 22,
+	HWCAP_NR_SAE		= 23,
 	HWCAP_NR_MAX
 };
 
@@ -150,6 +151,7 @@ enum {
 #define HWCAP_NNPA		BIT(HWCAP_NR_NNPA)
 #define HWCAP_PCI_MIO		BIT(HWCAP_NR_PCI_MIO)
 #define HWCAP_SIE		BIT(HWCAP_NR_SIE)
+#define HWCAP_SAE		BIT(HWCAP_NR_SAE)
 
 /*
  * These are used to set parameters in the core dumps.
diff --git a/arch/s390/include/asm/sclp.h b/arch/s390/include/asm/sclp.h
index 0f184dbdbe5e..18e46654227a 100644
--- a/arch/s390/include/asm/sclp.h
+++ b/arch/s390/include/asm/sclp.h
@@ -52,7 +52,9 @@ struct sclp_core_entry {
 	u8 siif : 1;
 	u8 sigpif : 1;
 	u8 : 3;
-	u8 reserved2[3];
+	u8 aef: 1;
+	u8 : 7;
+	u8 reserved2[2];
 	u8 : 2;
 	u8 ib : 1;
 	u8 cei : 1;
@@ -104,6 +106,7 @@ struct sclp_info {
 	unsigned char has_aisii : 1;
 	unsigned char has_aeni : 1;
 	unsigned char has_aisi : 1;
+	unsigned char has_aef : 1;
 	unsigned int ibc;
 	unsigned int mtid;
 	unsigned int mtid_cp;
diff --git a/arch/s390/kernel/processor.c b/arch/s390/kernel/processor.c
index e33a3eccda56..6da55a158027 100644
--- a/arch/s390/kernel/processor.c
+++ b/arch/s390/kernel/processor.c
@@ -150,6 +150,7 @@ static void show_cpu_summary(struct seq_file *m, void *v)
 		[HWCAP_NR_NNPA]		= "nnpa",
 		[HWCAP_NR_PCI_MIO]	= "pcimio",
 		[HWCAP_NR_SIE]		= "sie",
+		[HWCAP_NR_SAE]		= "sae",
 	};
 	int i, cpu;
 
@@ -254,6 +255,8 @@ static int __init setup_hwcaps(void)
 	/* virtualization support */
 	if (sclp.has_sief2)
 		elf_hwcap |= HWCAP_SIE;
+	if (sclp.has_aef)
+		elf_hwcap |= HWCAP_SAE;
 
 	return 0;
 }
diff --git a/drivers/s390/char/sclp_early.c b/drivers/s390/char/sclp_early.c
index 6bf501ad8ff0..26a76f09b19a 100644
--- a/drivers/s390/char/sclp_early.c
+++ b/drivers/s390/char/sclp_early.c
@@ -94,6 +94,7 @@ static void __init sclp_early_facilities_detect(void)
 		sclp.has_ib = cpue->ib;
 		sclp.has_cei = cpue->cei;
 		sclp.has_skey = cpue->skey;
+		sclp.has_aef = cpue->aef;
 		break;
 	}
 
-- 
2.53.0


