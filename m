Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746B9C47BDF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 10:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rQYiMoPKE8OL+gp5v1OfrhaIUAMOUsE6AE66Sj4b9tA=; b=ZUplnzb39UutH4kLS+HuFVwQzu
	0s3W9NTkcY7FKeVcRLVWFIGDtM45y2Ma+9JYRKbO9qzy5cDN/ZQuS7QfeDcp9LCy6K2EM3c3V/0iH
	2pTuC9ceD0XcFmIrrWXlE3hjHeX2typ5nP5KQLnDZUHYHDy9Thxc6xKpFew7WKLHU4qYQDCsv+EM/
	FVu8OCMTlAPujl1seEtmo3H68dVKO+P1lcoqBtQz1GmbzIr0NLsD+cbhAXhBTtyOGOH9Xy2LAGDpY
	JOFy1Akb6ZI7NOEVvh3M6DaU1wSKVLa3pF8hvT9ucpQCz1uEVAjZuTaucnHBWIku9tGrUAbB4iRZg
	yo/h9ZVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4SN-0000000CoKO-3qNb;
	Tue, 06 Jan 2026 10:38:32 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4SK-0000000CoJN-15Zu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 10:38:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a36KD+XG7T3/Idf+Pji1VYLlGTVklQd4VV9Im8tH8ht3CvNDq6ge/hp6g3Ex+/SRF7uVca2bfaRyD6LmcZftfn+VDlP+ketWFF8plabm7fAZcKit5GSlbgHT71A76cFkDNvsNPbajOYsA5D5ZFtkQiSiL0lMzrJizdE6HzVrvOXKVLyfb00yqtTBjDDj5QGmqMJXWXSwDn7A1VBqC6AFLSLpTNI9oKc0qPFvBKNKu/j+SQ4qdnBE52ebIe8AyMqw7VYJQa4+A8dhjIZ/GTk6MQFK0X0U/CRnymv1qbHJMavj8SKQpMzjXhoxvSAJUcj1VGWNaK4DGtLxy1IAh5OWug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQYiMoPKE8OL+gp5v1OfrhaIUAMOUsE6AE66Sj4b9tA=;
 b=JgMtkFuBeYGKKJ3Faio3O1rd4IYFOb8a5oZCRArvh5CImpm1IFCXpafgwAh37vYCsbLz1JAdHLu3fqlDzg0nRnOPvB2DDYrEm/7h9CzUVRTYWxPXenoSm7ftOEpCfBA/jtDk5n2EGM/EI7NIyo2OOiY3SQUiJar4wxhJQDaY46D3Vq4V5Zq1UkoubD+M6tWlo2OXm38Gv4wzHEBMR54eomddXpNHOvBawu1fK3HKyon2q6TEWTwin49KHIl4ev4ak1e6tVzq/QMJ6+ZNJB+AgHuhxVJSYDomaVY21z5uRuAyc2SXhduoRQcvM/2aLy9Cey+NWVIiQbLgJ8BgYMjKwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQYiMoPKE8OL+gp5v1OfrhaIUAMOUsE6AE66Sj4b9tA=;
 b=dmRPJOOL28wDNwkL6LpQTbcnBm11WpRy0Xa/Q2tjNNmg32r1gcYpb5Q7/DB7IAc+b8OChWNVG1RLns7Rb8tad+kse6I8eEQ68WrQwyhqyStH5Q6POmMlGx0+dDK3wCiwAsle0ZTjXztCeWvD7JXxPiXLok9aKTZvn7B8jYzz/WE=
