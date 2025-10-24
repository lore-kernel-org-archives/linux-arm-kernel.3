Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD3CCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 11:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zifqyXgWpynRb/R2i8u8iGNpv22hRnZMacIBOExAgMY=; b=g+hdrWpzf7DVyNAwlDvkLCMk07
	lnaCW/HYjnb2pYEuBxGODkpr8z6cBnJbDGRI3RvOW37LW4bcNRsL5pxVZ4cwP2gbMlgA9khGH1gyR
	NowUW9lg+MAwn8JdDdbsoe6ySHNgG00Dm565X4Fse4Y9NOTCFkU4nXMEtRNQvkF0pURWsRQvZWiFy
	S7xohLQdTPitRfsdPxreZc0HEKXTi5ioDba8aU25YH459ClxtgBunv97bhir0HdHMBwbAijOEkhvR
	+ztMWc9fAO1croKWn85DZs//rlYVYRPTxXB4WhEU2UQIazOyUaKJCr45+YVZgugNKJR9EET2XCJv1
	s8fA6EcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCG1E-00000009D1c-2Eas;
	Fri, 24 Oct 2025 11:31:40 +0000
Received: from mail-francesouthazon11011063.outbound.protection.outlook.com ([40.107.130.63] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCG1B-00000009D0V-3hTX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 11:31:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmg/VJjGttCrH0uHPb9Z2BRfFyCHLUM+pZyJCfymVVtx5O1B7GSeLX1/CpRalb86Bfr/yVNU00BaBFI0J1ledb6m2sZTnaotvmFtZhT9kjXu7Tq3VXM+b4O3HESrjyYKWhDfH9V9WBrCWcH8YCaHWj9qspyqsi1gj9FRmlXKR/sNVaPxc/MW203aKLrax1b/2emOEReZGtJZqFow2kpxkxRWyP3r4OjNH578GE709KHzKfzUH/cGqJjsKWPSuuAW3cnf5Xu5dnxCX4Q7hytgM0INbd7ollhcKkkgQI3VORkL2A8smorRWyo9VDLpbVoyg0uoqqXanRxB0eq9gfcHDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zifqyXgWpynRb/R2i8u8iGNpv22hRnZMacIBOExAgMY=;
 b=HVQESNRd8oFX2taECKEQTaZDjBllo6f2OmvpZ4pRvTZg5xnolWh4FhPkK7IepnAnDA05RZ07iO0Lw/xIVv5iAE0nZ2otN05K+8MFXVvncx04wt2QZk9h3LPKSVKbOR6p6zI2d7RILQZamXq1LBVod6vteIcfgl9Ks5udjTqoLD83nfGaRtFqgDI+a0leSlz9Ypl+IKZWe4xEatlOXIvBrJjtbzbVR1ULP3ONrXChjI0OUyxBx6Mo9zqS2Lk4OSMLOXFhFFcJuNeuJfwAYai95prhoDeGsrzeri7JI3DNaGa10Y4jcYAJIA8UeOpi0lwJD04skiMnM9lamMI4BRAqIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zifqyXgWpynRb/R2i8u8iGNpv22hRnZMacIBOExAgMY=;
 b=PATCronUPBwB9osgHiZp6jL9dNDqmh1kotCbj5Mil7ncuXOqB/FFYFdj+EBYxzO7Qm6UYxEqJ977losBHdiGyIVyM6tR8gGjL95tjIiLqQ/DXiegS7UNZZBBc14KusriNyjDjMleMk6ckfqugtNENZCQgqhx1rjMPzOnyNxmxLERCeIkhri4fFHpddJ0NVw30bmtfUYX8VS0R7ejE5Yteb1/M2RJpJrWLBglC/gOmcqr2w9k8a+a1p0YbBL5eaFsrea8MLvitPZtjgSEk3L33PEn2shjmvEqFDv6lyBo+LJESN19YwQA/DSDOtBiYE+WZDuekQVcADHML+F4uZxH3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by DU2PR04MB8598.eurprd04.prod.outlook.com
 (2603:10a6:10:2d9::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 11:31:32 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 11:31:32 +0000
From: carlos.song@nxp.com
To: mkl@pengutronix.de,
	frank.li@nxp.com,
	broonie@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PACTH v2] spi: imx: add 16/32 bits per word support for target mode
Date: Fri, 24 Oct 2025 19:31:07 +0800
Message-Id: <20251024113107.513604-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0057.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::6) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|DU2PR04MB8598:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b5e2bfd-17c7-4de6-cbb6-08de12f0e1a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bc7O/MZHOwR5A/Ndqc9zkGSTrvAmrCGX/CiYN2WKGDzha18S5SyRMFc5kWYt?=
 =?us-ascii?Q?g5c0tTzEU3Evudm+Qa6zfQsdT3EjgjBbnV+E+eFTrEU/4VJVoqEjrgrUnNyQ?=
 =?us-ascii?Q?nUuYDX3xF/Eh9ollG9kjYCYvVI+Mfnb7TqN7vncLS6H3wM8yfIbXXJccYyNX?=
 =?us-ascii?Q?i6AVFfVIC4BHhni1C2cXLjDzaGyf0VW527nUdFE7fWPJqArREROx+DzPVFf6?=
 =?us-ascii?Q?jd8SMTf5IMt6Em1hR0Z89hyYGU3qngRFR74VbtoRWcBD539VE+rqumRrBDHg?=
 =?us-ascii?Q?+fNzM5VIZwelayU7S0WBw7WmB1/yfPZKSuTROywpZJwn6yiTb9Pr8oVIO3Sc?=
 =?us-ascii?Q?PFIOKPiFsrsuzasJLRy+R/UlH3/asVps20JXs5d9Ys+FYf6gDM5sEjFyC7Wq?=
 =?us-ascii?Q?Qt6lI2Ull46bPRhuxPERBsaaNuzYGZVIUxNVv2BQOwiDpN7B/0pbV9YZla3b?=
 =?us-ascii?Q?NsOx+lte1yMwiwBW5IKChnrDJbJkChlBvyw+w1LzqV3IcxvRoOpqJ9e2+tHX?=
 =?us-ascii?Q?BsqPI0zVi3J5xAtTMVqaCMiKiW5vqhg1ysWv8lPBSVHXPxeJUbsZGdmwENUW?=
 =?us-ascii?Q?TKLU3DmNhjz0ijuDNGDXYJpxsPR/M5+Dj44Xs/BIRiR+aTWhzx4woMRuuYvR?=
 =?us-ascii?Q?VFbPxOyDi5Wr27+9nZ6vZdjOcv5cn/BzyV+dsINOVjqyaMtzEUKwl5FuS+mR?=
 =?us-ascii?Q?Jf1JyiSzQaObenKz74uoGdvWLesiyWaQKKF30u9UG3mxMbSrZ6NkitFHsslY?=
 =?us-ascii?Q?dVHMbOgpLxXMa1+iKWtiDCFkKDNoj34nLKF/MZr+5Btl70XCzbGovzX0aPnO?=
 =?us-ascii?Q?9qdKmD/dtx6NR3+Y/L1eT1jGNggBdqWHozbZQXm9GBpDxMcL3wLfaTFpQS3Q?=
 =?us-ascii?Q?o2VtvEULZJKGLibFhND8brRTg5hZcyREZ5mD4h6wyZyKuvEPplvWYSL60duA?=
 =?us-ascii?Q?n3woD9Sx6lEqkNBd7p11NfdZdgUKWJ5v+N5yUWi3E4p1xLlA9+kQZrCu/dDf?=
 =?us-ascii?Q?Jd3xrSIPPGXJR62YFVNi5q5O4TFz4RXMrK6uVPeSqIW9nenbEnW/Mpl7svfx?=
 =?us-ascii?Q?PNsZMY7C5Q57O7YbTRLxI1BvVpBjpGGUgaUDfFP+oxmy+l2eajNXd0kZMidk?=
 =?us-ascii?Q?t5RGGhfEN0JDMO5H9D0w8KFgXs4nc2O+J9qH1XIQrxD4Tof7QQDfe7oadL4c?=
 =?us-ascii?Q?bzUX72/DWKaCaV/GF1/e69PEvGY5a4Gpmyl06mRtzI96hjay3lgZlQXJYawu?=
 =?us-ascii?Q?bemrXAqXUsiSbNTMULuUxmRFO/gzQa3IJL8RJYbB1fmtxZ8478r9ih1Rt0WG?=
 =?us-ascii?Q?0SaA56UaNq6L+nFmfDy61l+AJn7mtTaKZUk+EaPuQ3htF4YDS86RBWqEP9nY?=
 =?us-ascii?Q?2gLKreI3DVuytWXPd9SXD94OUrhSY4MKuXAYE13G/tN14QmkEsyyUD1aa/b0?=
 =?us-ascii?Q?P30WndfQ+g+qg/woyz/PU7BRCVDHZng5kqLLgqSrv27dVWtCUQ5wvCCXklrH?=
 =?us-ascii?Q?GahlPTQPt0opF0c6rBjCxQHlqZcjgIuC5Ls0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+9w5yKWzIHJBB35zLL1NIdbNW4WybPhjPVjDTn87zbx0lqM0jL8sp19l4y36?=
 =?us-ascii?Q?WDeMyctzYN+CY3/70zI3SnhFJxwaYOFc/Aef7eMi+vSjHiOsja9a3RxG0jwR?=
 =?us-ascii?Q?NU6Obc5Wk4hFrAsDw6QBPQxrOvZQ4dqWQ5u4lJxJKXHUay4YwmsSjpQVr2Ju?=
 =?us-ascii?Q?vU+iGXVO9EgOtZr04Nn6saLL2jzlCEGN7kN827zlA1Yi2vFZ37Ctq9irntpr?=
 =?us-ascii?Q?lL23NhBTBoi/49/iim4jORySTCMl9kQZZZw7lig0V+juLZfu6DxLho93qccd?=
 =?us-ascii?Q?ROJLjw4RgIt+Xk4tH0kslnyiUWRMIGZPYSsz8QGKTuCpF6oxqsJAdqhyJ+3t?=
 =?us-ascii?Q?oYejM8DTvFpcWSP5aQ7yhR2JGJ2/gDQog2DYkwBZRWUyNAlts1U/+TT5NbCI?=
 =?us-ascii?Q?5zGbxfoHrjcuQIsTt7SOGT/A7HCxkMJZYo+4xq4nKRAcYrgGPFbVAj3uD5bv?=
 =?us-ascii?Q?J8f72Us6RCv334DGGR00yvFxgKAiu+PS2P9Xt5yV166i4HqveOGZF3pWUzZg?=
 =?us-ascii?Q?aTAy5KWYeWYVHFG/n/llt+KQYqX9NYq/scWTBeaTWFyXTQhc/BGSSv3Z7aRv?=
 =?us-ascii?Q?HZNwZKoKu57PnvcHPc0OX4l6jpvQa7qxso1Pc5IJK/2CwaOti4qzZj0dQRsP?=
 =?us-ascii?Q?rSdDJSITSbhkeJgson8pt18/s7iTSQYuHdqH76N4eFHqJ5wFbm6Pj8fhyfa0?=
 =?us-ascii?Q?hftHfcoC46so7FeukQqn1hfnVucDWeExD7unxHm/OeGn6Ratakh3N88iecrr?=
 =?us-ascii?Q?Du/t2N+KyIqYM/m3NTudrvjFWTxgwCXp837+2J/rNGhufsRFq5PrmwkZupA+?=
 =?us-ascii?Q?cCwVTHirHYhcWQ0EKslry+a6lWduB1MnE1Pn4gbOyM49/cq/Jbq12Uh0Yelg?=
 =?us-ascii?Q?QRUd1qTwvrJ7XAeAWU0frt8aPPhy1JziIXhdRc7yk/1X3+6ULDYCuFaE7ADx?=
 =?us-ascii?Q?EKu1jlZzYpngoNLWAP5tTgtuUSrN6JtSc3RqUWgwx16Sy02I4dMiANzsyyHu?=
 =?us-ascii?Q?5pB7+ARv2A5ON/T3IZdYXkmUY49wGATDSwX62vRtAHIW8ikdWJFaERZnfk3r?=
 =?us-ascii?Q?kweDsqsNBohJ1UrUReeNRpXml3hI3CMxuQQC6YT5HGQ5Tx00UteI+7L/AWC/?=
 =?us-ascii?Q?7C9HA6nkK3jssQt/uwT3FxDouvbdsoHprOHMxz3IkjAmLWHKKm3bw3xo71WT?=
 =?us-ascii?Q?FvM5qtAVCOzFsvcoNoE9ROH2XuVk9YT8VkhjvyrYpoxFP5kVURI2xZqkyNs/?=
 =?us-ascii?Q?iz2ufo8lxCCABXS5XI5b7YQd6ieOgaKP7476If2ExdMQxawfaVlz+k9L9BNc?=
 =?us-ascii?Q?qm34FBA/jspWqyO/SGMUUfDhv3NxJcSVa2/v0wnDWeRmxwO+8d6JfyiGqdQJ?=
 =?us-ascii?Q?zlOvYlwiHN9FgkvMbnDqOcwKhs2JgEj85ObeHOYiz4Z9u5v1BWti+vZFpIvY?=
 =?us-ascii?Q?Nvh6APyoEKHnjtVijkbCLa1mcG3UFag/XinQtmlKCUUM44xTPIY9TYct4bp+?=
 =?us-ascii?Q?cNj16fAr4MkNFeagQUcelTdI3gw8TfiqoCx9gP3ydN8uU0eX1l3HdvMG9I6E?=
 =?us-ascii?Q?hOlta0D2LUVcrDD/MxHZJVnyFUsfjy4zxn35r8zp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b5e2bfd-17c7-4de6-cbb6-08de12f0e1a9
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 11:31:32.5032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LqGC4N65ivUCWjkwUMI6i5EEdQFj2caPXzxCpGLQh1A+d9G29nkUBwtfIJzk4InxJ/OV/1C2B+OLMj5lLSmWlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8598
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_043138_087970_FFD65C95 
X-CRM114-Status: GOOD (  11.76  )
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

