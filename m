Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C8FFED2EB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 08:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nlNzPcZqWTUEZHCFLlLKvRemunPyu8m4TRxYqKDk3lY=; b=AKAURP/Z8AxNThVzfEDF3PlqWv
	Mw5qZ6JY2FqPb1DVp2qB/MPymES3SgOJEINfTAi4nh7I6aX4ZlhtYj/Aqs6cH0SK1Qa7wmmRNUZPg
	T0u71HIM5I7ReEm2bfzsgpISCIhWmVQgev97PCI4ut5fsJgKdSKMgqFwbmFLSx/fihEbd3/llZK05
	bs2F/l891LmySes1wmrj+uZxVLIcq7TMeYc2kL3Vz1uvCbNa7f7n9IlYCIm8LraEGoPj+cvwbELwn
	dbWtgPB7bsCkxoxpAviaRoaJyu+kwp+ihTuomSAz1yKYVTNuKqWQGNbF7jVpbLfBMx94liFS4REAe
	gYPgj6+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0bbc-0000000DeeA-2nb2;
	Thu, 12 Mar 2026 08:41:20 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0bbZ-0000000Dedm-2JsX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 08:41:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7mxFi3Yl4Gx7zyFCStxpjei1LHOQ+QfyNlHnRpCzkACJaE4eF1UEaYX9AhDLNY0h6LDPlTvSzsfvA1k3VLLNrR7n4sbpFQKiC1eO6E/g4ANxqmunn0tjQ7b0ci2y5pOjdhdNLEyhwoRdza2w5vbC2WBcWeP1ZtHQkM4UbGP37KAALazKMgeVjVcCpK0Y9xNnEkmFA3KEjNCds2yUGuJllq3shTmrZgrhn74j8cu7FuKUrlPWDj8KBu34Z/ToavjCOtLCCbtmaIzXDf6fp9GQ/CZQTtpVPNlhE3ry99X+3X7N7D13dslxH77uIvUMV9Eb69qrnyG1Pz0volyfjoRjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlNzPcZqWTUEZHCFLlLKvRemunPyu8m4TRxYqKDk3lY=;
 b=GMXYlI3NuAOyGGbkfABkVFuOp75J5oyYM2+Fk6n8FC52ekIYQqGpMKIn22cfJXEUwpBjv4mOKQWxlGqrkmJMxcb/gOhZOibe+VEa/3bTKYA9t+1W/3YVg2YoIjyjQebJXI3Lw2Vs6B0EoVQDN9y05xwOUfXv5MbYT/p4SRSOIMVIlATl4lIW7hPn1nqUZHD7Bb5SwFDyy1DpkXtVe/FIK+hx24aeAOsQWEDujCNr9YjmGpnu5R5LqMcQ5EhTvF+UhK8NI0K1EiUp2FwV80DAtjjJRUTzbYBSxOucsbrMreIf5DbFgaueYTq0IrX8GgXCGrDEMCZdR+Msok7B5DRT6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlNzPcZqWTUEZHCFLlLKvRemunPyu8m4TRxYqKDk3lY=;
 b=JlFy3IrQjdbAkEllyHlA4Ido10xW+glVcEz8Wun7wtkdMzrtoSna7kZYZ66NU/J1AFjyu+0nnBB7grwx4havtLGQtJWuLNKfePB1CTNcdNqWfKL70OwSouVyVw7YaG5W3lVm1rHIihsCOhea6UZgmXejnaWxZ+Na2jnF2dhGybDHdeUV0z4yxTo6QwkHIPbB5fEHLkpwXMuix7r9QNJ1fb2QEUjKwKly/TYv7gT7I6Q691aloxRhf+TjRn+sgRkH3Z3kN1CQ1LG6lEc7GinbeSWfzeRaTOBBIjyvda7CqaNiS3o5rc135vOAlOBnCwCH3OVBcKGWADqSvVbhJkHtoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by LV2PR12MB5773.namprd12.prod.outlook.com (2603:10b6:408:17b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Thu, 12 Mar
 2026 08:41:10 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 08:41:09 +0000
Message-ID: <2d4e69cb-a43c-4d13-9f7b-20b95cee43a7@nvidia.com>
Date: Thu, 12 Mar 2026 08:41:03 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] gpiolib: implement low-level, shared GPIO
 support
