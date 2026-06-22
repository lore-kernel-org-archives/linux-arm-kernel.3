Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8606FCDB471
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 08:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2q4fEjJJB9pI0oOoWfdAbXzWRGLKsWySd7aHIvJgyaw=; b=aXtldrmPVG8ZGC
	y0bvIW6w+2+rsd8g7O/rJ4pLAT6tJ0RKENTaLjWyKQ+XIVP/AUCao3flazixAPdHNFQ78J9ryVPeC
	08Klw+EobUMqs1CfcT/tQPFi9WBeP0gR/qrKjYJaAUvMzh8tjevua0fZnZETJSBPIMYxiLzgoNU6S
	lqOsoV17onmk5Tp8wfK9mhdvhZH5MTzUCbpMLvDwHWQRkemYWa2vU7ZOXoj/1cmDAe10EIEkXkfHf
	PtNVl282RTNRReVAhWBUMsTRjkafdTpaprNeR+3U1aD8wOl5UmVmuz0jeprsXf6jv8WPxPf1R+fxJ
	m04hVSUl+F/COWL9IFQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZdw-00000004ani-0d5R;
	Mon, 22 Jun 2026 08:04:32 +0000
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZdr-00000004amF-3TS4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 08:04:30 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782115462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2q4fEjJJB9pI0oOoWfdAbXzWRGLKsWySd7aHIvJgyaw=;
	b=u8UcaFl44jvinq274AKewhqXrvni1vlg93QNsqofNxUt4Sc41EweeMxwYxGnLiNB4hntbo
	W46qnYdbTc+YmAlWRPGul6aNfN67Jbw1jEqHiRl1F3WynnCgzD2RC5x6tlbNuJPVOiDOVG
	4QN6EnTxXyG+vbMabplOhXNZbctG7nc=
From: Atish Patra <atish.patra@linux.dev>
Subject: [PATCH v7 00/22] Add Counter delegation ISA extension support
Date: Mon, 22 Jun 2026 01:04:12 -0700
Message-Id: <20260622-counter_delegation-v7-0-0ba2fd34614e@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH3sOGoC/23QzW7DIAwH8FepOI8KzGd26ntM00TAaZDWUEGGN
 lV595FW1Xbg+Lfsny3fSMEcsZDXw41krLHEtLRgXg7Ez245I42hZQIMJDNcUZ++lhXzR8BPPLu
 1tVMN1gmYrB+8J23wmnGK33f07b3lOZY15Z/7jsr36oMDbhhTRtijMFJy4JTTJpb5esqxphIXf
 /TpQnajwnNOMc5l74wKlFE7OiN9GK3iY0cR/xQwXUU0RUs7yGCQ66A6ivxTgHVfUuV+i1B+cta
 iGHlH0U9FM81sV9FNAatGAxi0csPpgqt7CNu2/QK0fgLwvQEAAA==
To: Jiri Olsa <jolsa@kernel.org>, James Clark <james.clark@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Rob Herring <robh@kernel.org>, 
 Ian Rogers <irogers@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
 Atish Patra <atish.patra@linux.dev>, Namhyung Kim <namhyung@kernel.org>
Cc: devicetree@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_010428_107915_602EFDCE 
X-CRM114-Status: GOOD (  27.39  )
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

This series adds the counter delegation extension support. It is based on
very early PoC work done by Kevin Xue and mostly rewritten after that.
The counter delegation ISA extension(Smcdeleg/Ssccfg) actually depends
on multiple ISA extensions.

1. S[m|s]csrind : The indirect CSR extension[1] which defines additional
   5 ([M|S|VS]IREG2-[M|S|VS]IREG6) register to address size limitation of
   RISC-V CSR address space.
2. Smstateen: The stateen bit[60] controls the access to the registers
   indirectly via the above indirect registers.
3. Smcdeleg/Ssccfg: The counter delegation extensions[2]

