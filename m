Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B858CFF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 08:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=057XLyBfQUJ2BsGzIphCqL7Kk0+8mETNmOCoiI5FJzM=; b=fxXegkOzSqe5izrMwYv1k0WzQ5
	3gxGuYKEZMGbrytU5YoZb/ihSlGhoUvvFV6ZMFrzOMheAHdxVlXbX338A4z4nEFaXe+G5kJmHxwa4
	6wYPSZytUUGwX3zMPBViRx6ZZ/d664PM3Vai+A5h7Oo6EHtycvNV9p6g9Co/Eejxon5t4UZieuaoh
	kDQeHWjG7/a61A0gqhlnxA0/Zh8V5awBD4C7fP9PanRuyRf74TTHbRVbu8EP+fMGaKoxbCnF1vcSb
	uSqQQfpVqSGCJ5J2ZkoyB0qhhK1Z0nfYYjNsM996/cmWsQAk+BgCx+uMNVohL6P4KhyTS/azQpdqH
	QGxBHZnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHKD-0000000GSNn-1HVv;
	Mon, 27 Apr 2026 08:28:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHKA-0000000GSN3-3MS5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 08:28:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E810740374;
	Mon, 27 Apr 2026 08:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A4D8C19425;
	Mon, 27 Apr 2026 08:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777278493;
	bh=gWkVVxSq7S/AnFhRjhjyX3b4YhmSCwNgWZUHpsa5BLk=;
	h=From:To:Cc:Subject:Date:From;
	b=QFYJ/60lml/EF+AS1cuBMCTd+OGx7qntiObO9eSix7wWQPVNTyR1h0Il6kKbuKBfN
	 rXfEU8BAPOarfboNzoqEJ2teq/TXeJfzZCSpRP80TjnkFPAfp7voeYD0qdGcGYz0+C
	 5J4j/uyftxLSb1ol0w0cffY/KTVm0en2p7InEQTs+MOTO0+YEsWRaGrIDsjFnCC7Wm
	 XEb4yboQMZazA0vZX49sFlalS5vSczzI0lUVA3xgS1YIwwHjkigboaWOT2OR215s5x
	 TJY8IYF4zYA3F+ZL0uKlqqTZZA9REJgWxJ0l4JAbAhshl7AH0yfZWq8Sbkp/uUTFAr
	 tU8pwxLNYP/4w==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: [RFC PATCH v4 00/11] coco/TSM: Arm CCA guest TDISP lock/accept flow with verification and DMA enable
Date: Mon, 27 Apr 2026 13:57:54 +0530
Message-ID: <20260427082805.931832-1-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_012814_879938_B3AB6230 
X-CRM114-Status: GOOD (  17.22  )
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

This patch series implements the TSM ->lock(), ->unlock(), and ->accept()
callbacks required for the TDISP setup with Arm CCA as per as per the RMM
2.0bet1 specification [1].

The series adds the guest-side DA plumbing needed to transition a device
through TDI LOCK and RUN states, verify host-provided evidence against
RMM-provided digests, validate interface-report MMIO mappings, and enable
DMA only after attestation succeeds.

At a high level, the series includes:
- guest TSM callback registration and lock/unlock/accept hooks
- RHI DA helper support for TDI state transitions and object refresh
- host-cached DA object fetch APIs in guest
- RSI_VDEV_GET_INFO digest verification of certificate/VCA/report/measurement
- mapping validation for interface-report ranges and teardown on unlock
- DMA behavior updates for accepted devices (including swiotlb restrictions)
- vdev DMA enable after successful attestation

The series builds upon the TSM framework patches posted at [2]. A git repository
containing all the related changes is available at [3].

Testing / Usage

echo ${DEVICE} > /sys/bus/pci/devices/${DEVICE}/driver/unbind

To transition the device to TDISP LOCK state:
echo tsm0 > /sys/bus/pci/devices/${DEVICE}/tsm/lock

To transition the device to TDISP RUN state:
echo 1 > /sys/bus/pci/devices/${DEVICE}/tsm/accept

