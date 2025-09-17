Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE24BCAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 12:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0iEl6AoPpmBJUXvrOQweDoRUlbBsTQFosLVgORSE/P4=; b=NhAAz1dNqD5z2xOxIhZ4qtUDLi
	vu3VbatJghNdi4G3/c5XjO16iNfAsLpa0lQ96wfhT7EYp+D1jilxKUT6so8I2+4Vco0E7fAM7Mlqn
	yav67o5vcQqSJhU3IKCbABiIUVBKsvbfVQYJKs0GX6OJaPvBaAj9W6yKXnOnp5X2junJGluOHv8BM
	NR9LU97LulU5NrmQm1m8n034eUDVGLjtmhKehJIYmv+o6KqyR5lv9lEaVs1J2ut5lsEc5y2HTPD5T
	YW21GTmm7i57J0PHLm4gWnCrI6+wijNyUNZZYkG2Oz0PYFMZhyMr62w783gTRhEEOOQl/6nZze+jA
	oHuix/Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrc4-0000000BQjV-0lwg;
	Wed, 17 Sep 2025 12:50:20 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrc0-0000000BQfP-2ilj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 12:50:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JpK4PKDodmLwWvSs1P3fj3S8anBeXwRWNfoDGXfsgn1R52rluKQa1gW7dFEOBViHDtoBU0fgM2jYq2MHXhrs4vp22Wv/PcliHq1BInxAAIE42wsk/za0pJxHmYH0rrO6znW5j8T6NMqok2+Ano5QsibJZ0TOBOipX8PuXgl2rPBBTxL9kSvGr+ZT6A5F/0ralkaambzHN7fS+XdQmR5TKcpwGqDTDZNKT5xsHKnC9AQU6GJbYaxK1dubrNDtza56wPCbRYb1BYlm0m0+eTWK6VLM98w148tixNQTcxsWW4HU/euGNiGbe+oCGJcO8OAdGgffow2lmchsQXVVVPbzwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0iEl6AoPpmBJUXvrOQweDoRUlbBsTQFosLVgORSE/P4=;
 b=lsR35bwi21vUptZVH2e8TwxB1BLeJTP/bMcX0E3YklSfjCWBrni8rxRPG7g5EvZwA/NGeMBQYc39M0h3+jdyGCjqhAkzop8Mt8ngfkUl6JWA1X1nswthJOMtJ3tB2e2LfaZGY2KOjFT868dTLjtPhqzW0tLDKWXpZIrodDXj3eXYYjeNHm32XOkODY+NyYN8qog7sE3KWzB7Gw5zW05kQhWHg+SGZmwBXN1gS/nDYYAK6vuWYqmqwWYwO1yyH49worrwCV+U+PEFWK977d1ot29/8hX9AjQ3NCOClahlQX20TC41oS4jUNMOy5FBAKiaQxzMv3BVNSmg6rxGvnqo0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0iEl6AoPpmBJUXvrOQweDoRUlbBsTQFosLVgORSE/P4=;
 b=gBVrh6zp6Cb2lWpPG1YplQIpXcAXi1t4fXq8q2pBCp21hpGRxA/+siom3NrqlsuLyjJ7FjutA+JdXe7qmlbYPDw0GObkgnVGcjL1ARq/M6pVED7FZWcuV9iifls3BJ1bO+4f1RsBdtBQVaLGyPqinYzZaMHW5v2xIJIl8uQ8dJI=
Received: from BL6PEPF00013DFF.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:1e) by BN3PR12MB9595.namprd12.prod.outlook.com
 (2603:10b6:408:2cb::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Wed, 17 Sep
 2025 12:50:00 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2a01:111:f403:f902::3) by BL6PEPF00013DFF.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.22 via Frontend Transport; Wed,
 17 Sep 2025 12:50:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Wed, 17 Sep 2025 12:49:59 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 17 Sep
 2025 05:49:59 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 17 Sep
 2025 07:49:59 -0500
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 17 Sep 2025 05:49:54 -0700
From: Suraj Gupta <suraj.gupta2@amd.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <michal.simek@amd.com>,
	<sean.anderson@linux.dev>, <radhey.shyam.pandey@amd.com>, <horms@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <harini.katakam@amd.com>
