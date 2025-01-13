Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5B7C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 23:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJt70HYLmkyoPm8Mjsft1q2AwGWloV7NENJoQQTLMkE=; b=i4uUcjYH7z94gzeAX3MtZPLtDx
	GyhZg28CxFlKeEDa+SQ7Ccr7nF/J6sm7+eBSbGbAJ9FD1C8QGIQDXW0l4qUL5a2PKGROlgt0YCisu
	t2Gjpx2ogG7owEj7XVjJCps1buJLo4uKJB/xJRmphoBFjR0H7pCNB3sT7iPgc9R4aWU8WCy3RvcB6
	/nOuwA0Z1Sd6j6aMQ0DHHVheKw8bALW+AIEAej0a/zWcLvTqqRdPA22zzegZx47XdFPTM0dco+ZrB
	iKz0lWKJOzTsVF1daEdFTz683i4Buy4OwXeySDSjPhgNglyhC/JnWsj+Licbb9X8Q2AwxOl6oYCUg
	/FVbFstQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXU6M-00000006yRa-01yM;
	Mon, 13 Jan 2025 23:44:10 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXU56-00000006yDP-2IEO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 23:42:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736811772; x=1768347772;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=6U2Kiz8UDreRWjlsqRKEwKL9eXTDkcXzIaetCpXU5pg=;
  b=R0Oj3lSd3W7yYJ0QFe/WZlw6XJCPo9M5/QBaDIC7RDft4harU2kEUBdP
   njiduWHx9uOzWuzUiHDN9lt38JYAJVK9MsPg8ROg/6gVtVhEXDSB5qSkc
   9tmhFD2uKK3+2n+MWBHezO3mBXwyDDw59V2seNnlVRS6IeMsoWVjt/6MV
   c9g1Vi968cS896pVBa4RqEF5wh2Yn43SzqvW2y7DeTqtfJ9KUHpb9CDpi
   +eIg09zEwTpB0UTG3Wp6ZwbBvYze6lGFaYi37Iqs5b0TFnzE7Byt/m/q5
   qkO2trq/Ef4iAr6LF3EXTCo2rs4zJtxgiYOGnI66W+D9fG2A7kjAuG92n
   w==;
X-CSE-ConnectionGUID: NZeCUNLsQ36IL/WvqCwsXg==
X-CSE-MsgGUID: hQZuqUKeTD2rhQ9tDnMwcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48506330"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="48506330"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 15:42:50 -0800
X-CSE-ConnectionGUID: 7Kay4xcESxWbGbTdxhr9HA==
X-CSE-MsgGUID: KTNrm/tTTtSgJXM4aSquNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; 
   d="scan'208";a="105195891"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Jan 2025 15:42:49 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 15:42:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 15:42:48 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 15:42:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pRD/JOJK7VpJa60Fwq8YFG7DDWrHenXcfS0sIpKYqCDm9+fghSTgW6DkqqeMi6cpHlOsD2oWkmhv6a9we93icGCak8frUaaRyO2GHenKNfYQ1pat8IQE0PSker8TZdTpz577eAKNeuXM7vJa/yaIdVYogegqjNG3K4l81oTGHtboS9O37vQ6MzPmBVHh1HJk97WfsFQJZZREU3zGHZ60YRjYamHehr3rrQ30fRFv9pLGFhUa0oBMGS/MMbImxDVbMzuhrfQM0jJAFmFqVBPS2+6r7UDCHTzIph4IzKlFOJG6ges1v4GUH7hpbnS2gZ1Q+PyMoAJI1w1/64wriD47GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJt70HYLmkyoPm8Mjsft1q2AwGWloV7NENJoQQTLMkE=;
 b=xzctCQ3eCINXjR7gi35em0eNeJX4J3yytwFeGykIaCSHegN+HEw2yqeVZgbBrZmR+ZtrX/iAT0APHpG7a6/kXBVePDp9Pr3WvQPBP/BxaNp5sRPSxWVjk7uO794hg32z98HDUFOz0eLFOv5fq8m9jKoONNG8UdGFBZWZwPlpZkb0xtMYKiswMPbMb0OKp8N3xD3Ss1K51UAPpHxfVP1M4s98jO6K2LgVUOVoK4v82mW39yRATXYRjPo4reUlt2aCinMHqg1vckKQ+vZcZa0ee9R/3LnxAAhgiJ3iHiah27RX7Byw3r+KcHZHKbcsuK9bFc21jXlFm/PKRMAS2U0ZAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH7PR11MB5982.namprd11.prod.outlook.com (2603:10b6:510:1e1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 23:42:44 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%5]) with mapi id 15.20.8335.011; Mon, 13 Jan 2025
 23:42:44 +0000
