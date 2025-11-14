Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30C5CE7A9C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 09:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AAoXQ7iI4ZyeeuQAsdTU840iKTSIhVqiR9PlaJDJRh4=; b=rksPMVhRs4Cvo9B/5XEWOifYDF
	8ELLmew2jrB+8i0RN9m4tieR2CG9MJ9Dr8fE9ySyQhWBTT4OXSjmT8unAEIafqhyHvUaR6TqwIEqW
	c9mf5rSxhwOYlhBzyxFAs+Jyb1h06pkEjv4SFLjkMPp8lg3To068uhTwyEX1rhFRGq28T+Rmd7u1T
	/vZmKIFtRobwVKvxVWr8QkSHTOaeoNa8ZtdIo52xVxbkbQzgMx7x+HEL6c4pHR2eNr0RBJaGfwzDE
	bccbxh5eeUOKNZdZTaG/zAhiq4AhPuFfSDrMk03pmpTInHTN4v22u6c6bGi223Wkff+rLSkN7ekI4
	ytncye4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqDg-0000000BvVz-48uM;
	Fri, 14 Nov 2025 09:35:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqDd-0000000BvUk-3UCK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 09:35:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2AE8D44558;
	Fri, 14 Nov 2025 09:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F32C4CEF5;
	Fri, 14 Nov 2025 09:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763112949;
	bh=3ECJbNj4u/wYCSmp3UoVaafBaARdBIhPbmRR5Xh4Rx8=;
	h=From:To:Cc:Subject:Date:From;
	b=ij77f9+bCKnjVqUFOEvNPJsPx9Y/ATmTL5CZY0Sz7s3U9RdJ+I6dtUrnSASDkv3bt
	 Ccq8bP4WAiY93Xqrid7H+RELHnkl0aDwQhdiKmN1/w/iOZMp8IRB1N2yleYFs3BlbR
	 QXzEuK7ItsUATWzfgQoxw90PZ85eugnwh3Qct/sRGih2G4k1uQzbjZmvn7RBnqJnoA
	 93LMm6XsJuuld3sQq0gOLLhEJAQIuRhwnEjQKhUmRRhryrvQVxXB77dzc7jX22XCWC
	 Vshed3PUYgvnP8qYpLaC4/s7fD3h/UQRZyJJsn0eyg9RxswRgGmAmuGpDnEnzAllzW
	 04kjiBf/qPRLA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vJqDa-000000059rP-2RMj;
	Fri, 14 Nov 2025 09:35:46 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] KVM: arm64: GICv3: Don't advertise ICH_HCR_EL2.En==1 when no vgic is configured
Date: Fri, 14 Nov 2025 09:35:41 +0000
Message-ID: <20251114093541.3216162-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_013549_891488_1983FFC7 
X-CRM114-Status: UNSURE (   9.98  )
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

Configuring GICv3 to deal with the lack of GIC in the guest relies
on not setting ICH_HCR_EL2.En in the shadow register, as this is
an indication of the fact that we want to trap all system registers
to report an UNDEF in the guest.

Make sure we leave vgic_hcr untouched in this case.

Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/r/72e1e8b5-e397-4dc5-9cd6-a32b6af3d739@sirena.org.uk
Fixes: 877324a1b5415 ("KVM: arm64: Revamp vgic maintenance interrupt configuration")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v3.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 598621b14a30d..1d6dd1b545bdd 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -26,6 +26,9 @@ void vgic_v3_configure_hcr(struct kvm_vcpu *vcpu,
 {
 	struct vgic_v3_cpu_if *cpuif = &vcpu->arch.vgic_cpu.vgic_v3;
 
+	if (!irqchip_in_kernel(vcpu->kvm))
+		return;
+
 	cpuif->vgic_hcr = ICH_HCR_EL2_En;
 
 	if (irqs_pending_outside_lrs(als))
-- 
2.47.3


