Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADEDCF539E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2A/1lehrU2iaR4JPmPj1bxhi17E95npLxbVxM5cQlUc=; b=t8LGVPrLa2QG3/bpF6jOqk3v+d
	iP3ilBd1hLF3qNN0L+KdkCAmCirQWaGINRQMzi04LxxQWlf7uKCSfUGbt68K8t3qkyvS3BIW5KRGL
	H7gE9llTwVvlYFfror0H8+R19c2hpmXqP7S9QAheMmpsc+EKwXqAKk2FDsmS3BI2LPWAz2TFweFTR
	KEXqrf8reUjWeuYUsfgxT6ra7bZY2ic9gVpKAEyVi9dso9dBNL9pLVWzfrOHbaj7hpVrLm/7ydbrV
	ivszKHTtd2c2IoaR+QTiCAnVdU+VFkacKv7XyLklAPpubSap9FRswqMpIv4dt5LeZq1KqIVxgm9cn
	CMSmKfpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cum-0000000EsLc-1YWf;
	Wed, 23 Oct 2024 15:04:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckD-0000000EpHF-2Uru
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:53:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7E00B5C43E7;
	Wed, 23 Oct 2024 14:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE707C4CEE8;
	Wed, 23 Oct 2024 14:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695231;
	bh=f/H+FmXKTarWRs6GjZIMlh65NUT72kLDybnYfYv3dx0=;
	h=From:To:Cc:Subject:Date:From;
	b=R1aA0GyJUM5dNwyZyceRkwXkC/fNVTJdN0e5l5ZixZBNpLDRP1leYmDvbQUwGkQJk
	 rr5VP1VOewjaHePfuywdLYd2+7xlB0nxHtdR7krtsk0hhK6R6Yttug4bLg/u+9isn0
	 WFxLzqgI0yh7XEbOJnDK1hNgqlz5rQi+eGgNk+Z036d1NEEbLI/L2mx3OZebRfOoGC
	 JLBu9xHhAgaDTpoM3XaG8QdUxwzjLCs5bI80k53TKaa2+tORQUgZarxuuvmOdCFeTA
	 /BRQoC4lPGBpKm+nsOjyt4IcgEwTTxq+pGVVsyPy6jPBm1t7ITGPv7ACem+kDem2iR
	 R9hPK3KqiBsxw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ck9-0068vz-Fn;
	Wed, 23 Oct 2024 15:53:49 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 00/37] KVM: arm64: Add EL2 support to FEAT_S1PIE/S1POE
Date: Wed, 23 Oct 2024 15:53:08 +0100
Message-Id: <20241023145345.1613824-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, alexandru.elisei@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_075353_763116_53D83F4B 
X-CRM114-Status: GOOD (  15.68  )
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

This series serves a few purposes:

- Complete the S1PIE/S1POE support to include EL2
- Sneak in the EL2 system register world switch

As mentioned in few of the patches, this implementation relies on a
very recent fix to the architecture (D22677 in [0]).

Patches on top of v6.12-rc1.

* From v4 [4]:

  - Reordered the series to reduce the churn

  - Fixed an embarassing bug where we would check for S1PIE instead of S1POE

  - Move VPIDR_EL2 reset to vcpu_put()

  - Fixed typos and stuff

* From v3 [3]:

  - Added a few extra patches to deal with S1POE at EL2, including AT

  - Fix CPTR_EL2.E0POE non-sensical trap entry

  - Make sure that TVM and TRVM are handling the EL1 PIE/POE traps

  - Simplify some of the visibility cruft

  - Rebased on v6.12-rc1

* From v2 [2]:

  - Correctly reprogram the context for AT in the fast path when S1PIE
    is in use

  - Generalised sysreg RES0/RES1 masking, and added TCR2_EL2 RES0/RES1
    bit handling

  - Fix TCR2_EL1, PIR_EL1, PIRE0_EL1 access with VHE

  - Add a bunch of missing registers to get_el2_to_el1_mapping()

  - Correctly map {TCR2,PIR,PIRE0}_EL2 to their EL1 equivalent on NV

  - Disable hierarchical permissions when S1PIE is enabled

  - Make EL2 world switch directly act on the vcpu rather than an
    arbitrary context

  - Remove SKL{0,1} from the TCR2_EL2 description

* From the initial posting [1]:

