Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1987ECCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 08:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEXwil3WjDXgaUp7smTGBc1QnFNf/v1EKSAEkTz5Qio=; b=n5RWJH9mqwkJl9YsiM5MrAfL25
	3Lnr+lRcOA7UxNPQtanXdCBzhdEO1pPcbuD9isMygZX+AiiRYLVa2AoDZZChX1fG6mmvkSDN2wSeQ
	ULUBfYVJ7dFLxjYv3cfyHAw+Hra4hJvZ+WH8/6KCYbMOSlGiKx9gkLe6oSnuoUD8Hb1gR/PmDGgtO
	0JnazieQiZHixte/+w5gTchurrFHTBEXnwEHxvbHZ3PSUDj2RAWjfXnqxAmfa1YDP0zCsvFHYv/S4
	CyuqHmx5jOfBBLEOgkzfraDuTW8Fv3NVJBuuZ90wiYEXuPLysDI8SGDRPpbZxxN0gi1CgASBSGrJQ
	8KC1ajsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7MC-0000000GDRk-1I2B;
	Tue, 21 Oct 2025 08:04:36 +0000
Received: from mail-westcentralusazon11020087.outbound.protection.outlook.com ([40.93.198.87] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7M9-0000000GDQQ-1fXW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 08:04:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJqB58/H7BHKIqCRaoxbe6JgAgIMGfZVhEyue+AQ09CgYyovCnO7qerrqC/vLFGUzgwgOuZw+MAO24cJm05zLQfudO4/rdD+1SdvMslExNHgZdMPYJhn/ZIY2IE7JESquBtGcn9RE39lkdRvXwhsgYhdk8fjKNFGvSUryNW65Hii7bkaoe3qnfUUiSBMwkRKTaAomCzNVhhDw2JbKXLoVZn+DDpxh5k6Pgb2Jxd76XgKg+OgNcqaFOoQu+pVxpwBT7LEHILxUaxhB6LQwOafFTv66bcJ5RxICCjimIGpyCvwvEfNOrc/LAYevoHv6dWnLJBw69h/M4wrl5aYVHanOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEXwil3WjDXgaUp7smTGBc1QnFNf/v1EKSAEkTz5Qio=;
 b=go74DceKcMNDLAbhnzUOul5tYkD02ODa/6c5/eIHXjysgaO+Isc9pNibYQ0oEHzUsYhg1CA7g5k7grQfPvyBCqQGbdfiPzjYdWLKOnP2b9aPpezemnKf0vVdu555ebzKMB30BISgTbgOGO5dcaWM/4RNcmjOBxynJuKJfbUs6bajlJ499G4nZvPlWBqTeEqlM6BwG7tB48nNYZl7iypRn+BP2Jj4plWKXke+KC/GKzjOKYRpxSdAkkG5qxBjlOPTgHsN1uiu5UJsWT/meuoSdPjSzH/ObTpBX9oCXL28heWsa6TsgbbajKFXnQxA4TBluXBZTcEThVlvUfsTUnLQLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uEXwil3WjDXgaUp7smTGBc1QnFNf/v1EKSAEkTz5Qio=;
 b=7x8U75itSeLuG003HT15PSOI6yWO5kda7kp3HnD/jSS1f6yl5GfWf9NjZg7dH7JLmVQhDTBKFSFtMdkySHSAiujrmYXIOj1jmJ/fdneWFRDVERSZjTtWmBYrwPlwtIeQaO3iFzC2KSf5Lu2sowYH71vk2sJ4qixWD79IYpWGNjQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 PH0PR01MB6588.prod.exchangelabs.com (2603:10b6:510:90::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.17; Tue, 21 Oct 2025 08:04:21 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050]) by PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050%4]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 08:04:21 +0000
Message-ID: <8098c2ed-ea9c-4a91-88a3-e59d57423748@amperemail.onmicrosoft.com>
Date: Tue, 21 Oct 2025 16:04:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: defconfig: Remove the redundant
 SCHED_MC/SCHED_SMT
Content-Language: en-GB
To: Huang Shijie <shijie@os.amperecomputing.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: patches@amperecomputing.com, cl@linux.com,
 Shubhang@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org,
 krzysztof.kozlowski@linaro.org, geert+renesas@glider.be, arnd@arndb.de,
 linux-kernel@vger.kernel.org, peterz@infradead.org, soc@lists.linux.dev,
 Zenghui Yu <yuzenghui@huawei.com>
