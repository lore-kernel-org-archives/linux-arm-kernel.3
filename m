Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0082CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 11:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=39s63gE+FaRnrwSJ1nF07Frvg2b04cpO6BVgy2OjLZw=; b=Sv8Eo6xsMSq62dL16zpkhX1JWt
	PQrUBeNymS6iN5mosiYGfJqnPrxasbt21YmkJihQhpL9NYZz8YKqE+r2nUKpXrajB97KAa1Uox7Vi
	STGUcPJ+nEztDn0s3xVetvgLEYANM1zsej5TEFVy/2YV25D3g4ehntc2M7wwfMFZm70WZzBBE34lR
	PxNM/N5Srwh6TT7IOw6qE8fuJDinfUqt1Kd7N5Gs9u4hmMJRuzbRbM99l1oFx4F3JuEJ3Fe/bweC9
	tfPv1D4rwCrvOIusdNZSHzB2OIJ6j4ia+j1gKcmiY1AfFQTKFUPsFrFKY+y1Y8iGX6+E+qLdyZjsa
	av1ySpyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIluQ-00000006cVu-10It;
	Fri, 01 May 2026 11:19:50 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIluN-00000006cVW-0Ccx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 11:19:48 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-ba47bfada67so185103666b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 04:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777634384; x=1778239184; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=39s63gE+FaRnrwSJ1nF07Frvg2b04cpO6BVgy2OjLZw=;
        b=FG4Pn1hrddywbcp88Sa3E5tZJazS5w29uN2kolZzImBPVzR3jB0Q0JOrkx7IIlhcy9
         6O94usBA9hjPSuyx0aTzHmYm6DqioRzm7sj+/5Tgkb5EUFQguNm9Kl5un/FFJJz+UW/X
         ldH+TXHn+Lkp6ZKDkrtlYNWlO08ol/ADBRISDr9s+6X2mauFhq4dYHrxOcQyRYLbm8fC
         l8eo4ZxyX06BAacdTs66l1PWzVjQ3alEkCRQLob5gknz+kiZze5F5w6kmlZRzWGjIw0Z
         fXUlIuDK99cZdglgkFrqFD1RDK8NANMgJ4iz2PCiOR91FdDZ2EJLYIrN/reEkYGwt6+f
         xDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634384; x=1778239184;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39s63gE+FaRnrwSJ1nF07Frvg2b04cpO6BVgy2OjLZw=;
        b=ISatAnOD3H42+nXkjgMnMqH/qoidNE7UzpiybC89KqYF+5Iie09QEk6WOjLKqcvdcB
         nF28y5jyA2OgS8kXF0sHjULasWrEx15PwxXIzAb9Tg8O4g04kOpbEFDtJC//aTnZA5WI
         3Gt/ve1gg4dW8U7gZcHsWYibKn6g9vyZI/pAorN+QwAVQgdajetcMpF/LFjgtUwJl30w
         /hLldAp+XrmEF085KJjyRkG3sNVvyQ9vTJMSzzG+u4ozpq039ZWS83HoUgySgvvIqGm1
         MZ4tAmtTNCLws0SIwgqNHbQYY1LqxLnagINigGWw2pr1gob4Z4PeFEiTEUlI9Xu3mASn
         Sdsw==
X-Gm-Message-State: AOJu0YxYEq+QyQpo2BQgvbzonrn83UmqQr5gl2WirIFcSvCLBQ2dbuPu
	7/o01RRbk9zBdduw1CltnjBp+cip8TPH/YsAiJ08niqQr9QREqR3I8pfvsr78ONszns/m8rTcge
	aU1QI2Ky5I4AanDylGhzsC0fyO0XY4pcu8ddgjiMA2TPGGJBMn07CGkb/skqTdH4a/Ho+pFQrkU
	tSePUb0nWlIWi8STWxmtWnwy5ediuoQUD2qXMZDmEUxPz1KXPPPtEttmC88xDRXZB+jA==
X-Received: from ejcqw28.prod.google.com ([2002:a17:906:6a1c:b0:ba5:6ff2:e915])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:980d:b0:bab:ba5a:fcb8 with SMTP id a640c23a62f3a-bbac7e8405emr444971866b.32.1777634384133;
 Fri, 01 May 2026 04:19:44 -0700 (PDT)
