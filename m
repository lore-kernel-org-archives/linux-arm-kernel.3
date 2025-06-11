Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F3BC7113E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 20:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WFFvtVI1yH92oJoeVKVTz/W9dqwjbAG61li77P5YC5I=; b=ZWYa/Vesvzn7oJ
	DgQ2q9TCMOPpSKqmjdLoGdbeUv6VNRLZFhpbC45k5GjNhdRT4brifrPk24TUXLCEEHw0LZ2hzWseo
	KWu4Elu5QMOBC285Whecav4qNKkkGuQNzcyHEIQIUqPYRCMXDRdqtMCohtaOQIpLcPhOey+Zb2aFf
	+Rs3kNKrSIrWydx3BEZPO5IisikOwha+sVbSGLcRe9rbG+BMUx7i6HpqRXdaydlK8e5Huu/A4aL+a
	cwfOzLI7n3Nopb7jGgHOAQcu8KbYQLZnv+40KT3f6PeW79eJL+ASp51QcRT66fhZkr/rbPQew/HY8
	uv37EuadZ/oo0kjsIMdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSMt-0000000BCtk-2Uay;
	Wed, 11 Jun 2025 20:48:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPlU-0000000AorZ-0ifJ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 18:01:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=WFFvtVI1yH92oJoeVKVTz/W9dqwjbAG61li77P5YC5I=; b=jPPVuyqIO1BLZw9AMQfLOcx/Od
	eaTi+ktDYKaHeTS4yPyX/weEE947rHIupTltEYJxL95pQLhuZUhLX8o5IvP0qR8Q0YXkZO3807Bh3
	lL1jGhoZgY4YOoF5UO2XIEmPFfKcam9cZjdnpHN9Uh13ONgQsKAaiMiI0rcE86VmZ1eLOaVKe4SEp
	xvDscqnnmJW+hLBStIlUJ7+p4009R2hlbtr+p3RD4CL2xmHoaiWo+ddRDqQIOy+Y/Ck7qZ3VuBnUw
	67eleHcGHcbVrPfaQF1VNFg1yQaJtCoGrt6kGDQ7pgkvv0c03tvtirjLV57wriK0Zpv1nZ6lCIlfv
	mjaB3etQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPlR-00000002T4r-2wt8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 18:01:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 83E814A982;
	Wed, 11 Jun 2025 18:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D83BC4CEEA;
	Wed, 11 Jun 2025 18:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749664886;
	bh=1ueyvC8/mCJFw9JuGdrNLssNoMYyC/92vpBFO+JeLC0=;
	h=From:Subject:Date:To:Cc:From;
	b=BPFcmaGFRTtopyRxTH7ClVtgpG9UO5hMbqtKHdZ43Lkqf49KdenbiYvigOSdVKxfk
	 gsxkF5MaZ1in1Jbgk7SxoCK+3k460w/bZe4qKU0jQ5Md8QEjBnnS6HZXwsW/9fYTl5
	 NFXpIHyEAssjZT48SJ0XTyfgSbxY1Hj1S44F0h5BPYd19fzI9XCJ2Ymw2BK+yo+O9S
	 cKOawkuPvA5O5K3OhP19AWXYHzr+wawzwvoCS/0u6Dp/F2Jp5U2Bx7y8FhmV2rPGnS
	 Jm3HyDZHC/hjjchmnTDHiWLXln8rGFuQXuHYI+CCd6Oo+bsBXcCpuMO2rhjFcHGWeH
	 85FmMBTLzP+Qg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v23 0/4] arm64/perf: Enable branch stack sampling
Date: Wed, 11 Jun 2025 13:01:10 -0500
Message-Id: <20250611-arm-brbe-v19-v23-0-e7775563036e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGbESWgC/2XNwW7CMAyA4VdBOS/Idpo24cR7oB0gcSDa1qIUV
 Uyo7z6XHUrLIZFs5fvzUD2XzL3abR6q8JD73LUykPnYqHA5tmfWOcpCEZAFJK+P5Uefyon1gF5
 TFW30bLkmo4RcC6d8f/YOnzJfcn/ryu8zL++n9X9JrmVpOqAxoAFwQMbZ/ReXlr+3XTmrqTUQv
 Hh0K08gvmLviVIgdvzucfYVNGuP4lNC16RUB0/u3dPsrXy38iQ+YIyRjeMmLf04jn/gFR5/bAE
 AAA==
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
X-CRM114-CacheID: sfid-20250611_190130_087291_830FA068 
X-CRM114-Status: GOOD (  16.62  )
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

I've picked up this series from Anshuman. v19 and later versions have 
been reworked quite a bit by Mark and myself. The bulk of those changes 
are in patch 5.

A git branch is here[2].

[1] https://developer.arm.com/documentation/ddi0487/latest/
[2] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git arm/brbe-v23

v23:
 - Rebase on v6.16-rc1 dropping already applied el2_setup.h clean-ups
 - Drop the SYSCALL fixup and convert all BRBE CALL events to SYSCALL

v22:
 - https://lore.kernel.org/all/20250520-arm-brbe-v19-v22-0-c1ddde38e7f8@kernel.org/
 - New patch reworking the labels in el2_setup.h
 - Move branch stack disabling after armpmu_stop() in armpmu_del()
 - Fix branch_records_alloc() to work on heterogeneous systems
 - Make setting .sched_task function ptr conditional on BRBE support
 - Reword booting.rst section name (s/feature/the/) and move next to
   other PMU related features instead of in the middle of SME features.
 - Drop setting SYS_BRBCR_EL1
 - Drop CONFIG_ARM64_BRBE ifdef
 - Rework initialization of HFGITR_EL2

v21:
 - https://lore.kernel.org/r/20250407-arm-brbe-v19-v21-0-ff187ff6c928@kernel.org
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
---
Anshuman Khandual (3):
      arm64/sysreg: Add BRBE registers and fields
      arm64: Handle BRBE booting requirements
      KVM: arm64: nvhe: Disable branch generation in nVHE guests

Rob Herring (Arm) (1):
      perf: arm_pmuv3: Add support for the Branch Record Buffer Extension (BRBE)

 Documentation/arch/arm64/booting.rst |  21 +
 arch/arm64/include/asm/el2_setup.h   |  71 +++-
 arch/arm64/include/asm/kvm_host.h    |   2 +
 arch/arm64/include/asm/sysreg.h      |  16 +-
 arch/arm64/kvm/debug.c               |   4 +
 arch/arm64/kvm/hyp/nvhe/debug-sr.c   |  32 ++
 arch/arm64/kvm/hyp/nvhe/switch.c     |   2 +-
 arch/arm64/tools/sysreg              | 132 ++++++
 drivers/perf/Kconfig                 |  11 +
 drivers/perf/Makefile                |   1 +
 drivers/perf/arm_brbe.c              | 798 +++++++++++++++++++++++++++++++++++
 drivers/perf/arm_brbe.h              |  47 +++
 drivers/perf/arm_pmu.c               |  16 +-
 drivers/perf/arm_pmuv3.c             | 125 +++++-
 include/linux/perf/arm_pmu.h         |   8 +
 15 files changed, 1265 insertions(+), 21 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250129-arm-brbe-v19-24d5d9e5e623

Best regards,
-- 
Rob Herring (Arm) <robh@kernel.org>


