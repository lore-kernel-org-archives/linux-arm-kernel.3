Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492BFCCA464
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JU1lV9tx/T7M1GFAZKdqrqY3WCxWSZr50Vo+l73Jmns=; b=HIlVsI/VmGIMDC5zPXZhurNRoD
	dYv9pZiJrFMXiLiADRomKDA1VAvGsBoi1CJH2rUK5slJ1lff3I8m/2GI331kCrSeYV3roF59CAO+A
	U6HA9dW4GQ4rMpDvcYeQp6O39sdBLhBqxV9fR3PLIccNSsRmsUupXBElIpGy3yY3JCXZ7troPcWeo
	IabbSpYbivE9qHzLDZ8sKrnHY+D/mhbmMGaU3NdP+Ms4WyJq70jH1vvrQ3A0BygXGUuThJ/XUIuJ9
	02G+OALbE+F3nzI1+duCgNFCWivNexqQ3sqybaRkiREvkMsOq0pnec9mYebAZRHn80TOU+Vu81Cs+
	caHyJicg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRlL-00000001Hxl-45DS;
	Thu, 15 Oct 2026 20:09:15 +0000
Received: from mail-wr1-x446.google.com ([2a00:1450:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRlJ-00000001Hwo-3h0y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:09:15 +0000
Received: by mail-wr1-x446.google.com with SMTP id ffacd0b85a97d-48af4046a3bso4400380f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 13:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094951; x=1792699751; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JU1lV9tx/T7M1GFAZKdqrqY3WCxWSZr50Vo+l73Jmns=;
        b=M5jWNDckBTKrWUS+SHS39beiKU/NJJR0BtOVhEJpiiH5zHzxcf0uqwFmlzwSY0xS1q
         FxIn2BYV5bTpMe69YFG3v5G+cgMl1ytRpK35SLZ5pEzuR7/2UFFnlR6snvMOiHsFfbDt
         eGt+t9VRtejvezrNH8/KhHsacYm81xdGrF22p+KxP5Ygl+9xy9f+1lhSoOv35c6+tGa4
         b2y7wsO0lShtKyPLrQIP/wSABgIkiiGJnTxmYgp7wlTd7D5Ijl2GdlxWDXFOQGOVEEav
         //pMftYJzmO5UNaPG8dxg8GDrVm9QQDUos6kvzAxW07oPKPm8t6/fYingu4DUWqq+R+X
         6Kug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094951; x=1792699751;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JU1lV9tx/T7M1GFAZKdqrqY3WCxWSZr50Vo+l73Jmns=;
        b=RGPyEn/fpcDtwtrTGE8bOm00uG69J/A/EHe9C/KbRlXvpsb2mU54cjIkI1rrW/jh37
         4SejxNo3N2bTuHSIeodrXiksx05TYsZK5m9ykknj33/xlPbqYSFdGSIKqvPlbI9misH+
         a8sonFQcF8d30ZOWptz9zSxhdqTeIz67MRQJMJPYlg8s2Q7GPm/hR4enstzp3LaIXadR
         mkAMp2mftoM4UizLGMpJf9Mzp2RMYB6y3+4DZVBGD6UKR9BBo3tVN7csWpmWFDODvtfI
         +bLX1a8yZ6s310YNLnNceY/a/v25XlmNIGJRP9mwdgEHMfBNCQRi5qOMRv5wQTuvmHEi
         BEcg==
X-Gm-Message-State: AFq9FYK94qvRAqKK4WZDy2DpO2PrJVxVdb2t7hYUC/N/xTc9lA1o4a6r
	6sL4SnH3jKBu7bo2AmeAAv2iVYxGl2qvgiBQ+OYQi7vtgt02plMJwfi8ViPcLBf0gz1zd+Dtlvv
	umt1ygUmArUcR0maHR/Xafx4uTZg7m5hNy9MHzIwW2yc7PNDmjl0XpDQ5Ju8C33VbyAKFpsYBVy
	briG3SecrTGohQHFSwTrpRuGep1IzOqCjGgG0AsidOxgD2/l+G3OgMbcdNu1Yt0du8ug==
X-Received: from wrpu14.prod.google.com ([2002:adf:f88e:0:b0:489:a3f7:af2d])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:29c3:b0:488:79a2:3232 with SMTP id ffacd0b85a97d-48dbaae446bmr25544669f8f.31.1792094950620;
 Thu, 15 Oct 2026 13:09:10 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:31 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-1-smostafa@google.com>
Subject: [PATCH v9 00/25] KVM: arm64: SMMUv3 driver for pKVM (trap and emulate)
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	nicolinc@nvidia.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_130913_977057_2BB46973 
X-CRM114-Status: GOOD (  31.95  )
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

Changes from v8:
v8: https://lore.kernel.org/all/20260922131259.2975334-1-smostafa@google.co=
m/
- Rebase on iommu/next with the new TLB invalidation rework
- Rename files (Nicolin, Jason)
- Move more IDR parsing logic to common code (Nicolin)
- Move Kconfig and depend on OF (Nicolin)
- IDR0.COHACC must agree with firmware (Nicolin)
- Fix waiting with SEV (Sashiko)
- Drop extra heuristics about carveout size (Nicolin)
- Minor reworks and cleanups

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
I ran Sashiko locally and it was helpful in discovering problems in
the series. However, it still shows large number of critical and high
severity issues, I went through them and I believe they are false
positives, mainly because (in the order of frequently reported):
- It doesn't understand WARNs are fatal in the hypervisor.
- It doesn't understand that a malicious host can DoS the system and
  pKVM doesn't guarantee availability
- It doesn't understand the SMMUv3 spec and makes stuff up (eg. about
  CMD_SYC CS field it makes up an non-existent encoding or wrong
  semantics for the gbpa register)
- It seems to look at one patch at a time and not the whole series, and
  as the series is written in a way to be bisectable that confuses it.

Design:
=3D=3D=3D=3D=3D=3D=3D
Assumptions:
------------
One of the important points, is that this doesn=E2=80=99t emulate the full
SMMUv3 architecture, but only the parts used by Linux kernel.
That=E2=80=99s why enablement of this (ARM_SMMU_V3_PKVM) depends on
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
(doesn't need to match the host size) which then sets up in HW, then
it will trap access to

i) ARM_SMMU_CMDQ_BASE
That can only be written when the cmdq is disabled. Then on enable,
the hypervisor will put the host command queue in a shared state to
avoid transition into the hypervisor or VMs. It will be unshared with
the cmdq is disabled

ii) ARM_SMMU_CMDQ_PROD
Trigger emulation code, where the hypervisor will copy the commands
between cons and prod, of the host queue and sanitise them (mostly
WARNs if the host is malicious and issuing commands it shouldn't)
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

2) Shadow page table
--------------------
Uses page granularity (leaf) for memory, that's because of the lack
of split_block_unmap() logic.

