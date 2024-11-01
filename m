Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8598E674BA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 08:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ocbx1Hu/tUzczwxjE82MMfg7v5PsTGIm9P4YuZg1qY=; b=Zz1APvfK0NJPduIO/yEC1Art1O
	ffjp8W8iSbqJpNqDBoVeYz1xBuRunk2RhhdOIboyRNyNafb8UPK4Xlft2Ce4dDtWDFTdDVZW9m74R
	UKmIQMAISXrkrGBj+Q/7SEC5nlFWsIaVR97plbAhS3iL9IE8cqO9Gw5Ep7CoyL1lP5zti8Okr5R8L
	Of8fHxFpDj9nwKQu7TZxlcI5GU5R5GPRsLNCRYgBU+Rrtc9TxvKT9IZwtJ7js8Y0LYvstI6h+IKKi
	3Rj96aja7kUjgD0kc3xn5TtRZZxAw8KpCoapXjWysQnzw7HaYXq+D8k9NoOJZ0JjyhbdwdgAjmdml
	xFeM4uZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6n52-00000006HgW-0Rx8;
	Fri, 01 Nov 2024 08:32:28 +0000
Received: from mail-sh0chn02on20722.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::722] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6mx6-00000006G0Y-2xS5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 08:24:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbY5wj1vyVuePk0j6K1AedbuRIybdzOvvgjgl8bKRLBcnu9DsW3VpPLDiuyHgpmRtD2r601DNqHupCMAV6UbjOWVt+iqj9ZolhKFMx8cP7pymPy5c9YMEIHlJU9l+Bn19GZlIyHnO8RbFXVQc0gkC2ccMGkvUx8yScIKOlxz05X0uKEf9iCx3dX3vV6UNhXP1YbwFS4fg1XCnT96DSXJ1Wg1G91GMahwaesountcb78ofyoQlEzqMiUbGsatVKVUTy6U5VrivJx9tqFGRW3ML+JU5PrSYyKdDXfDhTyS7nzvPuO3iq7y7qBcwhj4Psl6cCtTuKRVgaQ++52xtHZ7hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ocbx1Hu/tUzczwxjE82MMfg7v5PsTGIm9P4YuZg1qY=;
 b=KWW6KqeYdS6WqO6j6RsN5ucBoyhVu7W0TlxZU6ehen8sDH7YoQ35C0xOXUtLU1ZwGAVtXkBvgs4chywsykdRG3/wki/WcgABOAzqRGu3xf8Y/Wt76mWwecZiqaSyWClJ1thc69DMf0WPiKStI9s9eXfY1D2vxvn/bmzXBtHWknSWxFkCIzfvk7dBN1CKGFfgbsRZA/mwX4VcetRRa84OidPMdC5BqDx/+SB9Rr4Wek+DNVwRaJKk0hvlTMsNVoXQNqJktvszbqACmB6cRXE/WtgVEoB1/OmrhcdbafTunQKrvSABRxRVnID5BAc86mYn4G8AQMKBcQG2Oy5GSQHTdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:f::12) by ZQZPR01MB1107.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Fri, 1 Nov
 2024 08:24:06 +0000
Received: from ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn
 ([fe80::617c:34a2:c5bf:8095]) by
 ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn ([fe80::617c:34a2:c5bf:8095%4])
 with mapi id 15.20.8069.016; Fri, 1 Nov 2024 08:24:06 +0000
From: Ley Foon Tan <leyfoon.tan@starfivetech.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lftan.linux@gmail.com,
	leyfoon.tan@starfivetech.com
