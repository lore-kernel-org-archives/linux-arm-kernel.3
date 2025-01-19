Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEABBC02183
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jan 2025 10:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHUAcWkuQyVwVUDj+ZDNrcLToRO2Lo4KPtywv4L2oZs=; b=IfCQDBrOstO94p36j5V2icd63K
	EiV4ZtWnTs8apP1BQcSng6qDmzaSzqm9J8SOIg9OyE55vqIBSvimXEcTR7PIEFc2KunUf2SQhbNMo
	peNa8YOi04U8hJzIJnvWX6jxDJwuqNCfnroBpGqYW82fQKO6IFI1KuCKo7d8Dr1LyTW8jTuqqjZDK
	f7lCwoVHh7DUbDrrhOaEeLR8B80NeKQGZW296Y4/N9d6/DPIArOs0N/nYDASkmlNZfW7wONZzXpBC
	fTC7vDjj0oLL61SkQkHGaLhWQb6DcL2VGNDtfEz8UpHKGq3Lb0UGdWA+ZLbM0jGZpMrMKexv469Iz
	Fb1+fDYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZShm-00000003jrj-0w2b;
	Sun, 19 Jan 2025 10:38:58 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZSfV-00000003jUb-2lDa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jan 2025 10:36:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737282998; x=1768818998;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ovsmfu3nhttcw6fIqp9IOLyA4QYdZZ0IU52Yx4sIKHc=;
  b=BBFxL27CQjBYGBqVhr3wvVBsEbcYc+GYTX/a5CtzZB2WCJVLmrQQne7L
   soC13nX4Bh59Q/5ATwqm0SvOKRHDdxlDUveapBjgQ/wGCe4fcOuerqAUO
   lltIJiS/izQlexKY/AYIiWky+y1dfErQCNUvrBEixIuBRGjFTh/FCgxcd
   ko6WezQo7TEotlcbCgDn/XWw4xzWhJmnbbimCa87foDmYmF3fZl9V8xY2
   u83OU/L1TkzcdSLWjBDqKsrMLJRp5lrk8G1RcCJviZBq5VI43W1aXMTY/
   FFAawv3FqWIYrhnEdRwsLUFuAfc7orhh8kodi8KfYa8hgnv31+YphhXzr
   Q==;
X-CSE-ConnectionGUID: 2AyP8yeETCObqHyR8bpnvA==
X-CSE-MsgGUID: kist+L22Q6+ycNXX5oim1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="48656970"
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; 
   d="scan'208";a="48656970"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 02:36:32 -0800
X-CSE-ConnectionGUID: AT8jfshBSbWIMOu5az/siQ==
X-CSE-MsgGUID: wyfoSVfjRWeL5KnXFoRXRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107105474"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Jan 2025 02:36:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 19 Jan 2025 02:36:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 19 Jan 2025 02:36:31 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 19 Jan 2025 02:36:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPSbTgpZzImvwjzjCT+ZUt/3AgcDSAJyG/4aGzVcIFH9P/00fiNApL4wGg5WhZjuKO9NDQwp1VzBzoVUYlQo8lABSVVRzUuKzZGHOtbRFhrPXzfwnLdGz6CZkW9iIYgUOG9mO0p1cDWzkXHJryepKZXV0JATOwNor6e63KswXWOfLp3OD1WRPFsusdiNvkRaDtmpoKNzfJGqRKcQh2Y+8SNMvbAulQR/ET8bcvRd6OcsBeBZYlkwsIv2Hqzh1165iWZFnxn9K81TbmRUOMuRMvjJ5GLMot4sAOyMhaJwe3CZCleB5A9DUAbxCHXeBeGWUXpb1WNa0D6oVsl7O8BREQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHUAcWkuQyVwVUDj+ZDNrcLToRO2Lo4KPtywv4L2oZs=;
 b=UU7lBtZYaKn4xhf/P3c2xD3g0tuqbMCSGVZXGL9clxmy3HhQ7takE0YHvMfCoKOVXFuRTN8eMrZxFQ4JRaBA9FWqQX2AcpwC+LXy7ZKwZ9F8CvVT8WkXobvdEZ4G7CQe4CpMMV5cnCqXCP4bTOnKaLV9AD8x65ukonIQaH1uhAswSDhUzo0lpfZlrlJ7sHLrDJcK6DDNMkoHLUlHdA6S6+o54u9rPzioEbCguN4KC5+6pHeM4ce8ruAbA6FejlF37uSphSx49AIzQ4y8UGHplzBGuVVpNZxw+LLKfVIIyGSqwKOs16uxSDHNiFllYFEwYAQuXXqaf8j3TYKZDMLZSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by DS0PR11MB7405.namprd11.prod.outlook.com (2603:10b6:8:134::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Sun, 19 Jan
 2025 10:35:47 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::d244:15cd:1060:941a]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::d244:15cd:1060:941a%4]) with mapi id 15.20.8356.010; Sun, 19 Jan 2025
 10:35:46 +0000
