Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEECCE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 09:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dycF/AfvGI7erBDaxByd5SMrHEsMfJCe3rrAWOrmqh8=; b=XNOl7fMv2M6Oh50dvWvl02kD2g
	8nudnOcNfCG9Sod3TTSPqg/gkWvM+Qrkb7mxOs2MDOBJTebrHrr34fATWxU9EqcsNe691CxGnXR0m
	ZZfu9kVTeSKup1VI2TSr8+9J2FX/EAWftRi9YnGUvMh9swGqJonI+tvxH/qj/eLwt7GtOcfvMSaG/
	nccC+bsodzBpxrV4d1pL/IlcWAsfxr3UnJpkEAgIY2w4xkpJKtukZ0SOmgpEqw2GBPLsh0S2Q/bCy
	3Ua9sX6bsO5nNKr60ZV5GzClxzokeHYG+qzNWQ4YiJ5Wbr6DpTF9k1v5c+WcpuXdyX8h9mbfSGjH6
	xPO8Bcmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvRr-0000000FmgB-40Ug;
	Mon, 17 Nov 2025 09:22:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvRq-0000000Fmel-0rAs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 09:22:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2384C6023A;
	Mon, 17 Nov 2025 09:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A157C4AF60;
	Mon, 17 Nov 2025 09:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763370941;
	bh=CVwY6QjTysUk+TJ+4eWGwF3UQ2kV890ZxMoP0eVGLxE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vkd2qkPc31XBQ+7SbDtXvamJWJ43A7BJdn+dV2uT2p7Zs9fKZGPGU24M6qYDcmzLs
	 RgzDbjV7c9nDTc3/5wDvifImZyMOqfUsKERE2K8JL9s/tXcz1s3ZSNTV3kN5osa7JU
	 phG64a9cDptRjou9J1AHGf+H0mmRgqjsHPNCZtB9o8P1799ifkGP/IQCghpicReD1E
	 SQcsP92gzWG4f5b9Xb7ydBtklcBFEp7QBbWdjtI7mXnBIrKAj+t9VFXAARul6UN560
	 Z7XvcGBFm92UoS02Y+IrBd2hZ+dOMrKneR0G8er4bjtqWOUkYJz68fBbTpm25Prcw2
	 OCeps4j0qs34g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vKvKl-00000005lB2-1pUi;
	Mon, 17 Nov 2025 09:15:39 +0000
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
Subject: [PATCH v3 4/5] KVM: arm64: GICv3: Remove vgic_hcr workaround handling leftovers
Date: Mon, 17 Nov 2025 09:15:26 +0000
Message-ID: <20251117091527.1119213-5-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251117091527.1119213-1-maz@kernel.org>
References: <20251117091527.1119213-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, tabba@google.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

There's a bizarre or'ing of a 0 with the guest's ICH_HCR_EL2's
value, which is a leftover from the host workaround merging
code. Just kill it.

Fixes: ca30799f7c2d0 ("KVM: arm64: Turn vgic-v3 errata traps into a patched-in constant")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v3-nested.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
index bf37fd3198ba7..40f7a37e0685c 100644
--- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
+++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
@@ -323,10 +323,9 @@ static void vgic_v3_create_shadow_state(struct kvm_vcpu *vcpu,
 					struct vgic_v3_cpu_if *s_cpu_if)
 {
 	struct vgic_v3_cpu_if *host_if = &vcpu->arch.vgic_cpu.vgic_v3;
-	u64 val = 0;
 	int i;
 
-	s_cpu_if->vgic_hcr = __vcpu_sys_reg(vcpu, ICH_HCR_EL2) | val;
+	s_cpu_if->vgic_hcr = __vcpu_sys_reg(vcpu, ICH_HCR_EL2);
 	s_cpu_if->vgic_vmcr = __vcpu_sys_reg(vcpu, ICH_VMCR_EL2);
 	s_cpu_if->vgic_sre = host_if->vgic_sre;
 
-- 
2.47.3


