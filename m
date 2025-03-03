Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73722C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 10:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ddyMWDWrvdPkKrtnnxufUJeZYwcdKpcdlMiancOUjQ=; b=4HG3pLo6t0kINR1cl1xICGb+9D
	tcPAkVE6c2APz1G/8x7l+P/6//l/7A1tlp87LNbRObdmUK47z+xAJQzTEKXagetn2q+oZcHn2woOs
	6r13NUknOrNgCzdyKEwK/AHwvWNCJRldQVA6+zG1XVyQQ6gM7hf//HfQvPf80MeWEYoQYsBq+ir4m
	A79Z40QZGCQM14QbSwxVX1SmNPc+BI3DkCInjbNC4JA1TUMAEnpHJnrRDHbxk3rlzpYWuaypZeka0
	pGpadoY/fvAmQ0WHAfH8bpndIGX0ioZYkMLd8swSPOm/hXJKa9w7APWD9w8Erpt2smSRhSCAUeGo2
	SLi6x70Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3LU-00000000OZB-3PbN;
	Mon, 03 Mar 2025 10:48:24 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3IU-00000000Naa-37nR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 10:45:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740998719; x=1772534719;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Yl07lTBACqRnT5qnZl3ZRkwoRmlfqt7+hkfn2Bp/9Os=;
  b=PlKJ0lTIfvqUdVNEaBPM5RPgdStCv0wJp1N4bOj24LyDMx8uuLbsiZ+x
   fy6IxVVvhWdz3Ftk15LSvs07IZ2PPEEGv2WsNulfgIe8TO12UAuvs2JJQ
   0Egx+McXsesp/2ZgB/I6MY/sexKLZpDbFhZYTvqdpVnF/pIaXBXhLtNZ1
   dy54kKHd+MnCevbztGg7Bdg7Ile5jKJQckcOSuI5xd7bI3q9lMRW0Gla/
   A9M92Pw/mX75ZvxiQZgRSEBcJ7LIBWguA0Zifu+hXgpooVqZes+C8VZhl
   ryM8191eseTun0Jk9CxIREsgMh+NdXKJDCpEjADcAfRgBPEjL/APLT05X
   w==;
