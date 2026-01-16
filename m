Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFC3D4A615
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 09:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPT97ZO92JF5iijb60KQS1ccCmcahHfYT0GR4HzkkRc=; b=WsINohGfz/3JE92fZWQZv+JGtb
	ALOFrcCwPsp0jGc0kvgiGdpj6g2mOPbnS3Eh6JkL+tijfQYSlnUoZB/vgTw7vPuL5tGHqenYnOYF7
	iyYwtQVViyytf/ykvh8bXD4IItk1l5XhLymWYMkV7bz30WirPHV0C0cstEZyGz9aPb8Dx3aBADqG0
	iUY9xU2WKqmeHefz0d48o2Un87W0vuMAnNiDgrjivLXUwdZ9SVNTdXx9WTQp3tmFKcOAhZOM6BR+s
	A1X4W+JEVUetJIw3+3z5iK3a9F3eRnaug5t1F/FqSrG9kDxpAUXIATqK4h4D6G5aoiW0aK2+D5rAD
	3tiPFJXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfxI-0000000Dq9N-0nTO;
	Fri, 16 Jan 2026 09:17:20 +0000
Received: from mail-francesouthazon11011060.outbound.protection.outlook.com ([40.107.130.60] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfxF-0000000Dq7P-1zz3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 09:17:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qvpXsH24PMTe7meSGv1gt2YAi76DcJcTslyV28VAA6xwrTeg4+64F/hWrNMhnLzwevAW91c04Cyi8DStRcTT4Y3pwcMo8jwksqmhzh0A8988qwzCoFZwjwe/1GFoSvYcK79qbVPmcqilsI8W9rVUYaLqH8Bu2xdXx6bi+ljd8463McuOEmrD2MjW4Hfoav2PMl2q0lxS19Xfwwk2qfgCMAg97euEXjxWm3nQvNRKFJVpyieiUqcck90rGM6FdUJGaIT9WihZNH6qiv/Ndt2fFaJGRNXwjL47mHeyD7T1vfi4L9cd+YEwBaBL8Ff/RbKJC2Kh0tBDm7XdF4tZYovK6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPT97ZO92JF5iijb60KQS1ccCmcahHfYT0GR4HzkkRc=;
 b=GI+sgiBhZD4AnnElRr2N5fHgfZfNtaHwKLxh2rIaVa8pUuCbFYNnAkHkm7TE8dE87zpRHOv5opjPZsNVi+Dj965gBEcEhFGqawgxJHLaVm/FcAzgfsI8WH+qrKCCaoaFD+YJ2Q9lqy/32cLyXog/ni2i4jzpobqIJkkfCHsqsHcAA/lal8gQ/NsUP68VlLvRnzTx+CIcdSj/KYIHcGAw/oAcx7n7zgr9HOqOAmc7ueNEcO8ie1lOW9mUqzBH1LzNvPsUaGWLxchRueYFDB7cvopG53AeNRjNSBPbR1hucexhQLSUFOavHntV/tT78EEWpaDdxI6emuKAJyt/QFbT5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPT97ZO92JF5iijb60KQS1ccCmcahHfYT0GR4HzkkRc=;
 b=UrpBxp3hbsnrK6DxeOjW0KEhUPV+HBI/ewWUW0vqepuf6cCLXGjLNqOEgFGLouZBTTqtU2XO7rUwZz1hYOmlNP4jHYTtSZcAp1qvKYgTkziwPr6U/pJw+KtzasKCwgc/LwMMrGliMJXr+RQddlUp0VnWsOCfrkH34/vGzcuAHXk=
Received: from CWLP265CA0544.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18d::12)
 by VI1PR06MB6702.eurprd06.prod.outlook.com (2603:10a6:800:179::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 09:17:08 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:400:18d:cafe::6f) by CWLP265CA0544.outlook.office365.com
 (2603:10a6:400:18d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.8 via Frontend Transport; Fri,
 16 Jan 2026 09:17:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 09:17:08 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 16 Jan 2026 10:17:06 +0100
From: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: bsp-development.geo@leica-geosystems.com,
	LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Subject: [PATCH V2 1/2] i2c: imx: preserve error state in block data length handler
Date: Fri, 16 Jan 2026 09:17:03 +0000
Message-ID: <20260116091704.3399142-2-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116091704.3399142-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20260116091704.3399142-1-Qing-wu.Li@leica-geosystems.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Jan 2026 09:17:06.0418 (UTC) FILETIME=[E265DD20:01DC86C8]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019B:EE_|VI1PR06MB6702:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 512538e8-78b6-491d-c6a3-08de54e0062e
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q1d1Ni5bWYjw5NMGDOG/teezr3h6h2RpStCUBGOmlXprWk0aRcw/pXTfTYCm?=
 =?us-ascii?Q?yDVviuxU1PyALhZzP+AQCgJ+DYNzlPbC2TvXP0IzzHQQPRBHiztXnYmuwJbL?=
 =?us-ascii?Q?L41IIgKyWxJILuBsIynJVKC+aAWQH5CtZRnfI7AVP9LWPrgArXe4QZfhdnPS?=
 =?us-ascii?Q?kQe/i2kdC5S09Nf9W9UOje2HcTB46bytZzE5VE4hsy99vCCG5UAxQQ6VG9/G?=
 =?us-ascii?Q?z1daXXunWvVJGM5ReQsc4hBdd5gYCdDXP5ZrVZPQZvLmHeKOOVluqxhMJgm4?=
 =?us-ascii?Q?zmuz0Xw8Ta1Uhvdt4N63wn4zJySgzCZDwX2MvjD9DEnJMtXCbGXS0lWw1vLx?=
 =?us-ascii?Q?4Q1UwBBFiYygskdMy/xjUhdJw1C2zx+t8Jybs3+HwuzVWXCp5JR8Du/txSVd?=
 =?us-ascii?Q?XNd/x732F1ZTOqBKZ5hOSSE0AOklP1aMjX21Vi1ZWDqgd8CQ2LBViLcNXtYY?=
 =?us-ascii?Q?ZWXfDBFNSdXheWpR22pgn1hV4QFgU5dCXheYkldcpMHviV6RQ1PBN8CMEaPW?=
 =?us-ascii?Q?et0r/ya2BpYMXm3UFFYtTOoMnokBUk15JiPUiJbcpLmT2YhvyI17ypMw7M0g?=
 =?us-ascii?Q?2V4F6BqpE5obhC+jjkdRuAy+oUimjEcT2E75b/UCOSmn++4fNckH1+5WopPf?=
 =?us-ascii?Q?3LPmFMfqEpwtf8BGtU5l7I9nn+lRnjPr96euDrE+ltYm+1CZseLZS6+KSWKY?=
 =?us-ascii?Q?N9O8p9bBBQGSKGVRfyRa1e2jKZdFCkXLonDKr/L3Rx11wQaGbpG5W0KIlCgc?=
 =?us-ascii?Q?a32Sgc49pcHP1J1nHS/QhXQd6uF0LQNjxLzacJloVgvet5kAV04stb1KVW6g?=
 =?us-ascii?Q?39ZfqkqiOCj83L90ra9HiGMYRRC9KlJo6blL41eCL0kClYMNuMIihCJdY84N?=
 =?us-ascii?Q?Gy21VouB4kv8Two9jzz46+ZyStxOYKGG1XaykOCI3ujw9fJsFeoNJRxK2blP?=
 =?us-ascii?Q?6hNscsLa5QJh46k9CG8QkT0KnQRWzyilgxbektE08fVAURP4/EHGZ1D25NyQ?=
 =?us-ascii?Q?dcs3lHG6Jq6RgboYcJNyH5BgiRAIjJNDKUlDv3i6LDCEV40PVxXqci1MQeCq?=
 =?us-ascii?Q?VXv37g34J0AjB4n2H/ouKoFhIwMeKPdMd1oZAGOHV3wS0WEpQUePPq1h3o5D?=
 =?us-ascii?Q?m5v/ApsWixx+0L/eJMPIEycNlEGde9InLxMgTGsmLiujkl3Q/8B9Syw9sIwi?=
 =?us-ascii?Q?F8Ph3NHkEHbikELiirTF8lpxZ10TNHPf3NyfTk0gFDiGk0Cb/95vtpHVpyes?=
 =?us-ascii?Q?ArCEoRE6WHlP7VJWBjfigk0lfi2iFFX5Hi5e6/iT7ymlY/5ZrPfWc/Lub6v0?=
 =?us-ascii?Q?8K6rqe3hwfVGjrzqqY2CVqJ+g3mlhPzZrQyIW/KY0+daxrrOfeZNPQtEOuUY?=
 =?us-ascii?Q?VRehxvrJklcFncAYEPEHiXDkr4jLf+YG96hbXAf6aXHjg8T0InRAJU2+zL7a?=
 =?us-ascii?Q?e+pQwqVa0Tm6pw6cmd18ewS4RuscRZ0xCHyNLYaHoe3mniUJ1CxsT5iWY+uP?=
 =?us-ascii?Q?wc2WFjud9B1QmT58sSckYDIKzWVFeBuZsVWQkfCKVSyRf85Ha8URP7SZXSxD?=
 =?us-ascii?Q?XrwIj1JPirxB2dmMwye9sjMUviTg7KiHjKcFiG89WaqXVGH1TFGySBhRnNHJ?=
 =?us-ascii?Q?W5e37cS5PSfK+YF6efmwYtEcTqL9qfxQTDEuxnKM0pGW5Eh5DbHRaVsjo4af?=
 =?us-ascii?Q?lItHafC9pGwzRVW4uMG86kTPLWM=3D?=
X-Forefront-Antispam-Report: CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 09:17:08.5936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 512538e8-78b6-491d-c6a3-08de54e0062e
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB6702
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_011717_701727_D4FB3EEB 
X-CRM114-Status: GOOD (  10.46  )
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

When a block read returns an invalid length, zero or >I2C_SMBUS_BLOCK_MAX,
the length handler sets the state to IMX_I2C_STATE_FAILED. However,
i2c_imx_master_isr() unconditionally overwrites this with
IMX_I2C_STATE_READ_CONTINUE, causing an endless read loop that overruns
buffers and crashes the system.

Guard the state transition to preserve error states set by the length
handler.

Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
---
 drivers/i2c/busses/i2c-imx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index dcce882f3eba..85f554044cf1 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1103,7 +1103,8 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
 
 	case IMX_I2C_STATE_READ_BLOCK_DATA_LEN:
 		i2c_imx_isr_read_block_data_len(i2c_imx);
-		i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
+		if (i2c_imx->state == IMX_I2C_STATE_READ_BLOCK_DATA_LEN)
+			i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
 		break;
 
 	case IMX_I2C_STATE_WRITE:
-- 
2.43.0


