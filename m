Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1E0C44529
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 20:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ks726F+FffDq3liCKZmcamqRPugLB0ycvaB7QOPPiFc=; b=KcRju15Qgxm3cDrnkS5hyCF9aU
	frMacyJexBo+ckiN1unQJ6NS5EG/WarYPBtepPvl+fv4YASCVYKjEE5Ti0N7PFiqoMnfy+XO7XpMa
	pN8mtrp9UxePV1mbO9Xs7gDKvdJpN6PS+ll7bJpTGqdWFgrue+F+5qgbGg6Mvo9n1gRhCGpRbsP+B
	UgexQTJdT93+yXm4OeEUGTxofn1HsewB5mcCeoHpkEe09IT+jZuul36574wcLc60vFD49YCwq0pF4
	B2Z3OX9VQSzypXk3jLvEIzQHhG7KzOqwmuwEJSbANSldhjiwQyoRUzUD9m2rjLHGjpxy1loaNbOeI
	SB8RV2pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wluLV-00000007pof-1tCj;
	Mon, 20 Jul 2026 20:12:13 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wluLR-00000007pnw-3nK1;
	Mon, 20 Jul 2026 20:12:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYlt3RJFFSXeXPOnJXr29jZLhe/VtTsE5w6om8Ks68p/QXusMcYqRqlwHecxbmgeqUoOp/kmsBzHR6ota6Unf8+M+jedBM2vankfPyxZbKTNcdNj5DMAs7qt7VzCduqL3yb02pFlhavqV9rDXth6jJtkNQ8m0Ho3JmIFFbM0wLZs14uv/AMZRdXmMAKD4AQgSyX0krNnZFYf83q3C8eBMxnM9p/seRwyS5oBxkFmG1BuZUii3D9ZBsIB0JEbSz1j+9gQoQtjv2Y1EP+d+DJbqfQTxusd6tUH2EwY6x4Va8ctaGITUcAh/Dx8OESRbbXaeKlp/tA9+ATNuZVdTI7r8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ks726F+FffDq3liCKZmcamqRPugLB0ycvaB7QOPPiFc=;
 b=QY/ASNERVaYGC6ppEdXD+piD89AtrrBrDI6JcIbds0vMCGTN4BOIP1c92Ne+lHf85rzdilz3zD00uVGHk/NVv4CRQYF0SnH4A12JQPzKsd/r4GUFc+PYXmdlwCiijVhA1RInVhq8hZT9jIAkHDh2dXw2T4DOS92j43SKxjK6FvIXevh5TWAoLgt3+u1iUAsDvdv/nvmmuwAb4VbyBnCzv7a7iamdISE850HgPML3stHYxDActOiT/e8KTcwPHCidVnqakYQFKVvNULxdlqhUrQ62HLA8zGB+wqXBdSjXZaT5qmJ3M5+appk61B42S8cwycRYx88v/SYWZKbaP+dIxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ks726F+FffDq3liCKZmcamqRPugLB0ycvaB7QOPPiFc=;
 b=B8dc8xAO2tq/+ouVUK6WJIHX5op/AipJqifluA0WefY6h7JaGk/RWnnOm9a6jeLZd2vx3DIiwXmjY73GRXHhED2W6Blg92kj7mtwq1g43zP7oM6rkQrdvspkTm6o+X+KyPX8yVEO6E5zjuCWAuvNxba/+6fJr5g0RlUHyjzeEv9z6QBpGjKOPG37aEZuK0KyYWc+NS06DPBmtJy4Gpl03WTtihYS6Ipf/JZbDPANMvx25Znmt6cektTFV52jwPq2puTNaPYADzHFB64p+zymPzQgckPgChHEnnEjLSsqJOTt1TjrlEbBko9P2lWihjBhdfv9jEZ19/vcFN6+60jwHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by DU4PR04MB10385.eurprd04.prod.outlook.com (2603:10a6:10:56d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 20:12:04 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 20:12:04 +0000
Date: Mon, 20 Jul 2026 23:12:00 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Michael Walle <mwalle@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 phy-next 8/8] phy: lynx-10g: use RCW override
 procedure for dynamic protocol change
Message-ID: <20260720201200.w6kq2uz6zhwu2zem@skbuf>
References: <20260720133642.136324-1-vladimir.oltean@nxp.com>
 <20260720133642.136324-9-vladimir.oltean@nxp.com>
 <al5ODzYhpE-wHSSN@vaman>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al5ODzYhpE-wHSSN@vaman>
