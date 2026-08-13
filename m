Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96366C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grCyy9zTRwg3O66Wp1XnXrxUOrpyGQzjNyhJ4w8cV/U=; b=vWFU1hsYyY5KTtHVoGzvFu5qpx
	03K4xqCpandEU3tBxxpVh6YDnkpP05PmFU1YAnc01C9jZLrYyiAO2E+H/DD8EEbHVS8ALzMsqus0K
	65GII+WtYzLOQ5YLRx4C3D6HoPaSMg1kvqViWieYnv/d6URr04QSMSnZx5H2O2y/MlbDLPpU2sQjI
	I7UOzYho1BKy5giKz32wv8oYSZN/cxA55sea8VVWGQwxqyF5zvd2EM2UuQ0HZjvCfCeAPpjfAQ/vq
	DiPNxpVbwZsNHRavlR/MIRmwmrC2Hpvr/wslS89IZuGcZ5ldKQhQhDqvx49I2+X73Y2IVNCkHZPPC
	NduS8jWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQz6-00000000BON-04K3;
	Thu, 13 Aug 2026 08:40:20 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQz3-00000000BMe-1OY1;
	Thu, 13 Aug 2026 08:40:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWUcj2dN7j0l/Xwf0hWCvn0L89s1qmKudATl/pM8ygW4l5We/BBW+BY4OYNbJdMd4ezoeYoZTiDgw5ZQKBCIKNqsSeiuTDPwjFym0pGUcHadTyyCFV0XYbmpDTNCtXnNZ1cbdozek0yTAmSDgdGiyL/KgjZ+FGtryixiC2JqvLEYZcL00CWcJbebW/EEeym4XzzlPfzX5ZF2hzo6+od8ZSYbDvBxPSWYBrahpFh7JZ8s8+fEdM/xcyU5ry7uAPs2J7Fy9UdbbM0fPUSEKsQaq59mWZhOVVxCRgduLEaItsWr7nVZDJQJ+pY4fhro/oGABsz9toMSWgrnjLiDScW0kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grCyy9zTRwg3O66Wp1XnXrxUOrpyGQzjNyhJ4w8cV/U=;
 b=EOLhk1nMT5tcHnj/kPmNRwW74YnIbwMUBFUgVW/xe5H9Zyx1EopWGTtMEjVwAMCAZNcm1UbvUt+dnzyQ4JWp+0LF2MEkBB3fXrQNGYix+EtbgAhkMkxI7uP+dKLUuVOLfc7yaeR1QcuVeyy5/aZVyy4TrOyxA9RBJTMczW/hM9LYgR3OlNBkDM1l6Fc0iuPzj1ujwnz8klQaIeZSvg1F9QtmbzeDoZq4uHqoX9aYNyZ+SSVShWLPsTuC5flfsJ8MU5ZrWdTQ3EGwNfZH1SlvoJkdsg5Jpw4pPymSALIUXY0aoLyvWZ6yN1rR8uzH4fdvWW639h7nI3QFeL24Fw4otg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grCyy9zTRwg3O66Wp1XnXrxUOrpyGQzjNyhJ4w8cV/U=;
 b=NM3e//pTbykOyh2lygGiao+HPwaamNmpH03nLINOo2De00sOFqZShjXRGBCXH6i6/+C9lsXd3eBeZPIe2h6lnIz8aOIwgwPOwq6Y+ioJrPiXB2P6Y1P+tmIakFztRsMBj1KwLs6UB0bsxpOwPvX84EUUwtodQ9vZMhXp+BoCngvA8DWIpRf3udpbDEoYsu7tOng94A7b/n1vwgVnu2t5Dl0EAqXYejgUYdC7mBvick/rvuPZAsTdeg+selsJZWYMxSfoksPWY2XRKfgg2m2MupBDHQkgTPruQxTkl1NJtqWFl8HPD59v3SiE++1o+m0Ohyi05UHRh8RKk3xjmRUP/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by PS1PPF8AB88AC68.apcprd03.prod.outlook.com (2603:1096:308::2df) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 08:39:54 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%3]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 08:39:54 +0000
