Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F4BC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 21:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date
	:References:In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ixAzE8m5SdN1YZvpBqAJst4KopCjq2QVC3UwRgl5yN4=; b=lhhrXC0B9pJ1XCqYRsvYKfe86R
	Tsu1KnIOHylo3orkhc3qrSqQV/CzWqrR/OQRG+B1jO2BmIFgkdmqAWdNdaPhgjwlNrP9T5ke+PRl3
	Y3bjln14gpjQWUzba8A1xGK1igmILdkjaXlosW/AuYAJ/2OA3O3pRU8al/+mSSt/676aPaWbWIc6X
	SF9cJw0nqd1A9ZM5TDAltlcCaUYVb/GkIJjuEDL4a02SAq7OQalkur0efQnwKVKneDum2RA+7nU64
	ViEwW89Dm8ByDNvT4q5xKRbYmnvo7JmGiSA+iNz8kU2JYWnzXoj5BpLfZgw7A5tVs+hY2+crJE/98
	ZqXQjrQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyFd-00000001TQx-0VBS;
	Tue, 25 Aug 2026 21:00:09 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyFa-00000001TN2-0T2R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 21:00:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7ywe8GfwqLUWhyZNOcv8VKZGwT4qWrVNYSGP8ccTKvbjz05xjPg0/2lQww+8TljhvXy0PIhCW70gHQkzX11yZf5z96STh3zggGeHyVdsizAFrPvAqtnsEoRVG2IGeWoAgXxzUhaSME+yzsAIQBdpGqw/FaaRlpc9qiMZkmYSDq8iTdQTShieCnCryIzKj0MHdSF+3OOH8ImCNfWQJzN4/WTdcYyytezuwvReqzZdifcTZe5izlLbcMnzOjxyPYtsIFZYLiDBsMIAVhlG3kmwXMbGevfjbztPQ7a85LDxsQZivySGZ5XEr8Tl5E3E0mAdDMMNFLCOVO8XYoaaPOxXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixAzE8m5SdN1YZvpBqAJst4KopCjq2QVC3UwRgl5yN4=;
 b=ZnH/BajnFzpYIbKMrgfX44dZDhqmi3RCmbT/pisWbKafGaDC8tL5V6CJwsHuSR/n5GpAvobFPpPYaMFn28jgL4mVHLMLw9txejaFF9roXB0gHd7UfLcupFN/ObYNGePgLo4Wz39Quqsz79SvWZv1mdgJijnrxZtcvgWsmJzeJc3YjmBC85PFA8JWmzQNNcsLdNs0gO4hV+GVnBqn9blajt1ZBxz2L1AOcmhJk4nbmnycZqzxoIOzBdz5S3qztiDpbrSJbHmoKt+15YZWRjMk6HSfzlggldIOhzuDckC3M8CamO6qlMezlIWwG32rawP1X6HdGD4ZOhH8RTkvf2zIuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixAzE8m5SdN1YZvpBqAJst4KopCjq2QVC3UwRgl5yN4=;
 b=Dx4rIP1lrxNNocImBcVas9aCMUkqlRVzIGRcqqqPbYVJgyjX6HStv7ANVXek7OASBcoipgeMP3ypwNLCfJgdSdG2kDKKyZuoWQnHh0JWhHLpc6BH3Mjsb7QDOwvpWC+O/eIjd2D0AKpfX57+S3E6N2ctaBCgu/lfGu3w90ocK8bt945scSlcGmPkcoayW+6C5Bn1ygG9LSyr/ETA217IVr1lTcaXLWXDqE+AAX180kzW8nLN4y7lMgV0UK/kltjb39d28sq6P3XzMNZz5XpTnbAJinmBGgre1qKXIcg0WXQKH3z6HSPTACAupK6ofJEW4pgGBSk0maX8VGb1gM58tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CY8PR12MB8215.namprd12.prod.outlook.com (2603:10b6:930:77::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 20:59:54 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 20:59:54 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 00/24] KVM: arm64: SMMUv3 driver for pKVM (trap and
 emulate)
From: Jason Gunthorpe <jgg@nvidia.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvmarm@lists.linux.dev, iommu@lists.linux.dev, catalin.marinas@arm.com, 
 will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
 suzuki.poulose@arm.com, yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, 
 mark.rutland@arm.com, qperret@google.com, tabba@google.com, 
 vdonnefort@google.com, sebastianene@google.com, keirf@google.com
