Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D859FFCC9C0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 05:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ev6RCQvJRbf8x/5r7dHolgcNa7lxQ7+7ZRvpgmbfgPM=; b=4T/NNJPsq3/7hAwgYzISYeyK8P
	Av+N77jYbOqPeFdhBNttCMRVUdmYh+IxB0EzzYRVdk0isqUtkQ7CCKEi6/vN3Lqn31xNtOyJzOLTW
	jHyuhoF/I8qV3+BP2ZUfkbRrr9SYjwnRWdqTtD1C2r6EOQOcxPOLnKMndqhr/XWFg+rw2sRlRlSIe
	jOoWbgqgn/sO+Iur4SPssQRXjHwiZE7fCf/4mvK2SnBUolE62rpAzMlLPwffVilrtpGe/Zcdjq+DT
	Cofu3vA+akoVat6WZ1140VuoIwU5Rc1sq4oi6zUffR5ikqIfFHM5T/oozY7nx9CxKJxHlR6v8nFPO
	U1cU1v3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzpKK-00000008jDa-3Q5X;
	Tue, 10 Mar 2026 05:08:16 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzpKI-00000008jD0-2v01
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 05:08:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n4YsDXRCaWGtXh8kwvDy4ntBo09TPEuO/m80YhHIIoc2/sH7q5nr9FtCUPGZkiu2Hb2g7cLDvulRzigMU6srzR34JYn2i0KTRUvfipCCM0y2C7eCfZOc03FKwoe9U09UeOpn3yJGR0MXwA/amGRB3LuljTNu/GDUfPNE1NzQOVqM+uUPr1p1rkPEp7XIURpLkWTw4b+MEq/RnLqoCK58EeACpNoSqKsbi7R2oOsM5P4V/SRuzT/WMUNKad4bDyg64Yfpdp3iH0sxWcLhJ/geZ5fdg902OhTC91FXc5RAJKxTZd04rSCUScJ90H681g8iUjw3bEjZUzVe+osuNg9JFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSVYUWPmtn9ry8OluASIKabc3vlVCT339hQTI27nqCc=;
 b=fp0rv8hhfkF2CaWWkEE6xZUl83efZ6lB2k1pqJnaVVGK9w3w3QQf5J3mjD3MmrsbwKabe5874k6RSO+syFjRHumvxYnVsqnUlXH3OZogb9If8b1sfhGcGIpys1qTpjg1fEgCugaNSnnj1JSG8TSftTvSH5FVZkYgOVb1W3WlMsnTCmVO63gGndC+XthVhbZEpQr+mh8Xx9nVAxmkZL/UcnTRsgA4VxiQxqppwNestNoap6Jqekprz9Krs7Nl2g3VEMOuFRd3Olj9tnCKLcrnMCaC9HaK6LRb6imTYufNP+IMq/VfgoXpz5YLg//uTyPdgUfhhdZmrxwoQ6JYQouaGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSVYUWPmtn9ry8OluASIKabc3vlVCT339hQTI27nqCc=;
 b=c9Jqcffj3LHJEuk+ccHVkz0+Q9AL5L/0F3Ywhi2FVXuxThooKsbWyhEaZtoqgxekdSFnnMnYUkzuP4uIE1DLnUnI7OtUaUqmxq4sxy7+0cYqyrc2Rpz+quGzqw3YPi/Qb2gA0Rqp+25Kl/IUD0UTxemCiYgAB0gnmiXQ3NZCmzXGHtT7F05Aok3vtrQDVFT7E9XaF7X1tCEDFnWbNsEqLyRs+21ftcvRbzz7aftxGVgGKifohyx/56pJvtgVIcFj21e/pPI+RL6dT5nxZOc102g6OmjwoLlW0NgyJwdOhqhU0BuPbr0CU6NEXRyt6LUlySh895DDzMD5KFzcLCSbVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB9151.eurprd04.prod.outlook.com (2603:10a6:150:26::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 05:08:05 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9678.017; Tue, 10 Mar 2026
 05:08:05 +0000
Date: Tue, 10 Mar 2026 13:10:04 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/2] firmware: imx: sm-misc: Print boot/shutdown reasons
Message-ID: <aa+nrCbgR52liaMl@shlinux89>
References: <20260305-scmi-imx-reset-v1-0-18de78978ba9@nxp.com>
 <20260305-scmi-imx-reset-v1-2-18de78978ba9@nxp.com>
 <24409695.EfDdHjke4D@steina-w>
 <aalZV981HAneFWiC@shlinux89>
 <aalff2CtcIeln0NG@pengutronix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aalff2CtcIeln0NG@pengutronix.de>
