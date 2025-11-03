Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D27ECCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i+KKcQ1gS7oe6cEJZgVxdC2Ysf2xpZ6Rk3Vk0aGRMmk=; b=3CPT8wGhNp8QiseyLJq+gGSZzU
	jTyExmDPYB7WvASM96iHW5WJYWR303My6TSSgXBJVbj5HNcASOEAyRWlfmbqfj5xdZvcE587TTvvt
	deh4hXvSfkb+eX0tylhWBmBjO7iZlY8MEVoUx7WKpnRqrfxjKgTa94WrpRD2za1U0Wc7Gf9dByHI7
	YCn1ziN6gn1MuFqEuKgrhYIHrFDN/OUL5v9Swes6co4nmRmsDhNIx2XCcg+HVhQ1C7lQ50VFCNhQh
	KXszrDhg43AWJjSfhkutd65jdFQcnaVjoE4HQXDhPDaJzOudcfQclX/NeHHzzUrwr7mqKtx6enGE0
	b+2HOUXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxq5-0000000AJyu-48kd;
	Mon, 03 Nov 2025 16:55:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxq4-0000000AJwx-0rYg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:55:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 679DB6013C;
	Mon,  3 Nov 2025 16:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11BB5C19422;
	Mon,  3 Nov 2025 16:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762188927;
	bh=suP6ZIuEv63agTWdaS/NuD+FxVbr8fg9fXCoKLHHQwo=;
	h=From:To:Cc:Subject:Date:From;
	b=M4+zVTPz1FGMLmfT5M9uxuGgWhZGsD+2lz/maX8OrcCKSs6fPrSccXF2oULopNwiR
	 vmUVUi4MhKlRiQe5CB95cZePpKXIJjWTcjhfvxCK+v2IE5LlYgXxQJ55JID2JqXx6x
	 8h4weZ8DRl790RiuzVNzq14IXqVgbS8gQSXDk8TXQEFjnQjB6eRs46JrW75WbPi1r3
	 jxnM6eiQd/+h0iTFvcPBTgliL3e/EkKKxkjkVLW27g1sfjfO6lPFAMPVnDAuTdwXHS
	 3UVGeGwW2Z2NpeM/CHQr5JmE4QH/1oN0nip64yuMu1FA2JXGNh2Oh1Tf+fXtY/B2Jl
	 O7+stPimWZpSg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vFxq0-000000021VN-2Z2r;
	Mon, 03 Nov 2025 16:55:24 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 00/33] KVM: arm64: Add LR overflow infrastructure
Date: Mon,  3 Nov 2025 16:54:44 +0000
Message-ID: <20251103165517.2960148-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com
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

Despite being an awfully complex piece of software, the KVM vgic
implementation is not doing what it should in a number of cases:

- It behaves very badly when the number of in-flight interrupts
  targeting a specific CPU exceed the number of list registers
  (LRs). This is catastrophic with NV (Volodymyr triggered that one
  with a Xen guest), but can easily be triggered without it. You just
  have to activate more interrupts than the number of LRs to end-up
  with a guest live-lock.

- Similar issues exist when making high-priority interrupts targeting
  a group that isn't enabled.

Overall, this stems from the vgic implementation not sorting the
interrupts presented to the guest in the correct order (i.e. the one
expected by the architecture), and allow deactivation outside of the
window exposed by the LRs.

Unfortunately, the cure for this is pretty involved, and involves
adding a significant amount of complexity:

- Order the list as the architecture requires it, by starting with
  placing the HPPIs at the forefront of the ap_list

- Handle deactivation for EOImode being 0 or 1, which is specially
  annoying as we cannot easily find out which mode we're in, and we
  need to handle both concurrently

- Deal with individual interrupt groups being enabled/disabled

- Deal with SPIs being acked on one CPU and deactivated on another

Implementation wise, this is about extracting the relevant primitive
from the existing code, making guest state available to the emulation
more eagerly, dealing with a lot more MI sources, and be creative
about trapping stuff. Oh, and of course dealing with broken HW,
because nothing would be fun if we didn't.

The eagle eyed reviewer will notice that this series doesn't provide
any selftest. That's on purpose: I'm still working on those, and I
could do with some reviewing while I'm finishing them, and plan to
post them with v2.

Marc Zyngier (33):
  irqchip/gic: Add missing GICH_HCR control bits
  irqchip/gic: Expose CPU interface VA to KVM
  irqchip/apple-aic: Spit out ICH_MIDR_EL2 value on spurious vGIC MI
  KVM: arm64: Turn vgic-v3 errata traps into a patched-in constant
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
  KVM: arm64: Make vgic_target_oracle() globally available
  KVM: arm64: Invert ap_list sorting to push active interrupts out
  KVM: arm64: Move undeliverable interrupts to the end of ap_list
  KVM: arm64: Use MI to detect groups being enabled/disabled
  KVM: arm64: Add AP-list overflow split/splice
  KVM: arm64: GICv3: Handle LR overflow when EOImode==0
  KVM: arm64: GICv3: Handle deactivation via ICV_DIR_EL1 traps
  KVM: arm64: GICv3: Add GICv2 SGI handling to deactivation primitive
  KVM: arm64: GICv3: Set ICH_HCR_EL2.TDIR when interrupts overflow LR
    capacity
  KVM: arm64: GICv2: Handle LR overflow when EOImode==0
  KVM: arm64: GICv2: Handle deactivation via GICV_DIR traps
  KVM: arm64: GICv2: Always trap GICV_DIR register
  KVM: arm64: GICv3: Add SPI tracking to handle asymmetric deactivation

 arch/arm64/include/asm/kvm_asm.h         |   2 +-
 arch/arm64/include/asm/kvm_host.h        |   1 +
 arch/arm64/include/asm/kvm_hyp.h         |   2 +-
 arch/arm64/include/asm/virt.h            |   7 +-
 arch/arm64/kernel/cpufeature.c           |  34 ++
 arch/arm64/kernel/hyp-stub.S             |   5 +
 arch/arm64/kernel/image-vars.h           |   1 +
 arch/arm64/kvm/arm.c                     |   7 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c       |   7 +-
 arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c |   4 +
 arch/arm64/kvm/hyp/vgic-v3-sr.c          |  55 +--
 arch/arm64/kvm/sys_regs.c                |  19 +-
 arch/arm64/kvm/vgic/vgic-init.c          |   3 +
 arch/arm64/kvm/vgic/vgic-mmio-v2.c       |  24 ++
 arch/arm64/kvm/vgic/vgic-mmio.h          |   1 +
 arch/arm64/kvm/vgic/vgic-v2.c            | 311 +++++++++++++----
 arch/arm64/kvm/vgic/vgic-v3-nested.c     |  11 +-
 arch/arm64/kvm/vgic/vgic-v3.c            | 419 ++++++++++++++++++-----
 arch/arm64/kvm/vgic/vgic-v4.c            |   5 +-
 arch/arm64/kvm/vgic/vgic.c               | 328 ++++++++++++------
 arch/arm64/kvm/vgic/vgic.h               |  44 ++-
 arch/arm64/tools/cpucaps                 |   1 +
 drivers/irqchip/irq-apple-aic.c          |   7 +-
 drivers/irqchip/irq-gic.c                |   3 +
 include/kvm/arm_vgic.h                   |  35 +-
 include/linux/irqchip/arm-gic.h          |   6 +
 include/linux/irqchip/arm-vgic-info.h    |   2 +
 27 files changed, 1012 insertions(+), 332 deletions(-)

-- 
2.47.3


