Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD29CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 19:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CIoGWUo2HZFP5pGfOBEdCiN85HWg8SWBdHlc3ctiZM8=; b=dGZwVBAGO2qSRKEyl+2JRBKh8e
	MzVEEKf+GPfu759yotze9Bp5uRsiqLxzPMMuxHgle9ppVfidDUuW8ystKPTp5kKAeisgwNg1YwaUD
	6jq+hZX/EDetYE4PgtgF7W39hrBli49L88LwldDbjQtP6/bCDaWwJ7lsrvtDrXpx3iy6QPgqLyK+Z
	HeB4qerg3kGXOPLCh5s3FVz/9ilPVV6O02CNTO5YG5QIpsQNl1oqexk1EB9g+IxPgW7tVwVdo+8xW
	VgKowQeixu+40xz2BHIQILwGC65gVK6O1ZI2OF1818TYKUavtTOkXxrF3pREkZkmtQmWJbXJkrisB
	sBENZANA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMtND-00000009pSp-1ojk;
	Sat, 22 Nov 2025 19:34:19 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMtN5-00000009pG0-2ce0;
	Sat, 22 Nov 2025 19:34:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xVwfBD+kdT9WjBKM0QnRLG1Ul9InYQG+hD1O6oSA4vGJuRq1FqnjQlkAl2MQi0pDrgt9vsCTDS53qyVD1vwkMG9CFUgx5oHrXHpPrugjVqOe2ZH1/sb5zvL0/XFp9fPg9qu+nxgmcm//44bN/lNZ+oSNFHOpi50t9ST3miUvEqff4SAnWvPzQmXQQDlK9F40EzEprmIWEvdNjPVojfQPkUjdgIKHFI8SBDhl6fgnitkpyx/vxI2cbgaxxb+JMFzkwnTU/GlfNsg7VrHT3/E1xdWF9kxkpnPxAuynUj6lFHhSaPusGsLJFw61ZNXb3LSNEvu0jCdf+cXJur4FIUmpwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIoGWUo2HZFP5pGfOBEdCiN85HWg8SWBdHlc3ctiZM8=;
 b=v1qKO1G1iBASxlYGaYD+99868ftpYwNJIpwH79FN4dDduW5Tkxpa5HoVVH/GV1dVXa3KaEACJNzowihLHWtE5aEyMiInYBi5fwLa2S0GhDdbomlxYwz4agaOd/MigCjjghWPR/4qK4tLHTR1auqWnZmdZPKrcMwihlRFlSbIUJrKDvBWLxoqxRq48f6afXWFhAV0s2fSa1sfxwkqbeYz+5SpYJvQdI9a/WUP51iUNvPrjaCbH3zYiJPE6OIZUyMZVqdYFy2vc8VucfDzDSLr3gx+GI9FaE2mq36InBWeianmFLeeR81lUZyU9ehpoiy7o9oTXaKxE1XsvYx1RdBoIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIoGWUo2HZFP5pGfOBEdCiN85HWg8SWBdHlc3ctiZM8=;
 b=f9B50gF0lG3TSj3vVDlusCy7m881vZJi6ZvqPBqWzBMNjerllvOb471VeGHAECKAFge/gwZLKRh/Pb2AuPkGEPKWYjOb1dWT3MJ3MPWqfLSYxik2tdRmqVjxalZX/MK5VX3WN8Qipd2dGkh0F3IlVjeB3H44jmiNY/QVDQr6OVzOO/GyTVDoYHb3KMsK4lFPrC9LIQwSXsdICLAg6jj0jZZ54LUm9ZGvuTVbfJsYHJddVSmDt9Ed+l1sgrnJ2hDe9Yb+vvBdu57cZQ/FhTQ65EaXRXreCUltgozxjRxMT2kmox69fwWb/LqlpBcEEmEhTn9e9YPD2mFcGlFwPlmmyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AS8PR04MB9510.eurprd04.prod.outlook.com (2603:10a6:20b:44a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Sat, 22 Nov
 2025 19:34:03 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::8063:666f:9a2e:1dab]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::8063:666f:9a2e:1dab%5]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 19:34:03 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Golle <daniel@makrotopia.org>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eric Woudstra <ericwouds@gmail.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [PATCH net-next 4/9] dt-bindings: net: xpcs: allow properties from phy-common-props.yaml
