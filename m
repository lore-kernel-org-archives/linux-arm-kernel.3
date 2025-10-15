Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E2ECCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 02:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=awK8T53rvm3JtUI0otLj6zux7hpJFSpVbJLW34F+bWs=; b=46VZaKiT3uQCiROFak2p43nit3
	ZeTNXQ3Nas5JDsvqR99McV5nlC+5P6oZQrGysLA7MM2X57khNiJ0aKaQ8FGbjeZusB2/Kqpqvmg/4
	RD2+SdOnXfu+y4uSHIqdhlmN9TvQ/FDDSPcJAq1gPzggIMQgp2tN7CM73+de6LH88QGoc5HfgBJ+e
	5700DAcOhWoCDR7Dz9o9aKNO+lq9hSmQgrisurfoEvI/0fmhCI8cdwEUF597PktzYkHCnFzJ9fMba
	UA8bhSWPXIdTvejQOOn+em/DaRy+H96ZOyc/mdltwnHWQUjuVbWWXTQdFJtyF6mWqtMAW8qLzb0/s
	7FteDBZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8rPW-00000000FmO-0mFI;
	Wed, 15 Oct 2025 02:38:42 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8rPT-00000000Fkp-1yJM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 02:38:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1760495914; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=awK8T53rvm3JtUI0otLj6zux7hpJFSpVbJLW34F+bWs=;
	b=kOOXYRYIOTzZuQf+qFTy2xg5diLxSaHlHC8XKLeAzOBB0RGWE9x+NP6/Q/u8z4/Ijm6QajSGjtanzG3FGBL0/SLUL1Ktyynsyy7eSuUSSyF4W0U25kW3tej8ZHVtzkdqe7QWkRUkItkUIDM7ZT77Rrd9zbYKIbgTqyidm6i7a+8=
Received: from localhost.localdomain(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WqEOUxe_1760495898 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 15 Oct 2025 10:38:29 +0800
From: Huang Ying <ying.huang@linux.alibaba.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Huang Ying <ying.huang@linux.alibaba.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Yicong Yang <yangyicong@hisilicon.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64, mm: avoid always making PTE dirty in pte_mkwrite()
Date: Wed, 15 Oct 2025 10:37:12 +0800
Message-Id: <20251015023712.46598-1-ying.huang@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_193839_990416_91074CB1 
X-CRM114-Status: GOOD (  13.97  )
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
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Gavin Shan <gshan@redhat.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: Yicong Yang <yangyicong@hisilicon.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/include/asm/pgtable.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index aa89c2e67ebc..0944e296dd4a 100644
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
2.39.5


