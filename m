Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDF0C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 21:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JI7EXFtD8nct3k80/WZ56pI4cZh/f9aZ7DXMwMK2D/8=; b=fRXqMKZYpwfIIcI2eA7LEskP7T
	9td+ws5VLqnpYHSriJYBm1/a+SA70O5PAVoo9Bz9t6Z6Zhyc2JqOh6Zlva+QXD0evrck3/09HqDiF
	I31hyWib0c1l+XNzEXtfSuYgjV88wgnYNY/bej6DOPV0mAfw9JvWlwiYSiB+287XpZjtZ5MRROf/s
	CgQpaeBzEkAN7+BklBpVQBTSG40V7TgDukRpgBawZfmp1Nipxjo7miQWhItgVm17kOwhinqhAackP
	zASk6dweSm3hwO9JPCt//Q7RktJjbdb65sBzirQsHnaWSWu6NCCrF4CvEpa8q7DsfZzAB8BXI5LPq
	cUxV9yPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98Ft-00000006dPS-3SnV;
	Tue, 22 Sep 2026 21:42:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98Ft-00000006dP8-1vTP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 21:42:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0738643E88;
	Tue, 22 Sep 2026 21:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73E91F0089B;
	Tue, 22 Sep 2026 21:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790113344;
	bh=JI7EXFtD8nct3k80/WZ56pI4cZh/f9aZ7DXMwMK2D/8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ya5A6rHNx7hQ40SvIJCp08q5QFMGYTTckXXph4KY2gDu6gfBuo6pHbHVE55FRlIIK
	 0FJs516x3zbPr2H+VdN8uEi1zr0nfGid8ZCspHmR6U161Ctkfy/D6YH828AjbOLe6h
	 0QeBr+NdsmNa4mnM1KzdjZx4boKNVUhZFL/i7z8SVzo7bpaO3AAaqHKg7jNu1cQecE
	 HTjRa2VzBv/wxCJNbjzzM50SGRDCamXOxv8ZGFQK39twt9M8+shLLpioS30vm5kmE9
	 uR5B6VdwRXK9HFlb5CehheG2vDKePB7Y3LnhRt9V5e6+y+giEo/Joripla93AIcoJ7
	 koAKtD6ed0Xhg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1x98Fr-0000000CFxJ-0Ehb;
	Tue, 22 Sep 2026 21:42:23 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH 3/3] KVM: arm64: vgic: Stop the VM when disabling LPIs
Date: Tue, 22 Sep 2026 22:42:12 +0100
Message-ID: <20260922214212.3327146-4-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922214212.3327146-1-maz@kernel.org>
References: <20260922214212.3327146-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev, ndaugoing@gmail.com
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

Disabling LPIs is pretty nasty, as it directly messes with the AP list
of the affected CPU, which could be running... This has the potential to
lead to really bad behaviours, and we should not be doing that.

Take example on the way the Active state is handled and simply pause all
the vcpus so that we are sure they are all in a quiescent state, and the
state be safely manipulated.

Nobody has any expectation of performance for this anyway.

Fixes: 96085b949672d ("KVM: arm/arm64: vgic-v3: Retire pending interrupts on disabling LPIs")
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/kvm/vgic/vgic-mmio-v3.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index 5913a20d83019..adefc42964732 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -303,9 +303,19 @@ static void vgic_mmio_write_v3r_ctlr(struct kvm_vcpu *vcpu,
 		if (ctlr != GICR_CTLR_ENABLE_LPIS)
 			return;
 
+		/*
+		 * Yes, disabling LPIs is painful, since it can be done from
+		 * a *remote* vcpu! So let's not take any chance, and make
+		 * sure that everybody has written their LRs back to the irq
+		 * structures, and release any reference they would have.
+		 *
+		 * If it hurts, don't do it.
+		 */
+		kvm_arm_halt_guest(vcpu->kvm);
 		vgic_flush_pending_lpis(vcpu);
 		vgic_its_invalidate_all_caches(vcpu->kvm);
 		atomic_set_release(&vgic_cpu->ctlr, 0);
+		kvm_arm_resume_guest(vcpu->kvm);
 	} else {
 		ctlr = atomic_cmpxchg_acquire(&vgic_cpu->ctlr, 0,
 					      GICR_CTLR_ENABLE_LPIS);
-- 
2.47.3


