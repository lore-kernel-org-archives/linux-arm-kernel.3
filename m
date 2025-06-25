Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11498C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 08:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UO0vX3UfReoSeYFV0TKOa23aX6X4pf1KPaMNiI/i870=; b=EjgeWs5HJiD98AdDpJMsxc4I0q
	w7YFy59jbTfT3bR+BT6W0PWIKR8aALhbUVQiL95qhSxekqy/3HReSP7kXh9KWjo9UlbTIkkUPJLNE
	hnKbqJT76v51kjDZr12utTWUMMQhWRuDwjJ2+99wOvdFWj5eWUw5L2YzJHPn4roUo/l/gQo0N3nqL
	9CdIgO6QP9dXr2HN3aRZMPfNfOdLUzRH0nkeHrKwpiNUSTuYeujj/LFwZ0mM5lLaFXNNgsEd6goZH
	AdyWXjs3JDzlbNeh2gw/FcgZzqV2ARIO2qajJOy134p503fs6oA6S/wyDwTSxlXbw2MVv69xxZc5w
	iNs8ZotQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULH6-00000007vI3-2RWB;
	Wed, 25 Jun 2025 08:14:32 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKc9-00000007p6h-37H6;
	Wed, 25 Jun 2025 07:32:15 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OM7hh6025150;
	Wed, 25 Jun 2025 07:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=UO0vX3UfReoSeYFV0TKOa23aX6X4pf1KPaMNiI/i8
	70=; b=lKLjWDV16UUWc5rFWUzz/N0m7NBSO1qtGWOlWBjd09NaKbMeG8uBp6+r8
	usuBchUZW817SPu/kkm47j2wlacT/H9XdmU2RKEksUl7XaNFK2R+ugGtQzOxfCHA
	WMjXz/XxWtfbp60yO2xI8U3bSHu0usHpok8amz9cPmJlOkZzkYjNBzviljcs35dp
	JX5gfuWviv61/TAXqmkNGllsOJvzq2Gr8ZpUiE+7KYOF1eLGIpMFOuHUzpjCCMqI
	r6ZOzReb3wbQraCIsewfm6Q/Nbd1i6Fd2pAdn6EpF6R/EuZwdnf8mleAHKVSxZ40
	PuiIQsGdtUeFM7t04X+Uxf1P6duWg==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dj5twspw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 07:32:05 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55P68BPr006397;
	Wed, 25 Jun 2025 07:32:04 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e82p87c4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 07:32:04 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55P7W3sK34210120
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 07:32:03 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 64BB658866;
	Wed, 25 Jun 2025 06:38:09 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD7455884D;
	Wed, 25 Jun 2025 06:38:04 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.36.18.35])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jun 2025 06:38:04 +0000 (GMT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, pasha.tatashin@soleen.com,
        akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-mm@kvack.org, sweettea-kernel@dorminy.me,
        christophe.leroy@csgroup.eu, mingo@kernel.org
Subject: [PATCH v15 00/13] Support page table check on PowerPC
Date: Wed, 25 Jun 2025 16:37:40 +1000
Message-ID: <20250625063753.77511-1-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Z7GqdOC5lLqMmZixiv9KuMPKXdxDcbax
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA1MyBTYWx0ZWRfX7XhWU0/SuKdz WywS+Fnk1w3DnOJwQ9Gg+4fAZDPnrDUQ+PJm1rP73X8TCJh5X7h5v2u+5WGqsMZj5cJJCd4qAed qMNOf9z3tR3m9yKXByUBi5/os9YCCtcKEUc0cTGEMrsVIB8Ts/TzmvNAZeQa2ecqcNLKhJB7kid
 qy+4kiXXKVnjZc0fUeIo3SWVYggK5OsZ14fxS6RKtM5gM1vZwzlJBvQqLpPhaCLIyY8AcLES+NR Mg2MUhPnf92n0xzOUBFXBuW0B38QQw0uUNFd0cWU/COZUmewShaxtkegRtSjiHwR8YNDZJzBhex BeYVxA+NzDuS087nX9sWV+XBgxB+yULV0x1+4kBlsqGQkYabv4nfghUe3qdPmDStznsKj8wHPmJ
 P/EoUEwHdKiDHMvdqwkBjaPpekstixDg4EwJeIs3gdtHF4r+NW5H8Ys/G0kzS/YIsOllAnq3
X-Authority-Analysis: v=2.4 cv=MshS63ae c=1 sm=1 tr=0 ts=685ba5f5 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=c5s30AdFp4CnpOY87z8A:9
X-Proofpoint-GUID: Z7GqdOC5lLqMmZixiv9KuMPKXdxDcbax
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_003213_903755_1DC65232 
X-CRM114-Status: GOOD (  19.02  )
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

Support page table check on all PowerPC platforms. This works by
serialising assignments, reassignments and clears of page table
entries at each level in order to ensure that anonymous mappings
have at most one writable consumer, and likewise that file-backed
mappings are not simultaneously also anonymous mappings.

In order to support this infrastructure, a number of stubs must be
defined for all powerpc platforms. Additionally, separate set_pte_at()
and set_pte_at_unchecked(), to allow for internal, uninstrumented mappings.

On some PowerPC platforms, implementing {pte,pmd,pud}_user_accessible_page()
requires the address. We revert previous changes that removed the address
parameter from various interfaces, and add it to some other interfaces,
in order to allow this.

(This series was initially written by Rohan McLure, who has left IBM and
is no longer working on powerpc.)

v15:
 * Rebase on mainline, including commit 91e40668e70a
   ("mm/page_table_check: Batch-check pmds/puds just like ptes") and
   associated arm64 changes
 * Clarify/fix some commit messages
 * Fix handling of address in a loop in __page_table_check_ptes_set()

v14:
 * Fix a call to page_table_check_pud_set() that was missed (akpm)
Link: https://lore.kernel.org/all/20250411054354.511145-1-ajd@linux.ibm.com/

v13:
 * Rebase on mainline
 * Don't use set_pte_at_unchecked() for early boot purposes (Pasha)
Link: https://lore.kernel.org/linuxppc-dev/20250211161404.850215-1-ajd@linux.ibm.com/

v12:
 * Rename commits that revert changes to instead reflect that we are
   reinstating old behaviour due to it providing more flexibility
 * Add return line to pud_pfn() stub
 * Instrument ptep_get_and_clear() for nohash
Link: https://lore.kernel.org/linuxppc-dev/20240402051154.476244-1-rmclure@linux.ibm.com/

v11:
 * The pud_pfn() stub, which previously had no legitimate users on any
   powerpc platform, now has users in Book3s64 with transparent pages.
   Include a stub of the same name for each platform that does not
   define their own.
 * Drop patch that standardised use of p*d_leaf(), as already included
   upstream in v6.9.
 * Provide fallback definitions of p{m,u}d_user_accessible_page() that
   do not reference p*d_leaf(), p*d_pte(), as they are defined after
   powerpc/mm headers by linux/mm headers.
 * Ensure that set_pte_at_unchecked() has the same checks as
   set_pte_at().
Link: https://lore.kernel.org/linuxppc-dev/20240328045535.194800-14-rmclure@linux.ibm.com/ 

v10:
 * Revert patches that removed address and mm parameters from page table
   check routines, including consuming code from arm64, x86_64 and
   riscv.
 * Implement *_user_accessible_page() routines in terms of pte_user()
   where available (64-bit, book3s) but otherwise by checking the
   address (on platforms where the pte does not imply whether the
   mapping is for user or kernel)
 * Internal set_pte_at() calls replaced with set_pte_at_unchecked(), which
   is identical, but prevents double instrumentation.
Link: https://lore.kernel.org/linuxppc-dev/20240313042118.230397-9-rmclure@linux.ibm.com/T/

v9:
 * Adapt to using the set_ptes() API, using __set_pte_at() where we need
   must avoid instrumentation.
 * Use the logic of *_access_permitted() for implementing
   *_user_accessible_page(), which are required routines for page table
   check.
 * Even though we no longer need p{m,u,4}d_leaf(), still default
   implement these to assist in refactoring out extant
   p{m,u,4}_is_leaf().
 * Add p{m,u}_pte() stubs where asm-generic does not provide them, as
   page table check wants all *user_accessible_page() variants, and we
   would like to default implement the variants in terms of
   pte_user_accessible_page().
 * Avoid the ugly pmdp_collapse_flush() macro nonsense! Just instrument
   its constituent calls instead for radix and hash.
Link: https://lore.kernel.org/linuxppc-dev/20231130025404.37179-2-rmclure@linux.ibm.com/

v8:
 * Fix linux/page_table_check.h include in asm/pgtable.h breaking
   32-bit.
Link: https://lore.kernel.org/linuxppc-dev/20230215231153.2147454-1-rmclure@linux.ibm.com/

v7:
 * Remove use of extern in set_pte prototypes
 * Clean up pmdp_collapse_flush macro
 * Replace set_pte_at with static inline function
 * Fix commit message for patch 7
Link: https://lore.kernel.org/linuxppc-dev/20230215020155.1969194-1-rmclure@linux.ibm.com/

v6:
 * Support huge pages and p{m,u}d accounting.
 * Remove instrumentation from set_pte from kernel internal pages.
 * 64s: Implement pmdp_collapse_flush in terms of __pmdp_collapse_flush
   as access to the mm_struct * is required.
Link: https://lore.kernel.org/linuxppc-dev/20230214015939.1853438-1-rmclure@linux.ibm.com/

v5:
Link: https://lore.kernel.org/linuxppc-dev/20221118002146.25979-1-rmclure@linux.ibm.com/

Andrew Donnellan (2):
  arm64/mm: Add addr parameter to __set_{ptes_anysz,ptes,pmds,puds}()
  arm64/mm: Add addr parameter to __ptep_get_and_clear_anysz()

Rohan McLure (11):
  mm/page_table_check: Reinstate address parameter in
    [__]page_table_check_pud[s]_set()
  mm/page_table_check: Reinstate address parameter in
    [__]page_table_check_pmd[s]_set()
  mm/page_table_check: Provide addr parameter to
    [__]page_table_check_ptes_set()
  mm/page_table_check: Reinstate address parameter in
    [__]page_table_check_pud_clear()
  mm/page_table_check: Reinstate address parameter in
    [__]page_table_check_pmd_clear()
  mm/page_table_check: Reinstate address parameter in
    [__]page_table_check_pte_clear()
  mm: Provide address parameter to p{te,md,ud}_user_accessible_page()
  powerpc: mm: Add pud_pfn() stub
  powerpc: mm: Implement *_user_accessible_page() for ptes
  powerpc: mm: Use set_pte_at_unchecked() for internal usages
  powerpc: mm: Support page table check

 arch/arm64/include/asm/pgtable.h             | 46 ++++++-------
 arch/arm64/mm/hugetlbpage.c                  | 15 +++--
 arch/powerpc/Kconfig                         |  1 +
 arch/powerpc/include/asm/book3s/32/pgtable.h | 12 +++-
 arch/powerpc/include/asm/book3s/64/pgtable.h | 62 +++++++++++++++---
 arch/powerpc/include/asm/nohash/pgtable.h    | 13 +++-
 arch/powerpc/include/asm/pgtable.h           | 19 ++++++
 arch/powerpc/mm/book3s64/hash_pgtable.c      |  4 ++
 arch/powerpc/mm/book3s64/pgtable.c           | 17 +++--
 arch/powerpc/mm/book3s64/radix_pgtable.c     |  9 ++-
 arch/powerpc/mm/pgtable.c                    | 12 ++++
 arch/riscv/include/asm/pgtable.h             | 20 +++---
 arch/x86/include/asm/pgtable.h               | 22 +++----
 include/linux/page_table_check.h             | 69 ++++++++++++--------
 include/linux/pgtable.h                      | 10 +--
 mm/page_table_check.c                        | 41 ++++++------
 16 files changed, 247 insertions(+), 125 deletions(-)

-- 
2.49.0

