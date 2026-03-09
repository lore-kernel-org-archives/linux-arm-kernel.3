Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB83F41807
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 15:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IccisfL7vh7olXruNpWrEXvAZMhqab5k3ZO72kt42l0=; b=P1/wjxx0N9E6xdV490HOhGnB6+
	lHnSZltx9eUy98ZoDw45pvtXFXRbjzSmGTSdv8Jjn5E0TtTOdzQ+y7VVKJzOACrY9lDA075qqFxrB
	X24JO5cnTbxRzEJ8S4xeRvfW41lJ0KOhfh9BiIwZupAL352/xubPPgHL+4RznOmC4pDs6kI5uBJwL
	e4E8zn8jie+pcE8uSTWcy2+grrf7StF6yqIipkrq1Jv8cERzei5nQCJInRXp77A55f1NgmbNu2bBQ
	rwBw+HfCjIS7v4eMpKI0wUmRZh3cTALAcip7ZTdA9zIR2OI2s3q8RnV6x9zpCeSneff5pzaetyrvx
	He70VwWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcNk-00000007aDQ-10VZ;
	Mon, 09 Mar 2026 15:18:56 +0000
Received: from mail-northeuropeazon11012042.outbound.protection.outlook.com ([52.101.66.42] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcNh-00000007aCt-40FQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 15:18:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WK72gja4b6+Cq4kxFcRmbKiMGYUMIxyaVMx8SOZP6PudGX08dkfA1YM1n8m4RSwngQKWAFvI6LeYr7nwZ7DnGTg/OH/FnPkfDz22IWEqe655tRj1SKYfdXtl3f0tXCLc0fQc6kN1Qc7s+7Wsa5gn1Sob1L17eaIp6xKMtJuhW6NJPXTVLlrBP+hP4L5FLDogmoulqe3WjZSJE68j1Sn4lY6okEpis7RTwE59mWSGZHXRL4rzFoeslMX/XVR6lRc+o58qeS4QgWLgmCSBDAhdi1UdS/bkKtI5xzZ+MQBR56zHaFi0JCSzJOfVr7i5eOjqTLogqygKBeHkS/NEEFVqbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IccisfL7vh7olXruNpWrEXvAZMhqab5k3ZO72kt42l0=;
 b=vIvefmTiNscaWEF1xYBDajGuh2xw6Rs6YxJfEjcvWOhvlyb5t0a4zCYKvaAcDNzv/ub/q64n1H9r65QsvFbX41Gxg59/6XoKyzGz8sx5o4T/+Tck5PNevquHHzHIdf6sYZMU2IoUNEvTcLxtvkPt341j98p5JmszPNY2aKXqGSGp1JQgohlRoSYB96SVG7m/4oGO3O6oulEBwP0XklSy+YU7vz6BzPFlMJbQdgG2a5mRobc8/PYT08bfBAoeIQRcvcQHfpg/TYZr6sUn964jQNj7Z63Jx+Glnu+b3xoD55KYLnBJIBPLl+EPQRxCs0eRyIu3YO+tO+U7wE4ibJG23w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IccisfL7vh7olXruNpWrEXvAZMhqab5k3ZO72kt42l0=;
 b=BtF+un6K8PaOKqN1pS5KE8M7PUPc6+Nuj5tC3WezBGx6QGuHpJNNWiz7VJtmWqW8g7BHI1999HUJqmx6dvcwrRzY8xKQ7MqZfqBtV5bG1PomcRM89ycoCTJsi36MX6dd0P0ur/aBRT4YHOPsOxA9IMwoeN++KS0swMkVciv9lGVghPJ9q4uBp6VLtVbWYiaMUy3OVpj6+HtWg3VFctQ50jL2b81vM947FNhfYTfjCiLqGanDJhkrkXuP5QE7TDkWYIxkW/1iTNX/MSG2z1pFUDD1iVbi4fwNdME4v1nAdQCSs1adeionzW/CLS79PEXx9uvyMzkSlxcCTVWvaabKwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB11615.eurprd04.prod.outlook.com (2603:10a6:800:2fa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Mon, 9 Mar
 2026 15:18:49 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Mon, 9 Mar 2026
 15:18:49 +0000
Date: Mon, 9 Mar 2026 11:18:39 -0400
From: Frank Li <Frank.li@nxp.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	bhelgaas@google.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: PCI: pci-imx6: Fix build warning
 after adding extref clock
Message-ID: <aa7kz1B4PabMho2a@lizhi-Precision-Tower-5810>
References: <20260309084431.3015463-1-hongxing.zhu@nxp.com>
 <20260309084431.3015463-2-hongxing.zhu@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309084431.3015463-2-hongxing.zhu@nxp.com>
X-ClientProxiedBy: BY3PR05CA0041.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::16) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB11615:EE_
X-MS-Office365-Filtering-Correlation-Id: a1fcd565-32ea-4d24-1d05-08de7def2a3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: 6Wp4knnmJghKr3BtHQtojXPg7a4olKostKIdOq1UNJNh9zbs6LWOiPwWk0d/VCoaXe20vgYZsVUfyZ0ixMDTnfJ7DkKZ6no55cM49EARBtrPiuyshg2rJSsFQZTr1FtloDK4Kf9rbGmsKF+BRDIdvKJY3fyG1DA8EJQ+Eg5DBGDhV5+0YMu4duKk/+tE+Z7mD5P7mZncIJcOsA4SkIBLArgazd9H7rItwl8T9LLgX1qHuJHaw0KeAfTemRBaF5n6gCK1Nimt+zOqMiymSa+HWEqGVsjlLyMFylHptUopRPto5Y/89LB9Wp1QsRvIgjReYtyG4Z3rGNc5DVSXxE4pZ1vw1PMgj5LbK7RxaDK0Qghc5vUJ6b/I9ubppfTMW891qJrki7lmxW8A0J+D5YyStGnF5fg3fLlGK6bdzbXvez1yGEeIPlhpj/KdhLaqvFIL6aw06ZfaYF7PYemoOGfuOqUSxh9VOCIOn6yCnqssBn9WLpwpi5iOMoX5+BjcM7lGQcrOfBda/d+rx/gW0ySGuV4FiB4Gs0BKbB03DnPf6iUAvj8CU0zpdKeREwrrcbydPqS9VkqlJySknTZdnlvybtpXrobG2Px6zaByHWpLwZHdodmi4vXynaNBzc71pl784zlXWUms4usiBU/uBIC6keuPs4y7e8iMnAfKa9yb2vmvpmK39hpr/AUo9Yhl13MwMGqrs+R1GVqmjTMu3tCAbWYh8JdHQBHpS3TM4/ixY0ZZUDwONv+OTu7xqG8tqJPYdU5Lq0n3NgA3Ehr/B9jy8Cgc1LmrYMVj4fQ6U2d7Ki8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TgPgT5S7KKPSwdiGawV3T/P/7GBQq4+j4f6Gaca6mSvvgW3BsHyP+dQZ5moZ?=
 =?us-ascii?Q?/l5sjKSyOzekIaQkPu7B8GBcWtdWgjb3T7sgF5C56WMzFvYPMaRYNQT33oT6?=
 =?us-ascii?Q?Goijy84W6yd9GF7WHeGQnpCsrHNk5avWUsjNv1tJ+sFfwIrLPOUQeHT1RXu7?=
 =?us-ascii?Q?c2MwtMDc8lioOKh/2BCISiu7Plqo1hJf3e7xyrb19I+y5rjWC4obvpzfbDUk?=
 =?us-ascii?Q?HIr2mk5AwTKVOfarGmzAQBWgE49R10Vv97f+XCLBYRyCNlB+Xynn9ubZwdir?=
 =?us-ascii?Q?/QLlNzgYqOPYfVkp8rYJEYV7HdWBxl1YnZR17KvIAmUL++PFSduWe28bjRAA?=
 =?us-ascii?Q?f8ta17RypIFs9I5HNcUhF9KvKn9WcPcoA7ipHeqMthywlvLK4rNm062m4uSn?=
 =?us-ascii?Q?BdkUdYDncgvFkLsKG0YkEbXSNbIwXCX+1tZw1r0YoKEcz+83I9rI52w+ucF5?=
 =?us-ascii?Q?iS77AzmOJVMohxA86x0oc2+/YkGxpGABRixQOCNlqx42s2dJA6QGRuMsPwv8?=
 =?us-ascii?Q?csnAlda6zwO6Va9JMK0/qhe0hWm3FiYd5XMeuPjr4ioSJD+S2Ak+CYYe1/sa?=
 =?us-ascii?Q?D5QvAv3ugHHYDLFVgqsP8SypFsp3A9+VXwWWEfRZ+9a72lln1Uc4BcZQxBr7?=
 =?us-ascii?Q?R3w8CmU0OIzi0LogPGn8Rjl8CV1dxeho01RVuWFwAJ0O9AZUeBq5QlD55KTT?=
 =?us-ascii?Q?4TERlwPTB6lnlykkwCxddBCSjtuzQRZa67RhDc8ZtbakmEYNwVkZJ0didljq?=
 =?us-ascii?Q?ciXJ+2HbPYrRBDyZbh1TTpxQ2ouS0ZNqUX48E1R348bva93uwSj4VUh77/vL?=
 =?us-ascii?Q?ooH8Nqp0kCspFe0Zq4b5F+l8aTLVHfARy2PDR5SKYNKwWwK29iYyzy+tGuxs?=
 =?us-ascii?Q?VyoHApMuqdw5SItSuI5AEyE++4ewRkNxobdINoERr00U1Jl1tboL6IaY1KJv?=
 =?us-ascii?Q?fQADu/bzca/3pxAHige+fEfy2dnuSzdIPbwowFj0aDzeD1jZQGu/cuXk0svA?=
 =?us-ascii?Q?r5BQGGyXQ70/oSdzLHU1ppJ0FytYMlWOzMVlm3xC0i8quHFQIyM/9A4aaFMI?=
 =?us-ascii?Q?eps0pRLQQBy/Ml2Feu7VlmDromXAEJpIbO/kYFrmFWk4GD6/1+eRvIpFjORi?=
 =?us-ascii?Q?YKnDPJCiApuOj8ljPlk124frBN4OyJId+ISsuHDqGeiKj5fwnXx7JXsbm6R+?=
 =?us-ascii?Q?7kxjcxFIg2cLLmFNi1fMJ4ZUwORlKqgIDXOi315vW5udJdxLJWKQuQNv3f9R?=
 =?us-ascii?Q?+a7gUXyxunbMoCt6dNg3Joz3zUIk6F+zq7lpNB88iQoCM/rHW7QsYRkGKEhr?=
 =?us-ascii?Q?hp8Iha60S4OSaFbXJaJFedcNvllEd6cHPZqhp056nT4WjQnIq0XnpytoEJ9J?=
 =?us-ascii?Q?Qyk97L1nStEqapFRy+dlPFzSaZdc9mvxT1hDX81R627Mlwdv5k/Pxxm0b0Pa?=
 =?us-ascii?Q?RpXYsdxLtV4OYou/QIiyZQg8z07BPbDRWxj22UkWiqVvxk/C3JwxXIcUKwrA?=
 =?us-ascii?Q?z60ygUbblnVFMhB15RtwCENXf8ABu/ILYLUpiSQBNk1XAsxY2XxUm5Hw4Mnz?=
 =?us-ascii?Q?P4n/+4cb93HewezsiEz1ZkumNmMWajBstU1BGCfVTXZjggSg6ikVGsJHMWof?=
 =?us-ascii?Q?aROe2loy7K30L9PD2z/brUXi6+5j9CqdUOmn/prZ76GDUhr8un5KmXIqSSSq?=
 =?us-ascii?Q?Ydhuw/XNhDekB7rQXJGMBnnOU5lJ0vSEoSZmh7JTR6fehn3P?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1fcd565-32ea-4d24-1d05-08de7def2a3b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 15:18:49.6322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mq28SAdzyW4uQYiSfSk2/KyDogBlc1FMM80UzWWLV1AZK7xuSHM3IdmwaqMuzPxrXm2hRSvrgB/Xfqiut/KLvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11615
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_081853_994335_71DAEAA0 
X-CRM114-Status: GOOD (  18.37  )
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

On Mon, Mar 09, 2026 at 04:44:28PM +0800, Richard Zhu wrote:

dt-bindings: PCI: pci-imx6: Change maxItems of clocks and clock-names to 6

Previous commit 1352f58d7c8d ("dt-bindings: PCI: pci-imx6: Add external
reference clock input") was incomplete.

The constraints for "clocks" and "clock-names" still enforce an incorrect
number of items. Update maxItems for both properties to 6 to match the
actual hardware configuration.

---
After ---, you'd better to said
Sorry to miss testing when work 1352f58d7c8d.

Frank

> Fix dtbs_check build warnings by updating the maxItems property for
> clocks in fsl,imx6q-pcie-common.yaml and completing the clock
> descriptions in fsl,imx6q-pcie.yaml.
>
> The warnings occur because the clock arrays exceed the previously
> defined maximum length:
>
> imx943-evk.dtb: pcie@4c380000 (fsl,imx95-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'ref', 'extref'] is too long
> imx943-evk.dtb: pcie@4c300000 (fsl,imx95-pcie): clocks: [[5, 74], [5, 41], [5, 40], [5, 75], [46, 0], [47]] is too long
>
> Fixes: 1352f58d7c8d ("dt-bindings: PCI: pci-imx6: Add external reference clock input")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  .../devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml        | 4 ++--
>  Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml     | 3 ++-
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml
> index cddbe21f99f2..0488c942092d 100644
> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml
> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml
> @@ -17,11 +17,11 @@ description:
>  properties:
>    clocks:
>      minItems: 3
> -    maxItems: 5
> +    maxItems: 6
>
>    clock-names:
>      minItems: 3
> -    maxItems: 5
> +    maxItems: 6
>
>    num-lanes:
>      const: 1
> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> index 12a01f7a5744..7fe1e0e9b565 100644
> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> @@ -40,7 +40,8 @@ properties:
>        - description: PCIe PHY clock.
>        - description: Additional required clock entry for imx6sx-pcie,
>             imx6sx-pcie-ep, imx8mq-pcie, imx8mq-pcie-ep.
> -      - description: PCIe reference clock.
> +      - description: PCIe internal reference clock.
> +      - description: PCIe additional external reference clock
>
>    clock-names:
>      minItems: 3
> --
> 2.37.1
>

