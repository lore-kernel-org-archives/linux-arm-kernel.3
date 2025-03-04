Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0483C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 17:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZHmSVz6uK2uMfG+roJHK1PyFmS0ZcFG/mtG50FhAWY=; b=ZGm9svWXbE4LxJhRYm+jx8HPs5
	zqws0/562YGk0BDvxN9KdGY9t5kmnkMg9Sf/WB/Dx+0vSPhiYQ+Uf5tUz/ASGG3QQluUsbH3mbf5R
	y4KRLkANNSxHi7oFZOsbWhR309VfCMXCfSKmyGp+R+Fg8qrmRC+CE+biI1HuU0imm2JFYT+NzY0Xz
	Gpcdp3peyT/2S6K+dTOSmjzJQGqdanPR2CoQZZJopUUxym2gn+xdrELf8GWPWLDWAuSruvpeyVUA1
	+YTZzZX6/sWtPtA/tlvr2cFXzSGdbuNtQOxCtq/qTsFUiJr0CPLoj0fKbmb1ecVSa1kRv/04xHUoZ
	7k2LDaEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWCp-00000005fHQ-0mTD;
	Tue, 04 Mar 2025 17:37:23 +0000
Received: from mail-db8eur05on2062b.outbound.protection.outlook.com ([2a01:111:f403:2614::62b] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUrW-00000005MqN-38UI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 16:11:20 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=PnhJ51WXU07K9g6xoj2F4inJNil9qAu8HiZS5VmRLtD/YPyYncb7rG0t07Imj6UdyeZZM5U6GPtvV8g6d/Fd5hE3nDKQkPy42etf9pwCcsYo1vMrXOUCWJrQqp+nJNjpbiW+Ct4Gp7EjU/bZB1eWSx769YvwrDvuCZrrD6Rg2Hcou01iqnV3T1Stm8hzGzqMg485rS1RtLhRbIZsVdSRak14f9HEwAjai2LlEt1uVNEzkSWXmIGpqN7W5kx7t6WDnj7JUt21ypBMcIAVzqjE5YAdGyP8g5Uuy2ViJIQ1xVUAXXu15O7OcMKZ0Iv8jWCNjZHwfezwZAqedCusWT0XEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZHmSVz6uK2uMfG+roJHK1PyFmS0ZcFG/mtG50FhAWY=;
 b=rpgBCOEf5FQpXA9vySZxgiNscEcMpnWc7PfdhZhwFvgPO+IQQrBa2gkYMAydWMJc5ges52Z8JBi0/q/hSJ9yPO+BquAyP7J9dycSUqe9rgHCyLjN7P+tfNtBRZba1lJGmNYcE0FZ2kesnn1+HOnatwLPeYDlepZmGXiIZ3vJCurp13Nu5OzRhKt2Ll0HX13Wbrz8uQJ4RuPhYCr7Tt0kQbPOhhiSIG9Lbjmz7dyQCUaoywTd1mfO8fIPicHh5C3ByAon21ci5hD8W4l3xPrMbfM1GeQ6GehQyvDecF2XNjWtPvsKIMvtWAqs2Fm/gkk8Yi37M9devD/x2K7S0otXpA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZHmSVz6uK2uMfG+roJHK1PyFmS0ZcFG/mtG50FhAWY=;
 b=nYXfU+CuTLJEmoC5dby8zYmZ809Pfxj9aTrjbX6N9rndbErMMc0suPmvE3rtW6Gu2i3ya8Emg2gCoUWiKAJpsNKV3LfrgopbJLLfD+U7UqNGg1UBBfUcPbvOsp3QnaMkdvKUadux4e9QqGbIxgZgRgvjxvmyBPGLZursKIQnmb0=
Received: from DUZPR01CA0323.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::24) by VI1PR08MB10174.eurprd08.prod.outlook.com
 (2603:10a6:800:1ca::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 16:11:10 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::19) by DUZPR01CA0323.outlook.office365.com
 (2603:10a6:10:4ba::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.29 via Frontend Transport; Tue,
 4 Mar 2025 16:11:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Tue, 4 Mar 2025 16:11:10 +0000
Received: ("Tessian outbound 0a056dca8bdd:v585"); Tue, 04 Mar 2025 16:11:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ab2c3f558ed2b790
X-TessianGatewayMetadata: ZM1owvzes7hdsnGp3gAbWUwVEiC5DxCzzQcxxNNNG4R1ZUJSa+0udjexHLjlWbWlR0R1fhBgQyeS3STYMpV2iJ/EOJb7Rw9qaDqRRBdStut5bfY/OkzhbGJ7sPNr6UWHEmWdcKUHxQlYelUJH9Gffglrie16SXqUFQhlclKq5E0=
X-CR-MTA-TID: 64aa7808
Received: from Lcee1ae4d5ef6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E282C6D3-AF08-4B01-989A-80132F211615.1;
	Tue, 04 Mar 2025 16:11:02 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lcee1ae4d5ef6.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 04 Mar 2025 16:11:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=shtb1ZGgkHCCVQUB8fl7k0R8uwjmJEMTDnym2AYaIEMgnkxOpZmkUMpNVO2tcZ8cmM74w8BH6VE6ASmeBpLiefT4E2VpV7lR6aQNtHm6gMgpoWvmREmAe3Lv440JmBmTf3ff5P8dHSj+qiYphregJ9aD/CGEidljo9XxC9NSDjW0YbHkcYj1ZVeKl29L/tycf5yAKvjs9mqvcuwiRGQvupGGos6tDXMcNdFUn5WJ2+cYuoCZk2PgWbj3tRy4YU1YKvjBPQ23uRSeb4/ackZ8/a4vUVL+NlYlNmjkZyPR3COJCKi84mnTU2rqujKy+0aI3sLEsUwSDATwqgxTPQmxLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZHmSVz6uK2uMfG+roJHK1PyFmS0ZcFG/mtG50FhAWY=;
 b=K0uA/rNaHp9WYSoJyDpMuIWvY4WRXtC1dN2PEQATFDd3aNFV1iTcXIHN/phgF3TH/8rKdPbZCNL7fZoQyslQgZezO0Xtu9FhMNIfjkQaxhnmPagKv/jCWigfLnkL9NlAT1cmgxg8I0vymGV6s7m/znJqZkm3d2CDV8aXIg2FMDj3oXHAI9QUEOsLsaQ2pRKMnGuDNYAvsMTKEfBZt9M1ICzYi71cOnfsChBwl+ZxvGZ3DpWpBZTG+tGoXO6D2JZ/jhMI7I1qgRBhDdOECSj9myPf+G09Rt66ys4aQw/cbu0UdvUn/f9VZGIAukr+8C1WNAZYY55iK71c/9Uo19oaDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZHmSVz6uK2uMfG+roJHK1PyFmS0ZcFG/mtG50FhAWY=;
 b=nYXfU+CuTLJEmoC5dby8zYmZ809Pfxj9aTrjbX6N9rndbErMMc0suPmvE3rtW6Gu2i3ya8Emg2gCoUWiKAJpsNKV3LfrgopbJLLfD+U7UqNGg1UBBfUcPbvOsp3QnaMkdvKUadux4e9QqGbIxgZgRgvjxvmyBPGLZursKIQnmb0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GVXPR08MB7727.eurprd08.prod.outlook.com (2603:10a6:150:6b::6)
 by VI0PR08MB11061.eurprd08.prod.outlook.com (2603:10a6:800:257::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Tue, 4 Mar
 2025 16:11:00 +0000
Received: from GVXPR08MB7727.eurprd08.prod.outlook.com
 ([fe80::9672:63f7:61b8:5469]) by GVXPR08MB7727.eurprd08.prod.outlook.com
 ([fe80::9672:63f7:61b8:5469%7]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 16:11:00 +0000
Message-ID: <4e0959e7-cb66-41f1-b686-a274b6cbfd2e@arm.com>
Date: Tue, 4 Mar 2025 16:10:58 +0000
User-Agent: Mozilla Thunderbird
From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v15 04/10] Coresight: Introduce a new struct
 coresight_path
To: Jie Gan <quic_jiegan@quicinc.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
 <20250303032931.2500935-5-quic_jiegan@quicinc.com>
Content-Language: en-GB
In-Reply-To: <20250303032931.2500935-5-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0065.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::19) To GVXPR08MB7727.eurprd08.prod.outlook.com
 (2603:10a6:150:6b::6)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GVXPR08MB7727:EE_|VI0PR08MB11061:EE_|DU2PEPF00028D02:EE_|VI1PR08MB10174:EE_
X-MS-Office365-Filtering-Correlation-Id: 89690fcd-70d3-4c16-363d-08dd5b372d99
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|7053199007|921020;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?aVFGbURoV2RjODI4a0hra2NIRFFheUE2NFlOS082TUxrdzhPMFJUMFJXRTdn?=
 =?utf-8?B?WVhpZTlPZVVKazdaUTRZc2d1dnZvOERPQ1A0YnZwWklYdjVZVjlqOTd3UGUv?=
 =?utf-8?B?L24rakQyR2l4c2lvdVMrNEdmOFFuZE9TV2tKNm5SWmVVUG8vTlVLMFAwZGx6?=
 =?utf-8?B?UDlVNzYrQk5WRVhEek4vdlRMS0hQcEV4ZUs2UDM0NGw4M013NUU3c3ExVTV5?=
 =?utf-8?B?ZE90ZjFXcllUcU8wTE9vT0hpQ3lRMTBRWm8yUVFFQS9SZDJYUEhjYURFMjk4?=
 =?utf-8?B?b3phWFZ5bEFSTXVUMkFZYVJuWkZnbmtrUkY0TEdoZTFZYjMrNXoxWlNNZ1lO?=
 =?utf-8?B?YVJKT0ZuMWlIRWRBem93SFAxZGppc0VEVDdnbHo5SkFNZ2QwdVk4N2hwYTVP?=
 =?utf-8?B?SEpJUTgxakZLVUFJY0thaU1RYlhiSVRQa1llRmRmTlFUMDMvVFNZV2lzaHdt?=
 =?utf-8?B?c2E3QUtsb1lpMGZrU1ZLOVlqNlVjRHNWZlZDQ0pYTG51K1Z0R0xNT0ZobnFv?=
 =?utf-8?B?cTNaVXRnUjRCVm5iT3E0WnlObDc4WEluem5rZ0IrdTc0bnJ0Y2twMU5HTXFB?=
 =?utf-8?B?dFR1NVJqanB0b2htNFBka3NSeENQZ1FBWFY3SzJkUktMRk5DTVY3UXJXSlQv?=
 =?utf-8?B?bnI2YmZxdWk1R2dKdFhCRWwxTUdsa3FWcW5pVGkveWtFWUZDclg0Q3MxV01y?=
 =?utf-8?B?VnNhMWxRc1Y2cGJydzNmQmQ0RUFTMXVxZGlrcnhQZFQ4MG5US2FKV0tKV2FY?=
 =?utf-8?B?b0RJWnhZWmtHK2h6SThncVVGNVhlbG9tbDRvL0FSWjJpVTFtR3ZlNCtDZFFk?=
 =?utf-8?B?dzR6R1N0eGc3NHNVczdwMmtpN1VKaHlNVGMwcEVhK1U5aEZtTitELzNZY01G?=
 =?utf-8?B?TnRFS3ZLZjAzTEVvaTdxVVRVWHRnR0lDc0pUM2NiZTgyRzJpTDhzTGZOaTEy?=
 =?utf-8?B?RHhqZ3NoeG5YU3JETWVSaWxrdmNzVHFWNDBCMFNjdzJGb0tOdjkxam0rVWhR?=
 =?utf-8?B?OWRZcEhpU2xhR3JzbWhTUXdKMHk1MndKbTV1TkJBYzBIZ3NaV0JFVU91SlpN?=
 =?utf-8?B?dTQyNTczcTNGUnE3UVJ2cU5hMHVLMlpQdmZDWm5FV2ZqNFF5a3R5bVNWSGlD?=
 =?utf-8?B?dDBUcGxmSUNBdUl3RWdKYXhFTnJIc1JlWHh3bGZoc0ZweS81UG5FTDZWdDVN?=
 =?utf-8?B?SlBpZFcydEgzRm5iVzlkUWVKU0U5T1M2YStLWjZnQ3FMR3E3b3R4bGZrQnQ1?=
 =?utf-8?B?d1JVTk14YTA3eGU1OWpvV2xkVWQ5WnR0Q3lHTWoxcTlodUNNdnljcjJaOUJK?=
 =?utf-8?B?bU8xcm95NE8rMk1JS3ljT1dubmZScHFXall0Z25HZ2lJdUpsQXI2dGVTQlRO?=
 =?utf-8?B?NEgzQzh1bEVOMHhoRVJkOHNkS3hKK1FxQVJVTUZETXpEWXAvdDB6VTFYeHJr?=
 =?utf-8?B?Z0ZSek5ueTVWK0VBV3QwN0lwTVFmVmdDTUdONVRuTWtQQmFCR2RrYXcrRW5i?=
 =?utf-8?B?dnRzV1JJZ0l2czdXUTV4eFdNWmtNeGlnTFFWanlqZTcrL3U4S2RXc0tsbWkx?=
 =?utf-8?B?K0QvRWpTemVvdVQ0SWlUOEtRUFBlUmZoeUdoT05JZHBWQ1VqSk1tb2hwcTY1?=
 =?utf-8?B?VUNRbXBlR0xkcnBORHlESkdLRG9pWTNZZC9UQS9RNlVBaTNUdkh6RTZ3VVQr?=
 =?utf-8?B?amRsSkZIZ3UwZGg5bmY1MUJsNVRUcDhsQTg3dW5hWlNBRUk1YndseExscG55?=
 =?utf-8?B?SllBYzd0cVBnZTh1WmUrNEVWZlFFN2F5Z3Z4YWI1NDRFTEEvcnJDVzB6NGZ0?=
 =?utf-8?B?RU1LMXMwdVdReTdrMEVOVitzejFlTmFWV3V3UTZZQ0xzRVZTN1VUSE95TUZE?=
 =?utf-8?B?ekpKaEdnZDdkYWx5bkdmNTl2bUtQamNRVFZuaFB6bDBRdE1pZGV4MEw3cE1R?=
 =?utf-8?Q?8b/bhDw2LIo=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR08MB7727.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11061
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:6b::6];domain=GVXPR08MB7727.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: d796dd75-28b9-4788-a101-08dd5b37279a
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|35042699022|36860700013|14060799003|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUwrU1pheG1oUnFiclM2WFBmY1Jmby9LUUx5ZG5qRW8rUkhabytZUytxR1BS?=
 =?utf-8?B?UW4vYzRDdHR3VWVNMytQb1ZnNkxYeEFHY3JVTkVvcDdGVGtKVDEzeHM2Tkhl?=
 =?utf-8?B?b3RXS2FrOVh3aXFYRVppbk9DT2xjaG5RR1lYekY5Y0RZL1d3S1hnZ3oyU1Ni?=
 =?utf-8?B?ZTlGcFhmZkw4ZVhyKy9WR3ZnRDlxT0pNUVU4Z2hwVWRNdDJwMWtYQjNkblVy?=
 =?utf-8?B?dElYREVWVUpMRmVRWVU0eVgzemRQakdXRHJlMk1lK2pWcGVaZlNjYkFHWHh1?=
 =?utf-8?B?R0syaGRwY1RIVlgxZGpNV0pDYWpNbUcxcnhNR2pNYnNvc0lxeWNndk9NTWhI?=
 =?utf-8?B?SlJtZXpxb2QyV1NJNGJXRFZucWlKS3FZR1c4bDVSNEVtRUtFSXpmbnRnV3pV?=
 =?utf-8?B?QWk2T3ZCSk5NdUFmWVIxa1JUTDFEVHM1UjR6Z1RNWEw4cWliRDBLM0hIZ2hU?=
 =?utf-8?B?RDBKQ2RKUVQ3QmxWcERBci9vdW5MRDZESHB2NVBzZGtHc0RsZVdUWHJGRkd4?=
 =?utf-8?B?c2c2MlpEb2RLK0tQRkNrWklSdHA2aUIybUdDZ2wvVC9ZdDF1dGsya1hITllP?=
 =?utf-8?B?dldhMFlQczFPQUVrSFlOT0g3VkJBKzNuNjhDM0hIUnhta1h2d3FtWHc0NjJB?=
 =?utf-8?B?cjdrY210bGlxZ2xCYkpFYURoWTJ2a2xaa3ZxaHZodEhZV2VpVTJWMkhhVUtq?=
 =?utf-8?B?UlE3WXVZTEFaRzNFYVlVRkt5NWVQNkIyV2FyUzdiTE8zMTIwbzBabDJaNndP?=
 =?utf-8?B?aW1YT1VNVmN5TTZqbFNBN3ZaUlJYdlVxV3lzeXFrTUZzR3dFZUpMQm1zeWx4?=
 =?utf-8?B?TzkrRGpleHlLUGFTWlFqWmF5MWJtVUtHdFQvM3NPMExZTVlMdFhoTS9WbGNi?=
 =?utf-8?B?OGJwOEU2T0UxcTRVVWEyVHhLTUQyLzc0dVB3aXRDVTUrclRzcFkzTHAvbkFo?=
 =?utf-8?B?YmlKRU81U3JFUS9ETFBRS0tXK2phVWhIcEJVWGVQQkxRTDl3NExDQW9nVGhs?=
 =?utf-8?B?bk1CUkllSlJmNmhwdEo3RktKbk5xK2JnbXlLNU9NTjhvbU9sZ1d6cUhnNksx?=
 =?utf-8?B?WTdUY1RWYnhYRVBDMVZLWVdydE1WZElpTmRJS21jc0IremZLT3hJVkRraWho?=
 =?utf-8?B?VGhFT0h1ejZicG9JaWxGeWVpV3U0dGdLdTRXQ0FjeUZjUVh2bzdxcmhuQ1JB?=
 =?utf-8?B?ZXNMcWFKTkNVSkRMMG5NVVFvbEFhQlNkY2NnWWsyMjVLdjdCeDFMakx1K2F6?=
 =?utf-8?B?MVk2QklsdmZOdVZDcC81blpCWXVmVjlxR2pqWk9abVZBSEdZV1grRFd0SFRw?=
 =?utf-8?B?SU5NaExidEgrdHlPbjV0Wi9XMitGTlc4cWtyK2lpZTMrSTFLSjZNWmZrU29U?=
 =?utf-8?B?ZXVOZW9QUHdBTEVXNm5WQm1TamZWTjBLMGtSM1lMMFR6M09qNlFSYlc2WW44?=
 =?utf-8?B?U3Avb2hQRFZRaFE3c0k1U3gzbXFSWmxpQ3VENDBvZk5LOXo1VWR0aDdMZWdw?=
 =?utf-8?B?SklhZ21TV2l6eHNNb3Zmdkl6WHRYZm16eUJZeTlDb25FMlNudGRxdlVMTk42?=
 =?utf-8?B?SE9saTlhTm5rSytnYXhQd05Od3hKSHBab0hydE9uWlZDalZIRkYxQ1g2Z2tw?=
 =?utf-8?B?ZS9GSWFKRk55M1cyUEE1bGIrQXUwSTFLVFFPQWhnWDZoNy8wRUVDMDEzdjdm?=
 =?utf-8?B?TDB1NTdveXMvdnRDRHVzaERObTNHZldpdTR4OE56WFNnWFJRLzRCSjNCaG1N?=
 =?utf-8?B?ZXhRclV5WDd1Y0QrSm11empaMnJmVnBQYjdWbVV5RkN3Q24rMkhJRGxtQkVn?=
 =?utf-8?B?UktidjhzcXFPTFhVLzdaaGJiOXAvKzJueDF3NmR5ZStMQVgvczdZTjFVbmhS?=
 =?utf-8?B?cjZHOVUyb2xvK3hlQ3hNY2FXZEFhbFgvSW0yS2M4czlMREVJYmFnbTk4ODAy?=
 =?utf-8?B?Sy9jV1FwOFJXTElNMVpQVHRzY1c2ZXRiL2JtdzJBTEhUQnBBcHdnU25UTGh5?=
 =?utf-8?B?bzB3ckoxYXM4VnAvSFlkTkhVUUxZSFVCMGlIVXhSc1d3ZlN5VThxV1hkZ0pz?=
 =?utf-8?Q?AJWG9q?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(35042699022)(36860700013)(14060799003)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 16:11:10.2666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89690fcd-70d3-4c16-363d-08dd5b372d99
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_081119_001572_9F3C4D92 
X-CRM114-Status: UNSURE (   7.84  )
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