The counter delegation extension allows Supervisor mode to program the
hpmevent and hpmcounters directly without needing the assistance from the
M-mode via SBI calls. This results in a faster perf profiling and very
few traps. This extension also introduces a scountinhibit CSR which allows
to stop/start any counter directly from the S-mode. As the counter
delegation extension potentially can have more than 100 CSRs, the specification
leverages the indirect CSR extension to save the precious CSR address range.

Due to the dependency of these extensions, the following extensions must be
enabled in qemu to use the counter delegation feature in S-mode.

"smstateen=true,sscofpmf=true,ssccfg=true,smcdeleg=true,smcsrind=true,sscsrind=true"
or Virt machine users can just "max" cpu instead.

When we access the counters directly in S-mode, we also need to solve the
following problems.

1. Event to counter mapping
2. Event encoding discovery

The RISC-V ISA doesn't define any standard either for event encoding or the
event to counter mapping rules. Until now, the SBI PMU implementation relies
on device tree binding[3] to discover the event to counter mapping in RISC-V
platform in the firmware. The SBI PMU specification[4] defines event encoding
for standard perf events as well. Thus, the kernel can query the appropriate
counter for an given event from the firmware.

However, the kernel doesn't need any firmware interaction for hardware
counters if counter delegation is available in the hardware. Thus, the driver
needs to discover the above mappings/encodings by itself without any assistance
from firmware.

Solution to Problem #1:
This patch series solves the above problem #1 by extending the perf tool in a
way so that event json file can specify the counter constraints of each event
and that can be passed to the driver to choose the best counter for a given
event.

This series introduces a RISC-V specific event field in "CounterIDMask" in
event_fields that describes a bitmask of counters supported for a specific eventi.
This is the similar approach for few other existing properties in the event_fields
which were used by single architecture as well. The counter constraint bitmap is
passed to the perf driver via newly introduced "counterid_mask" property set in "config2".

The platform vendor have these three ways to encode/use the platform specific
events.

1. Directly in driver with appropriate constraints (discouraged due to bloating
of the driver)
2. Encode in Json with with CounterIDMask field (preferred as it is contained
within platform specific json file)
3. Directly pass counterid_mask at while invoking perf 
cpu/event=<code>,counterid_mask=<mask>/

The last two patches show cases these use cases and not intended for merging.

Solution to problem #2:

The event encoding can come from the json or commandline as well.

The Qemu patches are available in upstream now.

The Linux kernel patches can be found here:
https://github.com/atishp04/linux/tree/b4/counter_delegation_v7

[1] https://github.com/riscv/riscv-indirect-csr-access
[2] https://github.com/riscv/riscv-smcdeleg-ssccfg
[3] https://www.kernel.org/doc/Documentation/devicetree/bindings/perf/riscv%2Cpmu.yaml
[4] https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-pmu.adoc

To: Paul Walmsley <pjw@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
To: Atish Patra <atish.patra@linux.dev>
To: Anup Patel <anup@brainfault.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Namhyung Kim <namhyung@kernel.org>
To: Jiri Olsa <jolsa@kernel.org>
To: Ian Rogers <irogers@google.com>
To: James Clark <james.clark@linaro.org>
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-perf-users@vger.kernel.org

Signed-off-by: Atish Patra <atishp@meta.com>

Changes in v7:
- Fixed various issues pointed by Sashiko. 
- Rebased on top of v7.1
- Added a separate patch to fix various memory leak issues in probe error path
- Link to v6: https://lore.kernel.org/r/20260608-counter_delegation-v6-0-285b72ed65a9@meta.com

Changes in v6:
- Reverted the file name changes as suggested by Will. Now pmu-sbi.c will continue
  to support both counter delegation and SBI PMU with different function prefixes.
- No longer depends up old upstream patch for reusing the Counter property to
  encode event to counter mapping property. It directly uses additional field in
  json event fields similar to other architectures.
- Added few test patches (not intended for upstreaming) to show case different
  possibilities of providing mapping/event encodings.
