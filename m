Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63DAC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 08:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TtspHoag1vd4TwPxf0NNX79i602MH9pWUgCD4apfYhM=; b=vpi3n0H4uB6S+6y5VJFUg0Qh6L
	awB0a0JB8ZpW4/K4S/b0IPOXzLgZziY695Izzf1KPs31hKp/GW9yL//bsj6kZUTZ2OTUE3HUX1dc5
	uMqjPUS1GyYPG2YjoaZVDl1gVLU6oBkCLXt2XPHXxKEy0Xz5TqWlxoDCpd+vI/A2GZrIVP9zXyKMG
	3+QGxWkcLOv7qgY3xXVSpsx12ZjzBzkWe/wtgDGK9cgqvXvsP61RgB50V9I6LEA79dP4hkH63if6T
	OVtUtOrJZsnE1YpwOW14ME3OSsQU4yDhRwDriRnu4sYYRgv02iWqoebuEJk/MDKo1gt/JA6C2JgGx
	u+kto4Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULCL-00000007ueo-3dih;
	Wed, 25 Jun 2025 08:09:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKbx-00000007p0Z-1jpT;
	Wed, 25 Jun 2025 07:32:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=TtspHoag1vd4TwPxf0NNX79i602MH9pWUgCD4apfYhM=; b=gRGla2sovKJS1qE4jbwl7tJddH
	XL8MTaNK4PkLQOjfTnpSPGW0eimhuDNMxaxkmE7euGk5I1wPHuE6/Vpi7BsSHPA0cQv4FXOW0imlK
	lzl4Sqb2ANtGVHRLMjHTFpPxcC1oLFOjMddGdnt7vaxr/cDQJlYPbQH3JtYZzWT0x4nd6aRe0JXws
	j6jAtDdGVFvWxrOdq6aLKMzQyBpZ8cxjAZUXHUG8IXsq2GYBgmbhNnUn0wAMhCelYmgZV/0aS/3Z/
	KVTirn48TxI4BQVzj4UTdk53CMsYBF2vevRRZPctzb7YdhJgCf70Dl3mWQIRsLY6L5LEm0tc0ZS89
	Oa3Zpo6Q==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKbu-00000005e1q-1aFR;
	Wed, 25 Jun 2025 07:32:00 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OJLOCb010657;
	Wed, 25 Jun 2025 07:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=TtspHoag1vd4TwPxf
	0NNX79i602MH9pWUgCD4apfYhM=; b=phg7ujEjQ+ZZnA+9288cJDpVtmTO+RDK0
	2ncLH9tHzbEwGJ5dK1HKom7YKx+ZhxPpOdiUYhu1n5K5E2SNqLr+hdDw46/Q9sN7
	lkCTfNy0qCSqrnkbT6jbdha/6PJ/H9lrq2XlX8Ne2jbQP566SmFKFr27eTQE0Tda
	xFInk6x5gUdvAxVWyALLB9XktcKTRcWXlC2b0/HqXaNzSMFCdzE+o4mI0yelBBa2
	XoxTgKjfSwkzh7eLsvL+rmSg4rTBLCnt9qOTVNTe3I0dfJSJIB9LZi+s54HtiXQw
	VuqEfRA7Y/kg9j0SwoKKH1taUp4+LmwnCTmjhgjqpV97HFIdPAJHQ==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dm8jdtah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 07:31:50 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55P75jDp002908;
	Wed, 25 Jun 2025 07:31:48 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e8jm81ju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 07:31:48 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55P7VlTl4456970
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 07:31:47 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 171D158896;
	Wed, 25 Jun 2025 06:38:35 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1481F5888C;
	Wed, 25 Jun 2025 06:38:30 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.36.18.35])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jun 2025 06:38:29 +0000 (GMT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, pasha.tatashin@soleen.com,
        akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-mm@kvack.org, sweettea-kernel@dorminy.me,
        christophe.leroy@csgroup.eu, mingo@kernel.org
Subject: [PATCH v15 04/13] mm/page_table_check: Reinstate address parameter in [__]page_table_check_pmd[s]_set()
Date: Wed, 25 Jun 2025 16:37:44 +1000
Message-ID: <20250625063753.77511-5-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625063753.77511-1-ajd@linux.ibm.com>
References: <20250625063753.77511-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA1MyBTYWx0ZWRfX0PovtxVj8ThL NNSlhaXr7qMCr+LrjJtY1je6X2A5G+LsrK1JOVNi+P0XFj4G+oyzq0L3+Vzt+FF8RD3H4hsOtZr ZVXGNFBUP5XJgOTKMw7Xa7mwL14sHQq9rCjqqPjrMPATIk451M5Wg0l7+C/02dmgQbCtPSMtlJF
 Rad49rC3meeeTEp6/GxgDk6bugh12XnOyMqVvPKDK5D1rHxxtWEx7YZR9pHGh5EAvUMhEkELz4V jIxwWgwgBkajBel+Y2r3Oblgh58ABqN3zKOWhU5vDjQjI1qFZpD3O1kWF/UaHB4Y6RTHgcEOJc/ ItsN4zast1iyysvo27LpTH3S+OHIEaLRPLPaMKouq5t+AqFExBdnhaJx6wqZ+yqYTY1G+Ekf0JF
 MAoAVtDcGB1cIX19mxpK241IXX6zBOTGqVIK4AFKq9cocR3lb18vacjVQTRJLNLS2JdDo5C2
X-Proofpoint-GUID: D26wswk2sk0VpSS0OJ2RVoKeyfuwRq5A
X-Proofpoint-ORIG-GUID: D26wswk2sk0VpSS0OJ2RVoKeyfuwRq5A
X-Authority-Analysis: v=2.4 cv=combk04i c=1 sm=1 tr=0 ts=685ba5e6 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=7ipKWUHlAAAA:8 a=VwQbUJbxAAAA:8 a=-IAaNFHw-wEKn7DCNmAA:9 a=gpc5p9EgBqZVLdJeV_V1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=788 clxscore=1015
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_083159_018557_1079509E 
X-CRM114-Status: GOOD (  16.49  )
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

Apply this to __page_table_check_pmds_set(), page_table_check_pmd_set(), and
the page_table_check_pmd_set() wrapper macro.

[ajd@linux.ibm.com: rebase on arm64 + riscv changes, update commit message]
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Acked-by: Ingo Molnar <mingo@kernel.org>  # x86
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
v13: remove inaccurate comment on riscv in the commit message
v14: rebase
v15: rebase, amend commit message
---
 arch/arm64/include/asm/pgtable.h |  5 +++--
 arch/riscv/include/asm/pgtable.h |  4 ++--
 arch/x86/include/asm/pgtable.h   |  4 ++--
 include/linux/page_table_check.h | 12 ++++++------
 mm/page_table_check.c            |  4 ++--
 5 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index be463058207c..0d34157106ee 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -723,7 +723,8 @@ static inline void __set_ptes_anysz(struct mm_struct *mm, unsigned long addr,
 		page_table_check_ptes_set(mm, ptep, pte, nr);
 		break;
 	case PMD_SIZE:
-		page_table_check_pmds_set(mm, (pmd_t *)ptep, pte_pmd(pte), nr);
+		page_table_check_pmds_set(mm, addr, (pmd_t *)ptep,
+					  pte_pmd(pte), nr);
 		break;
 #ifndef __PAGETABLE_PMD_FOLDED
 	case PUD_SIZE:
@@ -1538,7 +1539,7 @@ static inline void pmdp_set_wrprotect(struct mm_struct *mm,
 static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmdp, pmd_t pmd)
 {
-	page_table_check_pmd_set(vma->vm_mm, pmdp, pmd);
+	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
 	return __pmd(xchg_relaxed(&pmd_val(*pmdp), pmd_val(pmd)));
 }
 #endif
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 8142b7c48295..62778ccdcf52 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -822,7 +822,7 @@ static inline pud_t pud_mkspecial(pud_t pud)
 static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 				pmd_t *pmdp, pmd_t pmd)
 {
-	page_table_check_pmd_set(mm, pmdp, pmd);
+	page_table_check_pmd_set(mm, addr, pmdp, pmd);
 	return __set_pte_at(mm, (pte_t *)pmdp, pmd_pte(pmd));
 }
 
@@ -893,7 +893,7 @@ static inline void pmdp_set_wrprotect(struct mm_struct *mm,
 static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 				unsigned long address, pmd_t *pmdp, pmd_t pmd)
 {
-	page_table_check_pmd_set(vma->vm_mm, pmdp, pmd);
+	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
 	return __pmd(atomic_long_xchg((atomic_long_t *)pmdp, pmd_val(pmd)));
 }
 
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index ab10efb392d1..995ca7e6e0e9 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1260,7 +1260,7 @@ static inline pud_t native_local_pudp_get_and_clear(pud_t *pudp)
 static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 			      pmd_t *pmdp, pmd_t pmd)
 {
-	page_table_check_pmd_set(mm, pmdp, pmd);
+	page_table_check_pmd_set(mm, addr, pmdp, pmd);
 	set_pmd(pmdp, pmd);
 }
 
