Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139B3C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 13:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hBcaA3jDsEbxR7Lz3GVJ9wbHCDBPDBGt7++kZE9HP7A=; b=cCvcxUwem4GVKViOPrAEOui82z
	1onuoP8AShExsUU5ZXOnytojyMgieNFnLsSskLEGYABALWLq+7LQJtdc8BbaUCf06uOz2h4FUp2ik
	pJRjT57WHbAlQPHLt/Q+diQ80g3wumWkm40fQBIEYqT7hE/08Xe/2SE4ADQOiChafviXmMQvB6ffB
	YJxTVkENaI0pL4ez3pujNVtVYr8mI2BwZDANiD68c6gjCQKyA8aRZTfLysGDKh3CHTDw8oW4PuuF/
	PLhBmGx/RcuKQ9rNS6aYCLIC3i9kZKg3fB8uapelqzECw3g6c252pjvB/alqOP9dw2oO6DtjL5Vcs
	TVX3rZaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYlRr-00000002TMi-49ow;
	Mon, 07 Jul 2025 12:59:56 +0000
Received: from mail-dm6nam11on20616.outbound.protection.outlook.com ([2a01:111:f403:2415::616] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYkwT-00000002PuH-1hVV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 12:27:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqnhK8slknmvMhnRSO21khK5XY1NdsY2zShgszzaS1LzCQo8UZ5Q4MVUONRSq8wMi+MT8dtGMQyDyEKsFvqk03MQ6PiqrwgYTA+V0TNEP4TQ/iMqXxw+L0cANm3PhcbKQWcqQ+sbITBNTxmSL68a1w9r8VSd8XtrgVJH7nrUGIjhVIh+QNxUwY3JR+HaYuX2AYkMw9/145hzPzP6cImcl5AFc8ZAn2hITJxiddFLmyj4ffj/C3VGv73PG31POHQKs7adTOdN5EwUvqIFb71d5lIGLxVF4+V37tX7MdUi4v4mfdXGA0lWm1AW+Bp3vd0ash/hRO0f+zp1EPxLNXqQVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBcaA3jDsEbxR7Lz3GVJ9wbHCDBPDBGt7++kZE9HP7A=;
 b=vcbKuzSArMaxI+eQODm7io3UCR1416NFerO7vAUcxcXWMuDK7WAq3gPWbLv830uyKuH1ID5iQRxGhJeil6gtSNqVObEN+H6U/ue7Ex1LXePTDU2E8x78+QYbDYJrsLPpHqO9UIzev1/fcuMakJPM9Dtfwgmb1iFvJJi7S4KxRQb1XrNTPKwOBTDef5fPo7TNrgDwyuJcS0FuIYTDo3ftnDw/eHF+DGnT6R4DXJ7DpL1C4fTTeIQ9OxJAnffaLxgdlUvvYd4QGAKntvBen4G9MBMzP/XSrgzLzBJv9vOQosZbN3kJNqYV4d3JR5lF/ac+rjjIZM5wgyyoejaXOp12vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBcaA3jDsEbxR7Lz3GVJ9wbHCDBPDBGt7++kZE9HP7A=;
 b=bDaUtR5/tX4t3ze1dmEcpbpPZNaaf1FMpUSb6rCmI1io7D4YhyQwOrLHGux4T01MIMrxHN4qG1hcpUXCg0p5/Hq9KjJ+NKeO67S8BfIWnodBM5eLNaIxWoeXk9VLkZuWYWwKQ+zoyK8xF8I7zsz8OwsAGiDTsYWpaUhh60+a0AyhoQG6VA4V9+pg+V8a4rEmockn2bD0GefPA0APFJJMVxUU7QQn5iYMhhZQ/4SfEK3NYwDJxv/NCLE2kPV8wnQGxnvsG5GKdQNy/y+Hk3be0O3t5aKFG9m6fXNQ+Vs0P1GSOSL+ZVsCzZLDXQVCCcqhogVvIq0+AJp8HJiCgNATzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH3PR12MB8282.namprd12.prod.outlook.com (2603:10b6:610:124::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Mon, 7 Jul
 2025 12:27:14 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 12:27:14 +0000
Date: Mon, 7 Jul 2025 09:27:13 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: ankita@nvidia.com
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, ryan.roberts@arm.com,
	shahuang@redhat.com, lpieralisi@kernel.org, david@redhat.com,
	ddutile@redhat.com, seanjc@google.com, aniketa@nvidia.com,
	cjia@nvidia.com, kwankhede@nvidia.com, kjaju@nvidia.com,
	targupta@nvidia.com, vsethi@nvidia.com, acurrid@nvidia.com,
	apopple@nvidia.com, jhubbard@nvidia.com, danw@nvidia.com,
	zhiw@nvidia.com, mochs@nvidia.com, udhoke@nvidia.com,
	dnigam@nvidia.com, alex.williamson@redhat.com,
	sebastianene@google.com, coltonlewis@google.com,
	kevin.tian@intel.com, yi.l.liu@intel.com, ardb@kernel.org,
	akpm@linux-foundation.org, gshan@redhat.com, linux-mm@kvack.org,
	tabba@google.com, qperret@google.com, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	maobibo@loongson.cn
Subject: Re: [PATCH v10 5/6] KVM: arm64: Allow cacheable stage 2 mapping
 using VMA flags
Message-ID: <20250707122713.GT1410929@nvidia.com>
References: <20250705071717.5062-1-ankita@nvidia.com>
 <20250705071717.5062-6-ankita@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705071717.5062-6-ankita@nvidia.com>
X-ClientProxiedBy: MN2PR01CA0061.prod.exchangelabs.com (2603:10b6:208:23f::30)
 To CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH3PR12MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e5897d2-808f-4325-bd0a-08ddbd519a80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aUGBd+wKVtML6UYX8njd0oU6LXv8sfOGNnL71m35utv2qpv1w6yoBJBfnsaf?=
 =?us-ascii?Q?YsGmfcMMBa/UMdyltCI7H5vH6V8oVfC5broZa/OxOOIRj6E1mXo0C8Kas4oH?=
 =?us-ascii?Q?pEE2okvdi6yPSoAnt0Ah5iZtmFfsrWQt13OSLwjvjeEbEbvQJgtgEPzTSozL?=
 =?us-ascii?Q?HMXeGHZ7h5JxenXkqSINW3shIrO6DVLF+QC4PTv90lsXAD3L4zFnbnFf3xhD?=
 =?us-ascii?Q?9ZHKKVuiiiKZx7z8lTwtgyoa6FVETx4i3NratiAD7S98Mf0sVpBrEsHgRPNy?=
 =?us-ascii?Q?0/wYoL5e1R4px5b5zurJ4aGKWRwdXypWaB5AriFloKBv70M8SkxcJNGijNmA?=
 =?us-ascii?Q?LOGkQEFvNY2jnI7VB8MMeNhcBpxfndIE8y+5KAaUHy/jb7yYgy0gdXMJLDDA?=
 =?us-ascii?Q?Xnvezfwe5r4g5odHdrxJbhiy45EkF4VitMMsBcWyHLwAxhmS9nBXqlPQjn3+?=
 =?us-ascii?Q?68+uS8hJwDDY8oVcCu6Bu9A5AanTpqg/YmjH0rWkqMAA31N6HkX9cGJMTvGx?=
 =?us-ascii?Q?53dW1o14ab99IDRDC8F0QzVclwBnliTmoLTIOFpW7xYcXk6UdcXw16prVY+M?=
 =?us-ascii?Q?UYEFafYBRBCLkue/U3KteLOqEg4RLev76Ona3T4uWKndK6DNBeR6WLBkz1T/?=
 =?us-ascii?Q?j+tHZ5NM6rwzDVi9/HrhN7CzXjsprO3tJ2OAd0w68uYXFbAuc/3T8v+baH/u?=
 =?us-ascii?Q?mh08Z7+5vg1mPj6g43VIcOK88U43e9aZtUoi1IdwVIZ2wvMeSAiU7NzKMnDI?=
 =?us-ascii?Q?PYwMqQTyvVg428hSWSQfpXU1XxFIHLXxizw12GYoDuy+BiUWx3+opv4T5nGD?=
 =?us-ascii?Q?yqvKVlORdKiB8TAe42eaKVQpb3IVACN5VrwSCnYp1DScwgpiTm458i+816jF?=
 =?us-ascii?Q?7LP9ZTZqUsF685pzXwKLkTenwgQXk2sSi2FzUZGhSWlJF3HKU4iBboNbQoaB?=
 =?us-ascii?Q?OIsTrF/Y0L+21fbRiQaimIvBFMhGj1YqoLWp/5xC77fzU0JaTW7hl1FWOEqq?=
 =?us-ascii?Q?6CXFCRvBk0k8XHmyruPunFyMkYf1ljj1zreDRpb1gwkHGFLvLfLKp/1zVFps?=
 =?us-ascii?Q?MDc9PGfuYv5pDUWOSWcjmLjydn2lHWW7fICMetgQD2dDHYecNmJZRKMe64a9?=
 =?us-ascii?Q?17LKcmtJA/a6KKVBk5wy/btLUgaZ1iFiqaLKHNoam5B7KyjX7hMxaIJA9VvQ?=
 =?us-ascii?Q?5/L7ylS91QUbVQ3GN/6uec3Ne4nsDihZBuRTqDPn+2swzrN1RjfsVrZw2y1W?=
 =?us-ascii?Q?tbckL109+uphW3/XSKdVfLdt/BYnxuS+D8Dm/Pwm6wqb3fsdWkOr3vnMTwmJ?=
 =?us-ascii?Q?fou+yDuhkcKJpO79v7OlvR31aa/fEsotN4Tbba7B4Z0MQRwu2/00difIBUtL?=
 =?us-ascii?Q?UIf2f2ZvbCUD56wtgR6sBegQl0aEyXjMDN36FutuQMvUccbkT+RU68AIPNd2?=
 =?us-ascii?Q?T5AUpbLT854=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uIorhmOmTezt2WcHuPrCk+K0FdiAClAmO6jQTW1EiAN48gY+op9KubN2Dskr?=
 =?us-ascii?Q?XACZ3AE6XFp+3uzRZGrJ1fWXj9kQvj4OYzawxe1mGQeqcnr8+RKgXrl2ptcW?=
 =?us-ascii?Q?5cl3zDNpiPAH9eJHdHvY+Zh03om6cR2rA9KfC7xe5OtW8bYe/uxa7gkZQsAv?=
 =?us-ascii?Q?KIjjza/FCcjhaByAOgxgSnqb3htWrAPYHrDL7GzxPUaMqfs4Rb+F2/UIHxVP?=
 =?us-ascii?Q?WtY/bgXQVLnyKjnST/jZbUGc1y7TXMsXSEUWxV7sDCFrgzzBBv7Q1gPcEv7u?=
 =?us-ascii?Q?OqwY8DhfEHFGt2nV2SNbAClJPHu/mgHo5VoyDu+FW/lKGOuwaF2+ILM1Vu5w?=
 =?us-ascii?Q?6ENHhEPeooZCAta6dwP9aDCtErEIjqXiALZECuMhaq5a94LZJnHgLBTOV/LS?=
 =?us-ascii?Q?eVIJh2J0NXtuzN+T8TJU+N2MHCybTWs9Gc8jxCcJesWxJrLkzSKnfGi5zGxH?=
 =?us-ascii?Q?jK9xbYBkd62dF71U0qpkyETRwpU2EzE//or9D8enaAKCxVBTbDTAshlV7pIy?=
 =?us-ascii?Q?kMlY179XgHQiWmP5vgw5FxiLYtjzwazYWafGBDLkha24VJDjaYsajplopajI?=
 =?us-ascii?Q?olTfJPUiDE89sh6msBW81bpIdqcEH5N2HK8H8Dwl+XJls9sD9WVwS4PWv/vS?=
 =?us-ascii?Q?6NL9qh/OAaBtlwPryrhKqnJDmQ3srNbjFtdEoFT/6IImlTTw2B6BRATHqo3/?=
 =?us-ascii?Q?UDaCd5YTrGS32FtimMLNiPDPZhIGPpSIH5yBEomfte7rrVWC4DLHjjl/0irP?=
 =?us-ascii?Q?EGwCm00dX8B5WA8mMwoRDAtMkGjy36eMB4mpDZiqjYuvaoEsk7PR6q1+r7jg?=
 =?us-ascii?Q?eQpQfWBCkOI4kuvLx2ca/jNI/IpZbrfCfC3dGrx1i0fCeLBGMUXYZS2M/r3A?=
 =?us-ascii?Q?wRNbGivBtEdaJeLxDE1Pilt5IDAdJ5wyqgDv/Mge6DrOlaQ/BC3WadXfHMAg?=
 =?us-ascii?Q?a2dH/QTLT1KaXb91ruZsHGSi5Fy69GvbTx0gXxS/x1Z3dWLnt1B4dSL8JvVv?=
 =?us-ascii?Q?84GfaObrq3+xDrc5puXVgPhYljdPVIWExXdhHtGCeNtOvLVYZrnA7pi+1MWq?=
 =?us-ascii?Q?P71jr7c/6m3tfvT8nvxsYYkQ96oQEi8WWW+eGpUazkyfhJCSLN7lsNOBwJGG?=
 =?us-ascii?Q?efrLoFehfNkR6oUMdd4i6XNbcyxlL4J+HH10EALlkgqbtaw2XHEz0qyfk770?=
 =?us-ascii?Q?+ggbP3skuevInQVMiK19E/j6g/7qt6cI5yqkWKSHNS6fYnDUmYBzga7VYrgn?=
 =?us-ascii?Q?yzm8Y5roA6CTUyTJbuvo/fVonav3+KduXcwNgqt9A5o2yIdim/zj1IQ6xCu5?=
 =?us-ascii?Q?Of1umZIsnRFzn/LuhqFXB5EtfBu+3b0sjrKlkMO8wdce5nMyV2J5nTnFl7OV?=
 =?us-ascii?Q?fBvbxddqiQp+3bqjhcAsHsbH00FBOTN+K0GUf2wyYdfKzypJMsCgFX1DJxJ+?=
 =?us-ascii?Q?t4iMaA4xVVohgEQPfDpbrlwmcYOzXZ/+QWtVInFEAL2hViILLf9ZH332wv6j?=
 =?us-ascii?Q?XeBt6a37VJDXgZFP1tlWx6iqsKB05xhl2ueJ4kSQmrFhBjehBkB5gOhkfKqS?=
 =?us-ascii?Q?VGodltg62SsOijeMvTWh6UgZZ7OsCm6wxj9cx9ma?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5897d2-808f-4325-bd0a-08ddbd519a80
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 12:27:14.1396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KB8UeBh2hI46ZZOfiGpYH41cAos7c9E0FE0iT3IGafTYUkzkIj4Km2UxehDmKFSg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8282
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_052729_444574_0CE7480D 
X-CRM114-Status: GOOD (  23.57  )
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

On Sat, Jul 05, 2025 at 07:17:16AM +0000, ankita@nvidia.com wrote:
> From: Ankit Agrawal <ankita@nvidia.com>
> 
> Today KVM forces the memory to either NORMAL or DEVICE_nGnRE
> based on pfn_is_map_memory (which tracks whether the device memory
> is in the kernel map) and ignores the per-VMA flags that indicates the
> memory attributes. The KVM code is thus restrictive and allows only for
> the memory that is added to the kernel to be marked as cacheable.
> 
> The device memory such as on the Grace Hopper/Blackwell systems
> is interchangeable with DDR memory and retains properties such as
> cacheability, unaligned accesses, atomics and handling of executable
> faults. This requires the device memory to be mapped as NORMAL in
> stage-2.
> 
> Given that the GPU device memory is not added to the kernel (but is rather
> VMA mapped through remap_pfn_range() in nvgrace-gpu module which sets
> VM_PFNMAP), pfn_is_map_memory() is false and thus KVM prevents such memory
> to be mapped Normal cacheable. The patch aims to solve this use case.
> 
> Note when FWB is not enabled, the kernel expects to trivially do
> cache management by flushing the memory by linearly converting a
> kvm_pte to phys_addr to a KVA, see kvm_flush_dcache_to_poc(). The
> cache management thus relies on memory being mapped. Moreover
> ARM64_HAS_CACHE_DIC CPU cap allows KVM to avoid flushing the icache
> and turns icache_inval_pou() into a NOP. These two capabilities
> are thus a requirement of the cacheable PFNMAP feature. Make use of
> kvm_arch_supports_cacheable_pfnmap() to check them.
> 
> A cachebility check is made by consulting the VMA pgprot value.
> If the pgprot mapping type is cacheable, it is safe to be mapped S2
> cacheable as the KVM S2 will have the same Normal memory type as the
> VMA has in the S1 and KVM has no additional responsibility for safety.
> Checking pgprot as NORMAL is thus a KVM sanity check.
> 
> No additional checks for MTE are needed as kvm_arch_prepare_memory_region()
> already tests it at an early stage during memslot creation. There would
> not even be a fault if the memslot is not created.
> 
> CC: Oliver Upton <oliver.upton@linux.dev>
> CC: Sean Christopherson <seanjc@google.com>
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> Suggested-by: David Hildenbrand <david@redhat.com>
> Tested-by: Donald Dutile <ddutile@redhat.com>
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
> ---
>  arch/arm64/kvm/mmu.c | 61 +++++++++++++++++++++++++++++---------------
>  1 file changed, 40 insertions(+), 21 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

