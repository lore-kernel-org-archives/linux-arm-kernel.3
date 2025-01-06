Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98831E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 14:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NjhZg1PhxZESUuVf6EemJQRzcvFYBW2UtJGnBs1wxAA=; b=rpK9W1UitoOYLzhfhQ1gldz2fy
	GsLc8wNif2VztogDIXpJ6Mp8EBInKchdXa9wzMwyQJ5j1ToUK5cAk7OBN8YPcLrSVfPQba5EN/qTb
	XqaFzf8XMuawtx97A31w2iBEnZI2gsllDfEJlePefTFgDCu2i+2bsxGzVkL/o48N0hbbPS8O2zOXd
	23vmIHEkoLvYKrBip6IigyZzKGvc4cmK84J0xo00mq8GI6MJweprXEPS/OVk+YUbvP9Ccg+huJ297
	W6NRBXqaCWikhPgLU17UeI48XhK8tmrW7badfIjq1Ma7ByINnylBcX3Ci1xWgYdwo2oYtK0W10m/V
	m2NS/3gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoBf-00000001als-206x;
	Mon, 06 Jan 2025 14:34:35 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUo2L-00000001YsQ-3ufw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 14:24:59 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso89744685e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 06:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736173496; x=1736778296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NjhZg1PhxZESUuVf6EemJQRzcvFYBW2UtJGnBs1wxAA=;
        b=DLB1kKRHGNas9R0kIzc5wnyqqjXSNLC0S6xDvszMGWNs0KW4EOlrGgM0CPi6xpVmmN
         uW7e2qZm6wXbpVo/FtnRODg3lwZVKZvF4rVnrg84wIg2Y2Yv1KX2xNe59WD5v5mO57Ap
         BYoRLhH6k4koPSyE2h68MkYg3PNKADJK4mkqKAVCbJnki9wuofV3NP+4hFv5IBaupgBI
         bDuNYjCBlnXPa605U5KfJI3OS+W26MzNst+CPZisgGb82Ncm0oBV2Cx6zlpWf1RVHtJ2
         xzO0OVwwbTOUe78oNcCyWwAyr0HrgMtOVes7pOdyxdf9eTORahWPPWo8pULPBabD8Cpk
         BnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736173496; x=1736778296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NjhZg1PhxZESUuVf6EemJQRzcvFYBW2UtJGnBs1wxAA=;
        b=VAccrhddBO2Yr69kva+vEEKR055dDdJw4kMpmYJZd8Gjf30maJaPNBJ09iWIRJZ0pc
         d1sH27yzGopqOjo/XipFxGSVsM1mYNV6CbgX4OaTA3qrixMsqWcybB/GQmPe/GhT821X
         qplJ+n2J5lLMMLJ+ofHPTxjbtxONSeOEQoSuaDpmzY8FaSi7e2TzTLnS7I30udL+9C9D
         tZors2KirbrVsksjVtYqQ3ADb5gdznuE6Lxs+GLc9ckiQr03WjiyfnXK4ZUVa/k57ayT
         0AaSvhQwDm5FuL9Wtj79xnfmkLT4r2q9mQj/9twuY1axiDR4yLbOt+Qc7y57+Q2s1jTb
         cQgA==
X-Forwarded-Encrypted: i=1; AJvYcCVMsV/WAFMN2KmBJ/S9mdD4FK/6nypsALg/rwzX/x1UY94CeMGjMn7RjadggPE+V2nv97WNYdA8hJgjmJNX6wsa@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw3jQAJBBh51PpzTT5v3PAomq9G/4Z+1w0NQZvNnaxj19kIws+
	JAjZIfGrwKOnpzkaV3v/dBy2s5FcEELfghJ9gtV6N+AfEslNSqVN2Lk5Z4cuZ5E=
X-Gm-Gg: ASbGncsfFoEXEcCsu1dzF7ISdcyx3A3x6rn8zq6pw39yAzuJp+HeOVRIHyxFW9hXGcm
	BdnGTnmE95q1e3g2IgtxG8txB6InrHk5TkRdymZpglUSKuhQobuIkRqcYvhK4bHwcLDLAfit8zT
	/62DnuJJp96pIMG0t9Mv9kDnkapOKRBR65AAMAzcL4GwMF0Eg5S+lbRpIKBfUAutvWjYzhJtcOX
	5LlaRmigobYtmOyq8wU5rL9k0EHeiJP73/i2Q34sjRAO/nop/L61/69
