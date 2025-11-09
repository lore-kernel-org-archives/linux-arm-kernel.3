Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E6FCD13CF
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 17:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yULcSXLfAJ1dTZQZAcEl6l/XpLTW0IgxNsxsh2fguI=; b=o/9bhBmKoh7E9Z10zqhrLLkeqv
	3Npv1ArhWs+uf/093S2vEi3OcIJYhlLXhHdrsZbmfqRW841+e1t5QCtJfa48avPnG1brCrYs8QGvQ
	kSbY0oX88lEd1RkKBD5fu7gtnGQ6PD23gIqNEAlPYvJb8Yt6u/xzwXFHpWu9HqY0Y91qcmUrY2PlM
	0REdEv5X/ZHc/DYshAT7dXvo7DHUMnsJK31LAZItkGLlxKviKMtk+0LlJrabAQ6agKYXIu3RTGyUF
	USf/q5q7+MU/z/vXmhTUZEzvRRku9UwO/OzZUe+/GfAS8uBUJbl9wq2lUTgZKbNvaUOektrzVh1Od
	PKuap/hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI92q-00000004DhP-24Jx;
	Sun, 09 Nov 2025 17:17:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91q-00000004CDn-168z
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 17:16:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 25DF543C3C;
	Sun,  9 Nov 2025 17:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E213AC19422;
	Sun,  9 Nov 2025 17:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762708598;
	bh=0HS/4qE6qTgeyCBJPAK5i628M7zUg3PGilYhBnFOIe0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tiavHW5aQHfrZ534hcNX0458qMjZfxey3WbdPr1F5XaGjzJe1WGVAykBrYYKzIIKh
	 xOZT5rOYm8hQyY2bvIdN2PE0Xgh7wTofS3rQH3bOG+Y2qAjnVReNszoTEw/gffe+4o
	 0L4XvHr0HTNi9DrJyST04KCj2mmGJMB7M3N8+eJ60dY9PASuiN12G8h7J3MlhnLXJT
	 XpofIKweelAOq2igwGtfUPdyisljEY+n2UOM48kQqGqloyVCO3xpYv7o86cIuGQJtb
	 Kxcv7UuJA3zvVcrf8Lbz2errO7xG9J+9uLXV1KJHf+aHuSaXa92bE02TlMa2OvnagU
	 a1s5Aty9rM2Gg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vI91o-00000003exw-0oGQ;
	Sun, 09 Nov 2025 17:16:36 +0000
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
Subject: [PATCH v2 33/45] KVM: arm64: GICv2: Handle LR overflow when EOImode==0
Date: Sun,  9 Nov 2025 17:16:07 +0000
Message-ID: <20251109171619.1507205-34-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20251109_091638_396964_AAF768E8 
X-CRM114-Status: GOOD (  13.95  )
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

Similarly to the GICv3 version, handle the EOIcount-driven deactivation
by walking the overflow list.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v2.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index 9a2de03f74c30..bbd4d003fde86 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -100,6 +100,8 @@ static void vgic_v2_fold_lr(struct kvm_vcpu *vcpu, u32 val)
 	vgic_put_irq(vcpu->kvm, irq);
 }
 
+static u32 vgic_v2_compute_lr(struct kvm_vcpu *vcpu, struct vgic_irq *irq);
+
 /*
  * transfer the content of the LRs back into the corresponding ap_list:
  * - active bit is transferred as is
@@ -111,12 +113,37 @@ void vgic_v2_fold_lr_state(struct kvm_vcpu *vcpu)
 {
 	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
 	struct vgic_v2_cpu_if *cpuif = &vgic_cpu->vgic_v2;
+	u32 eoicount = FIELD_GET(GICH_HCR_EOICOUNT, cpuif->vgic_hcr);
+	struct vgic_irq *irq;
 
 	DEBUG_SPINLOCK_BUG_ON(!irqs_disabled());
 
 	for (int lr = 0; lr < vgic_cpu->vgic_v2.used_lrs; lr++)
 		vgic_v2_fold_lr(vcpu, cpuif->vgic_lr[lr]);
 
+	/* See the GICv3 equivalent for the EOIcount handling rationale */
+	list_for_each_entry(irq, &vgic_cpu->ap_list_head, ap_list) {
+		u32 lr;
+
+		if (!eoicount) {
+			break;
+		} else {
+			guard(raw_spinlock)(&irq->irq_lock);
+
+			if (!(likely(vgic_target_oracle(irq) == vcpu) &&
+			      irq->active))
+				continue;
+
+			lr = vgic_v2_compute_lr(vcpu, irq) & ~GICH_LR_ACTIVE_BIT;
+		}
+
+		if (lr & GICH_LR_HW)
+			writel_relaxed(FIELD_GET(GICH_LR_PHYSID_CPUID, lr),
+				       kvm_vgic_global_state.gicc_base + GIC_CPU_DEACTIVATE);
+		vgic_v2_fold_lr(vcpu, lr);
+		eoicount--;
+	}
+
 	cpuif->used_lrs = 0;
 }
 
-- 
2.47.3


