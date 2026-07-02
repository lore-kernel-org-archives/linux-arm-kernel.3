Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844F3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 14:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbRm2/+9l91bQuKOGC+Y0ZOkfvtbGoXG3sUXKKFqMvc=; b=yQzeL0EZR5kjlERuKKW1O9bsd0
	NSbtufgB1ZKT03sxf/P6PtxqscEkwwz8VJo0VyNh3OmnFKRTHDDqH1BNa1+LpQSm7CrdkfkcDjZPD
	SmtnMEz2YoTPHFvNInXIPvLTyH8MjW7DfxE75TFQqeObz6EodHpnfZSOdc9VJs5zdz7KA29oSspGd
	5lgLyiikxm6rJRhQXb39ONMRN6IkJ1HRq69PEybNP5eBvoZOcSi0spx9gLB0vx/0eNjtQLTxOBhjP
	utK5F3Na21rMQu5x4Nwj5u042yXhRJYXo4+8TY+J6un6SRDyxfya50tIU9Ti3tsWO6AG6Ts+jlCwg
	EYoM+Tig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIMf-00000004csD-3uMq;
	Thu, 02 Jul 2026 14:26:05 +0000
Received: from mail-northeuropeazon11010006.outbound.protection.outlook.com ([52.101.84.6] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIMc-00000004cra-39fi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 14:26:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLBy8+/04OoO5yoDvDMITKyEeRm9f3IjaXkQ2UKDNT8CrudoTAuocU8WohC0mvTdUyQZBOaUIvyqZ4dQRZVTJO3MfBo16oyclOI5/7Fl0rU9AXbT9JtSX9n7mer+0Nx8rODMjObmUd8I3r/CIgp1WrQZZ06uLh6xY+KcsamPCJtQWAM8+lA2Y9F8FJVqVP/SE/ywWuicLFScOaMxPh7A51KgFbUntNyDGNjElv5JvQ/msJb6Y+7TgPwpzcotS1IMLh5YA5ya9e3+cibbE+5NzIODzHcFytPR8YMSi1jMMDkJcrNs/TNUw4rjxrP+nrAu1tqYpzOQGZu9yKPpFdJXyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbRm2/+9l91bQuKOGC+Y0ZOkfvtbGoXG3sUXKKFqMvc=;
 b=TxfsZCNQ+vEJtXO4waJQtKU1TD9hwB4pOdZvUFrbq/67TyYYuGNHYD0yOSwEfeQcotwoiGpsOz6yH6lK+nlhR/ClQhRoqRkWwLd9HwKEdVXMthTO3FJs/3fRUaRSkbkxA4p2zl6ekAwY+GBLGl1z56ZUvB8mxUxLCUMz7Ck5oWPjINrosGqOE7plMq6oXKJVzrq45U661MH0Wsat7Z5R0jq5WBtsY6P4WXwxlQsYnUJT5RkL9LAzEaxnoLyzosg39ptpcOMQWxbE83Zn/qC9tGKtuclOdquCtUGa5lKZCzVgREzUE4zeEX/YaiAV0zNmF8SO6k17jCueFE8Wu5Am4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbRm2/+9l91bQuKOGC+Y0ZOkfvtbGoXG3sUXKKFqMvc=;
 b=tW6lq2DreKqCvm1wsH8nAVhiv8mO4pU7MKUVxxk/tubEKl1QU9b1cxtbSf2dPNSF2FdFsLxZrK/zSXDZXGtRjLRZ/I3QH1H30IOxa7uhcMlZSO6E4iXG27ErfoHfGvU/gE+rUrLePh7WvXwo2Uajv8dyB+hrF69PMk+GChH1rpS/dm8BPgVAGHtmewf8mcG60WVRTHvGwB54A2ccZ7uCB/lY1C+XPY4nqkhS8WWlRcKuqutMzxtv7x4+w2C9boLs5GGoQkn9599dDgCiOfqSmeZ7KX4FZse2gDXHyosbYqzkjFcojyzQcUnX4go5KIOSjXcs7fWQCnLv8TPggqn7IA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8583.eurprd04.prod.outlook.com (2603:10a6:10:2da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 14:25:57 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 2 Jul 2026
 14:25:57 +0000
Date: Thu, 2 Jul 2026 10:25:45 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>, Ard Biesheuvel <ardb@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Mack <daniel@zonque.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	"Jeremy J. Peper" <jeremy@jeremypeper.com>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Mark Brown <broonie@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Stefan Wiehler <stefan.wiehler@nokia.com>,
	Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 17/19] ARM: mark Cortex-M3/M4/M7 based boards as
 deprecated
Message-ID: <akZ06e-yWLvkYe6T@lizhi-Precision-Tower-5810>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-18-arnd@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701212353.2196041-18-arnd@kernel.org>
X-ClientProxiedBy: SN7PR04CA0161.namprd04.prod.outlook.com
 (2603:10b6:806:125::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8583:EE_
X-MS-Office365-Filtering-Correlation-Id: b9ff808f-21d1-4ca5-e545-08ded845d4d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|19092799006|23010399003|1800799024|366016|11063799006|22082099003|4143699003|18002099003|56012099006|41080700001;
X-Microsoft-Antispam-Message-Info: h8c19gqcFDgbCYPsJXSu2NpqLn1z1yjg39zx5btSzYKzVMzaOEUxy8Q5fzEOOotmnA4+YTX9tn8IfZFfwJo1wRPUSdxDYyZQc7ny85O+yuJI28w81/1evzruSy54zv3EGGIFjA362Lt1Akg+wQcQ+qUedqLSbaOjf4AAwPIzQM9hTmtLsjMEXS1Em5l3nLzbcXpXhWaO+JHV9PtSxpw9D/B6EMWE5PjV/J3d4Isnw1psboi64WV9vjoHCTkGOWpL8ihP9/T6nKnQxBySPZZ4AcKPcZwGQYWNWv478NuhkLS/GVaIa/CWwXw+lZG2QkGJ/ButAjCYFzaGx1XX8jqWkypgSV24gmvU5mb0XdoJriw86QOIElnOhLMe901qFjs21NXDjESUpcFZpP7V7XOl6g/bivND0IDwrkiHN/QTuRdamEfeUolVA6w3pBmz4S+Oj2y8CsVdeF69Mdu9lSzJknV2dUW3xrNRqfNID4wfSJ6iNRFyROan1i0eXDRxUuNw8Q1gqDt/qif13lOpCbuoLVfDb3ST6VNjijIlPU2fmZLgNCitLAzla1NAKzItilxsU55cahLa1pbnQseG1Z4PD8KY3iu2btDv0cG7ySFoJq4TLzPLFJ5PJfq8Wy4bUQvsmw8jiyxmspoIFA17O8W9+y7qpgLJXaZYNpVVDoYLBUaWfVNqynxTVD91eiYvJRuXzV8Ir74Zp3z6sHHPHDWx7Ty67NgiFrehPSfxzwHQ+wA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(23010399003)(1800799024)(366016)(11063799006)(22082099003)(4143699003)(18002099003)(56012099006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cFYTn4xevijggpQUwQbxzk8d2vVP6q3wIcyLGj32nygFIDneERTvX9dsBAOL?=
 =?us-ascii?Q?wcK+/MiiHx5xD/KzzkJg/eg//sns+B+SN7PZudB5f7Ui5cKeH4aYtQgCAzDq?=
 =?us-ascii?Q?Ck3IOn0nbMe9maEbsfij+/VTo8GLXTphGEL25waTuU+4hlHJUu7C1S00+9ot?=
 =?us-ascii?Q?GOmdtxI+w+FFZIUApL2a2PuyWXJN04emvgX0T0SGKWQnDf3Jn9uXHYSxiIZS?=
 =?us-ascii?Q?2KqtBxDNiDWBGWR6NdOg1sH5Yjy1AW6LEk/VnOyS3UV0jdBhQ11E2NZbpyF2?=
 =?us-ascii?Q?j+yu77P9sj1c7I4HUUzYPZF9/9Zn2fN25yvSRP8aq/A+BS+EdPoLmn1SAELe?=
 =?us-ascii?Q?69cTN0IpDqY6uVJ06VvXPthk4mygk+LS0IEVe4xfKxVn1kWCzOIBkPFQWgKn?=
 =?us-ascii?Q?h/4jUqQX7JnIIqkMydUXuUDVtBCRrwKhACP2UcowdTN7ZqpoPMcNghFspl95?=
 =?us-ascii?Q?OZ8Dqk8R9EYA6DrYm9NHNet3FHqjuKoSjlvJ9f8xOQbwmyBNGaY7KXai1CQ2?=
 =?us-ascii?Q?4q3BY6UHbr8oAkp6WpPLCelPmZ0FlPoZeDLWQf5Wr/uIVmefNAKd1Mhy/qkR?=
 =?us-ascii?Q?UvnmHDwYTfwfWMtsPzM7nribbN1+y0OLONBGktA7DwyguGVZhblj+Jg6mXzE?=
 =?us-ascii?Q?N7BPDj567Cy1TIw8r3JgkM4kLZJfwj76gCqlnCJFIjn5jBZeGVZrPizCYAAE?=
 =?us-ascii?Q?+xee6Haq9cFZLvrO6Glt64SYUdVg/qwahO3XpMFx9lgAT2SYBF5UgmziMHWd?=
 =?us-ascii?Q?LBd2aom3kYpNdvd7Ujzw5RHiR9H2hDfoM4pu/rBRQC1ETkphQAVL4ZjbPmZY?=
 =?us-ascii?Q?WQcVPcddbLQOOp3gGw2g8bPeu7DBkqGTORwW0mNfJjU2BRIsBYNBuRVT+AEC?=
 =?us-ascii?Q?zqWCG/001zldGexmylZkQQuLT6BBGiP2fw+kV9o+FcaWOSwkJkzZ3BOVcEHB?=
 =?us-ascii?Q?Pmu4PzhK++H5WjhcU0hJ8NyY5BzM7qPaJ99jp8D3Y8pYQpGOEpj5jr1aKk3h?=
 =?us-ascii?Q?mHn/6k+UKIFDQhB/X0QzJj08hlyC1Vvusk29fig9tblm6WHnyA3cVY5rczVH?=
 =?us-ascii?Q?Ls409dwV8UgerzTrVu7UDC3UvYxXUypYyb6ASXYxkKwZhdrMj2K3vKvn2HLu?=
 =?us-ascii?Q?sI6L+qBd/Wf+vVMewiMQbCrYT0Q8yZkims0XPJnprmlTQxNHH1scHSdsfdnn?=
 =?us-ascii?Q?zF7Am2pN0MPdW4Fq9NrAV3B2Xv3+DgyJP5J9jpgUn/D1CJvTDMv8FRrv41sc?=
 =?us-ascii?Q?9fRKRXkiPJcmIpeur4BwAjaMOrbmwNyktb9/fExq7d4NnrsHYHfJIzo5bWL9?=
 =?us-ascii?Q?8qLqA1bqynIyccQLryN4yL91d+u820AcJhdaYp7ZggBzkU1h17yXlo2n3rgb?=
 =?us-ascii?Q?rmGHTHVq0rYuA+1APZU5N68PtpZrJ0E6Whtlm5bKFnLd5V5jhcSDlXQtMCnQ?=
 =?us-ascii?Q?piVCXY2+Spxu8WaXlSOF9mCiSY3fIlSfr+atVEY2V4uofkD2P2SBy4iL7Zkj?=
 =?us-ascii?Q?1rdnInISQL/BTiMWnvCwS8pQV9mH5c97+PziVcrRczaXr6jvZb1sEx8zCZab?=
 =?us-ascii?Q?ZU5HsUzS6soISTDjiIxEKbnjE/aTXlnlLrOfUlHoULK6WNILZhJ0Z/JKy526?=
 =?us-ascii?Q?Ep6npVk7zfQumamZ5Wa69xxyprYBoOnGdLut5l1vilNngbtUzOpxlD/m5Nne?=
 =?us-ascii?Q?C2k7lOHrNeId/5nyuoePH/X6gXKNi5Y5aWyz6M5mKG+L/TBUbYNb7nMteuHa?=
 =?us-ascii?Q?ly9o39FDlpKbC2wofZRr+3Imv5FvAn7PWDOldb2zUHbgCK240Gw0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ff808f-21d1-4ca5-e545-08ded845d4d4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 14:25:57.4660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vb7mnHS1R7JOsJXvvVK5oLt8vBXc5cXd9uLcGz5sNdSilDcBW6Ql2VMWAtxzBFXYArMdqw/Xi+hngBTi81nnoAUNahkJO3mTdXI0ljAGf9bjwQaSkXGwBet8bKHWP6Zh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8583
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_072602_792263_3D370BFE 
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

On Wed, Jul 01, 2026 at 11:23:51PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The Cortex-M3/M4/M7 cores were designed as a replacement for the earlier
> ARM7TDMI and ARM9TDMI microarchitectures used in older microcontrollers.
>
> At the moment, Linux can run these cores either when they are integrated
> into a larger SoC, or as standalone microcontrollers. While there was
> a lot of development work going into Cortex-M support from 2011 to 2016,
> this largely stopped when it became clear that Zephyr and other RTOS
> had taken over that market. To date, the only Cortex-M based based
> microcontroller boards supported upstream are reference implementations.
>
> Schedule these for removal after the next LTS kernel, so if any users
> remain that want to update their kernels, they can stay on that
> version for a few years before having to maintain the platform support
> out of tree.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/Kconfig            |  8 ++++++--
>  arch/arm/mach-at91/Kconfig  |  4 +++-
>  arch/arm/mach-imx/Kconfig   |  4 +++-

for imx part.

Acked-by: Frank Li <Frank.Li@nxp.com>


