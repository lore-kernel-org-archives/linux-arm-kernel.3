Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683E3C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 20:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izbFWxu4Vr+f/WPuyleqNpbsTmr32AdyChgMGGJ8muc=; b=Q/ejKeWpnadynoPnVkxcm3gLib
	IyqfjZQReikWGyP/ciq1+NxvUaMsFudvp4L8yIEa0nS5sHbHbCnqUIlXF3i0RTEZV/gk/K4Dhp6Dm
	vXnZO0bnlfPARj9Rkq3UiGfJI9UOtz4Dn7EITyxxyl7wmfxaL3p1zWFTf3EhDV3hTUqtx7tKz1zRO
	DUYzOMz4QASu9TNSkvPOEpsHBYFeFkFePYZoQjNtvto4uyH3RsIkFLWRIb6ZCFUL4JO4fU0ShT1OO
	m5PSfl1+AOmhJzjLXVtd5+LvrNis3WSMnUJHyb8eASJzu7/x1H99mr9sjiEQ9Y6Z77fupw85Lj8PJ
	Qoax4Y1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj2Eu-0000000G9rS-0daR;
	Fri, 14 Feb 2025 20:24:44 +0000
Received: from mail-bn7nam10on2062d.outbound.protection.outlook.com ([2a01:111:f403:2009::62d] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj2DS-0000000G9kF-46yL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 20:23:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bvLwtwnfY/lAkJ3NIBa6CsFWq88frXdj2LNjh1FwWEwWwh6ZMFDYHZ7b4RCcHs+s8qu3JGzNSdxgvrMmke/+UOn1IVqiSLh7odq6uJXz+7VfAvf2l9K6U0GWL/c3WtSsP0eBSITgMWl5lEE7sSuyqaaKvO1u47woenzXJSsE62Oz9fm11LxPx/Dg7YYpF33vo1C4NxzzPAih6uT+AZs5fVibL4luk071IaPBvOwqWGACSOkpS/uBaoMA5b58vc2WbdkBBC8GQ9ZI5lTLiJQ00eK6mp2NrazA8wIyMJ71x5wWXSC1np8luFPhJ0Hk4vz9S+RuDRnEo7kH1rp+ZpdYOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izbFWxu4Vr+f/WPuyleqNpbsTmr32AdyChgMGGJ8muc=;
 b=J3eWJi1/BG4qbZI/8+8i/VZZBFvua1DNElq0LljlKmhOtqMYqruJ9ApO5Of9ZgKlj3Ae7LGvhqakqzsZ0q1Vc0l0H06y0wIqwwcyerKv1qgbzQpd56v9IsFWCStcHT9FiUXhf9zkvcgYD4NDpQJAzTEZG5xCS05RmWVn0uIITg3qzI2mzf9wMPuAB4JxXoIbL9ewxFyP/JZ+0kvRWBxtH14cNF4xJ53OO3bdg4RLTfX16zsOkHV9TU5uwty6UiDOJD2HJy6ZTovjcNzZNr7A63D9CIJgequciID8EX5YVCaIQgsYLKynB55QHhHK78CFwAUitFNqiHz0z9J3WubA/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=izbFWxu4Vr+f/WPuyleqNpbsTmr32AdyChgMGGJ8muc=;
 b=PSVQIQ73Oe+nXFoBwZ4/rPQn26iwXvGH9LURfV+ntCO7+Gx6LlqxN8h+1s2Tc1NagSwzoDXGJS1Qd/CIBy2gIx5NtOgDFL3pUuVmNMMOw1cJmwII6YGPQWtdGu9ZaipPa5BCwSV+Me+MGZ7sqr13xoO5Io5301pwqzDC5hzPFeCTT+Qk5T46OHgkeCQRsGEpyQxrLKSCoeB7hF2S03C8duhCCSelFZXTJxe1goZ9cqCYv9gh10A5NrLFg5bdnBJg+QCP6Ic8qW0zrWZNYHxSqHd8LnR17/NcOK8BxnVaJqy7Uuparm22jv9Tf6aeFaV9zW52igIKXMB/eQczF/PGSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SN7PR12MB7419.namprd12.prod.outlook.com (2603:10b6:806:2a6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Fri, 14 Feb
 2025 20:23:10 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 20:23:10 +0000
Date: Fri, 14 Feb 2025 16:23:08 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kevin.tian@intel.com, corbet@lwn.net, will@kernel.org, joro@8bytes.org,
	suravee.suthikulpanit@amd.com, robin.murphy@arm.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com, shuah@kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
	smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
	patches@lists.linux.dev
Subject: Re: [PATCH v6 03/14] iommufd: Abstract an iommufd_eventq from
 iommufd_fault
Message-ID: <20250214202308.GJ3886819@nvidia.com>
References: <cover.1737754129.git.nicolinc@nvidia.com>
 <8427398787e81b81d0dc6df5661032b2301c06f1.1737754129.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8427398787e81b81d0dc6df5661032b2301c06f1.1737754129.git.nicolinc@nvidia.com>
X-ClientProxiedBy: MN2PR15CA0062.namprd15.prod.outlook.com
 (2603:10b6:208:237::31) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SN7PR12MB7419:EE_
X-MS-Office365-Filtering-Correlation-Id: 549d6dea-e307-4f02-c954-08dd4d356621
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xf6C2/1Tjr5bSU74B/pZfVAnJ91LSaQSOFTyeQWGvXJtzPvhuGtCaGU7uUE9?=
 =?us-ascii?Q?Vray7+I84JYVbVyp8aw5pVNMc9Fejh+pMFCbIN3hQwZxHLjMtVNWyJSdooVJ?=
 =?us-ascii?Q?iiopABcIb7AgmJjxXabunzR/hmUCUkbp23Lr3kUsMEZyl3A86gMRCWblWlM+?=
 =?us-ascii?Q?UGvuBhINaWHzVy8jWOqImAD4LwWjUkiRXXqRsdYL2v6l47qSWKVxqPc3nWOY?=
 =?us-ascii?Q?j8YVVTgtmN1xmot2IC92cT2//ZwbL44f2U5jc9LzfCDbpxDTxUXhagzjZgV6?=
 =?us-ascii?Q?xzYkqpNVfFUxcjS/Bkqrq4nc7RRub7ZQMv8wbd/IQJRgSUKnxFJx4xdCzp/3?=
 =?us-ascii?Q?OvGyM9i9/LEGykk1pep8HNm7bDvPz+AEPtgXL5G+wfBxfo2x1LhEune1oeFl?=
 =?us-ascii?Q?+L/E69pQJN7RxtCHaEN4crWy2txi8cBtg7kW65mNtESVjerzYbE1UG+pDB8X?=
 =?us-ascii?Q?HfNjeDjNNu/IIR3ytHMw+/2bC5xoj2C0Ezi20tDAY7V+Ua2gCiFcTFVNz+Er?=
 =?us-ascii?Q?wtu3DpT3tdhqz0Pf+L/f4df5NgjZEF4HddyIuWbsixBS0cVf6S39TRw68q7C?=
 =?us-ascii?Q?NVsBZ9xe5xVoHsNOYHlFqafZkie7EQBSwJ7YnTu3uKw/VhsTLU4djcZX7agq?=
 =?us-ascii?Q?6vdbAM/KJxB4ll3ToSsEx6oBO4irfh3Jy9YiIHe/nKOjINti8ax0xnEO1zq+?=
 =?us-ascii?Q?uYzpzAgzyXI1seb0vLKUpLFcCpr2QIusQ9myvCNVcoZdiucZUnznVx7YOl/8?=
 =?us-ascii?Q?y1MAea6CM4hGyjJTOrUo6aWSDJPgfnZp/6VK14E8009ZoJAXoehKbKMb71HD?=
 =?us-ascii?Q?q3xUbFHYRhX0qYZZ9ttuIEIVtUt9qoEXt1m9Sdq3FV/maxRLh+BpLryYFr9Z?=
 =?us-ascii?Q?Sn+NNAjBxHq2FH0VnB9ktJH6JS6eVwHh0SfjZMwI7hpihVQQ5ugNopXs+V25?=
 =?us-ascii?Q?GjJFyNgSoIBsYx0LNr1nSYL3xezNm2aGUgVNJ8Ney1cYSzjCAF0dJ44OUKYj?=
 =?us-ascii?Q?/iOczurXIfQj7TaFyRAeuNppjckVbn6IyZr3nhYedHrIwB66RTM3LJ/wTNXa?=
 =?us-ascii?Q?+RAQF92oekNHxYv+UsSWIytHb0XT3SDfQENvwdZjzhWwMJE8hdPTdGuRKOOB?=
 =?us-ascii?Q?NbGIpjMpfvhFfsc77KivTnwqtQLWa8zPDaQomipX60E7DzbI45ZYsoE79U3V?=
 =?us-ascii?Q?r1qcKmkrBeZvD0kfAgbN0Zo5NijXorQREz3khjgk+YURTP+ph5ZqZNuPORpi?=
 =?us-ascii?Q?Gd7ZJPXLuYtd/uUS5McHDAbfUvmtxRVCp3IPGfaZoLLvI542Q0pBLYmXrsGK?=
 =?us-ascii?Q?1djX7rTU35skWynkPsTT1prIkOSKbhtYTswqpbxVRY5w12sa4EP2swxMN5FA?=
 =?us-ascii?Q?3l16ma4/IDKe/UsyNVeGEaYEsIEC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3a2tftmEEhvMDKCR/f5INm7Dfjxnl0XBdhkJKdVvYR+6kxyQRal2uCUIamKU?=
 =?us-ascii?Q?OIXNqQU/Lx3jmgFvAzwNe4lhhnQn8J3wKnS3gfAZMB/gBYdEnZMkfUUkKN/F?=
 =?us-ascii?Q?j9ehZwuGzte/39hm+h2Xu4CiHxP7rxIT1GHF/uJjstWBi1HOTOwzfI/Gipto?=
 =?us-ascii?Q?scBEp8XjfgmZRjqWC9ZdjDII5eJgdArIxTKREPaNKsQigeja8bJNGwl6Z4hJ?=
 =?us-ascii?Q?i7gSTY79YH5jwCpHIquEamBYMXpYIZKpWx5VL8B/wmfo5gx4x2VuKdIAn6QV?=
 =?us-ascii?Q?10Wq8p9eiBL/L0UIqyrrEefIUCVt/O/FNTSjN5Ji+S85lEHLcXxAJXXx+HRg?=
 =?us-ascii?Q?8j1v9JNlzILIy92G8kB+aOdlwk8bSk5q+ySAEmPXXNuo5GyS5WNjAHZ+IHRD?=
 =?us-ascii?Q?JQj9gFXu0/cS0Ml4nSDoZx+4s9u+x1AU2rRP600tPOmFL+MrngKFdLMkGDks?=
 =?us-ascii?Q?abVaBuAmCkZVrCNcerDGG3G53t4Q4ST2vznyIDwrgE7/pci0VoUjKhittCC2?=
 =?us-ascii?Q?hBsWOjsQsJTtj2jHAf2e1dHRT47kT2H/ppD0QRn8HiWrICb/d8KsqEREtUXR?=
 =?us-ascii?Q?gwaXvNiBbMnj5qBZ6AMfIyV+c7uIVQoo9OiLs7n6xzdzlhwn3wny2MRb51dZ?=
 =?us-ascii?Q?gX6qUx+xzC+zqdJhOD93EGlkrQXuaUKa9PZmWe1OxMxZoBrnkyOzPIk+M5xU?=
 =?us-ascii?Q?zvhSkwrI8vtub6pIJeGj6pYdZZPcWLmtdxGDET7Hyj3DFyRDWvLv4rCcRjpN?=
 =?us-ascii?Q?U8yuIIXn8kR8gn4QkYikqSE3EyPO0uRsNagaj/wXAZyOw/r2Sq2TLKaZZFKV?=
 =?us-ascii?Q?p7D4YmmtDwmoh60nxWWBqFqPzD7cO/7k1sSJ1uFuPROdCCET6K+uNMudHGNI?=
 =?us-ascii?Q?LhjRLdcxnWGorStVISrDQJnPJP4LxUB4wL11AXZ3MgYs7U3ltYypptKNeuZR?=
 =?us-ascii?Q?C5O+w/k8FLG3lPRcx/Cw9BwdyUNmb1e7JusnEjjonvpK7hyt1XZKiz4sDWCc?=
 =?us-ascii?Q?F09/zIYTlRZgrTGi2ajT9uMZN0LofXYDnyu9WK0jC7y65ZcwfSD3KNDRx3CY?=
 =?us-ascii?Q?8dwpCuMzjvYtJo+hmEq4ifVTvcwrNPpB9nvSl0ywmnMMD0UlghGd6Q8azVVs?=
 =?us-ascii?Q?FMiz/SVuBYZX81PDd5yGsdHFgrU31Zcd5gaYC7aX3ivfDG3Qls+HT0nq0+A8?=
 =?us-ascii?Q?BmVBdfsG5Ducbv+BBV3PsHvsiEAmyC/0P/W3Wp6kPe9m79gaRN+WUFetY+VD?=
 =?us-ascii?Q?fq/6dzTaJQPdtlfXC5Cj/asK72Kq3fNRYpNdY9fmA+4VK2/e/C/5Tkih0587?=
 =?us-ascii?Q?wbegweIDgjEAZryB81zfz/i+lB+9Q7ICiwKx0UvYPcLOGqgLoWfj8k5sxbtA?=
 =?us-ascii?Q?OGK+ZURj5hFHK6HYGfT/DgyJZGwuAmK7f6iAUCPxGct+wem/O/HZKOzx5DNV?=
 =?us-ascii?Q?yPJ4mZwTUmmORWdIjPEhs6NDZblyk4Amt4qincQBUQE++w8yVI5kF92m0sDW?=
 =?us-ascii?Q?5vfOdCGkmqF1/pNS7cgEcCg4HJxYMnbTu5q9HsA7iS4ejaRRDF+ahOWGgN2s?=
 =?us-ascii?Q?AESCW8i/Bc8dH24zdSg=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 549d6dea-e307-4f02-c954-08dd4d356621
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 20:23:10.0796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GO0rsCbMs3O+XAbM0FiVpqH8z/csalQvUSI7aFN/rQ06i0VecNIzRJQ5C3fAZ1QL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_122315_019723_54A15084 
X-CRM114-Status: GOOD (  10.78  )
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

On Fri, Jan 24, 2025 at 04:30:32PM -0800, Nicolin Chen wrote:
> The fault object was designed exclusively for hwpt's IO page faults (PRI).
> But its queue implementation can be reused for other purposes too, such as
> hardware IRQ and event injections to user space.
> 
> Meanwhile, a fault object holds a list of faults. So it's more accurate to
> call it a "fault queue". Combining the reusing idea above, abstract a new
> iommufd_eventq as a common structure embedded into struct iommufd_fault,
> similar to hwpt_paging holding a common hwpt.
> 
> Add a common iommufd_eventq_ops and iommufd_eventq_init to prepare for an
> IOMMUFD_OBJ_VEVENTQ (vIOMMU Event Queue).
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/iommufd_private.h |  28 ++++--
>  drivers/iommu/iommufd/fault.c           | 111 +++++++++++++-----------
>  drivers/iommu/iommufd/hw_pagetable.c    |   6 +-
>  3 files changed, 82 insertions(+), 63 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

