Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67013CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 03:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Nz4aanaImHa1ZgiBzIar+fJLAS+UsUFOl8IDaP8sXU=; b=kfsdEPHNzrCQRXb4rKTfLayJYL
	ySIaBl7wm345rfLbSrPBuI8ojKVHHfCnjXK1254lmRT80UMMoedkqHAVvLCbx19kQx11bmtfidmpY
	wwcRxC3gahL577H2l/Ra7GOrxOnGi8F1vgq2BJv4p5Jl4fq0qSyjI/00gD3qSfLSs2l6mt+YhpN1o
	1AEW96qH5YqJSWRoKFd01t7QhzceRGvva9itrvo4DLeTtT6Dbch2Oov2OBJxFIBCVVfj/rcatji70
	r//1XaNouNVHzDT+o15wav9Ckfe63JHTlycVvY+v1EdFAWPG2mbFC6hsCyUNBsK3I65MYF95byKvX
	NMxFOnTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8rpd-00000000IAt-1ZcM;
	Wed, 15 Oct 2025 03:05:41 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8rpa-00000000I72-0n9c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 03:05:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hjMeF7V8TB4yDKvnEWyiOcnBSB/0AxC2ILEnd8IVqYXGWcCdpXhmcMU7zQDIkpM53VamAZe49yOo+pHgk33BTE+QzWSf/zKQsxipOwkGYMaxmN9b8lcMZoCO/5caQU5beQAxEh8n3+yZfbAJhR0lJOdyCJVqkfrHNgXoza0mG0K1uuXhKJEU0eUyIrYwBa0VEgoPUlrO/oLYCeUbVUs7iNfsYJgdxplwAkrhwgdcFkNFdbaDFBUnGmuK8NpJtoXFb4cOhuBWKJneLXJkEUUaF+JzD7DGq2pO2FOYduNoUHceWXVtu1rRvxPU2ib3zCUMbG/4aF0Kgn3qXjz4o/9FDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Nz4aanaImHa1ZgiBzIar+fJLAS+UsUFOl8IDaP8sXU=;
 b=w1mwOQER06bNJ4VzrySMorwj4ffNu2MXD++a21lJxNZGaEV4HWjSO5+2+MBpIsKjnIWACP3kjzvZJ4wTywxdiF3OKooD/1vVjqqFT1w0AzAm7giq7oRAr7oY/ycHsYJcO+hOsF7M9LGidfsPzVKFoCCl4AXkv4UMUQnYGuTtn0C74tnEvvR+76U4SpihcAA+Pmebo9Hd+y8HkTsEQzV0oxciVvxmskMDxwJVDqUWF09vJhoITlTlqZrY1KFPDfFssPdksfTYclYaOKjJPFXBq8jJ1A4zhJNilgvFBgq1RtnwBUm/ZTLmoLp4OsrbJlPeXiVMUhpmIHHpxWQ2fYLr2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Nz4aanaImHa1ZgiBzIar+fJLAS+UsUFOl8IDaP8sXU=;
 b=ebsHWmOyhu1lZ0nhoLC8ddf+m1bGkH56K2UgEQw75TusodOb866jZBw/n6VUfW3WYzTrsAWWzna0PcwR6/qwVn0KeOSOzPchucAXnpPfv0+x5Ux/Z0CEscQeNacUL/yJhriA0LSNw8EEmvuGm8BdDXv6Z/B+nh+qpG7Lqj9xuZSNjSiTZ8V/vJ6irZjsynATEETfZBENGuCIYMtOLSHiwqfQ936yLWupmLhAMbwCpxdnA8OJIDD9xVT6yQNKDT2NQUn0Iff7xIEdxDbyIm4dyODqUzasj6ZkDarzifRieMJw1kK4ZFTcxTOScAlO/gFy5n0rG4atLME5kwsQO4+iLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8840.eurprd04.prod.outlook.com (2603:10a6:10:2e3::6)
 by VI1PR04MB7006.eurprd04.prod.outlook.com (2603:10a6:803:137::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 15 Oct
 2025 03:05:31 +0000
Received: from DU2PR04MB8840.eurprd04.prod.outlook.com
 ([fe80::7c5d:60c1:2432:86a1]) by DU2PR04MB8840.eurprd04.prod.outlook.com
 ([fe80::7c5d:60c1:2432:86a1%4]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 03:05:31 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bhelgaas@google.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v6 05/11] arm64: dts: imx8mq-evk: Add supports-clkreq property to PCIe M.2 port
Date: Wed, 15 Oct 2025 11:04:22 +0800
Message-Id: <20251015030428.2980427-6-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20251015030428.2980427-1-hongxing.zhu@nxp.com>
References: <20251015030428.2980427-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::12) To DU2PR04MB8840.eurprd04.prod.outlook.com
 (2603:10a6:10:2e3::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8840:EE_|VI1PR04MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: f47cb14a-8ffd-43f1-dd3f-08de0b97b38a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9dExqNSjKdGbiTtlxI+5nKxL/kYo2SoFYmfcXJgFJBOStjpb2cv9yNskan6V?=
 =?us-ascii?Q?3D6XNKNG9iNN7vHHozrCszbQDaxA8aMPt4+69TETqtgHTLOjwE5+I7q/KLBb?=
 =?us-ascii?Q?hthbyqmpjTtZO1z7ULGWT6ojJwRxEFghSYGz+h6X5B5SPu2J/zz4S6bXCcB3?=
 =?us-ascii?Q?RoCa3P/tt16lU2YBrue4J+mKhauxUdpET2JZbgSSIWI+zj4vpmI+E7Say5nP?=
 =?us-ascii?Q?TPHpHiCkc9nvp9hpb2HWQfdksLu0qvALwJgdquyEtw5rxr/AMNB6JhDo3ink?=
 =?us-ascii?Q?IeSZM2CVICelI5E3ZhcjUdGFf3Xn+sWjBFUB7llMTM+LorMWUXvUcVal6RWQ?=
 =?us-ascii?Q?wT/C42HDGDABz3zTZ1hR2Jl758IVNENcXV1BJLIXdKQ3oGu+aOqkzbb3t4nG?=
 =?us-ascii?Q?h+YCPf7aUALjklpe285/qoOdnqddhGS0ZootDUk84hy351UoCig/4cfOm1Rd?=
 =?us-ascii?Q?4HC6uIyXqaLO1iLbrGtF2aYDmpF5seW0tFAKpybJXPSTpXGqaSi3kwGtSVVh?=
 =?us-ascii?Q?UbCJJ0wQQcOwWUBr3bDZRgUV/nWUy5KV+Fiy+WC4X5sO7LINQE7rChhJD38h?=
 =?us-ascii?Q?2rtQheSVeHN54XSEk44yQ/dSIubtbhSfW2q3ujOXKED/r8yV8VN5G2NwSAqy?=
 =?us-ascii?Q?2hW8L2LlRT2T7xJsltqGlJuH1k+9CsyB0fuy0sKsPCWQFlBX4EaM7VV20aD0?=
 =?us-ascii?Q?INA+s3H6Ct2Xa8ci+vOgpSgMii7f/XKIc8krlGcd1o/koKJ1qAR0LQbSoRME?=
 =?us-ascii?Q?WaghbJ9aecfZNIBDhz4kRYbRqOhAaYkm7Y8W8wHh5tuD9ILxD4OBZtmj/9B1?=
 =?us-ascii?Q?EnroE2kuoTEQWs036wkNy9ui2nRUIngSQT6x2CHsl0HsqGgEGfOpvTy+xO6y?=
 =?us-ascii?Q?TfmKMhJeBidDB7aHyeVNPmJfegvLFAfjchd1pumOKEAEKy6F2VLqnmNZjeeh?=
 =?us-ascii?Q?fN3TNy+qBqqG2/SxsUqO7dUlLowcNpvQTLtSj4Uh1liXf+0g7wqVRpIlXwav?=
 =?us-ascii?Q?TJoEzBLoZilV5kg1eSOA8bi7DE7G3IQKLUYj59Ful1X02DSiAaXwqS7Vov/t?=
 =?us-ascii?Q?KlG5XpeBEMlavFdCxu7M62uXsx43S++9TDHSpvWtH3rn+w9bUB0caGAzzISJ?=
 =?us-ascii?Q?oZDqEHlZzAewyKtTt75TbV8ECsy/APY+1ZU8EdiPT9aMIQGiziZWnWGEgd7J?=
 =?us-ascii?Q?pXQyFOcapyxQ23TMfx+UKk1WG49I5/K16x2LeP/vQ1Ivh5G96nYDBk2b0ALs?=
 =?us-ascii?Q?kpd//idmYSgGQqfJeCbvHE23qgoAefEYs2f6UR8cx/TBVPx7iYgAxc5iIdBL?=
 =?us-ascii?Q?tQt5rUd1pjvft/2xhzcgCIutJuOHkGkClo5/gr5P1xn0SY4W2WKNtsMXmcLs?=
 =?us-ascii?Q?4gV7k41V9dMaTpgzgz640AxDKqCZ8XXTdkut6gMaAMjWT+CpNSHcUPa5LKnf?=
 =?us-ascii?Q?U8ArgVjINBTLL3qgUON8uwyrKYHGokBZbzXntnvXfFaZL9PJwlEkhnU/NZ2q?=
 =?us-ascii?Q?TEByZMQ8o5UpGm/a5rEAz4HI6iL9q54rbqDBX+ceP1MadBR8hmXirXSoSA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8840.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(52116014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HtH+AZuKUdzJR6F6DGPfpGGlrK//CtOUcandXhlFAGU4bNWahpELFnFh0pDZ?=
 =?us-ascii?Q?Zg4/HDNtHtLbV9OrxjsGhZpQpHeIah3xs9nBuEa0j4vNK7XawxdwJCD2kJTm?=
 =?us-ascii?Q?Bua/DG6XmYmy8xE7C1Oufj+sG1Ymhm8mRNWI/yF7dOfTu5NDnzjFb2K+hfCP?=
 =?us-ascii?Q?Mj9yKvgILfQ6B2wn+ckPhYdjkNRUArJBXHunv/k3XlnHF8Duv1GXko9mPdu/?=
 =?us-ascii?Q?p2c0JU3STRHGykVKi+KEXx/KYp8ccuZeEpp/d2FCehFsOaai0/pnQEWBfKVA?=
 =?us-ascii?Q?wRaiALDJa7+hblPPoyLWx9gZNz3S6aUEts6oZ46Bfq2nuq7Hk6jJnHBbR2CN?=
 =?us-ascii?Q?iWWYAnsTXD0PrYi1uYucCY5Ywe+c9fP+kTjuCl2nd1oPzc8T5hR2U+/BKveY?=
 =?us-ascii?Q?OCP2UurdPdG/6FZuer/+MAFoQUEH7UVFF2+NLOtJw9bC7Va2iGWXobcEc5Dg?=
 =?us-ascii?Q?6FoRSUMBDKsdeMBswtLW00UWfLnfPtRDvKN1Z/hYN104CVvGQbbX5zqPRDZS?=
 =?us-ascii?Q?bE0VegHJ30D/edCy5H21kBFpwldz5QZVzLz1/NFt9vw8iulvAHTEWDKNmlOK?=
 =?us-ascii?Q?fsY1lOZ0bgwbwFPHSiGlmSmHIUv8b6t0i1ZAD893YQXki705ihWr6TeghmVp?=
 =?us-ascii?Q?wpTukhufBZPbht9mbNE3k9UWhXPcC16ZrTSnA3SAvpiKxZ84E5e67JKVqHCL?=
 =?us-ascii?Q?Gvy8lkddgKZ7NS38r1ytIH9Fv555NijpXEQqsFwmJ2wT15cdCJoyBHVmrG/C?=
 =?us-ascii?Q?hSXXUwTZQcjc0OSuZX6AioVcTCZxfiUMIk/qxBywMY65d72KeUccTQw3qbVw?=
 =?us-ascii?Q?zcsDwfSaUvZ36lBRcTQNeOPfYnKUm4M1KhwX0n0DrOmVPT9dPDBVJ0SUxa13?=
 =?us-ascii?Q?pvAnDUH9sjymAHCp+ntnBZzLmjsBKzy6kwfrhTnW2eUe7gHIkky7alk0kbqj?=
 =?us-ascii?Q?9ib+WHGtQdQcZzHebaV24Vvu58oPsCzL93uN8Uz5GojXxIEodFts1+W8NiT4?=
 =?us-ascii?Q?VOrA85VwQgEDEQRNx88v27qHQlalSEjLLkiTDHL+fMAKAdXiOAm2X9jsDygP?=
 =?us-ascii?Q?LCk/UrtDm7kMTRYcaSybQweAlND2sHruUMKKDlPANY7depZQT7DEXprvgg/q?=
 =?us-ascii?Q?KlJSnbUtySkHFI/9C4BG/HtQ85gyGssBjtsgt0SDBpzQe5kpZM9UI46d5vYZ?=
 =?us-ascii?Q?dEQl/9aPFEL15VJL7pVbkWXPKTZ7S3b0v/ZTvvVkmR7w8V1gNwnoAnirhpiR?=
 =?us-ascii?Q?rUFrsuL4pXB3u7rb1SyTJZHxa0+XbIWh9DM5pWRayr/3aPu4Bc/OLgFO3lgE?=
 =?us-ascii?Q?CfgI4ajxeb570llkZFmeGM1yd0+6d2YYRzS7iNMVjctBR2ygbeCB4ixAVAEi?=
 =?us-ascii?Q?qYSAFFZ7Ux7YuFubDSofYnM2a1F9e7nJBpYiQ3dolWzGbyG1Xc7kgkru5WFo?=
 =?us-ascii?Q?CoVuKwITMdjfKxBa0x3Htky9ueQKgLJx8TC64154QIqmNLYvobVdjy9tUdcs?=
 =?us-ascii?Q?S2wo8jHFW2g6WA6mvoWHlhkB1tLhGKY7cvR8NnHowo3JuZbUbD37Vuvfa1Dc?=
 =?us-ascii?Q?W5HqV20F6av2mA4sTUVke1WdFGgSPoPvEeaRCIXx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f47cb14a-8ffd-43f1-dd3f-08de0b97b38a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8840.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 03:05:31.4811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KyDzlLj/OP3QgthfMXjyxQcZzFs8MdxqiGg9T9X/ipNREIqdW61TbAUxJ0sUDfSArP49VTb6pQnCylNp5ef7fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_200538_246434_093F1573 
X-CRM114-Status: GOOD (  10.76  )
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

According to PCIe r6.1, sec 5.5.1.

The following rules define how the L1.1 and L1.2 substates are entered:
Both the Upstream and Downstream Ports must monitor the logical state of
the CLKREQ# signal.

Typical implement is using open drain, which connect RC's clkreq# to
EP's clkreq# together and pull up clkreq#.

imx8mq-evk matches this requirement, so add supports-clkreq to allow
PCIe device enter ASPM L1 Sub-State.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index a88bc90346636..852992b915a39 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -375,6 +375,7 @@ &pcie0 {
 		 <&clk IMX8MQ_CLK_PCIE1_PHY>,
 		 <&clk IMX8MQ_CLK_PCIE1_AUX>;
 	vph-supply = <&vgen5_reg>;
+	supports-clkreq;
 	status = "okay";
 };
 
@@ -398,6 +399,7 @@ &pcie1 {
 		 <&clk IMX8MQ_CLK_PCIE2_AUX>;
 	vpcie-supply = <&reg_pcie1>;
 	vph-supply = <&vgen5_reg>;
+	supports-clkreq;
 	status = "okay";
 };
 
-- 
2.37.1


