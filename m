Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD66FED2E4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 08:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2mn7IgWsrfE9TYXsKilOXAPBXrLjNm9hA0Gndw7j65w=; b=YBYzX4ISaHsADGSdA7Pq56y4kK
	v8XIOw3zR4hnoQDnZw/V8Y4dFkx67ghJNLXH3weCmfzdUD6UPrh7ViW8pkgcvZVMFrkh9XZ9Uc+1M
	jKls9wfbbN1+HbVkWae3VQSCNzvst3OPpsduWc68H34gaSqLUba4XgrhkUYIh4bpTcffxg9rO1EIm
	kcmy3pglzpDzqmmQ6+Wq383cjmY+NOWZKnrfagFjmRSKKK3mV9DKjAcWM1NN8WMv7ppVWjULJRAlG
	pAWfLX7xKnidJ+JF9QJP4GLMJQkVlxF/921QZXRp0lZlRYWzY8w/ukZ+zmNXz/scmv8lv8v1KWsB3
	RkAWBXDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b2M-0000000DaHl-3sGG;
	Thu, 12 Mar 2026 08:04:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b2M-0000000DaHU-0XC8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 08:04:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C48160131
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 08:04:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2303C116C6;
	Thu, 12 Mar 2026 08:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773302693;
	bh=6ydSDQG+BzDQfX2QG0Xe/FoeSH8DDVA5roiPKs+8xEg=;
	h=From:To:Cc:Subject:Date:From;
	b=mrgTEKG4tbvp0+NYtBCc2J0fDgMyYIOugAJvEjH2E5Ykkd5RG2iNdUvcKmf0aQv9d
	 loZTHceUFNCZjLUWF7xQ3qNKefejCugbkb9Qcx6FZSbAx4x0X7qVXkUcJmaZwUKSUd
	 7oNMXi5+A9t5mvqGyh3wPB8qGvJtjPF/+DNkSWahasUmpsSK8eQGEc4sAmWkKaXNpJ
	 gAAtGHi36KmOiah/5q30fCwEsuuURihPHTRE/Y1AYjxCwTiQO08YQUvIidDGnMb0AO
	 T/kXnJuVZ+kSuKzb6DKcIBNXqYaOcJXfBjmqsJUUx3hymA3L+XSYAPCz4ZQJLYYJ3Q
	 8kP5xpdApk5XA==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Subject: [RFC PATCH v3 00/11] coco/TSM: Arm CCA guest TDISP lock/accept flow with verification and DMA enable
Date: Thu, 12 Mar 2026 13:34:31 +0530
Message-ID: <20260312080442.3485633-1-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
callbacks required for the TDISP setup with Arm CCA as per the RMM ALP17
specification [1].

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

Previous posting:
rfc-v1: https://lore.kernel.org/all/20250728135216.48084-1-aneesh.kumar@kernel.org
rfc-v2: https://lore.kernel.org/all/20251117140007.122062-1-aneesh.kumar@kernel.org

Changes from v2:
* rebase to latest kernel and core TSM changes
* Address review feedback.
* Interface report is now collected using core TSM framework
* swiotlb is now considered shared-memory pool and is not allowed to be used by accepted devices.

[1] https://developer.arm.com/-/cdn-downloads/permalink/Architectures/Armv9/DEN0137_1.1-alp17.zip
[2] https://lore.kernel.org/all/20260303000207.1836586-1-dan.j.williams@intel.com
[3] https://gitlab.arm.com/linux-arm/linux-cca.git cca/topics/cca-tdisp-upstream-rfc-v3

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
 arch/arm64/include/asm/rhi.h              |  58 ++++
 arch/arm64/include/asm/rsi.h              |   1 +
 arch/arm64/include/asm/rsi_cmds.h         |  73 +++++
 arch/arm64/include/asm/rsi_smc.h          |  51 +++
 arch/arm64/kernel/rsi.c                   |  10 +
 arch/arm64/mm/mem_encrypt.c               |  10 +
 drivers/virt/coco/Makefile                |   2 +-
 drivers/virt/coco/arm-cca-guest/Kconfig   |   9 +-
 drivers/virt/coco/arm-cca-guest/Makefile  |   1 +
 drivers/virt/coco/arm-cca-guest/arm-cca.c | 358 +++++++++++++++++++++-
 drivers/virt/coco/arm-cca-guest/rhi-da.c  | 345 +++++++++++++++++++++
 drivers/virt/coco/arm-cca-guest/rhi-da.h  |  17 +
 drivers/virt/coco/arm-cca-guest/rsi-da.c  | 289 +++++++++++++++++
 drivers/virt/coco/arm-cca-guest/rsi-da.h  |  65 ++++
 include/linux/swiotlb.h                   |   3 +
 kernel/dma/direct.c                       |   8 +
 kernel/dma/swiotlb.c                      |   3 +
 18 files changed, 1301 insertions(+), 8 deletions(-)
 create mode 100644 drivers/virt/coco/arm-cca-guest/rhi-da.c
 create mode 100644 drivers/virt/coco/arm-cca-guest/rhi-da.h
 create mode 100644 drivers/virt/coco/arm-cca-guest/rsi-da.c
 create mode 100644 drivers/virt/coco/arm-cca-guest/rsi-da.h

-- 
2.43.0


