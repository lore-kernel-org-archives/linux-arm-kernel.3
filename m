Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FF6D0BB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 15:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/757xuSeUezZBNuGYR1yhuIX6U/wlk+V3lXTLndv7M4=; b=tmm5VHgzBGUswSOMyYvVkpkfcH
	aclrmrAvCC/db0hprfu1aXFjA2Uioj9qi/S0L6RbTMMXAjyT/ISlRv+FHcXuVVUxTF9VxQvYVOdme
	zZKbTJ+/rMAtYpfIbAWyGZBpy0UaNKqwTcZZoS3g/IUZ6UT1Sbs6OU46eOQ8qsj9JVL5OIVbyuQMX
	w+qigyV53EMBxfmDRGBJD2+ktWugJ1ah15p1dkOTJ9dpjfkry5DWuin1CKDc3+1a5SptqRCYYPkSi
	mWbqvPFs2uRMH3Tp0WskacVlVU3zGSB06zsPtGov2JoKih0CLsqafYOVaLhSqjdXl/M17NM+bNXWe
	t2BRvf+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MQX-00000004HgJ-2SVU;
	Fri, 25 Oct 2024 15:40:37 +0000
Received: from mail-bn8nam04on20622.outbound.protection.outlook.com ([2a01:111:f403:2408::622] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MAq-00000004ETA-306z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 15:24:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hkr4Qz/x7VI4h9zW6uFtYVfn0OI90rTbuBuXDfy+J2fjtPhZ2CXkhXSVyEZsVXt5X/S9Ty9D4gCPiZapFt57fe5DmRCEWAUgzZY1twuqQSyGBlJD7zuKM9b3EzaJOdpgAyyG0GYogwhIvgZgbu3WY5F/WC1wu11jw8Rw8CGXiGEy4GTNj87DdZdIfAUjDs8+pPFEgK6K7/g6AlfEIdCZkB5Uodx8aKzUAdRs5PxuJp4WY6Y5fFhdiIU1fpjRBohl7TPcSAlABbEvjA6GmY6N8gYz62nhwb7YQKFc7jXDG+wvAzfshuzvE8b1n5tI2jFdZ06NFkuL1z8eU8ROcA91yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/757xuSeUezZBNuGYR1yhuIX6U/wlk+V3lXTLndv7M4=;
 b=SVpC7HagnvPtFFu1H/fTQIXSPb8L6gjmXNyyL/NbIzLSV1NPghI4jX7gonT7v72DLTcOY3/zMwjLYTJ+9KmogBngiQ6E2EtGadUmRA1wGdrK9dLZxBDTM2/KBfo85wYAdngGQVhyzo5P0FQu6XBBcWBaWtDgAil4ihQUblPvUOaV0d3HLTPIpVl5PtR5VU9Eg/cCGATfJXIPEPycSKGi0n9lat8MfPZ2tXFtREIH48HT96PmDesocSabtc3CxgS3cRkeIhvuTTO75bfqoi/4tJBa8eQPmXe57tqTglHFL9k1o9928HGz7VihUSXUiKGSOVeTiHVOc9hPowIuELFgmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/757xuSeUezZBNuGYR1yhuIX6U/wlk+V3lXTLndv7M4=;
 b=iRV5fcFKQOwgyvkBxxXmvXhnY/ZosIworjnnHoiGOBdEujYEKgOJ00CtC/BdgVDoOMbYu3BUbQkrmbtY2jPPONz8C2BD7WTcdiZ0h4oBuqwGUbLvDN65EUTFVZU4SVqMaw6TSZuv5U5fx2qTMsUaSBbP6vMO5syo7hVbQEWUSxC23Y/F+jbznr/3RdsGempdhI6oQvlG1qMVPGEfBjRbtqIHTzAJe3/X6FTdnK3nQuGVYhIKc7YRfXJsPLSYqZA46aeSPWp7EqINmDjWnc5m+0byFbT//BCj19/SL/g/5JFWyHdEC8Yf2wgL4O0hx1PmTe1BRZ23nr3wqJpno9SR8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by PH0PR12MB7959.namprd12.prod.outlook.com (2603:10b6:510:282::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 25 Oct
 2024 15:24:18 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 15:24:18 +0000
Date: Fri, 25 Oct 2024 12:24:11 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Baolu Lu <baolu.lu@linux.intel.com>, Nicolin Chen <nicolinc@nvidia.com>,
	"will@kernel.org" <will@kernel.org>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	"mdf@kernel.org" <mdf@kernel.org>,
	"mshavit@google.com" <mshavit@google.com>,
	"shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
	"smostafa@google.com" <smostafa@google.com>,
	"Liu, Yi L" <yi.l.liu@intel.com>, "aik@amd.com" <aik@amd.com>,
	"zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
	"patches@lists.linux.dev" <patches@lists.linux.dev>
Subject: Re: [PATCH v4 02/11] iommufd: Introduce IOMMUFD_OBJ_VIOMMU and its
 related struct
Message-ID: <20241025152411.GH6956@nvidia.com>
References: <cover.1729553811.git.nicolinc@nvidia.com>
 <74fec8c38a7d568bd88beba9082b4a5a4bc2046f.1729553811.git.nicolinc@nvidia.com>
 <b2c75705-2998-4e51-90f4-00b8bab785f5@linux.intel.com>
 <ZxcspVGPBmABjUPu@nvidia.com>
 <dd7eb37f-13c6-4c6e-8adc-954ad9974b93@linux.intel.com>
 <20241022131554.GF13034@nvidia.com>
 <BN9PR11MB527637A495A46F32F722FB9C8C4F2@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BN9PR11MB527637A495A46F32F722FB9C8C4F2@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: BN8PR15CA0016.namprd15.prod.outlook.com
 (2603:10b6:408:c0::29) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|PH0PR12MB7959:EE_
X-MS-Office365-Filtering-Correlation-Id: 3225a4df-1973-4feb-884c-08dcf50917c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkRCck52REhjSDFHQTBUTzZMQzY2QW9RVHpPZkNEVW8wRFZpYVhSWEYyQ0lS?=
 =?utf-8?B?S3ZVVUJ3bXRlSWF2c1J5aHU4d0w3S01aSU1RUlJRSitmZ0VRZmcwWmhlekJZ?=
 =?utf-8?B?aG5HL0N3WnE4WU5PUnBtampPNDBjeHZqUXVMdXFqaTZiYkV2dFdhN2RHT2cr?=
 =?utf-8?B?TFNmK0RSb0RrT3NPSTUwKzV3OHRTaS96WTNXY1dKY0VaTzhMRnFEemNnYVVM?=
 =?utf-8?B?dlRIaTZTMlJ3MDREMWMyaXE3dGhMOTl4T0NIeXFBQmZUakF5YndSY2sxRk5E?=
 =?utf-8?B?eGVyWGpIa3poSm0rRE1Ea0EwV09hbld6TThJdTV3VG5WL0hTY3AwdnNlMi9N?=
 =?utf-8?B?UFU2RFhkL01JZXd5K2MzUTJPTWJjUVJCM3A4TjFyWUNOaytDY0NncGsyN1RW?=
 =?utf-8?B?aE9tczdLN1FqdEs3dlc1cVpCbnVLNU5RQjZKZDZzUmZvOFhiOVhIYlExYUVp?=
 =?utf-8?B?b01NYUpyT1ZsbkVuWjFBRVc3TURpQjZTbFdNeWV3YkNTUzhPbGlnS2Zrcjhm?=
 =?utf-8?B?SGMzdHNrRkhtS0toREw0NWhPV0ZYK3JLbHZqWVlUOE9Yb0pwVzFBQnp1aTJa?=
 =?utf-8?B?eWlRVGg1ekZJeC9XNzE0SDl1eHpaeE11M1ErYlpEdm50bXRyRW16RVlBS0lm?=
 =?utf-8?B?b3Z2RkwzOE1XL0tYT094ZFkxUHgrR3V3OE5oY1lFRlEwZFRYakJIS1JhT2Zq?=
 =?utf-8?B?UCtPTHoxSUJ5ZDZsdXVXaHZyODRSUCtKMFFwd3ZDd1E2M21ublhzUkwrTVlN?=
 =?utf-8?B?TTN4TldCRDZpZzdvTnhzUGUxK3NZTkF2Mll6MlBhQTBHK1JzNDNZb3JKYzFn?=
 =?utf-8?B?WE0rYnlvVmM1NU13QjZ0cEJ6ZzN0VTU5RHVKVVF2L0txS0gzY2NXTGJzemEw?=
 =?utf-8?B?UmFLajloZUQ5cTVWYXRWaWxlUUk4N1BJRkVQR2hvbGl5bWV6U0srYkl1Wkts?=
 =?utf-8?B?Y3VobWZIK09DT3RuL3I1Tzlid1Z0SzVoc3VXVEJLR0k0d0Nwd0lUb2QvbWdj?=
 =?utf-8?B?eDZVV3B6WkFWQ1dGcThxSFVqR3BlRVpvUC84ckgyM25scDQ4MVlOdmhyVjds?=
 =?utf-8?B?YjR5MmlheEZqTlplOHBPRkl6UithQVZYNGF0MU9mV3VqQ2NxbE1UNmxkcDNC?=
 =?utf-8?B?dDU1aWp0ellhV1dJUkxlb3lJRmRUWFJzYkJaT1VzdnpkMVBOK083aHhwazhZ?=
 =?utf-8?B?TzNXMmNsWE42UnJhSEZhWkhVQnVsMllzbnhKaFRzLzRjVVk5a3k3bExVbzh4?=
 =?utf-8?B?cEZUVjN3ZzRESkhBVUhsdVhCanBQcWl3Z3J3bXIvNy9lem1qYmJKOHRlSG4y?=
 =?utf-8?B?SmZNSGtHVWk2S29LbnpkRTYxS1F2djd5MUQ1RTI3bldzK0sxMkRwSkFoelZk?=
 =?utf-8?B?T3l4eFR6UTdaUnA5Yk9IQ1c5a3YraVJMaSs3bzcvZXUyZVIzaWwwSEJZTFdn?=
 =?utf-8?B?aVZzVjdhSmhiYXVzMlBwa3huZEE5OUhwWG9uNklNcncyQUJmN1JVaUhjS1Zz?=
 =?utf-8?B?SEVkeGhiaFk4bGZRUHhTeUVCcXd4OTFBTGwraHBRRDVnZWVVYlgzbG5ZaHcr?=
 =?utf-8?B?eGRDcEJYZFRhakRnL05CMzBTbUlzd292RkllWjlXNTFLellhTFVGM1diN3ls?=
 =?utf-8?B?ZUVkT3V6aGRUdTJaeTBUblBsYVVaSnJJdzJpOFRZaXFWaGMvTy9vNUZuVTN3?=
 =?utf-8?B?dVo1V3lXRU13RG94L3hmMjBwUm1EWGxXaTMwSkNmallQRWdFTldZcDhRaCtv?=
 =?utf-8?Q?mMEoOEPP5cl/XeFkbwZpdwXx3SiVBi90xZwtbYo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uml3REZTc1lwSjR3TGY3dm5WU29BeVVaM01SKzY1WHlOdW04OE5MTkEyR0hm?=
 =?utf-8?B?Q0grVHlFai9NREpja1JWdm9GWDgyL3ZsenhzZmgvdlFpNUNzS0pNclJTNmds?=
 =?utf-8?B?L1pZc1RzeFFlcFlhNXpSSzdvOWJETHJLOVA4aThENjU5YldTSEJoVyt3UzNX?=
 =?utf-8?B?ZjM2K1YyeHFnTkJFY3gvaVdIaGJBNmRpTkVWRlJTNGdNSEEvQjJOaHZjUDQ3?=
 =?utf-8?B?a3k2Z1NxUXZJZ1o0NGdkSE5XWGVxRDRKUGozTURDS28zYm1SK3R6WnRqRWVr?=
 =?utf-8?B?d1RPYXBxL1h1U3ZoT1dFYmp6M25DOXFEaXVqVmhXL1lwQVAvTGswWFptTkxQ?=
 =?utf-8?B?SEN6MFhNWkFMOU5wQ1ovZm9NZXk4TnpyaWhyU2dZWXR6cUYwQWdsaGFpT3cw?=
 =?utf-8?B?T016Y1pqb2FHV2x0bldYZUZieEFSZXZ4M3RpY1ZTYlpwdGRBam95UkVJL2Fp?=
 =?utf-8?B?OXZ6aWJ4bGVReWdEVmg2UWFHcVdacXlHY0NMZzc0czdiM0dVbFM3akZobEQ2?=
 =?utf-8?B?RExYbFJGTENNaFRCMXNQVVJTbm55MkhjdUdVTXFEUHBWMlI0OW9RQ3lnY1FK?=
 =?utf-8?B?cUlmL09NeUNTQllaYUdWTFVvNCtkSHR6TU9yZTdUWUVpdkdwSU9DbG1aME9E?=
 =?utf-8?B?VmNRMkRQWnVwZkRob2lTMHYrVDNpaDQ2NE9kdFBsU3pYdllBcDRXTlIrWjU1?=
 =?utf-8?B?K1IzNFNVTTFTaU5JVmg3N1RrajFiN3F0UkJtbnU4bHA4SGRJamZuYzZFNkRs?=
 =?utf-8?B?a3pvSjlkVWpUTDQ2MTgzUUVvUWdZS1B4cER1TTEwdHYyMFo1UXo1Ny9MaVhh?=
 =?utf-8?B?dmowek9mYUE0Nit5cmJZR0tMZzh2U05jVSsrY282YnR6ajYyOHRWTk5BTHBt?=
 =?utf-8?B?M29STkF4ZmhmSGJpVDZsWG12dnpTRXdBcFhISnVTQklVOUdac1F0am9nelZ2?=
 =?utf-8?B?TitJSnZiZVRTN1ZNQlNZNXNRT25YdElqcEtYekRVNVFUZ1BTZyt5ZUJpSXBT?=
 =?utf-8?B?Z3FnZXFDOUtVUlFEaUlUaVYrZVBwK256OThSdk1QbWdFSmtNa3NsRzA1V1Rw?=
 =?utf-8?B?QmtJRnNubU1qZzBOQ2FtM3JjUldPUVhXaUFyU2ROdXBLbDBnMFZTWDRuMnJT?=
 =?utf-8?B?eWxvRnNLcEo1bGJqVFBZRlhyQVlNTHJ1WVVhT0x2Q0tLNTBaOFNuZnpLeTht?=
 =?utf-8?B?eWpXbCtMUVI5NFNJUG9LRGEydGFnYlFZczU0ay9YUVljMUFJVXJnalgvdTNV?=
 =?utf-8?B?MjR0OGs0eTRNQTZKdm1nNjJ4WFdZL0ZOR1RFdVBJLzFtVElMOUhqcG1jMlh4?=
 =?utf-8?B?ZzFuUkNzYlA5cVZMenRKTXVUUTlsUkhzVEh4NTRWY1FTNU8vQ0V3ZkRPMGJh?=
 =?utf-8?B?Yjd6T1cySTBEakkyWldQKy9odUlBT0JRSWtnd1Y4YWY2cC9uMlMxVEdka3Z3?=
 =?utf-8?B?RU1hcmtoRTlLRXZuUCtaZ3hIUmpBejNpNXNySVRQVTVOWjJhWnpsY3JieUpi?=
 =?utf-8?B?V29uQkkwK2lydXhqU1hxMWs3aEJ5cThhTmdPODdNdG1YZnlRNEtzc2lPVmNQ?=
 =?utf-8?B?NUVYbVVqZmRYNzZGbDhEMUw5eHJ0RzFKZmxMZzczN0g3eEJkVkxGdW5CeU5h?=
 =?utf-8?B?U3FHK2hYYWV4TE9FVnp0L0VKbmIvcTlVUGxYdHFIbE1HNTRibGRROXR4Qm1r?=
 =?utf-8?B?QXJqNWVvL0dabXRwT0tZcVN3VUNSUUdzZHcwYlNHWmF2alpWeEM0NEdQbytP?=
 =?utf-8?B?N2Z5TWxEdXR6RUZSZjdnMHg3QktPeGh3b1FONHVENXZWc1drSDJnc2Z6dmxU?=
 =?utf-8?B?dnd0b3pmNHBuUTNSS1piRjhicDJweEV5Skc3ZjZhU1JpbmsrZHNwSDZIMUtC?=
 =?utf-8?B?YjM3aVRlS0xFSlNsYmlvcEkyY3hSNCt0TzNtOHYvelRaeFkzZU4yWFZHVElC?=
 =?utf-8?B?RDhtK0xDOXdibENxNUxLZjRXSXJLTEI0ZmoxSHF2RzFJR2FYVGNiR0R5b1dG?=
 =?utf-8?B?UHFQMWpWcElGZTFzZ2ZRVlNEcGd2MmpvcGlEK1J4ZGtJdFZYdk1vcjZpQncw?=
 =?utf-8?B?WXl0OS92QkNFdFZETlRlUWw1a1VqR0xQMXY1NVdxTkwrRHZvVk5IUlJRa0FS?=
 =?utf-8?Q?/oNFj9j4IGFaEXsJJ9i+Ug9Hi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3225a4df-1973-4feb-884c-08dcf50917c8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 15:24:18.4569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: etA0IOB7yRhKPoARRbEIkZ6nN3P6Zm6w2QJ9T5lVXub+Oq2/1vL+dBnZu7sOFIN+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7959
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_082424_860584_86564C0D 
X-CRM114-Status: GOOD (  26.00  )
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

On Fri, Oct 25, 2024 at 08:47:40AM +0000, Tian, Kevin wrote:
> > From: Jason Gunthorpe <jgg@nvidia.com>
> > Sent: Tuesday, October 22, 2024 9:16 PM
> > 
> > On Tue, Oct 22, 2024 at 04:59:07PM +0800, Baolu Lu wrote:
> > 
> > > Is it feasible to make vIOMMU object more generic, rather than strictly
> > > tying it to nested translation? For example, a normal paging domain that
> > > translates gPAs to hPAs could also have a vIOMMU object associated with
> > > it.
> > >
> > > While we can only support vIOMMU object allocation uAPI for S2 paging
> > > domains in the context of this series, we could consider leaving the
> > > option open to associate a vIOMMU object with other normal paging
> > > domains that are not a nested parent?
> > 
> > Why? The nested parent flavour of the domain is basically free to
> > create, what reason would be to not do that?
> > 
> > If the HW doesn't support it, then does the HW really need/support a
> > VIOMMU?
> 
> Now it's agreed to build trusted I/O on top of this new vIOMMU object.
> format-wise probably it's free to assume that nested parent is supported
> on any new platform which will support trusted I/O. But I'm not sure
> all the conditions around allowing nested are same as for trusted I/O,
> e.g. for ARM nesting is allowed only for CANWBS/S2FWB. Are they
> always guaranteed in trusted I/O configuration?

ARM is a big ? what exactly will come, but I'm expecting that to be
resolved either with continued HW support or Linux will add the cache
flushing and relax the test.

> Baolu did raise a good open to confirm given it will be used beyond
> nesting. 😊

Even CC is "nesting", it is just nested with a fixed Identity S1 in
the baseline case. The S2 translation still exists and still has to be
consistent with whatever the secure world is doing.

So, my feeling is that the S2 nested domain is mandatory for the
viommu, especially for CC, it must exists. In the end there may be
more options than just a nested parent.

For instance if the CC design relies on the secure world sharing the
CPU and IOMMU page table we might need a new HWPT type to represent
that configuration.

From a uapi perspective we seem OK here as the hwpt input could be
anything. We might have to adjust some checks in the kernel someday.

Jason

