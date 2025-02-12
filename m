Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EADFC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 18:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1lmN/Mh96pOHwdG2ab4VMFJLNlZMvsX21i4tOrmIkk0=; b=b/34y3tkWudxNJMrakvJP3IAiN
	oGQejRtrq69ivG6EXsjU+oUMUCeIk8G9sEsffGYHVbmkhVt8XJX5DTzSoXjKam4EWTolVjh3nc/1n
	hQtVrfrQ6OGp0Mst4F6huRX/L3OKhrMrUmjTFyal71H3tF8bEbaKOmpYuI+uKzarCUcMDb5W+EtPn
	5MHFS5fGflOeY33ZLwMKrDyZMG6hTXTNhrsjd1WrMhGwP5VJDz3R5xa2k7tU6FY59S9fONWuhkapf
	QPEYx4xg5RFLMW1KD0qErSzIg61h53QsFDMlN+ffaNRyLyY/LWiX3cD4yzJ1mBDt3ljZniVgNdKLG
	ngtkMAzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiHTn-00000008TcZ-0Qan;
	Wed, 12 Feb 2025 18:28:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiHQy-00000008TDp-33Xd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 18:26:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D8915C601D;
	Wed, 12 Feb 2025 18:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6DB5C4CEE2;
	Wed, 12 Feb 2025 18:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739384763;
	bh=fGkPZyC1lHaD1dNGIgbR3MqllKvLH1NgrTHM4VOF/rQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HP5kfWaQrTj8IWiUizfTjRRzMbWG7N1W/1x4ceK8yciCy4GseCo9u59S11tsCyEKF
	 4my0iiapBCv2tP0fg7D/VCcaun2k9OQWLoX+hPjEtd8PcJP+wLThWktjuO2LRqztss
	 CCbuXexHkEjlYlTsTthZiY57LFPn7fpc1kCx2kLwwu70glHSBBn4+nPmc+saXv3Q8i
	 5irVv/vvvAm9cODD/fFrCNXKWRMhdA76/ArJuB9Itf+WHAUi+e2Ps8dORlTW4LcNSL
	 SaETN+g8QChCIG6lMyw+m3N4qa/m3zbfLLspZ3lKikr6/gzjWgz0FX+xaYFMKzcZ2M
	 3CMn35O42ZFqg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tiHQv-003RQt-Qs;
	Wed, 12 Feb 2025 18:26:01 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Alexander Potapenko <glider@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 1/2] KVM: arm64: timer: Drop warning on failed interrupt signalling
Date: Wed, 12 Feb 2025 18:25:57 +0000
Message-Id: <20250212182558.2865232-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250212182558.2865232-1-maz@kernel.org>
References: <20250212182558.2865232-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, glider@google.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_102604_825732_947CEEDA 
X-CRM114-Status: GOOD (  11.27  )
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

We currently spit out a warning if making a timer interrupt pending
fails. But not only this is loud and easy to trigger from userspace,
we also fail to do anything useful with that information.

Dropping the warning is the easiest thing to do for now. We can
always add error reporting if we really want in the future.

Reported-by: Alexander Potapenko <glider@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arch_timer.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 231c0cd9c7b4b..70802e4c91cf5 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -447,21 +447,19 @@ static void kvm_timer_update_status(struct arch_timer_context *ctx, bool level)
 static void kvm_timer_update_irq(struct kvm_vcpu *vcpu, bool new_level,
 				 struct arch_timer_context *timer_ctx)
 {
-	int ret;
-
 	kvm_timer_update_status(timer_ctx, new_level);
 
 	timer_ctx->irq.level = new_level;
 	trace_kvm_timer_update_irq(vcpu->vcpu_id, timer_irq(timer_ctx),
 				   timer_ctx->irq.level);
 
-	if (!userspace_irqchip(vcpu->kvm)) {
-		ret = kvm_vgic_inject_irq(vcpu->kvm, vcpu,
-					  timer_irq(timer_ctx),
-					  timer_ctx->irq.level,
-					  timer_ctx);
-		WARN_ON(ret);
-	}
+	if (userspace_irqchip(vcpu->kvm))
+		return;
+
+	kvm_vgic_inject_irq(vcpu->kvm, vcpu,
+			    timer_irq(timer_ctx),
+			    timer_ctx->irq.level,
+			    timer_ctx);
 }
 
 /* Only called for a fully emulated timer */
-- 
2.39.2