Message-ID: <80e58bd7-7eb7-4d05-b309-115643767a43@amlogic.com>
Date: Thu, 13 Aug 2026 16:39:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] media: dt-bindings: Add Amlogic V4L2 video decoder
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20260812-b4-s4-vdec-upstream-v7-0-3fae085861bd@amlogic.com>
 <20260812-b4-s4-vdec-upstream-v7-3-3fae085861bd@amlogic.com>
 <20260813-rustling-sassy-terrier-11b99d@quoll>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <20260813-rustling-sassy-terrier-11b99d@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0026.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::16) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|PS1PPF8AB88AC68:EE_
X-MS-Office365-Filtering-Correlation-Id: 58720953-38d4-4ef6-d968-08def9167260
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|3023799007|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: MaKndnI14yolYzFxnJRk0oKNP6bLavoDj1xsCQLUu9FGUNNeRWqQiqBky6zDVzuiU6X1nXAY8LunnfVQaIR5qNwU3pyzUappEZ9lnClzYU1t2KjZCl2OGzBfAS6mSfqM5ssjjCwkeV3dqIvHnA9sKdX/InVbq6q1O/lceyM7R3uYjwpEA1HEbxB4362V3ZxlsZwe7tuFQuNT7vWehTCHkaWsxKP4nubHJOvT0F6yaSpOB5j9TfNht9HtCBpL2DT1blj/8P9c1FrYyvVw03qlw3ziWC7sBvFqXjOpqDdhz5jkZ4sotw+hV4PLH1tuRov00E/wT9oww+tss8+LorqWETl54ZiSxBEV8P7zVL0wB262+xA42gwd/2mKOpb9eZ0rPsB/IkAuZULygYaOEm1OD2rbMPnEVk3dZW01kIFVjvufG5jqIO9mDBatbfyvvqnECJbJ4T+BUQ62W60/GCSLxkv0aYw74jyQ14MMKz7iHddhaDYqyxnaxGPYUK2L4CX41mSOpyFuRJWbYRVGFIl3IrID4XjGkApuYAANRDMw5WnR0ml1GhWFHPYzE/29AtlzfS8mCEbOLO1uKcr3W6YAolsUO53ep7D8sD1UU2IfCWTIILfDT6bdwhblE3kt2dvT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(3023799007)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVFDaTNTSnVYLzNrbkh2M3V3Nk5JZkkrY1NCN0ErTU9ISU9PRFdaK1VoUWpt?=
 =?utf-8?B?MTNmYzhPTVpMb2NkbkUyaXNqWGNWWWVheXhoRTEvY1AvVkdwTytoNjZ3NWd4?=
 =?utf-8?B?ekhqNVdVV0VqQUd3QUN4eU1WajRKdnUwK2NOWUlkVTM0THBwVU8wY2NBakZX?=
 =?utf-8?B?V1V6RTBRM2lKQTFGcm5JbENpbTdBR2EyQTg3bFlyK1dIQ05LcG13UzdXZzZL?=
 =?utf-8?B?Uzc4L1hMcmFnbURBZ2xxdDJ4eDM5RXZxemJibFNRMHBubENQZmpXWk9zb2lN?=
 =?utf-8?B?K0JKYktOcW8yeWV5QnR1Mi9yU1pIcWtpbGFlVVllbmZxVE1GNk96VnZEbEV6?=
 =?utf-8?B?b1c5QjkvMkJBajJLeXM1NmlNZHVWQUpsanFrSm9keFhabk9LdTRrMG4xQ0Zv?=
 =?utf-8?B?YWE4dWZmdVBSZVZEdlJyUWV4TGZaM0Fta2U2b1JFYjh2N2YxN1UwWVBNUCtV?=
 =?utf-8?B?QzZCSUV0Uk41MzRMLzNaelZRcXQySUJGck1ySm55OVJhK3owYXlSVUk3Ykxv?=
 =?utf-8?B?RnEwVU83b1RrN0d6djFTcThhTE12VGtXZUJoU3pEZDU4Mm55WDgxaG5ndXZT?=
 =?utf-8?B?K3RRL2JvclZDYW9JcVp6OGF5WWdXcFRSbG1GMXVycFp5UEZlVFAwTlpmZ2NR?=
 =?utf-8?B?OFgvZERNcUhoR2pXS2dHeXozZmcwdWp6MlNicHBScGpyQzVxWEhVVlNZYlZ2?=
 =?utf-8?B?R3J6UkI0bWRBNDFDa3FwamVvQTZYU0h0NVFCeVlnWnAxNmhQMW9HeHRoU3Vz?=
 =?utf-8?B?Z2JHVnRJZzJ0UkJVMDJXWXVjQ3Q1anlETkhHTUwrSlFKb3V6eE5QRXRvRmR0?=
 =?utf-8?B?RThHNlYxNHNLY1AzRFNKdzRBTG5Hc2MraEpodWVBaU5YR2VBajY5aFRQdk8v?=
 =?utf-8?B?WjZtdmxDbFhuSXBZYzduV2tBOEFUVHlrODIwRHhRVVRSdzFZbVBZZDFMSW9y?=
 =?utf-8?B?bGptSTJzL3hFZU5NQWFETzJKK2QzTE41KytsSGdiU0ZwNU5rLzV1Y2xqU1Rl?=
 =?utf-8?B?aEVUNEkzdlh4TFBUVnpoWFhuVGZBRlpmaE1PSC9JbWdmSFE5ZGQxL204MEcx?=
 =?utf-8?B?Q04yQjB2UHlpaTQyemNiSnJWVXhTZGJwbVlYTG1YSS9SVi9aYTJiT3JvVExJ?=
 =?utf-8?B?dURwbWxWTXVPOHh1MHltSWQxVm45a3VNbG1neHQ1SXZYVU5veDdUaFVRN21s?=
 =?utf-8?B?QVFOc2hyRUM5MFVrSldkRTVSSUkzb2pVMklucjE1SkoyUVZ4cVZLWDhzUE0z?=
 =?utf-8?B?ZlpLZzNhU0NwVDNVN2w2TVkxMVl0QlA1UXhnOUsycWFocjBsR2plclFRMmRV?=
 =?utf-8?B?UHBUMkxyQ0VVS0pYQjlOcjNrWEZlNjg1QXVneTNsbVROcVFubEpYNVFvVVdp?=
 =?utf-8?B?ejhTemhWQncwVU5UUEQ0OENyVDBZQlNqbFlwa0I4TXZsTmFNSmhPS1hKVVRi?=
 =?utf-8?B?OUJGSFpHY0FsaTA0K24xUXBJa1RNd3Y4ekJuK1U5cCtsZWxrSElxb1J3RjdW?=
 =?utf-8?B?SyttWUxlc29hZ0NYRnM3aUY4NjA5SFpoTkFsbThJb0p1UHdrZ0ZHOE5Qd2dS?=
 =?utf-8?B?QjhYNlpLZDRPYi9xSVlGR3ZHUlNKQ1BCa0YxVU94WkxYdWxySWhBZHF2anlJ?=
 =?utf-8?B?alpvV0FBdEkwak1nMDRQRVp0Q3ByY1F3Sms4bGZmK3ZKK2E3cm14UThjNnFQ?=
 =?utf-8?B?dmd5elA1TmFWcklSQ0VKWExxT1dtc1dtNllUYU9HdWZuQ0hiSXFhL2ZvZE1l?=
 =?utf-8?B?RVN6UFVMZUh6RDh3SGpmb3Exbm83VUgrZFZGcEFBOUNRK29QMkVmc1AwbnRG?=
 =?utf-8?B?MVZKZGdqNkIyY3pwcjQzMHBMUHhWcEZUZmhWSmFZVlVNOGlIVnJzaGRLT0xM?=
 =?utf-8?B?bE8wVGlQdVdyeXdJRWtHSHlkZStnYmdnaXQ5K2FhVmpobjJhczg2TDd3Tm12?=
 =?utf-8?B?R1VDRVJkeFVqUTJFS0t0Z3QrSUE3TG0rYU10TXRCMG4yMUVwY1p2ZWMyaE83?=
 =?utf-8?B?WjlRclBVb2lTMVR1WEFnWGozWXhJYTNFVXdydWVFWjhuNUVEenNsVlRsM1Np?=
 =?utf-8?B?MkgzVlBqdURqR01PeExFL3k2OTVUWEowSmplMmVxUXBiYkhjNDRlUHlkeVVE?=
 =?utf-8?B?YUZwMTBUK2ZpWUo5dGJxNUlTdGNEdEhVNjZGcEs4dENMcyt5aVZpQ0gzNWwz?=
 =?utf-8?B?d05PN1ErR001OEFCbjVCak9lQmZwVFJMYi9TdDNPcW1SaHc1U3JJRnI3TFVv?=
 =?utf-8?B?MjlEcXVsMThlUHVRZjZmNlZOKzR0VHpZZmRLblFqZGpVeW9Ha2E5YWl0ZEpu?=
 =?utf-8?B?ZjlEOElUWnNScm40ZUhkREowbW5LcUtHV3JxdkQ0L1hHUUZrZk8vZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58720953-38d4-4ef6-d968-08def9167260
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 08:39:54.0703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OEjifFey5Pj8kGt+MlTFqv9fBQQiPGb4zHxanDDdEEH66i98XoBFll0v1zgt0/9L4GnwJrE7/OFsoy3j7oEjZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPF8AB88AC68
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_014017_393144_34BBEA7C 
X-CRM114-Status: GOOD (  19.48  )
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

