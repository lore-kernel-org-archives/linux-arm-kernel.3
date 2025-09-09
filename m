Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EB4CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 22:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46k4Dos5xT9qpvPH2TZY6WmNPzIMXLN213YoDKvwjvU=; b=mySuHvONdFizOR7d9L2ojHJgx2
	kw/nH+gQGuuMn9nzGEOS42BjeGTgj3ChJligHyLPq7bvAtdsfT3FD7/1gHqVJoaFkQQVzwUTFSFM9
	lNkGFfu3ZHzHPhP2E3Cnk2OHBKAvqYAZB3XCIHs01GCmRUT5VX5qaNA0woEvFKFhRTha5hZVKIOBC
	HJ9tHVSlcL3m1drLJVEzABWUwGl+bpXgsoBdQ+sLyz9L+Ec4/WkIGy5gLXx8v14cWbp0F5+yCqkCO
	uhJMYxXR1eHt4wASaXEDaK/W9wCzwjCjCbSYE/Mz/aJIuk27L1gaAFsmjCePMhmi1yj8lMMhffOw6
	1+xjvLxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw7A5-0000000Al1f-1SNQ;
	Tue, 09 Sep 2025 22:50:05 +0000
Received: from mail-mw2nam12on20612.outbound.protection.outlook.com ([2a01:111:f403:200a::612] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw7A2-0000000Akzp-3Od5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 22:50:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQDY/2LCs37zkFxp7n8ZYeKs6AZM7rAb11d5eI1mRDm2b3QaNaRRMcLVkQB5QVx/4dRb2S1bEaJaKKp3lj1AE9+xq0aX37/wbOgUfLXmrMuaTRBL9gG52fL38wjEPqXbQ305MoyscXg9aDUjNgHlxHYscDc/QrbBf2ob9/DfeAwftW9OfqJLYSkPY3CGFeDZTrsOOj3HRgaj+HbNVH4LF0CgFVVqcDTFfEVdEAynbr+UPV8kKpgvlCayDf0O+gB/3H4jMoSPivcOuZ69yu3Oyw0oeOKIxnqhwGDTxZ64FS4vflNKzZlb0ZWcR1CudX8/HVOjEJSDTKGuEDY1hOCPUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46k4Dos5xT9qpvPH2TZY6WmNPzIMXLN213YoDKvwjvU=;
 b=fBxFqIgz0dsCBcmR2waG1OQmD6PsU2dVeLX8xZLKDKseIKzIyFCAMmm1gmwcUGYC16BD94pXoRDh4IH/DjfDXnCmqNOFW4ScmYz/A4gKcGG1oF86LHn7Nc/ObrGWcwyf6yWCmuDHFVYcYXH+QV9ecjEDuikOlL/o1idMQNyzymcfwp5awy661t+DQLHJlumH6bl7J7nQ+VrdJrsj6iqMeUt6nkHzW54072cbPyoDk6sumSlQkJEd+BpW+l65pvqs1tcWIEOdX5pXaN8NW80Xo2tcPRJLaozYpiQiCjlrBQLxWJFnTrAR+5fSCmXC1aH7j18vBf0Y8uSv5IMkoP4zEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46k4Dos5xT9qpvPH2TZY6WmNPzIMXLN213YoDKvwjvU=;
 b=hzj8qkIyW869K9YHT1j06rsEb6cjk/YrTw8e/ZeNH9jPrrfONFPxnPWmCOfVbKCZ3HypXhM8pmByJQ0xHp7AGReHSX8WlK0c744h3RGRETD24vfTB6SH4x9RlW+Cmh1G8Eyj2xRwV4WryNRxdfFP4wIFSib4TnvulSEg0IacDQ2Ibl/2fyvfUL8DSqG3WHzBaLjEepLhwmacB43mTvP9mAx1Z7xfJwbojFQN+dtKXCrk3D1th4uS19dsedKXauBL1/tnKJv1GuANmJajl0+EbXiyrZSU6I2BS6QgvvOlj/vCdpF+WFPfpJwdGuIDZejrrXOdSPJfwBfTDG+8g7541g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS7PR12MB5885.namprd12.prod.outlook.com (2603:10b6:8:78::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 22:49:57 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 22:49:57 +0000
Message-ID: <9d463bc4-78e0-43f3-ae69-2746ab72e318@nvidia.com>
Date: Wed, 10 Sep 2025 08:49:52 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rfcv2 1/8] iommu/arm-smmu-v3: Clear cmds->num after
 arm_smmu_cmdq_batch_submit
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
 jean-philippe@linaro.org, miko.lenczewski@arm.com, peterz@infradead.org,
 smostafa@google.com, kevin.tian@intel.com, praan@google.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <cover.1757373449.git.nicolinc@nvidia.com>
 <2f7f5fff38d43221fd60139323d23b258e34cf8d.1757373449.git.nicolinc@nvidia.com>
 <d2852d21-60bf-4ca4-a0d2-e70c0c6dc010@nvidia.com>
 <aL++Qv8bNvL5qjL8@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <aL++Qv8bNvL5qjL8@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::13) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS7PR12MB5885:EE_
