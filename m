Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA5AEC01CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 12:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKu+Nq3USJBuF4YFxfN8+S6iFmONKDYN8PtRLUnOXIA=; b=DRDvORe5W1lxD5rcSEVwwlQ506
	WpJkLXPgve0VXpJQcRmRhUEG+DM75hjLMdGYDM3VSxHwABwtSBZIgvq1CktPR+bEePv9c8B3dm/Tf
	GqiHhJjFAWHU4faGCIEAbhAf/SyiGBqfQCFBIlGKbk0wI9mNNMEl3ZXvRkNKTZvb8ZKqCeQlVMIQ4
	9DwdbAt8L/EAqrStg7ISI8ezJZ2zBeien5TNZv9r/5c/EbkfWGcLtwjs9fI1CTdBurq+mYMYvnA5v
	E/xwRSstoTc7n/s0rsAjbG2EOWgU41coMEODQxy46xgBTKumaxDbaDPAtMYsu9KNO+CtQ+5yMO/Js
	l1P1+8cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4eDE-0000000GgoU-0jiz;
	Mon, 23 Mar 2026 12:16:52 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4eD9-0000000GgmI-2Oii
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 12:16:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w/HKhZfsx6mvL0BT3Lr039i56m74rlMbLfgw7D73sSdPeLh4nxmysOUpdfjsm5Vh9tkVJuGJChEG+z/53ku64SKMotNPCXj3cUK7LNTtOq6J5TQv75hGCkYYl+x0ln9I/RvefpQLAM4b4C2YfIiVlffGmvSA6NvAjLWm4Z/JEVjM4k35EC3h9CdrvXnTAZ+UHb8f8AsTFyEMbl+FYONTwZrMhW7tA6J1bRL0oUZJ4O+FHFN3GFbzOhOCieKmLowUph7M2u3DPJr1t+dbm+EQGG07W7EGc/KiloXTIR0ESSk1whvfRWT1Ohv9ZQNUmgxfs/jzHspkJk00KNOuOusmhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKu+Nq3USJBuF4YFxfN8+S6iFmONKDYN8PtRLUnOXIA=;
 b=kGovE+MqWmA9o4nYsrNkK5mbLqe4br6MRrkC79xYgbF4wUj8E3CzWkgDKjLfwC+dp0h2PQ7fR2h+b9+UwUx13JxmV5w9Q89mogJ2TcYF8iJf5zP48cdq1IQdbEyn9MYc4tI1FJSBcBO/G7gu/uzriCo8Q2PZ6/heK7VA2UK4dFUZhR8BxfUt8E4dECeUSir8TTI9HGEyNmOZWdbhEdEz1jYD5hZcxo/orPrt/+3aoYkt0fBRwvFqWPM3VE2F8WtTM/f2+uvE/3CDhzQi61NbDkcqAiUP3127KUNgLaTynhvUbKvDm36d7xQxAT2p9lKzTjLjI5w7UCxVAObfv6M97Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKu+Nq3USJBuF4YFxfN8+S6iFmONKDYN8PtRLUnOXIA=;
 b=IT+AGXRQOV3pOQstIPWzgB7MZaYET9ikTUaM0nD3tzOSLd3C3D66YQ2q6nliC1z93zQpyrB0ZE8o4XGUa6LI330o8zSp/aB6DPylweZvZhaigZdO5qXRBEPA+e3qIoP5dsNZ/Lncw2u4oB0KIMiKre2lKC4Ou7FfdMcRTs48sEg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by LV2PR12MB5942.namprd12.prod.outlook.com (2603:10b6:408:171::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 12:16:39 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::18c4:be41:febf:7e45]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::18c4:be41:febf:7e45%6]) with mapi id 15.20.9745.012; Mon, 23 Mar 2026
 12:16:39 +0000
