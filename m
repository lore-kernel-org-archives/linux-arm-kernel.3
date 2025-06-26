Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88465C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 21:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bfd4g4oyzgO9BbMd8TfR5LoagbwDLdjqmGt8yskowpw=; b=xVZrV4UJQJoyo+SJEcDXz3TKb1
	ucWfdEN9yUqkudqJjJbI9lVw/1xIp+HEf0f1kpd5Hmzss8q0pLiqG3p3uMsvoo4H9tDK9MtJYKd56
	FzYzyfWQ8rlFY8I65e19OnwBxX42QnYMv/3dMXfOK68JF6HcbGG8vMiwAPsclh5fOMyLLFfmWIaK0
	neXUWWm9T4jBHWGIgkKJfnL8GMG4wLAqaqjWLnaAUsNLIWOj8jsxYCcTr/kD90U21F/42k+pAvj27
	MbTWeupnM/h3CnB0p3m6kiPtF/I6n7BTnR713LHdtR0J7opP80C+zGTMWtG/lwsrbDq7rz0gGgOik
	fukuH5jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUuKE-0000000CrFN-2EXC;
	Thu, 26 Jun 2025 21:40:06 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsr3-0000000Cgdj-0EuJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 20:05:54 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3df300ab18eso24280395ab.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 13:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750968351; x=1751573151; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bfd4g4oyzgO9BbMd8TfR5LoagbwDLdjqmGt8yskowpw=;
        b=uOeHaQGh2oMyis7vOGKYR6huZuh9R6BFm8g90P4ekZMWAjVV0Cw64yZhwYpbdfF7Vd
         Wtk1FbKGur8jd8Og67qKEBfzfK7pxG4VJ8lWbIpEqvCIdSpFitmyvNSgUvuBQGgHSV95
         BgwHo9h+vqCC6mwfPdEuKA3SA1HPbSWQi1Y2PVpTbABCZaynUwfmE0yF/6xCh4cNwejF
         wRCXWXroamurAMCLy5yzqF8RBQUktFEsDUHdPPBgCIJTCQnxGPU9CegYgaEw7PGmBozv
         2rakhIjshHBS5Dw20iRs5aKlYllWtg4T5u0KVaHxHp9u6k987E6Acx7JpUGyDkLxJ2CK
         VFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750968351; x=1751573151;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bfd4g4oyzgO9BbMd8TfR5LoagbwDLdjqmGt8yskowpw=;
        b=uxMisEivZCe2xmGDRI5u7y476t0MYit7cSQ4pWSKpdCakZhqMTyhbpCrHQWx19+EnU
         EXAOQDV1brYuQIoC5u1yxWHAZZtswidhGcIhni84YpmEXaaZhAcVnUhqBKqKoeNgPZWr
         7+77IXFs9Tvn0CXI1WjfopqiVavxaN7vlyBqX9GPyvOiGV8sQneqTGUFMplKmKvoUM/K
         UrArN/SE5bOaYZM8BkTpyMTJqEuzcKvPRK5AiS8vwZz+Gh/ayqUN+dZquSw1TubUG6BM
         MFE8B1rJy9auQZa1sSw/kGfzPEYvthisJG6A8FBcXtc+ZUBlkRgqtvDNodTA+Qk3hpng
         xbig==
X-Forwarded-Encrypted: i=1; AJvYcCWUAbXtktXItL2I4aKlyoUv9CgyhCfSwo0RoPkic6QKDX2hqIRQWFU/LGVTJldIB1t56Z2lZvfYiwKUKuHIKmTr@lists.infradead.org
X-Gm-Message-State: AOJu0YzB3bcEcPke7rYTvn5zleaGeSuA6M8GdlEbRFPbEc5OajhAtJMs
	gxsdAiw48Ng/mmSFTRzyuBPQ1Xdcc/Vlx2jEYkK4xWW1D/+42Og5knuDDeeXiurUHJztq2Li/Cn
	QMwrCulN3DuUprwDXwXX7iAg2nQ==
X-Google-Smtp-Source: AGHT+IG6G2rFRPWkpOW41Pi9fBc/Fkgk+vgjVkKLSP9f2QAlLB5ktW9y9VyZ03BDZAOiaFnbG271ZNfhQM9Y4i+b9Q==
X-Received: from ilbed13.prod.google.com ([2002:a05:6e02:480d:b0:3dd:a3df:9d57])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:174f:b0:3dd:c04e:49af with SMTP id e9e14a558f8ab-3df4ab4eec8mr12720745ab.3.1750968351198;
 Thu, 26 Jun 2025 13:05:51 -0700 (PDT)
Date: Thu, 26 Jun 2025 20:04:36 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626200459.1153955-1-coltonlewis@google.com>
Subject: [PATCH v3 00/22] ARM64 PMU Partitioning
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_130553_118364_C3408AF5 
X-CRM114-Status: GOOD (  13.84  )
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

v3:

* Return to using one kernel command line parameter for reserved host
  counters, but set the default value meaning no partitioning to -1 so
  0 isn't ambiguous. Adjust checks for partitioning accordingly.

* Move the function kvm_pmu_partition_supported() back out of the
  driver to avoid subbing has_vhe in 32-bit ARM code.

* Fix the kernel test robot build failures, one with KVM and no PMU,
  and one with PMU and no KVM.

* Scan entire series to remove vestigial changes and update comments.

v2:
https://lore.kernel.org/kvm/20250620221326.1261128-1-coltonlewis@google.com/

v1:
https://lore.kernel.org/kvm/20250602192702.2125115-1-coltonlewis@google.com/

Colton Lewis (21):
  arm64: cpufeature: Add cpucap for HPMN0
  arm64: Generate sign macro for sysreg Enums
  KVM: arm64: Define PMI{CNTR,FILTR}_EL0 as undef_access
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
 arch/arm/include/asm/arm_pmuv3.h              |  38 +
 arch/arm64/include/asm/arm_pmuv3.h            |  61 +-
 arch/arm64/include/asm/kvm_host.h             |  18 +-
 arch/arm64/include/asm/kvm_pmu.h              | 100 +++
 arch/arm64/kernel/cpufeature.c                |   8 +
 arch/arm64/kvm/Makefile                       |   2 +-
 arch/arm64/kvm/arm.c                          |  22 +
 arch/arm64/kvm/debug.c                        |  24 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h       | 233 ++++++
 arch/arm64/kvm/pmu-emul.c                     | 674 +----------------
 arch/arm64/kvm/pmu-part.c                     | 378 ++++++++++
 arch/arm64/kvm/pmu.c                          | 702 ++++++++++++++++++
 arch/arm64/kvm/sys_regs.c                     |  79 +-
 arch/arm64/tools/cpucaps                      |   1 +
 arch/arm64/tools/gen-sysreg.awk               |   1 +
 arch/arm64/tools/sysreg                       |   6 +-
 drivers/perf/arm_pmuv3.c                      | 123 ++-
 include/linux/perf/arm_pmu.h                  |   6 +
 include/linux/perf/arm_pmuv3.h                |  14 +-
 include/uapi/linux/kvm.h                      |   4 +
 tools/include/uapi/linux/kvm.h                |   2 +
 .../selftests/kvm/arm64/vpmu_counter_access.c |  62 +-
 virt/kvm/kvm_main.c                           |   1 +
 24 files changed, 1828 insertions(+), 752 deletions(-)
 create mode 100644 arch/arm64/kvm/pmu-part.c


base-commit: 79150772457f4d45e38b842d786240c36bb1f97f
--
2.50.0.727.gbf7dc18ff4-goog

