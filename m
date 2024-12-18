Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABDFE77183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 05:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WDuiufp77aVXOl4PuOLDm0qTfoWH7sFIXEOcsXwyaA=; b=v3TQdIsapoNn9sOT2jjqZnvEDI
	T/G6OLxXj63VuLPsbeKd6qq9Ytv3askHxGpa1lMF/htesyeTv/HRIka1kd1pXAiZZA4th3RzxNcH+
	Wqg+Rat4V/GiYR0bL6N/zZOZwJsx3SORFVJhPbJcujy/oBxPGiESg8pklGODe0jcXiw75TBVPZRys
	pYXvfHBir0t4DjzSTXV+53VomaB2mEAhTuMVe7XVPn17sbz8xKpDPdylBsPIE6IZp8i4p93+xNfWQ
	aHqqHogArYZiulvhmregLsRSGSrAwGWG7/82SVoXxqCdDCRJ4tfcE7fDFP37ymk755LaYRfSIzNfS
	35qg0y3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNmF2-0000000FbAo-1eZz;
	Wed, 18 Dec 2024 05:05:00 +0000
Received: from mail-bn7nam10on2061e.outbound.protection.outlook.com ([2a01:111:f403:2009::61e] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNmBr-0000000FaAT-3dua
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 05:01:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CHixZb6Nd2vb9rzPQ/CvFI8l44XToEOZuf2DWbrnoOQrfwT0/WyFYbdZCUM5hVDw2U6N3EEmo1YxC5d42DSWTg0WaJMzp8OcAQ9NT4JgXh7c/uAsASkyW3SJdje+mJGDMhuoBj+8y/lSldJpfh3ckxbjx6u8ExYWV+gfDDj2srR3hIQkBm1WcPOWClev+PrZOpM4Qb5nNTjnjnzKLrDiiLVg+VJizzJB/VIL6hMoy2pE4KygSJkD1MSkiIEoauxuAHsQtIkNHrCxbe824d9f+fCQGte7k5GMEovwN0ryMSEY+InaFsyWB2Kv4GC+sQiK4rVUfTyEueCyBrRfg0ejnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WDuiufp77aVXOl4PuOLDm0qTfoWH7sFIXEOcsXwyaA=;
 b=GC5cPVl1nbcf9UoW9IIwesHLixRr1NwCL06gpnFt8k+j8ouYPmuJWvcxi+5bUQDEC1sQITqAz53KgrgBhOHpdLCgS/XEuBFM+U2CwcfStgZDBOn6AEa27szD2VHPQ4+8pEsYnJnb75aeAkznZfIBqY+QPHNcYfgUEp9nWFcbQRUgecGmK2L7ZZCwYJ/K3YpPJ5h0zELGKUXzVG0EI56k1xzTeb2IN95fTmmUODu5P0Q7r5MhPMgsBRlyWVQMYvNwY8/TG/lkFJlnOzXDqAOxi1S6ogn0hzvjuYjiSEMJanag6d9I2zUSMIdKsg0Oj8o/UaP3Hdoa3O/1J4fILZDn8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WDuiufp77aVXOl4PuOLDm0qTfoWH7sFIXEOcsXwyaA=;
 b=XriLG+rJ4nzH/8vtNUu5AQpMq3XPvVt3IrN3JvlVvB+ZEXoNEPEvEe9H/FKfSHF1wqD53LL/eGn7qujzg6xuh2v5Q0FtlzovmVtu+g7m+xF1w76rhhkLdg/TVg/0iVHi74QEMRKKaeYgnJOnjW5vGEhdZMdrvtHxx95Kv/eQDf+D5pJqozFMtnDAflMnZjgAEe6Leh1bYp6eTLOEqpPO93E6jDRKo7k8Ud8ta5TdESbm6x01a1bGzlouiBS426USRRF3jxoluZLAPaZBRMbPjeZMNuWewleE0cdSd1GuDaxCVcCOnFEXCc5YIL5ovHsNMsXuK0OL810n0EyDF248Tw==
Received: from DS7P222CA0015.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::27) by
 SJ0PR12MB7034.namprd12.prod.outlook.com (2603:10b6:a03:449::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Wed, 18 Dec
 2024 05:01:36 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:8:2e:cafe::f7) by DS7P222CA0015.outlook.office365.com
 (2603:10b6:8:2e::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.21 via Frontend Transport; Wed,
 18 Dec 2024 05:01:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.15 via Frontend Transport; Wed, 18 Dec 2024 05:01:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 17 Dec
 2024 21:01:25 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 17 Dec
 2024 21:01:25 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 17 Dec 2024 21:01:23 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <will@kernel.org>
CC: <corbet@lwn.net>, <joro@8bytes.org>, <suravee.suthikulpanit@amd.com>,
	<robin.murphy@arm.com>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>,
	<shuah@kernel.org>, <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>, <patches@lists.linux.dev>
Subject: [PATCH v3 03/14] iommufd/fault: Move iommufd_fault_iopf_handler() to header
Date: Tue, 17 Dec 2024 21:00:16 -0800
Message-ID: <298800fb1997fb9106600d0f5531cdebb0fa3871.1734477608.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1734477608.git.nicolinc@nvidia.com>
References: <cover.1734477608.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|SJ0PR12MB7034:EE_
X-MS-Office365-Filtering-Correlation-Id: 9303208a-e45a-48e0-dac1-08dd1f210cce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QIeJILXhxFWEjbFa+Sx7LJu99Rw5W4El1G2wblNpVPCv62SBi2sCXgfNLdm9?=
 =?us-ascii?Q?LycO6iaxhhT5y3IcY2BrifzFzsf/jpx6apyjJCRUONrjRWSfOsmaxxOYUekJ?=
 =?us-ascii?Q?Bhl3gJNrC4avSSBQaXL2MF5jA3OkTIcTr0AYwqf5JqstQX0Awo0XJZNXZSq7?=
 =?us-ascii?Q?DdmoPKhVQjKYc2AuS13TXqR1P7pIOT/uafauGn0vke64Ki6qv4cJBa5JCSVY?=
 =?us-ascii?Q?H5IxHnHRbG1i4j4P4w4w3RTLIXGAwZiSGpDTSls0Og00Ya+rQaaXfj6HO3CB?=
 =?us-ascii?Q?0UXSWjEtkKdGH+pctTMYc0+ny3DXeOYygpn5oYgimDKgh4zkhYOkjbWzt4IS?=
 =?us-ascii?Q?j268GIiHpZFQmwYwM0pV7fZ1UMtcIYgYqxFPL0q/2DapnpqdaEJDaC5/QYLY?=
 =?us-ascii?Q?LG7dJNWKPxCGOlPSf0IrnzqbTGDUFmc0uxY1I5pbISUu2yncgoAs4cPOqByp?=
 =?us-ascii?Q?21Tq+Y078g111Rtnw//4ohq4jtqewyUNgisaRLedXHLxWaIfKEc9VOHaOhoZ?=
 =?us-ascii?Q?jiZB/3OlKvB4qLA/0d0mZwEuFEg1JtD3hcDchVjoBj60U7OPoPz5JrO0+FFm?=
 =?us-ascii?Q?ZaOxpaJnEUl2PnOnx/AHmdqFD3UAE+7BLkNmHh57koDOnAvA9SAZGybX5kD0?=
 =?us-ascii?Q?evXSr9id6CMHrMDUy87A9OLXEDutEhGEk7anQYwJPp21oFLA25gYdwPf8dA2?=
 =?us-ascii?Q?hBjF62nUfhbYK8KmPaINHALxCG0FwJCb6eYNI/NXvHp0iU5C53NL/5ucmP/R?=
 =?us-ascii?Q?i9UzVEN2Kb6w09rHOnK+/868NIUYenJcxu78TiR90eOd4pO0iwAaZcjenPiF?=
 =?us-ascii?Q?VKgND2OebgQoJWqyZnG5p1DpRvgGzDh+cmxHdcybkJNY0lFzOB5B1g2s4Zg7?=
 =?us-ascii?Q?8dkXztmuWPx+xYHzK3I9IKDJaJSYI4erfM93gZ8E3UDdmHVABA3mwgETrWZE?=
 =?us-ascii?Q?1Dmu4QpVMWvlBatZQ2vzMlvqn4XJOmuDFNM+4X1zCggHJmIy1W5DAQ6fSP5D?=
 =?us-ascii?Q?BB1mTf9RSqOaMxCN38k/q+IIUon0s1xSIfOilSVT8X+DXIweyv7tdAt1HfID?=
 =?us-ascii?Q?YQJjF8LnsVq6mYlX6VHESTo7/pr14ZtnivOiYARNnMxiXgKd4RILKz47vU1h?=
 =?us-ascii?Q?XqW4J3R12LZZnP0zZc8/MWQoj+BCTuuDfFszUeXIfn8DIwi1u57LgYZORDvd?=
 =?us-ascii?Q?iFiApuodxkDYZwvOqxndaRPGxcJ1bqz6Tqo6Sc614GD9SnvfINUXJmU1ytNF?=
 =?us-ascii?Q?bY2bgw9T6QjmKEDVXsES8YDPd39419Cgloj4nEEz8ASgVplctSMwBhgKG1BR?=
 =?us-ascii?Q?3qd++KIDz4fr4PRJMm4hdErLBJJ1AKfZ8ee59/sDoUskaZYvGR+dfK4mvkkH?=
 =?us-ascii?Q?mIjbWuMMam0o7Ba2IP3ngl7C4JzQSzRCmVemPziBAhjpeV2Sg45cjrAXfoeW?=
 =?us-ascii?Q?uL1SbB/dwwaW4ZALpzRHk8dUijmIX8Kyux2dTnctGzKtq9LJ51DaOiHdIiS/?=
 =?us-ascii?Q?7JFVVftc5MCsiSc=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 05:01:36.4649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9303208a-e45a-48e0-dac1-08dd1f210cce
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_210143_904499_1E881C70 
X-CRM114-Status: GOOD (  11.67  )
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

The new vIRQ object will need a similar function for drivers to report the
vIOMMU related interrupts. Split the common part out to a smaller helper,
and place it in the header so that CONFIG_IOMMUFD_DRIVER_CORE can include
that in the driver.c file for drivers to use.

Then keep iommufd_fault_iopf_handler() in the header too, since it's quite
simple after all.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommufd/iommufd_private.h | 20 +++++++++++++++++++-
 drivers/iommu/iommufd/fault.c           | 17 -----------------
 2 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index b6d706cf2c66..8b378705ee71 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -451,6 +451,17 @@ struct iommufd_fault {
 	struct wait_queue_head wait_queue;
 };
 
+static inline int iommufd_fault_notify(struct iommufd_fault *fault,
+				       struct list_head *new_fault)
+{
+	mutex_lock(&fault->mutex);
+	list_add_tail(new_fault, &fault->deliver);
+	mutex_unlock(&fault->mutex);
+
+	wake_up_interruptible(&fault->wait_queue);
+	return 0;
+}
+
 struct iommufd_attach_handle {
 	struct iommu_attach_handle handle;
 	struct iommufd_device *idev;
@@ -469,7 +480,14 @@ iommufd_get_fault(struct iommufd_ucmd *ucmd, u32 id)
 
 int iommufd_fault_alloc(struct iommufd_ucmd *ucmd);
 void iommufd_fault_destroy(struct iommufd_object *obj);
-int iommufd_fault_iopf_handler(struct iopf_group *group);
+
+static inline int iommufd_fault_iopf_handler(struct iopf_group *group)
+{
+	struct iommufd_hw_pagetable *hwpt =
+		group->attach_handle->domain->fault_data;
+
+	return iommufd_fault_notify(hwpt->fault, &group->node);
+}
 
 int iommufd_fault_domain_attach_dev(struct iommufd_hw_pagetable *hwpt,
 				    struct iommufd_device *idev);
diff --git a/drivers/iommu/iommufd/fault.c b/drivers/iommu/iommufd/fault.c
index 1d1095fc8224..d188994e4e84 100644
--- a/drivers/iommu/iommufd/fault.c
+++ b/drivers/iommu/iommufd/fault.c
@@ -433,20 +433,3 @@ int iommufd_fault_alloc(struct iommufd_ucmd *ucmd)
 
 	return rc;
 }
-
-int iommufd_fault_iopf_handler(struct iopf_group *group)
-{
-	struct iommufd_hw_pagetable *hwpt;
-	struct iommufd_fault *fault;
-
-	hwpt = group->attach_handle->domain->fault_data;
-	fault = hwpt->fault;
-
-	mutex_lock(&fault->mutex);
-	list_add_tail(&group->node, &fault->deliver);
-	mutex_unlock(&fault->mutex);
-
-	wake_up_interruptible(&fault->wait_queue);
-
-	return 0;
-}
-- 
2.43.0


