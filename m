Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C65DEF371A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 08:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xI1wFQScX2SiSkqI6keBdf1JMsV/rrH28D4tAo6oO4Y=; b=DUEtBznVb4EH78EP2D5W2xm4N3
	d7wjtacS4cB1NfaqaMwvr3tHUIVkVD/ZLGMoQrfgK1YlJV8L/bbQKZSClBuadr++GsC1w+ZAPGLZQ
	exEAe+bws/vni0zYMXGlm0/CjOiQqq4gAtfOjKqOhpQ4haxTiH+U+bW8N1vY2bDwHE8x2V4NTnjZm
	1G/tB6bNZmG9bUQPHdiOr7A+kxO+41rigLLdYkortVQFsczwGOQv0eAWjGFrb37C8kcgJpGT54FMw
	xJDg99+/bDAwg/UhfXXNXGXW4efEVoP6FaeqpSnw0hCeO0ldCZOEYe6Fk5rFBrkeT3uPr6wVLhV9D
	8u4nTsaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWD1-00000006tmQ-1AhO;
	Mon, 09 Mar 2026 08:43:27 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWCy-00000006tln-2DOD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 08:43:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6MLprve59N2s5ynQAkisbuUAClkL4131A9gA3bnbkx6Lx6LJk2qinjW0LT0ui7i/k90f90JdKJtlqLNsIm5XEeSJKlAfOSJBYRrDpct3TfY4PNWAGPTMlyBo/qXfSDV9FO1l/Bzh2533kw2TQSi/tC7I5UzNtPt79E/Q/ZlR1qQJx5qtxBmYS7IXdxcn7wUijzqEGpr0vzLgzXg54brE7DpeB1N7Jpln8xUykr5c0CJhatW4FKi6s1uJ4tre6B81k7cF+5vtAMHWYu6mrCKa4Z0T2mc+2iUnmXpjMRLLljd+rEGqiug+YN3PNcxyybJ679GG2suxLiRHiKTEESSLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xI1wFQScX2SiSkqI6keBdf1JMsV/rrH28D4tAo6oO4Y=;
 b=A7Jf6arx+LwiF16e07cOvNzVbDF8Gc4pXjBhSP9oFO5W94xPxsxEv0/MjE7gcVeS2HiL7vJSaFbKmmBwkP268Q7w/RFX4N4j0N2T9h/38em2+0WO73ISoFst50lq2HZDUVYIsYI1OToHJHwvmCVE3vGyE4TsbldMyaVR/vuYUnoq0u86xf5J/5aUSSp3pIzYyeSoAEr9mO7hZwybCIN9JNVd1b2bQMWA+VDOnZMws7vNAWLD63VKHStpi9dfXKbjnONmMN42H9sGu5OsIPr0azrYYkogGwx+MmDGGIWPIMAkXmSp7r2Sf/b1gY9o1X+AbMzYhsk2a8chBRDwLn/n+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xI1wFQScX2SiSkqI6keBdf1JMsV/rrH28D4tAo6oO4Y=;
 b=aSUXbHux/JAassbqtbzSHWoU8UznwCOpEoJBOSHwzQ7C1Jt0fkpEE6bxu6Y22ZooUcWqb4NI997LCZekpqXO463eCddlCKeX5hUfjpQ/Gtsk4m+8bHSXIog6OMzLWA4+LVq+xjQSNkVQtJ0uk984yhI8H5B0THzUeYtqykcqluXTNASVi3hBa8KA5ASOWWXp+JLqiv7L06GgLe9V0cYY3q7ESS4HpWlJnqnb/YYpmd6ybbM0tvNbOOovQ1lg60+yY3W6L/vQPPlj6C42nbmZS7oO64uaPKqsG73r0sn/Ssf9OB4NWoEr7D5h+YCQo0JJIfBtiVcSyPIhH+C4UhxrqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by VE1PR04MB7264.eurprd04.prod.outlook.com (2603:10a6:800:1b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Mon, 9 Mar
 2026 08:43:16 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%3]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 08:43:16 +0000
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] Add i.MX943 PCIe supports
Date: Mon,  9 Mar 2026 16:44:27 +0800
Message-Id: <20260309084431.3015463-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0168.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::24) To AS8PR04MB8833.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|VE1PR04MB7264:EE_
X-MS-Office365-Filtering-Correlation-Id: de5a7e75-b824-424f-3a13-08de7db7e7d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: Yf+J4RI2256bjr9wxvopIik8aTmdQbDJOSCmOKcTQ8g7PZRHRsr6XXm5HqwiseQWrGyEW8an1l01WB2UTrXBpRs3+39be2D5+aw/wY9zW25lfg2F74qP+E9ZIs2Sz36UPkXjSKHV+BCM7ykos09hcqJ0I2maHocct3lkBUM/IF7yT6qygW8lXIqCMA04P55Mu+/WwKeGsFh3Gb5FfrSgcPV/sH45GRW9RW9Lz0BhYqk2UdvMNEozr0HuUC9Srl9Z2ODKirt5IHkXEOaaV4ChVlZc5wILYbod18/9xQTS2WnSHC9U9cL5ru1sY59NHEnxCXk2NAqR3UqcTMU/wMZbsY3nxyLRE95bGyBYZ6Jmi78nns5bppUT5SDrZjXtI1lkU3rcDVPeh98rXxeQPxYEM9mOhtVYVIMbXSQc6Pu2ANEq9WOrQBDju4ma7Z1+sk0Pkap48mssTmSYqd0GaEJEBhkSaayPQs7y+TtZDQ64rmhE6sgIdePJFogTr2qRDYLuS6TORlI3esxjC8htsH0msLYFBA/hqwwNhNu9Z839UMhxNIirU3vrvLzQErIZPJFB6B3BnuNYwh+tnQVtGCILcBg/t1FzzhehA5gxj5XAhtJ5lJwRMK6+OhNiqAPXSh3SMO1Q4n5vZlGRXItaHBwcKJ1wfnLEuh9NHmnfUbDlMC4l2kId0eg6wvAzpaTWkeYzpEb5J3QXTBW5Vyvgm6JZh97GTQ4IWeK7Rl+N/mMCp83fGPlmnpSYAX7rSkfAzlB6aIJxtw3i58hKwV6z0akFGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kdepVM4sLl8/FIxFXbeazAnCpxW+tXcaqTw0+0JFc219fOQGlwDtShM1RCYM?=
 =?us-ascii?Q?v/qPiNu00i8gXy+DoAgriKD0ttLoCq9Kq++foYwt9QtwSWC5mO28y8HVEdg1?=
 =?us-ascii?Q?3bliWXfq4gg8F/zvg6SD+iQCkkgw1kn+d13gJCjQG/P1USoWQKcT11KBVihp?=
 =?us-ascii?Q?Ahq4IW7+fc4E0bQISUzr+0f8XVzfqqxe2FMfvb1OkhZ/C3sRBFF1RiOIqcgE?=
 =?us-ascii?Q?NaD/1KZXoAvM/q/E+9A2vnvGKtsCNnXd79UXqqydvoNzxmb1noOfRIAp+5jW?=
 =?us-ascii?Q?+ok4ADvBX9oR7B3dY110hr4dTYWAuFbv2SPlil7Dw7mUx/GlQVidxQXPC5Ii?=
 =?us-ascii?Q?G/yuEeB7MJ9n+0D8/QLUzKsBq1qp+7Zb4nP7T/cqt6rarqab2ofxVFeZDHOq?=
 =?us-ascii?Q?qPeDEHYA9C8napmcpqKeX1iKkpN6vR/bZdehNEdBYgwNn/Q1LPYx4RUSZ/sx?=
 =?us-ascii?Q?fiiKm4HvaO1foXEx53bXaP2fdP1TBMY+zLwG5IG9/JXNyyNdp4w/+I6SPu6c?=
 =?us-ascii?Q?a4Wrb2oRzTxPy6YDBe5qHZHc94CchsbkCkWC5ujddk7JqpBDccoj8UKzZaZu?=
 =?us-ascii?Q?ljx6mMC5ltPq8SOqaxxTzoBQONYz02ZjcvTSam9a3dbyYhrzwHOjOYFOpX++?=
 =?us-ascii?Q?VqXg5NEqI/y2ervlcHr5Awl/ZJqiVSLmp8lUrEdCVg/KTZVG+vFeS3TSnSQn?=
 =?us-ascii?Q?9ru7bwaFa84v5V8iwqjuLYGmUqW7xvVOQv2Pbk2XMkG/ObQQk8/7hlv/HL03?=
 =?us-ascii?Q?ghNKzDsvZI+HOVuShgtQmJk4wKAqfkBNoLGtMGpWjpKGzLcuj5l8d5nK7F/A?=
 =?us-ascii?Q?+f9apV57dIlaUpSoJO5Gekh24Mb+DZ6DoA/wyp0gIz+o/WJ2WzxTnxT8Rj5G?=
 =?us-ascii?Q?Ip6E72isL9HJcbBRXeTaPf9uJ13KC/ikVehlMpg4c6tcSr70w6sbz1En4XUX?=
 =?us-ascii?Q?mnP/9bma46IngLTIcGO0MKiZi5PjFUqTzXrD9E/Fzcd1e9bS3/5Ys5QQyC6U?=
 =?us-ascii?Q?Wb4LtzBu5xyDR2QXmjYhLYqsRbQPgveYWs/4/skYNdg8ln11yR3JSqwqA/9r?=
 =?us-ascii?Q?m1D+z1+5hu+k0qt3sLm/39wnFD+BR7MG8/luAxUeCCUpEvgbsfkWbFN7ZHj6?=
 =?us-ascii?Q?SxAiR/Q2FQRYjNO3E/8rZkabj7zSmcjpUx0qpOzsWgL8uxVpc32bftBD4hG0?=
 =?us-ascii?Q?HhYvZCIcAa2xNxML6wdfnmgHzAyXIezgpd1jBdgjqp0MsljYQnFhHGafb4uT?=
 =?us-ascii?Q?FlkKTif4Dh1DUvudJqoVCifyutOEXicm4Jbj0kvnJBm9523aZuVEwSGA9fE+?=
 =?us-ascii?Q?dbv1JxrxbgcCgMxhttPeFZVIFLAP5O5exBRepjkJU8DFYIEvwstkLynPkqPo?=
 =?us-ascii?Q?TmtytVGISNls6m9M6Ri7m/h+Z16LslMEuyyvJnOhVL5OkSRPNVmDBYBPlklv?=
 =?us-ascii?Q?YzUInY6OTPLIHBMcX0NH+AMS8ucKbTvUbcfRBSdLcye/0+dedOXABDef8JUQ?=
 =?us-ascii?Q?G/N1lMKltbiYqgj5rW/TLFobfiINIX1xXg7ZeZRP1XnJbDCSYkEyBmHfIHIo?=
 =?us-ascii?Q?3FVluo7wQ9k2SS0vKVQImbNDbX7e9RtlxYNSfMyw5sMuADPqfdcIpeeu6joc?=
 =?us-ascii?Q?uRk33DNzZ2KYAEWrclVcdg9k+kWNYC7edIfRE71q2kGxkEzy8R8ydSoDDmNz?=
 =?us-ascii?Q?ZWOAVSSzDlDheD0IfH1DxEI3G1iOvBYPAx9MYXNw+1TFGC6njSKk7rJYupp6?=
 =?us-ascii?Q?iv4SuDuTDA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de5a7e75-b824-424f-3a13-08de7db7e7d3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 08:43:16.0191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aEkLa57xf2kRn2mGVDAIQTOZXBfMK7hwDCunTDKtOM+EZPLr8OcYqm1xpQrc+lrtVsmwd8uPgcEHOtRZyl1wLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7264
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_014324_598131_0A9A1443 
X-CRM114-Status: GOOD (  10.82  )
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

