Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD2ECA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xK7osL4CNDIriK/GOmavo7xV+ncgy0nNqAl/PcC8k0=; b=2uP5mtWogAw0XIae7wwNGxurVW
	mHF8sNAJzDdYgw+MT/IAQNFLVJ6p2/ZGQpWC+41JlBnAq6sEel2qYPVqfgM9bxABA9L+PFFlCwHEU
	e4luSM4xpId4osDWJOhXiV7sQd7PlAd+zT+316wvNusW5KqdY3iqJhEhU7yH3HrlKV9xnqzB+wqD6
	tGOPzLduGNuNTtTK58qyxjCXFAEefFSBzTi1khzP1KoKBlu2A73pdMcJfduOuzP5F0FwWQo/+MBol
	nr+Q1dJzWXuVo8HTRj6nUAopLE2f+iTdIOFOXQdF7BgXTVDS2GHGr9Ge4+JoZ0fgdkkTRNiVLScJ8
	6js9Jm2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPqg-00000002I08-1q2w;
	Fri, 22 Aug 2025 11:22:22 +0000
Received: from mail-bn7nam10on2048.outbound.protection.outlook.com ([40.107.92.48] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFWg-0000000114t-0jJl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 00:21:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GDq+nPBZW5cDCUaXkLyCfXuwgBZARVVYzKhDX/1tnDjS0qifYCeXx13zdBd/pjy1KmvQIYoPgl6QAVBzWcSby6WjSwfcahenIFAG2tdkzkNjPBXuyN7DcLDbchz5A7dVcUjYg4wNfjTEABe9B+VSvCK0FWU0BKLmRItHGiYNytL30/w9XHFcdeqFocbBO4NV8O7WzGrJKj+p9bB+LolJFkd97eWFts96t7YC7VI7jRAqzPo3Y6hiPCOuwzeMKPVh/GUma9887O8yC3y9OWkoz8EE75tcT1CqwPNexL9vcDp/7KmQmgi+Pl7ItZN9JjQtp+QZfAFIpZu/FgdfluFAOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xK7osL4CNDIriK/GOmavo7xV+ncgy0nNqAl/PcC8k0=;
 b=Nxmr/Ilu/gKeu4C4JjhganXJK17+j6Rfr5ci/5pm+pU3gmbgEAQZhVwMvg+Pfxvj2scmporzOkaz3Z+qYN/nRa678jcUF1QSWWh3FM4VmKM7Fh2FPV4Rq0i5ABDDH2S5FumGQ75ZsEysEkj5vD8HKr6ST0buYQ5RIYHmrxzGrw86VHudZjg9feYHImv53EMShHRQ9IUjdLCvfWt2qFsAU9GlUK66v+FQ6q2/6e7NQLCJ2RrtD0dljrQXAOQFSo0Pqztj/MN7cAQqO9tAzvMJWU8tMWQsJ1zzAq1qPEEkbBvOy1CG9FvbnC1vVAf5tmz62F0fCePY2bfeHMF2NWSZMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xK7osL4CNDIriK/GOmavo7xV+ncgy0nNqAl/PcC8k0=;
 b=SNHIihHs++iZNV79IuQ16IiVfkoUGdHxAPVBFHJ3DF06OmXjYsFwHcPiC6PS+KX65XmG6qqUNOQ+MHM4U1vATGhsmJU4XTskY+pPvLpIIArgA7I8owEcnYActy8ijiLwiepd2XPrs3N0o7sxylnMD2e4yAo99lsZdzPqcoczhPBqCFUfxNNipO3nydrcfGBoO0MDvHDoQN8TGc2BtO/nDoYcskEu2RDaUFoJ1+fs48+4kj9Q9u9ZiqDWb3SgsF4uhzorRfvAbV9zvN37DrhG1tTpReP9H7t1Aw3bWNBsovy68DueUOR1s9ZHRRtmA4Q7KStZqlaobxDAumA5dcAD9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB7282.namprd12.prod.outlook.com (2603:10b6:510:209::7)
 by IA1PR12MB9530.namprd12.prod.outlook.com (2603:10b6:208:593::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Fri, 22 Aug
 2025 00:20:49 +0000
Received: from PH7PR12MB7282.namprd12.prod.outlook.com
 ([fe80::6f03:f851:7f6c:c68d]) by PH7PR12MB7282.namprd12.prod.outlook.com
 ([fe80::6f03:f851:7f6c:c68d%7]) with mapi id 15.20.9031.023; Fri, 22 Aug 2025
 00:20:49 +0000
Message-ID: <03741606-1ef2-4099-889e-2e0ef27cbb15@nvidia.com>
Date: Thu, 21 Aug 2025 17:20:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Add NVIDIA VR144NVL board
To: Conor Dooley <conor@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, etanous@nvidia.com
References: <20250821051047.3638978-1-donalds@nvidia.com>
 <20250821051047.3638978-3-donalds@nvidia.com>
 <20250821-baffling-immersion-e86971edb6e0@spud>
Content-Language: en-US
From: Donald Shannon <donalds@nvidia.com>
In-Reply-To: <20250821-baffling-immersion-e86971edb6e0@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0037.namprd17.prod.outlook.com
 (2603:10b6:a03:167::14) To PH7PR12MB7282.namprd12.prod.outlook.com
 (2603:10b6:510:209::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB7282:EE_|IA1PR12MB9530:EE_
X-MS-Office365-Filtering-Correlation-Id: e15f29a5-b3ec-42c7-4b42-08dde111bf55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NC95UmJFQ05iVnVkR2h1UWVGR21SZTdZUzVDSjhGb1hWUkk3ZUlKcEJDRkVp?=
 =?utf-8?B?MXo5VG1xZHFMRS9ldEZLYjNjZGovQ0s3RWJaY0xPdm1NdSsrOGVOWDhBQ0Ry?=
 =?utf-8?B?SGtRelRnSTBLbHRkWTBaVUdNWW84a3Q1SGg2dGNLa29sVUVHcnVXRUd6d2Z6?=
 =?utf-8?B?T2RFdWIxcjk1bW9JSFZLRnN1VTcrVVRqR0JkNlRXS2JlOWFnYndibjY0WDFG?=
 =?utf-8?B?ZXRYT2ZkK1F1OHM4ZlVIWGlnYUNidkpLQ2RJdmwyRytvdjd2cVdPc3lZZm1P?=
 =?utf-8?B?VGFQeFBLQ2ZKY1djSDdRZDVpWkwwdTdGcTI0NGJKVUQ3a1I3ckR5NDJEZFNO?=
 =?utf-8?B?MVlpcDBjQjMxa3lsZjNZbGVMRlBEU3RuRWNXUFFLZzA5b2lhbTJHZms2MlA3?=
 =?utf-8?B?b1p6Wk5HT21PckNlSWxhdlNEY2VtMGtkaVJGSjZLOGd4WnlsMSt0dlpNcVBS?=
 =?utf-8?B?dXJNN1lRRm8zcTBENE5UOW9MY05OVUJOWE1VWkRHaUJ4OGs4dU45b3FoMVI5?=
 =?utf-8?B?d2JCc2hwRWlHalJrRlBoMlJ2NGk5cm96UkpvM3lVMzI0ay9UV3RFcDE0V3gv?=
 =?utf-8?B?QmVrWVBqV21VVy94MnNqT2cxRTU2Z3JMVW94c3NUS1FYQ21yWm9HZVdkQWJH?=
 =?utf-8?B?RnNPblFFREhWZkl4cC9TdWlEcXRocC9LMEZTOWpZSkVBalBYUWpjTUpQN1lJ?=
 =?utf-8?B?ZnN5Wjl0TWRXYU5CRzlXR1RJZW5JSkhpNFowMUlsWFNhaURTMFlqeUZVV3Rh?=
 =?utf-8?B?dWZFcWQwYnhEcGRHeS9LL0FJd3ZaK2t2YUUxV2dGWENyNE1RSWZMbHNpajc3?=
 =?utf-8?B?cmJGY3BHYjFQZUNiYjZXZTJhTTdYbXo0eElNaHhkTkg2R0s5N0RPcmJQM3Bz?=
 =?utf-8?B?cUxRQWlmQWNROTRYWnVIcm5nWDcycjRQeEFjZE1vUVFBOHdJRWJQTWZMZzJV?=
 =?utf-8?B?Q2t6M2xRV1lQSjlTYkFJRmdDVWpDTHZPT050cHpKSDhJK3ozd2ZWTHdTZ3lH?=
 =?utf-8?B?RktsanNEb2RMY2VJdC9nT3pNcDJsaDFURXJtLzhjZFNFTVBSSkFGaEpNaGxz?=
 =?utf-8?B?bFl5VEFEYWt0Y0hlaitZaU1idTU3VTZTQm5HTDF4enVJdFZ6c2hSU0paLzd0?=
 =?utf-8?B?VEZrVTMrSlJidUpTNjVWVnBTdjUwM0VqeEFnRjVqN1BBVDdJNncxWDM3WUoy?=
 =?utf-8?B?SWVGenNPS3JlRUR2Qnk5cXI1d0JYNG0wbmNhSm9CUGpWSFpTY3VvdTVoUmFP?=
 =?utf-8?B?VkUrdXVhendyRjMrdzk0dzExWDYwY3loSVhsRzNMRXVJb1EvRFZCOExBeW9j?=
 =?utf-8?B?UkpGdVpEVm00STdCaEdLT1dWZXpLZkhCT0ZJamplSkprTk1Bc1FRWDlOZjF2?=
 =?utf-8?B?cXBkUzdqZGd1aG1xTGc1eVJMQ3JJd0hiQUlZUEc4L3pQS2k2SEtGdWZpbllt?=
 =?utf-8?B?ZFhKYjJlb2Z1RkFTNUFXVUtqcUdzKzFqMHRzM1FxNFl4RUtHZUR0ajFpaGFz?=
 =?utf-8?B?Q0kxRXlaVERxYlFPQzhIVTQ1Nmx4eWRFaXJVY3FNZzhXL050WmlsaUdteWsz?=
 =?utf-8?B?WWdhNDY2QmhsZ2ZaeSs0RllqRnNIN3VYYUVSUTNncVVWd2dMSEhBdFBkaDR2?=
 =?utf-8?B?R0MzNG1FeS83a1lkSWliV201cnNBdDFrY0tCb2cvaXV6akx2SnVVY0hVLzZR?=
 =?utf-8?B?bXJZYlIyMzFqN3p0SG91YUdQVHdJdzgyWW5HK1MwT2xIdVJWdlpJR2cyMnB6?=
 =?utf-8?B?OTJ3UlU4NVVkTjFRK0M0KzI0czdVRFgyTUY0QkFKKzFXd21PK2ljejBybDcv?=
 =?utf-8?B?QWVaZDQyYzVTZ2tlQXdlVndlMFlpTU5BelFhZHdjdUNJeElnWDFZbEVXUlIr?=
 =?utf-8?B?eCtZMkdGYnpHajdORkVmYXV3L0hnbUd2VXJDa0hZNVY3aUVUSEg3a2VyeG9X?=
 =?utf-8?Q?VCaL2GQJM8k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB7282.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEVUYzAvd0JwRmg1cGVnTUtIMjRlMFFuZ0VMRmZJS1ZiOFpTdHlFeXVSRVp1?=
 =?utf-8?B?czVIaWVrdCtLWGJaVW9LTmtsQ05La28vZ3JXMWxlUUlWeGtJTVFmK3J3TDlr?=
 =?utf-8?B?VWt4UVFlNXdVSjBlKzBocW9iOGs3aFJYSWxDdmQxVWp1SnB6bjY0QllhSEdJ?=
 =?utf-8?B?TXVyUU1jeXBvT3g0djVQUEk3TmF5Nmx0VVlFRTFnR1Zjd3dkekpQOVZhT2wy?=
 =?utf-8?B?Y3dldWkvYTlSVFlJcjY1dm9MelZ2OUVHU2cxTjJWSUszYVlDUnRkdU9VZXVT?=
 =?utf-8?B?VzgxbDcvYkhYT1p3RS9Bdkpzc2ZOd1A4ZkNDUUtwcW5EcmdFaEt3MlpUMVFr?=
 =?utf-8?B?YXB5dno2V1BmbkZXUWNrZmFINElxMGRUZjlwTUlXQmNIWDVBYzdUSGZrWFhu?=
 =?utf-8?B?bGdyTmhkRWVoYysyT3lvQTlFYktkM01yU3RJRDlpQUFqQ2kzWGVIempacTVi?=
 =?utf-8?B?dWkrbC9KUzI0NlJnOVVjWVFlTmdQZ3VVQ3FtMlI5endoR2I1RzVuYXZpVGRT?=
 =?utf-8?B?WFpCVVZoRmx2UWF1WFU5dE1XYkZ2a1lBR1VmaEF2ZlJpaE9QU1hKSngxTTR3?=
 =?utf-8?B?Nys0cGZGdkoyU3FrTFByYnBBcEhuTmpiM3VtRXltL3V1ZzI4U0xvNTZnVWNs?=
 =?utf-8?B?blg3QisweUs5QXZibEZQTDI2bURaek9lQ2p1eUdkazgra1RSanY1c3duYjRU?=
 =?utf-8?B?SzZ1ZFhwait5U2R5OW8xNUJUME9MU2RCN0xHbHQ1M3ZybEtqblJtemtoelNG?=
 =?utf-8?B?Skc1TjZJbTlQaERjWTJXN21rYkZ3Ukh1Q3VSVU9PQnR1cmVWeWFYcENzcW80?=
 =?utf-8?B?bUJoanovdXpVT2kzNEFPOHIyVjRpWW55Q3g3WjJSTm9pcENWNE9uZmhQbGI3?=
 =?utf-8?B?Q1RmOThWUDNyYUpYK05PYWJ6bWdXOGRpWTJqNHcvZ2NvYlJ3MGRMd2VSb2JL?=
 =?utf-8?B?Q0VXUDQzWVB5RHBXcHRrcUdkQmFhNnJUNVcxSytEZGFUZ0g1aUdGT0lvdmdZ?=
 =?utf-8?B?bFJHSTZZcjkyUXJPeEtkc3gxTmVPR1MybzRISHZ6MEpaTzBFM3A1MXJKYWds?=
 =?utf-8?B?VDVmYnFHV04zVHFRMVRjR1QrUFBCQk9jR3Q0TGJXcm1HckV3Zlg1a0xJTzJ3?=
 =?utf-8?B?OUtONEVjRUJaTnYzdVIybWFnOUd6Z3VJVmRISzd4SEQ3cHdvWGVBNmdYSUZC?=
 =?utf-8?B?aGxLVUw5L3Q4a09Lc2NpODlKWnBNSXYvSy9WZ1pmODBEd0RCaS9YblNnZGpY?=
 =?utf-8?B?a0E2NGZmSGlvdVhYUUdOdG16Y01jYStXV0c2UWhSZHJHeG95NlY1ZDRaKzFS?=
 =?utf-8?B?bllpVStDZzQyVnNHMUxnUm5Ha2ZidG9RUmJuQ2NKTGgxMXR6clZweXVoUVk3?=
 =?utf-8?B?M29jUFJSeFdYN3QzSkdqMjUzLytpdm85eTF4M2Z5V3ErQWoxQkszZERiV2VJ?=
 =?utf-8?B?dGt4QXkwc0htL3UyRzl6T2F2TEV2V2J3eTFsS1RXK1Z3Qk9FeG53VW5uNGhh?=
 =?utf-8?B?enh0bDZjNThGUHA2QTNYV3N5akxRZ2FPNDVnMVNXQTZYNERxMkE5M2FQRG9G?=
 =?utf-8?B?NjdkRW5qK2JTUDl5NXFBcEpYMU12VkV5OEp2eUVQcHV3NVFRRU1nV1BDQmpv?=
 =?utf-8?B?Q29DU2gvYXVXeDFhVXB3ZHFqU0FiY2ZNOXhNN0xOeDN1V3ZhNkpiYmFTL1Vl?=
 =?utf-8?B?cCtRaVZ0UDUzK0F3N0RubGt1MVcweVgyaUxDenF6Rk1UaWRMSlU4cGZNeGJs?=
 =?utf-8?B?NkJhaVRtOUZ2RmZ5TlZhY3hlSzNKdFk4Yk5SY3BOSmp5OU9YS0V3dFhQcWt2?=
 =?utf-8?B?UXZlblo0U0M0NmxXalpGU3N5SDFSYTZ2KzZtc1p0b2lXL3RJVXJXNGhlNmd2?=
 =?utf-8?B?NEZ3NlNPN3E0bW5lT1JyOVl0a0FwOFZZQnhpS0tNL2FPUGwwVnVUTURqcTdU?=
 =?utf-8?B?NGdHNElmS2hJVFhxbWtOVTVpc0Z0Vm5Zb1o5QXFqUkpJK3NtNENaWXQwOUpy?=
 =?utf-8?B?UmQySkFBSjNwc2JJb3dsS1MwcTBjaTNSSyt3NWVGMlE3bDZIeGYyK1RyWWU1?=
 =?utf-8?B?aUFjc3BJUWYyWDZWRllERTlKQi9LeUtwZUp1ellhbXBUd0FneXEzb2I5S2pt?=
 =?utf-8?Q?/txaEsx4J2O7p5DlQCvil15si?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e15f29a5-b3ec-42c7-4b42-08dde111bf55
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7282.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 00:20:49.8590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ixF4qwuMCDNXIgrsjUl6Nq64RTX7JEe8rpvV+YiZYpAwf1+rH9txWalyjzpq05dbsogQ4OhNWCKUaJkX9T9oSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9530
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_172102_207658_7EAB35F5 
X-CRM114-Status: GOOD (  10.15  )
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

On 8/21/25 11:12, Conor Dooley wrote:

> On Wed, Aug 20, 2025 at 10:10:47PM -0700, Donald Shannon wrote:
>> +// I2C2
>> +// Baseboard 0 Management 1
>> +&i2c1 {
>> +	clock-frequency = <400000>;
>> +	status = "okay";
>> +
>> +	i2c-mux@70 {
>> +		compatible = "nxp,pca9548";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		reg = <0x70>;
>> +		i2c-mux-idle-disconnect;
>> +		vdd-supply = <&reg_3v3_stby>;
>> +
>> +		c0uphy0: i2c@0 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +		reg = <0>;
> Incorrect indent.
>
>> +		};
>> +
>> +		c0uphy2: i2c@1 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <1>;
>> +		};
>> +
>> +		c0unused2: i2c@2 {
> If these are unused, why are they here?
>
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <2>;
>> +		};
>> +
>> +		c0unused3: i2c@3 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <3>;
>> +		};
>> +
>> +		c0unused4: i2c@4 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <4>;
>> +		};
>> +
>> +		c0unused5: i2c@5 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <5>;
>> +		};
>> +
>> +		c0unused6: i2c@6 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <6>;
>> +		};
>> +
>> +		c0unused7: i2c@7 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <7>;
>> +		};
>> +	};

Hi Connor,

I will remove those and we can add the busses back in for other platform variants' dts-es later if needed.

Thanks.