Message-ID: <2b6c52f6-037f-43d9-8384-7b48764a3e81@intel.com>
Date: Sun, 19 Jan 2025 18:40:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv2 06/13] iommufd: Make attach_handle generic
To: Nicolin Chen <nicolinc@nvidia.com>, <jgg@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <kevin.tian@intel.com>,
	<tglx@linutronix.de>, <maz@kernel.org>, <alex.williamson@redhat.com>,
	<joro@8bytes.org>, <shuah@kernel.org>, <reinette.chatre@intel.com>,
	<eric.auger@redhat.com>, <yebin10@huawei.com>, <apatel@ventanamicro.com>,
	<shivamurthy.shastri@linutronix.de>, <bhelgaas@google.com>,
	<anna-maria@linutronix.de>, <yury.norov@gmail.com>, <nipun.gupta@amd.com>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kvm@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <patches@lists.linux.dev>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>
References: <cover.1736550979.git.nicolinc@nvidia.com>
 <c708aedc678c63e2466b43ab9d4f8ac876e49aa1.1736550979.git.nicolinc@nvidia.com>
 <62ccc75d-3f30-4167-b9e1-21dd95a6631d@intel.com>
 <Z4wP8ad/4Q5wMryd@nvidia.com>
Content-Language: en-US
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <Z4wP8ad/4Q5wMryd@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|DS0PR11MB7405:EE_
X-MS-Office365-Filtering-Correlation-Id: ce57831d-b6db-468e-2a1b-08dd387508de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1hock5nSEVna2F2V2M1djdJTDlPSmFXUXdXaHh2YXhiemoxZU9URWlkc2lI?=
 =?utf-8?B?TTUzY0g4K3ROak11UDFLUFBrMnNvWThBRGJNUnVVb1ZFNEprS3VXNy9DM1ZV?=
 =?utf-8?B?ajJuSzBWeHZNVHVwT0xteW9Cd3hqeWxUK0dINmZnek0vNkdqaXIwVzlleXd1?=
 =?utf-8?B?ZVNpaVoxRkd2SEt2TU9KT0ljazloY09XV3hYMGNlQ2owS2lNdmdYV0ZnWnI2?=
 =?utf-8?B?Tk45ajJrajl5V0V6RndKTWhHMXYxdTdTdXB3UmViM1VYMmo1OXoreEpGRUVo?=
 =?utf-8?B?REdPQ3hQcmRzVFF2bjFGYWZsRDU0NGRJS3BzT3N3aG5EKzRaSEZxVFAxMEY0?=
 =?utf-8?B?SGkxeldQRnRlRWNQaUZnUUFWMWRxV3RGZUxhVWU0VGk1Y1NDUkNkeUZDSGE5?=
 =?utf-8?B?UXRGM2J0YVBhT3ZXTGVIcFhRRWs3MWdHOStZMEZSMTllbGlkb01FelZsUytX?=
 =?utf-8?B?MkliaCtNdFUrcHVLQndmbzV2MmZqQ2tJNUFPYjVBVDNpakF5QmFEMW9uUVZh?=
 =?utf-8?B?VUJnQmxZSEwyZ1BZYzk0VGhiZW11Z28vcE5NMHBRVU1taExJMjhDdjBMWk1C?=
 =?utf-8?B?VWZTWWdKTTYveFczVm9xQzBlRmRlOHRBcWxIWVB2Sm5XNkFtNkp5V29YVmpN?=
 =?utf-8?B?Q1lCT1VUQkVpVUZrTXVUYlc4Qkg0RThNck5uRWoreFJEV2ZzN0VCTm9yYzls?=
 =?utf-8?B?UXdwQlg2UW1iTVJLYUNrZStxVFFEei94ZUt6Wk1aSnkwdjlnUHNlVDNEZnQ5?=
 =?utf-8?B?eXlQRDJkSU91MTYzRWVpUTRSL2lpVjg3eG5tUGRYR0kzMUtCUWxTeUhxVDVR?=
 =?utf-8?B?SVpOTjBpeEZ6VXBnVkkvcG8rNk9WRW9sZVRKV0FEN1ZvSXhNdkc0dmhEQ1J6?=
 =?utf-8?B?bVdZaFR3b2d3bXExUkRpSEJCcUlyaDc1cUZqYlNLdGdrSVVlcktqd0tsVUtQ?=
 =?utf-8?B?NEN1THprS3ZDK0QrYW5pZmJQazVpRWZTL3doWkJoaXFXUS9LeEYvY0lWUnps?=
 =?utf-8?B?dXNwWUdGOHBHcTA0bXdHN1BUWEdsNzBtdi9GT3d1YTkyYXVuQjRqNE8zSURt?=
 =?utf-8?B?YWZhemRNaGIzQllTRXY3MngrRU94bVR2VEtJK3Z6Qk5hWFM5RTZpL2lKelAw?=
 =?utf-8?B?VzFFVUlRcXZQYkJxUkdwZVZydEZOVkp2UjU0UExiL0lWaU5pVzBCd0hUKzR4?=
 =?utf-8?B?NVh6MjJiTzZqanN6cndtYUNGS1NpZDlOSURsdTF6ZjdGZFJxYVRHQVkydUxK?=
 =?utf-8?B?Zm1VNVFFN0x4cGZSSHozaUpYdGpsSHZjOXlQVDRCOUxRdi9ydDd0Z3hVNFRC?=
 =?utf-8?B?S1NqY3grbUdySENYTzc5NDdNekRuR0o5dlVkTHllaG53WmRjMDE1YTUzZVJs?=
 =?utf-8?B?Q1ZBazFQNE0vNnVFYndOYWFpSUpuYUhKYVhUdks1YU5CSEIyOW83T3MwOTVq?=
 =?utf-8?B?WFpzT3VZRmYyOSt2WHJpSjNUR20vL2lGdEtiRURQU0YwTFk1SXdXTkljdmVl?=
 =?utf-8?B?Z0VhcU5ibkZQS0YyRnJnZEg5aHlaMktXSGxiWXI3RlZwd1V4ZDQycFluVmtM?=
 =?utf-8?B?VEdadUUrU3MzOFc5MW5rdWxmR2lJNEtkQ29EL1d2SzYxSTBod0Q5Y3k4UzRV?=
 =?utf-8?B?R2YrOVVGRzJQVHplTTlDcFpwNUJJL1c2SDRNbWxNYWRiSEVaTnNBaHdva3dB?=
 =?utf-8?B?RTVxQ2RYcXRKYnRZSHgvNlk4L1FIdWlyZVhmSFpoSmxjeVBTVTVGWk9Yb0Mz?=
 =?utf-8?B?eDQ0ZXROa0ZiMm91bmVhQ1RMRTg0Sk1vUDdrQ09neWR2cU9KYlMwUTkyTlk5?=
 =?utf-8?B?L3lwazlLTHI5WlhMQzN0RzFTVDg5d21kVmlEbW5CRUhzM1NMNWY1WWorckdL?=
 =?utf-8?Q?XT+ONTgyP/Fkm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7529.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnBIR3hpcTFrMUEyMitmRWcrVU5XUkNXTkhDclIwOGJpZytJNU9PMzJMZ1Jw?=
 =?utf-8?B?VVg3SHJGU0tzZHI3QUpuaktKRTJ6UUdEMm1JSm1JUkNPanBLUTRRZTJmQTQx?=
 =?utf-8?B?d28xb1RML0hqR0EyMmp3SDZQaTNwTVRpampYczhlT2NQeG5jN1hzNWRjaTJP?=
 =?utf-8?B?YS9aQ09DbXd3b1hOTE1GSlpZNzBTK2d5ZHFWeVBOMmpaUVczSGRrd0Y2VjRE?=
 =?utf-8?B?dkNzcE9kTFNxM2JMWUljdWdVVkkrUVliSTc3TFh3d2FHb2Y3MFVDaUlHVjd3?=
 =?utf-8?B?VDVPTDl3NTVLaERwbk53SXRlZ2d6UW8yemprMlZJTW1SVnRKMnJhTzNwOGVj?=
 =?utf-8?B?cGRFRU9wR1dWaWEzYzFjVmM3R0UyUzdjVHBIQnh2aGRPeVJyNFJEOWxsV25t?=
 =?utf-8?B?dmtScW01RWRZWndnVi9aNVlidlFYaENvU1hLZWhLZkxTN0ppbnRzUGhYZmlI?=
 =?utf-8?B?WDhrdVhUdmRIenc5YlVWLzhMWHMyd1JIRUlHd3JUcjRYU2xCb3N4S1pNVnl1?=
 =?utf-8?B?Tkc2dTN0aVFSM1UyZ09pbjk1UFF0QzFJeE1EalZSejd1aG1Ma0hwMEV2RGFi?=
 =?utf-8?B?MndLZFJ2blJFZHlBZGxVNWpwVTV5SGVaWnoyNEc0OExISmdWMWhqQ3k4SUM4?=
 =?utf-8?B?UlRQT051ZTI5SVhDSGFrSVljZFBDUk8vOGFrVm81ZGhUR2FiVG92MFZvRTVQ?=
 =?utf-8?B?UFBjRnZGRDZoNUJEcUFZektmL3ZMcDY1a1FJZGFlQ0JrOUVmbjNGUjJBTmlo?=
 =?utf-8?B?S1BWTXdJWW9FeTJFTEJpdVZ3YjlzY1F2NGR0d3owMHJXUUh6dWpEUGlVaEZr?=
 =?utf-8?B?Vm5najZRVmFKZFdIWUpIWC9JZTRpUTBIL2VhOUQwY0xJOE9MbWlPekhnZDVP?=
 =?utf-8?B?aFAydEkraWtCYkNkWldXNzRFdGVyL25ORE9NSVlpNDU1YWZ4Ymh0Sk9POVdm?=
 =?utf-8?B?aWh5SEprYVB2c0orVSsyaEdjKzFvSXRnVnRJajZ5NHp1WDlyL2ZvdXUzMlNY?=
 =?utf-8?B?UWVSV2tWaldVbFpWY092aWRrN3RrcDczUC9TTmM2bWc5aThSUjhzZW81VGxJ?=
 =?utf-8?B?ejFQSlp5eGZEbUtISXE5d2VVR3VOZDZCczdwTGVlOFJnM3dHVGM3bkNNYmFQ?=
 =?utf-8?B?N0tFNDVjWmExWkVHV3ZuMThrM0UxWU02MFZ3UncyWkRRVXk5SFN4dGxrbVpO?=
 =?utf-8?B?eUQ3N3Z5UzZkQkdVbmpBWTNLVjMvdWZTOXRkd0ZxTmhsNlg2Nm10MHNXL0wz?=
 =?utf-8?B?NjRTUFVtN0o4bEtlMGlYclpLNThnWFV0WHVmYzJBOHBxQWZ3MGFPRytySTYv?=
 =?utf-8?B?cUhDSFdGU25SYytlRVIycEM0RDNvNUtJS0VXNGZmallHTHFNaGFVcnQrNWxa?=
 =?utf-8?B?eHlVTi9TV0Zkak81Snk1aXJFVDB5UEs2MkxFSU5yZUFnWXdlbWNCZE13N2dM?=
 =?utf-8?B?V0JaZ0I5OG81YVFaR0ptNTdxbkxzSURhQXFFbVl5bGdaVmp0aVhCUWd6SVFT?=
 =?utf-8?B?T3FEL1Robzg5RXJCcVBVTWNmTGNPMkFZQXVaRDlmYmo4QmJYV0plOWhnbFAr?=
 =?utf-8?B?b3NJS3Vld1JwaHY5aWxtNDdyZTlJR3pMZnNCVTRTZ3VKM0gyRWVlQjJhVGxa?=
 =?utf-8?B?QmlHYXBpamJVbzdQMm9iaWpRelhxb3o5VzYweXFVMEcyYWszbmppWVM3Z3l4?=
 =?utf-8?B?WitvYThzdVYwRldXT2tobnJaUWpybXgzcXh6NkZ5cno3Ymh3QS9PTWRWK0pV?=
 =?utf-8?B?MGdtYVYyUFF6bDd0ZFpBakd1MlNuS2NDUkl2RGZ2cEtCTWlvNVl4V1NpMXo3?=
 =?utf-8?B?b1VlQzJhd1VJaFk4Qm0yMC94YXRvZmtNRVBpcEFFS2dEQVlyb0JLclZVTVFY?=
 =?utf-8?B?L284bFY0bFRwRnl5RFJaOSt5b2JaRzBxZ3VMcmN1bzFQZjJleis3VHZTNWF6?=
 =?utf-8?B?bmJaaUNEVlQ3cWlvdS9JK2RMTHFyV3puVVkvZW0yNnNEaXZNNUFIVXB6dFFQ?=
 =?utf-8?B?eCtrQXY4YmptM2RlNVoyRkVRanUwY29pZlJXUUdhUVM0Z2ZFbjZnMTJZSXhl?=
 =?utf-8?B?QjVmdFIrOHptaDdpaUQvbndVajFDRC9PZ1lTMmxPY2pMS2pML0JnSDl2VE9F?=
 =?utf-8?Q?tWg+PgIIizu+Pnx+559Lpk5ye?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce57831d-b6db-468e-2a1b-08dd387508de
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2025 10:35:46.9015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BLskvIPNqIKwVyWqpM6MMLdSJzyySoXwxxtOtuG8KYku1xgPRLu0vLtN0rwAYW2U2x8szR4hW72CG4ZUrsRcJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7405
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_023637_819261_2A4E14AF 
X-CRM114-Status: GOOD (  17.14  )
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

