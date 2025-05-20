Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7D9C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 08:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhcjIHko2r0VLqUe6rIXz83aEAH0RSHCFOudvZjrgsU=; b=QkDiHO5a7KOg2Qlg6AjVDs+KjB
	6+UJIUcp7pxtJU+ekVAtFFTk5p9rTUbxnj8QdcAALP3ZmvF/tEzPL4bw86kkNMCdrt6xQHPUpkFCV
	VACdz1dV6g7qciPYwNsp+w/GHEw7FTFuahNG+nYtodXMdJIztJn8/PpSBYOOph8pXl4p+KdudN3ci
	puWVONxz+P79M3BsFcxnuMfnnpEjVFJe/+B6b3VXsZVnm/jCUa9GrKUE5DQSIx6ftff5CJ82Ixa9T
	YsS9NypCtS9YwiRPspDPGuSq6QnrEUSLxpGo4xQH69SOXB/OYEEFgutvCkI3r9aurgYRaWVjvddoR
	sJN5FGQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHIYM-0000000C3PC-3eST;
	Tue, 20 May 2025 08:42:26 +0000
Received: from mail-co1nam11on20616.outbound.protection.outlook.com ([2a01:111:f403:2416::616] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHIV8-0000000C30C-0lQm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 08:39:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LX5eZtzbvdg8Y2NPi85+s+ojvHimz5z27TXSNC805yyQF1Kl6CxCY3w5PnmvPJpSlccm2AGoVNg/RfZduSSI0cGOZUjRFNBlWLcbWWFMlLqVuP3mV8oqV/4lEFDyWKFep4eYFgjg10roejNmBMOh55gvIzee1tKjmlSCc/iirPH6yeQxMxmltRHQxcKB7M85d14SQFEmw1ekLKT99tUGPDomnS1FkxTEmCVPlplhPC9suInSiWkGWgQvB1INXY3JdIu+Km0YbxGcE25cek51wNHKePTCKOyrsncDcFf8hpI89zgpM+RObARfzCG+vJeNUNhjoKklo7M10JqIgszm4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhcjIHko2r0VLqUe6rIXz83aEAH0RSHCFOudvZjrgsU=;
 b=iJBp6FCFYHyVIsMhwdKAN4PmJtc3xCTWR0tEJYOq8rFDxN05+4HJ4Da+a9nNjeM2hvDBHEePFvyQFnbjbeTm0V/ZAYf2EGvNs7YVsGwmJn6l1Dt87mT03BACyzuLGzalYU7wwhuQIXeIbFC7E+VN9tSDw2t9Vdi8RW4jTrOFGCUJjmcQXiakskdSXjGexzONzTZ3+ciSP12emHAPWIp9CgzAVN5ggoAPiZQemul5SCNMo73Kf7o3LmAgCHXkg0umGKpNfK7SyKL46T4K0Nq+OoZqUIGw6cY68AGNpSvcIK//1Qn0PqkWsTjgbQzYEkkTYzoS+4YVoKutJ/xulyWrlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhcjIHko2r0VLqUe6rIXz83aEAH0RSHCFOudvZjrgsU=;
 b=vskqurjE2+KRPFx3CPoV6FRvidLvR7X9YQhWv3qxzJSdR21M91f8D473nSGnejJXBKWz8RWEjL5fguhiyXDx5H2QoVVPSce5kKaDXWXjKgrWuAbHUIHqRGKSej/p9VnTE5zonnfpEwktAxP8hRVZBcSy0jn3RMyiSmYL2DIXk+c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6048.namprd12.prod.outlook.com (2603:10b6:8:9f::5) by
 CY8PR12MB7124.namprd12.prod.outlook.com (2603:10b6:930:5f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.30; Tue, 20 May 2025 08:39:00 +0000
Received: from DS7PR12MB6048.namprd12.prod.outlook.com
 ([fe80::6318:26e5:357a:74a5]) by DS7PR12MB6048.namprd12.prod.outlook.com
 ([fe80::6318:26e5:357a:74a5%4]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 08:38:59 +0000
Message-ID: <9cb7879c-5158-4fe0-bb80-91d5af6d3ad4@amd.com>
Date: Tue, 20 May 2025 14:08:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/23] iommufd/viommu: Add IOMMUFD_CMD_HW_QUEUE_ALLOC
 ioctl
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, kevin.tian@intel.com, corbet@lwn.net,
 will@kernel.org, bagasdotme@gmail.com, robin.murphy@arm.com,
 joro@8bytes.org, thierry.reding@gmail.com, vdumpa@nvidia.com,
 jonathanh@nvidia.com, shuah@kernel.org, jsnitsel@redhat.com,
 nathan@kernel.org, peterz@infradead.org, yi.l.liu@intel.com,
 mshavit@google.com, praan@google.com, zhangzekun11@huawei.com,
 iommu@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-kselftest@vger.kernel.org,
 patches@lists.linux.dev, mochs@nvidia.com, alok.a.tiwari@oracle.com
References: <cover.1746757630.git.nicolinc@nvidia.com>
 <f52937c027e2fd25d76bc47f4965ba46f82c77c0.1746757630.git.nicolinc@nvidia.com>
 <20250515160620.GJ382960@nvidia.com>
 <0019943c-44c4-4dae-a175-8a5bdc02f017@amd.com>
 <aCt0/kOwCn8wZJG0@Asurada-Nvidia>
Content-Language: en-US
From: Vasant Hegde <vasant.hegde@amd.com>
In-Reply-To: <aCt0/kOwCn8wZJG0@Asurada-Nvidia>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0070.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:267::9) To DS7PR12MB6048.namprd12.prod.outlook.com
 (2603:10b6:8:9f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6048:EE_|CY8PR12MB7124:EE_
X-MS-Office365-Filtering-Correlation-Id: 31846f75-b11f-4058-c664-08dd9779c42d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cll1WkNLUDFYMlBhYXNPT0FiWGZIZnRUYzdkVGRNSC9QcnA1eUVpRGVXY1ZJ?=
 =?utf-8?B?eDRhdDlCSnpiNzRLRzhkSXVBdnM3RHJNemFqbUtjQ1V2MVB4Qm5QU1pqdFZ5?=
 =?utf-8?B?SmVwRHc4SUhycEFmaHRQc1VrS2RENVY0RDVDYXlrb2gyL0Z3TGIvS3VJeVNk?=
 =?utf-8?B?WkczbVhkOXdKUlpoTGV6VzlBOVZaQitsOU1JcVRiYjBOMnp3WGJqcThJeHFr?=
 =?utf-8?B?L3ZHR3d5L0lySVdFUU1rQ3pSZjlIbjhBSUtidE5zMnNEVWlPblJwckJFMXJR?=
 =?utf-8?B?QTYycGlKb0dmc0dwZmdDbkpNUGI1OS9pNDhyU0lTZUJyTVM2a011UFcwZDZ1?=
 =?utf-8?B?OFVoZkxyUGdBRFNydGpHMkZFMDVXZllKOFdLNGhUNFBZUmthQmhDNWU3bUMx?=
 =?utf-8?B?MVFVK2o5MENtd0wvY1RKWUVkZks0b1puNkd5dE11T0FFTHFUdHFma2p4UkJr?=
 =?utf-8?B?Tkd5d2FXNHZFeS81dmN0akE5cUt0SFBodGY0K281ZkhpVUVRc3JwcURWd0JB?=
 =?utf-8?B?dlc5NmdYZDJxSjlGOWxJQlJmTDJaTEtzbHlvZDl1OEVZWEVENUpJSkVPOVJp?=
 =?utf-8?B?M1JRMm1HTWlxcXhsdmRTNjlyYWxHcmNwNVR2SnM1bE4wUjl6YnBna1FUWHk1?=
 =?utf-8?B?WFRyellzdGpBamZwK3hBMTEvZFgvWXlYdDNwWXIwSjVmZUpWQVVMY3oxbDhw?=
 =?utf-8?B?aEpLeWFaN1lMK05TajNEcE9MQ24yK2J5UXFxNXZYcVVHVkZLUmcxalY1M2JQ?=
 =?utf-8?B?dnFTaVkzMlB2Tkp2QXJxUlJjL3RTbDNNeTM1dGYvNEVFUHpweWxYOHByU3cr?=
 =?utf-8?B?NzhYK2NEK3JaMEQ4SUNLMndMM3h4aFZhL1NvTldLNXNmUm5Jam5lU2VXaXFF?=
 =?utf-8?B?YzdVVi8wblBYcDAyTFFna1VBKzNvdW8wNlJWbW1wa0lkeUJyOFMxaDBJZ1d3?=
 =?utf-8?B?STVyU1ByMFJDd2UrbWxnWnhKc3BQWWovczRLYjdwWlFXZ01ON3BIVlR2ZXow?=
 =?utf-8?B?dVdJZWpZZ2NCOFc3OElScmJXZklmRlFQZGlTcisyRG5TS1QveS9BZ21xTlBU?=
 =?utf-8?B?RS9pd0RTQXF1Q0l2SWhzenNsWmpCMVY0S0JIMnM2RHhvb2JHeXAzcEh0eW5n?=
 =?utf-8?B?OHpDOGdqbFZFTWRJaDNSVnNJT0o5VWFEdDY4YlhzNEx5R2IxVHN0QS9wM053?=
 =?utf-8?B?YTJkM3FSWTR0Si9Ba2swTzNidHdFZTBVZWsxNUJVZllvek1BcnQvMU9FcE84?=
 =?utf-8?B?bkxFd3VqL2tXY0RXR0RxS0FydUtXRURZdWpwdHA0cDZkemMwZFR1VlZZdyt2?=
 =?utf-8?B?Mlg4TWF3WDRVS2RJei9CelZYZXJCZUpDU0lPNFVxT0MvUmU2WSt3UjFnNFNU?=
 =?utf-8?B?TlF6VWlVdGZDbWtlS09pb2ZYQWtQRmNESS8wM3FNelhIRUZwUDhWZWFNWE5Q?=
 =?utf-8?B?bDFTODgwR21zRkxDcDFrS0pEMEFTeWhsNjVCQzVCV1Z2Q0JORGFuVVhnQit4?=
 =?utf-8?B?NTQxMmg4bjQreWZudURJVHhoNit0UWhlT1EvK3FzS29JWVhZRUVwTVNBSG1m?=
 =?utf-8?B?OHhWblkrQ2NMSWZ3ekM2UXByVXcrRThaWFd3a096NWp0Nk8wTVhGeGNnWWky?=
 =?utf-8?B?eVFMdTJHQnN0enY5RnNLL213UjM1VElRbHQzYVhJbXBzSkR0UVZuZHlUNmdW?=
 =?utf-8?B?dngzRGNrVGpVc3lBaWdXQWxYVkJmMnU1bmFtRGdMTVNlMW5sUmo3bWxXYkxv?=
 =?utf-8?B?cHVqM1E2TTMxNFU4UTcyZmV1NlRKWDg0YW85ei9mdU1ZR01DYXZaVXJWcExv?=
 =?utf-8?B?cEVMNWdsSzNZNGZNckc5SHVkcklqVnRJdk0wY24xR1dxMmVmS29oWVNtUXMv?=
 =?utf-8?B?NUJmdExXd2ZQRDRZaE9TenJyMUEram9IQk1XamhNM1J3N3B0TGRmK0dCR1NZ?=
 =?utf-8?Q?2Hl2lmv/UlQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6048.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDNBOG1HMkZ5TmQ2RWgybWEvTERtemtlM3lkQktoN01INWU4a0FlaEdIcHEx?=
 =?utf-8?B?SFljT1k5NE5ncUJ1bmsyV3FBWTBxOS9Fd1I5ODdnd29LY3kwUllJQ0FkaEln?=
 =?utf-8?B?WFltekRDdGllQUlPZjB4SFZucXppK3JOL0ZjMEV2TUFqSnRoT2RxZWhiRFYv?=
 =?utf-8?B?RThzS0NtTXBxWXphRzdya25SWk4vbktITHpHdjNqQnpTQll0eG14WStuOTFi?=
 =?utf-8?B?SldSd3FhNUZmZUV1TDdnNUxQeUt5SGkyZlRFaHE2WmRndkROYnA3TmNoamw4?=
 =?utf-8?B?VHErUjBDNThKZExxbHZIZDNEc2YzZzdnZE40Y3hyUWpBZSt5VHd2b1J0YjMv?=
 =?utf-8?B?VnkvQitpaVdTaEVIa1VBT1FEd3RTZExtNzc5NDZzdndZNWkxbElxZWFUT0hC?=
 =?utf-8?B?Z090M1MxaGZldmpnRlF1TGt5SllXQlQyL1ZHaTdGcndSMUdQbjEzY05xVFF4?=
 =?utf-8?B?V0dXR25lMzk1T0Evc1E5ZnRXbHZ4LzkxdnhpTTQ1Z2dZWjhhd1p0ZktWdlRp?=
 =?utf-8?B?R2NOaURZMnh2MndBVzhTdlZMd0JlOURJSHM1eWtQeE13MTRBV2JDL2F0RzZm?=
 =?utf-8?B?TmlBZXpEOFhiSGI5Wk5OVFBDOEk1U25MSzlYTmEzWGp6RytPajRhSGtYK0Np?=
 =?utf-8?B?dTg2bHBYdzVwOHdscjVEb1lpd2Z5UlNXQmxLdmhVYlB6YWJZNWFRSW0wSXYz?=
 =?utf-8?B?cnJYU0xnVUZGaUdneXZYZHNRaS9KY2dkQUp5VHZvaUJvcXllYWhEejdPNlQ1?=
 =?utf-8?B?UU80VTRoUEVPQVRzZCtvWFUrS0g4TitKUjZlbXI5cmxHdVJaT25CNEpPekpQ?=
 =?utf-8?B?bjkwT3Awd1pIOERRdG9kaEQwcWd3eTE2c2tSeUZYaDVyQWx6am42N2ptUHNW?=
 =?utf-8?B?aEhoL2xyejFwazJ1L0p3QVYxM004YkRiYnVyTDVnS05HTG44a2pXOHFvTTB6?=
 =?utf-8?B?TjJxNTM4WG4vVDVWR3Vjbm4xeFlPNmllVjcxRGRVTm1HR3ZoZlEyQTg5elg2?=
 =?utf-8?B?ZW9uL25ZNjNFWHVoMTFOVUg5T0E5bng2Y3kwV3d4eHJScWhCVHF2WXhiYlAv?=
 =?utf-8?B?d2lKNjNydVlkZTdXSmJTN0dsWXNhVHdmWElKR1kwdWVHcWFISTlKTFRWSytO?=
 =?utf-8?B?TE1MU2oyUHFiMTN5dXc4azloRTBOcXlVVGp4QmdlRkc0UXEvS0liRHhISGRV?=
 =?utf-8?B?Q0NFcXZ2RktIdC8vK0d2c0k4eTY3eTYxdkRYc2hrSG1RdW1TRWhqNm9pSFds?=
 =?utf-8?B?eGhxVkRWelU5eCt6UG0vRXY4c2loWWUzV2daUHN3b2xvcTkyVi9Md2hJZk9C?=
 =?utf-8?B?emNpUFNUWVlqQStmaWhwK2U2UHZSMGMzUHpEcHEwSmUrWjdlK2FiWW1wVlh0?=
 =?utf-8?B?U1BhdS9hTW1STGFXb1dhRHJ1Sk9pWXFBYk51QWRwL09RT0JsRlhJYWpaemVq?=
 =?utf-8?B?aUZwWXdGR2RTb0ZXMDZnRmF4enN1bVF2aEJsWkVwdms4YXhEMU9XdWxodEJ3?=
 =?utf-8?B?ellRcVJGVVZqbmNGVXcrYmp3M3RMNXFmVFYrV1pyWFNWK0NDdlhjK3Q4Mjgx?=
 =?utf-8?B?YUZzOVRTdDZHYU5rT2psbHZDVnh0ZmwyUjJ4cURSTmRKa3UzUE9FZDZwMWNF?=
 =?utf-8?B?ZlIxb0ZKak5BNEl2QVZROVVoaUlxc21SZGliYjJETHF6UWN2aER6bnZzdXFX?=
 =?utf-8?B?TjY2TXo2VHl0ZFFsc1orRW85YWFhVXl3RnNUOFdxMnl5c2x1UnYwNGxCUzBo?=
 =?utf-8?B?NzRBa3R3NWhoeXNWM2lncEZWeWZ5dW93SVpzTSs5b0xzdWFoY1d5aCt4L0cr?=
 =?utf-8?B?UEpOeXNtSzYvMHBreFdRaE5UY0E1WTZiTmR0ZGtLdlZEdTJGRnh6RWNyMWlM?=
 =?utf-8?B?RVB5OXVWcDJsMFhQdWJ0NFdRZ3NvMnhZZHhvZW10ZUtsZlVSTEJoQWtFQitD?=
 =?utf-8?B?d0hraTYrbVN4alRONWxiL2ZMNnIyZTFRdTU1VXFOTDJDWGM1WHoxalFvNmRU?=
 =?utf-8?B?YnR4Qy9lTXU5TXY1VTJJVjRLTDBhcXBDWXBjRmxJM3Nwb1Iwd1dvRk9WUnV2?=
 =?utf-8?B?NmtXRDY0ZHMwdUQ1Rnd1MUFxZmxDYzYzdkY5cVZxYWNVMGZQa3I0aG5CdDFJ?=
 =?utf-8?Q?9qGYWC6FjtgZHscb/gjB2JiOw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31846f75-b11f-4058-c664-08dd9779c42d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6048.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 08:38:59.8525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TNYK2A47/oBHuoOegnz7bWuqW4M+j6Ka6itd4z02Ar74AKDDaAMJui3cVomblempMvUwwaxxU9SCvoJMXdfWnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_013906_229354_E34886EE 
X-CRM114-Status: GOOD (  25.12  )
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

Hi Nicolin,


On 5/19/2025 11:44 PM, Nicolin Chen wrote:
> On Mon, May 19, 2025 at 10:59:49PM +0530, Vasant Hegde wrote:
>> Jason, Nicolin, Kevin,
>>
>>
>> On 5/15/2025 9:36 PM, Jason Gunthorpe wrote:
>>> On Thu, May 08, 2025 at 08:02:32PM -0700, Nicolin Chen wrote:
>>>> +/**
>>>> + * struct iommu_hw_queue_alloc - ioctl(IOMMU_HW_QUEUE_ALLOC)
>>>> + * @size: sizeof(struct iommu_hw_queue_alloc)
>>>> + * @flags: Must be 0
>>>> + * @viommu_id: Virtual IOMMU ID to associate the HW queue with
>>>> + * @type: One of enum iommu_hw_queue_type
>>>> + * @index: The logical index to the HW queue per virtual IOMMU for a multi-queue
>>>> + *         model
>>>> + * @out_hw_queue_id: The ID of the new HW queue
>>>> + * @base_addr: Base address of the queue memory in guest physical address space
>>>> + * @length: Length of the queue memory in the guest physical address space
>>>> + *
>>>> + * Allocate a HW queue object for a vIOMMU-specific HW-accelerated queue, which
>>>> + * allows HW to access a guest queue memory described by @base_addr and @length.
>>>> + * Upon success, the underlying physical pages of the guest queue memory will be
>>>> + * pinned to prevent VMM from unmapping them in the IOAS until the HW queue gets
>>>> + * destroyed.
>>>
>>> Do we have way to make the pinning optional?
>>>
>>> As I understand AMD's system the iommu HW itself translates the
>>> base_addr through the S2 page table automatically, so it doesn't need
>>> pinned memory and physical addresses but just the IOVA.
>>
>> Correct. HW will translate GPA -> SPA automatically using below information.
>>
>> AMD IOMMU need special device ID to setup with  GPA -> SPA mapping per VM.
>> and its programmed in VF Control BAR (VFCntlMMIO Offset {16’b[GuestID],
>> 6’b01_0000} Guest Miscellaneous Control Register). IOMMU HW will use this
>> address for GPA to SPA translation for buffers like command buffer.
>>
>> So HW will use Base address (GPA), head/tail pointer to get the offset from
>> Base. Then it will use GPA -> SPA translation.
>>
>>
>>>
>>> Perhaps for this reason the pinning should be done with a function
>>> call from the driver?
>>
>> We still need to make sure memory allocated for page is present in memory so
>> that IOMMU HW can access it.
>>
>> Pinning at the time of guest boot is enough here -OR- do we need to increase
>> reference in queue_alloc() path ?
> 
> For NVIDIA's vCMDQ that reads host PA directly, pages should be
> pinned once when stage 2 mappings are created for the guest RAM,
> and iommu_hw_queue_alloc() should pin the pages again to prevent
> the gPA from being unmapped in the stage 2 page table. Otherwise
> it will be a security hole, as HW continues to read the unmapped
> memory through physical address space.
> 
> I understand that AMD Command Buffer also needs the S2 mappings
> to be present in order to work correctly. But what happens if a
> queue memory that isn't pinned (or even gets unmapped)? Will it
> raise a translation fault v.s. HW reading the unmapped memory?

If page is unmapped then stage 2 (Host page table) gets updated. IOMMU will not
be able to find page and logs fault.



> 
> If so, I think this is Jason's point: there would be unlikely a
> security hole, i.e. for AMD, iommu_hw_queue_alloc() pinning the
> physical pages is likely optional.

I think so.

-Vasant


