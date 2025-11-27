Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF68CD10375
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 03:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yRsHdEyyQQTC9xNyCj5ifCZE9pb7MQUReNxi+Mm8TW0=; b=UgUP+9TWEN0DmwdM/q8EDHog1m
	8cA7kS47jn5GJaeZOVFQbMgG4emAXfYD2aNcz38Jk4TlTSEVhWNvshGI+DzptgLXlzuPVxiX0DRRz
	sATE20J4ytp7hh9q8fYtGX0rsu8NYZjvU2gcV1CEZPLNLr7V8eStRxcwl2XVhq0WzmkhNyt64icq5
	ZIW32254nmG9wSl4A9pkwQz31qPHMHeYqHZ48aA0qlWzb3a/c7iOOBCZ0DAxwcaCi1mnDmxDirIq3
	qYbPtN2tF7rF253Dw/i699ZW3H4MIKU2zlGAs3FYdgfBhenO4R367VL/BAlJJ3zklRsWS4OGR2apb
	wsF7i1Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOSvX-0000000FwIm-3C2V;
	Thu, 27 Nov 2025 03:44:15 +0000
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOSvT-0000000FwIR-1jwd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 03:44:14 +0000
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR3a8Ht3617043;
	Wed, 26 Nov 2025 19:43:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=yRsHdEyyQ
	QTC9xNyCj5ifCZE9pb7MQUReNxi+Mm8TW0=; b=eD1uuYGM+RdIVZWe/ip6H1Vxs
	nBVlB3LncN5LTuW5Dnxjd8ylm2TQ3kElZ1nK7UfXfA0UDdSKu/2pPCj3qtnF6AHL
	BUGCjcH1vN2mQ/xbx7997LnxQ82e6pxYQY9G4LUUylQeXZLLmYPr+TeUg8VGYmfR
	BEqQEUvkVboYFsumkm5BgRBmpEUvmxZGG8vJrLAFB1wtp+PVgaAjwt6HFVvV7Kwd
	/eI9PSo7CrSDfl+KYe4eK0JbRiVPqmA8LzYfXpkPSx1K1mmmBNC622F4amS3/cRT
	KjiPaNPmdd9/fBg+Nzq5kFfIbBvxszVEJo4ISS6Pltu8WdeCTY8c2Ij1EJcEA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4akdjjd25t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 26 Nov 2025 19:43:54 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 26 Nov 2025 19:43:53 -0800
Received: from pek-lpggp9.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 26 Nov 2025 19:43:51 -0800
From: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <ardb@kernel.org>,
        <anshuman.khandual@arm.com>, <ying.huang@linux.alibaba.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Jianpeng Chang <jianpeng.chang.cn@windriver.com>
Subject: [PATCH] arm64: mm: Fix kexec failure after pte_mkwrite_novma() change
Date: Thu, 27 Nov 2025 11:43:50 +0800
Message-ID: <20251127034350.3600454-1-jianpeng.chang.cn@windriver.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDAyNyBTYWx0ZWRfXxGyFFOc7AM0D
 RWwgSJxB6HwMt90jGj74Gw0ur5pol51+IRZBGjzHDibKpHn5YRhI//N1sZH8HoCRyEeNidb99eV
 Bj919Nkg1QJp7po9TvsIeOhIJC1CnQs4CBV4CagzqH6TW+y3iKMYDLcnzOhAFEOpCfMslapr4z5
 zOgUUY+ZNHMvNKWvddc1I0lsyuB7JGamp8LoSv89/7GIP74UfBVji3/gFqtaJB5WOnTdr+RYbAq
 wZCjlNFWCWrcBCtpRXYYFXmd3OT9Pn+hWk0lw2tVYR1o4WMsQXmoeXp36WqihNS19/gNsWxRzA/
 jWkAkeiejbD4cAqd6imQFS/rMXRdac9VCYrff9JrcVaKk7I6LQdPhWAmonHFqgWN/PeL+t1jvZR
 Wgcy3po7ipHBA5/uZrvf/vtMXw1KzA==
X-Proofpoint-ORIG-GUID: XTfgH7-9FQwWcdGrIourQEenTG2AAVfw
X-Authority-Analysis: v=2.4 cv=Wq8m8Nfv c=1 sm=1 tr=0 ts=6927c8fa cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=GyMUyNA6ChXbh4AA4s4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: XTfgH7-9FQwWcdGrIourQEenTG2AAVfw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511270027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_194412_436867_BD7D839D 
X-CRM114-Status: GOOD (  15.76  )
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

Fix this by explicitly clearing PTE_RDONLY in _copy_pte() for both
kexec and hibernation, ensuring all pages in the temporary mapping are
writable regardless of their dirty state. This preserves the original
commit's optimization for normal memory management while fixing the
kexec/hibernation regression.

Fixes: 143937ca51cc ("arm64, mm: avoid always making PTE dirty in pte_mkwrite()")
Signed-off-by: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
---
 arch/arm64/mm/trans_pgd.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
index 18543b603c77..ad4e5e4fcc91 100644
--- a/arch/arm64/mm/trans_pgd.c
+++ b/arch/arm64/mm/trans_pgd.c
@@ -40,8 +40,13 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
 		 * Resume will overwrite areas that may be marked
 		 * read only (code, rodata). Clear the RDONLY bit from
 		 * the temporary mappings we use during restore.
+		 *
+		 * For kexec/hibernation, we need writable access regardless
+		 * of the page's dirty state, so force clear PTE_RDONLY.
 		 */
-		__set_pte(dst_ptep, pte_mkwrite_novma(pte));
+		pte = set_pte_bit(pte, __pgprot(PTE_WRITE));
+		pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
+		__set_pte(dst_ptep, pte);
 	} else if (!pte_none(pte)) {
 		/*
 		 * debug_pagealloc will removed the PTE_VALID bit if
@@ -57,7 +62,10 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
 		 */
 		BUG_ON(!pfn_valid(pte_pfn(pte)));
 
-		__set_pte(dst_ptep, pte_mkvalid(pte_mkwrite_novma(pte)));
+		pte = pte_mkvalid(pte);
+		pte = set_pte_bit(pte, __pgprot(PTE_WRITE));
+		pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
+		__set_pte(dst_ptep, pte);
 	}
 }
 
-- 
2.51.2