On 2025/1/19 04:32, Nicolin Chen wrote:
> On Sat, Jan 18, 2025 at 04:23:22PM +0800, Yi Liu wrote:
>> On 2025/1/11 11:32, Nicolin Chen wrote:
>>> "attach_handle" was added exclusively for the iommufd_fault_iopf_handler()
>>> used by IOPF/PRI use cases, along with the "fault_data". Now, the iommufd
>>> version of sw_msi function will resue the attach_handle and fault_data for
>>> a non-fault case.
>>>
>>> Move the attach_handle part out of the fault.c file to make it generic for
>>> all cases. Simplify the remaining fault specific routine to attach/detach.
>>
>> I guess you can send it separately since both of our series need it. :)
> 
> Jason, would you like to take this patch separately? I can send
> it prior to two big series for a quick review after rc1. It'll
> likely impact the vEVENTQ series too.
> 
>>> +static int iommufd_hwpt_attach_device(struct iommufd_hw_pagetable *hwpt,
>>> +				      struct iommufd_device *idev)
>>> +{
>>> +	struct iommufd_attach_handle *handle;
>>> +	int rc;
>>> +
>>> +	if (hwpt->fault) {
>>> +		rc = iommufd_fault_domain_attach_dev(hwpt, idev, true);
>>> +		if (rc)
>>> +			return rc;
>>> +	}
>>> +
>>> +	handle = kzalloc(sizeof(*handle), GFP_KERNEL);
>>> +	if (!handle) {
>>> +		rc = -ENOMEM;
>>> +		goto out_fault_detach;
>>> +	}
>>> +
>>> +	handle->idev = idev;
>>> +	rc = iommu_attach_group_handle(hwpt->domain, idev->igroup->group,
>>> +				       &handle->handle);
>>> +	if (rc)
>>> +		goto out_free_handle;
>>> +
>>> +	return 0;
>>> +
>>> +out_free_handle:
>>> +	kfree(handle);
>>> +	handle = NULL;
>>> +out_fault_detach:
>>> +	if (hwpt->fault)
>>> +		iommufd_fault_domain_detach_dev(hwpt, idev, handle, true);
>>> +	return rc;
>>> +}
> 
> Here the revert path passes in a handle=NULL..

aha. got it. Perhaps we can allocate handle first. In the below thread, it
is possible that a failed domain may have pending PRIs, it would require
the caller to call the auto response. Although, we are likely to swap the
order, but it is nice to have for the caller to do it.

https://lore.kernel.org/linux-iommu/f685daca-081a-4ede-b1e1-559009fa9ebc@intel.com/

-- 
Regards,
Yi Liu

