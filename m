Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CFBCCF2E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 13:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E6yGq7V9WNP5jnj4ea6gkxnjalqm1DN5Qr1ozvD3+DA=; b=zL00UapbA5ck79HKEJ/BXH3LhA
	1vRHKD//oOTmTq0CckloIT/4H+CkxE81B2tYGpEyJcC8RueLBKCEq15EoChxFHMR5NdAekUjZ0aaY
	6MpVjVfmML9CEDRCZRZfi+LurEMlBwt+G9aXAHThM0sfwgHiE0Rgp8L6gB+sf0sD16DNaShJhFWw6
	V4oDUEU94gvLiq3jyoIh2vhSZq80Bd9qg9c9w/vUcjfxUW3PMraBK1zgO67F7p35mOC0CS+dhAeWi
	rFJ9bkokprDjfUBcafzsTDNwNi6jvZ3N/uEchTf5pznxNhHW2zEpRpFXw93kKiQXf/oCZtcQWVTh8
	4bwoHenA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInIs-00000007Uvr-0KNr;
	Mon, 19 Oct 2026 13:21:26 +0000
Received: from out-166.mta0.migadu.com ([2001:41d0:1004:224b::a6] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInIk-00000007Ut0-0uML
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 13:21:19 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Ww+r+o4/7dyPQTMz8pAy9hMNzw+4oyPYtc7UMkTUyD8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792416076; v=1; x=1793020876;
 b=TK3YWf0jkioYFAtNlIsw71RiN7/dj33Vpy5fc28k21OiXX8ihe1nBZ2WqIS59xzWdw0uoGyX
 Nu/vSD1iF+t6Mh3JnYsgDpleATOasp0uYcgmeU/cjgnAt6DkHNEdQIIm/KzvuBqnb7RYYFvLdw7
 Bt87F3oOn1BjQOMtxvBmTv4w=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 409a3763f14ff9d2;
	Mon, 19 Oct 2026 13:21:16 +0000
X-Mizu-Trace-ID: 409a3763f14ff9d2
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
Subject: [PATCH 2/3] KVM: arm64: Clear the whole hugetlb folio when storing MTE tags
Date: Mon, 19 Oct 2026 14:21:02 +0100
Message-ID: <20261019132103.3836646-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019132103.3836646-1-fuad.tabba@linux.dev>
References: <20261019132103.3836646-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_062118_410578_5415E23E 
X-CRM114-Status: GOOD (  13.77  )
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

When KVM_ARM_MTE_COPY_TAGS copies tags into a page, it marks the page as
tagged. For a hugetlb folio the flag covers every page in the folio. If
the folio wasn't tagged yet, its other pages are marked as tagged with
their previous owner's tags still in place. The stage-2 fault path then
maps them into the guest without clearing them. The ioctl's read side
also copies them out to the VMM.

Clear the whole folio on its first tagging, before copying in this
page's tags.

Fixes: 25c17c4b55def ("hugetlb: arm64: add mte support")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/guest.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index b01d6622b8720..cda655fbff657 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -1012,6 +1012,7 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
 		void *maddr;
 		unsigned long num_tags;
 		struct folio *folio;
+		unsigned long i;
 
 		if (!page) {
 			ret = -EFAULT;
@@ -1042,12 +1043,14 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
 			/*
 			 * Only locking to serialise with a concurrent
 			 * __set_ptes() in the VMM but still overriding the
-			 * tags, hence ignoring the return value.
+			 * tags. A hugetlb folio is marked tagged as a whole,
+			 * so its first tagging clears every page.
 			 */
-			if (folio_test_hugetlb(folio))
-				folio_try_hugetlb_mte_tagging(folio);
-			else
+			if (!folio_test_hugetlb(folio))
 				try_page_mte_tagging(page);
+			else if (folio_try_hugetlb_mte_tagging(folio))
+				for (i = 0; i < folio_nr_pages(folio); i++)
+					mte_clear_page_tags(page_address(folio_page(folio, i)));
 			num_tags = mte_copy_tags_from_user(maddr, tags,
 							MTE_GRANULES_PER_PAGE);
 
-- 
2.47.3


