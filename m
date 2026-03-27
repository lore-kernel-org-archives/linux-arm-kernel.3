Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6813C10ED67E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49Td3ZPo2XN96yjkZUxp4Ogwv5AmQ/bHWiqlkl7K+b0=; b=T/fuKH7/rED6JHKCOZZ9o7VBRT
	SDZzi7UA0aH+cn7GPzWohx1op2z/Kv6ZkFfAYpEScqnfxid9VKuQ5dO4yFzMY6KZfD5eO2XmwnQX+
	PFJoIUJa7V8sojXXNjkNPFp6NrBFtFWG/Bxm70OxQgmD6oCDN4dZSVojUF0jrCMJnUE9vz+jgbqYx
	e4HvHU0T+9A25Vx9QN5c0jkfFH9fD2xpqJMSENOwUT1ippUwuPtNTHmlndcGgTUnFlNKu63wDj7Tr
	BnsgJUOuWXtqxR/g87ZV3DkKRCSOD0tyh3N+SE+z/Lz0HPD3txELgskdY/r7WiWRG/j1JD0Ue1WMm
	vGAUtRqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67kH-00000007VUj-1e2Y;
	Fri, 27 Mar 2026 14:01:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67kA-00000007VRl-08c2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:00:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B9BE3441EC;
	Fri, 27 Mar 2026 14:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2D3FC19423;
	Fri, 27 Mar 2026 14:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774620057;
	bh=oRXTTRgczig8LPFqQrC03P5UVc2knZV/Mhzu7vhCAjE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LyT4x2MtThRTkNGlwHzJo3ABU02F9J6U8oITwVZKm/c73NHOlsXvQCay7G9ixkyRO
	 5fXzcQpgxPEgNXTzF2EpUk90b4ESxaHHawHtmYsFIB8LgL83ixJNKjs5BFWcOIIxm1
	 3Z3/VLlE5Ge1KQ8BPY8Zr2BnQoPeVA7soKjK3D7eRHYGBL1dIRLFgDWrAdp60H8BlJ
	 yVk4MQbIfJ7pMhPZOWYLWTOYpMyIT02cw3MYHrZhyz1Fln6MoIeg6AamDgoT0pMNiP
	 qpWxDFDi2LOQgKCyvMPyypJ/BLlk3O+IdtV2ZA4qbiVw2fa+X+qLDTIhXu0vXnnsaa
	 Cv5rUtnkXbUZA==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v4 02/38] KVM: arm64: Don't leak stage-2 page-table if VM fails to init under pKVM
Date: Fri, 27 Mar 2026 14:00:01 +0000
Message-ID: <20260327140039.21228-3-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327140039.21228-1-will@kernel.org>
References: <20260327140039.21228-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_070058_089574_D75B1AEA 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
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

If pkvm_init_host_vm() fails, we should free the stage-2 page-table
previously allocated by kvm_init_stage2_mmu().

Cc: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Tested-by: Mostafa Saleh <smostafa@google.com>
Fixes: 07aeb70707b1 ("KVM: arm64: Reserve pKVM handle during pkvm_init_host_vm()")
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/arm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 410ffd41fd73..3589fc08266c 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -236,7 +236,7 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 		 */
 		ret = pkvm_init_host_vm(kvm);
 		if (ret)
-			goto err_free_cpumask;
+			goto err_uninit_mmu;
 	}
 
 	kvm_vgic_early_init(kvm);
@@ -252,6 +252,8 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 
 	return 0;
 
+err_uninit_mmu:
+	kvm_uninit_stage2_mmu(kvm);
 err_free_cpumask:
 	free_cpumask_var(kvm->arch.supported_cpus);
 err_unshare_kvm:
-- 
2.53.0.1018.g2bb0e51243-goog


