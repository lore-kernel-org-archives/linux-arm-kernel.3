Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E841C44500
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 22:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C+RKwGUqQMEfJjWNkt9d66h2E8QZXvSvWeKGJ+IE1lc=; b=GPBT4HRonU1N529ADiT3igbCky
	f5fAcP0mp5ShD3IBBstnzixPKB4/9q95kHjYtczTJO4Gta8GyVmk3h0lJbfH9P6n85yscbBokUWhm
	va96jrAOrvxv2ZAoqHgJlTMmhl3FfkK+3UW+XzI+st0d256XMY0n/wdl+x7MK8vBSKe3uQGGYX1wQ
	+KmAnM7jjaIEe9mxahgkl1c6FLnYAmODAbU+iupHW/wn1hPaUTJLAQcEKT3azoNMUwKM/i2jx0N+3
	4PAT+Qgr5hit/mEHjYijhRFMicnXQrFPN0yAsAWr2c/pVjNABf8SWcVDkM8revZvodP5tHklY+9YR
	fpVRzRYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vigwF-000000067mX-27mu;
	Wed, 21 Jan 2026 22:44:35 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vigwD-000000067m9-00KD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 22:44:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dIN8ajnr7kR8RmaUnnS+ei1PXe4XId8Q1kTrHuS6pEcFRempnG66HwjNEbJ8ksq/omfhlWKdSLGANwpAJa4w+mjxipS3xy7A7CWH11BEDQwzfxSMZDBCnIlp85MfplmA/jf+2dHco5CFY9YhtuvbY25z85lCbfBFz/0s/p+Y15ZhIxsaw4sGWqpFtxi48ZXtqAmDz6TNbdmmQ1SEAOD+MafamgBKkbxcgon6dw9rrDCJls18C9xHEhEDH1jpVei3zkRtAmCu0ltGOgToU5XMA+xlbl8Ksw+cayfOFvJxsU4Ma+k2PKc3zYH9MZrMOHCvgb2EGSrcoCetNBHEmmD6Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+RKwGUqQMEfJjWNkt9d66h2E8QZXvSvWeKGJ+IE1lc=;
 b=rBrH4PRkMDZXaaNTgIvKaAUsDWOCDFIOuUHskWom3mJFCnNdu7/0X8aFV0edKua/WRTqn9VcyVDoFaQU4vDJN/fpxqKJ7dTBQbpzU8hMKL3hr673JKRSsLbus483lmoCzL/njAWtLKZ2e71g8gq01Y/CbMnNq8NkDiSvGn6DZZ3uHBXwYpxJZz9WQ0nG0bSitihMdKyKqQfolTBvLNWsoDsc+Rs452GNI1uVoV0QjOXSWWr4x+TU40vSNGLDxqPBn8V7EXHhXZSl6jNlmO0VfRU0iTsVL5siuiN1MXBq5K2ZMPmKR+cHSQLXGPhwmLns3OFR2vRAFw6rw5bgKIKCHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+RKwGUqQMEfJjWNkt9d66h2E8QZXvSvWeKGJ+IE1lc=;
 b=O78Hj0WUfdJvYNb0o2eJXwXM1iSi36Bevk0FPvg/bL/eYE4qvACp0FYH7ZUFUGE3+opOdLMo01kboNRM12IWXzs/MvlNE4tP9YxBCT3gslbVPQJV28e2s5DLVVf0XTF2/exal9B7nlSPsOxAEd5RYoDmSEVSNd9gZM9+6fsbBEg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 DS0PR01MB8009.prod.exchangelabs.com (2603:10b6:8:149::18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Wed, 21 Jan 2026 22:44:26 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 22:44:25 +0000
Message-ID: <70b37582-fd26-4d23-a6d6-9a98e3f2eecf@os.amperecomputing.com>
Date: Wed, 21 Jan 2026 14:44:23 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
To: Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, cl@gentwo.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260107002944.2940963-1-yang@os.amperecomputing.com>
 <aWZYXhrT6D2M-7-N@willie-the-truck>
 <bdd7bd07-dbed-432e-ae87-dc6381c05ddd@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <bdd7bd07-dbed-432e-ae87-dc6381c05ddd@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::24) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|DS0PR01MB8009:EE_
