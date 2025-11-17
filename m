Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82099CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mQPdbRFOlFRQV2M3CnpwjihoUC+ROTyADJUsM+cRT4o=; b=2XHOSDvb9jGFrf219y8rpSSls8
	Njy279WidV2YX5hfXppWtjzz1EoP3amNtmbTQS/AgQ8142hjXuIep2yZpYX/Vw3fl4tM+bZJNqEWs
	rHRCyg8ttZ/IKHxuur5jWMKq8IlduZ8R+ISmTlvJsbPOCIKeQi1J4/7Sj6eASS1ca7bWLZKzkMgJM
	2n2xjkU60b0Tv7wjgnA8nZCOZ+UPOPIXe2f8OlM3w/QIevoaLyYeL/iGPsfk79FWzWD9lIIV5hJnW
	n7hYoo+ypCw2uA7xIIMVMFVB6k1xG+SS7kW4QamJz+A6y2q3+31F4BQLlP/qVol1WNuqJQhSDFaex
	zX2gaZJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4H9-0000000GdPe-1iiG;
	Mon, 17 Nov 2025 18:48:31 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4H6-0000000GdOL-32dV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 18:48:30 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-429cbed2b8fso1878788f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763405306; x=1764010106; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mQPdbRFOlFRQV2M3CnpwjihoUC+ROTyADJUsM+cRT4o=;
        b=rZ4TVQqcctgNpxOnlFM8qsnMxvzdu0kQeEvLaHOQiSNLX2BT52EslwAVlPUN4dru8Z
         SXJdKPQtfGuYR6wcEbelY/lCZAhhgQMafHsCb05kxe2OnPnTNVXl28jYApoKWvJYXU8C
         lzSTaZzC0WzhjCglbIEiAFrDfoWrOIjn5241lAp7r7zbR3WO+7EoyzwApwy440XyODgn
         1MYELq81mwUffqn7Tebv3cwKwytpMWh+jXkYoAeDI844TIIigewYXyG/2bnv3dsEKKPo
         g7QRknAV/wQpGcjrJlsC4hqUQ6v8YQ1ggi2qNdn3iu+MSbwwl7NrsnOlL2QIvxGk/lu1
         otdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763405306; x=1764010106;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQPdbRFOlFRQV2M3CnpwjihoUC+ROTyADJUsM+cRT4o=;
        b=m0JOafKgLM/sySiA6mftm9/RG9MXrZfv7WsbVpRnMnwE0beCiXWL26m+QScEcf2pk+
         BwrOjXuZxIDH3JTXISHwJgyIH/j+GHgGtPFhYCo7BIQlCrL96Enjdk3PoA85BCNG6I5S
         6SpIBATMRN5q8dbRYqyjoCf+XkxGloWB2rNF6l+AhEFKgh/Y8h/86vaxPkkLY5xgbKDq
         CBOgi29EU8ykf3Ez093i8+TqBkX0SH28XsWdodriXSgqTkcRJgRNY73YmkAKb7Zb4aQJ
         oi5e51W1MQOqlOLFI7H+OxSeP8irjVvf9xYM2BrBtMPk5WQtg2WtxUZPM9bUSOND2472
         nMOA==
X-Gm-Message-State: AOJu0YyelHKDaLY7/3oYYiilZORYQNe30RlyCiuT8xaJbixLUnlsJFyt
	pqybVBhQaEHYCIUl3sXEZUiYATUwgtbzHcoq9o86G+vT158qkMp9tTv4I8mN5yX4AEroq37e35f
	VPyG52Yk0tBdbUSRwSQuCL8DHHpi1Dd0TSr3yFCNS53dJjz31SH3esHjalQ8AXP1Qzyi/sKW7Kk
	Een2Vw2sWjG6XVxx5YqUC7jqu6uh9Cc1e5wnQwAPsSiHY8HSyr7uZDb++YSDvxZ+oIRQ==