Date: Fri,  1 May 2026 11:19:02 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260501111928.259252-1-smostafa@google.com>
Subject: [PATCH v6 00/25] KVM: arm64: SMMUv3 driver for pKVM (trap and emulate)
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	mark.rutland@arm.com, qperret@google.com, tabba@google.com, 
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_041947_157900_267A1C57 
X-CRM114-Status: GOOD (  36.53  )
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

This is v6 of pKVM SMMUv3 support with trap and emulate

v1: Implements full fledged pv interface
https://lore.kernel.org/kvmarm/20230201125328.2186498-1-jean-philippe@linar=
o.org/

v2:  Implements full fledged pv interface (+ more features as evtq and s1)
https://lore.kernel.org/kvmarm/20241212180423.1578358-1-smostafa@google.com=
/

v3: Only DMA isolation (using pv)
https://lore.kernel.org/kvmarm/20250728175316.3706196-1-smostafa@google.com=
/

v4: Trap and emulate
https://lore.kernel.org/all/20250819215156.2494305-1-smostafa@google.com/

v5: Trap and emulate
https://lore.kernel.org/all/20251117184815.1027271-1-smostafa@google.com/


This series is based on the review feedback on v5 + improvements,
most notably:
- Rebase on ToT which includes the newly merged protected VM support!
- Drop non-coherent support to make the patches smaller, this can be
  added in a later series.
- Re-work the io-pgtable-arm split to rely on iommu-pages [Jason]
- Use the newly added clock for tracing instead of adding new
  functions in the hypervisor.
- Align nesting support with the upstream driver in terms of
  supported IPs [Jason]
- Keep STE hiltless updating when possible [Jason]
- Move some of the refactored code to the c file [Jason]
- Add support for evtq and priq tracking
- Add extra hardening checks, handle failures and massively reduce the
  amount of WARN_ONs and other cleanups.
- Don=E2=80=99t enforce DMA isolation to not regress pKVM booting.

Notes about Sashiko
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
I ran Sashiko locally and it was helpful in discovering problems in
the series. However, it still shows large number of critical and high
severity issues, I went through them and I believe they are false
positive, mainly because (in the order of frequently reported):
- It doesn=E2=80=99t understand de-privilege and which data is trusted that
  the driver populated at boot (keeps complaining about missing checks
  for zero mmio size..)
- It doesn=E2=80=99t understand WARNs are fatal in the hypervisor.
- It doesn=E2=80=99t understand that a malicious host can DoS the system an=
d
  pKVM doesn=E2=80=99t guarantee availability
- It doesn=E2=80=99t understand the SMMUv3 spec and makes stuff up (eg.  ab=
out
  CMD_SYC CS field it makes up an non-existent encoding or wrong
  semantics for the gbpa register)
- It seems to look at one patch at a time and not the whole series, and
  as the series is written in a way to be bisectable that confuses it.
- Sometimes it complains about code which is not related to the change.

Fuad is currently working on updating review prompts to make it work better
with protected KVM [1]

Design:
=3D=3D=3D=3D=3D=3D=3D
Assumptions:
------------
One of the important points, is that this doesn=E2=80=99t emulate the full
SMMUv3 architecture, but only the parts used by Linux kernel,
that=E2=80=99s why enablement of this (ARM_SMMU_V3_PKVM) depends on
(ARM_SMMU_V3=3Dy) so we are sure of the driver behaviour.

Any new change in the driver will likely trigger a WARN_ON ending up
in panic, that will require to support also in the hypervisor.

Most notable assumptions:
- Changing of stream table format/size or l2 pointers is not allowed
  after initialization.
- leaf=3D0 CFGI is not allowed.
- CFGI_ALL with any value but 31 is not allowed.
- Some commands which are not used are not allowed.
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

4) EVTQ and PRIDQ
No shadowing needed for those queues, but the hypervisor needs to keep
track of them to put them in a shared state so they can=E2=80=99t be used b=
y
the host or the hypervisor.

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

1) Shadow page table
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

3) Add support for non-coherent SMMUs

4) Optimizations (as using block mappings for memory)

Patches overview
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The patches are split as follows:

Patches 01-02: Core hypervisor: Dealing with MMIO and timers.
Patches 04-06: Refactoring of io-pgtable-arm and SMMUv3 driver.
Patches 07-10: Hypervisor IOMMU core: pagetable management, dabts.
Patches 11-25: KVM SMMUv3 code.

Tested on Lenovo IdeaCentre mini X and Qemu.

A development branch can be found at [2]

[1] https://github.com/ftabba/review-prompts/commits/local-arm64-kvm/
[2] https://android-kvm.googlesource.com/linux/+/refs/heads/pkvm-smmu-v6


Jean-Philippe Brucker (1):
  iommu/arm-smmu-v3-kvm: Add SMMUv3 driver

Mostafa Saleh (24):
  KVM: arm64: Generalize trace clock
  KVM: arm64: Donate MMIO to the hypervisor
  iommu/arm-smmu-v3: Split code with hyp
  iommu/arm-smmu-v3: Move TLB range invalidation into common code
  iommu/arm-smmu-v3: Move IDR parsing to common functions
  iommu/io-pgtable-arm: Rework to use the iommu-pages API
  KVM: arm64: iommu: Introduce IOMMU driver infrastructure
  KVM: arm64: iommu: Shadow host stage-2 page table
  KVM: arm64: iommu: Add memory pool
  KVM: arm64: iommu: Support DABT for IOMMU
  iommu/arm-smmu-v3-kvm: Add the kernel driver
  iommu/arm-smmu-v3-kvm: Probe SMMU HW
  iommu/arm-smmu-v3-kvm: Add MMIO emulation
  iommu/arm-smmu-v3-kvm: Shadow the command queue
  iommu/arm-smmu-v3-kvm: Add CMDQ functions
  iommu/arm-smmu-v3-kvm: Emulate CMDQ for host
  iommu/arm-smmu-v3-kvm: Shadow stream table
  iommu/arm-smmu-v3-kvm: Shadow STEs
  iommu/arm-smmu-v3-kvm: Share other queues
  iommu/arm-smmu-v3-kvm: Emulate GBPA
  iommu/io-pgtable-arm: Support io-pgtable-arm in the hypervisor
  iommu/arm-smmu-v3-kvm: Shadow the CPU stage-2 page table
  iommu/arm-smmu-v3-kvm: Enable nesting
  KVM: arm64: Add documentation for pKVM DMA isolation

 .../admin-guide/kernel-parameters.txt         |    4 +
 Documentation/virt/kvm/arm/pkvm.rst           |   19 +-
 arch/arm64/include/asm/kvm_host.h             |    6 +
 arch/arm64/kvm/Makefile                       |    2 +-
 arch/arm64/kvm/hyp/include/nvhe/clock.h       |   11 +-
 arch/arm64/kvm/hyp/include/nvhe/iommu.h       |   23 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |    4 +
 arch/arm64/kvm/hyp/nvhe/Makefile              |   13 +-
 arch/arm64/kvm/hyp/nvhe/clock.c               |   44 +-
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c         |  156 ++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         |  169 ++-
 arch/arm64/kvm/hyp/nvhe/setup.c               |   20 +
 arch/arm64/kvm/hyp/nvhe/trace.c               |    4 +-
 arch/arm64/kvm/hyp/pgtable.c                  |    9 +-
 arch/arm64/kvm/iommu.c                        |   57 +
 arch/arm64/kvm/pkvm.c                         |    1 +
 drivers/iommu/arm/Kconfig                     |    9 +
 drivers/iommu/arm/arm-smmu-v3/Makefile        |    3 +-
 .../arm/arm-smmu-v3/arm-smmu-v3-common-lib.c  |  224 +++
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   |  232 +++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  387 +----
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  150 ++
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 1250 +++++++++++++++++
 .../iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h  |   67 +
 drivers/iommu/io-pgtable-arm.c                |   68 +-
 drivers/iommu/io-pgtable-arm.h                |    6 +
 drivers/iommu/iommu-pages.h                   |   99 ++
 27 files changed, 2668 insertions(+), 369 deletions(-)
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/iommu.h
 create mode 100644 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
 create mode 100644 arch/arm64/kvm/iommu.c
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.c
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h

--=20
2.54.0.545.g6539524ca2-goog