Received: from BLAPR03CA0028.namprd03.prod.outlook.com (2603:10b6:208:32b::33)
 by DS0PR12MB8766.namprd12.prod.outlook.com (2603:10b6:8:14e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 10:38:22 +0000
Received: from BL6PEPF0001AB57.namprd02.prod.outlook.com
 (2603:10b6:208:32b:cafe::13) by BLAPR03CA0028.outlook.office365.com
 (2603:10b6:208:32b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 10:38:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB57.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 6 Jan 2026 10:38:22 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 04:38:21 -0600
Received: from xhdharshj40x.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 6 Jan 2026 04:38:19 -0600
From: Harsh Jain <h.jain@amd.com>
To: <srini@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<michal.simek@amd.com>
CC: Ivan Vera <ivanverasantos@gmail.com>, Ivan Vera <ivan.vera@enclustra.com>,
	Harish Ediga <harish.ediga@amd.com>, Harsh Jain <h.jain@amd.com>
Subject: [PATCH] nvmem: zynqmp_nvmem: Fix buffer size in DMA and memcpy
Date: Tue, 6 Jan 2026 16:07:48 +0530
Message-ID: <20260106103748.3993455-1-h.jain@amd.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB57:EE_|DS0PR12MB8766:EE_
X-MS-Office365-Filtering-Correlation-Id: 608d4ed6-d9b5-4a54-19f0-08de4d0fb6d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wMfMzBDjJXtWt1p75zQaWA+9l+BzRaTVuG13kzj9t8qB4OZb5qWmfxCtzHi0?=
 =?us-ascii?Q?xD+T6fCYimiAfcQQYgTpechw80L0KpaWNlZCH39WFHWWxUhZi+spetbnU78f?=
 =?us-ascii?Q?UuCy5WAcqhH6QeN3rRzgRWXE64VD9Aow0jRR6Bax1k+Vo1Kvx2pnuXZYHosO?=
 =?us-ascii?Q?ntt5Y4Dli9rAHVQDEgWZAlz/qyZe6kk+4d1RSDVZozTkaloR7Cp/EBbnGb0N?=
 =?us-ascii?Q?LGN54TeiuQnJuJrKnNbKOqfGkM9t3Cslwt0tVRT+KMYM8+6aJX0+5MzgEC15?=
 =?us-ascii?Q?ePiPtiSKyy4AZYE1mQokX3k2w9nhi1/qo1sikszq28LHpyTPcMvDQBxeY+4h?=
 =?us-ascii?Q?dtrAsuP77GNpGckvFyYGhUsm6xNJ5D24vK9P1MJaFefkLx3VqSgtAlG5t3uZ?=
 =?us-ascii?Q?XBFgvvbAaqmJkiis5FppwfInx1QuGpq3pLdX2me40TyELISVCnu0bq56XMDK?=
 =?us-ascii?Q?rLdRO331m6CtIxjcw6k9NRwXUX2sb46SKz9VtMHYZ4YUbqCe3DoqlKeZyS3H?=
 =?us-ascii?Q?s7QcpG16EQ93ifffFOdpPUz4cw2lOgfz405PXAP6uC4OecVvkrUrT630p8Qx?=
 =?us-ascii?Q?PI8ibHlYWooz/lvGah9EckMbi728oaltuc1nThBzekLcHGQwEozKF8Gp1bGs?=
 =?us-ascii?Q?O8IMzo6fl0XEe97gLPc602dvKKQ/ulONDtLo0OAawVQGUMSWKCcdlYPAOgl5?=
 =?us-ascii?Q?7pPr9BVS077wK5K3sqShOfhkTnafQnmSz1+oXtKkSmptlSOQRwSUru1zQpK+?=
 =?us-ascii?Q?D4jNpMOTLfDbLNats0HoXqXcMj0+uCDa0Sj8ODCAfctLc5Cgo4AZPe8kxzjq?=
 =?us-ascii?Q?g5DeLRuOL0HkM1+aR/cGTcF7cveFHcEymkUKjCJQakIf3Mq7jixP2js+oj3C?=
 =?us-ascii?Q?MrlVv3XkiIg7S2L8tmswJUGVUbtwAu4k37tLCacJEJWtwqZhQjn7bsuLYxqt?=
 =?us-ascii?Q?g4kTgBpIublmu0bnCgLUiVZk1N7CjgheuMeroa1rHWGlltSKTlA0TFm4k/PP?=
 =?us-ascii?Q?KDF/024I79Bj/R/R9LNBSpR0QWkVk+AhwynnymLbJu4XKV3KVVyQMciUhHMH?=
 =?us-ascii?Q?qbnqEfVV8BQ1++N8HrD/r2bDzixURaZW0tE7436dEqefuU1ln5FpgtZAKj/9?=
 =?us-ascii?Q?X72JuubLle45c/70gH37UnXj3aJqiLLqzNYxETkIqLzPkmtSUON/Z/S6DrKS?=
 =?us-ascii?Q?KyybhM/LRonpI9rixueVzUktlT2G0JrnmzDV52oZ/ku+K9LkxRHCfu0hqoDR?=
 =?us-ascii?Q?aNzX9uQXAqrrc4IxJ0COGCA0LLtBFi9XICV+60MQidFIRJEs/Mwv5jRO0iEQ?=
 =?us-ascii?Q?rOqGz/8vvujtuAiDZcRjGyP7SgtmfI6z62kipT2FC0ZCCeczgyH4fPSrRP+7?=
 =?us-ascii?Q?LqbP+NLf89FrYfplk7C4z5bgRFtdDvyliluxKT3Z9ABfNjDjREmnlqhRCFSE?=
 =?us-ascii?Q?2vaXWI4aefL+vwQUpcnC6VFr3iTBxcAGn6vIVK+HcU5mxLYDFKmnUT575UCS?=
 =?us-ascii?Q?Ftgy6o3Le7l7L26NdHa5wjZbxH/sQvNz7cUuJ3Jee3XADO3l3WksDzKIwMLF?=
 =?us-ascii?Q?SOFssZBNEYPtTWZH39o=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 10:38:22.0228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 608d4ed6-d9b5-4a54-19f0-08de4d0fb6d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB57.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8766
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_023828_438970_A7C224CB 
X-CRM114-Status: GOOD (  13.36  )
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

From: Ivan Vera <ivanverasantos@gmail.com>

Buffer size used in dma allocation and memcpy is wrong.
It can lead to undersized DMA buffer access and possible
memory corruption. use correct buffer size in dma_alloc_coherent
and memcpy.

Fixes: 737c0c8d07b5 ("nvmem: zynqmp_nvmem: Add support to access efuse")
Signed-off-by: Ivan Vera <ivan.vera@enclustra.com>
Signed-off-by: Harish Ediga <harish.ediga@amd.com>
Signed-off-by: Harsh Jain <h.jain@amd.com>
---
 drivers/nvmem/zynqmp_nvmem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/nvmem/zynqmp_nvmem.c b/drivers/nvmem/zynqmp_nvmem.c
index 7da717d6c7fa..d297ff150dc0 100644
--- a/drivers/nvmem/zynqmp_nvmem.c
+++ b/drivers/nvmem/zynqmp_nvmem.c
@@ -66,7 +66,7 @@ static int zynqmp_efuse_access(void *context, unsigned int offset,
 	dma_addr_t dma_buf;
 	size_t words = bytes / WORD_INBYTES;
 	int ret;
-	int value;
+	unsigned int value;
 	char *data;
 
 	if (bytes % WORD_INBYTES != 0) {
@@ -80,7 +80,7 @@ static int zynqmp_efuse_access(void *context, unsigned int offset,
 	}
 
 	if (pufflag == 1 && flag == EFUSE_WRITE) {
-		memcpy(&value, val, bytes);
+		memcpy(&value, val, sizeof(value));
 		if ((offset == EFUSE_PUF_START_OFFSET ||
 		     offset == EFUSE_PUF_MID_OFFSET) &&
 		    value & P_USER_0_64_UPPER_MASK) {
@@ -100,7 +100,7 @@ static int zynqmp_efuse_access(void *context, unsigned int offset,
 	if (!efuse)
 		return -ENOMEM;
 
-	data = dma_alloc_coherent(dev, sizeof(bytes),
+	data = dma_alloc_coherent(dev, bytes,
 				  &dma_buf, GFP_KERNEL);
 	if (!data) {
 		ret = -ENOMEM;
@@ -134,7 +134,7 @@ static int zynqmp_efuse_access(void *context, unsigned int offset,
 	if (flag == EFUSE_READ)
 		memcpy(val, data, bytes);
 efuse_access_err:
-	dma_free_coherent(dev, sizeof(bytes),
+	dma_free_coherent(dev, bytes,
 			  data, dma_buf);
 efuse_data_fail:
 	dma_free_coherent(dev, sizeof(struct xilinx_efuse),
-- 
2.49.1