To: wens@kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andy@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-3-b51f97b1abd8@linaro.org>
 <921ba8ce-b18e-4a99-966d-c763d22081e2@nvidia.com>
 <CAHp75VevThmDMm6VoVB9P0YbUGGGsmgnzr2gn9=1xtJZt-kuQw@mail.gmail.com>
 <64f6e02d-c7cb-40cb-b1fb-2d3523433c66@nvidia.com>
 <CAGb2v67mmt=X8rbsUo+Gwe6uHXTNpBFGzBbrXZYEGsftHL4Ejg@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CAGb2v67mmt=X8rbsUo+Gwe6uHXTNpBFGzBbrXZYEGsftHL4Ejg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0359.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::35) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|LV2PR12MB5773:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cc4a31d-d609-48c0-a9f1-08de80131c07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: KuiAXHbKjdkiNZCjfnH8NYsRm0/PFj/5XcB9UHmmwIRJNSWUyY90OQA/jifmMmZKlpjg5o5J04LNZqqFFV+LBQSn5SAnmryCAVMsakEC9NmsHOGcPP0TVRyaEn1bCvRQb5tgM3adUq3Ue6UlwJdHEx9d0rxUKMQNCtBu7MU4hi5Q5KkI1uBD/WC+qUNRSy2mrlQwz6391MfU8UNVNxjo7CeK1HrcmLiATB+sDvmpCt6Jts4wDQj2k+PIjKPm9AfyK4P26630xNsQoKRYrWlZIY37kTuQ+/00emmoGmBKsVg8DTRcyTtALM5k/bQ2tKoTGqUShSm7LmjkLy4DEUuFVzHgzlZu54ZB5xlnQ9fnjFW0SNaPi6dMuL9wKOE3RHEX2cvqj+FfoVebV5Jh+IV4d8YxkX96dBFhBncCWjPnRypE2gf6Xl4UZ4xK9JehsnVsjQA/Skba7qt3mI9R8LPf4VhQ/D7ox1UTH5XP8cJAPb02viMqboojjES9HpejReErZ8WJom8Q98waKLf5lwSEn3Pj0f2GyckZQ/y4vTQYr62PL50J9foA81/eOrVMNlrI3EDaX2tn/kfJ7EhoKp3/vu4w/YmQ6AmKm/j/fTd9adbv/p8QLku85UdQ+LRFoGOwgYUvC3iIy+4gUnawsJrCAoD1Id6qOx7+aAL1uR7qH1iOgSodAyu8LMs8q6j4aqwc0HNDg6WtiTq7UpoMSNVVfKylj3DvS+G3HdZc/9qOXo8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2JpeDFYNEkxcFVhOTdGSDJ3cjBCcFUyMkZHY1Z5THpVWnpHdVVycS8wK1Js?=
 =?utf-8?B?d0VvMnlmVWtLNnhZakczWkRBWnVpY3pMV0UweGVaMGV3VGp5dEo2WG1pVzRy?=
 =?utf-8?B?bklwaDQzaUNTcjd1R2RHMmdhclJNK3NJOXFzdHhOWXlET3BJQTRJcnNFd0dw?=
 =?utf-8?B?ZSsvSHhDSFZDVjVncTRaYUZUNDNKTm56R2d5ZlBmUC9TdzgzamlESVVZNTds?=
 =?utf-8?B?cE1yV0hQcGxkUTVNcGxocEwvQWo0TU5jMjlDTDhBdXMyWFdEdFgvcjdZVnNr?=
 =?utf-8?B?R0E4U0RFbitZRVlaTGJYTjBCT2hYWFlPSFJtajdFSzZTUDhzZ2VzQWxlUDVC?=
 =?utf-8?B?dmRVbDc2Vy9jV2p0RFV2NkNadHZZZDhKNUtNVlQ1eVNyazhsZ1MyaC9VRDJx?=
 =?utf-8?B?U29CcHZFd1BSRXdDcnV0Vk0yTWxWZ0NCUmxjdXRaM3Y3ZkNoNFJZa0hiOTBz?=
 =?utf-8?B?aTFMQXZBdDRzZW45aVBPMXNCay9UTCtXRkRydG11SW52MVcvbENyWFh1RnE3?=
 =?utf-8?B?Nm9RaUdPYjZHbmI5OEJTYXc2eHc1N3ZsMGM3bi9RSjFSZDBwUnQ5dC8vTnpE?=
 =?utf-8?B?eEFIMHNhUVpwOWlNMzBrMmNNWmMrc2NjemFndkROcWoweERCUzlrNm8yVzVh?=
 =?utf-8?B?ZytidlN6Ykp2NnlrNHMwbkpBazZjUVVkczJPM2xUcWtEa2pzbzlCYlQ0VkVD?=
 =?utf-8?B?Mis2NDViMWZFNEhZRExMNDhZcTl5Z0RyUU5rWmxybE5WelpsK3cwaDBnMHIv?=
 =?utf-8?B?LzNyZGY3UTE1RHBreTdna014VTlQUHFIZmcvaXk3ZkxoYzV3bVpFYnVOclZG?=
 =?utf-8?B?L2FmN2kzYklrYXVJYS9pcDdHQndydmoyUlpVeDBDZ1VrY2NlcDNjVnQzdFlL?=
 =?utf-8?B?OFFkYmVEcWIwWmdzQkZRZ2gzdFN4dGQxT1FQVVprbU9BbVhYdnZyTXdxZHZU?=
 =?utf-8?B?WTBGMFhRNHlyMDQxRjVFeDJVSm5CNjl2eVBZc21EUWlwQTlkV29BU3RjTGVP?=
 =?utf-8?B?OGxEektWYU1tU2ZCZ091SFVGY3J6dER0aFZZVnlOUXI1N2RZZGlxUStqY0hi?=
 =?utf-8?B?TmdKaFlkamV0WnB1dGNpcFAySWk2M2c1dXVYWVprb1FOV1piWTZvUjVnOTZG?=
 =?utf-8?B?TDJoc2Y2TFhWRndGN3dkZDNtbHV1QksyTVJ6bXpKMmtKZzhGYjliMFhHb2Y2?=
 =?utf-8?B?YlNwY3dvdXF4dnhIbkkxM2V0elNwY2lrY0V5aXBaN1o4SXFGbm5XZkd0V3Uw?=
 =?utf-8?B?VC9BRU5QczRldG0zZmhPN0xVZDhDdzE3REU5OGtqWStQSlNKNVJ4OEU0WUVt?=
 =?utf-8?B?em83ZkJiVUt3cFFQREFadVo1S1RwR0tiOTY4V2s1VktmeTBicitMZDZuZExS?=
 =?utf-8?B?c2lNUnFVQ2xIcFRmaHFIZUR3dlR0dnI0NDlrSDdhbTh0eG4xMTZ1WTVsWktu?=
 =?utf-8?B?N3NRNHJ6Y1VBcE51NWhzNXYzSnFCYTF1RnJzczZyVS9XVVhwaXYvaVJTa2ZM?=
 =?utf-8?B?VVVLMUd2WUNWbnNEbG9Pem15MCtsZ09uY2xtVEYxOC9xRVhzMDg4RlNidENl?=
 =?utf-8?B?Z2Npc1Q4SEE1aVhiUXVyKzNFeG5EVXhVYlFwTWdhWURrU3FjcFJFVXpZU0to?=
 =?utf-8?B?a0czUVJRTDNGUFord1RRc1l6Y3VMMGpubld0K01vU3NFRE9jTGEwZTE0VXo0?=
 =?utf-8?B?TUlhdFlndFY4ZS9jeVhpQzU2V3pnZ0ZZbzhybHdkVWdNbzJSTktXWS9kVjNZ?=
 =?utf-8?B?eU5YNmVkYUE1YTlGRnRhd1ZVcEtqVitvbDFtSFFPTXU0K0FBL3N5R0ppMHdW?=
 =?utf-8?B?ZE54Nm95MUNpWmJrSEpNVGNESC9CeDFudllPc25NMDNxNjlkL0Z6OUJuTXNS?=
 =?utf-8?B?UFhQNHpTaE51bUVJWXEzL1p4QVJPS0MrczRhVDIvdFVpV2ZEcms3VkFkMEdw?=
 =?utf-8?B?bUtiMVc2NG5mUVZLaFFRc2t4UWFwVjRpcVcwRzQwVFJ2V1U2Wk9TVExyODFu?=
 =?utf-8?B?ampMTmVyd1oxdFB2MXM0eDk3YU9CaVV2U3RDS2xpWUYxYXF5Ri96dG1rTVBI?=
 =?utf-8?B?VEpwa1R0TmZvVUcwQVZGWmdJTlpVYmFjdXEwelhyTUcxWXVldEJDTTVpOHFU?=
 =?utf-8?B?dzRCenMzWUNxSVQvMUtWSFBla1EyeXJzOEM5NFNxdEZkZ1ExcS9TbFl1NitP?=
 =?utf-8?B?eFo4cWk1T0tGNlZ5cktUR2xoVUpSNWEyTENtY1Y3UnJpcXErV24xKzM5Q3c4?=
 =?utf-8?B?SkxXSW1kcG5QZytRcDIxYy9Pc0YxdEphWTJyV0RwVTNSRi9KZ3ZLaElTWnJs?=
 =?utf-8?B?SUl1SVd1dlR0UnQ2S2RiU3VRaGYydmgrRW16aFNpZEw3eWc2N2d1dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc4a31d-d609-48c0-a9f1-08de80131c07
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 08:41:09.7136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XD2urBqzAWTlsriMyU+Vy8gYS2kXo/hQDy0prrDrE2lS1s9SEeztB4S++uKHtRI9Q88eKbO1wz0shZ4fX15amg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_014117_603734_2D3E1E82 
X-CRM114-Status: GOOD (  18.45  )
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


On 12/03/2026 07:49, Chen-Yu Tsai wrote:

...

>>> To me it sounds like a bad design of the driver for this SoC/platform.
>>
>> I am not sure why you think that. Assuming a 1:1 mapping of the kernel's
>> GPIO index to the GPIO controller + h/w port + 1 GPIO number seems fragile.
> 
> If the hardware has uneven number of actual pins for each bank, either
> you end up using the deprecated static GPIO number allocation and
> have holes in the GPIO range (sunxi currently does this), or you use
> dynamic allocation, which gives you no holes in the GPIO range, but
> not directly calculable mapping between DT and GPIO numbers.
> 
> The driver handles the mapping by providing an .xlate callback. A
> consumer shouldn't assume anything. The shared GPIO library probably
> shouldn't be try parsing the property itself and use the result to
> grab the GPIO descriptor, but just rely on the gpiochip's .xlate
> callback in some way.

Right. I was thinking that isn't this why we have the xlate callbacks in 
the first place to handle such things and not make these assumptions?

I am curious if other platforms could have the same issue? I did not see 
this immediately with v6.19 because it is only one specific platform  we 
have that showed this. So very much a corner case that will only be seen 
if a platform uses shared GPIOs and the shared GPIO happens to be high 
enough to overflow the descriptor array. Even if we don't crash, at 
least for Tegra, we could be using the wrong descriptor too for shared 
GPIOs.

Jon

-- 
nvpublic


