Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEB5C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 23:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date
	:References:In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5ieMd0Kv5wl+BUeu7Qn2v6kRCE7EZ3az96BAr24Os4=; b=heoEqAw+RHUElIi64WA2+eOwSL
	qaA9dX4zydEjfLi4alkC08IN6FhmSBL0NAu2gdqkLCRa5IYIi7+AmvgZdS9rP+6dabAm0/RMS/yTO
	KVmN//clvhavWRlkkG23pjBH4u3aFGnPIK0F7D3huKvHrfLkW93zKIWw7URw/pQVrJXY+oJcWuXSw
	HLnfzm8ptNdRCgVpcBb1CziYErR3MCQWBqjesveYsrLsRl38ygcll6kl8u+QbzaO9VSYVAzx61Agr
	rWdN97M1vFJLC+5y7hNAZeqi/jmgxix5IZYGVgevh3jLdw3L2/9qQKFtp2QJIHCwbzLnBMb84kMbQ
	4YPXm8jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxYTB-0000000E8qJ-0OaU;
	Fri, 21 Aug 2026 23:16:17 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxYSe-0000000E8Px-0sSK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 23:15:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jzdUwATZOkuBIG6JBsM4qLyf90w6/cf6gU5JNxLuDGkaeBFFm3TvKx3bEaXJh3nYpkb7wVy9NEO2k05WHM0opqBwSAddcdFsfVE2gwOnH9QkZiHLTNE+WWC4WuBqZ/blOrAFm+MfDP1DqCX+rglIwfUA8m/VZpGshBnsc5pvQ3l8iImXTAQVWw5kFDfV/B5GTW+t+y3ZchFHWQ7qvMNuR8BW3Afw1yUl6kCOYYZ0mC9XQQaGtrQEuia0kMi0lXZ+hThboeYXR87K+kb0sLko8WDa1EgqrUd3jpCo6YaYz0G0vs7278StC2TOdZTwk7ZYEB7uI9wvBdLVlW7ng/4HsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5ieMd0Kv5wl+BUeu7Qn2v6kRCE7EZ3az96BAr24Os4=;
 b=MoGvuM/HXBgxeB83QtksguzBDI7VnCvNX4OifOnaei5qNdZWdGxFvjRtXrnQqvAMbHvnOjdODZhXapuXHF0kED8g5IxvjRApAojNSKy4meDNUfvnaEATZxjDuwl5nTODOYDztgMYhxesQbHtLdFnpHdc/OO03b6ZfQNuYRF2OvVEdnUp7mU8BziaADYUMJIOrkh3zhsqtyeK3c81PvaZiUuY8yGxOcGnWPhU8+EqkdyB1CPz1u9bg0a/tBL15xuFISGLzw5iZVguiDFjwrqZei2RiHuKiEnZag7oexnD7gjMHRB7oEWJt193cQC2d6okmHXq2TAp+r3LKCDcMLzzUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5ieMd0Kv5wl+BUeu7Qn2v6kRCE7EZ3az96BAr24Os4=;
 b=aqGOTWFy0YrTuByKHYGLfB0RLMFqNswNw281aaJC6ZXqmougDvgqk1umTBhQqPKeCpfM3KlYEpycnOHOO2aKV5mvwpgENtmRnlokc25yGJDhJGkMzVzL7XAOsT7QDZ16YatH3Ps8PxVh8Djqt9IDKwCAJfq00N16pkm0W2WiiKDFcyqnBqZyp6ePXO/JngpU8TUlB/SPo4kAw0JKH/NzaMtcZYIshXzGDyB2aMrKcSzC8dVco3O3nsINNMlQB4OsHY5EpYVrMXxnCajlRNz92/qF5ul+gH1dDXNtC2mNF0L1o7+yGp8ipng6+y4HuXc8fVzCtIeep25h1tzHZdGJUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by BL3PR12MB6402.namprd12.prod.outlook.com (2603:10b6:208:3b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 23:15:35 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 23:15:35 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v9 05/12] iommu/arm-smmu-v3: Add
 ARM_SMMU_OPT_KDUMP_ADOPT for kdump kernel
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org, 
 praan@google.com, kevin.tian@intel.com, smostafa@google.com, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-kernel@vger.kernel.org, jamien@nvidia.com
In-Reply-To: <6fbd503d7476f01455fb61d8d9dae6188ec1739f.1784663184.git.nicolinc@nvidia.com>
References: <cover.1784663183.git.nicolinc@nvidia.com>
 <6fbd503d7476f01455fb61d8d9dae6188ec1739f.1784663184.git.nicolinc@nvidia.com>
