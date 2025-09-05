Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576EDCA1015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 03:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ACEnjg7YYIZNhu8dltQXBXCnU7J18kFazW6atZbxOE=; b=BfHMCG9dFlX7/3CO1dNT8+4d6m
	2TsDjpzKXPwEBUEJ4/tgkMuVe9b2X7G/c/3aa80ID+CWk0bUmCOTo7qm1OBjwWbhN+OLOntxeW4Ww
	KTuREdrWuDOx9C1PXzwvmCQVDMBVf64YeTkjrS01y6GrzTD8BYj+5NEia3740rbH5vnP5uwXD+zpo
	W2arPoUNAdz8GllgQcrdUP7p9OxOy3pUNdP/Ba2Rs8HqRb3R50xQZlLhuRs5jk867r9M3PzTLyZaL
	9N5ysgzWtLlYCkLVp3oCaED8niWC3DZCorDJR8AH3qkWzZNaviKtpvG04tpqLKBetqJl4fmiI/V9h
	5oqmSwrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNbQ-0000000GaOe-3fmR;
	Fri, 05 Sep 2025 03:59:09 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuMzm-0000000GP4s-1Ksl;
	Fri, 05 Sep 2025 03:20:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UlhOSohOj/ezJccLThk/eIGUARb3nvHSAJYV/0HGzxu2pfgh7j4lyoK27c0kkMjPLI69n2bN6t/Lp/fETifH3AIp/R3nX9F/u0ajK1UaHZd4k8VUCbbXbVX4yahFGZhAgnkUdiHh8e/c29XX9VJlYTHI6A2hLDkLjLJ9aXgdE4Ew8Z3b5luWq7cKFjzQtJF7XkPhjTi4/UY5KfDs3U0oOcrbaMPsK8q3BArvtRVjI6LRZphhRSOgZ0NJp5ztq8MSvcGWlie+AJAwQFdBesfIze/9zt/HbbGYnsgGBBy2fc6/8xac6y37ilrV2i6mRwpJRppHr0K0wc7H37kmiy2OiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ACEnjg7YYIZNhu8dltQXBXCnU7J18kFazW6atZbxOE=;
 b=fdOKeDvkpovGerZQvVj4LSG1IeOMyI9MjXAaGMnIHo6qUgDiG+fS9gkWmCM6GkuS2+PS/dxNDmAmZbpZbcfdTcB/TWTlvQOLodxuCJi0dQXb+6WgTP/dHQkVKRFeYfvoZJSGSlcfOG2CqozD8N3aGyY2C96VTO6/a6yflcRrYVLUW7f3r9rk0MeoIUDLXuAJoTW9R2NvhksdLOi/hda1QUdpO36/Ou1ygpBj/c4wFH3sK2i1tN2tadqA9YqN45ohmKiI0rsa/mR8WlnmjpOuae+ZIM94Y3NJd6fT7Qr3UyV5BRoqh1R5BszlAmnyzH9DYLR1Nwlnrj7LLsBtSfftaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ACEnjg7YYIZNhu8dltQXBXCnU7J18kFazW6atZbxOE=;
 b=xYwN586cTwCZgc8Rfv8je6ATgy6JbBqUQ0L9HzBUzDivdwzHYnQjCuRpl4JCIpjC5aDOhKALxNnALhVQhR9a8DdmoqczpXnGytK9OAE6CFd7vkFjiZrlWd3rYIVC/1sfaGH57S6xuzSdb180jzGXWkWbmivYE71qOu3TgMH/uLFAiFWsUR5FltffLA+klkm5k8OkgdMr35LlCi4hZ4WVivaH/x1yXb6KoqqyZ4osoGIof9CGLFNQ7Nq7/7prEQ5nmbDhfwGEAV1pp4sXA67ZChvzB5ygv48mLiPUwMPuIf3K9x/3xoQFqOZ8f05LqTbwn9K9Lf5CNFcws6DqrziThw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by JH0PR03MB8809.apcprd03.prod.outlook.com (2603:1096:990:a1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Fri, 5 Sep
 2025 03:20:01 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%4]) with mapi id 15.20.9073.026; Fri, 5 Sep 2025
 03:20:01 +0000
