Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BC5C982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 14:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oxn6Ca7Nx4NbYpUu5UoOQ5jCWdGj3GIw0I/CPTd85kY=; b=fDDtTSrR046FWHCzlBQ0OdoCfb
	wk53fqsRFEHqZn8FeshiDzNGRUAdmShN+X7oB/WhlxfGEJGPfECbt2xeNQ2ORYePQpeHhQBc0R6Ty
	xwgatbfhHZT7lr5bDEihJiEvPVOA3IFVmAo33Vpuljt5/6O9FMyFzDnS5xUCuQvaj5XzvadxmwCoi
	LsPxY1MElpeeclK4YQOlKvu1GPAwsI/dWnaf5iRhzxe3kvQtRofM0q8g/ij3IdtL26olHJJZxp96k
	CqR3oR/EXP1EDf9TGvtFOs7nXmmm5OCDBuDrUDwENKntnA+JJ++EABym1cpGyPP+GiHnVnNulFV93
	1SrmjIUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91Kp-00000005eXb-1pGC;
	Tue, 22 Sep 2026 14:19:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91Ki-00000005eTL-3HqZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 14:18:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 82C2343F3C;
	Tue, 22 Sep 2026 14:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 226CC1F00893;
	Tue, 22 Sep 2026 14:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790086736;
	bh=oxn6Ca7Nx4NbYpUu5UoOQ5jCWdGj3GIw0I/CPTd85kY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IOlgA7XuqBZ358yrxXULdyure+iaa6Mtuf80OmgbeuqhqCuTB2v0k2F6EiMDUPbPU
	 3m/CDU838Fx9Cuj3VrRqxb8fOrcMoBWMEOZ0pb0cJgO8/kJAoZNUC1PSR9LhaIy6ke
	 GfnBpClZfRSYx1HUWJ4TF5XHKGxVsG3ruLkA5eAt/gDJ8XP8uvkYVr2Yg20xDT0rYC
	 g3/54T4UMrBg4Y6weTH7/dl+lRP4ojPDzGsH/qarwlW19LekWZmT0Yln/H45sNrc0k
	 r2PRqB/JLYEMYE8b/oo0SiseSOM5+EsL1MJUVbCeeFNO7sOhg01Fi7zbDTFeJAGjTY
	 sdpA9kHcx5/BA==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 22 Sep 2026 15:18:01 +0100
Subject: [PATCH v3 07/14] KVM: arm64: Size the stage-2 memcache from the
 fault MMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-kvm-arm-prefault-v3-7-787bd3bc7e3f@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2291; i=ljs@kernel.org;
 h=from:subject:message-id; bh=eoI9LJ1R2FVCS/++1XTnAO/eBVHu+hbr5+7z4vbkU20=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLI29UlmLNxokNxRUbu3cJH6rt9+pwqsOXP3nzq3XCh9f
 fS+SQZNHaUsDGJcDLJiiizPv4jvDxIJm9d5wd8NZg4rE8gQBi5OAZiIsSEjw6UHl3eq3WfOWspR
 xsKxeM/p7uktubm6Vzhf1txPazv+h5nhv8f1a/c/Ojgdtn6zeucc0W8a5dUsJiu7Zz2Y+kTZU/o
 YLy8A
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

topup_mmu_memcache() sizes the page-table cache from
vcpu->arch.hw_mmu, which is the MMU that faulted.

Pass the target s2fd->mmu instead, so the mmu used can be controlled by the
caller.

For a guest abort this is vcpu->arch.hw_mmu, so this commit introduces no
functional change in practice.

However, it's necessary for a future change which introduces stage 2
pre-faulting which must always target the canonical MMU regardless of the
vCPU's last-run context.

No functional change intended.

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 arch/arm64/kvm/mmu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 5c429065a4fe..221ea069f9bb 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1606,9 +1606,9 @@ static void *get_mmu_memcache(struct kvm_vcpu *vcpu)
 		return &vcpu->arch.pkvm_memcache;
 }
 
-static int topup_mmu_memcache(struct kvm_vcpu *vcpu, void *memcache)
+static int topup_mmu_memcache(struct kvm_s2_mmu *mmu, void *memcache)
 {
-	int min_pages = kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu);
+	int min_pages = kvm_mmu_cache_min_pages(mmu);
 
 	if (!is_protected_kvm_enabled())
 		return kvm_mmu_topup_memory_cache(memcache, min_pages);
@@ -1707,7 +1707,7 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd,
 
 	if (!perm_fault) {
 		memcache = get_mmu_memcache(s2fd->vcpu);
-		ret = topup_mmu_memcache(s2fd->vcpu, memcache);
+		ret = topup_mmu_memcache(s2fd->mmu, memcache);
 		if (ret)
 			return ret;
 		if (kvm_is_nested_s2_mmu(kvm, pgt->mmu)) {
@@ -1825,7 +1825,7 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	int ret;
 
 	hyp_memcache = get_mmu_memcache(vcpu);
-	ret = topup_mmu_memcache(vcpu, hyp_memcache);
+	ret = topup_mmu_memcache(s2fd->mmu, hyp_memcache);
 	if (ret)
 		return -ENOMEM;
 
@@ -2251,7 +2251,7 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd,
 	memcache = get_mmu_memcache(s2fd->vcpu);
 	if (!perm_fault || memslot_is_logging(s2fd->memslot) ||
 	    is_protected_kvm_enabled()) {
-		ret = topup_mmu_memcache(s2fd->vcpu, memcache);
+		ret = topup_mmu_memcache(s2fd->mmu, memcache);
 		if (ret)
 			return ret;
 	}

-- 
2.55.0


