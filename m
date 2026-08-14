Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFB1C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 22:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Je66kw0pNK9aSTrwgQU7ly8ymAlz8+O4h7IS2R9j9WI=; b=AhOp8zsLHq5fqggfSdHlmHn/R5
	9HtkUFj2IC7jLpLmFGCmqCydIcQ4w/jT4/7ubEBEjO3cxbCaXOISBR+OvdM2z+/ppCzLN2El58Ogy
	s8+cDFvmpll/munLveYfkpHVJUJmSAVNTL3RRCIaiqFpCyQAkEyX9fPsmnsblom2eZuCV6hU0w2KC
	h/byDfTuIHlLPAsVmR8IB1Dg5h4SqTS2GaY2EexKrtU+qE+sGIl0G+81SVmZ420THjoNGlYqO8kbR
	By94DvGxXYnQzaRmexLMMjQwGdrYmb7csycfDmFhu5aPJH1qBBvcyqGvNNDnMWmvFo/uz5ryVS0Ha
	WR//4ulA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv0LL-00000003GUP-0H4e;
	Fri, 14 Aug 2026 22:25:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv0LG-00000003GTK-29If
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 22:25:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 947F71BCA;
	Fri, 14 Aug 2026 15:25:28 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27B533F632;
	Fri, 14 Aug 2026 15:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786746332; bh=cp6X2PC6hanfxlcfE8eqlqn45EQleE/ymqq4QgCE/js=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DswiL5BbdZ11TQuaCVj/2Ttu/yRoBmOzYsrGG+J87q8kO1QG0k4D1gECni9Fk5gnp
	 E6aMO2f2parjbXOfO8uutwt0oX5wXYYYQBeicWUj0eTZJ2Tq0BOjPlYNccLdIiKlVC
	 eqfEr6Dekto5DIjL/AaCCI+KqE79GCigeyWhto58=
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
	Wei-Lin Chang <weilin.chang@arm.com>,
	Sashiko AI <sashiko-bot@kernel.org>
Subject: [PATCH v3 2/2] KVM: arm64: ptdump: Flush the last region
Date: Fri, 14 Aug 2026 23:24:58 +0100
Message-ID: <20260814222458.584906-3-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814222458.584906-1-weilin.chang@arm.com>
References: <20260814222458.584906-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_152534_642357_96BD8962 
X-CRM114-Status: GOOD (  13.72  )
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

Call note_page_flush() to dump the final region. note_page_flush()
uses ptdump_pg_state.end_address to call the final note_page(), so also
provide the end address.

Also change the second marker's start address to ULONG_MAX so we never
cross it. This avoids dumping redundant marker names (which are NULL),
and advancing beyond the end of the marker array.

Fixes: 7c4f73548ed1 ("KVM: arm64: Register ptdump with debugfs on guest creation")
Reported-by: Sashiko AI <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/kvmarm/20260630122758.891011F00A3A@smtp.kernel.org/
Reviewed-by: Dev Jain <dev.jain@arm.com>
Tested-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/kvm/ptdump.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
index c9140e22abcf..69899797dbad 100644
--- a/arch/arm64/kvm/ptdump.c
+++ b/arch/arm64/kvm/ptdump.c
@@ -130,7 +130,7 @@ static struct kvm_ptdump_guest_state *kvm_ptdump_parser_create(struct kvm_s2_mmu
 	}
 
 	st->ipa_marker[0].name		= "Guest IPA";
-	st->ipa_marker[1].start_address = BIT(pgtable->ia_bits);
+	st->ipa_marker[1].start_address = ULONG_MAX;
 
 	st->mmu				= mmu;
 	return st;
@@ -148,18 +148,21 @@ static int kvm_ptdump_guest_show(struct seq_file *m, void *unused)
 		.flags	= KVM_PGTABLE_WALK_LEAF,
 	};
 
+	guard(write_lock)(&kvm->mmu_lock);
 	st->parser_state = (struct ptdump_pg_state) {
 		.marker		= &st->ipa_marker[0],
+		.end_address	= BIT(mmu->pgt->ia_bits),
 		.level		= -1,
 		.pg_level	= &st->level[0],
 		.seq		= m,
 	};
 
-	write_lock(&kvm->mmu_lock);
 	ret = kvm_pgtable_walk(mmu->pgt, 0, BIT(mmu->pgt->ia_bits), &walker);
-	write_unlock(&kvm->mmu_lock);
+	if (ret)
+		return ret;
+	note_page_flush(&st->parser_state.ptdump);
 
-	return ret;
+	return 0;
 }
 
 static int kvm_ptdump_guest_open(struct inode *m, struct file *file)
-- 
2.43.0


