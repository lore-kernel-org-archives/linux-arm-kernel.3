Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1C1CF9C51
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kAHD4R9Bu/8ZD8LtE2yUqhcqsR576qLJ6cC6VHhYnR0=; b=IPCialelEo6wlTMoX9logNQKrv
	Ak5tMahQksjqmwO6ZcHwW2c62UwEO/e9Ufaz9dn2VeTruSgpbXfK07/wzOgaAlmgMPt7xhFhFVN7O
	dws1Th8diPCcYKTr3KUC0ywBPOeXV1K4QHdxmSp2ctDQOkYhVgVULfL6VlgQZ6ehH6DbLDu3jYqxO
	Lqucm9DKws98E3PNbAJh+woVjFsc94MdEue756S5h3LsuUe0LS90w+FW3cgrIWEZ7pQphfB45HWmd
	BdZZeOO38sCwUjl+Wl/vwWhx52Ec7v6JqDoK1XEzLSE7ZmbEDU5d6VUMUEXL6ZDyQ4kZM3o8LJIQ4
	iMu1JCzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Q7-000000075l0-2LQ5;
	Thu, 20 Nov 2025 17:26:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Ps-000000075Y7-2krF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:25:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 28CA8436D4;
	Thu, 20 Nov 2025 17:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB414C4CEF1;
	Thu, 20 Nov 2025 17:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659556;
	bh=MUlNQUsAces9/+6mURE7xgTA3MBnpvq24mdx5b5hI5c=;
	h=From:To:Cc:Subject:Date:From;
	b=WEdgoaUzYqRn+JYmxwL9SECZoTH3q12geELzliG8M0WYm6z4DKDbhvf2pJ1znwS9Q
	 2f3deooruStWSmakuPFssbUOnE6/0gZRe3cyTR3+T4wAFcjKpR4VOhnCFeDOZv4+NE
	 BObK3TmYlIqXQpKKszX4v7H5Ifcy71c2OnJ4+jmycZvKqTOiplbJXLqHNNQbcEPzzc
	 IBcleZRijqYe/VWgfLDTmLa3XuzTmypwf/O2H9sNj8EHWq2yMTKc8SRrXY6A+Fy7vR
	 1hgmtAwJt/vW5rpr58gryuRx8yuI339wITrskzI3XoY2W9l4WwYipYZfr8hF4HNkmB
	 EmUlR1LGg3sHg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Pp-00000006y6g-38k4;
	Thu, 20 Nov 2025 17:25:53 +0000
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
Subject: [PATCH v4 00/49] KVM: arm64: Add LR overflow infrastructure (the final one, I swear!)
Date: Thu, 20 Nov 2025 17:24:50 +0000
Message-ID: <20251120172540.2267180-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, tabba@google.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_092556_777087_03E4AE30 
X-CRM114-Status: GOOD (  18.25  )
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

As $SUBJECT says, I really hope this is the last dance for this
particular series -- I'm done with it! It was supposed to be a 5 patch
job, and we're close to 50. Something went really wrong...

Most of the fixes have now been squashed back into the base patches,
and the only new patch is plugging the deactivation helper into the NV
code, making it more correct.

Special thanks to Fuad for going the extra mile and testing this
series with pKVM.

* From v3 [3]:

  - Squashed most of the previous fixes in their original patch

  - Plug the L1 LR handling into the deactivation helper

* From v2 [2]:

  - Fix no-vgic-v3. Again.

  - Fix clearing of trap bits when running an EL1 host

  - Fix the NV handling of the MI, forcing the synchronising of LRs
    and VMCR early in order to deliver the MI as early as possible

  - Clean some leftovers of previous rework

  - Force a read-back of ICH_MISR_EL2 when disabling the vgic, making
    NV2 suck a bit less

  - Extra fixes made it out of the series:

    - Fix pKVM's lack of handling of GICv3 traps, and remember the
      VM's vgic type

    - Don't explode on non-Apple, non-GICv3 VHE HW by checking
      ICH_VTR_EL2 when there is none to check