Subject: [net-next v2 2/3] net: stmmac: dwmac4: Fix the MTL_OP_MODE_*_MASK operation
Date: Fri,  1 Nov 2024 16:23:35 +0800
Message-ID: <20241101082336.1552084-3-leyfoon.tan@starfivetech.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241101082336.1552084-1-leyfoon.tan@starfivetech.com>
References: <20241101082336.1552084-1-leyfoon.tan@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0015.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::9) To ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQZPR01MB0979:EE_|ZQZPR01MB1107:EE_
X-MS-Office365-Filtering-Correlation-Id: dd3f102b-a7d5-495d-2b14-08dcfa4e8d00
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|41320700013|38350700014;
X-Microsoft-Antispam-Message-Info: NxJj+c7dcIe/7MQkDkQuwGF+Z/PFuji4Xfc+HowQLylmmnPhnrsc16hEQUaA2PyRQKOOi01hHd4P4vkCyi0KRzVEPF75sxW+jxh0LI8ceiqQ8dxjP7/njAEk5TgDFv5URUVK/uXecxb6fv9r6S3TbRozoQ8I//zjeCh+nJ/iYoLR6D5fQG+FL8saLwz2pFjoPstwbh88lLCV6ponh8qPTJLastwcIOB+1L5WaHIXxD+OD9DuQ3va8o10xKaUmW3EAmon++GweP0zr0TvlXX/YDhlzQztzBUH8xdLOP6SqQcZM5dXUtgtnY+c7Eftpylptg+2vClMsyiWu/4LOZ7A+YCAaHcPxMADPn26KtShxKq60eVKepQ3GyLn2DmNAbZV2i/QyuSrt2VlGvq8cxvNNW61dbEdhQqDgviv5Ki0P+TGfhQSOFSrSECQGoityW5nBEkNiL2HVEBUa5oAoMdoFnKoNBklm5h2mMGxvAWt4/69IGLeNVoEGD+W9x65wTN0fuIy8VDREngWZS1zDV0kOZM0WikOlux/I7bSO8wPRBUsRT/P8gcHrJPsfvHnG2dMX7U7cib8AzvXVDUnKIoBjRIMCv+BniiM1hvxjyU8NghZj6zyF42/QQ6CeWzwjWYK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(41320700013)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZyCG19V4Z9xfOjNN5Z4UHDhg/7eTHndAjM/nN8gAsNd+HEK4sJgaDS6XTogd?=
 =?us-ascii?Q?BrXnz7aTovp6NwSqudXFW7GiLZ14ocrOu1ejLFPzM48wv2h5HpCBrQlIbhSC?=
 =?us-ascii?Q?01pVB0is7nAjGV2umr9Nro1HhNf9HrFKFXu4MMiAWlIouvo0NVqWYDUAOPOv?=
 =?us-ascii?Q?ZeA0JvW1dlwTf9EbI/eRbTho4nZK/4c/NbQEC63KewHMt23mo/nhvK994PRd?=
 =?us-ascii?Q?WI5HWGrx7Xa2hEYnI6ns+oeL1tVlU4T5DpE4vwXRC3Y8U9v6HtDK6zWqHdcX?=
 =?us-ascii?Q?wtgeE0Fowpg5SjLWJ5afsKh9S1UJaybMu7mdL8fiZZx/ZNvJMaBV3shz/nuP?=
 =?us-ascii?Q?wa6TTAlh0rjrR8naxAO3e6QwdnLBjzEaeoRYQ5I617UfZcSgPj1QxpxFKwhO?=
 =?us-ascii?Q?xsBA8iLr3OYQALL2twNeO7NTkBZ5AOe1MBwD6+QNBYVo3oWdmswgvhpB8085?=
 =?us-ascii?Q?We8pK0GP+iVPd8QFoErUyDW+tRuSfnwxIk0rEdzCEet2THe9EHfGFPu9Y+1+?=
 =?us-ascii?Q?rdTEU8Rz/TY7S9UjYe8mykHI/WXxY0JvzDFysJy+vWC3fwI1xnTSyT9vDAwk?=
 =?us-ascii?Q?dcl8moIIRp/krKOWE7J23VET6V02Yg3N8Amo3Ssral6yRKIflvy5UsPfTKEi?=
 =?us-ascii?Q?km4+1FeXWhwPeBzW4Zhlz4Lasq9DzYJ2l5kBUHaS0uQluRLDGV+Pvv4StwfF?=
 =?us-ascii?Q?oc7ShX8nKgSn6cVizg1va1JC8ebmN0sei7qgkFcqRKBqHdQercB5YsLslHwJ?=
 =?us-ascii?Q?t1MYXJrl+W+Uy93Jq747R8XAOAUrQIABtNKiYo1Fa5TVkw4WrWk4/sqwKSXx?=
 =?us-ascii?Q?X2qaoMw6ncTuwWmjFsPU/gWbmf5qom1xpIDfI8ss3Pd0AwgUPhbYbCRLN2o8?=
 =?us-ascii?Q?9FtLW7EWt6apWl8VoX0bPqdCDOshTLjswhXGDQ3FJTcmgTCQ4ntqEU2pRwke?=
 =?us-ascii?Q?zoQ46bykpWTKBzngJlppXOuj4ICzAHSZK3BcIV5o0rmjyuX8ByShLA1jrppp?=
 =?us-ascii?Q?m4xL2nVpK5Cz/j7sWJP8bxiNT1Urgcbk5qqWJndHsBp1VEF7L3VrW5QhdGK0?=
 =?us-ascii?Q?pPv40x06GcunIj4i6Fb0JgF2YZFCg9SvDLsPpUPiYuo5tNdx0XVZUhwESRhC?=
 =?us-ascii?Q?o2ttHE9FOlYY4Dzc814h+xq60o2FgRNXKzVkWz7kucu/XSPDu9x/b7ZB6yR9?=
 =?us-ascii?Q?susbc7NeQvT/UDojEAUGPZK1lwgcZC8cGWg4DY7bJVrlNXzYGR//xgNKin4i?=
 =?us-ascii?Q?HtayAH6hpLQeewEgbf+dI2QV66iZfKZBGyvSKPLciue+Zq3dl1v6Tcj8tfpc?=
 =?us-ascii?Q?Qh3A6LCCaWuff14p/XLnYHOs4MFWPvqmEexFEt4+HKgAFEYUl4cUx6NeneOB?=
 =?us-ascii?Q?dgAvNGVKnIAXdP2uVYzmiFnWBQ8wNIxOLQUMAd1TOPe5oQYlNJq5s+mPmn0V?=
 =?us-ascii?Q?7a2Ek9bHIWvf0QwVvkchhucqA+3x1dq7BRfWJWm7dKGdY2ztxoI8g1EpjfgF?=
 =?us-ascii?Q?yTqKKXj2grU3+qsZyisPOxperYwASq4ns4QzPCN38VxooMB6ZeYPbLmAyLOk?=
 =?us-ascii?Q?iWke1h1YUwscz1auW6YfsUuGP3JRgQwtsRLqqJRYf+QrGkCxoNmsStKqEOGk?=
 =?us-ascii?Q?LwfcWJdw/C674TToTzdG910=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd3f102b-a7d5-495d-2b14-08dcfa4e8d00
