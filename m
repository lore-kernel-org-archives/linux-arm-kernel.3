Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01314C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 07:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vCBsUp1g45K/G1aBxr+KjlYGybPsrUjQF9COL1Qm5M=; b=B4fZg+oQDtnVfoYfv7nT4SRTd3
	xj5qvy0h4JfGpbvJtJ5pPbERseSHkcz+rLD9qSYqqfNJzrF5AoVp8Cl6xSbYhtonOFISSCsBC0NHM
	x+mvB/KSGTgIQqQPJn/1vzGDO2q9tQpOEjaoOA2PNT71IDnxuyG/72GNV0s4bSnwAzNXZuH99oyLQ
	/OY/VSTHksmmmd2ucD1OAPwapIFb2mhyN3WixNpRnDMqBUhc355j5UMY1JDfgX3IiEDhhzSoz84vU
	58nlyqQCeq+MBJM/XPnU1oPtu54cP3E35rFSDeHnXu2lLXrrSb3jY7yulP5K/TdFLoZvxTpOCnxqs
	QVt2r3Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38o8-0000000CrPV-0Jvi;
	Fri, 11 Apr 2025 07:28:12 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37BX-0000000CaM3-40hh;
	Fri, 11 Apr 2025 05:44:19 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AKaCcl016316;
	Fri, 11 Apr 2025 05:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=+vCBsUp1g45K/G1aB
	xr+KjlYGybPsrUjQF9COL1Qm5M=; b=FSe0ra7p4lwy1wmug9UMochD8ex2XYqCs
	t9uWTge40+JYN0FV93CtQk8T/k6cXnZYhFbUlInVzqDQVSxM/8OpImngvWVjZtvm
	db0Iko5zeQrfbmwN85yKCJmO083u8jWMgfSQa93Rru3Zs+GkoJuItUVsQHmsbRbF
	nV9hdc36GYnovs72snB4nMHXr5gohx1zGzdQtV+ywXI4zbKi3sinNo/Mk3o99r02
	p6P6A1rtQEQeAJoOxVejacUtGJIGv3Fb3u6xMmkS/lNtIfge/6nYpTySKuSTgBgq
	WY9cd5OwYjvr+F8iKCEbpjemW21IYJ54GpK/MmZA8kEXO6uJFyqIg==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45xn5qhqc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 05:44:04 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53B1Ss7u017457;
	Fri, 11 Apr 2025 05:44:03 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45uh2m1cvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 05:44:03 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53B5i1F041156932
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 05:44:01 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 96B5D2004B;
	Fri, 11 Apr 2025 05:44:01 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BCAFB20040;
	Fri, 11 Apr 2025 05:44:00 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 11 Apr 2025 05:44:00 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.63.198.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 3D645603C2;
	Fri, 11 Apr 2025 15:43:57 +1000 (AEST)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me,
        christophe.leroy@csgroup.eu
Subject: [PATCH v14 02/11] mm/page_table_check: Reinstate address parameter in [__]page_table_check_pmd_set()
Date: Fri, 11 Apr 2025 15:43:45 +1000
Message-ID: <20250411054354.511145-3-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411054354.511145-1-ajd@linux.ibm.com>
References: <20250411054354.511145-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: o0Q-5ZCisK4m76KtLVN_t4Z56ZHA6GOI
X-Proofpoint-GUID: o0Q-5ZCisK4m76KtLVN_t4Z56ZHA6GOI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 mlxscore=0 mlxlogscore=870
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_224416_156267_FB18A3C4 
X-CRM114-Status: GOOD (  17.01  )
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

From: Rohan McLure <rmclure@linux.ibm.com>