On 03/03/2025 03:29, Jie Gan wrote:
> Introduce a new strcuture, 'struct coresight_path', to store the data that
> utilized by the devices in the path. The coresight_path will be built/released
> by coresight_build_path/coresight_release_path functions.
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c  | 16 +++++-----
>   .../hwtracing/coresight/coresight-etm-perf.c  | 30 ++++++++++---------
>   .../hwtracing/coresight/coresight-etm-perf.h  |  2 +-
>   drivers/hwtracing/coresight/coresight-priv.h  |  6 ++--
>   drivers/hwtracing/coresight/coresight-sysfs.c | 12 ++++----
>   include/linux/coresight.h                     | 10 +++++++
>   6 files changed, 44 insertions(+), 32 deletions(-)
> 

...

> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index ce9a5e71b261..67cf8bdbe5c0 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -329,6 +329,16 @@ static struct coresight_dev_list (var) = {				\
>   
>   #define to_coresight_device(d) container_of(d, struct coresight_device, dev)
>   
> +/**
> + * struct coresight_path - data needed by enable/disable path
> + * @path:              path from source to sink.

This doesn't match the actual variable below.

> + * @trace_id:          trace_id of the whole path.
> + */
> +struct coresight_path {
> +	struct list_head	path_list;
> +	u8			trace_id;
> +};
> +
>   enum cs_mode {
>   	CS_MODE_DISABLED,
>   	CS_MODE_SYSFS,

Suzuki

