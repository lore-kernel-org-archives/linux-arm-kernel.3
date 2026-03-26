Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0CE10AB802
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 18:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uiz0L0xlqs4WTumHwdZBH2LzZMDEmvkBffFlvoDjP4Y=; b=BIX89h7A6W/Jy2g3ARUh3cb0Xx
	4VSTjjcPUb7HqYeMR5vHPbbnRooux/NN1c2KHgIZqoZTgihYtmZGTu1A5vuJ0uC1h/6drtYNrzOU6
	ODAPa3bi/SOHT6hWhMySmuzNh+BY6OkdwxZREkc7UQBAA7XC7m/3Y9VD7gO1csYfK/BixcDHUwJy7
	wnU6WA0b13IHC4jM9SeYEbwB9RZjoApoGmKEEO8MAfKJjnRQreuUoh7gsSVMFH6xONFhvFopJnJ/Y
	TlFdADx8lymHEU+2XYBtrop6sfJFOjelmjwPQeHeLQjBvIZ/IBp8seFc67TmFrCBKmd7kvyIYG/4b
	yA32hw/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5prl-000000064XV-0ORO;
	Thu, 26 Mar 2026 18:55:37 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5prd-000000064US-3JO4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 18:55:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yibpGYJ6JzKfv2ADy2NnRLyK3wXfDjCQrJfMzOkUCXC9XqTLqTpbafXXYZgyu+9H3pb+oRTQ5TOxMO5XP5whx1fPzCi9UmY2BOdgITZlNxUCOr+02GFs12B7DDpXqCO+JlpabA/5rvxKr99eTZX/ruAhmPojZvVbmOq+W5ZUFEMs+cXXVR72wT2XMisMTAikrBOGBhmJsWFVj2DJx8VykxnK+/NbmQN2B2qZkBRExRSkdu7I9fFcpPyjvkuXdvffeTvq/opDpJrDo6PBvqpg4UYgjCJ16Xn2ESSfHwtboMw8xh0ij4JHdTspQzUMevri7Od52gs2GyMKgVshdSaayQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiz0L0xlqs4WTumHwdZBH2LzZMDEmvkBffFlvoDjP4Y=;
 b=q7zy2f+61ZtRZeFaRYYBXNPf0o9K9F/HaaAjQ68NgVlELtv5zNkYoD046ge8+S5sdNoxOf900iX7g2kbqjiN/IBy989ohrC/HGxGWZXsKMFyQ0dY/57ZcK3qSgwKkjVOTvs0p8mcEuD9ENfK9b/CsPiHO91sMWoTLCC/3ia3T9DtCgrax2RU4It+0BK9yjQbCThJRhUQDTMPwge6CJ/x3WCOETutQZgkckmfkJPKDRWf821WLB25vuqAkPfUivQ/GyvlUQb3eUU8rFfAg/0RK13hc92RxxqlVxGyQhHmqyk881nZDz7w+w7FTBlYkdd0kHGBTR6Bs0rHzFtVboartg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiz0L0xlqs4WTumHwdZBH2LzZMDEmvkBffFlvoDjP4Y=;
 b=SgFCCtiepgktmUk/JEQrivSmY8wvyK2x99Iz8Of0c0vZRwgWALu2sET8udTPun27spQV46Hvvb0tnaYxOzpyBay/Ru1CetzaJ8i+xGJO9HXAUjmKgB51zyHw/c0tvP+RUw0X7QdvATGZwSGlyNIzeQPE4iZOlGuERt08R+TjiZE=
