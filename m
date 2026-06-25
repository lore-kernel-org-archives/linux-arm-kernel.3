Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84855CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 11:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N8+uh5P1UEnewbpnSH35VnyhMvb2TQ0IOnKec09Ie7w=; b=JUgBgI6jmXHK5vxxqtEpguhgOp
	zm2vc6/QRuUJgVAB6AybHit2On4EHxyBWxVEawPedx7HcTJS6QjIitVs7cBzxKA8KN0Q28FnDzSsv
	9cy3nQ2l2y7rJvXCer2AUXyqP5OSLTg1Zk68f/hoOeFgqFkXUHyGMhXY9RslJMD5xVh2AjL870spZ
	EPfpcbtqCe6+jWaNsz+z5ahFcl9pvH/tj/OZS5JHysHZlLVAysSYityu9UX28ZVVklwu4S7RpoKvG
	d1v+H8+JYGetyaZdyYdcE4zUaHO30Ur5Va8GldGCdiwvx5cXr2nr9xa/ExWxkSS5WZ8m/s8Htr1jR
	kHxoGjJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcicf-000000097mB-2DOE;
	Thu, 25 Jun 2026 11:51:57 +0000
Received: from mx21.baidu.com ([220.181.3.85] helo=outbound.baidu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcica-000000097kx-34gb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 11:51:55 +0000
X-MD-Sfrom: lirongqing@baidu.com
X-MD-SrcIP: 172.31.50.47
From: lirongqing <lirongqing@baidu.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>, Ard Biesheuvel <ardb@kernel.org>, David
 Hildenbrand <david@kernel.org>, Anshuman Khandual
	<anshuman.khandual@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, Yang Shi
	<yang@os.amperecomputing.com>, Chaitanya S Prakash
	<chaitanyas.prakash@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Li RongQing <lirongqing@baidu.com>
Subject: [PATCH] arm64: mm: refresh stale pmd snapshot after split_contpmd()
Date: Thu, 25 Jun 2026 19:39:53 +0800
Message-ID: <20260625113953.2332-1-lirongqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: bjkjy-exc11.internal.baidu.com (172.31.51.11) To
 bjkjy-exc3.internal.baidu.com (172.31.50.47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1782387604;
	bh=N8+uh5P1UEnewbpnSH35VnyhMvb2TQ0IOnKec09Ie7w=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type;
	b=BsGF/0gtT5O6OF0VkwyyOCMsO1SgYaXCSzo22OLqbmcFkG0aiG2xox+b/G5ZoCjez
	 RireSRa5dPlAsQCml8jkJADPyLXGHWqrblNjUt9HLLFja7L7966qkWOfcfBK31vB5X
	 Hb4voBqK40DFfu0yYjBiFS9Wm8xBduzuue9bYsKrPq3DjQiH9ob4OE1ht5BIgUTwvM
	 joBJYI//GfjOnyhJO6wGcPFjUEtlho/WVO6tGfwisP/tA8ACuzb32mUWRcfhIsJutb
	 nuIWHPfg5Xt/xtLwEiDp0+qp5p6JYV5bOmrceKh9QDlCzlMqJ6HFoxJ+Qoeuob9l0I
	 vo+ObHgJB8Gbg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_045152_977196_2CB6141D 
X-CRM114-Status: GOOD (  11.91  )
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

From: Li RongQing <lirongqing@baidu.com>

split_contpmd() modifies the pmd entries in-place by clearing the CONT
bit, but the local 'pmd' variable still holds the old snapshot with CONT
set. The subsequent split_pmd() call uses this stale value to derive the
pgprot for the new PTE entries via pmd_pgprot(), causing the resulting
PTEs to be populated with incorrect protection bits.

Fix this by re-reading the pmd from memory after split_contpmd() returns
in both call sites: split_kernel_leaf_mapping_locked() and
split_to_ptes_pmd_entry().

Fixes: a166563e7ec3 ("arm64: mm: support large block mapping when rodata=full")
Signed-off-by: Li RongQing <lirongqing@baidu.com>
---
 arch/arm64/mm/mmu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 12e862c..e510336 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -746,8 +746,10 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
 	if (!pmd_present(pmd))
 		goto out;
 	if (pmd_leaf(pmd)) {
-		if (pmd_cont(pmd))
+		if (pmd_cont(pmd)) {
 			split_contpmd(pmdp);
+			pmd = pmdp_get(pmdp);
+		}
 		/*
 		 * PMD: If addr is PMD aligned then addr already describes a
 		 * leaf boundary. Otherwise, split to contpte.
@@ -891,8 +893,10 @@ static int split_to_ptes_pmd_entry(pmd_t *pmdp, unsigned long addr,
 	int ret = 0;
 
 	if (pmd_leaf(pmd)) {
-		if (pmd_cont(pmd))
+		if (pmd_cont(pmd)) {
 			split_contpmd(pmdp);
+			pmd = pmdp_get(pmdp);
+		}
 		ret = split_pmd(pmdp, pmd, gfp, false);
 
 		/*
-- 
2.9.4


