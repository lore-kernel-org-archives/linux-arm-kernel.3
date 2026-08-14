Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46351C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 22:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NvLNxlmMyt+cxE5XosXfxUx14GRFshdQalaes2tE9kU=; b=SwIuX2vJKxOCAWvRKVqW8qfUOh
	X16KfkE/nYrMwaqSVnqTPY5ILo7EUmO8BG+60Zs3tTKUYIF3RezyK1+5SUDx+8PWk5mc0KM/Wortj
	Z5e8Foc0CTEfZI2DEBjctO7dzkLTMKYAoj/FJc6eUImYaU8s3Sxu16i5jlrZMMzmTZRy4TOG5z0Wn
	JCZuIGdFQbOBN7H2uW/v8O0uoyowUucht7TVui8l71Q3rB3h8IXe+VgJKxppPyeHmMuCpGcc6fgis
	z0CzkKXvPjopGWH/NGmw+vNRnzWhqN+fOxFJHjmZB6bBOdV5pTd5Uu7K5O2PfTWoV/JUgcNarKBT8
	IvAc1r7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv0LK-00000003GU5-3yDW;
	Fri, 14 Aug 2026 22:25:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv0LC-00000003GSf-3lZ9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 22:25:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAC6B1CDD;
	Fri, 14 Aug 2026 15:25:24 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 93FB83F632;
	Fri, 14 Aug 2026 15:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786746328; bh=W5P8QTaXkp+Wayx8mSPrX6v9guhFOjhs2fEdIvE2d+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P875o408mULJ47Elq+B1BKlLtQSMKs0kL/5VA2/wPLn+jp5uHbbdiUQJA1T3Ko90A
	 t8UttLJy2+zW+9H8GIUZdEB2BXXm3ytXaXMZ7PfEUryUDv4BD7t6HlVToJ0P+GUjGZ
	 aWEjVrr9leBaf+80MjWemSkbyIGa8ZOJK8rSFGQM=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Matt Fleming <matt@codeblueprint.co.uk>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v3 1/2] arm64: ptdump: Make note_page_flush() range aware
Date: Fri, 14 Aug 2026 23:24:57 +0100
Message-ID: <20260814222458.584906-2-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814222458.584906-1-weilin.chang@arm.com>
References: <20260814222458.584906-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_152533_045788_D641AA85 
X-CRM114-Status: GOOD (  17.77  )
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

note_page_flush() calls note_page() with addr == 0 and level == -1 to
dump the last row of a ptdump. addr == 0 (1 << 64 wrapped around)
renders a huge region with enormous size for address spaces with
IA bits < 64. For example the stage-2 page tables and the EFI runtime
page table.

More importantly, the last region of the address space and everything
after the address space up to 1 << 64 are merged into one row of
output. If the last region within the address space is valid, it will
appear to remain valid up to 1 << 64 with the same attributes.

Currently only the EFI runtime ptdump is affected by this, but KVM will
soon fix its stage-2 ptdump by using note_page_flush(). Here is an
example of an EFI runtime ptdump (last row):

0x0000008000000000-0x0000000000000000   17179868672G PGD

With this patch:

0x0000008000000000-0x0001000000000000      261632G PGD

To fix this, cache the end address of a ptdump in ptdump_pg_state so
note_page_flush() can call the final note_page() with the correct end
address.

Fixes: 9d80448ac92b ("efi/arm64: Add debugfs node to dump UEFI runtime page tables")
Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/include/asm/ptdump.h |  2 ++
 arch/arm64/mm/ptdump.c          | 14 +++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
index 5b374a6ab34a..1b743de7d89e 100644
--- a/arch/arm64/include/asm/ptdump.h
+++ b/arch/arm64/include/asm/ptdump.h
@@ -52,6 +52,8 @@ struct ptdump_pg_state {
 	const struct addr_marker *marker;
 	const struct mm_struct *mm;
 	unsigned long start_address;
+	/* exclusive end, ULONG_MAX represents an end at 1 << 64 */
+	unsigned long end_address;
 	int level;
 	ptval_t current_prot;
 	bool check_wx;
diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
index 1c20144700d7..eab400e744d9 100644
--- a/arch/arm64/mm/ptdump.c
+++ b/arch/arm64/mm/ptdump.c
@@ -278,9 +278,19 @@ void note_page_pgd(struct ptdump_state *pt_st, unsigned long addr, pgd_t pgd)
 
 void note_page_flush(struct ptdump_state *pt_st)
 {
+	struct ptdump_pg_state *st = container_of(pt_st, struct ptdump_pg_state, ptdump);
+	unsigned long end = st->end_address;
 	pte_t pte_zero = {0};
 
-	note_page(pt_st, 0, -1, pte_val(pte_zero));
+	/*
+	 * Address spaces that end at 1 << 64 have end_address == ULONG_MAX,
+	 * but note_page() expects the exclusive end. In this case adjust end
+	 * to the wraparound value 0.
+	 */
+	if (end == ULONG_MAX)
+		end = 0;
+
+	note_page(pt_st, end, -1, pte_val(pte_zero));
 }
 
 static void arm64_ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm)
@@ -303,6 +313,7 @@ void ptdump_walk(struct seq_file *s, struct ptdump_info *info)
 		.marker = info->markers,
 		.mm = info->mm,
 		.pg_level = &kernel_pg_levels[0],
+		.end_address = end,
 		.level = -1,
 		.ptdump = {
 			.note_page_pte = note_page_pte,
@@ -344,6 +355,7 @@ bool ptdump_check_wx(void)
 			{ -1, NULL},
 		},
 		.pg_level = &kernel_pg_levels[0],
+		.end_address = ~0UL,
 		.level = -1,
 		.check_wx = true,
 		.ptdump = {
-- 
2.43.0


