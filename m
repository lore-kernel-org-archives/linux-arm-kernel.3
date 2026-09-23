Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D65C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lIj/Dbom+J7aqmlKPZ1y/Va/8sNR/cU9PEm7aCseVZY=; b=ncoHETMJIIeHaKDmU9FrXGwucO
	5ithQh/APOVoDivLxiMpckwGHcKMtwZIZzOqnGq+khcYC1uHexlniEN+fVSUMIUWX77ykDCQq+H6u
	4SdyHhlel1V8vstzFusIsYfmDRThDBfMUAULTd/VA1jqdKsxgLT9c4JtrB8inI7Kg9WEqLU7OHM7R
	DHPFMSzK+90iA/M7j6hLrhTwM73F+QE90G/OreH5ZCCuGc2rvo63d95tlJuRtsFKcrw74+s+jHugm
	ItSVYVwmUtch1aOsxLQY7qZT6JHbCOmzvRxm4kSBR/9bVUrXl5Pu1r5zOCX/f4b0ZAQzEKXgIS3zJ
	ZykpBMTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Oix-00000008gTm-1vGr;
	Wed, 23 Sep 2026 15:17:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Oil-00000008gNj-3TKs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:17:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 41309600AA;
	Wed, 23 Sep 2026 15:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC691F000FF;
	Wed, 23 Sep 2026 15:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790176639;
	bh=lIj/Dbom+J7aqmlKPZ1y/Va/8sNR/cU9PEm7aCseVZY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KDDYhmpmlsVAjJkAyXEb9XNgBOi5awscdP44AJxhJS714JM6QR8D+WRdP64lXdmd5
	 JtZ04/3c0luLG0blYnW37xVmymeRHUAT3Q/Z0ZTv0Teaoq9UYGJE4/bY+gHRK2q05V
	 equ2sRiRk/5n9/K9O6ty9gJfxmDpCSxwO03/UtlvHhuWyTKtMBctgm8aRcw6spmzoh
	 seDOmQREwnoDS/X2TrYiPUQORBHY54q9eaXYiHAhMFk2NDEnHKJtDwg5AjHJumu0XP
	 vvAuMBMzevekDmmpZcuRIDxxV9xObG8lxZ7kM8Zt7tylKhcSbXSf6nbl/KBI+nZWzn
	 Df1WgBWKCzITg==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Wed, 23 Sep 2026 16:15:50 +0100
Subject: [PATCH v4 07/14] KVM: arm64: Size the stage-2 memcache from the
 fault MMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-kvm-arm-prefault-v4-7-d4b0b4dfa8c3@kernel.org>
References: <20260923-kvm-arm-prefault-v4-0-d4b0b4dfa8c3@kernel.org>
In-Reply-To: <20260923-kvm-arm-prefault-v4-0-d4b0b4dfa8c3@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Randy Dunlap <rdunlap@infradead.org>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@kernel.org>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <skhan@linuxfoundation.org>, 
 Shuah Khan <shuah@kernel.org>
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
 linux-s390@vger.kernel.org, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2386; i=ljs@kernel.org;
 h=from:subject:message-id; bh=pAPxUpZtqgJo3haFZqrljwVWvDJLRFxgQ5QDLtB5gZo=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLI2v9UVEa47Nz1esedi48qAiOPWP2U21uzcNsFsNQfLw
 8sXp/zI7ChlYRDjYpAVU2R5/kV8f5BI2LzOC/5uMHNYmUCGMHBxCsBEHjxlZPi3huOpwnIF7wuP
 wuuDPkf13hTrfPwucPmKqMIMuzf/PWQZ/nBp/m65yOtw5dydCLk90u+PmeolTyw70vOegbOz5i/
 XQhYA
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

Reviewed-by: Oliver Upton <oupton@kernel.org>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 arch/arm64/kvm/mmu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index ee2a4f0faa14..cd4bc1d1bcdb 100644
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
@@ -1827,7 +1827,7 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	int ret;
 
 	hyp_memcache = get_mmu_memcache(vcpu);
-	ret = topup_mmu_memcache(vcpu, hyp_memcache);
+	ret = topup_mmu_memcache(s2fd->mmu, hyp_memcache);
 	if (ret)
 		return -ENOMEM;
 
@@ -2253,7 +2253,7 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd,
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


