Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D79C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 09:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SMpdyicM6ZYlIk0X2zXglwqGKrp0spNpaPbbnN9IPcs=; b=Zk3YKelR3qNKLksxnrUtqOWJpY
	7rAtLCU1QPhzVm9XjRAGnmJbKEZ6ZV42z3vqx4IxScLSw/7NkW+375SeTXKM1BLRCqaEp+ZBNtEOA
	DnViZqPnfWSTATm8rbrHD/IAUl0slkf5vvsUzf4o2gYqdsK5cFSJrlsL0F/sj9PTrfyVcd+5t4M2Q
	TkNBDbVAYFDLu5ly8ymoM03r55Zoo3uE22iM+lBdXma+kFENQLQSVPzKc4H9x4Y9nvPAkNftCYJ2E
	T6LFbz5ibwZZVh58XakmtOB7kscgpeLPYjVWog0oAVhg/Bn6ajqN0QwHmXuPUZL0vhtlaGYj/pGdW
	eaZRJ4lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZFy-0000000BP1N-13xc;
	Tue, 14 Jul 2026 09:16:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZFx-0000000BP0u-1c1p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 09:16:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 14EDA408B6;
	Tue, 14 Jul 2026 09:16:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC0661F000E9;
	Tue, 14 Jul 2026 09:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784020609;
	bh=SMpdyicM6ZYlIk0X2zXglwqGKrp0spNpaPbbnN9IPcs=;
	h=From:To:Cc:Subject:Date;
	b=MGWdd89U/byRf8tLD6L2CVTs5dmwutok7Ws9zE+zcWq3HBNnySERzFhrK5flki7rM
	 WOijEy97y1K3GP97a3Hdb11g2IWC6Sg/wt2mFBKaiJvbn69NR63P+emSqfXjKwIQhz
	 zNjsiBZBDr8NxFlCLN5v8TurXVeoOl0yc9I6zbHdOXX1voHTbMsBxRMdR13VBD0HcL
	 XIxKDGhk7WOiMEFQuIDZGw3A7PPDqFhr2jswBTlh0WyL5I2jnBYgDUO8DTRjViPB8S
	 Qs77hcGgWpKtdzpNVXMqzHcb79bX51Ei0ZgrGlU6bOYUXRMSNdzRc8g8n4UiVLWFHT
	 L3IHaurpwxVxg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wjZFu-00000004ny1-3uJc;
	Tue, 14 Jul 2026 09:16:47 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 00/28] KVM: arm64: Add support for FEAT_NV2p1 and FEAT_NV3
Date: Tue, 14 Jul 2026 10:16:13 +0100
Message-ID: <20260714091641.1970822-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
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

This is the second version of a series adding support for two
extensions targeting Nested Virt on arm64:

- FEAT_NV2p1 is effectively a bug fix for two registers (CNTHCTL_EL2
  and CPTR_EL2) that are missing stateful bits when accessed from EL1
  in a NV configuration. When this is present, the hypervisor can
  avoid a bunch of traps.

- FEAT_NV3 is much more ambitious, and changes the way ERET behaves in
  a NV environment. By moving EL1 accesses to HCR_EL2 from memory (via
  VNCR) to a dedicated register (NVHCR_EL2), the HW can detect whether
  the guest is performing an ERET for itself (NVHCR_EL2.TGE==1) or to
  its own guest (NVHCR_EL2.TGE==0). In the former case, ERET is done
  directly, and no trap occurs. Similar optimisations are available
  for a class of TLBI instructions.

The whole thing has been tested on an FVP model, and shown measurable
improvements for an L1 guest (about 1.5% fewer instructions).

Given that this isn't very convincing on its own, I have built an
approximate emulation of FEAT_NV3 that L1 (and deeper levels) can use
on actual production hardware. For these deeper levels, the numbers
are in the double digit of percentage point reduction, see below for
details.

Does it make NV better? Yes!
Does it make NV good? Get real!

Anyway, patches on top of -rc3 plus the current state of kvmarm/fixes.

* Side notes about performance evaluation with NV3 emulation:

If you are interested in the NV3 emulation, I have a branch [0] that
contains it all. Note that the improvement only kicks while running an
L2 guest running at EL2 -- L1 will not see any improvement. But I get
close to 40% improvements on L2, and 60% on L3 for the only workload
that really matters (Debian Installer).

If all your nested guests are running this hack, then you can pass
"kvm-arm.mode=nested,nvtge" on the host command line, and all the
nested guests will opt in the accelerated behaviour.

