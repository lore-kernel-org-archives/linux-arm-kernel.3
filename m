Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0F0FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 07:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4tikxytgc7wHISLx86kQqo3ef3gAydm6SUl7ZcMbu+w=; b=R3CTfHjdCYoL7Ui4VjjFR50xQ4
	O8nO2XwEYo7/WtO8ejylvsX2KSGQdM8hFflmF0/n0fXu9qJIyQMZ1sfT86lQmJjsfZ5ufsHiyQQq8
	xMOAO6Os2uzeSBhq1H7DvBi8OVkQZYTPMd7GCoc6tJah7BXbzk23EzeeD2YHEkWAz87KZNYD2ZrGK
	Vtlms8knwEq5Zsh0zlFDw6IEudAJLbi285CIpvotWzaebYv8n82Oka0puboQnqT0sTF6pF7nxDVsw
	FlaQ8Ioeb0j6rj2d6nRsTf1xozKWvHGJQehPnsS30kJvxxM7St8LdDzGtCkmzbdSBy3nijhSneYhL
	ctWMYJ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMGE-00000004wJm-1Nu6;
	Thu, 30 Apr 2026 07:56:38 +0000
Received: from mail-francecentralazon11013004.outbound.protection.outlook.com ([40.107.162.4] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMGC-00000004wJ9-2YWg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 07:56:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kChlr7PaY3841j49e9Epq/HgKGkvMT/Kj+3hLnYiRYnPtKWUbdYIOi4uCgx+pfkve6hyETHXwCH4FJYQ1FC/FmF/lNa+x8evoCegKWvIjcaUxy/2C7ARKXRh41cPa557r4bCw00q4vHSVs8NKckNzXJd6k/LbUAEatNt12kTnWp5Reo8ZKcSDFySCRJo1sRD1ccCpcuYwjacj2gJg2kyn353W2vmos0pOhxsvAQg289MOFB2V91/N2EFaBtxfukjWDBlJ9F8dzMWWfyVRgZBOnHb+Jtb3JWs5OoS1xJoTJndbJwXDE1SnCQrBfTMc1Ke/DfNRJdKgMu+c+Y7y5I1dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4tikxytgc7wHISLx86kQqo3ef3gAydm6SUl7ZcMbu+w=;
 b=kYYEeTQo6lFUztKuM9ztitzmwYHibHV+fY9BkH2jbr9/0Q4+xwx7nqssbAS1pVVjVcIiv+gycWfHP/IBLTfBdNCAR1zjYvRhHzyyduxkXr43p9fY2j21QrpWyC3txO6Nm9o65mAKroHovz0g7XMSLc3x2yO9V0izZtpMWWQd8Q5zw+wHj4eXsWqpfg709F6S3zjQj03nvWzvymxOR6rrOP4bYEpX5SPlZoJLA7btzHp/vURzcLZ9kT5nZ5NyvEOQpC0iqQe+446oBcyTb6Bg+YHjW7AP3XJKe/pcwGMCcDDCDFid252IoCVlgJqctMFqi1nLQjbKsBUskwWMWr/AIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4tikxytgc7wHISLx86kQqo3ef3gAydm6SUl7ZcMbu+w=;
 b=nCcSEF8WdRtNGrrkofmAvjocyKTdw4fcBzjF6GkmLonC8OkUaClASroEXoEyvy7HrDEo7EXB0B86BYt/XpUROxvMxWAQbgPoI35NMJqr6nsGEUj51TuMW/o3RC9Iok1GBIdLsSJF8iPpT27ytrCUvJxb67FAX9GBMt7o1+KRCddORw9rtFWVYEC8LvHCMsXEAusYNQKrSkj7MMPiYyg2u1409jRaxHexdDCYnk++ACj00Bnr9d0OHogipw5Skgti4Ex3wlKmGPG+gG74p1I/4yMDTf0oSaWOi/r22nltHxezsdHnTQFBA6E/bEMhzd95IUwvG2V5/mLy3h/Svmo8SA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
 by MRWPR04MB12119.eurprd04.prod.outlook.com (2603:10a6:501:97::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Thu, 30 Apr
 2026 07:56:30 +0000
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50]) by PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50%5]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 07:56:30 +0000
Date: Thu, 30 Apr 2026 15:58:40 +0800
From: Robby Cai <robby.cai@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
	martin.kepplinger@puri.sm, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: imx8mq: Correct MIPI CSI clocks
