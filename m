Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C068C36018
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kxfSzp3DKh54ZFCBkXu5J10ZwW55T0b1WxTJbqpXzLQ=; b=HOuV9X8Ot8u8hu
	1TcKBdwungbBJOsSaa+3hjzYNZg0b1vDf6zCV7+U/rQjIeJCmP9hIVPqrVTJj1F47KC3glaDscWLh
	Q5kFVV4s09z+ALGccFVECJLgsyPdIfp4jX1k28XsYU/QcS8HceAKb3SB+QXz0YGS2a1+/vuoEKSZi
	/eEH/tYPMjtPkR95BxuybsoZkkPhb33k2zlmjDChzHtT3lMDAfXOilQiP8YRlafNDWJsxhEiEBh1L
	aCVYlvzfA3V8lJayQOrM5++5t43MS8h3zRNjgjY5Uzrp7u34v/T3MasDPCjtikn/6Z5jZ7Kwd+AQz
	XubJjhjR9n7NjW9cRi1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rZf-00000001fHP-1Ixa;
	Mon, 07 Apr 2025 18:51:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1qUO-00000001P8A-3qUS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 17:42:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4CB45A481F8;
	Mon,  7 Apr 2025 17:36:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74AA8C4CEDD;
	Mon,  7 Apr 2025 17:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744047747;
	bh=mfrACnEJ4AJuVAi0UxiF43bxtbWvmtrWPliXcYJUjiE=;
	h=From:Subject:Date:To:Cc:From;
	b=lVO5FcpsRn35NINHwzli3PZVpUSklKuio+ezf/gFz8PSy7IaMeouVtzXM04h8JxUL
	 8NOk9dylKjRxfSSw+PmvT3AyhxGAPuftWkArFPLSPdxQyRRUDD4MnhgG48EIKCdVYl
	 gKDlJYgn9RUwB9XqGlU/khskJQW5010jsYRDkEsjfNqJxNIw68EMqyLiwIf/m31v57
	 i3b+bTjGWBJf3eFeyQtLWf988hZi0+hSuSF72ZCq2zJtLYaotpI0JvoZ20WgND58QZ
	 Wewdp+/NxKFlzQ60zQObNFI3S38XN2eEeb7HIARba59h7vXDErl6OxjnIWsstLDJb0
	 EAwuafF6REMXg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v21 0/4] arm64/perf: Enable branch stack sampling
Date: Mon, 07 Apr 2025 12:41:29 -0500
Message-Id: <20250407-arm-brbe-v19-v21-0-ff187ff6c928@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEkO9GcC/12Myw6CMBBFf4V0bc10oKZ15X8YFzwGaFRqpoZoC
 P/ugBtxMZPcm3vOpBJxoKSO2aSYxpBCHCSg2WWq7suhIx0aKRQCWjDodcl3XXFFejReY9HYxpO
 lA+ZKkAdTG16r73yR3If0jPxe9bJf6q9J3ta0HGhTmxzAAebOnq7EA932kTu1uEaEH964Px5B+
 IK8R2xrJEcbfp7nD0fnMO3sAAAA
X-Change-ID: 20250129-arm-brbe-v19-24d5d9e5e623
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_104229_085384_CE490166 
X-CRM114-Status: GOOD (  14.81  )
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

This series enables perf branch stack sampling support on arm64 via a 
v9.2 arch feature called Branch Record Buffer Extension (BRBE). Details 
on BRBE can be found in the Arm ARM[1] chapter D18.

I've picked up this series from Anshuman. v19 and v20 versions have been 
reworked quite a bit by Mark and myself. The bulk of those changes are 
in patch 4.

A git branch is here[2].

[1] https://developer.arm.com/documentation/ddi0487/latest/
[2] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git arm/brbe-v21

v21:
- Drop clean-up patches 1-7 already applied
- Rebase on v6.15-rc1

v20:
 - https://lore.kernel.org/r/20250218-arm-brbe-v19-v20-0-4e9922fc2e8e@kernel.org
 - Added back some of the arm64 specific exception types. The x86 IRQ 
   branches also include other exceptions like page faults. On arm64, we 
   can distinguish the exception types, so we do. Also, to better 
   align with x86, we convert 'call' branches which are user to kernel 
   to 'syscall'.
 - Only enable exceptions and exception returns if recording kernel
   branches (matching x86)
 - Drop requiring event and branch privileges to match
 - Add "branches" caps sysfs attribute like x86
 - Reword comment about FZP and MDCR_EL2.HPMN interaction
 - Rework BRBE invalidation to avoid invalidating in interrupt handler
   when no handled events capture the branch stack (i.e. when there are 
   multiple users).
 - Also clear BRBCR_ELx bits in brbe_disable(). This is for KVM nVHE 
   checks if BRBE is enabled.
 - Document that MDCR_EL3.SBRBE can be 0b01 also

v19:
 - https://lore.kernel.org/all/20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org/
 - Drop saving of branch records when task scheduled out (Mark). Make 
   sched_task() callback actually get called. Enabling requires a call 
   to perf_sched_cb_inc(). So the saving of branch records never 
   happened.
 - Got rid of added armpmu ops. All BRBE support is contained within 
   pmuv3 code.
 - Fix freeze on overflow for VHE
 - The cycle counter doesn't freeze BRBE on overflow, so avoid assigning
   it when BRBE is enabled.
 - Drop all the Arm specific exception branches. Not a clear need for
   them.
 - Fix handling of branch 'cycles' reading. CC field is
   mantissa/exponent, not an integer.
 - Rework s/w filtering to better match h/w filtering
 - Reject events with disjoint event filter and branch filter or with 
   exclude_host set
 - Dropped perf test patch which has been applied for 6.14
 - Dropped patch "KVM: arm64: Explicitly handle BRBE traps as UNDEFINED"
   which has been applied for 6.14

v18:
 - https://lore.kernel.org/all/20240613061731.3109448-1-anshuman.khandual@arm.com/

For v1-v17, see the above link. Not going to duplicate it all here...

Signed-off-by: "Rob Herring (Arm)" <robh@kernel.org>
---
Anshuman Khandual (4):
      arm64/sysreg: Add BRBE registers and fields
      arm64: Handle BRBE booting requirements
      KVM: arm64: nvhe: Disable branch generation in nVHE guests
      perf: arm_pmuv3: Add support for the Branch Record Buffer Extension (BRBE)

 Documentation/arch/arm64/booting.rst |  21 +
 arch/arm64/include/asm/el2_setup.h   |  86 +++-
 arch/arm64/include/asm/kvm_host.h    |   2 +
 arch/arm64/include/asm/sysreg.h      |  17 +-
 arch/arm64/kvm/debug.c               |   4 +
 arch/arm64/kvm/hyp/nvhe/debug-sr.c   |  32 ++
 arch/arm64/kvm/hyp/nvhe/switch.c     |   2 +-
 arch/arm64/tools/sysreg              | 132 ++++++
 drivers/perf/Kconfig                 |  11 +
 drivers/perf/Makefile                |   1 +
 drivers/perf/arm_brbe.c              | 802 +++++++++++++++++++++++++++++++++++
 drivers/perf/arm_brbe.h              |  47 ++
 drivers/perf/arm_pmu.c               |  15 +-
 drivers/perf/arm_pmuv3.c             | 129 +++++-
 include/linux/perf/arm_pmu.h         |   8 +
 15 files changed, 1287 insertions(+), 22 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250129-arm-brbe-v19-24d5d9e5e623

Best regards,
-- 
Rob Herring (Arm) <robh@kernel.org>


