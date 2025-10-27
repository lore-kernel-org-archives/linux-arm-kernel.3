Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81331CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 19:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGGBf61uwIZ+DsmTmS6EDcdUc2IaogdtQl9i87nP4tU=; b=JO3AbffpYBAKPT5dJdBQyo2jB/
	VIuMq2/AJ5yomjMkeBZmlh4446ahmLP78ttDh6Q/XlJ7R4D0OQe4r6QHFduLn+at9EhDOzJwnqR9J
	H6rxhKNfiWU6oK/tQH79EbWzKjrtTJufTjg63YxZp1p8ODi7iQqDabYLrlGUvgYurpGec9hGacFGP
	PKmMNo9IzT2aTWewKpBbFW+xFPYGTIJxvWl5sDXe3J1+jWUuijkHvC518uYS/gaRnkk2j8W+ujp5d
	hfWiGW8PjWBMYQew6h8nUsgk/IR/MmJVarKYgEuLwrHVeSvDZARt44t2nNtPh7u0+GWKc/R+wFgvI
	pGZJkbgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSrY-0000000EfEo-1hBy;
	Mon, 27 Oct 2025 19:26:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSrW-0000000EfEa-3eLa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 19:26:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4640D61FB8;
	Mon, 27 Oct 2025 19:26:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EF21C4CEF1;
	Mon, 27 Oct 2025 19:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761593197;
	bh=awzUQQq1hAueQzk/+8e4kIr8PEpBvD5wGpesCIyObFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N8np0sM3jFGyrJmpNQbfDG/+SHkBiUmI7t+Kb7tsfl+EpeMvfuCebQvWWIXwGWKMn
	 11wocQDQb/ODOvfMnkPUsnusMQIKh+41vkRuF3DDB/DFxjw0/S2htR+gtPFuPwPl+G
	 kw/trdigvAyXGiGBGbPX799PrlWcsLyJSW0EpIn0=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Huang Ying <ying.huang@linux.alibaba.com>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Yicong Yang <yangyicong@hisilicon.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.17 050/184] arm64, mm: avoid always making PTE dirty in pte_mkwrite()
Date: Mon, 27 Oct 2025 19:35:32 +0100
Message-ID: <20251027183516.248198636@linuxfoundation.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027183514.934710872@linuxfoundation.org>
References: <20251027183514.934710872@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

6.17-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Huang Ying <ying.huang@linux.alibaba.com>

[ Upstream commit 143937ca51cc6ae2fccc61a1cb916abb24cd34f5 ]

Current pte_mkwrite_novma() makes PTE dirty unconditionally.  This may
mark some pages that are never written dirty wrongly.  For example,
do_swap_page() may map the exclusive pages with writable and clean PTEs
if the VMA is writable and the page fault is for read access.
However, current pte_mkwrite_novma() implementation always dirties the
PTE.  This may cause unnecessary disk writing if the pages are
never written before being reclaimed.

So, change pte_mkwrite_novma() to clear the PTE_RDONLY bit only if the
PTE_DIRTY bit is set to make it possible to make the PTE writable and
clean.

The current behavior was introduced in commit 73e86cb03cf2 ("arm64:
Move PTE_RDONLY bit handling out of set_pte_at()").  Before that,
pte_mkwrite() only sets the PTE_WRITE bit, while set_pte_at() only
clears the PTE_RDONLY bit if both the PTE_WRITE and the PTE_DIRTY bits
are set.

To test the performance impact of the patch, on an arm64 server
machine, run 16 redis-server processes on socket 1 and 16
memtier_benchmark processes on socket 0 with mostly get
transactions (that is, redis-server will mostly read memory only).
The memory footprint of redis-server is larger than the available
memory, so swap out/in will be triggered.  Test results show that the
patch can avoid most swapping out because the pages are mostly clean.
And the benchmark throughput improves ~23.9% in the test.

Fixes: 73e86cb03cf2 ("arm64: Move PTE_RDONLY bit handling out of set_pte_at()")
Signed-off-by: Huang Ying <ying.huang@linux.alibaba.com>
Cc: Will Deacon <will@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Gavin Shan <gshan@redhat.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: Yicong Yang <yangyicong@hisilicon.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/include/asm/pgtable.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index abd2dee416b3b..e6fdb52963303 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -293,7 +293,8 @@ static inline pmd_t set_pmd_bit(pmd_t pmd, pgprot_t prot)
 static inline pte_t pte_mkwrite_novma(pte_t pte)
 {
 	pte = set_pte_bit(pte, __pgprot(PTE_WRITE));
-	pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
+	if (pte_sw_dirty(pte))
+		pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
 	return pte;
 }
 
-- 
2.51.0




