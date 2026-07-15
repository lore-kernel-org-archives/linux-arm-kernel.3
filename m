Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5E4C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 16:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77yvbFWNTrH2MGCIlXeId2iFYPBkll3lIsfU09JVDMs=; b=oNhMUBvXTh1wgLFigbiSzI70SN
	FfcieRf3/XVeuSNw/iiwwZ5aj03TuBVGE83JahPmexTcqKwaVEBEDk2atHZvox7W/mjikc33Xj6Zu
	kvoUwQROfmUUxSJoRPI4PJ+9VAtUHawCMLhp/F2SE3U9QK9noWX5HqRKjsVGAN3LEd1Q+D7feql5Q
	ZHLFvqml8jGm8On5whxz7Ep2fFB459ad/AAUGrgySRHR3UAeEgDinzQ1g5aVShcjGlqrj0v+am3CE
	zTn87AfvdqBrgaIjCpPtwepH3FGUqGXitz3IzUj+hrue914YDJEsemN0xpCx/Cb6MNVAhLdz+8OyG
	bUIw2xxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk23t-0000000FOlY-0AII;
	Wed, 15 Jul 2026 16:02:17 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk23q-0000000FOkW-3AMy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 16:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784131335; x=1815667335;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/lMPtaVm7zWbpnXOxNx6SKG5/MPfYTWU2oUdESTd4Ek=;
  b=G+cjdt4xT2wm+WEei7MWsQPEt1qQQXPhMmKQuCl0pMLAaU0U4hcW9pxL
   8Zg8/m17VNOiptR8PAYAThFcjdIt+e/PUwHG6Krnmvqlhmz+zIsS6D0DD
   uyxC8PoDqmq7WU3DgoRFdO/TIWz7pxgnKJ9FRoB1jJIKWZ1JsZnzGMFc8
   dMky5SksxSPS2EomrnytK5eFZrw3/8cNy0yV/XY8i/uzl5gJkGRHofJVY
   jKWxoly+WasSDXZt7/Tne1+blaZQuwCpcjfy7cJhUo08iUzIQw7bx7Yyv
   xzGIqeTRftPED1W5XgLXWrDzcZ0kZ9Jv+TFdquRkgJeBmuGHKiXVklOKz
   w==;