Date: Mon, 13 Jan 2025 15:42:39 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Alistair Popple <apopple@nvidia.com>, <akpm@linux-foundation.org>,
	<dan.j.williams@intel.com>, <linux-mm@kvack.org>
CC: <alison.schofield@intel.com>, Alistair Popple <apopple@nvidia.com>,
	<lina@asahilina.net>, <zhang.lyra@gmail.com>,
	<gerald.schaefer@linux.ibm.com>, <vishal.l.verma@intel.com>,
	<dave.jiang@intel.com>, <logang@deltatee.com>, <bhelgaas@google.com>,
	<jack@suse.cz>, <jgg@ziepe.ca>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <dave.hansen@linux.intel.com>,
	<ira.weiny@intel.com>, <willy@infradead.org>, <djwong@kernel.org>,
	<tytso@mit.edu>, <linmiaohe@huawei.com>, <david@redhat.com>,
	<peterx@redhat.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxppc-dev@lists.ozlabs.org>, <nvdimm@lists.linux.dev>,
	<linux-cxl@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	<linux-ext4@vger.kernel.org>, <linux-xfs@vger.kernel.org>,
	<jhubbard@nvidia.com>, <hch@lst.de>, <david@fromorbit.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <loongarch@lists.linux.dev>
Subject: Re: [PATCH v6 07/26] fs/dax: Ensure all pages are idle prior to
 filesystem unmount
