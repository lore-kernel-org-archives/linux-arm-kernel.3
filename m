Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55E2C55174
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 03:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h4X5oMLIEii1Sq+jINbk031bM77kunODfehbjCYEC6Y=; b=UdIu+6hd634nNzv8eP7D3bvNE8
	JF+zDtCLhsJApWrbLWMyvItPf1QleA2AwnNjyx7bpOSvPLvghbKTA1/EWcVj8u0bVl+0wgy6K+Rl0
	TA5/IGO9G5WGudJXGvCFvuTtmheAE0yxb2PUcWdvdEpf8WRFE/rLEah2YVXoe1oyGokibOEUoS03b
	oQ9MuL7LY74HlNfLTmx8O/Qi3/U9pz9jdXJu1CfIGLHn4jyoIRT2HUxywSUppGpAkFzZYisTnteom
	IFUSHuHvgYRWHugMJ2JOPsZFnK3vB0fBvXSjIasOHjU8AkBuH9IJgebL4nUuc1Q4OgLNT4d3U5n8Q
	3y9liOJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqjWf-0000000GFe4-1Cf8;
	Mon, 03 Aug 2026 03:39:41 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqjWc-0000000GFdT-3wlQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 03:39:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hl1elqH0u+bMq0sm2kqoFQCSl9VBTxS9YJrDiy6hpkuOM/92Y0nokPeDFZ4FVqY2ngpIdGvZLyZ6dp24cc5jTWswSctd19VpU2BlxlF8gKzuezkw0AuGYzYd8SCXfx1L1R4vFgCpQWTIfkMDr15Dar6NUOse4kpMKh9BGGHFbnG8oGI5ZlO1tqIeuXRRF0Eq0uWWqPqfkefYNTQWDdg86+l1zmFQcedRp1Umi4iIKP7DM8h6zHQuDzKmBl2UIv0TThvynMAz1vXSTg7oSrhK26Xwn3hyw9Ly+nVY8RoI2qpcGVu+am4GVYru7fbGLPcs5CHMnL7IBULl4RzrMELcnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4X5oMLIEii1Sq+jINbk031bM77kunODfehbjCYEC6Y=;
 b=lmvxCz4wTorStmJ+3J7kfD5n1x7kWod9/gkp29Z/lrf3rVzRxYA9GlGL8i8fG6HCyOhngg/UdH+UqSIDbenXX0ML4xFCgYybYlZYv9+WUrbS8SiK8FpdbNkHLUG8x1psIHVUELdYep0MEmteJ4494ut7MXn14/K3XW1Lb1qpaiECKxrM5YQKcErPKV0hcEpommr7frQa6/WFsAKu7iko0Ywr2R7jUnSAbHcYronaPw5jblFMSOSodYUblBBTC0/HemSvzf64T4CqRxfNJJuwNg9dw68jxrs80RIgJQVCg+DuhaUtYbDR+6CsUNCY1czjKwl0+IwpZr16sAK/RWa8/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4X5oMLIEii1Sq+jINbk031bM77kunODfehbjCYEC6Y=;
 b=F+0PkS1X2wU4lu+UrEfAfR8VXm0t07pvwhFGmeEVXKeR91tG0oiDUIG9PmGxwJSro9CbpAZU5+s0TGoKZPJLpfbwistiD5t8SaYpRo5K4472WczKnunjF5EdyPGT6uF6/OmugLVq9GWlt2aKmIC6szCjnR7Q0ZIguMAZ7MQ24ulLVo84OtRciuVjDwF8sQ2fcKlUzlTKlRELxWaAMXtn3GzGbhhphotkDwhht7rIcNGedeDIYAt2jLNSAYt9bFX1cfYry90oZ2H1QYr+5rNn12PKnTIPjTZN9btWoyF832LIpBH47rSYy+IC1JthZVtwFh2E1JziXbGKzrPSR8m/rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
 by GV4PR04MB11976.eurprd04.prod.outlook.com (2603:10a6:150:2e9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 03:39:33 +0000
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d]) by PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d%5]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 03:39:32 +0000
From: hongxing.zhu@oss.nxp.com
To: frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v5] PCI: imx6: Update MPLLB bandwidth to improve i.MX95 Gen3 PCIe stability
Date: Mon,  3 Aug 2026 11:43:19 +0800
Message-Id: <20260803034319.992323-1-hongxing.zhu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::9)
 To PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8096:EE_|GV4PR04MB11976:EE_