Date: Fri, 21 Aug 2026 20:15:26 -0300
Message-Id: <178735412600.18212.6187545852677506636.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: YT4PR01CA0226.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:eb::19) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|BL3PR12MB6402:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d911081-70db-474e-73f1-08deffda18ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|22082099003|18002099003|56012099006|10067099003|11063799006|4143699003|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info: Qepdmvfjx9sWv/fjh/6mNTAwdRczW4/jPALPHZcni5eBVHQHsc1YfQF4cJNGESxXVeOK1/eIJW+RTsSI1hSsxrb97Ijet9ZmPmTfGn8WJZtvefePnUsBN3VGCYiEbKe22Hf8tkPOLUHIgqQgMk9VU+SleUtJlkfiFToT5erYZmMugVoBl0tVwFqziGm3AXMPxZFzGYo1gXzJoUlIpTm9nDscZV7gvCNVesjmGKCPfOvtRHMifFUY3rtpj/LHlTEGIkxABdqrzMWyQi8j0HS8WmRL7qvkTR/sk/4TGw4VqSbTshpUN4HgtUj1BtKWDoKrrrEMcZxVmVmKNYl9G3hOyu2CVGdoNTELEZ+tbfL71EaIfFTGWwSoLp96qcSsgfYmMUCXRiOsniTM6h2D3FRrz54/Yb+FJhNUsjH1X1xRhT7W5vltAqjm4/VH9n/HS8Toc1XcacKn/fEgTXNZE2CJRTYh+zwyIAwf1E6jJec+cUTwgfiD5XQ4wAf3Ld/XGgIFnqrdIy+oFS0QVkJQ6++5nygVmxJwAWhzhbz13O0vamfr4t+WDRjDooqZjmJcWoZqSmjBlkmH4nDod4pB0GZOtSXNQ65vXgJobEvRw9c5pkGf7kufDQF1ds0EtvxKoP1K30ohZRRW8gmBhVrgK2ulk3pGUycphuDePtbLTv7u43E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006)(4143699003)(5023799004)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rmk4cEN5bmxzQWN6MGJZeFdTQ0VtQmJZNkxmKzYwK3cvVGYzRGFybzBJUmVi?=
 =?utf-8?B?cmJtbVo1NXZEbUVrbThyNUMxNFE2SERtUXRnWG9OeVE4NEp3cktHdDlHWkw1?=
 =?utf-8?B?RzNYcnBuMFVPYVRkcHorQlUvYVh0VlF4YktqQTg5cHlUbTduN2dLd2M0ZEtH?=
 =?utf-8?B?bmZiZUdoalBPcWtld2JmMzdRVmhXRTRGZmJEMDhkWDJielNTcWwvWkxrOFND?=
 =?utf-8?B?MHlPMUtLZ2ZvaHV0TjBtMWZqbGZocURObGl1bFZxUTU4TkVYazJjVDhrdEtU?=
 =?utf-8?B?TWVFR1NOOVd1d2xWUmlHSTZlOTNMVkJlMWZWYU9zMHVIM0pWUk9sSGh6ZDNj?=
 =?utf-8?B?Z3pZM3NtT1lzVlVMNmp1NktZWW1NbnVzWmVuK1F5TmoxTnBUU1BKem42ODN5?=
 =?utf-8?B?ckp0SjR0M2V6WEE4OVN3c05VVXVJTUk5THFnakFLQkdBSWZabmQ0L29JTWcx?=
 =?utf-8?B?VTExV21BdFJWVHg3dWs2WWJWQmdrZGIwTVkwSTI4NEhObklIb0g2ZWY2Ykdl?=
 =?utf-8?B?T0JPWDhTUDVvanl3S1E5OG5uRGFjNGJYRWZWRVJTeVVqVDFJclIyM1VVekZF?=
 =?utf-8?B?d3czRXVQQXVsL0FUMUdrak1Tay9kcW1KZVFnYXRXRklqSWtFUmpldnRLa3dR?=
 =?utf-8?B?MnRCNG5FTFVHOGdwZ0RiMVdxNFhnTmZjMVFWMWdpaVlNckplNXV2dnAxZU44?=
 =?utf-8?B?OVBTM1RsT2RhWGUwZS9PQVVseitLcy9JTGxKWWFXUkNhSHQyVEh0NTdwaWFa?=
 =?utf-8?B?SW1aWUlUN2tVKzUwRmtwSGF1cnZIZ09oT1ExTlhuUmVsYldnVEl2cFFBMXk1?=
 =?utf-8?B?a1djN2FvUEZNQUtzcVZReEVpTVBlb2lRQVNaSS93Z1R6TkF6bUF6RkkrNmlS?=
 =?utf-8?B?Ny83RDE4dTJiaXYrcVRWdVB3TEk5MVkvbVpTUUQrbTJZT2NzRVlPUWVndVNF?=
 =?utf-8?B?VDR5a0d5ekJIdHNkWDREdzVybGgzN3UrZ0tYcGhFUXJPdHJvR1ZTdmw0Nk5v?=
 =?utf-8?B?WTlYM1JMZ3VqMythcXR3VWpzazZvNTIydG5GNjYvWURYR2dVd0J1SUF5K2dj?=
 =?utf-8?B?NGs1OEgyVWlIdE1xRXZKRnU1SXJkNUdQVzZGdnQvb2hvbytub09wdFlqa2FV?=
 =?utf-8?B?QVcxYzNXN2RkSkJESHhJak5DNmthN1kydExrZWRGdElucE4vbmFpelYvY3JS?=
 =?utf-8?B?WEtjemszQk0wTFVOWTdhSTA5M0JVZGpma1gzT3VCZzRCdlIyVTI4MHZSUnJT?=
 =?utf-8?B?ZW5pT0ZPc0VjZEpaaXJGMHByY29VV00wSDZyU1MvY0JMMDMydHI3YXdINitq?=
 =?utf-8?B?TGsyNUVtY08vUjAySjZHWjZxOHpRNUQ3UVl2USs1TkQvQ0ZKangzUkExWGdL?=
 =?utf-8?B?Rk4rSmlPdEhpVURoQnVVcHg0UXhIc1lSZmpLTGwzNHhyUVUrS0paUmdTellC?=
 =?utf-8?B?SFNUUzFYdlRhMGJiYkdDYnhHSjdTeS96MmdmZld4WExxUVV5Z0dZeDRqRDQ3?=
 =?utf-8?B?TjdxM1hTdjZza1JSbHlhYVBwbEJVTHRONzl1OXZBNTlybHRuVkdnZU84K0Ez?=
 =?utf-8?B?blpYc1lNZEt3cllPNVFHSkNQUzcwQTJjbWxiSHJsOHROY3p3d3o5eGlvd05j?=
 =?utf-8?B?bHM3WWxQcVcxcjFQUm5DUkRHZWs3dXVKVmk2Q2dEOExDUWZJRGVOWmNZMWUz?=
 =?utf-8?B?cWtRSUR3UnIxVit0bDNnaytZWVRVYU9hZCtRL0g4cHF4aHVBQ0ljZUlYYmJt?=
 =?utf-8?B?T3UzMmFPS0xGRzI4dnNicGhSbGJGNmpjbzNScUhOMWdnanVscmVJU3JGTVlu?=
 =?utf-8?B?MS9LVDZTYlpjYUdaNVVET3ZLMEZYTisraTVIejZxZXpBbTAzWXp4V2ptWjV5?=
 =?utf-8?B?NUprU3F4SEg0bmt1dUh3LzNIOEtBMTlJcklrR2pyd0dsQlhNSElhbXk5R0Fh?=
 =?utf-8?B?TW9HTjlmL2RFV1lMSTZxU0dIQTZnbWhyL2xuVVVVcjFiTXRzcXA4V2xMaHpD?=
 =?utf-8?B?L1VYMmNFVWx4aEFEdEU4dDRyYjJvcmZIUVRBZHNoaXFDd3RqNC9JeEdaeHpY?=
 =?utf-8?B?cm5rWmZ6OG9qRGE4K29lUGdja2JKcjhlNXVuVURLc1FvL2xLT1lZSzBRdEFp?=
 =?utf-8?B?L2NWQk0wcUV6ME51Uyt3RkFwMXhlUnYwZHN1UTFMdGExR2ZFUW0zWE5DUC8z?=
 =?utf-8?B?dG50UmZQR0dFQW5naVhwNDdNRXd6VU5pYmdlV0d0MjhBK3dNbjk0cC9vLzdP?=
 =?utf-8?B?RnFhRlV0UEVsa25VSWhneVNLbXlqUERCNjRLN284RUltVkhOdFI1SHNWakp3?=
 =?utf-8?Q?SroRXT1jaDUKQUDNH9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d911081-70db-474e-73f1-08deffda18ba
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 23:15:31.7634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QVcPBZ76cRD9DDaJa62P2BFe1E4A3gEfyOJHj27GpYIVn3oeGlCYdy37abABmDbj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6402
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_161544_262976_6CEA591B 
X-CRM114-Status: UNSURE (   8.36  )
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

On Tue, 21 Jul 2026 12:48:14 -0700, Nicolin Chen <nicolinc@nvidia.com> wrote:
> When transitioning to a kdump kernel, the primary kernel might have crashed
> while endpoint devices were actively bus-mastering DMA. Currently, the SMMU
> driver aggressively resets the hardware during probe by clearing CR0_SMMUEN
> and setting the Global Bypass Attribute (GBPA) to ABORT.
> 
> In a kdump scenario, this aggressive reset is highly destructive:
> a) If GBPA is set to ABORT, in-flight DMA will be aborted, generating fatal
>    PCIe AER or SErrors that may panic the kdump kernel
> b) If GBPA is set to BYPASS, in-flight DMA targeting some IOVAs will bypass
>    the SMMU and corrupt the physical memory at those 1:1 mapped IOVAs.
> 
> [...]

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

-- 
Jason

