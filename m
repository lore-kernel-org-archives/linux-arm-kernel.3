Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5E3D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 02:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+3PD+6cwcF4s8NrJAdQxomW+qvoY59hfleACfs4OQkU=; b=0F1q8qstmvLP8YWQs25b39iHDn
	NqLf/AKBw1rfY9AYnDC4+Tv4iUBqm6D8CnLRH+McS6R6O8m2lzhcvfyv9O6K/7h/t0G0JHop2frB+
	QqN5jQIQCM80t6waFb8T9FBGiaU9yXaBxuTY4VUKyuQUi07nDpbDY8jQgvGzl5aA7OZjfsqEBNVls
	HIcogC5za4OC7mQQDgghEhG3C9k8ZyxRGxKVs24X+WWwcedKsJRKZqMKEfNplnWHMKeB0+TtcnKlv
	1B03nftqfEOOvAKfs6jnR0dGgK0U8tAgK6j9MtP/nb56V0RSEBoHUI8BPJTtf/0N4J2Il7BPJV1z9
	NEKPdGcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQG6x-00000004igw-2S1q;
	Tue, 02 Dec 2025 02:27:27 +0000
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQG6v-00000004igb-0IJM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 02:27:26 +0000
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B15EubW576889;
	Mon, 1 Dec 2025 18:27:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=+3PD+6cwc
	F4s8NrJAdQxomW+qvoY59hfleACfs4OQkU=; b=V50eeawGporlO0Q3wzxhr6cx2
	lyQfW7pyxaWV7kUjs6Fr7huVFo6CHzoas8yFbHEi3xERUNTBo/FBC1+i6AJfF2R5
	7nI0tj0jVsZf6yfDAAdm+2CR50NtQY9tHCAbDg+iwk20/kxjypRJxd7QEfMxIZw6
	HCpCtqEjgljc5LUuMTY2Sip632CmLJ/GZx/DotyQ823AaPaW//6yLG178Y4AtdOo
	+GatiXLYE3fZ4n7hCU4A2w7a+glvgG7KjNo1Baa4IzZRZsSF38UfMPIAkhb+hsyF
	n9igRSh+Tvwy8an7iQM0RhXqXZBJTN1/VvdGaD605DgqcfotGg2cNZtg6FTsA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ar17mtajq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 01 Dec 2025 18:27:11 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 1 Dec 2025 18:27:10 -0800
Received: from pek-lpggp9.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 1 Dec 2025 18:27:08 -0800
From: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <ardb@kernel.org>,
        <anshuman.khandual@arm.com>, <ying.huang@linux.alibaba.com>
CC: <jianpeng.chang.cn@windriver.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [v2 PATCH] arm64: mm: Fix kexec failure after pte_mkwrite_novma() change
Date: Tue, 2 Dec 2025 10:27:07 +0800
Message-ID: <20251202022707.2720933-1-jianpeng.chang.cn@windriver.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: FOFktvkh0dApRCuEaFRgDslGLh7uLmzG
X-Authority-Analysis: v=2.4 cv=Ws4m8Nfv c=1 sm=1 tr=0 ts=692e4e7f cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8
 a=vgZC6jWJKEfd7d2Pg-8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: FOFktvkh0dApRCuEaFRgDslGLh7uLmzG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDAxNyBTYWx0ZWRfX/XEXwo7aCDpQ
 mVxAXnWEZg9J7Klt8UvcaQCvsz0ySvA81/vwRHY0qPuzp/ND7xVGkipUbEg7C9Ho9zfeQCtYQ8H
 DQ5X+OS2z3Th7Z3v9zqlZqZOvlII2yfwcQkw+zXELWhtXJPNmZBDv5WgZy+KuBIs/QqTWjMvFy9
 jY9dXoN2jgAFs1eBXWTpCJ9fpqiytJ4wjQDV2lqLJ04sa9vGn4QbATxhWvFOMr098cBNHtEBvrf
 hy2a4dYid98vgFEUvzH1DPz1zWPiqlZY1EZ1mLp3v+11m3ihEwQK7A03h2X3pYbv7ph5w7sSrDK
 9UfRypf4P6R3Ui1kbL/OthIbDL7GOBJLE96LHpJbP05zTvZFO0Y7pZuLjdtDj0mZvnBN73vgYyt
 L/MuObsHYf8ZtfOysgMhM30vYV4Q7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_182725_175670_A5CABFFC 
X-CRM114-Status: GOOD (  16.24  )
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
v2:
  - Use pte_mkwrite_novma(pte_mkdirty(pte)) instead of manual bit manipulation
  - Updated comments to clarify pte_mkwrite_novma() alone cannot be used
v1: https://lore.kernel.org/all/20251127034350.3600454-1-jianpeng.chang.cn@windriver.com/

 arch/arm64/mm/trans_pgd.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
index 18543b603c77..08f5ee6643e1 100644
--- a/arch/arm64/mm/trans_pgd.c
+++ b/arch/arm64/mm/trans_pgd.c
@@ -40,8 +40,13 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
 		 * Resume will overwrite areas that may be marked
 		 * read only (code, rodata). Clear the RDONLY bit from
 		 * the temporary mappings we use during restore.
+		 *
+		 * For kexec/hibernation, we need writable access to all
+		 * pages in the linear mapping to copy the new kernel image.
+		 * Mark pages dirty first to ensure pte_mkwrite_novma()
+		 * clears PTE_RDONLY.
 		 */
-		__set_pte(dst_ptep, pte_mkwrite_novma(pte));
+		__set_pte(dst_ptep, pte_mkwrite_novma(pte_mkdirty(pte)));
 	} else if (!pte_none(pte)) {
 		/*
 		 * debug_pagealloc will removed the PTE_VALID bit if
@@ -57,7 +62,7 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
 		 */
 		BUG_ON(!pfn_valid(pte_pfn(pte)));
 
-		__set_pte(dst_ptep, pte_mkvalid(pte_mkwrite_novma(pte)));
+		__set_pte(dst_ptep, pte_mkvalid(pte_mkwrite_novma(pte_mkdirty(pte))));
 	}
 }
 
-- 
2.51.2


