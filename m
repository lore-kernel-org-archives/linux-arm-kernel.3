Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AAFC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 00:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bfDUea4eoIg2KvjFWJZZ/yeRrSZhd76i+hiS+WRZUO4=; b=nRYpdtYjY33kkVGIpMyo1fYSrW
	48LW+wAO1xq0CcnZCA5b8PI5qpYazjSfLZfdTYEpLsRbHOS0fA1CoRJGHKV7BsDWbYKyAeZ+GHDuK
	LFzHqL8x06k0XOAhsLyMPOXYQPchKpNoUg7gIgxWNSs8Vs4L9WRm8lZSm6hfkR6xQBxN2xxwaTLbN
	lTRWJ3ks5KSQWF2RZ0AMXD51xKaBQ47FMZEZ+/N+c7J1TvXVRrtvA++I1yneAtNXwDd4ope3gHAyL
	eZNFw54yBV49O6lcJ45zZGoNGuxot6In5mSKyXXgZ6HpI1O7f82HAJlTzxv5oihk2RVNj6TKZy7LP
	RiFM7znQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjn2Z-0000000DTLw-1XyD;
	Tue, 14 Jul 2026 23:59:55 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjn2W-0000000DTLd-1uSP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 23:59:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784073593; x=1815609593;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1ES0cIykx5O/8EIDVOr2xLnnLCy/diZ7QXg6/rRsXto=;
  b=XV88I0Iq4o4nEC4fq1bvkpZq0Vyc8el9A7h+YVspXbBwpzKhGhOZ8kAo
   me0pOvaV90lIn38oUeYq5C5m/HVPyH0yrBEepiO1yUKSOhhm9XGeEwT1M
   qLmfoq2NzYNDtSpSkQ5io6DDVGVGHJ/cvoWok8CJEc8e1LRMvCPthBUis
   SqwCkx9FZVC9hF+nA94G4BG7XDLDpZRyDBiFkirYqm9Lt16r5l9WkQcT4
   R28UPKjWlky/pQLAuth08CK8w86cYFmmVa4KJkw958Ms1xkGj6Ee9jwfy
   Qi2WqDJ29mUR/3kTS46N2B2o5lhPpqDKJaj0tOnG7Rfg03ZsV8A2xkbns
   A==;