- Fixed review comments and miscellenous minor typos/fixes on v5
- Rebased on top of v7.1-rc6

Changes in v5:
- Fixed dt_binding_check errors.
- Added the ISA extension dependancy for counter delegation extensions.
- Replaced the boolean variables with static key conditional check required at boot time.
- Miscellaneous minor code restructuring.
- Link to v4: https://lore.kernel.org/r/20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com

Changes in v4:
- Added ISA dependencies as per dt schema instead of description.
- Fixed few compilation issues due to patch reordering in v3.
- Link to v3: https://lore.kernel.org/r/20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com

Changes in v3:
- Fixed the dtb binding check failures.
- Inlcuded the fix reported by Rajnesh Kanwal for guest counter overflow.
- Rearranged the overflow handling more efficiently for better modularity.
- Link to v2: https://lore.kernel.org/r/20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com

Changes in v2:
- Dropped architecture specific overrides for event encoding.
- Dropped hwprobe bits.
- Added a vendor specific event encoding table to support vendor specific event
  encoding and counter mapping.
- Fixed few bugs and cleanup.
- Link to v1: https://lore.kernel.org/r/20240217005738.3744121-1-atishp@rivosinc.com

---
Atish Patra (19):
      RISC-V: perf: fix resource cleanup on driver probe failure
      RISC-V: Add Sxcsrind ISA extension definition and parsing
      dt-bindings: riscv: add Sxcsrind ISA extension description
      RISC-V: Define indirect CSR access helpers
      RISC-V: Add Smcntrpmf extension parsing
      dt-bindings: riscv: add Smcntrpmf ISA extension description
      RISC-V: Add Ssccfg/Smcdeleg ISA extension definition and parsing
      dt-bindings: riscv: add Counter delegation ISA extensions description
      RISC-V: perf: Restructure the SBI PMU code
      RISC-V: perf: Modify the counter discovery mechanism
      RISC-V: perf: Add a mechanism to defined legacy event encoding
      RISC-V: perf: Implement supervisor counter delegation support
      RISC-V: perf: Use config2/vendor table for event to counter mapping
      RISC-V: perf: Add legacy event encodings via sysfs
      RISC-V: perf: Add Qemu virt machine events
      tools/perf: Support event code for arch standard events
      tools/perf: Add RISC-V CounterIDMask event field
      TEST(do-not-upstream): fake qemu-virt PMU events for cdeleg counter-mask testing
      TEST(do-not-upstream): fake qemu vendor JSON + mapfile entry for CounterIDMask path

Charlie Jenkins (1):
      RISC-V: perf: Skip PMU SBI extension when not implemented

Kaiwen Xue (2):
      RISC-V: Add Sxcsrind ISA extension CSR definitions
      RISC-V: Add Sscfg extension CSR definition

 .../devicetree/bindings/riscv/extensions.yaml      |   63 ++
 arch/riscv/include/asm/csr.h                       |   57 +
 arch/riscv/include/asm/csr_ind.h                   |   44 +
 arch/riscv/include/asm/hwcap.h                     |    7 +
 arch/riscv/include/asm/vendorid_list.h             |    4 +
 arch/riscv/kernel/cpufeature.c                     |   27 +
 drivers/perf/Kconfig                               |   14 +-
 drivers/perf/riscv_pmu_sbi.c                       | 1095 ++++++++++++++++----
 include/linux/perf/riscv_pmu.h                     |    5 +
 .../perf/pmu-events/arch/riscv/arch-standard.json  |   10 +
 tools/perf/pmu-events/arch/riscv/mapfile.csv       |    1 +
 .../pmu-events/arch/riscv/qemu/virt/events.json    |   26 +
 tools/perf/pmu-events/jevents.py                   |    7 +-
 13 files changed, 1155 insertions(+), 205 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20240715-counter_delegation-628a32f8c9cc

Best regards,
-- 
Atish Patra <atishp@meta.com>


