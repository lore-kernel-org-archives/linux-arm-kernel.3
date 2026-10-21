Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51C8606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 11:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=34Luz3gW;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eWdl5Unh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/Lx6DShk9reJacpbaAFxTHNuqC347ivhuY9XrUZ9h1Q=; b=34Luz3gWb4dq/hP+F08OCOTAHZ
	J4L34CcLNKpNZrwf/FQT927Mz0lxRdplyHaogSuZEs4H8W+fm6FLE8W23gevfkZPPHyfePVvMJh9D
	verrnNl7WDVnXqPfyzSRJyMZifN3gJSu3Ly6te65mfId6I+fBH+HmR7yPX4Q1xWhpZ+6XqF+l6JeK
	amL+Yvzg9gK9OHoeyMYzDYvkmMJu3cSWccoJ+1VTBJg8D+B9ouGZYX8jJCex+Qe5oBMyvKUk1bQOI
	ql8a22USyl4f50GjiGL73dIwouKySGIJ5ZRa1J8pMWroxNYo4xKS1qgC77uFPnE4RLSTD6Hhgbh2/
	fk+RyMWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJUA4-0000000Bh5t-0JoM;
	Wed, 21 Oct 2026 11:07:12 +0000
Received: from out-147.mta0.migadu.com ([2001:41d0:1004:224b::93] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJU9z-0000000Bh5C-3UJA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 11:07:10 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=S4bD+01K5/KhrqQzm+KUd+2uczOY+o8D7HdNxOh0FzY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792580825; v=1; x=1793185625;
 b=eWdl5Unh0QbJSum1DTWrzU1OMHs8bda11JkV+h6l6Da8OvokmBxGo1PhZy5KN67+4V2/I4kY
 gNhAOMFoznERIl+V2tAzu0/supNaU3ILKAUx1Wz+Zuih7ZCLE1vtzbJGvEsORoi33IUlAE7fvij
 4pxhHsCB0gsJvE5KAcf2PMCM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b5ddc05ed2452df9;
	Wed, 21 Oct 2026 11:07:04 +0000
X-Mizu-Trace-ID: b5ddc05ed2452df9
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
Subject: [PATCH v2 0/4] KVM: arm64: Fix stale MTE tags reaching a guest
Date: Wed, 21 Oct 2026 12:06:56 +0100
Message-ID: <20261021110700.493315-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_040709_273645_34F25AD2 
X-CRM114-Status: GOOD (  10.54  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi folks,

Changes since v1 [1]:
  - Added patch 4, mte_clear_folio_tags(). (Lorenzo)
  - Moved patch 3's sanitise_mte_tags() call into the
    kvm_pgtable_stage2_map() branch. (Lorenzo)
  - Patch 1 loops with folio_page() rather than reusing page, and its
    comment now matches patch 2's. (Lorenzo)
  - Collected Reviewed-by from Lorenzo on patches 1-3. (thanks!)

Three fixes for hugetlb and THP pages that reach an MTE guest without
their tags cleared, so the guest can read whatever tags the pages'
previous owners left.

The first clears the whole of a hugetlb folio before marking it tagged,
rather than only the pages being mapped. The second does the same when
KVM_ARM_MTE_COPY_TAGS copies tags into a page. The third sanitises when
a permission fault installs a THP block, and runs the VM_MTE_ALLOWED
check on permission faults too. A VMM that maps guest memory with
PROT_MTE isn't affected, as faulting that memory into its mapping clears
the tags first. QEMU and kvmtool map it without.

The fourth is a cleanup: it factors out the first two patches'
folio-clearing loop into mte_clear_folio_tags(), which mte_sync_tags()
now uses too.

I have a reproducer that reads the previous owner's tag from 511 of 512
pages in each case. With this series applied, it reads none.

Based on Linux 7.3-rc3 (fd73f4a665989; also applies to kvmarm/next
dd0bc00e3e920 with a three-way merge).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261019132103.3836646-1-fuad.tabba@linux.dev/

Fuad Tabba (4):
  KVM: arm64: Clear the whole hugetlb folio when sanitising MTE tags
  KVM: arm64: Clear the whole hugetlb folio when storing MTE tags
  KVM: arm64: Sanitise MTE tags when a permission fault installs a
    mapping
  arm64: mte: Add mte_clear_folio_tags()

 arch/arm64/include/asm/mte.h |  4 ++++
 arch/arm64/kernel/mte.c      | 15 ++++++++++-----
 arch/arm64/kvm/guest.c       | 11 +++++++----
 arch/arm64/kvm/mmu.c         | 13 ++++++-------
 4 files changed, 27 insertions(+), 16 deletions(-)


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.47.3


