Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5E7F41999
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 11:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=09TJQ/IHcNQbDEsQH9q1x2IVxzbMkm7/mTI9DpRbteU=; b=RlVggixL8QyjFXjvUjKj48BXgy
	Og5k324hySBRXea6U9dXpi9ihzdFu0ZKG1Qm3I/9MFf9cAu88bCqzgBbMRfPwRPJwt2YPW6VlNJTZ
	HPE57YQ8ux0xKjBxovhBP54zpzshhBN0K6CnEV1qWIuLkzTJrDdDwdDGDoFSvhgNHBAQ/m1lzcR0J
	0PIG3TNdvDekQQ3oKq1vKqupR/nU4j+6J3jn8kpDWcyD2S/pHAge7c9wLsQhx5hDTI/NTDXMR+vfB
	zioYnGk956c19RmS66sSM6fI2/tb8bB9MI8luapyTnLVRnQC0K4tzMIFoxJ0w5N13k6Qubkl8oyeh
	uTaUa7Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyr4-0000000149q-3FFL;
	Wed, 15 Apr 2026 11:56:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyr0-0000000145f-2YED
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 11:56:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AE8B941A86;
	Wed, 15 Apr 2026 11:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE07C19424;
	Wed, 15 Apr 2026 11:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776254181;
	bh=+qvw/cNR5lgyckmvSm1tTdqwHPtUgkC0Qv6B2PrVngs=;
	h=From:To:Cc:Subject:Date:From;
	b=KmC5eyMuR+XFPGaMlZqK3ijPc8id/M5/qf3x56MTWVXa2C1Mcmy9Si8onfRL+CedP
	 fKUB+g3ixmH7QMkS0BVUN2GriVjqmFOHg8gfHCDqAQ77Zt2jzpVjd0PFuXFKEUVUjZ
	 hi2a41QPnsYocHduW7YJykzs1Tcll3+9dt2XnJsn12bynMkI4m2O1OLgpP1Dh8WhXc
	 ihFUiOaVSYAcCTdQM8ZpaayDQy3DH0oidRR+7IvdlUXiITpAVM3w5x9Iu7FwA4VqNx
	 khtfX9wqQ3kUcYIsChcsYLAOtM2f+M1/XJZkwIPGt0sVfXxDYLyv0y53y6rGLDR49u
	 Q7Ryr452diABQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wCyqx-0000000Bqsi-0aPT;
	Wed, 15 Apr 2026 11:56:19 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH 00/18] KVM: arm64: Second batch of vgic fixes for 7.1
Date: Wed, 15 Apr 2026 12:55:41 +0100
Message-ID: <20260415115559.2227718-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_045622_680386_4F27F431 
X-CRM114-Status: GOOD (  11.94  )
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

With the GICv5 PPi support merged in, it has become obvious that a few
things could be improved, both from the correctness and
maintainability angles.

Sascha and I have been working on this, and this series is the sum of
our collective efforts.

The most important bits are related to the changes affecting the timer
for v3-on V5, and the corresponding change in the GICv5 host driver,
aligning it with its GICv3 counterpart.

Patches on top of kvmarm/next.

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


