Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90192D32D92
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 11:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DTmm4txF/WGuXlLhJZrujPK9yr3N/UoD68EIAXZP55k=; b=OAylfDzt1oOfdTBITS1iCZMRJ9
	j/uouugUT0+hDAU5gRkUtQvmkJrGem70gOHIETuZui4d/0rKgQNKC0thE4flXutBNYgUUOq6GICAK
	VeoVkGmy63IrqTMG2MmV89MeykgslTQBwhIDY3aZ8rk5O2ocTk+NZcPz6A06ylqaSEfzj/x5sd429
	d9DNFlMh2bq3/Z5NO9bzK/jeQ1zEQv4PwvFOSBBPKmHWuYePQvH2OIbqCP2SMffW5TBjcGucTsEHB
	m9mKqZfSx22TLUEw3gHhNQ5v4X8W2nepLLz3QxlEAbbwBM4XAmA3mZTWGKFJCWdQeNTH26OME779r
	E/OYVuyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAofZ-000000039TI-1724;
	Tue, 12 Nov 2024 11:02:49 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoH2-000000034W0-0h0C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 10:37:29 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4315f24a6bbso43242375e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 02:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731407847; x=1732012647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DTmm4txF/WGuXlLhJZrujPK9yr3N/UoD68EIAXZP55k=;
        b=pgAiV6ZRGHGgWyYBxdbU/dp35fcWJ4Cx9K9B4X3Crg4Yto6PxtrLM2FxULCBTMMmnW
         3qNR+nHPwufF36bckvqFBRUDK0Dg3RzC8zGfW/mrzcG+l8H89Nd2pYmG85YY8MjGL0Cb
         jr8vPT2UDm8wt5cBzeCtQVwQCVfs3uqrYXc0GAyxgnk3cqfE1tgpRU+JYwbCXEjL2jrY
         JBXphnWGNY8L/Vy7JMHbQCIEkvUrfKROElAQnxb3NUyF0JvNGIZk8d6XZfCQRH6TnPcw
         veqNyziYXW7aNUdZDlLa4nddjSYZv09EPAxh0yuEwfXrnwlwqcGdnYGovfS59sG8zIZw
         5FDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731407847; x=1732012647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DTmm4txF/WGuXlLhJZrujPK9yr3N/UoD68EIAXZP55k=;
        b=RkZFkURAScxNbqSsuASQSHxaGqWhj8Ed/8D6sr/dnynSFsCsm/3kYUerWO0zp1wiSR
         BrT1z2gucgM7dFvqP1pdQz/QQjnYGcvrNXarSt4VEsAP2Tr2mZ4OoRfXpzrNxjGVB3PN
         9+knHok7IAWN6CxkCs2ya10VipQh1XoXf2T0juEO67Yq69cI4Lkw5gvufmyd25+KqgQW
         S4DyI+XtS9ahFXbkTx1fU+6X29J/Bj24IzDgOmff7b7Iyyed06OzUyVCim0fk0xk1GJs
         1owhNb+5d5To3/9MWiX2Zl6xu0Qz66+0/5YQEZH6VPFcjWKXQNFMznYiafMQsYNzLV+w
         Ds4A==
X-Forwarded-Encrypted: i=1; AJvYcCXDTWiKUVPLpeYWyF29m9xPqcDUtKYf6EwpjbIIknd7fWWE+g4ygrv1rMnRBHtLxp5cDr4KtvoZjBRjUxmdHS50@lists.infradead.org
X-Gm-Message-State: AOJu0YzCZJ6Og3gLf1IAj/2CdrOQ6ivBm4yuZJQqCH/hZ3hQKp/cITAU
	sEMDO4ikm3a0ZYZoKa3ZcAWiZ5dcTKC9yVfz1icFZKLkmQ+o7gyUfYLoNNBqAuA=
X-Google-Smtp-Source: AGHT+IHSSYdGHvj45CoxKZcPcWbqJL7VVuLCtim37dYRMvlOQFBAgm551VkAfgqBy0dlaMf5QQCexA==
X-Received: by 2002:a05:600c:3c8f:b0:431:4e25:fe42 with SMTP id 5b1f17b1804b1-432b751e28fmr123431995e9.32.1731407846604;
        Tue, 12 Nov 2024 02:37:26 -0800 (PST)
