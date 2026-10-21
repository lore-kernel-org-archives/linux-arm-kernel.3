Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE69606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 11:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pN35+taM;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sciekYSj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/Sb0nePo52l0p+fSi/XZuFjwRAlWL1aHJZwdIky6to=; b=pN35+taMxtlhaicC6Dzw8b8p7J
	AB73f6UcQ7LR4renr8JsJEAlM4AL3poN/oXRaXkTwD3cyRANNK5C9N0q5LITPUc9QE4h95sii9WWa
	BWleiJL47NrwIHvF8Gx4hJzP+GxqY08Yz3dHDl9FBPaNZjYMsEKH0ZyWTi1+1sIfVZbMMtxutxMf2
	OT3O0wl3k3chCcelGzw9Zm2tYi7oTiEDU+dU35+zRRDao/i0IiO92SLo9Vte7QEgpWp0/ewmBcX9n
	/dQSX+LeRAiB0QDSOIxbrops9t84fjOYD8CyV7+LrraZrzTBB2gawgl4AagIkIXlYUPqoi8b1FqUn
	+gofAJ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJUAA-0000000Bh8A-1Cdp;
	Wed, 21 Oct 2026 11:07:18 +0000
Received: from out-160.mta0.migadu.com ([2001:41d0:1004:224b::a0] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJUA5-0000000Bh5p-22bU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 11:07:15 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=crnCwJrJSeAJKv/UwSU/fESmAVujZiBl8NwghS4U/as=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792580831; v=1; x=1793185631;
 b=sciekYSjR18yZi0uEjdtijIOzXM8G31v9lxfN9fih2idqe51jbojFfQXwwBjq3wscXC62dHA
 Zn5HrBdrRLc/hEd/tcwmyH0KfgRqbOKVmZ6+2HsyZYCivalQ0GhMt+YbMoobFH4RSvQhR/k1uu7
 FqO8l0xaYQnURiWczo+OOM7g=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 5b317a989263a742;
	Wed, 21 Oct 2026 11:07:11 +0000
X-Mizu-Trace-ID: 5b317a989263a742
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
	Lorenzo Stoakes <ljs@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] KVM: arm64: Clear the whole hugetlb folio when storing MTE tags
Date: Wed, 21 Oct 2026 12:06:58 +0100
Message-ID: <20261021110700.493315-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110700.493315-1-fuad.tabba@linux.dev>
References: <20261021110700.493315-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_040714_321002_31F7697C 
X-CRM114-Status: GOOD (  13.84  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When KVM_ARM_MTE_COPY_TAGS copies tags into a page, it marks the page as
tagged. For a hugetlb folio the flag covers every page in the folio. If
the folio wasn't tagged yet, its other pages are marked as tagged with
their previous owner's tags still in place. The stage-2 fault path then
maps them into the guest without clearing them. The ioctl's read side
also copies them out to the VMM.

Clear the whole folio on its first tagging, before copying in this
page's tags.

Fixes: 25c17c4b55def ("hugetlb: arm64: add mte support")
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
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


