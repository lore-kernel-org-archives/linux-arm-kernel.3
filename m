Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B385BC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 14:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0nU3n73tPYV8VZurG6HKjH03RW5m2zF01blsm3NR8Ag=; b=2o2/OWP5LsG3PZmZmYmKqJdsKr
	sg8gKw1pZgxW7G1crBpKPyGaC/XpD/R6xkoWu+p41WzbiE1r81CYJ0EXu+1G2bjpk9qdQyvpJeSia
	eoqIxrPbPSDLHKpZLebKFNCYbAIUcGTyGAL3zVZENEFPedBzJqlbebMubx1NHOTk1wApEXR37YejG
	JvVTagZJqHOk5jOom7GK7Uyn5LfZu/odC8Z3T2jvzdHqOJJRWFikKOCB5KUOEy7G5TMuzgogZ7wCg
	aIQCAFudqr7jWaZxtXRXZvt66OmmyBFXIB2ZxQZp2H2/ZkgvzxPDOF97GGTRea/fCjbUEGGeANG41
	2bowPoOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAjm-0000000Dbgx-1cMX;
	Fri, 28 Mar 2025 14:31:10 +0000
Received: from mail-bn8nam12on2060b.outbound.protection.outlook.com ([2a01:111:f403:2418::60b] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9pf-0000000DRG0-3IzK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:33:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ceOLzQPTeZUUShMVIMWh/46GMWA6T8rpR9abFzwRm94GwdAbyWfUrLCajeMzySSN+Z2DU6kHaWUcTRsU6Awr8E+fki7ydFDwriYmFEfSPqzHDVYtf/L46wAmbQ7GYGpCf8fjNm0Xn0hn2ALIVVKIu/h90muk+k8PUyFyciWOBMHw0k9BapXPgohDv1KR6JmyVrOLPkJxZIotY7d2N95LKCvOKjlmAorU9XLN4dVtXDRJxt18ks/b70pLDGhbCArW9101fhnkrt9iek8y6NQ2BZ6yEM12d5gsxw0COYapfN0HMd5c+YcYV6PHE1nmfBP6u+6V8TlPpBPr1OOvxn84/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0nU3n73tPYV8VZurG6HKjH03RW5m2zF01blsm3NR8Ag=;
 b=M3EmStpDqYCbBm/801t35xBtsGmQiHGZPU9l6l7W5A3oWWPgVLunQ5yCg4YpzkE67oVp9zZEvsc6UDM4wIQmLfrdhUE6OAfmEAQYjTacRxr4h51sYolozeQ+C+yP1mTJpbkeAKW+YsRlVg/qqC/PobWz9gYjY/KY+exTTjLyXN2gqs40cPytsjLlCBB90BuaFHEorIwDADhpzL28XeuluQlKQdpTAuGHHnhGgvbAxVfq39V/1fijbMEWoGRYh7gzuM0wXyqPUH5Z2KhDTelp0N3gwXMeTRqu21owRkc1NuDRvmYBGNbDxyzK4PKFTT44o1vqDnsG7B/pidnY1VFYJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0nU3n73tPYV8VZurG6HKjH03RW5m2zF01blsm3NR8Ag=;
 b=t/+lV3PBmBF2x6tymMFQxAvyzsRhRF/yCjq5GoX0mJNBuI/Fh4iowvf6QQ382jY/FL1IyTeuj5GfdZZBesxXE3lH6+Vw8wZG9bTojvHT+qjRVgcZgNz8zYvMqV/nF8h7wu68tdfqPnAkWAPeem34UHGMWAxHY6VQIV7VDY+wFAFKWvqyul3haA7Ol7+TtsZ8vdHTpZY2GZDJYoz/AHjoNEFIaqXTaDbnBJEqTns6mH6nTagikOzce95sTgSaAPtgjIFemMgzcgRUUVsTTHKCq+edSKI/48/H0TkhtcV4VtPP3LfKdq01DFRS7kzPgsy5fBV0bSKPVG+ikgRE9FwnjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CY8PR12MB8067.namprd12.prod.outlook.com (2603:10b6:930:74::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Fri, 28 Mar 2025 13:33:02 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 13:33:02 +0000
From: Zi Yan <ziy@nvidia.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Matthew Wilcox <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Dave Chinner <david@fromorbit.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3] mm/filemap: Allow arch to request folio size for exec
 memory
Date: Fri, 28 Mar 2025 09:32:58 -0400
X-Mailer: MailMate (2.0r6238)
Message-ID: <8DEB30F0-52D0-4857-9BAC-CDAC045A396E@nvidia.com>
In-Reply-To: <dfc06a39-3d92-4995-ab06-c552e351f7c8@arm.com>
References: <20250327160700.1147155-1-ryan.roberts@arm.com>
 <Z-WAbWfZzG1GA-4n@casper.infradead.org>
 <731D8D6E-52A0-4144-A2BB-7243BFACC92D@nvidia.com>
 <dfc06a39-3d92-4995-ab06-c552e351f7c8@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN1PR10CA0016.namprd10.prod.outlook.com
 (2603:10b6:408:e0::21) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CY8PR12MB8067:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c0c7410-cf10-4864-5954-08dd6dfd101d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjBteGNQV1pMUlpReExJc2ZZZWJNbkwya3BGcUlEVXNVaTBMS1BQT0FYUWUz?=
 =?utf-8?B?bnlYZGdKMlp6Y1pOZ3JpNXZPaHBCZ1o3SVlyWTJ6cFdsTUNjVlhzZHlZWWho?=
 =?utf-8?B?NzY0MkVmTGRKTXpRR0lVQ2tSTnpqYWd6V3JyWGJEOXZ0UDR1VUN6VmFwWkZE?=
 =?utf-8?B?RnEvMHlRUW1wNTZuSlJ3UzVUNVRKSEVuZ0ZPZWlNdDFrc3hlNUNNNjZKU3ht?=
 =?utf-8?B?N09udjRuQllYb1JaeW1WWDNuKzd4d2xYdCtVZmFWREJrSlFUWlFaUmJIQjFT?=
 =?utf-8?B?SUVENnNSWnFYeVpmMW1vaEttMUF1SFFHVDhPMnYrMWlJdUVBWXVVSHYxWVlu?=
 =?utf-8?B?eWxuUURGZU5uUHlwdXZOTUNIK3k0UENEV1BOUGc2SjM2MXFWbnFjUDZKSG1h?=
 =?utf-8?B?aHNMekRBTWZObmlGK1QzZUkwSWJWNldjaHBwSTJXK0xwdGpMd0I1STUyRGRO?=
 =?utf-8?B?UnoxOTZaa3NkUG1zczQ4UW53ZVFwUVFqQTIyKzlEeU10M1NZUVA3cmlXL2pr?=
 =?utf-8?B?KzgyYzhHM2dCMjVDU3lTU3lNZ0NCaGdtT3R4dGZqcjZFK0xsUHhKZUYxQkxl?=
 =?utf-8?B?aVpjbDlxODhkbkY4MllFZW5nN1VTT2tNZmErU1ZvRFlIak5RaDRqbW5NUTZD?=
 =?utf-8?B?WUxOT3lpNzYwZDJPa2pGcmROQVBpVDFGSjlEVlRmWWFSMUZwSW1oK1BoOVMw?=
 =?utf-8?B?Z05jMmthcWU2eFRYSEJIZDBiY0JId09tQ0E2NncvUmhJS2RWY3dkV3Zud0lp?=
 =?utf-8?B?N2xJVC9oT1J2UXczak0wVXc1R3NVS3FyR25XcFRwQ3l0S3piQ3ExZXEvWXhp?=
 =?utf-8?B?TkZGZ3VZVU96cXZoK0llendjTjVRT2VWTUc3VmRyRWZzMy9sVy9FRUV1c3F2?=
 =?utf-8?B?WjZKRThUaE5YeGtidGtOWllQUkFmV21BWHJqSjhiMkQycmFBdm9tOW43MlJy?=
 =?utf-8?B?d0Z6dWVXcXFtWW5zUitrUkdnL1Q2OXk4cWQwWU5sMzRPd25FaEhRci9VekR2?=
 =?utf-8?B?SGhOQzFLREZJVFJrU3VKakFZRFRRSTFzWkR1dHV2enZldHpSWGRQYm1TTEt3?=
 =?utf-8?B?dklZYkNVMmw3a1RNQnF5R3A2NHpudVFoMjl4b3Q5RU4zZUZIOTF4SzFBd0Va?=
 =?utf-8?B?eWxwQXN0akU5TW5iTDZvTTdtdm9BSis3VWFZbDNjRXZnRXRFUy9MVDUycTE2?=
 =?utf-8?B?OVZYSkZwaG42MlM0ZFBYU1RwaDlDZ3M3Y1BPb29DTCtBd1J6Vmd2OEw4RGoy?=
 =?utf-8?B?TDlZQUplQi9URElUODREVFY5RVFXejVSQzhtSExnRDdHU0V6cmx3L1h3N3JR?=
 =?utf-8?B?ZFhoZTlTZmJwRkREc2x4YjR1R2xOQ1Y4K2FDUzFkMEV3dS9ib1NIMHVjUlFH?=
 =?utf-8?B?S2ZqOEp5ajFkMGt5OVI2akRweEpGOUZscnNyaEJmRGU0QncwOHJra1A2NkZr?=
 =?utf-8?B?eVdrSC9TcEVURWVFL3pMZXZicnRqK0tiTktXeWlqcjZhRTlYRnB5L3MrQkRU?=
 =?utf-8?B?cHhHaC9JVVF6cFVOMThBWTNyVnlvZVZoTkc0dnd6T1l1R1Z6eWJCUFJKTWRh?=
 =?utf-8?B?S1hYL3RJeXFGWS9IS2pzNjA5TGNMSy9sZndTZlFYUHNyY0RNM1o1ajVJRWxa?=
 =?utf-8?B?QTlsbCtUb3JaZkZZejVxQWxZMm5aT1hIenNaU1oxcUlRT1RFZ081REhySGla?=
 =?utf-8?B?MTVLU3VmU0JKZEYwSG9yZHBFN0xPSmIxMWVXR3dDYmlUcEU1NHBvM1kwMWVJ?=
 =?utf-8?B?bVh1T3JIVW83NDhMbWVmaXB1eEUxTzBqN0ZtcjVwMEthZEhCTklQVUo0c1hh?=
 =?utf-8?B?L0N1Q2VQNTAza0VKQzdEWi9ydWxlZklaTTBKQWVWeCt1bjQ1VVdqcEhJTXdT?=
 =?utf-8?Q?g6jADLjSbSKed?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnZTa1BlVUpKSG5BdmZyakx4d2xFek1ETjVSNmxyeFc4WE5XOEhDUFkyd21S?=
 =?utf-8?B?SjVybHk3ZGkxWjNoUXZRL244eXN6UkUyc00yN0JSK2RWaXgxc0t0UkxDL05H?=
 =?utf-8?B?NWMxVDFSRFFpTmlmZ0QydWJsUmo5UEN5ekEvNjhtc21UankyMEQ4dGpRZFVi?=
 =?utf-8?B?MzIvbDRmNFdjR3dRR2gyT3pvMVFYTWFNK2g4WGhuRStaZU9lU0ZscnBZWXg5?=
 =?utf-8?B?S0c3NTZyYTVHb3UyYVZLVWpKSjY1VmtIMnhudUd5OEM4NS9XQ1JoM3lTd0t2?=
 =?utf-8?B?UEFZWEVMWWF3M2grZGVXUnNqd3V0SjlQc0hIbjArQ2w3WG1laWJEeUl6c253?=
 =?utf-8?B?TENxZFB0Lyt2eTVQYUtnbFJZNFdpS2w3OHBFWG5VMDZCUGMvYng1WHMrc3A5?=
 =?utf-8?B?bmluQXlzSUJHalhhRnFNbnFTOFhmc1Eycmdpb3BlUXNBcW5IZE9UbjV3YnA5?=
 =?utf-8?B?cFRpTnpUN2tHYkZ0T3dORVhoK2NYTWhiNVI5QUxod011Qktyd1pmWDdMSVBN?=
 =?utf-8?B?MHZseEZnVHE5T1YvNTUwM3JVREEyYjIvT2RRcG1UVXo5MWRESkhnNHJLamVK?=
 =?utf-8?B?d0habHAweHpFQkdLcDE3MlA2UjQweStBS3VaNkV2M2s1S2hxWXVVN3Q2U3Jm?=
 =?utf-8?B?QkE3UE1wdDZ3VGNlcUFUQ2xUQUZ0QTJKd1dsSFdJSW9HZVc4SU1TMWhFSUwx?=
 =?utf-8?B?WjByR1oydnUxWXgrd1pCNG5zSlhnZVEzR3ZJWHc3MzBZWVpaSWJ2Z1EvbUJj?=
 =?utf-8?B?aWd4amVrT05PUGtiZnlrajMrMWpqVHJlS200MmRWSmFsVERPOEN4blNOMUNo?=
 =?utf-8?B?bnpCSlJuSGl2K2JLTVNPZzRnVDhyaXp3eVNhci95UGpmRWVaN2JkbkdkMnNn?=
 =?utf-8?B?aWFBNllBdFRmaUlWMXIzTCtaM2dlVzhPLzhHQXdIaUlRU1hTemxWelJra0cx?=
 =?utf-8?B?NjFBUzlRbHN3NUpybW9nbDZMdE42Zklvb3k0em0rSVFneXVaMEZyeU43R0Q3?=
 =?utf-8?B?NXM2Rjd3ZS9LVDlqU1BWWWlKcDBEcWFYU3VpL2c3eGNBVjl5K3h6TU92TUFw?=
 =?utf-8?B?Vmc3TnRmdGp1TUNnUVlQem5vWGZ3SVpHZXRlMDBmeGNWNkx2R1NIQ1oxaVE5?=
 =?utf-8?B?cDlQeVJCZ2FIdWFKZ0RTWTE5N3NJbE5ZTHp2QWQvRloyVHJKeXIwOUVqOVFz?=
 =?utf-8?B?aVNuOGdxY1NWanlGdHBYbjg3bWVuc1cxVGJYdmVtNDlXRTVLYUF2MElCZ01U?=
 =?utf-8?B?TVBhWVdPQWRVd0trL3lZcVlBa24xdmVydkkrUER6Tkh5bVViNlllS0VoekxV?=
 =?utf-8?B?MXVwbVlpVmZiaFhHRjdnTlNXcVQ1NFpqY3prdXZPbzVZWTYzNXJaQTFJMlJn?=
 =?utf-8?B?Y1FQTmdneHlzdVJVOENaM0Nxa1VpVk1GY2JtS1hWa2UrL0haYVBZcjRta1J6?=
 =?utf-8?B?MlZzYXdlY01kdkg1VUt4bnpPTHU5NzMvZWY0enRGdk5kTWNBeXVBOHE4UWw2?=
 =?utf-8?B?dVN1MkRBOEJkUnJaWGRiaUhCYlcrejhuY0VDU0QzVm1KYjBGaWxhVmFDb0dx?=
 =?utf-8?B?SzkvMENrYzdQRFhiM2xLQUJVZFFodHY0N2lsYmhJV0VVMWVMaHVGL21xSXdr?=
 =?utf-8?B?U3psVUpFcExMUjlFVjlGSHo3MXh6UnY4SjdNdTVVZzFpbGNjS25TbWZpVTY4?=
 =?utf-8?B?OWxBNUMycHNmaExmVVhUQ0RmSzlONUdkRUtFaVhtN0pLaElFblAxL0lqdjQz?=
 =?utf-8?B?SHJDRjR6aE56Qmc3d21CRFphWDVKMGNFbEhYbG5UUExWQjBvV1NMVmd6U1Bw?=
 =?utf-8?B?K0owajlIaEpCOGltQUladVRkOGdOb0pkYVFGL1JxYkVqZEdKVFRwbmJJc1BC?=
 =?utf-8?B?K2JMVXNKa2R1dEdkWmJyaEt4MTNpMUluNUtvbDZzdlVvb2FsTTIraWJzRUVO?=
 =?utf-8?B?OGM5d21QbUVuZUd5LzU0U05jVzdjbzFlZXYxZHJuTm9vRzVYOVpCYkh3b0ZC?=
 =?utf-8?B?ZFJRZnNPTHBVd29CQkM5V0hGRjA0dkdQcFJpVEMySWJrRzZaVXQ4WTQwZ2Zr?=
 =?utf-8?B?Wm9Mdi9ycDI3SXI0bWZSYXpmckV2eEtKaTJ1T2dWdzVOR3FqSlNaY2tsRHkw?=
 =?utf-8?Q?/799p/9uFlqsvLiMf5IlOxOEG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0c7410-cf10-4864-5954-08dd6dfd101d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 13:33:02.2166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nPSJDJ13hI8UPQ2DyZSqpThgTcogcY2VQj4MNzAskNL9xq4rHDxozbUM93RGU97j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_063311_826944_2ACD87C9 
X-CRM114-Status: GOOD (  18.78  )
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

On 28 Mar 2025, at 9:09, Ryan Roberts wrote:

> On 27/03/2025 20:07, Zi Yan wrote:
>> On 27 Mar 2025, at 12:44, Matthew Wilcox wrote:
>>
>>> On Thu, Mar 27, 2025 at 04:06:58PM +0000, Ryan Roberts wrote:
>>>> So let's special-case the read(ahead) logic for executable mappings. The
>>>> trade-off is performance improvement (due to more efficient storage of
>>>> the translations in iTLB) vs potential read amplification (due to
>>>> reading too much data around the fault which won't be used), and the
>>>> latter is independent of base page size. I've chosen 64K folio size for
>>>> arm64 which benefits both the 4K and 16K base page size configs and
>>>> shouldn't lead to any read amplification in practice since the old
>>>> read-around path was (usually) reading blocks of 128K. I don't
>>>> anticipate any write amplification because text is always RO.
>>>
>>> Is there not also the potential for wasted memory due to ELF alignment?
>>> Kalesh talked about it in the MM BOF at the same time that Ted and I
>>> were discussing it in the FS BOF.  Some coordination required (like
>>> maybe Kalesh could have mentioned it to me rathere than assuming I'd be
>>> there?)
>>>
>>>> +#define arch_exec_folio_order() ilog2(SZ_64K >> PAGE_SHIFT)
>>>
>>> I don't think the "arch" really adds much value here.
>>>
>>> #define exec_folio_order()	get_order(SZ_64K)
>>
>> How about AMD’s PTE coalescing, which does PTE compression at
>> 16KB or 32KB level? It covers 4 16KB and 2 32KB, at least it will
>> not hurt AMD PTE coalescing. Starting with 64KB across all arch
>> might be simpler to see the performance impact. Just a comment,
>> no objection. :)
>
> exec_folio_order() is defined per-architecture and SZ_64K is the arm64 preferred
> size. At the moment x86 is not opted in, but they could choose to opt in with
> 32K (or whatever else makese sense) if the HW supports coalescing.

Oh, I missed that part. I thought, since arch_ is not there, it was the same
for all arch.

>
> I'm not sure if you thought this was global and are arguing against that, or if
> you are arguing for it to be global because it will more easily show us
> performance regressions earlier if x86 is doing this too?

I thought it was global. It might be OK to set it global and let different arch
to optimize it as it rolls out. Opt-in might be "never" until someone looks
into it, but if it is global and it changes performance, people will notice
and look into it.

--
Best Regards,
Yan, Zi