Subject: [PATCH net-next V2] net: xilinx: axienet: Fix kernel-doc warning for axienet_free_tx_chain return value
Date: Wed, 17 Sep 2025 18:19:48 +0530
Message-ID: <20250917124948.226536-1-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: suraj.gupta2@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|BN3PR12MB9595:EE_
X-MS-Office365-Filtering-Correlation-Id: 55af5897-dce4-487e-8e01-08ddf5e8b67b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rjkDinDqUIhBExSOAEc5SiIVXojGN6gXunBvdgJFv6b4Aio+xd3B2N2GN5SY?=
 =?us-ascii?Q?FNx+ZfM52Mh4r1b9/VBJg8o6cL9EQqf5ane5Bkk51LPn0D7SZK/y9fmep1JJ?=
 =?us-ascii?Q?gM3ag8MNFlCev6VybwDVwE0PLjDWD20woeUZgXSqe2UgMVXKy7JdJSoH8iD0?=
 =?us-ascii?Q?Me5ntTD4xWkcB+YLb1ojmnzSOpfqYDpjhdyc3cdsTA/Rwr1iDY5gjnvWgmI7?=
 =?us-ascii?Q?vh9HGzwziFvRwjSiq7ACoWYzzNbBD9G0TGR1ttvEJgbEXu3h4+9QggCgKIcm?=
 =?us-ascii?Q?FCKaRGFiDtXW5YaRSNEFi/eW1Ww/7RC/tc4atNvoqC22pdS+DU5st9pEtQXu?=
 =?us-ascii?Q?RiCHZXu1hF7m5YpOBaHJpEzOWfVUQnkWJ5wF/pUteXOB3z1Dm5OzHeWPeGql?=
 =?us-ascii?Q?vGW/CbGt32lLUzEpFh9ONyar01oLOV4+P9tTKLXoxr2dF4z/rBDclxJZr2Go?=
 =?us-ascii?Q?rd5XbE9AU0oJmtElQEG4vE3+DVRCvhGt9PFAZHCw/CE/tskUv1b58Y8kqXIN?=
 =?us-ascii?Q?6UZjdN/93mLFhuqEuJVC6CVT+TUbS+JcmMaZ3OIfP4v79gl34a2ZexubNp0+?=
 =?us-ascii?Q?FJygrrPp3E25KsEsh8WnPiiDFInEPKX92YPRagd9i6sWCQ335vkFPrDQVNu+?=
 =?us-ascii?Q?0gqkNLZGEoISY64oSnXbsw62dKB+8dkw+OE7K7DKHs2fVqYdrNHbmV0z/V9L?=
 =?us-ascii?Q?qf0Juqu3ZldW22Eh3BJ9rDoZKz+wHR5DlV2X+kPnvbfCwfcrggsmP+WhpiY/?=
 =?us-ascii?Q?MzOL2ESRYzmkb6fO6lLOJCdGnEo0c2gaacl3111YU+j0COt7/mIjv2nsupVA?=
 =?us-ascii?Q?ZW9DQctqTsYWz81Kkll6v/cJqqcDXAkVWrQPxlfgLwmGCXB9L1rmXf4zKQrU?=
 =?us-ascii?Q?kpLmGDpOlfStQXA4MEI6/S70X/fPQd3XT4HnYVyCQAG067+yRiJgbGve0lzr?=
 =?us-ascii?Q?jxWQ/o3YzgEWDpX/5bFT79PLamEukQchKLwpyyKxWknbEUfyIK7K6yg9cTyG?=
 =?us-ascii?Q?RmQuhleDISCGeIZiy/CbCAfhvuXURORS+Vw6pQcsz/WYDYyagEcXlCOPdQu4?=
 =?us-ascii?Q?D0OGhb71X+KGyEH0fNQBuzxjrFw3F4DWqiXNIMGA6Pk8tFrtAjaT3wmAFQdG?=
 =?us-ascii?Q?71sHqA59VrGelEZZQs79Qqr2t3ZR8dTicKSdPvOhF0ruuTJYOQIxgtsOFb0P?=
 =?us-ascii?Q?No/bNJ2rvZwMEd3zcrFAPSgatGxyXTBRVQAm90XL8Oe8fgegmC+IhQXAbE0P?=
 =?us-ascii?Q?JNuQdOvGDXOrpTkMyez63n89maCL598nWzwXGQUIoroEWtyk079lQRILp0zY?=
 =?us-ascii?Q?56kb1mfXtzGTHFPB2gpjkPfDVCTCN4bYJjf3mI131cRq/U5736zohH2TTiFx?=
 =?us-ascii?Q?sZKRDnGrEyTaZ4qq5HcZ3pGYXkwCo4cSxJVqQToTNlAW5M3Naeh2LF/czfJj?=
 =?us-ascii?Q?T5LLuH3458otMg+HbcJNOwVlCg0PFV3XaGabwGWLh7aMA1pGsP8JejThPOeZ?=
 =?us-ascii?Q?3EYaW3fOQ7g8jklpTb5l7HbWNHoVQJR9uWYy?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 12:49:59.8817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55af5897-dce4-487e-8e01-08ddf5e8b67b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9595
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_055017_019262_29D8B602 
X-CRM114-Status: GOOD (  13.33  )
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

Add proper "Return:" section in axienet_free_tx_chain() description.
The return value description was present in the function description
but not in the standardized format.
Move the return value description from the main description to a separate
"Return:" section to follow Linux kernel documentation standards.

Fixes below kernel-doc warning:
warning: No description found for return value of 'axienet_free_tx_chain'

Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
Reviewed-by: Sean Anderson <sean.anderson@linux.dev>
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes in V2:
Drop mutex documentation patch.
Add Reviewed-by tags.
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index ec6d47dc984a..0cf776153508 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -773,7 +773,8 @@ static int axienet_device_reset(struct net_device *ndev)
  *
  * Would either be called after a successful transmit operation, or after
  * there was an error when setting up the chain.
- * Returns the number of packets handled.
+ *
+ * Return: The number of packets handled.
  */
 static int axienet_free_tx_chain(struct axienet_local *lp, u32 first_bd,
 				 int nr_bds, bool force, u32 *sizep, int budget)
-- 
2.25.1


