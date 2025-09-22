Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD548CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 03:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HoUqNBgj20cYTvHRJfRy9wo5zl4KzL4m4rVR4/VOAgc=; b=v1X1PBj/H+TJ47jJ29K75e7pPS
	aKs0Av3aSRlqNMECY3F0DYyFyNB9bJfCnr9FYaYajCoyrKTRI03rhUdWc1irqTuVKzxrlY63Sb69P
	1hYuUIk5x0qilkCRjXBY/j2y2rm7iQZYQDSFZBvvsqH3PTKNKwVL6XcBfO1fYU2RU38ZqDQsCVndC
	mh0H7/lJ7F7Pae9VvOP5iHDQ4Xk9ilhsjVOic++prAutETxUL2lOJ6Q3kEW03RHUlvYcIo2dvoGSl
	T/8eM1uaqJ/JMLpDfWkNdFPiWFrIGWzsJlhsVUloO5+kiM0YH07tXQFLYyBL3PhUjEUGyHeh0p2fC
	oG3914Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0XIN-00000008hT4-2hC0;
	Mon, 22 Sep 2025 03:32:55 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0XIJ-00000008hSQ-2MXG;
	Mon, 22 Sep 2025 03:32:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t2IDeRuX1z0oq0bGsR4ZImKsbt4zcLOiZlKWeNFTc6Udso9wl783APSOnJCkkFpFiKi00pvQ1Jsrcy26cw39B+clGteJn1C99JBMAhgNWsWx1J4ev+Zu3zVbNrI6Yutdyx5ExHny2oPgWkNqkt+2JLQZwWZ61Ur9pxitGKfEmKnCkTCLIzeq2eXW2LmRS3sqLZ9srLYG/teynH33P5jx1gOM25UZqVCGdKEu5sqtM/g27xiYccS7DIYu4l/Di9F9f7Qd3JNZwUzeOxZzlcjQDXeERUTNdnzf2ExjP5MitcEuJ5AGo6TvfU6eldKew4fwoY/x5W6cH41NepYXBX4scw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HoUqNBgj20cYTvHRJfRy9wo5zl4KzL4m4rVR4/VOAgc=;
 b=jB3xN3u2s2ynGRzWTcmW7gMPKy04eAgtzuUFnRDrcN43064v+uxaehM8GvlajJGC5oNoKJVhhzJ96Qit4EHJ74VTJzCvLrgp08YBiwPlexbLbzAZwDN4T/h88TJwXWgAIfUnc4PCGhDKXO/6tyGHMh/wHOfK2EwEIKqpqb0L42iWQjxDGXl2E4mzKM7g+988W1qvrTmIHy2+5F6I6OTfyIrW7/LhudzNX1jDXhM5NJGQUx0yLJfi1b2oSPqcGIBZ1OL9ryFHLHI90h64ea0f2fFsTM173XzsuciiK2036OgTSk6uj/tbjyczDOljN/UXJ6GJ7JEKYC1Dzzt3dRoE2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HoUqNBgj20cYTvHRJfRy9wo5zl4KzL4m4rVR4/VOAgc=;
 b=a2e1Cm5CTx5IBpZUrTasLd6psXOYxuHyZbQngI7ev2RZyBN66W1CEb3HXn9K74AIH44AzDt62V4VHdS9sVCKBKQljPn0l/aWfJE2QF3CsWuiEgSXBTQo1oAPUR2d0C02pK10Rxdz1hHx7c0P+f/YqSpOkmSc241HsE3ZKgSVCfpDR0xSFT7T4tV7hUmyqNkM0gGdYM+fZ1n4ZqpzzYBqzuz1Q5coRkziHhdtObL1tk34TvsoZigIlssDOj8/e2jMB/pjJDQC/FKSmLCNYOAkfmsYDuEPOdJU81CbGXlqC46ZHPp+pKw822IqtswXntaXLq1eVtLJlNVq0QD2zoKR0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8610.eurprd04.prod.outlook.com (2603:10a6:20b:425::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 03:32:43 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 03:32:43 +0000
Date: Mon, 22 Sep 2025 12:44:25 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Haibo Chen <haibo.chen@nxp.com>, linux-can@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 5/9] phy: phy-can-transceiver: Propagate return value
 of gpiod_set_value_cansleep
Message-ID: <20250922044425.GB14753@nxa18884-linux.ap.freescale.net>
References: <20250909-can-v6-0-1cc30715224c@nxp.com>
 <20250909-can-v6-5-1cc30715224c@nxp.com>
 <20250919-lovely-amethyst-bullmastiff-5cef8b-mkl@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-lovely-amethyst-bullmastiff-5cef8b-mkl@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8610:EE_
