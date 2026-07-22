Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFAFC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 20:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wu1rvS/0NtqSzL/yTwSllD7b6h2XEg4CeDcgPIqUCJ8=; b=DUE5tnPi702jBC0R7WfePi3lE3
	MW7nNbzu5z4pzfknn7ipoXqequ/UIR3E4GCjO6YdBzw3h7YnCMuE+MymCAN1FPvAuSFQLJEaNQA8x
	4RT9Q+T6accYdZywl6lCTexPB/DhclCEOsAAkt3QU1q8kNrkljhcKVsnsM6W42QZtH64EYnUjAY/g
	TbGHr8mCHAbZHW2BJ1s13kCK44EWhJHeuuXH9GxtUW4/lCNTKoM723MGBq2kXiJvHbn/Cvctv5ABe
	TxanhpRFH7wVdyvk2smucEIQJCmx7JBFwsLQrPN/VQV/vJoxgiKA1deHCr6hXTDXTRzCKidAUYwme
	OEcNUz/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdXO-0000000CicW-2DQF;
	Wed, 22 Jul 2026 20:27:30 +0000
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.34.181.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdXL-0000000CiaM-2IcL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 20:27:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1784752047; x=1816288047;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wu1rvS/0NtqSzL/yTwSllD7b6h2XEg4CeDcgPIqUCJ8=;
  b=kJa/xjJFN1e2gPzPIe9yHXm14nRVm3b3MCxsKv785s5NjCl/R3TMRV4e
   Q+vowkM+IoPDeMhHiYu26zBu8D5UFr95kqoZWICH3BJDMoJxJ55BqmM5n
   EQXcViGR2zWg8TCBWbSe00CmUvjYFHAlShyv7Y6rwZcTGNJlNwdNK3Rhb
   1k46HTmufGIICERfwlKX0WOgSdauoSJcB6gJ58ZNH8+3efdBbOYlWWfFd
   a3n8SzfYMLIyYg+6IiAX/jBJASngdIavm8kmNn2X+jYOoGrG+6Hm7HhY5
   FJOGHcY+bB649IZ/5O9G5Yz6SRY8dbX2aY6GCZoAgK5MOLd+7iNME2hl1
   Q==;
X-CSE-ConnectionGUID: /9kOpMd8QuKjjawR+ASmog==
X-CSE-MsgGUID: Ix+wXZq9QRmXc4xYsHurFw==
X-IronPort-AV: E=Sophos;i="6.25,179,1779148800"; 
   d="scan'208";a="24168920"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 20:27:23 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:8212]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.25.115:2525] with esmtp (Farcaster)
 id 98f78049-842d-4f6a-b8e7-386b30f86096; Wed, 22 Jul 2026 20:27:22 +0000 (UTC)
X-Farcaster-Flow-ID: 98f78049-842d-4f6a-b8e7-386b30f86096
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Wed, 22 Jul 2026 20:27:22 +0000
Received: from dev-dsk-congkai-2a-df9e8fab.us-west-2.amazon.com
 (172.23.251.204) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43; Wed, 22 Jul 2026
 20:27:22 +0000
From: Congkai Tan <congkai@amazon.com>
To: Oliver Upton <oupton@kernel.org>, <kvmarm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
CC: Congkai Tan <congkai@amazon.com>, Marc Zyngier <maz@kernel.org>, "Joey
 Gouly" <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, "Jonathan
 Corbet" <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, "Haris
 Okanovic" <harisokn@amazon.com>, Geoff Blake <blakgeof@amazon.com>,
	"Stanislav Spassov" <stanspas@amazon.de>, <kvm@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/4] KVM: arm64: Expose PMMIR_EL1.SLOTS to guests
Date: Wed, 22 Jul 2026 20:26:58 +0000
Message-ID: <20260722202702.4165917-1-congkai@amazon.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.23.251.204]
X-ClientProxiedBy: EX19D045UWC001.ant.amazon.com (10.13.139.223) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_132727_633247_007D3E14 
X-CRM114-Status: GOOD (  12.08  )
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

