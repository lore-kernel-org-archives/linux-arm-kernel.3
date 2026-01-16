Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144B8D48981
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 11:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ko8zW2QcX5C+Au+BA6LOsombT6GjVQNsNcD3Ant5Sa4=; b=2FVip07w44fuIP3ZYa660MWaCl
	w9fjIcHUYwUyQwQHWjYufv87LVYMETIZrStTrs59VTP92oKRWc6hlCBjyXBaPekWKwOh+triniO1i
	nxAm2xAOWLfhim0GM/jg8TNSsk41tsVz/WKQt+mIhrK9CBA1fwG0pq/AcGCVRyxrsf+piP7reMjWz
	9rGK/WnoVDmRkhac5RC8PGfTi4OeJLeq6W1a8gqS5jM6epnzPMHJaEwc9drXrZkWqRIfk9jLYH+OA
	H3ZvP1Ah/gAC81SEOj12yvAdBNk50pvJQSTm20guK/JxMXWf1QlRwiE+7UXuOMS8mhUBHAFMbfnoj
	Zam5G6/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghrP-0000000E28I-2g8K;
	Fri, 16 Jan 2026 11:19:23 +0000
Received: from mail-northeuropeazon11010012.outbound.protection.outlook.com ([52.101.84.12] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghrI-0000000E23t-1WQb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 11:19:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ko9sXIhi0RNWjyVIxl9YRsCOScordwJaFgYj72XXrEWAz8LbQSL8yIVKazjhCGYcFwfx/IXjk8+TikDUrq5IR3P3Kf0PP2528jHzsG4Q3HTIrlknZ5qOzWiUqwVKCFKQ3JtW1dipJkPiVZlIAZyqGHZ2Adfo+Q9WbVaCNeoNF6QkIIBZTzyXX1GF6BaziigJMZmqiz+FtSBxCAqmS+b//kWD/7cNeBzT2w7E6vg3DFH6l+7hiCq8jXGujMpK+hq8Kfyf8u56po1fJKG9i1TQW/nXu4eE5yytxJ5UtUpYC/Iac9t7sQ4IfH9SoUfxg5rGOz1SASKHJ+mYmJt6EKG31Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ko8zW2QcX5C+Au+BA6LOsombT6GjVQNsNcD3Ant5Sa4=;
 b=zNrFFC8jyiUWIqqFQGafM19Ya+QgNg68rde+cW++2imxJPIdc2WgfTfEUzavgOC8ul/UbaDBSxUnTB78p2LWSQPmUM29VhpNHWNdfFX1kvwjWMD97Zpn23vmJE7EuD2/cb0C2G5Sc/tNhM2y7oE/aM5DvmNw4qXhmaZJI9L1OvOHZ/iXALD2YFBuSUukKrGS6rNy8OX1gnAW6JzoHDgIb5/RWKPR+g/Q/hnRRACUh1nKMzpfUQMu56A5bQvn4Bu+emANhos0GbmepnsmcMzNKTcCu34rDTbmvk5A5XZAl+dRw7ricaDrJKS0H0wKuoKdzbbOw8pKNQpliHL1F5IMtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ko8zW2QcX5C+Au+BA6LOsombT6GjVQNsNcD3Ant5Sa4=;
 b=Zf2EATU0IpDApRD72znQdopMZXtIU5PSngh1zmJU8EW68sreJjQWSA6kAx2xm2NE1grbLJqc5D56AbyCRFDIVYCcgILTnzBdsEZN52xf1/FOnQLJL7XOrus9N7zbIzo+nN0KEqH2vE1iE0yttNbtzBso0JACilZ1WRDnQ5r6mjU=
Received: from AM8P190CA0010.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::15)
 by PA4PR06MB8545.eurprd06.prod.outlook.com (2603:10a6:102:2a8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 11:19:11 +0000
Received: from AMS0EPF000001AF.eurprd05.prod.outlook.com
 (2603:10a6:20b:219:cafe::a7) by AM8P190CA0010.outlook.office365.com
 (2603:10a6:20b:219::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.7 via Frontend Transport; Fri,
 16 Jan 2026 11:18:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AMS0EPF000001AF.mail.protection.outlook.com (10.167.16.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 11:19:11 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 16 Jan 2026 12:19:09 +0100
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
Subject: [PATCH V3 2/2] i2c: imx: add abort path for invalid block length
Date: Fri, 16 Jan 2026 11:19:06 +0000
Message-ID: <20260116111906.3413346-3-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116111906.3413346-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20260116111906.3413346-1-Qing-wu.Li@leica-geosystems.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Jan 2026 11:19:09.0572 (UTC) FILETIME=[EF567C40:01DC86D9]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AF:EE_|PA4PR06MB8545:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: de587672-ef57-41f1-dcbd-08de54f112d4
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UFr0D15oC6615DuuWDdK4+El0t2kzTHk7gB06EwfRU2wxIr+Yj9b2n27eo0h?=
 =?us-ascii?Q?ILx7gqC2PatZxNhWwDZ68b807H8kn55EUgbxKcYjhSC+gzhIV9FV7zSS/GEA?=
 =?us-ascii?Q?BZSzAJNcqID5EbUD4YbzuFd4WOMvnPKAgh46HSWIpYRQFf40sawHq74FBLXI?=
 =?us-ascii?Q?qlqiYXVaD29YouuVEZf9QjKAOdNXMzmSU3cqzIm0Uk3pT9YkQqKPTQZtRDvX?=
 =?us-ascii?Q?+mfGZHie2qkssiR+6/XlDsU/HSRZ1bAzVt5A7I0sMu0jf0YCUrMkKD7+8VvG?=
 =?us-ascii?Q?bBpyuuL/bQ5gWNMfuZcErZzKhn8KrLhfoqtbSCfVTmY1K5pnokemiu72Z0ry?=
 =?us-ascii?Q?E6AAm5oMFY9gzs1tQptJ8Om+3wWEJsIsxaC2V+BZdpDJq8TKloD1nLrbZIYa?=
 =?us-ascii?Q?HgzglcwiIHBowYlzGrLMf1njjerLvng3xwd91EhdFe4Hd3NLVex8/5Mgp3Va?=
 =?us-ascii?Q?bP4NeL1fGRBkMlWSAAmui7CH8yP9k1DCkjqPE4a/HjLk5OA6nRL8HXVFnjQ6?=
 =?us-ascii?Q?qd+72MvYvoFlavbtN74N2dDtbOGiXRe8FPeglwZydwlPbfddtz7z6GqE6J/D?=
 =?us-ascii?Q?dJiUDyhPhFDUYLSyyR8unX8CmT/FKaxjhP0H5juVW8rWP6YJuhkTRIC7KmFl?=
 =?us-ascii?Q?Gcb6mlqUPXBDoNwo2wgAFNb7speO5lXapdwjXPiAYPWZqcy9k6nzhV9AzWwa?=
 =?us-ascii?Q?HLatRg4mo0scT58xhRjiZerB8Mm7X07TMVW8eVYLwpHVcFM+V6c5xNw5gg6I?=
 =?us-ascii?Q?PbQfMAzDV6eF86tTW4O7WNBapZKV3WZaKfrS3sjGCKurphs1MeaqCkU0feli?=
 =?us-ascii?Q?fWg9MYesKeq89gbV9q/AAwp/CeD0iTazTFsuG5RKDB0nTdGz4FPBnIBgEGDd?=
 =?us-ascii?Q?imW3LJ5xEETjHeoz7nZbRaB/ziwYMKFtCsrAX+/1XBgc1zGWzkCME6Hlhctv?=
 =?us-ascii?Q?mmrt3qlgPHvETXXeEftrWA5lvcSAeTLQuDM1F8nGDzHgATs1v04+hspOk73E?=
 =?us-ascii?Q?xfAWhEeYoPFabV4+IEEMGh20Fq7+BW34LiVvDssjOM11K8LB8TExqIZPTYMG?=
 =?us-ascii?Q?7oYmawtde7qKUPM/xBqWRJn+cKdLR+PdsxxzqEQsiAbIzWw8t+n9Zixe8AeN?=
 =?us-ascii?Q?QkI7aost7g+rgWQUFMksvQAlLtzQztaxOHT6seuwoXvBe0RLwqNCf5H77PqR?=
 =?us-ascii?Q?sv6WKY3ronpri36xzyyByJmThejaHZMOydth2cSvtAmWahYRBWi/1LPBROCj?=
 =?us-ascii?Q?OaTbZZIEVxn7QpaPkLkYBe6DM50qV87D7irmOxEGZgkGFIaaA3JStRjQgXcU?=
 =?us-ascii?Q?ELUdw7KX49YQFACRAJ31fi8ItvNnPYJq6cdGwDAxZlwYNmOaxVXogY/fkZQw?=
 =?us-ascii?Q?WfuIIvgFt/0bE6YLXEerd/735J2n4heqF/GiZZsmqvWwO2x909iUjIt5dR3x?=
 =?us-ascii?Q?ENLYq7REibvOqD4zsCrSjEbQ3lTZds5gtGA8amJvK7a5IvRBg5zNaOwZ5I8D?=
 =?us-ascii?Q?frhRs99uPi0DLYWUdiVTVOfxXx2thjpP5bpA/FNtvZhhL4WEY9HEAOMLAk9p?=
 =?us-ascii?Q?eZsItDDi/DLTGa+xOgTPWzJ7xqjjsYqgsj3MMrTsMZbL4XR4J3wlkluWrx9R?=
 =?us-ascii?Q?kOOWN2/hbUdc4PVGmcK+B63qRZ6IbNjsUeuDO3VkRf/CLKd9tQbUr9+SGcfv?=
 =?us-ascii?Q?yUIVqyytGbZY4WXqeq0n2TpL7Ic=3D?=
X-Forefront-Antispam-Report: CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 11:19:11.2632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de587672-ef57-41f1-dcbd-08de54f112d4
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR06MB8545
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_031916_842105_E11B80F4 
X-CRM114-Status: GOOD (  17.18  )
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

When a block read returns an invalid length (0 or >I2C_SMBUS_BLOCK_MAX),
the current implementation leaves the bus hanging with SDA held low,
blocking all further I2C communication on the bus.

Add a dedicated IMX_I2C_STATE_READ_BLOCK_DATA_ABORT state and ISR
handler to properly terminate the transfer when an invalid block length
is detected:
  - Set TXAK and receive the next byte with NACK
  - On the following interrupt, generate a Stop condition
  - Read and discard the final byte
  - Report -EPROTO to the caller

This ensures the bus is released correctly and allows other devices on
the bus to continue operating normally.

Tested on i.MX 8M Plus with continuous block read operations.

Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
---
 drivers/i2c/busses/i2c-imx.c | 55 ++++++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 05ba41144648..d3fbc2df7f04 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -232,6 +232,7 @@ enum imx_i2c_state {
 	IMX_I2C_STATE_READ_CONTINUE,
 	IMX_I2C_STATE_READ_BLOCK_DATA,
 	IMX_I2C_STATE_READ_BLOCK_DATA_LEN,
+	IMX_I2C_STATE_READ_BLOCK_DATA_ABORT,
 };
 
 struct imx_i2c_struct {
@@ -1053,14 +1054,60 @@ static inline void i2c_imx_isr_read_continue(struct imx_i2c_struct *i2c_imx)
 	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
 }
 
+static inline void i2c_imx_isr_read_block_data_abort(struct imx_i2c_struct *i2c_imx)
+{
+	unsigned int temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+
+	if (i2c_imx->is_lastmsg) {
+		/*
+		 * Last byte to read.
+		 *
+		 * Ref: IMX8MPRM Rev. 1, 06/2021: 17.1.4.4 Generation of Stop
+		 *
+		 * Ref: IMX8MPRM Rev. 1, 06/2021: Figure 17-5.
+		 * Flowchart of typical I2C interrupt routine
+		 *
+		 * Before the last byte is read, a Stop signal must be generated.
+		 */
+		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+		if (!(temp & I2CR_MSTA))
+			i2c_imx->stopped = 1;
+		temp &= ~(I2CR_MSTA | I2CR_MTX);
+		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+		imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+		i2c_imx->state = IMX_I2C_STATE_FAILED;
+		wake_up(&i2c_imx->queue);
+	} else {
+		/*
+		 * Next-to-last byte to read.
+		 *
+		 * Ref: IMX8MPRM Rev. 1, 06/2021: 17.1.4.4 Generation of Stop
+		 *
+		 * Ref: IMX8MPRM Rev. 1, 06/2021: Figure 17-5.
+		 * Flowchart of typical I2C interrupt routine
+		 *
+		 * For a master receiver to terminate a data transfer, it must
+		 * inform the slave transmitter by not acknowledging the last
+		 * data byte. This is done by setting the transmit acknowledge
+		 * bit (I2C_I2CR[TXAK]) before reading the next-to-last byte.
+		 */
+		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+		temp |= I2CR_TXAK;
+		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+		imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+		i2c_imx->is_lastmsg = true;
+	}
+}
+
 static inline void i2c_imx_isr_read_block_data_len(struct imx_i2c_struct *i2c_imx)
 {
 	u8 len = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
 
 	if (len == 0 || len > I2C_SMBUS_BLOCK_MAX) {
 		i2c_imx->isr_result = -EPROTO;
-		i2c_imx->state = IMX_I2C_STATE_FAILED;
-		wake_up(&i2c_imx->queue);
+		i2c_imx->state = IMX_I2C_STATE_READ_BLOCK_DATA_ABORT;
+		i2c_imx->is_lastmsg = false;
+		return;
 	}
 	i2c_imx->msg->len += len;
 	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = len;
@@ -1106,6 +1153,10 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
 			i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
 		break;
 
+	case IMX_I2C_STATE_READ_BLOCK_DATA_ABORT:
+		i2c_imx_isr_read_block_data_abort(i2c_imx);
+		break;
+
 	case IMX_I2C_STATE_WRITE:
 		if (i2c_imx_isr_write(i2c_imx))
 			break;
-- 
2.43.0