If you like to live dangerously (or have a machine that does not have
FEAT_HCX), you can instead pass 'kvm-arm.mode=nested,nvtge=force', and
ERET will get the acceleration without even guest buy-in.

* From v1 [1]:

 - Expanded generation of RESx and UNKN symbols to both Mapping and
   Fields qualifiers

  - Dropped HFGIRT_EL2.ERET checks on ERET fast-path

  - Fixed the NVHCR_EL2 trap handling

  - Added FORCE_RESx() to HCRX_EL2 constraints

  - Fixed ID_AA64MMFR4_EL1 sanitisation

  - Added NV3 acceleration for TLBIOS

  - Collected RBs from Joey, with thanks

[0] https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=kvm-arm64/nv3
[1] https://lore.kernel.org/r/20260702160248.1377250-1-maz@kernel.org

Marc Zyngier (28):
  arm64: sysreg: Emit RESx/UNKN values for Mapping/Fields definitions
  arm64: Update ID_AA64MMFR4_EL1 description to 2026-03 JSON release
  KVM: arm64: Merge guest's HCRX_EL2 using NV_HCRX_GUEST_EXCLUDE
  KVM: arm64: Drop __HCRX_EL2_* masks
  KVM: arm64: Plumb HCRX_EL2.SRMASKEn in HCRX_EL2 sanitisation
  KVM: arm64: Classify CPTR_EL2 as a SR_LOC_SPECIAL register
  KVM: arm64: Don't evaluate HCR_EL2.NV nor HFGITR_EL2.ERET on ERET fast
    path
  arm64: Add ARM64_HAS_NV2P1 capability
  KVM: arm64: Relax CPTR_EL2 handling when FEAT_NV2p1 is present
  KVM: arm64: Relax CNTHCTL_EL2 handling when FEAT_NV2p1 is present
  KVM: arm64: Expose FEAT_NV2p1 to NV guests
  arm64: Add FEAT_NV2p1 detection
  arm64: sysreg: Add NVHCR_EL2 description as a mirror of HCR_EL2
  arm64: sysreg: Add HCRX_EL2 bits related to FEAT_NV3
  arm64: Add ARM64_HAS_NV3 capability
  KVM: arm64: Split NV-specific exit fixups from the non-NV handling
  KVM: arm64: Add NV3 control bits to HCRX_EL2 sanitisation
  KVM: arm64: Add kvm_has_nv{2,3}() predicates
  KVM: arm64: Make HCR_EL2 a non-VNCR register
  KVM: arm64: Add sanitisation for NVHCR_EL2
  KVM: arm64: Add NVHCR_EL2 handling to the sysreg array
  KVM: arm64: Add routing for NVHCR_EL2 trap
  KVM: arm64: Add NVHCR_EL2 context switching
  KVM: arm64: Engage NV3 ERET trap elision
  KVM: arm64: Engage NV3 TLBI trap elision
  KVM: arm64: Add FEAT_NV3 detection
  KVM: arm64: Expose FEAT_NV3 to guests
  arm64: Add override for ID_AA64MMFR4_EL1.NV_frac

 arch/arm64/include/asm/cpufeature.h        |  1 +
 arch/arm64/include/asm/kvm_arm.h           | 15 ------
 arch/arm64/include/asm/kvm_emulate.h       | 45 ++++++++++++++++-
 arch/arm64/include/asm/kvm_host.h          |  3 +-
 arch/arm64/include/asm/vncr_mapping.h      |  2 +-
 arch/arm64/kernel/cpufeature.c             | 18 ++++++-
 arch/arm64/kernel/image-vars.h             |  1 +
 arch/arm64/kernel/pi/idreg-override.c      | 10 ++++
 arch/arm64/kvm/arch_timer.c                | 10 +++-
 arch/arm64/kvm/config.c                    | 27 +++++++++-
 arch/arm64/kvm/emulate-nested.c            | 18 +++++--
 arch/arm64/kvm/hyp/include/hyp/switch.h    | 27 ++++++++--
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 11 +++++
 arch/arm64/kvm/hyp/vhe/switch.c            | 49 ++++++++++++++-----
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c         | 21 +++++---
 arch/arm64/kvm/nested.c                    | 14 +++++-
 arch/arm64/kvm/sys_regs.c                  | 57 ++++++++++++++++++++--
 arch/arm64/tools/cpucaps                   |  2 +
 arch/arm64/tools/gen-sysreg.awk            |  8 +--
 arch/arm64/tools/sysreg                    | 42 ++++++++++++++--
 20 files changed, 316 insertions(+), 65 deletions(-)

-- 
2.47.3