echo ${DEVICE} > /sys/bus/pci/drivers_probe

Changes from v3:
https://lore.kernel.org/all/20260312080442.3485633-1-aneesh.kumar@kernel.org
* updated the patches to follow the RMM 2.0bet1 specification
* updated the guest-side DA code to use the renamed identity/protocol digest
  fields and id_index

Changes from v2:
rfc-v2: https://lore.kernel.org/all/20251117140007.122062-1-aneesh.kumar@kernel.org
* rebase to latest kernel and core TSM changes
* Address review feedback.
* Interface report is now collected using core TSM framework
* swiotlb is now considered shared-memory pool and is not allowed to be used by accepted devices.

v1:
rfc-v1: https://lore.kernel.org/all/20250728135216.48084-1-aneesh.kumar@kernel.org

[1] https://developer.arm.com/documentation/den0137/2-0bet1/
[2] https://lore.kernel.org/all/20260303000207.1836586-1-dan.j.williams@intel.com
[3] https://gitlab.arm.com/linux-arm/linux-cca.git cca/topics/cca-tdisp-upstream-rfc-v4

Cc: Alexey Kardashevskiy <aik@amd.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Samuel Ortiz <sameo@rivosinc.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Xu Yilun <yilun.xu@linux.intel.com>

Aneesh Kumar K.V (Arm) (11):
  coco: guest: arm64: Guest TSM callback and realm device lock support
  coco: guest: arm64: Fix a typo in the ARM_CCA_GUEST Kconfig help
    string ("and" -> "an").
  coco: guest: arm64: Add Realm Host Interface and guest DA helper
  coco: guest: arm64: Support guest-initiated TDI lock/unlock
    transitions
  coco: guest: arm64: Refresh interface-report cache during device lock
  coco: guest: arm64: Add measurement refresh via
    RHI_DA_VDEV_GET_MEASUREMENTS
  coco: guest: arm64: Add guest APIs to read host-cached DA objects
  coco: guest: arm64: Verify DA evidence with RSI_VDEV_GET_INFO digests
  coco: guest: arm64: Hook TSM accept to Realm TDISP RUN transition
  coco: arm64: dma: Update force_dma_unencrypted for accepted devices
  coco: guest: arm64: Enable vdev DMA after attestation

 arch/arm64/include/asm/mem_encrypt.h      |   6 +-
 arch/arm64/include/asm/rhi.h              |  59 ++++
 arch/arm64/include/asm/rsi.h              |   1 +
 arch/arm64/include/asm/rsi_cmds.h         |  73 +++++
 arch/arm64/include/asm/rsi_smc.h          |  63 ++++
 arch/arm64/kernel/rsi.c                   |  10 +
 arch/arm64/mm/mem_encrypt.c               |  10 +
 drivers/virt/coco/Makefile                |   2 +-
 drivers/virt/coco/arm-cca-guest/Kconfig   |   9 +-
 drivers/virt/coco/arm-cca-guest/Makefile  |   1 +
 drivers/virt/coco/arm-cca-guest/arm-cca.c | 358 +++++++++++++++++++++-
 drivers/virt/coco/arm-cca-guest/rhi-da.c  | 356 +++++++++++++++++++++
 drivers/virt/coco/arm-cca-guest/rhi-da.h  |  17 +
 drivers/virt/coco/arm-cca-guest/rsi-da.c  | 289 +++++++++++++++++
 drivers/virt/coco/arm-cca-guest/rsi-da.h  |  66 ++++
 include/linux/swiotlb.h                   |   3 +
 kernel/dma/direct.c                       |   8 +
 kernel/dma/swiotlb.c                      |   3 +
 18 files changed, 1326 insertions(+), 8 deletions(-)
 create mode 100644 drivers/virt/coco/arm-cca-guest/rhi-da.c
 create mode 100644 drivers/virt/coco/arm-cca-guest/rhi-da.h
 create mode 100644 drivers/virt/coco/arm-cca-guest/rsi-da.c
 create mode 100644 drivers/virt/coco/arm-cca-guest/rsi-da.h

-- 
2.43.0


