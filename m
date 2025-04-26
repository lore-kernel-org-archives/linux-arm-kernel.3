Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD3DC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 06:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBQHw8Xt0rd56aXy5FFxAK4V9awrNlFwRIwRMXg6nQA=; b=X/JSanYO9fdh790cV2xXOMip/H
	DsNRVheMcr3K7uMB59J3NJbiPgMVysb23Ptl0SpDRttdhv11cT1CW+DNZuY5zMPqJwOlMl3mqYZtv
	HrHUa/CDkmxcsmxuZl7deRNMS01dm673RiznQ1INzp3/ZZNYWOLHQMCgHxK/ud6EqAVPFrIBy1gnB
	vXlS51q7ZmlfveXUB3AeRu7egudbyKN3lo8PqDl/zgTTFhNzMHdZ19+IM+2jriNkDqGAGHm/7mS07
	M6oNMYAbiBJ0lh8+d3WjDNHW0FrowTN3o26PoWfBaursO1vCzHd1eZoEaUNhMMcGYGG+sDTaUNbEp
	sRPInddQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Yi7-00000001Vw7-08RW;
	Sat, 26 Apr 2025 06:08:23 +0000
Received: from mail-mw2nam04on20629.outbound.protection.outlook.com ([2a01:111:f403:240a::629] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8YZ1-00000001Td2-2EH9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 05:59:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nmmkzf0quNEnslb9Vkpn+2o0+E9w4QVEEBgTL33HtMTHOKk0q/iebXIrYBLtdLd1WjAeYjeNwz6SMCcwqqJ/rqJP1KSou2AsDD+HAurpZb/jGjVy45bvwSy90q4rr+1M+NIzBX1Q33KO5QKlM5PZAtc1StYKcoBC4ZFarDl423DLm7ugBYUunmQssol/RDR1tQoGEuhBss2KlQFqWrEOLaWEvoJDttjbFYDA0rCaLgS+Dbh3/RIz4NmBQfJxzke9Fq7nE0WaFhCplYF6Zpw3Q/6NDjtHEZiPNJsxHBETbYuOXsBga+Hp7mhJWqlD1VDNTHmHJZF9jgohQw+5t70RvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBQHw8Xt0rd56aXy5FFxAK4V9awrNlFwRIwRMXg6nQA=;
 b=Vj54av2Q5swaWMlzdtM1ECX7KeyBlf3a8br2+FIrP4wpW3H4iksIOr6+tsMAs1ICd1b5FProgC6Zo327IOvqnztfG+IlvmKD3FgYNDMHFvmc+Cb2Y2g57s/UeMLNtorC9PbAiEsRqU3QoO9dhQdet+G6YUspKj6QYwlJ/UzOC7e4R5Orkn8Z9KUv9hAwvX5xAEcwjiyvT6TcwhLW0IijBxWapeTUAAQ5xrzjVwD8bDhCfopP663GjirYBl/X5qzjsSd8rAyCftRgDV8/9GHpG/OM88O39hv73UbfnJ4rtmMIr8W5HF68hV9tosq8BEKrn9B1EFx0Id0LVSzy9/Znlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBQHw8Xt0rd56aXy5FFxAK4V9awrNlFwRIwRMXg6nQA=;
 b=H5rmVPatBc/XUi/XQHMP8/t38u2lzO9yY0tBJrhX2q9xrblbUPANuOw3r2nC4NWsHXNDY8AH993yMTA+EgGHW3c1ZE06XB/aSqF3QHfX9h55ibXZb5FiwsBmIolVVufQTD0RTDg6n/oBLiwvCGg5utBO44gKVEzUdzNFnhn05NM504R98aKS0ZTTER/8+l95qbOrF/Fxt2HdKuV06A0TqAKmcdq90co26legahgTlWy/lV0JULFyyu32qKuyKblfceiVi92oQLI8OdHslF7Z3krnFUZ94FXlyAhnhEY8+ZKkPzMiK38pPX0aFShUjCZtbTmrhV1NdRG+SETLdv9u/g==
Received: from DM6PR21CA0020.namprd21.prod.outlook.com (2603:10b6:5:174::30)
 by DS0PR12MB7780.namprd12.prod.outlook.com (2603:10b6:8:152::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Sat, 26 Apr
 2025 05:58:48 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:5:174:cafe::d0) by DM6PR21CA0020.outlook.office365.com
 (2603:10b6:5:174::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12 via Frontend Transport; Sat,
 26 Apr 2025 05:58:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Sat, 26 Apr 2025 05:58:48 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 25 Apr
 2025 22:58:45 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 25 Apr
 2025 22:58:45 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 25 Apr 2025 22:58:42 -0700
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
	<mochs@nvidia.com>, <alok.a.tiwari@oracle.com>, <vasant.hegde@amd.com>
Subject: [PATCH v2 04/22] iommu: Add iommu_copy_struct_to_user helper
Date: Fri, 25 Apr 2025 22:57:59 -0700
Message-ID: <ca032e90c0241fe0653023fcb655185dba763f5f.1745646960.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745646960.git.nicolinc@nvidia.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|DS0PR12MB7780:EE_
X-MS-Office365-Filtering-Correlation-Id: b4a9574d-3084-4077-d712-08dd848769c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zjpSePAVfmcPxQJoQSVG8+RtPiG7FW9cvDX6uKOVYcULnFTKYQyzgrjmv1+D?=
 =?us-ascii?Q?7sAriNxtFGrmTGr0Dj38OBxHZZ5kS7LJG20pKAetNtixVqWLkonhi7NYYe8y?=
 =?us-ascii?Q?Y4RnC8s7JaoHl7mH5VEl6tQwqB3Q2SfdP+CA9bYokrsnK4REEN08PlJXdD/k?=
 =?us-ascii?Q?G//HdQkVUQ36Uc8wjqiWbJArxGQjUq7xzbtb1AFxqe3aSodiVaUjjxszsdig?=
 =?us-ascii?Q?qZzAkw2e/VtHmig4w3qIo0p4FIy3zmJkhImM8LzEOSVa6ReedcRMK09PdvqT?=
 =?us-ascii?Q?MYldbL/GakKdRbG6h0k4g5crRj9uV6P2wNokgnrNDf8XPQM2sEbSLmnmG0mX?=
 =?us-ascii?Q?MAiRwwRsTIBRNmJyhnft/Hi/5KkWvXHaaKSoEx2jmOfu0cSN/7IG9scdxFX3?=
 =?us-ascii?Q?hJ43jJTMUXetM3lqBwNUHzwA05g0GKpp0m816LBFP7fppYRm+7sY/vFrN6Bp?=
 =?us-ascii?Q?LZCXJl2PB/tqBoy8u1cyJU45wDd60VmYK6VW6OyCs2wotrCofuueCk85VpDN?=
 =?us-ascii?Q?POul9wQKpVnBccbPVsq+tcUbtdUkq/eZi/HhQQ0wBvluIADpMID6oXBQF7G0?=
 =?us-ascii?Q?T32cGC8r1KeiQAC2xr+959LS4Vc26bTyQRjhbssJjLI53kRc0z97KvPgn3Jo?=
 =?us-ascii?Q?dtUk2GuINLBwbW4HIrnDr6McGp2PuoBLDNJoph2OxTUrud5KJTLBvBJnyIed?=
 =?us-ascii?Q?88G2hFw81LNfNplEnHGIWWP5/9arF5ATDffTuv5VFijNerd7g2jaxZDIOZLb?=
 =?us-ascii?Q?yuDGM+hexRNd54jWzogmaaygsc7XRAV5p371JwxWcQ+8NHmJUU+4Dq+OIMhC?=
 =?us-ascii?Q?HQ1buMUFsZwutSaWQW154+cGclYhFnsTiI730R0zC0Svxy0MdKt5uhcKfqUD?=
 =?us-ascii?Q?oKICDUP/LE8Vqa5dvxhUCfx+s9RybpUFn+koZ0/n1UKGVsdlN/UX73+P3xFP?=
 =?us-ascii?Q?BuM3HsBK0XM/ELN2oUTrR4DkBsEAnUBTIDsnkCh5AilWbUPo7SeelnxTOgO0?=
 =?us-ascii?Q?ADYAXL2vG1L4DjJCHGaixsUMmFeOGuRcCVraxa8S9WbveFOrjE9K/1pZSpNO?=
 =?us-ascii?Q?7PjIeA6ewL+Gblqxn+bdgDA4H6YrNhFWnsH2cIkeskuiQFjrJsrcaryc42bP?=
 =?us-ascii?Q?5WeStQJbT7nR6QpJKl7zUNknjs44lLHBVPKDWWzliTsjX8Ip5lwIhVEt0hOr?=
 =?us-ascii?Q?tAOzGbK9cBiK96ZBFVC9+beoqSK3UwHofczilHEmfYfJ6g/MTQEZBJH5Mx9v?=
 =?us-ascii?Q?9BUhYEJHhi33/dAZ7nmpcJfTHL57B63hibTBWQrKW+MEHL/u5SamTISNP4zb?=
 =?us-ascii?Q?tWlJORrXWlcd7KzZB4shRO6h38la4O+XThamWDQUHU+03t3yu1Hys9ZGAFin?=
 =?us-ascii?Q?EE0LlJuVW57C1tfwOjsx0lMx+XdgOfhajS1Fybhvww0UL2zYyUl8yUNOQ3OK?=
 =?us-ascii?Q?CXwlWZhCti6QY6A6zHkJ2SGAYGP0Nn+whEkvuQdafL04gFy7li2+Q434TnCu?=
 =?us-ascii?Q?9m5YOQ8sFDRXiE/OsNcOVVXTucgJtBLodgE3?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2025 05:58:48.4940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a9574d-3084-4077-d712-08dd848769c5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7780
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_225859_569937_8D169D3F 
X-CRM114-Status: GOOD (  12.38  )
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

Similar to the iommu_copy_struct_from_user helper receiving data from the
user space, add an iommu_copy_struct_to_user helper to report output data
back to the user space data pointer.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 include/linux/iommu.h | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index ba7add27e9a0..634ff647888d 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -562,6 +562,46 @@ iommu_copy_struct_from_full_user_array(void *kdst, size_t kdst_entry_size,
 	return 0;
 }
 
+/**
+ * __iommu_copy_struct_to_user - Report iommu driver specific user space data
+ * @dst_data: Pointer to a struct iommu_user_data for user space data location
+ * @src_data: Pointer to an iommu driver specific user data that is defined in
+ *            include/uapi/linux/iommufd.h
+ * @data_type: The data type of the @dst_data. Must match with @src_data.type
+ * @data_len: Length of current user data structure, i.e. sizeof(struct _src)
+ * @min_len: Initial length of user data structure for backward compatibility.
+ *           This should be offsetofend using the last member in the user data
+ *           struct that was initially added to include/uapi/linux/iommufd.h
+ */
+static inline int
+__iommu_copy_struct_to_user(const struct iommu_user_data *dst_data,
+			    void *src_data, unsigned int data_type,
+			    size_t data_len, size_t min_len)
+{
+	if (WARN_ON(!dst_data || !src_data))
+		return -EINVAL;
+	if (dst_data->type != data_type)
+		return -EINVAL;
+	if (dst_data->len < min_len || data_len < dst_data->len)
+		return -EINVAL;
+	return copy_struct_to_user(dst_data->uptr, dst_data->len, src_data,
+				   data_len, NULL);
+}
+
+/**
+ * iommu_copy_struct_to_user - Report iommu driver specific user space data
+ * @user_data: Pointer to a struct iommu_user_data for user space data location
+ * @ksrc: Pointer to an iommu driver specific user data that is defined in
+ *        include/uapi/linux/iommufd.h
+ * @data_type: The data type of the @ksrc. Must match with @user_data->type
+ * @min_last: The last member of the data structure @ksrc points in the initial
+ *            version.
+ * Return 0 for success, otherwise -error.
+ */
+#define iommu_copy_struct_to_user(user_data, ksrc, data_type, min_last)        \
+	__iommu_copy_struct_to_user(user_data, ksrc, data_type, sizeof(*ksrc), \
+				    offsetofend(typeof(*ksrc), min_last))
+
 /**
  * struct iommu_ops - iommu ops and capabilities
  * @capable: check capability
-- 
2.43.0


