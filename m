Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B769EDEBF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 23:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lfkqL58s4EZzp0Tfgg7MuWVM2zzgN36t2K5sUGyGrH0=; b=1B/ueCuZ5JRfZ6oVNjFCrH1md0
	xat19C9009S9tgVe7Aj6lIV2U/OvYfsmKGCe7yAah0+V/FXPwNlcyiTZU+c5ThyRMiDxwpRao3elV
	WLale88zWV6p7jR4YhLQL/4eOm/azgk1aqUWjbxRS3tPXHb8rMVcdqEQvuihqyuxrrtXvE8glCYEQ
	rcjrMW/4pQEjon4G4Z8Y2/DvwFZhGyHmlngfnQ4V07AGWVE79UxbkK3vzcmye3vQSQ/8bYLbF1S6u
	pQyGuf3dlB1aDS4hHGLAJ+QwOfLAisLKjUlTWQAV4QDvoOpvkZMzDgJkr3Luuaq9Bno5oZLTuwwEG
	HwbBcsnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxZU6-0000000G6qo-19u3;
	Tue, 03 Mar 2026 23:49:02 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxZU3-0000000G6qN-2Z7i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 23:49:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DzzF1UKiGpTasj/PzXvax6iXEMFDNWzQHYuXZSKQuHeVTywh+Mn6ktnLP/K56TbCRixjJEh2NRuTlLPq4AyzYGvi0NL+uYlM42iNgK06cBqDPOxxQwangOapCqEKwRFDXF7sJ++aJPJXQXqjkJpHkfvAwEYAC1d5SlouIxbjAtcfQrrctgUogslccFqrv18Jho8MLhikxwVYFh7cirPPcaSUxBhWrNnlaASBpedN8f5FhNWZcl3ffTkYskzASpoXks8R/RiVL3W2oPSVxNmmWqFfa5Szmry2Kg13xF3Y0nFjBDhza0fmSuEmXa/AmrRJJcj1PLGcD4+KUif9rcBA3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfkqL58s4EZzp0Tfgg7MuWVM2zzgN36t2K5sUGyGrH0=;
 b=Cr/QcXRNbnTym125bq2H6kUO0jsZGF9iHxy2A/NglSijsVXNPTFMn3cLp0FDUEvOEES2PUoDfhMFDQNUoD/jPoA0it2USaJZjrBzZ+JYtAAzBOIfpWdSGq8DTrW5Rj3ldOsuiKAwfcpM6TSBZ9ZXlx3ZWbGEdIAYvD74LxX67DucyUqLJKJgduCmkZqp1le+ep4IpLdylzKVem1gQIoSXCU+2Q3OWGwr/BTTZCsmrlHZVZqe5sZogf7Ms6buRfJ0mbBSxN8vq0vcFFM/a9OzYyAuJg5oToPT07Xpm5bE0BXiFRbFA9q6yDYmbvBVie6NU7oOBu8aUEc/JmuohaSc0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfkqL58s4EZzp0Tfgg7MuWVM2zzgN36t2K5sUGyGrH0=;
 b=nU2Xj73rZvWlWP7jnaM2Ux9S8pA74lBcJ5XjHVrksC+lu1SISP194JYIAzstW6T17V30Dj1gwgijuAjlHedymRGHZK0L414OhTEE0LIyN1jkErx0ZOfqTw57WRKhphycpb2MXWDSbJvEWEx8WvKsGuovigt7Fh0KdcmLnKzEztcrZe+XYGtyHHRSUiMOZcYe4C2gIAwAuD4herA3thT/ttE72yhW3AJdxWU37LkUl5ie0EkB2gKj0B7YWkj9LSITaoZt62eTnPw45gjLKx0eE4Qjg6L2JKfJeT+e5CtuImrAyzyQYiXXn8RbtLDwHOmg96Yl4T/mNnsrShU1xHrtJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB12255.eurprd04.prod.outlook.com (2603:10a6:800:304::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 23:48:54 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 23:48:54 +0000
Date: Tue, 3 Mar 2026 18:48:46 -0500
From: Frank Li <Frank.li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] ARM: dts: imx28: cleanup all CHECK_DTBS warnings for
 imx23 and imx28
Message-ID: <aadzXhxRrChZopJO@lizhi-Precision-Tower-5810>
References: <20260212-imx28_dtb_warning-v1-0-696bcf1a992a@nxp.com>
 <177247032266.2112985.15137761878583862320.b4-ty@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177247032266.2112985.15137761878583862320.b4-ty@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0110.namprd03.prod.outlook.com
 (2603:10b6:a03:333::25) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB12255:EE_
X-MS-Office365-Filtering-Correlation-Id: 48fcbbcb-1e7e-48f3-36df-08de797f6db1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: F2zy68JF7lPVjWwIZYuGSoHaNFJYBj5s+jWGmGOLL3d4Uc9vbWCePF0zBQwtjdufl+dGPHFedBvfiAiyAtNLPV/TdGJmKUJmr53uzYv4cXQU900sep++z77sLOHA2s0BMI9R3wfW+8hdIj/iJJDLmjbWUxfRqEjF/sTm4Jg/oPkYjTdTvQahrQ6OZf/acJeWLs0yrW3D554b+WvM8AGUh9FnYVSEWSn8KdUrrrqQLtq7OTD6MkDnrKhudtJMK6Wu8VbJGwLTnmYeCPPehIYbEA427orNK2dfTuR3/EzWlM1/XryherB/sHDMLt92ijif5xV3kUCwr5htvXcqddjQTHVro3+yPEFUke74qgYqASK7OLBk8ug2WFmtDcBu6XjsxaPtQqd+odxvprWurxmiFLmD5LDGG/zIadyu/R0mj+Iaaew4ugJMUPpNBNFfwvUSP2Gjcw4polBDZwVtBEtkppTF9I4vJUbB4CyxuPN+lgfyGLb/lx5lX2g/5CFmNRLQ3jAAdm+HmhXDgyegq6mk7qPfKlAtmUdWJIpsoEuhl5NGiZf8uyjb+FvgSW8sk/LK+sw2JEFKhX99s2X1p8YNC1Ts60KKtMHWUNtVWXIm0pX0UvT3cCGcT1QApNjCzEEXb0pc77r2QAEh7F+bXfXeYulKJ2vyZkFEHIIuIwb4Vg7vj6cxjjfhCy+AS+1HnzS6UyBs0lKbpM4kHGbnu8r95lTx2vOiE6nq48Kua/WBdstRiKdOsm4ybpxip2u6za2UM6eHnR1L4FYP/Njs6oYzKPuTQChe9AEyqWIQnPrJgzc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pCKxF5VoCC8fqK0Y+v6siGAdcsThrtp8gucXi0AsMfAtDJy2iaVkDZADK+s3?=
 =?us-ascii?Q?Y/32VuxCQ4YkLOwuQbI5/0vp/3nDw1lasPZEUwbXUgbT2jBKHrtJlGCO4Iq3?=
 =?us-ascii?Q?SzpVkMdfUvGSG7uRDcPbqFZ/4VFx0Nm+amlhw8u0SiT3/TWojYFiLAlveYhg?=
 =?us-ascii?Q?/M3culG8z4N5gMfdPgyYvoueVPFQcNsqUq8Sy6mzqtQpClHYku6eyt02l+f1?=
 =?us-ascii?Q?FK0da20/0U+fHfyi+Qv7ivd3YUs3t/7d8JV+BkKJ13W1ieolknl/5pAwseJ0?=
 =?us-ascii?Q?C5hG8w7BbTP9GVQIp/df/SXJpoguY85F2LQtSza+bWDA6UyXZqlayvnffcb5?=
 =?us-ascii?Q?oo5KGryyaw4l3xZiSLJESeMXd7y2Mln0X40kqwWqsGWruwgrtHuw6HYwA/2J?=
 =?us-ascii?Q?sCkgJntCih10xrbV+YtUmjYyW8GXU0MLyuQe3ofM3kvD+h4RlNmYkvaggLsg?=
 =?us-ascii?Q?TCr9rIcOnXW7d4i6ry0hFEK+CfpbUIIvkSXfh+Zi9J7ZjhOOjePNVkHibtL1?=
 =?us-ascii?Q?MeBcydeFCJ4Bk2GgPVeb9t2AsEfyg6ZTXbUei8BLqPKw6+bn2Z6ktkK4D5dr?=
 =?us-ascii?Q?/uhetVnE9hneJnwLFp7Ln3leOejPsF4j8OKMqKAatL86+TJaBOurtUFNVcop?=
 =?us-ascii?Q?6y4KLfYl+dOYBhvBH7KAEWZ+a7E8yRmoGJ/rsykjWwZgL9o6EuVXT8V+HORw?=
 =?us-ascii?Q?Jez0Il4l/1PjeIOzmOBUsYXC5fmb3xBEFctzaF+k9o9OiVeI0r+DEJsRudAU?=
 =?us-ascii?Q?GAWmWVNI35akWPovKZerBdcBq8RJjYgfgmLRPtsm33F86GP6SfoPT5aikL3c?=
 =?us-ascii?Q?F2aAECuI3LsBI3EYlf7sbOF+VSmPAqdIj8z4T0lcvNZ3zSvwLoyGwCtq7OZr?=
 =?us-ascii?Q?xHtdBGxxD++p+pphdE+LzrgLuwXLvEsp6L8BcWW/dXNvkn/it2g8Q0fD/9FS?=
 =?us-ascii?Q?jerp+qmfiFsGqbV6PVlNxNvwRi7yFkYjJ78ebYa1b0JBfUb+ui+SJc9JNEHM?=
 =?us-ascii?Q?rYZPjNsLFWAauvEQlkQjv1xNFuquHOTBXqs2vKvGylcO/abJdhKEALFHU+Rl?=
 =?us-ascii?Q?WyZ2921tltUDP5eZsXcn7Ig8HpPZdKTCt6r9/VfqkuWWzJ8BewgurTY1FQZR?=
 =?us-ascii?Q?rIfiGOgenE5lnUQ2MAZSMe6s0rsYJBDiyn3rijdulcXovM/rb7WyefLVhx+B?=
 =?us-ascii?Q?kV1JaE09See4TfLhskeDm8Znlgy8R7P2LT0mUT36m1rO03uPWT+U9tr74N3G?=
 =?us-ascii?Q?vlQ3jWJu3VEU2vnN4aELp6j/xKQbrrCTwJOhTTcGMDdB3Hs6FbJcaBqz/kfh?=
 =?us-ascii?Q?Ri9fAQ+9ehzA5UUoPswoubnY+FFt+z77289JaIMlSj+8x7gwyGvH0BxZ94LK?=
 =?us-ascii?Q?UeUbhyPhGe7YddcwKmWEa4aQ88kifF8nk688DqTqzzvQ2cFxhnmaGqB9Q5PM?=
 =?us-ascii?Q?Z/946EFs+RfVyBg1mWGNCeEPxefhQN7Mg2lT5uR9w1Q3jPSi+5a0kb4cP8LY?=
 =?us-ascii?Q?O3JyGn2SqK65NrjKFYzSeM1DsUUEqWWITYd3TOOKRU/Z7puDfmwxLAOeVYuH?=
 =?us-ascii?Q?R9kelwBFEDY4zLz6FDjQm4TziV69P9R9I8XIBKarQVYjddf+dQAAmr9mz1Wl?=
 =?us-ascii?Q?2d8ghvh0SFq7rXgHsrX+Zy/ri61CmmE9MAtlFZQ3Azwg/MuYM7HUoIjtsY8G?=
 =?us-ascii?Q?8nMYWM0dcjQmCr6Qf5Z2WSJ8GaDZO3u0cGgW+YpuejIyfMn0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48fcbbcb-1e7e-48f3-36df-08de797f6db1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 23:48:54.2987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nZs10h53ontk5KYvUk311qI1ZIQfV21LRBOXB02mPRPi/eDCGChh5CmuyzFow5WPcYP5LLAYbklzPvFqCf7TeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12255
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_154859_690612_767ECE71 
X-CRM114-Status: GOOD (  14.61  )
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

