Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0F6C02187
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 23:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NTt6eAeZulOXgSwKKcojtQtTZr5qsec7mtCKAgDqis0=; b=0IVqfYrsmSaYv0pI2cpiHtK+la
	XdIVE2q+ic2erzOfCy+xeccoY+vpDL/3dEoSVBDeYwkG5Gckbm+BSFHOTBZWROynNTmsEk0szllES
	ZQWI8sMc6KylNp+Q/kXW20sdFiwot5zjEKsPHJjct3FBFZQMUo5CSVX7U40fgyEGAtYOs0BzkpFxI
	gnXtKYsiCG0fnve+nm0w+9kcdLPUnj2c6cEG0ZhVRblTZCulL8pz9z/5T8Pz3Kerce+mDeiczzw2F
	KO2W5ssjtv8LVU7/YL7CdwebUG4WD+09YHJtY63gI5o06Kt08bEM+mD21IghVKBJrA6/4Kbl0aPEG
	W/eersRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZNZ-0000000GVbg-3iQY;
	Thu, 16 Jan 2025 23:34:25 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZCm-0000000GPiX-1tyk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 23:23:17 +0000
Received: from thinkpad-p16sg1.corp.microsoft.com (unknown [20.236.10.66])
	by linux.microsoft.com (Postfix) with ESMTPSA id 220C020591A5;
	Thu, 16 Jan 2025 15:23:14 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 220C020591A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1737069794;
	bh=NTt6eAeZulOXgSwKKcojtQtTZr5qsec7mtCKAgDqis0=;
	h=From:To:Cc:Subject:Date:From;
	b=aj9ZpFs/zTz59cSblNi82HiQ8/TWkT0sHEKkMl+c98XoAGr8T8D3xbIBOvEFqeSP6
	 m+1n5yQFhBrkvITROOo+h3x8wDz2Z200t7jCrl64+w4kgPD0bvNN8DFlC+e9GmxCBH
	 1oKkouiPTWwYHCxlxtqfVyvbaq/0dDWUnNtUDYZ0=
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	virtualization@lists.linux.dev
Cc: will@kernel.org,
	jacob.pan@linux.microsoft.com,
	eric.auger@redhat.com,
	code@tyhicks.com,
	eahariha@linux.microsoft.com,
	vijayb@linux.microsoft.com
Subject: [PATCH 0/3] make MSI IOVA base address and its length configurable
Date: Thu, 16 Jan 2025 15:23:04 -0800
Message-Id: <20250116232307.1436693-1-shyamsaini@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_152316_513048_60C88327 
X-CRM114-Status: GOOD (  11.30  )
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

Hi,

Currently, the MSI_IOVA_BASE address is hard-coded to 0x80000000,
assuming that all platforms have this address available for MSI IOVA
reservation. However, this is not always the case, as some platforms
reserve this address for other purposes. Consequently, these platforms
cannot reserve the MSI_IOVA_BASE address for MSI.

There was an [1] attempt to fix this problem by passing the MSI IOVA
base as a kernel command line parameter. In the previous attempt,
Will suggested reserving the MSI IOVA at runtime whenever there is a
conflict with the default MSI_IOVA_BASE. However, dynamically reserving
this address has debuggability concerns, as it becomes difficult to
track IOMMU mapping failures.

This patch series aims to address the issue by introducing a new DTS
property, "arm,smmu-pci-msi-iova-data". This property allows the
configuration of MSI IOVA with a custom MSI base address and a custom
length for IOMMU/SMMU drivers. It accommodates platforms that do not
have the default MSI base address available for MSI reservation.

[1]: https://lore.kernel.org/lkml/20200914181307.117792-1-vemegava@linux.microsoft.com/

Thanks,
Shyam

Shyam Saini (3):
  dt-bindings: iommu: add "arm,smmu-pci-msi-iova-data" property
  iommu: consolidate MSI_IOVA macro definitions
  arm-smmu: use dts passed MSI IOVA address and length

 .../bindings/iommu/arm,smmu-v3.yaml           | 12 +++++
 .../devicetree/bindings/iommu/arm,smmu.yaml   | 12 +++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 10 ++++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  3 --
 drivers/iommu/arm/arm-smmu/arm-smmu.c         | 11 +++--
 drivers/iommu/virtio-iommu.c                  |  8 ++--
 include/linux/iommu.h                         | 44 +++++++++++++++++++
 7 files changed, 86 insertions(+), 14 deletions(-)

-- 
2.34.1


