Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C73EC02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 20:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0C1pdnIBazGJ5kTMuCiNNnOGr2jrVCJHgeiK6ubzIj8=; b=ae51xTPH28pvwAHMHOwj2odWgN
	Fo5oZ3Mza7xLDlulWHMTtPu1i5Evc09U25jZlali3mspm8CgR+eWNImEdzlsUiT1qf1SujvPg5Tsw
	qIuIJYLEISewE7C0RoUhPbom2u836g/+mkLxNEoti7Krkexmvz/fesNrwXAkeLJxlBwvdEfxJXepW
	b2jygiWGNQ/c7sDaE0mVg6RW+Rnpj0XgO6PbrTqVG4ymk69EQY8MFUAgLNqLodUv0vvU84pD50j8N
	ym3Q37cxhWPvCUP6CunlyBkxf6NZVn1MTFq2NtvVtv5tRtRulCtb1WZG/5uvGBNWwP11HR4/0Boli
	bxSW3xnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgV0d-0000000B6fk-0h2k;
	Fri, 07 Feb 2025 20:31:31 +0000
Received: from mail-am6eur05on2060e.outbound.protection.outlook.com ([2a01:111:f403:2612::60e] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgTs7-0000000AsYx-2NsO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 19:18:41 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=M9HjuXiZ1lWClTUoas8tw5Izbya86JKO3AESEN2ab1LZ0dJWKhH7FVUnSrmiHHtPNA75tXDLqYDvLxPo/a0/jMpZ0rvEj+SRx0/H3xpmcsWq1iRRE9fmM5usO47hQ2VB4zlgXLN9bFagEDDwBrGBe++Sl6mkWgF/Xp+R799PKGrjqdnRHkqer7OY+wshME6xYLR6W1A9xRQq85jOOMGzJ/ag/hWgZ/XQ9iSjKYh8YGsVeVxAhl7jk40whdLmD3FSySrZfRd3Q3nmu1GF0ZnKalVU8dVRdHU5QrU+w5VbxMyXNQv6FqapIjsrAK79tQc9veKCPzBXx/bl+8/oA6HOqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0C1pdnIBazGJ5kTMuCiNNnOGr2jrVCJHgeiK6ubzIj8=;
 b=bESj/i7dvlLLasWQGM8LdmTNK85A3NcSf4Xwz8ZdD99fXG1Z+0KS8ytpu/tcP4rmBC5ES4kqh1xN5HBrWYAs1GSphl4KHpphA5crJ7iLaLgt+iOC0z7xE5V6NuAOQDMbn0WfP32yaVzDDsWaortsYRtccKGMt7T1Xirtwjed0zw/UM2ekNmsMrHVvnTvv4waB0bWtGh6GGg3Q9hc3gGvk+bz0C3M+2MhnvgdoqpRKWiPXNFBkGkJnGBMsS6pcUD4G+YfYeuBthRaPcIZk1UzvLotir1Lx8bxPLpUmVqklCo73xez0AdseGV9mX33j3oYKJxQAdafo92QQ5u+42f+yg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0C1pdnIBazGJ5kTMuCiNNnOGr2jrVCJHgeiK6ubzIj8=;
 b=HMZeCR7n+9+9mUGiyFyQPCiASfsS+l9L8Y0glQFRwbXcIZ49O6l6xE79khIE+9vkUiouCF024mPdcmdiS5ojYVW7tJkArO6KCJQ7liUfiQPV5cddalgsF6fuJoHRE+otDYznHzT4S60wzQZoQCnPgUThrPPT+5AsNGrswKGVF7U=
Received: from DB7PR05CA0038.eurprd05.prod.outlook.com (2603:10a6:10:2e::15)
 by DB3PR08MB9135.eurprd08.prod.outlook.com (2603:10a6:10:434::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 19:18:26 +0000
Received: from DB5PEPF00014B9B.eurprd02.prod.outlook.com
 (2603:10a6:10:2e:cafe::1a) by DB7PR05CA0038.outlook.office365.com
 (2603:10a6:10:2e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.22 via Frontend Transport; Fri,
 7 Feb 2025 19:18:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B9B.mail.protection.outlook.com (10.167.8.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Fri, 7 Feb 2025 19:18:25 +0000
Received: ("Tessian outbound 31e949b9df6b:v567"); Fri, 07 Feb 2025 19:18:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d195c47640a804fd
X-TessianGatewayMetadata: RVcM+2kEFlKO//cRfylcSxe+dv186kRKi2mrtFDdFIwxZsyA63dYnINapg618eN6z3ArvB9CQlwJPmSUiU5794BYjFPGHR17ZZJ989IlUX5WiPLeO5SHdF1ooi6hN8wR2WjZ4/GuJ91WZcN4hVGZy/YEueLvYMYGYerUUj9wbcw=
X-CR-MTA-TID: 64aa7808
Received: from L3f283fb91734.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E07E2323-8071-4F6A-9B9C-3F3ACE6B1B52.1;
	Fri, 07 Feb 2025 19:18:14 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L3f283fb91734.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 07 Feb 2025 19:18:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+ScWfeA6ZZwnFGxwjct7ipz91CQAsbXE0t/Pbbpce2J/wlrVJym2ke7fOAr9IWHO122PLbQMixDJNd3Yh28afqizxJTKITbnL2GYDsB+9VQs3N2sXJuVsHUdtuQ3wEoB7Y1Z/3AGppr3PV4l+Z9Xjd0P9pRr8L1TI1yeFmv/zLXK57KJNcW6sOH2cnOR7j2fGi+YtOx0P2ua9N746MvoJjp7x4M3VP6SyAv8bIQxdTNcUqVVMv7MDtmNLM3w7clDRWSGeD+rhZY+9YlWjnR+8np01+uAEpMkfwrDRCDUJ5eZ9qqdLrlJ/xm4+Nqunx9rSzrwez0GPwuTj084mGcPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0C1pdnIBazGJ5kTMuCiNNnOGr2jrVCJHgeiK6ubzIj8=;
 b=gz/of/Q3gLkosIhXwcdqim/G83DWq68GyPyyQEeCTFp4oSxk2OmUi+CGpTMQJrGrWMUgEZ+MenzMUfQHur/uoxRzs6amPcgc9Fvv/tZ6eUXVGL6VtO5ZNQCC89FbdGY59P+A/36DIcoZ+LVTNAGVpy9Jh282YpNO92pwiXf0wtnvG27ELc/lQ6bpfkXJ2JAutqGAaStZYtKDVx4E0d16B116sj6mzyHOYDYEKk+MuLQG462A6luPPEE60xWUmU5BaKwt8SVLEhecGlfuK4tu8LQl/LIIK3AA3FqXu+Thhb+9NjmeevHBkOaMU3RDve3vO041JoloEMlcNGr0q19EOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0C1pdnIBazGJ5kTMuCiNNnOGr2jrVCJHgeiK6ubzIj8=;
 b=HMZeCR7n+9+9mUGiyFyQPCiASfsS+l9L8Y0glQFRwbXcIZ49O6l6xE79khIE+9vkUiouCF024mPdcmdiS5ojYVW7tJkArO6KCJQ7liUfiQPV5cddalgsF6fuJoHRE+otDYznHzT4S60wzQZoQCnPgUThrPPT+5AsNGrswKGVF7U=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB9PR08MB7584.eurprd08.prod.outlook.com (2603:10a6:10:308::6)
 by PAXPR08MB7442.eurprd08.prod.outlook.com (2603:10a6:102:2b8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 19:18:11 +0000
Received: from DB9PR08MB7584.eurprd08.prod.outlook.com
 ([fe80::5144:343:7017:bacb]) by DB9PR08MB7584.eurprd08.prod.outlook.com
 ([fe80::5144:343:7017:bacb%5]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 19:18:11 +0000
Message-ID: <92a463cc-608c-4efd-ba78-6da74b99b08b@arm.com>
Date: Fri, 7 Feb 2025 19:18:08 +0000
User-Agent: Mozilla Thunderbird
From: Mark Barnett <mark.barnett@arm.com>
Subject: Re: [PATCH v2 1/5] perf: Allow periodic events to alternate between
 two sample periods
To: Rob Herring <robh@kernel.org>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
 namhyung@kernel.org, irogers@google.com, ben.gainey@arm.com,
 deepak.surti@arm.com, ak@linux.intel.com, will@kernel.org,
 james.clark@arm.com, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 adrian.hunter@intel.com, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250106120156.227273-1-mark.barnett@arm.com>
 <20250106120156.227273-2-mark.barnett@arm.com>
 <CAL_Jsq++8-yadgbyTvNZkhML-j73UP6VS+qiaD3gQB=rc=w08w@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAL_Jsq++8-yadgbyTvNZkhML-j73UP6VS+qiaD3gQB=rc=w08w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0135.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::10) To DB9PR08MB7584.eurprd08.prod.outlook.com
 (2603:10a6:10:308::6)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DB9PR08MB7584:EE_|PAXPR08MB7442:EE_|DB5PEPF00014B9B:EE_|DB3PR08MB9135:EE_
X-MS-Office365-Filtering-Correlation-Id: ffa2498e-1c83-4689-7215-08dd47ac3241
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?cEpEa0RtTU5NM0I1RitBY0FuR1JSK2NvVzdMUHpBZ0pIN09SalZJZEk4WXNB?=
 =?utf-8?B?RUU2clc2L3E2bUNKZG5ZNzd1K1JKZ09IUUMzWkpZcXdmWXgrNXBHWi9xYVIv?=
 =?utf-8?B?eXVZaEhJT1MweTFDdnZRenFrdW0rZEF1YkhvdjEvQkgzRm9BaUdlcTdabnFB?=
 =?utf-8?B?aHMwOWIyRUpzaU1GNVpmQUVmOU9CL1VYck91ZXJDWHd3VlZzanpCOUtKMDdG?=
 =?utf-8?B?MlEzaytiRU91TVJoY0Zubkk0VDRSUHRONkoyVENQY1JqdVJTem8xaS9jaVI1?=
 =?utf-8?B?UlNMcVY4Rjltc1Q1VlhGSzJ0eEpEc3cwNll4NGpxTnVFNDVZQzdtY3pVdjQ2?=
 =?utf-8?B?aDgyZEZqWDVOYzIxYzU5cm1MaENPc2NSWE9DQ09uLzhNaGREU3NHSW1RbVVR?=
 =?utf-8?B?Ukx1dWorWWVUTyt4dGJWUFpPY0dYSDM1RUR1R09kcHN3QkZ6cWFkTzlrZU1O?=
 =?utf-8?B?TzZzTitmem9tYjZjM1krMnVMZjBPeVVqeVJvenBWMlBLN09rMEhneW9nK0F5?=
 =?utf-8?B?dDVnRnNpT2l0NVJhUFFNQkxRV3VKdFlQS29xSit6NHZxSHFFaHFQQm9RYkFk?=
 =?utf-8?B?Ti9tSW8yQjQ1S0xPaDZMSStXeWM1dnlYZFZqRG5aT2lvQWxEOW1EeitQRDhp?=
 =?utf-8?B?MHVDRkZsb1g3N0lUVGV4NjNJNkNwb1lZSmYrenUrTm9kclA3akgweForUjdR?=
 =?utf-8?B?R2N5b2dUclJzUVBKdk4zREZ0cVBMSHE3WXF3TWQxdXFZVUpUNE13VXl4REF1?=
 =?utf-8?B?clpnWEx1S2toQUx6MFh6djk0L1JacklmQ3p5bHh2VmFhSmVWT0lhbTVEa1R2?=
 =?utf-8?B?YWVEdy9ubWIzMnBOSUQ3OUVUOWpXd0tlRGd1UzNVZlh6d2E1QTlWMWhJV3NI?=
 =?utf-8?B?c21XaklEcXVpZ0w2SjcybXlTbjdYdEdTR0xraTdYdDF0VU1lZTg1bHpmY3Zw?=
 =?utf-8?B?c2EwSHBUYVpNKzFBaFcxdG1vOUhQME5rMm1MbFo0SjlGQkVXTGdYVVVHVFhq?=
 =?utf-8?B?K0FqSmd4WTdObndhRDdzZWlmUnBaR2hKa0xtOS82aWxGWFdyUnlBNUViVE9U?=
 =?utf-8?B?VlhhYmtUaExPQ2pyTVZ0YUVpclN6anJEQk44NDRyNzU5VDZ1VEV5WlpSUW1Q?=
 =?utf-8?B?SytUYXRKbHNEQW1aeGt4V2dsTG1UOThmSnQybnczbkQzeEJGa2VYeStUY2Z2?=
 =?utf-8?B?Yk1uZ3RiR2h5YXNFZkUxNDVCbmM5YWxVUHZ5THYxbzFsbUhkNngreGRVVGwx?=
 =?utf-8?B?cXdpejNDME5mRkV0aEJFV3Fua0cvTTB5SXhrKzU5WllHQXBzZGhoQndPUFlk?=
 =?utf-8?B?eVI3ekRuQTlwK3RvSjJRTERoQ3RFaVJWWVRxeWVQK1NpT3M3WXdrWGdkNUs4?=
 =?utf-8?B?WkszSjh3V2tlcVRQdE1JMlpRaWVTTTA2a1plUGZuelNYQTVEeENUcFRXYVNr?=
 =?utf-8?B?MGZJTllyak9FVkpwQUdNaWJMM1lzb050cmZOd3JwbFhvU1g3dWlSSHV1OWRP?=
 =?utf-8?B?T0JwNTN1dXhoOFhPQm9PcVBCcUZEY1dhMmp0VXJiSW5zRnM5SEFKakpLZ2V1?=
 =?utf-8?B?NXhpOVR6UzJ0RkRHbXF4bFloNlk2UzZuOUVDUUx0cEoyMk9HSWxVd1VGaEtj?=
 =?utf-8?B?bWtRMC80WWpIbE9xUjRMUWZmd0NsMThBTk43dldJR2VjeWJucUF1OFFRSFpN?=
 =?utf-8?B?a2cvSTI5KzVBWUwzR29yZE5qZ1NYdWNjdDkyQ3RRMitMcjF1Z1lNckhxcElK?=
 =?utf-8?B?V04vL1p4R2xSTnh4TllQeGRjMHd1SXNIdXBacGw1R2EyVVlzdUxualNpckdU?=
 =?utf-8?B?Z3Q5L25jZXNVMWVWeDc3T2RCbHhKdHB1bkhHbVZnU1dqRFRYV0ZIL1I3Vk4x?=
 =?utf-8?Q?ALdv9imNUKpW0?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7584.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7442
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:10:308::6];domain=DB9PR08MB7584.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4018be7d-1b1d-4192-cc9f-08dd47ac29a9
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|1800799024|376014|36860700013|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTR5TUpLUXhpeHNQa0VRRkRPcVdsUndQN1FRZEcxbGgvYXdNVXhqOGdVT21h?=
 =?utf-8?B?L2pxTDdOdlRpbWNXdm04SGtld2VJTEk4QUUrZ0NHL1N0S3ZhVTJ4eSsxeDVh?=
 =?utf-8?B?R1hnN0FrLzZ6NzZGaUZINklmVHh6bHp0LzZtaDRTeWJCUnVsaUpOVU5LajhY?=
 =?utf-8?B?NzBSNXBhZ1JhSmFsUG1PUWFTUHMzRXhiS25WR0ZvVVBqTGlBdTByUytHaGpv?=
 =?utf-8?B?RERmMUtlQXh5SXdqNGNzOEhXZmR4REVCTEFtdDc0QXJ6N0ZVNzZIZkpuZyt4?=
 =?utf-8?B?Mm92WGtKNEtETGk3WWlQY3FJenNDSktKSVhKN0puSXpWdFBsdVpsaTJBbS9o?=
 =?utf-8?B?eVZvcXBtRlZYVkFYaFRjclhWUE5vZDFBblFZaUhNZ25iUU1NanZIVkIzLyty?=
 =?utf-8?B?YzhvTW1OcDNpellGaVU4WkhiVk1QOWZPNWVtbnM5SkNjdmlYY0FxSmNFZGpy?=
 =?utf-8?B?TWs3ODVsUHlJZGdGQ0d5NHR6OG4zbUc5MmZ4RDFjdEdKVWIyWXVvaWtrdXFM?=
 =?utf-8?B?SC82cWlaYTQzaldFZFQ5Zy93aS85eUJrWk9lRkJzalRWWTIvRlMwVmRPTE0w?=
 =?utf-8?B?cFdML3FMMXhBT2FGZVF1V3BkVHVxYldFYkc3R3ovSm1sRkNpWnRJZmF3dEdu?=
 =?utf-8?B?MUp4Z0MvWlMzMER1S1dKYjVHWWJHVnNIdThYV3Uyd2xQVUQ3aExONFNETW1Z?=
 =?utf-8?B?YmZkNkpvaHdqUDl6Rk9GRUdNMTZQNGNyN3Jtc1laeTV5OHM4ZWRqRVZCTlRK?=
 =?utf-8?B?ajNYSkZSd0duRlpsTkFKQ3RPRTdnUnltcDR3TEJpK3NrUm5yTkVxMSt6RG93?=
 =?utf-8?B?QnBWUkpJTHpVUkJUalNKRFFMUmwwaW5YMTBnYVk1b1VFRDhNb05mckhoV05r?=
 =?utf-8?B?SlhFeFA4YW1xZ1NsbEpvOGxERHZ4ZzR6cFFHZjBRWGxyMFJnK3J5L1gxdDkz?=
 =?utf-8?B?RFlUbnhtRVNtS1JpZkJURjdqcjBtMWNOVS8rMGxWbGxsQlAwQlozMDIvQUVs?=
 =?utf-8?B?VUVTTlZpSVk2dks1YXh2T0lSOVIzcy8wSGRYZytnTHRERk5qY0Fyc25mOXN1?=
 =?utf-8?B?V0E3bHYzbTc2M01ISVNBeVU2SWVxZUFXOGpxVXN1MytSU1hUaHdubVhUSlRG?=
 =?utf-8?B?ZHBObTdVaFdtVGJPK3IwaXpGbFhDSTRzYTV0TXl2U0tXc3QyTnZ4d2pxdVdl?=
 =?utf-8?B?alJaTjNEYzRVaCtiQWgwcnBpUEpEZHc0aDdaelk4VTVUbDJQSVRtVnFpQVE0?=
 =?utf-8?B?YWNnaDNVSkZKUzRJck9hQzlDRml0VkVEOHBPeEdIMTRDUWM4dmVJT0pSVUZS?=
 =?utf-8?B?K1J0Z0M0QzRzVjFzSXVZZkZQQWh0VGZVNnlTRTQzTFNFY3VTWlFISldWUStv?=
 =?utf-8?B?TFErUHo3UGFVODdJQnpBb1JyeG10T0lxeDdpMldnMHdqYTlmUDhEYXJrME83?=
 =?utf-8?B?U0V3ZThqejJhOWdLTlU3WGowNFlZNXR2Mk1tQlR4RlNLTEFyeit3a1o4TmJJ?=
 =?utf-8?B?aDM3SWpWak9zeFVtMTNEckswRmFnUkF1Zm9oaW1JRlBnK092RWdqRjVJcyth?=
 =?utf-8?B?ZUJjam1ZSDlXcFhsOWJDSE5VZjBRanVTOG1HZTdramNadnhRMXlGbDRER09E?=
 =?utf-8?B?a3pPbWhrYUNSRXpEc0RPc1FlWXp2dGRrZ3pnRldPOTdxSVBRV0dDSTZrb2x6?=
 =?utf-8?B?eU5HOXQyNjdkdXdDU0JYZjdzREN4STJ3UkxYMUFQRjltSFhLMjJRaFlqS1dP?=
 =?utf-8?B?QWxEeEdGZStTazdxb201Z2dZaHNRYlh4R1VmSkg3UW55VllOZVZ2a2grQjNh?=
 =?utf-8?B?dG8wbmFhQURpckVaejdsSG5uZXYzY1hRUm1XV2lNcksxTUZmenl2MG4xSUhJ?=
 =?utf-8?B?VWxXc1psZG5DQ3NIK3FQcENuREFTV2VKbU9XdktFNkF3UEVBU2w2OFBKWEZB?=
 =?utf-8?B?QTA2UnZvdytmNjZFS1V4UHY3a3RCcXZnQmczdGdYYitsRGl2Z3R6d1FNTWFF?=
 =?utf-8?Q?Kif8mPhXh7vw1dOGco4OL2symrx3os=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(36860700013)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 19:18:25.9419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa2498e-1c83-4689-7215-08dd47ac3241
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_111839_761373_1EAF1182 
X-CRM114-Status: UNSURE (   8.68  )
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

On 1/31/25 18:44, Rob Herring wrote:
> On Mon, Jan 6, 2025 at 6:12 AM <mark.barnett@arm.com> wrote:
>>
>> From: Ben Gainey <ben.gainey@arm.com>
>>
>> This change modifies perf_event_attr to add a second, alternative
>> sample period field, and modifies the core perf overflow handling
>> such that when specified an event will alternate between two sample
>> periods.
>>
>> Currently, perf does not provide a  mechanism for decoupling the period
>> over which counters are counted from the period between samples. This is
>> problematic for building a tool to measure per-function metrics derived
>> from a sampled counter group. Ideally such a tool wants a very small
>> sample window in order to correctly attribute the metrics to a given
>> function, but prefers a larger sample period that provides representative
>> coverage without excessive probe effect, triggering throttling, or
>> generating excessive amounts of data.
>>
>> By alternating between a long and short sample_period and subsequently
>> discarding the long samples, tools may decouple the period between
>> samples that the tool cares about from the window of time over which
>> interesting counts are collected.
>>
>> It is expected that typically tools would use this feature with the
>> cycles or instructions events as an approximation for time, but no
>> restrictions are applied to which events this can be applied to.
>>
>> Signed-off-by: Ben Gainey <ben.gainey@arm.com>
>> Signed-off-by: Mark Barnett <mark.barnett@arm.com>
>> ---
>>   include/linux/perf_event.h      |  5 +++++
>>   include/uapi/linux/perf_event.h |  3 +++
>>   kernel/events/core.c            | 37 ++++++++++++++++++++++++++++++++-
>>   3 files changed, 44 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
>> index cb99ec8c9e96..cbb332f4e19c 100644
>> --- a/include/linux/perf_event.h
>> +++ b/include/linux/perf_event.h
>> @@ -276,6 +276,11 @@ struct hw_perf_event {
>>           */
>>          u64                             freq_time_stamp;
>>          u64                             freq_count_stamp;
>> +
>> +       /*
>> +        * Indicates that the alternative sample period is used
>> +        */
>> +       bool                            using_alt_sample_period;
> 
> 8 bytes more for a single bit of data. I think we can avoid it. More below.
> 
>>   #endif
>>   };
>>
>> diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
>> index 0524d541d4e3..499a8673df8e 100644
>> --- a/include/uapi/linux/perf_event.h
>> +++ b/include/uapi/linux/perf_event.h
>> @@ -379,6 +379,7 @@ enum perf_event_read_format {
>>   #define PERF_ATTR_SIZE_VER6    120     /* add: aux_sample_size */
>>   #define PERF_ATTR_SIZE_VER7    128     /* add: sig_data */
>>   #define PERF_ATTR_SIZE_VER8    136     /* add: config3 */
>> +#define PERF_ATTR_SIZE_VER9    144     /* add: alt_sample_period */
>>
>>   /*
>>    * Hardware event_id to monitor via a performance monitoring event:
>> @@ -531,6 +532,8 @@ struct perf_event_attr {
>>          __u64   sig_data;
>>
>>          __u64   config3; /* extension of config2 */
>> +
>> +       __u64   alt_sample_period;
>>   };
>>
>>   /*
>> diff --git a/kernel/events/core.c b/kernel/events/core.c
>> index 065f9188b44a..7e339d12363a 100644
>> --- a/kernel/events/core.c
>> +++ b/kernel/events/core.c
>> @@ -4178,6 +4178,8 @@ static void perf_adjust_period(struct perf_event *event, u64 nsec, u64 count, bo
>>          s64 period, sample_period;
>>          s64 delta;
>>
>> +       WARN_ON_ONCE(hwc->using_alt_sample_period);
>> +
>>          period = perf_calculate_period(event, nsec, count);
>>
>>          delta = (s64)(period - hwc->sample_period);
>> @@ -9850,6 +9852,7 @@ static int __perf_event_overflow(struct perf_event*event,
>>                                   int throttle, struct perf_sample_data *data,
>>                                   struct pt_regs *regs)
>>   {
>> +       struct hw_perf_event *hwc = &event->hw;
>>          int events = atomic_read(&event->event_limit);
>>          int ret = 0;
>>
>> @@ -9869,6 +9872,18 @@ static int __perf_event_overflow(struct perf_event *event,
>>              !bpf_overflow_handler(event, data, regs))
>>                  goto out;
>>
>> +       /*
>> +        * Swap the sample period to the alternative period
>> +        */
>> +       if (event->attr.alt_sample_period) {
>> +               bool using_alt = hwc->using_alt_sample_period;
>> +               u64 sample_period = (using_alt ? event->attr.sample_period
>> +                                              : event->attr.alt_sample_period);
>> +
>> +               hwc->sample_period = sample_period;
>> +               hwc->using_alt_sample_period = !using_alt;
>> +       }
> 
> Wouldn't something like this avoid the need for using_alt_sample_period:
> 
> if (event->attr.alt_sample_period) {
>    if (hwc->sample_period == event->attr.sample_period)
>      hwc->sample_period = event->attr.alt_sample_period;
>    else
>      hwc->sample_period = event->attr.sample_period;
> }
> 
> Rob

Hi Rob,

Thanks for looking it over. That would work for this patch but the 
second patch in this series adds a variable jitter to the sample 
periods. So 'hwc->sample_period' wouldn't be directly comparable to 
'attr.sample_period'.

Mark

