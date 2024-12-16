Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9D6E77183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 04:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uNRhfW8bCDaLxpnaI05r7a73acJOI9bDghnbxarMp7A=; b=xuzFqAN6rZT0i/ui9PGMGpzP9A
	dK4YJvsDjAi4++/mIzoUNif7Kb/tN6RicI/q9WuBZwz+adOh4qND3TybHDTE0e+2PSDN4mfYPbf//
	hn3cK/Dc23S1l/72EYwL8U1fhkK+K5zeKSs5aGfoFfARI/Du5JqtB4IU+EW3dYjzAToYUErWgf+gQ
	Ld3kjd5rihr8HdvkW64/KQohCI4wtefS0Qlc4J973cE8y6SmbhChPhzl6o1c2VCUe8iZanD1GX30g
	W9aDnj3uTu9JVd2VJXYCW388lf2VlG5l2hiV4dbPjAsnDGIArf43RVNioCVN1NXjXPkO2x8C2kcOE
	jsAdq5Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN2al-000000090na-1rfb;
	Mon, 16 Dec 2024 04:20:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN2XW-000000090Fq-1r6r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 04:17:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 553B311FB;
	Sun, 15 Dec 2024 20:09:09 -0800 (PST)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.16.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5AE0D3F58B;
	Sun, 15 Dec 2024 20:08:37 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	kvmarm@lists.linux.dev
Subject: [PATCH V3 0/7] arm64/hw_breakpoint: Enable FEAT_Debugv8p9
Date: Mon, 16 Dec 2024 09:38:24 +0530
Message-Id: <20241216040831.2448257-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_201702_837495_DE399921 
X-CRM114-Status: UNSURE (   9.27  )
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

This series enables FEAT_Debugv8p9 thus extending breakpoint and watchpoint
support upto 64. This series is based on v6.13-rc3 although this depends on
FEAT_FGT2 FGU series posted earlier, for MDSELR_EL1 handling in various KVM
guest configurations.

https://lore.kernel.org/all/20241210055311.780688-3-anshuman.khandual@arm.com/

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: James Morse <james.morse@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: kvmarm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org

Changes in V3:

- Marked ID_AA64DFR1_EL1.ABLE as FTR_NONSTRICT in ftr_id_aa64dfr1[]
- Dropped MDCR_EL3.TDA boot requirement from documentation (separate series)
- Dropped MDCR_EL2_EBWE definition as MDCR_EL2 is now defined in tools sysreg
- Used SYS_FIELD_PREP() in read_wb_reg() and write_wb_reg()
- Added MAX_PER_BANK based BUILD_BUG_ON() tests in arch_hw_breakpoint_init()
- Dropped local variables i.e mdsel_bank and index
- Derived bank and index from MAX_PER_BANK as required

Changes in V2:

https://lore.kernel.org/all/20241028053426.2486633-1-anshuman.khandual@arm.com/

Following changes have been made per review comments from Mark Rutland

- Orr MDCR_EL2_EBWE directly without an intermittent register
- Alphabetically order header files in debug-monitors.c
- Dropped embwe_ref_count mechanism
- Dropped preempt_enable() from AARCH64_DBG_READ
- Dropped preempt_disable() from AARCH64_DBG_WRITE
- Dropped set_bank_index()
- Renamed read/write_wb_reg() as __read/__write_wb_reg()
- Modified read/write_wb_reg() to have MDSELR_E1 based banked read/write
- Added required sysreg tools patches from KVM FEAT_FGT2 series for build

Changes in V1:

https://lore.kernel.org/all/20241001043602.1116991-1-anshuman.khandual@arm.com/

- Changed FTR_STRICT to FTR_NONSTRICT for the following ID_AA64DFR1_EL1
  register fields - ABL_CMPs, DPFZS, PMICNTR, CTX_CMPs, WRPs and BRPs

Changes in RFC V2:

https://lore.kernel.org/linux-arm-kernel/20240620092607.267132-1-anshuman.khandual@arm.com/

- This series has been split from RFC V1 dealing only with arm64 breakpoints
- Restored back DBG_MDSCR_MASK definition (unrelated change)
- Added preempt_disable()/enable() blocks between selecting banks and registers

Changes in RFC:

https://lore.kernel.org/all/20240405080008.1225223-1-anshuman.khandual@arm.com/


Anshuman Khandual (7):
  arm64/sysreg: Update register fields for ID_AA64MMFR0_EL1
  arm64/sysreg: Add register fields for MDSELR_EL1
  arm64/sysreg: Add register fields for HDFGRTR2_EL2
  arm64/sysreg: Add register fields for HDFGWTR2_EL2
  arm64/cpufeature: Add field details for ID_AA64DFR1_EL1 register
  arm64/boot: Enable EL2 requirements for FEAT_Debugv8p9
  arm64/hw_breakpoint: Enable FEAT_Debugv8p9

 Documentation/arch/arm64/booting.rst    | 18 +++++++
 arch/arm64/include/asm/debug-monitors.h |  1 +
 arch/arm64/include/asm/el2_setup.h      | 26 +++++++++
 arch/arm64/include/asm/hw_breakpoint.h  | 47 +++++++++++++----
 arch/arm64/kernel/cpufeature.c          | 21 ++++++--
 arch/arm64/kernel/debug-monitors.c      | 15 ++++--
 arch/arm64/kernel/hw_breakpoint.c       | 48 ++++++++++++++++-
 arch/arm64/tools/sysreg                 | 70 +++++++++++++++++++++++++
 8 files changed, 225 insertions(+), 21 deletions(-)

-- 
2.25.1