@@ -1403,7 +1403,7 @@ static inline void pmdp_set_wrprotect(struct mm_struct *mm,
 static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmdp, pmd_t pmd)
 {
-	page_table_check_pmd_set(vma->vm_mm, pmdp, pmd);
+	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
 	if (IS_ENABLED(CONFIG_SMP)) {
 		return xchg(pmdp, pmd);
 	} else {
diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
index 0bf18b884a12..cf7c28d8d468 100644
--- a/include/linux/page_table_check.h
+++ b/include/linux/page_table_check.h
@@ -19,8 +19,8 @@ void __page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd);
 void __page_table_check_pud_clear(struct mm_struct *mm, pud_t pud);
 void __page_table_check_ptes_set(struct mm_struct *mm, pte_t *ptep, pte_t pte,
 		unsigned int nr);
-void __page_table_check_pmds_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd,
-		unsigned int nr);
+void __page_table_check_pmds_set(struct mm_struct *mm, unsigned long addr,
+		pmd_t *pmdp, pmd_t pmd, unsigned int nr);
 void __page_table_check_puds_set(struct mm_struct *mm, unsigned long addr,
 		pud_t *pudp, pud_t pud, unsigned int nr);
 void __page_table_check_pte_clear_range(struct mm_struct *mm,
@@ -77,12 +77,12 @@ static inline void page_table_check_ptes_set(struct mm_struct *mm,
 }
 
 static inline void page_table_check_pmds_set(struct mm_struct *mm,
-		pmd_t *pmdp, pmd_t pmd, unsigned int nr)
+		unsigned long addr, pmd_t *pmdp, pmd_t pmd, unsigned int nr)
 {
 	if (static_branch_likely(&page_table_check_disabled))
 		return;
 
-	__page_table_check_pmds_set(mm, pmdp, pmd, nr);
+	__page_table_check_pmds_set(mm, addr, pmdp, pmd, nr);
 }
 
 static inline void page_table_check_puds_set(struct mm_struct *mm,
@@ -132,7 +132,7 @@ static inline void page_table_check_ptes_set(struct mm_struct *mm,
 }
 
 static inline void page_table_check_pmds_set(struct mm_struct *mm,
-		pmd_t *pmdp, pmd_t pmd, unsigned int nr)
+		unsigned long addr, pmd_t *pmdp, pmd_t pmd, unsigned int nr)
 {
 }
 
