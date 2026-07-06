Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04373C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 11:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXbBXwxmh3YbbPmw00J1QBHDq3hLzx2rmUyHAEwerH0=; b=S9ATsDoF2X/EETR5VTj40dGgSW
	7xItiE/xcv2hxOQZNdB5iS6ga2HRjgddd8ODIyRrLBLH/trsBdVp4aMLhl5m8E1VJ88Mz2eSyfKTF
	qtd4h4xTmHWWKLLfHHf3uFETrwtdIIC9c+TYxJyXLSVzzskgP6Jx1a6u7FaHdel4Ifp7iICAObB6M
	UYANht0Wyp5at3UpB7OySrbydcSFPaDq2D/BOIhmqshm+a4H9v0VN59nT2nr6Y6dLDQlAmQ30/d0A
	c5xsuBe62HwtZmpTZKzmO9gojljba/XiDrgeeOjgswdqMZSnEsI3xL15IpBbcX1ZJ9Fh38vgCYxts
	PL7hEX2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wghIH-0000000CKu6-3Ezh;
	Mon, 06 Jul 2026 11:15:21 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wghIF-0000000CKst-0s46
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 11:15:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHrhpFs4fNOUYdN/YuVzxHG+fHMskAtYwylqXS9DFSgB4OvoyAHu+NVUT99cQsD6jjt75M/RZlfmA5ba/lsfALkvEjdBaDFh6OOxMokZJ4Y1CLsttEeKP72efpmkAY7v6Kp2xImDY3j6nm47asS3MuE2UuqWTE88T8r2E6I9DbENMqhOxBK5DQuxa43ac09s9xLmWhxnVD8CCzCKYPCQEZ/mWWawV98xli7h3ZyTCVoBcMP0Lp4hkjJxiHkFZiOdMn+KXvAx4yl3MayzcqUBurVl7QmPuUQwRQtpjeVJZ4/9kE6Hp8yU6Ovg0qVDFuCIeNxXJ2qoY0KbFBabn5yDGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXbBXwxmh3YbbPmw00J1QBHDq3hLzx2rmUyHAEwerH0=;
 b=XkoeBUbCITFmmm5t/4PPdn4YLBq6bmvgoqAQyP2Y1PlKeH5c/AL2zT7m6ybqlzu3jYTbdc9GW7A/Kwd5dhs8wYBksTJlr07SNSMwhzfdMhw/iPvuUUcAEEJYdbC0Y4/7rfFy2esFf5jvG6VLLgqbHykKi/vQcm9TRwXN9arD/ak+WBQ4mR8H+GyjGXIFlaWUWSMAGGXja0pjc8aOApVU7hUx0UcDt0dmac04wMmFhRhHlFrg1ctXqZCPJhBx2mpP/nHhCDO1kKlVg3C7DcMqWt3rHmL6J4/vX3/o9lPE+Fzfk/GxCK9/rB7cWFwswKxh9PMfTkJ7143z3X5VwhNvGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXbBXwxmh3YbbPmw00J1QBHDq3hLzx2rmUyHAEwerH0=;
 b=GUH6JiSdEFkTFLaf7rnby0Gqc4Ldy1WDt34l8Ph597WFaoewKjRfgC0qUpUE5+ZaTQZlhCrKGvRcomFC1VW7W+cy6nCsfjLL6cZqxMQcXxnJ24Hvqlmg4Mrih27WMDgr837hY//hLS+0QmLkXAQY+0fHe1LPCdMX7DDzVtwlI4u15QOZWBT6zApfm4MBoOjIvgOgPUBywiwNgi+Ps59wQo3PPuyNPob+PrwTG7xFvdre8kLvW0e7CXGI9s8hBMw5Lay+DsRfT+nIxVzIKlYTZlO7zRAZ2BrdpMc0RrMphHiE7B6ZEVWmjOrVMtYx1k0hZk9GPLNdHwCmHf4o+eFULQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS8PR04MB8580.eurprd04.prod.outlook.com (2603:10a6:20b:427::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 11:15:14 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 11:15:14 +0000
Date: Mon, 6 Jul 2026 19:18:41 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 02/15] arm64: dts: freescale: imx8mn-var-som: move uSD
 support to carrier boards
Message-ID: <akuPEdODztRtdbIf@shlinux89>
References: <cover.1783330236.git.stefano.r@variscite.com>
 <40a2d0d32bf3447f833149eb4e71365c4515743c.1783330236.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40a2d0d32bf3447f833149eb4e71365c4515743c.1783330236.git.stefano.r@variscite.com>
