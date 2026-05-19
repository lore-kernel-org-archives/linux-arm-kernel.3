Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C7ACD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1eFB1abEj1FR3BNXL9x3jkhHo60w66kcXmesC8QAxck=; b=4qMNFTEYqb1Qgdu6xGYN/z9hvl
	qqkWyAK+ld7yN9qoH9LfIZVR/6TzZZmT8DXTFshRn28wRdw265TJpp86Iq6Fp/4XQAkZBLyckzisV
	puLbAhjZweXaAmPekZ1QXz3loVs/a7hcsjFCgVNk36pd/0jBh/0pGJZqi+LiEP043FE9qZfhSKyDQ
	+98N6g4kq08dCxNB4WQCJ1Zl9QIIHVP8WI3fTaw0woYGvgCbBcZ+UeWG9LXmbO3aJwR0LORtyAt/8
	mtrpYGLSsgUiV54fAOWR03QFJ4pce7vB2Imb4hpxM5a1e4+WiobHSNRoPAxY1jPTP7hPgX4fAfxR/
	TCkuuFqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHsE-000000019h3-05W4;
	Tue, 19 May 2026 10:40:30 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHs3-000000019Qm-3B4V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:40:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KTuOBsKr6nF7+lkEE6XTrX0aYfNeeQ8LrOQXWRYPf5Iz55DyN+yI94OBFFE5wsYtuRw9tdoaX8OfbIKSx74Fk16JZruzvTfzQ7pjA7GezNfiKODqM3Qt8hjHjwf92s91qsBEsyZtjLuUdhQxNBYO/7acTA3aoRsMnZSpfHMNKl1gEWr4+rP2h77DL5IkhCf1AvTV10blm0YyUZK3LGJ2uDKDqFQYov+ga1s5FB0kCHgS7rc9gzYyOP9lPWaf35hJPoHaagu3dM2HIwIpzgaXI2E4z/Zh+X0TCMTDELyKqHa3LaB6RGYFjdrgLGreEQ2ELBRNX3CX/VntFnXYeV10YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1eFB1abEj1FR3BNXL9x3jkhHo60w66kcXmesC8QAxck=;
 b=X4l1XdrouXcG4tNnIbCK6Y3SO/jcp8NVPHRWvS2Dh0E16iWvvVvTlbbFuHfMDCYPpytDo713LhusI87pB35wEu8su1K5U3gYdXFlVpYgw/aR1uRHWxrqmImbN7zfKFBV2xc/LkG7U/k8NvNlXhA6HduzV3hdOwbNiS5znsX6O+bLoHwuPacny3tHNMESFFrSAnIzghRMtfRHtkg9fXo5gFQABsavVpDukN+diXEhWlc9QdWDAiLdRPsmGmoRFbgqqOrTFyxS+QanQ9jksxGkdeiiNNFEdKjsk1FmT2EcFw9DKqYfXl+AkTtQRr2iiKLRoiDc1jNhde0yEG8d8e4XlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1eFB1abEj1FR3BNXL9x3jkhHo60w66kcXmesC8QAxck=;
 b=G1jTIKmrsKSakBjbYR4BiBFdr1lme+BhG0LBc5UKaHoXiHKC+Ug3PiW3zPbzZGVlPnH7+hJh0nPfTnWCVnnEPenYPMy2XEKDpy1f7IeLuZexGt0tj/MgFC1Rf5xzGi8JC1/4oF+J3byecYmBxENJ7C11T0GODQxfna/GKnGwc66iZ7gd1MwSFe5ldEHF68W+HexCKZogmkUNZR2TUNfxH1TmLyXYkrVAFnlcawkAR4D8fZLlgCugNeIo6VT52G1Uh+gGdkjnMg6kgsd4m3Mlzk6kF11Bd46Phzi16S4SqqffMNa5aq8wQB4JsNjXAz+RKQnBteycCUPAWEWuWQ2iSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB6802.eurprd04.prod.outlook.com (2603:10a6:208:184::17)
 by AS4PR04MB9337.eurprd04.prod.outlook.com (2603:10a6:20b:4e5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 10:40:14 +0000
Received: from AM0PR04MB6802.eurprd04.prod.outlook.com
 ([fe80::dc36:17b6:e5b1:fa51]) by AM0PR04MB6802.eurprd04.prod.outlook.com
 ([fe80::dc36:17b6:e5b1:fa51%4]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 10:40:14 +0000
From: "Carlos Song (OSS)" <carlos.song@oss.nxp.com>
To: aisheng.dong@nxp.com,
	andi.shyti@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: carlos.song@nxp.com,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: imx-lpi2c: reset controller in probe stage
Date: Tue, 19 May 2026 18:42:14 +0800
Message-ID: <20260519104214.2794176-1-carlos.song@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::11) To AM0PR04MB6802.eurprd04.prod.outlook.com
 (2603:10a6:208:184::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6802:EE_|AS4PR04MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: e2586203-2ce8-43b7-7fbf-08deb5930270
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|366016|19092799006|56012099003|18002099003|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info: EHfUbG3LvR35hqLmsck6URcxgxRX2Q5kCNdUGbT+TPd+Cg8y51GURUeUlNikkKb98w2X/B7wyJOTRc3Jn3qoNDjBJONB6twOXHWk0EbbkB7fQ5J99/QPhgoHUv4wk9vnWeQjN/RB9tzAynUvs18opvm4eWlQfSXfDD03o/VAp0TwcZhrpeo5s2qU/cxfc/n+D9u3A+nmScw5glxfEtnqVbERy7MfeFVyg1bjR4zD2nvQPGtHdlrVNZo9dkhv1jA4atTqpDMeURIB6ZUyXU8y1fAkJznNI7HeYAln0+mJ2FjGrxz2UUkm9//6jpJEah+fHUVHLstVxYl3LFQ21l3wSma0Q7PcYZDgVIamtkTEUwqW0JP4oUKvzvXV24xQHGXfFMuRVgE4GrcT2NP2MoJS3Ooy5knh8gV8cQMKrnWU5ayKrUyOS7uhma3Hx58WXtEADJDfY5tAgyeZ+54xYPJpcgev+qoaQfun28BjGzH4ZzeT+Pgv+lktpHUaPYHGREMJ9Z6InFrtHEpYUXEquhQJ3nH1x50kg87o26iVUGshtrWSvmeA73AemgF9fEsFnZKBxbr4TG3s3FpRmErFfr0BuNIX2V532qaDAjJa47T18ZzE1Vvmz6UawKy4Y8fXC/fgg+agIvkgcntw0LctRwFC1NEvaGrEqMS33N3T55AoULOfTq6HZqAdgQzQIqixqRZAkaLUt6fRZNkw327R+s+TQLyO34VtUooRwZ2ikK+hQrqz7rxv5ectxfHJXp9bGaDE
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6802.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(19092799006)(56012099003)(18002099003)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g/xbGnPOwJgPvRscWDy3WsCvEb8+HkvjCcE6BAwKGgqzJBjtDBa6lTGHHT/b?=
 =?us-ascii?Q?sfb5heobgtESZFyVGC7h35OQC5Qld3+SQBZQtPSYfoUftqQHQj3fR4SV22H7?=
 =?us-ascii?Q?7ShoPWdilO+MHKkncD2Sk7iZZhfUc/tVNJn2NSNnsBTh4eOK2T2Gh3n+q5qx?=
 =?us-ascii?Q?ZKPNT/+wlzPvZUess6QTWQgDjPGZnoVKoMt5yREX/njq7eQYsZiCrjRcdpP+?=
 =?us-ascii?Q?O2faYVUyBcp+CX7xNfi51Zclu6NGgqLa2xgB0InuY8mGwuZbFVQEPRzIBIMB?=
 =?us-ascii?Q?Z0vhp/S9mq+7w6JT5GZPFEu+snrFvCd+vS1+AuYNuCrN6+7QZNOJlB2m1XbY?=
 =?us-ascii?Q?8ZIfJ0jEpnw4dG84YirfLLMIQZZfQjBLd+qtdxPW84xgzNBVqq+I8gyQdrOY?=
 =?us-ascii?Q?uTKbTLatYFrdJ2dS+1+Idpq8ufaOWhgxsTpUAJsfeHNjNle8XGrDmr49/Jig?=
 =?us-ascii?Q?VZ8hrpucpK5CsNhT4cKwM9XXWg2IzdIp4QAluTrrBAWTVO7Yodi/tFnaEAGW?=
 =?us-ascii?Q?opk2J0P8GI1EEmduVTIpBXqbzog66KhSMBZsFzSNUoPmFQqKEaf/Nh4Ot/4s?=
 =?us-ascii?Q?vx6moD3eHbhmbeU/iDLYfUtUIGqVr32yGu3p48ExI2a55+14th4JA8cWU23M?=
 =?us-ascii?Q?irXuhcbtd+R8r43cmObeqhxCqwCxZTmQNJ4LMry3mtXu5t6zW1a2+i/AKLQF?=
 =?us-ascii?Q?T0x9lJ8jWb+lJvVaoi6bzjWfVI4tZC6l/o6S7yShpG5017+YIcV8lE3LRFlZ?=
 =?us-ascii?Q?A19AkMKTfRustLyiSKXuogMqxBgIPLc5r0Ib4amRG53LasSAHPrAcK1qFzdB?=
 =?us-ascii?Q?X0UGL39YAltgY40kXKyvf2LF0HzukVoOpYkQHeVU52htGk60OzBHBwDilWZh?=
 =?us-ascii?Q?RYpmOm73W7XhNtptcqwor2+//UxOu/ZBGpDKgOIzPw+ssmcgdHz+SInnPbe2?=
 =?us-ascii?Q?HLvU7YkhyKHw3el9PRCy1GWGqZ988UJsdueAsDOh9Dotv94uL0tSQ/gx1823?=
 =?us-ascii?Q?emNqzOtUuypMwR6LA+w68CeSfu3frWzYZsDslK5pqC55S0R0tuhkUjQ3A/6d?=
 =?us-ascii?Q?igyNvVR3BvIEYraL0xz1Ah6jaJWblCXWLK4oks5C1cM3TGnAzcM8uc5/nK+O?=
 =?us-ascii?Q?ue8Fp+YHQBuT8JrB4KAnXfkBPYprqkK+haFN6Sgl008otBaChzyCyTTHLxpk?=
 =?us-ascii?Q?qPPc1VRIgX9zS0Pq9NIxXszfIK57chgW4TCuG4dhTvzljUpGWbSmDd+UxRO8?=
 =?us-ascii?Q?Tb/Yho3Xm09TWBwyNPWH9RG2KG7PMApAK3zHuZIphS0aAM4sZlEIAp/a29gD?=
 =?us-ascii?Q?H2pFVNxRGqamfIJVi4fMyoyO1YcNXcRicbFJBn0BEqg3Hh0hujlY8sFxKaDp?=
 =?us-ascii?Q?Rq5PjdFik9rNqL3lDc7POPHN7HoPffFjBgHpFL98FvePuaLPVgQLTEcGMDUD?=
 =?us-ascii?Q?WWbJVBo90NqWREDHb7Ncv1nZIMOFi7tUIbGhonh/ysdqIq2rTzt6b6Xu20WN?=
 =?us-ascii?Q?O7YE78esCcP1rcWQJMTDvIdeHQbPF+mp9r9LLf8YB7EiOTNIcBtObimGlmFT?=
 =?us-ascii?Q?00niYlbWRwjUynOoGMfK43YFE07YOezIteEBDgllOAkGbBs5WMENalInNHD0?=
 =?us-ascii?Q?n7wYUmN7wlhQa+IgCvfNPEKQEW5D/HBsqTDqDW+jM8XjZEpyRDsQ4SBb/c9A?=
 =?us-ascii?Q?G4i9QtQIzrtLgNIBkBT0o4bIsB3ukfOj1h3YRFWn7QepEgkgu6FPgnkyZZgP?=
 =?us-ascii?Q?EVSA/0qQcA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2586203-2ce8-43b7-7fbf-08deb5930270
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6802.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 10:40:14.3131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5S4Re7YOs8/aaEKNGcAYVPkoLL+1dVr66sEBtbRCjTIrry0D1GsNv8O7/z6LPtJyozZ1trIDSq87KF/eOJ8Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9337
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_034019_839069_D50D54EB 
X-CRM114-Status: GOOD (  12.07  )
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

Reset I2C controller in probe stage to avoid unexpected LPI2C controller
state left from previous stages and hang system boot.

Per the LPI2C reference manual, section 7.1.4 "Controller Control (MCR)",
the RST bit (bit 1) description states:

  "The reset takes effect immediately and remains asserted until negated
  by software. There is no minimum delay required before clearing the
  software reset."

Therefore, it is safe to write 0 to MCR immediately after asserting the
RST bit without any additional delay.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index bf8c1ce1c7ff..96f6dc23232e 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -1499,11 +1499,6 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	if (ret)
 		lpi2c_imx->bitrate = I2C_MAX_STANDARD_MODE_FREQ;
 
-	ret = devm_request_irq(&pdev->dev, lpi2c_imx->irq, lpi2c_imx_isr, IRQF_NO_SUSPEND,
-			       pdev->name, lpi2c_imx);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "can't claim irq %d\n", lpi2c_imx->irq);
-
 	i2c_set_adapdata(&lpi2c_imx->adapter, lpi2c_imx);
 	platform_set_drvdata(pdev, lpi2c_imx);
 
@@ -1535,10 +1530,23 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
+	/*
+	 * Reset all internal controller logic and registers to avoid effects of previous status
+	 * The reset takes effect immediately and there is no minimum delay required before
+	 * clearing the software reset.
+	 */
+	writel(MCR_RST, lpi2c_imx->base + LPI2C_MCR);
+	writel(0, lpi2c_imx->base + LPI2C_MCR);
+
 	temp = readl(lpi2c_imx->base + LPI2C_PARAM);
 	lpi2c_imx->txfifosize = 1 << (temp & 0x0f);
 	lpi2c_imx->rxfifosize = 1 << ((temp >> 8) & 0x0f);
 
+	ret = devm_request_irq(&pdev->dev, lpi2c_imx->irq, lpi2c_imx_isr, IRQF_NO_SUSPEND,
+			       pdev->name, lpi2c_imx);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "can't claim irq %d\n", lpi2c_imx->irq);
+
 	/* Init optional bus recovery function */
 	ret = lpi2c_imx_init_recovery_info(lpi2c_imx, pdev);
 	/* Give it another chance if pinctrl used is not ready yet */
-- 
2.43.0