Message-ID: <6ebddeb4-b33f-4392-b5da-56501b38fd6d@amlogic.com>
Date: Fri, 5 Sep 2025 11:19:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] dts: arm64: amlogic: add a5 pinctrl node
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250403-a5-pinctrl-v3-0-a8c067e22295@amlogic.com>
 <20250403-a5-pinctrl-v3-2-a8c067e22295@amlogic.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20250403-a5-pinctrl-v3-2-a8c067e22295@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:196::10) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|JH0PR03MB8809:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ae2e82c-7ebe-4dd2-1404-08ddec2b193f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TC9WSW5Icmt2akNJODV4OWVhckh0c2M1cWlhcks3NVViZ2M2VDJJbmlveUlG?=
 =?utf-8?B?TzVwbU9ka1AzcHc1SzdIZU0rTHlwMW13ZWw4K3FlbVpjOENxZlY4aDdvU3hV?=
 =?utf-8?B?WnIreldSRUVONnR1YzZCOU42emhIaWRXRlVWZjFhZjlrTnN6Tm9acWFnd2hs?=
 =?utf-8?B?d2VlNlVDT252TlZtU0x4eXgxNk5FVllscXY2eTE1b3pJWDdUd0FoQkE1UDhI?=
 =?utf-8?B?UE9XUEQzeStZS2hHcXdaZnk4OWtPZkFBUk5mMUpWMmowMjUrdjBqdmpPeGtY?=
 =?utf-8?B?ZENuZ2huZDRpcy91cmVxM09KVzhaNHpVWnFPTTA0ZCtNQTJSaW4zZm10a0pw?=
 =?utf-8?B?SEw2SGdiUEVvVmZyMWZIaU5uRzdLSElLUlBURC9zeHp2TmptYlE3M0orVEIv?=
 =?utf-8?B?VGg5a3ZhbTVsM05xdjl5U2EwQW0vaGtFTVVBSCtCN2pETWp3cW5YZ2NoNnhq?=
 =?utf-8?B?NnBMenFJT2d4d1BYbHl0SDk0N0ptekJwZWE0TW1vODgwVlRscDRJK2Fxa1Js?=
 =?utf-8?B?b1dOWTkrNFBzMmZjTndDRWNEbW5MV3VnSVI0RHJUaDJob2E2MWdNUjdOVW5o?=
 =?utf-8?B?MnIyQVlCTmNJVlVyYWdIb3cyc3VuaURBZjdhT1JpT2tNQ3N0K2gwWWdTZU5k?=
 =?utf-8?B?M2RUSEJHampBMG9Kd2hIZmZqeW5ubHZBOUlwajhKQXc5cWU5UUducTVkYXhT?=
 =?utf-8?B?ekhKMlZKOXVDQU5iYnVJMW9rVWF3UlIwTGlaTURWNEExOWhSUTlkK0YzZE9y?=
 =?utf-8?B?L0tiZm1FWGY1T0VRUDBTQWh1Y0tLYWhMVDJsN2hDS0lMNk9DTTdiMEltTnFG?=
 =?utf-8?B?WWpTdFBMa1FLNjhSOU9lSUdwMnRCVVpIem5QdzlGVzN4aW9KRmhlME4rZ2lN?=
 =?utf-8?B?UkxjWUZlT1llZFd5eUZhRmgrUjh0ZGZFQTBKT3BEQis2L2tHeFgxQStUT2lh?=
 =?utf-8?B?UDNnNGF4cG81T3BVRmpoU3c1cXlXbXl4bGgzSVVzR3hzSGdMVlMza2pwYWJj?=
 =?utf-8?B?MmNLMUs5RWFNZmlMYWI2S3B6MmZNR0ZSQ1lQRGZYNFVpdzJyMERzVVhQR1hm?=
 =?utf-8?B?Z0xwZ01aa09uWVZDaENyeHR3QlJrK3Z2RHQ2M1VQNlBETTZPSVdqQk9hMU43?=
 =?utf-8?B?SFJhZFRTeFdPeGp0S1VEOHY5UTJjUGRzT2Z3VTEvL3RxWHdyUGhteTgrVEto?=
 =?utf-8?B?L0JrWU9XdU9ZSFJYQWVHUDRBMzB6OGs3MkhGWDN6QUhHL2hRVWdCSStOL2pK?=
 =?utf-8?B?Wk01S3h3UEF6ZFl2T1Z3Q1dKa0ZXRE05aHhBaDdpamw4YjEzZ0Uvc3VsUFdS?=
 =?utf-8?B?a2QrRGJNbmRrdEtlNzcrVlBua3d2M0s0VVlHVzZQaW5MVTZwcEVnNkVueDJF?=
 =?utf-8?B?OFJlOUY1U0VXT3kyVFhzM29MQ3pRbXRIc3ZHeWYvejg2UXNOQkpZeVhLVW5I?=
 =?utf-8?B?U1JvVW5PNG1RTjVyU0U0SS9PdW9mbFFrTHlIOUxmbWs5c21JOGFQYjZnQW1H?=
 =?utf-8?B?am85OVlkSlROODdrN2RZbkVibUxUWG5vUks0OXphMkE4SCtObEpJcEl6VFRY?=
 =?utf-8?B?bjQvK1I0ZGtNSTMwdUFPOURvSzYrK1VTZFJiYjE1N3lINXpxWmZoSWVIam5o?=
 =?utf-8?B?cGFFTkhOVkNTRis5OEovaVozTDFBUHZZVUtXYlVhV090MDFQZFBnUVBLaUhs?=
 =?utf-8?B?ZlNmbjcxNitEcm1UTVJuVlozcldyOVVMcDZTWitwK05vditORmhLQWUxdklu?=
 =?utf-8?B?TlJvVWtVUVB6bU4vaUkydEcydUtTdzU2RW1kcUpiZjk2LzJOSWcvOE9IWmpn?=
 =?utf-8?B?U2tEQVA5TFcyblY2OStzWUpTMGVpcGwwT2luQ2NVeTFCcXd0WERLTWg4VE8y?=
 =?utf-8?B?R0J2MnliNWhERHFyVlZKSHVlVkN0SEQ5bG8wVUh3MGlhZ3NManhxdGpQZzhq?=
 =?utf-8?Q?I/8Ubyar5g0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmhoY0R0N3hXMkduZE9wSG5xejBvUWpBb2R6ekJ6aG80MTRFU3FXdXNmOUtx?=
 =?utf-8?B?SG5qTVVJQjZPaXlPSk45QlBmSWc3emVIQ1FqYUNlelVyaVB6K2UyRkhKYkFh?=
 =?utf-8?B?SjBNSUxCUlZFVTJHZGdqc091TEhZTCs2Nk9TUFFLQjZwTlo2VkNoZWhld3Q5?=
 =?utf-8?B?MUVVMjU3RGYxZWtYWUNaM2VZRitVaVVSUXczMVVyWXFRRytEN3BpZ1phWnlS?=
 =?utf-8?B?aFd2SlNpcmlJMm1XdENsbHRlYnZaazlVVEpqdnlMeks0ZzVVYm03MmhyRVRh?=
 =?utf-8?B?OS9wck1yMlZLR01qcnBvc1duOTlEQlV3R1lENUNRalhOaWdpazRkcVZGcnR6?=
 =?utf-8?B?TklVTlUrdDRCNkhlSnAwNC9DRzlCZ0kydWxCRVY3RTVLZUtoOVh0YjBPZTd4?=
 =?utf-8?B?dlByd1l5aUJsWkgwZHlHcFBEaGtoam9Ma0pSN1dpQWFmeDg5N0E3YVBTNDQv?=
 =?utf-8?B?cTRJVXRUTjZUL0QzWmEvN3FPL1BjL080UFFWZE9Sc0VZalNhMDhLb05MVFp5?=
 =?utf-8?B?aDErNHpVUVQ4dEZHQ1I5d0M4MTdGSVRxQmI3YTNNbGZ3aHkySU4yc2I4UTAv?=
 =?utf-8?B?YWxIeFZmdDBlV2UxWE1vUGxaVTNzQXV6OFByTHdZWGVlbVhiYTBDbGQxTVlQ?=
 =?utf-8?B?WXI3ejAxcmpqWXpNRDhQekUvbXByVlhtS1FiSGVXMnJaYlV2YzgzbHF6L1NM?=
 =?utf-8?B?YWk2NHBOTnY0ekNIN240ME9TM3Rkemg4UW9xU0lnbDR4YTd4QlZrL2RUZko4?=
 =?utf-8?B?eUdtWEY4YzJRS1F2U1lRaTV1MFlpc0F4NjlBdm4rOVp3MTBldGFNTU5pb0s4?=
 =?utf-8?B?VGlSTGQ5blBJS3BuSGJmZkowaWFwbGthMVUxV2hrcVlaT1dMNjdXSDVMQkw4?=
 =?utf-8?B?cDdCcUgvNEpiMXZxQ3FEeG1vRkIvei9zcC9xWlluY1ZxWXR6ZFF1NndXcGlQ?=
 =?utf-8?B?cWpTMXFPR1Rrcng1SGxZMGo0WUMwdng0VUhrSXFLM3FXS0Rid3luVlhzRHV6?=
 =?utf-8?B?eFJpOE5EdkZjL1plODh3S0lSbkszQWRvSVNvTVdXT0tkK2dkZytmTmh6aFQz?=
 =?utf-8?B?RGlHTGE3UnY4c25MdjZHMmcrTzk1TWE0engzR3N3WXJpb3Z1dkZNY21HbmY1?=
 =?utf-8?B?bzJoNzRRYWRqazFkUWhmUytNT3RkQ1Q5QkVCbWR6dThiMnlTSVVVM09aUm5p?=
 =?utf-8?B?MGkzbVlkOXVFbUJDQ01GakZ3aUZHZzVodXFQd3NhNGkwM3lUMHdMUTQzV0tJ?=
 =?utf-8?B?OUZZSDBlRUViT1JSVTV6TTE0K1NLV2paVHduYk5vWTREdG5pVkhweVpBZlJi?=
 =?utf-8?B?RFlyWkN2Z3ZkY2E4UGlBeit1VmlRNllhUkNSb3E3MEVnUlF4cmdxS3hidW9N?=
 =?utf-8?B?amRoTFE4KzlXN2hkTzJVcGpKREpYRUtNQzhSZzRRZmRObGF4M0hFRERNZ0dl?=
 =?utf-8?B?QWpmRzVockZ3cXVlemI4R2drdW9VK3RtVStQN2FzTGo0YUNDdUNKYVhiMndy?=
 =?utf-8?B?dFdxcmdMcWhWVDBPaFoyaVIxbDRBblVQakh2djVhYzdBNzJtRU9SdHBqeGRY?=
 =?utf-8?B?ZFFRZ1dhOEhISVNLaWhRSjFXd3V5RW1vQnN2MnNTNHl4RGlqZ2lBZlRJY0dN?=
 =?utf-8?B?RThMa09rYy95WHRidDE0bzF6SzE5SzdkNWFhbGtzL0VMYUZtdGpxTWNHUTlV?=
 =?utf-8?B?K1hyWFRGaGRPQ29NYXVoTUpkVU9GeWNwNjUrdndSNjVSazNrRVg4MjNlejlS?=
 =?utf-8?B?NzlCR0lYaGZ3WWpiQk15alRDdlJlZVJOU0pCd2w0NlYrUXhVN3NDV0t2RDJI?=
 =?utf-8?B?dE4vTXJtQi9xOWhTY3hrbzRqYld2NWtGTzJkVU14WlZ0TXZGSlJDZGFPRzJK?=
 =?utf-8?B?cE9rVHRPaVNIaU5LcjBmU0JmRTR5dE1YeEhvVm91K3dxclBYUU9pd0JnWkht?=
 =?utf-8?B?VFVOdFdiWktrci9JcWFCT1l1U1RvbStsZzg0TjRtd1owYmdqRWhzOGlvclZu?=
 =?utf-8?B?VE9FdnU3ZzMraUFmMktwRlFxT2pwTk1CU0ZSanZzY0JKT2tFSGkrRnlYaHgz?=
 =?utf-8?B?MGhLRkExQWNDRzVoUTVtS3lNaFU5VEFuMCtCOHRrRmFLY280dElodEp2SGlX?=
 =?utf-8?B?K1Rlb3dmQnhXRWh2ekZHUUNjWHlpbUM3WUx5OXZ3UHF2a3F3dDB6Tld6Q1By?=
 =?utf-8?B?cXc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae2e82c-7ebe-4dd2-1404-08ddec2b193f
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 03:20:01.0386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LtWh6G0+30mcYYUaz+EK0l1mT/thbwCsIblP4bH2NI5mGFN+3Q4BXELYNwCGkjkMxtdv0DR1qfgQsXpa3REa5EpJOSGpnOthxlJggX1CWXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8809
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_202014_497985_C0C5C0CB 
X-CRM114-Status: GOOD (  13.86  )
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

