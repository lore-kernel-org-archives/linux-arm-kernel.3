Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775A0D47CD0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 11:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glJXnym83efT86ah5wXNGNLQmzqfk5MnqExx5kngV+0=; b=R4A6ErRVa66dv8qhFd9+zsFCc1
	Q4ZZfd7dgX/9DFDXSLzpsOY2SxrvceJ+BKSuSZK3x62JM3UAMBKzxE0ujwc5Ghj7P41YZU5AFq0uM
	NNwx8yOhdC2uEmj1eAkOFZm03iydVUFuLjywMJkKJyA5dQ7UXMXLdz1MxldoQGihwR6YJ9soeQRB0
	aN9VcGF8AdPF3m+N6SNVnPBRbUIZL5DtwTtL72W4znV89xBh+k8DEZLgf+oRMD3OAjgo5cnBmTeA2
	EgKy2ZvOnBlsxOZXE7wOMdhdSezkiZco3h3nnddJpu3FtNSjKcZfeA/0EG9ywjT7X1XL+22/6eBd8
	ihvUkmjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghrL-0000000E25n-4940;
	Fri, 16 Jan 2026 11:19:20 +0000
Received: from mail-northeuropeazon11011015.outbound.protection.outlook.com ([52.101.65.15] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghrI-0000000E23Y-1aaI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 11:19:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VeOymP3f66bd4yqrD1fhHy3j5k1fsiSFS1utX8D+GNJsrp/61E6N/vMNq2IkuxhqxU8lOcrIgM8ZAwrlg58/1g8Q6Xdyyaw2Q7w2ZxSA/2KqCjjfBRXQmXQOyFwbCs3xUZd8YVVJOhDsATxEKqHwEdm7ktA6n/0dmPq79m4zg78yuZn2Cf7D0lDXeZWVdedRO0zBlGdgvNmMozZxGrn8OcME2sB2GmkqvODuvgJooocaqepgVGSrIiIkGjFhFKnnnN0zEu6CpNBT+aslVuPHkwHXAccJ4FGnYRx02gwDUk2O1hQPtsOaj61frL8of5csRnkbBmkYU/QaS3RE+M0Sww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=glJXnym83efT86ah5wXNGNLQmzqfk5MnqExx5kngV+0=;
 b=fxeaqrnO0WSW5RdOl9DIzVM910mSraXmdwQn0aGN9GXnc0f0/nzCOFAP+6/vzdMMbQKtcEEY/IY8HSK3BqMOXruLayuf3TGiN8AIM9K/B5GSRxy5cHP455GeY+XWflIoTtjPYJ2nrDhYbEE8pmII61QxNJ5uXl/XFTkdJan/chYhYzE4TSH+m/f2lyRD8ffD0JAuUQcoGuicm9fVrlIknG3csE4DmBp00vRDka+KPA/+eBDw+KwC89xacgAv7yFvnoEFCI+wIE8k3c1tJkq/9/IaZ/LUMdSpdcc7+W4APXuQWCrct5eg3+i8AStcIYz7zIkOvwNGcN9x1/AhKHwmVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=glJXnym83efT86ah5wXNGNLQmzqfk5MnqExx5kngV+0=;
 b=1iiW07/Lrf7aUwRJwAHxnQRH1zKq5nzJGxfvou8z6p1YBY8pXZNnGh0+uzJpLN5LfiR2+WDaW9FfgVjpF30uaXx+vIIlJA1Ijdv18GI/VyWS22o9BWE0dqUsd0deDYy6UqbE3VCjcuGSUlXoj/NbkH0YaV0ytfdq7j8bUiPZ+BI=
Received: from AM8P190CA0014.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::19)
 by VE1PR06MB6958.eurprd06.prod.outlook.com (2603:10a6:800:1a1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 11:19:11 +0000
Received: from AMS0EPF000001AF.eurprd05.prod.outlook.com
 (2603:10a6:20b:219:cafe::89) by AM8P190CA0014.outlook.office365.com
 (2603:10a6:20b:219::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.7 via Frontend Transport; Fri,
 16 Jan 2026 11:18:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AMS0EPF000001AF.mail.protection.outlook.com (10.167.16.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 11:19:10 +0000
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
Subject: [PATCH V3 1/2] i2c: imx: preserve error state in block data length handler
Date: Fri, 16 Jan 2026 11:19:05 +0000
Message-ID: <20260116111906.3413346-2-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116111906.3413346-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20260116111906.3413346-1-Qing-wu.Li@leica-geosystems.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Jan 2026 11:19:09.0572 (UTC) FILETIME=[EF567C40:01DC86D9]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AF:EE_|VE1PR06MB6958:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d82de2ed-fd43-4893-7d46-08de54f112a2
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6Nckxc6YTGEGXyF4eswcDEUw8uUPF2Qh7cxHxGBwNEXvtEzG/dl6tlM79urT?=
 =?us-ascii?Q?G3baLs2qiwwooGNH5wvDDwRU01pwWsQULYZlvmbNarsw9B7bd64uoDA0HJC3?=
 =?us-ascii?Q?Dd46nA/9oeFpm+fj+8EDJmbQeKziM5jFYKmZxgD4dRGJWxQq2c4pE+THZKqG?=
 =?us-ascii?Q?CYIwrzPZm2DAFM4DwF0DNyMUmp6yFU/fA+KmrGx8wvrQdnSKZeP1uAhUwIS2?=
 =?us-ascii?Q?cB5syn1WBAdoW2u8ysvOE7WakzFrpbJunKVZVJqXJIdyDqnW29UF+NUGn6kk?=
 =?us-ascii?Q?7RNWqJHcTGeXWuXc2HMOsypYvoGgZH6GQ8vDBfrOGPpbohw0v52PVzuwyJPW?=
 =?us-ascii?Q?NeJJ6rJq1ZJK5QB2/sA+lhqSs/7rlQu8usN95u7//1S729gKs8cmB9S2dXOb?=
 =?us-ascii?Q?lKlpFi8CJMYnTPVwM3nKKNeuUiyFyRKACUBD+PZzZlBX39DyUOYZZkGr5pmq?=
 =?us-ascii?Q?sbLYPIs2wuW5LLqQVSiYJI7ODm5AB884NSqKk/HfvPMvBcKfm1FZiw9H10li?=
 =?us-ascii?Q?Fmn9odWC/I3DUGyxIH+XvtIXBPZ8XrB1eQqtSbKfiEY2q6DJSaSJiu9LoPQP?=
 =?us-ascii?Q?K9ed5SMmMg0aAYbLeQEi81lI5lbSmBBkfwA8icxkK7Hj8HEetgptI/PX145e?=
 =?us-ascii?Q?O4/OoQehnoPh1DrWYNh9Ilxyt9dntrwN6TGruUPYi5B4BGMZ4nh39R2cthuN?=
 =?us-ascii?Q?j8tpU+RTndF8n+/LUdTzHJg9dDW1FxaYiopytOmPFl10wc4emR7YmLgqsSMw?=
 =?us-ascii?Q?ahJjKfRzYzrY4BO6LMlnvI1gZDMfmHFTIv4eSLqLbhi8y79gyOg/hGjtfXwG?=
 =?us-ascii?Q?7wGQjKaqhIAUHLFWkTRWUjuGqQiBxfMn6JFZvi825bxQMgw5EfZbKZ9BOoUW?=
 =?us-ascii?Q?dpLfh/SSoqaic1K7sLw8U1Y7TBqACdSNpk2SIWrFkZA0okZ2x7kCjx/3Mt77?=
 =?us-ascii?Q?w+2RdXg0nYZQl781HhUJKcX1lQ81uxQLrAF5EVGP1KhW4SZeozfYpMKaIJ1z?=
 =?us-ascii?Q?wZBV50JCsQFigdIHAmdhcRxb/yAVO53IadXOGp/xCTF3vxasirDF3ZRCet/G?=
 =?us-ascii?Q?ENgXZ9qmfQnnF5BdSJhWWS7Anzeh5N4pbPq/D1smFPQPbSuLj4bWjw9cfHR0?=
 =?us-ascii?Q?1+6t7AFnd7ZZtWQvHseoPb05/AheJYAdSeSugoS5UTSa6ORIMsCixvbTQOSq?=
 =?us-ascii?Q?uQAlRopD66EW8JFK/dYy1D4adQWwJ3Vca9VyXz30EYP5zA+uSxChV6vGOCCd?=
 =?us-ascii?Q?DyaWMIniBZRwWEi7e3B+5JHrpJfT9cdyTGqDR0xTeqoggGBybjSbv2yTBWm0?=
 =?us-ascii?Q?fv2j8SXVd91JvyGmJEK8yvAEh92sP2yCUw2JmO5jtd/9bVV28V6TZ8JtsoBH?=
 =?us-ascii?Q?fzJyQDNWZ212fAA8YTVTkcZmsIS4evwni4343WoQthqgOGj1t9sLiiMI7NQi?=
 =?us-ascii?Q?Ym1AO1NaUI3WDyP3ovBislb+rTMs6V0hpk3EAVeSF3mklhl6rBq+3r+98Yw3?=
 =?us-ascii?Q?2awbuF4esZ9L7xdxfEvtlde4ZDvj0+T+UaNW0rryAtCIvaUtA+rkaWQOTsnL?=
 =?us-ascii?Q?VhtFmKsWDCBO4UpaKRpdrnglwB7gJuYNCvMzOQK+g7nwEui98ib6QkDZmF2s?=
 =?us-ascii?Q?Eb2tMMjnfUPUmHIAuSBIh3aB81HfLB0go/X9kCZV5pDT9VDdf7lmvSCohSGp?=
 =?us-ascii?Q?9HekMx64J2S3qA6d1+kimOBqhIk=3D?=
X-Forefront-Antispam-Report: CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 11:19:10.9330
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d82de2ed-fd43-4893-7d46-08de54f112a2
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB6958
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_031916_842035_580073FF 
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
index 205cc132fdec..05ba41144648 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1102,7 +1102,8 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
 
 	case IMX_I2C_STATE_READ_BLOCK_DATA_LEN:
 		i2c_imx_isr_read_block_data_len(i2c_imx);
-		i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
+		if (i2c_imx->state == IMX_I2C_STATE_READ_BLOCK_DATA_LEN)
+			i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
 		break;
 
 	case IMX_I2C_STATE_WRITE:
-- 
2.43.0


