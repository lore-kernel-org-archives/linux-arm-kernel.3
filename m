Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E847C02187
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 23:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4jWpJL3m1B1x7U4cIHota00Kj8/WCnEujqgPgEJRxo=; b=sNwMR3EPK6+LqauKHezbImnI0l
	Vf/F1+L1iN6q9iHlUmXnPlJBwnA0CrTvby95XRinsjTx0CWySbHX78eQRA/YatkT+yUea/3Oh3qo7
	/E7GBV+dC7rLHfmHv5O+pk526R2Re5GtwEsSEYJmeKTAhzLsknTcOnWUOsPErQASnMM07B7gg//bh
	2ChdccYxqN8r0sgJap2kHjSPv/1HlfhgoFKGODZ6iHuaUabERjh49xWLJi1R4QjNH1jyLYrEOrMqJ
	iaCajkNG1Q1im503TOVn+8MPpew36oWD+HeBMh8Y5Z5ss0jDPSLQaclJY2oK6gZ/asZXv71GUyqAZ
	ytQrEBFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZOp-0000000GWKI-2DH7;
	Thu, 16 Jan 2025 23:35:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZCt-0000000GPln-0v6W
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 16 Jan 2025 23:23:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=P4jWpJL3m1B1x7U4cIHota00Kj8/WCnEujqgPgEJRxo=; b=VGtAy5pgthAqF6MF3vpHbg8CuJ
	9RV2tRjsbjBuq1pzRfMLSSOr3TvSb/Mpr1TdRtuRVvBLfjbVfNqvbH7cJZfEKoSD5qOXz0JFC2tBT
	giAXUmgoyDk6+zp+mbkDj72Nv6shjlIsrUlFa1KhkHoOGBzcTtoTCTxeoU9l7nZOvSYVOjIMZEuUH
	kovxVHY1LVnfz5A/Z9o6LhY+Sr8v/yrT7RJiv33FFdv9Zaeuh8HLpsdyasAiJYnZRwRis7eob7hwS
	zrhrIZ38i+9nt2KX+1BD5Aqva61szxuN/Ga6FX3ZlOBVNL+74F/02i8J1GChHsvkkWPT/4Ji50odp
	d3LX/30w==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZCp-0000000BKjo-3yxT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 23:23:21 +0000
Received: from thinkpad-p16sg1.corp.microsoft.com (unknown [20.236.10.66])
	by linux.microsoft.com (Postfix) with ESMTPSA id A6B9620591AA;
	Thu, 16 Jan 2025 15:23:14 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A6B9620591AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1737069794;
	bh=P4jWpJL3m1B1x7U4cIHota00Kj8/WCnEujqgPgEJRxo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ENqnNakSMHsmOehkMhdCS86XVVsyp0OqocXw//ub6IESyVXTwFgTXnVwkrObPMfqe
	 ddnrIOQI27nypt9wuBDgIzGjNWBpQLwdczEJfRH+XqGHgmfklza1bVLj2r4duK9tJE
	 8YtDQmTf6hhwW52FrQB9WbAayAuV27zb5/mL0Bwc=
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
Subject: [PATCH 2/3] iommu: consolidate MSI_IOVA macro definitions
Date: Thu, 16 Jan 2025 15:23:06 -0800
Message-Id: <20250116232307.1436693-3-shyamsaini@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250116232307.1436693-1-shyamsaini@linux.microsoft.com>
References: <20250116232307.1436693-1-shyamsaini@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_232320_363593_2FD5CDE2 
X-CRM114-Status: GOOD (  10.54  )
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

MSI_IOVA* macros are common among different iommu/smu drivers,
so move them to common iommu.h header file.
This doesn't change anything wrt functionality of the IOMMU subsystem.

Suggested-by: Jacob Pan <jacob.pan@linux.microsoft.com>
Signed-off-by: Shyam Saini <shyamsaini@linux.microsoft.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 3 ---
 drivers/iommu/arm/arm-smmu/arm-smmu.c       | 3 ---
 drivers/iommu/virtio-iommu.c                | 2 --
 include/linux/iommu.h                       | 3 +++
 4 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index bd9d7c85576a2..d1713f6bbe6d1 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -502,9 +502,6 @@ static inline unsigned int arm_smmu_cdtab_l2_idx(unsigned int ssid)
 #define ARM_SMMU_POLL_TIMEOUT_US	1000000 /* 1s! */
 #define ARM_SMMU_POLL_SPIN_COUNT	10
 
-#define MSI_IOVA_BASE			0x8000000
-#define MSI_IOVA_LENGTH			0x100000
-
 enum pri_resp {
 	PRI_RESP_DENY = 0,
 	PRI_RESP_FAIL = 1,
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 79afc92e1d8b9..287f8e8d25890 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -49,9 +49,6 @@
  */
 #define QCOM_DUMMY_VAL -1
 
-#define MSI_IOVA_BASE			0x8000000
-#define MSI_IOVA_LENGTH			0x100000
-
 static int force_stage;
 module_param(force_stage, int, S_IRUGO);
 MODULE_PARM_DESC(force_stage,
diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index b85ce6310ddbd..8c8783c8b31be 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -24,8 +24,6 @@
 
 #include "dma-iommu.h"
 
-#define MSI_IOVA_BASE			0x8000000
-#define MSI_IOVA_LENGTH			0x100000
 
 #define VIOMMU_REQUEST_VQ		0
 #define VIOMMU_EVENT_VQ			1
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 38c65e92ecd09..2a26d3e18b24e 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -1505,6 +1505,9 @@ static inline void iommu_debugfs_setup(void) {}
 #ifdef CONFIG_IOMMU_DMA
 #include <linux/msi.h>
 
+#define MSI_IOVA_BASE		0x8000000
+#define MSI_IOVA_LENGTH		0x100000
+
 int iommu_get_msi_cookie(struct iommu_domain *domain, dma_addr_t base);
 
 int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr);
-- 
2.34.1


