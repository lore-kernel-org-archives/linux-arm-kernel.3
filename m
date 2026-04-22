Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC15F9B602
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 10:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pAA0Pc64fHRN5B9pgR1D/4ALpY9naBwp9VMnpLMiVeg=; b=aDLwvg1KoqJYJiJL0elHCFrj63
	u7YuwtxKvKJnWe3BvVVzHnOAh1+ZK+VJ4LETYpLwUXWBt1jt6KWgJRUIU6m1vTEbj0rTTWrJGUUb9
	rqviQ6mGDioIDpyEa+tjlgLUC+qowltkBKKshaw0mSSjv3Mzo6y/QPg9fMXpZUA8+RRULCfknGK7H
	2wA4hd9Tsi8d/Kt6J5DMwHpoZcqiDq0AQOS4ZUfzsUe9BwIZZHJpTsCPZPS4Cjxsu5PP7bSXYIz4M
	yPMKv0YGVLsEkgMhRZMFVzM3f8ulT8HIpu3xbS59PLkM4vwP95Qdpon++mFHs9HEnhsywG7BFK0oJ
	h1AGhCrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUPS-00000009ufs-1IIM;
	Wed, 22 Apr 2026 10:02:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUPQ-00000009ueo-0FKM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 10:02:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5861B406DD;
	Wed, 22 Apr 2026 10:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D522C19425;
	Wed, 22 Apr 2026 10:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776852135;
	bh=CAENVGjFPxxWtImA7zgQfAthvhtq8a+aFK/+ljYO1Ug=;
	h=From:To:Cc:Subject:Date:From;
	b=GJx2EcP8+mnz9DvvkP1d5d+2fddC0Jtul303doqqShuQWhC+/LZ8TiMtDnGSDcxin
	 y1cc+iGhOQTMqMFdLY1/5WPqzThU1hWPFVd6jYw6AZH7Sy1VmB7BTLmtRiHZYgAiY/
	 Ukw8EE5RP/egZdweR5OC0WM+FjfMroHTvI6XqM9m/z/6O6EUQnWFMbbQs/Y2+yuRbw
	 U6ausK8qdtuocnYM1gbFFsAh/bHZB0A2GxebLxHeAUCnroPDgbu+X3Js3heczwnMW7
	 tQ+YeCC06Z+DjzdzcJG5Cj4RnRnYVEGCbrmUtDYuLU63+l8z5P7FXzi6X4NKgETTH6
	 pwUILU1gJETJw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wFUPM-0000000Dh6d-3tH4;
	Wed, 22 Apr 2026 10:02:13 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Deepanshu Kartikey <kartikey406@gmail.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 0/4] KVM: arm64: Don't perform vgic-v2 lazy init on timer injection
Date: Wed, 22 Apr 2026 11:02:06 +0100
Message-ID: <20260422100210.3008156-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kartikey406@gmail.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_030216_114372_DC79FD97 
X-CRM114-Status: UNSURE (   8.82  )
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

This is the second version of this series aiming at fixing issues
with vgic-v2 being initialised from non-preemptible context.

* From v1 [1]:

  - Repaint kvm_timer_irq_can_fire() to kvm_timer_enabled()

  - Drop duplicate kvm_timer_update_status() call

  - Force lazy init on the irqfd slow-path for SPIs

[1] https://lore.kernel.org/r/20260417124612.2770268-1-maz@kernel.org

Marc Zyngier (4):
  KVM: arm64: timer: Repaint kvm_timer_{should,irq_can}_fire() to
    kvm_timer_{pending,enabled}()
  KVM: arm64: timer: Kill the per-timer level cache
  KVM: arm64: vgic-v2: Force vgic init on injection outside the run loop
  KVM: arm64: vgic-v2: Don't init the vgic on in-kernel interrupt
    injection

 arch/arm64/kvm/arch_timer.c      | 59 +++++++++++++++-----------------
 arch/arm64/kvm/arm.c             |  7 ++++
 arch/arm64/kvm/vgic/vgic-irqfd.c |  6 ++++
 arch/arm64/kvm/vgic/vgic.c       |  6 ++--
 include/kvm/arm_arch_timer.h     |  5 ---
 5 files changed, 43 insertions(+), 40 deletions(-)

-- 
2.47.3