Message-ID: <20260430075820.GA3539725@shlinux88>
References: <20260417110200.753678-1-robby.cai@nxp.com>
 <20260417110200.753678-2-robby.cai@nxp.com>
 <aeIX-YbSwhmuJwst@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeIX-YbSwhmuJwst@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: MA5PR01CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::7) To PA4PR04MB7821.eurprd04.prod.outlook.com
 (2603:10a6:102:c5::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7821:EE_|MRWPR04MB12119:EE_
X-MS-Office365-Filtering-Correlation-Id: 0915a502-0f59-4524-9e84-08dea68dfd3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|7416014|1800799024|376014|52116014|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: IejdUvLdfebZY83L2Wak3AENgh4slBXYKTfu11FdrvtcH0iXaZrfZWsLvNWjiJuprC3i9NguGSb8+QYjGT64BzZuzOVJgRY77jlVqDiGsRnXq8oVhiaZ2U213wIbsm2l80h85WkksVSLq59rLWYr69uUIhSFIP5LOfFwOYmFU4bbrWeJlatzTnWSBegO6kAMPFXrMtFwJDLGHVLdECMfqZh+xoJ2/L+Y5W43Mvs2dOnXTv34BCFaMvLgjD8gLi3PBgyVqQrivClT+kiwDL+udkAUHWFYhEDgwOC+RarnE/SsV8ScAo5CjiVmdArH2Oi+KrZxe5kcUVYkjSg1DR0cv4t+uSuT3zrHDGMqhlwmQ60JFZOg6FzHVEUSHPngx5saZ0imdMuqo4f+V5f6KPqUDvm4AJ71k7/X1TdCKWIyukuCwHAnYXf9WpidYx+Z898CMe+/0RUosOKctOKhwimBxf4gK9n7qiM2XemguzoT5OXqF43voRXBj0RYzHgt5D8/uO5oUyv3Hj1LdCyYxgQMYfYBhd6VtKs2mXOL3oSJ7GIV6kqi4Z0VEL/9azkHORyhR/bmvEkzwJ6USOnZp4y6CDbSan9UCObZ8ffePTEyDsdBvSQGV/woQQ5CHMXbqHmoQxW0VFvo7qZ4ZIq1/duFsJzeEZzPYs0gHxA8wJ2Zn4S4QniIjSIK/fQbqQsWZsCOAlvdzG7OEI/L2XAYnqXG2QpDAqD/cL/GHT9FY3pNLyd1g0vOtkQmgo8ekobgyuLh0V/Yk67AAXrElPI3ntTmn3WsXAo2tYGKZLfev9rEpLs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7821.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(1800799024)(376014)(52116014)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L7uE+TpPXaJ06qUijWDuCAZ06f+Pm197pnRg3lmL3pmvTvjmjUjmErGZ/Yxn?=
 =?us-ascii?Q?HT6Ol2wW9I1m+m5CB4Tgt3ayVZry/+aCsk/Pjufp5p2N05KaSl2fJwsh8U5I?=
 =?us-ascii?Q?3e5PUt4ZNj8T9z4fgUshtglMtbjYqSrTUaTF+85KyDsy0Eqy98UWVftbXkA9?=
 =?us-ascii?Q?AcfBqBEdoBajQ3QYHFst2u3r/xLQLHU/Vgn7qJEK7ZPbM+oa41CQbm9jT0x0?=
 =?us-ascii?Q?XUuB2ZetIXGoZ/xhyE+XmFnZPEtnVmswdOVD9DMRpkkGsGsGos4mr9/1IMgb?=
 =?us-ascii?Q?xcw+Aap4WnIJ8W09O1bVUJjjqJVYetmASL63pXh00wT/tcpn6JrsJSUypeuK?=
 =?us-ascii?Q?U9E2hazYhR15QOXCmkfjftKVf7eRoAoL5ZOeKJbyxOLw3Kp0Fd41/8PTcyBa?=
 =?us-ascii?Q?8CiMKvzE3+VJYqgrZFOqIRqKSgd/1yE82PQ8d656QFsSizD0jNOXunI7m/UU?=
 =?us-ascii?Q?hNwaeWJN9VCVP3O2MO0wmL/Y2b6uZwuPb77F1YcCDmGKei+7yZR6iBtvGxy8?=
 =?us-ascii?Q?oQ8nQqFnSRwWWWZcpl6B8fJYpb+irkzcRRQ+FNOvKN4e37jlGDGqYxbq2Cid?=
 =?us-ascii?Q?5sFtYih+5odmepIX0P3DUvxowRQT2TOE464DKF/3itLdz7FQC8OzMrcFpLmM?=
 =?us-ascii?Q?I49aagYr9ejxtBybTE8j9icpw6mNjGQ9qAfvzej2h/P12iXP9JHTaenXuClu?=
 =?us-ascii?Q?UdWjiYwUfnK3o6BOEFh56bYB4G4VD1wWTl2IIHrC7RKtU1zNMq+ha1Np9nH9?=
 =?us-ascii?Q?I43jZRFH7B3wWktte8Awh5nNApKLxzejlHVSlX9XqUCyaKRmIxVx47xB+IGP?=
 =?us-ascii?Q?ll+are67t762JN1gHOB0QqTDkvq7dbf0xHvxNxVgR62zQMP08HJRixpF4lk7?=
 =?us-ascii?Q?+xt5Qq9zHIDw95wguEskfxxiIA5+qDAunJ1ufv4Cmpw1imb4hEaeBN7WZrAt?=
 =?us-ascii?Q?3DabHUfhPf8Iis41ZgcTIf4wiITaQzw4HLxhSWOsf0/yxcGwRHMXMU50o2Rh?=
 =?us-ascii?Q?4A0S33Cvwf4/FGT9cE/uQpshhTF5xWX9EVIu0n/r7l54hR1hvdiW9Qlqrs7x?=
 =?us-ascii?Q?3HYOhKycx53PHyZ6mRNiuBxjgqsl2YI76jqL/d5fwcGZpbBZNYOSEkjloK5G?=
 =?us-ascii?Q?/8hurgpMjWOwcG6yc2BKAwvHvi7nhE0tc0O+7W1tt0DrvmGGs8t0p3ockkoj?=
 =?us-ascii?Q?fU3RYLvMZhGxBO5pys+V8wQCYv3L6X1TXUDzqKT3RhEOT5uLDMGaNCjbQPRq?=
 =?us-ascii?Q?BTAkp4mjLhzgb1oEdKCpLHWzCs9oqcDS5uxOS5XLZ8oZhDxkZLtWRj99/b/o?=
 =?us-ascii?Q?4pv/iuWUqDTlS6za3jjsOrP3I0wMdHY1/sx2CbQ0GMnRrq7Lb5OnfkPfGcJU?=
 =?us-ascii?Q?GZKONhJa72DlJBGNUz/UAiWEbu86U4whIbpmplB3D0Ej5x9tYz1Sf8yaXgME?=
 =?us-ascii?Q?rZHfdgtBBFqIxLPfREn0kQmISZAH18YgTUAseQBfr4algqoWAzOUjwlv2BXe?=
 =?us-ascii?Q?woEDmva/KaK19GGSsaWPRRdibyoUtP/t7phG2zu+i5w3kATwMcSMc2MJoggs?=
 =?us-ascii?Q?CogeS6/Zowceg8WQfVuvdPztp9SeEkqyKN2S57FJeno8qHkeRrsgtN142zZx?=
 =?us-ascii?Q?OrYXv/tvkRcYt5qwdxzfL6YLEl+IVFeOccJI9CDRL4cHo6udf1a6lfzM/Xv4?=
 =?us-ascii?Q?IvVKYDhydQU5+3f8VQlO6lNfFjqqTsG1XanCSL1nmoVuuKniIzka1oT0ga1J?=
 =?us-ascii?Q?cSakQLJ8AA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0915a502-0f59-4524-9e84-08dea68dfd3f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 07:56:30.5002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r11ncT+z2xzLRkrowsoXEqd/yBI1gvtH0CdBF4OmM0xlh87C+JGxFZlHLiu+XB88UKWdgcXTToPpLHRQXcjXvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_005636_651361_9717C1CF 
X-CRM114-Status: GOOD (  16.11  )
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

On Fri, Apr 17, 2026 at 07:22:33AM -0400, Frank Li wrote:
> On Fri, Apr 17, 2026 at 07:01:59PM +0800, Robby Cai wrote:
> > CSI capture may intermittently fail due to mismatched clock rates. The
> > previous configuration violated the timing requirement stated in the
> > i.MX8MQ Reference Manual:
> >
> >   "The frequency of clk must be exactly equal to or greater than the RX
> >    byte clock coming from the RX DPHY."
> >
> > Update the clock configuration to ensure that the CSI core clock rate is
> > equal to or greater than the incoming DPHY byte clock.
> 
> You reduce clock, how to make sure it >= ?

This is a mistake in the commit message. IMX8MQ_CLK_CSIX_PHY_REF refers to the
UI clock (clk_ui), not the RX DPHY byte clock. There is no direct >= relationship
with the CSI core clock other than the documented bandwidth requirement.

> 
> > The updated clock
> > ratios are consistent with those used in NXP's downstream BSP.
> 
> "downstream BSP" is not solidate reference for clock rate, it'd better
> refer to date sheet, dose datasheet require such frequecy
> 
> Frank

I will revisit the clock assumptions in the next revision.

Regards,
Robby
> >
> > Fixes: bcadd5f66c2a ("arm64: dts: imx8mq: add mipi csi phy and csi bridge descriptions")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Robby Cai <robby.cai@nxp.com>
> > ---

[...]

