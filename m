Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C99D59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 08:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5379LnMx8g0UOH+/q3HDROHzF3mIk6HNg9AEY0p4ew4=; b=t1/P7nkA4vfPmmW3/qCuYtC3hq
	2tWeUrrzgwaFHNZ5wJK4XW6plDRNYt8PdFu7l3lXZViEP0hV76vcmAERUSDoFFH6FqvEHBEbNsdHf
	aqMG6b0ycRwE45MQ6l1G/P52YVjxsOOwu2pTHdqdLbhue89GC4rO6F0B0KGZVJlCyrrBRdFDzcvrv
	cVsu1rMWTguZceNgzDa0uw6m2sTe0U7Lxl75jFG0g3cEZiD2rt2+wCk92xwMghf4B6gNf9pQPNJ71
	KKFZgLm/aOdOOnm/AvuXo0oLTl+vo+IOfygEFEZkTDmtxc1O06bwcCZ6WzWrP+ONEHAAnK/IpbN/4
	DIvwkTaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV3wk-00000003Gd9-2m50;
	Mon, 15 Dec 2025 08:28:46 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV3wh-00000003GcT-2hcP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 08:28:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZQn+s7Nsjo6eySvpfeQ3PvOUPxmMQx0Mxm1oP4pmTsde6EtSJUT2h9RNBERW+jA7cF50i0dcQpn1xl+yz1MhkUyACHLPv2uT5GaleJzJKzUymhJsPKpKT/lqATCmODWc3fvstwB8iu3C4X4/PVwFXJkjVn/SymY8Loa2oymlrPqkrTA9QeOkrtxaer50BqQnOYmQrsUlGswDxYqGWU0mMYtwCowPXuCgiWkNISwq7BAIALPG4tiHN3RjhKHVX+KrQyxXXIlqtG4yhtHtsQUlPI8LVXO/+WwQcqlUctpn93uCmVuNAYjAwPSu6KYOclGRUHSyyMYPMXMnbtpHugwlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5379LnMx8g0UOH+/q3HDROHzF3mIk6HNg9AEY0p4ew4=;
 b=Mr+LCTQxViZWT4KC2AgK0BtwSruZ7mIrJC6rM1BjbhaFHihlIUxq6hwBhHek39lx/BTsI1wBOHU6Kh7ZCwW+bKnJFpbW9mycDDG/3GgJXET79m8xiuvs0TtQDZr5zoj55F1L3whfa5DTAJhv6Ud/kxQWIyONmSYn5lIxHS+u9ChiI2/XRoPT84LOm3D/XkN2oRCBaVbsmFHu2YynVaa7kKZSl1SOxg2utyT2LazajtJGks2FXRw11crh/Se5Cwi/48RM/HZw4bioycC2Rb6kIxT0JkkXaz4d7V72hfDCC58rAEo18vLMM9qJ9Ei+JCeeOP3W0pwUiRwdGmP68rB4gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5379LnMx8g0UOH+/q3HDROHzF3mIk6HNg9AEY0p4ew4=;
 b=ZCmrFe5WWjKRsZUJo6fGtE1kY1ZecbOuY4c8501Q73hGkfhwqLfCDxxCoWYBsrGax7N1l4TboVm+uyNvOk8F3UYLVD7WCnX37NvAJLPiUs7VS8R4aHlZeXx0KlCiNHVu6EFQiWmaa8GMy3pNk5Yv4y/FnH3eQdM0jD/FMgF2yi8=
