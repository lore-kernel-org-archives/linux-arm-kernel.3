Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120BBC02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 14:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kyl7v3MXnpMgt1ZOKipH/H+Vr16QIfKfmdEmju+IxpM=; b=hxkDvs4zryoYeUxLdewvWwoT3Y
	ni6l1gbrC/VmKDRnCkAduP/WV9qnPL7bU7rEJHMhKiGagn4GZCY9k5hKcdKnshUrxL9GiQDJtBU60
	jDCGOODM4JDZOYh26Sy34+4z6EitW51ghghZIhL2nRmq0vKUqTE2cs84nDfNcfKQBqxz9xyaldNx/
	nbceOe2bMiq+oRkJOOOV1U+MjN03PQvoyO3yYptstOOKCSJm8QWRFvm+n0WJCqZx+ujLIXiRC5u8i
	B0X9ixCIQFR2WkezfA7zibFX1h6jQHRS25756XVN3bCJk8kxaaN6R4j+YjkxSc/ok6kwCNhEOgokC
	JIz35ydw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKMf-00000000jFU-435s;
	Tue, 04 Feb 2025 14:57:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKLK-00000000j16-1uIR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 14:56:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EE9CC5C69B4;
	Tue,  4 Feb 2025 14:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72F32C4CEDF;
	Tue,  4 Feb 2025 14:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738680961;
	bh=/54KAUGrgAu+EY8yrKbHB4///ZOU7MFp40KO/eRvFjE=;
	h=From:To:Cc:Subject:Date:From;
	b=hY34tf7QLqKPmNkKHaymhuwSAdpujXj5JOKlDDXIEV/9vzG7TxbmXMPM7hGwC31Ds
	 Sq9ITR2oShRcLLM8qBV4Hs/gDc4YIFU/poN8AJ0JRgYvsPo7TyNe2tv7IylwoclqaN
	 eBc9S5DTifJZmzvaXW7CjgcE8yItxyEVoHvPNRIlgKnhd4UkBt2GYa0wHIVoFBaVoS
	 vgrEMyTbBjHSMBExylP4OXNP4u0cnUXmkDKnNDS3fSmcHScFdLJf1PRX7q+a4Zd4p7
	 N9Ee5ahSZU/oDeXtej7EaMXwenCAAc9RbJOZ0NeQYb5ytfCULKz/qlOIPvzwolKako
	 T3RVVe8p76f6A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tfKLG-000SW3-VU;
	Tue, 04 Feb 2025 14:55:59 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexander Potapenko <glider@google.com>
Subject: [PATCH] KVM: arm64: Fix nested S2 MMU structures reallocation
Date: Tue,  4 Feb 2025 14:55:54 +0000
Message-Id: <20250204145554.774427-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, glider@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_065602_582278_FD4D8259 
X-CRM114-Status: GOOD (  12.33  )
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

For each vcpu that userspace creates, we allocate a number of
s2_mmu structures that will eventually contain our shadow S2
page tables.

Since this is a dynamically allocated array, we reallocate
the array and initialise the newly allocated elements. Once
everything is correctly initialised, we adjust pointer and size
in the kvm structure, and move on.

But should that initialisation fail *and* the reallocation triggered
a copy to another location, we end-up returning early, with the
kvm structure still containing the (now stale) old pointer. Weeee!

Cure it by assigning the pointer early, and use this to perform
the initialisation. If everything succeeds, we adjust the size.
Otherwise, we just leave the size as it was, no harm done, and the
new memory is as good as the ol' one (we hope...).

Fixes: 4f128f8e1aaac ("KVM: arm64: nv: Support multiple nested Stage-2 mmu structures")
Reported-by: Alexander Potapenko <glider@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/nested.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index d3214c3a40393..6969c273b39e1 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -93,20 +93,22 @@ int kvm_vcpu_init_nested(struct kvm_vcpu *vcpu)
 	if (!tmp)
 		return -ENOMEM;
 
+	swap(kvm->arch.nested_mmus, tmp);
+
 	/*
 	 * If we went through a realocation, adjust the MMU back-pointers in
 	 * the previously initialised kvm_pgtable structures.
 	 */
 	if (kvm->arch.nested_mmus != tmp)
 		for (int i = 0; i < kvm->arch.nested_mmus_size; i++)
-			tmp[i].pgt->mmu = &tmp[i];
+			kvm->arch.nested_mmus[i].pgt->mmu = &kvm->arch.nested_mmus[i];
 
 	for (int i = kvm->arch.nested_mmus_size; !ret && i < num_mmus; i++)
-		ret = init_nested_s2_mmu(kvm, &tmp[i]);
+		ret = init_nested_s2_mmu(kvm, &kvm->arch.nested_mmus[i]);
 
 	if (ret) {
 		for (int i = kvm->arch.nested_mmus_size; i < num_mmus; i++)
-			kvm_free_stage2_pgd(&tmp[i]);
+			kvm_free_stage2_pgd(&kvm->arch.nested_mmus[i]);
 
 		free_page((unsigned long)vcpu->arch.ctxt.vncr_array);
 		vcpu->arch.ctxt.vncr_array = NULL;
@@ -115,7 +117,6 @@ int kvm_vcpu_init_nested(struct kvm_vcpu *vcpu)
 	}
 
 	kvm->arch.nested_mmus_size = num_mmus;
-	kvm->arch.nested_mmus = tmp;
 
 	return 0;
 }
-- 
2.39.2


