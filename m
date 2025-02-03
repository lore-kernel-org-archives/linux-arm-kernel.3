Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF18C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 18:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lr+rZhocEfUS/HlkswYK6NQV1238xdUU8Vazl6Hbx30=; b=dzciSXVbLFY6yG1yIwDqIziZGp
	qC45vUla7lTJlkly+iB+Gkaa3bL9L9hgHVVdFBZExuI7XrjRsKDviHoAU8l49fuRheeWx5dLYDitv
	XvgYFLhYFCDvfKytBQxNrZmEv1+3cqjzDc/QLiT+NSc1jdMDhIc6qKR71y4251cwnokDygnM2VpYY
	WeCMaoOxhFn45nRRArjdg9nasO08cHHcOet0gG2n+g6bj9epbOlArv8QdYm3pBOLUs7YPKZJIO5lU
	ShBOTCFQnJdxxBvyPpSObsF9MJdtXA7pE9SozQhRyFsk4MwMf2M50D/PsgG3vlaO/7NZs4jVJPe3X
	aZgGUCzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1Jf-0000000GHvM-1AN4;
	Mon, 03 Feb 2025 18:37:03 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1EM-0000000GGhw-1xGA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 18:31:36 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738607485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Lr+rZhocEfUS/HlkswYK6NQV1238xdUU8Vazl6Hbx30=;
	b=cpiXL2f4KtwMVnA7stRER6DK6i3BBVQAyKwD1vt5GTdAE5/900luZqfrht1i0+ullMnY28
	VsENVFpmpbnqfNIN3fWbQlJ0zi3eoWC+8CNDF0H/+K3D5rTUzgjNW8QHqy1qMYLyq4x6b1
	Glr9zwxLZbuko6CCzc1KheZk0Ud/KvU=
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
Subject: [PATCH v2 00/14] KVM: arm64: Support FEAT_PMUv3 on Apple hardware
Date: Mon,  3 Feb 2025 10:30:57 -0800
Message-Id: <20250203183111.191519-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_103134_852828_E7C0CCFF 
X-CRM114-Status: GOOD (  10.04  )
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

This series adds support for PMUv3 emulation on Apple hardware. See the
v1 cover letter for a more detailed explanation.

Tested on an M2 Pro Mac Mini w/ Debian + Windows guests. Also tested
using kvm-unit-tests, with a small test fix [*].

[*]: https://lore.kernel.org/kvmarm/20250203181026.159721-1-oliver.upton@linux.dev/

v1: https://lore.kernel.org/kvmarm/20241217212048.3709204-1-oliver.upton@linux.dev/

v1 -> v2:
 - Rebase to 6.14-rc1
 - Fix CONFIG_GUEST_PERF_EVENTS=n compilation error
 - Enroll M1 parts for PMUv3 emulation (Janne)
 - Collect Janne's Tested-by

Oliver Upton (14):
  drivers/perf: apple_m1: Refactor event select/filter configuration
  drivers/perf: apple_m1: Support host/guest event filtering
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
  KVM: arm64: Provide 1 event counter on IMPDEF hardware
  arm64: Enable IMP DEF PMUv3 traps on Apple M*

 arch/arm64/include/asm/apple_m1_pmu.h   |   1 +
 arch/arm64/include/asm/cpufeature.h     |  28 +-----
 arch/arm64/kernel/cpu_errata.c          |  44 ++++++++
 arch/arm64/kernel/cpufeature.c          |  19 ++++
 arch/arm64/kernel/image-vars.h          |   5 -
 arch/arm64/kvm/arm.c                    |   4 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h |   4 +-
 arch/arm64/kvm/hyp/vhe/switch.c         |  22 ++++
 arch/arm64/kvm/pmu-emul.c               | 127 +++++++++++++++++-------
 arch/arm64/kvm/pmu.c                    |  10 +-
 arch/arm64/tools/cpucaps                |   2 +
 drivers/perf/apple_m1_cpu_pmu.c         | 101 +++++++++++++++----
 include/kvm/arm_pmu.h                   |  12 +--
 include/linux/perf/arm_pmu.h            |   1 +
 14 files changed, 276 insertions(+), 104 deletions(-)


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.39.5


