Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EA5FCB61E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 16:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nWjwnS5nyC5gSG8UutEgk3IzL8z2OXssI39FR/MoAKU=; b=IRlVJHd/Fe0Ivwpejf0klX5FkB
	n14z+Eg+mWNgYgwuVA5CIkDsDUUeET7F633X7I0jkSTcYezQUayxYgE4GdQYDTbxlCgenkuPs6BG/
	dJW5xwqUDP1yzFMrlvRvxejw3vTyeUyXC1M1LpI9UNTyx87lTvuEvrxMAxzcm/S0K5fQ6hBSLZL1V
	NFr0e5JeRXG7vFO+t/hOnxpaAOuQQaaqy5hRrDZACGHreBdA5/TfTo/PhivG3g1u07VeT/5HYUcfY
	F+hNlSo11ko+CTfsYzM4lShKF+vIxLIDM3sLZh8dQfoGIb/YZlHUHLoRzYaFvYgcRmj6uU3RgYMJF
	WABReFEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXrS-0000000497P-3ftb;
	Fri, 06 Mar 2026 16:17:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXrO-0000000492G-2cxq;
	Fri, 06 Mar 2026 16:17:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nWjwnS5nyC5gSG8UutEgk3IzL8z2OXssI39FR/MoAKU=; b=CI5pbJHByJlgtgUMaAqp8vzmKH
	lfdUvGq06wkTXlisnCh3WpXgp5fMlqBCYgnoNLca3Ghtve0WoLWfE43JY62YTiQBa+vaXmWIAJzJK
	dL1P3dPiSxo9RhcTNT5WZegQ8ajZ5ZiRrF3Ti2ZMXkxvr8F1SPVc9P50Yug5L2z9yki+YsEGwSg/+
	P7myu+jO5VvrRgv8j6/zAmrUghNYKlUSwSekdqYiy/zQocyJNS7puvkEOdZBHf3uvBur3SpP7pRt/
	nz0XUeY6fAYtWO3JMLfyTQxVpRT95EQ2Scksp+tmoXZShF1qBmDVHtBOVmqpop1LcWaZrLKe/CWVM
	XUAlbP3Q==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXrL-00000009CS0-0QxO;
	Fri, 06 Mar 2026 16:17:05 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626A04G92073025;
	Fri, 6 Mar 2026 16:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=nWjwnS5nyC5gSG8Uu
	tEgk3IzL8z2OXssI39FR/MoAKU=; b=Ilx5jLDC1l9AqYmdmB5yFeL8EnRQXgsIn
	5lzxzkg3o3X2YVn7WIzypkTzlSjq/wH0DCcRQe74Fx7jI7AiYqpHepy4PHkvDunB
	Zm//emKobTl4zKkI7BOz7CUtYA/7uzMkeZrqwWNlxnATkgy8xngyLzG0rEQMQ2h8
	MfIj7ZBqvC2zsCPZge7RFv23+UoPOTmMBnX30+61ZYXatrzw+3w2fDD8jamxJbTU
	3VTxa7qFRmVhrfv641ngYyzpw9Cw98EE+GCpf84HZ2G2FU0zpiUBdUoQPL7dc82y
	1EBaCAFszJaONQpSBuYok99o5tzymyNpxU1hpf/h9kF205fzfrYqw==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ckssn0w15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 16:16:38 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 626DvTMv010309;
	Fri, 6 Mar 2026 16:16:37 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cmc6kgfvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 16:16:37 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 626GGXZC46661980
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Mar 2026 16:16:33 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6FAC220043;
	Fri,  6 Mar 2026 16:16:33 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3563E20040;
	Fri,  6 Mar 2026 16:16:33 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with SMTP;
	Fri,  6 Mar 2026 16:16:33 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id 1C691E078D; Fri, 06 Mar 2026 17:16:33 +0100 (CET)
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Pasha Tatashin <pasha.tatashin@soleen.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>
Cc: linux-s390@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        x86@kernel.org
Subject: [PATCH v2 3/4] s390/pgtable: Add s390 support for page table check
Date: Fri,  6 Mar 2026 17:16:32 +0100
Message-ID: <4db8a681205bd555298d62441cdcfca43317a35a.1772812343.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1772812343.git.agordeev@linux.ibm.com>
References: <cover.1772812343.git.agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1MyBTYWx0ZWRfX1d2OIZjG6Vaz
 g0Rv9SduxkYPt7UUmGsEi1jwwNqDXHXKWAZGxZwxHmNqqqYLPUwab+S4aJvlG2CKSxcbh5OBhLz
 kiofMXqIeqVEVQJ+Hiy7wqIEOIq2JyeKt37Ad1Hdb4pbSqra0YyKugiohqSEp4PpkmLnTnclhK5
 Fy6oxpW0YBLgf1YaEzeyyzFveRMXSzVxPS+NgwjL/c4MTRKYz7OyIJS9HshwUrm6qGBQYMyn+tZ
 ct6sLcM76BP621M8V21IvQeGx+fcRcQSGUbugeRemvsSFJwScSatz7ZcefPxExOW16mM3bnnp2h
 THJTA/4G5MSnUj66ITsQZ+ev8RkThjEixMqeTlz41In2SOBYPRy504DYFbtkoChg61o8oyDXtDI
 ARxy13S1GBGxouq1FLwk8szju2l51Oakp3Ilma0QuSGZXfqA82O9mm/NzUw7eHUUGwkXzA7bQp1
 Bw0Uyh5MG0mmsRnp6Ww==
