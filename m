Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3898F606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 07:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zZIZinSz;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MbMaG9T5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xAxX/hOOVgl9MP4qMrRYqYmI6pYWtxVRbAVic/Kn+0I=; b=zZIZinSzHEaAQA
	rnZTVNNL8ucf5T4VlRbuThM84qJTZV8FIDuPet6ZGQ6ZFEQTmmE3GxEfAnWPEy562Td9fvaO+M/zo
	O8QdFtfMCCXWKkgliPXAB8JAXUwjTkNB5nqlgD0e+CUMBhMuWCy4AQQUwBte+y+3uuaiF6vi4IOZD
	Nxu6e3ei5tC81j3WlJDdbOuuXqje/IBPVAnydM1evrjdEpgnTN350UvWA/CX3kTo/yxliF2iSyGF+
	iwaJp7kp16eUuPYNUBwCqMrDQoA830ptAmJnkUvdIKf5bIJNSaAv0DSXN8jVLNl4CFFuT4KG/KfAn
	UABt3dYCz3vgZkdsmFag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsKd-000000083sg-1u2j;
	Thu, 05 Nov 2026 07:56:23 +0000
Received: from out-140.mta1.migadu.com ([95.215.58.140] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsKV-000000083qG-3FFS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 07:56:19 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=qVD1PACKjTczzGaztvFKYuRGh7H3JFoR6xRbscqjfaA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793865373; v=1; x=1794470173;
 b=MbMaG9T5UXK30o8GXml7xw621m+pew8SJ24tmEZAQ9lcD/0xMidgs8V7BCqGrIy7eWJ6+Dsf
 euApyX5L0zFg9K1CYK17dEjPSwcq1MHcDogUkgKs7Imt2GEreaH6fxgMt5N4efECoqTGJjbj0Lx
 xMm1nrEeIY1Guhbt4rWE1JO8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 556cd0a12ca46ba7;
	Thu, 05 Nov 2026 07:56:13 +0000
X-Mizu-Trace-ID: 556cd0a12ca46ba7
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Quentin Perret <qperret@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Martijn Bogaard <martijnbogaard@google.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] KVM: arm64: Align the pKVM selftest VM's stage-2 PGD
Date: Thu,  5 Nov 2026 07:56:05 +0000
Message-ID: <20261105075606.367005-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105075606.367005-1-fuad.tabba@linux.dev>
References: <20261105075606.367005-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_235615_956930_2AFF97E9 
X-CRM114-Status: GOOD (  12.80  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With CONFIG_NVHE_EL2_DEBUG, pKVM init sets up a selftest VM whose PGD is
the start of its 32-page block. That block is the first allocation out
of the hyp reserve, which falls back to page alignment when its
PMD-aligned allocation fails (512M on a 64K host).

A PGD of concatenated tables must be naturally aligned, or the VM's pool
never coalesces it into a block hyp_alloc_pages() can return. So when
the reserve isn't aligned to the PGD's size, the allocation in
guest_s2_zalloc_pages_exact() fails and pKVM init panics. A 64K host
with a 44-bit PA has a four-page PGD, and on a 1G QEMU VM the reserve
landed at 0x7fae0000.

Take the aligned pages inside the block instead. The pages either side
of it go to the memcache and the pool. The PGD is at most 16 pages, so
it always fits.

Fixes: 48d5645072930 ("KVM: arm64: Extend pKVM selftest for np-guests")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 03e530e15b4a2..820baf9ff74a2 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -847,10 +847,14 @@ struct pkvm_hyp_vcpu *init_selftest_vm(void *virt)
 {
 	struct hyp_page *p = hyp_virt_to_page(virt);
 	unsigned long min_pages, seeded = 0;
+	void *pgd;
 	int i;
 
 	selftest_vm.kvm.arch.mmu.vtcr = host_mmu.arch.mmu.vtcr;
-	WARN_ON(kvm_guest_prepare_stage2(&selftest_vm, virt));
+
+	/* A concatenated PGD must be naturally aligned for the pool to coalesce it. */
+	pgd = PTR_ALIGN(virt, kvm_pgtable_stage2_pgd_size(selftest_vm.kvm.arch.mmu.vtcr));
+	WARN_ON(kvm_guest_prepare_stage2(&selftest_vm, pgd));
 
 	/*
 	 * Mirror pkvm_refill_memcache() for the share/donate pre-checks;
-- 
2.47.3