From: Carlos Song <carlos.song@nxp.com>

Now for ECSPI only support 8 bits per word in target mode.
Enable 16/32 bits per word support for spi-imx target mode.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
 drivers/spi/spi-imx.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index 155ddeb8fcd4..017f83f5dfdf 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -424,8 +424,12 @@ static void spi_imx_buf_tx_swap(struct spi_imx_data *spi_imx)
 
 static void mx53_ecspi_rx_target(struct spi_imx_data *spi_imx)
 {
-	u32 val = ioread32be(spi_imx->base + MXC_CSPIRXDATA);
+	u32 val = readl(spi_imx->base + MXC_CSPIRXDATA);
 
+	if (spi_imx->bits_per_word <= 8)
+		swab32s(&val);
+	else if (spi_imx->bits_per_word <= 16)
+		swahw32s(&val);
 	if (spi_imx->rx_buf) {
 		int n_bytes = spi_imx->target_burst % sizeof(val);
 
@@ -453,12 +457,16 @@ static void mx53_ecspi_tx_target(struct spi_imx_data *spi_imx)
 	if (spi_imx->tx_buf) {
 		memcpy(((u8 *)&val) + sizeof(val) - n_bytes,
 		       spi_imx->tx_buf, n_bytes);
+		if (spi_imx->bits_per_word <= 8)
+			swab32s(&val);
+		else if (spi_imx->bits_per_word <= 16)
+			swahw32s(&val);
 		spi_imx->tx_buf += n_bytes;
 	}
 
 	spi_imx->count -= n_bytes;
 
-	iowrite32be(val, spi_imx->base + MXC_CSPITXDATA);
+	writel(val, spi_imx->base + MXC_CSPITXDATA);
 }
 
 /* MX51 eCSPI */
-- 
2.34.1


