Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68ACDC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 09:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqeKTGjgTi9SgJp0N0F1ysNYuI+ZnOdVVGN5GeA0j/s=; b=NwB8YjwUOXgvzU+MkH3GpphX0N
	EsZrElQ7S+RytU3u6Ll/UTWh/oZ2o/b9rz7wVm4QjX8Sb+mb9gONZO8/rpShVROgHfcCUNglY1wJo
	xq6+CV+FBpOEV414fDKr1qDlDLfE8lBVAnElnsqjohFkIJYWTKMTR+mq2j4EP/5WAUVeWVCIwlwjE
	9c/maRtjVbPBbSFzTAzsuPtW+jUZfoMbFe36XBBcCKnOTlMnXu/gSJ4qnatoR661cWE0uO+wgqqzu
	ngq2hVzJXHthIF88aQJ3x6KW1UNDwt15WLYjv9OLY8GYGNyJUdSv6QrhMrb7NQvJO0ov1qpUUWsLK
	oq1hFiAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tesmw-0000000Ezvi-0JFd;
	Mon, 03 Feb 2025 09:30:42 +0000
Received: from mail-db8eur05on20608.outbound.protection.outlook.com ([2a01:111:f403:2614::608] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesla-0000000EzgM-2C24;
	Mon, 03 Feb 2025 09:29:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i5DNChcpQBywbEo5o0gInydx8cakYOWiE95agw3aT3/umZlmE3Z409ysXju07vYRZASLuUjToseXeCtdp4Iql1ZBO2NN19SQ4ACYsWiGq1zgQdoc0KwgsO6F944TW769kWh/xPb14PI8WeklMvrPylkxPlTvaqFg5SuHUnTiyY8B+0B3EiczFjMVS23dyBxczUV/bBsH0miYk9F/9Fo0+OX02vJg69QaRHtjO8+gY+RworusdxOYqlMPjv3xfVOU+y4qlf2/+j+g5ISPP5o3VmduD2/BpOqfm8L7KPkCmSG7JTO1wFTQ4GcuCy/WJvy5YROcxVdw23sNd/WpqJL5Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqeKTGjgTi9SgJp0N0F1ysNYuI+ZnOdVVGN5GeA0j/s=;
 b=Fv9pSj6yJrWIRoeVYq1PD9sx5dn/wBmGcpPUcpt1kkD/NxiZiE5hJQ2MeUe//tnCj73Q4XAfOAtm7Ih3vkI9d/w/YqMUw3hXHOlBmHVuYHEdXjaTVJHP1Acse2X40mIQuCgPr8QDLem4b13wxOpE3JeQLmBFJjw0rGX/dB33ymh1s2B3/p2pxMH+pGMTQzTMr3cSLvJ4E5gMHN2vkWpsbv2G9kcC6n0Lm8WoqsI0ffDHV8MWUlCZIgtGAR2XC9WSmgADsRpmhoxH7gmGSPXR4kJT/CFiA+CuNX8lVf4Mbzmj4ODEgdOYTTC13WiES58xQ+Ov/5AvmgUCE2GWXfNLmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqeKTGjgTi9SgJp0N0F1ysNYuI+ZnOdVVGN5GeA0j/s=;
 b=FHubVYEUYQ+RIUAdg6CcgoakYMaoCPO2XTl1lMSVDjn5W/xBAId/P3FF2GdJHi36FcemsaidrTd5deG2UTkUZbk/k1y7gDBnrubPDYs+ePEfLil+LteOpsvDoMvar6p/hqFXW3ELXfIH9Y2QbGNZxNlsU73z3e8g+6ef9vtk5ug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM8PR04MB7985.eurprd04.prod.outlook.com (2603:10a6:20b:234::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 09:29:11 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 09:29:10 +0000
Message-ID: <d26a841a-07ab-421c-98f5-282a7ee651e8@cherry.de>
Date: Mon, 3 Feb 2025 10:29:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: rockchip: Add HDMI0 audio output on
 rock-5b
To: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Algea Cao <algea.cao@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@collabora.com,
 David Airlie <airlied@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Alexey Charkov <alchark@gmail.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Jonker <jbx6244@gmail.com>, FUKAUMI Naoki <naoki@radxa.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jianfeng Liu <liujianfeng1994@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20250130165126.2292107-1-detlev.casanova@collabora.com>
 <20250130165126.2292107-3-detlev.casanova@collabora.com>
 <8ad30e14-e785-4e3a-ba92-644e7fb07759@cherry.de>
 <3668702.iIbC2pHGDl@trenzalore>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <3668702.iIbC2pHGDl@trenzalore>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::7) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM8PR04MB7985:EE_
X-MS-Office365-Filtering-Correlation-Id: 94a2a80e-866d-4ee5-2ec4-08dd44353725
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YStYYzBRWkRaempodTVxQmljK1pTTGFHMmJxcnY3YVd0VllEbjdjdTJhVzhY?=
 =?utf-8?B?NVh4UFRxMENpL2lHOGdHbGE4MUsyMkQ0ZVprZ1ZIb0R6amFQY1hYcmY1SHR0?=
 =?utf-8?B?bHFTaE8zUVVKVE5NcHJDcGt1UXg3VjExK1hudWlXRXVjbDZ3SEtLRXN2aUNj?=
 =?utf-8?B?bHBZbDkvUXU0Yko1akJQVDNIZG1oRFdCMWNMVGhBMXl0RVpKTkduRjY1V3lk?=
 =?utf-8?B?REpCeUlvS3g5VkQ2Qzc3RTZqRUIxYUFLRExWYVlaRUwzeGpmNWZKNy9RaS9Q?=
 =?utf-8?B?V240TTZiMGt1L0NjNlVCbW1uNVZCVlQxWkJYYVJqUXRNM3gvR0Fna0tkcWNM?=
 =?utf-8?B?Vi9kbkFmMWU2anFKRmwzVEtvSmpSd0dycjg5aEpLL3A5TzNIeW5YUDVybUI1?=
 =?utf-8?B?dVFNSlk1U3lyRmt0QWY2UzA1bGQvTXAvM0RwbEoraThCcjVPYVFQV2dYcDF3?=
 =?utf-8?B?TnViZnlmbjVTSGEwL1JTYW1CZysrRzR4Mlgya1o5MEVPQzdCa2FDVko5QWtX?=
 =?utf-8?B?RVlUenNHVEFId1ZXSTRXditycTQxdDdpZ1pUSjI4UlhCcGFNQ0YyNnNldmp3?=
 =?utf-8?B?MCt2VjRnMkdwS0Rmb1paWHY0TkYzbkltNHM4UldkNGtsNks1aDBPcWJjcG1D?=
 =?utf-8?B?dWVDTFRFN2FZeWJFdEdRTnV4UlpsUGQxbFM3UGIyMGNuRW9QbVY4R3cyR3ls?=
 =?utf-8?B?QVV5YUhCUHl5U25zbnhvazA5eGtWZWUwU0UyV0t1UUFuNStSZWFXcVNRamxq?=
 =?utf-8?B?SHV0ajlnWGJ6SVN4SmJmcENMVC93K2ZDTU83dDZCNmNGcXFFNkkybVppVWZ0?=
 =?utf-8?B?cExGWFZIQUxwdGtLZHBLV3NSdkZMNTJubUQrbVZTTEVSZW1IYXJHUzl5S3Yz?=
 =?utf-8?B?TjRuVUFZV0hnU0VlUjBzQ0hDb3gwaXRTWjRQWWVMdnljelVCRFl5eGVvblUw?=
 =?utf-8?B?L0wrQk5JcWM5Nlg4Tk56SGljVTlkeVJrTi9KeXpER2xQUktzSExjZnVrbEdS?=
 =?utf-8?B?YWhEWUhPZFJjNGVNT0toM3BvOWp6OVBJQWVaSG5aZ3FCV0ZsR2J0NTFMZWRh?=
 =?utf-8?B?U0lkOTVvbnY1MHl5eG5PZ3hLUSs1dENzL3JKeHJldWsvQkxpS3RQM08rb2Vi?=
 =?utf-8?B?YmxGeHh2dTJGM2VtWkozOENFUVFiOERaWkI3YnFQZTdvV2c3UVBpVlFXbnV2?=
 =?utf-8?B?d2R3STJqSjF4ZWswNnNGQTFDejVvdnNqUEdmVzBJbXZDbDJ1VzFzRExIajRm?=
 =?utf-8?B?bmtUbkt6U25FMEViUHRwQkhFbmovTU83eGx0VmJWS0JEUkNvaWpZdEJ4MTRE?=
 =?utf-8?B?aXZQVmVMUzN2WS93RlU1aUhHcks0NnFSWU5oWUUwK0ZJZm9Sbm5zWERZcW5D?=
 =?utf-8?B?UjFpMzVqTHlBUmVUV3NzcC9BRG45ODVDMGl3dTBlOTlUWGhKbHVtZzgyVG5q?=
 =?utf-8?B?WU5lTXNQdnN0a0dIMUpQWjhmd2swU01KeXNqMzlaK04vTU1ETTNZQ3ByM05V?=
 =?utf-8?B?eVN0ZEI5VjlxeEgyQWR5SGJqUXRQZXUrWHdYcDl6WTFCNHp3SEMwckJVcmVS?=
 =?utf-8?B?ditJZXhxVUpQMGJDTVF6MGtXbzBrR0FjbmRNS0FuODVYdDBFZHlQTXNsSUFo?=
 =?utf-8?B?OUlEUUxJT3JsWjA2dVlWaTY2dTYrVXE5NUdhc3YrUlJkSkxUQ0RCa1ZvMkU1?=
 =?utf-8?B?RjJTMjlEWkF3UzZSYjI3eDBLMVVGQmxVY01mOElyWnRYY2RVQ3g3UVladFBT?=
 =?utf-8?B?RjVZajYvdFFhNENBTW5ML3lqVUx4YjVpbGxOVHZVWjhjcjhlTVg1R3U0UUdv?=
 =?utf-8?B?ZU1LQk9VRUV1MW1aZDNkWU9BWW5sTWlIMFBNSVNlK2tVaTVzK0FyUGQ1RUZ4?=
 =?utf-8?Q?7W5l5ObS4z+L7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXlNcnVVY1Vic0xxRDhocGwrVG5XM3NxK250SUNVZWJYellhaElmaG0zWnBk?=
 =?utf-8?B?cXZoalVlcFdaMnBINUpMeFhpa1ZEaHAvbTcwb1ZwdFVRaEJkU0QrTkJZWC95?=
 =?utf-8?B?SnFISkRyQ2tWWnVGd2lhNVY4V1BHSGF1KzNTVVM1aUdDSUNET3NNQ1lWYWtY?=
 =?utf-8?B?ejk1SjJ1ZThoZDduZ0o0RFFabWxrVEJRSVUxbm1EM3o5WWwxL2d2Ny9YUkFO?=
 =?utf-8?B?b3VSZjNqZFA5WVd0UEtseHkzKzVjaDd0NHpuWERMSkxHYzlucmZBT3FQdE8v?=
 =?utf-8?B?dWIyK1NFN2V0SXVSMXF1Q0hDeGQ5eStEMVVTYlpIL29MNDRPZmx2SW9EbUpx?=
 =?utf-8?B?UDhYUGd5SkJMOHhDODJDZVBxKzVKYVVXN1FTRXpXWWhBSWhZMnJQdzY5UVpn?=
 =?utf-8?B?NW1IZksvdWZSNDVGaDVwY05ORUN2NTliSHZaTVVOaHJENXhpWjdaM28wZWRC?=
 =?utf-8?B?Q0R6UGJwSnNPR0FYVU1yQWtZbURsSnhKQW9RT1JzNjNSYlJ3bTNsbk4rWEds?=
 =?utf-8?B?VWo3YXZ2dTZ6dExkck80YUZvVkNMeEZkRnZMckRWWTBMWi8rQTNMcE1mRkIw?=
 =?utf-8?B?eE1KU094c3p5MkJiZ09XSlJtejRPS2hyQkpETjd2R29aYnV3eUdGMWhOTUVF?=
 =?utf-8?B?bjJhTW41ZHlZY1d1VEhiMWxxOUQ5VGtQN1R2UUMzcUFadXl6YnlVeXVaWFJW?=
 =?utf-8?B?djdCSERMZnB2dk9hOWxaNjRFcStwbDN6TTViZStoZGJEUC8yMVdCRE1HdEU2?=
 =?utf-8?B?M2wxc2hDUmF6YXB6NTkybEZyejMvNytmSlJFUkdoZElyeUxZU2l2aEFtSnUv?=
 =?utf-8?B?MWgyTFZxb1RLNUxuWENXb2Y5ZHpobURPR1cxQnkxZW1Xdzd4alA0MVAxN0py?=
 =?utf-8?B?QXc5UXAzQkpSTi94ZW9zMHhTMDhxTGFjWDlDVExySmYwRDlCRDBnV1JnSDh3?=
 =?utf-8?B?bUk3dkRudm5vWnBkeG4xOFRJeFo0Z1VKY1AxWHlGNXVEbDBuYlA4Kzc3Q09s?=
 =?utf-8?B?RGFXdzUwNkpHS2pmWW4xZ0lQS2J0U3NMMGdRWVRWRkVWWDg4a2xjaisyWTE5?=
 =?utf-8?B?eDNmazdWWU1TRXFNM1M1eGxPTC9ZYjNSWTl3eXAwRzdzV0tSQlZkQzA2clZJ?=
 =?utf-8?B?MWxkRC9GODV1dk5kbTNHbCtqQnNjcGxRYVRqK2ZFelV1Unh6cXJMVnBQTUZE?=
 =?utf-8?B?azZCSDVCTGM1MkJMWG5SWnJrYjlqMEMxbUd2RzkrcTR4UC8ySTJBV2dOTzhm?=
 =?utf-8?B?ZGZ5VWZQK2N4aFZLalNPdnNJWFVvYloyNllja0xGa0xQaStGam8zTXVJbW9j?=
 =?utf-8?B?RldvVFB1MU4yRldmNEEwSW4xczgrYWliUDJOQWJHYitnN2xlc2V4dXhYaHpV?=
 =?utf-8?B?TUJteFladWZNNkNLWHZsRW1BUEVOMUdKSjB5UlpoWGhmNXZMTTVSSTJKb2lQ?=
 =?utf-8?B?L1pqaDhkMytVbEtBSUoxNFFSWGw5UTg1NXRyTW5ONDcrY1loTW8xb2lCMzRV?=
 =?utf-8?B?eWxpS0pvZGgrWmJvYU1RLytVS3VhMnJtUm5UL1ZTVGFha25PVVFzRU5ONmpS?=
 =?utf-8?B?cjkrajRWcnNQQ3Y5ckwwNFdydFZpRy8zQ3U3ME1UT0tCTy9CNlI3UmJJd1NO?=
 =?utf-8?B?ZHkzSUdkTmxUYVBpVjlHem5EU0dpd1BpZFVNM0VRWHVRK1N5M2R6LzJTeE9N?=
 =?utf-8?B?QzBud00yVEVUMlMvODFPZTZ4clV6Z2cxWEZ5ZFFyN1Y4Qy8vOUdFRGdidmJh?=
 =?utf-8?B?K3hwbTNTUlAzeCt6ZVpSWnZBSDZMWXlYVTV5a1JZMVlqbnIxd2h1ekVCWldr?=
 =?utf-8?B?cTIvYUozdTFFdTF1N2x4L1lqL1NVRE5oS0F6ZVR0OGE5Wlkzb1ltSDJkd0Uw?=
 =?utf-8?B?dGoyREhjbHhqTkQzcXZSKzlLb2pOeENRS3hFU3A4Y25kbEFkeHBoNlJHMmdI?=
 =?utf-8?B?M29lWWhHdHE0b2k1VFlMbFBsWUZGdGJUYkhpRmFlb0x3V2EvY2VRUkRnS3lk?=
 =?utf-8?B?dzMvTEw0UVdWbmcyL0xSQm9SU0o4RHBqeGFuUW8raUczUjRSMGpkSmZ4WkRH?=
 =?utf-8?B?UGFzemFRMnVLZkFkQ1VjVXpKUWgybFFKTUpUZ3EwZ0V4RzE4elNyUjJGRlho?=
 =?utf-8?B?Mys5K2dWZG9xdzNjRDNITVNQeVIzWFpKNytOVmo3OXZBRytPSkxyN080bkph?=
 =?utf-8?B?Q1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 94a2a80e-866d-4ee5-2ec4-08dd44353725
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 09:29:10.7368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ErnKurHCnPu+1lZsYvJfXgx0TNa85Lor0Qo9ms51v0d+X8noKXrhbXLhtPTcIe4OGFfjyOctKIcPnDtm7pDXPZ6RRmuOKxY/jnpwSzTDkdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7985
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_012918_611616_4029F8EA 
X-CRM114-Status: GOOD (  25.98  )
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

Hi Detlev,

On 1/31/25 6:18 PM, Detlev Casanova wrote:
> Hi Quentin,
> 
> On Friday, 31 January 2025 11:38:34 EST Quentin Schulz wrote:
>> Hi Detlev,
>>
>> On 1/30/25 5:45 PM, Detlev Casanova wrote:
[...]
>> The only hesitation I have is that HDMI0 can use either I2S or SPDIF for
>> audio, both audio controllers internal exclusive to HDMI0/1 controller.
>> But the user could anyway define their own simple audio card for spdif
>> or modify this one if they wanted to.
> 
> So some boards will use I2S and some SPDIF ? Or any board can be used with one
> or the other ?

Considering this is all SoC-internal, boards could decide what they want 
to use but I'm not sure what would make them pick one over the other? I 
still don't really understand why this option even exists to be honest 
(why Rockchip provided it I mean), I'm not sure what does using SPDIF 
bring over using I2S in that context? Maybe the number of channels? 
Maybe specific rates? Different power domain, clock domain, etc?

> The disabled status makes sense as hdmi is disabled in the SoC tree as well.

Yup, we're not sure the board will have an HDMI connector (or bridge 
using the HDMI controller), so it needs to be disabled on the SoC level.

> So if a user wants to use SPDIF instead, they could keep hdmi0-sound disabled
> and add their own simple-audio-card compatible node.
> 

Exactly, or reuse but modify hdmi0-sound as well. Plenty of options :)

>> I've tested with my suggested change and same changes than for Rock 5B
>> DTS on RK3588 Tiger Haikou with speaker-test -c 2 -t wav, left is left,
>> right is right :)
>>
>> I'm not giving my Tb here as the commit title is specifically about Rock
>> 5B and I haven't tested this series on it. If you had a separate patch
>> for the hdmi sound node and enabling it on Rock 5b, I would have given
>> my Tb on the former and not the latter.
> 
> Thank you for testing anyway ! I will move the node and enable it in all board
> dts that already enable hdmi0.
> 

Up to you, I usually refrain from sending patches for boards I cannot 
test especially for new features and let each board's 
maintainer/contributor send a patch for it. I for sure won't mind if 
RK3588 Tiger support isn't in your v4 :)

I'm not actively following the linux-rockchip ML, so please consider 
adding me in Cc of the v4 if you want my Rb or Tb trailers :)

Cheers,
Quentin

