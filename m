Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50C8CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 11:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBTeDLxSfPCU7MCkI9n5aRDqk0p8Y8vXwxFwJy7nE54=; b=EWNbDxw01uQAdCZXIpfYGU2lxo
	GfI+RzxNRznlLanKJUtlGSf/KKyLy8ODuCaR4co0/FKN7CtIUTQwPZZxbHKJ9wQ7u0qsF8fLCqJ3+
	3nZu3vGNSn3JKLIn4hHwBSVFwS+LBZ2d2VvCINia4XRaQzjrAumv98MOvSOUvTw4zW7GK+miY/qQh
	OBEXy3/cLrCAmWthyHJ6Bvl/GhLUqyCEryZ0d/jx5YME/rgbBlpEBfs29yXjHOHVt83hvFSmiBEAF
	DCodpsTTOYXLFxR0jn8HvGcGWsQsWCZvnbMiTgMLqUQg1x+ty4n0iVPqwCUpm4IapgFEfWw36Czuz
	oXFnxArw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTIR-0000000H42F-0iE9;
	Mon, 25 May 2026 11:16:35 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTIP-0000000H40e-0AcL;
	Mon, 25 May 2026 11:16:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m1wPMonr74smnEQZuu8OU/Bay8QZwUmOOzDhL7cNqjvU+pgL1CM4tJ3heXDywHYtwAwHH2jE0xZNt9FY64SwAnCn6Ig9C9SMt2Lbonjx1vcPuqbJeV/U07sGZie4gPczSLrZrcALCpPphZoSd/6g6/ygSiz47CwwA/n9aJhFUHVYWsspRpjDeHSryTTXM/JOFAEU2WWHJ+QXVDX6Requ4Y1gcRCTMc/8mYrObd46w6ylKkD6f7kwaObnomR7UbLYf2gzFGKc5L+Ubsdt2ybDzQj/GYKE39CpFRsI5pRdit1v4+0sqKpjahU9FrkzzBVBE4I8TE/1xhp4G+bcTf+ZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBTeDLxSfPCU7MCkI9n5aRDqk0p8Y8vXwxFwJy7nE54=;
 b=KGCMKQgyM8ZcEC9EP823y93PpZKPObdoN/3+CZAk/MhdVjbMalEuGrn/5mg1ukSydk+k8kTDMoSFZL1UNrS0LYn8+Q3Wvxzy7tRORrycmBUoSLn3z9VZrbsbUpFGwha0bFdL8XPHyQaBGFQS0HGKE8XA2mkZvZa5tDLxSTbXtdhvxa6w/Xg2Bc/9jNVqfKPl8hwC3bWzXSwKMAw7Q1i1KhuDvyVx2gO/Iths7RHMwTAsszmD1ZL1yWMIojFAE1QXLyrz4x1upLjsOu5PyS8l2/u/XV+TcMjrFK2fzgL36HC1JvN1Xe4NejA3CVXWFxqMDTxszWlnQeiWzmKbohupYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBTeDLxSfPCU7MCkI9n5aRDqk0p8Y8vXwxFwJy7nE54=;
 b=yA63Ic6a17H6wTcpBVMdOiBcgGc37XcDa2dLWo7BkirDiPwrIA+tAnlwvGzZkyOgUk31u3vrQy4QGsTgOz+tAwd7ij48woch4kt4YKkdnPJV3rUvrscuLQj1ST3Mts3WSYIdHahUI5EFRwLq/Z/TTH8Vjm+xN4I1WfIRO/gbmcrmjBN+58JghdT/2yfzrJPvVKuu4zOaHOe7tPfSmZ8Q/tBPbyXqDIsJwchGyncG+JD75LlLApdnSvP3GPFus+IhED66kT2AXj6zHTTFmDQObOhvbnrBTqes6uh/PEF7VW0I0FFA1t8jHlH4Mk+Q6WmLHHLiBKJakE1Fl2LioMJAsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TY0PR03MB6582.apcprd03.prod.outlook.com (2603:1096:400:21a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.10; Mon, 25 May
 2026 11:16:24 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%3]) with mapi id 15.21.0071.010; Mon, 25 May 2026
 11:16:24 +0000
Message-ID: <0ea637d9-6d79-4c8f-8c45-68cfdd84c262@amlogic.com>
Date: Mon, 25 May 2026 19:16:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: fix gpio output glitch
Content-Language: en-US
To: Linus Walleij <linusw@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260518-fix-set-value-glitch-v1-1-d350732dc934@amlogic.com>
 <CAD++jLkmm4BbOMZCbJD4H4xfa8nHfExczbXCyF7SapHzQwRZFg@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CAD++jLkmm4BbOMZCbJD4H4xfa8nHfExczbXCyF7SapHzQwRZFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TPYP295CA0037.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::16) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TY0PR03MB6582:EE_
X-MS-Office365-Filtering-Correlation-Id: 44827a75-a906-463f-89c1-08deba4f0ec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|6133799003|4143699003|3023799007|11063799006|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: bWq+Pn0dJ639r/lktb9Qp6rjoJQkbmcWvdEZDWRnyatQm7EI9TwsArzHlfCLtb0F1l2FKk+tw21vjA/2gGNO/6pYq32RW6EFxzi1Ztb8txs3XYjKfTb2TsJUKr1Ci0Dsnp7bI60t3y6wjsjyI+gfS9OO2r8ZZzcSd0TEjkNnpdgGo0Z7+AmixX7AN9qpTzetjIGx/PPCL7suajaUjZRXTq9Pf7+YF9+ef6NsrgkYgw8ouRfWwTH//n2dkzsuJAJVy5VUbHx/F5JzxLiSy3G251y16HMcw+ansa6m78sy1lXYH8wrZYidM4KS+L2NG5s3T2cBDjGfsZEW63y8VYzD3ihd0XVTWYISfMjdyAmWUs+6abF1dfzjL2TRzHU/hpIwat+0q/DevVOJuEf2BBCGbPZ4mVP97JZebfpdk8QgybvKjHj470694tjZe5MKzDF+Ek1FFUrhAyUO+f4Inu42qwe5dvUXSyKVKf4DHGXfIKzmtKsJUgdNtTOt2nHltBElFDW4Uex0mZ4c+rwrkEgsU1fDmbHi3Jwr0IRmbPk5qQDyH/tuT85lPSIAzcJnZpvzpy/MKS4oMUWROy5dOZDXDxn7vKAf3lBTOm0TN6UHRqpF82XSWXHJJgvjckPtio5LJcUIorL4DTT76zaA+cI8vaYQrCj5tWCTBkBS62pVfAfWxxYNFDl17R3grejmez6/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(6133799003)(4143699003)(3023799007)(11063799006)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0w1dExOZjVsMzR2U3dsWjBvdm5keWo0K1l6cm9VWHc2bkNzUWlUOHRBVC9Q?=
 =?utf-8?B?Q09OK04waGIwM1dwMWZnYVFWdnNUS1JuckYwVVJhaDlwS0R6ck1qeXZXWWhL?=
 =?utf-8?B?UG9nbVJRTUR4YnlHSk80eGFIdnNBdmNiL3BiMWNXNHFDbEd3YWZWVzk5V2Nn?=
 =?utf-8?B?VDBidmR5S0VOVmhybXRscHpKVDBwekZEeUk1Smx5QkNOVmI0SW96QUZLekhY?=
 =?utf-8?B?RWx3UG14SzhPU3NiUHBiQmRTeHU5VmFTQVl0Zm9XejlTbkZzUkpSK3B3eXVC?=
 =?utf-8?B?MTN2TDdKYmRUQTM5dERHcGhQTkFxL2NQQnBqUkRQbEFmcnhxem9VdWRGcTlX?=
 =?utf-8?B?YTR4cVg0bXAzZzNETm1yUUpheUdOZlJ2cW10Qk12V0VPWGowVzRqcVhWaWJC?=
 =?utf-8?B?NG5vWlBmU1hnalRDbUtyR3YzSnJUL1Z3TlJxVWtScUsrcU1DcEVyS0t4c3h4?=
 =?utf-8?B?UHpWQUJweDJuL3FNWWxjYXpiWXp2aU1VWUZsZjhVRzZraHczUlJubUFXNUdx?=
 =?utf-8?B?WlhpWGJ4T050cERQdzdOV0I5K09vRTdvK09vQUE3S0I3N05zS0FHWEdLQ0lZ?=
 =?utf-8?B?VlY0eFpOTXdMWUpkd1oxZ3NmSzNXQ0RXL0lid1N0YWlxSmdzMHorU3ViVEVM?=
 =?utf-8?B?UGdCT1NBVmJGbkx0V3BrcUQ5TGlvMjVLVEFyY2w3ODhzcVVHa2Q2Y1lCM3ZZ?=
 =?utf-8?B?NVRKcmpvS1lNd2Y4eFI0TXVkRHVtemhTRjZmQjY3MWdFSmFmUnY4aWYvQmxk?=
 =?utf-8?B?eFFQV1RmTVdpWlNWeUpMM2UrWDVwUGpJZWxSN3gxdnMzVmpGZFZ1bjEvWThV?=
 =?utf-8?B?U1QxRUp6MG1sZ05FTTVoWkIxSXNEZitzWk5ZZFU2TDVZVWlnLzhzREZ5bnp1?=
 =?utf-8?B?MnpIcThWcXNSbHV0NGo5NDVGekVBSzVlM3ZEbDJWSmcwWkcrNEc0ZnZqeC9h?=
 =?utf-8?B?dXJsTkYwRkMzZHY3MFc0d3JYdWtHbUg5TzFMWGdUYWkyM1cwYnpKbjR3S2Fz?=
 =?utf-8?B?SmxndURVOWhubmhCZStVZFBudUlzQ1l1c0x6WkM3ZmpDWm1VZlBNQkovYk5r?=
 =?utf-8?B?ajU4bVFWdjZJb1NtU0JvaXlYZElXb3A3TTF5VGppUU9FanpiYnkwU0czam9y?=
 =?utf-8?B?UU5vR2ppTzNHaGNjQmdLenFnaytwWExXUXJsUnlOZDhSMXlyNTBrUmkwanBa?=
 =?utf-8?B?RWF3K09ma2xjTUIySDBjbWVNZHpUd29mQS9XdGx3TU0yTEQzN01xT3dNRUpt?=
 =?utf-8?B?ZjNVTHAzYlBRWGpZbU1wYk5ERytpTGY2dmg0MmVHZGcwYncrcDMwSkhoV0Uz?=
 =?utf-8?B?UmFYTXpmbnc0bitEKzRwZTZRWEV3OGNWZ1o4aGJMRUFqNXpGTXpic3lRaFNv?=
 =?utf-8?B?UTNubllWdkp1cU85Sk5lYkJ3UlhHOUNsWHlHZVFIQ2VuYVJvYUFkWUkrSW1E?=
 =?utf-8?B?NHhoT3VUSmM0OWJMUU9hMGlxN2tlbnFqdHJKMG9YOEU5MWJRaENmQjBlUnRD?=
 =?utf-8?B?L1o4RzJ6UTU3TktqS2swekNYODFXL3lnbC9WTERaWldIVFZkQnZuUUtkajZj?=
 =?utf-8?B?VkRZb0tSWFErdVlhQlFtM29Lbm1UL1FscnFCakFBYUIwTm13WDEzY0wzK1dn?=
 =?utf-8?B?WnU2TlBwejdYTkJobjJSVWFaaEZ3UUw5YVF6Z2F5cUU3a1B5R3BDL0Nhd2FJ?=
 =?utf-8?B?cm0wSzdhWkVkQ05JbzRJbU9lc1p6Zmd1YlQzMG4rYU90TVZvNGNKNUpoaGNv?=
 =?utf-8?B?RjRoYjRlTEMzdWpUVVdLSEpTMkR0VWdUNFd1c1UzS3h1VmFaUE4vRUxHQzFa?=
 =?utf-8?B?Yk1URk11RkY2MDdJVjBrSmZrMW85ZkNkbUJ0R1ZJeDJaRUEvT3ZJdUtGbFpp?=
 =?utf-8?B?bDRLbHlueEpoYTVpM1ByU1ZJcFVieGxsd0Y2Z09qTzFtWGRRV2dteG5rZEM1?=
 =?utf-8?B?eUFrYzk4amxxVWxQTDhJaXUyZ1M5T09RTkNJa1BadUNpT2UvSG5TMkFZalNZ?=
 =?utf-8?B?WkpJT3pFY2xHeW5yZ0pPN1hMdzA0SU8yQk1TYklydDNjWkZQZUU1KzBtNlV5?=
 =?utf-8?B?OHgzWXFzYzJCaGpHSG13SVZZcnNVQnRJeUJnOXk1K1Q2UGZ2azVhN0xWZXk4?=
 =?utf-8?B?Q2lNK25DejlqSzhudnhTR2dUUFdBRHhnTVRVVFdleVU4YTZOc0dFWFc1MW92?=
 =?utf-8?B?Zk5jQVhuajNLSTNsdXJmZXVIN3pFVHp2U09vYjdPQS9Xb0tPZEJWL1ZlWlBP?=
 =?utf-8?B?cUc1TW1QRWthMFRFdis0SVpvNjZjVmd2VWEvOU5NUloxU1JYYmkzRmtBNk1H?=
 =?utf-8?B?M0J5ZktxOWErTk5RdWNxZlNCZW9tTTl1NVUzNnRwUzNOYzVlU3RtZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44827a75-a906-463f-89c1-08deba4f0ec4
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 11:16:24.7627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4eX2YHO4nnH5KjKdLwSXu3Tt1K5SFzWeQsQbIDXaChXYjxYl6Z5QWyQI5CJCVeh0QGsExCYx775Zkexn/U6vzu6ByNG+8jcBemvMa0b/rg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6582
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_041633_102112_C1ACB830 
X-CRM114-Status: GOOD (  15.20  )
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

Hi Linus,
    Thanks for your review.

On 2026/5/25 16:34, Linus Walleij wrote:
> On Mon, May 18, 2026 at 10:26 AM Xianwei Zhao via B4 Relay
> <devnull+xianwei.zhao.amlogic.com@kernel.org>  wrote:
> 
>> From: Xianwei Zhao<xianwei.zhao@amlogic.com>
>>
>> When the system transitions from bootloader to kernel, the GPIO is
>> expected to keep driving high.
>>
>> However, the Linux kernel first configures the pin direction and then
>> sets the output value. This may cause a brief low-level glitch on the
>> GPIO line, which can be problematic for regulator control.
>>
>> By configuring the output value before switching the pin direction to
>> output, the glitch can be avoided.
>>
>> This commit fixes the issue by swapping the configuration order.
>>
>> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
>> Signed-off-by: Xianwei Zhao<xianwei.zhao@amlogic.com>
> Is this a regression? I.e. does it cause problems on a supported
> system with mainline?
> 
> Linus (the big penguin) is unhappy with too many non-critical fixes
> so I wanna check this before this goes into fixes.
> 

The issue only occurs when the critical power supply uses GPIO control. 
Otherwise, it is not significant.

> Yours,
> Linus Walleij

