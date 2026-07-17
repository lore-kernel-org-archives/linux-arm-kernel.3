Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09E1C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 23:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SPnC5WVTIHOnEj+RAA+nTpokEosy532PowuwrEoM/KU=; b=boxj7Og6u+lPs9W5g9NA2m4SqI
	dgSoLQ7z0LyBx7PsCR6mK7FCmewXxivdMqlrmWSZbkWVEUju1+HcUTia+XiVd/CATSPHVErXi0nBP
	C1K6yYRTtK54YP+Kp3YaVUVXu91kZITkhwzUbakCBFvuzHUICJ2rDSajO1QLW6/+wuZfoa9PN4dcg
	xPWo4Mm3tE5iIVn//TmlzZV7d7vg/hjZwsnmkeCYG3IkhSb6jiwnkcAkRLe/bOIlKCWN284gZMYXj
	Xqs6V7+QEgsJJBsoPbylQgiAO5QK3W/XXYeTcBLggzxusnI/Vk8t3HTYK0xUDTyaK4wOY/gXNMiCi
	4IdCOceA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkrkD-00000003NqC-1uly;
	Fri, 17 Jul 2026 23:13:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkrkA-00000003NpX-0Knn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 23:13:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 861851476;
	Fri, 17 Jul 2026 16:13:13 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EDF783F66F;
	Fri, 17 Jul 2026 16:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784329997; bh=3BlVjgmV5uha5Hv39vi3jBRXCmFZY73SrcLqw6/9YjM=;
	h=From:To:Cc:Subject:Date:From;
	b=MrG2RBy/Fb9HTHfDKyEJEEWtqIgzwZwHsP2O0U+aMZ70wHOhQdusEBocp3HC1ZIDn
	 2Uv0rWgc/CndtB/MaFd/d6FaXjhyP4lt7QBFsmdREZtL2ztY86WIEzi+3ye7n+HkJM
	 SM96L9nvLBq35DJrPUDZ0YWZvqwEPKc5j+CWqRcQ=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH] KVM: arm64: ptdump: Flush the last region
Date: Sat, 18 Jul 2026 00:12:33 +0100
Message-ID: <20260717231233.2299068-1-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_161322_285109_4489BF3E 
X-CRM114-Status: GOOD (  14.87  )
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

Currently the stage-2 ptdump calls note_page() at each leaf entry visit.
This simply misses the output of the last region, because note_page()
only dumps output when it detects a change in level/prot, or when the
walk enters a next marker section. The last region in the guest IPA
space with the same level/prot is not dumped since there is no change
after it.

To dump the final region, manually issue a note_page() call with address
BIT(ia_bits) (end of guest IPA space) and level == -1 to trigger a level
change after the last region. Additionally treat level == -1 as a last
flushing note_page() call and avoid dumping the name of the next marker
for this case.

Fixes: 7c4f73548ed1 ("KVM: arm64: Register ptdump with debugfs on guest creation")
Reported-by: Sashiko AI <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/kvmarm/20260630122758.891011F00A3A@smtp.kernel.org/
Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/kvm/ptdump.c | 8 +++++---
 arch/arm64/mm/ptdump.c  | 5 +++--
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
index c9140e22abcf..4096e4a92fae 100644
--- a/arch/arm64/kvm/ptdump.c
+++ b/arch/arm64/kvm/ptdump.c
@@ -155,11 +155,13 @@ static int kvm_ptdump_guest_show(struct seq_file *m, void *unused)
 		.seq		= m,
 	};
 
-	write_lock(&kvm->mmu_lock);
+	guard(write_lock)(&kvm->mmu_lock);
 	ret = kvm_pgtable_walk(mmu->pgt, 0, BIT(mmu->pgt->ia_bits), &walker);
-	write_unlock(&kvm->mmu_lock);
+	if (ret)
+		return ret;
+	note_page(&st->parser_state.ptdump, BIT(mmu->pgt->ia_bits), -1, 0);
 
-	return ret;
+	return 0;
 }
 
 static int kvm_ptdump_guest_open(struct inode *m, struct file *file)
diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
index ab9899ca1e5f..fed4e4407e0e 100644
--- a/arch/arm64/mm/ptdump.c
+++ b/arch/arm64/mm/ptdump.c
@@ -194,6 +194,7 @@ void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
 	struct ptdump_pg_state *st = container_of(pt_st, struct ptdump_pg_state, ptdump);
 	struct ptdump_pg_level *pg_level = st->pg_level;
 	static const char units[] = "KMGTPE";
+	bool flush = level == -1;
 	ptdesc_t prot = 0;
 
 	/* check if the current level has been folded dynamically */
@@ -234,7 +235,7 @@ void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
 				  pg_level[st->level].num);
 		pt_dump_seq_puts(st->seq, "\n");
 
-		if (addr >= st->marker[1].start_address) {
+		if (addr >= st->marker[1].start_address && !flush) {
 			st->marker++;
 			pt_dump_seq_printf(st->seq, "---[ %s ]---\n", st->marker->name);
 		}
@@ -244,7 +245,7 @@ void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
 		st->level = level;
 	}
 
-	if (addr >= st->marker[1].start_address) {
+	if (addr >= st->marker[1].start_address && !flush) {
 		st->marker++;
 		pt_dump_seq_printf(st->seq, "---[ %s ]---\n", st->marker->name);
 	}
-- 
2.43.0


