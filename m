Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9C6D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 18:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:From:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wbTyLj5bss0VjZ4Zc+iBPs7aeqlVIts3Gs+PRO+gzAg=; b=gwseX4n2cGlJh4M9CfUGvFty2v
	ms+evKGyevXwyJXUrgJxBuX4czuHEBGhaFJmLXjtEbCw4cUrJOOCcVG9XS3Uz+aCWfRocdGov4tfK
	Pntt7o+aZ1rXZMxc+uUhBa0W6tMabfKuo/1ytdmnxWC9xqPCjLl35Cl0J2KEWeTZYfVwrbuGH+RSN
	VuYyCVPJJaSGUsUioiofFV34Z5ecFtymEoHw3++JUaT4bKwK09e3FY+aj2arn3oYTRAuVVYUp2YXC
	H+wFbaatmPSIz//kvxumGNVbP2k1muEtdCYwdXHLTP/hZQ9emCEh5ONEI3ttqHIh95KlZJxZ8MJpV
	BTsdu9wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP3Qu-00000000mYz-2nNP;
	Fri, 28 Nov 2025 18:43:04 +0000
Received: from mail-westeuropeazon11011020.outbound.protection.outlook.com ([52.101.70.20] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP3Qr-00000000mYQ-1lTh;
	Fri, 28 Nov 2025 18:43:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kV9I2bmoF6011rLzvEomIv79RvfT7lFb4JyS6qqieZOFIQ34/wUWeqZ3eDyYlsXGDyZlkNhg1i2VH8oPCXEgf4cQhDD3R/L3xlc6jTSKd5x5GXaz2j7keonisbe30TBGVPNlBXnppEFkYJd8OopEORfPpJ8pKJiQ1d5VVWEOuXXdcdxvfu0ly/ST7SKNuZPu6AKLKyILYXLUpCZQeQuHdwhbaTI8q7eh3H/W067oNlOD9wXM+o4E1/NW2+VCYA7e5pYLos1R60i/QDWSE+/x1Fx3cwH7FrtANG/nGYDoTYi/uu7UZX5rWpg9OtoOxWYh25a+DWq8MmPZLLIJTf9cog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbTyLj5bss0VjZ4Zc+iBPs7aeqlVIts3Gs+PRO+gzAg=;
 b=otq+0pxadHDAidn4zzCcExw+sha3UqTZ7OWRRVbUuOGweaO8B+3D9p+90OA5IkbR2OtJh7n4pgeNMaRddL9wwpsqeP/J87IsO7PHpvtpndMgUIfhExDM/8ivkntp9UFEwV3pKEMipgNEYYk0IYCflZp2ZdZpN6v5GwSRQIC7oR2B6pJt2+6lzHJs86JUS281uzcQuLN5zlplxGMo+kdmFx69O9oo8xPhVQ8GwclJXyhdFZon4MEr5u4DW4oTHgPvUFUcZHtA0xgcaF08N47jONmy69Sp+prqD7GRPaaVei3w9f6AJ01Fqq7Ij6Vjz1ub0ecoPTIaJzY09eNwoK7vjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbTyLj5bss0VjZ4Zc+iBPs7aeqlVIts3Gs+PRO+gzAg=;
 b=cj+NPVuuX9BiM9GQgleyzckQirkyfTDajlJVwp+mdxndmU+F38MA34/DS0GgKRr8LBWVxd/fogyfkAc9ZQegjG7izVxrWBvxm/TuTEeKoRRENAoAf0auqE+h0VMboNcq8CWGcl4YwZ+vRhvG9+8ns6SSthWKzNg+XHuBQ1P2nlQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DB9PR04MB9578.eurprd04.prod.outlook.com (2603:10a6:10:305::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.16; Fri, 28 Nov
 2025 18:42:53 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 18:42:53 +0000
Message-ID: <0b20d760-ad4f-41c0-b733-39db10d6cc41@cherry.de>
Date: Fri, 28 Nov 2025 19:41:34 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
Subject: Issues with DRM_ACCEL_ROCKET (Oops, power-domain, probe-ordering)
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::26) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DB9PR04MB9578:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cc1e95b-4e8b-4236-adf4-08de2eadf093
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2lUcEtCVE8rcCsyRE51UTRWVGVyVVZZWTEyaWtnbHFKRy9IakhtRDF0MkhP?=
 =?utf-8?B?d1RoZkptVVBwbGJHbUpuTzl4YUE3UytCMFJiRDliekhKeURjZDBFR0xsRlg1?=
 =?utf-8?B?UWRXMzdKanhyLzRXOFZzdlZ4bzhhekxvall2YWhaM0dUU1pBK0VKdHU5OVE5?=
 =?utf-8?B?aS8xcjd6bUNJMWIyMjBLOURYQ3FLaFhYeWs5alJSVUJxd0xIMWZIWHNRTDJT?=
 =?utf-8?B?MUd1UEJpY04wUHBvNlU1eWo2MGhrWjNYQVVqc1MwbG5KWmREQVJnc2VSZVgx?=
 =?utf-8?B?V1VlVTl5Tm5HNUFmU3RMRTFhcWRRV0NUTDJkZFppb2NrYllvc2I0bjFNRmNh?=
 =?utf-8?B?OTNwYldYWnB3em5OS0lzc1J5aFJnc3V6bmJsZUJyc0hQek1BNmtjSkhmd1dy?=
 =?utf-8?B?QmN2YTRkejRCODNySWk4RGE1a1BCaUFzbFc5Z1pqTldkM2NwOUhncGl1RTRD?=
 =?utf-8?B?VGo1c0RSakNkSWNPcFJFUlJIZEozZmk1UVZmMG5JREc1eHF6MlV2TlRuNW5T?=
 =?utf-8?B?MndhSnhzd3VnTTJpUU4rcmFTbzJKQnZ6VXhDdVo1c1cvZnZBMnV0U1JKVHhF?=
 =?utf-8?B?THc0SDkxOVA0YzIwMmJJRHR3YXkrMjRBQzAvWCt1K29QRWZublIvejB1a25j?=
 =?utf-8?B?ZnczOHRtZzF4YTRhMGFQNXV5em94K2pGQ1p4NHFSNFVEcUtHUlFFV3ZwSG5u?=
 =?utf-8?B?aFhTeTlieE55RUVLMzdBMEloOVh0VjkwOTg1OGJwQlFMRHlmdGJ1TXExYVg1?=
 =?utf-8?B?aE1QRlJPb1BCMzk2QmNTRHo4YmJoN1NlWWFnaXkwYVZLTUQ3R1BDNVlWS09N?=
 =?utf-8?B?bWJUQVlIWWF5dW1ZTjFueDNZSTdEeEt1STNrOVFtamlTZU12bDdZMGV4N1ZB?=
 =?utf-8?B?L0tWRjlmaXpScVBZOWlCdUhLdXlwQ2p2NmVraEFQN2duSFlIdmdMdEpzM3N5?=
 =?utf-8?B?SFd2WE9yUHdZN0pjNjIxbmUvTHJCMngxZDVFSlMvb0dsV3kwRkxUUld5MVNQ?=
 =?utf-8?B?eHUxNEpsQUNPN2JsSzcxU0IxelJsRzlpK1hldGxIZ2Vzd05TWUZvdzNkdUpQ?=
 =?utf-8?B?emZxWWpjWkIzUm9mNUxxcDFEblVoOWE1U1FiWW5RS0hGRG84M0EvOW16R2Rw?=
 =?utf-8?B?dGxNc1ZGQkZzQnRBZExjNzM2Nkk3bXBaWDBwZ3NFZXlUUmE5SUZEM3dpZmkz?=
 =?utf-8?B?a01Lbk12NkJUQVZLU3l2RGVWWkFrejlWZm9DMThGTkFJUnFicVRwSDdTYzVu?=
 =?utf-8?B?ZUw2eWxQOGhraTNlcVQ0QjJJeEhORU1yR3JROUs3akVJTHNxdkVsbzVJOXdS?=
 =?utf-8?B?eWh6MFVyWDJ3a3dYUmdBaldWcy9WUFU1TFhTMWVXejRKZmRRU0NabDJUYnF0?=
 =?utf-8?B?Qkt3Nm5lNklob3lmS1V3U0hINkR1Q1lHWm9SMnRUSVhuNVBLQlJWOEpZY2pa?=
 =?utf-8?B?Wi9pLzhKRm96ZHZ3UUM0aytIUzVxZFpDUUNmbGJjSHJGRFNONzl4UFZnVVpa?=
 =?utf-8?B?dXg5dzVBNE9pSjUzRHdxR0EzMlNHQWpEMngyQXNJU2tGekx4S1o2NlNvV2Mz?=
 =?utf-8?B?Y1pNYk5HeTBmWEhISGtDOTc2Lzd0V1RDS2Y0RExoeXUvWFc3d1RWTXdKSzBF?=
 =?utf-8?B?OFdEWjhiaS9XUWJ6Ty9LQnhZNjRlZU9sR2Nrd0V6U2drUmVSdlZQdkxBRVV0?=
 =?utf-8?B?YXo5VlJmWkFRRXIvdWJhb3gya1VpTnY4TnVxd0tqdUNxcHhKL24zNDdvaS9v?=
 =?utf-8?B?ZkhZZVAvaFRMelcvNnd1SGQ2Ykd0dDNrU3lEbzMvY1Zua3hiTGxkOTVLYVdG?=
 =?utf-8?B?NFRFM1NJRk5KUGNYN0YyRUVneVc1NElVZGk0R0VUK3JXaXYyV3BQOWlvdTYr?=
 =?utf-8?B?MEtLWm9Fd2tJejd5Q01hMm1nQXVoU3d0TTJBTG5uNkF2WFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFFXWXpJczJqUDROTGZXdWFOQ2ZUNW9uSUZBaTNNZjlBdElyTXZ5cTdCU3h4?=
 =?utf-8?B?RkliUm9uYTlWc0JyNW56T0RBR3FReElHYW9iZkZXMEN5N1pIVHduM2RaS2dW?=
 =?utf-8?B?Y0hKekRYQkZ1LzlXQnAzQWVVN1VMTE1WZDFwck1kUkc1cmFNd2orOXlYdk5s?=
 =?utf-8?B?WmYyV3kvWUU4Yjgyd2lZMVhxQWJBOUxVeGZiSCt2V1Y1aUI5SU01aVpFWDVL?=
 =?utf-8?B?djFxOVdHUmRrbkVtTk9GaTIzckowd2FxWUFGZytDYS9YakptL0p1bzRWeUxZ?=
 =?utf-8?B?L3NRUE93VzFqc0IyZjJWWVZvNG53cXc5Q0Jndi85YVkzZ3Ewcm1Oc205T0xw?=
 =?utf-8?B?SC82OG4zaEJmemhNU3NCNUNpRFdtUlRsU0FCMythQzRIRDJRaG8wNnpQakZF?=
 =?utf-8?B?ZmpOdVlYSXMzejBXUnZCL2dnVXJmSkUvU3lBNkxmNlREZ3hSa2w1TWVDWEpw?=
 =?utf-8?B?L1YrcjlnMDBNUXZmajZoMHduYk9Rc1JUWmIyeDZCaHVaN3YxTEZWMVpjOG8y?=
 =?utf-8?B?YU9FSXllN3pvQ1hMT1ZVSWwrMUM5UXJ3UkxRK0NteXVnOEt0NS9YbjJwSWg3?=
 =?utf-8?B?bXJMTVBIVVcvellvRWoycFFicE50YnhubG0zTmg5QndlQXZkRWd6VzhGdXcz?=
 =?utf-8?B?ZUMwOXBHQlY1ZlE1aVFRNmF1UkVjOUxKS2ZaZGZwNXZHNG5KUlI5SzBsR3pE?=
 =?utf-8?B?aDRyM2xhT3NmSXhYbS9icHEwWkszVHEzOVl1YnJRc2VWS2JJQXgxQ2c3bzJ2?=
 =?utf-8?B?OEFFVEdadFBreXR4U0RpZy9Da2hRcUp6QUdVT2I4VWplTWNJelJZUkZzdkMv?=
 =?utf-8?B?M1prK0ZVdElsWE1Rby92bVJrTDdvb3VCb0NDZk51T1RvNjNUUGlHa3htY21M?=
 =?utf-8?B?QzVLYkVOOE1SOFFDcndya0RYSmxYdVRiOVlrRi91QnQ3L2pNbjcxMURjUXVk?=
 =?utf-8?B?VmtYU0hTNk91MDRwWjU5aFVaQlVUeE96UXAxNFJxaXVGT2F4bjc3L3FFRlZ2?=
 =?utf-8?B?Q2drVXRiUnJwanJVcHBlcXBLWXhGRjhZSVYvd1JhckNzRXp6NkhOeWZqMGVG?=
 =?utf-8?B?ejEvYlUxb3NROTM2aUdsTTUyekhRZG9kZFZYL29UMTJaU0RXSytjSzF0Zlhv?=
 =?utf-8?B?ZlFDT3lUcjV0QmdNSjl4US9qR09FR0RyZHc4SSt5SUorZDZxOTZjZ2xBeUx0?=
 =?utf-8?B?UEpsYzBWcEx5c0xsTjQ4b3pscmdBWjJxQzEzbEhKSjBDTXNraWFVMVNxbE84?=
 =?utf-8?B?MFZ6REpEMXhEOUs5N1MyYmRmR2x4RkxpYmYvRDY5dTNFd3ZsYlAvbFFhR3dZ?=
 =?utf-8?B?Q1ZKUVF6Qmk0dmFLZC9FRkZSQTVaZXpkUFNrUmpLN0ZEZ2NtdUJzcEJ0VDBr?=
 =?utf-8?B?NU5nTUdib2xvZERrM0ltZkNQdzJEK2hvSDR6dTA2dCtCTC9zR0IxK1FwcHJs?=
 =?utf-8?B?dFhJeS9yTytHS1lKV2xnQjIrb3JDRUJoSUVoU1RmaUZYV0tqNkIvYU5aVmhh?=
 =?utf-8?B?SHY1bWQ1RmVrc0RJS0ZHUElSZ09vcVJrZTdWVWhWalpoQXhqMWhmTk92MkJs?=
 =?utf-8?B?dDNSSWVlMmswMm5XOG1oSkoyR1Z5eTUzMGxoTnNMUFdLZW1ZRmFDdzFUTWVO?=
 =?utf-8?B?WUxRTVJDcEpEbTMrOFJKcVM0SHZGUzNBS3MyaFZoSFhDYVJlandrbWRUQXcv?=
 =?utf-8?B?a004K0pJNWxoSnBpOG1wMDd3TVd5c05oWGZXMmIzMEFHVzVySlhZYkZwbnlG?=
 =?utf-8?B?bFFMbzJSRnBLWFJNdG5mL3hqOTZwdEU4UVlUU21ZRDJEWkNjclZFUncrQ3Q3?=
 =?utf-8?B?NE1pZk9wQ3ltbzZwMXVVakVRUHRaQVRSNDNXQUNpTzVPRElINTRUbjQrSXJO?=
 =?utf-8?B?ZzdqbkZaZUtaTGtqclRiN2F0VmpkRkNEZUlYMGdMQVMvU3lEVjJxNnJ2M3FE?=
 =?utf-8?B?SGF1cnBHeGRFYzRvK24xOUdlc1FORzkxMmNTbFNQczUzei9TYUROMlpXQjN3?=
 =?utf-8?B?NElYcUNuUmlIYjdUN0dDTVAzdldlaVUzendwQmdveVd6Vkx2WTRhQmQ1Ylpm?=
 =?utf-8?B?TUU5THZncVI4U1lZTkNrRmR3a0hmU1Npc0YrSXlSa0w1QVJ6Vm5QS0lqZFRU?=
 =?utf-8?B?WkdMWXFTWFQ5ckN3MWdnQzViWHUxMlRqUXlCUnlZMVhYRGpkRkkzdnJtQWM1?=
 =?utf-8?Q?pfzJAC9W6XveP8mSbqQbTY8=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc1e95b-4e8b-4236-adf4-08de2eadf093
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 18:42:53.5219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: doD6cN3Hl0G75K+CJ78W3VXihGdX6YVpcKJqLS0PNoNr2PmGOahZ9UZyFQ3G0fHowejWdgF9S2KV5MYaIq7y7P0zFaVOkDlqDSvh1uvPrAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9578
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_104301_793413_27B98BC2 
X-CRM114-Status: GOOD (  27.33  )
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

Hi all,

I've finally found the time to test the RK3588 NPU (aka Rocket, 
upstream) on our products and I've been hit with Oopses when loosely 
following the instructions from https://docs.mesa3d.org/teflon.html. 
After debugging for a while this is often (not always!) reproducible 
when DRM_ACCEL_ROCKET=y (but not when built as a module!). The fact it's 
"not always" is a dead giveaway timing or probe order is involved, more 
later on that.

