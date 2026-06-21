Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87458CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 21:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/Ryzop9cHyfud4/d7uNpvbJV5dfV4NrntLAoHfM5aDQ=; b=MyI99PHo7RgjBhbLiTH8cVyZnY
	DrOMk7vKTlB2XTOoTrDCGvGbnvK/q2xG5zFpR4OGgEn+1qm3XTRWAgfyr33KCDQpFhiNNyqCPfjrP
	FJCTwS8X8u/cJGNFBs1V+3a5WIHweKRnL93pC6W77WP2ukc+oFYdCk0spY1Bx7EqOlMnklMFqV2VD
	dPsLpBztdsuW3LCukK2XrKmqhyi6DBByHLD2MkVfTRTifCzfsXzFWZAA/vQ/GiF+pjNKfsVyKYODs
	sVUoCqGRl8EmTmvNSWnU25p9JhY2LNtRVZ7U8ERI+FZpnWAgQ2Wcy5Z8J++ajZHfWUkXS8I8bsD+B
	wdiE4y8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbPuj-00000004AoA-2676;
	Sun, 21 Jun 2026 21:41:13 +0000
Received: from confino.investici.org ([2a11:7980:1::2:0])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbPuh-00000004An6-08ge
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 21:41:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1782077522;
	bh=/Ryzop9cHyfud4/d7uNpvbJV5dfV4NrntLAoHfM5aDQ=;
	h=From:To:Cc:Subject:Date:From;
	b=CTIHjOBgmIM1IBldz7lPxD44cMRJ6LYDEn6J2SRREEKJVqH2xEkPoRjUrzS+Is18i
	 ojjobDstlMpraaUwTikYGe6DaLK1MITg/DVBKsWzLaMdiizZ5UtLZnT8nCEHyuwJxf
	 9r0QxbsiAqJdiOMtxP0LLFvPf/vaIYci/O9zCaDM=
Received: from mx1.investici.org (unknown [127.0.0.1])
	by confino.investici.org (Postfix) with ESMTP id 4gk4KZ4K5Jz10y9;
	Sun, 21 Jun 2026 21:32:02 +0000 (UTC)
Received: by mx1.investici.org (Postfix) id 4gk4KY65pSz10y6;
	Sun, 21 Jun 2026 21:32:01 +0000 (UTC)
From: Bradley Morgan <include@grrlz.net>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bradley Morgan <include@grrlz.net>
Subject: [PATCH] KVM: arm64: account pKVM reclaim against the VM mm
Date: Sun, 21 Jun 2026 21:31:55 +0000
Message-ID: <20260621213155.6019-1-include@grrlz.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_144111_218800_F80880DF 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

Protected guest faults charge long term pins to the VM's mm. Teardown
can run later from file release, where current->mm may be unrelated.

Drop the charge from kvm->mm instead.

Fixes: 4e6e03f9eadd ("KVM: arm64: Hook up reclaim hypercall to pkvm_pgtable_stage2_destroy()")
Signed-off-by: Bradley Morgan <include@grrlz.net>
---
 arch/arm64/kvm/pkvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 053e4f733e4b..428723b1b0f5 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -352,7 +352,7 @@ static int __pkvm_pgtable_stage2_reclaim(struct kvm_pgtable *pgt, u64 start, u64
 		page = pfn_to_page(mapping->pfn);
 		WARN_ON_ONCE(mapping->nr_pages != 1);
 		unpin_user_pages_dirty_lock(&page, 1, true);
-		account_locked_vm(current->mm, 1, false);
+		account_locked_vm(kvm->mm, 1, false);
 		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
 		kfree(mapping);
 	}
-- 
2.53.0


