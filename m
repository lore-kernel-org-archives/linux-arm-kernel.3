Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23FAC98304
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 21:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iA22YnUtIcv1KaIC572i8+H/hJXB2ylgtwm/SjWDh5A=; b=WXpdZI0c+TVHDVtjtCl5Nranr0
	gdP/g7RfMqcFzVi2lwpU6V1CuVhJY8Kr3YOnTlUCeeoon2rC1g0wa/ZTYo9Un25RUBWfhlTkl9zFv
	UaN8E6zXSiF6sITSEDe08IDmSrtD++pSvby89Zhay3FrB017nw7VrSo+HiEGjgVZU+UHPC1vqZZRL
	YAAnha0rnJPa6GuIz9M0c7THXkSZgMD+ApROzBoJoA43V8CtP03mgiINeF4PtUEjuxzKnUSrAIHeV
	CVvaa004bfK1lX9H+NbaKa7ntAP/z95FQk+GOZq1tUuR2OcbfP5ORkVqvzYeqf+mnlYdSFZumMcBf
	TCkDtiSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98Fu-00000006dQN-0XUR;
	Tue, 22 Sep 2026 21:42:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98Ft-00000006dP7-1vUB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 21:42:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D9D7F43E2F;
	Tue, 22 Sep 2026 21:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B989E1F00893;
	Tue, 22 Sep 2026 21:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790113344;
	bh=iA22YnUtIcv1KaIC572i8+H/hJXB2ylgtwm/SjWDh5A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=A0RqsZ1DPb87+r55lcOxquYoRHIjAVabDJY/tFh3pdh1Fclip7K/G2yXByFVzSPJe
	 TJ5j7F0k13Hc2BnPeig+ZJ3sH9GyGCk2yPzhc4ry6aEvoR4aF3eMzCVsSQZ75xg+CZ
	 0kDlYz1Bptkc5AVDw2/Nky0bHrhEQdB5f+SpNF/34FkXjER/JSATKviMvjTFRGF+aY
	 WV46AK10FVS7ukci2/7R4/66UoNw6mH+07lE1QHxArYfm7rjZg2+ZtwU0+oK3u+Bnp
	 bTWhqjWpMD029jav0pFByUbYqafhHAGoa6mYjqT86PdMWNrH0N8hDSyDx6iKVczgjM
	 GtmHgyr07e6Zg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1x98Fq-0000000CFxJ-2kHw;
	Tue, 22 Sep 2026 21:42:22 +0000
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
Subject: [PATCH 1/3] KVM: arm64: vgic: Allow last_lr_irq to be NULL when LRs are not overflowing
Date: Tue, 22 Sep 2026 22:42:10 +0100
Message-ID: <20260922214212.3327146-2-maz@kernel.org>
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

last_lr_irq is always populated when there is any interrupt populated in
the AP list. Not only this is not necessary (it is only useful when we
completely fill the LRs), but this is in the way of further fixes.

Make sure last_lr_irq is kept to NULL when we LRs are not completely
full.

Fixes: 6da5e537f5afe ("KVM: arm64: vgic: Pick EOIcount deactivations from AP-list tail")
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/kvm/vgic/vgic-v2.c | 6 ++++--
 arch/arm64/kvm/vgic/vgic-v3.c | 6 ++++--
 arch/arm64/kvm/vgic/vgic.c    | 8 +++-----
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index 7182f63fc9382..70cc53ba810ad 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -122,6 +122,10 @@ void vgic_v2_fold_lr_state(struct kvm_vcpu *vcpu)
 	for (int lr = 0; lr < vgic_cpu->vgic_v2.used_lrs; lr++)
 		vgic_v2_fold_lr(vcpu, cpuif->vgic_lr[lr]);
 
+	cpuif->used_lrs = 0;
+	if (!irq)
+		return;
+
 	/* See the GICv3 equivalent for the EOIcount handling rationale */
 	list_for_each_entry_continue(irq, &vgic_cpu->ap_list_head, ap_list) {
 		u32 lr;
@@ -144,8 +148,6 @@ void vgic_v2_fold_lr_state(struct kvm_vcpu *vcpu)
 		vgic_v2_fold_lr(vcpu, lr);
 		eoicount--;
 	}
-
-	cpuif->used_lrs = 0;
 }
 
 void vgic_v2_deactivate(struct kvm_vcpu *vcpu, u32 val)
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 726e20a1da6e7..346bacb3198f2 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -155,6 +155,10 @@ void vgic_v3_fold_lr_state(struct kvm_vcpu *vcpu)
 	for (int lr = 0; lr < cpuif->used_lrs; lr++)
 		vgic_v3_fold_lr(vcpu, cpuif->vgic_lr[lr]);
 
+	cpuif->used_lrs = 0;
+	if (!irq)
+		return;
+
 	/*
 	 * EOIMode=0: use EOIcount to emulate deactivation. We are
 	 * guaranteed to deactivate in reverse order of the activation, so
@@ -188,8 +192,6 @@ void vgic_v3_fold_lr_state(struct kvm_vcpu *vcpu)
 		vgic_v3_fold_lr(vcpu, lr);
 		eoicount--;
 	}
-
-	cpuif->used_lrs = 0;
 }
 
 void vgic_v3_deactivate(struct kvm_vcpu *vcpu, u64 val)
diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index b25303d9919fd..425503e0c5825 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -866,9 +866,6 @@ static void vgic_fold_state(struct kvm_vcpu *vcpu)
 		return;
 	}
 
-	if (!*host_data_ptr(last_lr_irq))
-		return;
-
 	if (kvm_vgic_global_state.type == VGIC_V2)
 		vgic_v2_fold_lr_state(vcpu);
 	else
@@ -1021,11 +1018,12 @@ static void vgic_flush_lr_state(struct kvm_vcpu *vcpu)
 		scoped_guard(raw_spinlock,  &irq->irq_lock) {
 			if (likely(vgic_target_oracle(irq) == vcpu)) {
 				vgic_populate_lr(vcpu, irq, count++);
-				*host_data_ptr(last_lr_irq) = irq;
+				if (count == kvm_vgic_global_state.nr_lr)
+					*host_data_ptr(last_lr_irq) = irq;
 			}
 		}
 
-		if (count == kvm_vgic_global_state.nr_lr)
+		if (*host_data_ptr(last_lr_irq))
 			break;
 	}
 
-- 
2.47.3


