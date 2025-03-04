Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79006C282D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 15:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhLCWskPiI+r9tNKUSMHWgVOhfoHA3t+0poeySv7odk=; b=3UtDIyhF+q8DgwRyaNJvJ8xeGG
	oTfhf0sFPtgIVnv2LUcp1k37JeQ77J3KFxXPyr5Nxl/qPSi2rEUoH4xsiLQtLAKye+iLRTRC3vkny
	9kyxvJGB8vPHekjgmD4iz2EjwVz6D4FcAzuL/b8P1biAaWHXG+q/aXqv6A81CoIxDx7s9a+b489Ot
	BE0XZ3t/A8fHcXDUkbWsFPTQQMJCvhkv1XA4z1ZKLjtYrgI5Vi+60FN/q/okm/VqWwr/w8WzTnLKc
	r1O/OcELjCqZQfe2EqtxR1mxgcEcxtLTTx+ADpMDf1H76uFaNS7cS+66B2b57P8Pm6SHpCyXcMlaE
	yAQ8gIMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTzv-000000059vu-1nAx;
	Tue, 04 Mar 2025 15:15:55 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTke-000000056PQ-3O4q;
	Tue, 04 Mar 2025 15:00:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUdR4BgpQj1ZlJx33NAoJsXcLWIb2rjxOBAboM8MXAx0igAYTMY3lg1/g1RSO+FZL/16q7uoMWIqwnCZBoXwhGL31Vf3YRi+T8zfBqCTRSOX3TLeCTAQeOis8OzPdZaofIWc64HJX/46aXhNdqEhci6bdh5oF66RzrXwOZCVBubdvOVDClRWP2Bzw/FjevZ3CMXVv6yKj4tqCAe5O2zRUUE5WAtBnCVLvJgh4r5zTeN+9cz4NrIGzdkRzGOAjUwqXm/lvivcIHiT8l04MAkB4ch9uIZmpG3WrdyerjZin+5DDwL/3zgAI37HIbHqjPdcLp9pahidEgguXjLHwhSIgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhLCWskPiI+r9tNKUSMHWgVOhfoHA3t+0poeySv7odk=;
 b=dOyoOuuz95ne2ueQwhXZYlf4mskueThlheo8gZdZsv0ZUPrUJmlpu0k2w8xjWnnlvhxs+WS94WxWcngXw5BF9Sio360bFOZHOueDuXdLuIDFtGvJGLvKFpzapVYwPVdlcOPzLxVq6o8xf6ewmjJiQnTqB45fB/DMTzu4NT+FcMjcLqPUAYoLyOOWCGQ2Zidkgf11svNBXNrGaS6RisuY091aDoMWAVE4Nny0mG4Ag/MSB4WalgcqR3ETar1bE6VxAOfWJbDE4nj/OSMszxLGXem9jHXCkwm9K/A8FYh22HkF9eviD+4CcTHWNeaK0rSPYPhheMAk9/pAt8bEj5x9yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhLCWskPiI+r9tNKUSMHWgVOhfoHA3t+0poeySv7odk=;
 b=YsB4Ie6hfPW6cNFZY/MCuvxDuXFuctcAsXtBpS8DDqVhyZwp6WPzT8rpa4Vp8+AAH/IEZhln1qwKYoxIPu/LQhvxfskgxPbV97I4BOl4xuu3H7/t2trTYVq9dJr+WXY2jxMsVMQ48s95esVy1zLky4JWo6VpfgywJcUtJKAowvE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI2PR04MB10192.eurprd04.prod.outlook.com (2603:10a6:800:229::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Tue, 4 Mar
 2025 15:00:01 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 15:00:01 +0000
Message-ID: <23b59af6-da87-44c2-8916-65f7df146306@cherry.de>
Date: Tue, 4 Mar 2025 16:00:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] drm/rockchip: lvds: lower log severity for missing
 pinctrl settings
To: Heiko Stuebner <heiko@sntech.de>
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20250304124418.111061-1-heiko@sntech.de>
 <20250304124418.111061-4-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250304124418.111061-4-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::7) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI2PR04MB10192:EE_