X-Google-Smtp-Source: AGHT+IH6k0Kpp/PjB+jSzNj/xVrwaT5fMRtpFc9z29ENKIOcBKsGRq+08bxuJJ/JrJdhKeQ4q392SvELM4Y4YA==
X-Received: from wrbee10.prod.google.com ([2002:a05:6000:210a:b0:429:de3f:827d])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2f83:b0:42b:3c3e:5d2e with SMTP id ffacd0b85a97d-42b5932345dmr12287897f8f.1.1763405305694;
 Mon, 17 Nov 2025 10:48:25 -0800 (PST)
Date: Mon, 17 Nov 2025 18:47:47 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251117184815.1027271-1-smostafa@google.com>
Subject: [PATCH v5 00/27] KVM: arm64: SMMUv3 driver for pKVM (trap and emulate)
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_104828_858570_9251FD9B 
X-CRM114-Status: GOOD (  30.91  )
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

This is v5 of pKVM SMMUv3 support with trap and emulate

v1: Implements full fledged pv interface
https://lore.kernel.org/kvmarm/20230201125328.2186498-1-jean-philippe@linar=
o.org/

v2:  Implements full fledged pv interface (+ more features as evtq and s1)
https://lore.kernel.org/kvmarm/20241212180423.1578358-1-smostafa@google.com=
/

v3: Only DMA isolation (using pv)
https://lore.kernel.org/kvmarm/20250728175316.3706196-1-smostafa@google.com=
/

v4: trap and emulate
https://lore.kernel.org/all/20250819215156.2494305-1-smostafa@google.com/

This series is based on the review feedback on v4 + some other
improvements, most notably:
- Add hardening checks in MMIO donation [Will]
- Add missing CMOs for non-coherent SMMU emulation [Will]
- Rely on aux bus to probe the emulated SMMUs, and make the KVM
  driver a platform driver [Jason]
- Replace TLB invalidation macro with inline function [Will]
- Set carevout size from KConfig and cmdline instead of hooks [Will]
- Fix S2 TLB invalidation if SMMUs where disabled
- Re-work command queue emulation to avoid unnecessary MMIO writes to
  make it more efficient.
- Update GBPA emulation to reflect HW state
- Minor cleanups, file renames and rewording of commits

This series applies on iommu-next (includes recent kunit rework)

Design:
=3D=3D=3D=3D=3D=3D=3D

Assumptions:
------------
One of the important points, is that this doesn=E2=80=99t emulate the full
SMMUv3 architecture, but only the parts used by Linux kernel,
that=E2=80=99s why enablement of this (ARM_SMMU_V3_PKVM) depends on
(ARM_SMMU_V3=3Dy) so we are sure of the driver behaviour.

Any new change in the driver will likely trigger a WARN_ON ending up
in panic.

Most notable assumptions:
- Changing of stream table format/size or l2 pointers is not allowed
  after initialization.
- leaf=3D0 CFGI is not allowed
- CFGI_ALL with any value but 31 is not allowed
- Some commands which are not used are not allowed (ex CMD_TLBI_NH_ALL)
- Values set in ARM_SMMU_CR1 are hardcoded and don't change.

Emulation logic mainly targets:

1) Command Queue
----------------
At boot time, the hypervisor will allocate a shadow command queue
(doesn=E2=80=99t need to match the host size) which then sets up in HW, the=
n
it will trap access to

i) ARM_SMMU_CMDQ_BASE
That can only be written when the cmdq is disabled. Then on enable,
the hypervisor will put the host command queue in a shared state to
avoid transition into the hypervisor or VMs. It will be unshared with
the cmdq is disabled

ii) ARM_SMMU_CMDQ_PROD
Trigger emulation code, where the hypervisor will copy the commands
between cons and prod, of the host queue and sanitise them (mostly
WARNs if the host is malicious and issuing commands it shouldn=E2=80=99t)
then eagerly consume them, updating the host cons.

