Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7347CC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 12:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PxurCwMuEKIGoYXTWrOi91D71CqokKrlhNK1pPhzgKc=; b=S3wcp4/rEl9nvO+zdcFfnUUpeL
	qwF7CHQANAKow3vMEHRdD0knS5UvFqyAkfnDvHVG79EuvvlJbJyTYIF3u4c5z4NoEeleACFTVQCp9
	dJ/w2LIa20tqg/i8Z3InLp/vz7dEK0BYstok3TCLWiyZERFuR0j/LvgWVtHKJ/N0SgaGXbbdHxxmJ
	EjF7BaiisBMJvk6fnYf2ZFAxm/dIIez9R/lwBoS+LypSJGmHUuiSvu4aPm7inFIfb69rnBz8kF5aq
	QP8GSwL91JAPzisqTtenAg5js27UkoCSissZmFL6O5Cp2HRpb3UYpwvCSqPH+dlxkNGof7yNEKRg7
	TGrSeLVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHM3V-0000000Cr8n-37pC;
	Tue, 20 May 2025 12:26:49 +0000
Received: from mail-vi1eur03on2062f.outbound.protection.outlook.com ([2a01:111:f403:260c::62f] helo=outbound.mail.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHM09-0000000CqWC-3Jfa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 12:23:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jL6CmezI6GhUGR+FX7ukb8d2PrUfQbqoCVUAwC9HjUUCkVcetS1RkB2swp3a/lJStM1giXU8RTfUvUgJ+aR2I6AG9tHDjmWDWX9DnmrtLz46ks9TVsFVEU+rOOhl+nb9x+WudwlosXEo5tiqcB+UZzgLZGFks2eQFPIvI3LnWvCdYaw5CIMhjyvLXHTQjeTpmqLsQgtjufG+lVSEIqZZDuTC30mYrSIL9YMzuVj//XTmNhVmc/UWBbpR9sINuXXFgNOvmPxJ9SaH9Q1El5AhFqrSp3LxXctIR0pXXQllPpgb+mcCst66IMI5INby8IlNKthtSu9WnDbw19h0JKZDeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxurCwMuEKIGoYXTWrOi91D71CqokKrlhNK1pPhzgKc=;
 b=O8onhOqFejpulPpYToW506Jiuy5ytS8LMuZV33zNCIRIRk+Knf1j2VtI05+jBySrZYzCSzL3RNQA6NmqCL2At0Lns6PFDwEXot64R5r1x+l2yYGAKZ2r4/dxxXS5H26lfYmOfUMlUXL7eIcza1LMoVg3CdL08M0a/eHydB5hB/s5jVTx6mXeqUtEADY7MeZGER1yRHeSjYPN617XoULno0cM4N08rQbaJZDiWsHJm2VW47cdK0Ru0OVBOofqDBdi15n42RVqktDDYHPBiR1L61f7ZcE+T2Ujr15Kambo2/dMstY2H+yQ3LD1Ier9cAZKpbFZ4tfP7uPvmhS2tI1cfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxurCwMuEKIGoYXTWrOi91D71CqokKrlhNK1pPhzgKc=;
 b=Iqd+m/QstM+bAu8Zy+8Z0XTMTEQb/GgrnZErzRHOLPP61IBnuIkcxnhD0G5PzclP9i1RYkN3p707J+4LQTCxfgglS/8RsUpqcUnPBeBY4oqKF8S11BfakMBt8CrEVGYLf2EIgnQkDrhNcP4fW2b5CsvH71uiK5uaHln4kSYJCZg=
Received: from DB7PR05CA0053.eurprd05.prod.outlook.com (2603:10a6:10:2e::30)
 by PAXPR06MB7757.eurprd06.prod.outlook.com (2603:10a6:102:157::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 12:23:12 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:10:2e:cafe::29) by DB7PR05CA0053.outlook.office365.com
 (2603:10a6:10:2e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.18 via Frontend Transport; Tue,
 20 May 2025 12:23:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DU6PEPF00009526.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Tue, 20 May 2025 12:23:12 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 20 May 2025 14:23:12 +0200
From: Lukasz Kucharczyk <lukasz.kucharczyk@leica-geosystems.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	stefan.eichenberger@toradex.com,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org (open list:FREESCALE IMX I2C DRIVER),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	bsp-development.geo@leica-geosystems.com,
	customers.leicageo@pengutronix.de,
	Lukasz Kucharczyk <lukasz.kucharczyk@leica-geosystems.com>
Subject: [PATCH] i2c: imx: fix emulated smbus block read
Date: Tue, 20 May 2025 14:22:52 +0200
Message-Id: <20250520122252.1475403-1-lukasz.kucharczyk@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 20 May 2025 12:23:12.0237 (UTC) FILETIME=[F430E1D0:01DBC981]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009526:EE_|PAXPR06MB7757:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 97ed4d0f-09f3-43da-c801-08dd979916de
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EHZs4XzNt/DJG2f5hvuNisLDXLwpuRLTDlW1ghEeGSEG+vOXaGbcvStB7f/l?=
 =?us-ascii?Q?wAVQoUbBgEFXulfN0Q/9vrFMo/c7HJNXMrW8gPV7HPRiY7hq4pQ1YW5p0y+9?=
 =?us-ascii?Q?VK7sx3qa9kBY2QddtdliSEIF1XGYCoq4XLxogfhlg4rvoNpPkFS5K0N7pjaR?=
 =?us-ascii?Q?9HGEdsON/nnbRpm/r/1yAxh9WJtEpboCT39ZALLMGYNHP9QphPzgehFznW8L?=
 =?us-ascii?Q?Ywc74dfEmrb3wMEwy1bl/p5AJ+jg0HD8dgh7UDTR21IeeLttc0np93BvIIwQ?=
 =?us-ascii?Q?apzHKYYq4IOcy59ljlVu63FZl/zZ28TGOtOQeH8cy2aQJVKUjdaY06/sKzff?=
 =?us-ascii?Q?riHq4YWWfmRMwDwiHiobzmtOt+iGWax2mrUApOuh0sPtMC1+CVkaICgHADID?=
 =?us-ascii?Q?bGczzZXQhw5JwI3QE9RxcL+9QoVxKHgdma4hNGTAilKEHCKd/AfQPAoObFgJ?=
 =?us-ascii?Q?8mLV4x788Lsyv1Knt+XCF03uyW3I7foHw3QoZ284vtvUZs78brm7i0KR/g6V?=
 =?us-ascii?Q?vjYU78aWNewwZJ3d8PH1aqxSjGO4aDLQHhe2w8pOnLulJcxL0y0P5H2LCZ8l?=
 =?us-ascii?Q?OdwQVF+tLbEtk1gNBI4pJmsL6q+4VLXjmgdfK183amMZmv+f674kxteGK9Sq?=
 =?us-ascii?Q?1y26LjQrgEJ2a8fDv+zJOJ2ocRIBFq6H3mCIw89pWW8qLUWGSldFtheR/9QJ?=
 =?us-ascii?Q?hV0xv0qXBsFmY/LH75m8s9UWsZaZkFHy4os4cmaj4D9xu/CPyW58NO4bzex3?=
 =?us-ascii?Q?VfxTRtKNMXAgVR5WGM7P8tR/HI01ynxmPjFSDeOwpCvVk/+WKAOMNgutqeAG?=
 =?us-ascii?Q?ktCAF+9gObCalzWM3krY2EaAhA6lFy0RKFiQ7aiv2tLEUWBDJrxD1xdmsqoo?=
 =?us-ascii?Q?FPkGVKZbPGld2SzuR1S2agfTA8gQza035pPzr3DFbSaVrwNyY5ASYE8U6pd1?=
 =?us-ascii?Q?ZQK3sdjzuFRjJa7V7DWfOLuysEABmCMf9wqkR78UYXzG7Vk60CF0Tunu8cRx?=
 =?us-ascii?Q?5jP3LIfv1cFogchL8sRz4gLcW65GKpl3T1juQjc4SB7w3WYl/NejBFdcW4sq?=
 =?us-ascii?Q?G1EixAt3pAjSZ7bpcUjKudAmY/C77PzbXRYRWOJ4ZlJbo4XC4AGq5VmIbuWk?=
 =?us-ascii?Q?KoGxOYgsi+KpAC7Q6iPdosEfs109+wX2iQ1TSN62AyXzdGtUIcf74hNtghv8?=
 =?us-ascii?Q?PDrFL6tPDG/HoKzOSA6u/j1lQDJFEQ9FKrFdUSL21SzxUG6IJTE6tR18LSaR?=
 =?us-ascii?Q?MM0zM6nrk2X5uucsAINjF4QfWMTINFstij/rfdFUqvYe1v4u3y+rbeWsM/kz?=
 =?us-ascii?Q?nkdbjo+7mXq0nnWn2wuIrxJrLb3JnVER+uS8nnrQzAL2Gui+HpZRWhGqT02W?=
 =?us-ascii?Q?OxY7QsAX4OR0aWVzZYs1EA9sWZb45mLRpseqghDLiEyldeIYMXJ+SYqMUsbE?=
 =?us-ascii?Q?if04kRpEjviQGmRnehYfDS+4oW0jv39u6+N0fHQ0Lg8q5Shwgr8y6Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 12:23:12.5311
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97ed4d0f-09f3-43da-c801-08dd979916de
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7757
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_052321_879491_E6545BCB 
X-CRM114-Status: GOOD (  12.44  )
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

Acknowledge the byte count submitted by the target.
When I2C_SMBUS_BLOCK_DATA read operation is executed by
i2c_smbus_xfer_emulated(), the length of the second (read) message is set
to 1. Length of the block is supposed to be obtained from the target by the
underlying bus driver.
The i2c_imx_isr_read() function should emit the acknowledge on i2c bus
after reading the first byte (i.e., byte count) while processing such
message (as defined in Section 6.5.7 of System Management Bus
Specification [1]). Without this acknowledge, the target does not submit
subsequent bytes and the controller only reads 0xff's.

In addition, store the length of block data obtained from the target in
the buffer provided by i2c_smbus_xfer_emulated() - otherwise the first
byte of actual data is erroneously interpreted as length of the data
block.

[1] https://smbus.org/specs/SMBus_3_3_20240512.pdf

Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
Signed-off-by: Lukasz Kucharczyk <lukasz.kucharczyk@leica-geosystems.com>
---
 drivers/i2c/busses/i2c-imx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index ee0d25b498cb..4bf550a3b98d 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1008,7 +1008,7 @@ static inline int i2c_imx_isr_read(struct imx_i2c_struct *i2c_imx)
 	/* setup bus to read data */
 	temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
 	temp &= ~I2CR_MTX;
-	if (i2c_imx->msg->len - 1)
+	if ((i2c_imx->msg->len - 1) || (i2c_imx->msg->flags & I2C_M_RECV_LEN))
 		temp &= ~I2CR_TXAK;
 
 	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
@@ -1063,6 +1063,7 @@ static inline void i2c_imx_isr_read_block_data_len(struct imx_i2c_struct *i2c_im
 		wake_up(&i2c_imx->queue);
 	}
 	i2c_imx->msg->len += len;
+	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = len;
 }
 
 static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned int status)
-- 
2.34.1