Received: from BN9PR03CA0415.namprd03.prod.outlook.com (2603:10b6:408:111::30)
 by DM4PR12MB8498.namprd12.prod.outlook.com (2603:10b6:8:183::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Thu, 26 Mar
 2026 18:55:18 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:111:cafe::d5) by BN9PR03CA0415.outlook.office365.com
 (2603:10b6:408:111::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Thu,
 26 Mar 2026 18:55:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 18:55:18 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 26 Mar
 2026 13:55:17 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 26 Mar
 2026 11:55:17 -0700
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 26 Mar 2026 13:55:14 -0500
From: Suraj Gupta <suraj.gupta2@amd.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <michal.simek@amd.com>,
	<sean.anderson@linux.dev>, <radhey.shyam.pandey@amd.com>, <horms@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <harini.katakam@amd.com>
Subject: [PATCH net V2 1/2] net: xilinx: axienet: Correct BD length masks to match AXIDMA IP spec
Date: Fri, 27 Mar 2026 00:25:08 +0530
Message-ID: <20260326185510.3840084-2-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20260326185510.3840084-1-suraj.gupta2@amd.com>
References: <20260326185510.3840084-1-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|DM4PR12MB8498:EE_
X-MS-Office365-Filtering-Correlation-Id: e296ebdc-198f-4b46-6eac-08de8b69396d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 19uRujjrEswMKI+0E316OhnR0/Rv8AsmwjlegCV7aiYb48sAjz2b5gyy0JUAlQsRtMcxHtxX7F2iNYa/GZNSVYqTfNVOk9iguo/lsAL7izDWK/pzqAmA5zJaVJI+3AvZSt5kn3qG8ulwnZsUsLU3+7fSy/tPGGulc82URtskSOvIr5w0kEKZdWXEsMGSHYudZhu3mqqzoto+ehBAW7i6kYvwT26ciXaYRofl0blPayzTuzCJgOCgHSJ5NHfmo1xIJDtJpYyH5cPQg0yncafz+8rZDw7/Aq0YPbkkRZT3jY3T5FCd7LKXOZ4av4dzzkbKLEVNxDD8+AAxFfKf3YFEIOIu7kE/wJvOfBXPorkV1inxuZ2DmKY9rXnspoirohzJEEov5MPtqREagUqPhi/5y/11ZX7pHI8mk56yjJfodVLdvxMRtzCmpos1VlzNJAajGPTI6o03NLWhBmOFksjSCsejLYGHHf41syY7YcOUdWdsv6zME8Q1BBH9zNdvAMGfoVO247yT6PsOe0KU7yKGwgyFVl+sNmLdnwpzn+er9y9/KODST+6feu3D0zJVBNlIws0HyeELiHxUFz4J71KyILVfarJjcTtjxxq87okxgCMHqMcwzsvlujTg0OJk+YATKdvQ18UM0BwnKf96UqtDoIdUbXQJyMTsr33OuKPbrPDvirNjz5zs26tV8Lu8VpFZBYmTNXH6jqMrnRIXMq3KgRJqd/mJI/p+HxKmr7sZYbgdx1y8J+yfAj86OeUXSr1TEPNGvW4AVHYeVFngUgggrA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: N5UtcK8fBvoMaUXXB5aENkLiCgWdTAozMHPhX+oGR4gWSJ+qsjy5L3wHFa6ZtafedHKAevzhR/z0Q7WlqwlNc6F9bjF2564ONykwSAK2ioaD9uYjUUE9/77hP8yGQ5xiXo1W+IOjKQF0XqkKlYnjSY0d/WoXCZ9dKZLUZkVjiH8uLkil84NEHHqr3wdyoS0p24u0/qDxX1OIGv/0ZyxkKio5bw3i3dzytxqSvqD9brUKj+WUhRiX02eaTwGlkX9GkawRObl/iPH4uoGmm/aMqErFVHXnpnXO3x5yuD5lCV1jpKzcuSaZbN455LIQdfvhMYy1enGSCIOLB+2kCmk87hu8PJ69sZj1wUvSiPMK/+8lEymXwuGLYhHiKAVElBPBNQQ5qSv1I3eDWK+CPvnbqTjxSdOHC384vVBfzhZQ/Ulchvx+9+HLLelSaa26fpZK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 18:55:18.4107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e296ebdc-198f-4b46-6eac-08de8b69396d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8498
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_115529_826781_2CBC5DF9 
X-CRM114-Status: GOOD (  13.06  )
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

The XAXIDMA_BD_CTRL_LENGTH_MASK and XAXIDMA_BD_STS_ACTUAL_LEN_MASK
macros were defined as 0x007FFFFF (23 bits), but the AXI DMA IP
product guide (PG021) specifies the buffer length field as bits 25:0
(26 bits). Update both masks to match the IP documentation.

In practice this had no functional impact, since Ethernet frames are
far smaller than 2^23 bytes and the extra bits were always zero, but
the masks should still reflect the hardware specification.

Fixes: 8a3b7a252dca ("drivers/net/ethernet/xilinx: added Xilinx AXI Ethernet driver")
Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet.h b/drivers/net/ethernet/xilinx/xilinx_axienet.h
index 5ff742103beb..602389843342 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet.h
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet.h
@@ -105,7 +105,7 @@
 #define XAXIDMA_BD_HAS_DRE_MASK		0xF00 /* Whether has DRE mask */
 #define XAXIDMA_BD_WORDLEN_MASK		0xFF /* Whether has DRE mask */
 
-#define XAXIDMA_BD_CTRL_LENGTH_MASK	0x007FFFFF /* Requested len */
+#define XAXIDMA_BD_CTRL_LENGTH_MASK	GENMASK(25, 0) /* Requested len */
 #define XAXIDMA_BD_CTRL_TXSOF_MASK	0x08000000 /* First tx packet */
 #define XAXIDMA_BD_CTRL_TXEOF_MASK	0x04000000 /* Last tx packet */
 #define XAXIDMA_BD_CTRL_ALL_MASK	0x0C000000 /* All control bits */
@@ -130,7 +130,7 @@
 #define XAXIDMA_BD_CTRL_TXEOF_MASK	0x04000000 /* Last tx packet */
 #define XAXIDMA_BD_CTRL_ALL_MASK	0x0C000000 /* All control bits */
 
-#define XAXIDMA_BD_STS_ACTUAL_LEN_MASK	0x007FFFFF /* Actual len */
+#define XAXIDMA_BD_STS_ACTUAL_LEN_MASK	GENMASK(25, 0) /* Actual len */
 #define XAXIDMA_BD_STS_COMPLETE_MASK	0x80000000 /* Completed */
 #define XAXIDMA_BD_STS_DEC_ERR_MASK	0x40000000 /* Decode error */
 #define XAXIDMA_BD_STS_SLV_ERR_MASK	0x20000000 /* Slave error */
-- 
2.49.1


