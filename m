Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D31FD5314
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 09:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+s4oPoriwP+VDAjkTGO18ZLJ53p4GGoH/8px9BxzPV8=; b=cH6hyewGrR7V3MGvTxA/GLVOYX
	kSjMsIT8FHuEME5lcGtEh85GC5xDMar632gXH8NDIDKiPg+OLsncA4v4G/NHive92utZTE4AF5Lxg
	ar3n9icLz9ZxMzA8QfgBBPNinDgNz+c5gjXMy7q/0Kp7+iox+0tSI1wv3yNsHFXo/q9ygxdFyS4+2
	zCBWUHUrURlUUWUOfOWiUYNGscgXCYEGBcadp8dsKdZOVvMZGjZMT86GaYlBq2ji6TdKXLkj+FQh/
	SXqfGRhjreikSJ+wYgtBxsm6/8ApbnZYBNAW6tgVa3MFZej6QIHdoglp+4oyEflW7luS0lp0Mf2Xq
	gdcdXeeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtoF-000000083Ey-2HYT;
	Fri, 27 Feb 2026 09:06:55 +0000
Received: from mail-westeuropeazon11010014.outbound.protection.outlook.com ([52.101.69.14] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvto7-000000083Ec-2D0W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 09:06:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JkaFNhvd3qmQfGlqr3Q7QskcoABrX2ZuxO9J0jVrMsYV4+9c8GwHTX62WZV7cseHnKpktU3aJ+i9pRd2mjwJhahWbCfImNPGH7A0Eid0LmIk1g/yL8qo7LA88vELa/U2V7dwTGVh30BZ4N+Wybp/Z782LTFR8ouJRySB/1D/0qtlVUdfufOHfFUxAiERzdjbynhRF1pGdOl2XHxvAR8xk3U4EZQm5tDP6CYPaFqGlumROqC79xrVpeIv/hu8Jj0TZxPHtC/6AY763L/bMERBA7eBkhA+9zQQs7c0arqN+QNGzt2G3uZFVahw6DxfvD7K4XGymG4JoeJslCwAYikncw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+s4oPoriwP+VDAjkTGO18ZLJ53p4GGoH/8px9BxzPV8=;
 b=riVVT0M2wRvhp+qmen1hjpigqPWsHmTqu/zeq9QG4rTjYpVp067JSq9YFzfqCMZ2PVCH82Q/mA7VXGlxTUWjVoY2XdFvketR0lj/37XQJSQxuEPgIpkK6mhS+3gWJfvK5f0qlVaKXnVDmb1QA5JyZMlBAE/+bxCEz9jwWIdXbY41k26CMltW4KNH7laLxyHoMZhbTI+X594Psk9U0fLgLtlJxXu3+ZDpx8YuNWrgaP/KgLoF5OyewleIH7EYassEZwFi9hXTyxAaebFyZe4EEjGHB66GSscbfusJ9Qtbfk+lv2gDKRcFdNPbEKfueq7/qNhHIWCHSGcqu3T6Qcj9Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+s4oPoriwP+VDAjkTGO18ZLJ53p4GGoH/8px9BxzPV8=;
 b=Hk9F/SJrJeuLMhsEItR/3jRpZWW7zPo06hMsJvQzKqPjiyWfLOBJY+GhkhGo1oAJGMH0R8s4kugm+IJ/UacxHEhuzG7lzLtDWEEOf7Y4VZqKPDKXXrVGiZHrHv4IcyJsA8/+AlPGFGBtjDv/1P8wvfvv89WJfXmZ7NOaae95E0cjpiFRHmu6i1PFkvia5zxFGLVuqvW0DzYx+VWSylP1T2MF5JpLOQufYRvLspalxgCw/eSThE6ExXgjcIQDs7j4n10/W0awyd9EIlyE5Glik7dShBneXqCKioukumaYdG16iiq/f56dXvweauqopUTy7j5sXpD84VSLnWvrnb93lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VI1PR04MB6862.eurprd04.prod.outlook.com (2603:10a6:803:130::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Fri, 27 Feb
 2026 09:06:40 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 09:06:39 +0000
Message-ID: <666b2a17-28f9-4fcc-932b-ac01f326d558@oss.nxp.com>
Date: Fri, 27 Feb 2026 11:09:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] pinctrl: add generic board-level pinctrl driver
 using mux framework
To: Frank Li <Frank.Li@nxp.com>, Peter Rosin <peda@axentia.se>,
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>
References: <20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com>
 <20260225-pinctrl-mux-v2-4-1436a25fa454@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260225-pinctrl-mux-v2-4-1436a25fa454@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0P190CA0009.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::19) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|VI1PR04MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: 58b5c028-fa30-4c2d-833f-08de75df8494
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|19092799006|921020;
X-Microsoft-Antispam-Message-Info: 4LnX9njA0u7TNMNHesWbw93mX2gS6xKGZs52N1XhW84bHZldMLEprUmxswHsfCPnzyv4ukTEyxua86h0XYnErxEE3s17tY/J3BOknqOc6lwXy0qVcbct52uncc11SWk4KLQRQw8OJyp9LKcDwL0lpQEUzu0s/g6wudzTDqCenbA3xZ0lZgNpcqcr0fvbvTi/tV+heeJFKWxQQ/LLzdzyyEMJr3hxXpugey6VFxoZNnzXLcdL7CBGdBWVZVmYp3nyUl1Sh/asCjCQkSjcASTHBDYimD7z6XG0PhTxMcoLec+qi6doJU6KmzS6UyXv/8Z/D1PxO87eCOaPpAKh6wbcbhlROjqfA6tivnQUr4+9LUzSrox5uou4b4xT3UGuzFYuJ6raDYZC+U2tXI/mdWexqGyDMqKK22v0DmGz+N4/rJbVb3tXNlF4lLYvyWnRsKaArWdH3oNU5wH1SNX+sWSatdBgmQSJ9kck4Co+xAMg1XnlRwNeqQYFdd7xTkbvryZ+GuhQZZfHamQ5QZq8HAbtAfC7KvUPa3Df2JNUH+UxjmDd3jVixpUP3kSczKZDsmWLhHdPBRq76z4oj2Uf4FA8IrlulrdT8a2toyB/RwXTV+YjAQwVlA0UyFQZBtX2M8lRRm7CxRAZxIKSb5Rt608sKO7zYNlsCiQFNueleNyc30/RYJfjhNJjxeE2TLrP2mD7Erh6M6ArQWNQiqlsEszmtDpykWaCMComSWcf1WHXQxFwsUaFbcvZtaF+UUE5W1kH9/zbLgfsQc7t5gqphflgxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(19092799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEVudExaSkY3VTVWV293anF4Nng1eUV5S0l6ZEEzOGJiNk00QThhVkRnSzFU?=
 =?utf-8?B?UFZNc3Q4cDlCenQvY3ZTQUVad01Xb1diV0ZTY3EyMnIvTHE3WlJ3TDZiTm92?=
 =?utf-8?B?VTB1U2c5MlZhQlh5VGRwa1laY0NEZU9tSDJTNHphQkQxdDVUTGFyMFBZbmRi?=
 =?utf-8?B?OHBodkdvSTJqYnVwZnRnaDVuREU3aEc0QVhtMkFPbU5YMWRYY0tPNTRYbTJt?=
 =?utf-8?B?YmNDejBoRWhiSFpRZ3NrTDdEem5XZnNWSjhVZjZrUHBwcEtGUGQ1SDNDbmNv?=
 =?utf-8?B?eDlZMGJpd1FlN3NLUjRMcDNaL2dIVEJXSlZFSHJ3dEFPL2ptSzJkRGZGTllZ?=
 =?utf-8?B?ZUYrNmRDR3U2S3NTYTIvMmN0UzYwSzJna2VwYWVNOWExOWdJRWw4eGRJTC9y?=
 =?utf-8?B?dCtnRHMxUHlYZU92VEZ6ajNIbzhRTFJncjN1THNQZDM1a2RiY1hRMlgrMThR?=
 =?utf-8?B?akFta284eFlXZ1pDbmtheVgzdDFHSG9wWHdIdUtKaVd2ZXM5cmVEWjEzcXo3?=
 =?utf-8?B?VC8rU0J0R3FzeE5HbFo5SGZjUVdMNXNZVjA2TTQzeTRUODg4MmNQYlUzQnVQ?=
 =?utf-8?B?ZmZpeUdqVHJvYnFaRGVPRExJVXZUamVKcWZYMGcyNHJpN1l6T3V4b0RLQVhw?=
 =?utf-8?B?L1dhMTNCNC9LZzN3RlJCWnFnNllCWUR2czVWZXk1WjBrODBNZHNGU2J0NWti?=
 =?utf-8?B?NVF0ZU5TN09XZ2dXdWZ1ZFRkVW92TlVwKzN2SW5xU3JSS0dKdDcwQUdjOW55?=
 =?utf-8?B?cVFwRUc2cnpFZFJJSUVRbTM4cmhhTUZLV2swcXg3QTEwakNpeUl6K0RiSlR1?=
 =?utf-8?B?SXVKY2hWZGUwb2wrZTFRMmJMUytDVWdqK2hMT3ljLzdoTlJJM1VudVh1K0JT?=
 =?utf-8?B?QTl5TnZBK3Q2aXBTYkFDandsVXJhTzg1eVZ5ZVBkK2JJRkFaSUJIOU85TU9R?=
 =?utf-8?B?SGkyUjk3UzdpbWhkazF3cUVMT29ZendMVncvOXdQV285SnkyVTh1cnBCSlVC?=
 =?utf-8?B?RkwxTUk3ZlBXN2ErekppQlRjdEMrQUcrdUxIRDk3RFV1VkJCbFB4cldEY2Rx?=
 =?utf-8?B?amtkbGxCQkhDa1YyQVYzY0p4TkFLcTB1MjU0QjFpWW1mdC9ab2NEUEtFWXM1?=
 =?utf-8?B?b1YxVk9MeEhWdzJuMjUxaU9WUi9kMVFJU1lCenZQYzgxYXNIVTFNSXZFaWZT?=
 =?utf-8?B?R01yZkxXRVBscTJqUjhVd2ZjRVZHY0NpRy9QelZRZDU1MkF4NnhBa0M4YUNs?=
 =?utf-8?B?NWtpZHFYTUNpcDJMYk5QQ0FkdHkxTmF1MWwrazdjV21tSjRYM3dPS0hESnFT?=
 =?utf-8?B?a0ptdVJsc3B0NERlNXRVRnhDQVVDRmg2NlFvcW1ZUXZLNXpyS0M1N05GYUVx?=
 =?utf-8?B?NWVJc1RIOTh4RnNnWnhnL2VicjVCZVdKV3FTcXduNGVWZHkyQjVldFkrWkJi?=
 =?utf-8?B?NzVpOUI0cDFJdExaV0hQOVhkc2pmQU5iQVBud2NLMkZWZXBCeUhDWGQwR0pY?=
 =?utf-8?B?VFNFSlZJSmNKQ2dzUnFNZGlaVGVRamNhMFpxbDEvTTJ5aXFXYldtQlh4ZW1F?=
 =?utf-8?B?QS9DUmptM1F5NEF5amRhTVVpODNYdEJGTkVHdWQvaE9reGNMcW00ZUg3Vy85?=
 =?utf-8?B?Yy9QRWdYeDhFWk1qZjQ2aWE0UmhtUi84RGpWQjBwTENUM3RBb1BLQ1NUaVRT?=
 =?utf-8?B?c2xsSktxbGNNRVRPMkpRbEJZcTloV1pnLzlvVzJNK2cvYkViU1NQQWgyMkpI?=
 =?utf-8?B?eUlHdGY1ekc2cFBMeERoY1NYek5zN3JwbENrMHVIOFlqQitPUzhjeEE3WFk1?=
 =?utf-8?B?VzJMU0hJbmpZZXJVMVp3V3RDVDJEelpuNWdRdGxRMEltSVV0RFpvNUI4Y0lj?=
 =?utf-8?B?aTY4MUd4SXpOdlpkL3ErM21xNFBVMSt5b1g1eUp6TW5TRmpFNlR2dTI2QUl2?=
 =?utf-8?B?K1hpR1IzTEFIRGgzdGNnbkhESlU4d0M1cGYyZmpyNXptTWZGOTM1c1p1MVBZ?=
 =?utf-8?B?aUdvQkpWOUFlT21tWDNOZDJjWHBXcUVaNTJzZjJLVktudmlVWndnK1hBci9y?=
 =?utf-8?B?b3ZlSFZVWHhLWDV5ajFhMzlRblZVaGtzYi9QUmhnRXVDbmttdm5HeW1ISG5x?=
 =?utf-8?B?THZYMEVYMUlXZVBKTW5FQm9GQkhYLzFKTWhYdlJEbzBNdkUvTkJSak95d3BH?=
 =?utf-8?B?OVJXNFFFU2JxOHVMeWpsOTZiRmd6SXhkOFpDczNwUUNBKzZWZm1kU3loNkhT?=
 =?utf-8?B?bHhXZVNJd0JZOHZLaUpnMWljbE9ZcnR5M2luZ1E1b3NLMTA2aTZpd2p5Z1ho?=
 =?utf-8?B?d2l5QmZ4eEw4azBOdEtMZGVYZ056K0RCM1dGMGlibUwzZFMzdytwdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b5c028-fa30-4c2d-833f-08de75df8494
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 09:06:39.8602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yw0tP7VryIslOUU+xy/p1aKSpiq8JkvR9xW2Mmqi1syWEEDHklKNkG0dFZVMrRHI6yoE/cIgkO9a8C4agv3kcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6862
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_010647_591091_935D06B3 
X-CRM114-Status: UNSURE (   9.56  )
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

On 2/26/26 01:55, Frank Li wrote:
> diff --git a/drivers/pinctrl/pinctrl-generic-mux.c b/drivers/pinctrl/pinctrl-generic-mux.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..978cbc4f82a0b3e56dd83ce24426d4e764262a6e
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-generic-mux.c
> @@ -0,0 +1,241 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Generic Pin Control Driver for Board-Level Mux Chips
> + * Copyright (C) 2026 NXP
> + */

Nit: NXP legal asked us to drop (C) so this should be Copyright 2026 NXP!



