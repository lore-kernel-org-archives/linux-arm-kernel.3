Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD26F9936A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 02:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3WwsmxDqHp3X70CxbWq7rq/H2AVd/J7nCgKyzFOVg/0=; b=J1RSjp/4lZTsY2QgmqMdjp7w44
	1FFsjVrfKQ9kS/U79CXhU5K5M7liiwwUDCgEikRati1R9Oqv13VUNuRJNL2N/qthqqXnRQRyoC75f
	pddFzOjkFymA0XPHkXYFUYPj+1O8SJoyKRY5gf/wbgcdTwxvUAxgnZP5K8WUC/opizmQTXztymh1t
	HZ4QeEgFqrzUiQ33QnUSCNfBHS3ZBagu8FTRX7Zj8kFNuckLEWfYsh1mKUThtJPZCm2OnUxjDDNZr
	+IlxlXuxhyiMWaiH/tbQPUCEMDwvGUHNq4XteEGMVSASCEnAVZ9NwmZpUbg1GQfKv6SxPVdbyJMGR
	H1bWuJZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG6iQ-0000000CXyA-2iAb;
	Fri, 24 Apr 2026 02:56:26 +0000
Received: from mail-swedencentralazon11013007.outbound.protection.outlook.com ([52.101.83.7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG6iM-0000000CXuD-4Afq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 02:56:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XX8l/PeQveXbiDHX5DeR5asQUVpDeKuJGw6vwPrCSGj3fg1qQDq9ZbkIZe/Ihl4cnxru7tQVXXhPfNZTntBsPi9DsM04bM/bUjxJYWlTGgL84nVJlUzQuqkKnVY3TZhb6+LaiAv0Sc/YsJ7WtRgMGa3513oTYvSddyxD9/yZ75WnhTSXJeq17x6v1ZjSSA05TABqdpn8tFdfVD/Oxh/4G6UegHEPGC9pKlI4U6q4TqCBw+faS6OFNrwIG+1ROAnLdduFu4uY/m1qb40ZpVI9bRj/0pJXmLDWgoAr9Tr2ed6Mb1i2KVfYv6QDy4cyEuwCkM8RUK5O64nvzISvAfxZog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3WwsmxDqHp3X70CxbWq7rq/H2AVd/J7nCgKyzFOVg/0=;
 b=rXz7Kp4H53mwxCA04R2BzF5Jj2aJsiGCLJteovpu3dzcczoYnai97i82J3COkJxseFou7jjN1uZS3zC6LaGj+xsPZ/FON6nmgoiaTigvoQlSE6EChsidR0PtFswruRmzBBV8UhOWLBK9QYUekv198CTcOPMciy4QMpqrPmJu0DgCKRZpuKRp69SDGVHd0XwUAtHeilWRGma0jUI2hRvS+ka8Fj2DwUWBP3TAId1nZDGSfazcgCUNHp4BdDa8injQOplWMFipLIEmrLbTiXI8FOaRpW++ntCGrR/pw2cbyrjWtMvRtpjkh4NWTGhYKJcW9ac30MYheurs4UZEInRFGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3WwsmxDqHp3X70CxbWq7rq/H2AVd/J7nCgKyzFOVg/0=;
 b=Fca9RhXc7QApUm62UmnPM7wUWR9f8jw5srt3sQcehdrM0EK2cZr2tVwxtMxHdhvDtgBrrtfvwmppaOdavWVdFrbbmf36azIxmvbZiWjgVA2Z/xaVwTyd8WywyUMsOGuNkcBPahmc/O+lTz9th/v2UCZdP7/SLeegyixQN6PwrH3fgCKw+HT0r0sxizmPdLoP+prKwekWAFoQUdjC2wcoljkGIcewz2gUknPAh8BeL4JGBabo9wz4E/jNtu54WnM3QiGjJIW2GRJVlCOd2h1tIMsuzRU5l9pkkF33eqrwWbyRl8ZMqNJZVX8zfl9uTm+BvPVirdOhHF9BVXb4xXe/kQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5222.eurprd04.prod.outlook.com (2603:10a6:20b:11::12)
 by DU2PR04MB8791.eurprd04.prod.outlook.com (2603:10a6:10:2e2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 02:56:17 +0000
Received: from AM6PR04MB5222.eurprd04.prod.outlook.com
 ([fe80::374c:87:282a:63a3]) by AM6PR04MB5222.eurprd04.prod.outlook.com
 ([fe80::374c:87:282a:63a3%4]) with mapi id 15.20.9846.016; Fri, 24 Apr 2026
 02:56:17 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bhelgaas@google.com,
	frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v1 2/3] arm64: dts: imx95: Add dma, intr, aer and pme interrupters for pcie{0,1}
Date: Fri, 24 Apr 2026 10:57:34 +0800
Message-Id: <20260424025735.1490772-3-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260424025735.1490772-1-hongxing.zhu@nxp.com>
References: <20260424025735.1490772-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0223.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::9) To AM6PR04MB5222.eurprd04.prod.outlook.com
 (2603:10a6:20b:11::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5222:EE_|DU2PR04MB8791:EE_
X-MS-Office365-Filtering-Correlation-Id: aab1b85d-eccf-4922-7028-08dea1ad0e3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|56012099003|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: IyK4ibyof4A1O++PbjyzOWTywNyBLfiwgzVurPNdT13Vvg6ZcBeruSRn5T6tfjH0rt9h7dRGkfPzaNaZK3Tj7l97KDAz+ySVhsUgFw/JbQQGidHgeqAqfP8Wzuy2hboWZLlJy+ukMAtpvf2OhVHXljxYYNWvsRp7qI4eiwuWBJyaDlWismpY5pl889elgUo5oku7+WnJhbBqukEBmnF9OohmOisx25hAWCjWYEU1h2LZ98cKUp78I06uSjIUY5Vn+dS8KB9/STauBHVFyCK/U09ha1R1DCyY3qhGQOv9/oI30+kQ9EWzqANbLQt3lO3OxLvCUevSqxWZhDyttquIIvlYk53+zhMIUgwGkF3Wcl9N9qocymaHSaIhqlI52iNLyr60DvEMJtH20IKSyVSzDgCVAZT4nDmGz82joJVUPhGTlFNi8yBAqxE56Bf/5/6BRFni14uE4pZ7kmC+yYCC3ZuQ9iwsileQeJF+BkOyHPKyLi+5w29tTKZBB203X80zIq7MtbjJtnMMhJscRsLw8ZkyubXfepFdbAA3uxDDzgzIOWkNQTAa580mnJon710FDW0i58iSyRHDe7TE6b/CHol9OpYmjXKIFvNqYcW20jCNwXZRdyvI0J1faiHtfAOawmH5QIgFCR8A+lwOy0sKkbHVxR806JxcOksIjJPY+gJ1N1CixYT/gr53OPz11DZeum1bBLJxeTq1UqL/RN3N4pv8Rt4S6RHBOip/ezeGmF6+FBJSDvgEjXOicZ85AtObVN78U7iQtZImjJ1i3lXbOMiN46fuFr0YYqTuY29nSGNr0FwoLpjycMiy5R1tPn6T
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5222.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(56012099003)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/pmbCZY8wgp3GiYPfw2psjMDrGeFOlUoLxAbw9kMHgM+jbwVHmaoODPO1ATH?=
 =?us-ascii?Q?KcTNzQnf4nvVcJ2jOaMNCeAylfgXvJCUTg9ePg+76UBAvyRvCOTgMy8R2hen?=
 =?us-ascii?Q?26hCGQzD7Atzg5D2slN3jaMWgYIwGp/Qo16hcJhs4S0GJB3QVDGB86e//0Qp?=
 =?us-ascii?Q?i/ATP/uLprH51RZ5fgMzyFXr2woX1wely6T2/NA5YMVC+HVDkdRIoKVApFth?=
 =?us-ascii?Q?BieoBwRecZxOteO1Ttu7dNoQaJpUIM5I8rPQNUjMQnbEmJFgJY9yXvfLDVU8?=
 =?us-ascii?Q?o03t3BKVkAZyURukpTsyRk4ZViD+91Bo1oY9HzsAG2IuNfBI4ucUXrntMB2Q?=
 =?us-ascii?Q?LCKjstXGd+KS0F+u59dI2pbmtOCP9PTqCjfacqovfXj8IoESV+ftlQQ3qt/R?=
 =?us-ascii?Q?tOHsPLDf5ULll+FGmT5D4Oc6H+0gwCTbCnpjTjADdnTcAcPZYuPY1X3B+F0d?=
 =?us-ascii?Q?5ZenGtehrO2aM8FmW4uV4yW2ssnz+DO6mCod2CK5+jyck+72O5cNfkmxCgZo?=
 =?us-ascii?Q?kg8GnPsfsmrIMtpsXJjyMDnbJUfo66Sfev1Xzv+J0yDNTxij8pFsdRw7yPxT?=
 =?us-ascii?Q?6KqekDozmJXdf+M4l7tUmHt/LpdFjFqMMUvL8ST5z6aO8bpSoIb7bINcJc2n?=
 =?us-ascii?Q?xvUrRnYbEx8qpY1B3TspjNlAP7VkM6v7qjyOLGw/eca5gOfOi0elbbnbL63+?=
 =?us-ascii?Q?js1hQdie1pb6rb8T4/a2aXHxlwoS4s5S70aUCIV7TBPGdS9LNPekWJ2QPYyB?=
 =?us-ascii?Q?gvv/jVt4flauEXvhVwpXm6UrSlA5MWd7IyNPfNkGTMPJKR10icCvxx0pSdzT?=
 =?us-ascii?Q?Ik2sKiiqpjHQnwT/5XNlD0DHspmF/fkEXd2LNY3ukMBVJgFcnsjuIVIr0Aij?=
 =?us-ascii?Q?9wOhTV8KZUMNiXUHKfDgTt8b2jZn4k5OzuBASt/7KDJ0NI1dIQK+Bii9ScBs?=
 =?us-ascii?Q?TKn/83rmf1fUVSLsg1zouZsa5ed1QD1GEdVYoog6eYgyNk87tFSAdkq+YFmD?=
 =?us-ascii?Q?a0bMGCe2qpVRDkkzMIIIXhjAQd2XluS3ksNzx3twafoX+MluSSPABS2wYZcW?=
 =?us-ascii?Q?mU8PejxIde5qM/DjL4pJEO+KcVeKXGjORfVHkh/65JDoOQEzzcS/4ny8ulZL?=
 =?us-ascii?Q?Sn5XEH8wLldoIW3jtyBUCmexs5z6Dgk0rNqkbtNcvOVJAdGHL9YKmv68Lym4?=
 =?us-ascii?Q?QrHVUnudQcRZOnbyDJ0nIBwFUwgvxJTgaCMl6dFNzk+EbZXcu5m+IVBvWbHK?=
 =?us-ascii?Q?qrc3r9ECJMNbssw111umRXdgDkd6rMSaKkX8So355VnqEHybKXDMsoFysZTo?=
 =?us-ascii?Q?4yNjdGRXyclwkwrzQqwpN/vQibZWqFo3qeTXHGPFKXcThRxEHf4oZxBqaLiE?=
 =?us-ascii?Q?nzMjkqTP8qcpxNiplEqxJRkPinKt6tSK/QDTqIh/ygJX85ner+R6QnE5OK0q?=
 =?us-ascii?Q?Z5i46Yd0p7NVgbT+g31iz/6Fz3dozjjWOsZDXAkk0roERsSZWL3wQsaZShjF?=
 =?us-ascii?Q?SDDNYHpfGgzRNIxlFfEEbleE+FqDBJt2f5KGwZB67igT9itMsdqqGtJTPGys?=
 =?us-ascii?Q?GwjZzrDDd/RtAUtMznW78UcdNcG9ElsSM95JCdCBkhDJFEZP1Jse3G1U1qH+?=
 =?us-ascii?Q?LqPQ2mRCZWHlfLU322Cw1YLRkMXiCD2U1+Oxym0FPOwiZmH5CRD45avFoGVs?=
 =?us-ascii?Q?+t4a0x0Vb6oHXcUMpmcY6IMyKtZIs5Pkido1JzxLH6NQC/hmEB9gHutMSOWF?=
 =?us-ascii?Q?d1zl/RxNjg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aab1b85d-eccf-4922-7028-08dea1ad0e3e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 02:56:17.6334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lg82mfoJVm8yqJilIUXTce/1cIbLL4jtGO+wC7p8acAZHfqvrjMOSUn47YTDZFPQRHMiNxWg9A+b3K/iUoc/9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8791
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_195623_038828_F384181D 
X-CRM114-Status: UNSURE (   9.26  )
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

Add dma, intr, aer and pme interrupters for pcie{0,1}.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 71394871d8dd0..6896d9c15bf53 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1861,8 +1861,12 @@ pcie0: pcie@4c300000 {
 			bus-range = <0x00 0xff>;
 			num-lanes = <1>;
 			num-viewport = <8>;
-			interrupts = <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "msi";
+			interrupts = <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi", "dma", "intr", "aer", "pme";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
 			interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
@@ -1936,8 +1940,12 @@ pcie1: pcie@4c380000 {
 			bus-range = <0x00 0xff>;
 			num-lanes = <1>;
 			num-viewport = <8>;
-			interrupts = <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "msi";
+			interrupts = <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi", "dma", "intr", "aer", "pme";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
 			interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.37.1


