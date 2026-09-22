Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25D6C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 14:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=prl4aYVzg1A/+xz481Z7aZvgxAJKgqMtHjCqg0GZRI4=; b=huLt0taBcOhCMsUWn0UGueKMOi
	tAIWVX75Z9HNg9Se/G7I9bR6EDoVQAeNDGW1PbN9cuGiriqrz+5pzx2lu3DLXkMkQ44wdWnlu2cfb
	BsT+ysnXlFjResaDccvhuqhbiouvLe32oNl3+SAyn0xvmqCBKL0gf3/o6JXj2iU248+I2FiifDLsn
	srUlGn8h7Tg4qw7KUlCuYiuD9zD/razTQNp4cr2beDIYDXWqjUIf6AzPmVtttqdOcx2k3SpO2BSJm
	Z8OK99x1a/GRBCq066BRCzJAseM84bUU/nv8pgPQw2r1HXfCzhJ/5tsKGtuTMoS/mgr2bDa49ssL6
	7Xa6ospw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91Ki-00000005eSu-1LYM;
	Tue, 22 Sep 2026 14:18:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91Kc-00000005ePS-1vra
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 14:18:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E0DF96024D;
	Tue, 22 Sep 2026 14:18:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 553241F0089A;
	Tue, 22 Sep 2026 14:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790086729;
	bh=prl4aYVzg1A/+xz481Z7aZvgxAJKgqMtHjCqg0GZRI4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QtvgNQnMRG+hoVEjcDbZD0Pqwrd+NJ/hDg6PKrg2wEFiSZ8k+EDm7WQwDG3zIpUWx
	 GpWTmxlv2MvIFszzLNOzUzbYzXs77cDPMzia7yUNBwdkToaquonWLPog7PaGwGw8uD
	 OeIva8kEVhrlyzENb/cLVYOP+Xlg8Pbm5WhDqsqJfVGbVBm00wgKrJVTWH4nsCBybf
	 tUSUO3kuAVrFDJO5nCFAXeYNNH6IAx5WcKhf+1U3ckFX9tMXfmJXssiXViOmjIC8ns
	 Qq4QNDAfCGxs0vcFrzLMnQA+6v20ijhB0TLWHTvba5gML3e3gaEokXk6Y/uMqotoIh
	 ea8lvuVQDWBxw==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 22 Sep 2026 15:18:00 +0100
Subject: [PATCH v3 06/14] KVM: arm64: Propagate and use kvm_s2_fault_result
 on S2 fault
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-kvm-arm-prefault-v3-6-787bd3bc7e3f@kernel.org>
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
In-Reply-To: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Randy Dunlap <rdunlap@infradead.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jack Thomson <jackabt@amazon.com>, 
 Jack Thomson <jackabt.amazon@gmail.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 Vincent Donnefort <vdonnefort@google.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Sean Christopherson <seanjc@google.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>, 
 Leo Soares Passos <Leo.Bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4242; i=ljs@kernel.org;
 h=from:subject:message-id; bh=z/ETaunlNa0Zwg+a3KcFcM9AP48COh6Atvzx7Ol+KYg=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLI29UkURWa3Xc+9kXRm5XoWzbhP+/03b306cW7+zz8v1
 rxr3HKgu6OUhUGMi0FWTJHl+Rfx/UEiYfM6L/i7wcxhZQIZwsDFKQATubyAkWH6tB/HuX+1Zh39
 27etxnzl36cWfALPOpUMlArzC3USrixg+Keh9zLt/mLVQ2wRM70jrvO5btL1qZ4YM2HytXp2Act
 QCW4A
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

Track the mapping size via new kvm_s2_fault_result struct, which is
threaded through gmem_abort(), user_mem_abort() and kvm_s2_fault_map().

PKVM and SEA aren't relevant to synthetic pre-faulting so neither
kvm_inject_sea() nor pkvm_mem_abort() are altered.

Actual hardware faulting doesn't require this information, so
kvm_handle_guest_abort() simply passes NULL kvm_s2_fault_result to
gmem_abort() and user_mem_abort().

A non-NULL result also tells the abort handlers that the caller is
pre-faulting rather than a vcpu, in which case -EAGAIN is propagated to the
caller to allow the pre-fault to be retried.

No functional change intended.

Suggested-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 arch/arm64/kvm/mmu.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index ea0d4be0298b..5c429065a4fe 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1659,6 +1659,10 @@ struct kvm_s2_fault_desc {
 	struct kvm_s2_mmu	*mmu;
 };
 
+struct kvm_s2_fault_result {
+	unsigned long mapping_size;
+};
+
 static bool kvm_s2_fault_is_perm(const struct kvm_s2_fault_desc *s2fd)
 {
 	return esr_fsc_is_permission_fault(s2fd->esr);
@@ -1684,7 +1688,8 @@ static u64 kvm_s2_perm_fault_granule(const struct kvm_s2_fault_desc *s2fd)
 	return BIT(ARM64_HW_PGTABLE_LEVEL_SHIFT(level));
 }
 
-static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
+static int gmem_abort(const struct kvm_s2_fault_desc *s2fd,
+		      struct kvm_s2_fault_result *result)
 {
 	bool write_fault, exec_fault;
 	bool perm_fault = kvm_s2_fault_is_perm(s2fd);
@@ -1784,7 +1789,13 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
 	if ((prot & KVM_PGTABLE_PROT_W) && !ret)
 		mark_page_dirty_in_slot(kvm, s2fd->memslot, gfn);
 
-	return ret != -EAGAIN ? ret : 0;
+	if (ret == -EAGAIN)
+		return result ? ret : 0;
+
+	if (result && !ret)
+		result->mapping_size = PAGE_SIZE;
+
+	return ret;
 }
 
 struct kvm_s2_fault_vma_info {
@@ -2108,7 +2119,8 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 			    const struct kvm_s2_fault_vma_info *s2vi,
 			    enum kvm_pgtable_prot prot,
-			    void *memcache)
+			    void *memcache,
+			    struct kvm_s2_fault_result *result)
 {
 	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
 	struct kvm_guest_s2_mapping *mapping = NULL;
@@ -2209,12 +2221,17 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 		mark_page_dirty_in_slot(kvm, s2fd->memslot,
 					gpa_to_gfn(canonical_ipa));
 
-	if (ret != -EAGAIN)
-		return ret;
-	return 0;
+	if (ret == -EAGAIN)
+		return result ? ret : 0;
+
+	if (result && !ret)
+		result->mapping_size = mapping_size;
+
+	return ret;
 }
 
-static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
+static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd,
+			  struct kvm_s2_fault_result *result)
 {
 	bool perm_fault = kvm_s2_fault_is_perm(s2fd);
 	struct kvm_s2_fault_vma_info s2vi = {};
@@ -2253,7 +2270,7 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 		return ret;
 	}
 
-	return kvm_s2_fault_map(s2fd, &s2vi, prot, memcache);
+	return kvm_s2_fault_map(s2fd, &s2vi, prot, memcache, result);
 }
 
 /* Resolve the access fault by making the page young again. */
@@ -2532,9 +2549,9 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
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


