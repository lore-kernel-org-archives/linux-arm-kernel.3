Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DC1FEEF50
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 14:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z43l7BhW3QdUCmXnzvfMmASnQfDQPfWVxC4j+LeyIfI=; b=M1RmqhmiDr9+qa
	m3WyV+eyaGjWOmBt5XdhSQOGgy/HqfL8Loi6hTk6kpEQctU14YUVYnW/56j3j42zZdcSguz3VvVQ0
	YGbaIUNfo27O0Ck6kD+ZB8jMLkjhmeiua98cF7Xk59r0175+CFg1eNMOtGMmx2zJqdJiAC8/unSWn
	UqKMAvUQZ81OheOiB4ctZwieRIkDlhyFqeT5/wLF1rL9c2QiUo8oalpgWJwMIVrDjXutUogFWefAI
	r7kssshMotGG7qQso6/9W7qyMn01WdluXXGu6/NDYB+79+bfDyLuLkZWX6z5sdLEqM98HB3U6j8fR
	7HSJrlLP/qs457+Dd8Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7RU-00000006bg7-2lQs;
	Tue, 07 Apr 2026 14:30:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7RS-00000006bfS-2hp7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 14:30:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A02064065F;
	Tue,  7 Apr 2026 14:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B4AFC116C6;
	Tue,  7 Apr 2026 14:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775572209;
	bh=F6zPippwXT9NoAaPuBCmjQXM7i5cwJ55Lk+dK97iVfo=;
	h=From:Subject:Date:To:Cc:From;
	b=SGGpCiloA16YGCNOBtnjqATKduo9VqxPftvhFTU4wQ99oD6xhZII3QIIPuZ2BteZi
	 It4oNSzT+9TV6imSaukmNALxBbaSIH04pnHw+M6T4s3hbGTZk66/6p4/JDiCZ1VdLA
	 sAQn37Sb6xna/XRQ3bokAGI4LKLj7xAfa4HSGVbr+crUhyoVjTFNNgF0zVgexUITaG
	 3oO0IctM29eF06Ko+4LKEtWm/Y5wll033MXeJp4amWrRhRc8aRdB9Fsi2Ax/RP3KVY
	 Y8DZqVWkFinHJV507eYo9FG4A3vIba8mdeHmRheb1U4J/C6vnYUKpC5VRqfkbkMLh6
	 sCi7TVjgfAdYQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v4 0/6] arm64: Add support for FEAT_Debugv8p9
Date: Tue, 07 Apr 2026 09:29:42 -0500
Message-Id: <20260407-arm-debug-8-9-v4-0-a4864e69b0ea@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANYU1WkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDIzMDEwMz3cSiXN2U1KTSdF0LXUtdE8M0szSDVHNjyyRTJaCegqLUtMwKsHn
 RsbW1ABe/erJfAAAA
X-Change-ID: 20260406-arm-debug-8-9-41f6f0e739b5
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
 Oliver Upton <oupton@kernel.org>
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_073010_737653_32B53041 
X-CRM114-Status: GOOD (  10.66  )
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

This series enables FEAT_Debugv8p9 which extends the breakpoint and 
watchpoint support from 16 up to 64. I've picked up this series from 
Anshuman.

Changes in V4:

- Limit enabling of FEAT_Debugv8p9 to only when more than 16 breakpoints 
  or watchpoints are present.
- Add lockdep_assert_irqs_disabled() to document the constraints. Drop 
  unnecessary IRQ disabling.
- Add more kprobe blacklist annotations and disallow breakpoints in the 
  nokprobe code.
- Drop previously applied sysreg patches.

Prior versions from Anshuman:

Changes in V3:

https://lore.kernel.org/all/20241216040831.2448257-1-anshuman.khandual@arm.com/

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

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Anshuman Khandual (3):
      arm64/cpufeature: Add field details for ID_AA64DFR1_EL1 register
      arm64/boot: Enable EL2 requirements for FEAT_Debugv8p9
      arm64: hw_breakpoint: Enable FEAT_Debugv8p9

Rob Herring (Arm) (3):
      arm64: hw_breakpoint: Disallow breakpoints in no kprobe code
      arm64: hw_breakpoint: Add additional kprobe excluded functions
      arm64: hw_breakpoint: Add lockdep_assert_irqs_disabled() on install/uninstall

 Documentation/arch/arm64/booting.rst   | 13 +++++++
 arch/arm64/include/asm/el2_setup.h     | 14 +++++++
 arch/arm64/include/asm/hw_breakpoint.h | 47 ++++++++++++++++++-----
 arch/arm64/kernel/cpufeature.c         | 21 ++++++++---
 arch/arm64/kernel/debug-monitors.c     | 16 +++++---
 arch/arm64/kernel/hw_breakpoint.c      | 68 +++++++++++++++++++++++++++++-----
 6 files changed, 150 insertions(+), 29 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260406-arm-debug-8-9-41f6f0e739b5

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>