X-MS-Office365-Filtering-Correlation-Id: eca2079a-7498-4464-1c60-08ddeff33347
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ampVQ2hLTkRmSzMya2pJU0tCVXhjWEZLdi9rc1g0TlNWelVwKyttV1dUVUoz?=
 =?utf-8?B?aTRMajNNWXg3VEFsYVNrOXhzVmFYbXZXTythQU5RNXZzSE0vRXcrdGR1c2xx?=
 =?utf-8?B?T2JEaktVRzJtSS8wRnRIcy9CdDZJMTNmMTBRd0dIbERZR0pNRm1zampXUldV?=
 =?utf-8?B?aHFCTEFRdVBROEtGZ2lNK2RPWitJcVdsbXVYRWxNNGtqQ2ovcTRvL0RONlBl?=
 =?utf-8?B?cVY5dDM4L1QxcWFTYWFhUkhUWjN5Y29oU01ZWkFwSVYxQS9rQ21mdTZmVDd6?=
 =?utf-8?B?NSsxZW16VVpkMm9TR012dHlFVjNWY0RqTmdyb2oxODlqejMzNHppb1FmNTlX?=
 =?utf-8?B?L25UZExKRTRTbjZGRnFOblBtNWRrUWMrR0Vnb29DQ3V0UVBIOUdIZVpBOWNm?=
 =?utf-8?B?OUEyVnR1ekcyYkhWejU2RGRxMnpOdm80M0JqOERHK0NmNU1oU2RPSi9Da2pm?=
 =?utf-8?B?NXpiZnJCWmpBSGU2dDNjWjF1YTFPVERybW9GcHZ6b1ZZbkNGMHhFbWhoSFVw?=
 =?utf-8?B?WWdDeUZWRk53bVlNckNEOXp5dDFtN0RVWnZNSkJPZCtTVnd4NXJtcjNINjAy?=
 =?utf-8?B?cjR6bklPd1IrZFQwem5sUDU0UEhDVnZnU1FXZzB0eHZ1WGJPWDZPM21HdGlk?=
 =?utf-8?B?WDAyLzBBZ0RrMUNFU1IreTVkRE9STzVKYlVSc0hQZXhXMGpZUnpZOTJWdXJD?=
 =?utf-8?B?amNhRG9wK3J2dllBWWIrM1dCbTRzL0RabFJVSUlYa3RyV3pWdlZ2RUx2YXpG?=
 =?utf-8?B?V092NlJjTWFyeDdsdzdtR09RV0ttQjZueGJmU0w5NE9UMGlxU2ZWQlNhMjBF?=
 =?utf-8?B?WGFlWTZnUERraGd1cURsbEpQemIvYzc5K0RuOHVmWEkrdXV6Z21VMmlvZkZ2?=
 =?utf-8?B?Qml0NjIwTngwd3lXSlFlYWFUR0tCTUFtRGsvd1lUU1JQcXFzVHZwaklGTzJh?=
 =?utf-8?B?Nk9UeWNFdUYwQ3IzMVhUYVI4czcxWFQyNEJlTThHMVRSQ2JudS9vL3VBdlBN?=
 =?utf-8?B?ZnNCc1M1YmE5N05nMjhMLytQeWdvUWlzakwzamEyWXdRZjFaek5uY2hFZklm?=
 =?utf-8?B?L0VhdzhPY0ZOZ3NVejBZS29FZ1BlSTNpSTUyallVMWsvOU8wbjhjcENTL3dM?=
 =?utf-8?B?YmpxODQ3Um1TSk9BbEhYZlc3QlZldDJta1U5aWlkTjY2NnI3ejhyOWFwNHFE?=
 =?utf-8?B?U2QzbWxCZ3Y1U3NIQXVHb2xJRWF0d20vbVlzT05LQWllNXo5RU1GRzI2ckNT?=
 =?utf-8?B?aXZCdXVMTjJBRjN3dzhUNURCT3kxbGluajRURktYYmtCdWIzb2dkWjZ1OUFP?=
 =?utf-8?B?emVmUzNWZGNaUU1CU2txT2NiVVFOdnpKWUtxYUxLczlOMWZ1Unhza0M5WDUy?=
 =?utf-8?B?ZVc1MHVzbkJCUmgxM1VVQUhEZVQ5Z3JiRElRWnBpQU1aazkvTzlOMTh5MTh4?=
 =?utf-8?B?T043aGNvTk1nMWE0ekd2OHJkK3pncGlnSUZROFJYUklheEE0VnIvZmFyVTc1?=
 =?utf-8?B?TTlaL0FjRHYzNFBzTlpsTmVYMkI4a0pELzlQZFJycURPQmpwaG9sR2hMeDdO?=
 =?utf-8?B?ejFRZ3BndU9NM3lKYndKKzdXcEtqNmxuS2FnUE5EWGVkOEpDeE9CTGVIYUhT?=
 =?utf-8?B?cFpqZXZMNFVFQ0x3cVRxdGVuUFprZHpQMUgvMmVjNU93Y2R6WjI0M1RjVzdp?=
 =?utf-8?B?KzAxRUdoUUdVbkRWRkQwbnRrN3kxb3VPSG05UzE1RkxBYUFtcEs3ZllKSVN6?=
 =?utf-8?B?aGY1RUNsT2lTVUJDSmpFaGNpSkpKUXV5VHZ3ZWkrNFBMV1ZjTS9COW42bzRI?=
 =?utf-8?B?MVh1NDJUM0tUb0YvZkJyZU9BS2V6NDdWWEs4Q1VVZldGYTc0cW5qbkN1NU0x?=
 =?utf-8?B?MytXWGdoWTdwMVlJY2xPNExEVUlKcFVuZmJYSHZiai8zdUp3N0pBWW1FN3JR?=
 =?utf-8?Q?1t0Bm0FCXw0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M215dVh0Tk5YSE9FczdKMUtQeVRnV3JDU3FyWTN0bnJ2UWRGUWhSVzlxZnE5?=
 =?utf-8?B?UFlicU94LzRib01lSGZ0MUs0b3dSY29vVlZZSDB2OXFhNnNtTXRaY3J5cmZW?=
 =?utf-8?B?MEd1OXlUdDJxUmZRelp4OGx3aU5MTGhDUkNIMW9TTU40a0UvdEJVbWdOdFhC?=
 =?utf-8?B?bWVodmtBT016blk4NFNoK1FCcGw4QkJ4Q2p3bWlVTkN2WHJKcDdkSnZ1S1V5?=
 =?utf-8?B?MjR4SzMvMkZGRmJZQ1gydXJEUitRRXdyU0FHK1o2QjdvSXc1c0pmUW01UDBK?=
 =?utf-8?B?djNoekRQY21BanQwMy95c3NqYnhrWVVJQTJoa3lGVGJvNVpjWXNlQnFDelc5?=
 =?utf-8?B?SktRcVZGSmlnNTJ5Mk9OZTkxSk80VUNxOEJxS252SXBMdlJlb2dnYkxjK2tl?=
 =?utf-8?B?OU9FN3JCRWsrNkptb2JZc0Zqc01EL0VKQkdHb3c3MWN5bzJGT2VtUDdMYzdV?=
 =?utf-8?B?VkhnTlNGSmIweUp3dkorS0pxdzdIUVpORzBOZXU0SEc3M3lHQzdtSTgvTmN2?=
 =?utf-8?B?N3VNY1IwUFhER0xpM2JqKzJsZzJkME1iL0ZZSlFJNm9CZE1jVWVKeGJ1UFk0?=
 =?utf-8?B?S2ZNTkU4QTlMOC9hREdtdWFHZUUxWks5Rm5sV201VVRUZitQRUdyM1NEcFRE?=
 =?utf-8?B?c1pNbCtMRjRuQ0hGeFBKMXpGZ24rWmJmY1hyZEliRFZQZk9TQmNZSDVVbW9q?=
 =?utf-8?B?bGdhYW95UE1oNVhVOUJMTUExWXhncWRZQm5KNmZyZnpNc1NRRm54NStxOTNm?=
 =?utf-8?B?bXRlKzB6bG5rVDlDSVFCZnhvVEFIajdPbEhsNUtQMnZTQldaN2ZjczFGajQ5?=
 =?utf-8?B?NndXODhiMlgzajlSd3pUQW9iVnZkKysxQmhNWGNjaFNtYjgzSnJjL0RYREFO?=
 =?utf-8?B?N21hSjZNTXdQM01tQktsUXVMSjk0bmluOUFsZzdBRjBpYjR2ajY1bkRUZlFG?=
 =?utf-8?B?QlZyaXEya2ttQmZlbW1adnBVQUZ6MlU0Mzc0RWh0QUVoYXQ4c1F2cXQyUThX?=
 =?utf-8?B?N1ZQM3JnWTJDOE9wSEFJUVVQL3JYdFFRRmJYdTJmLzY3N081RGdEN2tNaU0w?=
 =?utf-8?B?Umo3NU1LNzFzUm9kNmY0dDRzSjNLL1JySWM1V2N1bDlpNkxXOG9Wb0xsMGVq?=
 =?utf-8?B?T1N3QW0xRHpyV0sySXZRR2QrL1REMzM0WWFCSE45WUcwYllCTHppVTVpQXlx?=
 =?utf-8?B?SHBZUmN6cHdYNEZQdG4veEFPeEpFQTVaaCtQYUFhRVRYZ2VWY0VaV25YK21E?=
 =?utf-8?B?UElCWWtTK0wxNFBzM3hzVXZ5S0thaXlJMEJHMGZRYnBqV1FGdHlrUW45eER0?=
 =?utf-8?B?ZEJMTjdQeW9Ba09hTWRwWFoxb2NlS2RDQ0RjMkFoU203akNXUW9RbytZSmZs?=
 =?utf-8?B?Q2lSQ2ppL3VCTHRoQ1Q0OHl6bzBYWEp0TC9kamlvSjl5R1BsNVU4dlhtRlRI?=
 =?utf-8?B?OXNmRFY5aGVuV25yS3BsMkFqRHpzWFRqTk1IV2JqaDVUaStsZ3JRdXVZM1gv?=
 =?utf-8?B?T3pFMWQ3MExmYWNkVlVqY2lrbnJha1RnU25najBQZ0YwTm1SM2NMVEhmSWRX?=
 =?utf-8?B?SFNNdkEyOUJzUWJ5WEZrSGdpd1ZmVk5tYm40SkZLS2xzWGNzVXkwQWJCV04z?=
 =?utf-8?B?RnBzVTVha0RWZzcxZlVIdGFZVDdNYlo0dm1weERoSTg1dWNjS2tTZDRYcGhy?=
 =?utf-8?B?cDZNRHEzNlZoYzNpN2NKL1N2RW4yWkQ5a1VzN0FRSld4YXdxZS9TcHJZNzVx?=
 =?utf-8?B?c0E3T0daWk5xN0VRVW01dnF1ZGE5N1Y3bU04Kzd0SEUxVjAyYmIyYkpsREow?=
 =?utf-8?B?RU5Ea2ZMa3FVSEhVV1V4SUJ0cTJNYjU1cm5kUWNyZWkzZTg1S3JxQThHY0NE?=
 =?utf-8?B?M2x4aG5tQ0NmWlpQMEpZcFpTR1YvTDFOaXJzMGZseHRrU1RHTkRObDMzbmQz?=
 =?utf-8?B?Q1FINXdKaVgxTTB2NjZmOGQxNEwvZlR0L2ptRnp6SlptQ2FOKzdmSFdkQWl0?=
 =?utf-8?B?SjV2eEN1ZXI2WE1UQmRnZWp6K3A5VndLUVZxWjNPaUplb2F0TWFwZi9UNDUv?=
 =?utf-8?B?MDlzOFgrZ0FNQVhUQkVza2dkWHVBSjVOOFBBUTlwY2xrS1NNRHFZVFNHYWlD?=
 =?utf-8?Q?DWpIPWGkqv6AYSTsYdWlzim22?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eca2079a-7498-4464-1c60-08ddeff33347
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 22:49:57.4311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q73cNn7nt8IU4rKUHT9zMBN2sVY7VaJaPVoQ4EmBuQUB7qDh03grbZYRDX0HrFLh4G5lqGzBZgo0pS4lUSqy0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5885
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_155002_866415_E8DFB5F7 
X-CRM114-Status: GOOD (  13.90  )
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