This patch-set adds i.MX943 PCIe supports on EVK board. Please pay
attention to that it relies on the patch-set[1], and the PCIe1 port on
the EVK board relies on the {2].

Both of them are included in the v7.0 kernel.
[1] https://lore.kernel.org/imx/176649331066.523506.9443864112044699350.b4-ty@kernel.org/
[2] https://lore.kernel.org/imx/inzg46tc2fwsajxq4vzdyuiq7krzy6xtcg2mjaieninz7zsmgm@mtdjr4tuegpq/

Changes in v3:
- Fix build warning in the dtbs_check.

Changes in v2:
- Refine the nodes sequence refer to Frank's comments.
- Rely on [3], and remove the duplacated codes mentioned by Sherry.
[3] https://patchwork.kernel.org/project/imx/patch/20260204022306.2372889-1-sherry.sun@nxp.com/

[PATCH v3 1/4] dt-bindings: PCI: pci-imx6: Fix build warning after
[PATCH v3 2/4] arm64: dts: imx94: add pcie0 and pcie0-ep supports
[PATCH v3 3/4] arm64: dts: imx943: add pcie1 and pcie1-ep supports
[PATCH v3 4/4] arm64: dts: imx943-evk: Add pcie[0,1] and pcie-ep[0,1]

Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml |  4 ++--
Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml        |  3 ++-
arch/arm64/boot/dts/freescale/Makefile                           |  4 ++++
arch/arm64/boot/dts/freescale/imx94.dtsi                         | 87 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
arch/arm64/boot/dts/freescale/imx943-evk.dts                     | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
arch/arm64/boot/dts/freescale/imx943.dtsi                        | 74 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
6 files changed, 251 insertions(+), 3 deletions(-)


