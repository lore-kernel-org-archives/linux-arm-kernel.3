Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E44C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 17:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUNM+8Bv5Nfzbqa7qDebAIwRc+J2TKyqV+0Ykxi7QjI=; b=XZEljPDlEPPO3omq8vdstVINlr
	yuVBPbveeqXMiCy/zwNO0TmYuPwGRMoCYApxkILX1fjNgSBjEx8BwWwYn0LMj4urdL853qjNQP2gi
	u5EL31e4nTs8ApmRK0BEQNbwcZszJJ9Zz7GL+Lo5mesRha07dlPxoi8NEikmtnd8nQN343831Xeed
	rRhoKr6pzRP7kZR3z+AjERvf9YfDlvIOSDiLXjhF0JgoXi3TNrvHdo8JX5z8As1C9BA7x7Z6ZEqNS
	njGu/yKB30iiyCY1GoT3gHT6g3xbqVZmoWLoD8NlPDlxhZ7mRHcSnIZTsUVrfBhqcV9K993Byz7W9
	EpwFaVmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyvY-00000000hxA-1won;
	Tue, 25 Feb 2025 17:41:04 +0000
Received: from mail-dm6nam04on20600.outbound.protection.outlook.com ([2a01:111:f403:2409::600] helo=NAM04-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyhE-00000000dBW-06rY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:26:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=urumEOebwD9SITutNBsgwCStPWnitLwa5SuuN3jC3ih4Dv7PvgUrVuzCENRAdpeQ3ektjmr18I7okR5rRfeQKMzVgpRtVAfAajT928q1Dj3Smi6Uq0Bxci9xmnozH88u2uE5xDInQNIkvtVjLPBJzAMQ3UHLYEkIFuoSu9qVMVcqW8vMdQztrtA2VODHj87aNz01pBVQM3eAGyDgZ4Cr6u60mce8lJ3Ug8+YcMf+sm88+p9bQbw29JIiq0vp8bC2Iny6as38SJpJ+jM4YvgTEkdnmcxqudH6mLONt8Cc2UoEXVzckOzbxb5Ob2LfUyEbhsFX6EfuQ0PKtU3PBzk57A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUNM+8Bv5Nfzbqa7qDebAIwRc+J2TKyqV+0Ykxi7QjI=;
 b=pt76skWU1IuC1SC6fiBLO/bpvozONKNgcpUZjpThUzaHJkkpV/gNfao32XiahAu2daTxq8NE4760Pc9BSEHGfXC02sQmo53rCuoa4huwe+NbmVRPp1zZ/VzKl7oHYPxt4BB1fvY+jHnXaXUUvDCxw1DOk9Y3IYhh+W3589TJaGZOgFBTPcUK71Yut2FsI6G4gXs64BBpHUh69lSF3h4RoUkez2OJXfYjO/fcyf0HNoE2hveJ9BSywCkWOuB24UQvCGgfKhzD4Oknat+UOu8WEXtWqGPmmdiQparip53kfifrjvhhOSitDqEj/drGu6e6/W5jsxwWKwOXtp3w7w7/eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUNM+8Bv5Nfzbqa7qDebAIwRc+J2TKyqV+0Ykxi7QjI=;
 b=gS3GVBVgYaWHXKbaSSktDSXjbWhlDx3IvRp9M6GI8fqz9zupRj+4wGIckYqDtXdC7ZLwNKugOMuc5msKndZ+VQDBicPilbwCPNzK0oHabUmuhcxQxJekEJ1P8SgfBMf0WAEz2KxjPvKNXSML0fwNzyVucPICv9i0bz73LrEr+K9OUBl4ppEUN2fDuumUZc+wBaXAlHWrB3ExAJomco/uwYbGy26U1xN2cYJeLBV/8+xa2PkWN2l3bLqmhxXg+569/lcdMl8FNmZhg9g/wGGQhvmlbRfTIX5dwTP4l1YhFzZ9efbuAh13jkgx8026vnAy0iwdpN4FnC0FyMGmSw0Opw==
Received: from DM6PR07CA0100.namprd07.prod.outlook.com (2603:10b6:5:337::33)
 by MN0PR12MB5713.namprd12.prod.outlook.com (2603:10b6:208:370::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Tue, 25 Feb
 2025 17:26:09 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:5:337:cafe::70) by DM6PR07CA0100.outlook.office365.com
 (2603:10b6:5:337::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.20 via Frontend Transport; Tue,
 25 Feb 2025 17:26:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.16 via Frontend Transport; Tue, 25 Feb 2025 17:26:09 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 25 Feb
 2025 09:25:55 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 25 Feb
 2025 09:25:55 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 25 Feb 2025 09:25:54 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<will@kernel.org>
CC: <joro@8bytes.org>, <suravee.suthikulpanit@amd.com>,
	<robin.murphy@arm.com>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>, <praan@google.com>,
	<patches@lists.linux.dev>
Subject: [PATCH v8 01/14] iommufd/fault: Move two fault functions out of the header
Date: Tue, 25 Feb 2025 09:25:29 -0800
Message-ID: <14a01d676b06dc7c013edba6961a4c1e9503a4e1.1740504232.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740504232.git.nicolinc@nvidia.com>
References: <cover.1740504232.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|MN0PR12MB5713:EE_
X-MS-Office365-Filtering-Correlation-Id: cfe59fe5-6667-4c96-e8b7-08dd55c17e84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mRuTuulm9wrdzn6jXv4Kv7FRbsmYC8JpZPkrCAs9JHqbhwM4zpGMQjQeBEfX?=
 =?us-ascii?Q?LIV/yX2y/J+2zk2ufgOhHFPXDyPPSQBeiht3kN7AnposRdPYL/Oht9IhjqlA?=
 =?us-ascii?Q?utVXl3QNBnbckglG26/IZ9QVN28nDoWvs1Qru6T4L9nsbuHGrHwi7aNDzg/y?=
 =?us-ascii?Q?r6KMpUjsyXRRqfg9/JrBpEbh2o5OdTnYTB5OxjLkF8mMl/ADOWhB3ZaOZOVa?=
 =?us-ascii?Q?R4brleNk7cwPL7OSD+gSXBpy+eQ72uAJRZAgBYMBkg06nwWxyFRCymvpu9de?=
 =?us-ascii?Q?QrQsPIz70EsCtS9/4xoyrcBFRY1OO5EwzsmSjLKYU6k6yfKMh7bAOthVP1BE?=
 =?us-ascii?Q?5dJK/ESwNnehLipXJ6Szm4DY2jeQymEKLWiFdbHWBj8dt7ArMgBzvpeVWSXf?=
 =?us-ascii?Q?mNzpGnD7uAnE/dzOZkw0kEg0cNnPXN08dpXZ+zg4v3/e8DRMUG3nCRxoAwzT?=
 =?us-ascii?Q?DzW5v92AoQJkg+CBXu7eeuRGrjhLolbwV/Yc1JNpN0W/Lg3oCcuxcBqH48w9?=
 =?us-ascii?Q?eV9seQs/+krHPXUk8dRxIneXhxl9ZWJeZdP07JsldSaE5fvt8LeCg8j/YzVR?=
 =?us-ascii?Q?XiWNizLYMnjDCyI3Jhj1x7htwCaNM5BQeyUcPzeXLzly0VWkUG5m3F5coMAB?=
 =?us-ascii?Q?Fkro7mMtSn0WZI8TjULu//aPZdXvzjSR/DQP3B+by8yXfHK4ISQTuwU9XdN+?=
 =?us-ascii?Q?ypLWaVWNYrao0TmLsjUDIaIuTpoLN5ObC5E7Aodpv+K5a0svj21H7lBChg6n?=
 =?us-ascii?Q?mfjUp3tpBQuIGNdcv6j2P1YeCtjbtR0VpBZX0woQhZDOa4DssuDd34/eSjAL?=
 =?us-ascii?Q?cxSlFIxx1YALWpWslMYFVmVYLU5eR+eZZD7axTqUL3b02DF1i6Q1eOZPflri?=
 =?us-ascii?Q?lBf+GdvTxMsf6ehLiRJ43D7XGn37a2D5o7xXlIgYF94bUMTGRw66R4kCIFCK?=
 =?us-ascii?Q?xec/L/sY2fIgTPabcCSS7zgwCXwBroCvjs8DEHsir7HAvsfefo9tB27lmC4h?=
 =?us-ascii?Q?2e0LSMG+VzZWHbMDCLoWF8BZ0R9vk5NpoEBVVVgYruuZ9XPoLqd3jh95zHN8?=
 =?us-ascii?Q?zyoiSTAOMsZTvJfbaabvNVeM+eqUBk+l+2j+YQTytYaOWWpa9yUO29WgOVpm?=
 =?us-ascii?Q?MUPV7vePFTPSGfqwXroI/0P9ECk5hKtaWUCxd5wi5hWTQtDGESuldS/iNSs2?=
 =?us-ascii?Q?3Nu4J1fxoe32oo7cvuorGMVG8sGIrL4JbJA7AgPxIBlzeW10c16AELk+e1T3?=
 =?us-ascii?Q?BmC/kRASojmrv19+arNru+RSMXlJLJb0zXae8sIuAhaRVN0gI+jWZRQisofc?=
 =?us-ascii?Q?pV+jKrtDoF5IT5I4i6/lKnV3L7bv/3zsCdopUcu8lqJFW7thmdLgR1LkJ/JL?=
 =?us-ascii?Q?Ao1rJdvIlvlQnRasznja8sb8ck5R8yLZ/x6JRp3mZbc1hvQtrh7c+R/JlsR6?=
 =?us-ascii?Q?ixkkNnplHMPD0X9wxqDPirbxWQk1aLqQybWz6jwrPMt1ZuXc6G0wHo8ZcH4g?=
 =?us-ascii?Q?ymd7CuRFpBO3I00=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 17:26:09.4605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe59fe5-6667-4c96-e8b7-08dd55c17e84
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5713
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_092616_080234_0C02720F 
X-CRM114-Status: GOOD (  13.19  )
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

There is no need to keep them in the header. The vEVENTQ version of these
two functions will turn out to be a different implementation and will not
share with this fault version. Thus, move them out of the header.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommufd/iommufd_private.h | 25 -------------------------
 drivers/iommu/iommufd/fault.c           | 25 +++++++++++++++++++++++++
 2 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index 246297452a44..1c58f5fe17b4 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -472,31 +472,6 @@ struct iommufd_fault {
 	struct wait_queue_head wait_queue;
 };
 
-/* Fetch the first node out of the fault->deliver list */
-static inline struct iopf_group *
-iommufd_fault_deliver_fetch(struct iommufd_fault *fault)
-{
-	struct list_head *list = &fault->deliver;
-	struct iopf_group *group = NULL;
-
-	spin_lock(&fault->lock);
-	if (!list_empty(list)) {
-		group = list_first_entry(list, struct iopf_group, node);
-		list_del(&group->node);
-	}
-	spin_unlock(&fault->lock);
-	return group;
-}
-
-/* Restore a node back to the head of the fault->deliver list */
-static inline void iommufd_fault_deliver_restore(struct iommufd_fault *fault,
-						 struct iopf_group *group)
-{
-	spin_lock(&fault->lock);
-	list_add(&group->node, &fault->deliver);
-	spin_unlock(&fault->lock);
-}
-
 struct iommufd_attach_handle {
 	struct iommu_attach_handle handle;
 	struct iommufd_device *idev;
diff --git a/drivers/iommu/iommufd/fault.c b/drivers/iommu/iommufd/fault.c
index c48d72c9668c..29e3a97c73c6 100644
--- a/drivers/iommu/iommufd/fault.c
+++ b/drivers/iommu/iommufd/fault.c
@@ -138,6 +138,31 @@ static void iommufd_compose_fault_message(struct iommu_fault *fault,
 	hwpt_fault->cookie = cookie;
 }
 
+/* Fetch the first node out of the fault->deliver list */
+static struct iopf_group *
+iommufd_fault_deliver_fetch(struct iommufd_fault *fault)
+{
+	struct list_head *list = &fault->deliver;
+	struct iopf_group *group = NULL;
+
+	spin_lock(&fault->lock);
+	if (!list_empty(list)) {
+		group = list_first_entry(list, struct iopf_group, node);
+		list_del(&group->node);
+	}
+	spin_unlock(&fault->lock);
+	return group;
+}
+
+/* Restore a node back to the head of the fault->deliver list */
+static void iommufd_fault_deliver_restore(struct iommufd_fault *fault,
+					  struct iopf_group *group)
+{
+	spin_lock(&fault->lock);
+	list_add(&group->node, &fault->deliver);
+	spin_unlock(&fault->lock);
+}
+
 static ssize_t iommufd_fault_fops_read(struct file *filep, char __user *buf,
 				       size_t count, loff_t *ppos)
 {
-- 
2.43.0