@@ -149,7 +149,7 @@ static inline void page_table_check_pte_clear_range(struct mm_struct *mm,
 
 #endif /* CONFIG_PAGE_TABLE_CHECK */
 
-#define page_table_check_pmd_set(mm, pmdp, pmd)	page_table_check_pmds_set(mm, pmdp, pmd, 1)
+#define page_table_check_pmd_set(mm, addr, pmdp, pmd)	page_table_check_pmds_set(mm, addr, pmdp, pmd, 1)
 #define page_table_check_pud_set(mm, addr, pudp, pud)	page_table_check_puds_set(mm, addr, pudp, pud, 1)
 
 #endif /* __LINUX_PAGE_TABLE_CHECK_H */
diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index 3c39e4375886..09258f2ad93f 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -218,8 +218,8 @@ static inline void page_table_check_pmd_flags(pmd_t pmd)
 		WARN_ON_ONCE(swap_cached_writable(pmd_to_swp_entry(pmd)));
 }
 
-void __page_table_check_pmds_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd,
-		unsigned int nr)
+void __page_table_check_pmds_set(struct mm_struct *mm, unsigned long addr,
+		pmd_t *pmdp, pmd_t pmd, unsigned int nr)
 {
 	unsigned long stride = PMD_SIZE >> PAGE_SHIFT;
 	unsigned int i;
-- 
2.49.0


