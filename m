Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F111C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 12:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AsROwKMWihxfmtMktPx1IPweNn+nrO2ljtqEKrTqrGs=; b=u0XfOiZ09ZZK1qtcmpxTpyrRfW
	mNB1mJQqbp6p9dTgVEvcQYBBSAWPnni+L9xuYduuZqueuzbNrFEMeHUiTrwpW2JobGug0AHsleji0
	2PShz6F/5uSNYd2LzHA+Vf/vSgpeiz9uX1K0EX/L97Clf000LFNgsk4feKvkgkMFiKr5r1Pp/LEc1
	AKubCJlO/hPEkZ8Kldg7Q4zuiZ2dLw3QDhw6iMVGp8/e0jD78RxA2FlzCw0GySUZZixQLfT6SJW8A
	WZOvIZdoNv+B30ALfyzgC1y6oV6gVjsLJ4sVAhFBAdd8tBhrzzm+lkN/5ixjG7Vvpm+63g1ApF1F+
	zxpl6b5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ena-000000020io-0UJo;
	Sat, 26 Apr 2025 12:38:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8eeK-00000001yyd-2PC9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 12:28:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0BD095C479B;
	Sat, 26 Apr 2025 12:26:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69019C4CEEA;
	Sat, 26 Apr 2025 12:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745670530;
	bh=PxCOa7ezxiwNsj/z6VNegE0qp4zLiQ9eD8lTtFWnYPA=;
	h=From:To:Cc:Subject:Date:From;
	b=soyth5cZqEWPqnr3GfkkTlyCScP0LzNBQNJ462sXGNYAfH6/1u2mDK3rWICthzpQ5
	 FjdXZos/KtugkyT3bR9ERCj7wfZ96a6pH/auFYXZQjFil9uxOL6Rv4k2RqRomrKhOm
	 NbRIsbga4zt8TqM3i3MVnbgsmXfVH7GVYdzLSPzfURao5TlAMSbTPvI7hhDrVACvLW
	 qqYmpCtgBBENWEa24YDDO5SmnADcEOt6kARVULU3sGFg/jRP2s8Unw+U+iJMOKU+lK
	 qppd2lIX0veVFbh34BMVnc1+M5u39+TCLeVcowI+qnXD9bof8dpIMBQjg61j7qCt9P
	 bcblPRRgYu44g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u8eeF-0092VH-Up;
	Sat, 26 Apr 2025 13:28:48 +0100
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
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v3 00/42] KVM: arm64: Revamp Fine Grained Trap handling
Date: Sat, 26 Apr 2025 13:27:54 +0100
Message-Id: <20250426122836.3341523-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_052852_724410_66CFF335 
X-CRM114-Status: GOOD (  13.06  )
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

* From v2:

  - Added comprehensive support for FEAT_FGT2, as the host kernel is
    now making use of these registers, without any form of context
    switch in KVM. What could possibly go wrong?

  - Reworked some of the FGT description and handling primitives,
    reducing the boilerplate code and tables that get added over time.

  - Rebased on 6.15-rc3.

[1]: https://lore.kernel.org/r/20250310122505.2857610-1-maz@kernel.org

Marc Zyngier (41):
  arm64: sysreg: Add ID_AA64ISAR1_EL1.LS64 encoding for FEAT_LS64WB
  arm64: sysreg: Update ID_AA64MMFR4_EL1 description
  arm64: sysreg: Add layout for HCR_EL2
  arm64: sysreg: Replace HGFxTR_EL2 with HFG{R,W}TR_EL2
  arm64: sysreg: Update ID_AA64PFR0_EL1 description
  arm64: sysreg: Update PMSIDR_EL1 description
  arm64: sysreg: Update TRBIDR_EL1 description
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
  KVM: arm64: Restrict ACCDATA_EL1 undef to FEAT_ST64_ACCDATA being
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
 arch/arm64/kvm/emulate-nested.c         |  580 ++++++++----
 arch/arm64/kvm/handle_exit.c            |   77 ++
 arch/arm64/kvm/hyp/include/hyp/switch.h |  158 ++--
 arch/arm64/kvm/hyp/nvhe/switch.c        |   12 +
 arch/arm64/kvm/hyp/vgic-v3-sr.c         |    8 +-
 arch/arm64/kvm/nested.c                 |  223 +----
 arch/arm64/kvm/sys_regs.c               |   68 +-
 arch/arm64/tools/cpucaps                |    1 +
 arch/arm64/tools/sysreg                 | 1002 ++++++++++++++++++++-
 tools/arch/arm64/include/asm/sysreg.h   |   65 +-
 20 files changed, 2888 insertions(+), 710 deletions(-)
 create mode 100644 arch/arm64/kvm/config.c

-- 
2.39.2


