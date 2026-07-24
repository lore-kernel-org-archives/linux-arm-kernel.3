Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFB0C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 18:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+gyefTDHze83vTZZVF5DyH/4vcAjZXsgfq21q/M7VE=; b=NkRV91Vx0W6uEKe/RIbLv+XQn7
	XZfG8QbNQWY4n3XxKRX7hqp8RzEkO5v3MbTnlvrNh68b3IBWmanomq06It+60bASZwJb6fyAKC442
	MomaYBulDhrh0cDt6/XssJFD2551obooqdI0IpOtOOvLxVebS8PY7/UOQcU8ZiAU7n4Aq3cwM663C
	djLDp+NJkUFrdGQBLRcukVMs3zF+zS3hBV6h1g1IF1Fr17JpTVwla+151/Cbu3kntGPrkc11wYUg6
	MagnQOM3tvMgYUrd+PsKergdApoShzz1Wl1v1VxqmYsW3KzWYF2t5u2pN15CoM5+HhsTczeSjSWpA
	cSyN7FPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnL37-0000000H6HO-0kJv;
	Fri, 24 Jul 2026 18:55:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnL2v-0000000H6EY-42K2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 18:54:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1B581684;
	Fri, 24 Jul 2026 11:54:51 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5144A3F66F;
	Fri, 24 Jul 2026 11:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784919295; bh=gSfRHphoobs3FjVjS72N5dOppPN+9Oy9JjWdfUQiYk4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QM5RKC8Q7q4tqPKjgYKjRsAe2jI1PdkmQIBw7RbVKHBLKyYmVw4u6JC3c7a6W8tHv
	 HF87AYKM3MGaAR23HBposi+OkYcSeemna1ANgGsrx39+1UeMKXOcGePa5yc5zIOaPT
	 OdHgbGZah4bVcJiRL2J2PyCbxM5dW0CfnsbafQ4I=
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
	Wei-Lin Chang <weilin.chang@arm.com>,
	Sashiko AI <sashiko-bot@kernel.org>
Subject: [PATCH v2 2/2] KVM: arm64: ptdump: Flush the last region
Date: Fri, 24 Jul 2026 19:54:31 +0100
Message-ID: <20260724185431.2990395-3-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724185431.2990395-1-weilin.chang@arm.com>
References: <20260724185431.2990395-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_115458_155365_8D476E32 
X-CRM114-Status: GOOD (  14.25  )
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
expects ptdump_state.range[] to be initialized to the range of the
address space, so also do that.

Also change the second marker's start address to ULONG_MAX so we never
cross it. This avoids dumping redundant marker names (which are NULL),
and advancing beyond the end of the marker array.

Fixes: 7c4f73548ed1 ("KVM: arm64: Register ptdump with debugfs on guest creation")
Reported-by: Sashiko AI <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/kvmarm/20260630122758.891011F00A3A@smtp.kernel.org/
Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/kvm/ptdump.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
index c9140e22abcf..222577163d2b 100644
--- a/arch/arm64/kvm/ptdump.c
+++ b/arch/arm64/kvm/ptdump.c
@@ -130,7 +130,7 @@ static struct kvm_ptdump_guest_state *kvm_ptdump_parser_create(struct kvm_s2_mmu
 	}
 
 	st->ipa_marker[0].name		= "Guest IPA";
-	st->ipa_marker[1].start_address = BIT(pgtable->ia_bits);
+	st->ipa_marker[1].start_address = ULONG_MAX;
 
 	st->mmu				= mmu;
 	return st;
@@ -148,18 +148,26 @@ static int kvm_ptdump_guest_show(struct seq_file *m, void *unused)
 		.flags	= KVM_PGTABLE_WALK_LEAF,
 	};
 
+	guard(write_lock)(&kvm->mmu_lock);
 	st->parser_state = (struct ptdump_pg_state) {
 		.marker		= &st->ipa_marker[0],
 		.level		= -1,
 		.pg_level	= &st->level[0],
 		.seq		= m,
+		.ptdump		= {
+			.range = (struct ptdump_range[]){
+				{0, BIT(mmu->pgt->ia_bits)},
+				{0, 0}
+			}
+		}
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


