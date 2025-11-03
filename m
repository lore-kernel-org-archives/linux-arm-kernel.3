Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FA8CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BSZKp+CTbC/juGEwfe1E0S+DQT2iDsNYR4daDIU6XnM=; b=A2LsxLqTzBSxZWSxPn7cQe76Tc
	NX7+H7OCS16UErVoKP/FzcnIjkXdrCc8cVmUj2UHZI/uXnWFYZH+IhRjaL1Mz2nYFivb9Lrsl+vXk
	HFCqHO+/cDdtfRUeBp5jbmYp70QFmrOdaLuyaDtSOWULBoX7q11Sw7kJDYoLemFxlr611xC095600
	q8I08P1ZQP2uioqYkUmMnCmZ81Vb0yDHZbxUw75kV7Zzlye9GfzEPR69Bd8BEgyLDVwLSjfOenywZ
	RPwtt27PFZVR63hhi7c9fJfR77NyjkFa3iuH1gxLZ7oo+EqXkHLQiNaucTtyqbsMWAeWltNegJCwh
	e8tZq23Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxqZ-0000000AKqf-48Gj;
	Mon, 03 Nov 2025 16:56:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxq9-0000000AK4y-2sa1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:55:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BE1343C4C;
	Mon,  3 Nov 2025 16:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C04C116C6;
	Mon,  3 Nov 2025 16:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762188933;
	bh=ktPDDt0AeT9/A9wvjteRm8cEmxv56YYt5i4uc806DiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LFGCEY0TzJrhsO/SMzKka6pUAX9U/A6cax8SBTa9iw+SrYcwTUZnB3qTgxe1CFoll
	 jswIEwAYOC6/5zogOwlSv3+fsFy00Yd3CBd5ZEZ2n8wSHDpTYqItqaAz2z6xWD6liq
	 iCu3MyRNLst74rf4EPW9r0ZSI34vdY6pbHNgpHabSz5FNnL8ErQoLOLjSFHNR6/H5F
	 eBZcUSeHetsqX59Cbc74umaknE3gic+pRt2QztfakQWAUyXZ7jnIauZIe0KwE5VfDw
	 JCMV4EdXXHaHTkAsq3T4gbDsN5CRRtNAVhW36HfgnO0ovrQI35qMXUB+5g2lLyuSb5
	 Wh2pzfP/X7NNQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vFxq7-000000021VN-1gvo;
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
Subject: [PATCH 28/33] KVM: arm64: GICv3: Add GICv2 SGI handling to deactivation primitive
Date: Mon,  3 Nov 2025 16:55:12 +0000
Message-ID: <20251103165517.2960148-29-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20251103_085533_805213_F7058813 
X-CRM114-Status: GOOD (  15.71  )
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

The GICv2 SGIs require additional handling for deactivation, as they
are effectively multiple interrrupts muxed into one. Make sure we
check for the source CPU when deactivating.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v3.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index be8e9f6b1da71..5131a9bfeffb3 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -177,11 +177,20 @@ void vgic_v3_deactivate(struct kvm_vcpu *vcpu, u64 val)
 {
 	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
 	struct vgic_v3_cpu_if *cpuif = &vgic_cpu->vgic_v3;
+	u32 model = vcpu->kvm->arch.vgic.vgic_model;
 	struct kvm_vcpu *target_vcpu = NULL;
+	bool mmio = false, is_v2_sgi;
 	struct vgic_irq *irq;
 	unsigned long flags;
-	bool mmio = false;
 	u64 lr = 0;
+	u8 cpuid;
+
+	/* Snapshot CPUID, and remove it from the INTID */
+	cpuid = FIELD_GET(GENMASK_ULL(12, 10), val);
+	val &= ~GENMASK_ULL(12, 10);
+
+	is_v2_sgi = (model == KVM_DEV_TYPE_ARM_VGIC_V2 &&
+		     val < VGIC_NR_SGIS);
 
 	/*
 	 * We only deal with DIR when EOIMode==1, and only for SGI,
@@ -214,6 +223,9 @@ void vgic_v3_deactivate(struct kvm_vcpu *vcpu, u64 val)
 	 *   and queue a request to prune the resulting ap_list,
 	 *
 	 * - Or the irq is not active, and there is nothing to do.
+	 *
+	 * Special care must be taken to match the source CPUID when
+	 * deactivating a GICv2 SGI.
 	 */
 	scoped_guard(raw_spinlock, &irq->irq_lock) {
 		target_vcpu = vgic_target_oracle(irq);
@@ -237,6 +249,12 @@ void vgic_v3_deactivate(struct kvm_vcpu *vcpu, u64 val)
 			goto put;
 		}
 
+		/* GICv2 SGI: check that the cpuid matches */
+		if (is_v2_sgi && irq->active_source != cpuid) {
+			target_vcpu = NULL;
+			goto put;
+		}
+
 		/* (with a Dalek voice) DEACTIVATE!!!! */
 		lr = vgic_v3_compute_lr(vcpu, irq) & ~ICH_LR_ACTIVE_BIT;
 	}
-- 
2.47.3