X-Proofpoint-ORIG-GUID: 83ygpnALoePex-sniqGXgjL2kS8s86yy
X-Proofpoint-GUID: 83ygpnALoePex-sniqGXgjL2kS8s86yy
X-Authority-Analysis: v=2.4 cv=AobjHe9P c=1 sm=1 tr=0 ts=69aafde6 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8 a=lBuVlAIgDHgG38O_heoA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_161703_420275_AAD8AEF2 
X-CRM114-Status: GOOD (  23.96  )
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

From: Tobias Huschle <huschle@linux.ibm.com>

Add page table check hooks into routines that modify user page
tables.

Unlike other architectures s390 does not have means to distinguish
between kernel and user page table entries. Rely on the fact the
page table check infrastructure itself operates on non-init_mm
memory spaces only.

Use the provided mm_struct to verify that the memory space is not
init_mm (aka not the kernel memory space) indeed. That check is
supposed to be succeeded already (on some code paths even twice).

If the passed memory space by contrast is init_mm that would be an
unexpected semantical change in generic code, so do VM_BUG_ON() in
such case.

Unset _SEGMENT_ENTRY_READ bit to indicate that pmdp_invalidate()
was applied against a huge PMD and is going to be updated by
set_pmd_at() shortly. The hook pmd_user_accessible_page() should
skip such entries until that, otherwise the page table accounting
falls apart and BUG_ON() gets hit as result.

The invalidated huge PMD entry should not be confused with a PROT_NONE
entry as reported by pmd_protnone(), though the entry characteristics
exactly match: _SEGMENT_ENTRY_LARGE is set while _SEGMENT_ENTRY_READ is
unset. Since pmd_protnone() implementation depends on NUMA_BALANCING
configuration option, it should not be used in pmd_user_accessible_page()
check, which is expected to be CONFIG_NUMA_BALANCING-agnostic.

Nevertheless, an invalidated huge PMD is technically still pmd_protnone()
entry and it should not break other code paths once _SEGMENT_ENTRY_READ
is unset. As of now, all pmd_protnone() checks are done under page table
locks or exercise GUP-fast and HMM code paths, which are expected to be
safe against concurrent page table updates.

Alternative approach would be using the last remaining unused PMD entry
bit 0x800 to indicate that pmdp_invalidate() was called on a PMD. That
would allow avoiding collisions with pmd_protnone() handling code paths,
but saving the bit is more preferable way to go.

Reviewed-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>
Co-developed-by: Alexander Gordeev <agordeev@linux.ibm.com>
Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 arch/s390/Kconfig               |  1 +
 arch/s390/include/asm/pgtable.h | 54 ++++++++++++++++++++++++++++++---
 2 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index edc927d9e85a..7bda45d30455 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -154,6 +154,7 @@ config S390
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128 && CC_IS_CLANG
 	select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
 	select ARCH_SUPPORTS_NUMA_BALANCING
+	select ARCH_SUPPORTS_PAGE_TABLE_CHECK
 	select ARCH_SUPPORTS_PER_VMA_LOCK
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF
diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgta=
ble.h
index 04ec9fee6498..67f5df20a57e 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -16,8 +16,10 @@
 #include <linux/mm_types.h>
 #include <linux/cpufeature.h>
 #include <linux/page-flags.h>
+#include <linux/page_table_check.h>
 #include <linux/radix-tree.h>
 #include <linux/atomic.h>
+#include <linux/mmap_lock.h>
 #include <asm/ctlreg.h>
 #include <asm/bug.h>
 #include <asm/page.h>
@@ -1190,6 +1192,7 @@ static inline pte_t ptep_get_and_clear(struct mm_st=
ruct *mm,
 	/* At this point the reference through the mapping is still present */
 	if (mm_is_protected(mm) && pte_present(res))
 		WARN_ON_ONCE(uv_convert_from_secure_pte(res));
+	page_table_check_pte_clear(mm, addr, res);
 	return res;
 }
=20
@@ -1208,6 +1211,7 @@ static inline pte_t ptep_clear_flush(struct vm_area=
_struct *vma,
 	/* At this point the reference through the mapping is still present */
 	if (mm_is_protected(vma->vm_mm) && pte_present(res))
 		WARN_ON_ONCE(uv_convert_from_secure_pte(res));
+	page_table_check_pte_clear(vma->vm_mm, addr, res);
 	return res;
 }
