Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F484C369B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 06:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mi6mKBl9wSEkHCFGJZSabU9nI902sgwAi74QsJHvFMQ=; b=yQXyd+SAQXWbf+Bv16vMsuS3qQ
	kg+GDXSPKYNi/S3UJ/zlbq9WSwZV8E06ThOzlmFVKe8N5fVHlD7O1za0b1SFOhkkauaPJnXNoDnfw
	U3Me9gidC4gJDfvgIjCml+dvUq8gjtoxR9N3YfIIueZxbNB+3vYKMzeba1cmJ1xVnI+3xANVAjobt
	GBLs4pwxFkWKJNhrW98s3dnIaqPHSc6iICZLf0+H7XNW285dhCfWWgpPtpGrwkSgQ6eTL5Ojwlc26
	DR/wlqNgwhYi5dlULWWHMLXO6ON+b+mlZwQajVW3drrT3Jwi0PQTuxCJpPeXNVmS7L8tlX3XSxgqo
	O0BNIk/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4wCc-00000008Ouv-0sem;
	Wed, 16 Apr 2025 06:24:54 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4vxz-00000008Mtm-3NnK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 06:09:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SRvZMwd1Ss/CWtmF6OShp2J8ONReOFVKEIyEFbHdKuPuxe7BKe2f8hLccBrzIZXvWYOrnmoBInXc8H4xD1YUL6ZmDoq3hUTyzhWwHfwET+JA7GHS1CYH6Mc8+rgYlqWxns5DvfELtfjq1Y3iL6Ueym/Es84BC3HAHAAQnVaafZTSRz3Bgxd2maMs9Oyi8cYArWQE5Lu9yA+EVjaLVle5k9gyYz/vpkn/YS1uZcib36xkxm4uzSkZ1+uJ+9MCFZbMmXBHRk1oNez8CB68g5VEbSTpVwVyHp34IrBsMg72bNVECE9vm3seMCLbj8A//IS0LBc6ZipCrLylsynI7RfDCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mi6mKBl9wSEkHCFGJZSabU9nI902sgwAi74QsJHvFMQ=;
 b=HInzjtFOocruBPdeH1rXD/rjTHjEi5OBoCGqlWTtAw4JW/pB0svbO8v90Pn75jU2UxlmcPp3C5rA0pQRspqIdIOCbz5KSlIQhuhtH7Fhp6T/bcIvj7jfH7geyyhsxJ/pnvhJZhVd9YMYiO+bAJ4FkSHg7+UHi/2F4elN2ZQ9vFx9YI2k9/bhtBqw/qPi+EjZ47l9TN6apjMRbtW2eNGtCuP4oC83hk/XTm6cGCgiqMjWb56JX4796UzlstDlWx4UjvQ9MM+YQPmXSCtgmo4lrHCCEgWeLcveRA9vJnA/okBgkV7AAUms/OkKM1AoOTQ/lj538Jw4xfMEG8u58xYuOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mi6mKBl9wSEkHCFGJZSabU9nI902sgwAi74QsJHvFMQ=;
 b=YNpONHx9IEAveINxTge+GG4diuUWPjY41EsE+nEOrHVLMtjLnaws2vxyrnOl2sPAZhsz6aw0x4WyID9ROCrP71mpAxI2rvWibppQWoby/03WKm3/sVERZXeXuh8xtkBx3Be8nM+CeEXWtT0ur6XcLzAqTBKhH2dc9rZcFcLRcZdpj8SA4r8zxBWmp2y8LLoTD8A9kkMQ/7Dy/XGYGgmu240S6NTR8ZB5vec1lTr+Gh0gzcjfsE3vmFg5JfcyHs06pbYNrbWt/UkIZKlF2jR+8vpZCLr3z38GJqR7elUxYKtEAbBRUD2HYnp0ouf86Wh372CXRC78zOXj6pO/Ck+Q5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by VI1PR04MB6992.eurprd04.prod.outlook.com (2603:10a6:803:139::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Wed, 16 Apr
 2025 06:09:45 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93%4]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 06:09:45 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	bhelgaas@google.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v6 7/7] PCI: imx6: Save and restore the LUT setting for i.MX95 PCIe