Message-ID: <cdc752bd-733f-4262-9660-d78f54ee771b@amd.com>
Date: Mon, 23 Mar 2026 17:46:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] iio: adc: xilinx-xadc: Add I2C interface support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Nuno Sa <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 "Simek, Michal" <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "linux-iio@vger.kernel.org"
 <linux-iio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "saikrishna12468@gmail.com" <saikrishna12468@gmail.com>,
 "git (AMD-Xilinx)" <git@amd.com>
References: <20260323074505.3853353-1-sai.krishna.potthuri@amd.com>
 <20260323074505.3853353-4-sai.krishna.potthuri@amd.com>
 <acEbZ0O3HKrGx0u1@ashevche-desk.local>
 <8c8fa211-6244-43d3-9350-856301075e2b@amd.com>
 <CAHp75VdcrfJn=VBnjJbA8QQnstaTay+39bumJiLt796fXsKmTA@mail.gmail.com>
Content-Language: en-US
From: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
In-Reply-To: <CAHp75VdcrfJn=VBnjJbA8QQnstaTay+39bumJiLt796fXsKmTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:273::9) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|LV2PR12MB5942:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a5209e8-616a-4730-c70a-08de88d60942
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 1u7HaLZLzW2f+sp7QsGW/IH0jC6Uux/2QJ7c7Y8QQx0175FUQ+kPwlXCawFDNjsXHpeNqyGZQCXeUtw9NebA7zNIO7gr6xHhcR8fjgt174iBCN6Q7P/vaDTZRD6h/MhWCltdIenuXcvLYNmuVf3kOIb+buloNANGvGDJuh9EyRrbnaVWJy8m6pVuRAOfqSno6AWPSjMGuMMeidgjbzQzenkvcx0uk6F99tn7WF2oqUjPm6CrmGesg99yz/LB0HcsaUFjdMk+XPRlmaz1z8v09ehYsDq9QHFMq7zqKs/tGtLnmbyWcei2gOa8A/W7fdqVjzHOf1yFlCR4OkEk6/3ne2Q6e4fdPctl8S2gl0jbV+YlGmyd8OdSB1f4dsu+JREhjtzQ7bQom5LI3EgTgh+TQLRak7dijoK4i/arTXOBJ7PCrO5XcLDGIbzojzqlMoWzngdUd4KZ9noHmvJQmnIKCvx+WwpOgwW299/cyrukMXzro8TyQ1D739+MSXB4LOf4k/8iF065a/EjG1c415bydRrSDDThpQDFoJ24OxubdTI1hsP6sjrt1ZY+Im72QfLTp57c2a1vG+2a5d0U9/ZA8T36EhS79gdECdIHSmLkz2l/FcBZeYJYEc4+ZriweaXxnCxTpy1pXlcGGwHoAiA4rR+ROwrpznJPd7KdRSo2TgQqv13ejiGESAT/io+MeXv2QDBEuyCdliipmaB8MU508kZ2ftTetnaUOhcyWxw4KlU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnkzNWcxTUF4b3BONjFUSlNYNkN0Wis0TnhhMFFidzJOUXdnM0k1cGc5bXlP?=
 =?utf-8?B?bHVERmVrZG5iSHNXMlVneTFkZ0lIVDUwRHFqV0daTEVLTldTK1Rrbk5OQjlC?=
 =?utf-8?B?OEtuY29LeldTK2xBY21OUkl1ekgrOGc5RGZ2UTExNytmbGVQN25Lam4rS2RI?=
 =?utf-8?B?WDBqeGNwa2F1T3NPVUNhNU1HUHRxcXkvMlBMdTF0Q1hFaGcyTzd0aFN1ends?=
 =?utf-8?B?bDRaVTlMTlNVUWdCd1VmcGVPR2JnanpHdDlvSWFFWDFiVmJ4Q0xZSFgweHlV?=
 =?utf-8?B?RE16NTgveTNJWXRVbGw3UXdJT1NMcHFvZlBRdXNnOHY5dm1wVVBNL2RKV1Uz?=
 =?utf-8?B?UE03RGx1N1RqMy90VjVmRDQyWU02RDc3b0wvN3VBc0pvcGgvUUlhV1hPQXBQ?=
 =?utf-8?B?TytJSG1Bb3pSR0RhMi9Bc0kxRlhscHBDZk9FWFpOUTFKZTd3KytHc3Z2elNt?=
 =?utf-8?B?MXBmNHVCSmhXR0tvOGFMTzFOdUtGTWNiNU5UYWZOdHdWT3owekcyNHVoVjEv?=
 =?utf-8?B?ZFg4NnV6dkdpTWd1dlNHQ1cxa3pFZld4R0FjRlhvUmpjRVI2amVlWE1DaCt5?=
 =?utf-8?B?NXp3WkVnTjg1Vy9PazAzOXdGamo3azc1WXVnNW01UHJRbHo1QVVxV25oZzVz?=
 =?utf-8?B?WEVrSVdETStGckx3bjVydDZDckc4QWpGU3VxTTNLdjJqQ2MrNWJjQU5mcXRX?=
 =?utf-8?B?VVVibE9yV3RvMmxiMWJnMi9OSzFmbEhtMjBkcXN3SzZra09NQzAzc3l2aUsw?=
 =?utf-8?B?eWptdERTRXdRVVJpcHBWd1hzdHc2YVhvMEV5V1dNdUQ2K0gwTzBOUVlTMENG?=
 =?utf-8?B?Uzlmd1BnYkFFMytuQjE2Q3Nxa2lwclNBcGhzU0dsOFNGb2VPcndieGZ4YkI2?=
 =?utf-8?B?Y0l3OXhmbUhQZmNiSVp6eGZpYXZ0SHhQenhIUlkwY3BuRHVCTng5RHhNbzVJ?=
 =?utf-8?B?VVdwNDJ2VkZ4ME8yc3JXelkrdjU0OVBHSzRFa0wvQzBwM0hQdU5FWnAvZFd0?=
 =?utf-8?B?bVl5d21XSnVjdHk3TE8wSFNzSzZueENpbFF3TmZTWkZxWWxIaUN3K2JVOUJQ?=
 =?utf-8?B?enlOcE5JTTRRaExmVEZtNGltYXlzVXN5dnBtMW9JTTlOU21hUDdCbDBwWW9I?=
 =?utf-8?B?cDM3Y1VYK3FZZ01ZTDNqNzAzekwxdWR4N0luS0hPbFRmYVc3aDVBRjV3aWNZ?=
 =?utf-8?B?U3NpR1ErYUxnWTlVZDlMaS9wYjlRSWJSQXlHNUIvSldUbWRuSnBFTEtLdG5V?=
 =?utf-8?B?UjdZRGx0azluWFBhMzJhandQTElrNGx3QVdTRm4xb0xabEF5MktyNmhidGhC?=
 =?utf-8?B?SkJpcTJTaU9sekorRE1EOWI2QXZjS1dKNENJRUVZRHVhQ29sK3AyU3ZXZEQr?=
 =?utf-8?B?elAzNjlhR2FSSzA5YkdFMm9FamozUEpDWVFnNVE0cUxJZmRvcEYyekl6bEov?=
 =?utf-8?B?bmhxQU9UNmpYSy9uMnBpb2h2YitkYWF4UjdXT1JlRk5kZVg5Z09JTzZQTUJj?=
 =?utf-8?B?MkNBK0UwNEVhczdBZmJJRDFLOHB6eGY2b1BCcXdIaTdQTTZoMTZYY1l6V3Aw?=
 =?utf-8?B?R3BBMXJEU1RGSHVJWXNsSXJheEh2dkJWaHBKQWhad0t4T1FmVzdxVkN1Z0RT?=
 =?utf-8?B?S0pObndQQUZWMGZSbHdTamFGTVRJQjR0akgxc0tQYjlCL3dGbnoyUGxsYmRJ?=
 =?utf-8?B?cEh6d2IxcnlSUjdib0Z3a1MxS0xDTlJDV3ZSSHRtTEZxYjQwS1FKL3IvVXdt?=
 =?utf-8?B?SW9teGFMaC9JdW0yK1dkOXBKWitJdzRBWktCZ25RaEx1S3Nmd2Y4bG5QVzI2?=
 =?utf-8?B?VXUzS2hVci9SaGsvN1dLblZueWtrRElVS0RqVDlSSmFQR1IxYlJBRVdGMHBl?=
 =?utf-8?B?SGFNL3hmQjJNeVMvVzIrVDB5MHdwQTgydzlpQ0dSTXdFMnVieEVMaFNaakM1?=
 =?utf-8?B?eWpHS25oWElkeHpsUVI3UmJaTUFNaFhFdzJUZ2V6NEdRV2t5akcwQkhoNVRE?=
 =?utf-8?B?R1VMVml4OVpVVlZSUnZEelBja1o3c3c5SllidTBSQWpqMjFGOEdmMUVuS1dq?=
 =?utf-8?B?U0E1UzVvL2pqSHBqQ3Q5TCsrRENNRWdmTE5KVXBvSnROcHAvakFSOUljWmRF?=
 =?utf-8?B?Q2J0V3lYODZRY2o4b1hRSUIvUnlBRWdXajBzUUVvckNUYno4VUFkbVFQdi9n?=
 =?utf-8?B?SHJGZkEwVEU0QmNlS3BuRG13RFJhd2hCMmZzcHpCTEFwN2VTRGhZUGsyQlFR?=
 =?utf-8?B?aEx6bWtkMWlUV2tqTm9aTEdJbkNHN0d0YmRlNDJUcHJYRkdPU25YRTlzTUh1?=
 =?utf-8?B?V1hnaEdKV1o3WllCUjBSSG1aMDhKZy9KK3gwM0ZhZXg3TUhIYkZQZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a5209e8-616a-4730-c70a-08de88d60942
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 12:16:39.6342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Tq7ZRtwdCBJUN8ye3PvTSz1Wl+c3sPL4M8QnRqjiEwraIxfN3bc78L1m7ZHkfx23Dqfvu8+hMd8rA2q1z997w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5942
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_051647_636326_32CA3951 
X-CRM114-Status: GOOD (  13.66  )
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

Hi Andy Shevchenko,

On 3/23/2026 5:16 PM, Andy Shevchenko wrote:
> On Mon, Mar 23, 2026 at 1:32 PM Sai Krishna Potthuri
> <sai.krishna.potthuri@amd.com> wrote:
>>> -----Original Message-----
>>> From: Andy Shevchenko <andriy.shevchenko@intel.com>
>>> Sent: Monday, March 23, 2026 4:22 PM
>>> On Mon, Mar 23, 2026 at 01:15:04PM +0530, Sai Krishna Potthuri wrote:
> 
> ...
> 
>>>>   int xadc_write_samplerate(struct xadc *xadc, int val)  {
>>>> -   unsigned long clk_rate = xadc_get_dclk_rate(xadc);
>>>> +   unsigned long clk_rate;
>>>>      unsigned int div;
>>>>
>>>> +   if (!xadc->ops->get_dclk_rate)
>>>> +           return -EOPNOTSUPP;
>>>
>>>> +   clk_rate = xadc_get_dclk_rate(xadc);
>>>> +
>>>
>>> Unneeded blank line.
>>>
>>> Also, don't you asked for options?
>> This callback is defined for all other platforms except I2C.
>> Currently for I2c interface we are not supporting any configuration, it
>> is used only to read the channels.
> 
> If the callback defined you should use its value and not hardcoded one, right?

Yes, that's the intention.
xadc_get_dclk_rate() - this is a wrapper function to call
xadc->ops->get_dclk_rate(). May be i will remove the wrapper function or
move the if (!xadc->ops->get_dclk_rate) check inside wrapper.

Regards
Sai Krishna
> 
>>>>      if (!clk_rate)
>>>>              return -EINVAL;
> 


