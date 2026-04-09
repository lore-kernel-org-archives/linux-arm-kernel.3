Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFA8F364A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 16:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ap5rbI7T2YHoieOw3WuyPTpR4cYmvQ+Gr4ZXJksRu2g=; b=W07mtuW0iOAyo/Dkh34RwPazRy
	4FZLYsaWbvSdCEix3L+U2j0cuu0Z+dm453TCmqc2+rLjJVzN4k5ZeINubuybCdGbmfaRKQ6aUT7WU
	FXSvVfd5y+dr6zf3d5sRjNKMaPVmc/4vmFEwPc3o4d50vd4JmiSoGJ9SoLAqHppNwHsihDf4wd6MV
	fjrUB3vegjxPum3IIYM4xqvKiiPcXzx6x0jKbAsTL4eZ6NNYLkXULKcFQJm/Olzk00TgBKn8V+bxo
	16b+7CW1KZnQ/56c8fQS0mDvPteU0eQ7/zfF6h3wN+JrMR+SE14UH1NKbGH6BcEe5fS8P4KXlOVZ/
	OZgzIMmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAsZ4-0000000AwvY-2rtZ;
	Thu, 09 Apr 2026 16:49:11 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAsZ2-0000000AwvA-1p5P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 16:49:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fe4G5h4TA8ySkv1G+qNzNTRTl9F7FHygJdsjHPRsTioHYu8601vOWOPIbKLMPfVW9Tmj7B9cnWsyLTObajZluF8LWCR/GszsHGogahQx+9UYCeaK0FrFqXjddBiYmnBr/yHMm2Km+IkGZSIL1asgzPf4mMLlRS27blzEPSbhtzEjYq/Fmls+DwmhPa9jwVR6GBowhyJPMQePdsI+UUMhWAn6C6n6fKQXQuJlq4buz96XlbGAZjvNevqljHRjvRCJ2dW0Us8GOZVvQzhjwFLVc+mCLAYQ2Y80pW4XKOLYRr+u7RMoS9gdzLIMbE7QJ8wMv5B1NLjWSQniugb933X3EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ap5rbI7T2YHoieOw3WuyPTpR4cYmvQ+Gr4ZXJksRu2g=;
 b=i7Y/kxAqIAWJiusuEp9OrqDuv4wtWiwEPsYNnqQAQpZxKh6kGwAZelaUDY2JvifY4BbNsmmPQb4rAdBX4hB8bUVjF9es3pOVJ9cijLq+1dJIh2LsSfM/8jdrXQ1rrRnPSMlAyiymxULTu3+UDzrMihmIPooEgTUmI4Q8y8Yp+SRB1TlM3COWfp0OTFoIAG0u2muvIOpW6oi8sj8MntVQk1sZRrkk/2xsBMDaT7XsN4GOA35qZHpB2S87Ardp9HS2Aaeh/dPX39GBCUXCVE6CsGNGJ/S7WOLkV7UarXZpIpn4T/YkmpF9QHi22AtFVb/opO7Tkn27wd7clUrXpJgHLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ap5rbI7T2YHoieOw3WuyPTpR4cYmvQ+Gr4ZXJksRu2g=;
 b=WfzxuSGQPntJ9vuMmGyIQmnCztF6eFDOvHaNzWZl3apYrM1TDrtOiP5FH5wq4B4QXcbJ4rfg4RxBM0uTtTTBJMOMj/bkwUZAgZvsVGvjs4RK7Na+IupzHlKDQ/jEX96zDa70LFamjAQEYpcLvYGRBHQKbmxD0yWkwMXJyJTZDYg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 PH8PR01MB994531.prod.exchangelabs.com (2603:10b6:510:3a6::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.20; Thu, 9 Apr 2026 16:49:01 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%4]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 16:49:01 +0000
Message-ID: <07054475-6b07-4b19-a393-cbe037adef8b@os.amperecomputing.com>
Date: Thu, 9 Apr 2026 09:48:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: mm: Fix rodata=full block mapping support
 for realm guests
