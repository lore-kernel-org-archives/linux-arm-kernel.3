Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97612C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 18:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5DZjgsXrVV7J1MjC9UJvb5nNE8HtIYyL02VyYDZjKo=; b=sFCAzUrN5odjtxy0Du6afGB0IQ
	LdAE22w1+FpCZBGowK/6F+myMUrNbl0bWVang2cS/Y/VDwEp1dJrCTjQT1R+RqcToWIyJc0zdFpAN
	kb0vWagz7ZW+4PmCb1bFQIRGPv8bxdFqylgy6MxxH+cBDqtHWElblsilQXayPH0cTCf8mf4YFwaja
	btLH9+z/K3RM8f3NzUTtnLT98BJ+iVoUgEKpPAjw4D+9narxgc+6pgWEXfJhhXfq5hith7S0addbw
	cno2AuG2H+L0nt5HPYv3fXFanREG25egWc4QVlejqUpZmgKDcTgJjW978xpdynkXRLiPYmpUWuETQ
	U5hUOUjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnL2u-0000000H6E0-44vZ;
	Fri, 24 Jul 2026 18:54:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnL2s-0000000H6DJ-3vZr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 18:54:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAA761477;
	Fri, 24 Jul 2026 11:54:47 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FDBC3F66F;
	Fri, 24 Jul 2026 11:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784919291; bh=Q1VDWNE3+I+GnOSFyuDonVkxr0L9zZfgPrVh56WS1Qk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g9Vf+KnTliDRWqJjoKnA+b5v6XKx7QBT+pJsfwfjJ+ysReEdEXy0X5qYYLI3BkmBu
	 fmS1+8R7aREni5OTtvOScazpwKh1LUJMB6u5QPQFp9bCQavu2TclJ0zXHxZizvcwiY
	 qzESB4GmQv2eAdc0IxLtZmmwUFFVFUu1aJL6ux4w=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Matt Fleming <matt@codeblueprint.co.uk>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v2 1/2] arm64: ptdump: Make note_page_flush() range aware
Date: Fri, 24 Jul 2026 19:54:30 +0100
Message-ID: <20260724185431.2990395-2-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724185431.2990395-1-weilin.chang@arm.com>
References: <20260724185431.2990395-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_115455_162391_0897D438 
X-CRM114-Status: GOOD (  16.74  )
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

To fix this, use ptdump_state.range[] to figure out where the address
space ends, and call note_page() with that.

Fixes: 9d80448ac92b ("efi/arm64: Add debugfs node to dump UEFI runtime page tables")
Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/mm/ptdump.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
index 1c20144700d7..5b34060ceb96 100644
--- a/arch/arm64/mm/ptdump.c
+++ b/arch/arm64/mm/ptdump.c
@@ -278,9 +278,24 @@ void note_page_pgd(struct ptdump_state *pt_st, unsigned long addr, pgd_t pgd)
 
 void note_page_flush(struct ptdump_state *pt_st)
 {
+	const struct ptdump_range *range = pt_st->range;
+	unsigned long end = 0;
 	pte_t pte_zero = {0};
 
-	note_page(pt_st, 0, -1, pte_val(pte_zero));
+	while (range->start != range->end) {
+		end = range->end;
+		range++;
+	}
+
+	/*
+	 * Address spaces that end at 1 << 64 have range->end == ULONG_MAX,
+	 * but note_page() expects the exclusive end. In this case adjust end
+	 * to the wraparound value 0.
+	 */
+	if (end == ULONG_MAX)
+		end = 0;
+
+	note_page(pt_st, end, -1, pte_val(pte_zero));
 }
 
 static void arm64_ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm)
-- 
2.43.0


