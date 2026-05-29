Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE67CD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 06:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/EfywMEmH1YAndCDRJip3fLm2D9P0kyy2DCFQlrFYM=; b=oJVqfhnTDKBeyJaa++UgpXN8AM
	+iBtd4oXjbmrpXr2tC5smfDrnelKhXtzx7AHtpiec3DEGzdeQXsCM2GuX40WUvIRkce20gNSwIB1J
	AGL9/GnVE85/hoLc8Rr4XlOm2gq5FR0F0MlF1IHLiQXoN2YH2t3t+tKSkAp/+dzYmoEvlixRCTdZ6
	68PrlJRmntdjT+uzc3/WDcKLBEf2ao9rZ5rcKg0jma0R56koinb7pkkG/9YlcTKPlDuj+NArZuAjD
	vuKDKh+NY+2v1uMUACSqXhrCOUTM3/+47US12uv34giJTRGRG5IkjzEukPjmuXSn8v8X/TnKox87b
	Y1eQOVfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqY7-00000006nbE-3aWY;
	Fri, 29 May 2026 06:18:27 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqY4-00000006nar-1qqn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 06:18:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5m35X7mJ+Zd5zB+ZgF12rTqTfyP2YV9rzyB6qyY2ftxDTZxBDxfLo5BFuHWJjUVFG/px9DKPt/ksxTkpfuSh5wB04kuvl/RCkaUgw+j5Mnuv02FtdyLDz7VMIt+QQaOG+q/dLZDhGVoJ6b+Cd5kpNvWR2tOLszXHCkmSBAutWV95NyOACbq7ypK8OGzj1lp2oHkGAJ16yoNCJkGPxOC4B2R2GM7l/83aZjSllGo4cF6zlbEEQOZBWeyh7zkH5aufBZaZi3wBqgbsMgkmQwxfpM0HTkTauRdfUAGGe0pIJmih6QFihj3RpDvE8qZJ5KWq1pbkt/1+vT7AZR/5Ek1lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/EfywMEmH1YAndCDRJip3fLm2D9P0kyy2DCFQlrFYM=;
 b=aeIv0msav1p6RwHtqqA06BwAHWh/PAVCKfqIX3II/eA9YKvwrATMg2Je2AsT7tGJmk88yvye9iFKep50mEe/XbcSpyiU/6MFEc+rVkC+rDCiwoA+2c7601JgGe6U3CFYu+PHYWm920DPhoHfqCTUonTOZ4qv2BtVdiDw5G/+WelhYidExpINCJHGg3J3kdkbq6HcjzAZJUU3wx98vSc0rTJLmyMMxbf0zL7BCgtG9w6OuP4EW0TSuyTsOZQVASSxpB9wKLoYlVUd0Jkz37tJUtBm6jC0BxwPYsz2zGrP7jqFDiuaH2R1rNUDh5VcD6qpogRNZLk5w1FIOIEtVqGoWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/EfywMEmH1YAndCDRJip3fLm2D9P0kyy2DCFQlrFYM=;
 b=EhHtzgn1Y5/MhVDOcJ/d557P0kqm+gTVtxyiiMX7XmdJoc6tiVMQSVjHOOOvcRWI7Cw/F9Ec3ToAUAbtR+pFvPu+1zmS10dyt09XoGtwGdyB0ZlM+QzexcF0N06NPRRiFil/dcAlVvzdjwbK/mZXUiaT9KolOliu0F2hhBSGjoD5ZDEvFKsuL7N/jBkdd9QoOrSotWh4rewKy/wU5djB5UPvrkUZ84y/NSxEn/uY2IQRdtpA1Li521QEnkHFDt/gXGjdWnYO4Eot5O82ksTdLncInQKuy+2Fp4Z4zIcyPE186pa3BTfEx4eCzu3IxjyMejogKW43fd8ko61luTDQKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN5PR12MB9511.namprd12.prod.outlook.com (2603:10b6:408:2a9::14)
 by CH3PR12MB8727.namprd12.prod.outlook.com (2603:10b6:610:173::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 06:18:17 +0000
Received: from BN5PR12MB9511.namprd12.prod.outlook.com
 ([fe80::4d8d:5f91:6c3c:dc8c]) by BN5PR12MB9511.namprd12.prod.outlook.com
 ([fe80::4d8d:5f91:6c3c:dc8c%4]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 06:18:17 +0000
Message-ID: <b3ec0b96-75f4-4a72-8f77-0b92ccca5adb@nvidia.com>
Date: Fri, 29 May 2026 11:48:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] iommu/arm-smmu-v3: Tegra264 invalidation workaround
To: Nicolin Chen <nicolinc@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260528101617.4068249-1-amhetre@nvidia.com>
 <ahiMPld3ePBapYFz@Asurada-Nvidia>
Content-Language: en-US
From: Ashish Mhetre <amhetre@nvidia.com>
In-Reply-To: <ahiMPld3ePBapYFz@Asurada-Nvidia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:a03:217::26) To BN5PR12MB9511.namprd12.prod.outlook.com
 (2603:10b6:408:2a9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PR12MB9511:EE_|CH3PR12MB8727:EE_
X-MS-Office365-Filtering-Correlation-Id: d816dee0-76c2-4c8e-fbda-08debd4a12fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|3023799007|6133799003|11063799006|4143699003|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: WXOybxufZRGjs1xLL2VBUcEjCBZobcR9fv2H5U2nCsMlTcuCVypSjL9nwfkDKFXtBFxq3oZ4fU7BX3XDOBtlUjcuBAYxGlebT4D49lQPQofLT79cLOGK6hqLDZC8WWcOinV1HFuIuIvUFuL4qnw4wsGujG5y2HzjqQb9aIuEVrJt2eUvz/9D2P8Gd0MmcNa8QecxSiQOhhpPbgbNzxlkedGQzx1NKCURfUHs8lhRKGb6Ny4a3tPPQ0nliMqwVdOcX6KcEVjFPGaDoFTIZt0Gf9wouYqunjl0tGiSaUdj5J9xhJyjqdKmhG2niELsVSSrQqsv8vulx88HNvh01jec/sqexOSPGcY2D0Zm886ja7zotW/Qz1y+Gs2iJZnZjbhl5KBtbykH968GPF0Zr8DM54IVV0lBNoySkdzQtPNaTZW1auR7IUHTuESkQrjda3rUi5f5IMY8WmCZu4oMdyzxN0Bo9+XzMAgnOUAtoichu1rKc9WxOIV90W1qCkoo9B5VqAWSBipekNDXBH1328No+gGlzfnkEIwylMCMHE7/g+n7VcNrzI8OizOz3wwJOMKWxI6a+N/B+LAwvFVi92S89EfsI4T+ysyvvMHMHbPlal6Ej3lTrT//kt4ZZJvKjcGGrDBKEINqBUexlpH8no2unxUK9QH2YRBuEKY5N671bwcDmayFryRtHM/Oa10yZfa5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN5PR12MB9511.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(3023799007)(6133799003)(11063799006)(4143699003)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGhaeURtMjdnU0Q5TlNCUTI3WGVNQ2dJaWltbWhZcHpGbDlQU2hpZ2NvdWE1?=
 =?utf-8?B?VUpHQ1JkRzk2RjlFWTVUb2tZNjVveUlDMUQrZXZrQWdvdUJvQkUvaWMyaTBJ?=
 =?utf-8?B?NjUzSTJTaHRmWVVvVGQwbE4yZzBXTGdOZUU0TlQvTkQ0ZmxjYkNaajBRT2Za?=
 =?utf-8?B?V1dkdmx3WWl1Q1pFdXBITEo5QkJhYkU4cXBLeGltVEFZYmR1N0o1T1Y2N2Uw?=
 =?utf-8?B?azFNTTIySy9DY1RXT1BKR2FWL2Q0NVNvajQyNEUxbC9sbHBoUGJ4emJsQzFx?=
 =?utf-8?B?TkFqb0xzc29JN2VBOE9KWnpmMVYrcXVPRVlLTFloMitCWXR4TjdTQU96NHZF?=
 =?utf-8?B?NjdMSEhidGZsL0YxVVlHOFF4amgxdDZpaEZyQUQ5Z1cwU2ROTEluWjRTaDhk?=
 =?utf-8?B?QjhiQ0R6emdMaGYzWkJKVmQrdHhMZzVnbG52NlZIblBiMmZyQnZYc2gwYytB?=
 =?utf-8?B?WEFTVUxHd1YyRi9wdGNmbWhXZkxxRXlGaWVhcEl6L2NMNmwzTlB1UjJvSHFw?=
 =?utf-8?B?QkRadENyZEgyaVlwUEhxS0tQZFRzTFJRN24rbHlRUmpHZ3F2Ly9SekZRRnN6?=
 =?utf-8?B?a2xvbm1FZUR6UU56b0ZIWlBaNEVGUGI0eG1sVlBPRTc4NzZrdEFKckMvYVVT?=
 =?utf-8?B?Sy8vY1lBVCt6ZXQ1QWR3RFdRaHFmZ0s4U3NjYmxOSEVKUEYrSVB3Ukk3NkxG?=
 =?utf-8?B?UUtuRFFwS3p2MkNtRldwYU1xMCtTVVBva1lIeHZ0blJIUEVqSDdMSDIyREVZ?=
 =?utf-8?B?TC9xUU5HRXNZWndQVUNYN3VvYlFrcm9RbDd1T3c4OGZqdmtkOEhVUU9kRmV4?=
 =?utf-8?B?aWR6VUxXY1kwVEpodXlhei9XMi81dWVuWWNnSUlkRmZQOFBrZC9QUTc5RVBW?=
 =?utf-8?B?T1VyekxzdkN0bzdOaDc0ekVweHlCWHNVcm52NUpxR2xEdGFKTmVBcDIxYmxa?=
 =?utf-8?B?M1B5R2JGZmFqU3JRd051NWhwNmI0K2IwUUE5NUd5Z2FVVllzY2RLeC9QdTVq?=
 =?utf-8?B?MVNZK3hVR1BRVjR3QTdETnVsWEFYTStEU2xVekxOcm9JQUVPOXVQRUEwL1kx?=
 =?utf-8?B?anUxcGtlK3o5YTlsRjU4UE00N2hUZld4UFRTS3crRFBCODI0ZHorcWtURlFF?=
 =?utf-8?B?b1kyT3c5ZzFqajVZeEZMdUJUclFsczRuaDIvSDVVaC80dEVQM1JIT2RBc0xu?=
 =?utf-8?B?YTZGSDZwVTBtb09FQms4MVU4QTZXVEpQb1d2aDVqZEMzKzZTSlpzOVdKMDlC?=
 =?utf-8?B?TjJpeG9YcUZhS1VLREI4U1Z0bXVxUXRUc0h3NUR5QkdIUnIxbkk5RUJjTjcx?=
 =?utf-8?B?ckRHaVhkT3FINXE4VkJYcXVhZFkvQ0lyaUtwanRXNEsrRmQ5bUpJaWNCdHVH?=
 =?utf-8?B?ckZmQ1k0OHJFS25Od2c4MVdQR29OOEpwNzYraEFEa3ZGOEtWekdxVVZSeTNy?=
 =?utf-8?B?ZE1sWDZaYzBkRU5SMTk3MDlmVitacEN4NVkzMTZvQ3FLbDZxY2RKOG8rMzFy?=
 =?utf-8?B?TUQxeURIS013ZlBmbHZkRkFlVUptYjBxWmgxSHVyOWpad3N3ZThxdndQdWtM?=
 =?utf-8?B?eTRaNjJwV1VVYSs0bUNhL3JUZUI3bWNmdldXVWtDVmdFd212SGNsa1ZxQURx?=
 =?utf-8?B?WjR6WFFhQjJaWlRqZTVjYXE2VC9tTWhtTnJCdFJ2MEtLV3gvRjZ5WVUxckEr?=
 =?utf-8?B?MHMvVzcvbGxjNkNvVW56Wjk5OGJsTjBkeS9CMFFVVGVjRnpwVDdQWXRrVlVK?=
 =?utf-8?B?QVNVbzVRT0NoNEUrdGxvSHhYdklCbFNYOHUvdE4ySlhSSWVLSW9McCtpWGZM?=
 =?utf-8?B?Sk83SktnYUQwMHNmT09FbFJPcmtGTERSME1BODRrdXorcmdmMWpEZDRxaERq?=
 =?utf-8?B?Rk9TN1k1ck5FWStPSGh6ZzN3cmFCTUs0ZHh6MlpGemo4V3AxUEhUT0RXRklM?=
 =?utf-8?B?RU5qUDBBRDAwSzdyenRwWVRiMjErbW1hbmJYaHBYaFVLWFEvWFZqMExqYjk3?=
 =?utf-8?B?MHJRR0RhSEIyTWtpdm1Fd0F3dWdNWnV3RHVRSGJqek1HdzRmMXFhMWFFMWlP?=
 =?utf-8?B?bEIwbUNIblVyZkg4Vlh6dHY2ZVZpd1NXazJRVGhQbElUOW4xNHIzbnFINDVM?=
 =?utf-8?B?U0ZWWURNenJ4RTF6VnFmaWRkSEp1eFRCaVFNQ3JVMXlnbnZhQ3dqYzdrNmI4?=
 =?utf-8?B?MnlGTzJmVWFkRHZvOUZkWFBLazNJWCtOSVNQMTVubEtWYk1uWDlHT05XdDhJ?=
 =?utf-8?B?NGpzcitsc2MySU9XNmNrcHh0VjQwdTE4STBRRVJjZjRRSVZCSWVUemNsU1E1?=
 =?utf-8?B?UW4yc0hMSkRoOFRCc3g1TWJJNHpWUFh0bWxBZjJ3dGJJMEFxTVVjdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d816dee0-76c2-4c8e-fbda-08debd4a12fd
X-MS-Exchange-CrossTenant-AuthSource: BN5PR12MB9511.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 06:18:17.8522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xf6CVgltrBmyLX4+BnxWlBziyFpOwdHpXoW5bDbfGDCBbk5kVY0rlnlevgAPR8WHNRxMk/L1ZCTyMwmyc9YYQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8727
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_231824_511150_89D2AE74 
X-CRM114-Status: GOOD (  15.17  )
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



On 5/29/2026 12:11 AM, Nicolin Chen wrote:
> On Thu, May 28, 2026 at 10:16:15AM +0000, Ashish Mhetre wrote:
>> Nvidia Tegra264 SMMUs are affected by an erratum where a TLB entry can
>> survive an invalidation that races with concurrent traffic targeting
>> the same entry. The hardware-recommended software workaround is to
>> issue every CFGI/TLBI command (each followed by CMD_SYNC) twice. The
>> second issue must execute only after the first issue's CMD_SYNC has
>> completed, giving the sequence:
>>
>>      TLBI/CFGI ... CMD_SYNC TLBI/CFGI ... CMD_SYNC
>>
>> This series implements the workaround by hooking the duplication into
>> the single chokepoint that every synchronous submission flows through
>> arm_smmu_cmdq_issue_cmdlist().
>>
>> Patch 1 detects affected instances using the existing
>> "nvidia,tegra264-smmu" compatible string and exposes the condition
>> via a new ARM_SMMU_OPT_TLBI_TWICE option bit.
>>
>> Patch 2 wires the option into the CMDQ submission path which is used to
>> re-issue the cmdlist when @sync is true and the first command is a
>> CFGI/TLBI.
> What base-commit do you format the patches from?
>
> Sashiko failed to apply for running a review:
> https://sashiko.dev/#/patchset/20260528101617.4068249-1-amhetre%40nvidia.com
>
> Nicolin

The series is on top of Jason Gunthorpe's "Remove SMMUv3 struct
arm_smmu_cmdq_ent" series [1], which is in iommu/next. I applied
those 9 patches from the lore mbox onto linux-next-20260527
locally, so the base-commit hash recorded in the cover letter is
a local SHA, sorry for the confusion. I'll repoint base-commit
at the iommu/next tip in v2.

For convenience, the same series is also available in
jgg/iommu_pt_arm64 on github. The tip of the 9-patch series
there is currently 13428b0bf794 ("iommu/arm-smmu-v3: Directly
encode TLBI commands"), and applying these two patches on top of
that SHA reproduces my tree exactly.

[1] 
https://lore.kernel.org/all/0-v2-47b2bf710ad5+716ac-smmu_no_cmdq_ent_jgg@nvidia.com/

Thanks,
Ashish Mhetre

