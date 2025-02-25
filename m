Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B955C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 18:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W1uS3szUUGyjBmNacApOuldp09wV2AKh7BkSroPD82M=; b=HNTr9T0uIK9k8EO923hf5smyUD
	ZwAmXjfnyCaGk0LCujmYFivhfOJDZkxIqrjFaPwwRZGBQ3Cgd5P6n496oNHs5gHzc7vPIyJYd2IuV
	KlbSHEikLrWjoHomb78lNmMU8rBXYmg9Ave5Sd6S3XxKbT2+e1dfGuxt4+36Vx7IH+UjsMcfM/6Ux
	5HLC7zs6iacg2q3Pts5JMJnD6VojxbrNEOUNGLjvqduCRPV3XhGcZ6+JVQUioUF1Fot/sj5HAKpV3
	sClsGqb8kDrcdcX1hnIytg2mAtBWV+kQAosf9+a953wPn15sFtCCuP6bXTOqnMQFeIlljrIRmOzQW
	xp6gt4Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzJZ-00000000p6r-1cKz;
	Tue, 25 Feb 2025 18:05:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmykc-00000000e9R-2sqs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:29:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 332F4612AE;
	Tue, 25 Feb 2025 17:29:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3348C4CEDD;
	Tue, 25 Feb 2025 17:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740504585;
	bh=0xS3fW4oZ0PtXSj9HeugpPwELnlxqhqnqF89CfNA+uk=;
	h=From:To:Cc:Subject:Date:From;
	b=NW+nen33YMsuhW/Y7/XVUczMtZ5Z0Dv2umaRq83VrGRz2KaHzQzDTIzKVBP3K5DMO
	 ZWehbuDV+pIAAjPOLyL3kNvJYSnSgJTQpvM5bX1w3poH1o4Fwqa2tWP/VzjjSqCx3l
	 sEEvji4oEpJB6tFs0kNHkYx3O20X7b6Uxc7C+UAhIGRMIpXpXfKFkiCEbvGVwl8QXS
	 fwXUlBEgIKoZ95HtmCTSxk9ylk4TF4dPgzx2wZIlLVoG//WZfaiLbJDi0oYlku0Smm
	 cjwIegoKOO9/b0jDhXJ0XK7tWXpwRGPeo8yNEtAYeIdqNFzh9zVt2Gwx8hWHSPTtvh
	 EONRMi8XzcPIw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tmykZ-007rKs-KN;
	Tue, 25 Feb 2025 17:29:43 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v4 00/16] KVM: arm64: Add NV GICv3 support
Date: Tue, 25 Feb 2025 17:29:14 +0000
Message-Id: <20250225172930.1850838-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eric.auger@redhat.com
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

Here's a respin of the NV support for GICv3. The integration branch
containing this (and the rest of the NV stack) is still at [4].

At this stage, I think this is good to go.

* From v3 [3]:

  - Added a comment indicating the relative priority of L2->L1 IRQ
    handling as a request

  - Rebased on 6.14-rc3

* From v2 [2]:

  - Picked RBs from Andre, with thanks

  - Rebased on 6.14-rc1

* From v1 [1]:

  - Fix the default value for the MI INTID to PPI9, instead of
    something fairly random...

  - Fail KVM initialisation if asking for NV on HW without a virtual
    GICv3.

[1] https://lore.kernel.org/r/20241217151331.934077-1-maz@kernel.org
[2] https://lore.kernel.org/r/20250112170845.1181891-1-maz@kernel.org
[3] https://lore.kernel.org/r/20250206154925.1109065-14-maz@kernel.org
[4] https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=kvm-arm64/nv-next

Andre Przywara (1):
  KVM: arm64: nv: Allow userland to set VGIC maintenance IRQ

Jintack Lim (1):
  KVM: arm64: nv: Respect virtual HCR_EL2.TWx setting

Marc Zyngier (13):
  arm64: sysreg: Add layout for ICH_HCR_EL2
  arm64: sysreg: Add layout for ICH_VTR_EL2
  arm64: sysreg: Add layout for ICH_MISR_EL2
  KVM: arm64: nv: Load timer before the GIC
  KVM: arm64: nv: Add ICH_*_EL2 registers to vpcu_sysreg
  KVM: arm64: nv: Plumb handling of GICv3 EL2 accesses
  KVM: arm64: nv: Sanitise ICH_HCR_EL2 accesses
  KVM: arm64: nv: Nested GICv3 emulation
  KVM: arm64: nv: Handle L2->L1 transition on interrupt injection
  KVM: arm64: nv: Add Maintenance Interrupt emulation
  KVM: arm64: nv: Propagate used_lrs between L1 and L0 contexts
  KVM: arm64: nv: Fold GICv3 host trapping requirements into guest setup
  KVM: arm64: nv: Fail KVM init if asking for NV without GICv3

Oliver Upton (1):
  KVM: arm64: nv: Request vPE doorbell upon nested ERET to L2

 .../virt/kvm/devices/arm-vgic-v3.rst          |  12 +-
 arch/arm64/include/asm/kvm_emulate.h          |  13 +
 arch/arm64/include/asm/kvm_host.h             |  45 +-
 arch/arm64/include/asm/kvm_hyp.h              |   2 +
 arch/arm64/include/asm/sysreg.h               |  30 --
 arch/arm64/include/uapi/asm/kvm.h             |   1 +
 arch/arm64/kvm/Makefile                       |   2 +-
 arch/arm64/kvm/arm.c                          |  20 +-
 arch/arm64/kvm/emulate-nested.c               |  18 +-
 arch/arm64/kvm/handle_exit.c                  |   6 +-
 arch/arm64/kvm/hyp/vgic-v3-sr.c               |  16 +-
 arch/arm64/kvm/nested.c                       |  13 +
 arch/arm64/kvm/sys_regs.c                     |  95 +++-
 arch/arm64/kvm/vgic-sys-reg-v3.c              |   8 +-
 arch/arm64/kvm/vgic/vgic-init.c               |  29 ++
 arch/arm64/kvm/vgic/vgic-kvm-device.c         |  29 +-
 arch/arm64/kvm/vgic/vgic-v3-nested.c          | 409 ++++++++++++++++++
 arch/arm64/kvm/vgic/vgic-v3.c                 |  44 +-
 arch/arm64/kvm/vgic/vgic-v4.c                 |  18 +-
 arch/arm64/kvm/vgic/vgic.c                    |  38 ++
 arch/arm64/kvm/vgic/vgic.h                    |   6 +
 arch/arm64/tools/sysreg                       |  48 ++
 drivers/irqchip/irq-apple-aic.c               |   8 +-
 include/kvm/arm_vgic.h                        |  10 +
 tools/arch/arm/include/uapi/asm/kvm.h         |   1 +
 tools/arch/arm64/include/asm/sysreg.h         |  30 --
 26 files changed, 834 insertions(+), 117 deletions(-)
 create mode 100644 arch/arm64/kvm/vgic/vgic-v3-nested.c

-- 
2.39.2


