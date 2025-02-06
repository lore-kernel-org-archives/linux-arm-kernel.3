Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF464C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 15:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1wM2GMerEpph7OMIcvMX+rFaqiN9heP6XwngnRioLg=; b=G9shJTA+UX5VX8fzHbzzishJjz
	WeJ9Z0hCtzX4o3WkXyp6qYfme7xZN+nqsVEBnofSQ7tB7hyBp3oERNzKFZgQSr/rmgWbAt3liI/kx
	iJgShdD5NvH4AIF96pHzJPkA3Z11uizNR8jlHjWD6wSWv3caTa7xQOCWNBoe/Caj5cOzVV2RJRlrC
	YLs9VGwrKYC6yq2LIUtyvnvTlOVvDgVhYP+TddKjXfe/MEmwiDi/BZErDMc/+B/DqLkO0MJjdnrth
	+DQbVQqv5WT5vLoLDqe3nc4QkmzYwv6Z8n6CZu1FKM0uR05rRGCTrEqollvq5pLGYcO1H4n0BKpkx
	tanhg6rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg4CR-00000006lnN-1DPg;
	Thu, 06 Feb 2025 15:53:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg48M-00000006kvz-2Umo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 15:49:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 58DBF5C63F4;
	Thu,  6 Feb 2025 15:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0C5C4CEE5;
	Thu,  6 Feb 2025 15:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738856981;
	bh=kJD6aMoTO7I76BGZFNoXThdgd5zqwB3hMKG+1tg5hBI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QkgFik/RKI89TcGLfUavb6ww03+/l/5gEvBAPfK6F9NCAszRg1DJmv5GulrcJKS42
	 ECiAcxkGdtMTZlgPWgJu8ULz6JV1HVWkl4ewhwj0lShsh5qwcP6A/YNN054DI6zjjO
	 C3HX96gtHt1pGuSCyGtbP6IVT1RzFJK705Yw+nsuOIloq0KUy5wAkNNl6tV4PoEyCr
	 TDYd1ErHsHKrG3dFamfnVIB6nYty5ApkiwJiuvACw6i3FSD96mOMdecn2s74t2U1Jx
	 FNfWeIKXnUpHuHmUihpLYWZQ2+zw8BtCnKesCZr8f6XXhunCMVpNaij3HxsHsS2Ket
	 URcZlKlmbNICQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tg48J-001BOX-Sa;
	Thu, 06 Feb 2025 15:49:39 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v3 04/16] KVM: arm64: nv: Load timer before the GIC
Date: Thu,  6 Feb 2025 15:49:13 +0000
Message-Id: <20250206154925.1109065-5-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250206154925.1109065-1-maz@kernel.org>
References: <20250206154925.1109065-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_074942_675441_3051C5F0 
X-CRM114-Status: GOOD (  13.59  )
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

In order for vgic_v3_load_nested to be able to observe which timer
interrupts have the HW bit set for the current context, the timers
must have been loaded in the new mode and the right timer mapped
to their corresponding HW IRQs.

At the moment, we load the GIC first, meaning that timer interrupts
injected to an L2 guest will never have the HW bit set (we see the
old configuration).

Swapping the two loads solves this particular problem.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 646e806c6ca69..f3ffd8a6aebe2 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -576,8 +576,8 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 nommu:
 	vcpu->cpu = cpu;
 
-	kvm_vgic_load(vcpu);
 	kvm_timer_vcpu_load(vcpu);
+	kvm_vgic_load(vcpu);
 	kvm_vcpu_load_debug(vcpu);
 	if (has_vhe())
 		kvm_vcpu_load_vhe(vcpu);
-- 
2.39.2