X-MS-Office365-Filtering-Correlation-Id: c783da3c-bc8e-4ed9-41d4-08dd5b2d3d4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWNMY0o1USs2NGNQRDhLcUxCNlQ3eFpEMWt0ZlFqOGpCUElldkE2OHJYeURk?=
 =?utf-8?B?eDdzK0cxTGJVd3VadVdwcFFmTGFCZFFjc295b2lhVkhTaTFMTmptWlhhL1dP?=
 =?utf-8?B?d3FXS2ZXTFVFeWtBajBXdlZHQXdNUDlQbVU2c3pDazNrMVhERmFCMnpqMHgw?=
 =?utf-8?B?d0FpRVRDajNZSVZuaDN2MWhmblU5V1JselNQa0Q5eno0azNjKyt6WnZMeEVC?=
 =?utf-8?B?Q1BwcEFUMy9EdWFPazRlYWpKY2RKZlo4K2hNRXUzV1hHVS9BRDBINnFHMEIy?=
 =?utf-8?B?SGdiYVAvaEp2V0kyN3VIT2xiNzljdzhOV243NmQyVCtpR2NVeG45S2lzd0w3?=
 =?utf-8?B?UlZzekRXMXBZQUxrZWlxVWM1WDVOcEVPN3RpT0NBZzVDR0tqWFJucUs3ZlAw?=
 =?utf-8?B?ampRRUVCWVpvVklWWHBSKyt0WWtKSVNxSEg0a0c5bnhHZlpSMk9OVUZEY2Fp?=
 =?utf-8?B?enZ3VFNNL0hvM01rM2twcjdLVDhwWTFvY2hKYmt3MUhpVFkyVVZ4cThIRVg4?=
 =?utf-8?B?VEV2T1M3UlEyOTFMVTNkVTJodTljbDN4TmE5Z2RIYk1Idk1BQ21oMng1N3dS?=
 =?utf-8?B?cHo0WmlVaWE2a1hyWUdHSFNGRmlpckVUemVZMUZtWldCYTQrV0J3cDRnMHk2?=
 =?utf-8?B?cUsyQXV3SjJtbEo4S2RVdWxvZ2tCUXhiZUdMN09BSTFHdnQyZXFDVVppSCtj?=
 =?utf-8?B?bm9BQjlHQVJWREJ2RzZlaXZYbmpiSTlsY2hVRU9NaC9qeDBNZ2QzVTZoN0F4?=
 =?utf-8?B?ajNIa0s1eGgvTzhhZ1kzTnVvdGxPbS9Sd1MweHZYaTdNQXFSOS9tVGdLbGhk?=
 =?utf-8?B?dXN0N002ZmNJNS9va2lpYlFhNXl5NlR5MEcxK01Yb2owdmoxZUdueUY2RjZ0?=
 =?utf-8?B?TVFGK3lsRzhKZkorcm9rdkUzK2VmcWppNHBuNmJUMnBPTlU1V0Zhb2dUUTh6?=
 =?utf-8?B?Zzl3Qy9xTDM3WTVyUVVjalNPNkJMSFVtUTZML0U5ellYV0xQL0hnT1Boa1ZV?=
 =?utf-8?B?d0JOSm4vZklKOU93bGRJelJ2QlduRVlVMnZwRDFnQ3VFODl4bXl5V2tua2NJ?=
 =?utf-8?B?TG1tV2RnZEhnWkV4ZEJ4bWMwMEg3WmdDZTlXL04yS1NGaWZGd2F6WDM4Nlpp?=
 =?utf-8?B?VExPMG1HMnVTUVFGd0kybEs3Ym5BN2RPSWxjeHNKZlEvWWtUZmdLWk50cDh3?=
 =?utf-8?B?TDZGR3JKZ29NWjA5aWxHYW5rRmcyY1pLOVA1a1Bjc09sU0pUZGpJNDR6c3BD?=
 =?utf-8?B?VUUzS1RlYzJzcW9Od1NnRzNjcGtUMHgwblVXdTJVN05RbXJtbFRHblZtSzc3?=
 =?utf-8?B?Ny9iemJ5SXdGSS82WWwxQmdlRGpXc0FkRXMwZ1BwRTVxM2FxNWFvRDhMRGJz?=
 =?utf-8?B?WmVuaEU4SmpLcGJBajBjc3YzMk4ydWlFSmF4L3J6L1UxcVZDOXJDSnpGUFJs?=
 =?utf-8?B?ditkUXp3V0Q4aW5tSUtvU2FJUlJhWDdqSmdQZG4zZzdtTGQ5Nlc0enJwOUdM?=
 =?utf-8?B?VnJxOGoyWTVBRklNMEJLUUJIajlreStBQVdOWFk0YjBMNWwxb3lKQTdsdyts?=
 =?utf-8?B?d3E3dFo4OEpXNEpVd3BsZ2grQklNWHNjMmZKcEdacnNyN0dZWExxNE1CZmRF?=
 =?utf-8?B?dW0vS0R5dlhwdWU2KzJudHZaVksyRWUraUpBeDl4dHpxMHdWVHhrMk9rZUtO?=
 =?utf-8?B?dkxCVThuTzBqTFhxWjRMZndLMXpYUjhlc1ZQbTM5ZGRDNHpGS2dOS3ZPK3JD?=
 =?utf-8?B?UU1OQmtuT1hwNlFPRUE0enVBaEJpTUNpSEtJR0Z3UDdkU0YrRE5DbTk2Wlc0?=
 =?utf-8?B?VzNhQi9qOFkxUm9vQkpEWGo0Sk5PYUFRQVJoRHM0blVUV3NONkRUeGhNS2hz?=
 =?utf-8?Q?l1EDGwEmj+imM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUJ5VWtGc2dmQ3VydUdqQ08xWVdNY0oxNE9MNGd4ZC9Ydld6NTBQMnRJZW5s?=
 =?utf-8?B?VjB2ZVZja1ZEL3E0OGdLODA3NHFlVUNydDlIMFZMQWhiaWV2dkNyNkkxWkF2?=
 =?utf-8?B?YXNzSmdaNXl3cHFqdHJuMXRIeHFwK2VFRnJabFgzSld6ZFJXZEFGZk1hTjNY?=
 =?utf-8?B?S1ZCQVFDd0VGS3puZm1rcGZFZjBQaHdpYktlQlRPaElQTTQxOUZRYjBBVUp6?=
 =?utf-8?B?aCtnb0laV0FNRFJzUG94dGcxdWY2RHdCWWU4VEhxejhWSHJzb1dMcmdUMVRn?=
 =?utf-8?B?ZkVXUDMya0FBZEtQRGRnQ1UzbkhTQ1o1QkFLNkc3aU1OWm9IaWJ1T2VzUDBC?=
 =?utf-8?B?MElpZERrdTg0MjhOdkF4WklLbUhKY0lxNDk2MUVPVWNZazcwVDV1S2hMd1ZQ?=
 =?utf-8?B?cnIrSWFVcW9uNWpkTFZwa2hMM1B3S2g3UjdRTUtrS3F2OW5HUEN5QkMxZG16?=
 =?utf-8?B?c0dJSHUrSm90TEpwcnZqMjBPVTVzeDU3VzF5OWV1WU5kYkk1RGpkWW1Hckly?=
 =?utf-8?B?bmZxbW1NR0U2alRGajFUdkpxUldRM1c4NTZ1ZlBSMUFXSWhxQjRsNW1USVdw?=
 =?utf-8?B?Y3VIQjZnaUNZU3RBNXBIYW9jMjFQdnRPdnZrcU9vM3hadE1VN2RvWFpHeTJn?=
 =?utf-8?B?VnkyQkkwNFpscHJQZUNNVzBUanBBNVZiY2JtQlg0RUwrQ2ZrbzhzbklieEh6?=
 =?utf-8?B?MFpPM01XMkpEdXNnOG1ROW1rQzZEdktqUzF1aHJGd2hVU2RTRlI1Slo2OE8y?=
 =?utf-8?B?T0F3NVhtejFYdUE4THlBcVZrNjRLaDF4ZEZuVVY0ZDBJUXdaYXdyLzVoS3pW?=
 =?utf-8?B?YWkrdVJMdXJ4b1o5VnYxZnZTRkViS0VvMSszNlEwL0tNNWN1T3I0OUlHZWJ6?=
 =?utf-8?B?ajNGd09WNzVyTlo3dnBQZlMrelpMMXBRaFZEaCtCT0FqYk0rSm9KZ3lvR3BV?=
 =?utf-8?B?R0N5YWVOdXFoK3BrYlF1c3Rnem84d3FPRWYzN0VNY0hjM2w0VFpZNzVBOENC?=
 =?utf-8?B?THFBaVFLb3JVdTBKT2hySVdNeitOWnA4U2JaU2cyVWttQ3VScUp2THYwWDEr?=
 =?utf-8?B?dkh3SlNrdGt5WVF6RWh6dFVwNWtZMmRjNWpENEJSRmlheWxWUGJhWk5nRk9J?=
 =?utf-8?B?VWlSTExXcjdadVpBa3VQS1NDN1dYaFQyQmhJdnp5UHFCTzl3UFJPTVBZKzd1?=
 =?utf-8?B?My9CQVVWT0RCVi9jNGN1cWtDeG5XOTZCTHFxYWl2SHlLb285NDlqcEJXVXpS?=
 =?utf-8?B?bGpkY0prSW4wcWZWNUhrUk41UU0yVmNzYXlvRC9MYnp2aUxOZjJ5NWkwNW5j?=
 =?utf-8?B?czN0cklVeTFJVzVNbWJvUmdqME1PM29XbnpOUGpXZ0IrU0lFQU9sMDFHbCta?=
 =?utf-8?B?Um8ydXNaNUdHelJ1SmZyWVA4RHBzNDZrNnF6NGxKYnRsZWRZdGtBbkZ0TklR?=
 =?utf-8?B?WDIwWHJ6Rm0xQTUydGRoNGgyQWhDeUhVSHFEdGRNdHVGU2ViT3hZZHN6ajdh?=
 =?utf-8?B?Y3d5L1lrSFhkblFYN0l0TCtuSVN2cWFnQnFXMkRYaTZZR2FhMk5HRmpyZUlo?=
 =?utf-8?B?THpNTjM2VEcwMjFFR1Jucnc2T21UOXlmVEZSeGxhc1dhRS9sSjc1YUtVRnFr?=
 =?utf-8?B?c1Rza3VFVmFQUjE4L0M4akJOS1ZITCs1TXdrSU1uWVI0ZXhDNm1pQTMrQkdl?=
 =?utf-8?B?NkJNci9LUHhsOEhzUjBmV1pTVGc2ZStSVUZQZGVFU2Y0aVYrQzgxYW5VTEtQ?=
 =?utf-8?B?MHR6WFJOcWZwNHQzUzhWOENsYjlSMGdka0MvcTRiYjkzVkRmYlNQb05xeWJy?=
 =?utf-8?B?akxrUGZiNWZjZlhUbXBpbm1qcmxpT3o0MW0wQmNKK1BFUlhLLzl6L2JncXFm?=
 =?utf-8?B?anh2WDg0TE1jOGR2MVRNZU41UmpYKzJtNEUvSm9sNTV6SnNhaVR0QW54L0pO?=
 =?utf-8?B?bDc4RkgrVUZhNVBNVUJxUkM4V3kyTUNJRTF3RFVxQ2FLZTdlaVEyMkdZYU11?=
 =?utf-8?B?N0hpWXVIaG82RWIxUWY0NEo3OFBkbHU3Q1hBOXNCS0xBMTA4Vkc0ejdMWTl5?=
 =?utf-8?B?UXN5ajhLWDQ3VVhsVWxtWEZSRzNWSWVMVHhXQ2JSZDFjRlpOZDdIUU5MQkF6?=
 =?utf-8?B?QisxUmxjamYxbUF6TjBtbE96MVJEbElNc29JM1d4eE9PeVZ1eWhHV25NQ1Nr?=
 =?utf-8?B?T2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c783da3c-bc8e-4ed9-41d4-08dd5b2d3d4a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 15:00:01.8075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RbgjNwfsn3EH07Ez+lfTJiq47FRbayHiM7z8vNVquohNF4POeTz/4qJFj0vWW7vLAqy1QHg4++/wAV5uhjrx0IjhwlwAnCYYawD7WasI5Xo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_070008_852502_0E13BE1E 
X-CRM114-Status: UNSURE (   7.19  )
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

Hi Heiko,

On 3/4/25 1:44 PM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> While missing lvds pinctrl is unexpected and is reported, we nevertheless
> don't fail setting up the device and instead continue without explicit
> pinctrl handling. So lower the log-level from error to warning to reflect
> that.
> 

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

