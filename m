Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A800AC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 22:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yU/fLL+92RLO71Pe+syN2lmq3wCTn8ghsMcg6jKW0VU=; b=eYCXKSyJwHfRCdmhCaO8mN6c+z
	3vQqyDSUiDKnUh9wLPbf3xqrMWRZ+/AqCv9eZNLvsxM/DdV5/LsMJXNUjM5T+qd9ybCSWWjH2a6LW
	p35cuujPPsA2lmC9xxx6u/oGIaM7CZ6MvaKYPZGjXjv47rHknooSO/okF5eWNxQFdX4U8Io8GqXkN
	MJ2QGMSi0jwVBCUu/ThcOqIL4EfVOu3bbYlTrgpb8sM91Zm2Fw8H+ZE7sLOxaRDhPFCteNSgjgBbZ
	2yzY+4IxQzIfX3pBB4eUHnkgJFz0JbFdnw9kK7d3EB25frD0CRTfFDX0uLSGTQXJkjeEIBy92IFA9
	wYMGpAVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSk6T-0000000Ghkr-18m1;
	Fri, 20 Jun 2025 22:20:57 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSk4C-0000000GgyK-2lWK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 22:18:37 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3ddbb34fc1cso26073915ab.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 15:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750457915; x=1751062715; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yU/fLL+92RLO71Pe+syN2lmq3wCTn8ghsMcg6jKW0VU=;
        b=GnQuMhSsS2Ujw0Nihv7qlabiTmXRTusO46ypvNtMqRdullQKg0lsZ0M44G0eeZsrJK
         lB0y+nYrtI5TmJnQN8eqyGV0Ave/IYJ3f/OC8YecE0bERtRycVBKrlhDpTg2X/v/iMom
         v3FNIiLQBu/x50GWhRvBajFamq1mkXawSynub0DotvZh4C4lCopxWBgz/oJPYUu63A3u
         09+2uhsOjlBXNvjNHf+UlVFQB5Mw3DyFq2o6G0m4WWN/PzzIPGrPBgNkKVkIA15iyKef
         5kiJQyBH+1fYWZeqCssrGy5ieZ1JpYnt2nTdmQPyYBtfNiD/qM/8DM9KRx54AEcuJm78
         cW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750457915; x=1751062715;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yU/fLL+92RLO71Pe+syN2lmq3wCTn8ghsMcg6jKW0VU=;
        b=Wdyo7W8jPJnqD403GFKS3lNkBKTXKV0gFzhk+HRd5s52Sl7GFxKE9x4U5SnoNgx7af
         sY52tlrovJpRs92UsJWRvF8DygKreIIS9HeIzsTSftrsUGxkxp+VX0qRIHI3iKb3Rs3V
         xhdl6GSR77ueJTbncbuSdFclLzSPeEASSSbSUpbp2TZgoUVUZkaIk7bq8vwUjcyu7fa3
         jKjWWwsGLLrmtu0LukqwAhS4721d7SZRK9JmnkunOoc4yi2WkwvGZ1LFgVYPFu65EnGc
         AJrwZ3EAgF/WQNrKrljVIlxV/24fqp5SELeBlo0aOyyXh0se29dtTMCzSxcSArLw3xP2
         WYgA==
X-Forwarded-Encrypted: i=1; AJvYcCUvimPjzdjTmXX7UiGjbjEL7ual6BSrqTizgFaSpnPUqGoVcpTabsgtWzqnyTT3pFXs5GmY6u4X6Pa5+VGxO6cE@lists.infradead.org
X-Gm-Message-State: AOJu0YxGbT54m3ZOPjVmxDXZhpqclP9fdwQlaCCThxqdV5a6FlcAdfXt
	euOWOJIDHpcml1pNtqDK3JogWCc6riyV46wu9ptZzVZajrC23KiRLdgYFLRMH0hGWdOmitJvLcp
	xBlq1HnhZGGkhelCns5xLfmpcXg==
X-Google-Smtp-Source: AGHT+IFQfd+HFEgJUFIDJKFNT2FwvsKl4Qb5d6oW09ns3YI6iz4RavO8zz9nyubEwG4dIvHgjtj9BKcQ+WfnlUpyug==
X-Received: from ilbbb11.prod.google.com ([2002:a05:6e02:b:b0:3de:11fe:800c])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:16ce:b0:3dd:d653:5a05 with SMTP id e9e14a558f8ab-3de38c1bec3mr55832985ab.3.1750457915390;
 Fri, 20 Jun 2025 15:18:35 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:13:00 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250620221326.1261128-1-coltonlewis@google.com>
Subject: [PATCH v2 00/23] ARM64 PMU Partitioning
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_151836_736531_19495B01 
X-CRM114-Status: GOOD (  22.99  )
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

This series creates a new PMU scheme on ARM, a partitioned PMU that
allows reserving a subset of counters for more direct guest access,
significantly reducing overhead. More details, including performance
benchmarks, can be read in the v1 cover letter linked below.

v2:

* Rebased on top of kvm/queue to pick up Sean's patch [1] that
  reorganizes some of the same headers and would otherwise conflict.

