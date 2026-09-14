Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F1BC88E66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iKvODBKPVjNkw+FyDfWvIqPPmR7jxIaTnYa7ga+H6Fg=; b=RUwog53oynyX8648MSzpmb0W9f
	wpAoEPXJLqNfuN4VdC/jFJhsCNEO2Ei7+uJEVnjwUHmq0N0i8ovqAWVkzp3i4CWkV/wnaVshxwO1Z
	voqtjE5raKZho70NfI85bS1OSVoDqkKW6eb64xlVy9hFpJiau4dKpZxbdZT2npBilnkLCr9mgmJh/
	qybX9/1oWPdayf8210Ycea9upxNYnSEq24cELs0uXP6uS4G/fsC/IcC3ri+jKRkmWRBEaeeZPek4h
	cSYmCUYgEyJwK3PPyav+E3kppWTlw9SsGvvVdooeSSu0pwAHuzFVXILabjdAMR6lL67RLdHS8YN28
	HL+Xkntg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65mD-00000003Xet-1ZEx;
	Mon, 14 Sep 2026 12:27:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65mB-00000003Xdl-4Bap
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 12:27:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BAA3843A30;
	Mon, 14 Sep 2026 12:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B441F0089D;
	Mon, 14 Sep 2026 12:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789388831;
	bh=iKvODBKPVjNkw+FyDfWvIqPPmR7jxIaTnYa7ga+H6Fg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BD0J6OC+lga4CbFP4aSfvYa6SYSaAKYvgPlAAhSvC0RQdhWy3MFA3LYh/OVFwfjvR
	 GQOA/NE4uAuWzSqCpT4H1D9nLxYeKTFKXuGfMZTUgmWeQkbay5w2f8zLRI33pyzLPf
	 uAePava7AOMmjWZcuKXwb2ZLHV0Ns0Vdp6k1xbzuQenZGqPZ4AD0Olo0nFyzVaiM81
	 Ckm7xEOMJkyJEHi5jCsLST9ccJTHbr70FgrTc1Q8GG9ruJTXxjE5Xtc3AKc83GjWGO
	 jxM1VYM0PWHF7JJeqMfR8xe8riXjAI68aw7QUbB/kgvE0VjnP8uWobo+PX/2LOAaDT
	 CZRCIKWYr54dQ==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Mon, 14 Sep 2026 13:26:17 +0100
Subject: [PATCH v2 06/13] KVM: arm64: Size the stage-2 memcache from the
 fault MMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-kvm-arm-prefault-v2-6-26fb47f74b73@kernel.org>
References: <20260914-kvm-arm-prefault-v2-0-26fb47f74b73@kernel.org>
In-Reply-To: <20260914-kvm-arm-prefault-v2-0-26fb47f74b73@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2249; i=ljs@kernel.org;
 h=from:subject:message-id; bh=Y4FlysXiT+xF7JlukrCtrhUE/JomIeYHyF5yaw00498=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLKWP/9a6DvvzsJ/B8rz3ocsCvnIcmyGyjkn6+Z/nVef/
 nq77POn6R2lLAxiXAyyYoosz7+I7w8SCZvXecHfDWYOKxPIEAYuTgGYyLIbjAxT9s+Nf5IdfJw1
 pfKYjJTy2bc80ZHikQce5WtXJ56zfcTH8IdT8dv6HPMaVsfjS9k+c1Te9fqSZPBsO+ehNY9LHfe
 8Y2cHAA==
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
index 13541218cadb..8c23fef4ecf8 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1554,9 +1554,9 @@ static void *get_mmu_memcache(struct kvm_vcpu *vcpu)
 		return &vcpu->arch.pkvm_memcache;
 }
 
-static int topup_mmu_memcache(struct kvm_vcpu *vcpu, void *memcache)
+static int topup_mmu_memcache(struct kvm_s2_mmu *mmu, void *memcache)
 {
-	int min_pages = kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu);
+	int min_pages = kvm_mmu_cache_min_pages(mmu);
 
 	if (!is_protected_kvm_enabled())
 		return kvm_mmu_topup_memory_cache(memcache, min_pages);
@@ -1654,7 +1654,7 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd,
 
 	if (!perm_fault) {
 		memcache = get_mmu_memcache(s2fd->vcpu);
-		ret = topup_mmu_memcache(s2fd->vcpu, memcache);
+		ret = topup_mmu_memcache(s2fd->mmu, memcache);
 		if (ret)
 			return ret;
 	}
@@ -1755,7 +1755,7 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	int ret;
 
 	hyp_memcache = get_mmu_memcache(vcpu);
-	ret = topup_mmu_memcache(vcpu, hyp_memcache);
+	ret = topup_mmu_memcache(s2fd->mmu, hyp_memcache);
 	if (ret)
 		return -ENOMEM;
 
@@ -2159,7 +2159,7 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd,
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


