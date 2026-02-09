Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34C0EE6B6F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 08:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gboInUYbdyhxKo27lO7q9QC8e/h2POTBxZYRuF7CkfI=; b=pSPHnUDG9OixGci8XnyJyU7zop
	NP55m6eEflfKUZJAR+/uqRl79gaw8i9fXt1EeKz14cXrq+ocj7zMcZNoyAj3jYdFAmo+SmhWTJxbL
	c7HE5Lntg8wZ5bxEGgs5SMeCOXLVb+DLV6sGAAGf7gfEMm7uf9uDxZODu1OM62Q3Rv/kThH+qUuDw
	PiAZjjEch1xqe/fiu4uyrhl3L7xYxU0c9Va+EAngKwBPKbbwoha7DU5NtLxrYhKT2+XSq38BNgSgc
	KKfGzH67w0twD6lGp+zViAFPNbEZH1rTnhUzywpFG4pHA1L0GAsm6k8K42k1lgN2ABG1FdH4O2ty3
	BWdeJHcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpMZW-0000000F0YH-2acK;
	Mon, 09 Feb 2026 08:24:43 +0000
Received: from mail-northeuropeazon11010047.outbound.protection.outlook.com ([52.101.84.47] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpMZT-0000000F0Uk-10Ye
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 08:24:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HnC3CeZQsYfwa2qls+x0p+ZvIMfaWRXbKVfWXs4idz7Ho+36ls5FA+M1zTtim/3ivAke1rGfhEsRSA07P7eXWlAnh9wtBV+Eb96yqDMJ/mx58rSdYZyW9efNFyY20C4GWfyqewbWoVG9A+KpDrQELei51T1OV9FcH+qzAs/AJVNDVH/EPObbI+dd5x2REfG0I4sZ4rIRz9mx+6buFg1fZD59dyIUAa3MzG1rhdYriHJg6PnglQrIkCSHdbuUqag4SqwAZxDrPkFVGDVinywjmYoaO+/EAst31MrVSsDQ2sH4OivZY7YzJojgvg3+wNsVYALbU42+dOUaD0lUDkwjKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gboInUYbdyhxKo27lO7q9QC8e/h2POTBxZYRuF7CkfI=;
 b=XpVnxqTR7u4aJFGLbNczddhKut6cmtxzoEW5mU1NYJQXlSdK3z1EnUgNIbDpQGpEONxy9IIuwd7D2gt5o+uQn0jpEJrD0BzgOXLTGZsaolBvskT/+UCsj30yOPSXVW+5sbZkwtC55hm0+pe1F310gyWJEm8hLVSAw+chnDUfB5y/0swSh8hBFN9Bky5QzKIkMeK4IDeWC7+xwmkT9ctg6LArZqgJxbROsQRHpg7tx+a/Bwu0VTa4Wxd7sdko7sBSsb6vurNQRlGq7vItHKOEB8krpTwd6as/AMVJTCgI6oCRqxBTI7HB5eqw2HnbKjpq+juNw3ZU4gN1RZrz59os2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gboInUYbdyhxKo27lO7q9QC8e/h2POTBxZYRuF7CkfI=;
 b=WbhmXzk13RJcSzs1C/QDNcDhe2w7rfmpOsWzBFFKPm/wHR7wgUGK83fV3jxrHYEi3sbNy8ODXBWqY5CaFqDJPzBnFOtRpWN/zDFHDQ0PzzNybGch0V5EcBSuM2hI9s3zG3ly/C6oDvrmovoMpXpOnkAXKGwzR0LNDT7HKlZIj3USAxKcSUqjHEYLc3OFugVNxq45gIPM/vcAIn5NE+r46R+BGdvPVjBDz2m1mPHVKlbpTRVQhKtxVVG/qyLhAKl/B3wjgzXenmLJaFofavLZeC6QPZ1Gk/XJzNrIHvynxt5Ax6bEfdGR0Ud7aLN//Z0HxDr1j4P83h71jT7U4Tm3Tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DB8PR04MB7180.eurprd04.prod.outlook.com
 (2603:10a6:10:12c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 08:24:33 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9587.010; Mon, 9 Feb 2026
 08:24:33 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	Frank.Li@nxp.com,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	will@kernel.org
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 07/11] arm64: dts: imx8mm: Add Root Port node and PERST property
Date: Mon,  9 Feb 2026 16:24:50 +0800
Message-Id: <20260209082454.2097628-8-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260209082454.2097628-1-sherry.sun@nxp.com>
References: <20260209082454.2097628-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::16) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|DB8PR04MB7180:EE_
X-MS-Office365-Filtering-Correlation-Id: 217fb3bb-bec1-43e3-6e56-08de67b4a77d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|52116014|7416014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4QdEDAKgU9rd3XeygImBnMFws8KmRCj76XthJQDVKWpNApeOsfPltB12wrRE?=
 =?us-ascii?Q?erCPCL4XNgqEuHortq5TsD95FX148ptZ5WdGanOUiqG/MBWT1dSF/3JzC84M?=
 =?us-ascii?Q?3a3iA4WfZyVip6F2ew2YXzRCyGvz2bJT8HN8G6+978+58XLoXt5rVTBnNHmn?=
 =?us-ascii?Q?0U5/YRfJw6v/JU11GguPp8GgFF6qYJKD7HqOvKZ4f2wUEmidV/L3mamLFCOa?=
 =?us-ascii?Q?Un4A5dfPqUGkwZN+36SLU/gqK+BTc88nOK++nrNsLwZuOPKGhZBMb6vnjyRM?=
 =?us-ascii?Q?5C6i+m7nIpZryc1UpiTGYIApwo97VIHZZD5cRU+5nByRMuLEFt1hgMmpApQL?=
 =?us-ascii?Q?ttVELIxOkxyjbp82ZGwTu4uU09x3qkI0lcbK6IjYJs9wl1MNYzqov6bl+aHG?=
 =?us-ascii?Q?cJjBNHaUaQ2oxKL6EVvCHBvDlE59BNvykLLIF6GbxWk99pRqh3+E0ob++SQs?=
 =?us-ascii?Q?hmAYVSUMtHafs2j4h8y+Y0EMWusV5cUDIf29U50CFlhIZpSfEIJ0Tiu7rXFs?=
 =?us-ascii?Q?QLRu6x9YZxAICYz1jWuBVmT21ubFkMLkDTcckVb8k8p3aN+dgjgGLSVkUUPM?=
 =?us-ascii?Q?JZxShNjcpjnW0/iqHbKL8Y8kGhnw5R6/DohqutnViRG/683wztb8f0aUDU/j?=
 =?us-ascii?Q?mfjxziI2qs6nUQuN3pgwf1iIeKfXl32u1qNosYx4PNoM7ByDe3D+f2w89i2k?=
 =?us-ascii?Q?uIKWwJ3X8XWAR9f3nGEED2U1gGTwh6yOF3bKam0nyEB918ASVFx6m4bYkExT?=
 =?us-ascii?Q?UhvXIx67BbuwaZn1rBgRcWHLH3DPf5AT+TX1B5f2ZYF+FwKRbSfHXFi1o86C?=
 =?us-ascii?Q?0fIqcUs14LMbhyqD3rySEKvZY6a+u3o4BqyW8zdiv6q3KIvWYtv3S0xFPmzq?=
 =?us-ascii?Q?gngfjT/YN+6LLY3J2hflRI8SR4ViyStrATQj40Zxnh8xVNg4l6AOWavmkz/0?=
 =?us-ascii?Q?k14Xqqo4SB+BSbkcyU4lcC9u8gdJrq/Gcbw5kBE2T3ROUzWFRCZOJSE8JAui?=
 =?us-ascii?Q?p+0tc7tPIv155vblZix/3Z2ITJXLQkE4DsxKRXqPnONopQBWR3iarBxttadC?=
 =?us-ascii?Q?/wyJ87YYpdJtBxjH+SzGqNvTOOxboFLYCcQYIXISq3mf7dr/xwLu9gmkR3IS?=
 =?us-ascii?Q?ugWlIp5I1U/omo87giOCBGn+OA9OZbJBZ9BkVW46cusz1DHTjAEKW3PaZiZS?=
 =?us-ascii?Q?RbsbEdkFWVondTntXEVzE6yfbImqT5PyXNOprelHLjkbims1Mz/zx8rrbUah?=
 =?us-ascii?Q?f1Pc6F6NmXOM/DkPUGvH8qGnb8qOTYmNN8sAlYCZrWYwibzo+4BtMfcir3wf?=
 =?us-ascii?Q?pE1JignFQJR4SejNoxccR1enRy05eFk75o8n62Ol9T8mqewbqgpLi6tfKVpF?=
 =?us-ascii?Q?prLk5/v5PKjEYB861q93Li5xvmu1Xbc/busm1o2zUglWzx1xahsnzcJuM0Yo?=
 =?us-ascii?Q?MQoUsDlKtHh3dhIQL4rcJv9nEDpHIxo5nuL0VXdXH4FYMgnup/K/K4tL6942?=
 =?us-ascii?Q?YO0gACVPWvcKDrjaEohLArVrEjlghu9ZQ9u6GbNn9xrcrTVFUVvnZsUO1cyu?=
 =?us-ascii?Q?EaV6JR9U2E1NfPq1kwQgKBum8PbTQBcuKFa2d6nCdTayPkS8zZ8tyS8ipH3f?=
 =?us-ascii?Q?UYhj2C4NAzh823lP3PZDyuC0IbcN9IzQ2atSuE15oeUz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(7416014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?armlezvNM00vthhvYFS0izF2KF5fP4CfmBi96bCJDhFfU5pZm/Kr+d+e68su?=
 =?us-ascii?Q?N58hSHDaA7MXFcgM7F+62yjIeoRDoRbb+CFIAmVMZtyEzwX6PQ2f2szyCuy4?=
 =?us-ascii?Q?PYZJGYDVYHDjW6I6kvRecwOYcLns+BmkahkFuLJz6+hh/AMtZ+hQBT/G8dqy?=
 =?us-ascii?Q?G5BI37I+UhKWCF5gd216Zu8CYImyIxRv7hGhdKgv+m1OHE/GfK5rGQO1AjJl?=
 =?us-ascii?Q?6aBPTD6CBLQRGues5A3k7oS+6k0gbmIJ8Ez0+WziRa0V9blAAhjtA8UJg6Eh?=
 =?us-ascii?Q?GW5Pr15fHL/mBCnA6zrXq7iIsKIGqpWSiO3J0+xsz/G2jEjUysMUDaF2RDsG?=
 =?us-ascii?Q?l2sslrChlfaPfSq1I915HOJBuraKAiC0kTR6mKvn3z9frCcRt0clPfdUFhdz?=
 =?us-ascii?Q?aqa2w+qUg74kRmiYp8Bfu4zoLP4vJDy28kc4IKLP/NNsEVJpmL5l/bYJmOr3?=
 =?us-ascii?Q?k02aPniwEPUr9u8lBoE1IGGkWex+tV7iQkCQYxvRe/cWKkboUga8Zkpqg3A6?=
 =?us-ascii?Q?6Bqp9xT9ON35sQGhZJ7Ow6mu8wVC76MtvTCa3fcfwdBR+ZohBhPFXzLdOtg5?=
 =?us-ascii?Q?Wkw9iXr1qmOuFx1/4b0l41OTKGRH1lxYP9GvW42LD+Rc4wrXCR1mQY0sn8Ix?=
 =?us-ascii?Q?7UTCoQWWGROT5J/oZs1bNPF/rnuU/eBpxHs1QdC//zNPgnpgRyLTd7Ed7Bx3?=
 =?us-ascii?Q?9TQpVGNOzkixZudK0GlHR2QVHkjbzNxn/3ZsWtuAZXxsEU9ucz882T3R5uQ/?=
 =?us-ascii?Q?hBnQ81otmEdnCiQedeuMoEPoZ0i01J1Wy/j5vrHikMD9Egs92ZuUoTocQSgT?=
 =?us-ascii?Q?peF/us2zY/VW1BwsE05SfOuNZ334loNy5RejiRYhoYm99buiWjnrePwBmjMx?=
 =?us-ascii?Q?nhU6ptPr7ig4h4vDCf+G6gzV8HcUy0PWZZonGe0r2WdsILwGO/ixWoJlVBDZ?=
 =?us-ascii?Q?S7KtHI+WnPHphUwF4hRQ9+CRA29MmJFfhkwfVZIiICxEf2gF/PzKbz3cFOK9?=
 =?us-ascii?Q?QyOZ5Ta0s0EtkvqDO/VsiNgU40OTNux7gzim9AhKZ8FSNX0nRTvuqZsHS50X?=
 =?us-ascii?Q?ENX1hj6ZBVU17UUj3yrb54Nw05PooJinjR+i7YyHkTF3oOf4WijmFOEmR1n3?=
 =?us-ascii?Q?NEeTqoOihteja1QmAyMcoJ3pSC8zeSHZ6ou5jhvGz3F/7su+w6stLcg+g6cZ?=
 =?us-ascii?Q?m8lLhZWo5GYeD3K/khb0sByMbWieMRk8UH1253h5O3e1z7oVfY9zj0QivTq7?=
 =?us-ascii?Q?dyVY8DE4srEnCtPxDAJcRiZR+3QI4c5ST3zBbN8JlE8dqjRyaKblQ+0CqIW8?=
 =?us-ascii?Q?hJWmiQfj0GILCuE9p4+neM/2VPQuDpSFwsmrx7eLpccFb0f/WAMf2PLwIWsw?=
 =?us-ascii?Q?+sxdwUMQV2n2lW4lvFHanL/pVmwW3c2SRwXA2nhUcCpG3XtmizqChc7wrnWy?=
 =?us-ascii?Q?S8vfj/nKICw1HvwgTHScG+6IWE/UZWzUyb+rGq9yj69ChSOyZuH5lTCtJxkq?=
 =?us-ascii?Q?tZ7HghIW8FXkI2OUKyBMqveXN4NaHdFMjfKQhsF9epE8kJT/DJmfNIFx+sYh?=
 =?us-ascii?Q?pBtrPXUQWy09WyRLH1RoUWD/B6vOcOx0Wh+VTOQ3M4bSj5J/LNV56ZRtSJu2?=
 =?us-ascii?Q?qeo3djXZWx52xZUGU+0V4+SgPA197a7QGQlTBWvvUdZ0u+kZ26psKKxP9L9v?=
 =?us-ascii?Q?m23pM5mw09jOoyHe9PA7fyOe0kIUmah97PTf3j1EbMalngH1ogCqiOkYVMX6?=
 =?us-ascii?Q?R/XA3VS6zw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 217fb3bb-bec1-43e3-6e56-08de67b4a77d
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 08:24:33.6156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6894HaJx3+pJdLlELASMgzsvwTsmJW4GLuvQSQ4xpNH0Ecz5dfMIQf5aZ2I6+UwOi4TnrVMINNSucA+Kf7aKWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_002439_340554_7116C4DD 
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

Since describing the PCIe PERST# property under Host Bridge node is now
deprecated, it is recommended to add it to the Root Port node, so
creating the Root Port node and add the reset-gpios property in Root
Port.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi |  5 +++++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi     | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
index 6eab8a6001db..060860f24e7a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
@@ -533,6 +533,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&gpio4 21 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
@@ -559,6 +560,10 @@ &pcie0_ep {
 	status = "disabled";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&gpio4 21 GPIO_ACTIVE_LOW>;
+};
+
 &sai2 {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 9f49c0b386d3..1204cc4d3f37 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -1369,6 +1369,17 @@ pcie0: pcie@33800000 {
 			phys = <&pcie_phy>;
 			phy-names = "pcie-phy";
 			status = "disabled";
+
+			pcie0_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie0_ep: pcie-ep@33800000 {
-- 
2.37.1


