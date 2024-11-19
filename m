Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EBCD60D0B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 02:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgxAIMaybu/ZK2DPePBvHp1WB19g4SJ/g36gX8KkyKM=; b=OOmry8R30Uj5ObkB6e60aBwr+c
	tm1h1froVM9toKHmwJVAJbloyFy3yq2A+69yFfGFh973iynFIqawwo/BALwvmFOAjEq/bfu4ccno0
	oic46PqMh3UC3JUUE3lQWjDbobR5plBzDW6V54PlJyIpF1SgTpKAaLVK4uGBKqDUOBTk1LyoBXaXi
	2PQiOkQ+sjUvi4dqmOmm6ajwAjnZll5F7ge73nvuwJDW9B6got8RoaaxoX/2heTwmKmyeTAvr5wr5
	7JZxQsJbNC0FpG6gPl1OQjzS88abdz7YHBqK2DkbJc2VjgUkB9iBvUBRCdLamHXKlnKLIxIfPkde2
	MadLqy3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDDZO-0000000B8jn-3zx9;
	Tue, 19 Nov 2024 02:02:22 +0000
Received: from mail-am6eur05on2061d.outbound.protection.outlook.com ([2a01:111:f403:2612::61d] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDDVx-0000000B86K-25Tx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 01:58:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f8PZVqlnP1BC4YVgVPL+v3+epaEVL7e+thohNPG1uJ/ODyc5dsuHD2U4vchEommuzwhpBvjjqswoR73eKlO53eXCOU8oXv9nn0YKGBfb3R37oCvTu2hGWo+zCqBsBlatkXf7Z5w3yd3cppOtcBYMsnARG13ofFh1EgZLforUmUSWvU+rB3yHPUVtF53wZ5QcCZoEQHy1wChJSfkp8ZjTIcbv7vjkkDujRoKm2ao8xJwybIf0auC5yL5Kbjex/dyinLwnp3yOPCtVxran0Q1UhDYEr4/dfeS7KOq4ism40i3z1YuWtXjKszva9DNegFTQZF4Jxm0CLvJl6TkIfxgUYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgxAIMaybu/ZK2DPePBvHp1WB19g4SJ/g36gX8KkyKM=;
 b=hJt6WsIFjUVOpvL4iPPZGE8Wm/6lmseKVbL8B4ZB8MuUsT5whd+kOdFqjGkcphzxwZKEbm9jMYZXBVkAOV+pPfh3+1+YrgGvjydUZa59KNo3fuGj6Vd/Rnangn1RgkfpUcBX1oTEvoNar/TFgaaO6dvhEXTXSGl4SvarIQa5ZKLnu3gifUl44m6yRu3h3K0/Kcen90eRbUKrTIsqE88hnWg5iNyuD1m+NaJpOQVIn8hQAbrZ0KdHa0BPtXMtMBGy2SpujJqdsPnchSD/t4StGlGIY3b76sKEdMiZPYzJ8EV22WHngiH377N2UKMOSvqLkk7eHLsPFRcA+99EtZXXCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgxAIMaybu/ZK2DPePBvHp1WB19g4SJ/g36gX8KkyKM=;
 b=RpUSA8ODwJbF52Vwo5e98GhAOcPSCWYoik9QIfTY9/d576MIA7EOJBJPOWSepgIUB44SpEZxVJzvuT1HQOemS/WH8YvGuHdoIUV9tr3elryjr8PU/7nC9F/tjCsZoRa0dajxXQBFPwG7Qq9Z3G3EIu5ZwNNJPAkFhTExaOO52ucF6keE/BpSQtA7o6/KoKrVAm7Opbo2rBHWawczunT/8kYYtPGh5qBK9SBpcgYTQdJakKok0au1NwMTC+y2iqzVi6jp4g8Z+H4MiE4sjRsUzXbpFOOfEc1NzoahQHNlvDGaKnHum0E6yZVOIKD9gTMlmiM43xZW+1qSFpNv1ZJHDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM8PR04MB7297.eurprd04.prod.outlook.com (2603:10a6:20b:1c5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.21; Tue, 19 Nov
 2024 01:58:46 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8158.013; Tue, 19 Nov 2024
 01:58:46 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: abelvesa@kernel.org,
	peng.fan@nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	shengjiu.wang@gmail.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: imx93: Use IMX93_CLK_SPDIF_IPG as SPDIF IPG clock
Date: Tue, 19 Nov 2024 09:58:05 +0800
Message-Id: <20241119015805.3840606-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241119015805.3840606-1-shengjiu.wang@nxp.com>
References: <20241119015805.3840606-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::26)
 To AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM8PR04MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb4247d-46f1-4029-c0ef-08dd083db3df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|1800799024|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CIr2Tk5FieOXbD+crEGXVjZ2XFvLWllHLvFdeLX02/5oPSvNB+z4VUxIJIzw?=
 =?us-ascii?Q?hHgPNQLX70JAywak5eYyVQ0Odt5tIJCWoubJiKbNnhARAcp4mv/rnopf/dbo?=
 =?us-ascii?Q?Ilxa/fTME3PINVUXjV8TNWaafXrRrrne302RvQzVpEM2ilBWlAs45IoDp24g?=
 =?us-ascii?Q?iF7bwsY26wk6isDdltaZioHhvHKHyiDLlSDef7DUMRLZ8lzEgWI+1gZBH4Nu?=
 =?us-ascii?Q?McaopgyrNAQ6EdWvT41TrwxPAm1VzBw+JeUR1+BaFB4cpEgd8DaFCkTq1mgJ?=
 =?us-ascii?Q?WHUn0VNPEAU5xrmzVHhob72q0O1HN/ytgvu2kRRchZ5ElmXTmsVZPp59c5eo?=
 =?us-ascii?Q?THRLCZLjCkAcx7p+urNxzppmEdXCCIyLl+OSNslrb8CLCduT5d/KiHtNflq3?=
 =?us-ascii?Q?amPX1me6CUVG5TU9W3STMR72wR5SQLGgGcMvDdTzm04fcRDSBxHLaWqdIdet?=
 =?us-ascii?Q?LM3MjoBDz7dIfNPO88MqUJSjLrUGBpb4k7+MYHEIqjXi2/jTux2T/kY2lrH7?=
 =?us-ascii?Q?9x6YHn+bRVIUyL26+1bQYL+D/1GDytBS56FqsIhlG5KfSxE/U/rBr9WKYQ3f?=
 =?us-ascii?Q?t9cFTfzAdRl8EOFy8YU57dTcBRum7yF8Ihd+UJhYQkAMgs78OaIFavVXckqb?=
 =?us-ascii?Q?D1ExpmIKBJM0oCI2cH7JloQOPC1nkeSLwHsl4nqzT6qTvJN2YrWQyOvkKewv?=
 =?us-ascii?Q?mK1S8AzGrNJxLe8DaaXBGvqCfpXAPDmCG/Ope3nGlMOsUZnYHmg96CGUDCyE?=
 =?us-ascii?Q?RtTECiodt1BMF9PD4Z1yVNGoebkN2cw4HBmvpN+m6OZGaW/iNH+Wh9fP0crN?=
 =?us-ascii?Q?lFUHqhQmqVqKbQjBzQQNk2AzrQ5sG7bqh/OuObnOJ6d5wa26NxTjPagPn+dI?=
 =?us-ascii?Q?/CJ8Q7kCYq4O+CjQiok0k54/F2HVIByAsFJCyQT5zcKd8G/lhQvuOLsnPdcN?=
 =?us-ascii?Q?WksQboXPTYwUrX21/VDj3HeC+g33xTXMxKMPYg5C0BmfLpLaxJwFtZPtGeDa?=
 =?us-ascii?Q?+xH0OgCLTGkfZFuLNj0uYX1D+vri1eYN7UlVp9jJwVl40k1iSjfH88rGRCU/?=
 =?us-ascii?Q?pp1UEptUaPURpRWXKa4M64mFuMp3g8VElRdbrWva9DX1vo+BrVClGkSZQiLK?=
 =?us-ascii?Q?FXY07n35fvtzq2z2vKefLQ6CCmvNwWufPI4mOS243gEzJ6J41eYv6k/duAQZ?=
 =?us-ascii?Q?wTcqV8trmLMlkzL+qKnJkFb9amlRm/dTU1NjisVXZdK0bWWVCM7xSqSgJfCD?=
 =?us-ascii?Q?dWlp/mLyaPYEp6rjmhqk/NyW49O6UpnUgzNEXOJuyoUv1wGQiYcJHDHg/Cue?=
 =?us-ascii?Q?jsgtSwHUP8IWsvFneHxK9y7s/AEb9iM2U1x2Tno4t0hObmmJRwxLHO5pnLkz?=
 =?us-ascii?Q?7O3lpccWq9/CDG6tapDb4GZkyDec?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qf3wQxK/978a+hKWd4MJ3Ho2/wDt8JC1ZlWCZRw9/44jC6B4yXgjeKguAAJc?=
 =?us-ascii?Q?Vq6StI0ieDEUUtaKfnDqWdOqHak2vb3FtxW3GM/CEKvXoCipwVZxUehlglni?=
 =?us-ascii?Q?lJiF/uSao+m+i1Ww+Zd2h/Cd4AJDSLLtgRSKjALdLIWPD8kmxC6nGzQ5Bq1A?=
 =?us-ascii?Q?WU2XFGQcu++82EuBGFZBTDBCLxyuDPKFD3nuB82EdlkwNwCSywq367x7m/F9?=
 =?us-ascii?Q?Bd3A9dcB3cGfd365RhnV2nHiEelvUwnd1h23yy7z5DJtuh27h5PtAfH8BwIl?=
 =?us-ascii?Q?1CVF/QCETV0E+9ZB6m5Px4TLrE0L6d/Sp2WeYWPU9SqIYdqJw2/YCxC6yzAW?=
 =?us-ascii?Q?JTOMILgwsd/AGkJEW/P4iisIaFwLtDx0d3UzunEAuMkKCz0I+yBVr92P92rn?=
 =?us-ascii?Q?W90TkqnTu4IN4oKJ/m8UjBS/Ap2PFkc8Tf8GEFumJ0XkD2bPjYVR2IBv9+tc?=
 =?us-ascii?Q?3JPOW0dJiXwRxFn4wtyY/7uAMiEtULZrxDydmHLMY9p/1q1cTSOzDOR4rcPL?=
 =?us-ascii?Q?SZ5gfkJZ+GTTVqdSybP04ztXX953QOYy5sY5qqX2dp0G+m4WlML+cLnXTk8l?=
 =?us-ascii?Q?E+1+k6uX0VTMNlq51Z9Ai/xokfYxCX8XNuUqh4aNAAxg3oaNXjiqyxZIwckA?=
 =?us-ascii?Q?4AqMxtalG+cKYBacmt00/9FBxCEyEL+/+292BJ5q1TVOJHgGkFpNHYhR/zHm?=
 =?us-ascii?Q?qL2LR3VkJ1WW3U+uwEpV4SGDofTUhts9SMee6OHfCOEHN78BCvhgf8Ww/d+U?=
 =?us-ascii?Q?o6lIPbd9O0of4HnVZzgs4zHUuoApXJXipPXJZi4grvhgOddrkiy5W/lFc+Ub?=
 =?us-ascii?Q?xjkp2CT/LwMMsDddZF8VyIlUcBfSbVxFS99gLneY4fRxdvl+LmiMeV3N4vlm?=
 =?us-ascii?Q?G9xD1IDQ4CK5i+KpJAXZTWlgnzM0fKk6fmtL1pq0qu2bmqCVky/8CM7SVhmH?=
 =?us-ascii?Q?hYKvvUSi7jewtY2VZRbxSInYFG7fg6wjhTTuRGUaLK87X0iAsNL3LIsNg2qA?=
 =?us-ascii?Q?t9xnvDcg4ShBfhn+VJmf+R8BK/w9WVp0DPfP1neVPr1yM8VULw0nZ2Wfb5Wi?=
 =?us-ascii?Q?Xe01d+g+V3yG41SKcObVHltUmNH6tD7jHHzi+azYuo+86NhkeOmpVJ2AW/VM?=
 =?us-ascii?Q?Xb7dRq6AQyLbd+VkTneFDuLdHXSgE9XTgFPZ7mbbxUOj2FxkfIwz7RneHMJq?=
 =?us-ascii?Q?s8y+HzW8TO+X278m7mOr4nZdteP2iDelM/IwX5cs2S7g1IAUjwoOrIA2zI2q?=
 =?us-ascii?Q?qopYVPnaFsxBtt2X9Bn7OWCJ+CLy8KDrEnw2vpK7ijnE6e3pwNWrVx++mptg?=
 =?us-ascii?Q?5h5YvDItLzgbqIgkNjQuhovJTs+7DmGP0YOmLTd/E/WEMpKc9M6njlCYiAk3?=
 =?us-ascii?Q?VW/tpQKrtQC+Yf5/BWJsG++rpkXjf9IsZXbLfsZYi4G/X4w5aXifhheTxPqC?=
 =?us-ascii?Q?Sid8boEhQSs07gp+CwCb5UXj8yfGfaKz9dCKlAQeOBP99i8btgxgf9rM7LFX?=
 =?us-ascii?Q?CGQBIWwv1IGUsuraKVwOyZ2IGBdR3jZalnTi3v3iCICyfEg5/DOI8ibKu7/Y?=
 =?us-ascii?Q?nbalZayJ7Ght6kppsqm6rL0DRN44fPsQEOwCfh5c?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb4247d-46f1-4029-c0ef-08dd083db3df
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 01:58:46.3333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JMJEEhzt/FrLX10puR2nOQXX2vM6x49WVyohJdAK32GehBqoGnmDqiuIbgqXnwmzGUoQ69hIDAFHajYchjjghQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7297
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_175849_538456_68E19137 
X-CRM114-Status: GOOD (  11.86  )
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

IMX93_CLK_BUS_WAKEUP is not accurate IPG clock, which
missed the clock gate part.

IMX93_CLK_SPDIF_IPG is the correct clock.

Fixes: 1c4a4f7362fd ("arm64: dts: imx93: Add audio device nodes")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 688488de8cd2..56766fdb0b1e 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -925,7 +925,7 @@ xcvr: xcvr@42680000 {
 				reg-names = "ram", "regs", "rxfifo", "txfifo";
 				interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_BUS_WAKEUP>,
+				clocks = <&clk IMX93_CLK_SPDIF_IPG>,
 					 <&clk IMX93_CLK_SPDIF_GATE>,
 					 <&clk IMX93_CLK_DUMMY>,
 					 <&clk IMX93_CLK_AUD_XCVR_GATE>;
-- 
2.34.1