Date: Sat, 22 Nov 2025 21:33:36 +0200
Message-Id: <20251122193341.332324-5-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251122193341.332324-1-vladimir.oltean@nxp.com>
References: <20251122193341.332324-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0010.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::20) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|AS8PR04MB9510:EE_
X-MS-Office365-Filtering-Correlation-Id: fa5a6489-ce71-451a-e8bd-08de29fe17d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|10070799003|1800799024|19092799006;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iYRXGp3AgvX3/tOVc8bh1LLGDfup8hPVAToHd+vTV0tcw1o6AQQ6BkkNFb5F?=
 =?us-ascii?Q?JFESFJoyucrbeplCO04WAtit38uzWuXB+Ns2Ffb5UlAaWFtaMknhBd5rADES?=
 =?us-ascii?Q?G2ueeB499o3OIwXDSysGM4jbnJX+cizWlh8QvbiQRlRApd0y2zsGke7JnixS?=
 =?us-ascii?Q?L1H6At0Qyd6XFVllyPojTeFj8iXsJ5Gqopa3mGyM9SzBLZnwUtA2TfG+iLV9?=
 =?us-ascii?Q?6ljnWaiGP3NoDv4Q36zFJaXZMe1YUzEiBNpsGXTOF/bLd6I/FP7DGLUnNxbT?=
 =?us-ascii?Q?qb9vGN+QcpL7AW+oflm5qQtKzTZ+dmPXv/tYc3KHrF8i0AASmlWkpdy9lBBp?=
 =?us-ascii?Q?Kojul2u9PPio1Ed3O5sH4NlKzZ+pE57HzdSOjtz3GpChfLFdBwpT1HMSEfWt?=
 =?us-ascii?Q?ObjxwNJ0rNJqRYWbVKnVN5cr9LjRA1g+z/AtSLtim8Sb0CCSq61ilXQUcmUm?=
 =?us-ascii?Q?cKFHdUQTo6dEvBzpeUNh25MmmySW23lvm6ds2gNQAEZ6i41LwHocQZPo7o7C?=
 =?us-ascii?Q?Gy/MgWii1956P9+byot8GDz4LGuB5ffcaSEecy8ysKamRxPEm4LeD6nWIBgs?=
 =?us-ascii?Q?CvTiHuYOUwJp05VU9FJlsQBi5aHrGcEzo8FAwCfbj1Pfds3E2oc8cow4GCsX?=
 =?us-ascii?Q?86314axswCb/5F7HJPl8/njqFoM3ejEm6iTEXniZG7oNPKwN5oLDZ64TMnT4?=
 =?us-ascii?Q?D6rh9CWNZxZoxJdA3u33nuYksoxenc16RpDBXLeptDQr3+N/WuKrWhtaplrG?=
 =?us-ascii?Q?Eb+/d1MXD7KlCtBghR0joxkosxtZUxUqEuafNui09v3wFZQV2Gk2R+hbgMEn?=
 =?us-ascii?Q?1GeGRKEnZ1CIwwAH/R6rYeDlkFowLLbtbCXH+RJIlEz2aUbcKUEXCXnMm/+O?=
 =?us-ascii?Q?9mS26KjuvUXTDYaDB8tscPb8yvxkU92ANZJCQPOTSyU/CqUNtFawBGjMjgWm?=
 =?us-ascii?Q?0W0yz05Qjz50ofsRdah9v34Oz+ptMxYymb+6xrMFlptq2X+fZDh4bUuY0tiE?=
 =?us-ascii?Q?tb//GGAC/2PLD1uCPNhQnKTkamhk3wr2nMTPIiuGHGn+JKtODieLPzRc/4VO?=
 =?us-ascii?Q?A0tHV6R/jw4Newp/4SJPmYNYwvneJ5NGdvGKJN/izfb0Os1iSDSNV/zDNuM6?=
 =?us-ascii?Q?WY3oLYkzxfVwVnZpPArl6j8mFzE9kl+yLY37s1Pxld9DKg6HohHawjGVJN5h?=
 =?us-ascii?Q?o2MhKImWv4IHznFl/ChBSLC36LUcWN3yUmRFspk4ERSdpbqkf/QgQpFlNSuq?=
 =?us-ascii?Q?OafzQ9qfD6cOxxActGx+RAvEKdyYQYZq9+VaKfNT3kggrl3sVB9UpnXVcm4o?=
 =?us-ascii?Q?erdTbM73Dpbu18JAdh9STRRH7duMj+8E27wwO+euNbjQeVgMLt9dt7Z4hxSY?=
 =?us-ascii?Q?v64oFw19digAIkbkENe4L1a/y4YMUUcNMPJSqVNFFn/2vEihwGeEN3koxkw3?=
 =?us-ascii?Q?o8f3d8Xo9C+/1jkCfRcNW6+jNFHrCviT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(10070799003)(1800799024)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yceIMjfXziXY274hQpOzQQd4hqQCA1h1vHL60FZi8232rWlDytaKhvLKRhv/?=
 =?us-ascii?Q?WbonYRNxgjX9KGaJrnWd0qguehiAnDgSXcXxZodO0Jm0C2TFdPFCWR9ztxuN?=
 =?us-ascii?Q?hAeGXqclkFbxXTetzKEvHSixlBzH27ruHgQk3zvYIOfta4ulBelCvUgviu97?=
 =?us-ascii?Q?epnxCFj78e/Ng6jluKEpi17ffLoXYDgXXmEyGbrQgOg3v0HTAi88sPVB+4LX?=
 =?us-ascii?Q?iVT0vGYOIWDe/iNYrT6P+PUBNI6wVW7oECzf2q/CLOCnjtIowuQqXif+zfiy?=
 =?us-ascii?Q?Rbeqd4cJi7z9KZncNNRCCtNG3fbsAtZ6QvuSWl1pHWV9xeZgw5cDyg339xnY?=
 =?us-ascii?Q?ahqQnITfbB3FfmrTfzksIyYFOufRagqOV3t7qi9sAd3mmNr4IHryPiK70WdI?=
 =?us-ascii?Q?PQFD1b5bXvaa438UEVoUmtuLEjDyuNQ1i7T7aW4/TAKQsSBvjMjHnouZxg8q?=
 =?us-ascii?Q?KjcbUiY8wMcafOpuQIBZduw3CG7HEHbpL61d9G3IeSI4a0MIGHee+8djrvin?=
 =?us-ascii?Q?6hvBkNDaOmqiRmIsKa0Dztut+n18AZd2CbEV1J5dryNMf3KVF+qSZVT+qlkk?=
 =?us-ascii?Q?ggywYv5WbNy1yMJRB6PXFoXI/XX0PYjaWCQTFEEPfgNBoP8834O23QadAmja?=
 =?us-ascii?Q?36sAXY2URVgbsdvdnOEg67s2M4lQT+3W75X3sm4xBrIaPjc5iW+2nW0fqL12?=
 =?us-ascii?Q?1JMQd1hKINv2Oa1WW3WozzG1qPcBgo/a+OhAzKP6c1rnfzeMTcM4BSumFTkd?=
 =?us-ascii?Q?sWElnxjvplnQHzDbFJtL5giXr9rFlwvVAKS7YYqu8khkCDhOyr4lgtnJ71Jb?=
 =?us-ascii?Q?7CZuAScfdu0Nquu+djgIjMAgBhtKi3EcsjtmnWs5n7AZ3e/uSOyVcLG1O4p/?=
 =?us-ascii?Q?vjFlvfzBl8IopS2YQlKlDAXkZblgWULg6T5ekYctM9ZQBV0Ygj9JxtFnCR8k?=
 =?us-ascii?Q?OxnXTqM3yjW/lgLx45u0OSKTo/PueCUUUKDf4+PDiL3Le4V9ZOjQX/KK4ewW?=
 =?us-ascii?Q?gLwjZLtFOT0frhhaT5IvxPPWx/3PxRzddSfOnVxKFM2A+lCygjSZCap0Jdc/?=
 =?us-ascii?Q?kUTmAyl5pq5uqr7oZR+ciiczeNrGfzrRABVh7fV4mAOl0JjqlXOMi/mVohjn?=
 =?us-ascii?Q?YmHaf6/nVfpQiP6M1EgZLgC5lsimcW4b97n67DETu4s5klOk6p78cL1NVVS0?=
 =?us-ascii?Q?6R213Gr+0vttbZYZi8l/9BXjtp1RO6mVuU3n6nh4Jh4v3aSrf7xO9hdZ3c5x?=
 =?us-ascii?Q?kcw0XJKDCEgdDlignZFw0pQ+N4v6xk1dC31HN11aKyBgeAK2KyoeAR6fl96+?=
 =?us-ascii?Q?VP/ghKzifOQc90F1W6ln4d217yxi28TUR5gRPzf/AbCkhWv1t4ddaWm16Qq9?=
 =?us-ascii?Q?43KC1OS+F4PthbvCFfMQrrg4xLEQkmxRNaSreEwdDJF7i4W3aR5ihKiZS9m/?=
 =?us-ascii?Q?m2Rsz7H9YciRyJhXVlRvHlPz+Ubj+fGrPeiIAptXd5NGzioui3tdJe7H2i48?=
 =?us-ascii?Q?+6Vk5coszQ5Y8QbPvr30MTJ1C/iDamPIpUQNFTw6dKhch0As+hCFCzBQCe4I?=
 =?us-ascii?Q?q5lIBFOie2zrD4ZBF61k3Kn6LrUoASg73YksHXB+N92pOzybortWLWqnmQ1G?=
 =?us-ascii?Q?h0SCej17CLlBW0nBZ+oMggo=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa5a6489-ce71-451a-e8bd-08de29fe17d8
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 19:34:03.2932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sMws1IO/X4t18VAUC6Obqcr9i4F0gGwe2G3ViGInaL+FtcHOzlFZxulS+db5TG7HmsGhvQLXGA1beM39EM5cPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9510
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_113411_667990_BB1F317D 
X-CRM114-Status: GOOD (  12.00  )
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

Now XPCS device tree nodes can specify properties to configure transmit
amplitude, receiver polarity inversion, and transmitter polarity
inversion for different PHY protocols.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml b/Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml
index e77eec9ac9ee..9977a3153f41 100644
--- a/Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml
+++ b/Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml
@@ -22,6 +22,9 @@ description:
   by means of the APB3/MCI interfaces. In the later case the XPCS can be mapped
   right to the system IO memory space.
 
+allOf:
+  - $ref: /schemas/phy/phy-common-props.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -102,7 +105,7 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1


