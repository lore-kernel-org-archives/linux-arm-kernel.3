Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E24C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 13:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8vuBKvzXSA1ZMsvZ1MCqI3J9BH86qSYcfEBOg9TfhaM=; b=4sKnc01fGfa2wJhzBAfPyx5B7o
	se5mkGiCVaytekjZuW3pMpi2DArF1H60Aw5f2MqN0KuUbgYiC48CEhRZpieuyXd5rwB2wwBr4ZeWe
	qMdXvPS1pgOG6/O1VIV2KE1yuwkg3ulIZSlHh+dB4tPCc2pGdsmPwteHHyYOCgLkhWRs4U9v2rdqB
	nK10gZjYwaWzqD/GbfwJDfH7WDTqFnsRsbJf+hpFxIeXMcIh7Lh3/TtnNvr9iRtvJeDClH95q/aQX
	N01ZN/tWWmKefYpohDp8R01fDZyb5OvBXEY3TYp18GYGQ8w3yyzEBa4GTq+wFo8+IykZx3uveuoP+
	Fz0JE8ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKHY-00000005CpD-0TR6;
	Mon, 13 Jan 2025 13:15:04 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKGI-00000005CaJ-2jLv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 13:13:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736774026; x=1768310026;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=72lpFWN+/6wWJInYp+nLBpMWlxQ6Vi1+Uask9pVkqfI=;
  b=nc13r7Lp5hrGPgP2Wg9TdojP+byDfF6qMah7dsD95Xb0MEfdSr6nyGDx
   NsqHwdscunxlTnGC91abhAdzM+Kang7QPntD0N4AxI6Y/+vLnbikzXciN
   9A2tWkUfZaX0ZzA2eEVwUhoMmB/6LTVH8GM6k4b/IV9t4osgK9mkGrJmc
   M1L9SBl9+VhTaCjvz0vtWiGL1etBtKhpzUHaKxbpMjv2CHjMAlMKiT8yV
   jPmrNoVn+Po2cxJOxtqwkPcVrUBkqXcLMwGhZojZNoNf+AnmpDfNOm3eI
   SgP2HHs494dG/93cmDoZgGLy8vd8LKUXSS4D+JqV3yxv9AkToCPeLqMAk
   g==;