References: <20251021075704.527626-1-shijie@os.amperecomputing.com>
From: Shijie Huang <shijie@amperemail.onmicrosoft.com>
In-Reply-To: <20251021075704.527626-1-shijie@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0084.apcprd02.prod.outlook.com
 (2603:1096:4:90::24) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|PH0PR01MB6588:EE_
X-MS-Office365-Filtering-Correlation-Id: 5415b7a2-359c-4440-6891-08de10787115
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDdiajRRbTg3TkxHR3U3a2Z2cDdnMVI0OEZOczJMYUNXTm0xS2dReUtCUW5s?=
 =?utf-8?B?YXh5WWg0c3Vsam9UeFBVeGpXRE5oZFI1Sm9rMnc1SUVTSjVSb3B5ZjFLUXhR?=
 =?utf-8?B?bEFQY2pUUyt5UUxSZUhGZ0NqRmFueEQ0UjNobkpxQXJLQWo0c0NuUE83U2xL?=
 =?utf-8?B?L3gxU2pRa3FtYVkvaEdnUEJ3Q2dqUjEyMThCRUVSeG1XaHJJSHhqbnNmTW53?=
 =?utf-8?B?RzRUek42V1Q3MUpLaE5McVVpVVoydlE4UFhrbEJ2NjRBZzQ4L0dxWUlibURk?=
 =?utf-8?B?REs4OXAxdFlidHJRVURwUUVGd1JWZXBiR0YxMmZIWTJnVXFDWmZBeHFuZXBw?=
 =?utf-8?B?eW5mbUFuZFdKOGd4U1V1U3lsYWZVMTlQUGt5cTRNdHB2K3luZ0JydmtyREZh?=
 =?utf-8?B?MTdVbEhzWjRmZGlzWUxVNHlVNTdrd1E5WVBYakNHMGNTOStUM2JaZlQ0bWFY?=
 =?utf-8?B?b3NFMTNGeSszUU9VQUxybjVYL1FGZDFybmc3dmpQdUZFR3FCT2M2REdnZk1D?=
 =?utf-8?B?c3NjZTdEWHlPQ1VuUUJqNTdmNFZMRDIyb2ZRREJFZUhTQm5FOWxmanRFN0kw?=
 =?utf-8?B?N0c1KzNhQnFVT3N2dXloMEI2MU9hU1VVd1JUZGxwQVI0MCtIZ3pzckIyd21P?=
 =?utf-8?B?K0FTTlYxaXQ5d2MxWi96THowMzVoeEN3YlBKczlCeDdnUzBFQTUydmZrczAy?=
 =?utf-8?B?Q3RNd3pXODQ4MlovN29uZE5MRnRVbm51bDMzVEZFSThueGg1KzFZcGRLMFZ6?=
 =?utf-8?B?bDNqeG1GYWpiMHpWSnowY3hpSzk4MHh2alppblA0QTRmTktUZFRCelhvbEtN?=
 =?utf-8?B?WDNVZy9PY1N6T2haK2E4TTVXbnY4S2ViemFGYnZaeEZTNVhIcmpWbVZGd1NW?=
 =?utf-8?B?SFQrbnF1dFhyVGVNeVhNSjdybzFJeld6Nng3NkVVcDZ1L2NmMFMvRkJJN2lV?=
 =?utf-8?B?TnFzS3A4d25LQlJDanY4blNYbldPU0ZjeUtMLzdHSEVzU2ZJSU9pWC82d3E0?=
 =?utf-8?B?dkpKMWdoa0pLOWUxb2xjY044T2JlRnNTTSt5bFFMdEFhWkxvSVA5Tk1GRnZE?=
 =?utf-8?B?NTl1dTJ3TXpnb2NwK0lLdWVHdk1UdEpnR0l3Mm1lZjhFVlUremo3QWJBN0Jp?=
 =?utf-8?B?aTN3REUvV1FQL0xtRk9RMDk5d0xqYnkwZXByMzJlcmV0N1hVajl6N2xlQXRJ?=
 =?utf-8?B?Z0E1Zkk0R2ljaXY3czlmS1pkcEV5SVVzZU04dUp5Q0M0TERubE5ZbElwV0wz?=
 =?utf-8?B?Z3ZoTWNSNnVnNkhYWWlSK2E2NlBjZjRFMlpIbGNKNWxRUUp6UTZITWNPTE9E?=
 =?utf-8?B?VnZyZlltTkNFTUloczNEKzhnQ0RnZXorVHJGeUhyWFpGZzlYSHE3Z2lYRk83?=
 =?utf-8?B?ekJtNXZMMk43UENZMnVNeEVWQ1JpZDVqSDVnVWFJOGVyT2g0TG1qd2x4emxn?=
 =?utf-8?B?VTU3YmVQck9iZUdEaFFocXEvZDlqeEFpSjhUMjVoTGt1QW1VWTdDQUlDMEJ5?=
 =?utf-8?B?TVh4RWZTSHczMDVsOTNRRW83NTFIYlFGbEgzNXdHM0IxNFpMZG16a0xaalNU?=
 =?utf-8?B?UGpyTGtLeG5xNW1SL1kzR2svVi9uZ3pBS3dwQmpHS2ZkNFVjRDJsTWhycTA4?=
 =?utf-8?B?Vy9nTlZyRWp4V2xsZHN2UGt0UHNVcktPb2xZTVB2Tk40NDFneHZaN3JaMldL?=
 =?utf-8?B?UFMxMXE5dDJDNG8xVXlqbkxJUC9KZTZ3UmhtNUVadmxmZzlIbFFERVVBMW5y?=
 =?utf-8?B?Q2Y5MkpWc0huN0NjVEh5UFl4R0VkU1JmN1RtWjQ1QUs0Qjlyd3hXYmF1Sld4?=
 =?utf-8?B?YjBsTGJHTzJYenBFRkpmNmsrU1FZUmx4djNwQVdyT1k5MlVXaklUWmZxMTN3?=
 =?utf-8?B?QWxPT0R3SExJZWovdFQ5aENYUXA4eXBZaGNFem5NOGVWbVFVUU5ENDQ5NUVz?=
 =?utf-8?B?Z0JNc3hjbnJwQllPaGF1ajBNWEQ4VFpKaGZUbXd4TDVxbzVEWjgzRDk3QjJk?=
 =?utf-8?B?WmdzTkZCSm5RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azZQd1poQU9xR1ZtWFhPbEordzZ1bDluZFBOMXpNNnRXQVhzZHFpSC9yc29l?=
 =?utf-8?B?dk1IendWbEtteFZ4WXJyUVJTSW82ajl5RFRZZndvVlJqWGNoL2RVWWdEbURH?=
 =?utf-8?B?R2ZvZ0UrNVBjbTM1MXF2YzB0S2J5UUhJNFBlb2dpcktYeU1ya3BkMm8wb1Qr?=
 =?utf-8?B?WUg0RHRLeHZ4bk5nY0ttYjUxN25ZOTBoK2g4dHo1dnI0aXRYc3NHSjByNnYr?=
 =?utf-8?B?KzJoK2RUblptRWRHY1R4K1pjcXd0NzdUQndhelFac1NpSXcvUUduRjZadTlN?=
 =?utf-8?B?cW5QYXZSWGlueGZ2WUFXOVZoTkFUSEFsSmh6REZaT0RacmZ3NGZ2dnNaTWI1?=
 =?utf-8?B?S2VXRHJXOHBkVmVoeGcvVERKajFXQXlyYWZYUElibmphSTRpRWZpRDIwQjhV?=
 =?utf-8?B?STdqbjh0ME04RExQKy9lVGRPZDRVR2hLbWphMlg0TWdQMzBTWmxzVUtPamI0?=
 =?utf-8?B?ZXlhZkZNWWFlK1hyYlp1WFFLQnpoUE5wU2pmd0hJQ0FtV0JlbVZwdXBiZkFN?=
 =?utf-8?B?TkxKdG1Hd3JaVzc1N2FFNFJ0RXNyWk8wM3ViVk1hMDZFeEd4MVdOMHE5TUg3?=
 =?utf-8?B?NWh6NjErcWlQWjlhUk4rc3hIcUoxWk0rMFpJcjUxazJmQzY0dnJkMHFIOERt?=
 =?utf-8?B?dHBMbzVmczdVV2NUMVlYWDdqN0NVWjNjY3hFUVJwbUhkdlRBRXhCakpGdHMz?=
 =?utf-8?B?dG4zdldsYytVdjUxT0hqdEt4RGYzWVRsaUtOUmNJeUZkOGJtTTMyZlVzOFlj?=
 =?utf-8?B?NFBMQzFIcHFidFBSYmw4YXd4ZStPa0RmZkg3dWRHbEZzZGtRdWM5SVY1WGtT?=
 =?utf-8?B?MkZNV1FOS1A5N0U4dTBpTDJTZGJ4VnZ2VVNZMWY2VHBmSzVRZlRYUkNXL0ty?=
 =?utf-8?B?RVRNOW5ueWJEQ2IzWDF0Vy9xR0FjeEZWc1VZTHVTVVlkeFZDcUZ3YXY0TGor?=
 =?utf-8?B?YkdiV2JqT29PZFBjY1hjSUtrMU02Z3VIa1hKN1hYRjNqUGtKMllEQ094dDNE?=
 =?utf-8?B?Y3R5anYzQjBURm1KbXNhTWZQRzdHczJtZG9SVVJTUmZBcDNtVkNZUzN5eWh4?=
 =?utf-8?B?b1hoZWZLa3haQnBpNi9MVy9YZnNucHZ4UjVIUFRJMGtWcytsYXEvWDFmUWg3?=
 =?utf-8?B?Y2wrUStYYXMrVTVHd2ljam5MZmI4ZU92NkY2Y1dVeFg4eVBUc3lkZ1RWMlY2?=
 =?utf-8?B?VEdQMmk2ZzN5VDhmM2NuRUpLa2gwcDArQklhMUhpWHVkRlZPQVMxMGgyOTQ5?=
 =?utf-8?B?aUVmMGw3NjN1R1ZUV3JZeW9NTW1LckdPcVE4VXR0UzVWVURYaWQvVk4xOEt3?=
 =?utf-8?B?YXJFS3lnZFpuaUdOd01zN1NiUVNjVEVaL1pZVU5YVXU3TE1JV2krcHlsblFR?=
 =?utf-8?B?bnVhUmJYb08wRnRjbzhoUlg3SXVObzgyb3NWVllGRnFjV0xLLzlabjFCVkN0?=
 =?utf-8?B?RWdYR215UEZKT3F4UlpiMTc0NG9PYmdGbUJnZjNVSlVWWXpBVkh4RU1FR29E?=
 =?utf-8?B?YXRTV1NxcVZKcUZmbXJIckR4Z0hpVExRRG8yZm9jWGt6UVczWmRyUG5TSlJ1?=
 =?utf-8?B?K1BJSlN0a2N3MkVUNjhNSEhwWTFqa1ltMXJ0WkVpTjRHbEhRRjlhQ1lYU3cy?=
 =?utf-8?B?M3F6QnV5MUorejJYZkhNeFd4WU82ZVNYZThOZnB3ZEtZQnpDUXFLTG11aXhT?=
 =?utf-8?B?YXV2NC9BOS9tNnpWVTFuaU02RysrR0EwbkU2V1VsRE1tZU9vc1RwWWk1VklP?=
 =?utf-8?B?UWM4Z3RMWCtqZlV4S3FaRkVhRVdKZnZXVER4Tmw2UjViYVdrdnVkMUloU1ds?=
 =?utf-8?B?OEVNdlozN0dsOEJDcXVqZXcyVUJINWZFZ3VaOENROTU0a0lYY2JWZStNeHdL?=
 =?utf-8?B?U3ExK0t6K2FJRGxHQ3V1MktMQ0t2MlZ5RXg5UmFVM2Eyd0U1QjlxeldMM1Bm?=
 =?utf-8?B?cmNPQ0ZnSG9tUW00aDE1aENrdjFuUVhmVnpGK0EyKzVqK0RtQnZwZ082THl6?=
 =?utf-8?B?UWdKbDI5YitlZVFSeFhMTHdOV0lITzFGU1FJSHlSMVZid3FyckFUeGtRSVlt?=
 =?utf-8?B?cEdSSTBBK3JwcnNWME53cTdDaTh5QXMvUW9ZUjdXNmNBNEt5dUhMM1JXNWc0?=
 =?utf-8?B?R0xJUzlWV1NkNDNhay82MGhXdmlyR1dNaTVJRWVLdlB3cjdLdE02M3hHQkNs?=
 =?utf-8?Q?5INzfm5+KnHg/hFw3DLxYCE=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5415b7a2-359c-4440-6891-08de10787115
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 08:04:21.6716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ALR9kTlA6/zW6cREY6dSJD/VNgalcPXQAgwsyR/qya3P7/51TEAby3gQOVU5tyGMjeE2gvi0IJmDaUyH7pQYnnPB9xgWHJj1Qe0tyBbzYwg1sSY5F9EBD4VncDxVKEyg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB6588
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_010433_447225_7E098E01 
X-CRM114-Status: UNSURE (   4.51  )
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


On 21/10/2025 15:57, Huang Shijie wrote:
>     v1:

The v1 link: 
https://lists.infradead.org/pipermail/linux-arm-kernel/2025-October/1069661.html