X-MS-Office365-Filtering-Correlation-Id: 925ca0c5-2cdd-4186-b270-08ddf988b0f3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y+R+7AP/KKFPIlMa0rLYgi437WvJcwWiA70V05ieymLIT08Yj3RjUNtLPpbb?=
 =?us-ascii?Q?ih7inZdHuanWDYgUXZtzjMLmZBvbWgXU7cOzKYZOkFmOuYIgUDazPqdKL/Qn?=
 =?us-ascii?Q?NEW34xJuW4GQ3jIer1bPH8yf2391Y6fN/kniVkj5F2+5QKXGpSw3vqzHnVos?=
 =?us-ascii?Q?j2nhjcmDXF8UbrvkZsitSSAZt3Yb/WvaQUN4bK0UBcfQCA4FRQi7IfkvWAKV?=
 =?us-ascii?Q?S8jETGJewZxbIgaqzrchKplVjmAC+47rJiDv7EoQt6NV4ggxvhfVkKyIhU9X?=
 =?us-ascii?Q?b5oR5XoQ7nrQLTZ7VQOylswZxduA/UNS0vRbzkpbefZBiOpqexbnPCBRUQpi?=
 =?us-ascii?Q?tmJYIw6AisWyG4e45llFXCPzmhGyNrG71FBdxc9n7wz3U8SU9NHXSUSI5ju3?=
 =?us-ascii?Q?3HtFXUUHoiU3Bisgk93fFV12dJ4NtlhvOyXnBPheObhrylw6k6xjGylHel+k?=
 =?us-ascii?Q?4iVkFiQLEA8nOWSDxyOpapbWIpCaXJSNpjHPXPkleHNel0syDmXRvj5vI1kE?=
 =?us-ascii?Q?TkLgY5eshm+cRT4pYKebMGZSQ7EGjw+9PscoOAbttoGLdYJ21EPIcmQRW0jw?=
 =?us-ascii?Q?yUT8SRnpRAxWAOnET+0H7kSp7V8WoQ483PHaMdSvd7Lcy43WSzToSJ6IURiG?=
 =?us-ascii?Q?FcvrTbf4gHjzoZiu0rlkhCmjkr05wSsLGSLR8DlyhWmkhm317IYB3oDLO2uP?=
 =?us-ascii?Q?hwrqv0nTo0vdu9rPDXjcvivFYK8kWewYlrqUP1fh5MfIwNwGSS3NKCKVxtMw?=
 =?us-ascii?Q?535QMR+TtDJQjm5xLG6AXCkEs7/P5qHtOFazNeVTR6WQ2jX2elTG+ZFYG0dM?=
 =?us-ascii?Q?jtYhmTqRCqj6pyc3qvXJxdPBrnAiKrjISo4ZQuNw9fAvAmc26WcaRkCUL8Hx?=
 =?us-ascii?Q?3u4rjMbk/x2JS6TnHFZc6uxrBD1tNcM8751zhEWEDHOcMXW6oB1Sl3nrbXsP?=
 =?us-ascii?Q?Nga/avSUhooshDaGPCZqH5UGIFe4fN5obgMRGgs/v3emaw8iSx+5LzNqhgdP?=
 =?us-ascii?Q?WvrJRE9nP/cN/CeSNh3PclqFI7x1bCMM29ABWJdEYiP8YofJVco5Bac6Tjcd?=
 =?us-ascii?Q?WEUz7tbLEABQd7bTuXZzmj5K+3TEkTlobwIhuzD3CVKvRiKw/QetmwCHqbvp?=
 =?us-ascii?Q?i/GqVtOTaMcGa88ecyKdfq0tvDxINNkcYKjAZ/5nfh2Zl393bdRO0ZXipgET?=
 =?us-ascii?Q?xqnyrabZaLg6bQRrOI1tSKaSg1OY0F9Vs1wATfM8fv+tOttVVKf5/E6zbHjG?=
 =?us-ascii?Q?kPsETd8+X16TtAobSJAsgS9cypDh6NSIcxyEO+JWOr0VdaAUV1zuE1pDwFL8?=
 =?us-ascii?Q?CWc0L2Twus9AWBPVHSBtznfE7NRn1G8Xyh//wW4ZAvLylqPYzWEpHv1ucTXp?=
 =?us-ascii?Q?wDyuAEojTwOwfILx76ZBYohpM60frNAVyabZkiR6sszDBMg+0cZQ4+9OHmV5?=
 =?us-ascii?Q?1E4DEddMJ8M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4m5QFPSUgdTLaMtiZs8aL0z48HusRfQwjw2NgFiA7ZAvMf1IzWLwkf6pol/p?=
 =?us-ascii?Q?mP9WaPfK8ff2dUsHoSGfygFWFJdIBhbg8Tmt7Q792JuGSWrVMqh+nqb+6P3w?=
 =?us-ascii?Q?Q60GIWrHih2VDXRx0D2ByyumKQZzfRpATB8ABfNPuOUogsH9wCrP5jAKVeoS?=
 =?us-ascii?Q?rUbo55PK/WEn7hzSryUaLj6wIyEGs7a+2nRWminGSo5ySebftaT0WZrEZd9h?=
 =?us-ascii?Q?aqYQgVyPdTguw21UN2R0gqbsNOtzD7YrZUNckKluagFIsapXERPtUq8UXSbD?=
 =?us-ascii?Q?k0xjY5gL3sDNxZurjAFOpFGFlnTGg5ai5reN44AbPrxVlIE42oy7IEiGBjbH?=
 =?us-ascii?Q?ZlZbkpKuNpUHk+v4CgHmVsh5DTtBUtLr+PHq269BTSA9774GRB+4Ls8rJjmp?=
 =?us-ascii?Q?eSFHmtY7gL/CjL8CSMp9OWOe6Fmu4YSjM5+TdL2IVqQUsF7MnU1MXm8M2c64?=
 =?us-ascii?Q?f/I8m/zhTHUbV09X3yoVuVFNLbawRXeBy5VHn5buqvI4FHZTlium7pwdlBmt?=
 =?us-ascii?Q?/mMBMeT888+HlKPYrCA7yZ/ofLL5II2MRME8pX1f3RKZ3eUQuF7k1h55KR1p?=
 =?us-ascii?Q?VuIGeDeYdRyiVXCWn4ygX3ftNVVcC02urVUO9XF7qjj9gfPYynOLnueUNwdw?=
 =?us-ascii?Q?N49QCq6rKYQdW6aKEUgQ581Bs7vDHaBGKWREcXudEMVWy8YdhiroRl+YGnOF?=
 =?us-ascii?Q?hjHEuo0WU6FjwIU2W6Jgb1mP+sQD7z3ftE8XjOGDETZpW+La823nTMrGjoIT?=
 =?us-ascii?Q?OoBNdq5TLszbVzEVCSzoV0MsIyWXvnidJyTNnJeGo+qol3fbw+YmCTiz8sXP?=
 =?us-ascii?Q?9VgP88e6jk/vmCmANhm93XlxtGuCk1PcY+GnQ2RCLyk2HGhAO3qTHQYXPmX7?=
 =?us-ascii?Q?2kzvmSC+xzbCuRSqP1W3e7qNxjBDay1jSNcqzG9No+CaJIdCkXHeSzK75ySQ?=
 =?us-ascii?Q?vifOC5vL1toDA5yUnaToLvpiwseX4510a+3e55O57/ka/bB128aEmajXPLHe?=
 =?us-ascii?Q?HEonWlpggGBiSu5txs/2XalwIg2NUe53F7WoHe0+bFO+CBCHeWrN9kaPa4Kq?=
 =?us-ascii?Q?OZ6/OnxYMkpPnCD/9YP+NAdeQGThcBqIHl24oZwLkpljZJ1Tafbhxl8j08gl?=
 =?us-ascii?Q?WyVtMrFfwLNcZttQgFfQZiIMweNsX7G/Ncg3/i/M94wnCPbSISZmwfriZFU6?=
 =?us-ascii?Q?+/a9qL+tQig2rSzM0z7U1ogcoE8CMuvEP+/U5r+415cFiS7a709/O0TNnB6O?=
 =?us-ascii?Q?tDlHkIiyg3cYXVezeZSl66HwjV6GI6gSrkC7OsdOAkckP65I+QW3hbirTL53?=
 =?us-ascii?Q?1Lu8oiMZXNnhpnIDy7AYCkUqbrRAM4JWlqnGy9lnzcMj1RtlP4SaMv2ocyC+?=
 =?us-ascii?Q?xsgVsWlKfYppQYX/zrWmej7USIZoNElutusiNzEwmDXt17hoedhA57XFvyfZ?=
 =?us-ascii?Q?q5fFBXFBzIV/3BAQfr47l7CaFc9EcpaUiQAzL8DiC5ICVlaXSGwmhPFyFme9?=
 =?us-ascii?Q?NohBlYoZ+PbzEiA30R6N7dXog8SyRn6h6dQ0ly2VRrLjDcDaTv8Fpv2cNI5G?=
 =?us-ascii?Q?sT81y1f9ky2xYNyld/DJ4IayYx8jPLvEyTCTBBcr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 925ca0c5-2cdd-4186-b270-08ddf988b0f3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 03:32:43.8749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DBqbPJwnsENkUDqMUb9jEx/wknvReOmsR2X8wVPkmFvJxafhQMbHu676Uxux+roL5QB6gQ7nRr5S8rKQcmKIPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8610
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_203251_612443_08A3F506 
X-CRM114-Status: GOOD (  10.83  )
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

On Fri, Sep 19, 2025 at 09:18:21PM +0200, Marc Kleine-Budde wrote:
>On 09.09.2025 13:40:15, Peng Fan wrote:
>> gpiod_set_value_cansleep might return failure, propagate the return value
>> of gpiod_set_value_cansleep to parent.
>
>Are there any expectations of the phy framework from the driver if the
>switch on or off fails? Do you have to roll back any changes in case of
>an error?

The phy framework expects return value, so if on or off fails, the
phy framework will record and handle properly, but if one of GPIO settings
fail, the driver itself should handle it and need to roll back. I will update
in V7.

Thanks,
Peng

>
>Marc
>
>-- 
>Pengutronix e.K.                 | Marc Kleine-Budde          |
>Embedded Linux                   | https://www.pengutronix.de |
>Vertretung N??rnberg              | Phone: +49-5121-206917-129 |
>Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |



