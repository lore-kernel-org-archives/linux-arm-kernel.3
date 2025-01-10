Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C92E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 06:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yswrPAo5cWR9oooR3xaGY7cspe+kv5JCJjLolQAYZ3w=; b=Q79n6o1HMUWAEeY+97i63hNZP8
	A2vbkzaIy3q992N4RtSr0gsYuw6skUbeihzQBF+RGde3zh3lnkeTkw4hDIxIWV9QuCgSwFTcYPFvC
	OjmZipf8WOKCb3OcN7GfLH1IE0+AKVjcq+GylgeAeqHxB4Hxgd5GDgnZxEO1+yxp91Ml4UjFDu8Su
	4A//HJI2RDcQpS/OdhbU+0kz45+wvbUZZmk97JDKD240uBX3jPhqpDZzoKN5P8E2rW4lCDyvxnwBF
	EbPYk4aV8n+Pl9L0GR6AHDMwc4kdBVGE5cjQvJi2Dfr8YkJBjCSg8G+BIKwLgXNuHVrIQmoJQTGsC
	BDIaqAmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW8xW-0000000EJjo-2kCu;
	Fri, 10 Jan 2025 06:57:30 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW8wJ-0000000EJS3-0q4o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 06:56:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736492176; x=1768028176;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=hYzoHQfH11woX70qE7wThQVNGHlLkv6wADN03i5SaiE=;
  b=ZszRYKx9YUJpOnQ6xt23Q+zH6XXMQ7mqzPsQ9BJtrnID4cBLQ2bFcxWH
   23O+KSpFRMjiSTB8x5ZphcBjLH6BdUQ7L+US9FA/s7pOvn3f1+7Z6VUq0
   T6bvJNvI5I06udFDWxYPUoaXm3q74wFMeJkeniWWeNNgYtLwvDxBMDBvT
   v5Cr4BrOu9yqzOqOstHoojICm6ZtU2s33izet3AKF5QFrT48AEb8xUaVc
   Eq9Y5iZuWippT4Id4Lu1JMjLUeoEJZCQvxtN9irseKPQbX68osDNQ+FJZ
   yWI/vr6fmV7RFRgGXqX7WSct2iqbKpnMaNfTbjlSxEDJCDHvh5f7CHaTq
   w==;
