Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF70C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hhGx+xAF/2J8sUbLKF7FIonkESkSwlZZju/0Lpo+izs=; b=wKL3v9qdqHY/0MF31L57EtbmtI
	FrpBXzQIHa9KzoACvr9+InWgMrN/ij6VA2PPYoRs2q4/J6Jkf+xTyDbIKU3xLsZsSg5Biihrl3qN7
	eITPORyJXuMFHTibbSvek88jgtOQLSDgA6XDhdwe7RvShq+9oMaTDV4Kq1amLi1gvW3oqHHYK5Cb6
	PweeXwTfCZGiOXvob6ttyX/4b6EBtower483pN68z8y1JivKgLj5Cg7QlWcatdo7pYGxJFyYaG4IO
	Ed54H4yilWE1dQXbwUHyowHbxvDJ+zWz3RxlCcgS1xD6GSjfgFSHT3VtbqDr3DdG2s6VH5/tpZb9z
	pR5PvEVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGRD-00000008IcT-26zL;
	Wed, 12 Feb 2025 17:22:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGJr-00000008Gy4-2aGw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 17:14:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3981A12FC;
	Wed, 12 Feb 2025 09:14:57 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A45F53F5A1;
	Wed, 12 Feb 2025 09:14:34 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: will@kernel.org,
	maz@kernel.org,
	catalin.marinas@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	aneesh.kumar@kernel.org,
	steven.price@arm.com,
	suzuki.poulose@arm.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Christoph Hellwig <hch@lst.de>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: [PATCH 0/1] arm64: realm: Fix DMA address for devices
Date: Wed, 12 Feb 2025 17:14:10 +0000
Message-ID: <20250212171411.951874-1-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_091439_739545_556B43B7 
X-CRM114-Status: GOOD (  17.35  )
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

Linux can be run as a Confidential Guest in Arm CCA from Linux v6.13. The address
space (GPA or IPA) of a Realm VM is split into two halves, with private bottom
half and shared top half. In Linux we treat the "top" bit of the IPA space as
an attribute, to indicate whether it is shared or not (MSB == 1 implies shared).
Stage2 (GPA to PA) translations used by the CPU accesses, cover the full IPA space,
and are managed by RMM. The "top" bit as attribute is only a software construct.

At present any device passed through to a Realm is treated as untrusted and the
Realm uses bounce buffering for any DMA, using the "decrypted" (shared) DMA
buffers (i.e., IPA with top bit set). In Linux, we only send the "DMA" address
masking the "top" bit. In Arm CCA, SMMU for untrusted devices are managed by the
non-secure Host and thus it can be confusing for the host/device when an unmasked
address is provided. Given there could be other hypervisors than Linux/KVM
running Arm CCA guests, the Realm Guest must adhere to a single convention for
the DMA address. This gets further complicated when we add support for trusted
devices, which can DMA into the full Realm memory space, once accepted. Thus,
a DMA masked address (with "top" bit lost) will prevent a trusted device from
accessing a shared buffer.

Thus Arm has decided to standardise the DMA address used by the Realm to include
the full IPA address bits (including the "top" bit, which Linux uses as as attribute).

This patch implements this in Linux by hooking into the phys_to_dma and vice versa
for providing the appropriate address. This also implies that the VMMs must
take care to :
 1. Create the S2-SMMU mappings for VFIO at the "unprotected" alias.
 2. Always mask the "top" bit off any IPA it receives from the Realm for DMA.

KVM is not affected. A kvmtool branch with the changes above is available here [1].
There are two patches [2] & [3], that are really required on top of the Arm CCA
support. 

Ideally it would be good to get this backported to stable kernel releases to make
sure that they are compliant.

[1] git@git.gitlab.arm.com:linux-arm/kvmtool-cca.git cca/guest-dma-alias/v1
[2] https://gitlab.arm.com/linux-arm/kvmtool-cca/-/commit/ea37a6eb968abe4c75be4a8a90808714657c2ef7
[3] https://gitlab.arm.com/linux-arm/kvmtool-cca/-/commit/8afd0d5e6a7ee444dd0c1565fe94ecd831054a29

Cc: Will Deacon <will@kernel.org>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Tom Lendacky <thomas.lendacky@amd.com>

Suzuki K Poulose (1):
  arm64: realm: Use aliased addresses for device DMA to shared buffers

 arch/arm64/Kconfig                  |  1 +
 arch/arm64/include/asm/dma-direct.h | 38 +++++++++++++++++++++++++++++
 include/linux/dma-direct.h          | 35 +++++++++++++++++---------
 3 files changed, 62 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm64/include/asm/dma-direct.h

-- 
2.43.0