X-MS-Office365-Filtering-Correlation-Id: 1df85ce6-8c22-4d62-eefc-08def110d4c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|23010399003|366016|921020|18002099003|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 48Cw4XpTk8061tX1vQHcLdS7MBgtbLdTEwyHa+S0HrAboI4b5GJ5yeREKhl3EUNi/eAKCFXlnCyfFrDyUMPkkYYCgFmOIDsEldYM70QWHUuWimng3aQHj5N37Pp9zHX6EVnef8pzS9TRePP55pVVQxCb4Yuw5qrv0tTONwjlgwnKzYUxOW6+tM51uO3m7ef3OSiCOAbCaaUewjHm0kLq5QekuIHdl7b2gJQTt9AnOYND5BUlC1/IfAeW16PX1lFDJCtZJNmRBUGfvPwh85VVJ1+83K1Xy6ep+TnyrfmUFI/MqX6h6O+2QDMN0tm8CDgvEV9JIvKfdesYfrKEwfUIdeNmw0KMoD6NIoLUiD0yl/7EtwVCtHzN7TqNs7yabDaYxWeJdD+UqTbw71fIDV3k4j+kMLis1bxvfaKI/bcC4l/Xr1uYuupv7jQBcwfrq/QhllbaFHcCXGZRTnJ4UZM/EJOygq5TOireeFfvN+ZOdUUqW8B6BvgvPjKtenVZDWX98lizpwk/nKlFtWwWO81QRBcUhWcYt4vh45795iuAGftrbP8D9TtEGj3eG7of7ycM9bJUB+5TKBp4/xn8DK42RQxdKpwB9xkyQ0U4ow/S1xIgNWi9zT7oag1DmzV6qa7XIYHpBBATvz8a4eYNdFl1isLdg8NlOr2Lr4UFYkYDx3UwiIbGnXcD+a2j5fsT5NQvMZd9JVsIMva79R6L20lmWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8096.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(23010399003)(366016)(921020)(18002099003)(3023799007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TwrOdEiZH40/kcGY/1iNLXYg5EEnUxXlpdCnT2727Lb5Jq+HpKjzF7hYuJtL?=
 =?us-ascii?Q?w9yrM3h9uMrlCWUT2Z2zHrD7QzKQA2YPqzua2IWYUy7XB9FeWWYVEGyzSEXv?=
 =?us-ascii?Q?Zlm9QqqnxWf3qR+ZVS6Ptw1PT9uUILCo1YRYGdXIxh5vqQu9VLEFJ4sp1/kJ?=
 =?us-ascii?Q?CVSgf1H7wtH49tbww0Fevr2yq1FA2fnNHr065pEFTzVQ0pAlDzw1nJxyQV6S?=
 =?us-ascii?Q?yTN+RNn3pyKZQb9C8mAsOyaIFuvjro69e5zqSXdMCdqg6H4hqlzULBSvUQOk?=
 =?us-ascii?Q?WrDcORnRtkQ66CWbRuyBVMInNGL2892/lG3mOBh0McZtirp20mISEMT94FdC?=
 =?us-ascii?Q?GvfLMm8brVGXYAo53z6NZ/g0lFpF9i2BTnoaIPMZ+eMBj6tesADdvq2Jzmjy?=
 =?us-ascii?Q?QNhoRD2Sjrd5sb104kqHdlMo/A1byc6Wcc29q9mcN3UkGrsbV5GEK/EsHvK8?=
 =?us-ascii?Q?75G9SOOjOGtWtdVJNSrGKOMaiFT4BOYWimUg2n7vZfcgddm1tx4DQ5jtdStM?=
 =?us-ascii?Q?96jx+F92+AktaZAt17x7Ye9KrPYQJWU9zSrQCV+Ln60ljoVJRGjgzRmf0Zsy?=
 =?us-ascii?Q?siHcATlERLQGQ4Q6GxrszMCOdO3oRodJyet2+M8AgdzkOlBTUcfeUggU8BBD?=
 =?us-ascii?Q?goSNbSYEuPzosXIDin7UmuEF6vpBvV4xgPXKgJ2uLtqoOCxZFwkqmSHr1QEc?=
 =?us-ascii?Q?sSdvcPaVV4QDFfNzlqIyop8yOb0mHUFlJJW8TLl9AF4MBKajklCgM1X8wQwd?=
 =?us-ascii?Q?j6YtCoorDn5GTUxZ4nAeiy2c/+RjzSVkeGjQcbv1msxCg5XNIO/cVjQP64Hx?=
 =?us-ascii?Q?kmxN4IChBVINT9CgTLbSi3QayOcvgE4U8dCWrU472wH11sis9QOHc7ytxapH?=
 =?us-ascii?Q?q8AKjAJzu/12NVzNPnwU8HusoWcxM8dm+17U+RIH9JPoM+LaQIOtgybc6y/s?=
 =?us-ascii?Q?G8wRdlRRepR4MDeZ0FeTBKCs6XyIez/CW4Gi+nujoOQi1kKjCjavNEvlLOTm?=
 =?us-ascii?Q?XwVjoq2JakgWDS7olUrqIXZWsuq61Y1B0UJjNG8OURSwivJfCD+lVbNWlQkg?=
 =?us-ascii?Q?ID2C0eKTuw5jS4hkaC6yHlglbqnP+/MlvZI1oupA1TzJibTjs9v++Y4kmRWp?=
 =?us-ascii?Q?MscN2eYAYEfWl2YRQ4NURti/FApJlV1zXMA28AU7i/3WBLUGIYwHIDdXof0B?=
 =?us-ascii?Q?bcudf7FUjgbNKEnfiaWXVJ3AcnjcWHxq42M7+q23PWqWJ9+ITzsw8qgAW2DZ?=
 =?us-ascii?Q?jxo2e0VHeddAcWKxhwEFWyQN4rh0Yeq0/kSEVqM6UpVPeNWnM0apdSWNNAVK?=
 =?us-ascii?Q?k0MugxUUkCUvIbtpRMKPaUjKW65IR/PTEcx06HDDSSZvSBy9wNdsnoptfHQ+?=
 =?us-ascii?Q?4R52Tr9VG/oFnzubS+yZqZfZuPiHX9JsQx1kKmwQ5++DEPKZcv+OTslETBZS?=
 =?us-ascii?Q?TQ9ANXy83dkNJ4YvKyjZclx7sDr2scCqoYf5BiXLe4lh648feCTYdU68UhII?=
 =?us-ascii?Q?EwQ/MXW4BiIzo0EhcF/JEeFIaLcoqsD8jWZwTb0qZfZcCIKtBz8aIBFXeYwk?=
 =?us-ascii?Q?G681dUTVwnVWjggbQhPh1+8Bmmur/BniiGDzGv05sEOX92MhQ8byybbIMcDe?=
 =?us-ascii?Q?UfInPBDUcy18apEmQb6xrcj4gNWGPRP6Vo4ZvgPh27aNxmdLVGVXMIvWclAY?=
 =?us-ascii?Q?YeTOPKOMjrYo0HR4ni7hrspDIfG2W0trbm/BE0FlStTYNJ5dwfctdCXRRt/M?=
 =?us-ascii?Q?5lkgLtVcoTxAZnJDNc/axnDhXQF//Uv3+NC+VR0P/sdix2U14bVv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df85ce6-8c22-4d62-eefc-08def110d4c2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8096.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 03:39:32.8747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qtk0K0hpnkS8JL1YfGVdVj054QVb2i6VLlS3ourtSVa8rqShPoWR47WqmMhRxwzgYuW+/QeSOiImICMQlzx1jY1gNwZd+FVFBFFHGBVtZw7litla8meViLKVjcE6wDOl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11976
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_203938_988081_C98475B5 
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

From: Richard Zhu <hongxing.zhu@nxp.com>

We observed poor bandwidth margins during i.MX95 Gen3 PCIe tests with
the default MPLLB_BANDWIDTH value (120). The margins worsened across
voltage and temperature (VT) variations and different test matrices,
potentially causing link stability issues.

Testing with MPLLB_BANDWIDTH value of 140 (0x8c) shows significant
improvement in bandwidth margins across all VT conditions and test
scenarios.

Implement PHY register write helper function and configure:
- MPLLB_BW_OVRD_IN = 140 (0x8c) for improved bandwidth margin
- MPLLB_BW_OVRD_EN to enable the override

This ensures robust PCIe Gen3 performance across all operating
conditions.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v5:
Update the commit log refer to Bjorn's suggestions.

Changes in v4:
Move the delay to imx95_pcie_init_phy() with a comment added.

Changes in v3:
Regarding Frank's comments, refine naming consistency and clarity.

Changes in v2:
Update the register name and bit definitions.
Don't move IMX95_PCIE_PHY_CR_PARA_SEL settings.
---
 drivers/pci/controller/dwc/pci-imx6.c | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 39790e66b98dc..3bc52c4781903 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -80,6 +80,17 @@
 #define IMX95_SID_MASK				GENMASK(5, 0)
 #define IMX95_MAX_LUT				32
 
+#define IMX95_PCIE_PHY_REG_ADDR			0x3008
+#define IMX95_PCIE_PHY_REG_EN			BIT(31)
+#define IMX95_PCIE_PHY_REG_ADDR_MASK		GENMASK(15, 0)
+#define IMX95_PCIE_PHY_REG_DATA			0x300c
+#define IMX95_PCIE_PHY_MPLLB_OVRD_IN		0x2004
+/* BIT(10): Override enable for mpllb_bandwidth[15:0] */
+#define IMX95_PCIE_PHY_MPLLB_OVRD_BW_EN		BIT(10)
+/* Register offset: Override value for mpllb_bandwidth[15:0] */
+#define IMX95_PCIE_PHY_MPLLB_BW_IN		0x2005
+#define IMX95_PCIE_PHY_MPLLB_BW_VAL		0x8c
+
 #define IMX95_PCIE_RST_CTRL			0x3010
 #define IMX95_PCIE_COLD_RST			BIT(0)
 
@@ -270,6 +281,15 @@ static int imx95_pcie_select_ref_clk_src(struct imx_pcie *imx_pcie)
 	return 0;
 }
 
