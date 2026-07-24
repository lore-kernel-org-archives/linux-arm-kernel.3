Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250D4C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 04:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwL2L4/DF2ksXefGABAxcQngTbRfoQ/xpLh9rKAhdIU=; b=qlG+Bz5bPtjJGdCE7KZFXlKiCS
	QdDlMr7m3QJcqMGTZiXUeyE0ZeoSI5Cq57ij45l1p+O6aGdcvxH9+W7K3sYMDQSfwUekZ0lyl0CGy
	pN6JQugGkgfph3Xa8fxQb10rQ+3LZSI5mIXjentJhIs8mhimspsx6AS/dv/DnUclMXQ+t/u1s3lVP
	W6KfzCBWiZsMMyeEJSLcF/7DSBvJRwbJQzlMIf5AUj3LHMWlGaAQzG4+L3bE74BR9ZHMB9C5WDOPS
	P13o66rEn89S9KrrP0cE4yjCVpJO0sNLhKS/uknMTdpfUw9rUekJ78LUi360V0amcjX9OJCqaenTO
	8lj02V5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn7Rm-0000000FSvB-3kPQ;
	Fri, 24 Jul 2026 04:23:42 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn7Rk-0000000FSun-0V8J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 04:23:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJTQi8yI7zOZzw0BJj657c1a5vk3lWrhUkSWlG66ykwOxy/ayp7ATG0PnVBzP0iYM8hSHkCrrz8HLLVy4ecIdQabX0taZbaMCpOrUqbGM/RBawkFxT7ckOP4n/L+HhzOi7lKYSHm7RuaUDFGXtk0riOD/+oide19FtYpkstxMvrhX7yE7fvf3siVme0bBafzHZLrkPbL6Q7EcvceNVPcAH/XE0fo/oTs7F2ol/338LuBL7BlwCeQ91LCzTcd7g4jEJjRKzgKrD0AxisOBT/v51JHWj+Z54leZxv2mDnbxkegWp0sTbdydk28jzT5Xu59maRCFiMPKHvBQiCC5lJnvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwL2L4/DF2ksXefGABAxcQngTbRfoQ/xpLh9rKAhdIU=;
 b=VLFjUEQ6Oc9QclYSzjHCxN0FsJXcb9JsGXsxu6I+tLTIgJ0/i2iJH75ai0GHSC4199s3vYwlrEJjvYAuDxsBA6ZCchbAceLqheTNJfliM1zjNmA3NmuG20wykvb3m2lhIvRgOofGDCHm7RYGKIdZnvyaMJd/U1F1SjIuF3xHNOVAwOezaD2pGmdH4jvm3kenQaFAIdtbInHYYlYdgqdpoXqWcXtoDMm4RvlSmDTlYhIKqfTIcWM0UAWKjhod3zjbU5FBHk+iQg/ynBs2IYgczG/3rQle7HvFBmsC33+PtnQNqhrQfFFubX4wQ4DA+SGDhhR4qEO603dtteQ8l+wkfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwL2L4/DF2ksXefGABAxcQngTbRfoQ/xpLh9rKAhdIU=;
 b=Dt9ZTZU5/J+KsVkLDmLzG2tIeJrYoi+0BsviVoidGW2j1GrOpt7WU6h69aMsrzFRLVXcoPjXLBNczhdiVlK5L3LnmrLLpCfUgZsu1eAP6Ky772UUPKMSBkK9pZBAigpeyIvxGvXibG/X8Ikq1qRl+Cj9vgBSvxGnHb+hfPO8g95QoWXN8KwpBbDFvK3zit1Iycm14FhD7PmeTxttq7zvQyFcBAoMv/nv4z+t5t50ki7HrFkVeo8ZSV2dNXSsHkGD4IGBLzwWUGa+pkMFwIuZqQVGGZDnhPJEpPtuzxrZt1W78l49TEBgu3L5lz/u+TVBEld3E/8tbNA88z1iWWqpig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN5PR12MB9511.namprd12.prod.outlook.com (2603:10b6:408:2a9::14)
 by CH1PPF2D39B31FF.namprd12.prod.outlook.com (2603:10b6:61f:fc00::60a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 04:23:30 +0000
Received: from BN5PR12MB9511.namprd12.prod.outlook.com
 ([fe80::4d8d:5f91:6c3c:dc8c]) by BN5PR12MB9511.namprd12.prod.outlook.com
 ([fe80::4d8d:5f91:6c3c:dc8c%4]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 04:23:30 +0000
Message-ID: <da01c304-2349-436d-a38d-6b925b6fc86d@nvidia.com>
Date: Fri, 24 Jul 2026 09:53:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] iommu/arm-smmu-v3: Introduce CFGI/TLBI-repeat
 workaround infrastructure
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, robin.murphy@arm.com, joro@8bytes.org,
 jgg@ziepe.ca, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, linux-tegra@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20260722102033.1122277-1-amhetre@nvidia.com>
 <20260722102033.1122277-3-amhetre@nvidia.com> <amETqr7ZBtgt2DKu@nvidia.com>
Content-Language: en-US
From: Ashish Mhetre <amhetre@nvidia.com>
In-Reply-To: <amETqr7ZBtgt2DKu@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0158.namprd05.prod.outlook.com
 (2603:10b6:a03:339::13) To BN5PR12MB9511.namprd12.prod.outlook.com
 (2603:10b6:408:2a9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PR12MB9511:EE_|CH1PPF2D39B31FF:EE_
X-MS-Office365-Filtering-Correlation-Id: dd366172-7273-41c5-d439-08dee93b50a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|22082099003|18002099003|10067099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 4eAyIl2/0MBMph0bfew7l1PKTL1LluAwMX7PW0DXA3huBuKNJO0/gdsTM56CsN9idjKP+/0BY4xph+DJMTTReKM7YBgXcGIEdoWLe5+4mzFRutl6ywuklb8w01FwwBWvalNILC6DgogENePXHyBb05WIlTyMHii5On0agq1IO95CaA0N+TQnCUsFCwE0hRWnIm1sPIaUMvVglZp1BZ7fzh0vhiQSzRX4aSt+3SbM83L6JeoI3nlCYaBeCmDl0FVro7jbUh4ihAO6gV1ypT1/mNWDDRqymiXHAdwsZs09nBhKUxGQ5xEPCtme9ERKWSSzIFQyCWoqIxWoE9FMwaE59zy75Rs6B19IsvSdQ3nWU8++yoXwutBdOHLMeDALCGcUe6HctEynp4JWWraW4uSo0UibvvRT3H2uUJjA8FoKrx85J/Wimmc8a6928HkAcChAwWQYvtVOjSdpnFY/JvqVHBuHAezzHAMzoZ8vqWHGPkDgCxbJUraJHIV6zPdVDUVNzb/6WTIsNqS+4qQaJ5IdRYHYVzxKsmvcWhTsXbBwZRANJAhpxR1/lGrqbGMWPVG7fAgLAidfKJ4dq6q4LDAMVHrVDitE8icLfpOtsCMAXvbqatL/70MxT9GTWPF95QJQGVoZjQrfOphxe7nM/xt9PglJ18s2paHy1fJOkzdNRlU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN5PR12MB9511.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(22082099003)(18002099003)(10067099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RE9SN2F3RGkyMFA0bzFMU2NxeXlWQS9vbHJpZjE1Zmh0QTIrRWs5bGVaZDRX?=
 =?utf-8?B?QWhSWTBNd0hZNnBaU1BkU1QrdUY1eDREYThFWWhqdXIvQXk4Z0FsYnhPcDZW?=
 =?utf-8?B?Z1lsWERJaWJRMmxkRGZIWkxRb0RwU2hTWUdqalNqRG5yMXBOQUxYZ1pJaXVM?=
 =?utf-8?B?V0ROdm4xWFhjT2tHY0VBU3kzcGFtS0o3VUhVSm9Ddk9vR0Jrb1JHdU56Z0w2?=
 =?utf-8?B?U2V5UWVMWE1jdDBOU0VSb3dVRE9ybFJrbHFVditpMDhjNlYzOUExakltOUEy?=
 =?utf-8?B?a3habnMzZ3VXRlZQdm05VXBISmtQbDFIR2tDTzgrRVh4ZVBjVEFORkJwcUh2?=
 =?utf-8?B?Ymc2U3RrVitnenJ6VXoycU1jKzR2OVpZT09oRzJPdzE2NkFxZmJNSnM5RFlW?=
 =?utf-8?B?dU01U0NBbFVBanZFNDNOTk5KNERyWEdXTmtaRUZWOVlCVjhBNGg5VCt3dEFo?=
 =?utf-8?B?VDl0Q3BNZ1I3cER3bzQrWWJkaW9ZZzBkVGVSV3EwMUZTZEo4L1gwR1JCREhq?=
 =?utf-8?B?cmhrQU9HVjJhcStSRExuSXFKNERIZVRlM0ZJRHIwOUg1aHFHU3I2eGhiSkZS?=
 =?utf-8?B?RnFRWTREQnQ3T1VNV0oyNHp3aGg3SjdRak5Xanhqbjg1SldUMjdiak1OU3R4?=
 =?utf-8?B?QnNneUxoVklVTFZiekVYdmxlL0dRZkxNSjZWRmN5SnhiRVViYnhQNjRYbjlK?=
 =?utf-8?B?ZC9qa0R6U3JLT3U5QmUxeVk5dkJmMDQzSEE0NDYyNHdFYVhmVHRYVVhiQ0NF?=
 =?utf-8?B?Qm4xdzFXVUJJV2FtMk9EaUx6UVdqV0luZEFlSWJNSy9RZzZnK1FON2JvZWZM?=
 =?utf-8?B?YmRtYzN6M1JhTVhHZktYK0EzR1ZsRjhmK2NFZTJ1enM3ZVRNem5mdnBTclc4?=
 =?utf-8?B?REFRRVMzSEw4M0ZkREROTmF5ZlA4K3BsRkh4UHFuUVRPWVVtN1hIMjI5RHJJ?=
 =?utf-8?B?UGpON3JiRDlnTWI0RFl6U3Uvd3J3dFNlV2tSR3pySHBRWW0rNHlRQmQ0LzR2?=
 =?utf-8?B?UTVDTTI3S2RNWWpUcTg1M1BpQ3FIcTNQYWM2WWMxSGRXY2p4bjQ1WnJ2bU1w?=
 =?utf-8?B?eVhTdklUK1YwUU80RWM3UGVWZ1hWanZzUGQxMW5qWUFWdUx1ejFwM1RPU1c3?=
 =?utf-8?B?ZHIwODFLUklzcDllQVNsRklIbk43NElVNGdVY0hlSDA0YjU2Q1JNY0ZuZGFC?=
 =?utf-8?B?aU5QaFoxSVQrbWNXbVZkRllnS0hic0RzeFYrRjZOMXdYZWpIbEVhYWF4M0FZ?=
 =?utf-8?B?L2Q2M1hYN0V0RzNEOEY0UXlScy9nbVNqcGtWS2hvM3V2VU1mbld5dWoxbFVD?=
 =?utf-8?B?cGs3RnRScHZVVXZGaWZNNXJXdFQwUktDbEw2dGhXcDZJczJmb2QrUFlTVXlR?=
 =?utf-8?B?MkgvSHFQUkM5ZDlwMGNlK0ltS2tDWWdIRVI4Z0N5b2krVVo5N1ZvT05lSTlw?=
 =?utf-8?B?eTFyc04yQy9FQUlmRWxKb2xBUmpkUHpndEg2ZTMxenJJSnlxWlhyU1RnWWJV?=
 =?utf-8?B?dGFQSUd6dHhIRTBSeTdWNzBqUjlGMjVPT0FOK3Y5M3prMEt2SEU4M1p1QmZq?=
 =?utf-8?B?WFBNRlowZU9EUWRUeHlOL29ZRVk5U2NRNzhTalRXOHcvZlpvdGc3K1JNKzc4?=
 =?utf-8?B?N0Y3K1FGUXRab1ZkR2RySzgzb01URnd3YlgvV3A2bUVvT0I4b25vaysyN2dV?=
 =?utf-8?B?K1F0RHhEY090QkVvbjV2MUxEeEVGNWl0dHpLOGZDMVJvRDNCa2hEN3ZGdm9s?=
 =?utf-8?B?S0xkS2hWTDhJNXNUbElrNlpBT1EzTWxWdDg2eE1YUGowWlZtcU9mSDd1ZFYv?=
 =?utf-8?B?L2h4bWhHeDZZR1lEOEZyRnhwc3FXYXVtbEVmQmYxa05DbDB2MTEvZ3ZtTUht?=
 =?utf-8?B?dno3THBUYVNSOU1xcHlyZzRaVG9PNzhVck5BRWJ6S0JGL0NlZDhnVzBuZDZp?=
 =?utf-8?B?QklqbXNDaUZLT0FqRnAzWGdyZlcwZVh2NEhUaUM4QmVOenZtQ0JHM2EzR0lL?=
 =?utf-8?B?TWFVVm5mRXF0REZHYUU2M3h0MHpWb2NqNUluajNVdkVBWDFDNkNDZ2RjMFJL?=
 =?utf-8?B?OHlkbVV0QUYyMnVFTVJMM0lzVUJaRC9tL3Y2ZVZicCtUdTFZVHlzb1JSSUgz?=
 =?utf-8?B?ZHYvazlFYjh4VU5BZDJabTVaeUh5Y1kzVm4vdEErVk5wTkhQcHdsdTIzdVNw?=
 =?utf-8?B?dFZHZkJ5SDZKZk8wWWlGOUZTd3lVaDZydUh2ZGhvdEhTZUU2MzE0NnVVT2xK?=
 =?utf-8?B?aGMvMFZUUUs4TlhaSldtdFQ4U0Nsd2E0SGFFK1hyekZLdzdRY0JaanNFOUNz?=
 =?utf-8?B?dmorcEN6UVhsK2dCQ0IrRGJ5SWZpQmlGbUc4Q1JKczQrVjZ5a3pWdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd366172-7273-41c5-d439-08dee93b50a4
X-MS-Exchange-CrossTenant-AuthSource: BN5PR12MB9511.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 04:23:30.0129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M/eXG4SO4N1O+FDi+JPqStkgd+A/+dyCNFphwysIJKZ5rtGimf2cpkYUIK5qY779p2zcgkCo0yLnWhGfowzOmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF2D39B31FF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_212340_175233_8B060A94 
X-CRM114-Status: UNSURE (   8.48  )
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



On 7/23/2026 12:32 AM, Nicolin Chen wrote:
> On Wed, Jul 22, 2026 at 10:20:32AM +0000, Ashish Mhetre wrote:
>> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
>> index c909c9a88538..9508bf50d14c 100644
>> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
>> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
>> @@ -1207,10 +1207,15 @@ void arm_smmu_attach_commit(struct arm_smmu_attach_state *state);
>>   int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
>>   				struct arm_smmu_cmdq *cmdq,
>>   				struct arm_smmu_cmd *cmds, int n,
>>   				bool sync);
>> +bool arm_smmu_erratum_cmd_needs_repeating(struct arm_smmu_cmd *cmd);
>   
> Is this needed?
>
> Nicolin

It isn’t, thanks for pointing out. After dropping arm_vsmmu_can_batch_cmd(),
that helper is only used inside arm-smmu-v3.c, so it should become 
static there
and be removed from the header.

Thanks,
Ashish Mhetre