Today when the perf tool runs in a guest on cores with PMUv3p4, it fails
to parse the default metrics with "Failure to read '#slots'", since perf
can only read 0 from sysfs caps/slots, which is backed by PMMIR_EL1.SLOTS
that KVM traps as RAZ/WI.

Taking into account backward compatibility and heterogeneous systems, the
exposure of PMMIR_EL1.SLOTS is gated behind a new vCPU feature flag:

- Patch 1 exposes PMMIR_EL1.SLOTS of the selected PMU under the (as yet
  unsettable) KVM_ARM_VCPU_PMU_V3_STRICT flag, and adds userspace get/set
  for PMMIR_EL1 so that SLOTS can be reset to 0 for backward
  compatibility.
- Patch 2 stops masking STALL_SLOT* in PMCEID1 under the flag.
- Patch 3 makes strict-mode userspace configure the number of event
  counters via the KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS attribute rather
  than PMCR_EL0.N, whose meaning is context-dependent under NV.
- Patch 4 adds the KVM_ARM_VCPU_PMU_V3_STRICT flag itself: when set, KVM
  does not create a default PMU during vCPU init, and the VMM must select
  one explicitly via KVM_ARM_VCPU_PMU_V3_SET_PMU before the first
  KVM_RUN. This flips the gate on and can serve as an umbrella flag for
  future PMUv3 UAPI changes.

When the flag is not set, behaviors are unchanged.

v2: https://lore.kernel.org/r/20260702190421.420992-1-congkai@amazon.com
v1: https://lore.kernel.org/r/20260601193954.2103455-1-congkai@amazon.com

v2 -> v3 changes:
 - Reordered so the KVM_ARM_VCPU_PMU_V3_STRICT flag / KVM_CAP exposure
   comes last (now patch 4), after the flag-guarded behavior patches.
 - Reworked on top of Oliver Upton's refinements (thanks!):
   * Move the NULL-arm_pmu check into kvm_arm_pmu_v3_init() (returns
     -ENXIO) instead of failing at the first KVM_RUN, and report zero
     counters from kvm_arm_pmu_get_max_counters() before a PMU is set.
   * Documentation and -ENXIO ordering notes for the PMU device
     attributes (SET_PMU must precede INIT/FILTER).
 - New patch (Oliver): ignore userspace writes to PMCR_EL0.N under the
   strict flag and require the KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS
   attribute, since PMCR_EL0.N is context-dependent under NV.
 - Advertise the KVM_CAP_ARM_PMU_V3_STRICT capability.
 - Documentation fixes in api.rst (the flag Requires KVM_ARM_VCPU_PMU_V3).

Congkai Tan (3):
  KVM: arm64: Expose PMMIR_EL1.SLOTS under strict PMUv3 UAPI
  KVM: arm64: Advertise STALL_SLOT* in PMCEID1 under strict PMUv3 UAPI
  KVM: arm64: Add KVM_ARM_VCPU_PMU_V3_STRICT vCPU feature

Oliver Upton (1):
  KVM: arm64: Ignore writes to PMCR_EL0.N when using strict UAPI

 Documentation/virt/kvm/api.rst                | 11 ++++
 Documentation/virt/kvm/devices/vcpu.rst       | 11 +++-
 arch/arm64/include/asm/kvm_host.h             |  5 +-
 arch/arm64/include/uapi/asm/kvm.h             |  1 +
 arch/arm64/kvm/arm.c                          | 19 ++++--
 arch/arm64/kvm/pmu-emul.c                     | 54 ++++++++++++----
 arch/arm64/kvm/sys_regs.c                     | 64 ++++++++++++++++++-
 include/kvm/arm_pmu.h                         |  4 ++
 include/uapi/linux/kvm.h                      |  1 +
 .../selftests/kvm/arm64/get-reg-list.c        |  1 +
 10 files changed, 149 insertions(+), 22 deletions(-)


base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
-- 
2.50.1


