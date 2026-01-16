Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D072D4A616
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 09:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDABDkSwpunIdkRyqxG4Q7jtF8dAxzQIhAzsw4Vcg+Q=; b=JA/EUgxK4yAP5K8B/uUyScPAbs
	6XjbVqFTMzo4VQwo7MPFlwePtczGjOi4dbKkdqOy54p+XKvAETyLZkaTv4D5PUbMstQkxlxkJ9TAi
	ZqxTyHuvyzHFHQyj22L2PjpABvEzNkj0hk5My04HIV7k1aI/q5Vayqu3/BqmYsW1iWcOOgZutayrL
	5sHictjf3R7Qkea1cCofXAPrNAmLSxHfa9F6kLZtvHmwGGXdol3DWbIsYd9lvXsjCE9FFk+hKMuey
	GGVclj7KNHrcs+mY1TpXvOzWJvcnSeIwpWsWHhURZl/0A+KqIATgWJemNkU8/sIrfVRc+rbaAukc/
	zXYS7QiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfxN-0000000DqCF-0125;
	Fri, 16 Jan 2026 09:17:25 +0000
Received: from mail-francesouthazon11011002.outbound.protection.outlook.com ([40.107.130.2] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfxG-0000000Dq7U-1wZZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 09:17:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W82/QDP6JggcaE4kG6c8Xj7ocKjQJ85nU52J1RGf3FKTYwYnV1OQ3cxdtjGwczkoEpK8X41thBPw0uv9QaDXc62/Jb4N4d3kIUZR/i40YCU5v/4Ui81+xpQsm4MmNxwnNY0tzKqd1uaGZIyxszV969X3gJOdkrjcIhgbEG0MO9PUSwvESgYYA4BrpVCmg5Y/zjJSNAJ0xZ68jHN5FPSozyC83MDsOSqdSZK+kqxdW1oHtQmqbNAs18xCtTAMzl8Wm7LQxJKhnhgB+cy2X54fLB9e4BtTHTMyn/eUIuipGbgDS45hrZl2AswT4N89sasyGH9uHN2l/aM3tD4ECn18dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDABDkSwpunIdkRyqxG4Q7jtF8dAxzQIhAzsw4Vcg+Q=;
 b=NQuCM1KdFHivXH3tVaRTxMFZTfW9obO1HBTWS7vuzJFN92U6+iN8lF0jd95IVb6zcRgq2UATA4XPemXrIa/SizEYbFlTaJfwIm1vz57w6UKgHHrzNef6vDEtzyGBIsQQJoozC680vEz92JCqyDtpoc1lPfIOUFQnWslM+tJr1D9480TCfYaVnOwsxTFQ4qn2l9j8o23M34kfg11yhI1BxgYSPk2u1Yqi+q07a0yHPyKuP/2LovvK7F1f+vPDU0xy1yid8GOLkVHvJF+QjoXsPqjY23eEJiZZjSsdrP/ojg9CFJuE7/oAGLH3RU0zAxzu0tsUzRgVKsNTlBHQ2M55hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDABDkSwpunIdkRyqxG4Q7jtF8dAxzQIhAzsw4Vcg+Q=;
 b=OpoJsVafkVO3niIKvIL6ZX+29WHS2bD5ChOJMUNm0xThjZc+iuAgGK9cw6RD/OrsIFAtB/8BfNjTa44AyuVZQAGsC5WBYRHXai6MXDgbOVR40742ao2n88JJ4Jv4sEPtIhvsA9661DISg8bjuTZjSXyjdHrlu3ihKwdyTHaZO9Q=
Received: from CWLP265CA0543.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18d::8)
 by AM7PR06MB6594.eurprd06.prod.outlook.com (2603:10a6:20b:1a9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 09:17:09 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:400:18d:cafe::91) by CWLP265CA0543.outlook.office365.com
 (2603:10a6:400:18d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.8 via Frontend Transport; Fri,
 16 Jan 2026 09:17:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 09:17:09 +0000
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
Subject: [PATCH V2 2/2] i2c: imx: add abort path for invalid block length
Date: Fri, 16 Jan 2026 09:17:04 +0000
Message-ID: <20260116091704.3399142-3-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116091704.3399142-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20260116091704.3399142-1-Qing-wu.Li@leica-geosystems.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Jan 2026 09:17:06.0418 (UTC) FILETIME=[E265DD20:01DC86C8]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019B:EE_|AM7PR06MB6594:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3fd9d840-43b7-4700-f988-08de54e00682
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WQfH3mTB9lCqt93KyirH1nBOX+md6N+ZVlceHQptW2+c3ZJGL6CIw1wniBJL?=
 =?us-ascii?Q?AYf2QhSNZCBWpRtdJoTdedf8kGSQW/Zn5kq/3OfuTfW5HLp2srNZ3JAiQPvI?=
 =?us-ascii?Q?3wRWlyaYaG6S3hGoH6b+/ROnzE7ClhSvL4jN+cp3Xlder/tmYNQ4YQoxYpr+?=
 =?us-ascii?Q?XwQv8axhvDmFbYUvkdVWhgLRJ4kSizjCDnuGOJLjuaUVweE0eAU1gr9yFPAv?=
 =?us-ascii?Q?0nuQbIt1t1+JUhDsGKBN7UjQeLtIoZz3i406CNAnLEgaANJ1HWR+Hj78fMbN?=
 =?us-ascii?Q?dYFN+bqGllpddPExhz+I/w1zJbXgE9o5o6+O9y/9iigudIPJIMneNzLbPpWF?=
 =?us-ascii?Q?B9ya1vFzhoabU1AdoquN0yObObYNN2fSyiHLco5RQz+YvR/Dn+mlMrCSar7G?=
 =?us-ascii?Q?sGoEg5XC8UPdijpFX6EGECxY2NxjjBi0uAV5hiZrnFx1PoC8EsMxnlNkjL4L?=
 =?us-ascii?Q?4f884EX3bsTwKHWFptNemAK/oB+6DMLeKhbz499bIzOyTEzwlcUDR8iEFYq2?=
 =?us-ascii?Q?e3X0bfoDbSDGJlxEn58mJ1B/URrxRhX2NVBEhSld5+3Yy7H0Bkcv6xraxx8Y?=
 =?us-ascii?Q?hEtzzYGANFg8Qh+VtaKPX0Pr9DeINnctl7laAEtvkmQvqEEpmDXwy6lSDE2h?=
 =?us-ascii?Q?9wqgq02tmZ9ccyq1enWpD5Nopr06M8b35xJMn4qxLZXrqZXet1wx7lGcCZz3?=
 =?us-ascii?Q?Kbi4+qq8nZdloDcSlA32P/k8InLENXx9YRfBA/B65Xmt8rybqAZ4FlLod2W6?=
 =?us-ascii?Q?JWb701GUF7pUrHf82RBalJ+ew/JCirI6O1Ecb82oyerkGTr1OfCES0JAu3WT?=
 =?us-ascii?Q?D6z9Ct8f1W3pTcH/HFMbAxPw5jRi59NARV0wpAtRy8d85L2WPWLzXnwkRpsN?=
 =?us-ascii?Q?SOp1bRvqnQ5Zo4jJe/T+/d22t0xyQ+x+Fv6pRzZjDAFaI8FgkP/CwRGPlmwD?=
 =?us-ascii?Q?5saBR2UdKI5PqzydneumIr5b+qpfK57PfAUd71c/BlSjD/qRsa9+VEghOI9x?=
 =?us-ascii?Q?W1OVwj9ZGEME0nNNNugZA1wDbYwLK34C35vEscVQgPl9yhV3123KrYyGFL17?=
 =?us-ascii?Q?qYjGm3J5/BxMOxDKN4Ga8mqeCH/ruxsn2dfVZR8G+HP224a/7PLZcjRFjFz7?=
 =?us-ascii?Q?WolOnXPo17X4x6x9uK6//i8fLhRbSxCyavNk1xfQjIza1Nn/abBk8Cttu4fU?=
 =?us-ascii?Q?2KC1UHo8ueWi0olfUJq6Du18DzvI1S6Us8YnhWL8el8H8y0dpHOZbI+IxCyp?=
 =?us-ascii?Q?0/DEub1CWkqUIRNJjlv+txyi3ZId4V8w1Qj3zTEt5eRs4riheVOsfzysOYvc?=
 =?us-ascii?Q?TDuPVjtOokO41WAC50Bas3e+tLjYW5XOTMZnBYvXjyI+KlJ+Zp1uBzJonCEQ?=
 =?us-ascii?Q?sGuwk1Cdq1gG1T9cIIW0bA2UfiodIlDPYJybJ+BYzdHYrCRLVwbAchjecrhV?=
 =?us-ascii?Q?PWaoyIcqjpe0MtF76yI1GUD+CRQQl8D5N4dlc2Cc9gdhHEnNo+uiuTXjpEBp?=
 =?us-ascii?Q?vveo09gDyN0/3kBaGATJq5puThYTblehDj7r18/hLrFyNdbr6CkRKAImUgN0?=
 =?us-ascii?Q?dcTbKGkEgMfus4g45mAeo9pwaU0B/9O6hR/4WoVWFo6ZQxhKsoF4tZe7upnh?=
 =?us-ascii?Q?uGRiMQ5VdQPyuBjBzXOQdKdFpQrlD7xi2aWZYlohWtLGbZJbvO19AjAr15Ya?=
 =?us-ascii?Q?F08naOrNvnBF1VO/yJDKJgjt9oI=3D?=
X-Forefront-Antispam-Report: CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 09:17:09.1494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd9d840-43b7-4700-f988-08de54e00682
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR06MB6594
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_011718_508188_9AFE5E46 
X-CRM114-Status: GOOD (  17.38  )
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
index 85f554044cf1..71457dbffb7a 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -233,6 +233,7 @@ enum imx_i2c_state {
 	IMX_I2C_STATE_READ_CONTINUE,
 	IMX_I2C_STATE_READ_BLOCK_DATA,
 	IMX_I2C_STATE_READ_BLOCK_DATA_LEN,
+	IMX_I2C_STATE_READ_BLOCK_DATA_ABORT
 };
 
 struct imx_i2c_struct {
@@ -1054,14 +1055,60 @@ static inline void i2c_imx_isr_read_continue(struct imx_i2c_struct *i2c_imx)
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
+		 * Ref: IMX8MPRM Rev. 1, 06/2021: 17.1.4.4 Figure 17-5.
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
+		 * Ref: IMX8MPRM Rev. 1, 06/2021: 17.1.4.4 Figure 17-5.
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
@@ -1107,6 +1154,10 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
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


