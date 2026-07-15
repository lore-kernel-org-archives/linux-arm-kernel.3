Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41277C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 11:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zlkerxj/6cIGFeB/G68zdZ4AXs2hpuxjhC5FAY5cthk=; b=LArxMypfleLMbbQG1kIHFmOdaX
	/2Y236sc9K+2GanQuhjaOvRzxzBHvkF6oLFPKjm4BjAksbu74Q7qiwPrXo3yqBLNCR4CFCesdo045
	r8SOy3l1yG/ZybAJZ9JrKBsINbvhgTARildUN255LLtAJZblhoaQBCV1dISYJvQoOzMpp3rzbQ1ag
	R7x1D/8CaUXqIYg1W3UBPjjSG/gRAzQYQZ5uyuWJRBIy+Exvsqeg0tmQ6ZU0uIgfdfukn7Wt9A66E
	iw0CC4FTmz2ve5F7qgmfsegHYjZatm+Ga6+7NIBFbBDIEw+tS2MxARROAyh/pnjojxMJEZ0He60US
	8BVR1vxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyGm-0000000Ef0I-1CBi;
	Wed, 15 Jul 2026 11:59:20 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyGi-0000000Eey9-3DtO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:59:18 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-493b0fe95b6so34588825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 04:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784116753; x=1784721553; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Zlkerxj/6cIGFeB/G68zdZ4AXs2hpuxjhC5FAY5cthk=;
        b=ZVWE55F0cyV59Q17Fy8kHJt4FcyGbukdpEt5cOmAJiVCOr+9xVebW8UhxXz+gd9Okk
         8k+UcfJj3r9OKYrXJcBYIpc3RTyz9zbKQMyTAftsB2AisMSOMcesYfjGi4fAzxWnaHgp
         CYbMoFwysk8b9qcBR13jmNVLUKvHwc8lcpQ8np//Y9fBJrn/vUE8rh6qpHoqtVz608V5
         NoPflILtEtBS8sZy0dbyH0xH+X4MPMz8kIO9hwnWyPQdGGb41Z3/FiIfkOAISLGHDW2J
         7P3LDO6PqY3eEXXkg43C3lLiWgqg5GF5n8dkY6LXY4wdiVrv5bAu4SClnYhvhDc6aHfT
         f/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784116753; x=1784721553;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zlkerxj/6cIGFeB/G68zdZ4AXs2hpuxjhC5FAY5cthk=;
        b=KQzzlnOUeJJlEE4EEpZQH6Jo+kIi+TqoP8bLVw09eR+hUn/XPI3KJp0vTJOEUScP4j
         qkzTziJeXt1OGJ7sZT2sy6yvVABfRincmD2Cyw0PCUJp8sR3KeBRFGDP3K1T2VFgehHd
         yFiU0FlWBV3kwmtOX9KBL1orMYfIbr9kWxGFY3tzc27NCpaVB6NRqIMDn9fVeW9noOTF
         nXVoEdOMOfe1utLGkFBfIxpg4ao2PZAREATO+DUcbku/FlVNK6OvGtaqQvRJ7SK5TOY+
         BmrpiuY8A4IOCkvCNfnvwL9pxDVU2zZaJho/y3XcARCODP9WcdC7PR6pr98wCcHn9XaY
         3REA==
X-Gm-Message-State: AOJu0YziSm+PQXQObUs+0WDCg5NygkNnSSlCq1imEjBQ+zBlus2Cj66A
	3y/uMr+1LgRGonFCY7cVqesUfuA6693KtEg7HxWLI8vO44AypHyF18wCvamvnilg08JPXSNprqw
	MI3VAbir4LQ9TSU9JTV7E9qVLe92Rtta+yWigiRWwjlPc4doz3gaJdLMbCDBt7rwToeqVvAcqTW
	TUP/mVeS+2Byi1QveBu+QhcNlc0BWGDOQZO+DkU9pgNOOcdt2cn5ZzwoPYGUmjJdtg0w==
X-Received: from wmpq9.prod.google.com ([2002:a05:600c:3309:b0:493:bc2d:feac])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6214:b0:494:1cdd:4f9e with SMTP id 5b1f17b1804b1-4953c27eae2mr25726535e9.31.1784116752796;
 Wed, 15 Jul 2026 04:59:12 -0700 (PDT)
