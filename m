Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBDFC02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 15:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1lmN/Mh96pOHwdG2ab4VMFJLNlZMvsX21i4tOrmIkk0=; b=cD1qVbXdAa+wK6JyzANdpj6qdv
	hXX1zhauui8VD7hkF+Tr29frZ9S6OJ8se1rtZKe+nMESK2FDBJcmeXYv2T8ovXv8Oi9JI3s862CiL
	B8i/mN7L2+uf07jOLRGuYQ2Wu35G5SKwm0Ln2eFZEtHNxETlC1QGk9pFZBSyYaokhi6OS8ZbsiPH9
	HoLk8LESfFAaNK1b/uiHmFcnRvgsQ6Gkr0nqQD2672UjHgSCwk7D4DJOL/oUudylLW+kqDYpYl4Al
	KvY1dX8jhpbmtek1D9jO+MN3EDLL4WWPnsngUx3SvRiLqFLpQCLkvABf6zF/xkmepSSYwQTHzw4HU
	n7ggAHUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3mE-00000006hmZ-46gQ;
	Thu, 06 Feb 2025 15:26:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3gu-00000006hAe-2AbW
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Feb 2025 15:21:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1lmN/Mh96pOHwdG2ab4VMFJLNlZMvsX21i4tOrmIkk0=; b=ShS2Jy73uCzUvFFfrSLbnYB7Zn
	inKSSaI3s/tQtSqyLpX/Fm5rGJarx8Qn+fM1dlFjAk9laNMb2+wfLMhk0NBq0SZYYEoRP7iODItW8
	s+FhcNFbDiQSRSTmiuW8M751qQ9xqI+0qYLk6Fru50rxz7TZT/R7V21QOTkHFlYKLOgBaPC9poOx2
	PW0585V6b9WqOm76gr+svi4s/bKC98YxFFBKl56dz7drHUq9i/rMqJFsm+zSQjzaL32LDDthQ+c/3
	aiwTQIlU8kDF/S/3CBQ5blh0qLDbjP8SEslTDW54VsP5VBgR4huMKZM45tvyYSInxDHzWUqLYfhCG
	rrBuG15Q==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3gr-0000000GySP-1as6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 15:21:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6D8F25C624A;
	Thu,  6 Feb 2025 15:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBB9AC4CEDF;
	Thu,  6 Feb 2025 15:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738855272;
	bh=fGkPZyC1lHaD1dNGIgbR3MqllKvLH1NgrTHM4VOF/rQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DAPAqhM8xt+twMxtoArge3pECx/FD9GqReBEPTDv1rOzbK/WPMa8I5zDqHagGBREk
	 sA74L5y7Q2TjyKTfzg6Y7Fj8e0h5n85bsW8bf4mdTALDj/uWCBofnPeTSa9P5HjMli
	 gcbnTqicA8AIvE5PCAfMd3Z8O6dZ41167rto5b1sM1YrwPozWZAp221XLGw5z9JIW0
	 TnFmoY6LXIcuOADbNyrH5df0HBRJ4BRFiz6quAld7tsUDDwgmy5qB9S2se5PH37x7M
	 BlI4iTBR2tnnpvZPn1CsvSVwyt75dQnEk5pvqfrL4aDQSgNNmBx2GeJE/aspcTdaJ5
	 TTzTmIQsD2IZw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tg3gk-001Axu-CO;
	Thu, 06 Feb 2025 15:21:10 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Alexander Potapenko <glider@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 1/3] KVM: arm64: timer: Drop warning on failed interrupt signalling
Date: Thu,  6 Feb 2025 15:20:58 +0000
Message-Id: <20250206152100.1107909-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250206152100.1107909-1-maz@kernel.org>
References: <20250206152100.1107909-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, glider@google.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_152117_586854_72419D73 
X-CRM114-Status: GOOD (  10.84  )
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


