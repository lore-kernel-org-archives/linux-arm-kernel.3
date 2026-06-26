Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707CCCDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 02:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f48RV4ofvmwfRHkoXli/oMlDLzN76hal50VkdpUe5W0=; b=CJBAUpuJ3pIlkSmyIM9n1CRBv9
	7qN6TCr1X0kJWy3hKJo5yCc0cvhqMYGWJF2YRd8rqFPRpY2Vqd2AiglrSazVqld5ikxXgCwbU96Z+
	SU1M2nmZxm7NQm9mtQH6FYK4dv9QuVZmHYQHprCuVDyNDLgoVnrgOS1FkffPRm+Rg8ON9B4fFbxbh
	hM4YI08qsiSSOZOdvibMj5tLs71rREqqYsbSmfrLOOnP7QavRIfMKBu4aW8MD0Sh+p7Ms7wC9RzXL
	/pRE/YckRhwG6mZpfV5BZ5aZowuC7+jtYc4TWXxG/P930tk6AxtNcKlpN2iH7GFHl2D4DPRw9JwmH
	hbcqFbMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcwLn-0000000AIGM-2vlw;
	Fri, 26 Jun 2026 02:31:27 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcwLk-0000000AID3-1qKt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 02:31:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWniKAF50s9MnI2nCLQTTb2GTam0wC/pIHWkC6drPq1Tz4UkYKdzyejmhT9M9jCwY5NFrCZiIin+bK+/0cHhub5VPXDR1+pBjAbMydJudrvlgSWOwvWewcqxW7zi6EYa3vcVNnx+T7bqQSkc4M2hOFBeFL6wRjPhruUafQ/KlgamRtkyuDegm86ORIo8V0r+gWimK26pw/TZirGZUp/rhD7GvJ9T6VKDY+FO0mm7J/K5w3Luc9qdqmnLzRhL/l3mxl4dBUWHO0nDTXdko4ofo+sFicPAM+QcvJysge8ua6zQf2uDVT2RCMG8A9aITbsGP7r5wqXVAQ8atAOsuX7vdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f48RV4ofvmwfRHkoXli/oMlDLzN76hal50VkdpUe5W0=;
 b=QJdAJYXAoXHqleuVJ/RL445KzDieFTT6KDpRD8EBdvX82/RSX0+UgCy5Hv6pXLAMr0HWj3iQqu8FCBpdAcr/RN7bnrPQh6acOOhMzuUajuKY4GLLscA4W9QBKXg4K2kb7/j8SSPf/jRQpQDKSS9kptXn5HnaWCHmaZs7/b6kvV+PfKumrGuU0w1P5+NvFzYXR5gTRKZsSYEEutvITJT4J+ZxWEr+J6LJh5xvxqJoGNXtUcm1Rk5ybMn25Gnuf125ruxW2kXZWmolW7nCN54wGmr3SQOFtZiqaeVq14ODIwvoazRKXLLTTcBgh2R+u17Wf6VQnOLUvjWM/ast3H+Jww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f48RV4ofvmwfRHkoXli/oMlDLzN76hal50VkdpUe5W0=;
 b=PLzLBZpbDXTB+HquKz7Ya/oOwlEVb9XU2l3TmdLcT+Ezt1sb3ULPEiHeDP98CBF2P1/plC1zISRYPYQQbVtTvXSDwSntxhPW8X0F7llEVrhWNsUMb63cXViwI8ATTpugQHdfjgPNjOJUWCugfFBu+eW66FwUQCvYHvrwedDnOn66T0p5e6SreAgJmdbZKGM3ESlPrBgQxhjc+JySJqzaQfta/ueeS9PfEA7SCMiTTvPUSDeFoepftSNPZ7pwWGauTSlrdNKd+kpJXovyqKrv91U5GPcHwI0mnIuXKjH1I/UxMsmGlNnCXc+9wARdLTQgTmhKznG33PDijjNlApH1pQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com (2603:10a6:800:296::7)
 by PAXPR04MB9445.eurprd04.prod.outlook.com (2603:10a6:102:2b4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 02:31:21 +0000
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be]) by VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be%5]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 02:31:21 +0000
From: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	amitkumar.karwar@nxp.com,
	neeraj.sanjaykale@nxp.com,
	marcel@holtmann.org,
	luiz.dentz@gmail.com,
	hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	brgl@kernel.org
Cc: imx@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-pm@vger.kernel.org,
	sherry.sun@nxp.com
