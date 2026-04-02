Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE714D39406
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 09:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5tYCDpWv6EjTF2fSdSpZ4GDpJKWb1qXmwlQ8MhQsyc=; b=k8gEBLyiPpAMbUYzJ5P+Fik17z
	ZxTifEShXh/WMHkGXrs8qYLPDbZ5Bf4kU2gA+AquneKvpnkQPgY12nb8P/eGfAF9s395isG8YIOxv
	5139ameEyjbRUwOwlY2dFh5v/9SnjQ3cTL67vk+dewCfXOV1C8Dgpt6W+jvolIoc5Tk+I/vFY/TPr
	rdYSqpxUJ5eoD6uzOEaklOiij6ME6CizVaV/gPYsH4RJMm5k3eXwAkA31+kkOsqjJQtUaRrN4eLQt
	FpmILNsnZlXlczNV+snWdL244ell3l+XujSKu/fe62sYM/9cP3myEpl4yg3/or+WjVr18YLeDk71u
	3NSpRT6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EhQ-0000000HJ2w-1wCQ;
	Thu, 02 Apr 2026 09:50:52 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EhO-0000000HIzt-2U5c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 09:50:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a4cxqbLQwalfapuAixbAX5VmLGBtjBj8dbbfpYhXLyyWA3q6ipM5VSb/A/RLZ1hXyUUFjEBVInfwHmuMDYUYO5JpOnWzWtg4+mFDqbDO+L611+RoRNJN7uaAw0NskqfPl4N4fem4V9laxLS+nEiv2ENHcrlHJWXZcPceUCo0bbMQjtB64EL/jFPYzknFaXLpA35Hwl2Q2nofI5M8g+B1bOomVCvYi/aLP3AUNzpR+SetaHwOyknDbE4VGvYjDJ1L74mylVcdV9y1n2YysDPNJiGbeK3ANKbeGz4KpGgshS1IVgPg2tYyIPHiktXbj9i12sv8a5VoUbVkdtRrmLPqYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5tYCDpWv6EjTF2fSdSpZ4GDpJKWb1qXmwlQ8MhQsyc=;
 b=FNOFd67yNUek6qnzIjTf9bkunSInzLkmHBr7NVl+TVqlyR7k62h6FNiTfXo2lbjVtZAWBUP9b7TkuxZnsui7vWUh4nT9to9gnBdij0z0lLMro6PhxHQv2fdOFK0hyvOF/QgeG29/OsVvJiPAOHrH8eeAnVkHz92y+btadmZfL5tM3jV7rdVGPYI+R9qYFCvYwWf5NcpiinAszeuqcdqsDbCI5TrIYjd2ovFnnyIaCEygY6iCaKEGFdPlFlgnhI2nEvKlB1DuX1c+wShvZniho6PJUFyZj7oO2Bw58EITuzwMPikVt/41s3KfHzrZrXowNi9FTQQ5o8NqQ0Ipxs1JTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5tYCDpWv6EjTF2fSdSpZ4GDpJKWb1qXmwlQ8MhQsyc=;
 b=Wi0GUdpuEOK/fI9yMYVlf30/UrXNlMXz3e35VpTXuo3PYNMMWwrTLOiRkRqRwdvpGTVGrpEvyKDuICgjacUU24MiS812pRvfNGohm8E6jFvWn2H1000iCI0rutRyAZ+7tV+J/tNSJgVSUc98RneFkp437kdQ3sdAZX7dkBbDmkfJuR8p/g1aBQEO6Sm+Hd1XenMkuSe4yRMgOsCcgZOYEQBIn8K/JJB/bPVI3OvvcF/wl9s4OiRbb8yP8kAdHCM6sNQKaITOtnQgyevPjXHNTTulQNmujCjUrlC++mTnSMlFdI2eCPZiJzdIrvDoNs2Z5N+Bvy00PzXexHpoitLkUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AM9PR04MB7683.eurprd04.prod.outlook.com
 (2603:10a6:20b:2d7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Thu, 2 Apr
 2026 09:50:45 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.20.9769.018; Thu, 2 Apr 2026
 09:50:45 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	hongxing.zhu@nxp.com,
	l.stach@pengutronix.de
Cc: imx@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V10 07/13] arm: dts: imx6sx: Add Root Port node and PERST property
Date: Thu,  2 Apr 2026 17:51:01 +0800
Message-Id: <20260402095107.205439-8-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260402095107.205439-1-sherry.sun@nxp.com>
References: <20260402095107.205439-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0163.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::11) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AM9PR04MB7683:EE_
X-MS-Office365-Filtering-Correlation-Id: 033dddf8-77b9-43f7-9906-08de909d4fb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|19092799006|376014|52116014|366016|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: pUfY1iDDc1ziM+uKwqE6ydNdWZjpGmn1MTcXud1a5Y8VUZ1TLaNLf/OmBLObsY9SKFtqZRDATpXy2GsyNj+B5ha+k4p0KR2Y73O6MWK0F3Q0OQl0/aGAfnd8/Qh4vUvn10SA9zOmYU/U12efQJZpxLnt64Jei0m51XjWbiVCcgjvIeYq7Go/ZkZR5Okv/jzJKqFFgjDrdRqHyMKtXgk4XeswovbvrIV+af7DXfOUtlSMhiJ+43wxQmbfSpDuvcTw6Q+KCRUcrYmErLiG/d+VXvnObbIeMaB7rLBUXD5K/AsyAiDGaThUB6NKinur5INNogva4wXCfgv5QLYd9OQN/4TKcY6Kx4zEJheVbWqzVe7RFKRak8bE41peAXf/kMMYlr2MUYEIEpVwYrD4SFSisbxM2OqNe/TS8OmxGVYv7ovLUgRIXo29QYkE3xOmEBhqokgRHGuWUXYLfwNF/xNHGsEQgaq9FVK7ZzQ+C7aCC3qyqm7Lge9UBf5fYe3TANAlaEljt/dC2qIm5KQC1lhMcB7783sbMcSswn5OpyYK2iU6bnIB3b1ACZMXTjFtUHXWI2crKzlg92x+njAsLQ1wlOyu2QXCPvjvp87Kkl3xVz+Xyd3/PaqcQc/k2S0Pqd+NK1aHyvJP+lqkxjCszR35xhQjNQAbmbapimKhn2ENEVoBXCf+I9kKHiqhpUv2RbSiwDT73wj61lb/NJTiMVPeCrtJ5Cd1sKYNLni56p6J/jTiH91iILfCL7K15QbkPgClFWMWGAnCdBrDjL/Tf8wrLFpW1itd3/mtNuDPsH63lCj4g6i+NEZg/jMjq1bMDPaj
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(19092799006)(376014)(52116014)(366016)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1LR8911mtDMpgGjrFFT/Zj1H2ImfTTOjxAUAOERirnMvX3l57yMPEcjdeMOP?=
 =?us-ascii?Q?3zw3xqIKs2rM8cWzygAn+YcwqfZlnG2NjKAHZAYxEptKyqY8/7/0YyJXptn9?=
 =?us-ascii?Q?ymMu4UFn7ThbWq1xvD+SSgjJNfhf/fMqWfsd2SNOmj1tJKQFu8UeI1Y/08PA?=
 =?us-ascii?Q?3BdmQihx6Ip5jlnbj+PtEiY8/VAM8tiYbaxlIVsQS3J/5eEfwDhCsrRTNu/L?=
 =?us-ascii?Q?AyCXcBDeqjs2EjdFnqWI7BOyrGWaMVVguoU+bPkxx/csBF2Q6Q1lslNk5LPk?=
 =?us-ascii?Q?nVGgJD7CXxa17SLsYKPPTG3gW1FFUOMIPV1vVFUh65UBBNb+3HAvBU3ZaCHK?=
 =?us-ascii?Q?0SqXKi4hcrtGva707P4tt4kryBLPPZHhSiSuKf83GKoe02ItVj0Ug1+xQ4Nn?=
 =?us-ascii?Q?yfA87YQ376f5gAEhiG2oW5IE0tkuPNPXljwqIv9SgECAZ+T+9HuRqte6Eegu?=
 =?us-ascii?Q?N7r5e+aDT853UKqByu6veeKv77+c+si4P0dS8VyOjV1OPiS52ffSCJ515bkW?=
 =?us-ascii?Q?NFzp5d27HvKiYHzvcLF9vzpj2WWMfIaEFAhE9xvyJv4/uEH5UgRbvvvUgh0K?=
 =?us-ascii?Q?u8hv32ckjmMcbBHhOvZNdzKLRz2txqjmWOaOL+C7BeGy0iQV7P+hjQks7QEh?=
 =?us-ascii?Q?wNCfuEsnlMEzklFiyKVlEYSiJWF5d9vBsApNgFcLh4HqmogtOLympMolABnT?=
 =?us-ascii?Q?kfHnr4UNsf50gFREBSwb/sI1gDfLjSfGCWu2GE9J/urmLS71VTIzI/wMP+UT?=
 =?us-ascii?Q?RIyKA4gcVMgWTugobRyfUzRSfaD4CjufvERzm36NydLYv70y0hpyWH50tKO8?=
 =?us-ascii?Q?Eomdr25PKD2ZLRg7TvMw3D4UwjG97LTAt+UUt8uAGYXGDOna+TFRe9evGnFY?=
 =?us-ascii?Q?XzmnPYWZOaITSukyZSpqsx2hJYwQep7FTcuIxU2zZk3ZU/BvVVafOQ51HlzF?=
 =?us-ascii?Q?2nWPlF1XsuMANRfFYhFa/R8v90Qv1xdFV3hoWnk1R1WvQN27XYujvf2yCd64?=
 =?us-ascii?Q?ajdfPNxXHOEu1KphlHaXtT7mqMEuKoF4z+4vf4BCjBhHeW86OGAIPrd/EEU0?=
 =?us-ascii?Q?IhAGfI+kwEaisUK6QwKnF3o0Y/WKU+uJq5DBuJqxcCGGGEnFwPnh8EFKgSNw?=
 =?us-ascii?Q?/Y2p3DbPG3nzEjMsJT0/kDX1gUBs3ovhvHDJkAzy3mn/opjT77mVvQPJhRir?=
 =?us-ascii?Q?VCjbSQ25ja8WoeEhIE6Wde4Rb+ggkdLere1CgbjyqmzHw0VNs2R6LNWlaVIT?=
 =?us-ascii?Q?cPdbw2M4dZJykgYerqD5Nx8hr157v/5ua3LuHKM3v34hdV47SorJkQTreTF5?=
 =?us-ascii?Q?uaL6xzoyP3O1jI0um0eczLwAwrLj3Hi9MaJuFcqDHXwU8hY0E0fP1URWTinY?=
 =?us-ascii?Q?ocr7xS4dpp0k+aWVLal0eQ0q1xzv6J0NJB6fsYTrIRxs7dKxQMrGzbtJRse9?=
 =?us-ascii?Q?w2fAHqEZpmbqPpXRv4D/RNH9XhQtNAT3j4eSUB9NYY+0ekDDm2/xYv1gTUfv?=
 =?us-ascii?Q?tvZwO8hPSYxnhS9VPiVn0zWMi1hcHkLielSQV9eAOIatbvc5zuU9UcGx1fMG?=
 =?us-ascii?Q?ZNL6fnPjPKo2nZzy86dmxeHPWS73nGXrQD2EjAYTgNAJVzg+mvt9DCi0WprV?=
 =?us-ascii?Q?hgc7h/erPZ7m4dxhMMDuaCAza9VdQEJRSBziAZzvwIQcGiKeDh5Y0/OGLrXw?=
 =?us-ascii?Q?yR31lLAantvRdoyrS4+U40DV0A0NGuP7sSB/BAh4Hswdu/5KYrkU1KIl4vhN?=
 =?us-ascii?Q?trYQKEpMDA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 033dddf8-77b9-43f7-9906-08de909d4fb8
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 09:50:45.5856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OPLC8C5k+IYhfvlxvI/kEbc/jA53FZnTw32jFiC2DU9FwIsC/fxUmotbGWx4XKqlkoGMMcV4ITV2jlpGlidc6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7683
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_025050_634343_9D152D73 
X-CRM114-Status: GOOD (  10.67  )
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

Since describing the PCIe PERST# property under Host Bridge node is now
deprecated, it is recommended to add it to the Root Port node, so
creating the Root Port node and add the reset-gpios property in Root
Port.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi |  5 +++++
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi     | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
index 3e238d8118fa..338de4d144b2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
@@ -282,11 +282,16 @@ codec: wm8962@1a {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&gpio2 0 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie_gpio>;
 	status = "okay";
 };
 
+&pcie_port0 {
+	reset-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
+};
+
 &lcdif1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lcd>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
index aefae5a3a6be..5484c398aa37 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
@@ -1470,6 +1470,17 @@ pcie: pcie@8ffc000 {
 			power-domains = <&pd_disp>, <&pd_pci>;
 			power-domain-names = "pcie", "pcie_phy";
 			status = "disabled";
+
+			pcie_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 	};
 };
-- 
2.37.1