X-ClientProxiedBy: MA0PR01CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::16) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS8PR04MB8580:EE_
X-MS-Office365-Filtering-Correlation-Id: 1807db8f-0438-49cb-f714-08dedb4fd9f6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|19092799006|366016|18002099003|22082099003|11063799006|4143699003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: 2S4Vw7f2sKPfRsbmu9ZzKhdbmbdz6r7lTnhsPXszGnIQj9F8fyFsPDVjx+a5yp/y21a5jtmtZJR5JZqtpkHCBCx8XaaCc/DWa/PIvg8MRrQowmy6Z4uuCNJlxGKnMXQV6zuggAtO1s/cDs+eO/t0Im59eoZyABUcY+hn5Pgdr4ZaY1vd7sj//GX5Kvw6kGSDVdcOusMJ9ZaUYHw3SWl3uXamqN/0NFp4n83LJ2/2SxUDdLa+VwqSmFtgoB1dJ7SuoPniOrtOAr4fBUWhW5fwSDcgD/ORXQv581wxAg0djg69AukshgWlpYRaSioi52DmRVvUI1z+BBdcYFutwobzf4w3AnxLDYe3UU4Gy8ePewnDi126iFqnrlR9NIeQ+1hJ9EY4rbtcPW4BktnIIsL7ko/Tke9lqis+XH98s8YxgPR9DpAUOyEaoYYolU72GRDYWdwGbN/r00GMhSvC5nk8g1yqcVcJFfmgBsAagqRYpasITYUwTWK7Hu87N1IU2zjiY+4sBUJSTOf/m/sApKa8x5557R/4HKM8cbgUngcEqhDwEBsIi3h4sk3jwDvJ3ZosoGDWNE9O3nGAnB/si8hMG2jh0s2jckS5qwKS5qjNZORKUCGcwarOi4EarijRtfje4m8cLe0eUQ1pE7buAgCJ5QoyrtEo7LrMqHH3uFeogLk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(19092799006)(366016)(18002099003)(22082099003)(11063799006)(4143699003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gM8NkkThNFgcfSLoEPeFcTrH4sHJb0BUnWaYvubWRDe1/+HZnwU67MUNPZ3U?=
 =?us-ascii?Q?e5bp925mqFid8fdsbHj2CjiM3DUdulKHyBwlSrX0cqMYZZIFUZrrRi6oozN0?=
 =?us-ascii?Q?d1qykM25QwNJmw8lDZ4AHenxqEM7rZZTxiMLtCpM+5OoNK6ThQPm74rv7HMj?=
 =?us-ascii?Q?2YR8agILUB3QDdiJaHsL4lhj6M6q4WPFLw8v0j73nmYHHPMiE1yrUi4PG3qT?=
 =?us-ascii?Q?bOXgvjkeGI0+l+5FGqheHblcnOfi//RFjAezv/B+kuGk6HAHhVu21XIzPb2M?=
 =?us-ascii?Q?y0E0ioPQsVSBR5FVZLWQjFy3qn0QUnhVcZO+Kvg1deWPssgHdkyZPmqPC8TD?=
 =?us-ascii?Q?Qd1v6/RrfdaAUcu9zZDs6SnD9hvRsxrNAGYGQSuN9sdUU0MMnSdSmEUo7UqZ?=
 =?us-ascii?Q?kfqgqkrXF7V3rh6btvUOnOG+K2ev13+k1yJoDnP0aL1irBUpIZcDJkQbqg/u?=
 =?us-ascii?Q?YVufNUhh8DZ1uR5MFQR7dEv86Edre4EKgBLZ4vJ6OCAdc6AqM5TEqEb3prN1?=
 =?us-ascii?Q?07kS7PTNG43rEbaVc8pUE6BlroHpOQYL9xQrQ7/N/edBGZ53AlhhZ6JVs6xS?=
 =?us-ascii?Q?gHIoy8HrJLHRJDzkwPzOi9aUYRnxrKpBwukHD6zNnH4JK2aDPv4Zc21h/5Ru?=
 =?us-ascii?Q?H4iFHxi9otpcqAzamsT6leFk4C1H4TTdLDoML1+3AOoUs1zoutp8CoBfZKkd?=
 =?us-ascii?Q?3gexbjIAS+bt75jk/yHD5yDQaD/O1ihppqOZlJL8dra+c+xQvJEzUJaCYi+b?=
 =?us-ascii?Q?5ahDeBSW4J8vSJYCoS5JWieBafzMte6yivuc8U99JKcavbxaQUGUpNEPuXiY?=
 =?us-ascii?Q?TAJ6CxQ3RJUFqvOtOLlpUtmZO+dxVoMKdhD4CSMG3H3VlsalIh62mW3A7ckf?=
 =?us-ascii?Q?yFlB0t3eLC7kGFjtMZrP5Fi8pM0cvQ84SEKwzrarpC7W1xW94P+WOFFroe/c?=
 =?us-ascii?Q?2HMRA0AtFL6cSmsUQndY6ueryXjccGGoTDhTCgLEK0kfmkvb7wTL37sMktFn?=
 =?us-ascii?Q?Z7WXPUCquIkXa52uGNlQVzjmfWtlT2j/7rDVpesw/U9xGtHPmHq6LULWg73X?=
 =?us-ascii?Q?a0E7pGijCaXT1hz0lzeP5Jk8ys+rRx1ScBDAvyqx9Cm6yTQw53hvPQHFW7QN?=
 =?us-ascii?Q?5ryo072oveSvGiJr5wR7FRhZcE8OJrMX86uz2l4QNu8IDb9cuWXbYzb6jdIT?=
 =?us-ascii?Q?KNw9Lwz4XdOzg+ljfnC5yzDvxDwOrNHdKot9uJZXpF9D5L8Vt/aqHFeUb+pv?=
 =?us-ascii?Q?ne149H8zhZKm6bosbyC9XNt78VX9rTKxyCHHsmZ17aTlzHW45arzj/afV2fF?=
 =?us-ascii?Q?Icp6hvyg9TbUm8HCTnbZn7Rf3m8CtVTNwyOleAHHRUxwKtiBfQ/TYXvxTwpW?=
 =?us-ascii?Q?rydAnvlQbpV1E54cYw27PuhnlrXT5omGM62bAzT7r9tGVXwpZ9FzdSmmDXJI?=
 =?us-ascii?Q?OZkBlpNYfLcQ/GZBFbbDCI/yOBFilHNzuOh/M31lcscPWtNVDNMCmyksCTWN?=
 =?us-ascii?Q?NjSXGHtv3tLoO81ggthLn6YnDt1gKe+w52oq5Hy/92G3znAPsBPtKTRTmnaV?=
 =?us-ascii?Q?pij00Da8/61J3aXo5jDe+34MWAKmu3JUqDH+6/YzWiwKctFTVYF2X/DlhYkC?=
 =?us-ascii?Q?NEaFxxIcI5FyC++vGLVG0kj2QdKY7TFzj8MAqOa3eaws1sKWsKb9t04P3J9C?=
 =?us-ascii?Q?9hj9aD0IxQgM3ftuFLJP85lRkwkuoqJ4t9zp9FfnAxaEgjRmCuDBM/5AVTnJ?=
 =?us-ascii?Q?dmz6iDVI6qOy36A8Yku3yQJHp4zqNcbn24cEa7ib3lcwkhaunkMH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1807db8f-0438-49cb-f714-08dedb4fd9f6
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 11:15:14.0318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o3QbTaSGPqjgl6b9Fec73EOsF4myHjVRGHaWXjXfU+Ow2pYe5mImxpbQ/ugtxeDvG9xbsVlEvFEsu6kykb6rRTZdncdfH7WROZakyWzLBr2JRASE+vnjN3g9ac3UuPwQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8580
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_041519_251262_BCDFD02E 
X-CRM114-Status: UNSURE (   8.41  )
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

On Mon, Jul 06, 2026 at 11:34:32AM +0200, Stefano Radaelli wrote:
>From: Stefano Radaelli <stefano.r@variscite.com>
>
>The VAR-SOM-MX8MN module does not provide an onboard SD card slot.
>USDHC2 is routed to the SD card slot on the carrier boards.
>
>Move the USDHC2 node and pinctrl configuration from the SOM device tree
>to imx8mn-var-som-symphony.dts and imx8mn-rve-gateway.dts, keeping the
>SOM dtsi limited to hardware present on the module itself.
>
>Add the required off-on-delay-us property for the USDHC2 regulator on
>the Symphony carrier board.
>
>Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