On 9/9/25 15:42, Nicolin Chen wrote:
> On Tue, Sep 09, 2025 at 01:16:11PM +1000, Balbir Singh wrote:
>> On 9/9/25 09:26, Nicolin Chen wrote:
>>> None of the callers of arm_smmu_cmdq_batch_submit() cares about the batch
>>> after a submission. So, it'll be certainly safe to nuke the cmds->num, at
>>> least upon a successful one. This will ease a bit a wrapper function, for
>>> the new arm_smmu_invs structure.
>>>
>>> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
>>> ---
>>>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 10 ++++++++--
>>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>>> index 2a8b46b948f05..cccf8f52ee0d5 100644
>>> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>>> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>>> @@ -974,11 +974,17 @@ static void arm_smmu_cmdq_batch_add(struct arm_smmu_device *smmu,
>>>  	cmds->num++;
>>>  }
>>>  
>>> +/* Clears cmds->num after a successful submission */
>>>  static int arm_smmu_cmdq_batch_submit(struct arm_smmu_device *smmu,
>>>  				      struct arm_smmu_cmdq_batch *cmds)
>>>  {
>>
>> Nit: arm_smmu_cmdq_batch_submit_clear()?
> 
> Probably not. There is no particular point in highlighting it in
> the function name, as there is no use case wanting an uncleared
> version.

I did not suggest we need an uncleared version, I suggested the change
in name to highlight that the function has a side-effect of clearing
the cmds->num

Thanks,
Balbir