To: Catalin Marinas <catalin.marinas@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Jinjiang Tu <tujinjiang@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260330161705.3349825-1-ryan.roberts@arm.com>
 <20260330161705.3349825-2-ryan.roberts@arm.com> <ac7VD4Z85nS30GCp@arm.com>
 <ac-W9oNM_O5RTtaf@arm.com> <beacee23-c177-47a1-b8b5-743844b617a8@arm.com>
 <adTPFrlVCEt-hioX@arm.com> <bc4a0246-33bb-443e-a885-a31b24d4a022@arm.com>
 <adTh8d9k3y5ybemL@arm.com> <567dff89-9f0f-40a0-ab10-22e061b4faaf@arm.com>
 <adfDoatH8hj6zN7_@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <adfDoatH8hj6zN7_@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0175.namprd03.prod.outlook.com
 (2603:10b6:a03:338::30) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|PH8PR01MB994531:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a762f7b-b045-48c3-1746-08de9657e6e5
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|55112099003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: HoLiFlnCiH6LdwNZ02O47mUzS9V7q+ZDFMz/So1XPiWcy+pg7alFt6RaP1b0rKvK3FSEjdgjvQzc0UFA5ioaRNlpxo/mtcJp5o59bFdNBR7jKiu61x7LE8r09YX2yjj2t5G/AeQIsqnmAZOYmYSdecKtQfmk8Vk/6TQXZdf40T8P57ZpwoALatsQJyuBl6UER691nWk5DpzE71TtIDXIMvS5kaEnkF+5PW9k2RPGxaoymdw5/zwyu8tGrniRqBsdZCIaxs6KsJSmOA3mg58LxPmtoJZOkUzeYqSHBL0c8SShNZfcNf1n6M/qp6SnHmbwRou+Wclt1UJ7d6JhvKqGyPWBcTZPR9c1z4iq99OH2dWFxedBNuyCYQe/ql9NyiX1He5HFik88Bc0wsGku2zJFFK58cmQWPU/qrheeoiYk7GuB1zgSUZctmjouh8RtHl+xmX6+26MGph3/aOk08lPU8vb1LZv2hnuT+NKzOKaiVBCbTErfSOqceEmfEkqEs6nZHu1QFV2iBi6wdqlZkUf4p7X9EtfDqgdUhQPSAHiIlp2YxVzY3iN2PxyDFQnFfCHxN+TCOFtP2E1Ehl+v5y3jdrP88DDZBlffy4gzgN+eGyMgrVTqg69MmXeMvwpkabwv+BV9qtafssfG5UteCumz85O1/SivF/2rhV8Cv3ThcySAgMccIA+OAmvwH4ewfArTQDmECOXAse7CjEVISfMQ80b9BPitVRIdYkGcHClE+c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(55112099003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVBiVFFtU05pRmU2a0RuWlFTSTlqeHh2a1NrMHpPVlJ4T1pMcjVHUlNwclV3?=
 =?utf-8?B?ZXBUU0liUGhoYjVOTFVUUUlQa3dNMThYU3lXTGMzUlBYT2t5WFlZZjAxSWZt?=
 =?utf-8?B?YSsyUlFva2VPN2h2WWlpbk1OTmJrbk5tbTFTK2xNYU50OTl6Q01iVys4Mk4y?=
 =?utf-8?B?dlFUT0pEQmJiU2QycTZ2dHJnUTFqMVBycTRDajFtRjBtUGtleVUrYWlwa2Yx?=
 =?utf-8?B?b0N2dWlWTTF3dy9qeXFTSTBIREJ5VlBxSVlTVDN1dXlvdXhscmZHTSthcnJh?=
 =?utf-8?B?aHF5RDRGczlEMFd4NE5vWFppTEtHK1hFQkxaRHlNdmtlS0g3Mm1vSTN0NXJq?=
 =?utf-8?B?Tk16T09RbWl5RFNvMXNtM3Y3Tk5wYURaeEswWXZmaWEvMWtRb0Rld1VpY3JP?=
 =?utf-8?B?V0dwQnN5a2JZUmNaWWNqZUlYTWo5VUZQMWZJcEZQT1E3Y2ZMUndwN0Z4MVFh?=
 =?utf-8?B?MEg3MGxrNVZJNUFseHJoSlgxY1loNFNQakhLS1NBcGZKZXAzSWptdWVvc2xk?=
 =?utf-8?B?blY5SFJRWTJ6Z0xIS1FnNGtoUU8rZnBmeDlhMG13aDVOWnhsdnF3Q3NhMm0v?=
 =?utf-8?B?R1FGUFpRa0NOYkxhckZmYXYvektiZGptZ1QwK2RMZy9wWllBN1BVVmtyWlAx?=
 =?utf-8?B?aUxJUFlCRFRiMThxT09TOTdsT0c3N3ZFSzM4QzAxdWZPZzJ6TkZlRnpYbTgv?=
 =?utf-8?B?R1BFK0Vvc0x5OENDM29nT0JMNVROTUZNcmdRamp3TndRN2duWlVoK1dSaStH?=
 =?utf-8?B?MlRvdVdhUzZtWlk4Q0VFWk5VQ2paNkl5dVdVYmF0UWI3MU9CS3owRXcxSGMw?=
 =?utf-8?B?Y2VBK2VrQ29MUjU0Nldma09qUmpwRXFwSjRXNmlpd1hCcWVsYS9NN2VBdDhM?=
 =?utf-8?B?Rlpub1V6UnRqaCtRdzdBSTl6SXNwdzNaNitYcFB0THFJWDhEbGtwTTdUUjZM?=
 =?utf-8?B?M3VIUktHa2FOdFNhN3hZNDh0aXV6YlF6Q3REQmJyazJ6TktxQng1c1pnU29Y?=
 =?utf-8?B?OVRnWmgvM0ZRTEw4Q2w1Sk92Qjd6aW9LczJjNGZYNXZ5QzQ0S2VsOENiQmEz?=
 =?utf-8?B?bDZ1VFVEU3ZmZmNDTEhVVldtVTJWUmdzdzRPVFNDWGxtek9PV3l1QkhseXdM?=
 =?utf-8?B?R2I2SXdHZ1RHVnpadWVKNVN4TGN2QlBsMU9KaWprZEVaODh5d2hrWm1LNXhC?=
 =?utf-8?B?dURUQVo0SGpMMVdENm9QeU5BT3F4T0tnM2lFV3U5VGNXVHNIQ1pnZTFjY3ND?=
 =?utf-8?B?enFmTFpqM0ZwV3lpRXpMSTA2MlRXQUxkYnV1L1VRQktsWDR1bk5XWEIyZ0lB?=
 =?utf-8?B?S24rV0JUbVI5TnRxdDJKTmkrYm5zaHdRZE90WXJJYmdrN0ZZbTBQZ2NobkVi?=
 =?utf-8?B?S2F0cW5yakVhSmRoRUk0N3VVYzNJLzhaWS9wemlXT1M1Q1Z6dU1iSjgrV1Jq?=
 =?utf-8?B?OGxESjh6RDBPVGJVekxrYWkyRm1TVHd4T0JoSVp4MFplcmpMRG1zc2cxU2p6?=
 =?utf-8?B?cVBUR1ZBQUNvSHNqMHFqdllaK0VEVnE5QzBIbWtLSVRQRDJJaUN1OHd6Mmdo?=
 =?utf-8?B?ZW51ZEhVbzF1ZVRwdkV2eXV5V2h4YzYxby9Jc0tVckl6US8rSTZlcFBLVXFl?=
 =?utf-8?B?RFRLUjBrQmRkNXNGTXpsSUFPMElYRlhrbUNCZDhWL00wOEZJbEFBUDZmczlv?=
 =?utf-8?B?OTJZSE9XYjRXSm81cW1ic0VJN2h0Z2FaSkNxMDBJU1hTVWV5OXd3MXRHTzNa?=
 =?utf-8?B?Uk56SjkxZ3Y0dHgyeVZ5enBuL1JINEFpN1dTYkphbWc3c01KYmJpampTVkNt?=
 =?utf-8?B?alE5R1N2d2dXZW1QSnVUQ3BEaTdKWmVuS0JMSVd1QzNjeFFvRjBJYVh4ZTJ6?=
 =?utf-8?B?NGRhS2pKZGZUbHRoWUJ2a3dPcU9jblN6OG5UOENmT29OZDFzQW1JUTFEN1p5?=
 =?utf-8?B?TE9oWStBYndFcnRWSkR2MWhaT2VNNVRnTVlzSUVmS09SQ1QvTWhNMGFTMWNT?=
 =?utf-8?B?UHkrTGZ4RFlROUxYcE1uMFVlMzZhVDVyQWdwY2Jvb1lmbCtKa3AzUjRhMXN3?=
 =?utf-8?B?V0RMc3VTL2hMZ3hGNkR2WTBieFJObm5HaDJvd2tURFVteVUwUEwxMWRGcWtY?=
 =?utf-8?B?SEtVWW05Tmp3R0FxUmQ5bm91eHhESkhvc2RIRzNZczlIcUhmUkoveTFkYWFS?=
 =?utf-8?B?VHR1UStPMi9kN3dLcStsdWFldmM3ZlA5Q1c1d28rSUwxd0wyTXhiUVRVcFJT?=
 =?utf-8?B?V3hDZGJYbGZSUWlvVmdNbk9Wd0QwQitjWENOVHZ3TG1MZDFaNm9ZeDV1Q2c5?=
 =?utf-8?B?dkViOXJibUYxdDZoNVNRWkNLcU1UQjF2cGNHd2dpak8rK3pnNnFzNWQ0cXFS?=
 =?utf-8?Q?J9XfGmh7ExW1JeLM=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a762f7b-b045-48c3-1746-08de9657e6e5
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 16:49:01.4603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pdfMFrgWgm7gJtJygKNnPUnZCrknQ3Y7XgQaYIUjoHwSqU5SGQzFRfs6sJDK4RiPAyvxZAR17/WYNGH/KA7RT2d3KOHwAMari54uby28paE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR01MB994531
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_094908_511631_C70400C0 
X-CRM114-Status: GOOD (  24.33  )
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



On 4/9/26 8:20 AM, Catalin Marinas wrote:
> On Thu, Apr 09, 2026 at 11:53:41AM +0200, Kevin Brodsky wrote:
>> On 07/04/2026 12:52, Catalin Marinas wrote:
>>>> if we have forced pte mapping then the value of
>>>> can_set_direct_map() is irrelevant - we will never need to split because we are
>>>> already pte-mapped.
>>> can_set_direct_map() is used in other places, so its value is
>>> relevant, e.g. sys_memfd_secret() is rejected if this function returns
>>> false.
>> Indeed, I have noticed this before: currently set_direct_map_*_noflush()
>> and other functions will either fail or do nothing if none of the
>> features (rodata=full, etc.) is enabled, even if we would be able to
>> split the linear map using BBML2-noabort.
> That's what I have been trying to say to Ryan ;), can_set_direct_map()
> has different meanings depending on the caller: hint that it might split
> or asking whether splitting is permitted. The latter is not captured.
> Ignoring realms, if we have BBML2_NOABORT the kernel won't force pte
> mappings under the assumption that split_kernel_leaf_mapping() is safe.
> However set_direct_map_*_noflush() won't even reach the split function
> because the "can" part says "no, you can't".
>
>> What would make more sense to me is to enable the use of BBML2-noabort
>> unconditionally if !force_pte_mapping(). We can then have
>> can_set_direct_map() return true if we have BBML2-noabort, and we no
>> longer need to check it in map_mem().
> Indeed.

I'm trying to wrap up my head for this discussion. IIUC, if none of the 
features is enabled, it means we don't need do anything because the 
direct map is not changed. For example, if vmalloc doesn't change direct 
map permission when rodata != full, there is no need to call 
set_direct_map_*_noflush(). So unconditionally checking BBML2_NOABORT 
will change the behavior unnecessarily. Did I miss something?

I think the only exception is secretmem if I don't miss something. 
Currently, secretmem is actually not supported if none of the features 
is enabled. But BBML2_NOABORT allows to lift the restriction.

Thanks,
Yang


>
>> This is a functional change that doesn't have anything to do with realms
>> so it should probably be a separate series - happy to take care of it
>> once the dust settles on the realm handling.
> I think it can be done in parallel, it shouldn't interfere with realms.
> The realm part should just affect force_pte_mapping() and
> can_set_direct_map() should return just what's possible, not what may
> need to set the direct map.
>


