Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0CFCF9C72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FICOLob8Dwlz5mUmr0E7aR/EOTDf+/lnlaaJYn49QCM=; b=QmFoTqBD0oabri6+5ZN7w/DHzg
	PnLwJurXMBq1K2zKxozhi+zDntnjKlVcUywDl1qYDpZK1ZBKsVRY0Wm+QSNI8RgZI8V6YmbAiZ9/T
	ucJRZTxWulRTQlClVNBAEtT9Rb8Yk9tmDesc1i8pq2RUqOSGzTwG4wq8uWRn7z2/3f8GFpOfG5gVx
	I1mdWobyoKbbYHVMqeDZm323R/XVv4+ez0na8/1ySNWQiJ7zbHXj5DLRu+bTmHvKRYIOIET/2dXDp
	hVf3z5iVmfllS+KImgof+R04S1AwfyVu5f4Ac04ebhiJAO7EngvFNP/9LRkUKo2O7PKVrv/jmb/q3
	dhitDsow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Qq-0000000776M-0twJ;
	Thu, 20 Nov 2025 17:26:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Q7-000000075kE-1xIQ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 20 Nov 2025 17:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FICOLob8Dwlz5mUmr0E7aR/EOTDf+/lnlaaJYn49QCM=; b=C67MPPgjCY4NyL9ID4ZHhTmmIT
	J6HTCxCRo5ccX4S0LVs8nNQYOk5SXbhONC2ae3vaMQgyDqHZUY28ePumPfPHqzfHJELXHhES721uM
	8Jz1gN6DDCYIMQgo1AhE/WeZhHakInRTxdQo1soDLqetkBQKC+2mek8/f+CKZxeAzyXaNj5RZjhv1
	EN7mX0FzEpuAdd+YH5O4L/jgB1vfg8rYKBQB6na0S2g0hPXIPw32SFI022N3PnR6ubZliVwNnWVsj
	ByyV9HCl+Ly0ZTp20Lgqo8Gi8anrhWylIWhoszMKbA3tWEgewb1zxbS9i/ascLIcd6FJHDnFjnFio
	hXlKVNrw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7YP-0000000F6f6-2FyT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 16:30:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D204A44470;
	Thu, 20 Nov 2025 17:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5490C4CEF1;
	Thu, 20 Nov 2025 17:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659562;
	bh=38+3571SsR3/6Au4qfcW65qDAxFokXCMSe41hn2rqc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DelMbAld/iGNCWBlc7SfMxudML3BMl7iIC3SGQ4LzFQNu6L1N53Tw1keIC1k6A3DN
	 1eiGx6ABUgZrtCy8579OIyQYZ05LtUfML4lwwQJ4rGY9BKERKB+KJ58fR+Axb39X/D
	 FaujMsO9DYh2wOlvzkEAlhHNOWW3lMAokfHZvMS5CCoUgHC6ZScQc02UDmPdyPQP2g
	 e5aPAwLHBNG72/YA+0KnrWeilnlYAf9Frcr6K2iWCScNC1WQYI0qngpKPeAmKac8eJ
	 /uP9kTti8xSvqYGL/7+GNMmwXgamEd1XbE9wCdOfTnY+6XlxCBsa5JmrMLgxYqVqnj
	 Hcb9KlKGNYw2A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Pw-00000006y6g-3yac;
	Thu, 20 Nov 2025 17:26:01 +0000
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
Subject: [PATCH v4 29/49] KVM: arm64: GICv3: Add GICv2 SGI handling to deactivation primitive
Date: Thu, 20 Nov 2025 17:25:19 +0000
Message-ID: <20251120172540.2267180-30-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20251120_163043_193507_A159072F 
X-CRM114-Status: GOOD (  15.72  )
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

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v3.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index d83edf02d0722..9fcee5121fe5e 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -176,11 +176,20 @@ void vgic_v3_deactivate(struct kvm_vcpu *vcpu, u64 val)
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
@@ -216,6 +225,9 @@ void vgic_v3_deactivate(struct kvm_vcpu *vcpu, u64 val)
 	 * - Or the irq is active, but not in an LR, and we can
 	 *   directly deactivate it by building a pseudo-LR, fold it,
 	 *   and queue a request to prune the resulting ap_list,
+	 *
+	 * Special care must be taken to match the source CPUID when
+	 * deactivating a GICv2 SGI.
 	 */
 	scoped_guard(raw_spinlock, &irq->irq_lock) {
 		target_vcpu = irq->vcpu;
@@ -233,6 +245,12 @@ void vgic_v3_deactivate(struct kvm_vcpu *vcpu, u64 val)
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


