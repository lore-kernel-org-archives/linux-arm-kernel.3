Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9892AC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 11:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aqTwqE3t0qi5TDpxCVzZKB8BW4nNGWqhMzjx90svyb8=; b=iFzg6eG9hI4eLqIRsdvcxCVqFY
	QUiyDNHtyNcdgxQF/m1sN1SxCC4nI5CoYvYcrfLZtRsFZQ1gkv+mXLYBeVbVwvJUimNv3jQrN39+o
	AOTUenRQARFcfPS0aNePmNYD91QQzq9ZnjEDTP/9TqUbSkKBGdUtmx5cwccbc8tWGr81HSy3ZLFO5
	gvnbmehF8EkSQhBeCRWSZk7SjFEpf5eox8XcajEPKx+HENDAB5X3Jmb+1+dBz3OD4fqnzfsCHM3u5
	pKzog4pHUQ+xoHh8tDVR5HhBW/yIeBwtEvQiDXkNzb9S4MPZ21Elf8OJrcAyt2++61KxXBkawf5AO
	FAGpMi0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6p3b-00000004AY1-0MlN;
	Mon, 21 Apr 2025 11:11:23 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6owV-000000049eh-2w2I;
	Mon, 21 Apr 2025 11:04:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JiE+fuw2MkinfwXytdTqThMHa6evoP/MXmGSUeIIHa4Z9HfCCve7gqttNyWtDVLWk7thsCmeEtNKgoPT+5o0y13UIJekQCRaoyQZq7Fked80tuXTKQQomDvYkx+9yH3iVlrjUKzPkwl5gIVLNTIaLDWcyYw13zZitqMzLrsueC/TtoYSxMl/zatVfqYGl5yj7pZX1efYSAERb/vuayRYUo/jJrIFIgwJvyJhXWAqsqWKGTitIk/Ofak9E75ah0n8M1Su1o4RrNgOzowqHPz6w6td0SaC60trLjtb6KSPqR90/ojxH8wFsy2ei+yE+tpo0WOST8V+9J51lAIaiMK8/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqTwqE3t0qi5TDpxCVzZKB8BW4nNGWqhMzjx90svyb8=;
 b=CvH5FusS5p7o13/jlma6crLiWfKtpcVT2jG69oSEoFBJcj7zheqH+1G3ZfXvhIMoJh3+6HC+IC7nxksV5IIEnycR0aPrTcu++ktlfpAI+ktJ/xSWXT/+lHK47Cjt/iBxUCPBuXqn/Ez9jYY7bJOLLMXFFLYbhKM+VVdgiNCbiHrRu9CPi0BZhpjcEfvUsSGT5KhFQkTb5Muj4nTBHQGx22ldCMNNBdwGbsJ5E1eu6kg88UI6qTSmZz7gZK08pXSVGLpzByTadDl+zgW7EPZAXQY7h4LlBwhPljsOb9sBpCfJU2KLrmVU+pyJiJsUp+oI4e7rFtlrFbaagQoHZ07/Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqTwqE3t0qi5TDpxCVzZKB8BW4nNGWqhMzjx90svyb8=;
 b=k3/LDbsxRzMyeBeFtz23f7JDLY7ISlHW3IHdim3RwrwtOvIeYaj4QVehoGlW7f2Z/y23Yxes+oc4L8iRzY2DiVl5VMCqXtwzlMxvpEa8XmAkNS1zCPDe+VZ5vstITq/E8HtU0XTj5yBdwnIfGpQ+dLkh8V2/3EIRU9tmmDXZrIn6HniNrTMyR7SBX2wKgEP890ABJOFA4nwJEMWkPAIkKMoYy1HJo4J/a64jfUK3vMFWEzEM+KfI9cFfJsgBnkJzCibvfeAg0omm4QEXYH/CBVSRzUikh06hafd/A3onxeC814Z1VimFX43F9i8TbXsI83f48GZcJY2d9J0u2m8CJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by PA4PR04MB7854.eurprd04.prod.outlook.com
 (2603:10a6:102:c2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 11:04:01 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%7]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 11:04:01 +0000