X-ClientProxiedBy: SG2PR01CA0130.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::34) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB9151:EE_
X-MS-Office365-Filtering-Correlation-Id: 30f18ee4-ad3f-4ceb-0364-08de7e6302c4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|366016|7416014|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: R6vkFoqJgsGry5kktK4r7k25aW5TlHj9+xlfcw60bArdl6CjE4XnbQzsjinichMMXkmNbOW/2UbHwjlpnnXkS05MPN3uxzm84aiav/2SW0ReJvkVf/8c1xtXk3SGs0qMjoZBVlLr6JyrtT0sM6MEZD1a/iQHFl6rCaQVq1R662j/qaYw9VeR9wapTZiksEHZp7vBe49Nb4fxoo7jXk2/MOFozuD7/s50byP50gpq7HSufYXVA/QehBHAPsDgnvmap5aN9wrwYtgb7V5OpeSfOZK8Fp01oL5dQRf3qU/DE1k69ydlXZRqJPf3vxI8xV7AHETRurPl6Grjy9pSZy+052YRau6PUPhaFWXhRadOEvUZ6xM0szm1NOIyexTe1Nwo6Pfta/M38HREpcDHGd4TAZUpJlZUm1+z4SCRuS26KnxjKx7NIEFaUWjovCUSkwE//LlVlVgr8dnrLuNeUFNwxwb2yTx8OeHzwPp6k9mHLu7aNcG2/BsZVl6xbnjMj0hMOF9kxbS0ZVpmZnJGWQ8hTXe1JzZftxp181KqIWhQ1zGMo7mvQKa9RzKSYNYaB/ss3XQaesJkBR92YCHVg2ILhlXQOn1SLNlHgDaVRYUO0UMaB30nQyRsbZBdAHUOFKy2yoNR6MlJmjib8sexj72W88Zi1A76PED2QwPd1iz8b8Gjrtk5LX/IwWEL16+6YsjZI4BwkH/v5RXrgBAtoyYt/BHTNKHdofnVH86GUfz9E1/W8RH8aM281wVBwkjsBJsklaWKxlso2z1hZt2ild4c/3/vQX5FFXrIYHenyBN0Vzo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(7416014)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Rcv0l7EHQz0NuQUjGla4g1HD0Sg8gPli+P+P3D08XnyzYBySDdrXPpIb26?=
 =?iso-8859-1?Q?lyJSP8cu40ne1Bm/mEoGN6LEGgWkXiMSuulevz3Zwm7PIocBbcF4NPjujq?=
 =?iso-8859-1?Q?EnT+XzqfAp4kxk/V+yZ1nboH+5upH75kpWhH82/yCCIKCb0oTQF9qRHC/w?=
 =?iso-8859-1?Q?m5VNh5MUEkxPQuhSgXNX91bnNV0chqeYnBn2ERvMCntJYsL64mLakTxL5q?=
 =?iso-8859-1?Q?+R80hLBqTAdwade6i60EpiT6Z5vRgY/O60mPqVJV5PK4z61hGB7qp1/oZb?=
 =?iso-8859-1?Q?kHceN4oiETed1H5Qp2JNgyU0y7DJoBzf5r/CexeTLxt4Db2dnXM/58m0ne?=
 =?iso-8859-1?Q?7iM8hKO0cUROSre5zyHQsTkw+miP/jALWo2lQ+JQlHGdGUa9R77llA+SqD?=
 =?iso-8859-1?Q?wrIs0F0Pw6WfTNVn75N189D/vvpmRRQ7pywAcSDVV3uScel5AXUF1JcDKJ?=
 =?iso-8859-1?Q?FRo48VdLKDSOV+pKNJL/aPS1EkjIEIAByoumqHEtfNZEGsnhsyqaNaevR9?=
 =?iso-8859-1?Q?bZ5X41qaEm3y/G/0ilDeeSbNM3t9Smgb4YVDkCCL/F/gaXYlpH/7rEoaeF?=
 =?iso-8859-1?Q?Azp1j7ATLZotDuYlSyR7Dn0yppKLo2aTuwJS0QXbcrkAXqjZDnTKpTEFfZ?=
 =?iso-8859-1?Q?cosFRukGrXG1HaRmpeh/92g09hcsKlsuF4697Qh8ZLhnYtHaX7JI8gQj6r?=
 =?iso-8859-1?Q?e7WpsDWHTHOjJlNIcRzKQwIOY7wAuHt3mY6c8WTbgOo5FA+olcgHH0TKXj?=
 =?iso-8859-1?Q?RVMttS2i3QBFB1KPUEg3AM0HYEVJbyxEPjUk1+MEsqX39WHBMvXDmALymG?=
 =?iso-8859-1?Q?FAO3lIQAvH0alwB0u2094SrUHs4qXToMVxD+WP/iwr6PKABjxR079GJPrT?=
 =?iso-8859-1?Q?SKO8cGwtNWOAQ5e7rIK608YHBXLq8WPDCH2o24hTj71BP2dDM5n+xSK270?=
 =?iso-8859-1?Q?LyiKFzJjBTmpBOJJuBCD2f6iE2OlqYbnG08SVJIja0rl2QDJNd5JrX8eDU?=
 =?iso-8859-1?Q?Fc7iSOnJtXXausn6khNKskWLMFCpe/5JqqA3A/TwLBeMvUe7Lr9V47bko4?=
 =?iso-8859-1?Q?ozmhecLXvYNBPkt9wWDw54wHHtz6QQwQb0hOMyFct6eWCLTp7/rbC+1H6V?=
 =?iso-8859-1?Q?sdUMbpMUclb6+f8oQcZg51X/OuniR74lMoX1qu4+lyHzAUvgOgmDoK1w/d?=
 =?iso-8859-1?Q?ogQbmeohHFcGT41tAVW3JSzXgFQ6UgjfIbSNyQqdb4jcswBYuf2/2z7Ejc?=
 =?iso-8859-1?Q?C/n9NzJLzYSwTgZSk9Sq21zb6rV+ohoZfDqKgfKbXuAEeeU1xjLSISTnGR?=
 =?iso-8859-1?Q?fu54+crZnJxlPVb6j882F10i4IKb7cDvzRMAWyI9Ulp+1mmxUgYXjBrwYX?=
 =?iso-8859-1?Q?mmHeOxePPHLOQrBKKiFn3HLHqkvpxoxJMVMva84d7VBwFawtTCvEcLQoGk?=
 =?iso-8859-1?Q?nPCA+RM3GyouTagBMgZkUNySjYEviz0vm1qAhPcHeYy+CHyKNd4M3seZXa?=
 =?iso-8859-1?Q?YPAyADSTOLBNhselUNhhVGzZrvGnEUKciMHX4FlCTbgaM9jXUxdm5yuPFD?=
 =?iso-8859-1?Q?y6Mm09kS5PZirDj46n9slTPasNHozrOYD1Ofvb2AFV6guxu8yNWBdxQJa+?=
 =?iso-8859-1?Q?/5dp2bIE9cSSGSyarN0g7HxVspjkLYdmHGXMI5KiPoGiqWhJbmMkYNB1we?=
 =?iso-8859-1?Q?MMS4rgf7cdvFEH581riG2L1CRqtWw+VPxyK2NoYH8NEfDNHWTmdttQuXaU?=
 =?iso-8859-1?Q?UZ8SmC+dtxGUALOZBN/qY6ZuZvBB7QCud56vTniiKNjtL65xvj/XbS3g0x?=
 =?iso-8859-1?Q?QbzIoRe0Ww=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f18ee4-ad3f-4ceb-0364-08de7e6302c4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 05:08:04.9701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jWBIl1cbOnfzIEZfGWTWuKgBkyntvcfUwVU/lKYwD/1ekeAJP/UDLfhWsg3eUjTQzS77dKtcSO9gP0iTSdnNSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_220814_741228_4A548D55 