Hi Neil,
    Could you please take some time to review this submission?

On 2025/4/3 16:33, Xianwei Zhao via B4 Relay wrote:
> [ EXTERNAL EMAIL ]
> 
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add pinctrl device to support Amlogic A5.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi | 90 +++++++++++++++++++++++++++++
>   1 file changed, 90 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
> index 32ed1776891b..844302db2133 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
> @@ -4,6 +4,7 @@
>    */
> 
>   #include "amlogic-a4-common.dtsi"
> +#include <dt-bindings/pinctrl/amlogic,pinctrl.h>
>   #include <dt-bindings/power/amlogic,a5-pwrc.h>
>   / {
>          cpus {
> @@ -50,6 +51,95 @@ pwrc: power-controller {
>   };
> 
>   &apb {
> +       periphs_pinctrl: pinctrl@4000 {
> +               compatible = "amlogic,pinctrl-a5",
> +                            "amlogic,pinctrl-a4";
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges = <0x0 0x0 0x0 0x4000 0x0 0x300>;
> +
> +               gpioz: gpio@c0 {
> +                       reg = <0x0 0xc0 0x0 0x40>,
> +                             <0x0 0x18 0x0 0x8>;
> +                       reg-names = "gpio", "mux";
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_Z<<8) 16>;
> +               };
> +
> +               gpiox: gpio@100 {
> +                       reg = <0x0 0x100 0x0 0x40>,
> +                             <0x0 0xc   0x0 0xc>;
> +                       reg-names = "gpio", "mux";
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_X<<8) 20>;
> +               };
> +
> +               gpiot: gpio@140 {
> +                       reg = <0x0 0x140 0x0 0x40>,
> +                             <0x0 0x2c  0x0 0x8>;
> +                       reg-names = "gpio", "mux";
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_T<<8) 14>;
> +               };
> +
> +               gpiod: gpio@180 {
> +                       reg = <0x0 0x180 0x0 0x40>,
> +                             <0x0 0x40  0x0 0x8>;
> +                       reg-names = "gpio", "mux";
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_D<<8) 16>;
> +               };
> +
> +               gpioe: gpio@1c0 {
> +                       reg = <0x0 0x1c0 0x0 0x40>,
> +                             <0x0 0x48  0x0 0x4>;
> +                       reg-names = "gpio", "mux";
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_E<<8) 2>;
> +               };
> +
> +               gpioc: gpio@200 {
> +                       reg = <0x0 0x200 0x0 0x40>,
> +                             <0x0 0x24  0x0 0x8>;
> +                       reg-names = "gpio", "mux";
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_C<<8) 11>;
> +               };
> +
> +               gpiob: gpio@240 {
> +                       reg = <0x0 0x240 0x0 0x40>,
> +                             <0x0 0x0   0x0 0x8>;
> +                       reg-names = "gpio", "mux";
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_B<<8) 14>;
> +               };
> +
> +               gpioh: gpio@280 {
> +                       reg = <0x0 0x280 0x0 0x40>,
> +                             <0x0 0x4c  0x0 0x4>;
> +                       reg-names = "gpio", "mux";
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_H<<8) 5>;
> +               };
> +
> +               gpio_test_n: gpio@2c0 {
> +                       reg = <0x0 0x2c0 0x0 0x40>,
> +                             <0x0 0x3c  0x0 0x4>;
> +                       reg-names = "gpio", "mux";
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
> +               };
> +       };
> +
>          gpio_intc: interrupt-controller@4080 {
>                  compatible = "amlogic,a5-gpio-intc",
>                               "amlogic,meson-gpio-intc";
> 
> --
> 2.37.1
> 
> 

