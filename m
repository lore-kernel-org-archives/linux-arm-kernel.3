Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A534CF34DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfV/rsXv2INEQUdU6pAB2OPZnSsrbVFIxEsvyKgYTPU=; b=s2GNCNr4Kos2AwSFkm0K7B+ZOV
	y87MeQ/IRorJN71RIJdjiPinfJwfYI+iCnj1Trs7YkyZouZYBhMuIxRwcX5xAvH8/vbfJrL+PbHe8
	76q5bjYRFETpRMHfvTj8kNMLrWX+L6k5QT8aISB86XaCOLXN1aNK0aGS110tSVzcgoR1Iz2+qDLKI
	zoIL39/wl5Stc1aloKe4+Y0n9xAFQ+4kSbVFoKhBGOBcU/AatltWVlDfQns4Nwx44NAX6LmGCiGHw
	VeOEdmQZcktdHCveexQtzZs0Jg9FYPRhI1ZbRLyVmSUQx7i0aNzXIsSaKTgbjfxKnBlCEehNMOlFx
	kW1LKcIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLk8Y-00000003Uds-3x58;
	Wed, 19 Nov 2025 15:30:26 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLk8V-00000003UdK-0tNp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:30:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWG+cHAoePYJAblOCqDYrdtGaZv9hYWTBhoJBwPAtmojftP2Qvd63L+AJwwXZrYSYTWoXL5qWiKipnPxqCDKmdMYmkz7QtPsCE0VfSovEVu6WI2wciRB0hzbhtgBQdQgeP7AmB0MEHSPWBtxFdRTPenfqsrZuQx28Y5PxCni0+9LdEf6ZMeVnOd22if0nEcBlVfY94TtMMYayHef0M5TijpNYukrr+0PXqE3L/VbiMLd6SAb4LHdxBfilJ5bNsiDSywRhqZeNkM0hamDUZOiPjtSK1lbRTP9KRkihRJefF+sSA5Spj9ZYkZTdEK74GG6MrojqUe/8c+hD6PKeB97uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfV/rsXv2INEQUdU6pAB2OPZnSsrbVFIxEsvyKgYTPU=;
 b=Jj6Fw1xzhNz2wOw6w+08oOPbmML9dNLBvR2iPkpspJ02rKhjfNbrN9zKNnRv5orR5wcp3GrSJMVx3qPkehfWipewr5G8HydUZJMIdzdpME2/FiwySsrXlb0NRmOYdQc/w1qUZV6QOCrnANgsZB6+qIuIA7B7pYwot/qGwQxQTarmzCnlNRM4s6y8Y+JA0e1UtUCXG8au6qqn3IGBspNOA92QuvdGoehTR2gC7i+G4kquCRnzrJtThJya+MXpzpVaOQx8tkDMewaVGdYW9BmQxIT38JUtg3UvQh2fpjTR9pcUJBJKfYNDu9siPzpdwjGMhf7FdKrOJNwv+a9T+trTxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfV/rsXv2INEQUdU6pAB2OPZnSsrbVFIxEsvyKgYTPU=;
 b=wbpFDpTS9U0TKB8WRdAf0HD/yqLLwWqqieOr15GWXanpPODYEzFmZri2t0scD8ZV28LcuUoLa188hWAWM/DSpij02zb+uUoVta8KUBphFjegqk2n3bH/KgiHzNGDhY3jE3cHFyIVvUX1B3YreSexS7DJzVYfpxGMgmd0OyBU9u8=