* From v1 [1]:

  - Fixed the ICH_HCR_EL2.TDIR detection code to include the Apple
    stuff, and to deal with GICv5's legacy mode

  - Fixed compilation issue for old toolchains that don't understand
    the GICv3 sysreg names

  - Allow GICv3 in-LR deactivation even when DIR trapping is enabled

  - Dropped the split overflow list, once I convinced myself it wasn't
    bringing much to the table

  - Turned kvm_vgic_vcpu_enable() into a vgic reset helper

  - Remove IPI-ing on GICv3 systems without TDIR

  - Fixed the out-of-LR deactivation when dealing with asymmetric SPI
    deactivation

  - Fixed broken MMIO offset computation

  - Added group enable to the GIC selftest library

  - Added fixes and improvements to the vgic_irq selftest:

    - Fixed definition of spurious interrupt

    - Fixed config/enable ordering

    - Prevent timer interrupts from being injected from userspace

    - Removed limit of 4 interrupts being injected at any given time

    - Added an asymmetric SPI deactivation test case

    - Added a Group-0 enable test case

    - Added a timer interrupt + SPI interrupt test case

  - Fixed a couple of spelling mistakes (and added many more, I'm sure)

  - Reordered the series slightly

[1] https://lore.kernel.org/r/20251103165517.2960148-1-maz@kernel.org
[2] https://lore.kernel.org/r/20251109171619.1507205-1-maz@kernel.org
[3] https://lore.kernel.org/r/20251117091527.1119213-1-maz@kernel.org

Marc Zyngier (49):
  irqchip/gic: Add missing GICH_HCR control bits
  irqchip/gic: Expose CPU interface VA to KVM
  irqchip/apple-aic: Spit out ICH_MISR_EL2 value on spurious vGIC MI
  KVM: arm64: Turn vgic-v3 errata traps into a patched-in constant
  KVM: arm64: vgic-v3: Fix GICv3 trapping in protected mode
  KVM: arm64: GICv3: Detect and work around the lack of ICV_DIR_EL1
    trapping
  KVM: arm64: Repack struct vgic_irq fields
  KVM: arm64: Add tracking of vgic_irq being present in a LR
  KVM: arm64: Add LR overflow handling documentation
  KVM: arm64: GICv3: Drop LPI active state when folding LRs
  KVM: arm64: GICv3: Preserve EOIcount on exit
  KVM: arm64: GICv3: Decouple ICH_HCR_EL2 programming from LRs
  KVM: arm64: GICv3: Extract LR folding primitive
  KVM: arm64: GICv3: Extract LR computing primitive
  KVM: arm64: GICv2: Preserve EOIcount on exit
  KVM: arm64: GICv2: Decouple GICH_HCR programming from LRs being loaded
  KVM: arm64: GICv2: Extract LR folding primitive
  KVM: arm64: GICv2: Extract LR computing primitive
  KVM: arm64: Compute vgic state irrespective of the number of
    interrupts
  KVM: arm64: Eagerly save VMCR on exit
  KVM: arm64: Revamp vgic maintenance interrupt configuration
  KVM: arm64: Turn kvm_vgic_vcpu_enable() into kvm_vgic_vcpu_reset()
  KVM: arm64: Make vgic_target_oracle() globally available
  KVM: arm64: Invert ap_list sorting to push active interrupts out
  KVM: arm64: Move undeliverable interrupts to the end of ap_list
  KVM: arm64: Use MI to detect groups being enabled/disabled
  KVM: arm64: GICv3: Handle LR overflow when EOImode==0
  KVM: arm64: GICv3: Handle deactivation via ICV_DIR_EL1 traps
  KVM: arm64: GICv3: Add GICv2 SGI handling to deactivation primitive
  KVM: arm64: GICv3: Set ICH_HCR_EL2.TDIR when interrupts overflow LR
    capacity
  KVM: arm64: GICv3: Add SPI tracking to handle asymmetric deactivation
  KVM: arm64: GICv3: Handle in-LR deactivation when possible
  KVM: arm64: GICv3: Avoid broadcast kick on CPUs lacking TDIR
  KVM: arm64: GICv3: nv: Resync LRs/VMCR/HCR early for better MI
    emulation
  KVM: arm64: GICv3: nv: Plug L1 LR sync into deactivation primitive
  KVM: arm64: GICv3: Force exit to sync ICH_HCR_EL2.En
  KVM: arm64: GICv2: Handle LR overflow when EOImode==0
  KVM: arm64: GICv2: Handle deactivation via GICV_DIR traps
  KVM: arm64: GICv2: Always trap GICV_DIR register
  KVM: arm64: selftests: gic_v3: Add irq group setting helper
  KVM: arm64: selftests: gic_v3: Disable Group-0 interrupts by default
  KVM: arm64: selftests: vgic_irq: Fix GUEST_ASSERT_IAR_EMPTY() helper
  KVM: arm64: selftests: vgic_irq: Change configuration before enabling
    interrupt
  KVM: arm64: selftests: vgic_irq: Exclude timer-controlled interrupts
  KVM: arm64: selftests: vgic_irq: Remove LR-bound limitation
  KVM: arm64: selftests: vgic_irq: Perform EOImode==1 deactivation in
    ack order
  KVM: arm64: selftests: vgic_irq: Add asymmetric SPI deaectivation test
  KVM: arm64: selftests: vgic_irq: Add Group-0 enable test
  KVM: arm64: selftests: vgic_irq: Add timer deactivation test

 arch/arm64/include/asm/kvm_asm.h              |   2 +-
 arch/arm64/include/asm/kvm_host.h             |   1 +
 arch/arm64/include/asm/kvm_hyp.h              |   3 +-
 arch/arm64/include/asm/virt.h                 |   7 +-
 arch/arm64/kernel/cpufeature.c                |  52 +++
 arch/arm64/kernel/hyp-stub.S                  |   5 +
 arch/arm64/kernel/image-vars.h                |   1 +
 arch/arm64/kvm/arm.c                          |   7 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |   7 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c                |   3 +
 arch/arm64/kvm/hyp/nvhe/sys_regs.c            |   5 +
 arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c      |   4 +
 arch/arm64/kvm/hyp/vgic-v3-sr.c               |  96 ++--
 arch/arm64/kvm/sys_regs.c                     |  19 +-
 arch/arm64/kvm/vgic/vgic-init.c               |   9 +-
 arch/arm64/kvm/vgic/vgic-mmio-v2.c            |  24 +
 arch/arm64/kvm/vgic/vgic-mmio.h               |   1 +
 arch/arm64/kvm/vgic/vgic-v2.c                 | 291 +++++++++---
 arch/arm64/kvm/vgic/vgic-v3-nested.c          | 104 ++---
 arch/arm64/kvm/vgic/vgic-v3.c                 | 426 ++++++++++++++----
 arch/arm64/kvm/vgic/vgic-v4.c                 |   5 +-
 arch/arm64/kvm/vgic/vgic.c                    | 298 +++++++-----
 arch/arm64/kvm/vgic/vgic.h                    |  43 +-
 arch/arm64/tools/cpucaps                      |   1 +
 drivers/irqchip/irq-apple-aic.c               |   7 +-
 drivers/irqchip/irq-gic.c                     |   3 +
 include/kvm/arm_vgic.h                        |  29 +-
 include/linux/irqchip/arm-gic.h               |   6 +
 include/linux/irqchip/arm-vgic-info.h         |   2 +
 tools/testing/selftests/kvm/arm64/vgic_irq.c  | 285 +++++++++++-
 .../testing/selftests/kvm/include/arm64/gic.h |   1 +
 tools/testing/selftests/kvm/lib/arm64/gic.c   |   6 +
 .../selftests/kvm/lib/arm64/gic_private.h     |   1 +
 .../testing/selftests/kvm/lib/arm64/gic_v3.c  |  17 +
 34 files changed, 1352 insertions(+), 419 deletions(-)

-- 
2.47.3


