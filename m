Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E7AC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 13:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZZ51n7cf09L4ID6YFk0rWW8hwvrGiybfbo5R6DyPyw=; b=Duu1NJGmXVm5bpgsUK2J1uN1Ys
	g3qk7BwQk6nK8j/Q9kkk1aAK2B3Rp2wntpFJSX02n6HOD8oIP136J0IpbUZBmsKHiyHYLrXk8989M
	DbZDgjd7pxelRHt/jYRXOcqNus8Z/v2jncN3/EyREH9/eUq0BUCcBpuWIo0k/1lk4pY1ruJW1MPYJ
	F3Lm9Xw/s3nn90jGnPnbmOwlyIFgeuRPleuHZjnIaRcbN/4ZOmz9NiJU0a8ZhF1o6y6XmdtD4+o4q
	sRmOvCHP6VvRlRrvC5FmTjrvfmIUklEOg8kCqE74nOyO8BG5iw1zMaLiYgPjkOrAS8UNU4nZRu+Z/
	z8Wa+8Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubfIl-0000000595s-2Quv;
	Tue, 15 Jul 2025 13:02:31 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubedb-000000053Js-2l4W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 12:20:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a0h8mzc9c8qrX7ehbusMYSBp5NJLwlWtXo3BL1Mo8UJdm9MsUNq6tMU9rLkMBdHnr5XZi44yeqq+lQ7mFuII3zfWffHfRbprextxfVyJDyNuoNRXkb1GUxOUimPCti31ypIdZRFB8oRy/1Y0ODsep9FVmS8pYLTJ1phWbSJlZYG8Ljhp3u5P+Afzp/K2mdMUFU4OIqqV21V1vvjUS0tXCV9UhJFVoOZxQ+XvbOryMu0mmELqa4QklUHKD4qnxgPMcOSvLyjuWNImtqt3RRyGgM1WLGW1V/Eg05iKzPQmYMFuDuLtSLPPaz3i24wGS8oLhejM3CzQGNiAd59VImv2Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZZ51n7cf09L4ID6YFk0rWW8hwvrGiybfbo5R6DyPyw=;
 b=pwaT076GG7A+Z+8P8We0E6Ym/DO02KoqrPxBi+WgAOwJ5OMiPgW0pMWasklRwK5f6F2QWE97fXF1vGw6LvR04HXnhWkpBQmyk07PhuY5uzFEjGXqqZTbQlDGlOH7+sLBKHaTUbZSb4kjarWqOUjEasQFpjCrqDeTU1WhbMJ2xRY1YDtpPRdFNz9tSP3exSOJbY8mXzXbA7WfHAe/PaWVT9sLAlgV9AZ5PeXUS+sdtOFMTh/V1sgD+Fa9XGtrolGyC3xNAvFZs9PRgAda7/+va5o3f1zhpQqpI/7zNoRs1+XeWXwweJBQG4brpRJ/YDqvUlIs80e+JIPLYTxbRsJPiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZZ51n7cf09L4ID6YFk0rWW8hwvrGiybfbo5R6DyPyw=;
 b=LDfYTX16meCWp9kq85E/w9YIwx8v3YXQ2tF9Cbfu2kXmqmn5maLnJTuUMXiJHitJ2hFxhgYCqfbuHZup4UM3ZCZRPteKvEDFpek4iKQlHdYfBuwKURs1mRNW8R4HSoKza11qMEUyiryxbAVbEi+RjMy9Rr+tcFlJv+COAw4ubbvaIVyv9aBXfOu6/mAGz8jw4+DW7zP7VSS5tCieAPvubSByp7HBKYp6Cyes3QDfmseIBEkFwdzdew//gUCxBEJoNY4GZ+OMCJbUKgENEjmoNY3pk5oYyG33oV5WX+yf5XkYDtxn+GJGO52CaACw3CwzX1KbPKQa4tHras1LvuBBFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by DU2PR04MB9179.eurprd04.prod.outlook.com (2603:10a6:10:2f6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 12:19:53 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8880.030; Tue, 15 Jul 2025
 12:19:53 +0000
Date: Tue, 15 Jul 2025 15:19:49 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>, Lee Jones <lee@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/9] dt-bindings: gpio: add bindings for the QIXIS FPGA
 based GPIO controller
Message-ID: <n3wlp7pncug3gta2raignhvubqpzqk76dmvewg5bosu4spx4h2@hr5r73tsxip5>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-2-ioana.ciornei@nxp.com>
 <20250710220132.GA4038128-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710220132.GA4038128-robh@kernel.org>
