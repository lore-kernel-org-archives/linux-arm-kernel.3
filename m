Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9820DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 19:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJkyAFlBL9UguzFac1zTtX83kUekBA+QIwn1Y2uhNNY=; b=bnGSVXgeiUG+rwxhGn22CAeJFn
	LEHtWS26MXj7peH6vP23436pfVwQ1rvhmTGUnH0wXGhdrVEzzpP7e3BLcaTBRv7fNdVZeFX2QNPA3
	i3BR++DrYkIFMxhK99t4JKSxwQgHYXDRBeyQ33X+Zg7a4sxKnF3H9l4HOBde+Nw+fBwpjXoL/uX2L
	KxBkfSxT0kY/MKtOUM7qBhKR3N03lQXtI2l4dgD6cyWYNlsHUhQi/3AMl8dsNMXuTcKHjIIQyJpsW
	nUIuHpGcYPgj5yT/wEJONgFX5XwvrkA+jKFlaskFJPypnvhDEn5Yp07TGFjRSstimLY+h0vbjlGWs
	uxsg0zxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMdo-00000005Inm-0RST;
	Thu, 02 Jul 2026 19:00:04 +0000
Received: from mail-northeuropeazon11010005.outbound.protection.outlook.com ([52.101.84.5] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMdl-00000005Iiu-0V4n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 19:00:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xefZsPHiqWlRCZiS63YGoG8EGjr6r8FLb0xdGDLMsP5iMf5t/Mi1DyLq9vyDrfiqgsgPc8a+O8S/onB+qYm4TafFSWUo5ksa4o9PiSVZKphgbQCzEFbMNb8NgloCsXg6G3u9iqcObOeh/friBFkCV2r+y9oFCGcMyya28o89Y8YDsBCFJVy/tESmkHsbUh4jVgK7YPjLMO23++ME8mUK/AqTcCa5YzjEnW8nI/g+kCNe6OspHemDtZo1ZcbHeF11fjoHmDjfO5hCyqz1XsTzof8sIKBesqXJFbFk18sbj05VBbejIZLa0eYtcEIBZvqQywn4iaQG4NiMm84M+Gc7RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJkyAFlBL9UguzFac1zTtX83kUekBA+QIwn1Y2uhNNY=;
 b=WkOOUHRSEPyCxObiD0Izc6jWzFVn4lZHdhHoZ6Ok6PwouT/bZ5gSFJz3mD4VslFJxSAzvkjS77L/gxhLacteV5DcJ3y3sRln2NUPZhPDiXEEBbDQGnFhq6uQcmpGujN9u9gTatf49q29ef/LStdORLYSJHcOA/RklYBFfHclbiaAVt0qZD7fsY9sL8zOtNuriB/m07tNlxnntq0cION0L424kXo02fW0rmhJ/PUJou8faeEonIvHotOwc8M3Y0vqOib2rgjYTS480yeHuk6JKXXMSvYhsPP8G5iUeymp3UfjTPe9HMiQT8o5VHlg/hTXByytY44FWuJQr5pxduORmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJkyAFlBL9UguzFac1zTtX83kUekBA+QIwn1Y2uhNNY=;
 b=s1ZYim2k85INqrjtvDb48SvZHeWrdCphzB+Uh61+Ipk7omLtj6KwF4ZAm9Rq6TFXs4au06SiwP3qLk0+be7q1RnTRrWnSIh7I5ps9pcnuTwoneIN0nLZ/1JCGamVJbtevQwdzPz/78MoHz22Mj65kQ7fRjrYk50sfmUFBWHR4wlAfDHML2o32TWPKgkXGar8UdOvEd9EI+csz9aNq2YI/apB/VdeQQ47keJqnDyHKW2zGFWzNUlLjgns5bOTXjdpu0RJ+ZY3blPWmkO3HUwDgygokRPjlST5cshIL+mV8utAF0CkT0AgjYeFLyALK0ccr4OMOCnHa1laHZA91NFMTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB9194.eurprd04.prod.outlook.com (2603:10a6:10:2f9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Thu, 2 Jul
 2026 18:59:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 2 Jul 2026
 18:59:53 +0000
Date: Thu, 2 Jul 2026 13:59:44 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Frank Li <Frank.Li@nxp.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Guoniu Zhou <guoniu.zhou@nxp.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 2/8] media: subdev: Add media_async_register_subdev()
 helper
Message-ID: <aka1IHI3ar8FS0ei@SMW015318>
References: <20260702-imx8qxp_pcam-v7-0-b47d9e363400@nxp.com>
 <20260702-imx8qxp_pcam-v7-2-b47d9e363400@nxp.com>
 <20260702161519.GI3534761@killaraus.ideasonboard.com>
 <akapt6v_DBJSAnj0@SMW015318>
 <20260702181920.GJ3534761@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702181920.GJ3534761@killaraus.ideasonboard.com>
X-ClientProxiedBy: SA1P222CA0077.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB9194:EE_
X-MS-Office365-Filtering-Correlation-Id: e47510ba-ef2f-4955-3aeb-08ded86c1996
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|19092799006|7416014|366016|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: R0d/VAxblMc1WSfqHxGjdVKMqquOFPzIsoeHds8p+F7n6sPDt3YiKd+XXuE5ON2+jFZJZqjjSlpb/KF9QKyU5M5MSfevX5gfup3P+W2BKDlwjKgirV+pHbzItwRm6gCoWv6l6CQAh97P3+MvpGRrqf9hVoXwXFwmJgN1QNL0Nlb071qIPOYgt4hIpKu7wvazNJnHQiqrgYDhiEzOsq9umF2+KHQHm1nG4tLUHSm84y9H2n5h0QF+eznxwD0gN8vcPeOvCo3o302tLyhImXEXd/jJku3Rd8w0Ql+yPhFx2Jp6t7gIHsxOh9UWMBtbYvN9N1BgzN1u8KZCkHx1WikvJtlcEqB/4S3IDyUCF74F409o8oRe6BOnDMO9NR/7mSl2O/+b/ogqp14E6ohFR3M72l7mXprf+fJGu9CDhsDyEpyUwOD4x2xII6HMP/C6ev+Mw/x1T4qtFQBezMiD5iB4uRqL+meqkHRWZIc4Nx5qxUYyBuh7qY85f62YlNW5dUqjVFzs+cRgbv4bfvt3oeN9l+mV97XNxzvEPmDc4aZC5Q4ti/pZQE+YZidX5rBPuvvG7Fju1h9iDlzvJ6/FDUOOs8vM/2UeXbHzpt1Dy4QHsy7j6ezvf4mc79iJNaMV6eHxnDQ83Eh5Iuo/6oLjqB2D130m/GSP85rchgtkvKdFe14=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(19092799006)(7416014)(366016)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?25v3w16HdBAyXQIIO77aDGsR6wJxcKfjHAl2wEyTZWi3fVFTppVNRJEl7ucN?=
 =?us-ascii?Q?m8lFvLa2I1D7YgKSWWbkQ0u+6Pf2fYeCYwbwvxqTLot1O7kdv2AgS7Mj0afq?=
 =?us-ascii?Q?Uj7VZuBJZZevmatUI5sDNNiBsLj7vFMLbJ/xczTWs/LOTKURi3uMYPo5+z9H?=
 =?us-ascii?Q?lCYhh2ky1URiNLiHZ0qC3+Geee64GL3coJJPB8DaI22q0A+XNfwfU0tPKBmU?=
 =?us-ascii?Q?OQW338wefFtrkeWgcD0wBz8bgFPEsVocQBP3X7FkyX8OOAM+o0ljavRwAe4Q?=
 =?us-ascii?Q?dKsyiIDbm6ZVmniH8QrYOgxD88lSqFr+j7hjuToUsiwBzeu55CHtMuLCpLX5?=
 =?us-ascii?Q?JZG9KHwSrGmxIIoyeXHceTE/DdaHl9SuVTid3YEGdp/eJOT+0z/uOFCCBYye?=
 =?us-ascii?Q?snqIVfuamuVbcMXExKG2EBO5hhxwbQXjM50TOSEn5Dp8hCf1It1PfnbE7c0w?=
 =?us-ascii?Q?AEwiwk8qY8jNN1yFroZn/h42hYFso0jzDmxX7NEir9koDkjhRO0piwU4lWRP?=
 =?us-ascii?Q?E5L8UP9OB+3ngYBa5QzAm7rEabETtkRGrxxG1ivPH4gsUq/N9vl0tFzS2AWZ?=
 =?us-ascii?Q?sOrGMLXh91pdm6JngbAdSoxxY6gKPuOcMWxC+2G2UnhcX1SmC0KrteKT+JzZ?=
 =?us-ascii?Q?lWC03CzySKPKujfgBaNBwR7LSuDN5R5zcd9Codha6rMYkaWzSdwmAkDe6aiU?=
 =?us-ascii?Q?UtS2mSwN7PcvnT7o+suNIQDn01YPcCvQOxc6obn15bNgl5ib0nwpMY6iRwEw?=
 =?us-ascii?Q?BtyTJgRrLb8oiBrHAzBJAwkdq9p1dfq2s9GFh9XPzpjcWvaKposC/E8XeIja?=
 =?us-ascii?Q?EY5iYZLTVtqIbuzXxATh+OyQGGEqQ4y7QpflgttxxDBQf53+W40UryGcUGwF?=
 =?us-ascii?Q?LCPviupQOxPDAlSK2r/UBIBQbkBhA+SuFXzSOHrS7HgODhW3R/ezz9lBOT4/?=
 =?us-ascii?Q?GkgLpcdYSrvlOJtQ7q7CC1xXCfd+sL3TJgBfD16nHkuw6vGXihaixLFpDHuN?=
 =?us-ascii?Q?HusgBTz61HVjaIv1Ye4b/2ls87+0lglickkd/oR7EZFrEWFOfsgfD3PACrEm?=
 =?us-ascii?Q?LhFv+whIbDSPyyq7XS1PO57FQbETVIlqVf8YNpZyjzXz0qXNYZCSzlTIN4L5?=
 =?us-ascii?Q?4LXSaq05a3IdTTCtWOnICr/zJ+59rzcmPQH6baGCBfUD7sZQKVAF8PhmUKL0?=
 =?us-ascii?Q?Mt/s+HDjPCM35b4w2l6blIks4qQ/MLmvECrs/B1BaGBKzZBwqzb/Kd2wlE41?=
 =?us-ascii?Q?Km5ng1OPTmBB+FF42CksJcWduIxS5MQjZOpuJZ9+cEnlF8KCr+Gn0AzzmjlR?=
 =?us-ascii?Q?4HLs4+Gj0vjkACHZvxsF8wVH+UZ3a06Is9AoMCOhEYJmzjTRg408B5taftmW?=
 =?us-ascii?Q?K7tZD9l2zHn5NVFlLxI46vaGzCH8sItM5UKwiHszV0SnkPChOjYuRrXJDNtM?=
 =?us-ascii?Q?LQblKFdY4eb1/LWFAzrkJF5slLQMoJddD+Rpdeq80ElEZ4O27J4186faoH/W?=
 =?us-ascii?Q?5PvTDocVYHGoeQA//aXfkHtXdT9GJ2CWU3y16tJNZ5V1DsEBwyN06wxF0zg8?=
 =?us-ascii?Q?GOY2cpuor7RUg/YrZ4LWpQYhY3wWt0Isgorum6laFoHDgtN60Y1xllxbIDCz?=
 =?us-ascii?Q?lkzIXogg339qGExKMu3rP99oDvS/SaQ/pk77zPJ+UaWgreqEzzjGXXtukqse?=
 =?us-ascii?Q?1R1RnFHgufSIl5R3HOVClbqIpjSbaPlqhxAH1+32LyYA5KVlhD1GyIVj+qyD?=
 =?us-ascii?Q?Jv6JhuTtV2fycXimR8CzKhqnmCf4kgFq+c3+vvb/CceNctjSxEHm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e47510ba-ef2f-4955-3aeb-08ded86c1996
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 18:59:53.7406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7wO7jDaWNyKidJ8NMuKCzTKy35iNwoJ/9q/23P32MX9kcckxy2eupy0FFc9ljjAV8pup31xWl+XNJDh6rLnz8M3LDScTqps29cgjj1YSlgF9ibD9BGf+6uyCeDmVlJWk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9194
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_120001_165882_63FC75E7 
X-CRM114-Status: GOOD (  18.27  )
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

On Thu, Jul 02, 2026 at 09:19:20PM +0300, Laurent Pinchart wrote:
> On Thu, Jul 02, 2026 at 01:11:03PM -0500, Frank Li wrote:
> > On Thu, Jul 02, 2026 at 07:15:19PM +0300, Laurent Pinchart wrote:
> > > Hi Frank,
> > >
> > > Have you missed the comment in v6 ?
> > >
> > > https://lore.kernel.org/all/20260629084654.GB3054459@killaraus.ideasonboard.com/
> >
> > Sorry, I forget emphased it in change log.
> >
> > "For the reason stated by Sakari in patch 1/9 (dependency from MC to
> > V4L2), I don't think a "media_async_register_subdev()" function is a
> > good idea."
> >
> > The reason already NOT existed in v7, I removed v4l2_fwnode_endpoint from
> > media_pad. So MC will not depdent to V4L2.
> >
> > So this comments is not suit for this version.
>
> media_async_register_subdev(), with its "media_" prefix, appears part of
> the MC API, but it operates on a subdev. At least the function name
> should be changed in my opinion.

Name is easy to fix. The key is if the overall direction and method is
good enough to go futher.

Optional naming here

v4l2_async_register_subdev_with_created_pad()
v4l2_create_pad_and_async_register_subdev()
v4l2_async_register_subdev_from_fw_ports()
...

Frank

>
> --
> Regards,
>
> Laurent Pinchart