X-Google-Smtp-Source: AGHT+IEh1Do/i1iABB/mNn5JaLC7AFOlndna+lHvNyNlHNlKy+PSWotPToba8F3QDc1zsrtaS+Kuzg==
X-Received: by 2002:adf:9bd8:0:b0:38a:4df5:a08 with SMTP id ffacd0b85a97d-38a4df50a1fmr20150696f8f.22.1736173496095;
        Mon, 06 Jan 2025 06:24:56 -0800 (PST)
Received: from pop-os.. ([145.224.66.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4365d116d8fsm577295045e9.17.2025.01.06.06.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:24:55 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: maz@kernel.org,
	kvmarm@lists.linux.dev,
	oliver.upton@linux.dev,
	suzuki.poulose@arm.com,
	coresight@lists.linaro.org
Cc: James Clark <james.clark@linaro.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	James Morse <james.morse@arm.com>,
	Mark Brown <broonie@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/7] kvm/coresight: Support exclude guest and exclude host
Date: Mon,  6 Jan 2025 14:24:35 +0000
Message-Id: <20250106142446.628923-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_062457_973946_20028487 
X-CRM114-Status: GOOD (  33.24  )
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

There is also an optimization where the Coresight drivers pass their
enabled state to KVM. This means in the common case KVM doesn't have to
touch any sysregs when the feature isn't in use.

Applies to kvmarm/next (00163be8bb59).

---

Changes since V8 [8]:
  * Rename guest_trfcr_el1 -> trfcr_while_in_guest
  * Rename GUEST_FILTER -> EL1_TRACING_CONFIGURED
  * Rename kvm_set_trfcr() -> kvm_tracing_set_el1_configuration()
  * #include ordering
  * Reorder Coresight driver to remove need for preempt_disable()
    to avoid the warning
  * Force EL1_TRACING_CONFIGURED on for pKVM which drops an additional
    special case but still disables trace
  * Change set/clear trfcr to a single function that disables swapping
    if it has the same value as the host
  * Make the drain condition a bit clearer with __trace_needs_drain()
    instead of host trfcr != 0 (Or checking individual E*TRE bits)
  * Drain is only really required on switch to guest so move it there
  * Only for pKVM, restore the original behavior for draining whenever
    trbe is enabled. This prevents hypothetical case where a host has
    the filters disabled but hasn't drained yet which we had by only
    looking at host trfcr != 0

Changes since V7 [6]:
  * Drop SPE changes
  * Change the interface to be based on intent, i.e kvm_enable_trbe()
    rather than passing the raw register value
  * Drop change to re-use vcpu_flags mechanism in favour of [7]
  * Simplify by using the same switch function to and from guest

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
[6]: https://lore.kernel.org/kvmarm/20241112103717.589952-1-james.clark@linaro.org/T/#t
[7]: https://lore.kernel.org/kvmarm/20241115224924.2132364-4-oliver.upton@linux.dev/
[8]: https://lore.kernel.org/linux-arm-kernel/20241127100130.1162639-1-james.clark@linaro.org/

James Clark (7):
  arm64/sysreg: Add a comment that the sysreg file should be sorted
  tools: arm64: Update sysreg.h header files
  arm64/sysreg/tools: Move TRFCR definitions to sysreg
  coresight: trbe: Remove redundant disable call
  KVM: arm64: coresight: Give TRBE enabled state to KVM
  KVM: arm64: Support trace filtering for guests
  coresight: Pass guest TRFCR value to KVM

 arch/arm64/include/asm/kvm_host.h             |  11 +
 arch/arm64/include/asm/sysreg.h               |  12 -
 arch/arm64/kvm/debug.c                        |  50 ++-
 arch/arm64/kvm/hyp/nvhe/debug-sr.c            |  63 +--
 arch/arm64/tools/sysreg                       |  38 ++
 .../coresight/coresight-etm4x-core.c          |  49 ++-
 drivers/hwtracing/coresight/coresight-etm4x.h |   2 +-
 drivers/hwtracing/coresight/coresight-priv.h  |   3 +
 .../coresight/coresight-self-hosted-trace.h   |   9 -
 drivers/hwtracing/coresight/coresight-trbe.c  |  15 +-
 tools/arch/arm64/include/asm/sysreg.h         | 410 +++++++++++++++++-
 tools/include/linux/kasan-tags.h              |  15 +
 12 files changed, 599 insertions(+), 78 deletions(-)
 create mode 100644 tools/include/linux/kasan-tags.h

-- 
2.34.1


