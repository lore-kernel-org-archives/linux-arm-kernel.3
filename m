Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E0CD1D86A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 06:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MdrhlJJLip89KDzEFZOj8aij0kUZ8IVk3riPxg8kaq8=; b=rftmBQpwR8jxPGmBz3T/1Q5wE5
	mjYin43gDdPVbFfi3LznyxfH+xoh15mqpEJsjCaqWF9CFd+t3WcdCOFwXVP2TKsuJkFX8rp4MHePp
	abZRwwuVLF5Yjrma10/BmeOXi4e8vWgNeWRgR6ucT5c14LkYf0FCDUaWyJ1Lml0jkVhzhSCHfoas6
	hQvZVePWjNMh23iMqUp2rD6YseEa448WSpggT0umO1oMlJvMZEFX5t+7KwL3RHKYX8dFrc/ck1KjJ
	BPqUeCGcGhcfBALL8BJtuJ0JAEnbdaplJ2Wt8vVf31dN0OYUyhv3JhfSFKxb5UsWbKSAqVycOchSX
	s8o4qs1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR2oY-00000007Xqg-2HFV;
	Thu, 04 Dec 2025 06:27:42 +0000
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR2oV-00000007Xq7-11C4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 06:27:41 +0000
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B447kqB3785558;
	Wed, 3 Dec 2025 22:27:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=MdrhlJJLi
	p89KDzEFZOj8aij0kUZ8IVk3riPxg8kaq8=; b=Du2DPWWajOED8qalQ+E05C8IF
	4nMqbjEdcJcG4emZaZXf63wchttr86VQauVdxAnHq8bUCXGsxFhPkFsePf7qba81
	FUMCcKf+6uWejXLatpMq+VVurPUqz2RWVJkvkBMVYI8JE7QpL5ydzCTcK6kNbyQM
	y6Y2HQ6z+58tm/hkQuAa4s6jP7ojIYITNL/Lot8QmEskGTxNFM2ISxeKDJqEkvJV
	BqBA536zMMlFY++7/ePNWv7p4M6o8Zg8fADD7spQ2pSs6fbsrA+BOm1j6OGPBuuv
	9G1CGRDmj6k9jn2W+ys3SQqhjKXRq5Yuw+9RwlPTiOTbrc1WgwJ0SYKNxXrJA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ar17mwtck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 03 Dec 2025 22:27:26 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 3 Dec 2025 22:27:25 -0800
Received: from pek-lpggp9.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 3 Dec 2025 22:27:23 -0800
From: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>,
        <ying.huang@linux.alibaba.com>, <ardb@kernel.org>,
        <anshuman.khandual@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Jianpeng Chang <jianpeng.chang.cn@windriver.com>
Subject: [v3 PATCH] arm64: mm: Fix kexec failure after pte_mkwrite_novma() change
Date: Thu, 4 Dec 2025 14:27:22 +0800
Message-ID: <20251204062722.3367201-1-jianpeng.chang.cn@windriver.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: thNNvrTBKb91gMHjL32t6XFQPA9gLTK3
X-Authority-Analysis: v=2.4 cv=Ws4m8Nfv c=1 sm=1 tr=0 ts=693129ce cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8
 a=SRrdq9N9AAAA:8 a=PjQCVsg8d7JXQQm6heoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: thNNvrTBKb91gMHjL32t6XFQPA9gLTK3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA1MCBTYWx0ZWRfX/ue7dBQJ1V4q
 A3xhqdantttadhPbB/PbQK1Km7p9f7Skw1rShdYeZ3tnnyK7idINbHpWwBfiCjUIA5vwxu6W6fF
 Db14qbOpUc/Z7qiq88JbaeAdb2SE6KXkqqta5cm8ec/WFA5nmJA6KHXAN2lVMerVqTVE8uoLsR/
 JNYBvo9VW5C/ucjrbfHJl+7gnwPKc1sS6qlJLCEGbXDHvcE3DZGT+VokddHD/ef1WvkWdU2quyB
 L0OeugDI6DtQEMANNn6teOYeaRbcGYdgHQ0IxOktprpWBdQPF2tmdj71aQ4Y8+xKA8c5DnGvXeA
 JPSSm7SKgpWATiyPVRGuhnjsXzHGJzKEV3oXuILL8fD9TfOqd+Z7wIeckwU9olIDQ04Z4O670of
 RafGrblxpG5cpePTMvs0bnjlWkjmQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_222740_158890_CF3058DB 