X-CSE-ConnectionGUID: 5kMO5rVMSQGsRfLh10meWQ==
X-CSE-MsgGUID: /lVBbFHmSLON9PxN516FbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96215740"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="96215740"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 16:59:51 -0700
X-CSE-ConnectionGUID: bO2oyjSVQjSEEsUCE3Gc+g==
X-CSE-MsgGUID: 0eFVuTJ/QiWz8AOhsr4aeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="253384575"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 16:59:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 16:59:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 14 Jul 2026 16:59:49 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.18) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 16:59:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XK7xdnEV7S7iJUbqb4jGWBPyJUxc8VnlRgMSSNpNyaFREKh5PJRjtWzuoU/OqTcZ6N1C39BV1gzvDbNA8j1mPPl7BVYjHWVq6rax4k4xW4AVk0vaBOmKG/gy8ADBWTlxlh1PBRrLob4XzxtEB1IxLm1C1FvNozvtEAKyEFZpdvbj5RuHQ59HNZGO0oQg+eFaRM2s2yEP+csyZgBgrPrq6mKR27UapKCwrBRBH3Uq6JAiE0S4/htjdUfoZLUam2oDMjoG5Xlmbqm4LOir2WeatB05JNWlQu7SddoRhHTVtYLooxJ3OJY4eQqD6wn9al8xmgJMBAkYG+ETjrtHjH9w6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfDUea4eoIg2KvjFWJZZ/yeRrSZhd76i+hiS+WRZUO4=;
 b=qHvrgwQ49Y0m8tV+TlTAWdwkxm0gDi1shnbnzF4Pltvei+8oavsew4JhF38N8lZMBLiFGocOOUeAm9FCjsjyk4AoisowfeCm1cCUugEXj7OJP2i0VR84U/6FzvtUTvGzN903/R2Lp1Ji616pZhI5F/8VQwBPbUI51vqfV6SZMiOnKsHS/u8ph+R0+jXl1p57kQJ9rXOLHJgb0UKrBvZRYKf/cqrftM75Oihw56UeAFWZMS6o0dxgTJGq1BmmVKd6pRWkZzyiY4CJC90hLfl1fN4/YAwO6sJOjDinchymYbsMl4UxMdYRapS+AXprfFV47tNDemCKC0gEv1gHJuv0mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by CHAPR11MB9679.namprd11.prod.outlook.com (2603:10b6:610:2ff::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 23:59:48 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 23:59:47 +0000
Message-ID: <dc1ea24e-fdec-4c26-b043-af7f78e94bff@intel.com>
Date: Tue, 14 Jul 2026 16:59:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time
 conversion to be per-arch
To: "Moger, Babu" <bmoger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	<bp@alien8.de>, <x86@kernel.org>
CC: <james.morse@arm.com>, <fenghuay@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
	<dave.martin@arm.com>
References: <20260709093111.367851-1-ben.horgan@arm.com>
 <165e7636-d7e9-4d16-aad1-657b4a9698d0@intel.com>
 <2cad039a-63ee-4340-a9f7-d8aaeeda593a@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <2cad039a-63ee-4340-a9f7-d8aaeeda593a@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0040.namprd04.prod.outlook.com
 (2603:10b6:303:6a::15) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|CHAPR11MB9679:EE_
X-MS-Office365-Filtering-Correlation-Id: 5057db3c-f869-489a-e301-08dee203fc1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: UCgXUPdGeHAC4pq0vJmGK3zDRbqkx7zGFjtg41WB0V9zVErz7gCNCd4RFX3oHgGiYY6r7kyHVYZIBhARu1MQT65cuYpZoeHxap7jQcoEAvDmKL3wKCgNjbe9cYqUAcshLq2cWZR4UVRP9lyzR8R8Do52oHLq7BXLt1iIdt29mTrsNwTmjpVFkiT5g12aDygQnTcD7i+ZgH4YlTnSKMSRWtPCxTyCv4lyxnUVXOVoJ6r1MC9ZPjo3c0ZdKjcQpzBI3SrxYxR01+/MEqrW5+kDQiCd0wJ4OOeBH3DGzEj6xd3U5Ax+HqXLF4whb1WBWUL8odqgSH39iKX7tE9/LeJ9kxPIOPZ6JNIuBTQC4YAOVkLAxxcMoJ3Jk+v+UEzoCpoxHldsmwIKCwT7gxOduiRvs1/tH2uXhxCw8dCDzdnMzFpkbi4k9SVCc9lFkyH9gioSw1W6sg9NZGNNYPrf0B9ip3MzjjVGZUMkdZehqitL0p0VRnX05Jk2PSfMd686ZVCFjqctRnuhP6jCWo5hyfo+DEnTUTBCRQXOUAyDL9yE/kV0k55b7GSBJWnqztJOj3vgdJUmMoJhGG5KrCbMau7rE4k9Bv8U+2Pj+SrZiQxsM09x5OMmh/3HdFdjZjrzPDAz4S3X89N0pYF+fNaxPqlHn+Pa29mO9Nhfo3dSUrcVVd8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Umk4YklJcU5zNHdrWGtnY0FHVEN5dVpqUU9NS2ZhRUJlM2NCUE0wNndGb0lI?=
 =?utf-8?B?VStuVWJUZVBUaFhtSUs5RUJkcW4ydThtckJMUXVycU9MQllxQXVrSGM5ZXl0?=
 =?utf-8?B?RTRZQ2Fqenk1K2lmMkhFMGV6dHE5VWJxU3RKQldJWGhnNC9qd2hiLzFnNHY3?=
 =?utf-8?B?eUl2SnJnS1RPNVlaVEFkbEV2bUMreUNKMzQ2MDNTaThmN0VwZHRmc2ZHY1lN?=
 =?utf-8?B?ZGhXSFlvWW0vRWRQTjE2cnVFblkxZytYa2ZCdmxYMktCNmNEM3RPeVpvK296?=
 =?utf-8?B?cElxYmM0QjFTcDQxQnNkQ1ZOYTBsdXVnNERJVmtXVlg5MW5qT2swNlBsV0Jr?=
 =?utf-8?B?bWJLQVhrVzhyM1FKOUlHSmJwTGQ1L0duRkdKR3N6NmNya0srT2orblBwVlo2?=
 =?utf-8?B?QktRNDhqYldiclBXV01WQjhpeitXRXZ5dmc1K0VQYlQ0V1FuY2JkeUxZemNn?=
 =?utf-8?B?V0I1dERTQmUvQnJ0NndOdW9QeTVIQ2FmbStudDJIdzF6MXhDQVZoOXVQQWVN?=
 =?utf-8?B?VlkwQ2w2MEdwdlhGSGduTnlPUE9KcUVsMTFPcFdqdERCZzlnbjVYSkdIRXMy?=
 =?utf-8?B?OFl1c2laTHBrY29VQi9RdGh6akp4MC9zZzlqb1dHU0llTWN4ODlWbS9XS3N5?=
 =?utf-8?B?Mjk0MCtScGhCa2hacFhxZmlFWWdQUTlDcmNiVVdqREtTazJKOGZzZ3IyN2RN?=
 =?utf-8?B?bXdzdmNUTlFXcmlxL3JLZzRNY09GMExvdXNONVZWdldxUnJzQVJ3RTY3NmR1?=
 =?utf-8?B?d2NxbzhTOVNsYU5mSnpxbzlYZG1jcTJIdUk3WEdMSjB5NlZUWHU1YVpZblpq?=
 =?utf-8?B?MTZzZEt6N1M2aWN2Q1BCQXVsZXQ3WTVrMTFNbGNOZVl2TFZxblUyUUFGUzFw?=
 =?utf-8?B?TUNLaHVkTGpzeXRCSWJ6N3UvQzZKTFpSUWQxWXlMeUJjOGMwaFRDN2IvT05W?=
 =?utf-8?B?TVpqcE1wSnh4M3RhR3NIaFF1NTN2eTJkQ1hKZm40aUdReUZicVhXRVRTRlM3?=
 =?utf-8?B?Wkt5THdHVkJsM0ZBMUdKem92Um1OZXZDWTQ2cDZFSWp2SWRtM2ZQTnUrWi9X?=
 =?utf-8?B?cThYbm9NVTJTY3M0cjh0dWtkVzY1cUVqVVpWQlNnQzZaWjBLcnpoSDg0WHBE?=
 =?utf-8?B?cHF4TXV4alFkS3RnMjlhMEdhUWtIbHN3OFFVREVWYUhaTjVNY3BaRnlEa2JH?=
 =?utf-8?B?K0oydDVwQ3Z6b29aTkF6TXRJRC9ZZHFJKzcrU3d3b3VVVWE3Lzk4S0tzeVEv?=
 =?utf-8?B?dnIxcVZKazZ5aG13a1lRYkJ0Mm56TTJzY0hVMDFvbEZkYldmd0ZGNklTUzRY?=
 =?utf-8?B?OHpkaDVpelJDYTIwaUtjNzlFellmZjFOZ1RYUnRkeURObGxlSzRiZ25rQnlz?=
 =?utf-8?B?c0sxMGVXTVpVdkxEV2FJa2Jvb0xycWU5WXlLZWJMc1Y1bXFKeVM4akVUdVFV?=
 =?utf-8?B?M0tHWU1nRVRBdTQ0MGlYbnZEQndmY2RGcURXUkluUnpvZ3RUY2w0N0Z4WFRi?=
 =?utf-8?B?R3I5c0Y1YmN0NnNLbVZ3RE8rQXBBdDg1bzM5L3RpMlhUanZvdnRMRDlrdmZo?=
 =?utf-8?B?aUdxSDNDaG45M2JJR3c1cUROejJWdVpBMUNVSFR0Um00RmNYRE50T2FTWmlZ?=
 =?utf-8?B?QzJzSzEwUmRHaFM1UGU2NVBxaEVDVko5cmZkY1Jqc3JzdDRKTUMyUnlIMWJB?=
 =?utf-8?B?YVpqd0ljTjZvWDBrTHUvK0gwc2lyWUZvVmNtL3NxWGN5U05LeFFnWUg4cEVK?=
 =?utf-8?B?NGtZVUNMNFpKS3E0TEpQVHBzbTN3Lzhud2lra1lOSytWVVZxTnlmWFVJb2x2?=
 =?utf-8?B?U3FwcXpDM2N6ZHNDd0tObWEzdWw2b01CK1BnKy9LR21JbFhkM21ZeUlURFFq?=
 =?utf-8?B?MGh3VkpPSGxrUVhZbXVpTXQ0ZkpVRmk1alg4RnNYME9KcDBsUE01d0ZnUUk1?=
 =?utf-8?B?U29IUW9sNVZYbHpIbHN2ZDFUWlRCNXpEcjZoOFN5SHVhSzRvMVVxTWVzSmtr?=
 =?utf-8?B?YnFBWXoydHV2S3JzWVE1Qzc1WklRR0FvSHNSRElWZ3lGLysrUVhSQmNxV1Zt?=
 =?utf-8?B?aHR4ZkNPK3lZQ1V5R2hIa0NYNXBBb1F5SGtBTHI3bHJwYmhzNExvU3FDRENX?=
 =?utf-8?B?dXFvcjUyNTRVWW9YQVFiVlo2cU9XNGZZd1VyU0tJemtxc0VaN3FsUEN5dVc3?=
 =?utf-8?B?VXRDY3VrUjExZEV1UTMvTmRsc1Y2Z0JHRWRraEFTcld6aWwyQVV1cDZqVWdJ?=
 =?utf-8?B?TnRUdFdKTDZhd0NLMURhSWJRUWRwVmNEZ3A4VlRzTHhhc0NrVjMxd2plV1M4?=
 =?utf-8?B?SnlQaVA0UkwwSHQ0QWlVU01QbnNkRzQwaWV5VXVJYkZTOTJ1LytrRjY4K0JH?=
 =?utf-8?Q?RNN5R3bZVxolzKyY=3D?=
X-Exchange-RoutingPolicyChecked: eglmFjY8aOsyvNGrO9ZpqYi0JBr8i1shY7PIiLSaijNzGEenHYpuT6tT1TKcA6PZMIcjF1gHWrhQMdpzGAVBQUtP70tlS0gMjp29wDmrm/+5XmnuFiOhLMHqxlT3b50hDlAFw6HiGL1HhRi+06pXku80BAXtI7sVfLzRJJpv45OPIz7+weiOteDP7bhSuuvmd2RrJ8ZnIiSGCXgr9YqRW0zMM6R6oKSoVbWkSDdP45DV3BpN1D1SrtTOsTHTxPGXthIP2q/Vb5TdZ0LZOmz9yz+UsFZUISPKMIKWfUcsuaU1qQ1XpRAMoWvCUXYvG1nINVXEu6p6g51ywaFWrPaJjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5057db3c-f869-489a-e301-08dee203fc1d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 23:59:47.8006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IXw/Y2/RPYQheRii/V0LsbcbxHYjbyzeGh7xoUuCyygWlIeD6HFNf1xp5Y87sxCoSm2NpcrYEZR8xc6zwdWZBdw+hCi2elSG1sRGDdu2dTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR11MB9679
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_165952_627727_27CA4FA4 
X-CRM114-Status: UNSURE (   5.99  )
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



On 7/14/26 3:48 PM, Moger, Babu wrote:
> Ran few tests on the series. Everything looks good.
> 
> Tested-by: Babu Moger <babu.moger@amd.com>
> 
Thank you very much Babu.

Reinette