X-MS-Office365-Filtering-Correlation-Id: d4f60cb0-8bac-4bdb-a962-08de593ea0d1
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VU44a1hhOXJPRGxNQngzTXFsRm5TaFVXVlFXSk5McHZTSkRCbDlyLzhHTzl5?=
 =?utf-8?B?K1kwMm01R3JNKzlBelgvalZVNlh0bzY4bkZ3Y1MyYWxMa0xyQnVQT3pjSlVM?=
 =?utf-8?B?cWNzeUFKY0lPemticWNaQTF3SWo1d2lFMUNhZW5zdWVVbEN5aVdKQUVNTVE1?=
 =?utf-8?B?L005Q0lRNlRNeWFDM2NKT0I5cWF2M0o2UWNTQnhyT2RUbU4yYk44blJrdkRm?=
 =?utf-8?B?bVpXQnNZV25KSWVudVVySHFGSmZiWkc5MUpZcTJUTnZLWS9TT0d4TWI5Z0Ro?=
 =?utf-8?B?SVh4SHJVb2VUTmlkVm1RcXVoL3RZWTd6ZFp2TzdFZUF0cldvV1BGTlJUS1Ux?=
 =?utf-8?B?ZTUwSVFTMjVCcVRnZFNlV1BkRXV1SnRyWnV0UFRiWS9NZVp2dzJldmswQ2N4?=
 =?utf-8?B?TlBMTzM0d29ESEhYL2Q3SExNUDNocWZKaFF0QXhiYnMrVlVRWlRrVjMwem1Z?=
 =?utf-8?B?aWJOOFZDUkdwWjBGclBXdWZpbFpiaUtreE8zc3VjQzB1WEhRRVo3YWdHYmdI?=
 =?utf-8?B?dnJFdlN4dVRtNCtwdEF6cmhsMzBCOHcycnk2ZHFJMVA2RHBKRlhnNGRHQXUx?=
 =?utf-8?B?cTlxTFhGbU0xVHpYSThRNVdSQ2hBWVdyS2srdGtlR0RwWm9hdVhMcEJaekdw?=
 =?utf-8?B?S3pyRlNpa3J0dXh3ZncxQ1NvcUsxSVNSd0xEL1FrR3NpRWxuVnNSUEJjVThE?=
 =?utf-8?B?cHcwN0pvRElpcnhhTjMzYTJqbGVsMGhYd25QeS9Pcjg2UGY2MkkwRlkvb0Ew?=
 =?utf-8?B?ZEpyRUJJZGlSdWhJeXdreE9teWgrVkJBT0tTY2tiZzhaVXNHMTFBZGdMRGZO?=
 =?utf-8?B?cTBZRmRZMVB2RVBScCt1M0xyYk1ZMUNtNlJsYjdLYTVjbHQrYXRBL1YwdC9D?=
 =?utf-8?B?MzR2ZGNmKzRMMlB3QTdrTjkwR3RmOUZzTG1YMHJyaTNVMkljZnJKSktnU1F4?=
 =?utf-8?B?RlV0VklWTDZQRE9zakh5QXBnbkUzeUJsdUVsUnBuYlljbUtUcGVYNXVmYWVT?=
 =?utf-8?B?VU5ZNTkyaW5TWTgyQ3hiMFBINzdmTVRVQzRyK3hmSzRDQkR4K1hiblBIbE5m?=
 =?utf-8?B?KzlUR05VLzI3S05yR1BjbCt3TUZZcjZqYmluZDhCNTF3SkJyWVBUdmc3Z0Nx?=
 =?utf-8?B?dStTc2FJNmV6eW1GZ1pURlZIaU8wTG12TmRqQzVtOWtiOTNhVng2dWJIN1dU?=
 =?utf-8?B?ZTU1SHRnUEtHdUFSU2EwRDhJZW50M1VaQTA0OW91QXpvM09rSk5kZmZJclNE?=
 =?utf-8?B?RGdkSEk1eWh2Z3B3Ukd5RHBUNUNnbC9QMWphVk9tTVczME85R3hGZ0R5S090?=
 =?utf-8?B?eGl6MzFIMGtOUTN4eE44cEtMdjh0Mmw4bWhTcTh1aTJsYjEzNENRR3NSVTlm?=
 =?utf-8?B?TGpYRi9pR2w2c0I2bE9XU3RyRFNrdVFoYkRXWFJDcENiWnhYUzdTdVJQOG9T?=
 =?utf-8?B?NTlNR3ZNM01zbWcwUWxNZUE0cnYwRmYxOFdzY3VhZHR3aVQwaFVoV2pmNnc0?=
 =?utf-8?B?NmhyY1VVVWpxQlQ5L0xIbjcxcDdVUFJJcUVRR3V4dkFjdG5xcllpeFBRZWhH?=
 =?utf-8?B?bzJZbGtWVi9yb3FQaEdVZlJJdlpWMHZCdWpQVVNFbFQ4dWQyNjZEdGZVSHkv?=
 =?utf-8?B?UmFzb1VqZFdzT3dzak9JTWNPMnNzQ285RTFjRXY4V29KemRCQko2MzNlS1Bp?=
 =?utf-8?B?YURPcGV5NDZQY3lvd2NSRFpiZmVQeERMTW5YazlHVGRkeFBxZERJRzFmdmJR?=
 =?utf-8?B?V1FVaHM5dEZOeTN0bUpPZGdtbjFVaDJVTXI4TTNUSFgzUUVNcWpoNGZ6NUlx?=
 =?utf-8?B?N0FiRitsSUhNOExUeHpVbXBFWWxPWUcxYXE1cVRacjJIU1l1UTFmQlR3OFhT?=
 =?utf-8?B?b09xdndObXl5UGI0dTFvUG42TElvNmV4ZjNVVGR1VWlaOVZ1a1Y3blJRMUFs?=
 =?utf-8?B?dWhyOUIzRW1Xd1BYY1dXbHhNY3pqTWhBQlFkdm43a3JwV0JyZ09yaEhneEF5?=
 =?utf-8?B?UXd0T1FoTEQ4bzJZSElVUVVpTnFBaXluY2pVcHVKL3NTNDJUREd2UE5EdG1i?=
 =?utf-8?B?dTh2aHZkWGd4SDMxTTFlb3A4cmZpeTdleWNpckhPd1JNNU9YWHpSMC9QdDVz?=
 =?utf-8?Q?3OsA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajlXNG9PcC9NUmQ4a0tycnl0bmg0Q1I4eXFJOVB0SGdwUFhLdElZR0pXeXdF?=
 =?utf-8?B?OHpPZklLWEFlMURYMFNPOWJxNFlabHVydlJsbGp0OXFCaUYxRnJZRUowbVhP?=
 =?utf-8?B?dlNrbmFNODc1M0Q2QkNDYWx5TWk5eUV3RVBwZmhqN2dNdWhaS09PT3d5WVVN?=
 =?utf-8?B?RVBZRkV5eHh4Z01CSGJhZlF6d0svNzNQdlJZSWpYYmEwWXJLRmpBcVYrRGFP?=
 =?utf-8?B?QlUxWUI3bkFlNXQ5Mk51L3hsRUNDM05xOWVRR29EdmdRNEYxdmRTNW0zcFZt?=
 =?utf-8?B?YWp0WE5DdU5iUVRlU0tnL2UyWXlwMXhFYlErZnoyWTh0VHRpN2M5d3BQV3A0?=
 =?utf-8?B?MEQvRlIvcTc2b0dqYkdyem9iSE5BR2VDNjhsRkZmbFlxbVN3aGd1UUNqZURT?=
 =?utf-8?B?ZWpoYmNzOGFUM1pyc3BQZ3E1UGp5bGFBK1VUTVlNZ3dxOWNNanByQ1NaV0Zo?=
 =?utf-8?B?UHNKL21jWDVUWXFOaXRyZURGTiszUXA0dG40ZHVZYkxvOW4wSWpFNWdwSXRK?=
 =?utf-8?B?UTJxZXkrVnlLeXZyNG5VdDJmL2lmcmwweDk2ZnFEZDc4NVg2c2tWMGEyODdj?=
 =?utf-8?B?N2V0RTBhaDhLRjJFZEw3cTV0M1VrR2hCaDRBTDJkNDJEM3h1eWcxbkF1SUpM?=
 =?utf-8?B?RDEvamt0N0ZMWllPdFhnbVd6RVpvTERpSTBic2doajdIVGg1Y0tOR3VLa0NN?=
 =?utf-8?B?RmxuUWtTSTVDNFV4S2VDODlMV2J1Yks1RGR5cGdBd20rMlF6K0E4cE8xMFRw?=
 =?utf-8?B?MjUycTRIcTBIZGNRSnhTb1ViRmwyRTlmSXlhdHFxaUgxbnFIa0dNTklYUlh3?=
 =?utf-8?B?YWx0N2NvdTA1MXhDRlB0dmRsV0plVUthUmFmamUrZFR2ZXRVZ2prT2dQUCs2?=
 =?utf-8?B?NStpK2pKcy9uL2ttL0krdytPRXh6ek45ZHFZcWlxU3F6bnRYck1OVU5xTEtW?=
 =?utf-8?B?aEhJZEx0VjZxRGlvNGpKQ2JnMkZRNTRwb0FyckxvQ1lOTEs0Vk44Zm9nQ3hR?=
 =?utf-8?B?QWNreW9GSmFTMjJ4dDJlL2psUWxoazYxT2VTRHpqYlVpaVNvSGkrYnNkOUYx?=
 =?utf-8?B?aVRRbU9kMGZha3J3MThQU2xxT0JPRFVyaEViYWpMQXNaSUFDVUR2ZHFyelE1?=
 =?utf-8?B?SzBkQk5wb2JrTlh5RHoxa0NmRTh4YVA0dFczM0ZlSXRaWWtZdndJWmluOEtY?=
 =?utf-8?B?dFljOGdyU1J6T1lETDRkRU4yOGlMcHhZV0N0TitCV3Jld25EQU5nTUNKT2sv?=
 =?utf-8?B?M3dZRWhoYnA1aEhCT0VxRkltL3NtVkUrRngyM1V0ZkZFMno2ZUJIT0FOb1dK?=
 =?utf-8?B?bmpUd3Z0aUhVZzdPbnFmODNZS2V5aCtBMExWSjFWa1lJUCtBa0tPb2pNV21z?=
 =?utf-8?B?Ullzam4yOFhmUEFva1VGR1lVYjN0bGhGVHBEWG9sQ3kvQlptZS9mbVZ2UFN6?=
 =?utf-8?B?Q2l4K21NZXExYUZiMjljQkpGLzFIZ3p1ZGt2YUtzTTJFTkpjbnpXM0kvaVFq?=
 =?utf-8?B?bEtMbURNd2NVWUk1S1RmSEw3OGpSeVowek5CeDR2Znl3SHhITzFpSmFYMjAv?=
 =?utf-8?B?SVlwT0tVdTRBR1d0ZVZKOHNaTU5qZ2JRdUthRml2cHp6RkNYMEpBcERodXZx?=
 =?utf-8?B?TDdscmlsTXVIaDFMRk9pWkQ4OUlHOEVuY3VxRk5SeEF5QlIwbmhxYVd5UGhs?=
 =?utf-8?B?MzlaeExNcUFDSGQ3MnNLTnNadVQ2WTRlOFlramVORDFnTERGMUdFV1crdFE4?=
 =?utf-8?B?S0FaKzFCSzMvK1ZjTEFpS2VPSXpOaE8zQ00wSC9xOWZiTXd3VmRKaVkrYkwz?=
 =?utf-8?B?WVJaNzVXWkd5d0kyL1IvQkhBYXFCanowYnJ6amZkcDMxYm8wcWdGWDl1c1Vx?=
 =?utf-8?B?T0toSFlCaytSbGFQUm5rWlYwR2NLYnBoaTQ1OHZFOG8wd2JLTk1HelJZRGNE?=
 =?utf-8?B?aCtOSEgxSVFXc0J6M1VtVjhtc1dmZmZYL2U3VFJGMEMwOVViOW9HZmtHNDNh?=
 =?utf-8?B?N3ZvNUR4NlltV0djelp4aXdRZVJMcmI5UEJ2UmhHU3hEVEVpWE1oaDFzUk1R?=
 =?utf-8?B?d09ZRnJUVHVOa0hFV1hlL3p5UG96R1BrY2ZjaXVqQW5paGRwdkljY0JlVk13?=
 =?utf-8?B?YS9wcGhJTDl0aGFyQlhHMEVZN1hOWUJGbTVxRzYxaVJ2M2l3bEtOaTc0cGRC?=
 =?utf-8?B?akxmNDZMUVJ6NVVNckxKNHYrVUwrY2owTlBtREZkTURFbm9jMUF1bEV0VnRv?=
 =?utf-8?B?UWJCa0dYZ1o0eTRWdXZkWFF4WG5jQ1JqNWM0bDV3TFp2Skd6WDdKUitraUZQ?=
 =?utf-8?B?eVNkTUFTOFc2Unlld1pYMWNVakswYWtjZEpwTmRLYWFHVnZGRFNkVjQzWWl5?=
 =?utf-8?Q?DfgSIvF5UhH1EIkc=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f60cb0-8bac-4bdb-a962-08de593ea0d1
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 22:44:25.6856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ru9RpJcDQz4ms46vOFDudYQQHU6U/do7Drs+7OV6yn++DOqDKi05SBrfA8MuNXy1wSujPOrCHmVgoBbI4uJsBjBEAhVYv8M9WGPDDHadzhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR01MB8009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_144433_155022_666DCA5E 
X-CRM114-Status: GOOD (  18.35  )
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