X-CSE-ConnectionGUID: pAeKoqw6SgKIJjZhQl3/3A==
X-CSE-MsgGUID: boTZemMCSheWul5rVZg9Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="54580806"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="54580806"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 05:13:45 -0800
X-CSE-ConnectionGUID: O4wpHaNZQLK1SEwYwqqCrg==
X-CSE-MsgGUID: 4peyxTd8Q7qLQpa+FyKqtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109617740"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Jan 2025 05:13:46 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 05:13:44 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 05:13:44 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 05:13:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pEXM+FowpwaLI9G2EI0TX9KHCmqC+KquvV/koC79XAnIA1JAi49J84fqOUuWDpJusJhfU8nMqp9azLUr+uLP1rRUUtZI1wxsvL6Uxj/yN0Ndu6GnJdJhM41wYKE3itJXeeA5H5hDkudUfnN0gFu9wqCo3OmmnHmtdji+mItNaTxyJJtbz2L4eCJMPoEL8+HsG7bMNjdcUjB2mFMNB/PO57zKCopv2ojxgEgRGDHRovodYFBmfXP7inxixZKptSsjaIoymW8n00G7KYyq77aTex9L1p6VD/ObiqIp3pOtqgWrIGYwUnKcZyCRzD7P+WizhiOgJyMddl5aXCac6svlsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vuBKvzXSA1ZMsvZ1MCqI3J9BH86qSYcfEBOg9TfhaM=;
 b=BSm75JvCgZ3JXfXuoPszr7M09WmMEsMQPyBXfLBNPD9r1z6jvrwmZiDtXuQYNo4Ukrqmvk3C8ZLpH6Btu/npZdgXMDsSCx3U6zTgfGqPgE/WDvoIixvFRpdUeEgPJO3cyI288CQfKafbr2GguJeqdEoi465kVnjgU/1NPOUmSPNbP0LJZqe78gGYI19anG2asEbUdIx8tWNaZDIZYvW9keRZv7H62/LB6IA4MeP1jRh0hn4VIlqqI3oCA/oQWbxvryeyUkHman/StAT57hX9EhrgPPt4Djv0Cl6lt0VoFrH877BwklTH0mcfZnrTbGuiA4Ic0AhdkaRBNQEDy1tGQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM4PR11MB5247.namprd11.prod.outlook.com (2603:10b6:5:38a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 13:13:42 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 13:13:41 +0000
Date: Mon, 13 Jan 2025 21:13:26 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Barry Song <21cnbao@gmail.com>
CC: <lkp@intel.com>, <akpm@linux-foundation.org>, <anshuman.khandual@arm.com>,
	<baolin.wang@linux.alibaba.com>, <bp@alien8.de>, <catalin.marinas@arm.com>,
	<chrisl@kernel.org>, <dave.hansen@linux.intel.com>, <david@redhat.com>,
	<gshan@redhat.com>, <hpa@zytor.com>, <ioworker0@gmail.com>,
	<kasong@tencent.com>, <kirill.shutemov@linux.intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <mark.rutland@arm.com>, <mingo@redhat.com>,
	<oe-kbuild-all@lists.linux.dev>, <ryan.roberts@arm.com>,
	<shahuang@redhat.com>, <tglx@linutronix.de>, <v-songbaohua@oppo.com>,
	<wangkefeng.wang@huawei.com>, <will@kernel.org>, <x86@kernel.org>,
	<ying.huang@intel.com>, <yosryahmed@google.com>, <zhengtangquan@oppo.com>,
	<oliver.sang@intel.com>
Subject: Re: [PATCH 2/3] mm: Support tlbbatch flush for a range of PTEs
Message-ID: <Z4URdjC55ktHaZcx@xsang-OptiPlex-9020>
References: <202501061535.zx9E486H-lkp@intel.com>
 <20250113005504.2271-1-21cnbao@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250113005504.2271-1-21cnbao@gmail.com>
X-ClientProxiedBy: SG2PR02CA0129.apcprd02.prod.outlook.com
 (2603:1096:4:188::19) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM4PR11MB5247:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f222541-29ed-4267-cfe0-08dd33d419d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3E3SDZVQy9maDE5V2hyejZVRnYxbkJDT1k3Q3lqZTlvK1lRQlgxK21XZFhz?=
 =?utf-8?B?dGp5YXY5T1AxL3ltTmduRHRuK1NhaUsxUUNQMDY0RXJNZnRDV3FKL1F6elpS?=
 =?utf-8?B?TG1RMHlVWGxobkQyREFKZFRGaVlkTi9GcTR3WWVjRnZVek52WUJaMlA5UlU1?=
 =?utf-8?B?WFRiUXhkZ3JndVdpS2ZOcUpaY2o3WlNCRWNLaFZ1aWMrUTgrTk1MeXYzZVFm?=
 =?utf-8?B?ZG1GOXJGY1B2NVAyc254RmxjVDZ2ajMvU2RFMW9nd3p1VmZsaGdBZHE1eisx?=
 =?utf-8?B?b0lwVCs4Q0c2eitQWS9SbGp3RXJtV2dXMVVTTysrSkZSMTM4blhwQytSYy9w?=
 =?utf-8?B?TzFsYTNtTDBMRlFCVTN6TTBpcFpZRWRGcUlWNUtJS1l4NjI1ZG5Tekd6VXla?=
 =?utf-8?B?S2NRV3hRcDEyeFNyU0xjRXRFVTdZRUU4dWN2SE5WZWFSSW14cTNQNGZHMHdt?=
 =?utf-8?B?eC9iRUVFeGdjY1RyYzBJdzZoUmxJbUd5QmN0VkpYUEJ2eDc3QzFqSit6dEhx?=
 =?utf-8?B?TmNDSHp2dEdpd2RIaFFCU1FsdDdHV0NEUnU4NitjUWpwSXY2MTVQS0dOS1Vv?=
 =?utf-8?B?ZGNpTEVrQTdZOUtZTUhiRHN1RWEvTmdHeWRmMnlybXlYRndpMEFXYm5yd01F?=
 =?utf-8?B?OW9nbU9tbmJ0YXdteHhiQXJ2dEhHaHBZTis0ZUVEVmdIWndhZGJmRzZtSHV4?=
 =?utf-8?B?cUdPRmYxdmpNODdOTElNdEExcytCMkZXMm5WNEJaZUlGdDBCL2p3YWdGZzdq?=
 =?utf-8?B?UVFCbEZ5Z1FNMTU0dkZ5REVkTjFkaTRPVW04VUNzbVJZbEhYUnlaNURrOHNw?=
 =?utf-8?B?aWdiMnU1K3FWZ0RaSDkwYzIwMS9CTUo4eHM2aGd5T2YzRGNxT1dSODFETFlh?=
 =?utf-8?B?NHZyNG5aREdxYnBibzNiVUxjWHVRRFd6am5iTkxicERmWHYrNmt4cExESXlL?=
 =?utf-8?B?MGtPbDg4RU8xZ0VBYkdBNHVuU01obXJUMlpBNVg0TmZKeGE1YldtQzlQREp0?=
 =?utf-8?B?L096M2YyUkxnVXNmVDdCeEsrL1d0bzNsbVg5a01CeHFET1BUUXQ5SG94UjE2?=
 =?utf-8?B?eDRtVURwQlBWUnVmQkJhSE9xUEM0WDFXQnNDT0h6M2lHS1pWZkFCeE04Y3Vl?=
 =?utf-8?B?Rk5ydGV3VFB2UzNFam5UOUZuVzVVU2hDN3NZVnU1eXcxK2NieERhMytwcmxh?=
 =?utf-8?B?bVhOOGlyODJCVGdvMGNRdzhSRUNwN2pYT0ljQXhGQVgzQlY5WXpzNkszR0pw?=
 =?utf-8?B?MncvS203Q2FzQnUzb08xbEZ1TzNqT3RoZllJcUVLWm13Y1EwdUo0OGxpTEdu?=
 =?utf-8?B?Ynk5OEFaKzlMN0pFVm1zUDYxd0l3S093bWRyNEs5QVlqUnAxWDhIV2hOL0pt?=
 =?utf-8?B?VURVMnVMeHVYM0YyUlhyYStGZndjdi9pT3JEZmlVb2FBSnoybzFQcEZoYndy?=
 =?utf-8?B?T1RMN0Uzd0dOWGFtaEdZeXZoeFJzcGR1aGNCTkQ4djZHY05tWFFVUEFLWmlP?=
 =?utf-8?B?Y1Q1NlN0UFNxOTRhc29kVmJrTUVaaU1nV2NDUkY1NGdlQVlxTWRQMWY2cUVm?=
 =?utf-8?B?TzUycUxUTGlRK1NNL1FYWWhIUDhpYXBTaVF3WjYzWC9yR2NmRkd3ZHhmWXJD?=
 =?utf-8?B?SGxaTHd2WWt1M3UvN0dCZTIzVnlrOEdSa1JLRHNuakpvcENYT2k5QW9aNm84?=
 =?utf-8?B?RGhuUlJGYis5bVo2WFZ2UzRoQWJQRGRtT0pkY0p4cEVUV200ZHRrZVZNVGpP?=
 =?utf-8?B?cGxoVHZIbHJodFJBWU94YUFDejhlZHl6UlNQTmpBSDhCcTZEUWRsbVF0NXp5?=
 =?utf-8?B?bkozNWhEbVdWU3B3UGxQdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2VkMEdzbXV2ZnFMN29MMng5SnFtMWVMdjZFVWQxOUlJWmFwd2xpRFVFLzh2?=
 =?utf-8?B?Z3pRTWtubEFZUnpZaUNCNnY3RlhpRERCVGMzMWNLeUlSKzBvRHNoNW5CTWlP?=
 =?utf-8?B?UWQzN1d6VkZ6MjViMjZ3YlgyVUxHTXN0K09oaUxNTWFIT0pIdk00Y0Izekdr?=
 =?utf-8?B?VllacCtuRGptTzhERzYwREtTcUFDeUVZYzRJZDVUd2RMb1VlbFNJeFY3V1Jk?=
 =?utf-8?B?TktDMVg1b0FxUG5Ob29BeGhueGpPZUVRWjNoVXBORGJHSVdJSk16N25hRlI2?=
 =?utf-8?B?aEZ0TnFSdlhLa2tPRWNaclA4dUtYbmpaYndxc2lhRWxaeVZPanNab3MvbXdh?=
 =?utf-8?B?eDNDVUNZOSt3dGxtdnhRT01KdXR2bW1vV2hOMjNhL3ZQNjdlZ0pSaER3NHo4?=
 =?utf-8?B?UFRBV2NGTGFzcTdnZjltTm9LMTU5WXNBc01MV2Z2eHIvUUJpUmlrNFQ1c0tM?=
 =?utf-8?B?eEMySTNwUXVGdGVBWFBJbDBvOU5WQXJYUFczQWxBQ2wwR2V1Z0JQc3RBUmQv?=
 =?utf-8?B?ZlgxdWVGOHlWVXV1WWR1eEpRQ1gwRy82Um01YmNJenVwbk1pc21ldElPVEpB?=
 =?utf-8?B?bVlpc1AxbzM1Q053NlJvREUxVG5DWUNiUlptZnRLeUFuMG42TWFBUzkvWi9m?=
 =?utf-8?B?MEZQbmtIbWJzL0xrVms3K1VjVWRJOWxhZFBRMGJKcEp6OHdDdjNWSWpZenl6?=
 =?utf-8?B?TlBpQ3MrSitIMmZ3Zy9VVDR3a1o5QndJNTRZWTRicnY4NkEwQkJiOTBUTTJY?=
 =?utf-8?B?R2Z4c3VDNUZIZFkwaGpGK25kN283ZDhieU1CSDJLZnF5YlVFT3NRVHVxbHQ5?=
 =?utf-8?B?aHRHYzMwa0RLVnFEc1dtSy8xMUo3K0c3R2g2UTRlSlFqTUdKaGRZNGc3Z2M4?=
 =?utf-8?B?NC9hQ1YxdlN0NE1aSkNPbytnZTlqU1lQeGxDR3ZCMUltS0Q4TGtXWnpuNE5a?=
 =?utf-8?B?UUJmeXE4bWs2dEhOZWhOZk9vMEhpeG55anBkb3BPaEZCK0x1TnNHcmFFVitR?=
 =?utf-8?B?UnUvbE1DTG1yRmhIOHkzT2xFbTdLczlrNTc5S3BvdVF0ODgvQjZtZWplRTdC?=
 =?utf-8?B?Q1AzZ21pZXA5WVFxK25rU2Y4MkZsMHRNMmhiaXRCNGdGcHJsN09ZRUZIQ3V2?=
 =?utf-8?B?RktBUXRVeitoUE5TcEhiSHB5eUdUT2s3Q2lVVEo3R21wSkF5VXM0NlVTUDU1?=
 =?utf-8?B?cHZ2eDFrN1pyVUtMSnViRlBjNk1qQThOT0pOZ3ZIQ1NadkxwQkY3TzhhcGZ6?=
 =?utf-8?B?dklxaHMzVFFqMnJxQ3JoUVNkUTBjR1NUYkFJTFQvaUtwaHprSVpKbm9qK3Fp?=
 =?utf-8?B?YkRiSHdkWnY5S0puTmoxWG9ta1RiOHdMN2V5eEtVNFd4c3ZuUWR3RStTMmV2?=
 =?utf-8?B?MDFtYW12U3pSZkZYR29RMVRWYkdMMldCRVVXVDRCcUw5NllUWnJtNTdBbmYw?=
 =?utf-8?B?UWtOblVJNU9KOG16Wm42L3hKc1p1WG1JK0ZJdzJSVGh1VHlQRkZIRDM5SVpr?=
 =?utf-8?B?S05ERHJnakxxUyt4eDVJQURpVGd3TS9Db05sZzlodm54K1RTek82cDdNSDlU?=
 =?utf-8?B?ZWtpS0gxc3pBcEh3WjUzeGhpTkw1Z3k1UGp3TytVc2RoWnBWbllFMUxLekhu?=
 =?utf-8?B?U0Nyb0ZHWFhLOVllNGp2MmdMeUFmZXZLME5RZWd1WTBFTXF2RHNCNUxiL1dY?=
 =?utf-8?B?bjZpaHRNV2c3am1CMkgvQ0hFWnJJMXlLSFlEcmI1eUJDQnF3bHRoQlE2Rm96?=
 =?utf-8?B?aGw2akc4elRaZWx5UFhqNXlSbmVRMjBBbUVYS3FRaTlQaVZhWGprS04yUkFw?=
 =?utf-8?B?bXpMTDJqUUJoSXhid1NYM1Eva0VjTERENkd6bS96UW5ONXNaMDh4YVQvZ0xK?=
 =?utf-8?B?WEV3MkYwQlo5VDV6NDhWWXl4ZnlRbHRIdFFHTGkvVFlvK3ViRERKVEhLRitL?=
 =?utf-8?B?Q1h1cmwxQ29kSVJuTkNjaFBPaUJJUERaNTZLMExEdnl3NklKdytRMnZFS2V0?=
 =?utf-8?B?cjJHWkUvK0g5clZEbVc3bGhuSzBFNEhwaGJHR2dLRjdKbnd5SFZvSWh6OUJ4?=
 =?utf-8?B?UkR3MEZSKzdxUXZUR0QzUDJkTnBuVDFFVEFHc05DcWVaNm8vWEMvMU1GcGFH?=
 =?utf-8?B?cCtCOHgvTWRTNk1jR25KZnVXMDAyNUlRQkxjVHNKUURrV0wzYkxJWnJzQjRR?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f222541-29ed-4267-cfe0-08dd33d419d9
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 13:13:41.8000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hNtqg9sQOc+/LD2H7k1tKqrcLvAYSsQh2+JHqpe/7YtrCsQrTx3q/qkLmRP8OKKfQS4jj6lhhwFYs6j0uWzMdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5247
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_051346_708898_88F82013 
X-CRM114-Status: GOOD (  21.72  )
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

hi, Barry,

On Mon, Jan 13, 2025 at 01:55:04PM +1300, Barry Song wrote:
> On Mon, Jan 6, 2025 at 9:23 PM kernel test robot <lkp@intel.com> wrote:
> >
> > Hi Barry,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on akpm-mm/mm-everything]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Barry-Song/mm-set-folio-swapbacked-iff-folios-are-dirty-in-try_to_unmap_one/20250106-112638
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> > patch link:    https://lore.kernel.org/r/20250106031711.82855-3-21cnbao%40gmail.com
> > patch subject: [PATCH 2/3] mm: Support tlbbatch flush for a range of PTEs
> > config: i386-buildonly-randconfig-002-20250106 (https://download.01.org/0day-ci/archive/20250106/202501061535.zx9E486H-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501061535.zx9E486H-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202501061535.zx9E486H-lkp@intel.com/
> 
> Sorry. My bad, does the below fix the build?

yes, below diff fixes the build. thanks

Tested-by: kernel test robot <oliver.sang@intel.com>

> 
> diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
> index cda35f53f544..4b62a6329b8f 100644
> --- a/arch/x86/include/asm/tlbflush.h
> +++ b/arch/x86/include/asm/tlbflush.h
> @@ -280,7 +280,7 @@ static inline u64 inc_mm_tlb_gen(struct mm_struct *mm)
>  static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
>  					     struct mm_struct *mm,
>  					     unsigned long uaddr,
> -					     unsignd long size)
> +					     unsigned long size)
>  {
>  	inc_mm_tlb_gen(mm);
>  	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
> 
> >
> > All errors (new ones prefixed by >>):
> >
> >    In file included from arch/x86/include/asm/uaccess.h:17,
> >                     from include/linux/uaccess.h:12,
> >                     from include/linux/sched/task.h:13,
> >                     from include/linux/sched/signal.h:9,
> >                     from include/linux/rcuwait.h:6,
> >                     from include/linux/percpu-rwsem.h:7,
> >                     from include/linux/fs.h:33,
> >                     from include/linux/cgroup.h:17,
> >                     from include/linux/memcontrol.h:13,
> >                     from include/linux/swap.h:9,
> >                     from include/linux/suspend.h:5,
> >                     from arch/x86/kernel/asm-offsets.c:14:
> > >> arch/x86/include/asm/tlbflush.h:283:46: error: unknown type name 'unsignd'; did you mean 'unsigned'?
> >      283 |                                              unsignd long size)
> >          |                                              ^~~~~~~
> >          |                                              unsigned
> >    make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=998720002
> >    make[3]: Target 'prepare' not remade because of errors.
> >    make[2]: *** [Makefile:1263: prepare0] Error 2 shuffle=998720002
> >    make[2]: Target 'prepare' not remade because of errors.
> >    make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=998720002
> >    make[1]: Target 'prepare' not remade because of errors.
> >    make: *** [Makefile:251: __sub-make] Error 2 shuffle=998720002
> >    make: Target 'prepare' not remade because of errors.
> >
> >
> > vim +283 arch/x86/include/asm/tlbflush.h
> >
> >    279 
> >    280  static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
> >    281                                               struct mm_struct *mm,
> >    282                                               unsigned long uaddr,
> >  > 283                                               unsignd long size)
> >    284  {
> >    285          inc_mm_tlb_gen(mm);
> >    286          cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
> >    287          mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
> >    288  }
> >    289 
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki

