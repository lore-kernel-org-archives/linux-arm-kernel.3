Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969AAC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 23:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=upiPgFAzFqGrGcVo23a7K3SuYgEOmvnn9OoPfYIjF+0=; b=yeqASiKcIyEv1OzCgTTxvc77+l
	buPEE0ClAJPZo+s0WwqZiaB9Urb05wOWcyKAJkwUxR0+Kzukfa6NTkR7UbwoSbp6ypCYHpVD+9+0U
	Xv+v+WzV/oBjI5Z12Vcx6MznQP/5OeEwGiB/kbCRtatYNB4mdrYSOGd0OViabOAiXBZTX220Gpa/r
	l5wEuC/feBEtEs12N94Wi3Wr2zF9sun4Ag1WwJskMzTP/kcK06BZ3D1pqco6lR4XJXvSnfljCin5s
	QBsIbIrrmn/YIBJH6tkYEcBVUyx5HDgXlU8Uj9WMXLoZglBfgO1I31uP5TNjg6OMFk9KjfDmIUJdR
	B+bfB1bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCRpF-0000000Dfom-40W4;
	Tue, 06 May 2025 23:35:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLOr-0000000CiGp-0EV4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:44:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 64F93A4D68A;
	Tue,  6 May 2025 16:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0834AC4CEE4;
	Tue,  6 May 2025 16:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746549848;
	bh=geXjI7e3xVdMJHmwrLdJeTsuEUT9kysy5HNGfgTThy8=;
	h=From:To:Cc:Subject:Date:From;
	b=AB7dyfjozKuZZqAC7hFPnftj1PglNR0DKf6/pY2BR8VNm9yuH35JwXj4/KBcmAMhs
	 KaLFsDgxYB8F3fLnIVdp3AEwXlbfLz8eduN0sj343ffdM1oEaM74jdavkDbpJGfyC+
	 +WbK73LO0svX1BsERv8FWXSuneKDySyuFVe4GrqnrriJWcFdr/mU39tu/tqMC6EOcZ
	 2Gd+obaXTtdmxtxQ3LzxEy2iBVZznhmGCytPqsnVCRloTYv2ROQWyRqM5KOoUL38of
	 YbIzh/OxrsVUqhi3SwbWHRbYoCBf7Qxidr8qd4eXl6isupIoManoSVsMjNTXDa0jjk
	 lcPDOmdKwQh7Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uCLOn-00CJkN-Mg;
	Tue, 06 May 2025 17:44:05 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v4 00/43] KVM: arm64: Revamp Fine Grained Trap handling
Date: Tue,  6 May 2025 17:43:05 +0100
Message-Id: <20250506164348.346001-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com, ben.horgan@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_094409_223152_111F20C3 
X-CRM114-Status: GOOD (  14.15  )
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

This is yet another version of the series last posted at [1].

The eagled eye reviewer will have noticed that since v2, the series
has more or less doubled in size for any reasonable metric (number of
patches, number of lines added or deleted). It is therefore pretty
urgent that this gets either merged or forgotten! ;-)

See the change log below for the details -- most of it is related to
FGT2 (and its rather large dependencies) being added.

* From v3:

  - Added missing bit fields for CPACR_EL1

  - Fixed a bunch of typos in comments and commit messages

  - Cleaned-up whitespace damage from the sysreg generator

  - Collected RBs from Joey, with thanks!

* From v2:

  - Added comprehensive support for FEAT_FGT2, as the host kernel is
    now making use of these registers, without any form of context
    switch in KVM. What could possibly go wrong?

  - Reworked some of the FGT description and handling primitives,
    reducing the boilerplate code and tables that get added over time.

  - Rebased on 6.15-rc3.

[1]: https://lore.kernel.org/r/20250426122836.3341523-1-maz@kernel.org

Marc Zyngier (42):
  arm64: sysreg: Add ID_AA64ISAR1_EL1.LS64 encoding for FEAT_LS64WB
  arm64: sysreg: Update ID_AA64MMFR4_EL1 description
  arm64: sysreg: Add layout for HCR_EL2
  arm64: sysreg: Replace HFGxTR_EL2 with HFG{R,W}TR_EL2
  arm64: sysreg: Update ID_AA64PFR0_EL1 description
  arm64: sysreg: Update PMSIDR_EL1 description
  arm64: sysreg: Update TRBIDR_EL1 description
  arm64: sysreg: Update CPACR_EL1 description
  arm64: sysreg: Add registers trapped by HFG{R,W}TR2_EL2
  arm64: sysreg: Add registers trapped by HDFG{R,W}TR2_EL2
  arm64: sysreg: Add system instructions trapped by HFGIRT2_EL2
  arm64: Remove duplicated sysreg encodings
  arm64: tools: Resync sysreg.h
  arm64: Add syndrome information for trapped LD64B/ST64B{,V,V0}
  arm64: Add FEAT_FGT2 capability
  KVM: arm64: Tighten handling of unknown FGT groups
  KVM: arm64: Simplify handling of negative FGT bits
  KVM: arm64: Handle trapping of FEAT_LS64* instructions
  KVM: arm64: Restrict ACCDATA_EL1 undef to FEAT_LS64_ACCDATA being
    disabled
  KVM: arm64: Don't treat HCRX_EL2 as a FGT register
  KVM: arm64: Plug FEAT_GCS handling
  KVM: arm64: Compute FGT masks from KVM's own FGT tables
  KVM: arm64: Add description of FGT bits leading to EC!=0x18
  KVM: arm64: Use computed masks as sanitisers for FGT registers
  KVM: arm64: Propagate FGT masks to the nVHE hypervisor
  KVM: arm64: Use computed FGT masks to setup FGT registers
  KVM: arm64: Remove hand-crafted masks for FGT registers
  KVM: arm64: Use KVM-specific HCRX_EL2 RES0 mask
  KVM: arm64: Handle PSB CSYNC traps
  KVM: arm64: Switch to table-driven FGU configuration
  KVM: arm64: Validate FGT register descriptions against RES0 masks
  KVM: arm64: Use FGT feature maps to drive RES0 bits
  KVM: arm64: Allow kvm_has_feat() to take variable arguments
  KVM: arm64: Use HCRX_EL2 feature map to drive fixed-value bits
  KVM: arm64: Use HCR_EL2 feature map to drive fixed-value bits
  KVM: arm64: Add FEAT_FGT2 registers to the VNCR page
  KVM: arm64: Add sanitisation for FEAT_FGT2 registers
  KVM: arm64: Add trap routing for FEAT_FGT2 registers
  KVM: arm64: Add context-switch for FEAT_FGT2 registers
  KVM: arm64: Allow sysreg ranges for FGT descriptors
  KVM: arm64: Add FGT descriptors for FEAT_FGT2
  KVM: arm64: Handle TSB CSYNC traps

Mark Rutland (1):
  KVM: arm64: Unconditionally configure fine-grain traps

 arch/arm64/include/asm/el2_setup.h      |   14 +-
 arch/arm64/include/asm/esr.h            |   10 +-
 arch/arm64/include/asm/kvm_arm.h        |  186 ++--
 arch/arm64/include/asm/kvm_host.h       |   56 +-
 arch/arm64/include/asm/sysreg.h         |   26 +-
 arch/arm64/include/asm/vncr_mapping.h   |    5 +
 arch/arm64/kernel/cpufeature.c          |    7 +
 arch/arm64/kvm/Makefile                 |    2 +-
 arch/arm64/kvm/arm.c                    |   13 +
 arch/arm64/kvm/config.c                 | 1085 +++++++++++++++++++++++
 arch/arm64/kvm/emulate-nested.c         |  583 ++++++++----
 arch/arm64/kvm/handle_exit.c            |   77 ++
 arch/arm64/kvm/hyp/include/hyp/switch.h |  158 ++--
 arch/arm64/kvm/hyp/nvhe/switch.c        |   12 +
 arch/arm64/kvm/hyp/vgic-v3-sr.c         |    8 +-
 arch/arm64/kvm/nested.c                 |  223 +----
 arch/arm64/kvm/sys_regs.c               |   68 +-
 arch/arm64/tools/cpucaps                |    1 +
 arch/arm64/tools/sysreg                 | 1006 ++++++++++++++++++++-
 tools/arch/arm64/include/asm/sysreg.h   |   65 +-
 20 files changed, 2894 insertions(+), 711 deletions(-)
 create mode 100644 arch/arm64/kvm/config.c

-- 
2.39.2