Received: from pop-os.. ([145.224.90.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432bbf436ffsm142270955e9.44.2024.11.12.02.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 02:37:26 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: suzuki.poulose@arm.com,
	oliver.upton@linux.dev,
	coresight@lists.linaro.org,
	kvmarm@lists.linux.dev
Cc: James Clark <james.clark@linaro.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	James Morse <james.morse@arm.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	Fuad Tabba <tabba@google.com>,
	Mark Brown <broonie@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 00/12] kvm/coresight: Support exclude guest and exclude host
Date: Tue, 12 Nov 2024 10:36:59 +0000
Message-Id: <20241112103717.589952-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_023728_289908_FEE485FB 
X-CRM114-Status: GOOD (  31.51  )
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

FEAT_TRF is a Coresight feature that allows trace capture to be
completely filtered at different exception levels, unlike the existing
TRCVICTLR controls which may still emit target addresses of branches,
even if the following trace is filtered.

Without FEAT_TRF, it was possible to start a trace session on a host and
also collect trace from the guest as TRCVICTLR was never programmed to
exclude guests (and it could still emit target addresses even if it
was).

With FEAT_TRF, the current behavior of trace in guests exists depends on
whether nVHE or VHE are being used. Both of the examples below are from
the host's point of view, as Coresight isn't accessible from guests.
This patchset is only relevant to when FEAT_TRF exists, otherwise there
is no change.

Current behavior:

  nVHE/pKVM:

  Because the host and the guest are both using TRFCR_EL1, trace will be
  generated in guests depending on the same filter rules the host is
  using. For example if the host is tracing userspace only, then guest
  userspace trace will also be collected.

  (This is further limited by whether TRBE is used because an issue
  with TRBE means that it's completely disabled in nVHE guests, but it's
  possible to have other tracing components.)

  VHE:

  With VHE, the host filters will be in TRFCR_EL2, but the filters in
  TRFCR_EL1 will be active when the guest is running. Because we don't
  write to TRFCR_EL1, guest trace will be completely disabled.

New behavior:

The guest filtering rules from the Perf session are now honored for both
nVHE and VHE modes. This is done by either writing to TRFCR_EL12 at the
start of the Perf session and doing nothing else further, or caching the
guest value and writing it at guest switch for nVHE. In pKVM, trace is
now be disabled for both protected and unprotected guests.

There is also an optimization where the SPE and Coresight drivers pass
their enabled state to KVM. This means in the common case KVM doesn't
have to touch any sysregs when the feature isn't in use.

Applies to kvmarm/next (25a8556b54007)

---

Changes since V6 [5]:
  * Implement a better "do nothing" case where both the SPE and Coresight
    drivers give the enabled state to KVM, allowing some register
    reads to be dropped.
  * Move the state and feature flags out of the vCPU into the per-CPU
    host_debug_state.
  * Simplify the switch logic by adding a new flag HOST_STATE_SWAP_TRFCR
    and only storing a single TRFCR value.
  * Rename vcpu flag macros to a more generic kvm_flag...

Changes since V5 [4]:
  * Sort new sysreg entries by encoding
  * Add a comment about sorting arch/arm64/tools/sysreg
  * Warn on preemptible() before calling smp_processor_id()
  * Pickup tags
  * Change TRFCR_EL2 from SysregFields to Sysreg because it was only
    used once

Changes since V4 [3]:
  * Remove all V3 changes that made it work in pKVM and just disable
    trace there instead
  * Restore PMU host/hyp state sharing back to how it was
    (kvm_pmu_update_vcpu_events())
  * Simplify some of the duplication in the comments and function docs
  * Add a WARN_ON_ONCE() if kvm_etm_set_guest_trfcr() is called when
    the trace filtering feature doesn't exist.
  * Split sysreg change into a tools update followed by the new register
    addition

Changes since V3:
  * Create a new shared area to store the host state instead of copying
    it before each VCPU run
  * Drop commit that moved SPE and trace registers from host_debug_state
    into the kvm sysregs array because the guest values were never used
  * Document kvm_etm_set_guest_trfcr()
  * Guard kvm_etm_set_guest_trfcr() with a feature check
  * Drop Mark B and Suzuki's review tags on the sysreg patch because it
    turned out that broke the Perf build and needed some unconventional
    changes to fix it (as in: to update the tools copy of the headers in
    the same commit as the kernel changes)

Changes since V2:

  * Add a new iflag to signify presence of FEAT_TRF and keep the
    existing TRBE iflag. This fixes the issue where TRBLIMITR_EL1 was
    being accessed even if TRBE didn't exist
  * Reword a commit message

Changes since V1:

  * Squashed all the arm64/tools/sysreg changes into the first commit
  * Add a new commit to move SPE and TRBE regs into the kvm sysreg array
  * Add a comment above the TRFCR global that it's per host CPU rather
    than vcpu

Changes since nVHE RFC [1]:

 * Re-write just in terms of the register value to be written for the
   host and the guest. This removes some logic from the hyp code and
   a value of kvm_vcpu_arch:trfcr_el1 = 0 no longer means "don't
   restore".
 * Remove all the conditional compilation and new files.
 * Change the kvm_etm_update_vcpu_events macro to a function.
 * Re-use DEBUG_STATE_SAVE_TRFCR so iflags don't need to be expanded
   anymore.
 * Expand the cover letter.

Changes since VHE v3 [2]:

 * Use the same interface as nVHE mode so TRFCR_EL12 is now written by
   kvm.

[1]: https://lore.kernel.org/kvmarm/20230804101317.460697-1-james.clark@arm.com/
[2]: https://lore.kernel.org/kvmarm/20230905102117.2011094-1-james.clark@arm.com/
[3]: https://lore.kernel.org/linux-arm-kernel/20240104162714.1062610-1-james.clark@arm.com/
[4]: https://lore.kernel.org/all/20240220100924.2761706-1-james.clark@arm.com/
[5]: https://lore.kernel.org/linux-arm-kernel/20240226113044.228403-1-james.clark@arm.com/

James Clark (12):
  arm64/sysreg: Add a comment that the sysreg file should be sorted
  tools: arm64: Update sysreg.h header files
  arm64/sysreg/tools: Move TRFCR definitions to sysreg
  KVM: arm64: Make vcpu flag macros more generic
  KVM: arm64: Move SPE and TRBE flags to host data
  KVM: arm64: Add flag for FEAT_TRF
  KVM: arm64: arm_spe: Give SPE enabled state to KVM
  KVM: arm64: Don't hit sysregs to see if SPE is enabled or not
  KVM: arm64: coresight: Give TRBE enabled state to KVM
  KVM: arm64: Don't hit sysregs to see if TRBE is enabled or not
  KVM: arm64: Swap TRFCR on guest switch
  coresight: Pass guest TRFCR value to KVM

 arch/arm64/include/asm/kvm_host.h             | 123 +++---
 arch/arm64/include/asm/kvm_hyp.h              |   2 +-
 arch/arm64/include/asm/sysreg.h               |  12 -
 arch/arm64/kvm/arm.c                          |   3 -
 arch/arm64/kvm/debug.c                        |  97 ++++-
 arch/arm64/kvm/hyp/exception.c                |  12 +-
 arch/arm64/kvm/hyp/nvhe/debug-sr.c            | 118 +++--
 arch/arm64/kvm/hyp/nvhe/switch.c              |   2 +-
 arch/arm64/kvm/inject_fault.c                 |   4 +-
 arch/arm64/kvm/mmio.c                         |  10 +-
 arch/arm64/tools/sysreg                       |  38 ++
 .../coresight/coresight-etm4x-core.c          |  43 +-
 drivers/hwtracing/coresight/coresight-etm4x.h |   2 +-
 drivers/hwtracing/coresight/coresight-priv.h  |   3 +
 drivers/hwtracing/coresight/coresight-trbe.c  |  15 +-
 drivers/perf/arm_spe_pmu.c                    |  13 +-
 tools/arch/arm64/include/asm/sysreg.h         | 410 +++++++++++++++++-
 tools/include/linux/kasan-tags.h              |  15 +
 18 files changed, 755 insertions(+), 167 deletions(-)
 create mode 100644 tools/include/linux/kasan-tags.h

-- 
2.34.1