X-CSE-ConnectionGUID: sUovUmzZQiu7UOeQnZ+lXA==
X-CSE-MsgGUID: fU0k+gPFSlaEoG3X4O29hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41754564"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="41754564"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 02:45:15 -0800
X-CSE-ConnectionGUID: a8D6vwPASIuArQdmmQtUYA==
X-CSE-MsgGUID: jrvGDZ8TTGqm62AJLWVKRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118883303"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Mar 2025 02:45:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Mar 2025 02:45:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Mar 2025 02:45:14 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Mar 2025 02:45:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L/HBs8I6Kp1WlhypRTpJ3mYX4tPBlqwnr15IzR0U30gDpwmPIziMqWAMSSOplJyEWwKNY5F5ocfj42SBS6+WjGltYpNX16aM+HPNXXQB/52DM+DY4NFDtdaMyF6kqe6bs3STCcYHoGCYwFz23VVj0G/zNncWZgNR+VPGe2bgjfytF0CNmcAsd9n44qKvd9MtigvTuYxtw2CpPHmX+6mQ5J8OJWveL7MfENiiTDY/V7I/UEPJVpasykBFXiGEDF4KqvD6zvpGdTUkVEM+j5R6nmk+cSHihgYR1bPrtfrK5tSzClXvEcAwNkNtGWKnD3uzgXgsCTQIpmSpMe7GZPhGwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ddyMWDWrvdPkKrtnnxufUJeZYwcdKpcdlMiancOUjQ=;
 b=VwrXG8brGZ9BdS5W4Us32TMlQeVGFczU/eE23B5V6T2BxbjIKzlxnYeT8XUgfPjpM7/FS7+usROIZKVw2HtbEWTQ4usvkuuUr1/8UGj4XvZdy26GmfrtJC4+FHCwwMbvBR8qOE18qps5R6n+YnhsmHZj6GXmq5PcxVxrI2cb/swebhOqVZrhGAy6ixZ/TOk1adJ7BVxBE0irj8PC+tkRVMW4QONAGpOr7oCXEk4192KL24FIVne54ZZpv4dy5H5MirGGVzAdXcbw2ovtNM1MmGwh77p1fbw2OuKAY8yZexAxtvpWGnMEIYKymWAqdy+rvUnwLloKfIYintboFiYnZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3605.namprd11.prod.outlook.com (2603:10b6:a03:f5::33)
 by SN7PR11MB8044.namprd11.prod.outlook.com (2603:10b6:806:2ef::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 10:44:44 +0000
Received: from BYAPR11MB3605.namprd11.prod.outlook.com
 ([fe80::1c0:cc01:1bf0:fb89]) by BYAPR11MB3605.namprd11.prod.outlook.com
 ([fe80::1c0:cc01:1bf0:fb89%4]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 10:44:44 +0000
Message-ID: <34795c29-d256-49ce-9d01-435f8cd91611@intel.com>
Date: Mon, 3 Mar 2025 12:44:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] perf script: Make printing flags reliable
To: Leo Yan <leo.yan@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, "James
 Clark" <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Alexander Shishkin
	<alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, "Liang,
 Kan" <kan.liang@linux.intel.com>, Will Deacon <will@kernel.org>, "Graham
 Woodward" <graham.woodward@arm.com>, <Paschalis.Mpeis@arm.com>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <20250217195908.176207-1-leo.yan@arm.com>
 <20250217195908.176207-2-leo.yan@arm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20250217195908.176207-2-leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0149.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::11) To BYAPR11MB3605.namprd11.prod.outlook.com
 (2603:10b6:a03:f5::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3605:EE_|SN7PR11MB8044:EE_
X-MS-Office365-Filtering-Correlation-Id: 499b6e7b-7b67-4966-a7cc-08dd5a406875
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QU5IWG1WQkMyenJURHJkRG5NMXJjTW4vZlZUcU9QQnpkSVJOMjVoQk9JUmVm?=
 =?utf-8?B?Yy83ZUdqdmxBSjZJYjFsQmhONEpwNDVDdDh0R1RYcisxck04NitMZGpIODVT?=
 =?utf-8?B?V0xVZUtQbUp4V3B0OEFwbTQzWFdSR3JqTTFlTWQ3eWRtdE5GZWl4WElRWkRY?=
 =?utf-8?B?bTRVUWpzMWhXOVR4amh4VUNHOGFGcHJoVWVkYVQzVzFDekdJYXBzWmtBRG5G?=
 =?utf-8?B?Uy9rVzltK0I2UzAwdjdWTFZTanFmcG1mTGlha3NHNm5wcWZaakgxaGdyRzQz?=
 =?utf-8?B?WnNPYk9sYkNUT0NuVGhYL3lBTG4xdHlIQlBtVzlTamJOaGcxVXZsSnp1dy9w?=
 =?utf-8?B?K1dCSDlncDYwRDBGcUtCbEZjN1ZTN0xSUFVjWlE5ekNlam53cEZIcHd1WnR5?=
 =?utf-8?B?eFp0Q3lkdW4zN2lISjFSWnRoekxGd2dNM3BuYVZ6ODVEZjRnY2xHSndWaW5h?=
 =?utf-8?B?TDA1WUZEdzlucGF2QUwvQmRubXp6d1ZXTUdoa1lIS2pZeWovQ3BhVERzWndo?=
 =?utf-8?B?YW9qNGVvZ1VITjloSlB5VHdjaDY3VWFtZTlJb3M4d1hWaEVGMXlKTmpUb0Mv?=
 =?utf-8?B?OWo0YzNOWHRJOXhTY01jTyt2SXNocTQvYVI5UU9VVzJ3L0VsQysrYWZPKzZO?=
 =?utf-8?B?QzB0KzZGZjJaeU1BTUxGMFBMdU1PTS9FRExpR3BwTHBmQzJQUEFYUXd5M2tm?=
 =?utf-8?B?TEJtMDRZNlc1S09hNFlLSmtkdDlhSCs1cENWQ0hrUGpMazNLcmZyUnRwbjdF?=
 =?utf-8?B?RVo1VFk5NEprcEVWblZxd3JNZjl6K0NaTFU5cHlwRm00UUh1WmVFTzBtWkpU?=
 =?utf-8?B?SC9Za25td0JRZjF5TURMVWtTWGEwMTdMWFBYRUREV1BpdUFBemZrU21NTHNo?=
 =?utf-8?B?eFdkK1Q0ZGNGeXBITzVHS3hhQkFiQTFEcFE4MzJqaURTZnhPOTZaZ2t0d040?=
 =?utf-8?B?dnZpY1hMNEVsS1dxZzZrVVZBdWF3TzV5N3dXbUZTaGdiT3pQSDVYMHJhN1ZZ?=
 =?utf-8?B?QlNydzlCTlVsclM3RGxDYVNrN2Y4UHRLVTdpWWNxVzg5MDdRVEZQSStPc0dL?=
 =?utf-8?B?eWpnQ1M5S293ZUZXTzd1UlZLWGMrbGMzRUFUdDA5QjRPa0hIbnUrUWdwY3Fn?=
 =?utf-8?B?RXowNytqR0t6MkhiMTkzaW1ZaWFSc1BtditIMXVGT3ZjdTZjZnkyOU5DcUhx?=
 =?utf-8?B?aUg2azc0a3NmOGRnRGl2UlhxaU9JMlJzYjlUVlkyNFM3cGZjbkNkZFdWaFFR?=
 =?utf-8?B?UGV4VWpMTGozRW5HOEdrcEUwMzE1bUJmOVRlbVk1aSthNFVqUENYdUdGNytt?=
 =?utf-8?B?WmlTQzRkWXNTRHVka2M5ZXlZd1BMNDR5dlRsZm9mQ2dVZkxKa0R6OGJyKzJL?=
 =?utf-8?B?RlhPUmxjeFkrTnpaSmNPaFRLblh5WXFtOHhoL3dKWWhvSk5EVyswUzBjOElv?=
 =?utf-8?B?UzRhTHNhaG1NcHZNeVU2WHljOWYvMEJvZ1pvV05McGFtZkhtTTN4SlpHeS84?=
 =?utf-8?B?YW1HQWN3RldhVmpYQkxGZnRXTmg4WTFBMTB6Q013Nmo5Sk9xWGRyNWh0cmdx?=
 =?utf-8?B?MjJKaDQxOWw5b1N6Z3NhbGxqSzJlenJNdE8ybjZjRHM2SzBvWmN2WHZhd3BZ?=
 =?utf-8?B?WEFJc0lEWmxxS1JWdzJGbFdOQ0V5ZHd3c08rMUY1Z3F2RDByQ0R6MmJMQTQx?=
 =?utf-8?B?aFQxUTU1NEV2VlhQSTI4ZGpKMlM4alBPWjN3S2pMMHFvOW1IYnVxSnRYajlU?=
 =?utf-8?B?Q2tqYUQ0d2JBWmZnbnRJdlpiZG4rcDBzVkVqQmFDVDZBREdGSXk3Y1JWU3dl?=
 =?utf-8?B?VFJVeVFrK0E1WWJjeTltZ3RkWlVpalJRRDFFbk9jOUUvR0RTOU56OWpVRmFZ?=
 =?utf-8?B?b054UTBxZ2thUlZDajZpUThxRy9BRTNQaUVLWU1wQWJmOG5VL1U3SHNtY3Av?=
 =?utf-8?Q?O7jJJc91yjM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3605.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGpSQlM2Sml0R25PenpOUVlYc3F5UlVma2lCSzBaZldBQmoyMmdIUTlrdTAv?=
 =?utf-8?B?WUM0Mk1pYjJVTWdrQ2lDaTNzYVREY3oyRkxOeGU4L044TzBtUG1CaHh5a3Z4?=
 =?utf-8?B?dnlqSDArcDhoMkYrVUc1bWVFQWJhanVBUktGOFdCZ25GWmluQmpZK0wramNx?=
 =?utf-8?B?Q3h0NTN2STNFNDRYdzliOWhKYzltaXRsZkVSWityemlhckp3YVEzZlczQVBF?=
 =?utf-8?B?Z3krSUpreWoyNk5QMUgwMi9TQUY5SHJpem80K0s5MWZXSkNVNHlhc1l3WjZI?=
 =?utf-8?B?UVhFRXRDL0g4c01QZEJqS2szamZjb0dpalpaRmM0S0RGN3loWmx4NEYzVXJp?=
 =?utf-8?B?OUU5enZhdi9MSGJFaUlnZXhJQytDZTBZMDJMODBuMzNUSCsraFZnbm1iREox?=
 =?utf-8?B?YkNZSkZWUHBXRkxXZlo4RmdSTk1nQW1tRzc4bFhnNVFmOUJJd3l6ZEdGaE5a?=
 =?utf-8?B?OGhpNTBNaWI3NDdyVjlYcHlMdW4rc3lDZGp0UkFrdXhqNFdHRk9QWk1rMWpv?=
 =?utf-8?B?eERlMmhESFY4VnRSa21mTVFYb3FGaU9ZSWpwVnBPVC9OWUJ5Mnl1S3VhZUpa?=
 =?utf-8?B?UmpNS3oyS0hNc0Z1dEN3ay9abU9EUTBjRjE2Q1VYeFF0WVpTZTJrcUhCUEFy?=
 =?utf-8?B?VEJlUFVsb0dEbk01c0tidGMwNXlhYVpmaFYweVRCZ3pyK1p3dlYrVFA3QlEy?=
 =?utf-8?B?YnlEd3VKVnd5dFJTa2IrbVBYaTF4MWlIeWprTXVVTlFhRTBUQVVUcGpQL1Fz?=
 =?utf-8?B?Ky9mZDhYblVTenZPTkJvQ1oyUkYrbSswZHY3Z1BQeEk4UEM2NU91S0JadjEw?=
 =?utf-8?B?Z0RiOVNUbGlVUG1KbUhRVnBSN082ZFVITEtaQkYzRkdMY05vQnVrV29vdWp2?=
 =?utf-8?B?S0FoK0t4UVpDMElFVkxiWmk3L3ZGdEN2b24rN2w3cng4dXhUYlVoMzBmU01H?=
 =?utf-8?B?dSthU3pPcE51dFhIU0ppS3FEOVprcVkvSWs0Q2lZUkdBWGV3TnJpeHplaXFH?=
 =?utf-8?B?Q2x0QVFDSklDMktFT2VkVFBiL25lSU9OSWJMcytoV2g2TGU1N0hvNDkrRWxi?=
 =?utf-8?B?VUg1YUFKbFJNbSsyQUtXNk8xMS83NHJmYURvcmJ2ZW9xZUI4dFUwS2ZTVklm?=
 =?utf-8?B?WFN6ZldXdjlTRGJXSEZ2M0NiSUR3WllvaUxwOEgyV1cyN0h2N3RFZFpRV1M3?=
 =?utf-8?B?Rlp3dmtIMVpEOTZEcEhYUzhobWNqUEVKOHBLYnpjWmtJTTR3S1dWSmlhNnhW?=
 =?utf-8?B?cTY2ZW55WVl3T2VWM0hNVlp3ZzF4UkRhRkFRTmtHWjNqSGtVWDNKcGlyM0ww?=
 =?utf-8?B?bkdObUd3blBkOTkrVkJ0eE9acktscFl4SDUxcU91Y1RLejc3bStuVnZQRVRp?=
 =?utf-8?B?S0N4cnJXd1hmQUJRK0N4MVVRUTJjczVPM0VEUEhya3BOWDRpTkREMHc2QmZQ?=
 =?utf-8?B?SEhQK21MblFwbU4rQkl6Q2ZTWDlMMUwrTEdKZUZiUkRQQU5lTWpHZmsyZDBu?=
 =?utf-8?B?WGQxQ3FLNHpid2lqNmoyaDlUSTVGUHM0Z2VQbE9jM3l3TjlSQ20rYjZTRy82?=
 =?utf-8?B?T0Vmb0hsdldTQytRUE9YSTY5VzFCczVQKzNFYWsxV3Mvb3lwZnhJMXNYMmRn?=
 =?utf-8?B?SEVjNVEyOC9ZREZDL21sVi9WdUJCL3l6SHE0RHVta2VnT3F5TWplQUQyaHVB?=
 =?utf-8?B?cEl0REhXT3k4VllTNnpoWTNLNkVFL2FNSjdLQW1GbVhjN3JSdExQZ0hMM1JK?=
 =?utf-8?B?a1hLdWZTc212enpRSjJaNWVhdmVlMDFEdTltc1lBVUIxRVFqMWhaT080REo3?=
 =?utf-8?B?MnJBTXhzMjk3V2Y0MU1PU1dLeGFYY3BkV2YzcVJ2Z25Id0lrMzd2OW0vZURS?=
 =?utf-8?B?R1hHTkhCRE1iUkhMUFV4YzlHL2lIZ0FjSGZCRU9EN0JmbVNobXpMUWExSTVa?=
 =?utf-8?B?ZjZvRUpGTHR3dFVBUHFXTThWeHVFdWhmNFYzUWlTTXRjRzlDSmQ0RWdET3Fi?=
 =?utf-8?B?YlhXYWR0Q0JPTEJyRHZOMU9ZY1pmT1ZWT1BCVlZOZXRvdk1FWW80UHJxSFY5?=
 =?utf-8?B?WDVQZVZ4Vyt6OWdqMjE2ajNmVXZldWgxMlMvVjNNNG1QN3I5K0x3Qi9Ma01B?=
 =?utf-8?B?TzdObG1rWGRyZ21lb1l6eTc4S0FHai9ad1Q2RFlJZ2c2QUx0RkRuWXJtSksz?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 499b6e7b-7b67-4966-a7cc-08dd5a406875
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 10:44:44.0022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g2tybsl1CNnSU4YdzKadExW+7BWqPNLkmtpxaUq1J3D8JnfYO7UjL+n2jzDclqSXiVORC62USvye7jn68UB96g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8044
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_024518_889631_9CFB8BB5 
X-CRM114-Status: GOOD (  17.71  )
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

On 17/02/25 21:58, Leo Yan wrote:
> Add a check for the generated string of flags.  Print out the raw number
> if the string generation fails.

How does it fail?

> 
> In another case, if the string length is longer than the aligned size,
> allow the completed string to be printed.
> 
> Reviewed-by: Ian Rogers <irogers@google.com>
> Reviewed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/perf/builtin-script.c   | 10 ++++++++--
>  tools/perf/util/trace-event.h |  2 ++
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
> index d797cec4f054..2c4b1fb7dc72 100644
> --- a/tools/perf/builtin-script.c
> +++ b/tools/perf/builtin-script.c
> @@ -1709,9 +1709,15 @@ static int perf_sample__fprintf_bts(struct perf_sample *sample,
>  static int perf_sample__fprintf_flags(u32 flags, FILE *fp)
>  {
>  	char str[SAMPLE_FLAGS_BUF_SIZE];
> +	int ret;
> +
> +	ret = perf_sample__sprintf_flags(flags, str, sizeof(str));
> +	if (ret < 0)

AFAICT ret is always >= 0

> +		return fprintf(fp, "  raw flags:0x%-*x ",
> +			       SAMPLE_FLAGS_STR_ALIGNED_SIZE - 12, flags);
>  
> -	perf_sample__sprintf_flags(flags, str, sizeof(str));
> -	return fprintf(fp, "  %-21s ", str);
> +	ret = max(ret, SAMPLE_FLAGS_STR_ALIGNED_SIZE);
> +	return fprintf(fp, "  %-*s ", ret, str);

-21 means the field width is 21 and left-justified.  It should not
truncate the string.

>  }
>  
>  struct printer_data {
> diff --git a/tools/perf/util/trace-event.h b/tools/perf/util/trace-event.h
> index ac9fde2f980c..71e680bc3d4b 100644
> --- a/tools/perf/util/trace-event.h
> +++ b/tools/perf/util/trace-event.h
> @@ -145,6 +145,8 @@ int common_flags(struct scripting_context *context);
>  int common_lock_depth(struct scripting_context *context);
>  
>  #define SAMPLE_FLAGS_BUF_SIZE 64
> +#define SAMPLE_FLAGS_STR_ALIGNED_SIZE	21
> +
>  int perf_sample__sprintf_flags(u32 flags, char *str, size_t sz);
>  
>  #if defined(LIBTRACEEVENT_VERSION) &&  LIBTRACEEVENT_VERSION >= MAKE_LIBTRACEEVENT_VERSION(1, 5, 0)


