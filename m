Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50837CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQz98ARWz39MAHvpD6GXoyQImXGNx1AH6IJWaX7Lka0=; b=dz66r1EXtrLkgofjlArkhYCdYw
	tKFYd+rqWbfzu9tHW38DXRZ6Ys6jFEGSAYX/WtLsXTCPG/Xf7qZbizGSpg2LzafX2+oe69Vi/GyGg
	8U0MQAY1lKOsisInv6NkNHZq1rQxSo44TyplN7EJCD4aw8Weq9pqi4/7HPfVnrnD6YbpPxKY3B1J/
	yzDL70AkB7jXxF81h7tMs+z0zwO3eHYUcv14tE7b5Q5a7XxSnkwqiGowxMDRgvhS6g6cSl8YDLEmB
	g9s1wON7AjawxY5Wc8mSUxXTTvJvurrBh0SoR9AqNfRS0VkwUEPX//Sb/mbLlpimJ/rqVppwZc/q5
	lqlyfhlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoR2c-0000000BICJ-3w8t;
	Tue, 19 Aug 2025 18:26:38 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoObb-0000000AvwA-0udE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 15:50:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hyG4ZAMFjCJSk55VvFngRqisbgpZ3g8QHHilH3z7vKm8ofZg4POxyCYXQHXO/BGqSzY7Biet42SxPDAr3OBnkAoqUwGsd5akHxSzYXvEqpm3CyuxiBo/76xS/xyvhGHlsL2hsOeFcs4iTjzku282SPgIWJUyzwdxRP6/EotX4CRuD0LQGyNg7j5H5bEvgEDI0+kt5qOg2ZXhdSwHHf1dLNnAiXfdV3PsUxwQznuI94CYvwGQL3ZG73w6cqLtf2npVX7fvo/LhZxo6ucIMWXKEG24LK+3v2U/6R6PBwX4CF4GScpxezLkvgu3KAeRmC2qtz/b3VlI43btAbK1cZulew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQz98ARWz39MAHvpD6GXoyQImXGNx1AH6IJWaX7Lka0=;
 b=Xbing3ziIcMMVC6l6xVKFgBaNz4HHhEHUCUmkQWhdsmmWdHfTk6RlN7l0ccSD3nzycjhJrWrjPgzM4oa2iUjcCswKXnH08gdN7B9gNVAzJs5y/2tG6O8UVxLXs8/SHnitBY3SnSwedINo7aVYwsMUwHNZjnRIIyVGoL5sYPZcUH3RmBafRhTvBMMBdxKy3Vqmi7jD2fF9UdHdZSH3F03DpEK7197Xt0UAAGbi7IwznZV6ENSkF4r+n/JhpL+QML77716KAM0w4WvyvL/kccPGK/T9VQRTX9Lv1C9uUB9nYZyB9oSZ6iQzXeZldTCGCBvN3qWyxWzbDql1MxelW22FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQz98ARWz39MAHvpD6GXoyQImXGNx1AH6IJWaX7Lka0=;
 b=Si0+e+cT2txpBI5M1lXImscQeolMSUogXcsQqMsFUOBpK6B06ZIsVEi5BhRKtbO4tZwSdfuf0XaMmuyJmsHMEsuyDc0muT3Y8CaxO8DSOyegUM7Ns4/r5Syzk9CaQUIf6erZX65u3IYBOh0AzKaShC8hyxp1LHBOHy+fZN0uOaNU80FHw6rh5X1/hl+qIHD4kHyVuV1LorsjWD42N/ooixWmF4UEKWvg3Va9tV16CD+0eaaBJxuzHdw+4XTqzuQ6g9YJqaZKT2f6xUtaP+qyaCmGaeb5zq51QNPLim9NuIOLjYNOhqd5uGVTsmDNhkBpsIqmcmspJcpCz6ZfKytuyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB8PR04MB6825.eurprd04.prod.outlook.com (2603:10a6:10:112::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 15:50:26 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9052.011; Tue, 19 Aug 2025
 15:50:25 +0000
Date: Tue, 19 Aug 2025 11:50:17 -0400
From: Frank Li <Frank.li@nxp.com>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx95-19x19-evk: correct the phy setting for
 flexcan1/2
Message-ID: <aKSdOeeS04waVwTg@lizhi-Precision-Tower-5810>
References: <20250819-can-dts-fix-v1-1-e43e7d98a544@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-can-dts-fix-v1-1-e43e7d98a544@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0262.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::27) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB8PR04MB6825:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a0ce2b0-dfea-4198-1249-08dddf381d2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+Dq03VeiPlw4hUp3bhiaqc7vVq3RZaWgkxnLNLZM8YP8gFMruUVVSZmKv7jt?=
 =?us-ascii?Q?m6fH4mmPt7dh7eRouDO0UbwVRvo39zqhBHLnbSRinKPGnkOW2ipJH5XDVGRi?=
 =?us-ascii?Q?qym5GJ3yVQA0TkrOCS48gU34fZRLjjO5kinGlrbHnLowvEceHK4gWfRXAD2j?=
 =?us-ascii?Q?bNejCHv2r5k9+MvFu5rSas2Sdop5zM8oed5pYa4wT/913KGYOaU9MTGZda1g?=
 =?us-ascii?Q?VuZ6zwXiTxKGyMOa2KskgqkdR2ER+WeCitHjjaW0hGsrntbcWbhsm91QeNSb?=
 =?us-ascii?Q?NEWyR0gDRoY0aD+WOeEmYL7qzPWNdhX2qezWlfNFyzXCp3yuovJCsZ1j3OUw?=
 =?us-ascii?Q?/B0H3rACMTENcO4/o654ihAc2xSg+zEyvAl6fJABm+awD9PzUekNuIc/jQmJ?=
 =?us-ascii?Q?2YJ8zSXKoTEx5No+ZuUDLCZnSzl6C9sbhRwKCHJOA/35A4LnKWb1j+3t5Gs7?=
 =?us-ascii?Q?mA92JF0HQrxkGrkOsYMqorlz6HOIdjrYbfjTsCGFKtzrvduByKL+kBdIYWGA?=
 =?us-ascii?Q?0t/z2O/vpuBVtcbWHljYAtySj0xvT26s1zTjxBqWmAjZ24m6bgOFI4MUzjz8?=
 =?us-ascii?Q?uYRnetxSKRtUvDmsZ4rXerf83KHDGs1OWviHB4a1u3cPwg+elbm0iDjttZA5?=
 =?us-ascii?Q?OPfoi9EPHOFERwiS/+MICltAQBr9Q5LbxbYzxgrGd2SZb7C/gh1lVkwvenrH?=
 =?us-ascii?Q?7coPv547zJRkspF4zIxkJwgOJmFRzjSrZqzWidennoolgVe5h2cOo5LU+0DJ?=
 =?us-ascii?Q?Dm4nDCgGhhT12mJo7/y8tQPnuIyfuUEwW+kRDUWc3b56cayS29uLnA8f4XSI?=
 =?us-ascii?Q?TJDsmkUGrLE+zuRRJhrpw7c5mh1bflBSF4xM5ZTdC6DJ8KGyW4sHzqg9uM3R?=
 =?us-ascii?Q?YljQnm5p4RKYmA9hyxleIvZvHbQHLZs3wliCdWYnJBpcOj/hJ4nasD8Jp4VI?=
 =?us-ascii?Q?l2Ni0Cp2P9WK6ZoqIoKplbIVvc9i3Rhmczhl9zJwcxJVvOf7Bi2fOBaltwpa?=
 =?us-ascii?Q?d+Zv8IiBK0UNxVF2Z7622V8+Py8AXWmJdaAa2O1B56iwcGbUhMXHaS5zyXyX?=
 =?us-ascii?Q?fp+QZXixjchfXjxnCJ1c91FJlmbsVKFrQSwM5vxgDRzwE5RjOW+ez6Rf1qYB?=
 =?us-ascii?Q?CGczlmz0namKgQjQikvoT0Yc0iSMMp3+psVGQOLtdeLxDs5T/Z/HSqWtZf28?=
 =?us-ascii?Q?39BWiRIlpAQncWKDH7t1YSjSSXpGH0h98cDZNKluInMAUvIn0jJpiGaC4wUX?=
 =?us-ascii?Q?NsLTboKl0uTGwT2onQSlj0UuCU6fkhUQNo7xhMRilho54WrCLNoKdPUMgXab?=
 =?us-ascii?Q?ucu+jqnfZJugGW7FdPhD6zjC7yHd46pOwEx/UcAv3L4zdSsDcPkNn/yfoAb5?=
 =?us-ascii?Q?Gz3vsbUb1YIp8HkrH/wKSI/eFbSRsO5Wrex1xWVOwwxguE3gcP8sqaE0zIou?=
 =?us-ascii?Q?+OC33SETOg7TGtIUUtX6kXHmMqHw5Nvl90BRDAHzoydDTWlX1pz4ttrrEWG5?=
 =?us-ascii?Q?JPShSaue2UDRLbQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(19092799006)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r8VCHLum4JML2XGsWVzJexHKWlOgprW0qhgehLXeO05f/kuMrDxas3x/qKJl?=
 =?us-ascii?Q?cFRali36o/9jEFmOWkwvj7yB6uyzwldLBKUZg+JdVajx8tdXzis6822Eyv8v?=
 =?us-ascii?Q?zW2xyCbSWgFQ5R33XY+6FniifrpuxwfLRnmAphohlMUK+Gyj8HxZiHs0y94o?=
 =?us-ascii?Q?4C1I/vf7omWMDUvkEsAueuwKeqyo4p6R7RoYeje/WP9xKxtc3+/9MvY4AfS1?=
 =?us-ascii?Q?k8gKTORWUxg7ulrMOZ/k4WvpO66qDOEEvXpBdONWXBwIlbywTM/bOJmuIeus?=
 =?us-ascii?Q?72j6dvmEEFZmth+dIfo0QmaDNrHDpqaVjcpL3foIy/949RRQmSI7LWvPixZD?=
 =?us-ascii?Q?gK7ypvQWlPXA9bWzuyA9cF3oXkypd8t4sToPVYjonbYnz4sDUiPzW5e70Idu?=
 =?us-ascii?Q?DanhkZYe5jZC0EKS9YlWwMy4nehbWRV7e7hxTMz7jK5xUV2+OEb8j4M77ipL?=
 =?us-ascii?Q?liEaV08ArxAWt03ZJqggfQjHEhOayxOmFqyHmD0VmxZIi9BKjSJErZCy2AtD?=
 =?us-ascii?Q?TG8QaUsYhootpu0i8bm0idsb4OLrpYRcNwI6p0+YwqGDf+ixuuHkjflUdlgT?=
 =?us-ascii?Q?rs+A2CFAVbqJsj3d9tBlCZE2m9tIGgaSFAp1mZg+TknN57+TedJHZAPcwlRl?=
 =?us-ascii?Q?ueZ5+PsrEIbZZ36Nnt8T9g2pHBHkodY7v4aOOkM7ApScqR7Z4nrfEH6EJTMn?=
 =?us-ascii?Q?qy3urmOip+s8K7vdUSPzoQ9tncHe5jqGEvqo5xQW5A+FNjFLqvKX8iy+ZB9q?=
 =?us-ascii?Q?1P4jn5COXFkuEuxerZ3HurjMkBFnRGvy8vgwMrAKt9FFDl/4NxjY7a0CyIAO?=
 =?us-ascii?Q?J6nZbTz77UDDg83EswNK98NASxgZVk7chMZeBuQu3HvklYtcXvLfagW+N54V?=
 =?us-ascii?Q?HNjBwa2ggFFJhDTLUknDKk5fMgZttIbKDm2oKlXovFarJef7LomUP1EQd7IN?=
 =?us-ascii?Q?tKauAjtNTCdeIdNG8EToasBVnJ+9ZbbrIpdhiXmJ9g/MAsF/eBHhJaPbtJ+6?=
 =?us-ascii?Q?AIeBRCg+p1Q9UoE6mjkK1BEEhM6/qyal69kzJQyG4K1o5nwfuJ+y/f6fIQcA?=
 =?us-ascii?Q?EAZTXS/7eAC1e/BWP5DwoIVU7LkgAgRwc7nWU/y6Zk785XFZjjzigTKCAqVS?=
 =?us-ascii?Q?DW8ktA9TjwGM+QIdi6ak4CYSxSeRRVS2fA8K/mnOHqjuEH1ISnwsb7JRD10S?=
 =?us-ascii?Q?HumrW1IM7mKR8bSMFHi0zl/Dc1881VCaMMAgnH6VJCnmObCt4qiAmr9WozIl?=
 =?us-ascii?Q?0lN0UILLlImXniijWnbkrkwegRIGSBR9r7PpzvRd8+9ZeedDBD1C1TSAn8y+?=
 =?us-ascii?Q?ljxYeoT6HU8QeSpo1IF6vRuMj9ZtphAzsNegD+IpSTN6XVZLImnspVNQwJaK?=
 =?us-ascii?Q?/oMDzu2SBkdw/2LSn1hbE29ug1eSStfpuaWFLJLh1bYi8Gz4wwrr4EZ+eh8P?=
 =?us-ascii?Q?4xF3BlZRJrKv5c6rINa8mWqMe7CeDj01MABJttWCRflxqffw+vghVbYZDHuW?=
 =?us-ascii?Q?NS1Iu5gzjaWDfmU9skaCcq+8Gd4615inplcyupVYGZ08tJ3LeH4+uyzULnT9?=
 =?us-ascii?Q?9v5x01uQwtnzrWlcqHY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a0ce2b0-dfea-4198-1249-08dddf381d2c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 15:50:25.8696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8v77ktTkCxYOFdlElBwjJy5pMNIFsKM0tOAF37N3WIE8j1mLeDSvGU1a3fk85jBQNohsWb+6Q1oLF56alJg+oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6825
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_085035_257381_5217D9BF 
X-CRM114-Status: GOOD (  18.54  )
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