X-CRM114-Status: GOOD (  19.86  )
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

Commit 143937ca51cc ("arm64, mm: avoid always making PTE dirty in
pte_mkwrite()") modified pte_mkwrite_novma() to only clear PTE_RDONLY
when the page is already dirty (PTE_DIRTY is set). While this optimization
prevents unnecessary dirty page marking in normal memory management paths,
it breaks kexec on some platforms like NXP LS1043.

The issue occurs in the kexec code path:
1. machine_kexec_post_load() calls trans_pgd_create_copy() to create a
   writable copy of the linear mapping
2. _copy_pte() calls pte_mkwrite_novma() to ensure all pages in the copy
   are writable for the new kernel image copying
3. With the new logic, clean pages (without PTE_DIRTY) remain read-only
4. When kexec tries to copy the new kernel image through the linear
   mapping, it fails on read-only pages, causing the system to hang
   after "Bye!"

The same issue affects hibernation which uses the same trans_pgd code path.

Fix this by marking pages dirty with pte_mkdirty() in _copy_pte(), which
ensures pte_mkwrite_novma() clears PTE_RDONLY for both kexec and
hibernation, making all pages in the temporary mapping writable regardless
of their dirty state. This preserves the original commit's optimization
for normal memory management while fixing the kexec/hibernation regression.

Using pte_mkdirty() causes redundant bit operations when the page is
already writable (redundant PTE_RDONLY clearing), but this is acceptable
since it's not a hot path and only affects kexec/hibernation scenarios.

Fixes: 143937ca51cc ("arm64, mm: avoid always making PTE dirty in pte_mkwrite()")
Signed-off-by: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
Reviewed-by: Huang Ying <ying.huang@linux.alibaba.com>
---
v3: 
  - Add the description about pte_mkdirty in commit message
  - Note that the redundant bit operations in commit message
  - Fix the comments following the suggestions
v2: https://lore.kernel.org/all/20251202022707.2720933-1-jianpeng.chang.cn@windriver.com/
  - Use pte_mkwrite_novma(pte_mkdirty(pte)) instead of manual bit manipulation
  - Updated comments to clarify pte_mkwrite_novma() alone cannot be used
v1: https://lore.kernel.org/all/20251127034350.3600454-1-jianpeng.chang.cn@windriver.com/

 arch/arm64/mm/trans_pgd.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
index 18543b603c77..766883780d2a 100644
--- a/arch/arm64/mm/trans_pgd.c
+++ b/arch/arm64/mm/trans_pgd.c
@@ -40,8 +40,14 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
 		 * Resume will overwrite areas that may be marked
 		 * read only (code, rodata). Clear the RDONLY bit from
 		 * the temporary mappings we use during restore.
+		 *
+		 * For both kexec and hibernation, writable accesses are required
+		 * for all pages in the linear map to copy over new kernel image.
+		 * Hence mark these pages dirty first via pte_mkdirty() to ensure
+		 * pte_mkwrite_novma() subsequently clears PTE_RDONLY - providing
+		 * required write access for the pages.
 		 */
-		__set_pte(dst_ptep, pte_mkwrite_novma(pte));
+		__set_pte(dst_ptep, pte_mkwrite_novma(pte_mkdirty(pte)));
 	} else if (!pte_none(pte)) {
 		/*
 		 * debug_pagealloc will removed the PTE_VALID bit if
@@ -57,7 +63,14 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
 		 */
 		BUG_ON(!pfn_valid(pte_pfn(pte)));
 
-		__set_pte(dst_ptep, pte_mkvalid(pte_mkwrite_novma(pte)));
+		/*
+		 * For both kexec and hibernation, writable accesses are required
+		 * for all pages in the linear map to copy over new kernel image.
+		 * Hence mark these pages dirty first via pte_mkdirty() to ensure
+		 * pte_mkwrite_novma() subsequently clears PTE_RDONLY - providing
+		 * required write access for the pages.
+		 */
+		__set_pte(dst_ptep, pte_mkvalid(pte_mkwrite_novma(pte_mkdirty(pte))));
 	}
 }
 
-- 
2.52.0


