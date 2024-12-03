Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B970BE74AC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 19:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4K5gdULoo9ry6Ok1UhZcZTA9mvSZ4BXZX/0KfA5QqAQ=; b=mkk7B66YxlPoFfxqRL4SHiooJ5
	YaOsgYBHtuboQcDVjB7xG5v8M26wsOc/biApZeXF7F9zsefnGQKMf7DfABOnQbnuCDQTZYDALholG
	CLR1uYyVrw0BCnqgS+wQsL6hQblfcf4BFa8UbGA6WaOhhIT2NzWoV8MT+Q4P9EyoI34DQf2AUMlXe
	oMChh1QNdIcWv/qPyPgmmEA4SOo6JNniyzU8d4cqjGZl3UzUJJJOKEGUdFCESvmHv+POwoJffAP6e
	CbpV4sBdo8YA930ZqHZoLGs9JuzU01fuaYzLo835d0SLf5yIYnX4gINASKLmMLJMDaDMnSBNZFoqV
	tqSZb63w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIYem-0000000AUCu-0fi8;
	Tue, 03 Dec 2024 19:34:00 +0000
Received: from out-188.mta1.migadu.com ([2001:41d0:203:375::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIYdl-0000000ATwV-2Wis
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 19:32:59 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1733254372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4K5gdULoo9ry6Ok1UhZcZTA9mvSZ4BXZX/0KfA5QqAQ=;
	b=AcS7Ml/0RnE/6drySXVVeVl277qknOcX0PZK/xrulnb7s18H8ZNMSBuAEeZWNAcTacrxR+
	k6ixLhmZTWKZVXpS4yq4ykIJ+0whhMeOyTQpc/oDIHCMdNF9kqlPTtY8RhzEeEfeG820w+
	nhtl28wt7FVUS7NcXR3h1uUz3JO+/c4=
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
Subject: [RFC PATCH 00/14] KVM: arm64: Support FEAT_PMUv3 on Apple hardware
Date: Tue,  3 Dec 2024 11:32:06 -0800
Message-Id: <20241203193220.1070811-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_113257_914059_37009F4A 
X-CRM114-Status: GOOD (  16.30  )
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

Sending this as an RFC as there are some obvious open Qs:

 - Does enabling PMUv3 meet the bar for allowing IMPDEF crap to slide
   into KVM?

   I certainly think the answer is 'yes', especially considering this
   enables Windows guests.

 - Do we want to support programmable event counters?

   I'm sitting on some extra patches to do this, which maps a few
   architectural event IDs into the PERF_TYPE_HARDWARE space, allowing
   the perf driver to select the right hardware event ID.

   Deciding on a sensible number of counters in this case is a bit of a
   mess, as the M* PMCs aren't entirely fungible (some events only work
   on specific counters).

Applies to 6.13-rc1. I've only enabled this for M2 as it is the hardware
I have, but it is extremely likely this feature works on other M* parts.

It is also very possible I've broken something for true PMUv3 hardware,
as I've only tested on the M2.

Oliver Upton (14):
  drivers/perf: apple_m1: Refactor event select/filter configuration
  drivers/perf: apple_m1: Support host/guest event filtering
  drivers/perf: apple_m1: Map generic branch events
  KVM: arm64: Compute PMCEID from arm_pmu's event bitmaps
  KVM: arm64: Always allow fixed cycle counter
  KVM: arm64: Use PERF_COUNT_HW_CPU_CYCLES for fixed cycle counter
  KVM: arm64: Use a cpucap to determine if system supports FEAT_PMUv3
  KVM: arm64: Drop kvm_arm_pmu_available static key
  KVM: arm64: Use guard() to cleanup usage of arm_pmus_lock
  KVM: arm64: Move PMUVer filtering into KVM code
  KVM: arm64: Compute synthetic sysreg ESR for Apple PMUv3 traps
  KVM: arm64: Advertise PMUv3 if IMPDEF traps are present
  KVM: arm64: Advertise 0 event counters for IMPDEF PMU
  arm64: Enable IMP DEF PMUv3 traps on Apple M2

 arch/arm64/include/asm/apple_m1_pmu.h   |   1 +
 arch/arm64/include/asm/cpufeature.h     |  28 +----
 arch/arm64/kernel/cpu_errata.c          |  38 ++++++
 arch/arm64/kernel/cpufeature.c          |  19 +++
 arch/arm64/kernel/image-vars.h          |   5 -
 arch/arm64/kvm/arm.c                    |   4 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h |   4 +-
 arch/arm64/kvm/hyp/vhe/switch.c         |  22 ++++
 arch/arm64/kvm/pmu-emul.c               | 159 +++++++++++++++---------
 arch/arm64/kvm/pmu.c                    |  10 +-
 arch/arm64/tools/cpucaps                |   2 +
 drivers/perf/apple_m1_cpu_pmu.c         |  68 ++++++----
 include/kvm/arm_pmu.h                   |  15 +--
 13 files changed, 248 insertions(+), 127 deletions(-)


base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
-- 
2.39.5

