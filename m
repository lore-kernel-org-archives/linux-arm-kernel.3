Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8D2CAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 07:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uhzabJiWvRjiHm9xJQuROgBhVykrRwm0XAI8rVytfDY=; b=M8StcZlOtnafcFsAZHxNO+1BTA
	NpiwhIf1G+9iqnVEMAPNFoXYBtlDxNCXQug1TF45OnvwKc5PyjJ7ZkwKs1Y+ZoNhKt4AQfp4t1NeN
	pO/P1zA+ZMjF3gO9J6TNyqNEDquidIo9j1p0rut0YQRDAKrofPLqRkTR55KVdpnkIZQ5xhcmQ85eN
	3cXkSce/3CuWoGx1kbhwpIvVPEtLcKcjbmO1Pln5uDNQ2sotFG0uDswBt0MsLIsVOelEwxKSetS5V
	PCeyp1w+034MZx1TGtGcJZ5TXIEOPT2i4oq/7y6J4Rp6I2qYzz7zrU+IyWIwpdmz+Bc+yBIWByNIY
	GbkW4oVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwbjT-00000001U5H-21lb;
	Thu, 11 Sep 2025 07:28:39 +0000
Received: from mail-dm6nam10on20625.outbound.protection.outlook.com ([2a01:111:f403:2413::625] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwbjP-00000001U2i-3Tkr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 07:28:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D76NKuLUpqnc56USjwsSyfpThfz4Denh65yXpVz4bYTeFAdWXJPpKAKHeMls6VtHBaVd1ex6rsiQFuEtbWBYtT3Q6MvjlZRe03I3isS/e6PDGp92lrB8dXHcTm0/Gt4bDRaJWOS6jD/jDJ3/p9jZaHQn09DTwnLpMTxDmLpFnOqqDhxEXSbxiF933ER4d1xOZLBFSGI6+idOEKWSnNSsaI4LzxH/ZFb0NEcWZKmYQx3XQFVi22E6aj+IAGSmP5tn7nZHYcWT+u+Tk8cXkkssRnILqnFSq4lW9Xz6jGTnUW0yAdfz6QuHY09FNCCa7cQ4Q2nPBpZKu+6UQoaxrmcVHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhzabJiWvRjiHm9xJQuROgBhVykrRwm0XAI8rVytfDY=;
 b=UzmLXQA84gml+q99Dy7NXLQ6Gr3jJHhX20ZpM3exN/307DRVLczCcuVxqxjkSrUwK4UkzMbPjFj9zQdKwsMfHr4t5NWAG78X/LkSsf6w6bo27o0pfjtFbuIsOHk4h2/sHC9VPKaQ+JiUYTvVkoyFsFyoxkpP+xPKwaO+Vef7IWTcKCGGb0xCPPzaln9OuusyM3UootofyrJM16/iEv6uZtRoIPwizuWAwWTiNwgZwsg1FZioxeNfYdXIdGPTmfUPwF+xRDPLRHvzpRuk4r0xSsisU+FdYvRFNfOxKXrzQZtadBlQdIznI4I2onvetgr4jZYVGsge2LW5dXfy7UKBPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhzabJiWvRjiHm9xJQuROgBhVykrRwm0XAI8rVytfDY=;
 b=AfxRKfPgEPlzm7K1LbhRrvxuXmvLV2gz2/emVtf2lLtmlmWScQ2LMVkD/N0jLKqzOKS5LbOp9UvUh7hPW/1uLUhpJ/hznLUIhIBLR3rgrl1YdgPw6LJAluNVt0BlD7bWneDieKfL26oz7yhWCh8J6llNOOZgoUy6Kka3uLgyAiA=
Received: from BYAPR04CA0003.namprd04.prod.outlook.com (2603:10b6:a03:40::16)
 by DM6PR12MB4043.namprd12.prod.outlook.com (2603:10b6:5:216::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 07:28:28 +0000
Received: from SJ1PEPF000026C4.namprd04.prod.outlook.com
 (2603:10b6:a03:40:cafe::14) by BYAPR04CA0003.outlook.office365.com
 (2603:10b6:a03:40::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.16 via Frontend Transport; Thu,
 11 Sep 2025 07:28:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000026C4.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 07:28:27 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Sep
 2025 00:28:25 -0700
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 11 Sep 2025 00:28:20 -0700
From: Suraj Gupta <suraj.gupta2@amd.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <michal.simek@amd.com>,
	<sean.anderson@linux.dev>, <radhey.shyam.pandey@amd.com>, <horms@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <harini.katakam@amd.com>
Subject: [PATCH net-next 1/2] net: xilinx: axienet: Fix kernel-doc warning for axienet_free_tx_chain return value
Date: Thu, 11 Sep 2025 12:58:14 +0530
Message-ID: <20250911072815.3119843-2-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250911072815.3119843-1-suraj.gupta2@amd.com>
References: <20250911072815.3119843-1-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C4:EE_|DM6PR12MB4043:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c234af3-52be-4bde-707e-08ddf104cd21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qDHSA4TI2IKIG+llhMzOti7p8luhet1Kc3arfF6KtIEYlptQdm1V997qWnLp?=
 =?us-ascii?Q?6a/B7lM2UGbnzltH1DMWZMX3M0mAd/RluScOpJMzbIciF9ArZh5EMkOYZl8o?=
 =?us-ascii?Q?8L8onxStn+sc+NCKYBN+TxUqLBHg4PwujQ/2YdGYRoTBSw64cm6h2uF4KIgt?=
 =?us-ascii?Q?NlrFlWhHzlBrwvYNja2Wl2+LwOKf7aSNw6kg5qiPd/xoZhnMVYH0XsfIiSTB?=
 =?us-ascii?Q?GegtDZiqCDhoZl3imoz2gU/0FnE4/CSdPP1Lv/Bm5ejX/31czcgi28YpZ+ey?=
 =?us-ascii?Q?ATJxCzw/u9T4UcqAcGTi4xMXLau7VJSaLQ11AWPLgVYjx6G3SDO3LPizUysi?=
 =?us-ascii?Q?t0cl6lyZ55+uXkk6wm4NPD8AkVjp3ordQ078Anut7BrvEGVYd2mnIqh+d0uo?=
 =?us-ascii?Q?da8qVaICAx0fChTua3lN4XjO8R+UwkYpJKRSzw/vRNDvLuz/X9cz8IBu6Fb1?=
 =?us-ascii?Q?RM8kIwM0/hU423NAk5mfJpibq6Ebk60lQvatxzNs45D386M2PB+XYgdV+MZU?=
 =?us-ascii?Q?+LQxoVXR+KLO7lS8QGFFnTV8447a84TOsOsItaVlCrpJgfk4wwbnZrxvAMuM?=
 =?us-ascii?Q?BJiMrF46YvfXSjsHRMh1BIQMskbu7+J1NGgD267Z/4cr10P4YeFUITqYyTEL?=
 =?us-ascii?Q?ngm7yeidXkSot++ROQKM1Z8khhczu42+o/HeUZvM8LmItWzdXMidtkLTSxLX?=
 =?us-ascii?Q?n88ye5QUSK+YxPA1flTQcACZZrsU3S2DnNtRkYOZ6IK4EJ7PVg69+sOyMdcX?=
 =?us-ascii?Q?CuOJCTpiMjR7UwGIfdMkEyvesgVz6DtMRyBiGxj+NhnhDbfqZaXwcS7pgaQN?=
 =?us-ascii?Q?bOazHKQvLcD3xHr+V9lm17Efx98b2EJmA4p7f8ZXwzzuKPdg3iWfqnibBnAG?=
 =?us-ascii?Q?ieSQTDMkrg33S33sEQirxF3s8aBKX6M49mRkiimwbop1uWkt7e77R+HV6ENc?=
 =?us-ascii?Q?C4DFrtKqHc06xvpKfagCFJy2mRdKe4TotbHAelf9L28CirucfepuT8H7HTwK?=
 =?us-ascii?Q?F4O2q7GTI6DYAwfAVM+6tL0qmjYOcpHiPtnihW7giB4Zf5QCocrn90gg5TNH?=
 =?us-ascii?Q?RuxaPeAhu7gP1RT6YZLJUS4vG6QKeGHUdkhux8Yc20OqUFYxqLAmpKPKLK/i?=
 =?us-ascii?Q?Xs9ygapBHpbZ2prZtP1BpEfvD5VoYcUYEinIMw6+nAknkeWFukFwFgU6gdv1?=
 =?us-ascii?Q?/d1moZbmowalQTZ9EayiBrxhzXlGrwyTAF8dnW1DWOT9cQwoi/43zcajb67h?=
 =?us-ascii?Q?9/MDkvCLXpdrZpQW62JaXKS004Qbjx50UDNG6/45Ovb51twenZbk6q50qNZ8?=
 =?us-ascii?Q?xF+6ABBSkGTKokJ9tndDrtziWgnDzg3tDzsHAlutftlKEW3MrRNnKG02Z4JS?=
 =?us-ascii?Q?hTSukQXI9og/qZ9U32cPz1abHTxSLK0EaCfQDZrG4z6COmnAvhXR7GRP1Pxy?=
 =?us-ascii?Q?sazPYw29MgePjYx2/9YdxajII7jtgFrJW4R3sH1D8dHxafIxHHNM+Yb0pIQR?=
 =?us-ascii?Q?tSDqpYnQMAKFuCWc23zeCzQrF82ihwIejA6L?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 07:28:27.8803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c234af3-52be-4bde-707e-08ddf104cd21
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_002835_868964_BB3EB837 
X-CRM114-Status: GOOD (  13.30  )
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