Subject: [PATCH V3 8/8] arm64: dts: imx8qxp-mek: Describe the PCIe M.2 Key E connector
Date: Fri, 26 Jun 2026 10:31:26 +0800
Message-ID: <20260626023126.2189931-9-sherry.sun@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260626023126.2189931-1-sherry.sun@oss.nxp.com>
References: <20260626023126.2189931-1-sherry.sun@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:196::21) To VI2PR04MB11276.eurprd04.prod.outlook.com
 (2603:10a6:800:296::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11276:EE_|PAXPR04MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: 12d96301-6523-4cba-a1cf-08ded32b02a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|19092799006|366016|18002099003|22082099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info: 7q0Y479zJDEm1Y9jnsRWxxW4pPSemJCCNyAPbDnwlZA35vbibJal0lCPVqJY7uqGtxH2yW9gpdMTHqqmRbyJdVFKGRUWVneIq9ufXkZjR28eHLU6dPAVwlLtDjjpkqZPNAage8jF5pVNLEzUnxr2ylC3om++XhxNHr7FCSuZ6hVtbwNMYmd/Bl1682XE6H58/gjN0Wlm3YB/6a6yRprNQ/Xd8nlJNDV2bctQH3c8bkdWlgn90l5Cy6HqLZLxbwk7Y996E4qGNWY1nIUNOjl9pbmYzTkQ2H7YgAwtvyJncjeqVGI0cwBq1S7aXiO4Mua9bvXzs0yydv8mWeKLhbfayRGJxssC/6vm2SJWvI7SNMLF712/dqWxIwg/GjK6wF7DF1V+WqieJdjjHPdFjBqa/zFOVNOqxSoZN9Ylri1TRJlr7psqU99v3z9CnSEKVKxrfPlB4srGIOljyG6JgBJtvEkB8FdKjpTJMupCdwm8T1xcYveEBcqt+244UTPKno00RqhKc2q7GsXzYgPPxq+kQ551+3c1rP2A2uob1agLdVAmSOmfGMFvMnWEJlnLxwufC+Ha/cIA1z36ByZEmW+sjoE3efqdDNlLpWiutQjo6gk4gAdYVB5A+Nxou2T4YDmgkxxBZctTgX7GUw80cASu+GRBsPliC43MOeyGLwhyWZm5mqrWADq5ryhNQ5TA6mEBNgUo2U5OqedThg0c6Fcegg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11276.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(19092799006)(366016)(18002099003)(22082099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Aex8Q29olEc/xgL+JNaYbGu7wFrkj4XMDXK07UWXlvhdLOM3bukLwXnrddG5?=
 =?us-ascii?Q?6Y00sY6TfJUpxWSpVIdHQkbqtmWtaZ9Bl5g996PhBPP+vWe9ysRHLLyp7GOP?=
 =?us-ascii?Q?cuP/hA1wfrNzNSnmkCzCWTgPEDM7SWzy96YZ2ezPDC9Z7BvK0Eso2TU2DNli?=
 =?us-ascii?Q?DcBtG9r5tmgkIs0u+DDIr1I8WjOcy6zHKX3Y44hKoY6onlcjFXGGg8J1cOBX?=
 =?us-ascii?Q?47qmSgs/AodNeW8QxQMSk+3hrgcdz2Cf/TAdDIxxpDTMLOmsmOLaSZiWoLD/?=
 =?us-ascii?Q?39jOo/U4xsQM7grbdei5rI44OGCDQoHhpfz3Z/fcMGXptlKd3hxTorC131Gl?=
 =?us-ascii?Q?JC0rxnCkFaLcQ+xTXPVuXS52pMWzO7JXFpVXljHYu4eKv8JEagAGLRDwGRKs?=
 =?us-ascii?Q?N4uzCsf0JTZdhco7jbJyA7xZjcP4cU1BFvFFJJG6bqodAInFx91B0NkKHolJ?=
 =?us-ascii?Q?lESvOO+PdKXWyc2kiNfPtcclZrdGI8tEU1M9QbTg4pFPRCiyHlLmRes6/nzh?=
 =?us-ascii?Q?xK+yuE3Lf+6KY2uqf9sQ7XmqLWvsYRim9CO2s44LpCAghp9JOPIBmqamiuHh?=
 =?us-ascii?Q?4Bo3OdfeVTDJ9UNPCVw34UOgy7mJyecH6OB7a9FeeB0I3Vs9SGaDT/YjshEF?=
 =?us-ascii?Q?Oh13UmGNmBVetff4Tvv8o8CnwdW4u190JdFJRkoGxQdUY51ShzyxphGa7zZM?=
 =?us-ascii?Q?W5Rd3narGbbwUevYsllQxQV4VP6gL8zQUZkkdEVBCagScF7kMzEZDrndOj8i?=
 =?us-ascii?Q?6iIBJl5IQ0haClUQPQnkmaZr9zWHB8esf0y4qzhl7Fz7qrE7kxRIjI0cAyKM?=
 =?us-ascii?Q?T8nNt5FqjDGXoEB5VICXX508xOibNU/Sae4J6NHbzMpqO2g3kLkFB9A/vvGe?=
 =?us-ascii?Q?p06M5Pm0caQYFN76n3F2/2Uho/pXMgjDd+Sxs+2Io9NYPighwnk3ql34d48O?=
 =?us-ascii?Q?lC24StTFk67UnTcmadviHADvVROyc+YvKJiBKFu95PHJyobAf1xkcY44EphJ?=
 =?us-ascii?Q?qMftomYwbxKzrTBM91qrtJYWcrUvb/rmfGduK4xWobT1SLYAzFVEWsxE8lF8?=
 =?us-ascii?Q?wXgWRVpR3ohvZ1Yhqw2CI6/oei/Ie9IgxBSSeP62JpHc0Kl9LkFOzkjph8KN?=
 =?us-ascii?Q?yrVXE2U/UAw0bz4FW3HqIAXmUdwbVuTPkohDjJXn+UIp2XDmZqMVAWYQgxKK?=
 =?us-ascii?Q?tmpktaVAx/5+geMc27EK4q21BvhKz/TOBSPloyjMMV7rYz18eNVKOo39qtdn?=
 =?us-ascii?Q?FyXWG0MCdIFskwZ0nKlDvIbWLtOVe1/1FyzKB4FYDDPzUGGzZdTOvbUC2JtB?=
 =?us-ascii?Q?Mez2piM/pvJXhi0ay9HJvXcwCLF7aWC4r/8GpZ6Wz7BucCQAwZOr9l0orM0K?=
 =?us-ascii?Q?DQJ9G0YpJPMkG9LlFTRekDQd+d0onGrQYjQBFlCXH6mzJOPIcNGeLW3Ccwju?=
 =?us-ascii?Q?sr9iE2OlTJ9StnGpV9i7YzscwYbHT4UpRGZ4cfYZ2kEY/k0491oFQtXf1xtm?=
 =?us-ascii?Q?vBlm8fxJwpNgCCCFfww4qk/wIeWBskUPiaN27utmwJPk//A9oriZRnRISJUO?=
 =?us-ascii?Q?FGwXMim/pMV7Hl/rjH6tMW8d4TIKEaoRWScqAztHf3zLZ/LUdJ/AHANPBs7N?=
 =?us-ascii?Q?6nY3cQZFAH32QneeFkWk2Gc00ib0FQA8aifaQa3qrFYSXMwGHufhSJWwYPCm?=
 =?us-ascii?Q?+uq0bUtZr+IIxw//4KDljDackGYSRIR44ntLDliNC+CL3XAupbd8+RYjAZ2d?=
 =?us-ascii?Q?BOj4TpnuTfTwtXeceVfzwCPtwVZI98Sw40pJlzMXy3o59SmFWAOE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12d96301-6523-4cba-a1cf-08ded32b02a1
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11276.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 02:31:21.5817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z2BWpwH2S9/DcRlB6WGWYqZt4ZdRLkgJmXJXxGy1+miMhTSPQQ2t4uj4GGevrSe2LBqTC9ScxtGN7+NxLwVNBMaoBRXLiEdU4bs7STRey78e0KBj7xtwrLWWRj7jbHIT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_193124_475084_E464D03D 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
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

From: Sherry Sun <sherry.sun@nxp.com>

The i.MX8QXP-MEK has the PCIe M.2 Mechanical Key E connector to connect
wireless connectivity cards over PCIe and UART interfaces. Hence,
describe the connector node and link it with the PCIe b Root Port and
LPUART1 nodes through graph port/endpoint.

The M.2 Key E connector is powered by a 3.3V fixed regulator
(reg_3v3) on board.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 54 ++++++++++++++-----
 1 file changed, 41 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index a9b967d0a9be..c9fe4034cc2d 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -40,6 +40,37 @@ memory@80000000 {
 		reg = <0x00000000 0x80000000 0 0x40000000>;
 	};
 
+	m2-connector {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&reg_3v3>;
+		w-disable1-gpios = <&pca9557_a 2 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcieb_port0_ep>;
+				};
+			};
+
+			port@3 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <3>;
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&lpuart1_ep>;
+				};
+			};
+		};
+	};
+
 	reg_usdhc2_vmmc: usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "SD1_SPWR";
@@ -157,15 +188,6 @@ reg_3v3: regulator-3v3 {
 		regulator-max-microvolt = <3300000>;
 	};
 
-	reg_pcieb: regulator-pcie {
-		compatible = "regulator-fixed";
-		regulator-max-microvolt = <3300000>;
-		regulator-min-microvolt = <3300000>;
-		regulator-name = "mpcie_3v3";
-		gpio = <&pca9557_a 2 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
 	reg_audio: regulator-audio {
 		compatible = "regulator-fixed";
 		regulator-max-microvolt = <3300000>;
@@ -696,8 +718,10 @@ &lpuart1 {
 	pinctrl-0 = <&pinctrl_lpuart1>;
 	status = "okay";
 
-	bluetooth {
-		compatible = "nxp,88w8987-bt";
+	port {
+		lpuart1_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
 	};
 };
 
@@ -746,8 +770,12 @@ &pcie0_ep {
 
 &pcieb_port0 {
 	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
-	vpcie-supply = <&reg_pcieb>;
-	vpcie3v3aux-supply = <&reg_pcieb>;
+
+	port {
+		pcieb_port0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
 };
 
 &scu_key {
-- 
2.50.1