iii) ARM_SMMU_CMDQ_CONS
No much logic, just return the emulated cons + error bits.

2) Stream table
---------------
Similar to the command queue, the first level is allocated at boot
with max possible size, then the hypervisor  will trap access to:
i) ARM_SMMU_STRTAB_BASE/ARM_SMMU_STRTAB_BASE_CFG: Keep track of
   the stream table to put it in a shared state.

On CFGI_STE, the hypervisor will read the STE in scope from the host
copy, shadow L2 pointers if needed and attach stage-2.

3) GBPA
-------
The hypervisor will set GBPA to abort at boot, then any read from the
host will return ABORT and writes are ignored.
If the host tries to clear GBPA, it will look like GBPA is refusing
to update and time out.

Dealing with timers
-------------------
In another series Vincent adds some timer abstractions for tracing in
the hypervisor, after checking and having a discussion with him, it
seems there isn=E2=80=99t enough common base to justify having a dependency
between the 2 series, but it=E2=80=99s possible which ever series lands fir=
st,
the other one might need to adapt to it.
https://lore.kernel.org/all/20250821081412.1008261-17-vdonnefort@google.com=
/

Bisectibility:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
I wrote the patches where most of them are bisectable at run time (so
we can run with a prefix of the series till MMIO emulation, cmdq
emulation, STE or full nested) that was very helpful in debugging,
and I kept it like this to make debugging easier.

Constraints:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
1) Discovery:
-------------
Only device trees are supported at the moment.
I don=E2=80=99t usually use ACPI, but I can look into adding that later.
(not make this series bigger)

2) Errata:
----------
Some HW with both stage-1 and stage-2 but can=E2=80=99t run nested
translation due to some errata, which makes the driver remove
nesting for MMU_700, I believe this is too restrictive.
At the moment KVM will use nesting if advertised. (Or we need
other mechanism to exclude only the affected HW)

3) Shadow page table
--------------------
Uses page granularity (leaf) for memory, that=E2=80=99s because of the lack
of split_block_unmap() logic. I am currently looking into the
possibility of sharing page tables, if that turned complicated (as
expected) it might be worth to re-add this logic

Boot and Probe ordering:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The main SMMUv3 MUST be only bound/probed after KVM fully initialises
so it can set up the MMIO emulation.

The KVM SMMUv3 driver is loaded early before KVM init so it can
register itself, during that point it will probe all the SMMUs from the
platform bus and bind them to the driver.

Then at a later init call it will create an auxiliary device per SMMU,
that the main driver will probe. The main driver still relies on this
device(parent) for all driver activity. (Check comment in patch 14.

Future work
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
1) Sharing page tables will be an interesting optimization, but
   requires dealing with stage-2 page faults (which are handled
   by the kernel), BBM and possibly more complexity.

2) There is currently ongoing work to enable RPM, that will possibly
   enable/disable the SMMU frequently, we might need some optimizations
   to avoid re-shadowing the CMDQ/STE unnecessarily.

3) Look into ACPI support.

4) Some optimizations (as using block mappings for memory)

Patches overview
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The patches are split as follows:

Patches 01-03: Core hypervisor: Add donation for NC, dealing with
               MMIO and arch timer abstraction.
Patches 04-07: Refactoring of io-pgtable-arm and SMMUv3 driver
Patches 09-11: Hypervisor IOMMU core: pagetable management, dabts..
Patches 12-27: KVM SMMUv3 code

Tested on Qemu(S1 only, S2 only and nested)  and Morello board.
Also tested with PAGE_SIZE 4k,16k, and 64k.

A development branch can be found in:
https://android-kvm.googlesource.com/linux/+/refs/heads/pkvm-smmu-v5

Jean-Philippe Brucker (1):
  iommu/arm-smmu-v3-kvm: Add SMMUv3 driver

