Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC708F5140F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 06:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXroqFF9upJkAKuAHDuierwgiOZ6VTjVsUMHwogF8tU=; b=m7Box3gqvQcGSa2WkcZoaY9k0k
	FJ5U30iIuuQj/Sm0RIqF4eWZFW5Oa/ALEa+OyUi+SIfpL0dyI0A41ssh01tYJSqLc1u3ZlIO7OEPi
	RlSE3fEy3/Z2gkzHm5TEadpiog6RmnLpkwhwqkBYI7qeGzcNN4lqgy2HUEc99jw2OUdD2c7RUJeID
	1l8TQ7nN09WHgJLE1OTB/VFYvPRh3sRlm5bCppvjBfuykob/p9Sq2FuiBpz60IpiK0v5j7nRWRAwc
	E8mfOABofzKnxoCG0mleE7/degjWJZJsrjaP6ZctGMc8q+gyGifC1PrqqkNbSMsL7wN05VX0QufjG
	rrz2Io8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyP7h-000000036z3-0d3g;
	Fri, 06 Mar 2026 06:57:21 +0000
Received: from mail-koreacentralazon11023099.outbound.protection.outlook.com ([40.107.44.99] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyP7e-000000036yQ-2lPX;
	Fri, 06 Mar 2026 06:57:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f8MZJpjoPJHGDUShtynLTl32ILMRJMWR720M8v+QC+IkhYBGcQBNDgsuVgbtSUjKpVeoMf71zybHntrVzYSrONF+Lp3W7XAWLPyFUbUA9NGmzTBKJEpEanYUCUa8q1pBzrz35jnJmuw+8rG18duA7Y3Dm2tX/vI4OqNpY0fP1ICFmPsFBJNNojvRGjPB/wqvxk8s71QfO1aadrWhamDWQ+WQX/ussaVT5od6haTin6TYK/6yRknxv2THZZ0faqH/6whWw94KaNpzf+JjYV3DJPhZ300d8svyZQpqxvt2SMLHD0kC5+HZKRYIsu8xxWZUgHHhb+njGLVmyl39x77YGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXroqFF9upJkAKuAHDuierwgiOZ6VTjVsUMHwogF8tU=;
 b=bPtQySLkx7MqJGwOKElBDNbt8YAXGZGd5T7EkNJMXxrpC0Zot32WJ4467+h9u9Cq+NEFbeY87tTSQDPFcMUBzBZm0St3gRxvSXfvG2e7Vn/39f5IAWFPBvHUyfije4twkOeMVbSmEJilQHSTJO1nJCk4KJfcASK7a9Pazt769htNXZPGrpJXnZ2ByOtsPKKBn4BAISLYqsiUCRIwSDwJSuREpqokA1HJDouu5Ucb1COxGM9U30bCRgyuO0AIBq4mT1ScL3AXRhIXs+5s3FcDVLJHdzxKTApmpMLKrBKfPXtouOJ4QEs0KZDhdzSf3mjLI5fuI/7cE4/WVunK5HcbfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXroqFF9upJkAKuAHDuierwgiOZ6VTjVsUMHwogF8tU=;
 b=QlU+GoukxuYbsjJ7G6WEngogs2FZYdMcPEBfxJTl+CcRPjGw+TmKa8zGglc49b0+c5nktMWRgsdK/1zJAztLhmtyluI08DNyvg7cy8zegT8UW/d+qkZY65SBsrn8KveIMMwti+zIHsFx2kUPP3ysUghgq7dysJfEil5/IiRjQD0fz9Io8eLww3awnHYmmB/k8ewklMJbGQkAefm2E26WlTcQMcNXQ1dMVvWhABv0ndqhb+qiUlNCqXUfrYkzD4tGA2ijMgvGetEbEhcXM3yG48ssq3euxUyloQzoSbQK43gYHd0nEIMgTyUmbMtT2rvIur1/n1uw0Tha6N3Q3ClCtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by TYZPR03MB7347.apcprd03.prod.outlook.com (2603:1096:400:423::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 06:57:07 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 06:57:07 +0000
Message-ID: <c8b21feb-1317-40df-aa55-026ec0c1aaf7@amlogic.com>
Date: Fri, 6 Mar 2026 14:57:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: amlogic: Fix a typo
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Ronald Claveau <linux-kernel-dev@aliel.fr>
References: <20260305074328.639993-1-jian.hu@amlogic.com>
 <20260305074328.639993-2-jian.hu@amlogic.com>
 <1ja4wmbqn1.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1ja4wmbqn1.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|TYZPR03MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: 495ecef6-333e-4689-ec27-08de7b4d947e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: MQU1HF8BeVLH+MzqUvwXMziIt+ou7BqfvMB6SWZml2osGHnjhQJmUz2mAv+VUuUQPCH61Vd1AWi8BBRFTDoKvxozl4wTB4eAr93X33x9H5E8Aq8aPKJasfCIzCoz0BvopIo7NS9g3W/XQhpjwqiQ4SyQR0wxBoE3h6XKKZr6QV5+4nwbjPCZsBcOivMEF1uO6Oe2RUusqLIsrSbdGfK/QQ1OM4ylujv51Dze9f93UZCjgJ2xcv3PpgMjvk/VjQ4SdVgs8JtLBV+OccGWkAEhZtcMssum4sx0cJ60GkCTtXu5OhIAU0/l0cBV/bhSqw8KIcKX9puHvDppahBH0OE2wkZMnTg3XBPYQpbFCvRlP/NjQG1+1bTioZNJv7+3chHlUq6vwe3Ogp3uZKLv4HNpBnMA0EStBcHgs0Faa0Q6GmBNCJdm1vEN+PZbHtApmkcw0Q2n7yJVn7paEHfOFf9U3jygDDLt9FbAzRV/s+QjIxlf58GGRkbuhYz8TkWU8XMR9l8wwE1dLUm54uBPS4XktRkRrrQg1BHKe4en5OR0he8RewAsrB29HZHOdgaHZndGn7UbR4Azn8gq7FhC3BE/36hGb6/rcDlpW5iArexccLTfBJdD1EFnxYhsUOUUT2ysnd5hC/grmpB+YCVW+2J9yNUYnJ4n6rnPrKhVGkzZ0bN8IesZaO+h5SxQrWDwUXpWfhkuoU5RZOpqJfhf2+7V9ppfD4ElKC77J/pO1cyQNCE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFlrcDdBNGtFK1N4alVSeVJZNEVvYTZlMlNtNVp6Sk5qUWdLWWpGbFdtQ0NZ?=
 =?utf-8?B?RG1DamN4ZTNtWkRkTGlzMDBvYWhEUVZtdXRZS1p5QUdrVHgzOEhKVDZyTWtV?=
 =?utf-8?B?UDgrWEpBTUROdzF1NVVOUDBEZ3hPNXhEbmxVZHV5SExVRkZodG5UNmRDbjla?=
 =?utf-8?B?MXpZRGxPTFYyMFFubEtBRlFwcGt5cUlqc0pBNVlOY1NGL090S0ZITG5rd2FB?=
 =?utf-8?B?TEdhRE02MUEwUVNNMkhQdzc0WVNFaWZvbzAxSkQvMGxpOGZhaWlreldzS1Jq?=
 =?utf-8?B?eWsybC9YN2VJZy9FeDdGZEYwTkxSZXNJYWFEM2tLY3AyMkRvZmNKbGRydG4r?=
 =?utf-8?B?TXB5VCtzZWo3eERBRkRueU9OcjZoT2x0MXNaZHVmMU0wVlE4di9ockJoM0Zy?=
 =?utf-8?B?ek9LOWt2TGNpTkJtblM5MFhNZnBXR3BCL2JvRzVLSkVyeGphOHZwdWl6Mkg5?=
 =?utf-8?B?dGFRWXVEaW1oS0pOUnhPWVp4NVN0NDczYVRDYlNVc3V4M1RDaW1XdmdlNTJk?=
 =?utf-8?B?S0Q4T0lrbW5RdFFJcnA0OTk4VG93aHVFa2FtcG05NzE3b2ZHaUdqYjYydGt4?=
 =?utf-8?B?OFBaaHdoNkhrQUdOYjB0SU53VnFsbTZ6OC9zcXJ5ZVYzVkNvbGJDUHpjTTFJ?=
 =?utf-8?B?R1hQem51TnE4K0M0b2tSQjI0MmxNYit4cWl6ampadEZtMWNKRWk4TG5kbEh4?=
 =?utf-8?B?c1dlajQ3bmNSWkhCSzhRQlloQ2VsMDZLeXZGcXNoUmJQMGt0RUZlZmVQRjQ5?=
 =?utf-8?B?T0dSZGE2dVJqdUpMY0h3VUVRV3ZHTWNTTzd0NEpBRU5Hck5BUFYvcVBVd01M?=
 =?utf-8?B?dGZ4aGxRM0x4NG96amN0bytWTnZqZndoQlgvVWs4NlZlc3pxVk5jVEQzbnZR?=
 =?utf-8?B?RFhqbGlJc2M2VFJOVkxza0lnMnZULzVKQzNTL201dG9WZnBQMjJORktWeU1J?=
 =?utf-8?B?Tkdkbi8yeURwRWZkVTZBMFdmaUsxdUJYOTZrd3lWbXphbjB6NGlvcXZTdHQv?=
 =?utf-8?B?Z0J0YjMwM1h2NlErWGV1UzlYL0F4ejFDMjZLVmFZTmZYcGZTbGVRc2pGdFNr?=
 =?utf-8?B?bm43bERjZVFHNzhNdnRQY00vM0xzTmJYMlI2ajVOT0todnd3VWZ0cjQwclJG?=
 =?utf-8?B?eHVNS0pvQjBSTzRwbDgvaDZBK2tUOW1LWDFtN0tZOVB4Tys5NnBrekZWcTg4?=
 =?utf-8?B?SG5Yekd5NThaYno4aUhIVXVzOTlqYXRwVnJyVElkc0wvTm5aT2FWUlcycVJI?=
 =?utf-8?B?Ni9TajIzdzZxK293TUF0VDFyTy9RT09JR0VaQW0vc1l4V21DOFVqOUJGMnEy?=
 =?utf-8?B?b1VObmdTOG9FcWNoek1jQkhuTDhhanluSDFxQ0h2c3BKN3VtSzBnRnViQThI?=
 =?utf-8?B?UEM5U0RPRW84SGd0QVFYNmpHYjZmcVcrT3Y4S1RmVUo5YmtSalFsekRWcDRY?=
 =?utf-8?B?bFBHZG5FZVVUZFdwdEd3b2o5NXVwdXVxR3V2cUlIN3oraWdMVXdZQlNqdnpU?=
 =?utf-8?B?ZEpiaWFjQ2g5V09SWkpkRlAzVHlTSk40WHhxbHZUVWhieVZpK2tHK0xuR3NO?=
 =?utf-8?B?L2VLZWZIMlBpdEd6SFlZak1tdkVReUtoSjB0WEQwUzVxdXd0WXUrNmFoYk0z?=
 =?utf-8?B?WWZILzR5SlRFd3ZQMFpYcGFBQkNvQnZrUmNHNlh6emdGSDhPa0oweEttaVR6?=
 =?utf-8?B?M05NbGlaUVNQNDBiQ2g5K0s4d1gwT1o1dExPMGRpUE12M3dqcmt3aXNSZ1hD?=
 =?utf-8?B?NHhQUlFLZFM4aDh5ekxkaHNtV2JsRjFwZzc5Q3Erc0c4V2psUjI0UkRINXhY?=
 =?utf-8?B?cFd2SjhQN0VPN05sdTcxczU2b0poREdIZmZzdkVmd0YzcE1sQmNTcTNlcSs0?=
 =?utf-8?B?Z09MMWJKT0lDZnpwSjF6T3l1QUtFamhpZDBoR1RHU2RGbzFUb2daV1FHSUFI?=
 =?utf-8?B?cHhnOFJidGUzL2ZXVnNHRXdxTWkvQTBaZHpGeGJnQlAzWWV4M3IwVGFuM1ZX?=
 =?utf-8?B?ZkxZUGZ1Q0pVU1AzbjRxV1lpY0dXTElVYmM4VWE1SG1sNzFKdGhCRHlGRUZX?=
 =?utf-8?B?Z2VWYUY0c2YvR3FSYnZwUkhZdys1R2tFR3pqUWdocUNnVHRBcXVFSVdiekN1?=
 =?utf-8?B?eHlwd0NOc29HLzc3UXB6R3l2RnNMeWtJZ0xwZVhRaS80ekFIS1UrQi9xNHgw?=
 =?utf-8?B?bmsxNlQ4MFFMcVl1S3lrYWJ1YUtKZGFKTEFvSzVqMnBrUnB1QUFzSENoVEJ2?=
 =?utf-8?B?T0JhMFJYb1VvaEMwRTM4bTR4QThrRFFkUTFOdFB2NTUxZWwyb0hJZy8zN29H?=
 =?utf-8?B?QlF0aUVtWlR6OWttR0lEZUlPbnEzYTA4MkVGeFhaZERCTk1YQXpOZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 495ecef6-333e-4689-ec27-08de7b4d947e
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 06:57:06.8728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qmr7hbJOwreuJ1W09UqwRFvB2jbO5++AmPsKoFuideqnyhURW+MbIGh5GXft7+cYQGSTiASCdwLpX3V/ulDn0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7347
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_225718_724912_075221CA 
X-CRM114-Status: GOOD (  14.94  )
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

Hi, Jerome


Thanks for your review.

On 3/5/2026 4:57 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On jeu. 05 mars 2026 at 15:43, Jian Hu <jian.hu@amlogic.com> wrote:
>
>> Fix a typo for T7 gp1 pll.
> Patch title is too vague
>
> Credit is due to Ronald for finding and reporting the issue initially.
> This can be viewed as a clean of his original patch so the change should
> have his Signed-off-by IMO.


OK, I will update the patch title to:

Fix redundant hyphen in "amlogic,t7-gp1--pll" string.

Thanks to Ronald for finding and reporting this issue.

I had obtained his consent before submitting this patch.

I agree with you and will add his Signed-off-by in the next version.

>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   .../devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml          | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>> index 49c61f65deff..b488d92b7984 100644
>> --- a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>> @@ -72,7 +72,7 @@ allOf:
>>             contains:
>>               enum:
>>                 - amlogic,t7-gp0-pll
>> -              - amlogic,t7-gp1--pll
>> +              - amlogic,t7-gp1-pll
>>                 - amlogic,t7-hifi-pll
>>                 - amlogic,t7-pcie-pll
>>                 - amlogic,t7-mpll
> --
> Jerome