Message-ID: <6785a4ef988a9_20fa294d4@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <704662ae360abeb777ed00efc6f8f232a79ae4ff.1736488799.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <704662ae360abeb777ed00efc6f8f232a79ae4ff.1736488799.git-series.apopple@nvidia.com>
X-ClientProxiedBy: MW4PR02CA0017.namprd02.prod.outlook.com
 (2603:10b6:303:16d::24) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH7PR11MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: f076b62e-0fd6-49d6-014c-08dd342bfa02
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hjsnFPeBDgK3lJDqDJR0rXOSJ6OWH2dMwbVl1M7Jk7fevE6qzIMoZ5GOgwNH?=
 =?us-ascii?Q?yW6aVlsK1OSg7qQ98xI6Xp2kd4ukRN5t1g5NfuLYfx3wC8Epz/TlXr31ER7O?=
 =?us-ascii?Q?ToQeQgHGjxMgu4Nr+HiSSNXC1nVU8GlN+15KH7nRcWT/IuA25YBWWx8aaUqy?=
 =?us-ascii?Q?gk7RWhndufW2Qt9W7gssjn+MTLMu+siJL93R00rpNzVdpDEmlO2MD13iDcV1?=
 =?us-ascii?Q?s7MGaKiCAtE0RZTreLO2VVFK4N8r9KXXjTSAZtpIIxgGAUEUTLnDCYvFdUbk?=
 =?us-ascii?Q?1PdRNK6ll6SdoU3KdmGdqe5rCPkA4vEltLs+vQw3XNRNKs1jDpftsz0vmuRY?=
 =?us-ascii?Q?VCULJ7Uk7x9n0l8XFeqat3VqOkKKqMMsIBTC5nJTbe0nN33qEx2NCevN81yx?=
 =?us-ascii?Q?iYEw4XIKSic1G1OtPZRaRexSlcKGdkKxeIw6Tr7Olzk1K/SBknEwVnVUAIsh?=
 =?us-ascii?Q?S8vmljP4B2OmsapwJAPKWU8aiLjE6fKWPmeksw3mUESh6zp0+IoqJJY+44wM?=
 =?us-ascii?Q?iVm0we5BgC6TK0dP3aVo2U20QZ/te17GnxmqrLIh13A7U8P/YDktQ7MlZvG9?=
 =?us-ascii?Q?kdh2NZZFPoZe9E2synPPDyUKyb1WGwe68xjXJrxREBdoQ10C7rMrVbokA9SU?=
 =?us-ascii?Q?UZVi5F47BVtwsTG7uJkjeXSxJHm4URwg0ADY+iUdIYTkoFXkoqeTzUuUv4cT?=
 =?us-ascii?Q?O6lLpcMhYbKVfTRObzDwtDP7aO7iEDEvp0hd6c/RKYo+ze6bGOrg9sQ8Zejb?=
 =?us-ascii?Q?L/YI3DBWue8b6u8xXf+WyGSRw7NujyvBNIzJ+NtLOkX5rVojopX0TYwbJiB3?=
 =?us-ascii?Q?HtfU8iyaQOmn+dVZGWjA+kZX74tEGJNIgiLRl1QbLNokbSh0XtJJPURY8YE1?=
 =?us-ascii?Q?Kur2ZLghAW9628IMTAW2chKQBL2EBM4VNDOOcO4ZHxFmCMOfCs6GDje+wv+7?=
 =?us-ascii?Q?lsFc5CkcrL/P2FU715AT7ZGk4U5kTjjEJgEPLIP1L6o6pELj0CNNATs2ZUQf?=
 =?us-ascii?Q?JJngYvL9IYcIAhZ9X6799AScFmjdt9SAbYlAf+41ycelHDgat1veLfdoDkbc?=
 =?us-ascii?Q?0urHvKPmW/VaV+Ep8ZSPK9QdDldA5mU4w+PXJ3F9OhM4a+a5znPtfbZ+FEdN?=
 =?us-ascii?Q?7Mmc3UoU5fRsaWZq/sss0Z4aTFUKeRJgJMNxIgM9deGihhhhQEc8uh1kAPsD?=
 =?us-ascii?Q?Al/se1tfdrmvlpPUEyy0fcVDkCxsyGJwBdprBSJs3tThDpSVLJU2VmXvBWph?=
 =?us-ascii?Q?4lObqbjG4T7vvcE1DGlaW+18bsGuZ9QquEvWfXhLBHYGBSqLF9P1P5Ru9hVS?=
 =?us-ascii?Q?khJjYQPQHY4JnrIWMZvcTSScoc+INpiYvJkvt3teRIJ6xo+DYXHwGTwhEBpq?=
 =?us-ascii?Q?TRxVGwnb5CqgAHKxyjSFeLfryto7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NaE0GIdJU4HC8JCyt98il/hqiwcY6p7YOrRoXTD9NBDGuRQzY/Thb06J0/wM?=
 =?us-ascii?Q?s/4va1SteFjyT3fq5rLOsL33WCQdrzMjm+ZALqhHC/PwIq8WiGWn/sliboTG?=
 =?us-ascii?Q?LY8w/+OAZrd+zTRMf41praitxdBwtqcu7we+ffoQlpZj24HcPLdSAO7y9tbT?=
 =?us-ascii?Q?3YXxICg/rw3wgpqTtdRbPU4Yp9Yua70qflBt+n/tpSj5yG+4N5xB+zmbiUjG?=
 =?us-ascii?Q?YZksJf82EfB++ylfWmy66jzqclNIHELLw0zXLjtdxXgiv4eK2aHrXyYMpvCg?=
 =?us-ascii?Q?KzPqzgdKrEk0WAdo5JzSPszANp/amoJ2Y5gedUUjCEX4Pekagg/eNOm064bd?=
 =?us-ascii?Q?RWmjuOsN/JqAKEsx7soAMPpewGAnBRrEarS3NY1iwy3/S3GEq5X6h7VaCfCv?=
 =?us-ascii?Q?ZcO8BZhAVA012nDRePg135WLL0lp0fSBQADkX88W4RIWi+0x9hpbq9HrC88Q?=
 =?us-ascii?Q?T3EtjA02d33O0ygqWGSpvho9G5r8LRtoohW49rU7e8hPOC7j5bHBvW3la3SC?=
 =?us-ascii?Q?hH4VyvHgojClePm7sJEzUvrsxyz3vucG3vjdVdnbmg9xPzI/VuPPKfluOP29?=
 =?us-ascii?Q?iWpY9qSopWvlZPJZRpU5sFuHtx8CyzIrJiEnPfs2mFEoJaKQPdwpxlfToAn7?=
 =?us-ascii?Q?vEW5fPtrT37WHbNrtTgQ0koRTrq2wEp3AWs1RVjfOXKqIm9fDmzKJjU2x8Oi?=
 =?us-ascii?Q?/VHwVNY0oe50ckC82fA3ZHpeoNT5uSP1VTehBYCJO97DM4mF6TNzDdoykPn2?=
 =?us-ascii?Q?XlU1/VnLHssuiVjBovnUxW0OgN9oxbnVEI85xKePYvitqklUQGB8UVTApCdQ?=
 =?us-ascii?Q?OFxpOnSmo5VJb0qwJUBQ8TTvFflNV4LHRMSt5DpKCMZs5Ns250yCjVAEegPr?=
 =?us-ascii?Q?tc4a7VbhLVPqGkFVmuNycJRqlNkzximvJgjyTVav26PchIfz8xEKMuV29lcs?=
 =?us-ascii?Q?KkZqjGOpWUaIk1EjmnBozE3RveV4CY9GylTvI/mlTj8QO4yKek8YO3jN5VIg?=
 =?us-ascii?Q?KbjA81QX2yw771EV/gCIVfq2k2T5drqM1S0yOmmKKOWEhug9rk9XqsEB5bZ9?=
 =?us-ascii?Q?RljbskpqKdUNfVi7jqj65u6Qz8aianq0qHjVJks6D3qhFRvJwM1qans8aMaJ?=
 =?us-ascii?Q?La3ihwDzVRMTVn2ZqrNgAgIaodOA3E5oFCfwaJVagP/FwL7b6amHIohFMlUT?=
 =?us-ascii?Q?PSLn1KczKM1eTZWfuHyV+iX361W19LzorNw0aErAL/hhFiGSU2V0/CxbCXIg?=
 =?us-ascii?Q?nMomkGjsuGBPtQa4lkAAXs7xVX38jdq0oTUrhWAVi8H1BKT81fQV+CmR9FlR?=
 =?us-ascii?Q?yRRbZ8xW8j4oKMTEoT8LhuKGk8kSH8reWfhGtk9E2r3p/zBUN9yAi1SyHf08?=
 =?us-ascii?Q?RRK+ZtX0hMQk5QNNOkLhTUxKHk8vIVQ3n1y1lFwm7kI/1vjuPHWl+azOcGGr?=
 =?us-ascii?Q?euauXVgnQCKtYNCpwybhSv9GR1Sy5O6FX2bpw7FAx4TFD5FhaCEfm9377G9N?=
 =?us-ascii?Q?dt4Dq1E9UBQb/Hk1e8jvmGqHQQt5peZxddhHmw1HCyVdzWKpiQ5arNJeRW25?=
 =?us-ascii?Q?0EtVen5Scq3H+euNZm6o5RzStM246J5/qCgdPex+a7AGEy8zQsCRW9eAac+J?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f076b62e-0fd6-49d6-014c-08dd342bfa02
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 23:42:44.0675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: koOztr/0bQNiw0htfoM1zY0BJiffGhWwFRnCytNewfv4cJMrgijk7YmKbVo4sQ09Vfve/nPTxXfPy8OCQvqXT4U34SVQ25Iu6f7aI07j02A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5982
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_154252_604988_2F729494 
X-CRM114-Status: GOOD (  26.35  )
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
> File systems call dax_break_mapping() prior to reallocating file
> system blocks to ensure the page is not undergoing any DMA or other
> accesses. Generally this is needed when a file is truncated to ensure
> that if a block is reallocated nothing is writing to it. However
> filesystems currently don't call this when an FS DAX inode is evicted.
> 
> This can cause problems when the file system is unmounted as a page
> can continue to be under going DMA or other remote access after
> unmount. This means if the file system is remounted any truncate or
> other operation which requires the underlying file system block to be
> freed will not wait for the remote access to complete. Therefore a
> busy block may be reallocated to a new file leading to corruption.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> 
> ---
> 
> Changes for v5:
> 
>  - Don't wait for pages to be idle in non-DAX mappings
> ---
>  fs/dax.c            | 29 +++++++++++++++++++++++++++++
>  fs/ext4/inode.c     | 32 ++++++++++++++------------------
>  fs/xfs/xfs_inode.c  |  9 +++++++++
>  fs/xfs/xfs_inode.h  |  1 +
>  fs/xfs/xfs_super.c  | 18 ++++++++++++++++++
>  include/linux/dax.h |  2 ++
>  6 files changed, 73 insertions(+), 18 deletions(-)
> 
> diff --git a/fs/dax.c b/fs/dax.c
> index 7008a73..4e49cc4 100644
> --- a/fs/dax.c
> +++ b/fs/dax.c
> @@ -883,6 +883,14 @@ static int wait_page_idle(struct page *page,
>  				TASK_INTERRUPTIBLE, 0, 0, cb(inode));
>  }
>  
> +static void wait_page_idle_uninterruptible(struct page *page,
> +					void (cb)(struct inode *),
> +					struct inode *inode)
> +{
> +	___wait_var_event(page, page_ref_count(page) == 1,
> +			TASK_UNINTERRUPTIBLE, 0, 0, cb(inode));
> +}
> +
>  /*
>   * Unmaps the inode and waits for any DMA to complete prior to deleting the
>   * DAX mapping entries for the range.
> @@ -911,6 +919,27 @@ int dax_break_mapping(struct inode *inode, loff_t start, loff_t end,
>  }
>  EXPORT_SYMBOL_GPL(dax_break_mapping);
>  
> +void dax_break_mapping_uninterruptible(struct inode *inode,
> +				void (cb)(struct inode *))
> +{
> +	struct page *page;
> +
> +	if (!dax_mapping(inode->i_mapping))
> +		return;
> +
> +	do {
> +		page = dax_layout_busy_page_range(inode->i_mapping, 0,
> +						LLONG_MAX);
> +		if (!page)
> +			break;
> +
> +		wait_page_idle_uninterruptible(page, cb, inode);
> +	} while (true);
> +
> +	dax_delete_mapping_range(inode->i_mapping, 0, LLONG_MAX);
> +}
> +EXPORT_SYMBOL_GPL(dax_break_mapping_uninterruptible);

Riffing off of Darrick's feedback, how about call this
dax_break_layout_final()?