Date: Wed, 16 Apr 2025 14:06:48 +0800
Message-Id: <20250416060648.3628972-8-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250416060648.3628972-1-hongxing.zhu@nxp.com>
References: <20250416060648.3628972-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0054.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::22) To AS8PR04MB8676.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8676:EE_|VI1PR04MB6992:EE_
X-MS-Office365-Filtering-Correlation-Id: 15c79305-2be6-450d-4761-08dd7cad48b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l47+hq48nyqzixWCZYmbOUn4tFjYVJrzJD6EGwoCe+LpJpz9f9/TpZv2W61J?=
 =?us-ascii?Q?wAwQ5PNzEMQgAiQfSsFYGr4tj2qMHTWEEH43RwCGytWSmoMde/Z2qnZH9vUB?=
 =?us-ascii?Q?z0u+ACjoSnWjrANqJmFLGsl4QuZ5ZSzkiXSCLPBM0KtNzSvF5QOuMMbK5PEV?=
 =?us-ascii?Q?6OhU1VFccC35TvWDgj/HcgQSrboOwZD4V4grNx4mgai1tZ5T90PE5WRJKNB3?=
 =?us-ascii?Q?cLn4714bmhI7Mi29aH9bZKpjFSK3vmYH0ocDYklMVDYPVrYV55wxL47+i8Bf?=
 =?us-ascii?Q?+PJkIqjpjTP2sh5DvJ9I4kaMjrWykCdUCY8KzXeNRB3M9QBV8o7dfRje8bjO?=
 =?us-ascii?Q?HUzqLoaFnDqcatZfy9LY4h2q5kTh/OB7vJyjTX5aUFGj9ptU3Y/i+mppM8LI?=
 =?us-ascii?Q?f6sTYGmvQDHahJaIpMmI5ZhcUBrYo3RypFh5xXCy8jtd2rOC/rCVwPM3CgBl?=
 =?us-ascii?Q?qZ3kBKpP1LHxctpr2YhdUdvIwUt7OArCIsfvnbIG9xMlaNq7liGrJZrtD9jN?=
 =?us-ascii?Q?FTy2Bn5fRX/JFhZ0TafSBZNng+L3v3xDBd6gsUAj6x/WzYolcwK4RS4GitcJ?=
 =?us-ascii?Q?1fDgHy5l+DcYsImARYoKti+hgFPataTNAA//8c//EF+DPoP2h0V/e96XJjAJ?=
 =?us-ascii?Q?slXE+vqd7s0DfRM7yUPuMPK4VlwsmkKuinuyxjWnCnhakLFvDXX+h27vHBV6?=
 =?us-ascii?Q?/1ANQS+powt49I21mU+UNgNlFo3jfKTXRKn0z6sxCtunMsiaOUv0zdqhM6oH?=
 =?us-ascii?Q?/w5cg3PUw4/hw8azA5tTU0X2TuZ2MpFCZ1cSktlB9A8pb5BLQQaOuKXYpLoK?=
 =?us-ascii?Q?2/AvKQc0MBC4YxnTBeFfkbA/O+P7O5hkNQ+2l8AT6aCGYm8on++HI7we0XIt?=
 =?us-ascii?Q?SPOR2NKhoTwO/woRPd3oTGq+sOOtuMn5i+jQSNe3FSSCY97T3honN/L37pcR?=
 =?us-ascii?Q?abcXPYtngd/CWKQSeABlJMgGq6qNwBkEyKOcnP2/D026PzJFJ3cQ75IbQSj6?=
 =?us-ascii?Q?mrX2JUCVaz3ofgK+azwZBg9FQQfy6oWlLWYGwTeOWgw22WxKow9TDdq6l2uW?=
 =?us-ascii?Q?B7/zTtAsWAszJXRa0xNXXDbU+7I63wxVdVcLlE1syk8ovTBHh6wiwF9/ywC6?=
 =?us-ascii?Q?tBocriIrE1RwG5hNbf7RBu8ymXO/exZq9MVd7HKx36ZH9C+nx2rxCJGbxznx?=
 =?us-ascii?Q?K+VCqjnbzn5t5DOJrUHoiptS7hR1oVNJGaXq3qj7wyeDdOPAMMQN0vT4Udqs?=
 =?us-ascii?Q?6cN9AYP0Q71xV/p3FJAT0DEaH2nZ7AueVZqt8dN1cSz2U35cHiewGf+gfQ+a?=
 =?us-ascii?Q?LkhJdvqygciwkkRfcVU1bZuwplV7oCYOMIV1CIsj+u5ByguDH3QYqAYilB0i?=
 =?us-ascii?Q?YYG3f3h/5ogJXjnYKrYZXQdbvbVNYXZNYZHUisf8SwFF4W+wCDue4O97myeu?=
 =?us-ascii?Q?P4k5iEOZ1h/OTw+kfpxG6VlBHLzqavMbnbXTVRsa5+QG2LUrmfDUUD7WC318?=
 =?us-ascii?Q?uYLyOXuFXATCZSo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZXLuLTvW1FMaVuuXynjvEyFr7khXwyBbsRAzwXQY6G0jHBAtP5MNYqY11Yw/?=
 =?us-ascii?Q?H8plbi7AhgWVvLbPk0HALLTrbA47FNgtpuzDZky7Q7HFUJxwGU4Qles/gLqO?=
 =?us-ascii?Q?5FjfltGvHXewo287+XiUEUmELmPOgn3oGkg+SnPHymXKipEF9lbohaRdwZ8X?=
 =?us-ascii?Q?FKCgTivcA7sr4l652mQuRX+1uM53HH5XW+NqWxZxzHWT7Y3gywkyIhoHl8qB?=
 =?us-ascii?Q?VdT++EIx6sk4O0oKk5ZVJCia7V1JVB2gEEbSs+Q72tZTDhLvP6GygC6BH9xN?=
 =?us-ascii?Q?K8vN0ukT2AAe/xjZnCe31jbCiUBycnweIIrNZwJkpO0udRrkH7MM0zV9wrhL?=
 =?us-ascii?Q?VNnh47umHWrqNtbANYuOwyS1TJTtyf3qOWien7AYB3LQYQANQjmDKVRuBBnX?=
 =?us-ascii?Q?SWgaJ/X+Is94aW9J19Rc1dHIb2sk4J9cuAZ0p5JAvEIpwV4BHLlLz0r+0+GW?=
 =?us-ascii?Q?lX7KmZ3mRD422MWC8Tik6vt7oMPp/HPMvdBhMqyXzV1gsVze01he/l6CdqE1?=
 =?us-ascii?Q?Kw9BNXUidYtJa+2srMOXr3+AZcKgFVIyD3TXmGr0XIpI3Dg9JKP4R8k3EAie?=
 =?us-ascii?Q?5h9m2JtysfA8QwRDpXwA7IPOwvB9Eg9Hqn3tEizlPRyht78C/C/UfdsrXtLI?=
 =?us-ascii?Q?bcADJNX80qusR29bI0ff/qlDD4pPq6jIGOJrPAk/86E1mvAqvesssjCdOlU7?=
 =?us-ascii?Q?nzsSo5bidFIJXX7jxJJNyBdaHXUusZGIEf5XIV2oPonLwmfiZ49wznEXMm8L?=
 =?us-ascii?Q?EwKmDFfAh5mjGY0hTXmjHaEkZZqlFgDzPF+XfkrFL2XPEPJq1vtYnLvQJGSn?=
 =?us-ascii?Q?pMJVe7z0OV9aL2aJXRaDfkk3hj4jkPP/mFjdLoSZtzQ33ndBtjKzfBdeJxuf?=
 =?us-ascii?Q?nUpR0B8Naqwx3y4uLboypUe9mPPnGIzgeYPYDc/o5Mu2il4Bm+ZW7zrnvRuq?=
 =?us-ascii?Q?yYLoDVGfT3Wmwx4l+KP5FRX3GbC7tRw1Ypa1ksj2pm/NudjIkg1ItA2U2r37?=
 =?us-ascii?Q?zrWWmIvvqg4YdRY/VyDB3d+NiunAgKU9syL6bVHqqr60jy92tT6f1sCt8Y3Z?=
 =?us-ascii?Q?e04mt4nyQjbh2h3NRhPy+DySRA1h7q8odEwREJ5Sle+u/X6GKY1L2lKhF8q+?=
 =?us-ascii?Q?yxD/sBTGO4gskoeB2gBrjEUoEwvkau+lE4LdvXA+H8s63mAzejt83JpV5XQr?=
 =?us-ascii?Q?ECdA4p9BKKg+cm33FrT8VSKiv4+zazlmbwaB5N2FYzsIp7pKRlQN+1idiXNR?=
 =?us-ascii?Q?Lbhudmjns9i8ir78pDx20W1PX0JqvmFDMozurZcOKceGda553vyvpJ7Njdrq?=
 =?us-ascii?Q?Wh2QD7PDs7u53FYAZ/AReO7uveu1iEvUOgSVvmW0q+/7YooplLwYVhYFttPn?=
 =?us-ascii?Q?I24lSilF75pVLOF2zITFp3sns5GwsPZUva7yOAK8k2iT6HiNDTUOJcK2Ex3c?=
 =?us-ascii?Q?fMp4Lo1sPiKa5Zv3m/pQ2WDrbWOiiG0ech4QYXnqnZ8IFc6mF6x6kpGza4Ae?=
 =?us-ascii?Q?Tkvt5DAjnHoVwIONtttruhugKlPL7HEgJiKHt0hloeOFusXxLhhiJs7VKx1y?=
 =?us-ascii?Q?8o+zzg9KPvzYMBz8Bz/Kir1/+lq40SLIQFpKOBJ1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c79305-2be6-450d-4761-08dd7cad48b6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 06:09:44.9405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dZuOfZFnleAR6y1cUhUoZTo74Fh86w6ekWmoUVqr/cYvTJeDq9CIU8plZix+ga/ZQqJnPPGHysZ+TOa2WMFzng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6992
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_230947_856547_025BACA3 
X-CRM114-Status: GOOD (  16.71  )
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

