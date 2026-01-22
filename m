Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2203BD6CFAE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 03:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysfuNm8oLCgm5Ybfm8iXO3Cbe6pLGHUc+UhCGNuCmB8=; b=QQHOaOMyKPzJ4uyKSO67gc+w3g
	htF4NVGxFF7nzlgeTkS/y4FAUxTxsrXa2AC2IXx6uD7T9faM8i1t7QJHRNm8x44veAJFdI1oBsns2
	/AxZ9cut6GRe1lBhy1bHXAp2oHt1V3NecnMkAmCy9Th4ctBlqn5AA+O/hf5CW8vvjRHVf9nsbO837
	h2d6PUXkj+wXfFoCBdgDTCpT3uk4lvu6iqWX8YekrMIJ6hpcwZb7aeCRyP6RwW7ckATHyajBOaQCi
	Hx20L57scYo+TnrhIqcjfyqSasishHhxp9rPdi5ctNsObZqHdcDK/cNJeAlqOW8wf8ebfEfckdTSQ
	3R/s820w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj7vB-000000088Ju-0dV0;
	Fri, 23 Jan 2026 03:33:17 +0000
Received: from mail-westus3azon11021096.outbound.protection.outlook.com ([40.107.208.96] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj7v8-000000088Im-1MW9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 03:33:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3QQIquMTC3O7MjTjDskNL1I3cxeZgKryCzqT1yhi/jZ3gK2A1q962tbfM8rd9n038aq/OJGZJ4k587MvJ461LqrOt+Q2BGTkYQQEQfe2DMp4B/aPW8aKbUXTzxHxxtNaEnW2v/Vp/WguuQ3dxVz4h3CLNwHpB1KHIdWL1sYS1XboM79QPZSbSPwzefCKQysLOQFc3MnARNtqK3NK5qeBLc6GvaPueLI2BZdKvG4HHiKBcXrjucQcGiKCRFKjc7EBbGcVw70mU89WLIqwHN2weShECXD/mmYhxHFTc+OTILzorfKTCCxb7kPSaGn23bw+jeE4TF/K1Jmp4wVRPmZbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ysfuNm8oLCgm5Ybfm8iXO3Cbe6pLGHUc+UhCGNuCmB8=;
 b=npei73QqXqN8l/738QQI8k0QaUqUyf3j5iyQUDHncJWi98TsLS4GR24Cf6s+JDM5PWOURMxzGVJW3cnGMNrxrxPPZ0cPYfzz099mgtmq310vL7MpmkqdzgPaELRNVHtZuZ1LEf6mFjEU0xMOslFLVeZW4w/T4FKND8VRwA0jr3ZPY3C/q03XdMFZ8kS5EG4ez5wYOYQ/cq+znQ5csKEoyzsTBGV70T1CDfLIYNDOOW4a4gXGwykSW4YjHE3RGJLR5dof7e3Lw6E5PQBVSOJ6fVd3XF+SrTkJLz6+C+XAZKW4zjNImfVTUlBhrGahC4gY1IQIVp2FN7o/pMRjKWwxLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ysfuNm8oLCgm5Ybfm8iXO3Cbe6pLGHUc+UhCGNuCmB8=;
 b=IZR+kGIAzu065hOpb66dUqzdYPTZmchTLQ2noxwsbrmiaXyvBQe8HSWAlQmI5Rj/QqSgjwiA6u6UNSOhLUMa5v9K6MZ3qAkeLl7iUP5cSsgERAFaORjoTnyBuf5vtJ9+HgjmWQKuWdtfUAkMeCS93unoZxcgEOqHJVT/Al0lE9M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 MN0PR01MB7754.prod.exchangelabs.com (2603:10b6:208:37d::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Thu, 22 Jan 2026 21:59:57 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%4]) with mapi id 15.20.9542.010; Thu, 22 Jan 2026
 21:59:57 +0000
