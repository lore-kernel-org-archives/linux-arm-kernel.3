Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A22C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 06:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4yJq0aYnv4rdnPPZ+QCyk8Ri1R4Uf81hFUvSC5siyY=; b=XBbK6sCDOYr9RJMOmugV5X8bme
	A//fnQG5fAZS8MVNdRAg7i564H02ZRM4y/NqRxoXi09vMrZAKgbSSQ0oWwL22HHDmarWrXWXJWrA2
	JuJ0JOIc62oyahMCi90vV4TkLW8ZRTHw5eybqOCPsLG4ZqCubCpL0jYmxpnndOPnk48JLpZWuvDIP
	ZWev+z//YtEPSo2lRW3ZAVKHRiQeBHBH3axuxN19oUlZGpsZNPhsgaApmfKXOdQjoZgKhcdMNwa3r
	hHgohO06rWbMOPYELGnZNP8CtJXxqIwpS8m8KA/bfnE5GTnZmgBgMFLeMRKnT0Bkv3BMN0QgJUBYM
	TYc/C8dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37sC-0000000CiuQ-38Oc;
	Fri, 11 Apr 2025 06:28:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37Bh-0000000CaT8-0j0j;
	Fri, 11 Apr 2025 05:44:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=p4yJq0aYnv4rdnPPZ+QCyk8Ri1R4Uf81hFUvSC5siyY=; b=WH3iaTWnLd7Smm1mlxQsTdrQIG
	djF5fcvJPFcim0/FBMF237H1myWXR4+xtlvDO8BPi3PlBdNDKD2IqrnfFd50fi0E5XcmfYnlWyQGF
	2bjSdy5bTrT5VXJ0F1EfKeafvVtPI5rQczuhV7sfNCxwL4hUHutXWh/nMpgz0vYroAP7nu7DNP7YN
	3h9hKrpi78GS/RQFuNElLpfJIatCh7p8pf3wLQIZ+yOhsm925F9CvaHK5LQX3n4GM/hjkc3iNNN+J
	61zNTOHGpetpiNsfSYqjB3itDGAyVdDj4ETVyta06muT/XPeH6H8+Opfqt8PRApB3clO88k5xHCk6
	pxEpAAYA==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u37Bc-00000008vPH-0cFd;
	Fri, 11 Apr 2025 05:44:22 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AKcsBq013067;
	Fri, 11 Apr 2025 05:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=p4yJq0aYnv4rdnPPZ
	+QCyk8Ri1R4Uf81hFUvSC5siyY=; b=Xzo9kQpD48tNVAfWndsWH7GTFkZy4Mf2t
	PV0w3f9WJ1lq1HiiVhO58W4Yf/J/SRKS+/g4bSXiKiehkKBFLvYfHJ8pK7SiXITh
	f93SAMMipCPUifpjMa0DtWP4/Gg1UNPxH/DHR8oD3AA8qPnBvMDd/hoaZ+PKi679
	UMgSShdIGAcI3wy45hlZjycuv7Y6DjrGkvS1AuJXfvM6VxIPCfaReifydDBKyCZC
	oSyTWOaF7e6YiJ55+mmNliJjTjstNU2pmp55JRiB7pagsgMqvbWQaEMMcaIstESh
	1rK1BBZGOmXi4+npAUjzIiBq0S3dmp4gFWDNfZj7G4WrEpMpzsDpg==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45xn719q9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 05:44:06 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53B4a7ec011518;
	Fri, 11 Apr 2025 05:44:06 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45uf801q10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 05:44:06 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53B5i4Wt32244444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 05:44:04 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F00C620040;
	Fri, 11 Apr 2025 05:44:03 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 25E5420043;
	Fri, 11 Apr 2025 05:44:03 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 11 Apr 2025 05:44:03 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.63.198.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6DD0660429;
	Fri, 11 Apr 2025 15:43:57 +1000 (AEST)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me,
        christophe.leroy@csgroup.eu
Subject: [PATCH v14 07/11] mm: Provide address parameter to p{te,md,ud}_user_accessible_page()
Date: Fri, 11 Apr 2025 15:43:50 +1000
Message-ID: <20250411054354.511145-8-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411054354.511145-1-ajd@linux.ibm.com>
References: <20250411054354.511145-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PPAIzmoPFIwh1tDYI_fevQiOmW5Aj34k
X-Proofpoint-GUID: PPAIzmoPFIwh1tDYI_fevQiOmW5Aj34k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=888 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504110038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_064421_004734_0209750E 
X-CRM114-Status: GOOD (  16.99  )
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

On several powerpc platforms, a page table entry may not imply whether
the relevant mapping is for userspace or kernelspace. Instead, such
platforms infer this by the address which is being accessed.

Add an additional address argument to each of these routines in order to
provide support for page table check on powerpc.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
[ajd: rebase on arm64 changes]
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 arch/arm64/include/asm/pgtable.h |  6 +++---
 arch/riscv/include/asm/pgtable.h |  6 +++---
 arch/x86/include/asm/pgtable.h   |  6 +++---
 mm/page_table_check.c            | 12 ++++++------
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index c1b079470f38..1a2b5c49293d 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1233,17 +1233,17 @@ static inline int pgd_devmap(pgd_t pgd)
 #endif
 
 #ifdef CONFIG_PAGE_TABLE_CHECK
-static inline bool pte_user_accessible_page(pte_t pte)
+static inline bool pte_user_accessible_page(pte_t pte, unsigned long addr)
 {
 	return pte_valid(pte) && (pte_user(pte) || pte_user_exec(pte));
 }
 