X-CSE-ConnectionGUID: 5cF0+VobSP+ENc0QAMn9Pw==
X-CSE-MsgGUID: 1CpQdBFuSUOw5FLJGCvrOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95916650"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="95916650"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 09:02:13 -0700
X-CSE-ConnectionGUID: 3mkGBLJWSd68hjmkIV3L+g==
X-CSE-MsgGUID: Fi13rbvmS3uJLabIJbyp0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="255101255"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 09:02:13 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 09:02:12 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 09:02:12 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 09:02:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDgHqvB/MXivfupQ2Q6xRkAccjX8juXgXtYV0QyitOGKkJ6N3tR9/A9OwQ7GWNiRv3/lsK8ZqwITBO7MCoHwV+WcXvRVnHeWMRGeZzxuC5x1B/uqYEQavSy5dqmc5/oQfAxOc6c66mWujkDPy/J0Nz5x9cExn+ATAVww69A91Sh2T2Myb+9SBwyGncytjg7ELXxr6B/gwFLg3uJWVf8famPp0Y5I+s5on1gCUYgiT9fzITljxXBRmTDN2hd038OKx4sz7C+Vp4OKq+pc/QvbC54og3ff+VLrCpGpfyQTSb67cMKYqZRfWt5GMj6htIEHO1nxc17HwpVATUWUfUPppA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=77yvbFWNTrH2MGCIlXeId2iFYPBkll3lIsfU09JVDMs=;
 b=YH9NBigxM2PD45Ubm9CnxhBzzIXBTrkSh+SdTcO/gt0so/+4NHY8jKptyjmeXM8/nExD+pLWHXdDFPRjW/i+n6NRvqj5jhRDItqb12PT1eqlEtN047W+JMiE40xL8NagEBsm1SLgXvB6pjE+g2C0Fhl4xaPUchCTIRKOk/ngKkffxAR75+Dxfn/IjbvO2PET7TF4EuSovwk5iolf0mp1zJDzB/gQo9CKYqXlDYfIc6ZTcKB59EArtYlPFgBYDN4+bZOyumPkhZGM55+FJG3GiGW7h1uSWQ9eRwHyfTboJ0hMPBtG57zlGMeD3fWmNpafd7oBQ135ihduZV2IEhaGGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by CO1PR11MB4995.namprd11.prod.outlook.com (2603:10b6:303:9f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 16:02:09 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0202.014; Wed, 15 Jul 2026
 16:02:09 +0000
Message-ID: <570b8f08-33b9-457d-b101-8579eb73e4bf@intel.com>
Date: Wed, 15 Jul 2026 09:02:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time
 conversion to be per-arch
To: Gavin Shan <gshan@redhat.com>, Ben Horgan <ben.horgan@arm.com>
CC: <james.morse@arm.com>, <fenghuay@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <corbet@lwn.net>,
	<x86@kernel.org>, <linux-doc@vger.kernel.org>, <dave.martin@arm.com>
References: <20260709093111.367851-1-ben.horgan@arm.com>
 <9892de2f-9e29-41ff-997b-a6a2e7c98585@redhat.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <9892de2f-9e29-41ff-997b-a6a2e7c98585@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0254.namprd04.prod.outlook.com
 (2603:10b6:303:88::19) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|CO1PR11MB4995:EE_
X-MS-Office365-Filtering-Correlation-Id: fe1a0727-9158-411f-10b4-08dee28a6cad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|18002099003|22082099003|4143699003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: Bvarhtn490+msr6heLrEnTJe5Gfk/7r+aBoQHBdmR4/e/dSoM1d70yEJt2B55xPu/d4sNK1F8LUFlB0LEEWx5TmRKr+U7sokHGeRiK/VcUT90XNlJEq90qyYT7eKn7ZJ1Je5trly1d+PPfU+W4OcTvEJGByRBiF/mMuHWR9CfHquBqV7VthKqsrUgMdzyeSAN4ZMiklth3enKFMao5d+x6zvkVjKmJl+OjPRoJo0xmJ81VYV60gAO+Xf0UGje20wUEeJmJlAgQgIR4z294r9CWOSAT4rq57UOxoE7Nygg+ZhJudehtWI7oU6WKlW4dDcPeLXQqRUrr5w0lP+AbDXmUBhJe0LLpoQTCh50X2NS83nZSTRZ9CovfmC/a9IaxQpnaFzL5kOhPNLXDiwkltKBgYDJrEi0ZN4zgiDzEuXjN287kPyY4Hy3c7eZLW8DMxxiDsLyFAeJdOjmjWEyZt9ZzTjTJ3CD/dr2cXrfVBxZTntbaSZN+RFZgCl3Rw+zJtHNstEAg5JzbvGjJTRaIo9Vki2Ue8phasiupXzabSqIabj3XF3cFoV4oSsGDPZsmpWSoPrXErowtepl9UAGVZ6T2RBcMHIS0rjNjBXzpKH9iOQKa/idzGxvkNF7d5wiK3vnBsyVlfRLZF1U52gYkzpkDNP+UUosFion6ZUo198pls=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(18002099003)(22082099003)(4143699003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlBBOUNKQ2cvN3V4Q1pMZ3FwamRvdDV4b1FubEtsRFltVE5PRmY4ZFRuUkdO?=
 =?utf-8?B?b2xpcm5ZUXdGMk9lbVdMQzhLVW5qTnBkdjYwbVpVRS8ydE5taXVQVHUxbU9E?=
 =?utf-8?B?T1pRZ2dpZVFRc2lYSERibHZpWDdta1diaW1CQ3FMNlE5L085YVRvMi9oK0Iv?=
 =?utf-8?B?QVNpNzhvUTk5UVdmU3B0NDRhWGJESUVVZDRCNzZRQ09kM3lBRmVNKzlXV2Fo?=
 =?utf-8?B?WHRnY1d1anIvb09qb0M5WG5CdTQyeW9nNlFubkRGZHV0QTRGc3BtUURCZGVG?=
 =?utf-8?B?VTFPV3BUdXhNTlppRGR2eGdCdnc4Z3graUFTSVZCWUNxeEdaSnNPMXBnZXV4?=
 =?utf-8?B?QXFZTzY5dHZjOS9vdFZ2aFNDbkxsUVZITGpqb0JhZUNTcTZCdEZpblgxaXFh?=
 =?utf-8?B?cnVuV2JueHZyb0JIUUlZdFp1TkRReW1FK0svY1kvMXNMMkxrOU83NXovUUpv?=
 =?utf-8?B?QmNHL3poa3krNktWQldDd3NWYzBsOUJ6UGNYaXYxNHRCS1FvNmwvNVU5NjBZ?=
 =?utf-8?B?Ni9HLzA0UllFQTF0ZjZFQWRGbTZlUzVSRE52QzkxYkpIQWZibEY3cVRRR0JB?=
 =?utf-8?B?K2wwK2hVWXc2VGEvZXZyNEdQaElWdmNSTFU1eDJScmZlNWY5MUtNdkZGMFZz?=
 =?utf-8?B?bDBwM0ltRWxEbnNlVmNjRnUveXFLaWUrOXhoYm1LNjRyM0U1T0N2SU1BQTNk?=
 =?utf-8?B?alpzOGxqY0pMQUdpdGZwY0xPbWxOaUI2a3JsSW1MVDQ4eDhRTlE1VVdlbTVT?=
 =?utf-8?B?am5vNlJiaWVRZXY3dEhwd3NoTVVUcnoxazkxK2sxanVyYUdETVdmNDhvNDNi?=
 =?utf-8?B?dHRFSDREbnBSY3h1YVBmRkt6STdPV04rR1hmRGE2eWc4YTdsZFRDQVZqRGNy?=
 =?utf-8?B?SlZqcW94WVVHaGYwSmtvSnlEMDliRmF4dUlvRkw3UXVHb1ZYYURUeG5DZXFU?=
 =?utf-8?B?aUptOGNuYzcyYzU1dXBmd05od050SnNFSXZaNnZndm1YR21CR09GZzVZMDJK?=
 =?utf-8?B?R2l1dk9peFhXcHVXMklOVFdOY2pNaEVpNjNsWHBkM0xtWkVkNGJ0WWRUV3Nk?=
 =?utf-8?B?RzM2ZzJKNzl0YXJYcWJzWlZxN01EdU5mVk5ZS1JyWW9uZjlveWF4amVQcGtB?=
 =?utf-8?B?UVYzekVDeGtneXd6SWpBQ3hHZi9OT1M2bWpSaVpISFFockxVTXdsaVR1NUVi?=
 =?utf-8?B?dmJEbUdiaWc3NHBOSmhPODN1U1BHYkdITVFJcnhlWDJLVGdjeHkrOWFpU3Fv?=
 =?utf-8?B?RE1oZWtaQ1pUck1JN2NSR254dlAwZWNPU2xqNXg1SEFtTGNMQmE5Nnl6Nm5v?=
 =?utf-8?B?cmJoMGFSczU3QmJ1bjBCbEJKbmlTZWNyV1VvQnY4bG1ndkZXK3poRlMwZGRu?=
 =?utf-8?B?ZWhuVk43elppdjh2aGlXeVlzVWs2SG0yM0o1QTdETktZRkVnY0I0MjdTSGta?=
 =?utf-8?B?enhDZzhNY3E2b1hyMFo2K2RSZVFMNXdjN3ZocVFIUG14QTRXVTZYM0ZZN05z?=
 =?utf-8?B?SEdaVTNXYlpjbDZZQThlT0dQdjZrR05uSFJjSVAvREI4MUF0Z0hUV2VyNEtB?=
 =?utf-8?B?TnpZQjNyMDBUUlozZmVhd00zSTdBb28rOElnaGRnRVNtVFJUb2JYdEFodG55?=
 =?utf-8?B?TDdUaG91VEJjY0NRT1FkRklOcDhqOEdCZ2g4eWhZSEx4ak9VekNHbVhOdjYz?=
 =?utf-8?B?cUdHdE45a0JUNDRob09BYmtDMFd4NDhIeGk1eGZ2NDZ0a0lWT21ETUVoZU53?=
 =?utf-8?B?ZTBoNjdlVjgwQ2xJUXhCQzZ5eDNXbTY4S2pjVG9aSjFPUzB0bUJDZGNQczJL?=
 =?utf-8?B?cDFteG1CQ1kwVkJ1Um1zUThTN2QwcXdpZVJyQ0lkWElWVTBBalZOZUcxbGxk?=
 =?utf-8?B?L29rNzViOUN4bjhUamdRWUhtZmNUN0VrMGJFQ2gxZ0VMTTA4eE9xTXROTHNt?=
 =?utf-8?B?eUxqN2pSN0x6MGIzcE1tNHJLbWxLb0c2RTNCRCt3T3pVY1JvUzJGKy9rdTFq?=
 =?utf-8?B?OS90MVB4bERhWURYKzdiOEVMVndvckZJNXBCVnQxcDZ4QkdNb3JvZXdIc0JP?=
 =?utf-8?B?b0NtTVY2a0xMZS9DQmZaOVB6MzNGcDBrdVZSeURiYVhqSkZBeHRGaDBSeU52?=
 =?utf-8?B?TVh6c2JFZS9RV2xDeEQ4TlVweHlkV3RKS2ZpS0NseDNtNHRrK2NWdUdIMU9L?=
 =?utf-8?B?SUZSRXMwSktCOUtTZCtkM0EvMjZMV0o0TVdIODhScFVIUjNLaTJYakh2Y0M5?=
 =?utf-8?B?N2xZaFlEbmovMFhtUWE3Nys5K2hFdkdER0I3STcrUHl2WmZLV1pBN25ZS0Nl?=
 =?utf-8?B?STZYQTVOR09zYUJVL0ZJS21MQUJNenBHdkJ5ZDl5QnJhek5LbVNSUElZYTN2?=
 =?utf-8?Q?sul2N4eOWzacZTpE=3D?=
X-Exchange-RoutingPolicyChecked: aajSkT/ICcS6JsitVrXxB1lQa1Bv1nP70KC4kozo07HoFAQVdtHXzSU3b9t8QzFmZ1pY3vXPhFd22PuO+9P3yU1FE+X4inzShUCSfEBPNk6n71ymGKtKXJ2YdRars3ULY1QSDRyBu/Ajo8WmMyTmRjDiu0IIjTyUcbrEeb3+OG3Fu+K3iA/t9w9++hJ5N4zYYUbExGt1EdTVWC1/7s7FcGmIuuOKIW4KCMt7tWMSXxJkUnFfyIUTIataY2k2ZgyhzSgxuNcEGTcFLZm7a5yCaE2RpQpE6lTfkaQMJT3yAsY/HP4vn5vM8d4DHiya5v8RHe1jaEmgiY1EkyAJURh26g==
X-MS-Exchange-CrossTenant-Network-Message-Id: fe1a0727-9158-411f-10b4-08dee28a6cad
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 16:02:09.1267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ohdnz0C8zD5vsJJvs5bP22L7eMllZaxrSqhrSlFojB4DeI6B3rSRejIwhWOPa6y53mAsQ/VBKrDF+/8/1m+NpsyPTFBEdUEcAaVVX1FkI3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4995
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_090214_839690_13EC8D16 
X-CRM114-Status: UNSURE (   7.06  )
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



On 7/14/26 5:13 PM, Gavin Shan wrote:
> Looks good in my tests on NVidia's grace-hopper machine. No errors found
> from the kunit-tests and the MBW limiting works with more precise granularity.
> The code changes look good to me either.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
Thank you very much Gavin.

Reinette

