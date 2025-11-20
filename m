Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102EDCF9C77
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ureB8seNOXxtvER5MvqwTnR5PM36IPbwMes+bsnQWL8=; b=KDbH4PWaMT1MGYaPO4Zoeu6dM0
	akQ1PaGq7Q8aa9UIRWcmcTkE3YVGUALcyLaevXgVtFUl1S8qbLv4OTz5IJkx4etkoyVu0zhxfUcyd
	EeqAEeXLwIQUu2phQlm+FsepoG9a2h0XN0gDTqC7DhvZ1K/XfXRLKnAEEsjPGH0GZRKexX1p4agv3
	R6v4rA505RfRYX37CAGt7xtOP7IMaG8NxS1ctRXv23BB9DlOwJtqeLp61Ziq9DeYGBz5jhKwdAfu9
	vBWzsr4Hi8UUpi0NAmJIWy5bO16BP/LjEgkjXDasnOvdOKkX8oYH2a6rJjX+JwsUmnI0qa76nnKXr
	O+TmwLbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Q7-000000075lY-3x7D;
	Thu, 20 Nov 2025 17:26:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Pv-000000075aH-18tL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:25:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B5C01601EC;
	Thu, 20 Nov 2025 17:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C76EC4CEF1;
	Thu, 20 Nov 2025 17:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659558;
	bh=Qxm/npw8Uip8/iAEYKriMxuKyP/eZuOgIrz+o31fqa8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=StqbXxfvsYTf5jBozKkGyNWw0Ibq29md401enXy0Ay8R48lfqzaL1JbsJwRPNXrpn
	 Xf3/lIWrWs4l2DizpunyKY/lQv0JgAml1OsRWcliY8I0oK8ASqjUyaKr8Y25p271MX
	 rP4V+a0sGRRRvZY9gwMYZXx4LMJupQDc9OFkLTRJpaBrZfo1+DZreON09mkShGpCyO
	 ID3L1bEFXeUDeu/OuFpcpOlmBK4W5EkJ4L7gK4OT5XHTj/IB4EiirJ2HYW2xwfXT3a
	 NhF6yYJRzD5lo7oINDJHtcoENS72LXYAqaCLU65PB1K4SnHIR+rZFgvlCCLtEghx/B
	 Tj6lWrBMrlcdg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Ps-00000006y6g-20G2;
	Thu, 20 Nov 2025 17:25:56 +0000
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
Subject: [PATCH v4 11/49] KVM: arm64: GICv3: Preserve EOIcount on exit
Date: Thu, 20 Nov 2025 17:25:01 +0000
Message-ID: <20251120172540.2267180-12-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120172540.2267180-1-maz@kernel.org>
References: <20251120172540.2267180-1-maz@kernel.org>
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

EOIcount is how the virtual CPU interface signals that the guest
is deactivating interrupts outside of the LRs when EOImode==0.

We therefore need to preserve that information so that we can find
out what actually needs deactivating.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/vgic-v3-sr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-sr.c
index e72d436dd6a36..9bfcbfd91118a 100644
--- a/arch/arm64/kvm/hyp/vgic-v3-sr.c
+++ b/arch/arm64/kvm/hyp/vgic-v3-sr.c
@@ -225,6 +225,12 @@ void __vgic_v3_save_state(struct vgic_v3_cpu_if *cpu_if)
 
 		elrsr = read_gicreg(ICH_ELRSR_EL2);
 
+		if (cpu_if->vgic_hcr & ICH_HCR_EL2_LRENPIE) {
+			u64 val = read_gicreg(ICH_HCR_EL2);
+			cpu_if->vgic_hcr &= ~ICH_HCR_EL2_EOIcount;
+			cpu_if->vgic_hcr |= val & ICH_HCR_EL2_EOIcount;
+		}
+
 		write_gicreg(0, ICH_HCR_EL2);
 
 		for (i = 0; i < used_lrs; i++) {
-- 
2.47.3


