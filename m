Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7165CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 21:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V7VePf0YbJoItYMxVl7REHFnpHp2lyNorsluFMzYnjk=; b=yZJC1xxmZ8I9Owd9LHOPiuCrvj
	HfL/aGFAJIyt//jyEwRoF02toakgNlBesI0okCEHE1HL5k0xz2FYr/kJ70XGqlu+1DtpyvVnFGxXD
	cy8w0i1ftlYj44tRrUB5xS9mirTiNbzqTDdPSUhmVllGSa8lomKuNKtr/Ov/acnH2ofrW0CTP1oSB
	NMdsI+NTRzmu95sKrNvNo3ypbuNetxFmbOAEr08c/ZUcOCVzv11izGJiirWrrdl6RBjUeKIIGPZZi
	8lGxMTbtldITM/TaEOzhGmN5kbqqKMF97/vr94jnoBWUXa3yaUentO63Iwc1laPwbbg9pFxnrql4U
	doNJdEuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNf1E-0000000EqcF-11ag;
	Tue, 17 Dec 2024 21:22:16 +0000
Received: from out-175.mta1.migadu.com ([95.215.58.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNf03-0000000EqRg-1RQ6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 21:21:10 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734470459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=V7VePf0YbJoItYMxVl7REHFnpHp2lyNorsluFMzYnjk=;
	b=DwHjNqs9ZJEVa2BRt7tkMQTKkExlrU1VLlZ3bEESNQVRPZAB0l2+tlmIaui/FGWl1yIleC
	pqvYKBTuMkWQWjEiZmlaMKAPd3lexI7Igp7lmOorTb7zvD7BKQQQt2bCMUnqHT+jbIkino
	gNU9YOi2BbTJIqqlGbNPXBDWUibgE60=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mingwei Zhang <mizhang@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [PATCH 00/18] KVM: arm64: Support FEAT_PMUv3 on Apple hardware
Date: Tue, 17 Dec 2024 13:20:30 -0800
Message-Id: <20241217212048.3709204-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_132105_440123_047E3E90 
X-CRM114-Status: GOOD (  13.53  )
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

One of the interesting features of some Apple M* parts is an IMPDEF trap
that routes EL1/EL0 accesses of the PMUv3 registers to EL2. This allows
a hypervisor to emulate an architectural PMUv3 on top of the IMPDEF PMU
hardware present in the CPU.

And if you squint, this _might_ look like a CPU erratum :-)

This series takes advantage of these IMPDEF traps to provide PMUv3 to
KVM guests. As a starting point, only expose the fixed CPU cycle counter
and no event counters. Conveniently, this is enough to get Windows
running as a KVM guest on Apple hardware.

I've tried to keep the deviation to a minimum by refactoring some of the
flows used for PMUv3, e.g. computing PMCEID from the arm_pmu bitmap
instead of reading hardware directly.

RFC -> v1:
 - Rebase to 6.13-rc3
 - Add support for 1 event counter in addition to CPU cycle counter
 - Don't sneak past the PMU event filter (Marc)
 - Have the PMU driver provide a PMUv3 -> HW event ID mapping (Marc)

Tested on my M2 with Linux and Windows guests. If possible, I'd
appreciate someone testing on an M1 as I haven't added those MIDRs to
the erratum yet.

Oliver Upton (18):
  drivers/perf: apple_m1: Refactor event select/filter configuration
  drivers/perf: apple_m1: Support host/guest event filtering
  drivers/perf: apple_m1: Map generic branch events
  drivers/perf: apple_m1: Provide helper for mapping PMUv3 events
  KVM: arm64: Compute PMCEID from arm_pmu's event bitmaps
  KVM: arm64: Always support SW_INCR PMU event
  KVM: arm64: Remap PMUv3 events onto hardware
  KVM: arm64: Use a cpucap to determine if system supports FEAT_PMUv3
  KVM: arm64: Drop kvm_arm_pmu_available static key
  KVM: arm64: Use guard() to cleanup usage of arm_pmus_lock
  KVM: arm64: Move PMUVer filtering into KVM code
  KVM: arm64: Compute synthetic sysreg ESR for Apple PMUv3 traps
  KVM: arm64: Advertise PMUv3 if IMPDEF traps are present
  KVM: arm64: Advertise 0 event counters for IMPDEF PMU
  arm64: Enable IMP DEF PMUv3 traps on Apple M2
  drivers/perf: apple_m1: Map a few more PMUv3 events
  KVM: arm64: Provide 1 event counter on IMPDEF hardware
  KVM: arm64: selftests: Add test for probing PMUv3 sysregs

 arch/arm64/include/asm/apple_m1_pmu.h         |   1 +
 arch/arm64/include/asm/cpufeature.h           |  28 +---
 arch/arm64/kernel/cpu_errata.c                |  38 +++++
 arch/arm64/kernel/cpufeature.c                |  19 +++
 arch/arm64/kernel/image-vars.h                |   5 -
 arch/arm64/kvm/arm.c                          |   4 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h       |   4 +-
 arch/arm64/kvm/hyp/vhe/switch.c               |  22 +++
 arch/arm64/kvm/pmu-emul.c                     | 127 +++++++++++-----
 arch/arm64/kvm/pmu.c                          |  10 +-
 arch/arm64/tools/cpucaps                      |   2 +
 drivers/perf/apple_m1_cpu_pmu.c               | 103 ++++++++++---
 include/kvm/arm_pmu.h                         |  15 +-
 include/linux/perf/arm_pmu.h                  |   1 +
 tools/testing/selftests/kvm/Makefile          |   1 +
 .../kvm/aarch64/pmuv3_register_probe.c        | 135 ++++++++++++++++++
 16 files changed, 407 insertions(+), 108 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/aarch64/pmuv3_register_probe.c


base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
-- 
2.39.5


