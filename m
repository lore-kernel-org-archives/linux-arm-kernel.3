Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C32C71135
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 08:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qUPndBHX/DhgeFzfajcvPFX/HRcvZo+v9JzNaViI3Q=; b=4yC2cbnmFFDSAcTMaBbk2d0hBn
	RwsYEe4xeyJXP9uSTcXn2r6QmmR/HAGlARG2mFa+sa9aBq6svM2tIo71tLg7Bloa5/DqYScyOX+/T
	Xc57zKyg5Whgv5HR0SG7e6PCpqqA4grMWrYHuVW056Ds/mbUnp8FuJOM6/YfVnTitCTTtk3IddZ53
	/sNfXt57Pm8HcsYi2+trcxBX5nru1cOuu1mUUNGxeKAjO5cDsrsRAr8xw1Qs1mNJqLnoa4bpVlR43
	YNTvbId7+Zc8URCYZXueSQdXmLrhbXmBcb0kuVu3j+bycxyGuhMoFk45U6lEM+16DVrJKmCVy/CZ4
	Wg1DHpkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQM14-00000000yAH-2H5r;
	Sat, 14 Jun 2025 08:13:30 +0000
Received: from mail-dm6nam11on20623.outbound.protection.outlook.com ([2a01:111:f403:2415::623] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQL7W-00000000reS-1Xn2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 07:16:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AB+Wm2MSj2B4RHtVPcfp0VS1J+ePrxUU8IGJvNtm9CoLsRP4qrZjs/rImeoYWQ2L5LWNlVow9qSeBP+5BTewrzy2sud4Luv85dOgy0ndUZKHI7ejAx/BUx6yngV2h8JPXiq//Mdya/xofUMLaS+rY0KU+jbrr7enkmeK5LLI5kLD4XlQ2568cUY5cPWJjXC8XnXkIFvsXLyVO1nUzsX7u0jqnEPJimHxUFatoDKYnVIOOZSJkg69CiOUuBLBlhx3lLh0MMbuyfJqe1odMm8MLC1Ze9Vu4O8r9GLfYUVyNnHXtXG1dREHKv+BWWcmLmwNnhpl/RzDhmPBngU6FtmkgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qUPndBHX/DhgeFzfajcvPFX/HRcvZo+v9JzNaViI3Q=;
 b=V2xSVJS1+lDOMNZBik0lBTOWTisDxkpsGP5zuFMJ+2PKNGvLPRh8qOgLJW446WZGe1S59FEraZ3SzlEJwxZOQT2PpPqXL/oDSypNiGkmV92jYIb/katKu6VFAck0ULY2uksvXJbDiZlbob9rZVxvKfXt4cUhF5bIHszN343ygwnBnKm9n6gGrqSVbiMJBm6/phWh3cGsbqrstX+BLNpkXn6zSr65Ai8vXYGiflwzD5YdfGP2IQ4VjmlAd5uauIz9PTvAe6YOcYd8ddw0AM1XtjUgTfbOBQzXjMk9cN8uOwBUCbuovJpVEvAkULa4KwfD/N/bQa0QWPNUX0BHt1AIaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qUPndBHX/DhgeFzfajcvPFX/HRcvZo+v9JzNaViI3Q=;
 b=oPfpJCYlw6FqrFIIKArbO6bYNJ734Eehb3L1TnwJZSHpNbETnhO+jZtV73uLgfV9KMHZ6WzvOMhoJ8S/t/lDwQ7hkhnZlf619LVBAy87ZXsXA4FDiQSxILqBwX2ZcUnQziELY1UYGDELbTnE9HSnwsV7Nnc6zt5PhX5QZSWPuqB+sAGkXtn3bCIe2AsTW9Kcqh5kIbZjMIuTuyzmaOyErUoWv/Q9VFxYQrLgXgQ88akRyiWafcnYPHnrfLpq70XNE9DPLlUOLMJTtedDO5LnhpD1CKsxzVJwFDafByUzWwtkSTIWFdJ1qsAAL20HiT4YsgaS4fOx9FULwXZvij8aPg==
Received: from BL1P223CA0031.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::6)
 by MW6PR12MB9018.namprd12.prod.outlook.com (2603:10b6:303:241::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Sat, 14 Jun
 2025 07:15:59 +0000
Received: from BL02EPF0001A0F9.namprd03.prod.outlook.com
 (2603:10b6:208:5b6:cafe::2) by BL1P223CA0031.outlook.office365.com
 (2603:10b6:208:5b6::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.28 via Frontend Transport; Sat,
 14 Jun 2025 07:15:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A0F9.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Sat, 14 Jun 2025 07:15:59 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 14 Jun
 2025 00:15:47 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sat, 14 Jun
 2025 00:15:47 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Sat, 14 Jun 2025 00:15:45 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<will@kernel.org>
CC: <bagasdotme@gmail.com>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<thierry.reding@gmail.com>, <vdumpa@nvidia.com>, <jonathanh@nvidia.com>,
	<shuah@kernel.org>, <jsnitsel@redhat.com>, <nathan@kernel.org>,
	<peterz@infradead.org>, <yi.l.liu@intel.com>, <mshavit@google.com>,
	<praan@google.com>, <zhangzekun11@huawei.com>, <iommu@lists.linux.dev>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <patches@lists.linux.dev>,
	<mochs@nvidia.com>, <alok.a.tiwari@oracle.com>, <vasant.hegde@amd.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>
Subject: [PATCH v6 25/25] iommu/tegra241-cmdqv: Add IOMMU_VEVENTQ_TYPE_TEGRA241_CMDQV support
Date: Sat, 14 Jun 2025 00:14:50 -0700
Message-ID: <35c3f8f83d6bf5544d3982619ff1d7919b67fc07.1749884998.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749884998.git.nicolinc@nvidia.com>
References: <cover.1749884998.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0F9:EE_|MW6PR12MB9018:EE_
X-MS-Office365-Filtering-Correlation-Id: e10c548c-a8df-40bf-4edb-08ddab135026
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AR9/hexqZ+bAQdMiEUeFDcILiecVX3DO/EJLZn9EcuCH0OSjeIprXOH+sXL7?=
 =?us-ascii?Q?0gtXVTET+Z8gzr2bvxIGADpx79++GvSqeKDymxHQi/EBoFne0mE+H3so0Q0D?=
 =?us-ascii?Q?sT7Nqs+XPVXfC7Ic6kAYc4KweQZGoo2gqB8/WsrJtbQSalCWxJDDwuievCd5?=
 =?us-ascii?Q?O7DcpdBsjtVazgJbd6LFcVnhWO7U2QNHXCH0tLs8Q7ybu5aP7OHJkJ5/Ca6l?=
 =?us-ascii?Q?rjsvkbzgVCXwOQN8R55wj2JoUCU3s9AFhD0n174/8oL3YLK6xgI8f3caSW0Y?=
 =?us-ascii?Q?gXs1yoKgc19gd+934Gvao1LROFU8Bub8QETUdzcJZFsGbg+7EapNjBZVTSwS?=
 =?us-ascii?Q?SbmWcwyCJa3Q0o6ZL6yCJmeJBMQRg1kgE5JYFwvNFszcP21QBzhKkjIaaniA?=
 =?us-ascii?Q?ynKS/3mv8vmGdgpLOip1pUmv65QRWYyeyUTvKC9+zBQ4DggxB2KsZzMpKUXG?=
 =?us-ascii?Q?/ZZ8BxVRLoJfSl7Rnreaxit9RhK3NpSL+FI8gCxPDjieidUPpnyg6lNN9ltu?=
 =?us-ascii?Q?b582Ijg/e8IiTvaEYBPNPNoMLVR0QPzXBbBKXc+2NZMoZnL982gSQPGGsdEP?=
 =?us-ascii?Q?S1dZfRctebUKGAk+bFI46QICDcXRcih88IQTHDL2CG2wYuAHkz84iC/WnFmA?=
 =?us-ascii?Q?phLvbSumqRiSuPYQZBRDxx7G4E9UFJ2Q7nEbmiRTy4+k1gTNwcPlr6YRFOas?=
 =?us-ascii?Q?3zwdJbvz8XP9KJfd440K2jebGpnu4yGgnFEZZgf+6/boZlsPyeSJB+HP7YMK?=
 =?us-ascii?Q?SHSqcwRaEBj64ZwPVC9CS+IiTbCTBXPjOXD/zref2SgMBCGGaKQ4l7C0g6MP?=
 =?us-ascii?Q?HUI0i87y3u4vrnpio+bF1q1cNZ7ytPrS+JchyYFD1O8v7UcS+clQHBgaMzmv?=
 =?us-ascii?Q?N7o0CVvjAIEMe9HWfeREC5ia0CrXAcwJyWZShaX2iY8pYOcQ7e2f6dXhE+ja?=
 =?us-ascii?Q?CPO0Rt7O4bI3g7rGyHewhKdWbGcYkLa+Me26IJHp5JZKxAQYE1WxM+i+b9oe?=
 =?us-ascii?Q?5rZ3MSP7f9S4qke9Nmm8QBIOQTZjGnXeif662xXj6WLkWgVAoro3hySOMtEP?=
 =?us-ascii?Q?pcWQE2sF9VwyCn/lOHAZBCLcz5iRKyCRI14P6w4xZQmLLgLjme/UQ4Eec8w2?=
 =?us-ascii?Q?kZ8ypYqRROL7k3CzTUGPck+FerLpT2WP0DjkxragdnhX8T2S1Ksbaq7VzoEJ?=
 =?us-ascii?Q?4J07qCBPrzXojIXckxfkz0BvQ2lTzSrQgMElE0bI8C6/c7VgTV7/mkUeXJ3n?=
 =?us-ascii?Q?9HUwFG044L6bVjO3N0xTcNkR2g1M+zV5HqMkGoiL0L03UqUQ4CsxORakygWD?=
 =?us-ascii?Q?39tZ9LN45pHnxX0LDBfzHJVbWSv4xTzSC30uNvWibg+uW1EDR5NDF0JnocbL?=
 =?us-ascii?Q?v0tC4kKlatkIsATndQP0erx1oLWtujCk7e/oUpGdRpXVvZnWCuVKLezQGF4D?=
 =?us-ascii?Q?p2JH3Q9wzoeRkd2cVmXc0OWxrSA9UgcpLLAjUNcm+wB3/+C4kJTa5n70AtGZ?=
 =?us-ascii?Q?9GmhtKs9i1gztTYRQ9//sG8n2oLFX5O8Ww9X?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2025 07:15:59.1833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e10c548c-a8df-40bf-4edb-08ddab135026
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0F9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_001606_404540_DC249929 
X-CRM114-Status: GOOD (  13.58  )
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

Add a new vEVENTQ type for VINTFs that are assigned to the user space.
Simply report the two 64-bit LVCMDQ_ERR_MAPs register values.

Reviewed-by: Alok Tiwari <alok.a.tiwari@oracle.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 include/uapi/linux/iommufd.h                  | 15 +++++++++++++
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    | 22 +++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
index 1c9e486113e3..a2840beefa8c 100644
--- a/include/uapi/linux/iommufd.h
+++ b/include/uapi/linux/iommufd.h
@@ -1145,10 +1145,12 @@ struct iommufd_vevent_header {
  * enum iommu_veventq_type - Virtual Event Queue Type
  * @IOMMU_VEVENTQ_TYPE_DEFAULT: Reserved for future use
  * @IOMMU_VEVENTQ_TYPE_ARM_SMMUV3: ARM SMMUv3 Virtual Event Queue
+ * @IOMMU_VEVENTQ_TYPE_TEGRA241_CMDQV: NVIDIA Tegra241 CMDQV Extension IRQ
  */
 enum iommu_veventq_type {
 	IOMMU_VEVENTQ_TYPE_DEFAULT = 0,
 	IOMMU_VEVENTQ_TYPE_ARM_SMMUV3 = 1,
+	IOMMU_VEVENTQ_TYPE_TEGRA241_CMDQV = 2,
 };
 
 /**
@@ -1172,6 +1174,19 @@ struct iommu_vevent_arm_smmuv3 {
 	__aligned_le64 evt[4];
 };
 
+/**
+ * struct iommu_vevent_tegra241_cmdqv - Tegra241 CMDQV IRQ
+ *                                      (IOMMU_VEVENTQ_TYPE_TEGRA241_CMDQV)
+ * @lvcmdq_err_map: 128-bit logical vcmdq error map, little-endian.
+ *                  (Refer to register LVCMDQ_ERR_MAPs per VINTF )
+ *
+ * The 128-bit register value from HW exclusively reflect the error bits for a
+ * Virtual Interface represented by a vIOMMU object. Read and report directly.
+ */
+struct iommu_vevent_tegra241_cmdqv {
+	__aligned_le64 lvcmdq_err_map[2];
+};
+
 /**
  * struct iommu_veventq_alloc - ioctl(IOMMU_VEVENTQ_ALLOC)
  * @size: sizeof(struct iommu_veventq_alloc)
diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index ab9c80b4f2e8..c231bdcd5d31 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -294,6 +294,20 @@ static inline int vcmdq_write_config(struct tegra241_vcmdq *vcmdq, u32 regval)
 
 /* ISR Functions */
 
+static void tegra241_vintf_user_handle_error(struct tegra241_vintf *vintf)
+{
+	struct iommufd_viommu *viommu = &vintf->vsmmu.core;
+	struct iommu_vevent_tegra241_cmdqv vevent_data;
+	int i;
+
+	for (i = 0; i < LVCMDQ_ERR_MAP_NUM_64; i++)
+		vevent_data.lvcmdq_err_map[i] =
+			readq_relaxed(REG_VINTF(vintf, LVCMDQ_ERR_MAP_64(i)));
+
+	iommufd_viommu_report_event(viommu, IOMMU_VEVENTQ_TYPE_TEGRA241_CMDQV,
+				    &vevent_data, sizeof(vevent_data));
+}
+
 static void tegra241_vintf0_handle_error(struct tegra241_vintf *vintf)
 {
 	int i;
@@ -339,6 +353,14 @@ static irqreturn_t tegra241_cmdqv_isr(int irq, void *devid)
 		vintf_map &= ~BIT_ULL(0);
 	}
 
+	/* Handle other user VINTFs and their LVCMDQs */
+	while (vintf_map) {
+		unsigned long idx = __ffs64(vintf_map);
+
+		tegra241_vintf_user_handle_error(cmdqv->vintfs[idx]);
+		vintf_map &= ~BIT_ULL(idx);
+	}
+
 	return IRQ_HANDLED;
 }
 
-- 
2.43.0