X-ClientProxiedBy: FR4P281CA0293.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::6) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|DU2PR04MB9179:EE_
X-MS-Office365-Filtering-Correlation-Id: b545593e-0a2c-47dc-482e-08ddc399e718
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|19092799006|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0MVd77/kR7xkISiP5ZrInnGoObsUN+kf6EnD+vuZavJvXmPRYV3roMwrdWGf?=
 =?us-ascii?Q?NDBZ5TozKjduSPy3ZlXtwDynd8nl65Uu3tPwKkby7SkzQfCpRRS8DNY10Z+r?=
 =?us-ascii?Q?qjNiUTfvlRs2HIw2TkvAIN+dmDELPcMCllqMLyLEwRSjOU0oX4hrTBW7OqYP?=
 =?us-ascii?Q?v0h5S3ES9x8xK8ZDA6JxDmbwv/O5xGvcRvC9dpq+LtM1g7iMRQqiJ4ngTsY+?=
 =?us-ascii?Q?/zk+dfDBuImNXg85japAqlqEhkZQ+0VV8pmnuwa/u8SUEgXXUiZj2XbhwTdl?=
 =?us-ascii?Q?oPuQQRfPNmexX77OsSq6pJcleSmvfBcJiIBuEj64dsgAL9CpGNVnpmFXFUlE?=
 =?us-ascii?Q?MsdXb9+zSuHGamdRbdHaLEMeAzqOLej0vNqabXOupovhNg3rH+0VMMNc4Nyq?=
 =?us-ascii?Q?1AiwJ7bTgs0JWu4mPtUPLL1NBx4DPUO+OXycjCEDnQrVqYQv4EJ8tAHqJECF?=
 =?us-ascii?Q?iYfxGXcdrzIkrw9EO9hWO8V+NXcDMyGyTVQgmMjTu4muW01pT3wWj78W5wSR?=
 =?us-ascii?Q?3ftKjfFLJ8urfpJtcU9i3swOx2qFTp1c75T2WjU7//H2b/xNstnbaIZatjGv?=
 =?us-ascii?Q?KlXepuKyslgKar5xKpZ+4kjj760YRKoxZdMAxa0lXGFX9/u6HI3lp7z2v+W/?=
 =?us-ascii?Q?9Fi3ZdWX5iM1sChf7UYtpNfyfJHBoDpO3aDzA/PH14GuLpb2ea5COxWONNUg?=
 =?us-ascii?Q?jyQpy0b21l25jYWQ21JnKRp75GKRneWiEM8jmI627jDBS5C+Y6SMuBEHBLQT?=
 =?us-ascii?Q?FeZ1BWHDX5RtGfycLf+8HKiYuFkPgtabIUaNnkkhjrw17jnbsVRZqFWib1u2?=
 =?us-ascii?Q?0eNbd8HP2ALFA17WVeJRNVWn+oC+qZ3M5ei6DQdiN506ysXv1TXO3/a2TjV6?=
 =?us-ascii?Q?w9SHLe6D5AGnQYe466HUUQ4iuYTttPAL7G5vx4Sv6bk3mrgCjD7/wek1vytZ?=
 =?us-ascii?Q?CJjy2Chwts6GMEN2SAQ8ChZ/DMdP+44Jo2Rl1x5yApHcXdcYGxTNETOSAhO0?=
 =?us-ascii?Q?FzyZgPUgzD5Dci0rVQheyfj/VoHMwNsg4RaHDhQjRFk7nEyuy9pLEMYZJQrV?=
 =?us-ascii?Q?5IXDYx+gxVdLSo3UpF6KvzLfWJEa64nekQBt4qOJzAY3TDu/sdYkWqMELtfT?=
 =?us-ascii?Q?G/DHVnY1N+WlMfNQ4Bh6iwJw8JAsHC+7bSyWcMCFQC74J0+vvxcwmBdYdhS2?=
 =?us-ascii?Q?Wgr7y59N72E9PWr+6DdGVyKSfYrJ1UmxCFoyOgdYK6aImWDbGTT/udZS7VO6?=
 =?us-ascii?Q?u20o7zg2tNSWi2dlFB3wgixVrVcmRkOyK/ilp0EC2xpNE8cO4beeTuYYlrUX?=
 =?us-ascii?Q?l2r9eCSasAyvrTSj1f1NJ8UXRCJyUZyYqNiomWh8UjfSm07oFmPikIVa0H/l?=
 =?us-ascii?Q?DDdijfllhOzbwqLeEk8xhvZDu1e2N0XzSfp9NSmdmaB0680Shw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jdQOFFyxi+LnGrdIG7mxROYIUokaTQ2iGhkon6jOmS2In8rZbOHmiNH3dVvX?=
 =?us-ascii?Q?i3Y8mZzaQtvlTgNt/4RIT6+ZY+l5GPb5ob7ez9jbfnPXE08DKQ+S6nFNFzwY?=
 =?us-ascii?Q?lrnCX7toYMx8i3fCA0w4N7GFmKGVz+ynpgwKDWAzvKcGYyB7OTpHnRXh9iJJ?=
 =?us-ascii?Q?b+LrzpL5ILsOHkg/LVqJJAJaZ0VaTHRN+/zrPEZQXvgB70vFOlURgwzj0GLh?=
 =?us-ascii?Q?SqLbJjRmO4DRptRbmTpznlpn1RjKFfQft0K5udE9mQUaa+/WhIuCd9xOBb3v?=
 =?us-ascii?Q?3lge6k760lY/VRboeqIy7BBUdmACtD4XThMiv565d+0all4Haf6jSdo1IJ0y?=
 =?us-ascii?Q?M+Oj/7M2xMWZwBvV4DmJVCqRL1G8ESKRvpn6kWc+FgNHZQ9n3wjU500O/CqZ?=
 =?us-ascii?Q?+ncbwTHBnmfXI/36zOLF8RMYkNRrGOXqFchpdRyYxOKHNS5N46lEqZ+wEqnc?=
 =?us-ascii?Q?oTIbffYuow7tBGmZHdmxMgr5HwF/yYymxe7h3cQasb3CNibOYzojxr5D4UE+?=
 =?us-ascii?Q?QZPRVLRU27Lf/0KuP3uBHJF3sg5WS7taEz8/prFu9TicbOYoz75sSoDNG2L4?=
 =?us-ascii?Q?z/3pNEmVnfK5pUz1dYPJ7dTSuwrMu9hXwCAI7hUIGV20oBKV0W2Fn9emHIqO?=
 =?us-ascii?Q?eq7n6JZbXJCYCgfQhIZhkIjsOzJd8nnIOjKWQW99nN0yUlGl43vOZ+nkVaV4?=
 =?us-ascii?Q?bc0XYi2QryfedkLV1Wi8qOGr6kgfSfGQqc6OLk9BLZyKl51ufk/oxEfAr/Xr?=
 =?us-ascii?Q?Wv2FwwdjcMFfAWNfoDvSMovrbcF6Bletpo1LJer7YNx6i5zBG7BeNZYky7SZ?=
 =?us-ascii?Q?A9xNsHmto/G6RR8iNcgUyAWeVPjK4huvtr6/aDz0ohJ0zO72no+fVJMof0P6?=
 =?us-ascii?Q?sJpgVymJhhjey3VaNoFoHCrd8NS07kFJnlYdAmAuTpAPb9mNXH06v4Vp3Of5?=
 =?us-ascii?Q?WnJD0MubxI9LAh/jLTlzcefoCLHa6NjN5FzhCFl003LjPXNckUer1QTYpm/q?=
 =?us-ascii?Q?T6n2Z5NWCJBXsL5cvDFbpILIp2onCr/IgZnQUZhQ41NzzZ9UF9r/cc5jZk2C?=
 =?us-ascii?Q?MidkGTWCIzAp7LvL4O4LjQXwGJ7XGYCk1gJx5PQKTZXqjUVobY5o9TVdp2jA?=
 =?us-ascii?Q?Jujgk5OpdNc4ps11527VfWhN5XaKRjTCQHi3ivzyZGgvcZMM+S2xWktTq1w5?=
 =?us-ascii?Q?lvd4ldYD6UOu7lobc5K2z/KR7J+1Tb/Ql1GP+sfF6xAiC1rlmXkwF98nVeWc?=
 =?us-ascii?Q?Ie/LN7+6K7AmD9cYydK+f12qAXHYqXOoWoa+v4iO3vYdea7lKnquNAH2wSm7?=
 =?us-ascii?Q?8NGP+RkmC0g0iKh9WtRWmFXDXVzH9HAF5/HOSYF/U1mohJWx6ImdQrin6IA6?=
 =?us-ascii?Q?/8pk+INzbMtKaN/dALsLJhsc/My4mdGiHjkPl3ZFxOFlMMMcHRfTcFcgSFNj?=
 =?us-ascii?Q?HxOTVf/ti9h29+G0LgIs6HZSLdDWkZ76h7crvL07C5pA3+lmV4gSfQbPNWes?=
 =?us-ascii?Q?mtbO5iVNY7iCZ49Nwbj4P430+lj0cPCzD6a/APxLt8ZXR6ioAjQ7QG+cKcqT?=
 =?us-ascii?Q?oHm9JADobP6fZu0O+j2tejZnA6N/NKDLaS2J3IR2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b545593e-0a2c-47dc-482e-08ddc399e718
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 12:19:53.6133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e64+i/vTEUZsnWL/hNWDEBc2mE5gGLJz3TW+IqWUJhRhVkS93T5UyHrrCYuDIkepfACmGVC2r+PMNCJscZPc6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_051959_696065_A20A4002 
X-CRM114-Status: GOOD (  12.32  )
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

On Thu, Jul 10, 2025 at 05:01:32PM -0500, Rob Herring wrote:
> On Wed, Jul 09, 2025 at 02:26:50PM +0300, Ioana Ciornei wrote:
> > Add a device tree binding for the QIXIS FPGA based GPIO controller.
> > Depending on the board, the QIXIS FPGA exposes registers which act as a
> > GPIO controller, each with 8 GPIO lines of fixed direction.
> > 
> > Since each QIXIS FPGA layout has its particularities, add a separate
> > compatible string for each board/GPIO register combination supported.
> 
> This could be covered in my proposed trivial gpio schema[1].

Indeed. I will update the trivial-gpio.yaml schema (once that gets
merged) with these new compatible strings.

Thanks,
Ioana