In-Reply-To: <20260715115906.2664882-1-smostafa@google.com>
References: <20260715115906.2664882-1-smostafa@google.com>
Date: Tue, 25 Aug 2026 17:59:50 -0300
Message-Id: <178769159057.3356902.1232440069489543145.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: BN9P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:13e::28) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CY8PR12MB8215:EE_
X-MS-Office365-Filtering-Correlation-Id: d9fe8e27-7c03-4f75-6e42-08df02ebcf84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|23010399003|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: EU+KYdGlg8+XmN7FWpwkN6wJ7v4Q0x2u0u6a7eRdSxafu8d2p6gaLvAqD6kNlcwTUckJUF7krpeB6bUCDvDRBZF6vx2Q5Hm4UVkOTkYQaDRUkhBLGaLYg6A9pz80WJGncP38mgYpwDAyVPMN0WPp6u5j0LHfPWoUzphiHSKw7de4cHR1ViyZdmaAal3pk2R5rUO5B+/7Mh6RGWmvzooOB7nymZkTesKf8zPS/iMjkutAMOzawwbM2zDpfm3AwkltC0K53ZwgTqQAa51BNamzf5CK6KSY6PliTH4C5LX0M7YKG4bcJzyaFywYdUfV4Ps/fiJeLznSimz06ELNvjWsXvNOrkT0v9xi7NF+Xpe/8U6T/KhxJU9ldH2Y1DSnJD1yTmfhPpTcfB13gXCglN+GMS59d4NL25bXli01ZnsAEbek5NQ9I6Lz851B7XqTbnqp4xKpA1Q43chYDDjNIs/WmPSPeqIg0595UfTD0XYf9cZKXCIeVUwLu8mLt0SynWgUXAqX3RY/DHUMQTCfpJBYUGYhd6ixYitTeXvsf+RJ3KbRHbtrOTcLcDqX1WUpFUTLF7H61EdVZEpy2LIkgPTJ9Kwf48tb7c0Qxc5ycfSjEQaJhI+XHVI28RHpGcz+u+RYNZYuY4Uca5qtRNsNMm09jpNxQBiZaNR6yM56dEkvf14=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(23010399003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHhKbDVyWlgrc1FQZTBzcm5tV3hVcFp4UkkvMkR0VncvOU1tRk1PL2tUdllV?=
 =?utf-8?B?amZES3pxc1dnSDJlYWk5N2dQN2MxRitTa1NOSldtNC9UWFJaalh1K01Id2di?=
 =?utf-8?B?LzdsZkZ4N1IxbnpHV1M4Y0d2Y0JvUXpZaVA4R01VcGJVUC9jS0xDVGpUdm9Z?=
 =?utf-8?B?ZWhDU0czQ01sMVlWOWtESzc3MTUrbE5ldjJEbE9maFVHaXJsZmVhbXlyeS9I?=
 =?utf-8?B?a3JjTFd5WmVmSVlMOW8xbTRyYnBadURrUUNiUkRwU3l2Y3lYZXprMThvM2Rm?=
 =?utf-8?B?d0tiRjlVSlNGNlFvTHA3b2dEVG0zdDNhcU5sUTdrNUV5aCtvL2t2QUcwM2F4?=
 =?utf-8?B?ZXFXK0hrR05XUU16WjNHMHJiRHVIdmVXTXp1Y2EvTXRhMnZUMUJJc3M4MUlo?=
 =?utf-8?B?L0RCbEZOQjhueU1lSkkwaitvNmduN281elZ4WUVvLzNjbXpzMDBHSFdvL3dH?=
 =?utf-8?B?YzJCcmZxSXdjTTYyQTI2SHE0a0Zrczg0OWxyVnc2T3IzbUY0dnpIdklwbEc5?=
 =?utf-8?B?SXhRcmwzQmo4L1Vwd1E4bmduTDZPSXRic1V4QnU3KzRUeHBqSDdVYTFlcGx2?=
 =?utf-8?B?b2lCWlVieWlvRUQybER5alRlQzlIY1ArbVFua2lNd2tPelJYMEg1anZTS3I1?=
 =?utf-8?B?RjZWZ2NhL1E0NklzYmZQQ0pqNXBIcmhhRFR4bEJpQVp0NGtTT2hEdkZEbW9r?=
 =?utf-8?B?MW0xKzkxcklCcHhuZEgwMG81LzEwRXlIKzl5R3J1UnpJeUxVWVRrRGlsTGkx?=
 =?utf-8?B?UHRlRFFSZkovRmdISktpYm85WHNHT0RURld2TmZhUXN3SjZ0c0NBeHRuaTFS?=
 =?utf-8?B?emRBNzBIZHhMKzg2NnppaFEvQXQvNjl4cmk2TUhzaTRvRDhXMmh5N3BCZWdE?=
 =?utf-8?B?U2RmM09lV2Z6STY1bHEzL1NraGtPUlZzUzRvSlhHV2FVWXdQN2hSSzFIMDBa?=
 =?utf-8?B?bGNidDNURzl0akFQb0ZNTDJDbVhzenFIR2FTelB4S1hsRTYyZit2MmtqOXk3?=
 =?utf-8?B?WTAyZkcra1hiOTF2dFJ6RUxBMUtqQlIrN0JHM2doZERjUUMxb3NleEVkVDlS?=
 =?utf-8?B?bGxTbzE3aWl2dklxbldwVWhpSm5Ua1NFbVZsSUl4NjdnWXRRejJKVlRxVE03?=
 =?utf-8?B?K0FPelBHbmpMZldHSDVvNU5WYkVFZ3RSV3ltUWRERlJWODVkU2lJcEVkQmlW?=
 =?utf-8?B?ZFhZZW14RXpRdnozQmZobjVkMFZlZ3ViMmwzaG11TDR1V1BYYVZoMk5sMS9O?=
 =?utf-8?B?NXd5bGRDbEZSMFJEaWVxTDh6MDVUdUlBSjhIQVZjQ0Z3Vk13WW0rR3dIYW5m?=
 =?utf-8?B?dHFYL2lHb05kbWhlbnBSek9USW1rUXdOSWpkREtqSy9nSERKdlZWbkF4ZkRh?=
 =?utf-8?B?VTJxdTI1d0JNOEdZVElXZk9OalExZFNudkQ2K3ZLNnFKd0FUQmdLY0tmSFdG?=
 =?utf-8?B?NUd3Q29HNE1lZWNBb3JOcG1jeW5NWno1S0JQMk5md2RtY0Z5aDhMMlFEb2NI?=
 =?utf-8?B?WnhPbW5DWWU5RTlZYTYrTzlvMUowcU5hK3lvTGV4N3BhNEtETmlXVG1sUG9o?=
 =?utf-8?B?WENVbVo0RVBKYk9GeDJmY2hTcjV4RERwaFhMKzZEV1ExMy8ycWV2U3FTVTV3?=
 =?utf-8?B?VkNFc1Q3cndDZzBaaURCa3BacEl1TkhBNkF3Ulp3ZGJBbEZEa3gxWGNrRDd3?=
 =?utf-8?B?TlhEVDVRSjBEYjlQL0xqZ0NmczlWU254YWFVdnVxMmxDb0ZZcUxSbnMrRnQz?=
 =?utf-8?B?ejdEdHJxQWFKUFRMVDl4L1lLOUpNZFByM1dMcTlDMnRmdHFNbUR4SThteDRY?=
 =?utf-8?B?K2tqdEg0a1JjNjUyLzlxTENGTC9meXJpdE9mWVg5N3FDcE9TZkRGRXJiVDVS?=
 =?utf-8?B?K2VQQjlxQmk0VUltekE2bTFURVpiVjQ1Sjc0OXlTbnhYRmpwU0FLNXF1R05S?=
 =?utf-8?B?VzJsQk96TFUvZERCNU1NakhmdlJVNUNBb1VtSXBLQ0RaOG1qbmNkaFhkejdF?=
 =?utf-8?B?WDUxQzdqZnJsK0FaNmlQWXhmSTdjTkpSZFhKTUNsRTM4VzZ2OFdNOU0zSFNX?=
 =?utf-8?B?WHZFMGZ4MzRUSjAyb3gyVkdCVm41UUN3OEU0RTdLR0R3WWRJdlYwWnVFMm1k?=
 =?utf-8?B?TTFkdlNSZnpMWDJiL25FNTV1d2wzWTFOV2JxN2ZrNHRxc2huRUVnWmJtczg5?=
 =?utf-8?B?d2pjYnRLUXZSSVVwVG1PMWxPWTlWVElCYWsrNjhxUDVtelFzMGlRblprUk1J?=
 =?utf-8?B?RGlPNFd5dUlwRVBGYWszOG5oUkl5Y0JWZWZjbFY2NzMxcWZmNkxDWWtadWZr?=
 =?utf-8?Q?Op0gUUnLfLVoE3bjr2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9fe8e27-7c03-4f75-6e42-08df02ebcf84
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 20:59:53.4459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QWem1SX1BXSzOsz5FBjDMWD5GHR4oxp1zHrh++PWInG+gzjNoPr8euJzZenEZ8Dj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_140006_155882_56F69C62 
X-CRM114-Status: UNSURE (   4.82  )
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

> This is v7 of pKVM SMMUv3 support with trap and emulate

I tried to compile it:

ld.lld-21: error: undefined symbol: __kvm_nvhe_iova_bitmap_set
>>> referenced by __kvm_nvhe_io-pgtable-arm.c
>>>               arch/arm64/kvm/hyp/nvhe/kvm_nvhe.o:(__kvm_nvhe_visit_dirty) in archive vmlinux.a

I think it is because I have CONFIG_IOMMUFD turned on.

-#if IS_ENABLED(CONFIG_IOMMUFD_DRIVER)
+#if IS_ENABLED(CONFIG_IOMMUFD_DRIVER) && !IS_ENABLED(__KVM_NVHE_HYPERVISOR__)
 struct iova_bitmap *iova_bitmap_alloc(unsigned long iova, size_t length,

?

-- 
Jason