On Mon, Mar 02, 2026 at 11:52:02AM -0500, Frank Li wrote:
>
> On Thu, 12 Feb 2026 11:19:42 -0500, Frank Li wrote:
> > Clean up all CHECK_DTBS warnings for imx23 and imx28.
> >
> > 66379a677ad41 ARM: dts: imx28-tx28: rename compatible to "edt,edt-ft5206"
> > Not sure board use exact edt,edt-ft5206, but it is comaptible with
> > edt,edt-ft5306 and edt,edt-ft5406.
> >
> > 6346f7ecad97a ARM: dts: imx28-tx28: remove undocumented aliases
> > Not sure why set these mystery aliases.
> >
> > [...]
>
> Applied, thanks!
>
> [1/8] ARM: dts: imx23/28: set #size-cells of NAND controller to 0
>       (no commit info)
> [2/8] ARM: dts: imx28: add nand@0 node and partitions
>       (no commit info)

Drop both gpmi related patch because report similar problem at
https://lore.kernel.org/imx/aaWxiERQ4u6IhO7Q@lizhi-Precision-Tower-5810/T/#t

Frank

> [3/8] ARM: dts: imx23: fix interrupt names for dma-controller@80024000
>       (no commit info)
> [4/8] ARM: dts: imx23/28: add "led-" prefix to LED subnodes
>       (no commit info)
> [5/8] ARM: dts: imx28: rename gpios-reset to reset-gpios of hx8357
>       (no commit info)
> [6/8] ARM: dts: imx28-sps1: remove undocumented fallback compatible "mr25h256"
>       (no commit info)
> [7/8] ARM: dts: imx28-tx28: rename compatible to "edt,edt-ft5206"
>       (no commit info)
> [8/8] ARM: dts: imx28-tx28: remove undocumented aliases
>       (no commit info)
>
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
>