On 1/21/26 9:23 AM, Ryan Roberts wrote:
> On 13/01/2026 14:36, Will Deacon wrote:
>> On Tue, Jan 06, 2026 at 04:29:44PM -0800, Yang Shi wrote:
>>> Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
>>> rodata=full"), the direct mapping may be split on some machines instead
>>> keeping static since boot. It makes more sense to show the direct mapping
>>> use in /proc/meminfo than before.
>>> This patch will make /proc/meminfo show the direct mapping use like the
>>> below (4K base page size):
>>> DirectMap4K:	   94792 kB
>>> DirectMap64K:	  134208 kB
>>> DirectMap2M:	 1173504 kB
>>> DirectMap32M:	 5636096 kB
>>> DirectMap1G:	529530880 kB
>>>
>>> Although just the machines which support BBML2_NOABORT can split the
>>> direct mapping, show it on all machines regardless of BBML2_NOABORT so
>>> that the users have consistent view in order to avoid confusion.
>>>
>>> Although ptdump also can tell the direct map use, but it needs to dump
>>> the whole kernel page table. It is costly and overkilling. It is also
>>> in debugfs which may not be enabled by all distros. So showing direct
>>> map use in /proc/meminfo seems more convenient and has less overhead.
>>>
>>> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
>>> ---
>>> v5: * Rebased to v6.19-rc4
>>>      * Fixed the build error for !CONFIG_PROC_FS
>>> v4: * Used PAGE_END instead of _PAGE_END(VA_BITS_MIN) per Ryan
>>>      * Used shorter name for the helpers and variables per Ryan
>>>      * Fixed accounting for memory hotunplug
>>> v3: * Fixed the over-accounting problems per Ryan
>>>      * Introduced helpers for add/sub direct map use and #ifdef them with
>>>        CONFIG_PROC_FS per Ryan
>>>      * v3 is a fix patch on top of v2
>>> v2: * Counted in size instead of the number of entries per Ryan
>>>      * Removed shift array per Ryan
>>>      * Use lower case "k" per Ryan
>>>      * Fixed a couple of build warnings reported by kernel test robot
>>>      * Fixed a couple of poential miscounts
>>>
>>>   arch/arm64/mm/mmu.c | 202 +++++++++++++++++++++++++++++++++++++++-----
>>>   1 file changed, 181 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>> index 8e1d80a7033e..422441c9a992 100644
>>> --- a/arch/arm64/mm/mmu.c
>>> +++ b/arch/arm64/mm/mmu.c
>>> @@ -29,6 +29,7 @@
>>>   #include <linux/mm_inline.h>
>>>   #include <linux/pagewalk.h>
>>>   #include <linux/stop_machine.h>
>>> +#include <linux/proc_fs.h>
>>>   
>>>   #include <asm/barrier.h>
>>>   #include <asm/cputype.h>
>>> @@ -171,6 +172,85 @@ static void init_clear_pgtable(void *table)
>>>   	dsb(ishst);
>>>   }
>>>   
>>> +enum dm_type {
>>> +	PTE,
>>> +	CONT_PTE,
>>> +	PMD,
>>> +	CONT_PMD,
>>> +	PUD,
>>> +	NR_DM_TYPE,
>>> +};
>>> +
>>> +#ifdef CONFIG_PROC_FS
>>> +static unsigned long dm_meminfo[NR_DM_TYPE];
>>> +
>>> +void arch_report_meminfo(struct seq_file *m)
>>> +{
>>> +	char *size[NR_DM_TYPE];
>> const?
>>
>>> +
>>> +#if defined(CONFIG_ARM64_4K_PAGES)
>>> +	size[PTE] = "4k";
>>> +	size[CONT_PTE] = "64k";
>>> +	size[PMD] = "2M";
>>> +	size[CONT_PMD] = "32M";
>>> +	size[PUD] = "1G";
>>> +#elif defined(CONFIG_ARM64_16K_PAGES)
>>> +	size[PTE] = "16k";
>>> +	size[CONT_PTE] = "2M";
>>> +	size[PMD] = "32M";
>>> +	size[CONT_PMD] = "1G";
>>> +#elif defined(CONFIG_ARM64_64K_PAGES)
>>> +	size[PTE] = "64k";
>>> +	size[CONT_PTE] = "2M";
>>> +	size[PMD] = "512M";
>>> +	size[CONT_PMD] = "16G";
>>> +#endif
>>> +
>>> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
>>> +			size[PTE], dm_meminfo[PTE] >> 10);
>>> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
>>> +			size[CONT_PTE],
>>> +			dm_meminfo[CONT_PTE] >> 10);
>>> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
>>> +			size[PMD], dm_meminfo[PMD] >> 10);
>>> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
>>> +			size[CONT_PMD],
>>> +			dm_meminfo[CONT_PMD] >> 10);
>>> +	if (pud_sect_supported())
>>> +		seq_printf(m, "DirectMap%s:	%8lu kB\n",
>>> +			size[PUD], dm_meminfo[PUD] >> 10);
>> This seems a bit brittle to me. If somebody adds support for l1 block
>> mappings for !4k pages in future, they will forget to update this and
>> we'll end up returning kernel stack in /proc/meminfo afaict.
>>
>>> +static inline bool is_dm_addr(unsigned long addr)
>>> +{
>>> +	return (addr >= PAGE_OFFSET) && (addr < PAGE_END);
>>> +}
>>> +
>>> +static inline void dm_meminfo_add(unsigned long addr, unsigned long size,
>>> +				  enum dm_type type)
>>> +{
>>> +	if (is_dm_addr(addr))
>>> +		dm_meminfo[type] += size;
>>> +}
>>> +
>>> +static inline void dm_meminfo_sub(unsigned long addr, unsigned long size,
>>> +				  enum dm_type type)
>>> +{
>>> +	if (is_dm_addr(addr))
>>> +		dm_meminfo[type] -= size;
>>> +}
>>> +#else
>>> +static inline void dm_meminfo_add(unsigned long addr, unsigned long size,
>>> +				  enum dm_type type)
>>> +{
>>> +}
>>> +
>>> +static inline void dm_meminfo_sub(unsigned long addr, unsigned long size,
>>> +				  enum dm_type type)
>>> +{
>>> +}
>>> +#endif
>>> +
>>>   static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
>>>   		     phys_addr_t phys, pgprot_t prot)
>>>   {
>>> @@ -236,6 +316,11 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>>>   
>>>   		init_pte(ptep, addr, next, phys, __prot);
>>>   
>>> +		if (pgprot_val(__prot) & PTE_CONT)
>>> +			dm_meminfo_add(addr, (next - addr), CONT_PTE);
>>> +		else
>>> +			dm_meminfo_add(addr, (next - addr), PTE);
>>> +
>>>   		ptep += pte_index(next) - pte_index(addr);
>>>   		phys += next - addr;
>>>   	} while (addr = next, addr != end);
>>> @@ -266,6 +351,17 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
>>>   		    (flags & NO_BLOCK_MAPPINGS) == 0) {
>>>   			pmd_set_huge(pmdp, phys, prot);
>>>   
>>> +			/*
>>> +			 * It is possible to have mappings allow cont mapping
>>> +			 * but disallow block mapping. For example,
>>> +			 * map_entry_trampoline().
>>> +			 * So we have to increase CONT_PMD and PMD size here
>>> +			 * to avoid double counting.
>>> +			 */
>>> +			if (pgprot_val(prot) & PTE_CONT)
>>> +				dm_meminfo_add(addr, (next - addr), CONT_PMD);
>>> +			else
>>> +				dm_meminfo_add(addr, (next - addr), PMD);
>> I don't understand the comment you're adding here. If somebody passes
>> NO_BLOCK_MAPPINGS then that also prevents contiguous entries except at
>> level 3.
>>
>> It also doesn't look you handle the error case properly when the mapping
>> fails.
>>
>>> -static void unmap_hotplug_pte_range(pmd_t *pmdp, unsigned long addr,
>>> +static void unmap_hotplug_pte_range(pte_t *ptep, unsigned long addr,
>>>   				    unsigned long end, bool free_mapped,
>>>   				    struct vmem_altmap *altmap)
>>>   {
>>> -	pte_t *ptep, pte;
>>> +	pte_t pte;
>>>   
>>>   	do {
>>> -		ptep = pte_offset_kernel(pmdp, addr);
>>>   		pte = __ptep_get(ptep);
>>>   		if (pte_none(pte))
>>>   			continue;
>>>   
>>>   		WARN_ON(!pte_present(pte));
>>>   		__pte_clear(&init_mm, addr, ptep);
>>> +		dm_meminfo_sub(addr, PAGE_SIZE, PTE);
>>>   		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>>>   		if (free_mapped)
>>>   			free_hotplug_page_range(pte_page(pte),
>>>   						PAGE_SIZE, altmap);
>> Is the existing code correct for contiguous entries here? I'd have
>> thought that we'd need to make the range non-contiguous before knocking
>> out the TLB.
> The Arm ARM has this, which makes me think you are probably correct:
>
> IVNXYF:
> The architecture does not require descriptors with the Contiguous bit set to 1
> to be cached as a single TLB entry for the contiguous region. To avoid TLB
> coherency issues, software is required to perform TLB maintenance on the entire
> address region that results from using the Contiguous bit.
>
> I've asked for clarification internally. But I think we should hoist out the tlb
> flush regardless because it will be faster if we just invalidate a single range.
> I can handle that as a separate patch if you like.

Thanks, Ryan.

>
>
> However, I think there may be another problem; IIUC, any old range of memory can
> be hot-unplugged as long as it is section aligned. It doesn't have to be the
> same range that was previously hot-plugged. But if the linear map is block
> mapped, the range being unplugged may cover a partial block mapping.
>
> For example, with 4K pages, the section size is 128M, so you could hot unmap
> 128M from a PUD leaf mapping (1G). What am I missing that means this doesn't go
> bang?
>
> This would have been an issue for the non-rodata-full config so predates the
> work to split the linear map dynamically. I'm not really sure how to solve this
> for systems without BBML2 but without non--rodata-full.
>
> I must be misunderstanding something crucial here... I'll dig some more.

I'm not expert on memory hotplug. I'm not 100% confident my 
understanding is correct. But I noticed something that I misunderstood 
before, when I was testing the patch.

The hotunplug actually has two stages: offline and unplug (physically 
remove the device).

When we echo offline to the sysfs file, it actually just does offline. 
The offline just isolates the memory from buddy, but it does *NOT* unmap 
the memory from the linear mapping. The linear mapping will be unmapped 
at unplug stage. I tested the patch with QEMU, I just can emulate 
hotplug/hotunplug the whole dimm, for example, hotplug 1G, then 
hotunplug the same 1G. I can't emulate hotunplug in the smaller size. I 
thought it may be the limitation of QEMU in the first place. But I 
realized we can't hotunplug a part of dimm physically either, right? For 
example, we insert 1G dimm to the board, we can't take out 128M from the 
dimm physically. So IIUC the partial unmap of linear mapping should 
never happen.

If I read the code correctly, the code does unmap the linear mapping on 
memory block granularity. The block linear mapping is unmapped when 
removing the first block if it covers multiple memory blocks. Then the 
page table will be none when removing the later blocks, but it is ok, 
the code just continue.

Thanks,
Yang

>
> Thanks,
> Ryan
>
>
>
>> Will