Boot and Probe ordering:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The main SMMUv3 MUST be only bound/probed after KVM fully initialises
so it can set up the MMIO emulation.

The KVM SMMUv3 driver is loaded early before KVM init so it can
register itself, during that point it will probe all the SMMUs from the
platform bus and bind them to the driver.

Then at a later init call it will create an auxiliary device per SMMU,
that the main driver will probe. The main driver still relies on this
device(parent) for all driver activity.

Future work
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
1) Sharing page tables will be an interesting optimization, which was
   discussed at LPC [1]

2) There is currently ongoing work to enable RPM, that will possibly
   enable/disable the SMMU frequently, we might need some optimizations
   to avoid re-shadowing the CMDQ/STE unnecessarily.

3) Add support for non-coherent SMMUs.

4) Optimizations (as using block mappings for memory).

Patches overview
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The patches are split as follows:

Patches 01: Core hypervisor: Dealing with MMIO and timers.
Patches 02-05: Refactoring of io-pgtable-arm and SMMUv3 driver.
Patches 06-09: Hypervisor IOMMU core: pagetable management, dabts.
Patches 10-25: KVM SMMUv3 code.

Tested on Lenovo IdeaCentre mini X and Qemu.

A development branch can be found at [2]

[1] https://lpc.events/event/20/contributions/2555/
[2] https://android-kvm.googlesource.com/linux/+/refs/heads/kvm-smmu-v9

Jean-Philippe Brucker (1):
  iommu/arm-smmu-v3-kvm: Add SMMUv3 driver

Mostafa Saleh (24):
  KVM: arm64: Donate MMIO to the hypervisor
  iommu/arm-smmu-v3: Move Queue and STE functions to header
  iommu/arm-smmu-v3: Move IDR parsing to common functions
  iommu/arm-smmu-v3: Move hitless machinery to common code
  iommu/arm-smmu-v3: Move RangeInval to common code
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
  iommu/arm-smmu-v3-kvm: Invalidate the SMMU TLBs
  iommu/arm-smmu-v3-kvm: Enable nesting
  KVM: arm64: Add documentation for pKVM DMA isolation

 .../admin-guide/kernel-parameters.txt         |    7 +
 Documentation/virt/kvm/arm/pkvm.rst           |   23 +-
 arch/arm64/include/asm/kvm_host.h             |    8 +
 arch/arm64/include/asm/kvm_pgtable.h          |    2 +
 arch/arm64/include/asm/kvm_pkvm.h             |   10 +
 arch/arm64/kvm/Makefile                       |    2 +-
 arch/arm64/kvm/hyp/include/nvhe/iommu.h       |   37 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   10 +
 arch/arm64/kvm/hyp/nvhe/Makefile              |    9 +-
 arch/arm64/kvm/hyp/nvhe/iommu.c               |  157 ++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         |  143 +-
 arch/arm64/kvm/hyp/nvhe/setup.c               |   19 +
 arch/arm64/kvm/hyp/pgtable.c                  |    8 +-
 arch/arm64/kvm/iommu.c                        |   68 +
 arch/arm64/kvm/pkvm.c                         |    1 +
 drivers/iommu/arm/Kconfig                     |   12 +
 drivers/iommu/arm/arm-smmu-v3/Makefile        |    3 +-
 .../arm/arm-smmu-v3/arm-smmu-v3-common-lib.c  |  646 ++++++++
 .../arm/arm-smmu-v3/arm-smmu-v3-common-lib.h  |   54 +
 .../arm/arm-smmu-v3/arm-smmu-v3-pkvm-init.c   |  227 +++
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  |    2 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  756 +--------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |   77 +-
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c    | 1425 +++++++++++++++++
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h    |   89 +
 .../arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.h |   88 +
 drivers/iommu/io-pgtable-arm.c                |   14 +-
 drivers/iommu/io-pgtable-arm.h                |    9 +
 28 files changed, 3190 insertions(+), 716 deletions(-)
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/iommu.h
 create mode 100644 arch/arm64/kvm/hyp/nvhe/iommu.c
 create mode 100644 arch/arm64/kvm/iommu.c
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.c
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.h
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-pkvm-init.c
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.h


base-commit: c233d59828627bfaab750ec5546e81970475f951
--=20
2.56.0.176.g3575e65682-goog


