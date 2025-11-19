Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BEACF58C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 19:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=coPxr3tM/95wAL2fC3rjdQ+gckap2ZUPWw6EgzxX+SI=; b=upRZZ/NEqSssZstda78MYhEDmD
	JQz+pkg0Rety6HZVAyYMya10N5rQ7nB8ph4SBuHt8hq9693Svxq6nupo5hZFfYpKPvLa4NXs3nsiH
	Iv6WapCr+GT3EdFu2M0Y6VjJbNd70rCJ2+vjOfX1Xo83mauxCJsevLAz5onMRDtvboQDwSfE7cJN3
	rCXzkeJbTpJ5CAa2OWLofkWap5HJZ7/zQUh1FLL+wNersM0yDFgoNeynR5QekBSesncSyZYWujQ8t
	F1bQHi1SF1BwL96mE0zOq1U6+w1MWWLwf3qDia+9RYFlxoBpFxYKIF1tq76MDABDiMA15Mg1oBasJ
	f/JxRuSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLnzY-000000056GX-029a;
	Wed, 19 Nov 2025 19:37:24 +0000
Received: from mail-eastusazon11021081.outbound.protection.outlook.com ([52.101.52.81] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLnzV-000000056F5-27gF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 19:37:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2IDfkJIOBH+st+3YUO4nEDuS/aoMRJY3tuBy5JS1ZKyrGlJkpAu3bNqB9Olh84u9n4u67/ssb8WVRlA6UdGEDhu2g96yP8+ouz1Hj25+dpNpHUIgzJtQqC42PqpYWcd0tF5CFJTfI440NSxyqAPKahw3c0Rrku+xPN4G7IpS1wqBvKUeHWR7qeMXRR4FOQ+hBJWDnrwITMOjpjEctu90XqgRja9nHLNkDRqPn1yEJGnsMTA5Bk61HNea+cj6yS/ZAZrkncLlg6+R+PVmzgh1djtpXr8FU5xweO9tQE67403ZV1mKsE/q3U198ZIwPFpzpL4xAWzCWYijATLOu0f+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=coPxr3tM/95wAL2fC3rjdQ+gckap2ZUPWw6EgzxX+SI=;
 b=BtXssZBmwumvTgV8L7Kua77RwcU3HGYzM/i2sFbfR3jZBcYBFuHrEWAIX2Pn5JFtmmP58ETVwiTfMUO8NMEX+OAh79UrMQFx0i3W3D4ZKYU0qCyqwceHtuPOxuGfNO5csGib6ghXZcgiibJyuE3latlU91UeyJvqJu8OuAHgjRnRy7iXD+AWyv68u4fcm1/6hxa0peEme6x//p4Q32IfROCM62D+ggndabEfXU9z9yXCL/hZe8Qf1WTkNa9EHLq/poFJsv37LLNfZtM6BMThtB2xifH9KM26VIZ1KeqUyLyt2ZdWweCPzIbNQ5wPy5oZKqAeqOSXKdHHRQ2dnDZWfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=coPxr3tM/95wAL2fC3rjdQ+gckap2ZUPWw6EgzxX+SI=;
 b=sSjRVw1z9YWEy5MdjB3BA0XUgkQzF6FrU2QCaNJKU8cpOUlmZ5iIfVC2qbiVFpcLwQJG/McGtaK+m1YkHtYCgL1aUFZNCI0LpIY65LlgSPHwt4n3hgiMxhscktXf7VY90GycyHEqj431U4fDg/PlVq6ZyTSND6i3dcDwazZakHY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 CO1PR01MB6551.prod.exchangelabs.com (2603:10b6:303:f4::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Wed, 19 Nov 2025 19:37:16 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%3]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 19:37:16 +0000
Message-ID: <76803fd4-7a7c-4018-b2cc-8e36cba60729@os.amperecomputing.com>
Date: Wed, 19 Nov 2025 11:37:13 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
To: Catalin Marinas <cmarinas@kernel.org>, ryan.roberts@arm.com,
 cl@gentwo.org, will@kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251023215210.501168-1-yang@os.amperecomputing.com>
 <176357957114.2095636.13353317001365823131.b4-ty@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <176357957114.2095636.13353317001365823131.b4-ty@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0129.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::14) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|CO1PR01MB6551:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aede390-14db-4c2c-a1b8-08de27a30bc6
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmZ1ZVVoOWxvSEZIeDdNQlhZclpXVnpjN3pVYXRBbkZuN0FvSldGdnZLOGZQ?=
 =?utf-8?B?L3dPVTc4L01wK1hPemxVcjhycGJ2WmswRnMwZEYydHVSM1U0bGtSRzVUSHVu?=
 =?utf-8?B?Y2ZLZGxmUTZRUkNyNDZHK0tHMkRLR2E3Sk5BWkprVnNPWG8yTkpOajFDVlJy?=
 =?utf-8?B?TlYxdEpBOG1ZYkhMR2t2a09GU1hkT2pzZGhTQVlrb3RrRlZQSnJ5bjkrckVR?=
 =?utf-8?B?dDJvMXVnQ3MwQ2ZOOXlSUDNIWUtRM2pLT2VYT3lNNHpqa3BFY0lGdXEzT0hI?=
 =?utf-8?B?TmpRdHQyMWt0TlV5enFDV2F5VkhjdVdicUxhdy9vUWdJUkFlckRSU1RFRE9U?=
 =?utf-8?B?Y2lXS0RuODljTHN2Vmk3Mk1kWXd3bHljS1U2VDE5OFFyZ3dPcW1TeGhQOTVn?=
 =?utf-8?B?cDVnc1FvSXFaUGlPZWlYcnA1aXM3MndSbTNDYmk0N0JZcjhLWWpZNXZjVUdC?=
 =?utf-8?B?Z3dtUnFIOHBLWG0zYjllSTl6ZTYrRVRXWVJKV3dwODFZaEJvUG52TEFUNXhQ?=
 =?utf-8?B?QnJrN3NUQmV2cy9uTFV3cUdvMm5qaUw2YkZPSVQzTXdBYmRCVi9BUGovcEVB?=
 =?utf-8?B?QUgvMXN0VXJYeDgvcTZOdCtLRklZOWRwVHJydWlwUVpIODBtR2d5THF5L21X?=
 =?utf-8?B?YVhrcUFpYkQyNnU2ajlzWWI4R2FLanpPaFZQdjZwYzBhM21Fb2RseTFscGRk?=
 =?utf-8?B?aSsvWjN3T2ExRlZQL25nYVBiblRuVVUyTnRsZ2dCZWpVRUxGeDgvR1dsZkgv?=
 =?utf-8?B?WWVBdVR5SE1xajcvTmhFeGJjdWhkVHV6OVBEMnU2ekY0WnVXaVcvUkxmNFNt?=
 =?utf-8?B?bk9iK2VwK2JrcGFOeWFSUEorVTZMTTdsMlE0TDNBb2IxTkQ4UmlxT3VqQksx?=
 =?utf-8?B?eTE0aVpoc3ZqdXdFNU9QUENpRWMxVEM5VXhKN0E5Q29RQVRnZnF2UC8vVU03?=
 =?utf-8?B?UlllZS93OXlvTWpnbkMzQ1NYOUpsN2QwTmdJQzEwQ2wxdmg5SmJPdXBNSDdZ?=
 =?utf-8?B?ejdxRFozZGtMaE54a0xzdGMrT1Blb2lHaVFZalFtMXpGTUlSKzdwQVBJVkF1?=
 =?utf-8?B?eWpDaG1TcVkwZXlnZGgvVGVPczdKS1VENy9Mc0d2VE03MEhURDE5MGRyR3Rn?=
 =?utf-8?B?dEhrL3o1Zm5zQXg0ZlFvNkxBU0FCWWZXQUtZRWo4QVBJOHBpY1p4TkJWUldn?=
 =?utf-8?B?UWJsUXJuSXZhWHFqemJqc1hRZG45WU1HSXlYZUxxYjlQWjVYUGdNdk1oV0VK?=
 =?utf-8?B?Nmorb2ZhYUREUzBrSmxkd0huR3E4Z1N1RTl3UTNIYmdaS2owWXA3MURwenhB?=
 =?utf-8?B?TXVCaHZWeXUzVkFjaDNYRFRHU1ZOTHp1MDhvUE5DVlhvSTJualpPVUJkYmNZ?=
 =?utf-8?B?NVA1aS9TSFhQeHh4anRaVkNTaytpd2NiUXZsL2ZlempYQS9MVzhjZkZOWU9m?=
 =?utf-8?B?WERjRTFubDRwS2hFMWdJRkI0WUJ3WWlxQUxzd24vVForYnp2WmtTWE5MRDZB?=
 =?utf-8?B?bWw2N0lJdFhaNlZ4VDFucmtqSWhhTTlobkZqbTNlcUdFTlA2ejY1S0gvWjN2?=
 =?utf-8?B?czNlTE5Mcy9heUhtU0Fzdi9GSkxHNFRsRVJUa1YxTy8za1Jpcmk0NTY5OUZF?=
 =?utf-8?B?aDBMMjM1WDI0T3NHcGFNQjVCY095U05sdmFpQkxYNDdvZ0RadEg5OEhBK00x?=
 =?utf-8?B?WTJqL1piK3k0U3dMZ3NidklZNjd1dGs2a3p6cFRLcDNyODBDQVZwejhuZFlC?=
 =?utf-8?B?QTNWdm1MV2ZuVml4cVZKUnNnMWZOVDRGaTY0b24waUlhU21MR1liY2hSQjFw?=
 =?utf-8?B?dXZFUXAvOVY5Y1BHc1VoWEZyM1h6aUp0S0liL0Q3emRkUDdXeFRua0kybXFy?=
 =?utf-8?B?U0xpdDJWVVJiQVZVR2c4eU8wWUlCY0RoazhSWmpLUzBMa2hha1gvRzEwUU9j?=
 =?utf-8?B?R2ljMkx1TXFKRGdPNTRhM0RnK1EwbGY4eTRkVmJTYUJxR0MvWmxaa3BnblAy?=
 =?utf-8?B?bmZoQ3h0RUZBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEhNbk5YaGxKeWEreDl4TjMvcXp4QzFFdnJMdGNVUmJ6ZkdEZ20xYjQrYnVu?=
 =?utf-8?B?cXdlUHJUZ2kwWXhINTF0TEFyNXRvcklTamhGY0gwbFdYMngybkpnaG9YRm8y?=
 =?utf-8?B?Ny92aUt0bmJuOHRmc2NJeGRNUWNTSWNJc3hEU3dubU1DZ2RZSGs4M0E4TlMz?=
 =?utf-8?B?NE4xSnNsVXZIK0pqY3BsTmxQSXdUeEhmY1VvWm9SRzZoUGY4K2NUT1RNd3dn?=
 =?utf-8?B?S1RFUUxOeGVRQXBtcWN3cGZhWUdtU1VJdVJoWEpVUUNXZ1ljMnM5WG5lU3pR?=
 =?utf-8?B?alk3TlNDNHkwTURENDd1bU9sTk9YdHF3V1dJUFlQdy9WZkxScERwYW4yODlB?=
 =?utf-8?B?K1R5L0hURXhvcE1MM0F2Zi85YUNpZ1FuT0NkQmZhcHE2Z1FKSjBQOEcwMElB?=
 =?utf-8?B?TU5HckppdFRtaGMxeFM4M20vMGpkVjdtYkNuclltQmpHcS9RdDZSNHRmZnJZ?=
 =?utf-8?B?S2xDVWlwOHZVSHFVWDBETW8wTHJkVEFLblowZFZxdFhWblU0MFBGQi9SMklt?=
 =?utf-8?B?bWFZLzJWY0IrWm93TkwwYTlNUlBnSDhoU3V0Q0RlSFJqWFhKc1p6SHRMdVBY?=
 =?utf-8?B?c2poWVB1ZktYdTVOM2t5Z01pbjgxV09LT0JYR25MQncyM20zbWtRMjBBM1ZM?=
 =?utf-8?B?WUVKZmpueVpsZGhyRDV4MXJJanBVVDV0UTlBN0hDcS9ZaEl5bkk5WEZBL3Vh?=
 =?utf-8?B?aTlzRU91aVY2TkoxMlFZNzlpZDQxVjcycjZ5blNIK1dZZ3JzSjlXZnRpSkVB?=
 =?utf-8?B?UWJYUWpRazgvUktmcDgvbWdpTXJScitWNlArYVFOcDV3S0NNbzBML0QwbEdM?=
 =?utf-8?B?SkIySWg4dU4ra2oyYmtDdUxBTnZvZHFTRXJUVnNXV2NWbStRTGk3NG8rYnFw?=
 =?utf-8?B?YXVLUjkyM2RQN2NtTnVXNlNrTlpIbWtxV0dKWDg0U2wyWjJiWWpULzVTcGs4?=
 =?utf-8?B?MDVCV0dUYUhkN3VvZlZkb0Y4VU04ZlVIanNtMmFDQ3ZHVHAzdHd6aEFJN0t0?=
 =?utf-8?B?OGRkTmpLVU1ySzBlRmdHUExjVGg2VW8zR2N0SUF2QnVRQmU1NzdnMnFKUWZp?=
 =?utf-8?B?YVl4YmVHL3RTWGhuS1prL3JTTFlER0dXVXJaUzROc2tNSldZdXdjNGFEMEN3?=
 =?utf-8?B?bXc5ZlovMVRrL1BvRy9aUGY2QlBBVXk2YTc5VSt3VE5GRkVsWlJxVHgzZGpU?=
 =?utf-8?B?dEpxK0xpN2R1UnNWcXVYMHl2Y0F6ay9NMDlOdGpZejM5NU1zYXJVNXZvRUFW?=
 =?utf-8?B?ODNtRGlmMTdVUmJiaXNYM1Q1UWkyN3d1MHRwOVI2NXcvU2VRNnFLZHF6bWJN?=
 =?utf-8?B?aVRXMno0NG9FcHUrNHVjTVordXVnQmJVWEg0QTVWR29hTEpXSCs2RGdMWk5I?=
 =?utf-8?B?ZGprQ0dFRnhrQkg2QXNKZ2dzSFREWWhnMXBOQ05hUWtiem92enQrcTl4ZU5p?=
 =?utf-8?B?TDM3ZXFIN1pjTk1zVnVSa2N6UHowQ0pYWUk5cDM2aVlCMENMOWxHNVVuQTNF?=
 =?utf-8?B?WFptbkRjRHlKd3pMbSt4bGFHcTRCSzJVUzNOT1pQaE9sZEtwZEl3WkdWSDU5?=
 =?utf-8?B?ZzNjKyt0S3lLOXRCNzdLVlpuUlgwbzRZT0ZQZDFOSlZUYldtbTdmaEJHUnhK?=
 =?utf-8?B?YXMvc01FZzYzMi80Q2laeU9uOHBqdDAzSVhBQjR3RDMySjF5enJUbzdPVVFM?=
 =?utf-8?B?SWVzQVhTN0lDN281bTFQNXI1NWJ6V2VVeVlESlQ4L3hrcDVsc2NKYmlFRHNJ?=
 =?utf-8?B?MHg4RVJaV3A3cnI1RjkxSFQ4TEVuRExLTDVZelRZWkRVYk1TY1Y5a2tKL3pK?=
 =?utf-8?B?WjBpQnhkem42dFp3V3A5RURCWVBTbTFwNjRRczEwQ2x4d25PZUlvK1dVaVVL?=
 =?utf-8?B?Qk5kejMwblJUV0tTZ080cmRaRFV3Q2Y4blhCejlDR25CR1hwZlE3UVk3T0p2?=
 =?utf-8?B?V1NoaHI3bmdVSkYxdHhsM2FTaDF4QWtUaFpETnRubGRHeVpaeWg3MTc0M00w?=
 =?utf-8?B?eWJxMWtOQkxPZTZ5T2xhWXBmK2cybWJxNG1acVlQeGdMdnR3QlIzYXZocmdF?=
 =?utf-8?B?Z2s5L0pYbUFIR0pDREJzU0pPNGx0L0krSko4MTE5WHMzRWxaQWtSN2Y4QTBQ?=
 =?utf-8?B?QlExNEk0NzE0dk54bWQ1U21Sd1NWZmY3SmIxTVJDNnpleXNFZzlCdVNNaWJY?=
 =?utf-8?Q?zu+4PdpcdFgODDTpD+2Lqig=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aede390-14db-4c2c-a1b8-08de27a30bc6
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 19:37:16.6070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 99MnWnfkImdna22Y6QTzJtmWmMKQRMlCkH1SpvkGAQxtO9oa9TXTs5ilwuo9ZACyVW/EciFaKZwX+GHNoVLlJ8HTG4YGXnY1+Ta+u3KXFHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB6551
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_113721_580338_9A1E3762 
X-CRM114-Status: GOOD (  12.85  )
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



On 11/19/25 11:12 AM, Catalin Marinas wrote:
> From: Catalin Marinas <catalin.marinas@arm.com>
>
> On Thu, 23 Oct 2025 14:52:10 -0700, Yang Shi wrote:
>> Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
>> rodata=full"), the direct mapping may be split on some machines instead
>> keeping static since boot. It makes more sense to show the direct mapping
>> use in /proc/meminfo than before.
>> This patch will make /proc/meminfo show the direct mapping use like the
>> below (4K base page size):
>> DirectMap4K:	   94792 kB
>> DirectMap64K:	  134208 kB
>> DirectMap2M:	 1173504 kB
>> DirectMap32M:	 5636096 kB
>> DirectMap1G:	529530880 kB
>>
>> [...]
> It matches Documentation/filesystems/proc.rst, so I'm fine to align
> arm64 with it.

Yes, it does.

>
> Applied to arm64 (for-next/misc), thanks!
>
> [1/1] arm64: mm: show direct mapping use in /proc/meminfo
>        https://git.kernel.org/arm64/c/1102778cb023

Thanks for taking the patch. However, Ryan noticed some over-accounting 
problems and had some suggestions to code cleanup as well. I'm going to 
submit v3 to the mailing list soon.

Yang
>