Message-ID: <a0aeed19-02d2-4d74-b82a-f906dc41e240@os.amperecomputing.com>
Date: Thu, 22 Jan 2026 13:59:54 -0800
User-Agent: Mozilla Thunderbird
From: Yang Shi <yang@os.amperecomputing.com>
Subject: Re: [v5 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
To: Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, cl@gentwo.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260107002944.2940963-1-yang@os.amperecomputing.com>
 <aWZYXhrT6D2M-7-N@willie-the-truck>
 <bdd7bd07-dbed-432e-ae87-dc6381c05ddd@arm.com>
 <70b37582-fd26-4d23-a6d6-9a98e3f2eecf@os.amperecomputing.com>
 <b3122ea6-7bbc-4c07-b329-3355bbb16db9@arm.com>
Content-Language: en-US
In-Reply-To: <b3122ea6-7bbc-4c07-b329-3355bbb16db9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY5PR22CA0091.namprd22.prod.outlook.com
 (2603:10b6:930:65::9) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|MN0PR01MB7754:EE_
X-MS-Office365-Filtering-Correlation-Id: 98101f52-1332-4a61-8757-08de5a0194aa
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUNseUR6Rlk3UDNOT0dmZFUxMEkwNk10cFZNZk15L0xYbHYwcld5T2w1Skdi?=
 =?utf-8?B?d0l6cUtSaWpsbFdGTWpLSWU4TlhPeVpPVG9rQ1MxT0J0LzRpWmtnYkxHY0RF?=
 =?utf-8?B?WEVxKzMxM1lTSWlRUTlFUXcyd2FYQksxck1UdXRMMm9PMFFsa1VNVkZlSGZl?=
 =?utf-8?B?ZTlVUTErTFBMU1JEMlhYTnZkakhWWE9YbXhBTXVQZEJGNWtGbGw2aXFqTWNO?=
 =?utf-8?B?dE1RTXFCTmJYMktzN2JjRWVpY3h6TVVRNXk4OWZKbDh6YUgvWmhlbTZOWE03?=
 =?utf-8?B?bENFSktBK0h5WTh5QjZuM3JzQUE1am1CWnQ3VVJzVUx5ek13VnZXMEYrOEg0?=
 =?utf-8?B?cFZFeXhqSk5mTVdwN1hZSWxVL0YzS1hSVEJmZEEwY3FBeDEyRzg5ZVAzODVG?=
 =?utf-8?B?L3M0anA1V2xkNUtCWkVuQ044T1FjTXNZMW45N2hJUlZRQzdsTjdJMlhTb1Jo?=
 =?utf-8?B?NGxnNE5Bc2Rjek5LZGJ3WkF6dU14UTV0SXg2NDNiY2MrRmwzbHhEeno3aUFP?=
 =?utf-8?B?bER1SEh2YXR2MmdsVFVqN1VNdENCMXpmTGtNTjdhT1Y4T0FwZUdmZGRsNFZx?=
 =?utf-8?B?UGlPZFcwd1dPMFNwU2w2b1dSRDJNdytzQ2pxNFlCNWtGSHQ0ZDQwekJHWFVw?=
 =?utf-8?B?MXZuZ0VCTEpEMXhLUkFLNG1hRy82ZHR6UHltejNtU1dNU1R0Z1UvRjc2SWt6?=
 =?utf-8?B?QnR2K2xvK2h0cEpQMDBER1psVXVSNnhwWHVNV01rL0I3N25tNFUyc3dJSytq?=
 =?utf-8?B?a1hOSnAyL2JjVnNWN3pYRlN1LytweGtOUWRoYlhiUjBtVkFDS3dwYnFTTTBi?=
 =?utf-8?B?TWlPTi9UcmVkRDlRQmM3QmRVaTRLUFd5U0xDMDZOajgzRnFidml1ZS9oM2ZL?=
 =?utf-8?B?UmIrK0Q4NFBrRFhaTWgxSStZaXNmSTBXL3lLNmZYeit2ZnNsM1hKVWpkVllL?=
 =?utf-8?B?NVdLWlJ0M2QvdHdRSVFKSDZkTlRhL20xYkJjNHVqcUhIYXFyd080aHI1WENP?=
 =?utf-8?B?ODRPcVZ3THNlalVRY2Q0VWlMbFVxSHZCcExJbEZuYXQ5d2pmbkFlc3lWUFEz?=
 =?utf-8?B?RXZQSWkzMWRvVFpLZVFZYnZWb3Q2RCsrMStFWWFvM0M4YlpZaUZjRTlsbnIx?=
 =?utf-8?B?TFlNMUUvbFBBNStQQmx1RGRRTVZuZEpZTkJNSnRFNHNnK1FHOXVOT3pIdkFF?=
 =?utf-8?B?YVcxa0lVYlVvL2dYUFYwbGI1U1VwTjZ6cmxwYTM1RWJsczRrVFBidUkwTzlK?=
 =?utf-8?B?R1FBMmZ5UXY2YnJmbXFZeHY1QzN1SmIwSHlXQy9uSHFNMFhsVVAzUXl6YWxM?=
 =?utf-8?B?UDNONGN1VHl4dWVqbGhFMnlXR0YyMWdmRU0xWjMyMTZaSllpS3BnSW1Bdm1T?=
 =?utf-8?B?SmJLczVXZWVaTzNxRGgxdDNSZkYzUlEwMUNId3dNUTlnU05mN1JURG1kV3Bj?=
 =?utf-8?B?NytPcVptYjAwRTl5STF4NENKdGVrK1FvVWx1SXVBQ2JBMXhqcE11VXFOc0ZX?=
 =?utf-8?B?QmF2MXV2SEk2U2tmamptek4yNytUaCsycGgzZUlHRFhwVVBPbitSMmFLVnlQ?=
 =?utf-8?B?WEVzNjY0dVM0U3lEa2trb01EWVVxdnZFU0ZCUHJFYk5lM2NxV25Ha3NCWGxx?=
 =?utf-8?B?WHQzRndDVmVqSTJPcW9HRG5sVys4MEhqcWJ1UHM2WHJzL25oeFExNDFFMmQ4?=
 =?utf-8?B?d3R1MUM3bHpVdXM1aCtEcDhxaktIclpWVE9UamMyR0lZNXZFOWlzM0l2emlt?=
 =?utf-8?B?VXpNWHI5S3RuUnBmbmUwRCtzTHVJT3M3d3lURnhQeUZzckEray9xVWlMR1Jo?=
 =?utf-8?B?R2l0QXU1VmthU2hTZVVkT0xHbHZ1THlabW0zZkEzUXBYR1FpV0M4T1NGb0d0?=
 =?utf-8?B?V3lZN21XbkMwdGl0d1hxMTRNb01reXNuOGE3VjI3aGJVZ0RzTldhUXp5YWRt?=
 =?utf-8?B?MnRDMjNvb3g5Y0RPRUNoeHdjc29YVjFQMVhmN2RNR3BLVktzaSt1TUFpQ0Vl?=
 =?utf-8?B?a21yVllqMjA0SE1JQkkxcVdXUHBkM0l4SldGbE16UjAyK25wUk5wU3ViSktl?=
 =?utf-8?B?bldMMDBhN2ZydXFTdUhNZngyUTlsUi84TGRFc2dGRTlvNUNzVHVvRUJ3eCtn?=
 =?utf-8?Q?XNAo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emhYY2V3ejZGb0pHVWd4ZEZ5WWw0WWk3bGJaUFREQmp5MUhjR292UzIvbW0z?=
 =?utf-8?B?TTlVSDZZQmZCVFdCaElHcTk5UTFZMlF0c3R6b29hNHNXQ1B1SkprNjNQMWc0?=
 =?utf-8?B?T3VmbVZnc2tRQVZxQ3ZTeG5nYlIydzdtRk1JOERNQ3poNnNKUmNDVHVxVWNy?=
 =?utf-8?B?S0lHWGVtaTVoYy9aL0FtM3FiTytzb0I2VlZnSHpEc0x6dXp6RzNTUldTMWR5?=
 =?utf-8?B?SkZ2TTlCNUR3VHlmTjJSMUI1U1ZGTHRqeHJ2SC9ES3M0QXQyd0FFZnN1dnNY?=
 =?utf-8?B?NWhIYkx2VWlQTHdpTFR2WlJkTklka0xBSHhmamhKYVIrRnFaR1JVdkhpODd3?=
 =?utf-8?B?cWwvZXpCKzZEWWhEVEZvNDlvREx2T1JyV25BN0NTUjNRVkR1RFB2Q3RWMXVI?=
 =?utf-8?B?a1V3cUc1RDVCdm9UbVZnTjUwZkROTUJOUEN1UVBGUnNpRGdLNlN1RmhOWE95?=
 =?utf-8?B?YXpudDlOQldIZGppcGlDYTh2eFpXNWl2V0JuSHBrMlVSYnpkVEtML0FjamVw?=
 =?utf-8?B?RmoyYklFZE1HSFBKNEZCVEZaalUvOVhNOU1qRkZ2TWcrMFFYNmFQMU5iQThv?=
 =?utf-8?B?WTVxcTNuTE9wZkpSSXR2MTEyMnhuTFE3dXJOWVIzZ3dJS2l3ckg3WmlaR28y?=
 =?utf-8?B?bmJEbFBFc2dWVDF3VGNWTGcxWWlwK011L1JmSTlnMWQvUXVyVzVPSit5RExV?=
 =?utf-8?B?TlZzZkVGbnBXbG0zOG4yeGZHZ291eEpYZnpwNVlYVm1TeVB6cVlWeHdELzNx?=
 =?utf-8?B?MnNDNE8wSlRqSlFCVVMzcjI5ZEUxS3JRZllWNWQyOEVmc0w5VlFuRFgyMEov?=
 =?utf-8?B?K1dTcnFEWWdjQnhHM0lOTkdBSXlzaXA0b04rZ0h3TkZUOTNUeHNNYUtPczFN?=
 =?utf-8?B?Q0RBOHZTT014VlRBRXZhYnZ5WU8zME9zZVkrQ2pCOVcxZUdGV0RoQ0wxWURt?=
 =?utf-8?B?ejRDSm5RRG40TTBObG5oSStsR2F4b0huRFJXRjRlNFhIQTR4UnZYR1Q1RlRj?=
 =?utf-8?B?RGFlb2FKMnFZWWc0KzFKM1RaUEg1RS9mSkNZOC9hN0VWSjFqL0RhR3ZPYTht?=
 =?utf-8?B?Y1EyTnBFckV0clIwUjlwMU5hV0FmaFVtMEJhQUFkUDJOQ0o2WWFKOStQTURT?=
 =?utf-8?B?RXNyd1pZUWI4bGtlMlNhM01BSDBoWC9wK2xRWExpdGNuMnhNdWNHbWdjNlRL?=
 =?utf-8?B?bDc1YmsvbFM4RldLQU96cXQ2WTZMTWFYaHBpeWtxVGtnZlp2dHJndWs3Y0I2?=
 =?utf-8?B?U29JQi9kTURJcFhMUUJDR0ZVUEJYVllXcjAyMHpBREhVR1RpRGlzQlVMQ1hU?=
 =?utf-8?B?VDAzNk9ySXprVWpQdTJleGVTd1ZMOVZYRG1pZDdBeW1sblVtZ2FBdWVtUUdU?=
 =?utf-8?B?YWlQWDNTNFNmN2piU3VnZ1RxVHd3bDdpUmt4VUw3Z2FKZFl6TmdxTWc3cDR1?=
 =?utf-8?B?L09MR3BaNUtHQnJNM1FGa2pGSmdpNG5WSnlzd2RZUzN3c2EzaldKWHNrd0FT?=
 =?utf-8?B?SVFJdHl2KzV3WHpKTlhpMS8vWFVvc3FWV2ZvUlRDaUQyZmhOMENLdGZzMEpF?=
 =?utf-8?B?czVLU3hOMXJYM3lSSWd1YjBzVlZHZ2pOTWVqWlM4dmdJRGcrdkc0RUlIM2JD?=
 =?utf-8?B?OGE5UkdGdFRHUzF4Q0V3NUN3M0Zmem1DNXFrcGxMMnhla05FTEs1a1pPYUFO?=
 =?utf-8?B?WHBTUXlOblFSdVVTQVlvREFJbnNSTDQ4em9UcldzZXFXUVl4Y1d5d1dYZVVj?=
 =?utf-8?B?VGFVZ2tLcm1qeUlXMFdRRUw4TkN6a2lPdnhlQjduUng4M2RsdFpOcWJ0cVYv?=
 =?utf-8?B?Qk56NzlUUHJiTEhkUmg0WkhkMDBkR1NPbE56UEU2YW54NUorUDRZbzgyUDZy?=
 =?utf-8?B?VXh6UGNFL0FVclJFWHg2SkNrWTd1N3dKUUVkTC94b0FVRWdnaFlDS0dWVTNG?=
 =?utf-8?B?SDR2YXdSVjE4eGdCc2tTbW43SW43WXJmMUhpZ3JKKzU5UUV0NU5aM2FrdlRk?=
 =?utf-8?B?UDQ1L1VybVBqanF3TjBRS1AwSVU0SFdqalBmTzIwNGo0MGYyTUNqUjJyQVF5?=
 =?utf-8?B?aXZ3aldObVZhbUp4RmIwYTU1WExuZS82Ti9MRnhFMkRmZWVpRzBtNzN1U3Az?=
 =?utf-8?B?QVQ4eEVhaFJ1dkVZRTFhRXZqVVBQbVZNWEtrd1hZS0FZem93TkU0dkVWTjll?=
 =?utf-8?B?a0tNQ08wZ3pSb3J1Y1RmRjA5V1hnT0R1NEU5NUQ0WWdzS0dLTXVQME5nY2xH?=
 =?utf-8?B?bUJkRHd6UWJlUUcwNTE2WW1UMVVCTDRVWnZqdGZ6SW5tNHZFb25XV3NjNUd3?=
 =?utf-8?B?VGppYk5meFFqRUJGc0R1cTU2RFIyLzhaaGsyOUVpT1piT1JNRUZVcWsvd2RG?=
 =?utf-8?Q?1jm0hn9XTtBVm+Qs=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98101f52-1332-4a61-8757-08de5a0194aa
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 21:59:56.9984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ljRRdvr3A7m2sklsmP8ZRKWVUeRjwKP3oe43oHayJoNMH0/F+qrBhIYxhMphWUximY8apdIA31ygBBN/TeOI6FoVVyAwVuTeIraVeywO3u0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR01MB7754
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_193314_411837_5B5C275C 
X-CRM114-Status: GOOD (  16.38  )
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



On 1/22/26 6:43 AM, Ryan Roberts wrote:
> On 21/01/2026 22:44, Yang Shi wrote:
>> On 1/21/26 9:23 AM, Ryan Roberts wrote:
>>> On 13/01/2026 14:36, Will Deacon wrote:
>>>> On Tue, Jan 06, 2026 at 04:29:44PM -0800, Yang Shi wrote:
>>>>> Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
>>>>> rodata=full"), the direct mapping may be split on some machines instead
>>>>> keeping static since boot. It makes more sense to show the direct mapping
>>>>> use in /proc/meminfo than before.
>>>>> This patch will make /proc/meminfo show the direct mapping use like the
>>>>> below (4K base page size):
>>>>> DirectMap4K:       94792 kB
>>>>> DirectMap64K:      134208 kB
>>>>> DirectMap2M:     1173504 kB
>>>>> DirectMap32M:     5636096 kB
>>>>> DirectMap1G:    529530880 kB
>>>>>
>>>>> Although just the machines which support BBML2_NOABORT can split the
>>>>> direct mapping, show it on all machines regardless of BBML2_NOABORT so
>>>>> that the users have consistent view in order to avoid confusion.
>>>>>
>>>>> Although ptdump also can tell the direct map use, but it needs to dump
>>>>> the whole kernel page table. It is costly and overkilling. It is also
>>>>> in debugfs which may not be enabled by all distros. So showing direct
>>>>> map use in /proc/meminfo seems more convenient and has less overhead.
>>>>>
>>>>> Signed-off-by: Yang Shi<yang@os.amperecomputing.com>
>>>>> ---
>>>>> v5: * Rebased to v6.19-rc4
>>>>>       * Fixed the build error for !CONFIG_PROC_FS
>>>>> v4: * Used PAGE_END instead of _PAGE_END(VA_BITS_MIN) per Ryan
>>>>>       * Used shorter name for the helpers and variables per Ryan
>>>>>       * Fixed accounting for memory hotunplug
>>>>> v3: * Fixed the over-accounting problems per Ryan
>>>>>       * Introduced helpers for add/sub direct map use and #ifdef them with
>>>>>         CONFIG_PROC_FS per Ryan
>>>>>       * v3 is a fix patch on top of v2
>>>>> v2: * Counted in size instead of the number of entries per Ryan
>>>>>       * Removed shift array per Ryan
>>>>>       * Use lower case "k" per Ryan
>>>>>       * Fixed a couple of build warnings reported by kernel test robot
>>>>>       * Fixed a couple of poential miscounts
>>>>>
>>>>>    arch/arm64/mm/mmu.c | 202 +++++++++++++++++++++++++++++++++++++++-----
>>>>>    1 file changed, 181 insertions(+), 21 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>>>> index 8e1d80a7033e..422441c9a992 100644
>>>>> --- a/arch/arm64/mm/mmu.c
>>>>> +++ b/arch/arm64/mm/mmu.c
>>>>> @@ -29,6 +29,7 @@
>>>>>    #include <linux/mm_inline.h>
>>>>>    #include <linux/pagewalk.h>
>>>>>    #include <linux/stop_machine.h>
>>>>> +#include <linux/proc_fs.h>
>>>>>      #include <asm/barrier.h>
>>>>>    #include <asm/cputype.h>
>>>>> @@ -171,6 +172,85 @@ static void init_clear_pgtable(void *table)
>>>>>        dsb(ishst);
>>>>>    }
>>>>>    +enum dm_type {
>>>>> +    PTE,
>>>>> +    CONT_PTE,
>>>>> +    PMD,
>>>>> +    CONT_PMD,
>>>>> +    PUD,
>>>>> +    NR_DM_TYPE,
>>>>> +};
>>>>> +
>>>>> +#ifdef CONFIG_PROC_FS
>>>>> +static unsigned long dm_meminfo[NR_DM_TYPE];
>>>>> +
>>>>> +void arch_report_meminfo(struct seq_file *m)
>>>>> +{
>>>>> +    char *size[NR_DM_TYPE];
>>>> const?
>>>>
>>>>> +
>>>>> +#if defined(CONFIG_ARM64_4K_PAGES)
>>>>> +    size[PTE] = "4k";
>>>>> +    size[CONT_PTE] = "64k";
>>>>> +    size[PMD] = "2M";
>>>>> +    size[CONT_PMD] = "32M";
>>>>> +    size[PUD] = "1G";
>>>>> +#elif defined(CONFIG_ARM64_16K_PAGES)
>>>>> +    size[PTE] = "16k";
>>>>> +    size[CONT_PTE] = "2M";
>>>>> +    size[PMD] = "32M";
>>>>> +    size[CONT_PMD] = "1G";
>>>>> +#elif defined(CONFIG_ARM64_64K_PAGES)
>>>>> +    size[PTE] = "64k";
>>>>> +    size[CONT_PTE] = "2M";
>>>>> +    size[PMD] = "512M";
>>>>> +    size[CONT_PMD] = "16G";
>>>>> +#endif
>>>>> +
>>>>> +    seq_printf(m, "DirectMap%s:    %8lu kB\n",
>>>>> +            size[PTE], dm_meminfo[PTE] >> 10);
>>>>> +    seq_printf(m, "DirectMap%s:    %8lu kB\n",
>>>>> +            size[CONT_PTE],
>>>>> +            dm_meminfo[CONT_PTE] >> 10);
>>>>> +    seq_printf(m, "DirectMap%s:    %8lu kB\n",
>>>>> +            size[PMD], dm_meminfo[PMD] >> 10);
>>>>> +    seq_printf(m, "DirectMap%s:    %8lu kB\n",
>>>>> +            size[CONT_PMD],
>>>>> +            dm_meminfo[CONT_PMD] >> 10);
>>>>> +    if (pud_sect_supported())
>>>>> +        seq_printf(m, "DirectMap%s:    %8lu kB\n",
>>>>> +            size[PUD], dm_meminfo[PUD] >> 10);
>>>> This seems a bit brittle to me. If somebody adds support for l1 block
>>>> mappings for !4k pages in future, they will forget to update this and
>>>> we'll end up returning kernel stack in /proc/meminfo afaict.
>>>>
>>>>> +static inline bool is_dm_addr(unsigned long addr)
>>>>> +{
>>>>> +    return (addr >= PAGE_OFFSET) && (addr < PAGE_END);
>>>>> +}
>>>>> +
>>>>> +static inline void dm_meminfo_add(unsigned long addr, unsigned long size,
>>>>> +                  enum dm_type type)
>>>>> +{
>>>>> +    if (is_dm_addr(addr))
>>>>> +        dm_meminfo[type] += size;
>>>>> +}
>>>>> +
>>>>> +static inline void dm_meminfo_sub(unsigned long addr, unsigned long size,
>>>>> +                  enum dm_type type)
>>>>> +{
>>>>> +    if (is_dm_addr(addr))
>>>>> +        dm_meminfo[type] -= size;
>>>>> +}
>>>>> +#else
>>>>> +static inline void dm_meminfo_add(unsigned long addr, unsigned long size,
>>>>> +                  enum dm_type type)
>>>>> +{
>>>>> +}
>>>>> +
>>>>> +static inline void dm_meminfo_sub(unsigned long addr, unsigned long size,
>>>>> +                  enum dm_type type)
>>>>> +{
>>>>> +}
>>>>> +#endif
>>>>> +
>>>>>    static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
>>>>>                 phys_addr_t phys, pgprot_t prot)
>>>>>    {
>>>>> @@ -236,6 +316,11 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned
>>>>> long addr,
>>>>>              init_pte(ptep, addr, next, phys, __prot);
>>>>>    +        if (pgprot_val(__prot) & PTE_CONT)
>>>>> +            dm_meminfo_add(addr, (next - addr), CONT_PTE);
>>>>> +        else
>>>>> +            dm_meminfo_add(addr, (next - addr), PTE);
>>>>> +
>>>>>            ptep += pte_index(next) - pte_index(addr);
>>>>>            phys += next - addr;
>>>>>        } while (addr = next, addr != end);
>>>>> @@ -266,6 +351,17 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr,
>>>>> unsigned long end,
>>>>>                (flags & NO_BLOCK_MAPPINGS) == 0) {
>>>>>                pmd_set_huge(pmdp, phys, prot);
>>>>>    +            /*
>>>>> +             * It is possible to have mappings allow cont mapping
>>>>> +             * but disallow block mapping. For example,
>>>>> +             * map_entry_trampoline().
>>>>> +             * So we have to increase CONT_PMD and PMD size here
>>>>> +             * to avoid double counting.
>>>>> +             */
>>>>> +            if (pgprot_val(prot) & PTE_CONT)
>>>>> +                dm_meminfo_add(addr, (next - addr), CONT_PMD);
>>>>> +            else
>>>>> +                dm_meminfo_add(addr, (next - addr), PMD);
>>>> I don't understand the comment you're adding here. If somebody passes
>>>> NO_BLOCK_MAPPINGS then that also prevents contiguous entries except at
>>>> level 3.
>>>>
>>>> It also doesn't look you handle the error case properly when the mapping
>>>> fails.
>>>>
>>>>> -static void unmap_hotplug_pte_range(pmd_t *pmdp, unsigned long addr,
>>>>> +static void unmap_hotplug_pte_range(pte_t *ptep, unsigned long addr,
>>>>>                        unsigned long end, bool free_mapped,
>>>>>                        struct vmem_altmap *altmap)
>>>>>    {
>>>>> -    pte_t *ptep, pte;
>>>>> +    pte_t pte;
>>>>>          do {
>>>>> -        ptep = pte_offset_kernel(pmdp, addr);
>>>>>            pte = __ptep_get(ptep);
>>>>>            if (pte_none(pte))
>>>>>                continue;
>>>>>              WARN_ON(!pte_present(pte));
>>>>>            __pte_clear(&init_mm, addr, ptep);
>>>>> +        dm_meminfo_sub(addr, PAGE_SIZE, PTE);
>>>>>            flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>>>>>            if (free_mapped)
>>>>>                free_hotplug_page_range(pte_page(pte),
>>>>>                            PAGE_SIZE, altmap);
>>>> Is the existing code correct for contiguous entries here? I'd have
>>>> thought that we'd need to make the range non-contiguous before knocking
>>>> out the TLB.
>>> The Arm ARM has this, which makes me think you are probably correct:
>>>
>>> IVNXYF:
>>> The architecture does not require descriptors with the Contiguous bit set to 1
>>> to be cached as a single TLB entry for the contiguous region. To avoid TLB
>>> coherency issues, software is required to perform TLB maintenance on the entire
>>> address region that results from using the Contiguous bit.
>>>
>>> I've asked for clarification internally. But I think we should hoist out the tlb
>>> flush regardless because it will be faster if we just invalidate a single range.
>>> I can handle that as a separate patch if you like.
>> Thanks, Ryan.
> Of course it's not quite as simple as hoisting for the vmemmap unmapping case
> since that is also freeing the memory, so we need to issue the tlbi before freeing.
>
> vmemmap never uses contiguous mappings so could continue with the current
> strategy for that and only hoist the tlbi-range for the unmapping the linear map
> case.
>
> Or could do a 2 phase approach for vmemmap where we first set VALID=0 for all
> entries, then flush tlb, then walk again, to free clear the pte and free the
> pointed to page.
>
> Other ideas welcome... I'll have a play.
>
>>> However, I think there may be another problem; IIUC, any old range of memory can
>>> be hot-unplugged as long as it is section aligned. It doesn't have to be the
>>> same range that was previously hot-plugged. But if the linear map is block
>>> mapped, the range being unplugged may cover a partial block mapping.
>>>
>>> For example, with 4K pages, the section size is 128M, so you could hot unmap
>>> 128M from a PUD leaf mapping (1G). What am I missing that means this doesn't go
>>> bang?
>>>
>>> This would have been an issue for the non-rodata-full config so predates the
>>> work to split the linear map dynamically. I'm not really sure how to solve this
>>> for systems without BBML2 but without non--rodata-full.
>>>
>>> I must be misunderstanding something crucial here... I'll dig some more.
>> I'm not expert on memory hotplug. I'm not 100% confident my understanding is
>> correct. But I noticed something that I misunderstood before, when I was testing
>> the patch.
>>
>> The hotunplug actually has two stages: offline and unplug (physically remove the
>> device).
>>
>> When we echo offline to the sysfs file, it actually just does offline. The
>> offline just isolates the memory from buddy, but it does *NOT* unmap the memory
>> from the linear mapping. The linear mapping will be unmapped at unplug stage. I
>> tested the patch with QEMU, I just can emulate hotplug/hotunplug the whole dimm,
>> for example, hotplug 1G, then hotunplug the same 1G. I can't emulate hotunplug
>> in the smaller size. I thought it may be the limitation of QEMU in the first
>> place. But I realized we can't hotunplug a part of dimm physically either,
>> right? For example, we insert 1G dimm to the board, we can't take out 128M from
>> the dimm physically. So IIUC the partial unmap of linear mapping should never
>> happen.
> Looking at the code, it looks to me like memory_hotplug.c doesn't care and will
> try to unplug any span of memory that it is asked to, as long as start and end
> are aligned to memory_block_size_bytes() (which for arm64 is section size = 128M
> for 4K base pages).
>
> But it looks like all the higher level users will only ever unplug in the same
> granularity that was plugged in (I might be wrong but that's the sense I get).
>
> arm64 adds the constraint that it won't unplug any memory that was present at
> boot - see prevent_bootmem_remove_notifier().
>
> So in practice this is probably safe, though perhaps brittle.
>
> Some options:
>
>   - leave it as is and worry about it if/when something shifts and hits the
>     problem.

Seems like the most simple way :-)

>   - Enhance prevent_bootmem_remove_notifier() to reject unplugging memory blocks
>     whose boundaries are within leaf mappings.

I don't quite get why we should enhance 
prevent_bootmem_remove_notifier(). If I read the code correctly, it just 
simply reject offline boot memory. Offlining a single memory block is 
fine. If you check the boundaries there, will it prevent from offlining 
a single memory block?

I think you need enhance try_remove_memory(). But kernel may unmap 
linear mapping by memory blocks if altmap is used. So you should need an 
extra page table walk with the start and the size of unplugged dimm 
before removing the memory to tell whether the boundaries are within 
leaf mappings or not IIUC. Can it be done in arch_remove_memory()? It 
seems not because arch_remove_memory() may be called on memory block 
granularity if altmap is used.

>   - For non-bbml2_noabort systems, map hotplug memory with a new flag to ensure
>     that leaf mappings are always <= memory_block_size_bytes(). For
>     bbml2_noabort, split at the block boundaries before doing the unmapping.

The linear mapping will be at most 128M (4K page size), it sounds sub 
optimal IMHO.

> Given I don't think this can happen in practice, probably the middle option is
> the best? There is no runtime impact and it will give us a warning if it ever
> does happen in future.
>
> What do you think?

I agree it can't happen in practice, so why not just take option #1 
given the complexity added by option #2?

Thanks,
Yang

> Thanks,
> Ryan
>
>> If I read the code correctly, the code does unmap the linear mapping on memory
>> block granularity. The block linear mapping is unmapped when removing the first
>> block if it covers multiple memory blocks. Then the page table will be none when
>> removing the later blocks, but it is ok, the code just continue.
>>
>> Thanks,
>> Yang
>>
>>> Thanks,
>>> Ryan
>>>
>>>
>>>
>>>> Will


