Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA89CD6E7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 15:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRpFMSrnr/iLFpr3AxTnop1vQjvosT9hV934gbPHDIQ=; b=ZfGqtIgfSIE945u7wlWW+6GVtF
	VTsGfSRJhqauSMzSQULgXsBDwi+JoGyYcAeznB4yq/5Gj4nDgE9e1EgnLE3WH6AuGawr3G41r0XVO
	Fz8Gugff2RNeaIStPb20ftibjFa5IJ9mVVGV9Jbif69bTnU3yMYiPy3HpZC7o7dXm9VUej70dKxYd
	lFLhAtY6r8XNnYgFLa/TTj1mVXoaHEzvH1++IPe2I8bjvHZMfJEcCWQluh04Vih3Ba7hZyNd38hxN
	4kp454NE72Fx4qtBH6hWbJijiG03TAPftvIiLTx45PWSrxCGDT8+QIr2ZJgJe+GCdEG6cQ6Gmsfdb
	uPLRtNyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWYc-00000000pcJ-04Yh;
	Fri, 05 Jun 2026 15:34:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWYW-00000000pZb-2vkj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 15:33:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3CFD3514;
	Fri,  5 Jun 2026 08:33:50 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A2CB3F86F;
	Fri,  5 Jun 2026 08:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780673635; bh=441m7hF9vzIcO70ErwNiZK/0ZfRAnsJvOJUj0/9Y5c4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SdkdPb6RA0soTPSbhVCDtw0M7wsIDbW68oFLhCdvfymY4tq2RUHgMmXzfchljredi
	 U+V9IpQSmHMZw43LPWIzi+gcJy246YXXp9WBV8o8rWSxyktpvaITufjpy+06IepF8J
	 Fvz2iUmQFo2qsYmgCxEyjAP9lXcnhSDQgKa5Xwes=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Gavin Shan <gshan@redhat.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH 2/2] KVM: arm64: Remove superfluous aligning of gfn for dirty logging
Date: Fri,  5 Jun 2026 16:32:48 +0100
Message-ID: <20260605153248.2412064-3-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605153248.2412064-1-weilin.chang@arm.com>
References: <20260605153248.2412064-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_083356_854224_F93EF326 
X-CRM114-Status: GOOD (  12.33  )
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

Stage-2 mapping size is forced to PAGE_SIZE when dirty logging is
enabled for a memslot, therefore we don't need to align it down to
a possibly larger vma size or THP adjusted size, they won't happen.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/kvm/mmu.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 06c46124d3e7..d1f6ff7c2943 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2050,13 +2050,12 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 
 	/*
 	 * Mark the page dirty only if the fault is handled successfully,
-	 * making sure we adjust the canonical IPA if the mapping size has
-	 * been updated (via a THP upgrade, for example).
+	 * mapping size is forced to PAGE_SIZE if dirty logging is enabled,
+	 * so we don't have to adjust the canonical IPA here.
 	 */
 	if (writable && !ret) {
-		phys_addr_t ipa = gfn_to_gpa(get_canonical_gfn(s2fd, s2vi));
-		ipa &= ~(mapping_size - 1);
-		mark_page_dirty_in_slot(kvm, s2fd->memslot, gpa_to_gfn(ipa));
+		gfn_t canonical_gfn = get_canonical_gfn(s2fd, s2vi);
+		mark_page_dirty_in_slot(kvm, s2fd->memslot, canonical_gfn);
 	}
 
 	if (ret != -EAGAIN)
-- 
2.43.0


