Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B16BCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 19:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6aeQb1DWwKh9q0A988WnunX6ASTyvLF65eSlmDdPkY=; b=iNN8xOGzIbARxkEWveyzNEs8iX
	PTkzzAzpXvud8NmCXOCQJZh4wfrIRKr0g4s7PxJk7qz89LkLFe51ojvu6SzORaA7aHTvWvGJI/mor
	RmXyteLIEeCVYO/GSpqPYl/B+DGevyDhoDJWUFFCMf2M5esSFDz4tuvOsI5/zj+GVAUDDooDIrC1i
	mn5a2DGHGk4m9P0d3A0cDT3mUJjZBmK6/3SPfK7An0bGQcbExnxzUElhDghkZLXdpLeZCNYPLsRQn
	bMfzCjkAS8+z1bKZFawpy7UuBOeRSn+uLhWJfnkubSb81PWROYqGiCl/dFnxGQc9+/slg25JLS3aZ
	P0JhwVLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHoUh-00000003OGU-01cy;
	Sat, 08 Nov 2025 19:21:03 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHoUd-00000003OG5-0pdj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 19:21:01 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A8CN5sv021288;
	Sat, 8 Nov 2025 19:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=R6aeQb1DWwKh9q0A9
	88WnunX6ASTyvLF65eSlmDdPkY=; b=Gy0DfapYgtDTuRypTCHrLjflWhgUSwbd7
	7nzMpOIwXwLC8shQih48AucxK1cP0YGsHyL8XY5n6MztEMY2noCPiPuh49ZbadzW
	4uWwAxtHLuUJuSw6PZwY6BsAtzOw+hhryeVoQS/St7aEfbdhnVQZzyNCzzdqnOeN
	5J8CyAQDB/++rkq9fJJUXA4eYnqfdYEuhieEbyh6utvZmi6XwSU9SrSewQ5ue9XX
	aKWRTooBtrvbsQR1jtDKyZVlIKmnMD+3y303Y4FQBzzFm9nIk1gz+WcuNHTsRNHo
	fZp/cq0Bg8Go1fWQMm1OGqWW0iPczhjA6IhHH6rmY2cpi3pm7QnwA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aa5tjgv62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Nov 2025 19:20:48 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A8I41sp021491;
	Sat, 8 Nov 2025 19:20:48 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5xrk802x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Nov 2025 19:20:47 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A8JKkPE54395318
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 8 Nov 2025 19:20:46 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4833D20043;
	Sat,  8 Nov 2025 19:20:46 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2986A20040;
	Sat,  8 Nov 2025 19:20:46 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  8 Nov 2025 19:20:46 +0000 (GMT)
From: Jan Polensky <japo@linux.ibm.com>
To: catalin.marinas@arm.com
Cc: akpm@linux-foundation.org, david@redhat.com,
        linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
        will@kernel.org
Subject: [PATCH] mm/huge_memory: initialise the tags of the huge zero folio
Date: Sat,  8 Nov 2025 20:19:47 +0100
Message-ID: <20251108191948.684586-1-japo@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251031170133.280742-1-catalin.marinas@arm.com>
References: <20251031170133.280742-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: b3mCt8QQvAzP0MnNqKgGftHnBTK4IgMm
X-Proofpoint-ORIG-GUID: b3mCt8QQvAzP0MnNqKgGftHnBTK4IgMm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDA5OSBTYWx0ZWRfX5KEPNLD2szB6
 QM6UCsOSYijGIiQr4dlgLq4yblKBNNKg7xH3Y3k/r7vf5XWzP73UnBZYpe4vjUcVRaEW7Jsd5YJ
 xTW90ptfJKiyoqOYhQHvFcSXhD8hE0iXqA0PQuk4+I0JXsJJaSMgOlDWsYFGkjf/U5GbWQBXgjF
 iNooh/WCBa3V3Y3saw8NtMQw1IIddvhVIna85ntbjbtqBofikwoqejqtO1eK+oSz5x0yr18nmiR
 GNCwUOTbEe6fRIfu45al4Vr0Td6kDCKMmtUdp2ni8YfSXxcokrGRT7+2p4iqMV1ruI3e782YAqP
 G4O+jUIDJ88VEm/M12M1D/gEGqKPdtGJA3UHIpA1iM7CglcdPDBvRP0l8UUgDh6QvojwoPupe6h
 xwaP3VqH4hB2NB9qt1kNGUco01uRZw==
X-Authority-Analysis: v=2.4 cv=V6xwEOni c=1 sm=1 tr=0 ts=690f9810 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=20KFwNOVAAAA:8 a=Z4Rwk6OoAAAA:8 a=VnNF1IyMAAAA:8 a=GRmcs_4ORcCTOOSj304A:9
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=HkZW87K1Qel5hWWM3VKY:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511080099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_112059_714258_83BDA3D4 
X-CRM114-Status: GOOD (  18.91  )
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

From: Catalin Marinas <catalin.marinas@arm.com>

On arm64 with MTE enabled, a page mapped as Normal Tagged (PROT_MTE) in
user space will need to have its allocation tags initialised.  This is
normally done in the arm64 set_pte_at() after checking the memory
attributes.  Such page is also marked with the PG_mte_tagged flag to avoid
subsequent clearing.  Since this relies on having a struct page,
pte_special() mappings are ignored.

Commit d82d09e48219 ("mm/huge_memory: mark PMD mappings of the huge zero
folio special") maps the huge zero folio special and the arm64
set_pmd_at() will no longer zero the tags.  There is no guarantee that the
tags are zero, especially if parts of this huge page have been previously
tagged.

It's fairly easy to detect this by regularly dropping the caches to
force the reallocation of the huge zero folio.

Allocate the huge zero folio with the __GFP_ZEROTAGS flag.  In addition,
do not warn in the arm64 __access_remote_tags() when reading tags from the
huge zero page.

I bundled the arm64 change in here as well since they are both related to
the commit mapping the huge zero folio as special.

Link: https://lkml.kernel.org/r/20251031170133.280742-1-catalin.marinas@arm.com
Fixes: d82d09e48219 ("mm/huge_memory: mark PMD mappings of the huge zero folio special")
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Jan Polensky <japo@linux.ibm.com>
---
 arch/arm64/kernel/mte.c | 3 ++-
 mm/huge_memory.c        | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index 43f7a2f39403..32148bf09c1d 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -476,7 +476,8 @@ static int __access_remote_tags(struct mm_struct *mm, unsigned long addr,
 
 		folio = page_folio(page);
 		if (folio_test_hugetlb(folio))
-			WARN_ON_ONCE(!folio_test_hugetlb_mte_tagged(folio));
+			WARN_ON_ONCE(!folio_test_hugetlb_mte_tagged(folio) &&
+				     !is_huge_zero_folio(folio));
 		else
 			WARN_ON_ONCE(!page_mte_tagged(page) && !is_zero_page(page));
 
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index b4ff49d96501..323654fb4f8c 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -214,7 +214,8 @@ static bool get_huge_zero_folio(void)
 	if (likely(atomic_inc_not_zero(&huge_zero_refcount)))
 		return true;
 
-	zero_folio = folio_alloc((GFP_TRANSHUGE | __GFP_ZERO) & ~__GFP_MOVABLE,
+	zero_folio = folio_alloc((GFP_TRANSHUGE | __GFP_ZERO | __GFP_ZEROTAGS) &
+				 ~__GFP_MOVABLE,
 			HPAGE_PMD_ORDER);
 	if (!zero_folio) {
 		count_vm_event(THP_ZERO_PAGE_ALLOC_FAILED);
-- 
2.48.1