From: carlos.song@nxp.com
To: miquel.raynal@bootlin.com,
	Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	conor.culhane@silvaco.com
Cc: linux-i3c@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH V2 3/3] arm64: dts: imx95: correct i3c node in imx95
Date: Mon, 21 Apr 2025 19:15:13 +0800
Message-Id: <20250421111513.2651797-4-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421111513.2651797-1-carlos.song@nxp.com>
References: <20250421111513.2651797-1-carlos.song@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0035.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::14) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|PA4PR04MB7854:EE_
X-MS-Office365-Filtering-Correlation-Id: 786b31ec-2b38-4a0a-c87c-08dd80c438da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hi4pBwWP3xuCo0j9Gz09Ac5BfTc6Ef1IQUGNDminxB5GOm3rzIX8VXruTDC+?=
 =?us-ascii?Q?FRrjs2CWmGZQ/9jtxsokDrk0rwzYJeRdqhZQ5n0OYr0KJSFdvqOn3PuVYG2n?=
 =?us-ascii?Q?SVJDkXqXZ/dSsDlrGoRpQsqgDyA25kp/ND4czf8vwzW9NJyT1/01JiNl7FDX?=
 =?us-ascii?Q?g4CS5Z8YNtnAW4AKQI17F9tBsZ2EmrFc2bIGXypujPRGTHhEM/PvauXhc5e4?=
 =?us-ascii?Q?u7xbmA2m1m1spJBga9iH1BydgEvZ7yVmYfe/jxtDNyhk+9+zgnfOgEtLmfWJ?=
 =?us-ascii?Q?sAxOvMsX95RGF6Hkhbov8oEtv4iFxIKRlplQ3AQGWL2fWw50XdYijnAlSGYH?=
 =?us-ascii?Q?rWovz8eHuGWZN8gTX8DQ5vyzA02H0hqugB7qTl62JbqQ7i+P/5SgSTOVGxKW?=
 =?us-ascii?Q?EGwlXrkC4QswQd9OEdzADvyWbNPOc1IJeWEPmkzlzdXU1Vo6PXOcmoEF6JuE?=
 =?us-ascii?Q?3QYboloeKcCZQk+TCm99RzmpF/P1h/GHOZRIYKaS7n/DK9X5vrce9RM4HD5V?=
 =?us-ascii?Q?H5YhKjSwqaGqyYRBs/YKyXcVfz5SmkLY2HnY5Yyk9Zm4hph1/qHpGQtQuVR3?=
 =?us-ascii?Q?149V6/Ywp4C4FQ6BynEiYcoKHD61jWRcPfeOyW2a7u8ZF/kPSDI90SELuLpD?=
 =?us-ascii?Q?mFcfxCw8mwsYFy0wmRdbmIIz3kYFpNLI4NdqxoJ/xhZvZ6muKKGtAKFo+wwi?=
 =?us-ascii?Q?/oa2/h04cSa8ZTLmi5I1g9BM8UacZxtrVapS5p81+gjBHRXt+QXt9M97OPzj?=
 =?us-ascii?Q?BJWt+Y2S337SXFxbAHhkRJ4Au+ek6ubZXwQyf9jfA5j+9mGxHbmVzUabjaQd?=
 =?us-ascii?Q?uYntfV5AQkQRzGQSZs1N+SLHtqTatUfI2f0s42pa3M7WOe4KvQ8QVi0dwSLq?=
 =?us-ascii?Q?9YchRMEQVmW8EVZxw9AKfpTzE7M583noQ7fM/6c/C/52T93WkcBVetoHTNN8?=
 =?us-ascii?Q?GGUjFycanKEStNwxe0/MsdlHx0SWZCp4q9pY7fHOAA3taVC0Y5cR6+Shkvp0?=
 =?us-ascii?Q?a91x4LMnGtU8G62gAKTNf1PbEUC9R2kHeQ1keaIScKa31zmM/EDspnbODMBz?=
 =?us-ascii?Q?12m6Lbo5YNTkIR0Ov8/anAp5GQ3W515dsWxhqTJwZifczcSk3M6m+e52kLJj?=
 =?us-ascii?Q?eqW6aMjnFr7rwaDLdTMkrl+XaC9+l5pbDxWoOCs95SyOSbtljYwtQYh9ug3j?=
 =?us-ascii?Q?AXnj/Wa5QJOutE18c9Q453TngtpJ95Q9D0vrOY9JzoJ/p08SHFaN+m510oDl?=
 =?us-ascii?Q?Q2BX4kF5Y/XQFn6YfFU2pcj5PY6AwCtoiiL3M7aAK1sKZeaY9+yviO1piZsF?=
 =?us-ascii?Q?hIsHYYUSxl0tgC0sjQFJJPlSsbVaC1wvDhMspgXuS5jQweTB+mKNsBK45KDh?=
 =?us-ascii?Q?K3j4FFH7R20jIvTI18+SJtUc7srCUGDVgpgqS8GVVLdkC7SI25ThgDzo7QTb?=
 =?us-ascii?Q?SnQnAQSiccjGPdDTZZo+FJ1W0R/Zk9MhXXYIFu95vm3lBblHytDT3S3oVo3N?=
 =?us-ascii?Q?tj8IKpTLe8tdOk8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dyJ741t9LJVAQAIwcwZKpl8sYzBw/6O2vFEc2kkK1LKVy8REgGDkBRnTV02L?=
 =?us-ascii?Q?ESYPZ9FSb96EwxsgeV7fSEer6uTqzrk2dxtJ8AoxMrIpZcH8Cspopv6cJgSf?=
 =?us-ascii?Q?WwMQ94MDcRU6SQMZKYuuemFAvf+M1OfzViDiFk2/cU1djXbFdamXTfzjWgVZ?=
 =?us-ascii?Q?bsiiO7kxgbioRp1NvDmOEOVRA9D8+2Mao2Xk/TOrtMbGUZ7Mhz932MHzki0N?=
 =?us-ascii?Q?CXr1KevZ+8FrvT1u9XsSywfTK5x9pxb10wovu4bf6a/b+UJY1JahRact+yNd?=
 =?us-ascii?Q?q7nLkkK9Xbbxb2XcTA/0xBbGO/qHL+vG0Rpq55Y8FdvVtddne6ud4fbo39+n?=
 =?us-ascii?Q?Y8VAK4t0cFfdoSbSvNl9HylcBChff1OqCpLnCvrtC/bupE+nWw2xb0/vhoTV?=
 =?us-ascii?Q?lANTXBQ6A/ZhGkS6S9g497vMePRK9RrqkPrderA9pbx8w6cyekg+1724KL1d?=
 =?us-ascii?Q?rtGuQ2JKjGgVwD1ec3e3KGRh0/vuCU6h3AVzeZfH9G6qOqr7bVzoYF+2o6ZI?=
 =?us-ascii?Q?iaIN/GXF+xYEj/wx4boRhD9Ffs/POo/FPvI1vdwW8cLugxaaq6/T9B+Em2Sc?=
 =?us-ascii?Q?a7ALXTp2suApO3m0MozwldqIWAZSI2bd3NlxgEW1hmq6yFyMvO8izstnY3tb?=
 =?us-ascii?Q?WPOJCokwxc6x/pqzqDOKzsIsqKeziWrbRjWLD4B2quYiz7tthNrtd+BSHjgS?=
 =?us-ascii?Q?XYl1yFLgUcAuymBSTY1bVYNPgM2vcVy7PXv5Kr9JBmpt5BOro2fFJlufqSFH?=
 =?us-ascii?Q?Hp8iSSfy6KHjKs0SvJMa42F+6UNDcJb4TXhZe0EI13jsg9BZ1dFLl8nnPP52?=
 =?us-ascii?Q?tOwRDMuZhx0/n5+q1XkcDuX0taIiV8IEmFj7YwZ8526Lp1ZhKBlQJnmr+Jl4?=
 =?us-ascii?Q?qSOSQtwR4lus8EVao824MkrLBUFKFFGpazaJM1h17d0Hi6fenN29L4IOI/rf?=
 =?us-ascii?Q?ZMD8gvcluNzKH6lHw8vmUnt9CfzFTJqw2oTBLODWSw0uW4UKyNfAInsMPy9D?=
 =?us-ascii?Q?BKxhpd8BDdn+jdPbebp42D1wKOtaXC1JgHfSbPZtAPuzkFFXzO4ybMLFgVT3?=
 =?us-ascii?Q?Wz7HKeeUyf+ONlMuhFJIcxJFIp+P6sXquVJGgwzX59AHIbP7aSkS/2TiHC7O?=
 =?us-ascii?Q?6SRYlOAnjCHvvXkHcUdZxvYsnzme9vhGo5wPOQvhZzTemEZx9VJARtJG5vWe?=
 =?us-ascii?Q?O/x9jLh+uNlNOJqKa784ToSb/4Q8x3EZvq5A4vIzVuyXXgNSPJ/cPt1Z4zH2?=
 =?us-ascii?Q?Z6Rz7jJvxFObntLhQAXvrfeWeKhUavPdUrNc4nEyY4zCt5uutRIdG/OKfNTS?=
 =?us-ascii?Q?Tz34rRR9gA1U1+X8RB1g43fU4BXFa6elsONJKzIOe/b6cdR9r6hAaIsb8dC/?=
 =?us-ascii?Q?h0lMNCWokz/NFQrPbLdxGJVUq8PGHeoKnRojHiwk+b3vFzjiIBLJfjUBEAoH?=
 =?us-ascii?Q?DSPo/2zqed9ZgJHpU8XnyXbMV9PKQMBvOpDdIYNOM2gnThYjTdcnRB0z+3ZN?=
 =?us-ascii?Q?qnZxzuSu0bhBTKZRHu8OL3oWCps53xrcz3hfmKMuM6HIEsCJTUEpSPspi8Eb?=
 =?us-ascii?Q?SJH6z1oD0DtcmoUTqF5P02AfnALvdTcvhyB8//Du?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 786b31ec-2b38-4a0a-c87c-08dd80c438da
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 11:04:01.4525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2mpRJYHUeyGDpDOnvaE8B3aKHKrcBYJ3UJ5gY927hyTj7OpuhrJrx07CMoElqA5IX0wXxfL7b8QBNa58AS7kpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7854
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_040403_740574_E20C7E89 
X-CRM114-Status: GOOD (  10.41  )
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

