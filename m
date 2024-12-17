Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB303E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 15:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8IH/gExoGm/2ntNmgHzUQ3ZKpOJPNbvP2Yd0ihhv5pA=; b=Px7Bi7cANWm1CYwRi8SoMjnCDQ
	uY+6aj+yEAYQOhj0BRO0vSl3H8eXwrWxotX7Nl3dGadsyxN1BuPPfvrSoUZ7EncO8+1YmPy4Z8g/+
	8tH6hTIMVX2zZxNaD0LoB81XILbkpCe4meWOdAnK/r6JQqOTnu8RPcMHSPzXmesk9TawrT+VesJgG
	APdgMLX3KjhW0ZIL8jLKwPOkD9M6cz/1UN44AmrKXQG6bsPFUlpf0CdWoMYFOvA7cjtbhjKunmOad
	vvb08Lb42Qn8vgR5OLzZfDZpQlPPu2AfQ3tPSPmd/xE8mh6a9nU/m6meRGI+hI8t9awPKO+AnPUuE
	WrlcWfxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZM3-0000000Dvat-08CV;
	Tue, 17 Dec 2024 15:19:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZGv-0000000DuRN-2bV9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 15:14:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 268CFA4197A;
	Tue, 17 Dec 2024 15:12:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85822C4CED3;
	Tue, 17 Dec 2024 15:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734448444;
	bh=GlgUN4izxMEky7tzraNnnv/jpJYjLpUaIla9Xa9CfCY=;
	h=From:To:Cc:Subject:Date:From;
	b=pH1ZKaeUHV0XgCBkPG3x79QX0bgIRWkcZYCDBfqVdQk0ouMtb4eq+bgo9ItZxZBpW
	 Cd0JIrPBsVM5/kVT/F1lbjKtU9lCDKi4GbCfOr7EPGx6dggzuTNqF4tBjSFS4bY9P0
	 qp16qxE18aOu0vY8v18ygZuHawbjv7sh2SWqS2h/6WnFZhabhH8sDUfaI2g2d9uYYd
	 hyRG692otoYTmhGRPlSdEe/PFrp7o3pRGvdafW7JAAjUtcfAQwZdLnBaEwUL9rblg0
	 fiZ5o5+yzqCTmwNMQgiUkVreTroXW8/7V1iPR53Av2J5HWHRwhNjeIzSCx3KOdPqZ6
	 uUqVVYSrd8wRA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tNZGs-004bWV-Cs;
	Tue, 17 Dec 2024 15:14:02 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eauger@redhat.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Subject: [PATCH 00/16] KVM: arm64: Add NV GICv3 support
Date: Tue, 17 Dec 2024 15:13:15 +0000
Message-Id: <20241217151331.934077-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eauger@redhat.com, gankulkarni@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_071405_794194_0EA2A55A 
X-CRM114-Status: GOOD (  12.73  )
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

As a pendant to the timer code, here's the basic support for GICv3 for
NV.

Compared to the versions that have existed in the past, this is a
significant improvement, as the maintenance interrupt is finally
behaving correctly, and I have dropped the horrible hacks that only
gave the impression something was working.

The code is much simpler, isolated, and can even make some sense if
you have the correct pink-ish glasses.

As for the timer code, this has been tested as part of my integration
branch [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=kvm-arm64/nv-next

Andre Przywara (1):
  KVM: arm64: nv: Allow userland to set VGIC maintenance IRQ

Jintack Lim (1):
  KVM: arm64: nv: Respect virtual HCR_EL2.TWx setting

Marc Zyngier (12):
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

Oliver Upton (2):
  KVM: arm64: Move host SVE/SME state flags out of vCPU
  KVM: arm64: nv: Request vPE doorbell upon nested ERET to L2

 .../virt/kvm/devices/arm-vgic-v3.rst          |  12 +-
 arch/arm64/include/asm/kvm_emulate.h          |  13 +
 arch/arm64/include/asm/kvm_host.h             |  71 ++-
 arch/arm64/include/asm/kvm_hyp.h              |   2 +
 arch/arm64/include/asm/sysreg.h               |  30 --
 arch/arm64/include/uapi/asm/kvm.h             |   1 +
 arch/arm64/kvm/Makefile                       |   2 +-
 arch/arm64/kvm/arm.c                          |  13 +-
 arch/arm64/kvm/emulate-nested.c               |  18 +-
 arch/arm64/kvm/fpsimd.c                       |  12 +-
 arch/arm64/kvm/handle_exit.c                  |   6 +-
 arch/arm64/kvm/hyp/vgic-v3-sr.c               |  16 +-
 arch/arm64/kvm/nested.c                       |  12 +
 arch/arm64/kvm/sys_regs.c                     |  95 +++-
 arch/arm64/kvm/vgic-sys-reg-v3.c              |   8 +-
 arch/arm64/kvm/vgic/vgic-init.c               |  22 +
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
 27 files changed, 841 insertions(+), 133 deletions(-)
 create mode 100644 arch/arm64/kvm/vgic/vgic-v3-nested.c

-- 
2.39.2