* Changed the semantics of the command line parameters and the
  ioctl. It was pointed out in the comments last time that it doesn't
  work to repartition at runtime because the perf subsystem assumes
  the number of counters it gets will not change after the PMU is
  probed. Now the PMUv3 command line parameters are the sole thing
  that divides up guest and host counters and the ioctl just toggles a
  flag for whether a vcpu should use the partitioned PMU. I've also
  moved from one to two parameters: partition_pmu=[y/n] and
  reserved_guest_counters=[0-N]. This makes it possible to
  unambiguously express configurations like a partitioned PMU with 0
  general purpose counters exposed to the guest (which still exposes
  the cycle counter.

* Moved the partitioning code into the PMUv3 driver itself so KVM code
  isn't modifying fields that are otherwise internal to the driver.

* Define PMI{CNTR,FILTR} as undef_access since KVM isn't ready to
  support that counter. It is, however, still handled in the
  partitioning because the driver recognizes it.

* Take out the dependency on FEAT_FGT since it is not widely available
  on hardware yet. Instead, define a fast path in switch.h for
  handling accesses to the registers that would otherwise be
  untrapped.

* During MDCR_EL2 setup for guests, ensure the computed HPMN value is
  always below the number of guest counters allocated by the driver at
  boot and always below the number of counters on the current
  CPU. This accounts for the possibiliy of heterogeneous hardware
  where I guest might be able to use the partitioned PMU on one CPU
  but not another.

* The KVM PMU event filter API says that counters must not count while
  the event is filtered. To ensure this, enforce the filter on every
  vcpu_load into the guest.

* Settable PMCR_EL0.N with a partitioned PMU now works and the
  vcpu_counter_access selftest changes reflect that.

v1:
https://lore.kernel.org/kvm/20250602192702.2125115-1-coltonlewis@google.com/

Colton Lewis (22):
  arm64: cpufeature: Add cpucap for HPMN0
  arm64: Generate sign macro for sysreg Enums
  arm64: cpufeature: Add cpucap for PMICNTR
  arm64: Define PMI{CNTR,FILTR}_EL0 as undef_access
  KVM: arm64: Reorganize PMU functions
  perf: arm_pmuv3: Introduce method to partition the PMU
  perf: arm_pmuv3: Generalize counter bitmasks
  perf: arm_pmuv3: Keep out of guest counter partition
  KVM: arm64: Correct kvm_arm_pmu_get_max_counters()
  KVM: arm64: Set up FGT for Partitioned PMU
  KVM: arm64: Writethrough trapped PMEVTYPER register
  KVM: arm64: Use physical PMSELR for PMXEVTYPER if partitioned
  KVM: arm64: Writethrough trapped PMOVS register
  KVM: arm64: Write fast path PMU register handlers
  KVM: arm64: Setup MDCR_EL2 to handle a partitioned PMU
  KVM: arm64: Account for partitioning in PMCR_EL0 access
  KVM: arm64: Context swap Partitioned PMU guest registers
  KVM: arm64: Enforce PMU event filter at vcpu_load()
  perf: arm_pmuv3: Handle IRQs for Partitioned PMU guest counters
  KVM: arm64: Inject recorded guest interrupts
  KVM: arm64: Add ioctl to partition the PMU when supported
  KVM: arm64: selftests: Add test case for partitioned PMU

Marc Zyngier (1):
  KVM: arm64: Cleanup PMU includes

 Documentation/virt/kvm/api.rst                |  21 +
 arch/arm/include/asm/arm_pmuv3.h              |  34 +
 arch/arm64/include/asm/arm_pmuv3.h            |  61 +-
 arch/arm64/include/asm/kvm_host.h             |  20 +-
 arch/arm64/include/asm/kvm_pmu.h              |  61 ++
 arch/arm64/kernel/cpufeature.c                |  15 +
 arch/arm64/kvm/Makefile                       |   2 +-
 arch/arm64/kvm/arm.c                          |  22 +
 arch/arm64/kvm/debug.c                        |  24 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h       | 233 ++++++
 arch/arm64/kvm/pmu-emul.c                     | 676 +----------------
 arch/arm64/kvm/pmu-part.c                     | 359 +++++++++
 arch/arm64/kvm/pmu.c                          | 687 ++++++++++++++++++
 arch/arm64/kvm/sys_regs.c                     |  66 +-
 arch/arm64/tools/cpucaps                      |   2 +
 arch/arm64/tools/gen-sysreg.awk               |   1 +
 arch/arm64/tools/sysreg                       |   6 +-
 drivers/perf/arm_pmuv3.c                      | 150 +++-
 include/linux/perf/arm_pmu.h                  |  15 +-
 include/linux/perf/arm_pmuv3.h                |  14 +-
 include/uapi/linux/kvm.h                      |   4 +
 tools/include/uapi/linux/kvm.h                |   2 +
 .../selftests/kvm/arm64/vpmu_counter_access.c |  63 +-
 virt/kvm/kvm_main.c                           |   1 +
 24 files changed, 1791 insertions(+), 748 deletions(-)
 create mode 100644 arch/arm64/kvm/pmu-part.c


base-commit: 79150772457f4d45e38b842d786240c36bb1f97f
--
2.50.0.714.g196bf9f422-goog

