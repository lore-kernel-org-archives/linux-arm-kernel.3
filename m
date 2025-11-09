Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF04CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 17:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDmZOOMGbg5zaXFGpjgHUnSUUTzguw9ClX4Qk88uC3E=; b=ZcnQJ7qU0S0gAMfsZXzNftWzLI
	Nn1/2zb4XcneP7z1Raak3hRtKAi8bNzjpRdJUTSQ//3AyXC5kSP2Ynb1lH4oaKD0jD/6bygnBGPWs
	jMaHfBEN/ji47SjNqM0qnd8ycd46Oif5NfH+ec+WTlljbTyDH53vdpPCfQOPmTGJxVdXBYkaOdo/G
	vNSE+L/r4cHas7iZQdFXIenzJpmGL5UZSd4TUTMp76dRL1ANTX4KKoL+EgKLMbSIlE6OWK15+C6+c
	IHApsKefKpaJ2mmLLrS3u4K9iVFNn/NSgjRO4J7xooqkCC5MjwNQ4mB85Se4uuFL6lZiMpys8JSBu
	/8JI+6Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI92a-00000004DCL-1GGG;
	Sun, 09 Nov 2025 17:17:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91o-00000004CFz-2v5X
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 17:16:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A63043F89;
	Sun,  9 Nov 2025 17:16:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489C4C16AAE;
	Sun,  9 Nov 2025 17:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762708596;
	bh=CiJ1PnLwlcVRUivVT2Z2xoI1yiqxdUthVumxqrnUjJE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h/WFmg9piPeSz/SWtLwjRT9icfbPNi26Z6neG8UdC0835KHxiVFG39QL/64f+54PX
	 yJ0eVgdYLFZ+X8YDBQeHqogXJZo9XyU7s7YpCJph9k1/zHKDk8pTE+2dZ/6h9aBmsD
	 K79S0JVh4jjpK3adeq+mvK4gB9269MtID8e3972howRZlqNkINmhnQqwWczmnYswHo
	 E2n9HPfrKLybYI0Fz+bakHnzYtO/cPz9R29urw52hSHHGbjSzn71Eza1orI/Ksy7Fw
	 1VldZzS2xOAqPO8YO/PUUrxe2pprUR2Qy/mvs79InOo1PcpZSQBSPgYFP/NRIRxfHt
	 ww6GicmeC0o0Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vI91m-00000003exw-1kIb;
	Sun, 09 Nov 2025 17:16:34 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: [PATCH v2 26/45] KVM: arm64: GICv3: Handle LR overflow when EOImode==0
Date: Sun,  9 Nov 2025 17:16:00 +0000
Message-ID: <20251109171619.1507205-27-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251109171619.1507205-1-maz@kernel.org>
References: <20251109171619.1507205-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com, yaoyuan@linux.alibaba.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_091636_931446_FA916E56 
X-CRM114-Status: GOOD (  17.88  )
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

Now that we can identify interrupts that have not made it into the LRs,
it becomes relatively easy to use EOIcount to walk the overflow list.

What is a bit odd is that we compute a fake LR for the original
state of the interrupt, clear the active bit, and feed into the existing
logic for processing. In a way, this is what would have happened if
the interrupt was in an LR.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v3.c | 46 +++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index b5cf68bc1ea9f..e17eefc6a2bb6 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -109,16 +109,62 @@ static void vgic_v3_fold_lr(struct kvm_vcpu *vcpu, u64 val)
 	vgic_put_irq(vcpu->kvm, irq);
 }
 
+static u64 vgic_v3_compute_lr(struct kvm_vcpu *vcpu, struct vgic_irq *irq);
+
+static void vgic_v3_deactivate_phys(u32 intid)
+{
+	if (cpus_have_final_cap(ARM64_HAS_GICV5_LEGACY))
+		gic_insn(intid | FIELD_PREP(GICV5_GIC_CDDI_TYPE_MASK, 1), CDDI);
+	else
+		gic_write_dir(intid);
+}
+
 void vgic_v3_fold_lr_state(struct kvm_vcpu *vcpu)
 {
 	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
 	struct vgic_v3_cpu_if *cpuif = &vgic_cpu->vgic_v3;
+	u32 eoicount = FIELD_GET(ICH_HCR_EL2_EOIcount, cpuif->vgic_hcr);
+	struct vgic_irq *irq;
 
 	DEBUG_SPINLOCK_BUG_ON(!irqs_disabled());
 
 	for (int lr = 0; lr < cpuif->used_lrs; lr++)
 		vgic_v3_fold_lr(vcpu, cpuif->vgic_lr[lr]);
 
+	/*
+	 * EOIMode=0: use EOIcount to emulate deactivation. We are
+	 * guaranteed to deactivate in reverse order of the activation, so
+	 * just pick one active interrupt after the other in the ap_list,
+	 * and replay the deactivation as if the CPU was doing it. We also
+	 * rely on priority drop to have taken place, and the list to be
+	 * sorted by priority.
+	 */
+	list_for_each_entry(irq, &vgic_cpu->ap_list_head, ap_list) {
+		u64 lr;
+
+		/*
+		 * I would have loved to write this using a scoped_guard(),
+		 * but using 'continue' here is a total train wreck.
+		 */
+		if (!eoicount) {
+			break;
+		} else {
+			guard(raw_spinlock)(&irq->irq_lock);
+
+			if (!(likely(vgic_target_oracle(irq) == vcpu) &&
+			      irq->active))
+				continue;
+
+			lr = vgic_v3_compute_lr(vcpu, irq) & ~ICH_LR_ACTIVE_BIT;
+		}
+
+		if (lr & ICH_LR_HW)
+			vgic_v3_deactivate_phys(FIELD_GET(ICH_LR_PHYS_ID_MASK, lr));
+
+		vgic_v3_fold_lr(vcpu, lr);
+		eoicount--;
+	}
+
 	cpuif->used_lrs = 0;
 }
 
-- 
2.47.3