Date: Wed, 15 Jul 2026 11:58:41 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
Message-ID: <20260715115906.2664882-1-smostafa@google.com>
Subject: [PATCH v7 00/24] KVM: arm64: SMMUv3 driver for pKVM (trap and emulate)
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_045916_887978_C29F1D4D 
X-CRM114-Status: GOOD (  34.52  )
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

This is v7 of pKVM SMMUv3 support with trap and emulate

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

v6: Trap and emulate
https://lore.kernel.org/all/20260501111928.259252-1-smostafa@google.com/

This series applies on top of:
https://lore.kernel.org/all/20260713141320.4065600-1-smostafa@google.com/

Main changes:
- Rebase on top of  the new SMMUv3 command queue and io-pgtable-arm rework.=
 [Jason]
- Move IIDR detection to the common code. [Jason]
- Hide ATS from the host. [Jason]
- Convert cmdline parsing to use memparse(). [Vincent]
- Rework page table shadowing logic. [Vincent]
- Rename IOMMU functions to use pkvm prefix [Vincent]
- Use the system timer instead of tracing clock and reduce timeouts [Vincen=
t]
- Fix an issue with stale TLBs introduced in the last version.
- Fix a possible deadlock between host_mmu lock and smmu lock.
- Fix emulation of MSI registers.
- Relax PRIQ/EVTQ emulation.

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

2) Shadow page table
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
Patches 03-05: Refactoring of io-pgtable-arm and SMMUv3 driver.
Patches 06-09: Hypervisor IOMMU core: pagetable management, dabts.
Patches 10-24: KVM SMMUv3 code.

Tested on Lenovo IdeaCentre mini X and Qemu.

A development branch can be found at [1]

[1] https://android-kvm.googlesource.com/linux/+/refs/heads/pkvm-smmu-v7

Jean-Philippe Brucker (1):
  iommu/arm-smmu-v3-kvm: Add SMMUv3 driver

Mostafa Saleh (23):
  KVM: arm64: Add a generic clock
  KVM: arm64: Donate MMIO to the hypervisor
  iommu/arm-smmu-v3: Split code with hyp
  iommu/arm-smmu-v3: Move TLB range invalidation into common code
  iommu/arm-smmu-v3: Move IDR parsing to common functions
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
 Documentation/virt/kvm/arm/pkvm.rst           |   23 +-
 arch/arm64/include/asm/kvm_host.h             |    6 +
 arch/arm64/kvm/Makefile                       |    2 +-
 arch/arm64/kvm/hyp/include/nvhe/clock.h       |    3 +
 arch/arm64/kvm/hyp/include/nvhe/iommu.h       |   24 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |    8 +
 arch/arm64/kvm/hyp/nvhe/Makefile              |   13 +-
 arch/arm64/kvm/hyp/nvhe/clock.c               |   29 +
 arch/arm64/kvm/hyp/nvhe/iommu.c               |  174 +++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         |  133 +-
 arch/arm64/kvm/hyp/nvhe/setup.c               |   24 +
 arch/arm64/kvm/hyp/pgtable.c                  |   11 +-
 arch/arm64/kvm/iommu.c                        |   65 +
 arch/arm64/kvm/pkvm.c                         |    1 +
 drivers/iommu/arm/Kconfig                     |    9 +
 drivers/iommu/arm/arm-smmu-v3/Makefile        |    3 +-
 .../arm/arm-smmu-v3/arm-smmu-v3-common-lib.c  |  184 +++
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   |  233 +++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  343 +----
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  164 ++
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 1326 +++++++++++++++++
 .../iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h  |   77 +
 .../arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.h |   68 +
 drivers/iommu/io-pgtable-arm.c                |   39 +-
 drivers/iommu/io-pgtable-arm.h                |   17 +
 26 files changed, 2679 insertions(+), 304 deletions(-)
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/iommu.h
 create mode 100644 arch/arm64/kvm/hyp/nvhe/iommu.c
 create mode 100644 arch/arm64/kvm/iommu.c
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.c
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.h

--=20
2.55.0.141.g00534a21ce-goog


