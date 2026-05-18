Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62FDCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 21:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aALaK96Ofej3tvOCMDTk6qlJmrsI6a4TFDuhG8FxRic=; b=tvIHo0ChMYOd+c2XnP6Wc1v37l
	7rWQw+FCkzUhTdJnn9L6w+RxdgsH9Bkk28bM337tFY4jXG+dtFmvwUBD8lDmKNfV71PgXwFfCA/Pw
	61tci51sqW9vZf6WjrF2K/YURcRoJ21FTmxZn5CcvyS4+R+SF/g6+bv7Nf7o6QqJONZzDFCtJd9ik
	+LSkE7wWeNJWgMT5Wiw2iYzJDKqv0fCC1VL58TK+/4bAYM5hkIzV+cxodFVAORYGVnNbefbW7fm0K
	jFIak4g/e77w0wfWki/P1eCLklUk0H7aJmjHQ70dvNeO+wTTljHw5xPxjWoXmm4/TZ234+2CQCjVQ
	WUPHdgNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP5IV-0000000Gy4T-3mWf;
	Mon, 18 May 2026 21:14:47 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP5IT-0000000Gy3U-3GgZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 21:14:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SHZImUhqVTATJqa8nuaTpqNmMOFh+Rqq8ZTQ2dQb0/CDDXYlhULtD84XRX6WZbN3WBLsZgQXjyDM79x4A5jxuZ0bYKo8+IYK3ggQT9Tug5t++lc86SW+tUIHPx78j/XtILJt5CKSGOn42TY05DE8cUAVeKpX6DL4T7XxeZuOpYNEwSNJmnfHCSYpIcVGB4le9D3DJowDdoH1ZLe6pnhW0nSFv/ZEAX+hR4Q7qEWhqYiNXkd+JrzvlLzzuPUzNbsXTYAwc7gelDkMqG9deEDPehCwJxChfp+y4kqduPTv7PwOvU8yR7bcWRLSb5/N4AsFM6ithPiBSdI5PQWN36+iPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aALaK96Ofej3tvOCMDTk6qlJmrsI6a4TFDuhG8FxRic=;
 b=F2QJDZSN2YJTDvS05rom8ghEJ51VUjnB57lKlLp5VbkW3v9sIBj6thtFX0FDrwt8R+RgwoYU7XZpwOFT2ByCopjB5vOBipROABCBz8g22Td2TNS2wktTquN3hkcJyawX+nF6uRW//LSpTLlcS3eBNj0SJ+7F4RRBVYv2t2zVRnFbEL2KKGlq6h7bKoxXC1SyNqrpYu8gp1n8QC+bLpcJa3OIkEd1NtOEgL36kTzOdNAzbfN5Uw1c6NFEjLKM6sfXNcI/z9GySLOUD0u+VGTU0gMtsmoSZQR35Eic+pPvH7yTGEsTAxx09d9vvBtPQgfXOJUVSVPP7PY4rxisYwrtBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aALaK96Ofej3tvOCMDTk6qlJmrsI6a4TFDuhG8FxRic=;
 b=XcdV+c9m7PZM/cNxWKpDbfKlp2sUqoLpKnDxLaKeW1seLC/Q2VMzb+leLaTkVT0U04qESbo4wFVTYI50XIZsFKX/V4itZnUaB9PZU2c0IgSo/9WsgOPvSktonZ2t+T4ljuAPlBrOcot/MxKCsMI/mmNFz/X0x66/5a6WSAJSWVw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SA1PR01MB8179.prod.exchangelabs.com (2603:10b6:806:330::14) by
 SA6PR01MB9069.prod.exchangelabs.com (2603:10b6:806:42c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.23; Mon, 18 May 2026 21:14:38 +0000
Received: from SA1PR01MB8179.prod.exchangelabs.com
 ([fe80::f091:2832:ffa:784d]) by SA1PR01MB8179.prod.exchangelabs.com
 ([fe80::f091:2832:ffa:784d%6]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 21:14:38 +0000
Message-ID: <2ec94be2-19f9-46c5-a2ad-78711ddfeef8@os.amperecomputing.com>
Date: Mon, 18 May 2026 17:14:35 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: smccc: Fix Arm SMCCC SOC_ID name call
To: Andre Przywara <andre.przywara@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250902172053.304911-1-andre.przywara@arm.com>
 <20250903-great-savvy-bloodhound-38c1ca@sudeepholla>
 <20250903-loutish-orangutan-of-experience-3dcfda@sudeepholla>
 <cc8000c0-e457-4bfc-94de-aeeddacab23b@os.amperecomputing.com>
 <20250904-powerful-futuristic-tench-bcebd4@sudeepholla>
 <c0bcef12-6837-414a-960c-da3cf3948308@arm.com>
 <c72b6d61-d532-48f0-add0-4f44051b4ae9@os.amperecomputing.com>
 <506bf1b9-dfc4-4717-b26b-835c331d23c4@arm.com>
Content-Language: en-US
From: Paul Benoit <paul@os.amperecomputing.com>
In-Reply-To: <506bf1b9-dfc4-4717-b26b-835c331d23c4@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CYXP220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:ee::8) To SA1PR01MB8179.prod.exchangelabs.com
 (2603:10b6:806:330::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR01MB8179:EE_|SA6PR01MB9069:EE_
X-MS-Office365-Filtering-Correlation-Id: 6734fcf6-6e3a-4ab8-a0b4-08deb52277f8
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|55112099003|18002099003|22082099003|56012099003|4143699003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info: NBlcU0KVMZM+2GYu+UjMbeKuFRy5uoZWsS1lxCQyJNqhYwbjFwLwwSazTjRnetJAdLYT6p+v7lC1+qobP3M/xx3I3A6Wg7fkOFzPHictAMUf05OwHbeXgK4fHOFtx3KB7VXm68tLsQujQ5hZhtimOYO4d8bn8aIisQ8y02zqjnNcUIBs+KMbJtnAFHAxs52X0TF7KTu55B3e5kmdbMoLqFXnsoGqJjTjfJhxqGmtLFD6wnH/D0ow49RSeJtKvYL34dzO6z94Xbnl4QDJJvXxh77rat8JqeslkS8RtC4ImLJruIRn/1ATM69Ocu24XaLv0yrK2DwOQH1AIUeM8+pYaIPVKprCQSsIO3JZOPfrDa5u5Fdn8zl3pjjYW/ZsflacbOw6FPg9KFoskiUEJ57cg0v3dRt7z2Rd4nBJEFw84HGw806uOvteIVxj04LoN2DrbHD67bHtfJi3z362yD3XGixfBjTEK5VDZXSoHIulswOUjFD8PH0TsXcQWdkVdu5AaJ5rjmZZpDEYvegnfDwU0axQAKfmper/pW8AlD4cYfRr1gvM7/ZRJ0BQwQ5EnwaM/FM1JHSzN9Vk3DGFkUsYCSPyFQnRvk8ZPHv8moKZHsASquouthNz54uhFdyMhIE2G0jNQYZQLs7HZmwBQKIA6+4zcuU1scYQAaS3dBUi7m3Zdp9C+Rx43GbUfgy5cDZ1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR01MB8179.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(55112099003)(18002099003)(22082099003)(56012099003)(4143699003)(3023799003)(11063799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWRvejVuS0QxNmJ1aEk2Mk1RRFJBdXdtN2xXOTV3Rk1hVXdQc0RTaE51Ymph?=
 =?utf-8?B?Mzc3N3RQZTgwZERraS84WUlkU3I5bTRKczJ6YnpiaXR4UkxBTDZpRWQwZE5x?=
 =?utf-8?B?Ryt5QzVXNS83dlROTS85dnVyV29qcVR0NFVta2dyQ1dkSngwMFdmSVZFeG9k?=
 =?utf-8?B?UUkyOGExTWNRMVpOSk9TT1ZKRnpGd2FPckVOeU9uZjVOYkdHUXBSUC9Nazhj?=
 =?utf-8?B?WW5nNlJsOHk5MlhZVk9MVlFXcEt0amExK0VTQ29QM2dpeEJsV3FlSlYzQ0du?=
 =?utf-8?B?Nkt3VXZmSHRMVXJ1SjE0SEc2NXc3VlJnbTlQY1Q2bmJ5M2lvc0h6R2lDdVZL?=
 =?utf-8?B?aUltTkV5RVhMOWFoeTZIVWNYZDZ4Nzd5ZE9Ua3ZoMjhKaEpEWFZ0ZldVTFdx?=
 =?utf-8?B?STVuKzd6U1c1aFM1WFZOVG9HOVpBK2VjdlZ4Z2hoUnh5NEVSQlN1amFxUThk?=
 =?utf-8?B?LzlHMis5YVhQMWRNOXovVlJYUUlXUWlJZUo3U1IvS3BGQ3BKcExLd2hZZm9R?=
 =?utf-8?B?UGF5RVZON2JaQnZlQXBVMTM1Wnkvc1VHMlVMSGNNNUVhVWVzcnRUT0NQaHBB?=
 =?utf-8?B?R2dzSFhyK2QrQlp3Y1ZrU0JIRGtsZk5yakhwVE5rZ2FFcHBhUjZlT2tHemZ1?=
 =?utf-8?B?bmdGVDZrWUhOREN6V3hsU1FlWFo5dGpFL2NEUHFrY1hrQVJUWXBUcWIzbUQw?=
 =?utf-8?B?dS9pYjFOakpqRFpJZ2twb2RCam55N2MvSG9HRHFYY0VFYk0zQVhiam5ZcUM5?=
 =?utf-8?B?cHdWR01Gd3JCekxJMy9rZCsvUTl4L0Uwb1B3cFdFOXNDYXFWUFZLMFphQlls?=
 =?utf-8?B?bldyaWdDSFMzLzZRWUdnaFpKRmFmZ2tpRGx2UG5Vd3ZuNUdXS2tTdDlZVU05?=
 =?utf-8?B?d2tHcHM1czR2RnI4ZmxhWXZaTWlGcHJYOUJxaE1iemRyZlJtMWpZU3hTOHND?=
 =?utf-8?B?dFpuYm1sQ2dCRlhQNmNuUktIWVdtOWdFV2YzZ1VkOXJSWWRiMHdtZjQwMkdO?=
 =?utf-8?B?QWVTKzlnVjFrdHR4NmVvelpjMU5jNHBFdDMxWWtwZWNJUy9mbURMK3lzN2FW?=
 =?utf-8?B?dE5qV2dkQlJ4a1pGWE5GU0wydTJoUk84RnJDQzhhYktsZXpwV0cwN2kxVXF2?=
 =?utf-8?B?REZNWTl3dlg3VjBvYUkyUTlWby80MzFadldMZHpFbXZpdEVDUjhhK3VlUG0r?=
 =?utf-8?B?YXlMQldOaS84TkVNUEJNaXlnQTQ5R1lOUzJQdFg3Smk5WFVacXkyN0c3UWFy?=
 =?utf-8?B?ajR4cE1wdFJsN0dCbVQ4OVlmbDZsY0ZVRGFSckRTS1Z2alNvbWJkZTlHWFRy?=
 =?utf-8?B?c1dsTTlUdnkvVnMwRDRwUTZIQnF4MHU0ZE1OeHNXcHo3MUxJRjhsQ1FJMWtB?=
 =?utf-8?B?UzRTWVBCVGowU0pkK2dObDcxV2Z2bXoxTEdIeVptQzlLODIrVXQwUzZvc3Vt?=
 =?utf-8?B?L0ZYUzBCRlhyOTB2elpwZTZVdkY1UngzUUJNOExpRzZXNkZlYmxNK3dBcHZq?=
 =?utf-8?B?RVhkejFsYys4YzNvbGx6RWZRa0o4c3JwOEZZa0tXd2xUMGxyTCtBSHBnaUFt?=
 =?utf-8?B?YldOTGt5eUpuT3pmdEtRWXVPVklKNWhkT21QWVFTZytKMWowNjJzOVJLUnow?=
 =?utf-8?B?YWVwN051U0kwaTFQWng1WjhpMVVoZUhxM3pTWXNUSTlmQzBFd0pteVF2Y1VN?=
 =?utf-8?B?dVZReldic2RiUlZLRHI3Zi9HaVJlZzhzQWdqNWtGcHZmZ0NvRkdadXY4TlhH?=
 =?utf-8?B?clVuaXVkWGJFazhiZlV1RHVONEkrZ2pOakM0aHpLZTlYdXQ5S0V2UE1hWFZn?=
 =?utf-8?B?MWhFZUd6bmFHZzNUNlhxZzdJNlVvZ0FrWldJUWJUaWwzWjlTcG9uWEZGdUtj?=
 =?utf-8?B?T3FYSEtIY0lDVUMwSEdWdFBKWThYc05HNmNSYis2TmpRTzYrKzZ1dnllMEVC?=
 =?utf-8?B?MEdTYjBoTGdrd0RxSHdtbUNRMTdtcXhIRjVtY1NzOXFoWFM3NzJISEYzVVp6?=
 =?utf-8?B?bUgxS2JjSFM5RlVsZ3B6VE1CbGRXTHpjV09vc2dLM3ZmZHY2OVNveHRzREVp?=
 =?utf-8?B?S1h6anVmOFg2Q3hGU2pQS25aWUFNNGhJOS9UeXBKQTFrRWJKWWdodjM0bUg2?=
 =?utf-8?B?aUVZZGtzdHAwWWgxVFFHVXFJa2tSbVYzSHF3ZGcwZzdwalp5cXVsWjF1M25N?=
 =?utf-8?B?d1lDK2crZUdlNit2ekI1SlZ4OU5qNGFkd2dPRHhBSzBCdDVLNTE2TDBaZTBX?=
 =?utf-8?B?ZGdHc214cGhSWEVydnBQMVZOcGZwVUtYeTVDK3F5dG1TMU44WkVYTGtzMFNZ?=
 =?utf-8?B?NmNQcGNnaDl1RXRRa3hFM1dVTzNlbmRPWmtkMHlWREd4VVlZK1hWZXYxdHpx?=
 =?utf-8?Q?iEKoxm4SaX2vQcwQ=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6734fcf6-6e3a-4ab8-a0b4-08deb52277f8
X-MS-Exchange-CrossTenant-AuthSource: SA1PR01MB8179.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 21:14:38.2805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TxzNZjoFd6jW2P91tMBOjRZXPWGpuLcWqC4mAevGmr0OcTwpnqmioccgs7BXizabUaqn1upQxyGhJYMxnoryOu2u9xWojCeR5qIGS/BGztc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR01MB9069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_141445_857578_B2E8A346 
X-CRM114-Status: GOOD (  41.33  )
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

On 5/12/2026 10:09 AM, Andre Przywara wrote:
> Hi Paul,
> 
> many thanks for the answer, and apologies for the delay (was on holidays).
> 
> On 5/1/26 22:14, Paul Benoit wrote:
>> On 4/30/2026 10:59 AM, Andre Przywara wrote:
>>> [You don't often get email from andre.przywara@arm.com. Learn why 
>>> this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> Hi Paul,
>>>
>>> is there any update on this?
>>> One more thought below ...
>>>
>>
>> Hi Andre,
>>
>> Using the incorrect SMC32 vs. the correct SMC64 interface, for SOC_ID
>> Name, was addressed by Ampere firmware some months back.
>>
>> In addition to recent firmware now responding to a SMC64 CC SOC_ID Name
>> request, it will continue to respond to an incorrect/broken SMC32
>> request and return the SOC_ID Name string packed in 64-bit registers.
>> This will allow Linux kernels 6.15+, incorrectly using SMC32 to get the
>> SOC_ID Name, to continue to work with new Ampere firmware versions.
> 
> OK, many thanks for the information, that seems to be a good solution.
> 
>> In other words, unless any other vendors also implemented SOC_ID Name as
>> SMC32 in their firmware, I think we can let the Ampere firmware handle
>> the SMC32 vs. SMC64 mix-up and keep the handling of it out of the Linux
>> kernel.
> 
> But I think availability of the machines predates the "some month back" 
> period you mention above?
> So it would only work if users would update the firmware?

Correct.  I had already discussed that case with colleagues at Ampere,
and, rather than having quirk/errata handling in the Linux kernel, we
are ok with requiring that systems, with older firmware, be updated
before running future Linux kernels.  That shouldn't pose a big risk/
problem as I'm not yet aware of anything besides some of my lscpu
experiments that use the newish SMC CC SOC_ID Name.

> 
>> It should now be safe to make the SMC32->SMC64 SOC_ID Name change in
>> Linux.
> 
> So I wonder if would still need a quirk for AmpereOne. I guess we can't 
> query the TF-A build version easily, and a DMI quirk probably doesn't 
> work either, judging by the dmidecode output of one machine I looked at.
> So I was wondering if we should employ the following algorithm:
> 
>      - do call with 64-bit FID
>      - if (ret == -1) && (soc_id == jep106:0a16:0004)
>          - try 32-bit FID
> 
> Would that work? That checks for the SoC, not the firmware version, but 
> seems way easier to implement and would cover all cases.
> 
> Thoughts?

If it is deemed necessary to have the SMC32 quirk/fallback handling in
the Linux kernel, then, yes, it would look something like the above.
That is the correct soc_id value that you would want for the check.

> 
> Cheers,
> Andre
> 
>>
>>
>>> On 9/4/25 16:29, Sudeep Holla wrote:
>>>> On Wed, Sep 03, 2025 at 05:38:44PM -0400, Paul Benoit wrote:
>>>>> On 9/3/2025 10:49 AM, Sudeep Holla wrote:
>>>>>> On Wed, Sep 03, 2025 at 03:23:58PM +0100, Sudeep Holla wrote:
>>>>>>> On Tue, Sep 02, 2025 at 06:20:53PM +0100, Andre Przywara wrote:
>>>>>>>> Commit 5f9c23abc477 ("firmware: smccc: Support optional Arm 
>>>>>>>> SMCCC SOC_ID
>>>>>>>> name") introduced the SOC_ID name string call, which reports a 
>>>>>>>> human
>>>>>>>> readable string describing the SoC, as returned by firmware.
>>>>>>>> The SMCCC spec v1.6 describes this feature as AArch64 only, 
>>>>>>>> since we rely
>>>>>>>> on 8 characters to be transmitted per register. Consequently the 
>>>>>>>> SMCCC
>>>>>>>> call must use the AArch64 calling convention, which requires bit 
>>>>>>>> 30 of
>>>>>>>> the FID to be set. The spec is a bit confusing here, since it 
>>>>>>>> mentions
>>>>>>>> that in the parameter description ("2: SoC name (optionally 
>>>>>>>> implemented for
>>>>>>>> SMC64 calls, ..."), but still prints the FID explicitly as 
>>>>>>>> 0x80000002.
>>>>>>>> But as this FID is using the SMC32 calling convention (correct 
>>>>>>>> for the
>>>>>>>> other two calls), it will not match what mainline TF-A is 
>>>>>>>> expecting, so
>>>>>>>> any call would return NOT_SUPPORTED.
>>>>>>>>
>>>>>>>
>>>>>>> Good catch and I must admit I completely missed it inspite of 
>>>>>>> discussing
>>>>>>> 32b vs 64b FID around the same time this was introduced.
>>>>>>>
>>>>>>>> Add a 64-bit version of the ARCH_SOC_ID FID macro, and use that 
>>>>>>>> for the
>>>>>>>> SoC name version of the call.
>>>>>>>>
>>>>>>>> Fixes: 5f9c23abc477 ("firmware: smccc: Support optional Arm 
>>>>>>>> SMCCC SOC_ID name")
>>>>>>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>>>>>>> ---
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> as somewhat expected, this now fails on an Ampere machine, which
>>>>>>>> reported a string in /sys/devices/soc0/machine before, but is 
>>>>>>>> now missing
>>>>>>>> this file.
>>>>>>>> Any idea what's the best way to handle this? Let the code try 
>>>>>>>> the 32-bit
>>>>>>>> FID, when the 64-bit one fails? Or handle this as some kind of 
>>>>>>>> erratum?
>>>>>>>>
>>>>>>>
>>>>>>> Not sure about it yet. Erratum seems good option so that we can 
>>>>>>> avoid
>>>>>>> others getting it wrong too as they might just run the kernel and 
>>>>>>> be happy
>>>>>>> if the machine sysfs shows up as we decided to do fallback to 32b 
>>>>>>> FID.
>>>>>>>
>>>>>>> I will start a discussion to get the spec updated and pushed out 
>>>>>>> and see
>>>>>>> how that goes.
>>>>>>>
>>>>>>> The change itself looks good and happy to get it merged once we know
>>>>>>> what is the best approach(erratum vs fallback).
>>>>>>>
>>>>>>
>>>>>> Looking at the SMCCC spec(DEN0028 v1.6 G Edition) ->
>>>>>> Section 7.4.6 Implementation responsibilities
>>>>>>
>>>>>> If implemented, the firmware:
>>>>>> ...
>>>>>> • must not implement SoC_ID_type == 2 for SMC32.
>>>>>> • can optionally implement SoC_ID_type == 2 for SMC64 (Function ID 
>>>>>> 0xC000_0002),
>>>>>> ...
>>>>>>
>>>>>> So Ampere is not spec conformant here and hence I prefer to handle 
>>>>>> it as
>>>>>> erratum. Hopefully we can use SOC_ID version and revision to keep 
>>>>>> the scope
>>>>>> of erratum confined to smallest set of platforms.
>>>>>>
>>>>>> Paul,
>>>>>>
>>>>>> Thoughts ?
>>>>>>
>>>>>
>>>>> Am I correctly understanding that, if the SMC64 SOC_ID Name call 
>>>>> fails,
>>>>> rather than an unconditional fallback to the SMC32 call, the SMC32
>>>>> fallback would only be occurring under the proposed erratum?
>>>>>
>>>>
>>>> Correct, if we have unconditional fallback to the SMC32 call, then 
>>>> there
>>>> is a chance that this issue gets carried into newer Ampere systems 
>>>> as f/w
>>>> gets copied as well as other vendors will also not notice the issue if
>>>> they make similar mistake as the kernel silent makes a SMC32 call.
>>>>
>>>> We do need details of  the SoC revision and version for which we 
>>>> need to
>>>> apply this workaround/erratum.
>>>
>>> So this looks more like a firmware erratum than a SoC specific one,
>>> right? So I wonder if any SoC specific IDs are really appropriate here.
>>> Is there some firmware version we can read via DMI or so to identify
>>> affected systems?
>>> Or shall we use a probably much easier SoC or even MIDR check anyway,
>>> since it's just a fallback? As in: try smc64, if that fails and if it's
>>> a core that ever shipped with that affected firmware, try smc32? I think
>>> there is not much harm in trying those FIDs, so we just limit the scope
>>> to Ampere cores - even though that's technically not the right method by
>>> the book?
>>>
>>> Cheers,
>>> Andre
>>>
>>>
>>>
>>>>
>>>>> I brought this issue up at a weekly team meeting today, and I'll 
>>>>> also be
>>>>> communicating with the Ampere Computing firmware team regarding this
>>>>> issue.
>>>>
>>>> Thanks!
>>>>
>>>
>>
> 


