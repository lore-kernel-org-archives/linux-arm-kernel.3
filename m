Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B3610A88E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 15:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RuVJQJOLtLr1GKKthr7khvXSIsMQ4qS3xKBVcZkbFV8=; b=XkRd+Z2icwYLd8Wjc8B/8r48/5
	rgdTPcxMdYSP41VoPDrqkMuPxrmQvyL4nYAfeT17OjpJbs0kGhvZsIK3q1pyPqnGpJsHvaWvBjgse
	fueXY/kPrhY29sZSSAdRsvjvzjEILQul9jyAL8vdt7s+7MPCoPq9OmcbNhrgTCDXlPbqoYcwCRb+D
	eedpA94B1quuDgV/hsSXplaWxxIjh5qzT26VXpY8+e2m443Z5UGfvjLlLwpKPAL2BoTIIhHR7GRkD
	vm14ah1ukcbkNLX0VooduyPoPSNjtjNp6wzHywXmfZx4m2uDkdigf32KsCW3KA9lNcK+HwNCPT0hh
	lu/o1DUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkQ-00000005lGF-3R1x;
	Thu, 26 Mar 2026 15:35:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkG-00000005l5u-20co
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 15:35:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA911417B9;
	Thu, 26 Mar 2026 15:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC68CC19423;
	Thu, 26 Mar 2026 15:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774539338;
	bh=2fYqiw6OHmz+dB7/Hu1w+XYzk0VxCs/creDSwdedOIA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sq+JQyyLJC6FhrALSKJJgwYNXXxmlQBGU43NDO8+lIs5W9eE2pTR69hH4HKhzHIck
	 kzTZK4D0HmKFlPnbshBFaFPAYy5JGAxM40p0tD4WqoLcIHNHhtME/XSaoZOm4VIKPJ
	 NljiNAVLnTRAqJpNkjdma3F2bXkzqDCcjnydHtGsd5St5Kmio8B90vdqF75qqCI98t
	 sSSNL/ZTlncHCx/go69cKHNOrvY1IQMBOEnueqhDf/5HI4jsoPRveDnFHMSnYePhKb
	 lprjaq0Vm3z/Zx2py0b4CCszPME5fQNVRL/hrFlIVRAaP2LKeOqFrZSh+XqtHkvm8O
	 uDWztHBzXf3gA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w5mkD-000000060II-0F6r;
	Thu, 26 Mar 2026 15:35:37 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 13/15] KVM: arm64: Move GICv5 timer PPI validation into timer_irqs_are_valid()
Date: Thu, 26 Mar 2026 15:35:28 +0000
Message-ID: <20260326153530.3981879-14-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260326153530.3981879-1-maz@kernel.org>
References: <20260326153530.3981879-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_083540_725553_53298326 
X-CRM114-Status: GOOD (  14.19  )
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

Userspace can set the timer PPI numbers way before a GIC has been
created, leading to odd behaviours on GICv5 as we'd accept non
architectural PPI numbers.

Move the v5 check into timer_irqs_are_valid(), which aligns the
behaviour with the pre-v5 GICs, and is also guaranteed to run
only once a GIC has been configured.

Fixes: 9491c63b6cd7b ("KVM: arm64: gic-v5: Enlighten arch timer for GICv5")
Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arch_timer.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 6608c47d1f628..cbea4d9ee9552 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -1543,6 +1543,10 @@ static bool timer_irqs_are_valid(struct kvm_vcpu *vcpu)
 		if (kvm_vgic_set_owner(vcpu, irq, ctx))
 			break;
 
+		/* With GICv5, the default PPI is what you get -- nothing else */
+		if (vgic_is_v5(vcpu->kvm) && irq != get_vgic_ppi(vcpu->kvm, default_ppi[i]))
+			break;
+
 		/*
 		 * We know by construction that we only have PPIs, so all values
 		 * are less than 32 for non-GICv5 VGICs. On GICv5, they are
@@ -1678,13 +1682,6 @@ int kvm_arm_timer_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
 		return -ENXIO;
 	}
 
-	/*
-	 * The PPIs for the Arch Timers are architecturally defined for
-	 * GICv5. Reject anything that changes them from the specified value.
-	 */
-	if (vgic_is_v5(vcpu->kvm) && vcpu->kvm->arch.timer_data.ppi[idx] != irq)
-		return -EINVAL;
-
 	/*
 	 * We cannot validate the IRQ unicity before we run, so take it at
 	 * face value. The verdict will be given on first vcpu run, for each
-- 
2.47.3


