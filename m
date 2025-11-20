Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562DDCF9C72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5rwEReN70gspjx+glPE9ETRfZby0OSErkSb8EoIx7k0=; b=XfCjhhnR8opDxqZdUMvgK3MKYd
	mQOa4HN4o7TVuBF/s4hv9TP5ykib7YJWE3YtMMoJkK8Ed582rVx3V8i1AuEvpC3H3VWtOuHNZzF5k
	UujylDwQ9/TFsm66EsclKTJbcQoCDLpdsUqjNCiY0n+TZ558CzwLxm/SJWI2SXw6Zv2xgmNMhfmZ0
	o+j4/yajvFNebJnfAP9YE+RuTiEQLJRmNZukIXLL1tfw9LSPoiIQhHlBm/iOBT0lu9yeMiPzlheIM
	aBu+FlEZgUannlA9dhMB0NyEJAkjnzdhBqNhhynRkHnK1OgzEgUtn8IwbUkntXX4Wl35Rhlxgt4yb
	wE1QKfMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8QC-000000075ve-3AAT;
	Thu, 20 Nov 2025 17:26:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Py-000000075d4-0cO1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:26:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9124660204;
	Thu, 20 Nov 2025 17:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E16C4CEF1;
	Thu, 20 Nov 2025 17:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659561;
	bh=+YGd9JHhb0OIMMWRqXwm8AJ8566l/XuBzTV96laMsUY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Om6yr0CK2VSJUyJDuQ3Zr9rBnq5Zp+usGfby18QVxeaD967pmSKQJaOlOjsjnc402
	 FqlZu1Kgr4wy8EUbATlE7qfHfydpqEMbdNfUjcS4Rkz05uUhuup9lEJ2t3DoOTvgMs
	 u+CCRt6+2aLNwOd1omL/lRO9UgaW5lTyV6jZaYgSPy5QfA7CHB3HfCHVVmRWEh5wnD
	 j138BH1bgBPxq48rZxs7CeTccp2AaLjoU6NB06dBJeGzIncAFEpudlgIrRt6Shidqx
	 dIg/Pn9nCciaIxRNRcjlRQme8IjesTgaHVNqLJNhSipZP/7wgefFxnR65DFxKtJ/Gm
	 nQ2imdS4Y7cpA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Pv-00000006y6g-1vfY;
	Thu, 20 Nov 2025 17:25:59 +0000
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
Subject: [PATCH v4 23/49] KVM: arm64: Make vgic_target_oracle() globally available
Date: Thu, 20 Nov 2025 17:25:13 +0000
Message-ID: <20251120172540.2267180-24-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120172540.2267180-1-maz@kernel.org>
References: <20251120172540.2267180-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, tabba@google.com, broonie@kernel.org
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

Make the internal crystal ball global, so that implementation-specific
code can use it.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic.c | 2 +-
 arch/arm64/kvm/vgic/vgic.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 7e6f02d48fff1..004010104659a 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -237,7 +237,7 @@ void vgic_irq_set_phys_active(struct vgic_irq *irq, bool active)
  *
  * Requires the IRQ lock to be held.
  */
-static struct kvm_vcpu *vgic_target_oracle(struct vgic_irq *irq)
+struct kvm_vcpu *vgic_target_oracle(struct vgic_irq *irq)
 {
 	lockdep_assert_held(&irq->irq_lock);
 
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index e48294521541e..037efb6200823 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -261,6 +261,7 @@ vgic_get_mmio_region(struct kvm_vcpu *vcpu, struct vgic_io_device *iodev,
 struct vgic_irq *vgic_get_irq(struct kvm *kvm, u32 intid);
 struct vgic_irq *vgic_get_vcpu_irq(struct kvm_vcpu *vcpu, u32 intid);
 void vgic_put_irq(struct kvm *kvm, struct vgic_irq *irq);
+struct kvm_vcpu *vgic_target_oracle(struct vgic_irq *irq);
 bool vgic_get_phys_line_level(struct vgic_irq *irq);
 void vgic_irq_set_phys_pending(struct vgic_irq *irq, bool pending);
 void vgic_irq_set_phys_active(struct vgic_irq *irq, bool active);
-- 
2.47.3