I.MX95 I3C only need two clocks. Add "nxp,imx95-i3c" compatible string for
all I3Cs. And correct I3C2 pclk in wakeup domain to IMX95_CLK_BUSWAKEUP.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
- No change for V2
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 9bb26b466a06..fe28c0c46eb6 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -681,15 +681,14 @@ tpm6: pwm@42510000 {
 			};
 
 			i3c2: i3c@42520000 {
-				compatible = "silvaco,i3c-master-v1";
+				compatible = "nxp,imx95-i3c", "silvaco,i3c-master-v1";
 				reg = <0x42520000 0x10000>;
 				interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <3>;
 				#size-cells = <0>;
-				clocks = <&scmi_clk IMX95_CLK_BUSAON>,
-					 <&scmi_clk IMX95_CLK_I3C2>,
+				clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>,
 					 <&scmi_clk IMX95_CLK_I3C2SLOW>;
-				clock-names = "pclk", "fast_clk", "slow_clk";
+				clock-names = "pclk", "fast_clk";
 				status = "disabled";
 			};
 
@@ -1266,15 +1265,14 @@ tpm2: pwm@44320000 {
 			};
 
 			i3c1: i3c@44330000 {
-				compatible = "silvaco,i3c-master-v1";
+				compatible = "nxp,imx95-i3c", "silvaco,i3c-master-v1";
 				reg = <0x44330000 0x10000>;
 				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <3>;
 				#size-cells = <0>;
 				clocks = <&scmi_clk IMX95_CLK_BUSAON>,
-					 <&scmi_clk IMX95_CLK_I3C1>,
 					 <&scmi_clk IMX95_CLK_I3C1SLOW>;
-				clock-names = "pclk", "fast_clk", "slow_clk";
+				clock-names = "pclk", "fast_clk";
 				status = "disabled";
 			};
 
-- 
2.34.1


