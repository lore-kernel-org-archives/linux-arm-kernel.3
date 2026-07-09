Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AE3C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 09:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRPBepI55xpo+Nyd+WxlMbfouWSKsNMAR65yR2CA+dQ=; b=MeHlpxLd4WvAlDDdIrnI36rWrF
	WTLU38xjM425tb7uBirPdlXMmwCHjoBnOrlWYOjqvRREvr+aKLsglnOOg+WbG+StKCw5WutR48GuY
	g2gmi/8nVn9Mk+UVnygpTt0InQzSmdUbQcwkuK+qIlmmNX5h8sHSEQNnvkwTAqkNcZmki0tNps5yB
	eR4r2mtpgdIhFYTzGQ2Ns6NR3e1lwP3LKXTYf6Gn9KvUYL+GpFXw00svrtGESPwsvH6ntA9P8YhIs
	l5siD/XijXILSyJVEjguYDQsFIv/YzFsOenkgqkPNtXm0yHJGIb65B7K7baiU7tcIFclEgPk+uz17
	c0xU9nhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlC8-00000001mWt-3tvT;
	Thu, 09 Jul 2026 09:37:24 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlC6-00000001mW6-09kK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 09:37:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CmcQUB1QHELbIyWVXskNf1BdYAo2GVVizOn7maMsFSI9j5Ay81oOgglX3FqqkhiiFIJpv1xAZ9Bd1Fu9FMuMIxsOLlq7GPgyZSgLnHMppOO8CPM5oddkXG2FWGomVcnSbHm+jzjbzMCUko8ELl/s9eGGm6wDfQICDHNAMNx0l2aHjSW7AxrmwIvknDuPgD3r+JEjKu6ewM1+wjLPiyAoxjF7tyeHzP3ZP8VJ3+bbLsRuPqU2i7q8uKiuhMkav1aU/+wVhPWvJUuTio/A1Iiy7C+r99GP5Dl+kdUTiWaBOwvlnyx+UBp1KQjqngmtyg8LU02vE0zZ6tVwNrRu1OaNAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRPBepI55xpo+Nyd+WxlMbfouWSKsNMAR65yR2CA+dQ=;
 b=qVNGzPzSRrPmgTeuTimyF6ao9Vw2hDWbPg1Zi43zOI+Xy+T5e5EW2whe+M/HTMyjfwLhs2A/3lkWx+iN2b9/lg5Yo+dQ+ibayQwD95xJwUUUN/QauNlxkjq5WqD/1ulLteH3ddUvR+lHnKf4LbOzIAXEgcK2zowASbzkAFYdbiDIubouDqZ9hu+Z62wX7znkZMLp0LCa40bLN2Makaaz6bwn1vdOXJom4FZTV7P+2QQ47l/qgiiJPW5/4UEf93enAz6wCfiDvD46dyN/BqN9TgUsq4+kZup8x3Levneso0TcWXl4Lco1Gqotksb8Q5nfL+6DPl0qAI+crL7jx2BfHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gRPBepI55xpo+Nyd+WxlMbfouWSKsNMAR65yR2CA+dQ=;
 b=bPPEqggbORzCFkJYw5fWyg84yf+QegNBx/ax8wrk5Oq7MLIsmarQ5rmGSBAoBw5tY3TY/39KUDppc4gNcz7H4DzuBMCRkVGhxBfKZzS9zyIIVHDhR5zjavQ5TKVVwuVXzvZyMHll/StHnAYiQqA3q9dhdopm+RzDe4onSM4gG+bDZSHTmqjyuzw4LbUvTA/zwUW5ks+AS4cU2JnQGXum36L+zX0KM2n5AOIuqLy/Lk9jkgDGZw5GfwY22xlMFoQ89WFzG4egLt6dmW1ddE2kCC8PA8o4IiHcLxWuxolVzuSQ194Z/wWnbvB0f2ZUCJtz4hO9CFp1Ywag5rAZgUl49g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN5PR12MB9511.namprd12.prod.outlook.com (2603:10b6:408:2a9::14)
 by PH0PR12MB7094.namprd12.prod.outlook.com (2603:10b6:510:21d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 09:37:16 +0000
Received: from BN5PR12MB9511.namprd12.prod.outlook.com
 ([fe80::4d8d:5f91:6c3c:dc8c]) by BN5PR12MB9511.namprd12.prod.outlook.com
 ([fe80::4d8d:5f91:6c3c:dc8c%4]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 09:37:15 +0000
Message-ID: <6ccad10b-d3ad-4d40-869e-90fe4ff35b0b@nvidia.com>
Date: Thu, 9 Jul 2026 15:07:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] iommu/arm-smmu-v3: Detect Tegra264 erratum
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260609073204.1760077-1-amhetre@nvidia.com>
 <20260609073204.1760077-3-amhetre@nvidia.com> <ak78ZKr1fxASWwl4@nvidia.com>
Content-Language: en-US
From: Ashish Mhetre <amhetre@nvidia.com>
In-Reply-To: <ak78ZKr1fxASWwl4@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR01CA0016.prod.exchangelabs.com (2603:10b6:5:296::21)
 To BN5PR12MB9511.namprd12.prod.outlook.com (2603:10b6:408:2a9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PR12MB9511:EE_|PH0PR12MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: f11a4c52-74da-49cb-a140-08dedd9da987
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|18002099003|22082099003|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: TMd4Qg9zam+dZfDia5Vn5OTNvB0dc1NsPTKj0C9GAZObuAdxWXdpe7Q8ZbPgi4K/+42BuEkbirZs40kWlpwO8aQufd5NRLn3Z+E01w2nJlekRPClgU9N3qvZre2njC5aziYVtnGTQW4pcVp48uNVz5agfjpHEqqOT8W6wvs8KrePjhIm0DLPVkwB1/Y8ZsGvGYoLCd0XTBVTTbshMNUKlRWiMnr9Fp5Dberiv+Jsu8K6GPcKmwlZ0UxNKb+Tp7lzNrzl73iF5LTuXxVxxqOUip7mXkXVoqfdilMallv/GlyxVb3tp+RRyPGe+RoJUHsjr4PZmYqQitsWdNQBGymhC87QJsJU3UF7PR2EA35x0LdrbSClbstGOkyDjW6h4z7n3AIal0QnUYcvpR6KXspQ9Ee8YvpB69uB/Hez1ViZNb28WvEnql8s6z/A8e2n/mRvZg/uoKFNNqy8hi7HoZU3HhtVIcMPcmaSysuE0SgK7FJhuR83KnOz2h4jWN5mdfvv5C1CTBt3c+2ZEnefhLP0GzYoSho1BDF3JeMKCobI9u2luu1CZ++rC7LDyPufK6DoGSrWGIQtNdnbJTsmkdQODWEs16wwOInXDU5dpv7HOuxM4Qc3rfT68CmvswzZLehvbDpE3IaK5cnz2lznffpKyy2NcXV0tIRwxCZOhQQLWUQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN5PR12MB9511.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0FXVDdZTERhVEFheFhkK0NnVVQ2UmZOWDlkcVJEMm5PcWd4TEIxcTJKb1V1?=
 =?utf-8?B?dG9NWU5TZ0RVKzk5czJPWUM4ck1EUHpMN0hPR3BpRFJaWjgwMGYrMWdsMGhF?=
 =?utf-8?B?c2hHcVdKMjlIY29IVFNHaDVNVmlzMWVIS0ZWcDJUaDJRSG1YTkdjbmtIYzNN?=
 =?utf-8?B?ZDZPelZWdjZJZXdEbkROY0dYUDMwdjRCVmdXYW5uNGY4K0ovOWRiSTQxU1Ur?=
 =?utf-8?B?c2JwMkluV1BXSHZPeVpMZ3BSUXBjdGdnRmhQZ3hlSTRCVVhsdFg1ZHVtT2ZD?=
 =?utf-8?B?bzB4MnplSHZwb2Y1ZHBXTUluWVNWdG9zSytXNGNNMUNWVnhTSldZWHROREZn?=
 =?utf-8?B?K2wzV25BSjJVN0QyMGFEZkRyN3dCQUxvczdLYzR3Z1VIY2U2ZmNxeHhNeTMw?=
 =?utf-8?B?dUtNa2txTUN5OVFYNXZ5bG81aWZvKzZFb1ZvUk5ubUM2dVZ0VVFVRXg2dVFa?=
 =?utf-8?B?blVScGV3ZGZmWjY5em5tSVZQVHRmNlFteEpDb3BuUXFVbk9JNDRVcGJITmpX?=
 =?utf-8?B?am01blc2eUFISVVZZERIb2hjdm9GN3FtOHV4SFpweGVoT0VWeEd3QyttZVo5?=
 =?utf-8?B?UGtGT0JFZVhYRE5saG5welNOVFNIeHdmY0lJNFlvVDM0Y004ZllMWFNmMmZj?=
 =?utf-8?B?VVUrQ01hQ0k0a2pGTFpXUVlKRFM1STVicVMzRm1aa09ZeFpMam1XSEJ4bHN6?=
 =?utf-8?B?eHlacXBZLytnQUY4VzYvZ29XNC90QWRqLzg1SzlxWk9sMFNndDk3NGdHKzJ0?=
 =?utf-8?B?NHBSWlp4VGl5bGh2N3JKS1NoaU5uYzNTQy9SbzNZQjdGZlVDczBWelVhZmpt?=
 =?utf-8?B?eTBmMzNnci9hcE9saW1UWnc0SjdCNnZHa3c4U1hqekxIS3d3UlRVRkdTR3Nt?=
 =?utf-8?B?Q1F2dnFNUVRRTUErenoxNVNRa1BlcS9YZkg2Y0NZemhLMXhkTThzR0tEN1Rq?=
 =?utf-8?B?aDIzK2RVeU8zYmRZLzFqMWtEZVZkbDA3UndmdEhrd0daUkFJMWhLOC9wSUZT?=
 =?utf-8?B?QXZ3VzhRU3pkOEJVQ1pneHhYMjVFZG5kbTl6cCt5RjRFQnFVSG5obkExL3dK?=
 =?utf-8?B?U2lZc2RhUlY5RXY0MHFnMmZaczRFbzQ5cnJ0VjJPT3JrTXd0T1hqTytGWHFO?=
 =?utf-8?B?NW5XcVNjZDJHSW5teDdJZWcvZEQ4dWw0RGpPVHdJVklrTDA4Qkd5a2Q2cFJm?=
 =?utf-8?B?UHhCZExSZTdtVGVYZXJ3Q3pyNkV1dW5KTGdwN2pUQ1ZYak10Y0JVQjRwKy9y?=
 =?utf-8?B?RHVWU1NtNytTc24vUWM3dWhwM05SQnVEV3dmSmMzbHNsM25xamwxOCtSYytW?=
 =?utf-8?B?dG5NM1NVa0xXRG0vOEVnYlAvVE14T0x0TFRKd0Zmc3ZoeGZXY2syT0hQUU1u?=
 =?utf-8?B?dXh4UzNBMWgwaDZZM25QblV2TzdyakhPZVFTODFKNjczZTZkQWJnaC9idlI4?=
 =?utf-8?B?aGVaNEl1SWxXZjh5eFRWS296UjlKRDMrMFlSSWFYK2FsMG5mZWxGR1JpM1RV?=
 =?utf-8?B?LzNQZUdOb1pJcG52UzZXOVdPOCtheURQcVNpVjZwbXl5TG9GVDNzRHlBNWNZ?=
 =?utf-8?B?emVEODE2OGl4M3hnVkdJV3dad1VTMFhPN2QzTFZZNGxWRVZ4eWVUSU5zSmwz?=
 =?utf-8?B?TGQwNnNNWWZad1AvQTVwR3FUbjBteXRtY1k1UGswZjYveHYxcjdMWDd1MExh?=
 =?utf-8?B?bXJXSEp5dlpxY2lWUWtzSVlsS21Pczh1YmM4VmRuaG40Sk4wVGhWTUpJbHpZ?=
 =?utf-8?B?SkNrUS84bklsblF2SG9EZEROallUcURmM25jemlxS0lma05zL0ZlOVQ1bmZR?=
 =?utf-8?B?MVZPdFA2czVYbGlBOENaUGFVcE9NdXVOcXlmNXZCWEFraXhLWmdLZHJqaDda?=
 =?utf-8?B?ZWRBbldwN1FDRXFBMFV2ZU10TW0vVUQ5c1FubjFTcGtqNXNRNkk1TGx3QUR5?=
 =?utf-8?B?UWw0SjZTRC9SK1ZkMGJsRzJINno4eXN2MzlQcXpiTEVDcmZITVp2QzhNQ3Z2?=
 =?utf-8?B?L2p2SEwvSTNKNXVzRkEzOE9ac2JwdkpNMHBRamV2WkxlVC9pWFphdldnbFdy?=
 =?utf-8?B?VEN6MTZFOU53SkJ1ZUxzSDRIQkc4RGk2d0huQXY4OG1VcjdjbWFmWUtsNlZx?=
 =?utf-8?B?c2Evb2ZkMDdnRzIxdk5VUVAxeUc1bUZjU2hFVWgrM1VNU2t5SDU3Z2tNMnU1?=
 =?utf-8?B?L1dvS1ZOZzJGY1NpWVg4clk5RWxDZitmRmRBMFNWc3pXOVJCUlUzZmZoK1lY?=
 =?utf-8?B?ZUJ2Z3pLU3JVQkpwaytYa0FCRVpDSlFEcHJjTHJ6SnZ1WldiWWsva2ZhMUN6?=
 =?utf-8?B?N1lKMlJ1SWpRZkloWHJIYXJ3dXZHbjNycEFKQlhsSHFBTjJneWlHZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f11a4c52-74da-49cb-a140-08dedd9da987
X-MS-Exchange-CrossTenant-AuthSource: BN5PR12MB9511.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 09:37:15.8048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V6VQeiy4uAdkFaG8JtRXxhMRJu5LtxjxxBJ56StJUM3eeqkNsjvpXT+NtHOqDN98U+Pd0GaGh3FJ02+88S8g7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_023722_103618_25870649 
X-CRM114-Status: GOOD (  11.61  )
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



On 7/9/2026 7:11 AM, Nicolin Chen wrote:
> On Tue, Jun 09, 2026 at 07:32:03AM +0000, Ashish Mhetre wrote:
>> @@ -5303,8 +5305,11 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
>>   	if (of_dma_is_coherent(dev->of_node))
>>   		smmu->features |= ARM_SMMU_FEAT_COHERENCY;
>>   
>> -	if (of_device_is_compatible(dev->of_node, "nvidia,tegra264-smmu"))
>> +	if (of_device_is_compatible(dev->of_node, "nvidia,tegra264-smmu")) {
>>   		tegra_cmdqv_dt_probe(dev->of_node, smmu);
>> +		smmu->options |= ARM_SMMU_OPT_REPEAT_TLBI_CFGI;
>> +		static_branch_enable(&arm_smmu_erratum_repeat_tlbi_cfgi_key);
>> +	}
> This would be nicer to be the last part of the series. Since we
> need a respin, I would change the order a bit:
>
> patch-1 factor a helper for force_sync
> patch-2 define a static key and its WAR functions
> patch-3 detect per compatible string and set the key
>
> Nicolin

Ack, I will send v5 with above ordering.

Thanks,
Ashish Mhetre

