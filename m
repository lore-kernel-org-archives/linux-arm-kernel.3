Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81054C55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 03:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9mlfn2oxezmbUZYZRjFyIjHiCzZc7sDczd6fXy+4R3E=; b=qFXbIryXoQF86XkwnKQq53i0e/
	uQ/MWw/Yd5bg6YvayGDX+qAl0lptS73M/Vgel+WMZj8KDM2a7tB93DGLkpvA9+tyahx2rA+O2rZPl
	l0b1EeYD0EBOcUx1q950ObqEAVBx94Tsf/7Smz+Pr3pYH61zWSGTAY+PlqsW85tNSJt5dQ9yJCDEM
	H2cgAcuEdslAW3tU5lWWrmPTtsjHMOyZrInezk8f4/QWQplt50u12su2CviXULe1RIzxnYAb1ow75
	vXCKFkDtrpxGw5eeUYN2MYXTPt0TvekWV/eVxv86EXMX9G+Y7PaDeD014coUrmrvIprnh8xrdtkPC
	/IPQvdJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpdVt-0000000BefA-2V5n;
	Fri, 31 Jul 2026 03:02:21 +0000
Received: from mail-northeuropeazon11010022.outbound.protection.outlook.com ([52.101.84.22] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpdVq-0000000Beep-3MYR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 03:02:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zA3l/spYZn9/hATQrplM8tQNactO0bunsbFUTcBT8ZUWl52FUaqkIDeaJguW0fO54DDMcDYg3JcoA0OIUXcVFfEgW4eVoqOe5oi805y0W/vEHySWOOfnNU62x4ed9BDESgPse0AmvNAd+FLLRiTxCZqe0FgOLgkpw8fm99EaFAG2fGytCUNSZbEzUw0r08IsahIpbx81SIcDQcdzNrzF2xpBD9tfBuBev6CwwInYi6tTraeGqMS9B190YEaLm3KWXQj+3HejIEh5Y9Ik8zfr8SCkZxv6IOcMPBDK4k7fomvLE0Hbkwg11XnPDqo4dt/O0TQ4rRQlRzKRSLQtMFYI3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mlfn2oxezmbUZYZRjFyIjHiCzZc7sDczd6fXy+4R3E=;
 b=M2F7UJg+03BfOy5yCBStnNY19CUBiaTkCjcsakRBJDTGVf4NdLQ5EXrKO82aCi6+h0N1ykfYQkj5OVvQ6N0gmM5SkOGZlNl2/eaeSZiskkgnNJW6Ejere3Ki23RSbWril0IH07z+JzgkYUWM0mvHtAwp7yLcY61mE6RlGC5o0WNMOiySdjE/v0Gmq6XWPlI1YatSjRoyeEitXuNBid+d7svMJx+EfxhFZILqamkuzvWkNAgB2G7CtzwN0O3oEx8nSmXbKUU2kQbM3ejxwdTCsmUzSwa90D5BEZ7zcUMq7zXZUSJY1/Wjjku/G9+u0erdtqATtGPnq0a5AqAjXrvN+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mlfn2oxezmbUZYZRjFyIjHiCzZc7sDczd6fXy+4R3E=;
 b=c/gItT1GnC8AxdCVWSyPEpcbmzRrryotrUpc0lgapzmzuywHhjFKti1qMI8NWh5iJPU7zn61sICdqBt46frbrGfGohdtngYTF05DCZb05oBpjLA9ltGm8qnV20KaMKMlaPTiuuknz6mJ2Qa/qG2Zz34umOU3JVh0qRZ7aUEOeY4q2wU35jflcGPvYSB+ieiAv1y2bmhGWOmJuD/WbXIq7AFlwIdAQGfJnwsFLwXRhD9nUNvAUT1HlTXfxIRxduRF7Fj77eWr0hQwW6y5Q4YuAOvsxGTZwj81SENBm1SNnECwLJgVU219SRmVBYorF/WFZzcu+5P7SrAGjEWrD09E1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
 by VI0PR04MB11047.eurprd04.prod.outlook.com (2603:10a6:800:262::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 03:02:11 +0000
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d]) by PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d%5]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 03:02:11 +0000
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
Subject: [PATCH v4] PCI: imx6: Update MPLLB bandwidth to improve i.MX95 Gen3 PCIe stability
Date: Fri, 31 Jul 2026 11:05:46 +0800
Message-Id: <20260731030546.850457-1-hongxing.zhu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0200.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::15) To PAXPR04MB8096.eurprd04.prod.outlook.com
 (2603:10a6:102:1c7::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8096:EE_|VI0PR04MB11047:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eee4a5f-5fd4-437b-32c5-08deeeb01d27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|7416014|376014|1800799024|23010399003|18002099003|11063799006|10067099003|56012099006|3023799007|921020;
X-Microsoft-Antispam-Message-Info: Hr3xN3cO1k+n5aa7DlmFBv0411QrDmrdnDx6TUHpQlxdRLyRmEO+glWn4aikOnsI4XEjAUER8Aha7P2YzjyTu9JiolmE17UweGmhOSdA+YzkYg8NhVmU+y55otXtru3KQkNlJauEhFAS1/tNF7RgbhB/ZJSlP6Yca9oV5HW8wQqw7hyfbZ8wmi2l4HpZARNVia0uFaDVKIBvcYzcPOg7B0+YvyvyIZ4tF95nBDvZGhHgqFMhALAflhCz5wZ/yP/bEf3QDC8uVIZXjWGPr6Lxaj5GLKL3YiIUgy/ZhpKPrRrYHh0/9Exd/093XLtMDZYt1w2iNlYYalx75K4PTtHn5TeVRLegvgMRrFbsYKeuKQHmcTM+v7wjap9B07BQiNnoL5SZ4kDtPmcphqArIMQcua7M2r4W12z8xcjUj7NnCuNixX5p1drjy0c6wKAHDu07N5OPgI9KAPsTAdvTT9+/UUWoQm+RgrwgTHDTWLtMR4uHEccRpAu4KXdY1Os97tod3HAQOjEJgKN8x6WX6X4hblH9YqB3AK7UUz7/TXz0WmWHLyENlMCUyDGPHEhPCOJ9TSb2zhf0KCXDfIJoADTAU2nMCNVMmEahNA7zbpCVf4F5S2vjRah43CImefwMsyPzImy0YN/KAhlq+aadHuzHSdqVvIdB5miXYRZUekyVosCsfR0CmO3Mc00K/tg7PybUE3bgDeANnxTMxdpZwifBFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8096.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(1800799024)(23010399003)(18002099003)(11063799006)(10067099003)(56012099006)(3023799007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ghCulyG78wg/j2giIvg9f79tKr0g63q2RtpEJnDj6fngIsPrCTMqW5XNR+3p?=
 =?us-ascii?Q?AbGqHjzTy1vfVlO6EwuawtKQqwwIaWIKOg3V4dvS5plYo69Xe5QNJhcyblTJ?=
 =?us-ascii?Q?RIUdEqMtUvJ03qmHg0FaGI8YIKHnmZ8hf9ajATvCjtYcdEV/sog02iRfz7+p?=
 =?us-ascii?Q?ab6RH/1b+DqzOfNNfW//SAz78MqJwWOB8xuAlWtGm7GIQ+XOCrMx6Vb5UdEV?=
 =?us-ascii?Q?9DJOYRhXSo7xh1TMbFq1YMEcrz/c3/JwoeCDt3LStejG23I4mWnHmm2I9lK/?=
 =?us-ascii?Q?OnayEJ3ajULtYhz0voHtbta+GehjTvTOWT5Sw9F4CYSPM/ZDNpE3W8VyGbKY?=
 =?us-ascii?Q?7a0VhkoEsMIn7oYlHIKx1Tl9wPt83qg3K93rX1cv5sWNvd3nBICPSvU8GC8D?=
 =?us-ascii?Q?fn79B/mWy8nfXrP8248z18An7XZp0Pq1G4PY1MoQKbuk+s0zWGZcCy1k2rdQ?=
 =?us-ascii?Q?Bxg5XOns0+HOPZhVqCzCC2iB3cIhIjAbg9BCfbxvQVPRy6+xDH+CyOqCl4Sv?=
 =?us-ascii?Q?tLRMn6/10qlKzz6JbLaqm5k/Y45LnuweFF/QnvOyUjXeZEk+MG7eIjdNZOhN?=
 =?us-ascii?Q?woGxZ29+BpO3jRXHSj8AM4gh6uYsJ6C8bRwAnrA2hfTgV1l49X74wPBJdJNZ?=
 =?us-ascii?Q?Gb9pv1cQQ/ELW40gzxCi5dpNPxz8NPc7XvRqE0OVGAtUeRBqUbIKLxa9iOC0?=
 =?us-ascii?Q?tYptqMFypMtQEPDM2wA6vd5lpwImybdGkL5/LZXe1gCkNFw+FfKZ/GVpM/ks?=
 =?us-ascii?Q?RTKuNVlvR227PFTqimdGHU2sT/cWrjp6o0bABiaPLZGJmsz1UOoHMB1rPjkT?=
 =?us-ascii?Q?c/RuATH4lEEHTAxhYZ/WU6q2Wuxpurjnir5OcuJuXzAHPxgqPmV/jyNVri/l?=
 =?us-ascii?Q?TnNOMTunju45CjZ/H1qNwK88lLdqZQ4IgO+BadIZUZx1SUtaOa21TtqKpL6d?=
 =?us-ascii?Q?ZJB2mQ0y/2hEA6cbOhJKxdCiYJBghrCQ+3HPKXk44D2tT/2lHul3bmyDvavZ?=
 =?us-ascii?Q?nMgI5EXNUnpyNWRwEODtmsWKiUp9tXyX2KF1rt3I9qbcsUSRMVuiPDns9si0?=
 =?us-ascii?Q?7O+Ichu6z9O0r8xSFep/ZkdBqkGKIVyHolGjQzdRi5egtwFvN4PF6ldzaUW4?=
 =?us-ascii?Q?I1sGB+E89+J9275bG7PM3cRaPgHC6phHCYA58dWRdjuTVSmVhj3pDs0uOXFr?=
 =?us-ascii?Q?TyDIztii/+Sw+4CIGr0OQbptd/S+ukJVJaOqC67HcCBk3JdCZg2iSEEkcR2V?=
 =?us-ascii?Q?inUfH6KyCmGKshg4D7pK4/Ky6gFurbB5Nu8bV86jp6dyWQxHtHbStrqnCA9z?=
 =?us-ascii?Q?igfaKJewO7MDgt1d7WjDL2w0obAzZ8rJCHexxbU1LfA2jomD/vyrnwpOCb2/?=
 =?us-ascii?Q?sJ9MPFEyqn6rgHTsTVxK/xzfZGf4KhFFKqJCzZIVS16IYAT0h5ruGqJbGAL+?=
 =?us-ascii?Q?LLY8B5ziNqJonV8gSdMT+AAancDtoNSDb/vFnp/CD78hoPPFPHov0iEgP6le?=
 =?us-ascii?Q?x6pVXcTMOTA1TLaBgTcvPjcaS2dVZ6SJFs4RHxiahVf0exS+OZlH+lstRMLo?=
 =?us-ascii?Q?7PHkwcXD69RrkFxVoECZP6co6dIlR+5sptQNFQ5w3gvtMzjYCnosPDXOsBM6?=
 =?us-ascii?Q?rfKbHysmwYAcrfDCZzE0JrI+ZTfsdms6E4Gcu/n1RsMksYt4p7lWDfEatPYm?=
 =?us-ascii?Q?CVMN485Vnz7MN0GkVlUdUMx0ueV/xypyQQrUwwM07kcUk5lUL87vLfhkZWR0?=
 =?us-ascii?Q?E08/LJ+aprhFlrxIliNy2X7DIyaJyGWuup4iT5wlEKZFB/OdOAq+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eee4a5f-5fd4-437b-32c5-08deeeb01d27
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8096.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 03:02:11.0861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0KpKQdXiWANqCjLE9lUM4ROuLCEVbNRbLUxBmPR57u1qQj4UIbq/6Es6F/EdOpqQUSzdEkUzkby+Rd3samsg5sxYI9K0E65pf0fLrUZutdHyO/f59i+tsNeruwfW98Rr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_200218_851438_D9844FA2 
X-CRM114-Status: GOOD (  10.89  )
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

Bandwidth marginality was observed during i.MX95 Gen3 PCIe tests with
the default MPLLB_BANDWIDTH value (120). This margin degradation worsens
across voltage and temperature (VT) variations and different test
matrices, potentially causing link stability issues.

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


