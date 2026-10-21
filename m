Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F8A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 11:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DGvOH4fd;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gH4vvTMn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9m8ViHr1UqAzoBRlxS+Gxk2y8F/+VCn9YhxkhleDGiU=; b=DGvOH4fdN2tJ+tg5hv4Jxj57/c
	XGPrNoqE4aqR6BqxQWrGKIs6R5XHMIoXtJzb3leVajEhb129+MUuIOlERw3vOuALMsyDwVlFs613N
	XLdph891fOJozulIEbSd7U40KSgOk6AZUVv1XE2WRDvCQ2xJHx0pdq+QIWJCmUedejNBTlxgk7diA
	pvqzE3VMJyejEaIi/mHtcmXuVqZOraUev6PwJXOjJvLx2Hhqd/AW8Qs5oPTbOLO+tnVVcDFFywUwo
	ODN3MbvOX0O0/1Yi9ppSBTY0ixDG6xsX08Ll03IkLifZX4bnMdhmLtuDG+NX8/0NR1AzZrXIEcLlF
	Og/D5vbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJUAA-0000000Bh7s-0hXN;
	Wed, 21 Oct 2026 11:07:18 +0000
Received: from out-159.mta0.migadu.com ([2001:41d0:1004:224b::9f] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJUA3-0000000Bh5V-1X1Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 11:07:12 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=R/fPNXDyLmbkYE0kKFi9F8PpL/slnTHOsf1/K3rjOBE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792580829; v=1; x=1793185629;
 b=gH4vvTMnpIHal2aaTVQvCySxdgaV/dpT1ozBPnQkGrRgeDfn9lFZMq+uEi8xvp4n3WDBSx6S
 Jb4vqZeZOZ6jCmhcyeaKaBKnseZ/K/bmlk4p46nsn+fGy1kJ2OuMmXQqyXG05DqD9FHhRiJ/22d
 KxMCnFyrfzcpgLADa+LvLwd8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 04f5e76770af7b13;
	Wed, 21 Oct 2026 11:07:09 +0000
X-Mizu-Trace-ID: 04f5e76770af7b13
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
Subject: [PATCH v2 1/4] KVM: arm64: Clear the whole hugetlb folio when sanitising MTE tags
Date: Wed, 21 Oct 2026 12:06:57 +0100
Message-ID: <20261021110700.493315-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110700.493315-1-fuad.tabba@linux.dev>
References: <20261021110700.493315-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_040711_541391_FEE2AD50 
X-CRM114-Status: GOOD (  12.38  )
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

sanitise_mte_tags() clears the tags of the pages about to be mapped at
stage-2 before marking them tagged. For a hugetlb folio the flag covers
every page in the folio, but the loop only covers the mapping being
installed. Stage-2 maps a folio in pieces for the contiguous hugetlb
sizes, and for any size under dirty logging. The first fault then marks
the whole folio after clearing only its own piece, and the rest keeps
its previous owner's tags for the guest to read.

Clear the whole folio, as mte_sync_tags() does.

Fixes: 25c17c4b55def ("hugetlb: arm64: add mte support")
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/mmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 9ba86450fe4af..a551b6bb13c21 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1512,10 +1512,10 @@ static void sanitise_mte_tags(struct kvm *kvm, kvm_pfn_t pfn,
 	}
 
 	if (folio_test_hugetlb(folio)) {
-		/* Hugetlb has MTE flags set on head page only */
+		/* A hugetlb folio is marked tagged as a whole, so clear every page */
 		if (folio_try_hugetlb_mte_tagging(folio)) {
-			for (i = 0; i < nr_pages; i++, page++)
-				mte_clear_page_tags(page_address(page));
+			for (i = 0; i < folio_nr_pages(folio); i++)
+				mte_clear_page_tags(page_address(folio_page(folio, i)));
 			folio_set_hugetlb_mte_tagged(folio);
 		}
 		return;
-- 
2.47.3


