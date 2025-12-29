Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA9AD3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 08:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K/I6RRUjm9il6mjPH1XUvwoEPmNbJiY+iUUsgWRezhY=; b=MvAxPEmowWdqrLeia4AQoLoRNg
	yUvKdJS/bN5hFGcWeysFVZ6to4ViFqVnC6WWN9RqzNaR129GobZxOuI7TsTZy4LLzF6H3WSXJcMIN
	NDq5dl6+V2qzZGyJ7rNowhnbo6K6NyYbvlYpUTKDIT0DuSz4JX5fyscHo5+IJgqU3ouEiB8hijpo2
	fQy8TD65/uGON5X+JWPOhBsAFN3KXOWp6g1MDKX9D0oJpB05/fdWD1JwjHCSlOharqMHE5CncDP3f
	PzCyOalbJHnBw/8QcQ/xV9baPqnmQL+8LASJsgepWo36PtsBwGHy3gbn1wxV11rOkaM+vRPqOc455
	g6PioBYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va8S7-00000003SoW-40xG;
	Mon, 29 Dec 2025 08:18:07 +0000
Received: from mail-swedencentralazon11013024.outbound.protection.outlook.com ([52.101.83.24] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va8S5-00000003So0-1lcr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 08:18:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PgUxEkG2Jha0Pam5DyxZrdXi0eGjBZ7sANJfiR6GYsDhH8wGz9I2NIPnT1iGEwUb23OIf1+GUx7cjHm5JajP1A+YCvtXi5ch5tkXnHsFwYHZXJTCn+OF0uAAi6bDEjbviqapd3NmWWZ6Hz3Do6dl9pkOFC2vhGrZJOTQzXXTEAh+T19QMJShit05aWbEX4o1wDDMropwGilqQI3znwn8IVzusiMgtJgHAHD3Mp9AAVlIPAmsnOSm/DSDl9QxMUFfmc/P18Aq6+PX+31uDSKmzPx6716K6VkDj9oLang5GbjjjoAr2vl4qEeCOsAdeK9VrhcB0n0xJKxl+TTG5iRyIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/I6RRUjm9il6mjPH1XUvwoEPmNbJiY+iUUsgWRezhY=;
 b=mHo/AoDJvCDAa7R635tlh0f5IKOeJIcsQ7+aEr5ItYPEkSudsO+hNdRSZRXz+wrdBzs15X7KtuxxYO4V62k8VvZioEkCEGrLHTAzM7cCIuh8J4Z9ZJMU7XlowBaEd/hQ6CNAPEOZd/7o26yB81xg1FDKW9CvjdMahD6iHLTcA/z9bpeB+1kz6y0KtgyFt6sGpNMdYwgt9B+kVxgNrPrKCUUPCaSHitVaCjdu1XiLaAXPdI11tVTMBr/kWX35ZWeaSjYrmfg9al1f6/9rG4FgiyyKbn8j8rWE3smqSA7Mo2KW+viD0iiIEFQWumV1LGvXD/i7EFsAJu4xyKeCVZguJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/I6RRUjm9il6mjPH1XUvwoEPmNbJiY+iUUsgWRezhY=;
 b=jOtQuIh1hwMTHQoz3MsQXjV/1Wwt8s/6D6ZdDIun2Chc9w/5X6BhPr3aAlkHPL1e1hV048enZglc2zysmdUfOinDrKeAW/IfUKZwxzdNsQUa9+bEWP4yu3t3rRBBmEltWvtQQ5R+KgmpQXa1/BgnIRvWNRHR1m1MD6ckTxf1r7I=
Received: from DUZP191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::10)
 by PAWPR06MB9050.eurprd06.prod.outlook.com (2603:10a6:102:38f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Mon, 29 Dec
 2025 08:17:57 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:10:4f9:cafe::46) by DUZP191CA0013.outlook.office365.com
 (2603:10a6:10:4f9::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Mon,
 29 Dec 2025 08:17:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Mon, 29 Dec 2025 08:17:56 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 29 Dec 2025 09:17:56 +0100
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
Subject: [PATCH V1] i2c: imx: Fix SMBus block read hang on zero length
Date: Mon, 29 Dec 2025 08:16:29 +0000
Message-ID: <20251229081629.4081452-1-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 29 Dec 2025 08:17:56.0436 (UTC) FILETIME=[A3021940:01DC789B]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B620:EE_|PAWPR06MB9050:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 947fff37-5118-4b62-c8cb-08de46b2c5bb
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L8ihNu+2MZeSVrT3GimpqCvsVlKZkcja1LBjBUtY293qTrCLEIp/0YQpScQC?=
 =?us-ascii?Q?xLby5mcyZ3Pbldfsaq8e2Ev0TAYYTMHA1MCU0/ibZ4lwXnN+JdWjXu2v14Pl?=
 =?us-ascii?Q?o4hSDraWo+iJw8K37eM4emjLH6zjM7/PwIjZP5j/RKJICP3kUWXuPaowApdw?=
 =?us-ascii?Q?EyAq3vvOslBZSTur8QvAU+OjmnwyGG0upMYfBuEeEAHJCH8H8ZyWI1WCymlU?=
 =?us-ascii?Q?gQ3BPqBNoi7Lc15sggmx+SPPtTPuXkwrVb9clF0YoHLlPXuy6OXepBrmnMhc?=
 =?us-ascii?Q?4dH0gYW8VhlPQJeXwbWLHj+sCNklfPne+DvSktXcztAO3wauSuYLphCjApf0?=
 =?us-ascii?Q?rl1j4v+FqLktuHnA8ou8XElYxo5sel0rj6aukxg327v3VGN3IxFa0gxvb+lw?=
 =?us-ascii?Q?DQKqjmvvMktLfUy5KzghtxyxixFrKGZSiisrxCI2LKeOsy1I9cy3NxVC0iHO?=
 =?us-ascii?Q?tNbHgbpKTTHR40f/p9Jb6cVZmx3nKPFeqcWBhbNE8t3iDKfuko9rxtF17MZX?=
 =?us-ascii?Q?Mm7ohImyT3vYcBdPQQsphHjy2kDef2Nq2ijdioACx6sS+AwpsYA93OSkTejC?=
 =?us-ascii?Q?CriQ/WqUGKc8MdR187T9WUQ/QV5ds/EtN4/rxS1ry7pKnpJ/u9CbKBu8/Tl7?=
 =?us-ascii?Q?T5PoBy7RFI4oAPvmlT4U3X3/L1VE8Bz0yQp8p4yYi9xTljSE/IKdGnzrjjnc?=
 =?us-ascii?Q?4j8am0iYDz7k7LBJ4mZBnbZ1uT7+hbNc2RSp4xjftx+8dDbNGAC6XyQeVzPW?=
 =?us-ascii?Q?xk+SDxl8wSapFNnqVvb+jAa47g2ixMc4xp9r26FiKGXixIAlYVEHafPW4z7x?=
 =?us-ascii?Q?5q/YJSGFCqiFnb5Ym1pM+dMfcqH5OmGqXXu22a5jVZ2ZgYRlv7OlBZ8+fLLi?=
 =?us-ascii?Q?Kx/GS3pn3WmEuJFasqQ08KJ3tds15uk0swW8mLxUWVGHrdCJfbDRZseVT9w5?=
 =?us-ascii?Q?fP/cgoGco5IGpx6FF83xlQ3VvY45bBRRnojhRHT1HHfwfTdn88/4WFxlSrfk?=
 =?us-ascii?Q?V9nzoAlJnsQWbUq/U/BV+Md1gjjCD4GR5a8YB8uf8dFgFZDIdXhaH3XDSV2A?=
 =?us-ascii?Q?akynhDEvdcPAf37Q7OLc2KoxPht5ei2/b5NNWCxMMvUdSVIY6XWgGEXfSFV3?=
 =?us-ascii?Q?wLGWebe+mVyAXzjK18BhG/YrNCs2/1v3lvuxKZpijynaOMwzoRWAkjolUoW0?=
 =?us-ascii?Q?vov23Fk/2XAulizONMO5E3597ieR+7vfcsQdLKJ4aUxGAbMAyPPqJ2Nt+x77?=
 =?us-ascii?Q?V8dK1OQ/u/xVKpBEdY/1ZzIHbXEIwUOtUuf/m7nZ74myQiWW7aP9rCuroq1P?=
 =?us-ascii?Q?WxVbY1QBtppkuonyKiKqOmTrhiSRZvOn+FrBQpVjfZqqN4ClL3PuRrMdnEbX?=
 =?us-ascii?Q?eyMu+CKgD2TJF1Hl1BrHE9AdCzFldYMtpXxg/V4DMBleG2JCoFru8aBZwIX7?=
 =?us-ascii?Q?4504wecXAj49fwfbXe6KXRr7QAhQnFu5nYSYObW66FqbHMYQ6aV7g4/BEGw8?=
 =?us-ascii?Q?Ia7dBUTzB1uVtgoB0Cn4xEuqAz0FCD2X9sIZXJ7KmAv0unBNGQwxkwETglE8?=
 =?us-ascii?Q?qYOuoEFLsWlgqUZ3nC7jK6xoPwxyrYrKeKZqiFBY?=
X-Forefront-Antispam-Report: CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 08:17:56.8087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 947fff37-5118-4b62-c8cb-08de46b2c5bb
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR06MB9050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_001805_751794_64B90CD9 
X-CRM114-Status: GOOD (  17.03  )
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

SMBus block read transfers encode the payload length in the first data
byte. When this first byte is zero, there is no payload and the
transaction should terminate immediately.

On i.MX, if the first byte of an SMBus block read is zero, the driver
unconditionally overwrites the state with IMX_I2C_STATE_READ_CONTINUE.
This causes the state machine to enter an endless read loop, eventually
overrunning internal buffers and leading to a crash.

At the same time, the controller remains in master receive mode and
never generates a proper STOP condition, leaving the I2C bus permanently
busy and preventing any further transfers on the bus.

Fix this by handling the zero-length case explicitly: when the first
byte is zero, ensure that a clean STOP is generated. In this situation
the controller is in master receive mode, so it must be switched to
master transmit mode before stopping. This is done by draining the
pending received byte from I2DR, setting I2CR_MTX to enter transmit
mode, waiting briefly for the mode change, and then proceeding with the
normal STOP sequence.

This change has been tested on i.MX 8M Plus platform.

Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
---
 drivers/i2c/busses/i2c-imx.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index dcce882f3eba..f40deecf0f66 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -735,6 +735,16 @@ static void i2c_imx_stop(struct imx_i2c_struct *i2c_imx, bool atomic)
 		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
 		if (!(temp & I2CR_MSTA))
 			i2c_imx->stopped = 1;
+		if ((temp & I2CR_MSTA) && !(temp & I2CR_MTX)) {
+			(void)imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+			temp |= I2CR_MTX;
+			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+			if (atomic)
+				udelay(25);
+			else
+				usleep_range(25, 50);
+			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+		}
 		temp &= ~(I2CR_MSTA | I2CR_MTX);
 		if (i2c_imx->dma)
 			temp &= ~I2CR_DMAEN;
@@ -1103,7 +1113,8 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
 
 	case IMX_I2C_STATE_READ_BLOCK_DATA_LEN:
 		i2c_imx_isr_read_block_data_len(i2c_imx);
-		i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
+		if (i2c_imx->state == IMX_I2C_STATE_READ_BLOCK_DATA_LEN)
+			i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
 		break;
 
 	case IMX_I2C_STATE_WRITE:
-- 
2.43.0


