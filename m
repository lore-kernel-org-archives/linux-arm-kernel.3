Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4098C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4xt8dytREu6Oj1MEQQx+92BgL6dyuVDGsTWP+RR3Gw=; b=xKJLlAmw6e8pBfvrNWsp1IAy0j
	da69kwf2OrmbhPd1ZcKUAlYh/Mxba38BHzCdVOpfRIbgQWulAYyikiZS1eaP9qyBpvsi39SKGRvU6
	rQXVCjNYM4fz4HT4J/M9g+p4Xyn0otucvAXSLwREdvhYqKpMyR0ALPKLoaxiN9qL4uF+ooB7doJxC
	tCkZuyOvhppYjWehcMhZ3MzJ3JXR1q+4MaZLkLLaG48X3RzGjhpei3GtVjaQg/n8K4xAc1cyW/rsy
	Q7Lmpq/vw1b5iaZ+hmm6BNUaqlaJDUcC1VmfOzl/sDIsSeQjAoH1V7fwil/UZkhceDtZGt4yRcwt5
	Qi0ifKWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OZ3-00000008d94-0Qs3;
	Wed, 23 Sep 2026 15:07:17 +0000
Received: from mail-swedencentralazon11013026.outbound.protection.outlook.com ([52.101.83.26] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OZ0-00000008d7m-1lah
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:07:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CzRQ0GSrwnu++yiNyy7N9sGI8KtvwJNN9l9t69VvXsE6jbwYAyzDkBklLApr0a8shNTGml6c+pedK0pVTycT6h524mL6G/JH1UkAbwyhH/63nfhz1JG1E35kKPwCANf1ftpN0I3v8q772HMzINA4Pwx6LG+5GyKNWh2K9eiZQVmiV+I8dSBf9ZliqoviWNb0gOtQXrIJN4KpfSZ8SHIMRlPk512G/6iCItK2STIObffJZ4IOmPVvBiwfr1grLWYHjmfSgyArq5vJFplpwgqXUz+xYbnRPLwLYqvIPEkqNtz4rzmDKbGpvVNkPOTd2MuZcZ30i9sJKnSAndIXcDS8Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4xt8dytREu6Oj1MEQQx+92BgL6dyuVDGsTWP+RR3Gw=;
 b=BZFi67Rh6n+FmqL9NdR4GpiwRUuwz8XdGpwwjpFKFByXSyzcXfYhUpt2Dqel6X2kIP05+rF9DR2nNUZZEmvWuBk5mgazHM6g/ct7wdIgxelk122pQa1cIZgY5JxmVCDZpPg92Rm9eHdRoFQ8PYaow1t3lIByHw/lVsbLLO1bbH/yb/0gh70Cczoj1jbfm36izGxwEHwrC1RanXgS4jxrT0NwieXtbgn3wTue5Q1vrsi7v/dLWLpi7TQvE8DtNnSozym3QX7epQVk2QvJXPhDVC8yUZ/yUP225SxC4dXuReCoHCvVecLJLpPFSOdVD2zs8zogehAoSbCbGMqoIk4UpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4xt8dytREu6Oj1MEQQx+92BgL6dyuVDGsTWP+RR3Gw=;
 b=whkjFulsIhOmB7Yqo4JnTkHRZwrMUIhigHdguLtddyuzVICRshOuVkIYQYDub+ejnID5KBN7ykpP9BgBRZHsSW5yKjOi9h9d5KNqs5mizqjonyg2MVh4cNKalU8Uf1NTBBuRgV+ZWoMBn5op+y3YWswCcLRlatziCIE8LZ/xBxLp6n5EuozSVQvFwXSZg0zT1OWzTS86n2pJwcdZAjpW8f6T33Wyj65gCmxn4ZWBXGmiVTShtEa7N54ZZHO3kM6ojXMSiQB85YlAn5bUWUER3JvG9ZrhatJYeUgVrOqUGZ9LfxeIklZ+7nRVB05kQNioVcXtPXE8FQe3huWNNEzlDQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MI3PR04MB12657.eurprd04.prod.outlook.com (2603:10a6:290:81::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Wed, 23 Sep
 2026 15:07:06 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 15:07:05 +0000
Date: Wed, 23 Sep 2026 10:06:55 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Ernest Van Hoecke <ernestvanhoecke@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 0/4] arm64: dts: freescale: Add Toradex iMX95 overlays
Message-ID: <arPrD4TDYhjYxFGJ@SMW015318>
References: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
 <arKn0LhC5fty7dHN@SMW015318>
 <20260922165846.GA290956@francesco-nb>
 <arLJl3jyyytfS_Qw@SMW015318>
 <20260923084111.GA460930@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923084111.GA460930@francesco-nb>
X-ClientProxiedBy: PH8PR21CA0008.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MI3PR04MB12657:EE_
X-MS-Office365-Filtering-Correlation-Id: 7db5c433-b197-4965-ae51-08df19845491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|19092799006|7416014|376014|10067099003|56012099006|4143699003|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 0sKiH0bqu/K/4v4EIwKAbwhmub2Kkp1yGbxmRuw1nx3SrHTLCkI+Wo6I2iMxcw9XoGD/VIRk2iom9OivcX24eCRw8mM2maYTDGDsSzurYW757txu150m9kIcEXYdi3PJg6gIm3YkmshuEBNcluNMN7klkA9hsvFClIyZOqa138yJBqqNufC10E+AvPR8j/iBiQu1xhJnvGGi3DwbU19uN3V6GNO9fVvMbuvdY8IiZFoSn4B/oEPNGaBKj1js/+8+cByRrD3VTtLjlIGGn7bfBAbb1kp5HPJbXPU8Qa30yVyK1ff/XuwRcnp7hInewzdjPaJkF8BbepVUIAf/Jm/XDOHg507PzYU9wW9w4SV90bV8Ir2xZvdOF8v9hiXZlhjeI+IdZmZgabqfMvhD6gB2GZVGo1GK1BCSRdWlSlw6VnXZRMQt13q4+p17kNjxSJ6PmDJ+ZxtfuL4stb+YPuJ4dcl9uc7AURdgMkvaCobxGK13kbozSMDvMiBdK5mAmLa+Lh2Jd5SSca3whdxSyLxRAXcykLwnktK0ZizpJjaWcH/2C6y9UefHvUBXcsD03i1gQWwS2iQHjG9MVvGZcN436hGn//+1UmalZRrWlMoAioBKL7XCZToBoURUilwPjAnG
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(19092799006)(7416014)(376014)(10067099003)(56012099006)(4143699003)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i8JOUBY317HgLpmXNnUK6wYaDLnrWEtlYDAXtGoU3DYi62WPSO8Z/G7N2nIC?=
 =?us-ascii?Q?bhYYa4uL42906KGLJ2R3fYDDG6IhJQ2af8ImT7IuNwbXVyYlsU3abmVnD9se?=
 =?us-ascii?Q?8dp7lrCKeTR1OeRGWhCnURo2V47+clzK7odujU4ECAWtP2fc2kGuK+2/23My?=
 =?us-ascii?Q?MCxEGQVi8VuHOw1TN80pg+2KSry2w4k2vBZi7+V59aUklBF8t5krOh1wwXMY?=
 =?us-ascii?Q?zoosxcp7TE4/lMwrMuW6r3dgpVCKoPPgEJQCIcrVJIER3TKbgkX4FyI6liVi?=
 =?us-ascii?Q?eMOOVrjjhmxaejw0i3MMNQZ2GNDxJSbTNJsYB+eojwFqaXTKIcWlSM1TXWBK?=
 =?us-ascii?Q?1Cm9oyUl4jsZQNYStcPuxRNHW9OSak1F9+m1QhCcxgjimxwxb3dOjCtzWMiB?=
 =?us-ascii?Q?K7Einqgxv2n9tchkUBBvo6WqOKuCruApeUbV/67N61zCfaIc/mGcZCIJ4+rR?=
 =?us-ascii?Q?R1ZA4DU3gQNMbs2pId+rXRCaeJgnNGdegkrKl9CUvJth3mk58HMeYZpPS5pt?=
 =?us-ascii?Q?LO0/xjX+JTHcid7WgQD0lAHWnBJXTgdhiDhpbsM3LTvy7HQrzMUmiSU2wdSF?=
 =?us-ascii?Q?inCdEUlt67urM8ZbRirwLt8sYaT7zWW111CUlt/xzkPa3CRdgRpLEEesrLqe?=
 =?us-ascii?Q?+n1BaqLjhfyBLB3LJN0nfSJkHoU8P/81DEN7jBeKjjx9DQ1IAMkIPhHR2AO1?=
 =?us-ascii?Q?9Wc4i5NaSLB7Ri+yAnOzPz86X4aAFjGVNe7ub490sB0iOO/WKPLxH26hxw5c?=
 =?us-ascii?Q?D76dGP6HnRUU71I00htPyJOYqPSNkJMrKbhq+21diKdKECW1mwwuQLhSzo+N?=
 =?us-ascii?Q?Il5XDHp5a0briUWeubTqarUUQuxnXdrRB4+D0Qp0vdNIBGjigKKqDw8GaN4Q?=
 =?us-ascii?Q?F4GE55ELhmlIUruLskgZ2xyHe/EE/wj/+49gxhVKabJa8+H352LzBlTQlzlC?=
 =?us-ascii?Q?RFCGGso7KcZMatsSaTfFAwuEMdD/RKOihOKqfjnL394gNo5741GNZJx7s073?=
 =?us-ascii?Q?s/jE7yKKa33CY0/ttnkDXbl/HlgfFFiWZ/XRAPobFdNg9TPvTNwEdRHcAuK0?=
 =?us-ascii?Q?vN/kP+hef1Ab2XWc1jp2TmpUQQpjiuK/k4P4lLS9d+j817KoAOohSzPvpXYA?=
 =?us-ascii?Q?L+5QerkSEw/AAMrSVG75LSworrAUmWyPn2gz6L3GXIFn2aFVzWh8sHfJNA+7?=
 =?us-ascii?Q?sJD1v8E3rO2dHG+0DS3rE5JdCTZzmz5uYSj1ynK5dDmq9ey9SDHrPJLs61kM?=
 =?us-ascii?Q?1ZoN6SdJ7ah0kJzujy1bL7L+5SPfLQjmE3pmcdigW34wO7je/mh3ZPoNp8zh?=
 =?us-ascii?Q?nsOkrG3EOWiXNuiJLVyFi8GMPVdbKLk9w5NSEQOUo6pERQgpZMy/f3ioyH4e?=
 =?us-ascii?Q?Vc0YI6G/MaBBj6H8WD9qYz2fIpkL8UfxsNZTW2vC2Uhi+z+2uLSESyF5M3Or?=
 =?us-ascii?Q?v6dOf3APm9uAjmi2XY59QYLcdYiHD2ZxKnOY83cdQY2JbwHzuazm3h5yH35Z?=
 =?us-ascii?Q?13YohLhLOvvZrdddJCRW2Mofx6ZxM9HdrzDdzEZF3kaMGoyh6tGackHecClm?=
 =?us-ascii?Q?CSUv6Se2h8J9/hKIgl0YGuJ7YiBQyWP7j/TlYkaysr8FMPtJSEjFnApfhJfL?=
 =?us-ascii?Q?FD4WK0GoSzj1sGq9V1qqe3LyZvhCqyNLw25o2QYdDmGjdXa+PwtYK7YSwaMQ?=
 =?us-ascii?Q?z/8mvIUXfIu810BXrq8T+nTYYb8ATSH5XYxgK/++JXvutooKVeGcgm1eV/Bp?=
 =?us-ascii?Q?q5SYpIuNRdsvj1b5uG4T4JSxUQSzaoan62zF9Sfub4Nui2qKe0iG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db5c433-b197-4965-ae51-08df19845491
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 15:07:05.8682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7yDc+fQus7NdSMBAEeLgNRmSKMAI/rlFs1W9vHwAluoW+PDT8q1qVfseYO2joabswkMMbfDFR1N3GpSN+LreDhBgYK8MvtmwpH1JQyNDPKaRcOLvGraH9WpZ1s9IyWGw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR04MB12657
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_080714_466616_94046A48 
X-CRM114-Status: GOOD (  44.32  )
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

On Wed, Sep 23, 2026 at 10:41:11AM +0200, Francesco Dolcini wrote:
> Hello Frank,
>
> On Tue, Sep 22, 2026 at 01:31:51PM -0500, Frank Li wrote:
> > On Tue, Sep 22, 2026 at 06:58:46PM +0200, Francesco Dolcini wrote:
> > > On Tue, Sep 22, 2026 at 11:07:44AM -0500, Frank Li wrote:
> > > > On Tue, Sep 22, 2026 at 04:33:45PM +0200, Ernest Van Hoecke wrote:
> > > > > This series adds device tree overlays for the Toradex Verdin, Aquila,
> > > > > and SMARC iMX95 SoMs.
> > > > >
> > > > > The series adds support for:
> > > > > - NAU8822 Bridge Tied Load configuration on the Verdin Development Board
> > > > > - UART_4 reservation for Cortex-M7 firmware on Verdin and Aquila
> > > > > - SER0 reservation for Cortex-M7 firmware on SMARC
> > > > >
> > > > > The UART overlays mark the port as reserved so Linux does not claim it.
> > > > > Firmware remains responsible for configuring the UART and its pads.
> > > > >
> > > > > The Makefile entries build standalone DTBOs and ready-to-use composed
> > > > > DTBs for the corresponding Development Boards.
> > > > >
> > > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > ---
> > > > > Ernest Van Hoecke (4):
> > > > >       arm64: dts: freescale: imx95-verdin: Add NAU8822 Bridge Tied Load
> > > > >       arm64: dts: freescale: imx95-verdin: Add Cortex-M7 UART_4 overlay
> > > > >       arm64: dts: freescale: imx95-aquila: Add Cortex-M7 UART_4 overlay
> > > >
> > > > both reserved lpuart2, can you share one dtso?
> > >
> > > The comment in the DT file must be different because it's important to
> > > reference the actual board it applies to.
> > >
> > > So to fulfill this request we would need to add a common dtsi, include
> > > it from two different dtso files.
> >
> > No, direct use one dtso. see
> >
> > https://elixir.bootlin.com/linux/v7.3-rc3/source/arch/arm64/boot/dts/freescale/imx-pcie0-ep.dtso
> >
> > And makefile to check how apply the same dtso for difference boards
>
> imx-pcie0-ep.dtso works as a single shared file because its content is
> generic, there is no board name anywhere in it, and nobody needs to
> apply that specific dtbo by hand to know what it is for.
>
> These overlays are different: they are meant to be picked up and applied
> directly by the end user, in addition to also being combined in-tree
> into a ready DTB. Put yourself in that user's shoes: they have a Verdin
> board, they want to free up UART_4 for their Cortex-M7 firmware, and
> they go looking in arch/arm64/boot/dts/freescale/ for the overlay that
> does that for their board. What they need at that point is a file name
> that says "this is for Verdin" and "this is the UART_4 one", and once
> they open it, a comment that confirms both: which board and which
> specific UART. That is the whole point of shipping the overlay
> separately from a combined DTB: it is meant to be readable and
> applicable on its own by someone who is not a DT expert.

If someone is not DT expert, most likely direct use your prebuild dtbs,
not apply dtso theyself.

>
> There is also a second, even more constrained user: the one who never
> looks at the kernel sources at all, and only gets the compiled .dtbo as
> deployed on their distribution, e.g. under /boot/overlays/ on the
> target, or the more generic paths used by distributions like Debian
> (/boot/firmware/overlays/) or Armbian (user_overlays= in
> armbianEnv.txt), picking it by name from an overlay list or a U-Boot
> env variable. Comments do not survive dtc compilation, so for that user
> the file name is the only information available, there is no comment to
> fall back on.
>
> A single dtso shared between Verdin and Aquila fails that on both
> counts: the name has to become something generic like
> imx95-verdin-aquila-uart4-mcu.dtso (immediately confusing: which board
> is it really for? can I use it on either?), and the comment inside can
> no longer say which board it targets either. That is worse for the
> person using it, for the sake of avoiding 2 lines of duplication:
>
>   &lpuart2 {
>   	status = "reserved";
>   };
>
> It also does not reduce the Makefile churn: we need the same number of
> Makefile lines/combos either way, one dtso reused for two boards or two
> dedicated ones. And this file will not change once merged, so there is
> no maintenance overhead from keeping it per board.
>
> We agree that avoiding duplication is generally the right call. When
> there is real, growing duplication across dtso files, the right fix is
> a shared dtsi included by the dtso files, not merging them into one. In
> this case the duplication is 2 lines that will not change, so it does
> not meet that bar either way.

It is not exactly true. include dtsi only one method. Basic there are two
kind type overy all files

- one is for addtional boards.
- change configuration.

You provide difference configuration, basically it is developping boards.
The real productions is fixed.

Your uboot scripts or other manually should hide complex. like PC grub
menu, just choose 1,2,3...

If someone like advance, he need know more knowledge.

Makefile show how to apply dtso to correct dtb.  filename rule can't
resolve problems without know detail.

The put lpuart2 as reserved also used by other boards, not only verdin
and aquila.

Frank

>
> We would like to keep the two dedicated dtso files.
>
> Francesco

