Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF47CF9C73
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTX43mCIVSwnV8LhatKvxRFjWuthfngzmKR81U6sBzs=; b=SN3ZePLdfSM6qdi/fX8PLiBqr4
	z0l/7LcU26DPs/oAUfUZ/Uf0taorjT13gE8G3vilPfDs2yr1WwZC/RKpWHiei8zjH2s9mtfH9ZyoC
	dcLdyx9ATcRa3r3liffXF/g+BNk6UroEiJeNsL+IfQ8eWIrfXebqya2Br9Ac6vqhqyGPj3myQmPWE
	cno4gDDNU+l1HQ9IG81cnr6Y/yymav5LWpEtESga9LKwVAofP74jUDLNZpeOdSvXA6/5kpnFO6S7j
	9s6bpa+g97WG3E1YB4gPFTdszE/KvAeUtWSb8ICb60NxQ46of4EdZ9y+UnYRRcjHU7Enu3ov2w9lp
	FTGW0nuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8QS-000000076Tu-43Ge;
	Thu, 20 Nov 2025 17:26:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Q1-000000075gw-2pvo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:26:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E89C44420;
	Thu, 20 Nov 2025 17:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41396C4CEF1;
	Thu, 20 Nov 2025 17:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659565;
	bh=cRS4kAA0Vgfod9v7K2vTkuWwsLyxveyvdNB8H0bRqHY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zxya5X6YMY8GZqybGkaVqNlwhhOOD6oftaLqcSVIAQLhywKOrMBCJNy52kr3YQFc0
	 OmDTBlMlCL8Twt38AwQqaG2WX/GHMGA+3vhbL0VBTWMAfSQNUcWwRFNi1Va32xdjTe
	 3KXKSQLpzbLSTIj26yMrItyk26yL1q9lXB+P1cyFBB/JRnNrk/mV5obEPNW34gQWhz
	 euupH/JKmBVpUb/TssemEiFy1orxqlkPwNpc8LaCwGiyTQQxQu960iNIGJlIXxyiJI
	 Dm9MoA316KS7Kov4LrpQEHTu3KBMzFEiqnm1g9o8/uSoB5TTlsTuorTCUe9aLIqNw8
	 qgzNYR8W/Ir3A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Pz-00000006y6g-1rYM;
	Thu, 20 Nov 2025 17:26:03 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 39/49] KVM: arm64: GICv2: Always trap GICV_DIR register
Date: Thu, 20 Nov 2025 17:25:29 +0000
Message-ID: <20251120172540.2267180-40-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120172540.2267180-1-maz@kernel.org>
References: <20251120172540.2267180-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, tabba@google.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_092605_766085_B8414249 
X-CRM114-Status: GOOD (  12.98  )
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

Since we can't decide to trap the DIR register on a per-vcpu basis,
always trap the second page of the GIC CPU interface. Yes, this is
costly. On the bright side, no sane SW should use EOImode==1 on
GICv2...

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c | 4 ++++
 arch/arm64/kvm/vgic/vgic-v2.c            | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c b/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c
index 78579b31a4205..5fd99763b54de 100644
--- a/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c
+++ b/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c
@@ -63,6 +63,10 @@ int __vgic_v2_perform_cpuif_access(struct kvm_vcpu *vcpu)
 		return -1;
 	}
 
+	/* Handle deactivation as a normal exit */
+	if ((fault_ipa - vgic->vgic_cpu_base) >= GIC_CPU_DEACTIVATE)
+		return 0;
+
 	rd = kvm_vcpu_dabt_get_rd(vcpu);
 	addr  = kvm_vgic_global_state.vcpu_hyp_va;
 	addr += fault_ipa - vgic->vgic_cpu_base;
diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index bc52d44a573d5..585491fbda807 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -457,7 +457,7 @@ int vgic_v2_map_resources(struct kvm *kvm)
 	if (!static_branch_unlikely(&vgic_v2_cpuif_trap)) {
 		ret = kvm_phys_addr_ioremap(kvm, dist->vgic_cpu_base,
 					    kvm_vgic_global_state.vcpu_base,
-					    KVM_VGIC_V2_CPU_SIZE, true);
+					    KVM_VGIC_V2_CPU_SIZE - SZ_4K, true);
 		if (ret) {
 			kvm_err("Unable to remap VGIC CPU to VCPU\n");
 			return ret;
-- 
2.47.3


