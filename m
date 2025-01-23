Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230A3C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 10:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOpNDsisMi4uqZQx0p8MXJf8+lrjc4G3zo+0/Kwdcyk=; b=KkBQ0RyVfkOuAL2RIZ1DRFh0qr
	Oq/KCqfFD3ojcpRSUAEKtMXa1Nk5EBI5MLivGRG10QLODKNFnmOWD5HtH4XQu73pFhnPQYd2dToev
	/FVmfiNlgV1iXPugpa2HSSqjTW1sgNSOl4EtXioSHXQyDyxmNV5yLouwLcA71OYEtIstXAAVRki6o
	C2aTDg6jEoW7PL4aBJ7MWqgmcnulkZs7QuSQ3bDwhBUDSD6bXK7T/s7o5IL+08jjiYd8rxwSTbZgs
	Bs5DcSFZg7GFyGzIVigW/vCE0VzAAA6sbj1kyu1viqj3adjcQ2cFThSZ4WO2AUgPi9O51o8rKJXWw
	keY4akUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taubF-0000000CETU-3aas;
	Thu, 23 Jan 2025 10:38:13 +0000
Received: from mail-dm6nam11on2062b.outbound.protection.outlook.com ([2a01:111:f403:2415::62b] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tauYh-0000000CE9m-25bw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 10:35:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxYgWSoWUPogt7F40IScWcAYdoB5KVW2iq52o5dnQfMy/bnV5oKz2znWg3S2M769m83G2IEKk6O124qRlPCG46MvhRNdsIMWJw/Q+tJFymxOSLz1lCsYz+Gi/QmB0fRQEk7HejujFzgew312di9jdL4QvE/JlmijaY3plIM++UloeIiFJfKMsRoxx/tY0Tz4MEMRCu3My3oOVOQgmlAB995OhSRp2MY7fOvLmdRgk5kokqoh/o321IlMTiaJ8yIjp1rIu0ScJ/xY8TGDh2s653hrFHjs2tONK5VTA8Co7yNYcnHWHeG7lD8bRV3XDC120aJowl2AqCApChB1C7AmxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOpNDsisMi4uqZQx0p8MXJf8+lrjc4G3zo+0/Kwdcyk=;
 b=PB9oD4wjla4i/7HWDEA/CZ+qxuUyx7mAU/ldbBErb0XMTIh+YUtiYYXLGvMr7Bkchs38tGIBVAJhCmFJRgkoXMOUVzXIGZ7jowP7BHJ1EYG+sqqGHxnrRmnQBWHQL0+aI3gAOeoNd1wNvPPS5XJf0FvsJFAaYY5soZq4VDYQltEjSGRVaF+DEx0nFDb1aYpKEsh02IkUvHUw8XabnfiVMUx8OIoYlIskwpgo+GjVNW12Uq2y/sT05CpqmoOzeCGMhM0yLOh8/Z8+42GqQxVLswjQq4BUKnFJz8IkduL6GOHTJfeyg1VZB3vBzjZu5h7aksub3GZFyZ4Qut0ueKVHPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOpNDsisMi4uqZQx0p8MXJf8+lrjc4G3zo+0/Kwdcyk=;
 b=doD6wrZRehU5+NQm5AEvGx6e7P3bdpI9nw9d5NTmyA1mOsvuh8uiiI73GG2esr8KNfod8A52ymfRNBTLeNrnci87LVZo70K4D6AEFcJJpodsXHnzsiTeFf4TlVghmAiMKzqS76FfzF5oicCUvVpftrBBldgI2/P/vIlfYbyQSi8=
Received: from BN0PR04CA0001.namprd04.prod.outlook.com (2603:10b6:408:ee::6)
 by PH8PR12MB7135.namprd12.prod.outlook.com (2603:10b6:510:22c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Thu, 23 Jan
 2025 10:35:29 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:408:ee:cafe::94) by BN0PR04CA0001.outlook.office365.com
 (2603:10b6:408:ee::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.14 via Frontend Transport; Thu,
 23 Jan 2025 10:35:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Thu, 23 Jan 2025 10:35:29 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 23 Jan
 2025 04:35:27 -0600
From: Nava kishore Manne <nava.kishore.manne@amd.com>
To: <michal.simek@amd.com>, <ronak.jain@amd.com>,
	<nava.kishore.manne@amd.com>, <gregkh@linuxfoundation.org>,
	<jay.buddhabhatti@amd.com>, <praveen.teja.kundanala@amd.com>,
	<siva.durga.prasad.paladugu@amd.com>, <u.kleine-koenig@baylibre.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] firmware: xilinx: Update the zynqmp_pm_load_pdi() API
Date: Thu, 23 Jan 2025 16:05:21 +0530
Message-ID: <20250123103522.1258499-2-nava.kishore.manne@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250123103522.1258499-1-nava.kishore.manne@amd.com>
References: <20250123103522.1258499-1-nava.kishore.manne@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|PH8PR12MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: 28ef21cf-5f23-43ff-d844-08dd3b99a809
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUdZeGs3VFlPL1FyWFZvL05Mdm5ZSVF4dEthVkt1RGEvaWNxV21SQ3NvSmF5?=
 =?utf-8?B?dm1lRDVhZHRDeXBLV2xzcUpPVy9MNXBwN29WclYzZ3F5L2xCMlg3M3F4akln?=
 =?utf-8?B?cld4QTBFYk9kYUhDN0RuNzZmc1FPcWR1UnVLK09FdkY1cEVTYm94NUtGQUhY?=
 =?utf-8?B?YkJoYjVXZm9nN09zOVEvbHgvMVJSQ1RQbE4zVHNOaG9qQ1dvVVkwT2QrYzF4?=
 =?utf-8?B?RUNyUnNUcHlHRjZ3bDBibU5LQjZmVG1lK0ZhYU5tVHcyL3lmeGE0YW5KQjJ5?=
 =?utf-8?B?WVBVT2xhcmtOak5wZWQ1L21pTGNrOUFIR3dtd0VoRWpPY2lJdGdFUzhhVUhZ?=
 =?utf-8?B?VDVvZXdPNHc1MENkdUN1Y0xkUjcwRVBaektDbDhYV0EyUURIVnVFem1yeEwy?=
 =?utf-8?B?YU4zaVR3Wkk4RndUN0NEcHdxVVZOeHRscXBSOVhjUTV2bmNzbHJITm05MTFR?=
 =?utf-8?B?SDV2ZFRVNStkVmkwYlR4Z0ZpeFIrdEl2UlYrNXc3aUZKRVR4T0h5SHlWQjh6?=
 =?utf-8?B?VkxXMDlBZnZqMC9VZGpTenA3eERRa1ZTRDdrQXJ6cU05VU9vYXIyWUxaR2FU?=
 =?utf-8?B?Y0lMRDZ1Uk1IU0VUY2M4L2RnalNLekJaSmVtUU93L2Q0NHg5a3lJV2IzZEpB?=
 =?utf-8?B?YTFxdU83N20rUDc0azVLZWZoamdCRmdFeVFTdnIweFpWK0lBVjMwUk5GVXp1?=
 =?utf-8?B?V29lSUhXYk5Zb0dOck1SRE8vKytybE9TOHkxMEJOQzd1KzdzTlh6eDNiUVF3?=
 =?utf-8?B?c0dsaVp2Ump6V2tRV2JOMERqTWRDTUNlVkpFU3M1Sk1WeWd2UEUyV1plRVRy?=
 =?utf-8?B?dElDeDBQUjZpeUJWNlJuT1c1Q2F5WHBJcWZwaVdzTHRhT3Y3T2hWdDdrNU1i?=
 =?utf-8?B?UEMvbnpVZ1Q1YVRtWkNjbHFGeHFFcDExa2NnRDk1RkpiM1hTeEJrbkdmdHhR?=
 =?utf-8?B?UnRxM2lHUWpVMnpQcnNSWlA0dWRDT2FuQXh6NHVHQkFKaGNiNTZ4WDBRUmdB?=
 =?utf-8?B?VUVBRHFzRkJTM1FrRDB2RDJ6Mmo5RldJOHVidmVKRnUrNm1lSjlaaTFNVUs2?=
 =?utf-8?B?N2o3RUdsUmdobVlsNE1YVTliaGpZNHkwbnVldkQ5VzdGblNrR3RTdEs1Wnd2?=
 =?utf-8?B?MWNuRTJObDBiTm0xdk9ZTDFSb04xRGtBTjRnYnpLa0hGZS9XN0gxem5FVlZP?=
 =?utf-8?B?b0IrQU56bEd4VkxYOG45SzlvcWEyRjIwR1BqejIwNW95L1UyZTJwVkp3SEFK?=
 =?utf-8?B?ZE5nWmZYMk9hUmlRaWNSNHFnM3lsTnlXQ1YwTmNYLzBQRmZGTDlDR3hFb25M?=
 =?utf-8?B?L1B1YnV2WmF1NTFCT2xtMU93TXZMOHNFZE9mbzNIaGtZZkZuZ0xUblAzK3lQ?=
 =?utf-8?B?M1Z6QnJROGZCY0szcHJnRkw1eWhEQUh5dktJUzdRTFBmSTlVZjRNWStoeWhY?=
 =?utf-8?B?R2RVMExidHpHU0dHaVIwTFYrMzVsTVRRTWU2QkRBb29pYnI2Z3lmTUxxNTh2?=
 =?utf-8?B?eHVOVEtPSFBvZk0yb1JLUW1mV0lETmxwMEF3TkVmU1BTeHlRVHNmRXJjUHdC?=
 =?utf-8?B?MU1YajA5enRGK2xxdkpPbHhrY2ZqVHNiMDFEejQ4Sjc0LzUwTVdFVGM5dFBi?=
 =?utf-8?B?NnNCcFNuSmdIa1hLMVAwRVVBYnJIT3dWNE9la2MzTmgwUTFTbHZNeGo1Y01v?=
 =?utf-8?B?d1ZpcmZybjVoMDhPdkFpa2syQmtYV3UrYXhQRzFwWE4rVU51RER3aFJXUUpZ?=
 =?utf-8?B?Q250cGZMU3Vmei9CK2plVlgwcCtyZEJPcUQraFdueVlCOEEvdk4ybmZ6WWM2?=
 =?utf-8?B?ZDBpWkk1VnMvY1RLb1RMWERmV09tdDltdi9NaDRsWnVwNkRMZUxrM1RsaUc5?=
 =?utf-8?B?Tm12andUYndpR0gvRVcvSmRpSElLZUlES3RONzBWK2xUL1hQZXJVVGtUM1NE?=
 =?utf-8?B?aXpRQVBSMW9CRlhwOS9NdTBFZTBkUlN4QUp2WnZrNXVjWmJCRng5K2JwM0RH?=
 =?utf-8?Q?FDHBEbfqYrnfelgbHZAvwBZ0CQG3NE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 10:35:29.1106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ef21cf-5f23-43ff-d844-08dd3b99a809
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_023535_569795_093E3331 
X-CRM114-Status: GOOD (  11.16  )
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

Update the zynqmp_pm_load_pdi() API to handle the firmware
error’s properly.

Signed-off-by: Nava kishore Manne <nava.kishore.manne@amd.com>
---
 drivers/firmware/xilinx/zynqmp.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 720fa8b5d8e9..ea04a6ac402d 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -1483,8 +1483,16 @@ EXPORT_SYMBOL_GPL(zynqmp_pm_set_requirement);
  */
 int zynqmp_pm_load_pdi(const u32 src, const u64 address)
 {
-	return zynqmp_pm_invoke_fn(PM_LOAD_PDI, NULL, 3, src, lower_32_bits(address),
-				   upper_32_bits(address));
+	u32 ret_payload[PAYLOAD_ARG_CNT];
+	int ret;
+
+	ret = zynqmp_pm_invoke_fn(PM_LOAD_PDI, ret_payload, 3, src,
+				  lower_32_bits(address),
+				  upper_32_bits(address));
+	if (ret_payload[0])
+		return ret_payload[0];
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(zynqmp_pm_load_pdi);
 
-- 
2.25.1


