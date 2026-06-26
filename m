Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D72CDE00B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 02:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/PAgwfG9OX2u8oSIqiE9YemjGeL43rdbImwyNjSA7E=; b=ApT8o9jhCZYuJvmNu2hkdFRrTD
	FTg3BiGtmfewElWKrHl5sBZooGIlqzNNeaNJG8aLwLP1zb0BnsY/etA5LWuYhru3CU/IGD5jYy6y9
	7gG9puRKV9yultEG+B2WgORiL14Db5QRtBrPu4qFbFS96ptA2K3onlLU/4ZvrnCmPrDMlx6HI5cQH
	ie6gAj4xx62c1Bp2V9WPJYp5tiKx+rZwk+j2qbEw+e6lvQ1124LKeXp8iRkGQx1ZNYebIZSFCQ2AT
	Ls+cgt9lELzfBv8w9n2MRQtm+LDtgZx2icnpqItwRcTqMJp+ghIDLWwadLdutRWX7lm6hmKxr8v5M
	J6IK2e2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcwLg-0000000AIAe-23Pg;
	Fri, 26 Jun 2026 02:31:20 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcwLe-0000000AI7x-0YtO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 02:31:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+wsQ2NxXOWP8UkDcucadyOvPZK0NLNVM0E6o+i5SAhNwR6EuegAtom+vOIIGO/BR7103P6+ZCMAH0FqESZrAvdI7tQZKqV3xlUNihL3CtO+b82fYeom9C0IAMJ31WP315uV/KjgJGbc01l2GiF5Gf4XXqjCCEB67n/BjtwJX+lSsopMFvpIEVvkUPSJ3aWnROPaONWe2FGzhDYhGoNVUg6Z6TP6tlyOXQJjzMNmO0Fb8s9tCYZRGZ1gWBqFBWYAt0KNCrOnzkqF1ZhHYjSjjtPPHllWCYACfEIibCKANwdQUei/MD8sijSOJAP9dauWydR2LaO24a0nvBJcY6TU/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/PAgwfG9OX2u8oSIqiE9YemjGeL43rdbImwyNjSA7E=;
 b=l6OZgLa1yvlJYLSD0LB4C+wbH5+B7OJqkcKhbmbL21cT/WKNIVzfyBn7oqVN4HNAK2MVcUOKIe5xTIMuv2Y5apJRT8AaULbfSUcND8yt/r5IJuM3hWGDNXYW9c3kFjEk5uli+MqegIBWT47NCWA9vHAO75JDkjrp9RTjvoasaP7ZvNk236tEBMs941jrrZpKHKR7cP4H3l7V48OEVD+DqEPh7Yf+qevNLMIu4FxJA8EHYR+rPAxxafCD551oIMvDY3u5rK8poXj2+SxeasjCkzgu86rxZkTx71yDhSDbNvSZQHuTFaQIdwAo33zPOmV+4kWHbJTf4phiNMcueKqYfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/PAgwfG9OX2u8oSIqiE9YemjGeL43rdbImwyNjSA7E=;
 b=nDCnm+bFr3o6LtWlmYkpFvtJn+yQ7SDt4vrKDISqLBMmw+hjc0cPrqWWs2l8Sc2ASuV8dP2MlZAht7mS7PJw5PGrg5YFe381fzKYQaYiM8gO9vLnCoFbweIl1/QzKywEqeZ2lNEXGVjXF6HwDjpX5F0ZbqqW0DdEC4/pUdh9wNMJYctXmbWsiKqyNx701i2JWOcT+AUL7nb2d/+D8avD2SsSnaIaafkyD5FPrRqlwQzEZ3drqLmq2RQtpOv8IOR0+JPbgXocEinIbNCNh/La0voaTynPCmSxEpIKWum1EzRzPXO74Xu3vOqnqgaXQmk0RE3tlibQgxFkOL3wKoStDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com (2603:10a6:800:296::7)
 by PAXPR04MB9445.eurprd04.prod.outlook.com (2603:10a6:102:2b4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 02:31:15 +0000
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be]) by VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be%5]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 02:31:15 +0000
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
Subject: [PATCH V3 7/8] arm64: dts: imx8qm-mek: Describe the PCIe M.2 Key E connector
Date: Fri, 26 Jun 2026 10:31:25 +0800
Message-ID: <20260626023126.2189931-8-sherry.sun@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260626023126.2189931-1-sherry.sun@oss.nxp.com>
References: <20260626023126.2189931-1-sherry.sun@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:4:197::10) To VI2PR04MB11276.eurprd04.prod.outlook.com
 (2603:10a6:800:296::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11276:EE_|PAXPR04MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: d017a01f-9c4d-4e77-c423-08ded32afe9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|19092799006|366016|18002099003|22082099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info: GC9L4VFT3MSiUazLy8kqHJ77cgqOe3NbPL+i9ZIJED0g6iEDFn2QjEkSrfI4fZJh78OybSJUDWuZS+DFzSfw+YU1VdByIuoLO/hW6/NFkNgfpCSDvUZuMu01POTznWalFZ/52iSssvZ2Rg29EmkAp9dLwJEldyasd8no63dsJNPs4XEt8hrc03zCtNOQcpaVtSpCtiOPDFFSgglodOSGcccU9KJp6OhyqthZuqAmggsZtzqJX1LNN2hbeQ5nGQ6A+g7dLEA4XKnwTE0xWD64BJYxGiWeJxKFvvlf1umqkDgV1KaVEIKVb8yOY80NPPDX4XGrzOkPclHq1+IFZ1rJfZ+eN79aGUx6ev9weSc0TlUGT7rLB1UihxFNo2+5k/mNrZ5XR+jxftcj7SApFQWOSR2qqJ8bznlRIlDXxr49wQixj9DOBdHQCqnXs263IubUr96/qvUqd9Kq0HQ1Y768G0lzM5+nGnm2T7dD21fEaBw4mz1+hz1pliCfZ0HUb6rPrz1kEizAZRXXqaFDl5KeHjIkGEk4P8Ivyo9rwmEEx42Ii4OKsVwvQIGFB4/+maBLAMBDShAX08Zs6ksmu5BHSqM1Vue1COcx5pZXXx82LEANGuIoXJEWvizOHFRx9uwLFxzC45yP4ExcmIccSD7No4tHlYTbURcDJp1I+pvtvy1zMTrMIOqf3B0kMe+3WsfsYj5fiDcHslDjkeln4hJ9xg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11276.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(19092799006)(366016)(18002099003)(22082099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LcasBpE8g6OFHEpZ+Fynun5DNfIxDh2rdbttHB3tdrVH7jc/Gq5eNIZQKju3?=
 =?us-ascii?Q?gmM4lo6vHg5kuzAWpkwLO4GKzwCAdP80lR/mMEFaa/M0HQms3Zdb8CvrozUp?=
 =?us-ascii?Q?AwOl4Db3pxB5vvWZ22AycNLw7xPrvLvF+U5rLGRfuBm/2nPd0fKRDtbaqJCj?=
 =?us-ascii?Q?d2oc8Z8Jl/HD1FPk8Wnm26wPNlxEMdw1Vl17cyrZyeSaGfZKNI92buxta/m8?=
 =?us-ascii?Q?qCc14h9viPWXIbtQ5E6R5SfSfJ4k7kKjO/gUEURJ+G02ZGtTl0k4F3HVc9rV?=
 =?us-ascii?Q?W87V8K1/rxLou4+Wq0oXkb7rvgIvCgsTQs287V5+Y8v9lqOkr3NOJlFQyRMh?=
 =?us-ascii?Q?IyPAu+W5ya6EPZB4sO7dh1d6jN7jZxUoZulUq+OjumULOmtKj4d+eZYOSjD7?=
 =?us-ascii?Q?urbpBIbGoY3ww6qO6RejApZZtvAhm+e6yn+2FaXREtX0bmoja7pfELKJqRkp?=
 =?us-ascii?Q?h2YX0av3I6ZFth5htBCQpSuvdvC1z4vVQKOYOt6Y8ON39Ye33GVo6VuKCwVY?=
 =?us-ascii?Q?OPn6FVZt4dt6P20OZFVl962+PaqaCg3K7O9x9E7f9gQfhoPsHgIy8o32V6lM?=
 =?us-ascii?Q?7GtnSuHV/1ghV9tACNc168lkmBtQmqLt1C7epMH0wDPsFZtLGIRbo3qFwh2O?=
 =?us-ascii?Q?7XkwPcDJFHS58nYd4zsDuvf0W/2uuidASjWUEtRPaRZPuaQ3gBZ+UK8L8xZv?=
 =?us-ascii?Q?gCJEeGjqVzJZAkwQTTXqMqk2Bv2P+SuqCb4YinZhJ4fyDFiJhYLo5Fr3suqn?=
 =?us-ascii?Q?fl6zJ0Dc7npOUlhe6uHZfv+2dDPdMeQg8CGpXzF5QwTWh4dNqulYC1T8pY+3?=
 =?us-ascii?Q?k//1H6eZ3jtUJJecv4b+udNlt7ZlKC9M1MsjucVplLRZmjkdu783qkUouNg+?=
 =?us-ascii?Q?TzzOkabqYEVT2HtNtyL3vBA2Y3xyIKli1VEuG6VScjHIMDbLiLV+1M+/5WZB?=
 =?us-ascii?Q?alj25nkDw2lVHsaDIfqtpdMVWTrP8EJHQq0uvzrORFwjvjarMOpHs+35YU/7?=
 =?us-ascii?Q?liYJeyT2WsP3k73Fo1QLmSzFXBjJdQtTgOgEYdpT9TMqG9T+MI7uUASO4Hg+?=
 =?us-ascii?Q?ls3w4Nqd68X8Vo8Si+L+VA5G0NynQv58vMnyLN26/nsCfw7kz9iWSd+LLrF/?=
 =?us-ascii?Q?ve80rkugNEuV0CSHDVzfG4T4Dje82B6a0JJTOsGZOdEuDbd7nt76v6DaX42B?=
 =?us-ascii?Q?pEyCXmUNFwTZ3qW2l9XJX+eYFjUnOmBcszN44mOzWQAnoVe7zdUPeA9Pswot?=
 =?us-ascii?Q?PTZlovaqjxA8mS/sC7yajvImMmtePE+7q3TdDcX4mMjDGw0ekyyDR91PwDaM?=
 =?us-ascii?Q?V/mzD7aEU338LqdEOR9DRJr8Wfkah4BMflp8FxhsOkrd92r1mFc4+tcaU8Xz?=
 =?us-ascii?Q?MhqdtROKsYqtQ12vztK3nMF2M+RRAJeeslssHiE1OPDVlfE7O7Ckwu8kEpFr?=
 =?us-ascii?Q?WXOp72A0LQiSdkY9NPN29Fcc+pmxuJJWbDKwrRr7rFQy2jT/Vs3MRMjDudY7?=
 =?us-ascii?Q?BpxvmENe/d6XxRZiVJNrpFZXXftnWhLqk14DBBps2XZnm2XOTY98Nop/swX5?=
 =?us-ascii?Q?apcwKmmS3OVFSjzkFDt7CBPxXa5jnofO+j7jtmHFAA7UEGdNloXxsZYH8ZOA?=
 =?us-ascii?Q?awlq12GAdGdG/mN+jgtqcpfW2qdRgi7q2zhPnIEYEKZ7hqe0nTx2JvhzOjT6?=
 =?us-ascii?Q?FZPBVyRj7wBJvkAHMo8519MoECJ6tUEVRYvKnyQrSlz5HKY6hBvcySJ07NlL?=
 =?us-ascii?Q?WeuC2kfyHH3hhKuT0ABVBwlQ76g5E7753ccLY8YB6fRgmzZRBz0s?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d017a01f-9c4d-4e77-c423-08ded32afe9c
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11276.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 02:31:15.0113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGkWHZnJZnjN2S10yvsqgURj8ahQ4VQ7e5NlcwnbdurJCTbYfFXRoNWEvqM/vQMN+jjfqeE0a3SfPq295VxpyN3xdAEpxculyemamjQTuW3R0sX6CBFkqEHs+JhwxHaJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_193118_184458_A34EED79 
X-CRM114-Status: UNSURE (   8.19  )
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

The i.MX8QM-MEK has the PCIe M.2 Mechanical Key E connector to connect
wireless connectivity cards over PCIe and UART interfaces. Hence,
describe the connector node and link it with the PCIe a Root Port and
LPUART1 nodes through graph port/endpoint.

The M.2 Key E connector is powered by a 3.3V fixed regulator
(reg_3v3) on board.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 58 +++++++++++++++-----
 1 file changed, 43 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 5e725ad8aef9..4c02592cfe14 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -32,6 +32,39 @@ memory@80000000 {
 		reg = <0x00000000 0x80000000 0 0x40000000>;
 	};
 
+	m2-connector {
+		compatible = "pcie-m2-e-connector";
+		pinctrl-0 = <&pinctrl_pciea_reg>;
+		pinctrl-names = "default";
+		vpcie3v3-supply = <&reg_3v3>;
+		w-disable1-gpios = <&lsio_gpio1 13 GPIO_ACTIVE_LOW>;
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
+					remote-endpoint = <&pciea_port0_ep>;
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
 	xtal24m: clock-xtal24m {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -320,17 +353,6 @@ reg_can2_stby: regulator-can2-stby {
 		vin-supply = <&reg_can2_en>;
 	};
 
-	reg_pciea: regulator-pcie {
-		compatible = "regulator-fixed";
-		pinctrl-0 = <&pinctrl_pciea_reg>;
-		pinctrl-names = "default";
-		regulator-max-microvolt = <3300000>;
-		regulator-min-microvolt = <3300000>;
-		regulator-name = "mpcie_3v3";
-		gpio = <&lsio_gpio1 13 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
 	reg_usb_otg1_vbus: regulator-usbotg1-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "usb_otg1_vbus";
@@ -718,8 +740,10 @@ &lpuart1 {
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
 
@@ -818,8 +842,12 @@ &pciea {
 
 &pciea_port0 {
 	reset-gpios = <&lsio_gpio4 29 GPIO_ACTIVE_LOW>;
-	vpcie-supply = <&reg_pciea>;
-	vpcie3v3aux-supply = <&reg_pciea>;
+
+	port {
+		pciea_port0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
 };
 
 &pcieb {
-- 
2.50.1


