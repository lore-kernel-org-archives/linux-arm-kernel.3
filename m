Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D7FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 11:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U8mB6ODX2O80XXQE9zeG588fYLSsuL8vqXOA8D8ZW/k=; b=mvBS0Vlz8/yaCV2nw0WlvngyMq
	0ujAWgSPhrs96uoDGoiVffn5w60r5zobxucyFunRPHz0RbPn+hCCBoa4LFHqG2wa3Zl7nyQmhh0Ov
	5gFfL527drmvT7N4ZFuGTGC4kX6udhlAfqEM/cAO9Vkv7qmHTmm2G8KdflX+guYfXjBTUYivD9rtL
	n1h6+5b1FsfviKiTfBJ/mpbCdyURFIlqqNYBOeK5+zx7EkAeK6ck7Yhl8KCuMrX3jFaAmi9sIa9+2
	D3OLggMdYm5W9ionl1iqUB3CaJlm9PuAPZNjvxzzBB55vbXNsJIZrzJPAYkj6mE8CVuukfY1EO9zr
	7YnlKl/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weA0k-0000000EPap-195l;
	Mon, 29 Jun 2026 11:18:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weA0f-0000000EPYF-1KEQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 11:18:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2135169C;
	Mon, 29 Jun 2026 04:18:35 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC86B3F905;
	Mon, 29 Jun 2026 04:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782731920; bh=vqEhf/sbRP1rwv44a6q+3NurUky3BY41N3vWulsb12Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FLm+FqS71GHRVQHXLN9WA3unnz7568EYd+GK/o/HBTHi68mRSblD+pEscg6QKDMxJ
	 7BfSvAKGYCSsQXjjCFHXc98hzLpu9xEFRwN9pg2MPW1p1riBLkJNZeC6jgxg5KQmui
	 C9xjBL8kIRmEyzFG5SWN4VLCjoQF+hqUTHgb+GvY=
From: Leonardo Bras <leo.bras@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Saket Dumbre <saket.dumbre@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Chengwen Feng <fengchengwen@huawei.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>,
	James Morse <james.morse@arm.com>,
	Zeng Heng <zengheng4@huawei.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	James Clark <james.clark@linaro.org>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tian Zheng <zhengtian10@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [PATCH v2 02/13] KVM: arm64: Enable eager hugepage splitting if HDBSS is available
Date: Mon, 29 Jun 2026 12:17:50 +0100
Message-ID: <20260629111820.1873540-3-leo.bras@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629111820.1873540-1-leo.bras@arm.com>
References: <20260629111820.1873540-1-leo.bras@arm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1690; i=leo.bras@arm.com; h=from:subject; bh=vqEhf/sbRP1rwv44a6q+3NurUky3BY41N3vWulsb12Y=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLKcQhLKefvY5ySct37OvpL1ydd7z8wtd8XMVfVb/JiPU Uyu9ZpORykLgxgXg6yYIovso/mreL5PyThy5ccCmDmsTCBDGLg4BWAi25MZGb7UHnK1YDn0SvLV 9wcrXZfpGD0WnxC4tKugc/GrFVFP5qUw/E9k2X1jZl1zov/vd1zn5lruXX10lruv9ucL3HW7POv bUjkA
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_041841_455865_9288864D 
X-CRM114-Status: GOOD (  13.26  )
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

FEAT_HDBSS speeds up guest memory dirty tracking by avoiding a page fault
and saving the entry in a tracking structure.

That may be a problem when we have guest memory backed by hugepages or
transparent huge pages, as it's not possible to do on-demand hugepage
splitting, relying only on eager hugepage splitting.

So, at stage2 initialization, enable eager hugepage splitting with
chunk = 256K * PAGE_SIZE if the system supports HDBSS.

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
---
 arch/arm64/kvm/mmu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 6c941aaa10c6..e086c01a9325 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1020,22 +1020,26 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
 
 	mmu->last_vcpu_ran = alloc_percpu(typeof(*mmu->last_vcpu_ran));
 	if (!mmu->last_vcpu_ran) {
 		err = -ENOMEM;
 		goto out_destroy_pgtable;
 	}
 
 	for_each_possible_cpu(cpu)
 		*per_cpu_ptr(mmu->last_vcpu_ran, cpu) = -1;
 
-	 /* The eager page splitting is disabled by default */
-	mmu->split_page_chunk_size = KVM_ARM_EAGER_SPLIT_CHUNK_SIZE_DEFAULT;
+	 /* The eager page splitting is disabled by default if system has no HDBSS */
+	if (system_supports_hdbss())
+		mmu->split_page_chunk_size = 256 * 1024 * PAGE_SIZE;
+	else
+		mmu->split_page_chunk_size = KVM_ARM_EAGER_SPLIT_CHUNK_SIZE_DEFAULT;
+
 	mmu->split_page_cache.gfp_zero = __GFP_ZERO;
 
 	mmu->pgd_phys = __pa(pgt->pgd);
 
 	if (kvm_is_nested_s2_mmu(kvm, mmu))
 		kvm_init_nested_s2_mmu(mmu);
 
 	return 0;
 
 out_destroy_pgtable:
-- 
2.54.0


