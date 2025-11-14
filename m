Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92464CE8D52
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m27Y0k2933HWAEv8kcnWQ5B0Y5Zj5RvtHLZ7FVdEBdo=; b=rqmpdd/FGZhpgYMU9AV01xyMqg
	tA8klPPnnilH5HEyuGBYjw6ZyAyBhSnatIW7yBg9t2BT+EVbPa0imslvWLRaEZhkN045j5nXLLBei
	TnT1Yl7jYYOxG+rbgiVuRWK8lQ7t3S7fnh74c+lXsOkXzf+mGixmrAIbOVu4EVTi2sOEVpbM8Y87z
	KvDEdg3hmF0arMec0aAD1wrNoYqx9jQIwA9LMF9dRGvrA0m8LRsgIjSyCI1a51Og5QFKWQeQDterm
	0b9zXUVnVejtY2er13JlZ22Um+V0Xc3ooVV4FnIDwFqU+csT4CK9Lw8Iu0E6z7zScafPhsB1EuOXO
	rHlZr8Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwWl-0000000Cj6F-2988;
	Fri, 14 Nov 2025 16:19:59 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwWj-0000000Cj5t-2yUb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 16:19:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gr1ydrIVYKa70IGUkX90CpWqrFfQQPFLPFanc6ffIJtnnTsERepcazBa44wYCwitlczG+MzEMX17/9jB7X77HvhF12kfwPM7p7iisOvlieJpuKgczLatBStvf2WGUNwzJ5UEzac72faMyxjUba2D3x9hoVwGZNapLbMGNlHNjqGTe+Hm8GAzU6tHi9mBgkDgjVTCHrNiUrAMheNmbuaflio8ydJDx+8MmMQOnXCUSwAl7UbWXlcSR5xrOBa7vnBNYNtXHSGT5vPdQFslIVQrrRfyvAc2I4xl8ft7JuAveI6M2TKZDm40OU25eurPHcqWZd0tRDAS17McUNu0+WVgeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m27Y0k2933HWAEv8kcnWQ5B0Y5Zj5RvtHLZ7FVdEBdo=;
 b=bEB+/tDsuWQYWgJ2+OF8PhHHOGB0okLdRZl3y5SG1lsnVaCbkiDk7z3+kcmTJ3Q9qhFck3mxhRMxmexkhIfOCylfgUbJiQF4yd8e+emmsqmYfC28chHPzgvbhlqG1ZEHuqv231UywNSdU6meystYSb44z9wUXjyMDCYmnnl8pzdErQPzqI+2FaHkzVlynwXS6A0Gh+TTkUYhijsOYq7wLd8J8T7hfcA7SJPg9N9MUz4hsMtOYL4A/Y3lVarYkhXZ+g/lU7+W6HiR9y/rTq3+t8rKze6s7rfRUSCBkpvraLVueNv7FLwb9gAVLbFqhryZ3898N/XddUniAQC4Ie9AlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m27Y0k2933HWAEv8kcnWQ5B0Y5Zj5RvtHLZ7FVdEBdo=;
 b=Rh1WNux0TY744GIz9QZVudR7U8I1v7ETNQwD/GG/63JIX0fIr8yjGHPv/WvaEfLhpi7320MiDQk45w7XitjdFOopmWIuya4WTy+4UWS4kgk25AU/AhWDfH9LkG8uAJ28lqKgmD4NDlDiPeB07pJhtICB3kXCyIBSSZpJsDTNpr6K8UFIaOLNjiSJ8J2s4ScP7vlcL8ae4sM0Q0i5FU84hFMXKOpOPaASmOMElwcuu3J0oEOA98qs18gQ7JiYMNZ6jtzebOothnhwlBFMSVFIE+SDJZq+3QWmXFZtUrkEIAt/NzagxwDvlKjPofz8dnniHjEY1vWlBxpKhj0pmWAaBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS8PR04MB8818.eurprd04.prod.outlook.com (2603:10a6:20b:42d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 16:19:51 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 16:19:51 +0000
Date: Fri, 14 Nov 2025 11:19:45 -0500
From: Frank Li <Frank.li@nxp.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/LPC32XX SOC SUPPORT" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/5] ARM: dts: lpc32xx: add bus surfix for simple-bus
Message-ID: <aRdWoQ/vPplF0aQA@lizhi-Precision-Tower-5810>
References: <20251029202801.3963952-1-Frank.Li@nxp.com>
 <af66cc8a-051a-4512-9a02-468b17550775@mleia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af66cc8a-051a-4512-9a02-468b17550775@mleia.com>
X-ClientProxiedBy: SA1P222CA0086.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::27) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS8PR04MB8818:EE_
X-MS-Office365-Filtering-Correlation-Id: 060bb8eb-98ed-4ae8-d30d-08de2399a35f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6Atqi+AtocWnPvOPCn7mu2mgVqUi4Bdmwf6T8o9M5dPVMy2BD5Nx5HGgCLI4?=
 =?us-ascii?Q?rfXgrJWM2Eghxgioj/UObfEYndjiOlmbiMytEUzUA72KIK8qzxnNEbHPGXwd?=
 =?us-ascii?Q?DvIS4rPHWf5tm6mUKCzvlxom0yhkJo4Potu+E8bAx6zwy1nkgt/f4HQe+WH9?=
 =?us-ascii?Q?hoYZ1HgB+oS/c0JmF4s7GtrBKYKZ0wK6tGeH1ZXHFEV0Zc2wuFn3Z36qz63p?=
 =?us-ascii?Q?WsUuvdPvZJl8L3mQyoXvc/MtGrfOY1Na5NVZZIuC6wXEt70N1gVKX+riD9x2?=
 =?us-ascii?Q?RtBUVseJXP3keEGOx9ZeOOk3HJGxCgGo/9U92ZzslN4pepItMdxO3TOnI3Zg?=
 =?us-ascii?Q?5Wbh4IRbuN+QfPiub+ByBoDVCy9sSrGF+VMbK1jmX2xelyQbwHkk4Yioi4ab?=
 =?us-ascii?Q?n2ghDDxhTgr1RLUq74uPvhQD+QUyy98ktYOTO0EoGfZ7SC8vdhDikak9e0Ui?=
 =?us-ascii?Q?eQc2DdVaYPSLLtzGrfrTQOkYCRKjMap4qKKb3ZAq44tjtdyuLEvmAKqg58LW?=
 =?us-ascii?Q?QZuz9Kv3ef+ioQKWphQsIoCJjFybwDcZ7SOyTc8mlZM0I0ke7Qmze43U+SYo?=
 =?us-ascii?Q?9EbohnDdrXFfrkBy1XZPF9lVCuCeYZjzJqANpGyL7QDQhIHA2aRZbHQLd3Na?=
 =?us-ascii?Q?aByoIexqyux0dGbj+MV2AAk/1mc2Zbc/5ojlGTwjBm80DiJCIVNnBf+9ULrc?=
 =?us-ascii?Q?3SDq/BkPHLZC6rDcOrcFG6HmgJ+zHj6xAy3zvKkI22fiq9iNYE8VSYHNCMD7?=
 =?us-ascii?Q?J09PGcDeOyhO6EUYc5OSH5rV5/BwDI7sh8o4U4DmolSal1W50fYX+2YfWZFL?=
 =?us-ascii?Q?KzCCe/pWYeN1WxXAIAUSCmDcyfwXcPIBgjR0AYyb2uX4uPYcTBgwT21CTTx1?=
 =?us-ascii?Q?LVwOlLq60nNfczuwQqyavnPL2cTQTuxmgV37Vy93BOvsriZVvA9BxKSYmtix?=
 =?us-ascii?Q?vQ7pZPjhi81aIz5qQD5mwAbCtQBBoVnNYle8A7B6xU0GJ9kqr75Fp+7zc9TX?=
 =?us-ascii?Q?BbJp4LxeratUpnr4KgOdotyTGt9i1PrGLSgY7AtPsRvpWils6O3RsyWPh/v3?=
 =?us-ascii?Q?7vmUhJkj+Lpww9G7HRh6hqWaSgaJlPUV/DXp3kLTRewGHG3APgs9Ggg3ruGF?=
 =?us-ascii?Q?SEJnM9hBYQN8csYI9XBttJyJ0v12vRMnFDcRmG2ZZHTb2iqCQtI3bK3S27uW?=
 =?us-ascii?Q?EaxbC8WrZh1BFYlDyAqUysTzgyjIVA/zVXaIYlewc8R8HKD/fYT/RP5XpInA?=
 =?us-ascii?Q?UlaNvhsajZ6gBsZTnS2e50n4/T+ovJ3zNl5vY39CZVrgUhKCcb0hCG40ntNk?=
 =?us-ascii?Q?A7Xf6MGF5pE2QAobZJRjJls4ULRTduicZLlzb4ytyuTufrUP3o2CcqcYdsjO?=
 =?us-ascii?Q?ykOHCnqtqNjouf64ZtgMcxX4vahHT3mExEoUJFqeAg1t1Y83dT6fyG4lVesD?=
 =?us-ascii?Q?Lygdj85iT1FZJoK+ImWHzeZiZ8FikENg0msvqd363eaekuJ7zGdF0Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DCrRvThBgwICCasbPMvd0CYgJzRarMBRrU94Zj85EGGJsokwul1Azv6EcBL5?=
 =?us-ascii?Q?EeEAN1DYWn5CyYqFFxAvnBdVs4kYdXS1s992pps8+hJ6NYSIi/kj0wEZf64R?=
 =?us-ascii?Q?yT5+yTsmjY5rTJpLKqIKUVRGcEcyD3p1fiI0RFv2T44UbwBp/aL+8nWPhuPo?=
 =?us-ascii?Q?KG36Lb7bJ3roswh8SK7HPRwdd6Aq9K/lngQpi80IqITIoJh/hDcnVOCSo00m?=
 =?us-ascii?Q?2nmDkTL0D9yMjyN6EzpvhwnbI6f1guu5zJR0bc1am7TuKg6PDLxUXVaFJZJ9?=
 =?us-ascii?Q?gktkhX4b3JOU2KxJRekArNXt/m4hQ4iqqjCRRf4wYES9m10vffrFPRsY5WMZ?=
 =?us-ascii?Q?RUkDLEfUrYVBOESUKBWD/uLkxPrFXVcm08A5SAeRlbDtSKHQ0rJpUoSkc7Sr?=
 =?us-ascii?Q?k24TvCKF5va+EgMt1s3ow2BMSeM8NZP4AKae2mHU3y7/8h7FlShyzYyNTEoh?=
 =?us-ascii?Q?g1QzdX76LTXDzjM8+QIvozgU03w/z5G3ODmr0e7WJ92/46QMNGfqDa9GEmP+?=
 =?us-ascii?Q?FbNg60xGqrxVb9qUpo8JWqymgXsSN0z+3EbQhl6C0JZJZTYo5rDV/Rvojmw/?=
 =?us-ascii?Q?/hSJr2jLy8AqK6P3zW8lzsk4FMBNbV3NXGDuW3QcI950aXlyJChmf9Ht8DVb?=
 =?us-ascii?Q?lvYTljojpr+mdpLbb5rTEqbvUUXY1Z7k8rEWcd4KyiYusTzImQ0Iul+11K3c?=
 =?us-ascii?Q?ZMnp6w8s1lu9b8nZRyWJYqrIuYoyp4jL8+GTSpvMpmR+yz1v4u58zM4iDuO+?=
 =?us-ascii?Q?C9lCbRCXxk6849IWOXlNe6ROc+4F00RKVm2mub+Aq1DYOKct2jaWqoAVfV8c?=
 =?us-ascii?Q?w5oGgqgPm4Du3+mZS5n7YL+/CRIRrtBH9VmbxbPQnjOQRch6a8o8Xc4nh39N?=
 =?us-ascii?Q?pSCp+vS2kfRkSPByZ66XnZUnU3Kg5alitSyHqGtNJOzTFnhWfNceQOJRLRbI?=
 =?us-ascii?Q?S81TtyNqzAEawf7i/vNhcIbbSkMWqr648HWil5vzSooq6oYKtua1Vnk7bt6W?=
 =?us-ascii?Q?+Y0h4D71wRr3kZ8vKe7AsclhJfZStYZblMIiZ055+tr2lSK8Vje2XQn8pI73?=
 =?us-ascii?Q?US5+c1gFA4ZHscrgHjEG7ekgWU1ETrKjtExMwgn9EOcINZRWCTJbJ9SqgUh5?=
 =?us-ascii?Q?DbPqD98lJNHYD/Ux4IIhB9IVpX3D7Qr8SNsO77rGa2zHw+uZgFx+PYUMtY6b?=
 =?us-ascii?Q?DneQc6PObHXN5Dhib29IDzZWXwwYhavbRb8wU4YdOMCgxp0+SNVwddgW3Hoy?=
 =?us-ascii?Q?tZaUseJrtLd+0P9rTy3YV6Sv+VArftrRTTetVOUjXtwO3icMxEx7u5egmGrK?=
 =?us-ascii?Q?hjBNWZIuF4BUtq7j8mVI11zBlqwb8G5u+A3HOGR8L1OrZc2xImKuzFupJHTS?=
 =?us-ascii?Q?ehuHR7KPXXRwugdjy1eI1FT38B4U62AorCtY4cAU1/8nfJhlWezAPlePNEnX?=
 =?us-ascii?Q?KfGLON0kuA8H9Or+OR40YeuzE+UEemQEnkaTEXWie/0vJ4lHV6vLNp+MSDW/?=
 =?us-ascii?Q?raiMYV/HBcaDWOFX3Rc2A+xHuxyJ24P9NScin2bl0/jiFDLafJ9kyao6nCmB?=
 =?us-ascii?Q?Xx9G8Nsgi8FOWzo9n+U=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 060bb8eb-98ed-4ae8-d30d-08de2399a35f
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:19:51.4531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qldD9voXO0JVbPB7sVSy+oyIYdlhWePQPKVpnrmtrVWCbq7LtIqwMQ4s3gRharHaWS6hHFNtApLO748RMzhmNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8818
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_081957_748574_59BEEECA 
X-CRM114-Status: GOOD (  21.19  )
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

On Fri, Nov 14, 2025 at 01:55:50AM +0200, Vladimir Zapolskiy wrote:
> Hi Frank.
>
> On 10/29/25 22:27, Frank Li wrote:
> > add bus surfix for simple-bus to fix below CHECK_DTBS warnings:
>
> typo in the subject and in the commit message above, s/surfix/suffix/
>
> > arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: usb (simple-bus): $nodename:0: 'usb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
> >          from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >   arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> > index 2236901a00313..9790b0a1d6537 100644
> > --- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> > +++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> > @@ -86,7 +86,7 @@ dma: dma-controller@31000000 {
> >   			#dma-cells = <2>;
> >   		};
> > -		usb {
> > +		usb-bus {
>
> Device nodes under "usb" should be just elevated, the "simple-bus" here
> was used only to group some controllers together.
>
> >   			#address-cells = <1>;
> >   			#size-cells = <1>;
> >   			compatible = "simple-bus";
> > @@ -307,14 +307,14 @@ mpwm: pwm@400e8000 {
> >   			};
> >   		};
> > -		fab {
> > +		fab-bus {
>
> FAB shall find its place in the AXI/AHB/APB/... list, isn't it?

what's FAB means? It is too short and hard to find exact information
from google?

Frank
>
> >   			#address-cells = <1>;
> >   			#size-cells = <1>;
> >   			compatible = "simple-bus";
> >   			ranges = <0x20000000 0x20000000 0x30000000>;
> >   			/* System Control Block */
> > -			scb {
> > +			scb-bus {
> >   				compatible = "simple-bus";
> >   				ranges = <0x0 0x40004000 0x00001000>;
> >   				#address-cells = <1>;
>
> Here "simple-bus" is also unjustified...
>
> --
> Best wishes,
> Vladimir