X-CRM114-Status: GOOD (  16.71  )
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

On Thu, Mar 05, 2026 at 11:48:31AM +0100, Oleksij Rempel wrote:
>Hi all,
>
>On Thu, Mar 05, 2026 at 06:22:15PM +0800, Peng Fan wrote:
>> Hi Alexander,
>>
>> Thanks for giving a look.
>>
>> On Thu, Mar 05, 2026 at 08:44:26AM +0100, Alexander Stein wrote:
>> >Hi,
>> >
>> >Am Donnerstag, 5. März 2026, 02:56:45 CET schrieb Peng Fan (OSS):
>> >> From: Peng Fan <peng.fan@nxp.com>
>> >>
>> >> Add reset reason string table for i.MX95 and introduce a helper
>> >> (scmi_imx_misc_get_reason) to query and print both system and LM
>> >> (Logical Machine) reset reasons via the SCMI MISC protocol.
>> >>
>> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> >> ---
>> [...]
>> >> +		if (boot.valid)
>> >> +			dev_info(&sdev->dev, "%s Boot reason: %s, origin: %d, errid: %d\n",
>> >> +				 system ? "SYS" : "LM", rst[boot.reason],
>> >> +				 boot.orig_valid ? boot.origin : -1,
>> >> +				 boot.err_valid ? boot.errid : -1);
>> >> +		if (shutdown.valid)
>> >> +			dev_info(&sdev->dev, "%s shutdown reason: %s, origin: %d, errid: %d\n",
>> >> +				 system ? "SYS" : "LM", rst[shutdown.reason],
>> >> +				 shutdown.orig_valid ? shutdown.origin : -1,
>> >> +				 shutdown.err_valid ? shutdown.errid : -1);
>> >
>> >Is there a way to query this from userspace programs instead of printing into kernel log?
>>
>> I not add sysfs or debugfs to get the information in this patchset, since our
>> customer only want the information could be shown in kernel boot log.
>>
>> But I could add also sysfs interface to allow userspace get the information if
>> you need this feature.
>
>I started to working on corresponding framework:
>https://lore.kernel.org/all/20250618120255.3141862-1-o.rempel@pengutronix.de/

Thanks for sharing the thread.

>
>but it is stalled due to devicetree decisions. I wont to respin the
>discussion tomorrow

TBH, I have not look into the details. If the generic framework could land
into linux kernel, we could use this in i.MX SCMI reset reason. But I would
not add dependency for now, so I will still just keep printing the log into
kernel log.

Thanks,
Peng

>
>Best Regards,
>Oleksij

