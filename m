Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4687C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 22:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XQOB4P9tl5xP8BTMFQTkA/5MgocI9fZkIBoJhuuZIMM=; b=SSxJSoH6hCJf8SpDWoBmNCJzdK
	QGBm7zYRmDZwnb8L+TEoxGUvxsRqFJuHhjRA9Wuq3IzfZcTvRZJPuTSbiAEFTgF/19whlC3eAZeDB
	GtBprTt3uaTb7IGHu6JBXAQY3GgOsF2PLKfwoYv2XGNMoKhBav9LZmDhz8vZcc0vmmllE9RYPQk7Z
	N9Czd4G2frsLvm6WHN6tKa5LKMWEMcl9LiqdElgsFCvIV2YQgtLel9P2T5RCsBPmF/TT4sdnOOXZg
	31/PCjBpBN2M16cES8wdtaryy8NKkbFkTUJSpuw7zStSyQpfSvN2efg1e7i/GYzURiJFVOeSSyU2W
	vFqcWgxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u30qQ-0000000C0hS-2y6g;
	Thu, 10 Apr 2025 22:58:02 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u30jE-0000000BzJr-3saV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 22:50:39 +0000
Received: from thinkpad-p16sg1.corp.microsoft.com (unknown [20.236.10.206])
	by linux.microsoft.com (Postfix) with ESMTPSA id EDD132114DAB;
	Thu, 10 Apr 2025 15:50:34 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EDD132114DAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1744325435;
	bh=XQOB4P9tl5xP8BTMFQTkA/5MgocI9fZkIBoJhuuZIMM=;
	h=From:To:Cc:Subject:Date:From;
	b=St9i/IlObVbj6pZJi6K4m05RyLTZHZvLujb+r7TY89ASvq7FBJpBLSi7ZjiU0ZVzN
	 IIH1/NU3Qc0MZsjrX3TLCrd0llm3w8ouWNCkmNP/L6TKsEaf1MlbMoWtaALEDj9gRn
	 damsdo3DPTHe1skB73yFsOhNmbZcL9NN6x3DkFBI=
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	virtualization@lists.linux.dev
Cc: jgg@ziepe.ca,
	will@kernel.org,
	jacob.pan@linux.microsoft.com,
	eric.auger@redhat.com,
	code@tyhicks.com,
	eahariha@linux.microsoft.com,
	vijayb@linux.microsoft.com
Subject: [PATCH v2 0/3] arm-smmu: select suitable IOVA
Date: Thu, 10 Apr 2025 15:50:27 -0700
Message-Id: <20250410225030.2528385-1-shyamsaini@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_155036_986456_836254D3 
X-CRM114-Status: GOOD (  12.99  )
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
base as a kernel command line parameter.

This patch series aims to address the issue by introducing a new DTS
property, "arm,smmu-faulty-msi-iova" which can be used to hold faulty
MSI IOVA address. This property can be passed to ARM SMMU drivers
via device tree so that the drivers can select appropriate MSI IOVA base
address which doesn't intersect with the faulty MSI IOVA address.

This approach accommodates platforms that do not have the default MSI base address
available for MSI reservation.

[1]: https://lore.kernel.org/lkml/20200914181307.117792-1-vemegava@linux.microsoft.com/

Thanks,
Shyam

---
v2:
- add new dts property to hold faulty MSI IOVA and select appropriate
  MSI IOVA address

v1:
Link: https://lore.kernel.org/linux-iommu/20250116232307.1436693-1-shyamsaini@linux.microsoft.com/

Shyam Saini (3):
  arm-smmu: move MSI_IOVA macro definitions
  arm-smmu: select suitable MSI IOVA
  dt-bindings: iommu: add "arm,smmu-faulty-msi-iova" property

 .../bindings/iommu/arm,smmu-v3.yaml           |  8 +++
 .../devicetree/bindings/iommu/arm,smmu.yaml   |  8 +++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  9 +++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  3 --
 drivers/iommu/arm/arm-smmu/arm-smmu.c         | 10 ++--
 drivers/iommu/virtio-iommu.c                  |  2 -
 include/linux/iommu.h                         | 52 +++++++++++++++++++
 7 files changed, 81 insertions(+), 11 deletions(-)

-- 
2.34.1


