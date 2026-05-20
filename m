Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADB0CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 09:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8+SRIXb2EC27fQJGeFQBobVsfJFKqxmSb21xBPCc05Y=; b=sRjmAa6NMa3EO+KVk+PSDS8A6q
	L3+lWg7R6+8r4Jjc/gJhYdkEnrz21lCxdhQExKlNGlnu/EEiPRc7hd4IUxtGWO2yMWkeqcLovMTjo
	BO1M9xlUVic65eSLqPBED273MFMDqfP6MMQxw7U0Ksw6kfnQc5TUyCzUBccq7NVxLtyv/8q413rYK
	MPH9QKKK4j+j1tAqTNzt63mhplSh2dFg6W5cNbdO/eqamXQRLHAGAXN2PGxqIgFhVfr/DiW3rKxsg
	dO8ZR27Z8POWFFvxXe2rfLjyJOcvplM0GAVVDyajt26+1Q4xhbmqvC+bBcGV/IH6/FypZ1qPSnIyq
	puy/q/ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6I-000000047JU-26de;
	Wed, 20 May 2026 09:20:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6E-000000047Bw-0iBJ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 May 2026 09:20:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=8+SRIXb2EC27fQJGeFQBobVsfJFKqxmSb21xBPCc05Y=; b=XhR7pwMNp3fGPIrotHnFOMs+56
	p5RwNYEgy9fgSD6Zs7YFUhGhWN2MhRc6JhHSTR3z2jZytOfXn4/EmGjYd85I+a6kB+wZ+N0RWShj8
	ssl6OhQ5cTCTOxlCJFwLPgrXSIm8eDVmAsfwTPJAuuJDdDJMPUDSdbyRvjaybukHRG6fRLxHh5A2W
	9RqAHPe6A3NGOWQTAAIfup+1dFhskXiURGN5tcTAeTZBXjXHxMhKpgc8QAMNo8yPPkmV+tpxKUIOY
	dOztb3eS1PQ1lluvjTtjSxItLljz5xe5epwg48d1eSA1w6UYUZDk7DWbJKbDOEYWQtoD13A6/NSla
	zrO5ZjuA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd65-0000000GKUA-357v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 09:20:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B9D142E19;
	Wed, 20 May 2026 09:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE171F00893;
	Wed, 20 May 2026 09:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779268812;
	bh=8+SRIXb2EC27fQJGeFQBobVsfJFKqxmSb21xBPCc05Y=;
	h=From:To:Cc:Subject:Date;
	b=kiyUsquSM9fLU8RCEgybaCgLkg2v5vmgL2OHEaTf9f/73v7YJ9Fkn0M6asfzp4mgJ
	 59fCq+OAIjxTGJiYeVGL2MwSyWEqsvuORkCzH1E1s6HdqmXJhZcjjl94Bs4nHZ2m4W
	 iIzK/Hx7QkMYkEQde3/eAaeL0AMwEFEXFTfXj511ozQTI8UXdV9AKbC/h0locHL4rq
	 Ymyef2PoJHA0mKgvsKEycPmTjZedGzkI6aKwai20bHO9Hwd/5gg0i72E8EV2tp5lj3
	 +UOd0t+xGSzPRKR46lcrES00wsDGV4fwv8uVh20HmMfewkshbE7LnnkfJMdumbeDaD
	 MOeZT0YrRwHeA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wPd62-00000004IaV-0Xct;
	Wed, 20 May 2026 09:20:10 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH v2 00/18] KVM: arm64: vgic-v5 fixes for 7.2
Date: Wed, 20 May 2026 10:19:31 +0100
Message-ID: <20260520091949.542365-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_102015_344188_9AB22CB7 
X-CRM114-Status: GOOD (  10.71  )
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

Having completely missed the 7.1 window, this is a repost of this
series cleaning-up the vgic-v5 PPI support now targeting 7.2.

Not a lot has changed since v1 [1], only the documentation typo
spotted by our eagle-eyed Joey.

[1] https://lore.kernel.org/r/20260415115559.2227718-1-maz@kernel.org

Marc Zyngier (9):
  KVM: arm64: vgic-v5: Add for_each_visible_v5_ppi() iterator
  KVM: arm64: vgic-v5: Move PPI caps into kvm_vgic_global_state
  KVM: arm64: vgic-v5: Remove use of __assign_bit() with a constant
  KVM: arm64: vgic-v5: Drop pointless ARM64_HAS_GICV5_CPUIF check
  KVM: arm64: vgic: Constify struct irq_ops usage
  KVM: arm64: vgic: Consolidate vgic_allocate_private_irqs_locked()
  KVM: arm64: vgic-v5: Drop defensive checks from
    vgic_v5_ppi_queue_irq_unlock()
  KVM: arm64: vgic: Rationalise per-CPU irq accessor
  KVM: arm64: vgic-v5: Limit support to 64 PPIs

Sascha Bischoff (9):
  KVM: arm64: vgic-v5: Add missing trap handing for NV triage
  KVM: arm64: vgic-v5: Atomically assign bits to PPI DVI bitmap
  KVM: arm64: selftests: Add missing GIC CDEN to no-vgic-v5 selftest
  KVM: arm64: selftests: Cleanup unused vars in GICv5 PPI selftest
  KVM: arm64: selftests: Improve error handling for GICv5 PPI selftest
  Documentation: KVM: Fix typos in VGICv5 documentation
  Documentation: KVM: Clarify that PMU_V3_IRQ IntID requirements for
    GICv5
  irqchip/gic-v5: Immediately exec priority drop following activate
  KVM: arm64: Fix arch timer interrupts for GICv3-on-GICv5 guests

 .../virt/kvm/devices/arm-vgic-v5.rst          |  6 +-
 Documentation/virt/kvm/devices/vcpu.rst       |  7 +-
 arch/arm64/kvm/arch_timer.c                   | 31 +++----
 arch/arm64/kvm/emulate-nested.c               |  8 ++
 arch/arm64/kvm/hyp/vgic-v5-sr.c               | 82 ++++---------------
 arch/arm64/kvm/sys_regs.c                     | 19 ++---
 arch/arm64/kvm/vgic/vgic-init.c               | 45 ++++------
 arch/arm64/kvm/vgic/vgic-kvm-device.c         |  9 +-
 arch/arm64/kvm/vgic/vgic-v5.c                 | 51 ++++--------
 arch/arm64/kvm/vgic/vgic.c                    | 27 +++---
 arch/arm64/kvm/vgic/vgic.h                    |  3 +
 drivers/irqchip/irq-gic-v5.c                  | 13 +--
 include/kvm/arm_vgic.h                        | 19 +++--
 tools/testing/selftests/kvm/arm64/no-vgic.c   |  1 +
 tools/testing/selftests/kvm/arm64/vgic_v5.c   | 10 +--
 15 files changed, 132 insertions(+), 199 deletions(-)

-- 
2.47.3


