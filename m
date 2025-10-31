Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503DFCCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 19:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNdwjaMvT005K9FK5iauSRMgJ9NCEpBobzFzwUr6YY8=; b=Dtu7SFX30SopHwRIpbFtslQyxP
	ulNrt+FQ/PdpIXRWBDyRDuxYym+OJbWFJOr7gK1lsWHrkFIcoEGPUtkfhll3AVC9T7wGMZx4B1uB+
	6jdd28z5lKFH0DTaS4pnHaj/uZ/Vt/yEMT9A3LbNwPdpseG9awiQS8cHG0u+vQ1JnywzSBp2HMaoM
	ATtB4khI5aPqS8mB8TfYBvZQY5ooyaCm5A024dXewZ+LpRw4vHq69ks5hHHzJNyBPYhtIr2LPmy1P
	zRK4iBfoWBnOoI0+TMpDoQ3h7/0l6p2c03weObuJV8Z/cTgq2IMIzMIMxIxl1nlfoQIPQ2+ncqM06
	7w9ik3CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEuwq-00000006ipD-3rdL;
	Fri, 31 Oct 2025 19:38:10 +0000
Received: from mail-northeuropeazon11012045.outbound.protection.outlook.com ([52.101.66.45] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEuwo-00000006ioW-1abE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 19:38:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ta/1ZFmzcd7IRnA9Mvuzs+haxjaNJlIsTF1HI/1ZAi3I70cQm7fbhMrBjwGwd0TGTI8SzrgTK15K87MiGEn0GklQoAut/qZBHUcLYBk5+t+JWuMhul7kUduEDsiQgnqPJc3bcfHd6FeSiiQGYFdhe73haZ01YHrxiyEj/BrBJCShtIgzvcJxWsmmvrzHQkrGwo7AzxCwLkW7yehUSCTXaqJAqnI8WXQv/7drDE7q84VGBjeCFvUuZut7kc12F6XwpmgheAvCqJrx+4a7g6kHXtMlm+jVMkS6csXP3GTSFqPZa+veA6K1mbAJBMq+6Zmb23UJzxLWgSKE0qbsfqa3Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNdwjaMvT005K9FK5iauSRMgJ9NCEpBobzFzwUr6YY8=;
 b=ZoJNXLdzorzFvYmfWJFO5gk6D8xQL08c79tcorcuVeauZlh/gSBN04ukTggkz9NRIzttlPutUX9OhonJYUM0V7bab+mYHOZOIQI7e8HfsM7X5rKn3wY33V/VOsxwbQf2h6FyS89yuwlZE8jiYlFIQoOlBQAUdgtH3GmBc12uFwsKoDlW4srMGN490Msda8M9jUl4v2UHY+A2Shhx2fwe3Y4ATzAaFejlnJRIJhgJ/ZVo98jx+4G6yAW5cFLX+wmvNshslAottYXwlCgRk2Ew3RzxvjQc4AGCbNmqSR6+OmW5lOTUMf8xRnNAJV7s2mrekGkjSUFL7LTddfuBR1zaoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNdwjaMvT005K9FK5iauSRMgJ9NCEpBobzFzwUr6YY8=;
 b=KCpoXTYgWi5/T/FPGQnqAc41+/4OBLXMzA+tpgR6nG+WxnL6A8UoeTs0Gcl5NG32Qwu9cwaDIlYVpO4+uBOJJkAC0HfdQVoUU6b2ARUJXIsl4AtlGKiaZr9mw1lqyrz61ndhvE3Ix1635WCRNb1nCLlOCdPpbK0M9t26n1ZyLxVM9z+yayMNhtK4YOTVBWTtujgKsa1F1EEyB6m4rYmk6mjcJhz8hQUinJtNNNKlbEpvkQOIpZOpcKggegTl2iFxHNapIabVps/63N8vJdy2h+kcz7Hy6voygWTIU5oOts6oZ71BFHHRZjO3VAFP7TrPdjcVUVaLBe8tTrBmwn1rvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DU0PR04MB9468.eurprd04.prod.outlook.com (2603:10a6:10:35c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 19:38:01 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 19:38:01 +0000
Date: Fri, 31 Oct 2025 15:37:51 -0400
From: Frank Li <Frank.li@nxp.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, bhelgaas@google.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 03/11] arm64: dts: imx8mm-evk: Add supports-clkreq
 property to PCIe M.2 port
Message-ID: <aQUQDyON2yJLwLhH@lizhi-Precision-Tower-5810>
References: <20251015030428.2980427-1-hongxing.zhu@nxp.com>
 <20251015030428.2980427-4-hongxing.zhu@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015030428.2980427-4-hongxing.zhu@nxp.com>
X-ClientProxiedBy: BY3PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:a03:217::26) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DU0PR04MB9468:EE_
X-MS-Office365-Filtering-Correlation-Id: bce983aa-f6a9-4a45-bb71-08de18b4fffa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|52116014|366016|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NRNIzKds9lfUc44DSan0aEMBZi3WYsSeJvXDxTcurMcd3eLDWeoLOhaPp4m8?=
 =?us-ascii?Q?xPd03m36YuBQP8aiORJJOMJIr0RwvNZga1/odUkhRXweL3UH9RD4ik+Fq7ej?=
 =?us-ascii?Q?4MNVyuNB7YcHea9ADCQ4XBTMGsBNDkmSEmfIroyyNzBSwFaxz4tm/6yvksIu?=
 =?us-ascii?Q?xrCzJt4xGMkI5pS/OVaxXh/eC/R+nuF8H2o1lkZ3jwf02Ui1nYqz2rDKpZLm?=
 =?us-ascii?Q?qtxaO5vzRGHKa3QRO9QiWpU9pU6yXHVk4LOPdLT6JsGcK7KZ5YgekBFN5S4R?=
 =?us-ascii?Q?4F9ZPlpfOPGB52VvCPaK/5FmFc76zSCvrOUWLWpM2kMH605gj/u1GKMXwcvp?=
 =?us-ascii?Q?Wmoe9dvtOUuzYMT5pF46mjCauBvFutD6znH9mOFW+Y32/6Cad8zBd5mZRO0e?=
 =?us-ascii?Q?qkKOonIe7PIa8tZE3mDNxl/2G2JQhd6e8L+2xzCpVy/Ov6U0LEEMF3RrtFBh?=
 =?us-ascii?Q?wJS57A635V08Tw+LReOlnqBJFjVzOxnd4WfCU/a+w8MNk+qDAihMBWr6QQPT?=
 =?us-ascii?Q?/C67Nd6sJzOhbS4k2Qx3ASsGGJMfxBnzsrbMEXQHX2nLA0/qm69gW6yYPhjT?=
 =?us-ascii?Q?gRa+i5z0COrfKFejsi1Nifd2bO95gtApm4A+khRl2aJxU7b0mTKJTlZWlwRt?=
 =?us-ascii?Q?wcpXBrmNmKV7xM4JEiUun9GobU871fjPPgoGt7D6RKmOixjAXaugRXmJRa4k?=
 =?us-ascii?Q?OS5QDb2k0ktmMklsBEnEbjUo2bZwY2AcBSP3ZVHT9wRtP8+fRdy0Toi0Y2mG?=
 =?us-ascii?Q?UH3hC05u2O5V0UPh7Bz8ZqqOIIM0dk4RkuzySZkVpvuP3IORc9qx3oXBJ9z0?=
 =?us-ascii?Q?F7p2VqHGCVGq3OrfnLUInc97lxYtXPuzKYe4qIgaMhpPzh2w0y1+/ds6eVXE?=
 =?us-ascii?Q?pwODz4LvNpfmDajE8a/FpPHKWeXHzSpAnbNH5ezgZPnGvik57LBNdbiXzZFs?=
 =?us-ascii?Q?mnzOf5iDcMklC5Y4bMeksW0XO/eM19+u5zZyhqAauNhrjnkguyDzjJQ9j3bd?=
 =?us-ascii?Q?IczSTOQkoyhwSko26j+kWIERv3XgP2vpqqmnkauSiUI8X0luOxTBMOvFZdbD?=
 =?us-ascii?Q?N/lvFvxAn9p9nufzjvqDOeQB7hbKXm4gWRBQ2JobstkNbq+SFuNxdH9vEZH3?=
 =?us-ascii?Q?BIHD93BmPdRDnkgiAhD0SGInNyvmYYyiE/l7FBGtfDvyj099gF0Qv4/W3WHv?=
 =?us-ascii?Q?+1oT6GvwlWAGfQMJwH/cHZQoi2YruKn33oIrjQ2Xjd/7mHaoU6KjW0dXmRjv?=
 =?us-ascii?Q?09utBDTWymFlHyUyOeJrt1OEcsVye4w2tTbg7G3zgdFP36BPG4vGO+SO9gpr?=
 =?us-ascii?Q?UQ+yPgtgSPmqIFrgeVzLN5kxsl5LJHMS9xkqvybHedFNg5aOm0kxjfgO0vEF?=
 =?us-ascii?Q?hzLz/0xzMu5KuzXo1lP1Fr5qbqBsXDoEOVcagD5cnma/HMFgBRbIOu8kCo/J?=
 =?us-ascii?Q?gtQ95m4hBiMrclugwPZyp8s95+7yWfHpzMwVJuC/RS5no9A7695bRiDqB4zo?=
 =?us-ascii?Q?BwRCU3o3ZTaWfaKc465oVzoRQngtP/DQp8s9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(366016)(19092799006)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d4sDsKJokzwYLBPqXg/8HAlrkuVo8TSSRD83CqzQGo6QBKe5lqpAll7H9Ktj?=
 =?us-ascii?Q?tsgA5P1LzRfo4Dl6bfENV9+C/9EQEAwDNOhG9k1QxRZOukh7W21gI0ImwaBy?=
 =?us-ascii?Q?tMBtpdXTQGUlGEZfw1Vl1v1NHV1hlKp9HOuP97DPDwAp5+yLO3x7Gahq39tO?=
 =?us-ascii?Q?ENe736USlq0vKx7RrqpYwempYziyOSQTIw4G2fUePGuCbYq14Yp3HI3nHtd/?=
 =?us-ascii?Q?gVO+dHvUgBeKDAkO429aMm8jC3eHurmKpbOQDItxPyuM3zfoqb1Cvy3jCHNF?=
 =?us-ascii?Q?z+k2lYtFKd9FC6WikahOewV01OuZqPZAWjdB4ljfcmZGglKHefIpuTnWFjVz?=
 =?us-ascii?Q?6BIDB2eZEItTvuhLPMgSZILh1EtV+ECDg6GQ7v1Mk7/GsJz/o5WfJuc+1m2Z?=
 =?us-ascii?Q?Lp2/+N8aY48eKrPDLELGhwlroNvUukgEQE6PbK3K8B2nffKSwaDW97NbGS3O?=
 =?us-ascii?Q?u+3S27mYhC8dTiZFUODQrAG1Rs0w83dgnUxnE4IMNrGPhSHoHyEd1Yh6580X?=
 =?us-ascii?Q?TJ2MBwiCIGJF38QNqiPtvB/ANnk4KJZctSOPwiVA21hjTlpiVCYSkjAXn3WT?=
 =?us-ascii?Q?oWNFZshsPPYEulOqyMMsUcSb3BH0DwaIRLkyYNzw4B5VxibWwqlb/kqy5ImN?=
 =?us-ascii?Q?hIzup4j9TVcSU0+u2xnSN31c/6PG/5qGGaE/u8xcymxv6Hkv6IAbiRvmEWpA?=
 =?us-ascii?Q?2ICAdhrDg7tKd+dwrI8NLgeL9kqkb87U/y8XkQgOkuvQuVGdiTXixlBqjPqB?=
 =?us-ascii?Q?4IHJVridVQYDMsAPuILRIkIIdwly9n8doqDbcXnQAEDLFHyGYmvJBcx9H+Ww?=
 =?us-ascii?Q?0iC6Bv7wCBzaWqHtTj+2m3vGLeDhGZZfaY5JSzCU5NSdrYN5wq/3d5iQ1gdv?=
 =?us-ascii?Q?Mc2AyqO91QbkzX8XwVAVjQaHfartnJQXZF4RWeUw5xg+qP+KGBMSNXQNcDVL?=
 =?us-ascii?Q?Zjaf5XGjHOrC2pQYMZ7DNj7YmiAoYI8yg/YvTm791/xoOQr4fP4jwE8LHRDE?=
 =?us-ascii?Q?sGwKayWksjf13XyzKz3O0UoFcNoVm1Kavbq4rFx9ZBdiJCKCkRn+vVq1vHFR?=
 =?us-ascii?Q?Ha5ruK7aNmH5jqcDBOO7yDHGwHRqN8/ebuYhZH0gmG0dRP9LjaF/UbxEO1bX?=
 =?us-ascii?Q?uL5XY3HOMiq4Z67JZ6GkQ0ZUhPHx5Dhn0Ia/vka4VyshL3O8z79EMvm/iXz9?=
 =?us-ascii?Q?fQEW878E1Q6X2Msl0zHBkDtIxioK5OdArO7ZuVajhg+1yfcepCC/EPikzz2O?=
 =?us-ascii?Q?Q+7+Me7T0oPki37wUypX7b1YDH/FSViu5LddIWkel8pXr6pEQqBFenagHg3O?=
 =?us-ascii?Q?AfuKKJ6pYTMaureyBDNBLjGt7/jjXeQLre8ONOYpB4qL9qJD6k8qN3YPiQy9?=
 =?us-ascii?Q?CXU6nnx6lrlRJuoCX0iB+q7MWiK0Uf20gJNoA7c3wr1jM9y7iQUAxq02W2w8?=
 =?us-ascii?Q?kO0B2bq7SkVNXNWT0dKdZnN21VkGO3OorHiwkwGSMnUPnobj3QwVhkdaVbTp?=
 =?us-ascii?Q?dv2q3bsAU6PkqfhO6d4XtqvUTJ0mb77yAJ3gGiYvJfVQFSRm9ZjmW8PQ2nBA?=
 =?us-ascii?Q?rIyTOETfYY6s5LoHc1w=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bce983aa-f6a9-4a45-bb71-08de18b4fffa
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 19:38:01.4558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3C/waSKOdX/+4FlDilCaxjFMxrZuHdYBmiMamvfBZ30C4om/YV+WCWS6t0xiadTH6TU47WPoRaE6nrFme6K3HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9468
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_123806_508335_4F6A2900 
X-CRM114-Status: GOOD (  16.94  )
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

On Wed, Oct 15, 2025 at 11:04:20AM +0800, Richard Zhu wrote:
> According to PCIe r6.1, sec 5.5.1.
>
> The following rules define how the L1.1 and L1.2 substates are entered:
> Both the Upstream and Downstream Ports must monitor the logical state of
> the CLKREQ# signal.
>
> Typical implement is using open drain, which connect RC's clkreq# to
> EP's clkreq# together and pull up clkreq#.
>
> imx8mm-evk matches this requirement, so add supports-clkreq to allow
> PCIe device enter ASPM L1 Sub-State.
>
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> index ff7ca20752309..6eab8a6001dbf 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> @@ -542,6 +542,7 @@ &pcie0 {
>  	assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_50M>,
>  				 <&clk IMX8MM_SYS_PLL2_250M>;
>  	vpcie-supply = <&reg_pcie0>;
> +	supports-clkreq;
>  	status = "okay";
>  };
>
> --
> 2.37.1
>

