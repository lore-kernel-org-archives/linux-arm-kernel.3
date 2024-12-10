Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCB0E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 05:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tCOJ/8xhV3e+xYst5S6qZs4636s7qBHzlBEA/Fw/i5M=; b=GGTev26Ma/dPw5/2DMZGorZE5H
	6Jq/mR9oVSpJLTtt++4w0EkVf0tCWRScuVELgmmdwTuxZOZ/yMJVGk7lLskYmI37U9np1/4NlLAPx
	+1I/2nKh5k3MXvQLMZ0bRnf8SBapQQmtdhUgyDp+4wP3oge91zfOAthERWVCDwKhX8ibVPA4yvlKb
	fqrwH8oJMTxU++/PiRHyRez9QzOZvlg0Ba/Sa5/aP3YtlRR6gO7xQJxdVtz1G9+DM3HvsK7x1Y3zp
	+vDhAjYSMGu6qnkzQk4WS98Vcj+bGs11DxwAmfVvfTw9gKRl/qUpAxqqhbmyLxLY9z68hR3COiaMT
	WbZAZW6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKtCZ-0000000AJwx-1jvh;
	Tue, 10 Dec 2024 05:54:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKtBU-0000000AJgG-3kei
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 05:53:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81478113E;
	Mon,  9 Dec 2024 21:53:51 -0800 (PST)