X-ClientProxiedBy: WA1PEPF00005B89.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::637) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|DU4PR04MB10385:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f17b984-5319-4ec9-4ae8-08dee69b2a72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|19092799006|10070799003|18002099003|22082099003|56012099006|11063799006|10067099003|4143699003|3023799007;
X-Microsoft-Antispam-Message-Info: C5p13TU18LHU2HVMM1p9ZHMUkLm2tOSxeY2FrMcY6XFmpIaIVD9cDxybUsnyUe/bQAYcrqpS8rHQZ8jV+5UyANXcniJ6B0ZWR7X6pIkus+UHQ4ASGiKGZBu1Y9dYT7pV+8j8lhI30vPgGQK5anxHJEsuqgUtGgJoQaCi3pgIT7lGw/O0NtBKM8YOET/8/MG+hZmmeLGw95QHWvp2QWr3vjAK8cCeK3Rw6PGGxzuOBD7KXn5FAgkRRbUYJ5EshclhG0gp1hzRl7eV9ByY2QuJF9nFjikk1uloz5sr4iSyt50dJR/uCiftlUdo7q47L0m4gGvZ53IpAsfk40HLIoMiHoFHzhopcWkmGM0w4BkNmW7fDbDqO8/F0ccklN6CqGBIbVTbZWNaJYlw7wd/SwsuR3OPNsaH2OVj2eGyCCV7WuHhEasd+K3CszLPDzp+ubarEOVOSNwg95XvNYkErTejvo0eR6t9VW/f10p9yWRICau7NBl8uAa5XrHnTEuTTxbVB7WlEPPSuLnx8do+HHLp+jfuAedj2VYzB79JR2eja1WYGQNjBbsUcSFDa+XFAcrOGsi9dDtiwBHafwnwQrpt2mbVL4b2GzG3qOvSMCWbGSDdc7o8lXDVRfKWM9c2P0yEUQNa9I1aJppYlU6BT4eLZVth808YuBOZTadwlrWEF4E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(19092799006)(10070799003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(4143699003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WeeWRPyz1E9hL0vuHawNahGfXyYxT0F68oOD+V2xR5zCp2HNwmqVnhkYd9fc?=
 =?us-ascii?Q?bu0eU1F84KSjv5rOH2GydWNwkdU0mukS/qbevpBz3/ZbUA68zj5Zt4WXO4iW?=
 =?us-ascii?Q?206HZo5BPiTg/+9kq21PlJzssnShsAEVNjUNNXySVx+sN73EHEApSzXHXg7o?=
 =?us-ascii?Q?wgaNgfjFUu0LP61GBDA6KcKBL+KZVNTVfXsh6UzDrkIReNuERSA3O8RyG8/d?=
 =?us-ascii?Q?D3npyKc7g1XMvDeI5TltZshE8X+UvWaHK66tI7yuzFQgzeharPDGPsuAgoYh?=
 =?us-ascii?Q?inwilGYzQKV89TXm3nSYnOUMspriME2rWuTcIqRXIU+n4rhdpkmYejGvb+jR?=
 =?us-ascii?Q?UeZcT4/TRZkKP7f82kGCQOMX0a32DFR+afd4Ui1Fh5w59j6Y3D/wYmD43Qk3?=
 =?us-ascii?Q?BpNNXVa3NqG/WFykmDG2km3dJHV/MIT8u+AR8qJuPeseUYp/aLQ6rxScHro3?=
 =?us-ascii?Q?GI5ZZVA/fCyvho9Y2rVImayJH5ZhJ12zWdNgWzX91P1TmMDVz1wPbhVpAUx6?=
 =?us-ascii?Q?KqJYxDLzKL6QYeNN17pr3jDXSIH6qIo21L193L1GrGVIGi+g2oMmDO+LlzUZ?=
 =?us-ascii?Q?eA8LI6WdvSkLSMT4bkQMZUQtDLnL6eF1D4Q+bcSaEOhUhmGtmIal6T0WhkAa?=
 =?us-ascii?Q?kgj1G7L0jLWM8OjL2E7UE8UlKTDxaqLp4CWQmgxuTzbsErR+q+NbEWiKaURM?=
 =?us-ascii?Q?pDtP/oS6r9y8KXiFTz0kxR8hhyXy3OBmA3T05xHe+G+wzhG4z5+1LbCNThdL?=
 =?us-ascii?Q?Q00SEQuggkvoOHT7W3Ldr0bSynJy6MWfzTIdcE3qS3Y7qVV6f081+U/po/j+?=
 =?us-ascii?Q?qJTw51i7UgulW7+FAxJqWqFfU0JllhhMUcphTrGlwk+89vzqHnY3Gar1IHPI?=
 =?us-ascii?Q?BHOq4AIV+Oqb9RfmrM+SYRumfVKhiOcQxNHiLN/9ua/i9duohk1teA9pYZqN?=
 =?us-ascii?Q?HYIDVmlYWG67LFATR4ZFqBXmWTlf8QueeH08r7ahhuXWGgDLV+PgiY3yExin?=
 =?us-ascii?Q?Hjv2sXTRoWVkmidmEzMZ6KCDQJrSodm+R5kMgPyllelnPTVaxwRvb6t+d6S0?=
 =?us-ascii?Q?EF3+cj9up/x/mDv1oZa05gI2GZHWwRQHgqYXPAZEJl6xKZvQVoSWWDXt85q+?=
 =?us-ascii?Q?9Kppq8VWHeJxizM95hHfgCrU01QLY0H3azL5e11Y3PgJkqfjxJRB7tSxP9Ya?=
 =?us-ascii?Q?ARRZbubd6F5JXiiUs1vPTN4HVe/Z9Z4zl/qbfeofiyRA9t7S4tyJY2oJUICw?=
 =?us-ascii?Q?LydGI0SQJt4+okKZqYK4W/VMfTShp47QglY84AO3gRw0oHu1ZF5hxiyABR7J?=
 =?us-ascii?Q?VivQVnZzUU4uP+aedvPnqOaTMtnBL9k89yPeFKL8XDDRclE2l9LmSl9McUdx?=
 =?us-ascii?Q?YeKViMzbXv7a4ZVtQ8xgH6S8dxfEvCP7QdEEZiD4WNaq+YdXTBCocOTexO9I?=
 =?us-ascii?Q?vyVpn6jwCgCnSMhFS0vtcmE8V0qhNvskXLUjqGHxkDdRKSLuvEto52e+RqNQ?=
 =?us-ascii?Q?q3hkyCgXhBKmSXQyrC7fW1yTbE0Y+Y7//wkfUIWi8bQUYfQsLYcCeD/hO6GC?=
 =?us-ascii?Q?JO/rINQdk3BeL3ilI5OtoDmKjbEF2oC3hEjDW37SrvThebALYYTon8zkbTh2?=
 =?us-ascii?Q?seQ+7ZUnHMwIweWNpkqtNH0gCPrg0qs6laOF6zjpxhrvlewF7z5jshan2Xft?=
 =?us-ascii?Q?rGA8XFFyy4hl/FSYOxaBztaFblt+opCxUq8/ALAufh/APiq3A22k6logtW/b?=
 =?us-ascii?Q?yty2+E8veOZIf/IAGjJnvBqSK77fnMBvmEKOllXJfWXC9Velg7+7T/cYlg+5?=
X-MS-Exchange-AntiSpam-MessageData-1: u1r+vTLN6uopO7TDpah4D1W+CTjfdx6V8Cc=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f17b984-5319-4ec9-4ae8-08dee69b2a72
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 20:12:04.1944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2RceXMpIQEoov8zwSi5bt0LW9FU6WzCKBYUchYWqUfJagMKgI8EIts5BvPWT68Wuq+ZvmgulU2E/ZBSwemFESA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10385
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_131209_987960_F751A500 
X-CRM114-Status: GOOD (  13.51  )
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

Hi Vinod,

On Mon, Jul 20, 2026 at 10:04:23PM +0530, Vinod Koul wrote:
> On 20-07-26, 16:36, Vladimir Oltean wrote:
> > Up until this patch, the only protocol change supported was between
> > 1000Base-X/SGMII and 2500Base-X. The others require an RCW override
> > procedure which was lacking.
> > 
> > Since now the guts driver provides the means of applying this procedure,
> > make use of it and remove any comment which mentioned the limitation.
> 
> lgtm, is there any dependency. If not I can pick it
> 
> -- 
> ~Vinod

There is no other direct dependency, but I need to send a v4 tomorrow
due to some valid Sashiko comments.

There is also this patch which seems to have been forgotten:
https://patchwork.kernel.org/project/linux-phy/patch/20260612125731.133330-1-vladimir.oltean@nxp.com/

Thanks,
Vladimir