-static inline bool pmd_user_accessible_page(pmd_t pmd)
+static inline bool pmd_user_accessible_page(pmd_t pmd, unsigned long addr)
 {
 	return pmd_valid(pmd) && !pmd_table(pmd) && (pmd_user(pmd) || pmd_user_exec(pmd));
 }
 
-static inline bool pud_user_accessible_page(pud_t pud)
+static inline bool pud_user_accessible_page(pud_t pud, unsigned long addr)
 {
 	return pud_valid(pud) && !pud_table(pud) && (pud_user(pud) || pud_user_exec(pud));
 }
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index c938ca241a56..260b77da33b8 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -836,17 +836,17 @@ static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
 }
 
 #ifdef CONFIG_PAGE_TABLE_CHECK
-static inline bool pte_user_accessible_page(pte_t pte)
+static inline bool pte_user_accessible_page(pte_t pte, unsigned long addr)
 {
 	return pte_present(pte) && pte_user(pte);
 }
 
-static inline bool pmd_user_accessible_page(pmd_t pmd)
+static inline bool pmd_user_accessible_page(pmd_t pmd, unsigned long addr)
 {
 	return pmd_leaf(pmd) && pmd_user(pmd);
 }
 
-static inline bool pud_user_accessible_page(pud_t pud)
+static inline bool pud_user_accessible_page(pud_t pud, unsigned long addr)
 {
 	return pud_leaf(pud) && pud_user(pud);
 }
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 6f6c314ae95b..ea6294b605a3 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1751,17 +1751,17 @@ static inline bool arch_has_hw_nonleaf_pmd_young(void)
 #endif
 
 #ifdef CONFIG_PAGE_TABLE_CHECK
-static inline bool pte_user_accessible_page(pte_t pte)
+static inline bool pte_user_accessible_page(pte_t pte, unsigned long addr)
 {
 	return (pte_val(pte) & _PAGE_PRESENT) && (pte_val(pte) & _PAGE_USER);
 }
 
-static inline bool pmd_user_accessible_page(pmd_t pmd)
+static inline bool pmd_user_accessible_page(pmd_t pmd, unsigned long addr)
 {
 	return pmd_leaf(pmd) && (pmd_val(pmd) & _PAGE_PRESENT) && (pmd_val(pmd) & _PAGE_USER);
 }
 
-static inline bool pud_user_accessible_page(pud_t pud)
+static inline bool pud_user_accessible_page(pud_t pud, unsigned long addr)
 {
 	return pud_leaf(pud) && (pud_val(pud) & _PAGE_PRESENT) && (pud_val(pud) & _PAGE_USER);
 }
diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index 9a4e2b522243..799e0673551d 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -151,7 +151,7 @@ void __page_table_check_pte_clear(struct mm_struct *mm, unsigned long addr,
 	if (&init_mm == mm)
 		return;
 
-	if (pte_user_accessible_page(pte)) {
+	if (pte_user_accessible_page(pte, addr)) {
 		page_table_check_clear(pte_pfn(pte), PAGE_SIZE >> PAGE_SHIFT);
 	}
 }
@@ -163,7 +163,7 @@ void __page_table_check_pmd_clear(struct mm_struct *mm, unsigned long addr,
 	if (&init_mm == mm)
 		return;
 
-	if (pmd_user_accessible_page(pmd)) {
+	if (pmd_user_accessible_page(pmd, addr)) {
 		page_table_check_clear(pmd_pfn(pmd), PMD_SIZE >> PAGE_SHIFT);
 	}
 }
@@ -175,7 +175,7 @@ void __page_table_check_pud_clear(struct mm_struct *mm, unsigned long addr,
 	if (&init_mm == mm)
 		return;
 
-	if (pud_user_accessible_page(pud)) {
+	if (pud_user_accessible_page(pud, addr)) {
 		page_table_check_clear(pud_pfn(pud), PUD_SIZE >> PAGE_SHIFT);
 	}
 }
@@ -208,7 +208,7 @@ void __page_table_check_ptes_set(struct mm_struct *mm, unsigned long addr,
 
 	for (i = 0; i < nr; i++)
 		__page_table_check_pte_clear(mm, addr, ptep_get(ptep + i));
-	if (pte_user_accessible_page(pte))
+	if (pte_user_accessible_page(pte, addr))
 		page_table_check_set(pte_pfn(pte), nr, pte_write(pte));
 }
 EXPORT_SYMBOL(__page_table_check_ptes_set);
@@ -230,7 +230,7 @@ void __page_table_check_pmd_set(struct mm_struct *mm, unsigned long addr,
 	page_table_check_pmd_flags(pmd);
 
 	__page_table_check_pmd_clear(mm, addr, *pmdp);
-	if (pmd_user_accessible_page(pmd)) {
+	if (pmd_user_accessible_page(pmd, addr)) {
 		page_table_check_set(pmd_pfn(pmd), PMD_SIZE >> PAGE_SHIFT,
 				     pmd_write(pmd));
 	}
@@ -244,7 +244,7 @@ void __page_table_check_pud_set(struct mm_struct *mm, unsigned long addr,
 		return;
 
 	__page_table_check_pud_clear(mm, addr, *pudp);
-	if (pud_user_accessible_page(pud)) {
+	if (pud_user_accessible_page(pud, addr)) {
 		page_table_check_set(pud_pfn(pud), PUD_SIZE >> PAGE_SHIFT,
 				     pud_write(pud));
 	}
-- 
2.49.0


