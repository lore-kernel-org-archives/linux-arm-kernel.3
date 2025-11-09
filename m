Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02AC4CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 17:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1W5vrCmKeFr/H07m8jDEZ4YdjC0kQWKbExI23VrzOtI=; b=0wjoWVzCrHw5fd3MlnseRQA4sS
	tbkcfv1Lb0v1Ixs+m1yq+nvWJMc/PVBzK5OiGXRCzHnNFyJGP7VrxeCi0FO6VqrNUQ7gVEsd2ZIrK
	oRXuGmFWqsH/Srgrb/BGCkNEmsz9Q4tzOE1KNFNC4wQCqeFYyUMF8XjwFKBuoTwFLpISd4OJeASze
	2w/6mgMuxjkDYaZgpU/7d4Pb7qCQm5tu0ml1Mo009Qvvz7CEQKNUGWJWYwtDy0X+5mSWDUQrd1vGm
	g8GnKavi8AcmAjKz4yBDyWR5YSLIj6iaGTpbebhGFGmCMGHjLTeN2e+VS7Wkdkxk/L+w9DhofHA97
	Jg6epMnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI92n-00000004Dbo-3FUu;
	Sun, 09 Nov 2025 17:17:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91o-00000004CAR-0fsI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 17:16:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0CFF740663;
	Sun,  9 Nov 2025 17:16:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7EDC19422;
	Sun,  9 Nov 2025 17:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762708595;
	bh=PnttpW5k/sZbVwWIADxCl8IZlSHBNDSq8thM0EUpP/0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YQQlKAs9Thcvam3IYJRrrrgfYk1OoTeYqF8h0llmXHruLkLDpSEfouh0UF7AZavVB
	 Jg7h9gy/LguljwVGupjHC+yVT4t0dIsuMWnf1sEf2+gIETb3rg5k73NKgFTDGmrTao
	 48cEIy5p4xRjQrkBWdwqAp9FUmEJkGFPlrS7EGFa4EjjlZJ/y1sdupfYzGk2MDGCGX
	 kiqvBbN4EcncmfceVgSH3oJn7soMEiHEuYW5MnhPzwwB0Yin1Uw80RH46H3K7I+UZD
	 ktevk+BOT7EDSHG7KumGoJ5suZK5wwrHuiBrA7GpxODrjVouiIkM4ihyX4zD1F0x9z
	 wixqI0ufnklMw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vI91l-00000003exw-437N;
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
Subject: [PATCH v2 24/45] KVM: arm64: Move undeliverable interrupts to the end of ap_list
Date: Sun,  9 Nov 2025 17:15:58 +0000
Message-ID: <20251109171619.1507205-25-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20251109_091636_995064_A4C8B5B6 
X-CRM114-Status: GOOD (  17.62  )
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

Interrupts in the ap_list that cannot be acted upon because they
are not enabled, or that their group is not enabled, shouldn't
make it into the LRs if we are space-constrained.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 56c61e17e1e88..5c9204d18b27d 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -265,6 +265,11 @@ struct kvm_vcpu *vgic_target_oracle(struct vgic_irq *irq)
 	return NULL;
 }
 
+struct vgic_sort_info {
+	struct kvm_vcpu *vcpu;
+	struct vgic_vmcr vmcr;
+};
+
 /*
  * The order of items in the ap_lists defines how we'll pack things in LRs as
  * well, the first items in the list being the first things populated in the
@@ -273,6 +278,7 @@ struct kvm_vcpu *vgic_target_oracle(struct vgic_irq *irq)
  * Pending, non-active interrupts must be placed at the head of the list.
  * Otherwise things should be sorted by the priority field and the GIC
  * hardware support will take care of preemption of priority groups etc.
+ * Interrupts that are not deliverable should be at the end of the list.
  *
  * Return negative if "a" sorts before "b", 0 to preserve order, and positive
  * to sort "b" before "a".
@@ -282,6 +288,8 @@ static int vgic_irq_cmp(void *priv, const struct list_head *a,
 {
 	struct vgic_irq *irqa = container_of(a, struct vgic_irq, ap_list);
 	struct vgic_irq *irqb = container_of(b, struct vgic_irq, ap_list);
+	struct vgic_sort_info *info = priv;
+	struct kvm_vcpu *vcpu = info->vcpu;
 	bool penda, pendb;
 	int ret;
 
@@ -295,6 +303,17 @@ static int vgic_irq_cmp(void *priv, const struct list_head *a,
 	raw_spin_lock(&irqa->irq_lock);
 	raw_spin_lock_nested(&irqb->irq_lock, SINGLE_DEPTH_NESTING);
 
+	/* Undeliverable interrupts should be last */
+	ret = (int)(vgic_target_oracle(irqb) == vcpu) - (int)(vgic_target_oracle(irqa) == vcpu);
+	if (ret)
+		goto out;
+
+	/* Same thing for interrupts targeting a disabled group */
+	ret =  (int)(irqb->group ? info->vmcr.grpen1 : info->vmcr.grpen0);
+	ret -= (int)(irqa->group ? info->vmcr.grpen1 : info->vmcr.grpen0);
+	if (ret)
+		goto out;
+
 	penda = irqa->enabled && irq_is_pending(irqa) && !irqa->active;
 	pendb = irqb->enabled && irq_is_pending(irqb) && !irqb->active;
 
@@ -320,10 +339,12 @@ static int vgic_irq_cmp(void *priv, const struct list_head *a,
 static void vgic_sort_ap_list(struct kvm_vcpu *vcpu)
 {
 	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
+	struct vgic_sort_info info = { .vcpu = vcpu, };
 
 	lockdep_assert_held(&vgic_cpu->ap_list_lock);
 
-	list_sort(NULL, &vgic_cpu->ap_list_head, vgic_irq_cmp);
+	vgic_get_vmcr(vcpu, &info.vmcr);
+	list_sort(&info, &vgic_cpu->ap_list_head, vgic_irq_cmp);
 }
 
 /*
-- 
2.47.3