X-CSE-ConnectionGUID: +x0M8KNwTwqzzC3omFU7zQ==
X-CSE-MsgGUID: zca42qPrSIen8k2m53kDIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36659554"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="36659554"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 22:56:13 -0800
X-CSE-ConnectionGUID: +6j98LJSRiGVtVDLscu7uQ==
X-CSE-MsgGUID: RDnyRDP7Rx2B8z7FMnPwOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108756340"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Jan 2025 22:56:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 22:56:12 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 22:56:12 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 22:56:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D+7rOynMq0PxIXx4xDpvUx9lza7xpuwyFIfBjjq6MVDTVbnWahxcHKVicIbLIKCgSTxW0FKHTCdbO3zzHzcVJj5wTblToIsSDQ+2Dwl3Kqf8LjzwQgIPfcRQ+mN1f3K3Vdv912UZYMxiAVS30LQOFhizwCxL+1hJthg3fX2AXxPhqGADZT7jIgXivOZBO2krLsN3T1J1eVYDsvFTq4v9KOQn7pIwZe1HWgnPcKSYqFqpAUfY59+bbalDbL14tlcXZkj0hkh5oouWByvCQ9RVoFSNjkry1RvyiZoi4WciS3OoyIQenT/UtWTXx36pVybyhgTcN6K5n2tHdxtjqrpaHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yswrPAo5cWR9oooR3xaGY7cspe+kv5JCJjLolQAYZ3w=;
 b=Esef6nMZA/GzVqeII9P+7moIcIxLEWwWCcRiPadEA1rI/JziJx/xo1zSeRVSp1s2ceZtfRICAZAtSHJ9fcWOsMCKVJowLY/Q72hsEy9EMY7/yvf22VhpY/QrFOH6Xq1GW+zMEVAikuXwcLzbd4Yny++m8+gUHQkKDPCZ1ZQWQ3QIfDkWJU6SkJ1cGk0gF/tTSe9hC4Ljlav20m9DBAF/gTh8W16927hasZg+9EB4LuPmjyxyGYz/rVDxFUFNkdV3uwEf3ng4jBJ63JZa/WRMVT94phGdt6FGhxqxoLsSApyWDkxI6SmafYAMS5s0nJLI69SBdIYMY4OkIvwv3WdNeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by MN2PR11MB4709.namprd11.prod.outlook.com (2603:10b6:208:267::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 06:56:10 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8314.015; Fri, 10 Jan 2025
 06:56:10 +0000
Date: Thu, 9 Jan 2025 22:56:06 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Alistair Popple <apopple@nvidia.com>, Dan Williams
	<dan.j.williams@intel.com>
CC: <akpm@linux-foundation.org>, <linux-mm@kvack.org>, <lina@asahilina.net>,
	<zhang.lyra@gmail.com>, <gerald.schaefer@linux.ibm.com>,
	<vishal.l.verma@intel.com>, <dave.jiang@intel.com>, <logang@deltatee.com>,
	<bhelgaas@google.com>, <jack@suse.cz>, <jgg@ziepe.ca>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <mpe@ellerman.id.au>,
	<npiggin@gmail.com>, <dave.hansen@linux.intel.com>, <ira.weiny@intel.com>,
	<willy@infradead.org>, <djwong@kernel.org>, <tytso@mit.edu>,
	<linmiaohe@huawei.com>, <david@redhat.com>, <peterx@redhat.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linuxppc-dev@lists.ozlabs.org>,
	<nvdimm@lists.linux.dev>, <linux-cxl@vger.kernel.org>,
	<linux-fsdevel@vger.kernel.org>, <linux-ext4@vger.kernel.org>,
	<linux-xfs@vger.kernel.org>, <jhubbard@nvidia.com>, <hch@lst.de>,
	<david@fromorbit.com>
Subject: Re: [PATCH v5 05/25] fs/dax: Create a common implementation to break
 DAX layouts
Message-ID: <6780c4862b417_2aff42943b@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.425da7c4e76c2749d0ad1734f972b06114e02d52.1736221254.git-series.apopple@nvidia.com>
 <e8f1302aa676169ef5a10e2e06397e78794d5bb4.1736221254.git-series.apopple@nvidia.com>
 <677f14dc3e96c_f58f294f6@dwillia2-xfh.jf.intel.com.notmuch>
 <lxz2pq2m4gqlovfwsmunwzfjq3taosedbrkaf63jbrxwwg6dek@7vbwtibeyh4m>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <lxz2pq2m4gqlovfwsmunwzfjq3taosedbrkaf63jbrxwwg6dek@7vbwtibeyh4m>
X-ClientProxiedBy: MW4PR04CA0144.namprd04.prod.outlook.com
 (2603:10b6:303:84::29) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|MN2PR11MB4709:EE_
X-MS-Office365-Filtering-Correlation-Id: fc8edae4-87d9-4f94-b399-08dd3143dd5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rfN8T6LkjC08gBlee1K4V/J/lsWR51BDUJKicTEO25I4Y3ChztjRmMJDT1Qi?=
 =?us-ascii?Q?WqJtld+R6/yxxtJyLq2FOTFB8HUvKZkpXPJLvNDI9c6jxRcuSa47FX9kj/GQ?=
 =?us-ascii?Q?GKMQOYKt4wekkXtsbGq7jtn03y7RsCUq4dJCe7L3Aq6S3fWk25csZf+t3k95?=
 =?us-ascii?Q?Tg5gh6gW4i/pyttQCk5s93PiXspsQKGNcZ+zNVwStExbAAfeeh4v+NxVnXqU?=
 =?us-ascii?Q?LKTCGsqnZ3Zuk7SV9eBFI/NJrsTukdynFPgS1sJE/02h21V3ASV6DDPtYFO7?=
 =?us-ascii?Q?UeIF1g7wt0mwKj8+J7Os/Z7PDH8641XX6xWvLIm8n1OYbu6M9xqePcZ1KVI1?=
 =?us-ascii?Q?Fv1/pmzxNEsfzh/1y01Ji6cbbZE3/IsRIe5SMex98hw8edLIu/J5Dv9Sg4TK?=
 =?us-ascii?Q?XO4BuRJAfd2xz/K7QFl7nlEgMS4q9/+casXQ8EennICgwfwT68adbG9ivO+F?=
 =?us-ascii?Q?VITBAkG8MQkJOYgjZvZJRUm/9xr1sHRULVvPUQd4FtJIcvBA4qfHBlhMcrl7?=
 =?us-ascii?Q?flDIbbeCbVjHeIgmVrkrD7er/nZe1jp1x7yJgga0psmRwRVm4KVdsbtkoBrt?=
 =?us-ascii?Q?sv82ABfUvt72m9gDwwTc7FubfCXhCYdFhKnhjGnr1aPSd39u37bDEztndSjs?=
 =?us-ascii?Q?xjUM8BCtD8UGVgApSUhPEd2kfLSVgNrHcWE1qKLNjtgVGCkvKeZXRDxgJqoD?=
 =?us-ascii?Q?1+bRorML9iHcba/pH950isGDc3PAiOj6pLaklNlwfINVVbpCGUqkwniu08rl?=
 =?us-ascii?Q?LnEI2YhtqluNetx8Pe4Nj/IWEeymFY8UpIUIeuTMRDj6kGjL+r3p8AXJr/uy?=
 =?us-ascii?Q?/uuNEd+9KrLmteTyPsyBMUw/ulWXe/PasVKJdDsAt50qg7C3AVWRtapaDPKU?=
 =?us-ascii?Q?iYA2YI/Ruuu+er2thc0tBwe5GebLf5im0V1YNQs7bksC0aCYOkNmRsk+nm+Y?=
 =?us-ascii?Q?yX1yP6WIFXNQuzpNtpgxweLTKyavz29y0kItV/ug3MJkBYrIdXYfQ0AOAI8W?=
 =?us-ascii?Q?PIR7hkwYV6qGMParlX3GID2Ppk5UVc3aTEVJUJYMOhK+kR+nF2aNm2e61ca+?=
 =?us-ascii?Q?Zv8MDQpY1usl8YlAzgOrQdTZIZ+pKRriCCEpvjPTUFzIOZ0wi+2l0lk2Vv+D?=
 =?us-ascii?Q?f3GO2MiqcMj3WkyrHxBtV8XDKTGTzLuKMVRhv9StphUNYvwACnrBPtsx2gCz?=
 =?us-ascii?Q?dWipeW5oaeOlNFZrqTVa2hWMI/KvndU37vJRsUVmh+gkRI2F/3+1LQ0CjJ7u?=
 =?us-ascii?Q?QMQ4MGgCxfl8GIAnxCUF0kCyAZE1eJZ78bUMZ8m+Tzw0asUyju5eTfYCH4Fx?=
 =?us-ascii?Q?7ff072zxRghlk0cBmD0TDJihD4cL4lUUNa2pJmL/bCrJtRACvf1AXz57CyLc?=
 =?us-ascii?Q?ueQ9b77kucUBIgKu1VfUvlZA+Buq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LlsgUex9GHM86Wm2QsRS/SzszmpT91mSFqi/IqLJe9x/J5fh+q7KELGu7LwO?=
 =?us-ascii?Q?CWn6lleAmNbzepBHqMI1m24/FUH+ofBmNf5rGkaneF3ioqDfqx6m+ayQ4ub5?=
 =?us-ascii?Q?1TFPZG09ixqjqpl5ymp8ScXqCs9rAN/qilSBkAFqL3wUwK8Q77O6UXq2TbpY?=
 =?us-ascii?Q?DP3VhORJzI66/0yP+0yz5ZuQWwBb7iRKcDs2KRFSTpIMhcnQFZxZmMUYuDAs?=
 =?us-ascii?Q?c+hBcC9UktObpbiLxbMRyBnbJQQzp7m2qnkoA3mXgivKvK/Fb6GcgmeWazLS?=
 =?us-ascii?Q?+iDH1H0WZhI/MjP1JWLH7JpPYGcFDBnkTOgC/W8wa+LUKqovIcLon5d5H+cT?=
 =?us-ascii?Q?AGd3I80mQdaL4Mlprh3HgORiO/CoFOMdxpDbvYs6HCpW6i2QYpuxKmMcTCgJ?=
 =?us-ascii?Q?8hmY2DJQPWVj71O2jnbY+BGZMelB3x/HlkzejPmvzfiBjPCYCzmX5+E2Mob7?=
 =?us-ascii?Q?hEOjhZMuvsNgMzi9ebkJ5MjLa0TRDpP9DpliHk4UDWWXi6PRLS/Jk4Bce8yF?=
 =?us-ascii?Q?onwqlneVel/xOxH47RAb8mfEdBSD+mrIaVVeKZpsM1KIN1ahRZywSBkXBSMQ?=
 =?us-ascii?Q?u9KqeIVWkAs22YXGZn4Sbtlkx/KYPIdi6FWuU6WM7F6X0Bgyxj71oHP+hQcR?=
 =?us-ascii?Q?AFZ+ct6XShK3jEU9eSjQi8i3cGIPI7Yyhj60QnQKM2qOtb3GwFr5WCCNuRUf?=
 =?us-ascii?Q?5nSWRrlzK0+aUZGmac8VpbVP6mPdgRSa78n/sWwRYfVQJVnDK72Yu/cLyD8u?=
 =?us-ascii?Q?mMafUKX75BmqGukOr8LEdPms6Px0AYba9ARWUSp3om0iz/iArKyU9FNpMTMI?=
 =?us-ascii?Q?8g0N2tBQaNEJ0/ys/v9BLcYcRPtXDURtGA2x35qBy8ou5uXj+0N/mU1gpgvF?=
 =?us-ascii?Q?QtUV+et27NYAXhVmY7xEbfEV0p/NW/Uel7GCEvP3HnFUCfaLGAqhDCroOcj3?=
 =?us-ascii?Q?JU+hgCrjQrE00mXjUajR8SqpHPBERMXRPwUdReYfWSNiYHtfaFLSwwTndtd5?=
 =?us-ascii?Q?KhS1jQ7BYJtOW5mX2X+wnt2FasTBq2J/73sVKyHYfMpKqvpgQmJ9vqYK18Bo?=
 =?us-ascii?Q?xMy5sTy7KY4ClsI+N+xhC6fTMctQAz4HSdsiyR+fa7UcP6r5ZsNR6r1YzDyH?=
 =?us-ascii?Q?yXg7u273BMPWEC/Q2z2E9ya8vE2BehJYbQJPCgFNBfp6JqVYvvRUVU9l+3CD?=
 =?us-ascii?Q?fGf+J7IzfX1ozYKCIvHNVAW18MyJLW1bga0klYa8j3+9MR+EDZARrMh8NTN7?=
 =?us-ascii?Q?NT38yfL4MOMf/s9WNe+z9B8HYAIKqacmClYW147VlRYT/oaX2394CCisZPFZ?=
 =?us-ascii?Q?UQPAoNM55BqdvHtY02FnueFvNpXhPZ61W0aFmw4aYezmfK8iKDjPi2nc37r4?=
 =?us-ascii?Q?msxz/OCD0ZtwCMJJpC5va7TEFMeFpxNRHkMPxqDGcfaerTH6iIqOTpOE9glE?=
 =?us-ascii?Q?0nCYDw0eaQ9PptkfJceTwxh0kF4z5Lh/sHdXREAFyPwlBGTTbMt6q6I16f8H?=
 =?us-ascii?Q?DdByNOtftMvOy3b11WI9ySaTdTkQbgn1dFcgO3219FcuKZGnIG7fTo3dEyn1?=
 =?us-ascii?Q?VY0V6vjmuwONUP2mjdWY72Q4HcPbo5hHfxcByMAUp/5oySjfpGTuRFytm0m2?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc8edae4-87d9-4f94-b399-08dd3143dd5b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 06:56:10.4273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BwCO09EmqLcx0mAl/hNfRyWaNawDwuaiIZxy6F6cVqggxzZa5eWtKK4CEacz1ciS4xTV0BON+b3PYFWwpcXVzFEcjqmVaC8KLYU2NVlt6DI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4709
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_225615_305542_58A8E22F 
X-CRM114-Status: GOOD (  39.72  )
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

Alistair Popple wrote:
> On Wed, Jan 08, 2025 at 04:14:20PM -0800, Dan Williams wrote:
> > Alistair Popple wrote:
> > > Prior to freeing a block file systems supporting FS DAX must check
> > > that the associated pages are both unmapped from user-space and not
> > > undergoing DMA or other access from eg. get_user_pages(). This is
> > > achieved by unmapping the file range and scanning the FS DAX
> > > page-cache to see if any pages within the mapping have an elevated
> > > refcount.
> > > 
> > > This is done using two functions - dax_layout_busy_page_range() which
> > > returns a page to wait for the refcount to become idle on. Rather than
> > > open-code this introduce a common implementation to both unmap and
> > > wait for the page to become idle.
> > > 
> > > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> > > 
> > > ---
> > > 
> > > Changes for v5:
> > > 
> > >  - Don't wait for idle pages on non-DAX mappings
> > > 
> > > Changes for v4:
> > > 
> > >  - Fixed some build breakage due to missing symbol exports reported by
> > >    John Hubbard (thanks!).
> > > ---
> > >  fs/dax.c            | 33 +++++++++++++++++++++++++++++++++
> > >  fs/ext4/inode.c     | 10 +---------
> > >  fs/fuse/dax.c       | 29 +++++------------------------
> > >  fs/xfs/xfs_inode.c  | 23 +++++------------------
> > >  fs/xfs/xfs_inode.h  |  2 +-
> > >  include/linux/dax.h | 21 +++++++++++++++++++++
> > >  mm/madvise.c        |  8 ++++----
> > >  7 files changed, 70 insertions(+), 56 deletions(-)
> > > 
> > > diff --git a/fs/dax.c b/fs/dax.c
> > > index d010c10..9c3bd07 100644
> > > --- a/fs/dax.c
> > > +++ b/fs/dax.c
> > > @@ -845,6 +845,39 @@ int dax_delete_mapping_entry(struct address_space *mapping, pgoff_t index)
> > >  	return ret;
> > >  }
> > >  
> > > +static int wait_page_idle(struct page *page,
> > > +			void (cb)(struct inode *),
> > > +			struct inode *inode)
> > > +{
> > > +	return ___wait_var_event(page, page_ref_count(page) == 1,
> > > +				TASK_INTERRUPTIBLE, 0, 0, cb(inode));
> > > +}
> > > +
> > > +/*
> > > + * Unmaps the inode and waits for any DMA to complete prior to deleting the
> > > + * DAX mapping entries for the range.
> > > + */
> > > +int dax_break_mapping(struct inode *inode, loff_t start, loff_t end,
> > > +		void (cb)(struct inode *))
> > > +{
> > > +	struct page *page;
> > > +	int error;
> > > +
> > > +	if (!dax_mapping(inode->i_mapping))
> > > +		return 0;
> > > +
> > > +	do {
> > > +		page = dax_layout_busy_page_range(inode->i_mapping, start, end);
> > > +		if (!page)
> > > +			break;
> > > +
> > > +		error = wait_page_idle(page, cb, inode);
> > 
> > This implementations removes logic around @retry found in the XFS and
> > FUSE implementations, I think that is a mistake, and EXT4 has
> > apparently been broken in this regard.
> 
> I think both implementations are equivalent though, just that the XFS/FUSE ones are
> spread across two functions with the retry happening in the outer function
> whilst the EXT4 implementation is implemented in a single function with a do/
> while loop.
> 
> Both exit early if dax_layout_busy_page() doesn't find a DMA-busy page, and
> both call dax_layout_busy_page() a second time after waiting on a page to become
> idle. So I don't think anything is broken here, unless I've missed something.

Nope, you're right. I crossed my eyes flipping between FUSE/XFS and EXT4.

> 
> > wait_page_idle() returns after @page is idle, but that does not mean
> > @inode is DMA idle. After one found page from
> > dax_layout_busy_page_range() is waited upon a new call to
> > dax_break_mapping() needs to made to check if another DMA started, or if
> > there were originally more pages active.
> > 
> > > +	} while (error == 0);
> > > +
> > > +	return error;
> > 
> > Surprised that the compiler does not warn about an uninitialized
> > variable here?
> 
> So am I. Turns out this is built with -Wno-maybe-uninitialized and it's not
> certain error is used uninitialized because we may bail early if this is not a
> dax_mapping. So it's only maybe used uninitialized which isn't warned about.

Looks like smatch just caught it.