I don't think the Oops is important as I believe it's a symptom of other 
issues, so I won't post it.

I'll list the issue I've identified so far, some seem easier to fix than 
others (the biggest issue of course being the hardest to fix).

1. 
https://elixir.bootlin.com/linux/v6.18-rc7/source/drivers/accel/rocket/rocket_core.c#L79

The error path after a failed pm_runtime_resume_and_get() probably 
should be calling rocket_core_fini(core) and not rocket_job_fini() (the 
former calls the latter) as to unwind everything that's been done in 
rocket_core_init() before this failed.

The PM core complains about unbalanced something when the core fails to 
init and is retried later.

I suggest the following:

"""
diff --git a/drivers/accel/rocket/rocket_core.c 
b/drivers/accel/rocket/rocket_core.c
index abe7719c1db46..95a732ab418c3 100644
--- a/drivers/accel/rocket/rocket_core.c
+++ b/drivers/accel/rocket/rocket_core.c
@@ -76,7 +76,7 @@ int rocket_core_init(struct rocket_core *core)

  	err = pm_runtime_resume_and_get(dev);
  	if (err) {
-		rocket_job_fini(core);
+		rocket_core_fini(core);
  		return err;
  	}

"""

I can send a patch for that.

2. rocket_probe() 
(https://elixir.bootlin.com/linux/v6.18-rc7/source/drivers/accel/rocket/rocket_drv.c#L159) 
can result in out-of-bounds access when rocket_core_init() fails as rdev 
is a global variable (so rdev->num_cores persists between tries). 
Considering rdev->cores is allocated based on the number of available 
nodes in the DTB with the rknn compatible, if rocket_probe() is called 
more than the number of available nodes, rdev->cores[core] will result 
in out-of-bounds access.

I believe we could do:

"""
diff --git a/drivers/accel/rocket/rocket_drv.c 
b/drivers/accel/rocket/rocket_drv.c
index 5c0b63f0a8f00..ad602ebd17c44 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -158,6 +158,8 @@ static const struct drm_driver rocket_drm_driver = {

  static int rocket_probe(struct platform_device *pdev)
  {
+	int ret;
+
  	if (rdev == NULL) {
  		/* First core probing, initialize DRM device. */
  		rdev = rocket_device_init(drm_dev, &rocket_drm_driver);
@@ -177,7 +179,15 @@ static int rocket_probe(struct platform_device *pdev)

  	rdev->num_cores++;

-	return rocket_core_init(&rdev->cores[core]);
+	ret = rocket_core_init(&rdev->cores[core]);
+	if (ret) {
+		rdev->num_cores--;
+		if (rdev->num_cores == 0) {
+			rocket_device_fini(rdev);
+		}
+	}
+
+	return ret;
  }

  static void rocket_remove(struct platform_device *pdev)

"""

I can send a patch for that.

3. I believe (but I may be wrong) that core 0 is special (do we need to 
schedule through core 0 maybe?). There's a hardcoded fetch of the device 
associated with core 0 via 
rocket_iommu_domain_create(rdev->cores[0].dev); 
(https://elixir.bootlin.com/linux/v6.18-rc7/source/drivers/accel/rocket/rocket_drv.c#L88). 
The issue is that this assumes that core 0 is always rdev->cores[0], 
which may not be true as it depends on the probe order (which is not 
guaranteed), which can be exacerbated by core 0 (HW index) probe being 
deferred for some reason. Is it necessary for core 0 to be the one 
initializing the DRM device or could we simply use any core for that 
(just the first to probe, whichever it actually is HW-wise)?

If there's a need to know which of the three cores is core 0, we can 
have a vendor property for it or maybe aliases for the cores? We can 
also do a check on the base register address of the core in DT and then 
do a mapping in the driver. Any other suggestion?

4. The actual issue I'm unable to suggest something for comes now. The 
following is all happening in the context of DRM_ACCEL_ROCKET being 
built-in (that is DRM_ACCEL_ROCKET=y). You can use aarch64's default 
defconfig, then DRM=y, DRM_ACCEL=y and DRM_ACCEL_ROCKET=y via 
menuconfig. Remember that this is not 100% reproducible (more often 
happening than not).

Points 1, 2 and 3 only are an issue if you hit some error-path during 
the probe of one of the cores, which is triggered by this point 4 here.

rknn_core_0 depends on rknn_mmu_0 as highlighted by the iommus phandle 
property. rknn_mmu_0 depends on RK3588_PD_NPUTOP power-domain. The 
parent domain (RK3588_PD_NPU) of RK3588_PD_NPUTOP power-domain has a 
domain-supply on a regulator on i2c (i2c0@42 for Jaguar, patches on the 
ML at 
https://lore.kernel.org/linux-rockchip/20250812085213.1071106-2-heiko@sntech.de/). 
When the rocket driver calls platform_driver_register() in its 
module_init() function, the kernel core will try to probe the associated 
device, via driver_probe_device(), then __driver_probe_device() and more 
specifically pm_runtime_get_suppliers(dev) in there 
(https://elixir.bootlin.com/linux/v6.18-rc7/source/drivers/base/dd.c#L793). 
Then this calls pm_runtime_get_sync() on all links, c.f. 
https://elixir.bootlin.com/linux/v6.18-rc7/source/drivers/base/power/runtime.c#L1914. 
Note that pm_runtime_get_suppliers() returns void. One of the links is 
the rknn_mmu_0.

Follow the next series of function calls, pm_runtime_get_sync() on 
rknn_mmu_0, rpm_resume(), rpm_callback(), __rpm_callback(). This then 
calls cb(). cb() is set via RPM_GET_CALLBACK(dev, runtime_resume). Due 
to rknn_mmu_0 device being probed with dev_pm_domain_attach() attaching 
the power-domain device to iommu via the pm_domain member, 
genpd_runtime_resume() (which goes to rockchip_pd_power_on()) is 
actually called. This then calls rockchip_pd_regulator_enable() which 
returns -EPROBE_DEFER. Going up in the call stack up to rpm_callback() 
you can see that retval = __rpm_callback(cb, dev); now is EPROBE_DEFER 
and thus, dev->power.runtime_error = EPROBE_DEFER at the end of the 
function.

Then once pm_runtime_resume_and_get(dev); is called in 
rocket_core_init() during probe of the rocket device, it'll call into 
rpm_get_suppliers() in __rpm_callback() which in turn will call 
pm_runtime_get_sync() on rknn_mmu_0 which will go up to rpm_resume() 
where dev->power.runtime_error will be checked and if non-zero will 
return -EINVAL, effectively eating -EPROBE_DEFER and failing the probe 
of the rocket device instead of deferring the probe.

Applying the below patch:

"""
diff --git a/drivers/accel/rocket/rocket_core.c 
b/drivers/accel/rocket/rocket_core.c
index abe7719c1db46..c4692189bbfc6 100644
--- a/drivers/accel/rocket/rocket_core.c
+++ b/drivers/accel/rocket/rocket_core.c
@@ -72,22 +72,9 @@ int rocket_core_init(struct rocket_core *core)
  	 */
  	pm_runtime_set_autosuspend_delay(dev, 50);

+	pm_runtime_set_suspended(dev);
  	pm_runtime_enable(dev);

-	err = pm_runtime_resume_and_get(dev);
-	if (err) {
-		rocket_job_fini(core);
-		return err;
-	}
-
-	version = rocket_pc_readl(core, VERSION);
-	version += rocket_pc_readl(core, VERSION_NUM) & 0xffff;
-
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
-
-	dev_info(dev, "Rockchip NPU core %d version: %d\n", core->index, version);
-
  	return 0;
  }

"""

seems to make it possible to run mesa's example. If 
pm_runtime_set_suspended(dev); isn't added, we'll only ever get job 
timeouts.

Note that I'm pretty sure this isn't the proper way to do it but wanted 
to give some of my debugging attempts at that.

I'm not sure how much further I can go and specifically I have no clue 
how to handle that properly. Please also verify all the claims I'm 
making, I'm not entirely sure I got every call stack right, it is quite 
convoluted and I don't have experience with those frameworks.

Does anyone have a clue how we can deal with that?

The driver built as a module doesn't have this issue because the 
regulator has enough time to probe so that PD doesn't return 
EPROBE_DEFER when the rocket device gets probed once reaching userspace 
(where the module is). I'm not entirely sure if this could be reproduced 
by having the regulator driver as a module too for example?

Cheers,
Quentin