On Tue, Aug 19, 2025 at 10:43:37AM +0800, Haibo Chen wrote:
> 1, the phy support up to 8Mbit/s databitrate for CAN FD.
>    refer to product data sheet:
>      https://www.nxp.com/docs/en/data-sheet/TJA1463.pdf
> 2, the standby pin of the phy is ACTIVE_LOW.
> 3, the phy of flexcan2 connect the standby/en pin to PCAL6408 on i2c4 bus.
>
> Fixes: 02b7adb791e1 ("arm64: dts: imx95-19x19-evk: add adc0 flexcan[1,2] i2c[2,3] uart5 spi3 and tpm3")
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> index 2f949a0d48d2d8066388884703c3b3cd678f16e1..9d034275c847606919af8ee4a80a00599abf4d8b 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> @@ -80,17 +80,17 @@ linux_cma: linux,cma {
>  	flexcan1_phy: can-phy0 {
>  		compatible = "nxp,tjr1443";
>  		#phy-cells = <0>;
> -		max-bitrate = <1000000>;
> +		max-bitrate = <8000000>;
>  		enable-gpios = <&i2c6_pcal6416 6 GPIO_ACTIVE_HIGH>;
> -		standby-gpios = <&i2c6_pcal6416 5 GPIO_ACTIVE_HIGH>;
> +		standby-gpios = <&i2c6_pcal6416 5 GPIO_ACTIVE_LOW>;

It use go though CAN phy.

Frank
>  	};
>
>  	flexcan2_phy: can-phy1 {
>  		compatible = "nxp,tjr1443";
>  		#phy-cells = <0>;
> -		max-bitrate = <1000000>;
> -		enable-gpios = <&i2c6_pcal6416 4 GPIO_ACTIVE_HIGH>;
> -		standby-gpios = <&i2c6_pcal6416 3 GPIO_ACTIVE_HIGH>;
> +		max-bitrate = <8000000>;
> +		enable-gpios = <&i2c4_gpio_expander_21 4 GPIO_ACTIVE_HIGH>;
> +		standby-gpios = <&i2c4_gpio_expander_21 3 GPIO_ACTIVE_LOW>;
>  	};
>
>  	reg_vref_1v8: regulator-1p8v {
>
> ---
> base-commit: 3ac864c2d9bb8608ee236e89bf561811613abfce
> change-id: 20250819-can-dts-fix-62ac1d02c007
>
> Best regards,
> --
> Haibo Chen <haibo.chen@nxp.com>
>

