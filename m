Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FC6C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 16:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2n/GT1zNcErOZDVCRG/HrutbSxrG2jWsh4QWz8aUK78=; b=gZVOvFiHY8ZgC9oTobdwFJ5uDH
	28riu44GICp8/imoByxuYIMswgaFOl7QgS0HfDDIZYF2U8JPgLw0rigJwU9kbf/mLrahYUFJ1KTTR
	KmhBXjR+cFZSoVve8bz7+DxQmZWm7SgHrKDT2npMNwIyKD8UjJ0+tXERvrYVkyimvHC+zta/UFDgV
	1l7pWBwHLgimI6nIKs7JGZjd3TkaGviN6TZXONHZM/AwFoMn/6k3b/JWKrVzJzib9VswiXCgCIghd
	dEZrNCsnu/VgT233HwXMN9X4kUdtRD7dw6xQNYBZS1Z/X3M8ThG6JSmbv/5jcVx/3WxL1/NrKAiBS
	oLHIRvfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wytag-000000014Zm-0wms;
	Tue, 25 Aug 2026 16:01:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wytae-000000014ZI-0U0C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 16:01:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 817D94035B;
	Tue, 25 Aug 2026 16:01:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A1A1F00A3A;
	Tue, 25 Aug 2026 16:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787673691;
	bh=2n/GT1zNcErOZDVCRG/HrutbSxrG2jWsh4QWz8aUK78=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dHVqBfDStyFZhJftkYg6JAcTecPfldfshUIibfnQn0qeJVNaujjSLd6QcRAmlIRXf
	 tTdHX3/a0nT8Hf2scWZ/o2rQ6nx/67V89ay+ONEXUq6aQ8Rm4AxNd3m0NwOk3UYgJm
	 bVuEat7hL3MtjEf9FSh5iHr7SvtyvoQwT1X3z7olEPI7QlmA+rDexmL9ltF33TOOUD
	 NNfdSnAfxZ/FwY0G3aq6lRTN4hdvcVD/dmrDytX67c9FAGK/UkHwS2bgvzhSH6/sHB
	 Vl3QawoYBQfhM7anQ84gCbKoPubESoBoOX3vJukavt8xVf04nGHECoA8X8NeuIwjvk
	 Sl/WWQKBAa1UA==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 25 Aug 2026 17:00:37 +0100
Subject: [PATCH 3/8] KVM: arm64: Propagate and use kvm_s2_fault_result on
 S2 fault
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-kvm-arm-prefault-v1-3-befe8947702e@kernel.org>
References: <20260825-kvm-arm-prefault-v1-0-befe8947702e@kernel.org>
In-Reply-To: <20260825-kvm-arm-prefault-v1-0-befe8947702e@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oupton@kernel.org>, Fuad Tabba <tabba@google.com>, 
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jack Thomson <jackabt@amazon.com>, 
 Jack Thomson <jackabt.amazon@gmail.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 Vincent Donnefort <vdonnefort@google.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Sean Christopherson <seanjc@google.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>, 
 Leo Soares Passos <Leo.Bras@arm.com>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4633; i=ljs@kernel.org;
 h=from:subject:message-id; bh=OK8qMkoBFUsKSDW1WXYaJvEYhrPVl7NXbf8oJ3V+T3w=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLJ69zgdV7sdlbN67b4bp9Qnd+2ZwBXv6ZRSMyWBYafTD
 6b1M/4+7ShlYRDjYpAVU2R5/kV8f5BI2LzOC/5uMHNYmUCGMHBxCsBE3kxnZHj/SLt2l/3/4Oen
 tq3p/dVhKHUs9ZhC9hflxkr29ZPaBBUZ/lmHSc57WP9DL7rR4+8NuSVptx/YJn6Purp10u1VqzY
 9fs0AAA==
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
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

When stage 2 page tables fault the net result may either be that a page is
mapped, an error occurred or the fault should be retried (-EAGAIN).

When a fault succeeds it may be upgraded to a PMD size via
transparent_hugepage_adjust().

In order to support KVM pre-faulting the outcome of the fault and the
mapping size must be recorded.

Track this in the new kvm_s2_fault_result struct, which is threaded through
gmem_abort(), user_mem_abort() and kvm_s2_fault_map().

