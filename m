Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09676CCF2DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 13:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqdBAXlXpWzw7ERLhYAdLnEW9JCfWQgyrHUc39GuaIU=; b=uSMs0KGn3UmwKMLUUlu+fRP4vx
	EyRQeCVUVH3gwl2sjCeS4byPoqjwDjQUytIZOYBdesx9lpRRpn3HWX9vWSLbZaaJT8wFC+EEvvayy
	4Eby3509FCiI+eDG+LfZRor08lvojArboW2lyFWygJDUqMhM9fz5KnPg8If8bc3xLpcppOQbvec4O
	jCpFXLM/0B+BwXLYq0qr/yh4wbL4XH6hZBF3Gs33YkfeAencGkefx8sK+16gY4bWIJTDxNyjU9O3K
	sidHpB8tT3j5ERDHfUxg1ynOrxD/GHxV1o7fiKexQO15h72uYdTTHXHtyWxGo3HRhyChS67UkWYkP
	aOHdxFbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInIm-00000007Utz-1Wzq;
	Mon, 19 Oct 2026 13:21:20 +0000
Received: from out-163.mta0.migadu.com ([2001:41d0:1004:224b::a3] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInIf-00000007UsD-3aqP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 13:21:15 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=5fJGL4C4mMNi8vcFoFABt8pOi03qIUjPdJtacS8L23s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792416071; v=1; x=1793020871;
 b=C6MXiTZ2RIKcR4M0KOxR0qb5p/hnqWSTNcd7WWQwqdEt6paMSjAL32qaZu4665ERJD9e0zWU
 7ltWn81gDKFRu9ovoQrHrFtTEqi+F5XcQTACOgEZDgphPNXkPRLEI8gKG6bfutCoWj1xeXvuITM
 GpfMHmDbCpnnpBnEfCcaeig4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e803656b720e69e6;
	Mon, 19 Oct 2026 13:21:11 +0000
X-Mizu-Trace-ID: e803656b720e69e6
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Steven Price <steven.price@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	David Hildenbrand <david@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] KVM: arm64: Clear the whole hugetlb folio when sanitising MTE tags
Date: Mon, 19 Oct 2026 14:21:01 +0100
Message-ID: <20261019132103.3836646-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019132103.3836646-1-fuad.tabba@linux.dev>
References: <20261019132103.3836646-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_062114_039594_06718D90 
X-CRM114-Status: GOOD (  12.00  )
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

sanitise_mte_tags() clears the tags of the pages about to be mapped at
stage-2 before marking them tagged. For a hugetlb folio the flag covers
every page in the folio, but the loop only covers the mapping being
installed. Stage-2 maps a folio in pieces for the contiguous hugetlb
sizes, and for any size under dirty logging. The first fault then marks
the whole folio after clearing only its own piece, and the rest keeps
its previous owner's tags for the guest to read.

Clear the whole folio, as mte_sync_tags() does.

Fixes: 25c17c4b55def ("hugetlb: arm64: add mte support")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/mmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 9ba86450fe4af..48a08b608ea72 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1514,7 +1514,8 @@ static void sanitise_mte_tags(struct kvm *kvm, kvm_pfn_t pfn,
 	if (folio_test_hugetlb(folio)) {
 		/* Hugetlb has MTE flags set on head page only */
 		if (folio_try_hugetlb_mte_tagging(folio)) {
-			for (i = 0; i < nr_pages; i++, page++)
+			page = folio_page(folio, 0);
+			for (i = 0; i < folio_nr_pages(folio); i++, page++)
 				mte_clear_page_tags(page_address(page));
 			folio_set_hugetlb_mte_tagged(folio);
 		}
-- 
2.47.3


