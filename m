Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17F2C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 06:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAEJs93SC7bB4T5SXHDyQvp/q2UJcl2xzAJBmjYN8/k=; b=XR0N3uC+2aNKjlteWzJFmcPdVX
	Z7078WJMTJuu4KvVYF56k4D5Il7Yw1p/S4LRUdE3R/4U1I18z0nqqQ25fgQmqexPYFaLZ7LOtAl5O
	EQem/sNNTgHIdMMx0q5y3YeHMbLj9Sy/IJjHUQnVZ/0po8YwTGbfOtB9AeV465Ds447ejj3S8z7wg
	HxePdIHOFU6VLkqtrGXbskIAK+L/qXhodMJj77M1VGPQhrMDrOXRdiizVSWDxNvcxNAmsL0l7rizx
	PKootEI0zPIMZ7FyYYPDMBDGEZknXR0Z2AVBERKcKwuGZQEkbqDwSi0TwEihj9IEY4Ay0IlKOlHU1
	Naa0Kg8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38GY-0000000Cn5Q-2Nq6;
	Fri, 11 Apr 2025 06:53:30 +0000
Received: from mail-sn1nam02on2061f.outbound.protection.outlook.com ([2a01:111:f403:2406::61f] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u381z-0000000CkGb-26r1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 06:38:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUFONY3ErQSFVF35w2CWpE7wHUUJnrdEG/Bf+Cq5y7MDgM2ay+Qekf8dJxcDlhb5qTQ62LPqAjuXF1WyENKicaCkhsylP+z/2tLZvTh6PZv6adpN1kp+y0NA5NfssJAX/KtJ5TDCqWS9WfGv7fPWHJUxFLByCNuJ12+nLTAemQdyzeq/SC2ZlM6Kuf5VStUjGTxRLv3NCIMtGF8MwWaewFe0YsS02vpK3gLYmg0Y7NSa7od4zzcH/Xl8JdoHknVj1dc2NIvpxSsT5eWodVRQn4i5njJhm+WGeKOj2UKfpzQxyUwO25S+4gANRL5P1QBHsXWZrGX1PtbP5oyHB79nFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAEJs93SC7bB4T5SXHDyQvp/q2UJcl2xzAJBmjYN8/k=;
 b=jbkmHYZeb+H7344i2lAE/a5g0mZZh97wZgh+2Cp41DtBCi8VOSaax5fpfWmJWj05xvCjxvwObTQUxlc8oTdyXRXr8DNH8Q65t1WKxoHzurLWM7RRQMwz+mqLfY+6LJ34oTDLOBRayu/FMoA+rHFJ1f2fGUnPqGL8HlflzCZg1c8zLy7n4Ysn0hpwFUOHV7UCB0MXjugINiDuaMQ2UK/khIKCkBJObWaRmWEEiPW8UFYzqNPlhSkEvPcs11QuoC3cF4vrdVxHcjhv5ZO8oqA6KZMXFkiFZdCHxugIhRCKCs27A/6lVoWJOPaOxHGxr1Qi4NteX2O9iG0XgZxUCFemBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sAEJs93SC7bB4T5SXHDyQvp/q2UJcl2xzAJBmjYN8/k=;
 b=Kc6Gw5qojBdoiNAyDr22NK36TeDmHkaaz5N04e0q+Xy9sQac4R+YM8IyNS4OOnrjdgoKm+iERZvGqwmv8t3u0jOerEge+oAQwgJV44vUYAOh9ujvG5K5b6l/J7kDesY9uAe2tR1Z+bWFOlDOc9hg3lKU/JXYsaLYBFzcBBy7qrfi8prvvJIfCclKLgGF1FC8pG38+0q4AJsWJrA1XUSPwyXPxOJ2QGksPXdOPCgyHXXyVZUVd/IPfEvxG06vxMYHF5IanXKct7ISGijJ0OzF4QDya7F0imTuFZUxcgIo2rgiHqm9JafShwdaN+UH27yE1Mcjzr4TsXHQAwPg3JWSqA==
Received: from BYAPR04CA0008.namprd04.prod.outlook.com (2603:10b6:a03:40::21)
 by SN7PR12MB8602.namprd12.prod.outlook.com (2603:10b6:806:26d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Fri, 11 Apr
 2025 06:38:20 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:40:cafe::79) by BYAPR04CA0008.outlook.office365.com
 (2603:10b6:a03:40::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 06:38:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.13 via Frontend Transport; Fri, 11 Apr 2025 06:38:20 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 10 Apr
 2025 23:38:09 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 10 Apr
 2025 23:38:09 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 10 Apr 2025 23:38:07 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<will@kernel.org>
CC: <robin.murphy@arm.com>, <joro@8bytes.org>, <thierry.reding@gmail.com>,
	<vdumpa@nvidia.com>, <jonathanh@nvidia.com>, <shuah@kernel.org>,
	<praan@google.com>, <nathan@kernel.org>, <peterz@infradead.org>,
	<yi.l.liu@intel.com>, <jsnitsel@redhat.com>, <mshavit@google.com>,
	<zhangzekun11@huawei.com>, <iommu@lists.linux.dev>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <patches@lists.linux.dev>
Subject: [PATCH v1 02/16] iommufd/viommu: Allow driver-specific user data for a vIOMMU object
Date: Thu, 10 Apr 2025 23:37:41 -0700
Message-ID: <d357a5d8ec08f5be0182506533f32a500fa3f0dd.1744353300.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744353300.git.nicolinc@nvidia.com>
References: <cover.1744353300.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|SN7PR12MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c59669f-ecaa-4650-7e8e-08dd78c37355
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QAHRFspvsqrzck3pQ7ufmwc3vXzZWQViRBSjhBC7cXQk/GX4tJX4+uVor94S?=
 =?us-ascii?Q?Tud4dDmf05momDTIdghqHk3z6u5QSP851zU3WbHVcU64u8SBQR+Mu3T9wPmm?=
 =?us-ascii?Q?NQXz4wft52MgYxei90NMZv/zmLh6QxrUZshTQNlYXlWJ3A1SrMotal1JQegA?=
 =?us-ascii?Q?xsNNI6BG9eRCByjzsxWJzuQ0tpCmuV2/spGmKeN87/ZskAevl6kITlwK42xE?=
 =?us-ascii?Q?Tq4QD/2TIoFjc1R5MNOg3BR/y3qT3u4XMlwk36ojhCygeIcEdswOqWGkaVlu?=
 =?us-ascii?Q?vkfc7wst+Ac8kCVjVGjbkZ8m578zUMu1TD5vxLfwMinVJLuk3BFl/HwCotBN?=
 =?us-ascii?Q?KN/Fek9MaD7FQVFdDKUsD2yVS0HzbPk4X4T6XK20eJeih/mdgYjpvkz4WyOF?=
 =?us-ascii?Q?yrM7XDEuaLN/pc9qB60jkJSIxqqUCP8v8YtQjApIho0m3HqXdBPP6Xhv9SCe?=
 =?us-ascii?Q?cmrZAopgewQrltY3XQQ+gUpAT/UU+M+BxHQ2zO1xAi/1Y8biVLxQTqzrgbIC?=
 =?us-ascii?Q?m09DQlwzM1j8nQ+wF521o/FOEQZWGkLvav0EiwLX2Gyq9hAm6vaG9ShMlVb5?=
 =?us-ascii?Q?9iJ0R5vuHGaCARhmWweLSOp4paBBW4Hu4fIP6sAxo4GgYENZ7Zw4x980MTF+?=
 =?us-ascii?Q?PHG1/rnJz1wcx1F1lUH22r9/d4aPpPJ6fZWNB9nJDaVcISKeB2okamT+ZKsW?=
 =?us-ascii?Q?8dl/4PwElHvVIWH5RFptAhR8CszCtewXMcS/68MgTeYYpYFDdzRRqlZJcFzc?=
 =?us-ascii?Q?DfN0uTq+Ki8nG9aYmVpVPE2ojHiqtVacwGRXixgss04QnErjFufZLBYMKD0s?=
 =?us-ascii?Q?oop21C6bqIQLxFNVHF14H726pkZsuLurdHMpgzR1W9VYKU/kE6uXGxhnzrVW?=
 =?us-ascii?Q?kFZaT0H9OgSQJAhWcjR/thON6+lH6/LCNL8Sh0SAXvKf1CpQMZ4ntf/+efwr?=
 =?us-ascii?Q?VIDM02cmKL1LsKLhYcxRNRXW85YO1tDvBeg/TSE/zJfgB4B4u4Ua0o7JmZKs?=
 =?us-ascii?Q?edUmUWxnvQHkG8UgV1utJh4oPbBzB6zxgtuh2wyvM5CsH0qBiU26G96D/G9Q?=
 =?us-ascii?Q?PnItiJKwfaIMcbImAUKDSr1NAOH/62dntWwDiRE83TR0QaF/wv78Z7J4VtoQ?=
 =?us-ascii?Q?udhZhrMaM4Cg2AhHr6vLzv9xajP9GZP8B6wkYScrjcDsj+svTCQ5DavFba5L?=
 =?us-ascii?Q?m2qWFH1aUPZumTA2p8qcMIXv6cN0wgEAW8c2+gTNSD/eePSPeG3T/qoIt+BU?=
 =?us-ascii?Q?I8B6/wZe1bLvBpKHLVREcBnRIWFi9GsNsX186t/6qWOIXoLgq0LhwiUbMx5e?=
 =?us-ascii?Q?lKET8oRmkfIB1EG3P/ofuG3djBrKBL02mBNLnVgBhxZVRzR4S0aoM5wXvbmN?=
 =?us-ascii?Q?7mZh/f5TtGwn84ZbVilm4GMuGhbJ2pJ3A0inYbfJhiUq+4yKp4SzLf6QwmU8?=
 =?us-ascii?Q?54ieT/IxEnOc1z2ciXQ7pbUAhs35kqWz80R92stJF4m9qIyWdNyjfZg4G7lq?=
 =?us-ascii?Q?R/drNzIRekgzZukzGXrrVc6VUtbl6hrSFz6X?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 06:38:20.5104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c59669f-ecaa-4650-7e8e-08dd78c37355
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8602
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_233827_544197_2D36011B 
X-CRM114-Status: GOOD (  12.87  )
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

The new type of vIOMMU for tegra241-cmdqv driver needs a driver-specific
user data. So, add data_len/uptr to the iommu_viommu_alloc uAPI and pass
it in via the viommu_alloc iommu op.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 include/uapi/linux/iommufd.h   | 6 ++++++
 drivers/iommu/iommufd/viommu.c | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
index f29b6c44655e..cc90299a08d9 100644
--- a/include/uapi/linux/iommufd.h
+++ b/include/uapi/linux/iommufd.h
@@ -965,6 +965,9 @@ enum iommu_viommu_type {
  * @dev_id: The device's physical IOMMU will be used to back the virtual IOMMU
  * @hwpt_id: ID of a nesting parent HWPT to associate to
  * @out_viommu_id: Output virtual IOMMU ID for the allocated object
+ * @data_len: Length of the type specific data
+ * @__reserved: Must be 0
+ * @data_uptr: User pointer to an array of driver-specific virtual IOMMU data
  *
  * Allocate a virtual IOMMU object, representing the underlying physical IOMMU's
  * virtualization support that is a security-isolated slice of the real IOMMU HW
@@ -985,6 +988,9 @@ struct iommu_viommu_alloc {
 	__u32 dev_id;
 	__u32 hwpt_id;
 	__u32 out_viommu_id;
+	__u32 data_len;
+	__u32 __reserved;
+	__aligned_u64 data_uptr;
 };
 #define IOMMU_VIOMMU_ALLOC _IO(IOMMUFD_TYPE, IOMMUFD_CMD_VIOMMU_ALLOC)
 
diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
index b861ca49d723..3d4d325adeaa 100644
--- a/drivers/iommu/iommufd/viommu.c
+++ b/drivers/iommu/iommufd/viommu.c
@@ -17,6 +17,11 @@ void iommufd_viommu_destroy(struct iommufd_object *obj)
 int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
 {
 	struct iommu_viommu_alloc *cmd = ucmd->cmd;
+	const struct iommu_user_data user_data = {
+		.type = cmd->type,
+		.uptr = u64_to_user_ptr(cmd->data_uptr),
+		.len = cmd->data_len,
+	};
 	struct iommufd_hwpt_paging *hwpt_paging;
 	struct iommufd_viommu *viommu;
 	struct iommufd_device *idev;
@@ -48,7 +53,8 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
 	}
 
 	viommu = ops->viommu_alloc(idev->dev, hwpt_paging->common.domain,
-				   ucmd->ictx, cmd->type, NULL);
+				   ucmd->ictx, cmd->type,
+				   user_data.len ? &user_data : NULL);
 	if (IS_ERR(viommu)) {
 		rc = PTR_ERR(viommu);
 		goto out_put_hwpt;
-- 
2.43.0