+static void imx95_pcie_phy_write(struct imx_pcie *imx_pcie, int addr, u16 data)
+{
+	regmap_update_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_PHY_REG_ADDR,
+			   IMX95_PCIE_PHY_REG_EN, IMX95_PCIE_PHY_REG_EN);
+	regmap_update_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_PHY_REG_ADDR,
+			   IMX95_PCIE_PHY_REG_ADDR_MASK, addr);
+	regmap_write(imx_pcie->iomuxc_gpr, IMX95_PCIE_PHY_REG_DATA, data);
+}
+
 static int imx95_pcie_init_phy(struct imx_pcie *imx_pcie)
 {
 	/*
@@ -290,6 +310,18 @@ static int imx95_pcie_init_phy(struct imx_pcie *imx_pcie)
 			IMX95_PCIE_PHY_CR_PARA_SEL,
 			IMX95_PCIE_PHY_CR_PARA_SEL);
 
+	/*
+	 * A delay is required between the assertion of
+	 * IMX95_PCIE_PHY_CR_PARA_SEL and subsequent PHY register write
+	 * operation to ensure values are successfully written.
+	 */
+	udelay(200);
+
+	imx95_pcie_phy_write(imx_pcie, IMX95_PCIE_PHY_MPLLB_BW_IN,
+			     IMX95_PCIE_PHY_MPLLB_BW_VAL);
+	imx95_pcie_phy_write(imx_pcie, IMX95_PCIE_PHY_MPLLB_OVRD_IN,
+			     IMX95_PCIE_PHY_MPLLB_OVRD_BW_EN);
+
 	return 0;
 }
 
-- 
2.34.1