The look up table(LUT) setting would be lost during PCIe suspend on i.MX95.

To ensure proper functionality after resume, save and restore the LUT
setting in suspend and resume operations.

Fixes: 9d6b1bd6b3c8 ("PCI: imx6: Add i.MX8MQ, i.MX8Q and i.MX95 PM support")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pci-imx6.c | 47 +++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 4cff66794990..5a38cfaf989b 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -139,6 +139,11 @@ struct imx_pcie_drvdata {
 	const struct dw_pcie_host_ops *ops;
 };
 
+struct imx_lut_data {
+	u32 data1;
+	u32 data2;
+};
+
 struct imx_pcie {
 	struct dw_pcie		*pci;
 	struct gpio_desc	*reset_gpiod;
@@ -158,6 +163,8 @@ struct imx_pcie {
 	struct regulator	*vph;
 	void __iomem		*phy_base;
 
+	/* LUT data for pcie */
+	struct imx_lut_data	luts[IMX95_MAX_LUT];
 	/* power domain for pcie */
 	struct device		*pd_pcie;
 	/* power domain for pcie phy */
@@ -1484,6 +1491,42 @@ static void imx_pcie_msi_save_restore(struct imx_pcie *imx_pcie, bool save)
 	}
 }
 
+static void imx_pcie_lut_save(struct imx_pcie *imx_pcie)
+{
+	u32 data1, data2;
+	int i;
+
+	for (i = 0; i < IMX95_MAX_LUT; i++) {
+		regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_ACSCTRL,
+			     IMX95_PEO_LUT_RWA | i);
+		regmap_read(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA1, &data1);
+		regmap_read(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA2, &data2);
+		if (data1 & IMX95_PE0_LUT_VLD) {
+			imx_pcie->luts[i].data1 = data1;
+			imx_pcie->luts[i].data2 = data2;
+		} else {
+			imx_pcie->luts[i].data1 = 0;
+			imx_pcie->luts[i].data2 = 0;
+		}
+	}
+}
+
+static void imx_pcie_lut_restore(struct imx_pcie *imx_pcie)
+{
+	int i;
+
+	for (i = 0; i < IMX95_MAX_LUT; i++) {
+		if ((imx_pcie->luts[i].data1 & IMX95_PE0_LUT_VLD) == 0)
+			continue;
+
+		regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA1,
+			     imx_pcie->luts[i].data1);
+		regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA2,
+			     imx_pcie->luts[i].data2);
+		regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_ACSCTRL, i);
+	}
+}
+
 static int imx_pcie_suspend_noirq(struct device *dev)
 {
 	struct imx_pcie *imx_pcie = dev_get_drvdata(dev);
@@ -1492,6 +1535,8 @@ static int imx_pcie_suspend_noirq(struct device *dev)
 		return 0;
 
 	imx_pcie_msi_save_restore(imx_pcie, true);
+	if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_HAS_LUT))
+		imx_pcie_lut_save(imx_pcie);
 	if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_BROKEN_SUSPEND)) {
 		/*
 		 * The minimum for a workaround would be to set PERST# and to
@@ -1536,6 +1581,8 @@ static int imx_pcie_resume_noirq(struct device *dev)
 		if (ret)
 			return ret;
 	}
+	if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_HAS_LUT))
+		imx_pcie_lut_restore(imx_pcie);
 	imx_pcie_msi_save_restore(imx_pcie, false);
 
 	return 0;
-- 
2.37.1