=20
@@ -1231,6 +1235,9 @@ static inline pte_t ptep_get_and_clear_full(struct =
mm_struct *mm,
 	} else {
 		res =3D ptep_xchg_lazy(mm, addr, ptep, __pte(_PAGE_INVALID));
 	}
+
+	page_table_check_pte_clear(mm, addr, res);
+
 	/* Nothing to do */
 	if (!mm_is_protected(mm) || !pte_present(res))
 		return res;
@@ -1327,6 +1334,7 @@ static inline void set_ptes(struct mm_struct *mm, u=
nsigned long addr,
 {
 	if (pte_present(entry))
 		entry =3D clear_pte_bit(entry, __pgprot(_PAGE_UNUSED));
+	page_table_check_ptes_set(mm, addr, ptep, entry, nr);
 	for (;;) {
 		set_pte(ptep, entry);
 		if (--nr =3D=3D 0)
@@ -1703,6 +1711,7 @@ static inline int pmdp_clear_flush_young(struct vm_=
area_struct *vma,
 static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 			      pmd_t *pmdp, pmd_t entry)
 {
+	page_table_check_pmd_set(mm, addr, pmdp, entry);
 	set_pmd(pmdp, entry);
 }
=20
@@ -1717,7 +1726,11 @@ static inline pmd_t pmd_mkhuge(pmd_t pmd)
 static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 					    unsigned long addr, pmd_t *pmdp)
 {
-	return pmdp_xchg_direct(mm, addr, pmdp, __pmd(_SEGMENT_ENTRY_EMPTY));
+	pmd_t pmd;
+
+	pmd =3D pmdp_xchg_direct(mm, addr, pmdp, __pmd(_SEGMENT_ENTRY_EMPTY));
+	page_table_check_pmd_clear(mm, addr, pmd);
+	return pmd;
 }
=20
 #define __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR_FULL
@@ -1725,12 +1738,17 @@ static inline pmd_t pmdp_huge_get_and_clear_full(=
struct vm_area_struct *vma,
 						 unsigned long addr,
 						 pmd_t *pmdp, int full)
 {
+	pmd_t pmd;
+
 	if (full) {
-		pmd_t pmd =3D *pmdp;
+		pmd =3D *pmdp;
 		set_pmd(pmdp, __pmd(_SEGMENT_ENTRY_EMPTY));
+		page_table_check_pmd_clear(vma->vm_mm, addr, pmd);
 		return pmd;
 	}
-	return pmdp_xchg_lazy(vma->vm_mm, addr, pmdp, __pmd(_SEGMENT_ENTRY_EMPT=
Y));
+	pmd =3D pmdp_xchg_lazy(vma->vm_mm, addr, pmdp, __pmd(_SEGMENT_ENTRY_EMP=
TY));
+	page_table_check_pmd_clear(vma->vm_mm, addr, pmd);
+	return pmd;
 }
=20
 #define __HAVE_ARCH_PMDP_HUGE_CLEAR_FLUSH
@@ -1748,7 +1766,12 @@ static inline pmd_t pmdp_invalidate(struct vm_area=
_struct *vma,
=20
 	VM_WARN_ON_ONCE(!pmd_present(pmd));
 	pmd =3D set_pmd_bit(pmd, __pgprot(_SEGMENT_ENTRY_INVALID));
-	return pmdp_xchg_direct(vma->vm_mm, addr, pmdp, pmd);
+#ifdef CONFIG_PAGE_TABLE_CHECK
+	pmd =3D clear_pmd_bit(pmd, __pgprot(_SEGMENT_ENTRY_READ));
+#endif
+	page_table_check_pmd_set(vma->vm_mm, addr, pmdp, pmd);
+	pmd =3D pmdp_xchg_direct(vma->vm_mm, addr, pmdp, pmd);
+	return pmd;
 }
=20
 #define __HAVE_ARCH_PMDP_SET_WRPROTECT
@@ -1783,6 +1806,29 @@ static inline int has_transparent_hugepage(void)
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
=20
+#ifdef CONFIG_PAGE_TABLE_CHECK
+static inline bool pte_user_accessible_page(struct mm_struct *mm, unsign=
ed long addr, pte_t pte)
+{
+	VM_BUG_ON(mm =3D=3D &init_mm);
+
+	return pte_present(pte);
+}
+
+static inline bool pmd_user_accessible_page(struct mm_struct *mm, unsign=
ed long addr, pmd_t pmd)
+{
+	VM_BUG_ON(mm =3D=3D &init_mm);
+
+	return pmd_leaf(pmd) && (pmd_val(pmd) & _SEGMENT_ENTRY_READ);
+}
+
+static inline bool pud_user_accessible_page(struct mm_struct *mm, unsign=
ed long addr, pud_t pud)
+{
+	VM_BUG_ON(mm =3D=3D &init_mm);
+
+	return pud_leaf(pud);
+}
+#endif
+
 /*
  * 64 bit swap entry format:
  * A page-table entry has some bits we have to treat in a special way.
--=20
2.51.0


