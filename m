Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E339C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zqNA7nv2YO+B70YJ5GJwBHTJIQanS/1pJEsVZIBMbDE=; b=2pIFhJeB8abemf3GIuJ48O1j0n
	ExW0A0jfbGznStBe4YaVXh2WhTMv7jzn3+DmJILvQ+CwdqgVqisOMHaFaIoFMmSL7rAltv907Um1w
	JYmqk7FKrlh5xzEwi7ME31c06S3CP5Zd4NUJQcxATJma1C9Y9l8Rg/0oqg0EaXsqF10Uoi6ybb8C4
	nxQTfScf8EKIW7ZJbLuTh5PXLw1AOFXGiV8CtEiR7HU7JwCWLdMqQ7BGqS+kkhQrvckz9sSmAbCga
	60ybxCp8cz5XFKmFIPvUTI2Jv40MTU5GL2LQDOuwNG97ye3ozLTYPMEPhXUKYroOxQ123mMzh9eqG
	5JqVmklg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VJm-00000007GS7-3oVK;
	Tue, 15 Sep 2026 15:43:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VJg-00000007GPq-36nX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:43:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0754F15A1;
	Tue, 15 Sep 2026 08:43:22 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DE353F882;
	Tue, 15 Sep 2026 08:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487005; bh=bZH0Iynr6p+MO32RA+61Q08tGhF1f84xWPwOzk0oSQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a9zfF35ptiQKPV6uAEtV4LGz/dwzssa8UXO1LXm+fFsAt50zgS1WS0p9R9WtTP0mv
	 ILZKF6wXaHJ4ubXDjbEBeJ2jpQbWYpqbllmxP7vXTiGTrU7rzgOAUfAlOXmt/UDVyS
	 enKUPDKPdh86GkKeqeortrsS7pg0S6hVelAx8/yA=
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
	Mark Rutland <mark.rutland@arm.com>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Wang Han <wanghan@linux.alibaba.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v6 1/7] KVM: arm64: Use a variable for the canonical IPA in kvm_s2_fault_map()
Date: Tue, 15 Sep 2026 16:42:59 +0100
Message-ID: <20260915154305.3852871-2-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915154305.3852871-1-weilin.chang@arm.com>
References: <20260915154305.3852871-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_084328_856054_2B8A6F68 
X-CRM114-Status: GOOD (  14.63  )
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

Create a variable to store the canonical IPA, instead of calculating it
when needed. This will be useful when we need to use the canonical IPA
for guest stage-2 tracking later.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/kvm/mmu.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 9ba86450fe4a..671e2941d619 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2021,6 +2021,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
 	bool writable = prot & KVM_PGTABLE_PROT_W;
 	struct kvm *kvm = s2fd->vcpu->kvm;
+	phys_addr_t canonical_ipa;
 	struct kvm_pgtable *pgt;
 	long perm_fault_granule;
 	long mapping_size;
@@ -2039,6 +2040,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 	mapping_size = s2vi->vma_pagesize;
 	pfn = s2vi->pfn;
 	gfn = s2vi->gfn;
+	canonical_ipa = gfn_to_gpa(get_canonical_gfn(s2fd, s2vi));
 
 	/*
 	 * If we are not forced to use page mapping, check if we are
@@ -2057,6 +2059,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 				goto out_unlock;
 			}
 		}
+		canonical_ipa = ALIGN_DOWN(canonical_ipa, mapping_size);
 	}
 
 	if (!perm_fault_granule && !s2vi->map_non_cacheable && kvm_has_mte(kvm))
@@ -2090,11 +2093,9 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 	 * making sure we adjust the canonical IPA if the mapping size has
 	 * been updated (via a THP upgrade, for example).
 	 */
-	if (writable && !ret) {
-		phys_addr_t ipa = gfn_to_gpa(get_canonical_gfn(s2fd, s2vi));
-		ipa &= ~(mapping_size - 1);
-		mark_page_dirty_in_slot(kvm, s2fd->memslot, gpa_to_gfn(ipa));
-	}
+	if (writable && !ret)
+		mark_page_dirty_in_slot(kvm, s2fd->memslot,
+					gpa_to_gfn(canonical_ipa));
 
 	if (ret != -EAGAIN)
 		return ret;
-- 
2.43.0