Hi Krzysztof

> On Wed, Aug 12, 2026 at 10:41:25AM +0800, Zhentao Guo wrote:
>> Describe the initial support for the V4L2 stateless video decoder
>> driver used with the Amlogic S4 (S805X2) platform.
>>
>> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
>> ---
>>   .../devicetree/bindings/media/amlogic,s4-vdec.yaml | 111 +++++++++++++++++++++
>>   1 file changed, 111 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
>> new file mode 100644
>> index 000000000000..b5af3f931b26
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
>> @@ -0,0 +1,111 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (C) 2025 Amlogic, Inc. All rights reserved
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/amlogic,s4-vdec.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic Video Decode Accelerator
>> +
>> +maintainers:
>> +  - Zhentao Guo <zhentao.guo@amlogic.com>
>> +
>> +description:
>> +  The Video Decoder Accelerator present on Amlogic SOCs.
>> +  It supports stateless h264 decoding.
>> +
>> +properties:
>> +  compatible:
>> +    const: amlogic,s4-vdec
>> +
>> +  reg:
>> +    maxItems: 2
>> +
>> +  reg-names:
>> +    items:
>> +      - const: dos
>> +      - const: dmc
>> +
>> +  interrupts:
>> +    maxItems: 2
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: hvdec
>> +      - const: vdec
> vdec is the name of the module, so not really useful name.
Ok, I'll come up with a new name and change it in the next revision.
>> +
>> +  clocks:
>> +    maxItems: 3
>> +
>> +  clock-names:
>> +    items:
>> +      - const: dos
>> +      - const: vdec
> Same here
OK, but there would be a nit. In file 
drivers/soc/amlogic/meson-clk-measure.c, This clock source is also named 
*"vdec"*in|drivers/soc/amlogic/meson-clk-measure.c|, where a 
*"vdec"*clock node is created in debugfs for checking its status. Using 
a different name in the driver (including DT and binding) would make it 
inconsistent with the debugfs node naming.
>> +      - const: hevcf
>> +
>> +  power-domains:
>> +    maxItems: 2
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: vdec
>> +      - const: hvdec
> Same here.
Ok, I'll rename this.
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  amlogic,canvas:
>> +    description: should point to a canvas provider node
> You basically duplicate the property name. Say something useful, what is
> it used for?
I'll update the description to explain its usage in the next version.
>
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +
>> +  secure-monitor:
>> +    description: phandle to the secure-monitor node
> Can a property whose type is a phandle and is called "secure-monitor" be
> not "phandle to the secure-monitor node"?
>
> Write useful code, not redundant.
Okay, I'll explain it more detailed.
> Anyway, missing vendor prefix as it is not a generic property (otherwise
> point me to generic schema defining it).
I checked the upstream code, this is not a generic property. I'll add 
the prefix.
>
> Best regards,
> Krzysztof

BRs

Zhentao