- Rebased on top of the AT support branch, which is currently sitting
  in kvmarm/next

- Add handling for S1 indirect permission in AT, which I'm sure will
  give Alexandru another king-sized headache

- Picked Mark Brown's series dealing with TCRX and S1PIE
  visibility, and slapped an extra fix on top for good measure

- Picked up RBs from Joey, with thanks.

[0] https://developer.arm.com/documentation/102105/ka-04/
[1] https://lore.kernel.org/r/20240813144738.2048302-1-maz@kernel.org
[2] https://lore.kernel.org/r/20240903153834.1909472-1-maz@kernel.org
[3] https://lore.kernel.org/r/20240911135151.401193-1-maz@kernel.org
[4] https://lore.kernel.org/r/20241009190019.3222687-1-maz@kernel.org

Marc Zyngier (34):
  arm64: Drop SKL0/SKL1 from TCR2_EL2
  arm64: Remove VNCR definition for PIRE0_EL2
  arm64: Add encoding for PIRE0_EL2
  KVM: arm64: Drop useless struct s2_mmu in __kvm_at_s1e2()
  KVM: arm64: nv: Add missing EL2->EL1 mappings in
    get_el2_to_el1_mapping()
  KVM: arm64: nv: Handle CNTHCTL_EL2 specially
  KVM: arm64: nv: Save/Restore vEL2 sysregs
  KVM: arm64: Correctly access TCR2_EL1, PIR_EL1, PIRE0_EL1 with VHE
  KVM: arm64: Extend masking facility to arbitrary registers
  arm64: Define ID_AA64MMFR1_EL1.HAFDBS advertising FEAT_HAFT
  KVM: arm64: Add TCR2_EL2 to the sysreg arrays
  KVM: arm64: Sanitise TCR2_EL2
  KVM: arm64: Add save/restore for TCR2_EL2
  KVM: arm64: Add PIR{,E0}_EL2 to the sysreg arrays
  KVM: arm64: Add save/restore for PIR{,E0}_EL2
  KVM: arm64: Handle PIR{,E0}_EL2 traps
  KVM: arm64: Sanitise ID_AA64MMFR3_EL1
  KVM: arm64: Add AT fast-path support for S1PIE
  KVM: arm64: Split S1 permission evaluation into direct and
    hierarchical parts
  KVM: arm64: Disable hierarchical permissions when S1PIE is enabled
  KVM: arm64: Implement AT S1PIE support
  KVM: arm64: Add a composite EL2 visibility helper
  KVM: arm64: Rely on visibility to let PIR*_ELx/TCR2_ELx UNDEF
  arm64: Add encoding for POR_EL2
  KVM: arm64: Drop bogus CPTR_EL2.E0POE trap routing
  KVM: arm64: Subject S1PIE/S1POE registers to HCR_EL2.{TVM,TRVM}
  KVM: arm64: Add kvm_has_s1poe() helper
  KVM: arm64: Add basic support for POR_EL2
  KVM: arm64: Add save/restore support for POR_EL2
  KVM: arm64: Add POE save/restore for AT emulation fast-path
  KVM: arm64: Disable hierarchical permissions when POE is enabled
  KVM: arm64: Make PAN conditions part of the S1 walk context
  KVM: arm64: Handle stage-1 permission overlays
  KVM: arm64: Handle WXN attribute

Mark Brown (3):
  KVM: arm64: Define helper for EL2 registers with custom visibility
  KVM: arm64: Hide TCR2_EL1 from userspace when disabled for guests
  KVM: arm64: Hide S1PIE registers from userspace when disabled for
    guests

 arch/arm64/include/asm/kvm_host.h          |  40 +-
 arch/arm64/include/asm/vncr_mapping.h      |   1 -
 arch/arm64/kvm/at.c                        | 470 ++++++++++++++++++---
 arch/arm64/kvm/emulate-nested.c            |  12 +-
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h |  11 +-
 arch/arm64/kvm/hyp/nvhe/sysreg-sr.c        |   2 +-
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c         | 160 ++++++-
 arch/arm64/kvm/nested.c                    |  40 +-
 arch/arm64/kvm/sys_regs.c                  | 145 ++++++-
 arch/arm64/tools/sysreg                    |  12 +-
 include/kvm/arm_arch_timer.h               |   3 +
 11 files changed, 776 insertions(+), 120 deletions(-)

-- 
2.39.2