PKVM and SEA aren't relevant to synthetic pre-faulting so neither
kvm_inject_sea() nor pkvm_mem_abort() are altered.

Actual hardware faulting doesn't require this information, so
kvm_handle_guest_abort() simply passes NULL kvm_s2_fault_result to
gmem_abort() and user_mem_abort().

Faults are necessarily ephemeral and pre-faulting can't guarantee what may
happen in parallel, so do not store the GFN or PFN in
kvm_s2_fault_result. Pre-faulting only needs to know what was mapped in at
the point of the fault.

This struct could be replaced with a pointer to an unsigned long, however
it's clearer to separate out the mapped flag and having a struct allows us
to easily add additional fields in future as needed.

No functional change intended.

Suggested-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 arch/arm64/kvm/mmu.c | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 80cb520e25b9..da15da4e40e6 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1607,6 +1607,11 @@ struct kvm_s2_fault_desc {
 	struct kvm_s2_mmu	*mmu;
 };
 
+struct kvm_s2_fault_result {
+	unsigned long mapping_size;
+	bool mapped;
+};
+
 static bool kvm_s2_fault_is_perm(const struct kvm_s2_fault_desc *s2fd)
 {
 	return esr_fsc_is_permission_fault(s2fd->esr);
@@ -1632,7 +1637,17 @@ static u64 kvm_s2_perm_fault_granule(const struct kvm_s2_fault_desc *s2fd)
 	return BIT(ARM64_HW_PGTABLE_LEVEL_SHIFT(level));
 }
 
-static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
+static void populate_fault_result(struct kvm_s2_fault_result *result,
+				  unsigned long mapping_size)
+{
+	/* A THP upgrade may have altered mapping size. */
+	result->mapping_size = mapping_size;
+	/* -EAGAIN is swallowed so be explicit when we actually map. */
+	result->mapped = true;
+}
+
+static int gmem_abort(const struct kvm_s2_fault_desc *s2fd,
+		      struct kvm_s2_fault_result *result)
 {
 	bool write_fault, exec_fault;
 	const bool perm_fault = kvm_s2_fault_is_perm(s2fd);
@@ -1714,6 +1729,8 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
 	if ((prot & KVM_PGTABLE_PROT_W) && !ret)
 		mark_page_dirty_in_slot(kvm, s2fd->memslot, gfn);
 
+	if (result && !ret)
+		populate_fault_result(result, PAGE_SIZE);
 	return ret != -EAGAIN ? ret : 0;
 }
 
@@ -2038,7 +2055,8 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 			    const struct kvm_s2_fault_vma_info *s2vi,
 			    enum kvm_pgtable_prot prot,
-			    void *memcache)
+			    void *memcache,
+			    struct kvm_s2_fault_result *result)
 {
 	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
 	bool writable = prot & KVM_PGTABLE_PROT_W;
@@ -2117,12 +2135,15 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 		mark_page_dirty_in_slot(kvm, s2fd->memslot, gpa_to_gfn(ipa));
 	}
 
+	if (result && !ret)
+		populate_fault_result(result, mapping_size);
 	if (ret != -EAGAIN)
 		return ret;
 	return 0;
 }
 
-static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
+static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd,
+			  struct kvm_s2_fault_result *result)
 {
 	const bool perm_fault = kvm_s2_fault_is_perm(s2fd);
 	struct kvm_s2_fault_vma_info s2vi = {};
@@ -2161,7 +2182,7 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 		return ret;
 	}
 
-	return kvm_s2_fault_map(s2fd, &s2vi, prot, memcache);
+	return kvm_s2_fault_map(s2fd, &s2vi, prot, memcache, result);
 }
 
 /* Resolve the access fault by making the page young again. */
@@ -2440,9 +2461,9 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 				!kvm_s2_fault_is_exec(&s2fd));
 
 		if (kvm_slot_has_gmem(memslot))
-			ret = gmem_abort(&s2fd);
+			ret = gmem_abort(&s2fd, NULL);
 		else
-			ret = user_mem_abort(&s2fd);
+			ret = user_mem_abort(&s2fd, NULL);
 	}
 
 	if (ret == 0)

-- 
2.55.0