Received: from a077893.arm.com (unknown [10.163.48.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E512B3F58B;
	Mon,  9 Dec 2024 21:53:18 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	maz@kernel.org
Cc: ryan.roberts@arm.com,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH V2 00/46] KVM: arm64: Enable FGU (Fine Grained Undefined) for FEAT_FGT2 registers
Date: Tue, 10 Dec 2024 11:22:25 +0530
Message-Id: <20241210055311.780688-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_215325_021324_5777A39D 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
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

This series enables fine grained undefined for FEAT_FGT2 managed registers
via adding their respective FGT and CGT trap configuration. But first this
adds many system register definitions in tools/sysreg, which are required
there after.

patches 1-43: define system registers in tools/sysreg format
patch     44: enables FEAT_FGT2 registers access from virtual EL2
patch     45: enables FGT for FEAT_FGT2
patch     46: enables CGT for FEAT_FGT2

Some notes:

As kvm_has_feat() does not support non-ID registers following replacements
have been made for validating presence of correspnding features

- ID_AA64DFR0_EL1.ExtTrcBuff is tested for HDFGRTR2_EL2.nPMSDSFR_EL1
- ID_AA64DFR0_EL1.PMSVer is tested for HDFGRTR2_EL2.nPMSDSFR_EL1

Following FGT enabled registers don't have corresponding CGT requirements

- TRCITECR_EL1
- PMSSCR_EL1
- PMCCNTSVR_EL1
- PMICNTSVR_EL1
- RCWSMASK_EL1
- ERXGSR_EL1
- PFAR_EL1

This series applies on v6.13-rc1

Changes in V2:

- Dropped patches for ID_AA64DFR0_EL1 and ID_AA64DFR2_EL1 (changes merged mainline)
- Added patch for ID_AA64MMFR4_EL1
- Updated all tools sysreg definitions as per DDI0601 2024-09
- Added HFGITR2_EL2 register based fields in encoding_to_fgt[]
- Updated HFGITR2_EL2_[nDCCIVAPS|TSBCSYNC] in kvm_init_nv_sysregs()
- Updated HFGITR2_EL2_[nDCCIVAPS|TSBCSYNC] in kvm_calculate_traps()
- Dropped check_cntr_accessible_N and CGT_CNTR_ACCESSIBLE_N constructs
- SYS_PMEVCNTSVR_EL1(N) access traps have been forwarded to CGT_MDCR_HPMN
- Updated check_mdcr_hpmn() to handle SYS_PMEVCNTSVR_EL1(N) registers
- Changed behaviour as BEHAVE_FORWARD_RW for CGT_MDCR_EnSPM

Changes in V1:

https://lore.kernel.org/all/20241001024356.1096072-1-anshuman.khandual@arm.com/

- Added all system register definitions required for FEAT_FGT2 traps
- Added all system register access traps managed with new FEAT_FGT2
  i.e HDFGRTR2_EL2, HDFGWTR2_EL2, HFGRTR2_GROUP, HFGWTR2_GROUP and
  HFGITR2_GROUP for their VNCR access, FGT and CGT
- Added all FGT for all register accesses managed with FEAT_FGT2
- Added all CGT for all register accesses managed with FEAT_FGT2

Changes in RFC V1:

https://lore.kernel.org/linux-arm-kernel/20240620065807.151540-1-anshuman.khandual@arm.com/

Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: James Morse <james.morse@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: kvmarm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org

Anshuman Khandual (46):
  arm64/sysreg: Update register fields for ID_AA64MMFR0_EL1
  arm64/sysreg: Update register fields for ID_AA64MMFR4_EL1
  arm64/sysreg: Update register fields for ID_AA64PFR0_EL1
  arm64/sysreg: Update register fields for TRBIDR_EL1
  arm64/sysreg: Add register fields for HDFGRTR2_EL2
  arm64/sysreg: Add register fields for HDFGWTR2_EL2
  arm64/sysreg: Add register fields for HFGITR2_EL2
  arm64/sysreg: Add register fields for HFGRTR2_EL2
  arm64/sysreg: Add register fields for HFGWTR2_EL2
  arm64/sysreg: Add register fields for MDSELR_EL1
  arm64/sysreg: Add register fields for PMSIDR_EL1
  arm64/sysreg: Add register fields for TRBMPAM_EL1
  arm64/sysreg: Add register fields for PMSDSFR_EL1
  arm64/sysreg: Add register fields for SPMDEVAFF_EL1
  arm64/sysreg: Add register fields for PFAR_EL1
  arm64/sysreg: Add register fields for PMIAR_EL1
  arm64/sysreg: Add register fields for PMECR_EL1
  arm64/sysreg: Add register fields for PMUACR_EL1
  arm64/sysreg: Add register fields for PMCCNTSVR_EL1
  arm64/sysreg: Add register fields for SPMSCR_EL1
  arm64/sysreg: Add register fields for SPMACCESSR_EL1
  arm64/sysreg: Add register fields for PMICNTR_EL0
  arm64/sysreg: Add register fields for PMICFILTR_EL0
  arm64/sysreg: Add register fields for SPMCR_EL0
  arm64/sysreg: Add register fields for SPMOVSCLR_EL0
  arm64/sysreg: Add register fields for SPMOVSSET_EL0
  arm64/sysreg: Add register fields for SPMINTENCLR_EL1
  arm64/sysreg: Add register fields for SPMINTENSET_EL1
  arm64/sysreg: Add register fields for SPMCNTENCLR_EL0
  arm64/sysreg: Add register fields for SPMCNTENSET_EL0
  arm64/sysreg: Add register fields for SPMSELR_EL0
  arm64/sysreg: Add register fields for PMICNTSVR_EL1
  arm64/sysreg: Add register fields for SPMIIDR_EL1
  arm64/sysreg: Add register fields for SPMDEVARCH_EL1
  arm64/sysreg: Add register fields for SPMCFGR_EL1
  arm64/sysreg: Add register fields for PMSSCR_EL1
  arm64/sysreg: Add register fields for PMZR_EL0
  arm64/sysreg: Add register fields for SPMCGCR0_EL1
  arm64/sysreg: Add register fields for SPMCGCR1_EL1
  arm64/sysreg: Add register fields for MDSTEPOP_EL1
  arm64/sysreg: Add register fields for ERXGSR_EL1
  arm64/sysreg: Add register fields for SPMACCESSR_EL2
  arm64/sysreg: Add remaining debug registers affected by HDFGxTR2_EL2
  KVM: arm64: nv: Add FEAT_FGT2 registers access from virtual EL2
  KVM: arm64: nv: Add FEAT_FGT2 registers based FGU handling
  KVM: arm64: nv: Add trap forwarding for FEAT_FGT2 described registers

 arch/arm64/include/asm/kvm_arm.h        |   20 +
 arch/arm64/include/asm/kvm_host.h       |   12 +
 arch/arm64/include/asm/sysreg.h         |   10 +
 arch/arm64/include/asm/vncr_mapping.h   |    5 +
 arch/arm64/kvm/emulate-nested.c         |  345 ++++++++
 arch/arm64/kvm/hyp/include/hyp/switch.h |   26 +
 arch/arm64/kvm/nested.c                 |   58 ++
 arch/arm64/kvm/sys_regs.c               |   70 ++
 arch/arm64/tools/sysreg                 | 1031 ++++++++++++++++++++++-
 9 files changed, 1570 insertions(+), 7 deletions(-)

-- 
2.25.1