Received: from MN2PR15CA0050.namprd15.prod.outlook.com (2603:10b6:208:237::19)
 by SJ2PR10MB7655.namprd10.prod.outlook.com (2603:10b6:a03:547::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 15:30:17 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:208:237:cafe::cc) by MN2PR15CA0050.outlook.office365.com
 (2603:10b6:208:237::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 15:30:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 15:30:13 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 09:30:06 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 09:30:06 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 09:30:06 -0600
Received: from [10.249.139.123] ([10.249.139.123])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJFU1nx2061800;
	Wed, 19 Nov 2025 09:30:02 -0600
Message-ID: <f134863c-b4bb-485f-80af-f6a4207cac2f@ti.com>
Date: Wed, 19 Nov 2025 21:00:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-j721e-sk: Fix pinmux for power
 regulator
To: Vignesh Raghavendra <vigneshr@ti.com>
CC: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <y-abhilashchandra@ti.com>, <u-kumar1@ti.com>,
	<stable@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srk@ti.com>, <s-vadapalli@ti.com>
References: <20251118114954.1838514-1-s-vadapalli@ti.com>
 <f4d38392-a019-4061-9ef0-d95506766027@ti.com>
 <371e6a49846f910e9a747d4185471806cc719138.camel@ti.com>
 <6d6a1eeb-503d-48be-81bb-df53942b321c@ti.com>
Content-Language: en-US
From: Siddharth Vadapalli <s-vadapalli@ti.com>
In-Reply-To: <6d6a1eeb-503d-48be-81bb-df53942b321c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|SJ2PR10MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: 68cc9679-2196-4953-0d3a-08de278088a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHpyWEgzRG56TUhndkpYREs0dDJZdG1Oc2ZrbnZDQUNKT1RGSUp5cHhWbUhn?=
 =?utf-8?B?dUxYZk5VWEVGRUFQSGJmVmdJMG1iU1JrMWJCdkJHaUV0WTFCTmZpbVMrVUln?=
 =?utf-8?B?dEU0eXl1aklHYWJJTDkvQzdkT05YajYzVEZ1WW1DMzJVaXh1NjY5L0RPVk9x?=
 =?utf-8?B?MXRSUlBXTmExME9zWnUvS05FcmRqSEZ2ZUN4aVZzTUQwRXZpNjZtU2JlQjBE?=
 =?utf-8?B?d0FCYkJUNDdEUjduSktiUTdBVWJ4dlFUZVYxc3FsS3Z5UjRTTzhmV00xYVBx?=
 =?utf-8?B?Nmk5ZUt4TEx1QTY0azdGZm1TdjdCK2VjYVlxbDlNY21qbGRSWmE0a29HNHk1?=
 =?utf-8?B?eEN1c1h0Znp5VGIyMkRSblVrS05ZM21TWDRuQVB2VWd0c25PK21EYzQrdm5w?=
 =?utf-8?B?b1BOd2FpYmRPZFRJeWl1QkY4Q3NkYXZHS3Boa2hIbFNmblllU1R1YmkrcGZT?=
 =?utf-8?B?NWhMalQ1Z2pGcFRERjh6OGZDb0UwdDcvZnM3Z0RNNXA3c2M4NFI3eFBSREpr?=
 =?utf-8?B?b2F6bHRXazVjNHZSeFBMWjNkbTBIdS9rdEU2TTJtOW9obHRWVGxhVU5GZUtx?=
 =?utf-8?B?alpXOGZzMlA5N2VxSHpFMjVIYi9lM0NDZlkwdkVCNkZqS2E4YkRCa0sydlFv?=
 =?utf-8?B?MHFidElLOUUwK0hHdzZCUDVjczlnTjNYc1FnbExUYWZTbGZTTmJ2YWYrSUsw?=
 =?utf-8?B?NU5CMHJsZjJDd1ZmQlgxM0ttMHdwc0pBOW43bXd0YVJBaXoxV2hvdGRCVFhV?=
 =?utf-8?B?cVpGMDdSR2FFQW1VQzZDa2x3eGlkc0RmZm94UWhPc2RWbWNhSW9pM2RQOVRB?=
 =?utf-8?B?QnpVeFNWUWlPL1hYT0N6dHYzWm5pSExvdWpUeDkvUmVoOFBOdzZLeEFhQjZj?=
 =?utf-8?B?MXB4azNtdnY5eE5hMXM0QldSTUhuQnNCbUs3cEU3RS9kbUVNSWprSEkrdDFO?=
 =?utf-8?B?TFd3S2grY0pVVmtRMTllMExTbW84WXNIVGhqaXREeFlhcngyYlpLdUNjM3BV?=
 =?utf-8?B?THJ0TXBjazFHNFBoSGxXV2wwcDFzWVo0WDZ4c2cvTW5nTXl5NC9yTnAwbTNp?=
 =?utf-8?B?NnJpWDMzT3BxL1lYT0Juc240SnFjTjkvbDk1TmVjSmtFSFNjSkNtM0xVc2xm?=
 =?utf-8?B?TWszWHZHSGpXSHlCUno4bVh2UTM1YUR0aTV0WjdCdUkzVk9mK29NQjJFeUtv?=
 =?utf-8?B?Wm5wOEZuc3R6RVBDa0hhankyaTM1V2tGNzhaWTFxK0JEUlpYdXVFNFN2NERV?=
 =?utf-8?B?d29CZDRVc21IMjZwQi9LU0tQVFd4RTNBWFlhMEJOSkc4OEVQQTVSNzREQmx1?=
 =?utf-8?B?c0tIMk9HT0VRU2s1WVNsMHQzOXRSd2NicldUem8xK2ZHVUdXWnB0eG81TURp?=
 =?utf-8?B?a2NmNlhuSEcvYTc2a2VQZ1hZdng2OXpCQU4rdnBCclFUZXlKbHNvTnNYSzhJ?=
 =?utf-8?B?VGR3UjBTaUNXT3c2U09LMHozZi8vSW42dUg0YWV1REkxdDYwbW4wVWZLRStl?=
 =?utf-8?B?dzluaTVqQmVRNkJNRnphSDRiZCtzR09ndnc0R1VpOFU2Qmdka3hCVFg4YVJH?=
 =?utf-8?B?MUNYMnZrcnRCUW1HT0Z2TlhqbVU1elRidkRvazgydGxSRzg4OW1FeStrL1Rr?=
 =?utf-8?B?L25tRGlZK1lKQjRRV1hjYnZ4Y016cytqQUVtZEdIR2F6KzFwanE3R09RSXJK?=
 =?utf-8?B?cUd2elNtR1hrOE9lMXNYWE9VN0N2MHNmRmRoNU80MHBZK3lGOUUyTkJSeDhi?=
 =?utf-8?B?WHhMOThSa2NnVG02MFhBcUVzVzNaS1dHRk9Gb2ZIRUVYNXJ0U0ZFcGhCOXFn?=
 =?utf-8?B?UzdYWGxvM0tFRVRXaVZaRHh1M3U4M0VNVlFRWFdIbWFGeFVzWllJYmNTaURa?=
 =?utf-8?B?c1ZsdWhvSGFiTUpodWxDS2Jmc3dUY05IM0RyNHhoZnV2U05PV1NXaXNNRVFt?=
 =?utf-8?B?dUI4WkhuQzdiM2dONFNmUElxd08rREtDWlhxWEttN1VxK3FXcnVwc2xPRm16?=
 =?utf-8?B?QzNUQS9YTFF5eDJEVXR2L0NPYmtqZWFNd0dsOVR5OFZmS3hseUVKL21LYlA3?=
 =?utf-8?B?U2NyaGdkSFE1ek1FcnhTUzZDdFZFS1U4QUZTUkFFcmd2bkFPZGR3cVJ2OWJk?=
 =?utf-8?Q?WiYs=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 15:30:13.4035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68cc9679-2196-4953-0d3a-08de278088a0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7655
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_073023_511084_CCCB2990 
X-CRM114-Status: GOOD (  22.56  )
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

On 19/11/25 7:57 PM, Vignesh Raghavendra wrote:
> 
> 
> On 19/11/25 14:13, Siddharth Vadapalli wrote:
>> On Wed, 2025-11-19 at 13:38 +0530, Vignesh Raghavendra wrote:
>>
>> Hello Vignesh,
>>
>>>
>>> On 18/11/25 17:19, Siddharth Vadapalli wrote:
>>>> Commit under Fixes added support for power regulators on the J721E SK
>>>
>>> ^^^ not the right way to quote a commit. Should follow commit SHA
>>
>> I started following this format after I noticed that an earlier patch of
>> mine at [0]
>> was merged to the Networking Tree with the commit message updated to follow
>> this format [1]. I acknowledge that the expected format might be different
>> across subsystems, but I used this format since it seemed concise to me and
>> I believe that it makes it easier for the reader.
>>
> 
> Ok,  seems common in netdev but not outside of that tree.
> 
>> However, if the format should be:
>> commit SHA ("$subject")
>> for the TI-K3-DTS Tree as a policy, I will fix the format and post the v2
>> patch.
>>
>> [0]: https://lore.kernel.org/r/20241220075618.228202-1-s-vadapalli@ti.com/
>> [1]:
>> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/commit/?id=4a4d38ace1fb
>>
>>> ("$subject") format. Moreover this paragraph can be simply be stated as
>>> node is under wrong pmx region (wakeup) and instead should be moved to main
>>
>> Please let me know if I should post a v2 for this or if you plan to correct
>> it locally
>> (in case the 'commit SHA ("$subject") format doesn't require a v2).
> 
> There really is no need to quote the offending commit as part of the
> text as Fixes Tag makes it obvious. You would just have to describe that
> node is in the wrong parent node and needs to be moved under main pmx
> node with appropriate reference to TRM/Doc

Thank you for the clarification. I will keep the commit message concise 
and post the v2 patch.

Regards,
Siddharth.

