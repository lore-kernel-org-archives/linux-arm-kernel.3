Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99211F9B605
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 10:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GW/95UAqJVjJyk5NumyqoWPmDlgdsGENa/yA7wIIcgE=; b=oVmuhfw0ExJGACjYCJuvR8C6l3
	rcEPAi0QAfHYCQ5pZbSh469xwdIYUCOBRkhFIpl4qHAhZM3OVi6IEuVQA9K6J1Xiu5tIz/3hFmSLu
	18wmZKkhbg4hkfLS24f+eht1Kfcka/WOtaRd+7dj0ZD5ObQVmEPnKwgdxAp8Iv3odAvX27eapYhAk
	JXJ7RkcNbM2bP4sseZesCk2l8g7K+V8CPsF9Obwf/iI2C8UCGc9imSa+kWBgcvd0rzXAMV9xfx8oz
	4wy6qB1H3M9nF+BMnKPPuMS6TPa5c6K7lENSnmXPy+V5KkzJUpUKwQ1WTTc6uojfcb3zIc7UhRMUd
	b1xmV1eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUPW-00000009uiU-19FR;
	Wed, 22 Apr 2026 10:02:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUPQ-00000009ues-3l3k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 10:02:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B24E540B60;
	Wed, 22 Apr 2026 10:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89450C2BCB9;
	Wed, 22 Apr 2026 10:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776852135;
	bh=8+FVoIt5874kTvCFfQfFzjTHRR/9k+x9ujb8FG6UUGk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vNOromq/sF5yWPDIgDVH/Ry7WP5HGrN9n1trn3kwpOiIkAxiIwh7YWpyUFmDG3e2/
	 NdSZzycVI/xm1N40sEOlBX9siN4AqAid9Y9t6TkK+NuKwZ+rsXS75+gqVWiJUmbGyX
	 nv+Ua7OqrTaLXzp9vzGGM+ZxImUy18CAOncQrbm4yeR5OyWpHHcZBR+S4rkeI6W7l3
	 CTZU0OKTh0trAjb+4UI3QS033o61q59ODxKrgKx9rexKc9/Sqsp0hrA02GZR0RgGiN
	 npDjWWzF6ORtmWt7A43DbVb3q2yNbASKYSVLEheWaR2KM1szI5Pm5HohKufk4dEgah
	 BF2YMkcXojMYA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wFUPN-0000000Dh6d-31Jd;
	Wed, 22 Apr 2026 10:02:13 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Deepanshu Kartikey <kartikey406@gmail.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 4/4] KVM: arm64: vgic-v2: Don't init the vgic on in-kernel interrupt injection
Date: Wed, 22 Apr 2026 11:02:10 +0100
Message-ID: <20260422100210.3008156-5-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422100210.3008156-1-maz@kernel.org>
References: <20260422100210.3008156-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kartikey406@gmail.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_030217_037989_AF814FCC 
X-CRM114-Status: GOOD (  13.80  )
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

We how have the lazy init on three paths:

- on first run of a vcpu
- on first injection of an interrupt from userspace and irqfd
- on first injection of an interrupt from kernel space as
  part of the device emulation (timers, PMU, vgic MI)

Given that we recompute the state of each in-kernel interrupt
every time we are about to enter the guest, we can drop the lazy
init from the kernel injection path.

This solves a bunch of issues related to vgic_lazy_init() being called
in non-preemptible context, such as vcpu reset.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 1e9fe8764584d..9e29f03d3463c 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -534,11 +534,9 @@ int kvm_vgic_inject_irq(struct kvm *kvm, struct kvm_vcpu *vcpu,
 {
 	struct vgic_irq *irq;
 	unsigned long flags;
-	int ret;
 
-	ret = vgic_lazy_init(kvm);
-	if (ret)
-		return ret;
+	if (unlikely(!vgic_initialized(kvm)))
+		return 0;
 
 	if (!vcpu && irq_is_private(kvm, intid))
 		return -EINVAL;
-- 
2.47.3