Received: from BL1P223CA0009.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::14)
 by BY5PR12MB4274.namprd12.prod.outlook.com (2603:10b6:a03:206::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 08:28:37 +0000
Received: from BL02EPF00029929.namprd02.prod.outlook.com
 (2603:10b6:208:2c4:cafe::84) by BL1P223CA0009.outlook.office365.com
 (2603:10b6:208:2c4::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 08:28:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00029929.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 08:28:37 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 15 Dec
 2025 02:28:36 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 15 Dec
 2025 02:28:34 -0600
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17 via Frontend
 Transport; Mon, 15 Dec 2025 02:28:34 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>, Xu Yilun
	<yilun.xu@intel.com>, "moderated list:ARM/ZYNQ ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>, "open list:FPGA MANAGER FRAMEWORK"
	<linux-fpga@vger.kernel.org>
Subject: [PATCH] fpga: xilinx: Switch Michal Simek's email to new one
Date: Mon, 15 Dec 2025 09:28:29 +0100
Message-ID: <49de9536c9952a3a36bb996f2fb0a1f0efb1ba6f.1765787307.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1480; i=michal.simek@amd.com; h=from:subject:message-id; bh=3yiWAGaPtMNvk6XKRjSnDzIw1bcfhhyQoDuYz7PqlHo=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWTaH1sf2LPb8U/Jpy9sp08su5D3tfPsKofoyXs7JP3De PW7jjLO7ChlYRDjYJAVU2SZzqTjsObbtaViyyPzYeawMoEMYeDiFICJzDFmZGiQO+Cxa0nRjRkN GoqXC9Pc3jNNKJnVqv876N/RFQuC/b8y/C//XcqY87/tdJ1VkoGp9ISn87+F7X5++n7rLOEYwZW JMrwA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.simek@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029929:EE_|BY5PR12MB4274:EE_
X-MS-Office365-Filtering-Correlation-Id: 26cbc903-6a47-459f-49c5-08de3bb3f1a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Bgh5SeR5Q3giqTs86j0cG5RdiiXoJiQn1T3yHikEAFed1TRKGVEPiSFC2IaL?=
 =?us-ascii?Q?XvzXxcHd5VgFssaJKkJV+1UYfWWNNuit+1Dq/G+g/fC87ykSBvGmID+ePDMx?=
 =?us-ascii?Q?oXsoozh+IqE1+jGH0parot2OyYUQlqkonz1Qlu8/dVJjJ0+YuYME97yYpjeb?=
 =?us-ascii?Q?ODSQMphvWayxrJXWlK+vND9RkLtLKRaunQdyKwPevYEh9A1MOR7seVHUxODW?=
 =?us-ascii?Q?aa9pTkeztr7b8WBxPZIHDKXWwEgZ+RtqgzwFNOr/9QTgywaKUREcp6Z8Cidy?=
 =?us-ascii?Q?5QDrbpP6HiMf+CKE4ftMVAsZD1PVfUWI4BjbsPHTFAGdaMGSUBld6X3uj3Nn?=
 =?us-ascii?Q?WH2miseAhyl0CCAb6dYNfGTXwhY9/6cGE1zX92Zso4E2BXyfP3ubmM1qBVWA?=
 =?us-ascii?Q?djZMceezh/zJoo2aloj6DTl8Q0lVgnGtWhIgSrX6vDuCVvF+WbVmtoCpa6aO?=
 =?us-ascii?Q?x3G0WLk/6g6vmuo3Wn4jU0NbSxLhDVWsk+cgD0uqQRsM586pw6BghdCySEY2?=
 =?us-ascii?Q?39E1y5ncnM8lzM1QWmN8ljB8hr8udY6iNoJbGGSzKJuZaycEnVAV1JKZljLe?=
 =?us-ascii?Q?6o4DIdvv7vJjbB/PerBesDJHSFdH6ClojJj5g2q3FjmDH5+8K4cbH0PTg50d?=
 =?us-ascii?Q?1CbZz78JNTli0s5jW4WbCDMvW+D+Bi6kFhtHgKObbLXv9cDDwEawKTlccF2g?=
 =?us-ascii?Q?tlYjbKOxZBowPWU36UTMFbs/eQQtkonkjXCmm/RvsRCnMAe3gpaMbc7W//6o?=
 =?us-ascii?Q?N+KqXDpq/ZovNf1A44OB1c4kwnkL/Th1xYh7Hw2dEOdRBtgCRr/cxbI6mGBm?=
 =?us-ascii?Q?G7MF9ZkGgvWqJTBLdB1gQf0yDHq9EqXtIAD/snd2nmFhlVIGAyFy0F5t4kf0?=
 =?us-ascii?Q?B5JR9TMQcA00v/Md7px5nw/t2lKF8fpHVcyKs1+j3BFhVAyN6kQH9yV0oW7B?=
 =?us-ascii?Q?552o+SfFeQYdC3dbaACRQwnrgMK4Vv1nSWa51RRShJ3F0KceRjrUUdkzug+k?=
 =?us-ascii?Q?7Ps+G+A1+fsVUwZlgH0tXUEMpsgCVynl2u+CxzABdgV9oHejEGCsSrEORxQ0?=
 =?us-ascii?Q?8TZdMXv0zY1iEG8n2UF6Xg7nSi6LMUhUaBPi0Kjik1/2q8IY9Ouw9F32MecE?=
 =?us-ascii?Q?9N7Nj8WUb7ffyL63DTIxiMRfOUiv5MG8+HEVlwUzPS0Yte1wWJxJt+gVHNmL?=
 =?us-ascii?Q?3t6ULKtVN7Ks6x7D+GijB8n4Ha6Vn6AHAo2KZ0X+AodfKFJTy2sRPRztEehb?=
 =?us-ascii?Q?T8t8KGye4BaJdgBt8nsWXx/lyEdF+QDDU/qHSQOd6MV23IJTL4vMYuWs7sGZ?=
 =?us-ascii?Q?1wvS8axYYaRSZZyfBdg2X62LO9AbHQQ+WF0I13tWkmce8rfq7s6uUqCs79/J?=
 =?us-ascii?Q?oKHgj42nPYQ+o64xce+XChfteWA99KWiLfluZ982AO+GCRZVfUeJxaDwaSjq?=
 =?us-ascii?Q?aa+2pvgv7RhaTPI4zjtX3tGlkmCnMcWLL14r0Ampzz41Topr6k24Cw4QMKB/?=
 =?us-ascii?Q?LPCQhbn/fV2k78pWgiIMqQXGlOD6Mdu+rZKAR61XPNpdiMoDr7qcl96jZlvM?=
 =?us-ascii?Q?pr6DVHc2EQUNUvYb7iw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 08:28:37.2139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26cbc903-6a47-459f-49c5-08de3bb3f1a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00029929.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4274
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_002843_685853_ADE287E8 
X-CRM114-Status: GOOD (  11.50  )
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

@xilinx.com is still working but better to switch to new amd.com after
AMD/Xilinx acquisition.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 drivers/fpga/xilinx-pr-decoupler.c | 2 +-
 drivers/fpga/zynq-fpga.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/fpga/xilinx-pr-decoupler.c b/drivers/fpga/xilinx-pr-decoupler.c
index 822751fad18a..6994d68e9036 100644
--- a/drivers/fpga/xilinx-pr-decoupler.c
+++ b/drivers/fpga/xilinx-pr-decoupler.c
@@ -173,5 +173,5 @@ module_platform_driver(xlnx_pr_decoupler_driver);
 
 MODULE_DESCRIPTION("Xilinx Partial Reconfiguration Decoupler");
 MODULE_AUTHOR("Moritz Fischer <mdf@kernel.org>");
-MODULE_AUTHOR("Michal Simek <michal.simek@xilinx.com>");
+MODULE_AUTHOR("Michal Simek <michal.simek@amd.com>");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/fpga/zynq-fpga.c b/drivers/fpga/zynq-fpga.c
index b7629a0e4813..9d1d599ef718 100644
--- a/drivers/fpga/zynq-fpga.c
+++ b/drivers/fpga/zynq-fpga.c
@@ -652,6 +652,6 @@ static struct platform_driver zynq_fpga_driver = {
 module_platform_driver(zynq_fpga_driver);
 
 MODULE_AUTHOR("Moritz Fischer <moritz.fischer@ettus.com>");
-MODULE_AUTHOR("Michal Simek <michal.simek@xilinx.com>");
+MODULE_AUTHOR("Michal Simek <michal.simek@amd.com>");
 MODULE_DESCRIPTION("Xilinx Zynq FPGA Manager");
 MODULE_LICENSE("GPL v2");
-- 
2.43.0

base-commit: ebfbf945d90b0efff3ce0dc17fb7f1f0db5b6628
branch: zynqmp/soc

