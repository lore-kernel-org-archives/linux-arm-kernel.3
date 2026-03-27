Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53A010F2865
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 19:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMJxb3lmiLgGFzx4TTsttil526yFXpMxlwtSZ1GwK6M=; b=4XAbHr9F9suuqmjoPKNhoWFt4T
	RPeAvxTdpcz2DETekDuPo1hhXMRgKGYJWGgK2azinEEb0iFQ33VNYD3dpzQhzqjWr0djxFfTcQnLL
	0yEbSUlPkA2u6FdClbAs/6GasyWu9BK2fjoaNOslZHMb8jP0CwxQVtbRgQEiEw0tbUj3+2O8cYKCE
	Uj3H/o6K23ZuP4sf8CNPMgqT1oC76eJzBgWE6+BucWcZCZ7ZCeYYZkwlrDl1bUYEf682T7ZrQlrSG
	2FGIyzq32Dx1TxUJ2PdAedNsNM4inx/0nhfUQFPUkkmT/pxL1xyA9WQ5jk7W+iTFrKrQ5uX9PSOjH
	1Eyu58Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Cr0-000000086S0-39GF;
	Fri, 27 Mar 2026 19:28:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Cqu-000000086Pp-0OI8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 19:28:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 873A160127;
	Fri, 27 Mar 2026 19:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87BBDC2BC9E;
	Fri, 27 Mar 2026 19:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774639695;
	bh=dRH5suto7lKdlh/Gq94DqSDdG+gmYwpQzMTnbymFdHk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XkqvL1CUY8iC67H1eEZ8OzYTS+Iej4ii7s0VvZJblR3L7K9qhoq80tp4y19lAj/0F
	 IEPOgh/hDIi7vn4N/6iOIs5Ek5UcAG7lHUkscxrR81+WJGUMipS6MTqsj+yQk24v+S
	 b0YOIlvsNpvr/ZKY3/INpAxHNXkbceIEkjDwyvK9xobjSZUei92SQLoNpjtbH8DQsb
	 uyDkonP7P73RM4QWAzLfxuWP3Ne2prk3apknNtrSgbAgDTHD7cpZgmCRMBGOJFHPKw
	 JKD+bWEfEunIZyintxGCaIY4/Bc+lbxeDfezvNv0xFjTtvURm4cVKXTDhkuYKsturL
	 h5Pq6U3sAS09Q==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 2/2] KVM: arm64: Destroy stage-2 page-table in kvm_arch_destroy_vm()
Date: Fri, 27 Mar 2026 19:27:57 +0000
Message-ID: <20260327192758.21739-3-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327192758.21739-1-will@kernel.org>
References: <20260327192758.21739-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

kvm_arch_destroy_vm() can be called on the kvm_create_vm() error path
after we have failed to register the MMU notifiers for the new VM. In
this case, we cannot rely on the MMU ->release() notifier to call
kvm_arch_flush_shadow_all() and so the stage-2 page-table allocated in
kvm_arch_init_vm() will be leaked.

Explicitly destroy the stage-2 page-table in kvm_arch_destroy_vm(), so
that we clean up after kvm_arch_destroy_vm() without relying on the MMU
notifiers.

Link: https://sashiko.dev/#/patchset/20260327140039.21228-1-will%40kernel.org?patch=12265
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/arm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 410ffd41fd73..29bfa79555b2 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -301,6 +301,7 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
 	if (is_protected_kvm_enabled())
 		pkvm_destroy_hyp_vm(kvm);
 
+	kvm_uninit_stage2_mmu(kvm);
 	kvm_destroy_mpidr_data(kvm);
 
 	kfree(kvm->arch.sysreg_masks);
-- 
2.53.0.1018.g2bb0e51243-goog


