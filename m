Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C00FCA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 04:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjNOEjJ3jcDl1fNjrEKQPMFT7hdfvdMO3x8qbjAzzRk=; b=QTvV30ke4IxRh8hE4VlE/WU2P1
	pQOZuGXqHwo7ke75XpjXxnhWziBtoaweFSG2TiYLa9B2SBoj3/L5VVKn+nquMbd26CpdCJcNhY1kY
	FLOaDBrJ/jDNZ1WdKwiw4O8khpNBVUR4y6BvriI7TYXZVsPAE2LB9fAnl6pKQJgeUFnNj6T0jk2rt
	/h5pgZfNO4DeIrE7sCZ6ahWwgaWTI7R4yUEfVXqATgHVLz6zvROm2wQ/CfIHbClLYuB/AT937sum3
	KuYZPDPog9ZGavj/9gfsideo6JHuk2RkOmLuRJyJLh/OtjI8pnYR8cG/yyqZ0oAyk1/pEiicYSuy2
	pdKjSpRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1o4-00000005Rka-3On7;
	Fri, 09 Oct 2026 04:02:04 +0000
Received: from mail-centralusazon11011058.outbound.protection.outlook.com ([52.101.62.58] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1o2-00000005Rhn-0DhI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 04:02:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DdvKA3PqF+3uC42HDAtF7NUWAHWvbTr889VLtD8tBYjWpajcWi7lCPSJLE8NYTzh2ez69kveCYPil5ULjZBJtp0fwWBCOmnfbRs+I5xRdcD2SmF+N3XmoT4fZOereA/WkFE/idpvmcIqs88B7ZVNaLgpGov0nU0wb3RR4LFFDMyIXTrC8QG955kL44k4TErzHzdThx2S/fpgO0H6outBJgD89+8wCv0HrTlPkLHoQvMo9XAURz6lyPBv/+UjNS6D1Epa6CiqgpKmgIAcc+TcgUTB+X3wd3DAPvbE2HjW/Vgu848nzl5H5s1C5Ho0D7HGd55E8BILyk9NFNV0WJ6p9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjNOEjJ3jcDl1fNjrEKQPMFT7hdfvdMO3x8qbjAzzRk=;
 b=ryDrLWjgN2Q78YzY89ss8r6CeXQ92lz2PxXJzHAh5Sq4kvKpJtr0vTTzrJUmG5icqhGKU+4IaG3EVXue8bX4guNK1/yjTXEoLBmDhoglKFDAW6GG7WhsdBSUcSet+8OMLtaKdkHqwjZoMFXTEjJnmpalMeit/gmoUBSbtcjWnKX9Fsn6Cu+1YWUb4JBUZ5zHB3Z9nSAlFj1RRoka1V739apmgSkiqM3rvYPOlTh7Z9JT22fD1ATxShFY3LOQFazwDtbEowPxHQn52iW8v6xkcyAgjOiAeNrlz0IydBlvGJlO4St4nDoVlfTb2sP6+LAT2JOMysIdoYZjnTlFHB6Txg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjNOEjJ3jcDl1fNjrEKQPMFT7hdfvdMO3x8qbjAzzRk=;
 b=26kqD2+2RxEzwrBi16YRDyqEIQEWe5Fi/vWw62Ur0VbyGwAGxghAbDRAWGzLzAcIAUMcZUuK7LmunLoaNvY0tMtzQoi4kPunme8PJ80rBAYI2Mnu4NbmXjgVuGH8owyr7i1oUiH7r6EmEwOK+cjY4NTmy5UIvHQ62iovcHwSSag=
Received: from CY5PR15CA0123.namprd15.prod.outlook.com (2603:10b6:930:68::14)
 by BY5PR12MB4145.namprd12.prod.outlook.com (2603:10b6:a03:212::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 04:00:48 +0000
Received: from CY8PEPF00000053.namprd05.prod.outlook.com
 (2603:10b6:930:68:cafe::26) by CY5PR15CA0123.outlook.office365.com
 (2603:10b6:930:68::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Fri, 9
 Oct 2026 04:00:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY8PEPF00000053.mail.protection.outlook.com (10.167.247.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 9 Oct 2026 04:00:47 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 8 Oct
 2026 23:00:40 -0500
Received: from xhdnaggolla50x.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 8 Oct 2026 23:00:35 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
Date: Fri, 9 Oct 2026 09:30:14 +0530
Subject: [PATCH v4 5/6] dmaengine: zynqmp_dma: Add new compatible string
 for Versal Net
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261009-adma-pm-fix-and-per-channel-reset-v4-5-55f5fe409c55@amd.com>
References: <20261009-adma-pm-fix-and-per-channel-reset-v4-0-55f5fe409c55@amd.com>
In-Reply-To: <20261009-adma-pm-fix-and-per-channel-reset-v4-0-55f5fe409c55@amd.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, "Michal
 Simek" <michal.simek@amd.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Kedareswara rao Appana <appana.durga.rao@xilinx.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michael Tretter <m.tretter@pengutronix.de>, "Harini
 Katakam" <harini.katakam@amd.com>, Shyam Pandey <radhey.shyam.pandey@amd.com>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <git@amd.com>, Golla Nagendra
	<nagendra.golla@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791518416; l=1554;
 i=nagendra.golla@amd.com; s=20261008; h=from:subject:message-id;
 bh=WOWGYN4gyW4+iSBG1amVKTJ6rWwGT607d6SKgV00jmg=;
 b=EAwWdWrRNUBn+zK95qe9fQehLjHKQUXukdh1H83YSJTdtQrVrwT60+fAOvN+qlABC5mCY02fv
 jYT/wL72C6SD7buWhyfjeMgzAzTTW5l4lvcuAwyWowB/XSmGSvhRLYJ
X-Developer-Key: i=nagendra.golla@amd.com; a=ed25519;
 pk=pCRGj/0mb0C3aDMpVVZeyBqOIQZUKGJjCKL4QZTu7nQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PEPF00000053:EE_|BY5PR12MB4145:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b08648a-e1e3-4071-4020-08df25b9e6b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|1800799024|82310400026|23010399003|376014|921020|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Juzz8rGl0HJW15CaANefrTeTNfHHTgvDtpp4GXKhgICWeaa41qz44GaTd1zdyzKgf8jdu4T8+agf5HMCUvQA+3bxGQNGfRtD11GSCJgvonK5xX1GHv7wTu+FxHhp2TNVpc0JGco3lhFZT38QRB2yGX2UJOE2t6lIC4JJRe39QAE9K4YBDetSJRvSIwlyCIYRMIbn2C66CsJGZv4zKYBa95j6r2kx79QA6ajkCi2LxBlhO7h6iRTlogNP02qAVL4JH5y+nOKwqazJgdhcqGN5j2Pmp2MP0otZrRCKSzZ9XH4vIyvAKpMV9xXTEK/HDSFBGBNrDP+jn/rQjKkNO7iPu92bQAJLeATYyqcR16GMUlew2ElT/W+KCUeDE8AAcn6Pjij1Hlo52B5oztiO3bXtPhRUCoWRQwJVXXnrN0TgzNbzw17mrhqlafezwtBRy3fLyHiQEd3EiVTHO+Kgp6LByq+ySXxmJyvW/QXz55NLZRtPgGo5p+ScYm5LqTpT8OLTY1tqRxImU1DYkFUtPYtlFJTls7NCIui2Ru86VBNBH2zsnLSH8m9ovh18/OpGqltMVGynGYD1W+HHgt5NSCGBywHu/6pSkLM5JzuJj9V0CKcJAQDtzE55H9TjXK+QF5jnod3yFpzUU4v1Sw/8x5G1zdLWG2M3/knUjDgpcUwY6/6JlH5e14jpCSyW07cfyuxWeJcT2ErrbJrUI/qqkhNmOgJYzpHWidA1etLuySgMKlyf3B/Th2tfRLvhzc7jQvY6
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(1800799024)(82310400026)(23010399003)(376014)(921020)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NAaWW5+f5TvyTovowNjYhkfSCVOBj8QWy3z2Qslv23TCzdO3hTi6n08aT5IasStG+OXFEQu2JCMiWRjUbAhN2QclyEKMiPdIpWRojPPpxCLqXQPiSxcrDwTh8kOO7lUUqFHeeJXVLccWX2zcsuFT5DGxOnNtLoVhIjEAw97M4xEylYVe64O9uvrkEcZb/xMIuzDUPWdn72tJ+tEnz3hlHcv0kHymwKTb4mpog8YCGaPHB6Lto7D1n6EqqUrxjdC7AsjYOraDlEZkv2OAdkqRRQpEQM4O6H+rvaKwtpfqA64X5g7f1yml121Mi+OEgJCkcQyqIIfHUxC/oKjQRqCwXk+OgCdg5EiaPoEu7nWfFN+jgO45353cUxxxG40QYkR0TJj8+KydOaC0Vh5UOyZmaiYxUNPuYJgRoraD9n8ls8GILZMKG09GFWTUYNrIwGCS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 04:00:47.8569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b08648a-e1e3-4071-4020-08df25b9e6b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY8PEPF00000053.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_210202_118079_2F853A23 
X-CRM114-Status: GOOD (  12.59  )
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

Versal Net previously used the legacy xlnx,zynqmp-dma-1.0 compatible
string. Add amd,versal-net-dma-1.0 to the of_device_id match table
with SoC-specific match data via versal_net_dma_config.

Introduce a has_reset field in zynqmp_dma_config to indicate whether
the compatible requires a per-channel reset during probe.

Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
 drivers/dma/xilinx/zynqmp_dma.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index b5a5e93e42d5..6881dc19435c 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -258,13 +258,20 @@ struct zynqmp_dma_device {
 };
 
 struct zynqmp_dma_config {
+	bool has_reset;
 	u32 offset;
 };
 
 static const struct zynqmp_dma_config versal2_dma_config = {
+	.has_reset = true,
 	.offset = IRQ_REG_OFFSET,
 };
 
+/* offset = 0: Versal Net uses base IRQ register address */
+static const struct zynqmp_dma_config versal_net_dma_config = {
+	.has_reset = true,
+};
+
 static inline void zynqmp_dma_writeq(struct zynqmp_dma_chan *chan, u32 reg,
 				     u64 value)
 {
@@ -1229,6 +1236,7 @@ static void zynqmp_dma_remove(struct platform_device *pdev)
 
 static const struct of_device_id zynqmp_dma_of_match[] = {
 	{ .compatible = "amd,versal2-dma-1.0", .data = &versal2_dma_config },
+	{ .compatible = "amd,versal-net-dma-1.0", .data = &versal_net_dma_config },
 	{ .compatible = "xlnx,zynqmp-dma-1.0", },
 	{}
 };

-- 
2.43.7


