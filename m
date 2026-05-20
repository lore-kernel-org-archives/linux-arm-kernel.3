Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5510ECD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 10:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ql9CCInuhftdsL7kbkDRka7hNjPyDsFIQiL7p3/R69k=; b=Ut/4EMMroak9+yhPdWNnJEdGYQ
	3hyuPsMadJiu3ZUcPNY6imCunGPmwqgJu+scoyLqz2E0L5peIIMO7cXpHGDkV2ivyoauyvFp+VCK0
	A8mmn067RUMeAixqNrKdoTXu6ywG+8UcwPJxJvEIq2H64lWbEj+dFuKGa39kV27SICQ8xQmtQf8FZ
	sX1i+veLMljDzcwfUnqSNrZBqkTAQOv1xftNoDubI5FbTzsEWMEFprAjxpSHSYmGsqQqYtY/PSvun
	5pmRkm4IzMyJt/OGHCStLAOK9Abch4qs+56eAntcH2C0KCuyQV67u1KFjyMvPzaxBoznDcGe6QCJo
	txehzidA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdkv-00000004GWU-1I31;
	Wed, 20 May 2026 10:02:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdke-00000004GMm-1cZF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 10:02:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A27C2402A8;
	Wed, 20 May 2026 10:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852841F00893;
	Wed, 20 May 2026 10:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779271327;
	bh=ql9CCInuhftdsL7kbkDRka7hNjPyDsFIQiL7p3/R69k=;
	h=From:To:Cc:Subject:Date;
	b=aXkNCgHZPAiDzUZuAzHp8Dj1bjjcJX0fJKAaw3dSD5e49uPeOuW1p3ji1kr2vSnJ6
	 wF6n0neH3ovP32ME7vc7tlZcxqJSld3t5+aoA/SCfbVHeXxjY8WFP8znKjVjwyW/cR
	 7FIWKtS2rhhm1Iw9Fx/yxq3zbSXqSJFL16Lrn/2c1nHRHfOnpxx0VkHvqaVldtVE5W
	 aOcbb3GxKHC+mHG5koR2Z6rZjYOcahZva3dWuzpc7MU50tLnyBAfStmHWy5pD5ReZr
	 cRfqMvWpk+uYklGDQ33qSh8/6/wR571eP9JA1H+yfPXdpL3odsGbJgJMDPxAfNu+B2
	 zBDY1z43NLZiw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wPdkb-00000004Jio-1MxN;
	Wed, 20 May 2026 10:02:05 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Deepanshu Kartikey <kartikey406@gmail.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v3 0/6] KVM: arm64: Don't perform vgic-v2 lazy init on timer injection
Date: Wed, 20 May 2026 11:01:54 +0100
Message-ID: <20260520100200.543845-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kartikey406@gmail.com, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_030208_448664_61379AED 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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

This is the third version of this series aiming at fixing issues with
vgic-v2 being initialised from non-preemptible context.

* From v2 [2]:

  - Remove the PMU's irq level cache which was hidding in plain sight

  - Simplify the userspace notification of interrupt level update

  - Additional comment clarification in patch #1

  - Collected RB, with thanks

* From v1 [1]:

  - Repaint kvm_timer_irq_can_fire() to kvm_timer_enabled()

  - Drop duplicate kvm_timer_update_status() call

  - Force lazy init on the irqfd slow-path for SPIs

[1] https://lore.kernel.org/r/20260417124612.2770268-1-maz@kernel.org
[2] https://lore.kernel.org/r/20260422100210.3008156-1-maz@kernel.org

Marc Zyngier (6):
  KVM: arm64: timer: Repaint kvm_timer_{should,irq_can}_fire() to
    kvm_timer_{pending,enabled}()
  KVM: arm64: Simplify userspace notification of interrupt state
  KVM: arm64: timer: Kill the per-timer irq level cache
  KVM: arm64: pmu: Kill the PMU interrupt level cache
  KVM: arm64: vgic-v2: Force vgic init on injection outside the run loop
  KVM: arm64: vgic-v2: Don't init the vgic on in-kernel interrupt
    injection

 arch/arm64/kvm/arch_timer.c      | 106 ++++++++++++++-----------------
 arch/arm64/kvm/arm.c             |  39 ++++++++----
 arch/arm64/kvm/pmu-emul.c        |  31 +++------
 arch/arm64/kvm/vgic/vgic-irqfd.c |   6 ++
 arch/arm64/kvm/vgic/vgic.c       |   6 +-
 include/kvm/arm_arch_timer.h     |   7 +-
 include/kvm/arm_pmu.h            |   5 +-
 7 files changed, 94 insertions(+), 106 deletions(-)

-- 
2.47.3