Mostafa Saleh (26):
  KVM: arm64: Add a new function to donate memory with prot
  KVM: arm64: Donate MMIO to the hypervisor
  KVM: arm64: pkvm: Add pkvm_time_get()
  iommu/io-pgtable-arm: Factor kernel specific code out
  iommu/arm-smmu-v3: Split code with hyp
  iommu/arm-smmu-v3: Move TLB range invalidation into common code
  iommu/arm-smmu-v3: Move IDR parsing to common functions
  KVM: arm64: iommu: Introduce IOMMU driver infrastructure
  KVM: arm64: iommu: Shadow host stage-2 page table
  KVM: arm64: iommu: Add memory pool
  KVM: arm64: iommu: Support DABT for IOMMU
  iommu/arm-smmu-v3-kvm: Add the kernel driver
  iommu/arm-smmu-v3: Support probing KVM emulated devices
  iommu/arm-smmu-v3-kvm: Create array for hyp SMMUv3
  iommu/arm-smmu-v3-kvm: Take over SMMUs
  iommu/arm-smmu-v3-kvm: Probe SMMU HW
  iommu/arm-smmu-v3-kvm: Add MMIO emulation
  iommu/arm-smmu-v3-kvm: Shadow the command queue
  iommu/arm-smmu-v3-kvm: Add CMDQ functions
  iommu/arm-smmu-v3-kvm: Emulate CMDQ for host
  iommu/arm-smmu-v3-kvm: Shadow stream table
  iommu/arm-smmu-v3-kvm: Shadow STEs
  iommu/arm-smmu-v3-kvm: Emulate GBPA
  iommu/arm-smmu-v3-kvm: Support io-pgtable
  iommu/arm-smmu-v3-kvm: Shadow the CPU stage-2 page table
  iommu/arm-smmu-v3-kvm: Enable nesting

 .../admin-guide/kernel-parameters.txt         |    4 +
 arch/arm64/include/asm/kvm_arm.h              |    2 +
 arch/arm64/include/asm/kvm_host.h             |    6 +
 arch/arm64/kvm/Kconfig                        |    7 +
 arch/arm64/kvm/Makefile                       |    2 +-
 arch/arm64/kvm/hyp/include/nvhe/iommu.h       |   21 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |    3 +
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |    2 +
 arch/arm64/kvm/hyp/nvhe/Makefile              |   10 +-
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c         |  130 ++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         |  116 +-
 arch/arm64/kvm/hyp/nvhe/setup.c               |   23 +
 arch/arm64/kvm/hyp/nvhe/timer-sr.c            |   32 +
 arch/arm64/kvm/hyp/pgtable.c                  |    9 +-
 arch/arm64/kvm/iommu.c                        |   44 +
 arch/arm64/kvm/pkvm.c                         |    1 +
 drivers/iommu/Makefile                        |    2 +-
 drivers/iommu/arm/Kconfig                     |    9 +
 drivers/iommu/arm/arm-smmu-v3/Makefile        |    3 +-
 .../arm/arm-smmu-v3/arm-smmu-v3-common-lib.c  |  114 ++
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   |  190 +++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  400 ++----
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  254 ++++
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 1068 +++++++++++++++++
 .../iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h  |   65 +
 .../arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.c |   68 ++
 drivers/iommu/io-pgtable-arm-kernel.c         |  103 ++
 drivers/iommu/io-pgtable-arm.c                |  103 +-
 drivers/iommu/io-pgtable-arm.h                |   30 +
 29 files changed, 2402 insertions(+), 419 deletions(-)
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/iommu.h
 create mode 100644 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
 create mode 100644 arch/arm64/kvm/iommu.c
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.c
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.c
 create mode 100644 drivers/iommu/io-pgtable-arm-kernel.c


base-commit: 3ee8acab4e5038a261a72ea2e6035cff89168010
--=20
2.52.0.rc1.455.g30608eb744-goog


