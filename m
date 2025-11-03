Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F3FCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AgA3CYpLeqEQbsNh6Xe6jRDBzYl0Bu5jZNW8Fb8ensI=; b=VRpLeMC8FXrJ0l5P6JQKiMWY75
	81BAx5Nm52KBXneXui20GNEiavMI9a48RRz7lZoGzg5wwC1CP4uJ/txTQWCrFrWmXT3Y0u6XV10RS
	kfN7wfqt1+w4LRr80TWPmBB5e3bNboaeoQW/q/Jo2QpSPKx5fICpkWMUMmyR+mqi9tA6zM1rrlWa/
	vTdXUdEjAUJ848OFD2p36Ackv3k2Mx+5zEdtb+WpbxWI7DosixjfZyYiy+7JLvZF6n7R0REnzRXSF
	wY1Rc7FtAhYPRF18MkBBeHI36RZompOKXZVkSzfIXBVjWL4td/4vttrT4FwTW1ZCThhaOpQGXFZZz
	OIsFl1aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxqY-0000000AKmy-0BT5;
	Mon, 03 Nov 2025 16:55:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxq8-0000000AJzO-3rWL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:55:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C2E4B43CDD;
	Mon,  3 Nov 2025 16:55:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A71F7C116D0;
	Mon,  3 Nov 2025 16:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762188932;
	bh=iqZcVcEEAlkxkd+PUiY5mjGb5FYWhKWCcmecb4qtFAw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RjIb8ziAti490KyjyrE0X6LDN3hVg2jlPjgzrl+gC4GyYQbNyuNn21HFQaycOnQuE
	 RKDWuaIiFPQdkNJhVD/9PnYrUU/elhQ+VCb66Rp9u7kbl3exIULpxy55VIYvvCMr5W
	 33IuxAQgtC3QjuSZlfuOlMidIc3mXNBd2ke5GkWYcbjee8U3FUvYZiozaoi2mP9AE2
	 0Sazw8BG4JkPM9pE7qU0ydUzz/gp+xV3f7BFZ5I8Uo45I6XKOn1Mhh22FBbyXUrA3y
	 dlLgGE57PZxw/u4ZfeIuNeL/mPqXGWCDtO5TZszHFLcp2kDUfm9ykQr1SnLSsvIM6Z
	 qMh3cW8ueFSqQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vFxq6-000000021VN-3ph0;
	Mon, 03 Nov 2025 16:55:31 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 26/33] KVM: arm64: GICv3: Handle LR overflow when EOImode==0
Date: Mon,  3 Nov 2025 16:55:10 +0000
Message-ID: <20251103165517.2960148-27-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103165517.2960148-1-maz@kernel.org>
References: <20251103165517.2960148-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_085533_060404_E86E6DD1 
X-CRM114-Status: GOOD (  16.97  )
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
 arch/arm64/kvm/vgic/vgic-v3.c | 45 +++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index e18b13b240492..14b35a62e2981 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -109,16 +109,61 @@ static void vgic_v3_fold_lr(struct kvm_vcpu *vcpu, u64 val)
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
+	 * just pick one interrupt after the other in the overflow list, and
+	 * replay the deactivation as if the CPU was doing it. We also rely
+	 * on priority drop to have taken place.
+	 */
+	list_for_each_entry(irq, &vgic_cpu->overflow_ap_list_head, ap_list) {
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