This reverts commit a3b837130b58 ("mm/page_table_check: remove unused
parameter in [__]page_table_check_pmd_set").

Reinstate previously unused parameters for the purpose of supporting
powerpc platforms, as many do not encode user/kernel ownership of the
page in the pte, but instead in the address of the access.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
[ajd: rebase on riscv and mm/page_table_check.c changes, remove riscv
commit message comment]
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
v13: remove inaccurate comment on riscv in the commit message
---
 arch/arm64/include/asm/pgtable.h |  4 ++--
 arch/riscv/include/asm/pgtable.h |  4 ++--
 arch/x86/include/asm/pgtable.h   |  4 ++--
 include/linux/page_table_check.h | 11 +++++++----
 mm/page_table_check.c            |  3 ++-
 5 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 805aec562d07..54801131ba21 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -661,7 +661,7 @@ static inline void __set_pte_at(struct mm_struct *mm,
 static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 			      pmd_t *pmdp, pmd_t pmd)
 {
-	page_table_check_pmd_set(mm, pmdp, pmd);
+	page_table_check_pmd_set(mm, addr, pmdp, pmd);
 	return __set_pte_at(mm, addr, (pte_t *)pmdp, pmd_pte(pmd),
 						PMD_SIZE >> PAGE_SHIFT);
 }
@@ -1440,7 +1440,7 @@ static inline void pmdp_set_wrprotect(struct mm_struct *mm,
 static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmdp, pmd_t pmd)
 {
-	page_table_check_pmd_set(vma->vm_mm, pmdp, pmd);
+	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
 	return __pmd(xchg_relaxed(&pmd_val(*pmdp), pmd_val(pmd)));
 }
 #endif
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 56e6ad5179c9..32d172e8cdde 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -824,7 +824,7 @@ static inline pud_t pud_mkspecial(pud_t pud)
 static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 				pmd_t *pmdp, pmd_t pmd)
 {
-	page_table_check_pmd_set(mm, pmdp, pmd);
+	page_table_check_pmd_set(mm, addr, pmdp, pmd);
 	return __set_pte_at(mm, (pte_t *)pmdp, pmd_pte(pmd));
 }
 
@@ -895,7 +895,7 @@ static inline void pmdp_set_wrprotect(struct mm_struct *mm,
 static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 				unsigned long address, pmd_t *pmdp, pmd_t pmd)
 {
-	page_table_check_pmd_set(vma->vm_mm, pmdp, pmd);
+	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
 	return __pmd(atomic_long_xchg((atomic_long_t *)pmdp, pmd_val(pmd)));
 }
 
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index d1ed35779948..466836ead08d 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1280,7 +1280,7 @@ static inline pud_t native_local_pudp_get_and_clear(pud_t *pudp)
 static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 			      pmd_t *pmdp, pmd_t pmd)
 {
-	page_table_check_pmd_set(mm, pmdp, pmd);
+	page_table_check_pmd_set(mm, addr, pmdp, pmd);
 	set_pmd(pmdp, pmd);
 }
 
@@ -1425,7 +1425,7 @@ static inline void pmdp_set_wrprotect(struct mm_struct *mm,
 static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmdp, pmd_t pmd)
 {
-	page_table_check_pmd_set(vma->vm_mm, pmdp, pmd);
+	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
 	if (IS_ENABLED(CONFIG_SMP)) {
 		return xchg(pmdp, pmd);
 	} else {
diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
index d188428512f5..5855d690c48a 100644
--- a/include/linux/page_table_check.h
+++ b/include/linux/page_table_check.h
@@ -19,7 +19,8 @@ void __page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd);
 void __page_table_check_pud_clear(struct mm_struct *mm, pud_t pud);
 void __page_table_check_ptes_set(struct mm_struct *mm, pte_t *ptep, pte_t pte,
 		unsigned int nr);
-void __page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd);
+void __page_table_check_pmd_set(struct mm_struct *mm, unsigned long addr,
+				pmd_t *pmdp, pmd_t pmd);
 void __page_table_check_pud_set(struct mm_struct *mm, unsigned long addr,
 				pud_t *pudp, pud_t pud);
 void __page_table_check_pte_clear_range(struct mm_struct *mm,
@@ -75,13 +76,14 @@ static inline void page_table_check_ptes_set(struct mm_struct *mm,
 	__page_table_check_ptes_set(mm, ptep, pte, nr);
 }
 
-static inline void page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp,
+static inline void page_table_check_pmd_set(struct mm_struct *mm,
+					    unsigned long addr, pmd_t *pmdp,
 					    pmd_t pmd)
 {
 	if (static_branch_likely(&page_table_check_disabled))
 		return;
 
-	__page_table_check_pmd_set(mm, pmdp, pmd);
+	__page_table_check_pmd_set(mm, addr, pmdp, pmd);
 }
 
 static inline void page_table_check_pud_set(struct mm_struct *mm,
@@ -131,7 +133,8 @@ static inline void page_table_check_ptes_set(struct mm_struct *mm,
 {
 }
 
-static inline void page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp,
+static inline void page_table_check_pmd_set(struct mm_struct *mm,
+					    unsigned long addr, pmd_t *pmdp,
 					    pmd_t pmd)
 {
 }
diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index 893555860d91..5c2349ab718e 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -218,7 +218,8 @@ static inline void page_table_check_pmd_flags(pmd_t pmd)
 		WARN_ON_ONCE(swap_cached_writable(pmd_to_swp_entry(pmd)));
 }
 
-void __page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd)
+void __page_table_check_pmd_set(struct mm_struct *mm, unsigned long addr,
+				pmd_t *pmdp, pmd_t pmd)
 {
 	if (&init_mm == mm)
 		return;
-- 
2.49.0