X-MS-Exchange-CrossTenant-AuthSource: ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 08:24:06.1703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iXx4GbX9D9COhMuuli+icY1Gdo31x4SUqILs7Tz5v6zlQA8Lgelo/5huLksjbJOZyrLenXx9vuWSy/fZrLntadG+AzN94AWnXucMnPCt/3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQZPR01MB1107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_012416_781084_C82E0756 
X-CRM114-Status: GOOD (  10.14  )
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

In order to mask off the bits, we need to use the '~' operator to invert
all the bits of _MASK and clear them.

Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
index 7c895e0ae71f..1be77d189ccb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
@@ -266,7 +266,7 @@ static void dwmac4_dma_rx_chan_op_mode(struct stmmac_priv *priv,
 	} else {
 		pr_debug("GMAC: disable RX SF mode (threshold %d)\n", mode);
 		mtl_rx_op &= ~MTL_OP_MODE_RSF;
-		mtl_rx_op &= MTL_OP_MODE_RTC_MASK;
+		mtl_rx_op &= ~MTL_OP_MODE_RTC_MASK;
 		if (mode <= 32)
 			mtl_rx_op |= MTL_OP_MODE_RTC_32;
 		else if (mode <= 64)
@@ -335,7 +335,7 @@ static void dwmac4_dma_tx_chan_op_mode(struct stmmac_priv *priv,
 	} else {
 		pr_debug("GMAC: disabling TX SF (threshold %d)\n", mode);
 		mtl_tx_op &= ~MTL_OP_MODE_TSF;
-		mtl_tx_op &= MTL_OP_MODE_TTC_MASK;
+		mtl_tx_op &= ~MTL_OP_MODE_TTC_MASK;
 		/* Set the transmit threshold */
 		if (mode <= 32)
 			mtl_tx_op |= MTL_OP_MODE_TTC_32;
-- 
2.34.1


