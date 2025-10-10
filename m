Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA812CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 02:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Subject:References:In-Reply-To:
	Message-ID:CC:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dc9gUCSuFfovuFbfHgn3qIjsxOqZ2OiWYe6mxl1SLmw=; b=Aegk7BO8qXOmtg
	s6VAHHqJnMAhGWWiqD+34TxaNdiOvfgeBNgS5hAaZyp8hRNP1RilHF1A7MXnevD9qaazvux31//X7
	EYDFXliRI1yy+D71NgtNUv83mvBYiqC/XsNRiGaVXm5+rxZtFv/HM8bf34jMLjOjtR+0fwnn3hsmL
	gRiVzHbdv43eybNt+ERjhOpFP8J8wrj4NeR/rjFO5+0k1c2fZdqiHmyYdeuQiE3c6/Mt8fPmW0DBy
	l7OcRpCQybHq+fm5lc/2mlKiVJ3/iWM2jNO7QxTMJJ/rNABnTXhhQ7nDXWoC2dlSYo+kQ800Ch3xV
	o8NFlSZLSqfEfjj7pelw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v72nt-00000007UlS-01fE;
	Fri, 10 Oct 2025 02:24:21 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v72nq-00000007Uki-46Fe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 02:24:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760063059; x=1791599059;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=HdtDzDUIXZ35FLOr9TvhJD6BiYV3pV7qkInjUONGSfk=;
  b=HuBmLRbMSXXi9DGSPxkkWQd9zZRU6CpqnzS9oAC2x/ip56qLhXG8WIju
   aKbBjYnpUu6CU9n7I/xaWdwUDq0mFh2tOWOe7004gIEcQ1BlQrFYLxkUd
   L1Qu4T43zDyrfimdYDBcy5iaQ0zPfk850tSLoCbIGVcxYAyreAnGEd3u1
   gzua3jbu/fc40386KJrY24wdmruLrw5VGBbYWC44KbiIhj3+uOdFRx8jW
   43u02oOlbwn+dvWtSi9uX5oWoiFP6Gf0AW98KFSRVntbfratunSBgnqsF
   vFyE3pRf0IpXTIs00Pi8eY/6Kw0s3kscUJnKGxy4YE+rFr+p6FIRairxy
   A==;
X-CSE-ConnectionGUID: jS3njD1mTaOaCI1xQiNEqQ==
X-CSE-MsgGUID: 6ihERUlcQ6mDApoPb9AEQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="79725793"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="79725793"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 19:24:15 -0700
X-CSE-ConnectionGUID: GG+kLJZfTkakI7KFi3kLFg==
X-CSE-MsgGUID: ryPO/l1hSfCh+SBxQxUijw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="184895125"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 19:24:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 19:24:14 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 19:24:14 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 19:24:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgPjnA6v0Ctgt+BuPbcAWhPGAZD3JKD5sHj6b88GmUViH+RN8GJkjexqC/xejDwIwLOeGYWr1ycwMpPivivGevZX9qmH1LXZvsh8WdTMhCC3hoOa+m1iDC3w93jTd5isL2GW+Ag7gQqN43g7BAsK6LX0XoJWdLQjflWyklHR4jYXVIBtSaUSLbE5zmyR/lfAtlBHOT5UU/xw0jnArIFIBh9J76n9kVTt0EgazntRHu17Y264MzhNM6yQLZeMkWl2cRXohUHoGlQzJwpFjih3/G/XnvMHhY6AU5YXWQc+TlxtPP6GRScTwDxDvmUZH+oyRLD6P+X++PgfZ+RKVQWpSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dc9gUCSuFfovuFbfHgn3qIjsxOqZ2OiWYe6mxl1SLmw=;
 b=a6RZlvf9P6a5wixb2BNGyAiHu9mvjomTyMf4lQYt+Vm7/RA1W9Irnp9aJDef/FJ5Dim4OUj162/TMK3T7sUjx+LPEZpm5JuKT2irwaq4ZtaAn5GjxJIo3LyAOI47CxvGWPHRCqFrQnWXZ3PdKiYd1ocGtL89JPN4O6W7YDW7exCmlE1nH3DXIyIK9VVqy2VjvuYfftuRlUoa/4AauduYx1VjTUWZ0AtSI5JIb/Cg/UYLOgTimsrkYtI9SFoTlydaU9OKnzDPhC6kSoZ+qOnENdCgbeY72IMv5j7H7TwCZnOqLBfb+Vuc0PclibryAuK+bOwP1Q+hftVw6yGGEfI2Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH7PR11MB5793.namprd11.prod.outlook.com (2603:10b6:510:13a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 02:24:07 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff%4]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 02:24:07 +0000
From: <dan.j.williams@intel.com>
Date: Thu, 9 Oct 2025 19:24:05 -0700
To: Jonathan Cameron <jonathan.cameron@huawei.com>, Aneesh Kumar K.V
	<aneesh.kumar@kernel.org>
CC: <linux-coco@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>, "Gavin
 Shan" <gshan@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, "Jeremy
 Linton" <jeremy.linton@arm.com>, Sami Mujawar <sami.mujawar@arm.com>
Message-ID: <68e86e45599bc_199281005d@dwillia2-mobl4.notmuch>
In-Reply-To: <20251009113557.000053e6@huawei.com>
References: <20251008132758.784275-1-aneesh.kumar@kernel.org>
 <yq5aldlka6oi.fsf@kernel.org>
 <20251009113557.000053e6@huawei.com>
Subject: Re: [PATCH] coco: guest: arm64: Update ARM CCA guest driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a03:505::9) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH7PR11MB5793:EE_
X-MS-Office365-Filtering-Correlation-Id: b52f4da9-af3d-4798-298e-08de07a41693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eEY2czB5UHRoZHQ4RnJYWmpxOHBMNjI0VXl4cm0vaDF3d0VmaGk0R2tOc2lF?=
 =?utf-8?B?djhUS1k5YTBRdnhZT09PRVJMNmhabHNKVHllOU1LTmFQTGErL1ZPU1FCMzNK?=
 =?utf-8?B?aEpMYjBJT1NzcDlLRUVnTDRDZDJnVHVDUzFKNVNXdzREaVRQVzdNbHBtdnlE?=
 =?utf-8?B?bHpvdG9Ydjc0ZCszTlh4bFFaTGpaZlc0Q2JvSjRmMVNyOTBwTGgzV3lEN3ph?=
 =?utf-8?B?YmlKcDNmUUVhRlY0TUtBb1pGemxSWTNWSzVyMFpUblZEL1NoL0RGajdENXlu?=
 =?utf-8?B?NUN1aXBrYzFzUGJncHFEQ1ZEOURJdjRJaGo3RGZtcUQ5N2VoOGtHb2ZCT0Rq?=
 =?utf-8?B?N1hSN2FSc25TbHFuang2WVhSZlhaZE5oYXoxYjJXQUJTYW9uT2k3NHJTb2Zr?=
 =?utf-8?B?ckVRZjVoQWxYdFdiQ085Vk1TQUV2ZCt0U0hxQjQxMWg0TWIxZjNpa3Z3cWlu?=
 =?utf-8?B?WUxWSlVvSHdRU3dxMkFOZmxiWWVRVkRvV3hxdFZUZXpabDUxRUVxMW9pTlNX?=
 =?utf-8?B?S3A1OXgxUFVSdE5wbEt3WXZPdG5PbUZEaTF5ejVRdzdWLzVGaWdkMXdMMFRq?=
 =?utf-8?B?OTNxcUN6SWMvcG1xOXZjOFVRTGpyblJLdVM0WS9uUis0a0dnbit6MmtzUnZp?=
 =?utf-8?B?NEIzVUZiQ1Y3N3RCNjkrbVEraVM0ZU05WUxYcjIzVjUxdjlKR1hkT0hsVHZh?=
 =?utf-8?B?SXc2V2JxS3FITWlMSHNkK0QwNS92bExGVUpnMi9qcE0zRnJRL05BcS9VUnpP?=
 =?utf-8?B?UDlIV0FFTWp3RysybS9GdWtrVmxYdXgzLzUxUm1FdURVditWY2lmMmMxOU1v?=
 =?utf-8?B?RWEzS1V0b3RkV29hU000YXJ5aERRWCs0akZReU9NdHhNRFFZZko0em5LQnJE?=
 =?utf-8?B?VjdhZ1RHQmpqcHFtWkpxR3orYnppdGN2MWlpNG84QXJKalVQdXV5cnludVRV?=
 =?utf-8?B?NEpKL1o4VjI0SEM0TFlOUW1wNGFYcnEwQlVMN05UYW9WVExwOWJQZ1lncVFG?=
 =?utf-8?B?a0lYdnVpb2ZXK2w1eDZwUUNGbkVGWlJOMWdwdmprbmp6MlZxOVpNdmFEekZv?=
 =?utf-8?B?eklVVHZ1MUNGZWM0Wk5lenJsWEd5MTBFREFBMThibDhlMjVwM3I5Wmczdm0v?=
 =?utf-8?B?SU5td2hDd2FGeXZ4YlNzQzZualdFR2c1eXVxb1Vpa0lIVEM5YVB3SE9lNTA0?=
 =?utf-8?B?TW1kK2VPOE14TlpuTk83SjNxVjN3dVY5YUNNa2J5KzNsZDM0OG1UVC91dC9X?=
 =?utf-8?B?RVIvSTBxamdHMVBWMjJ0M0RrRy9yWFBHUzRrSWxud0VXTUJicTM5R3FFb0RV?=
 =?utf-8?B?c21sUlVOSm00YkdDV1gxSWVjNDBNN3dhMHZIM2ljWmUyb2V1V3RGdGExbEg0?=
 =?utf-8?B?aGNqM3hIc2dUZDdUMWl3T0M2T3N4WmpyWTBnalpRMFUwN2s3K1ZNRWtNZGxF?=
 =?utf-8?B?cFpEMU54QTZ2QTdpaW5LNmtLTzgxNHVGekhRdUVNdDRkdnI1a25BV1R4ZVhG?=
 =?utf-8?B?QzJaT1NqS3Q5azdtMjFieXZ1L0s4Mm5nZWZtWEl1MXJqaDNSVXdRN0xLdWdK?=
 =?utf-8?B?Si9SRk4zR1hDTkdxYkVaOXJ1dVZMOFpwTEV6MXppTWFsMjdVWVlrWlluVk1t?=
 =?utf-8?B?UDVYdVNqaitHT0FsY05QdGpGWVI2Sk11czlWeHJBV0lqQ1hmdjU1V3BTc2Zy?=
 =?utf-8?B?TWdMNE9uVXovZkZCeEc1UGwwWlZqUGU1cTdpRW9XQS9yUDJ4K0tCbGUrcm1x?=
 =?utf-8?B?Q1hTMndLNnlaZ04zYkdTOFU5eW9TSGJmVUkwWEZpUHBxWURwTGQxY1YwRGZ0?=
 =?utf-8?B?TmtyK2RnWk9UMVBoTTNRc1loS3ZYWGg2YkdBNXp1U0drRGxTZzVYckZmcFpz?=
 =?utf-8?B?ZUF4dFhhVWViZ0lRTExuUlVHUTdBaVJBaTdkQ1JFSG5iam5oYjZOM3BkSFBz?=
 =?utf-8?B?S2lWbzNKQy9kUnRPS3BaYk8zVXJIMHlsbDAvdUZJZHB5ZThxNlFZcUp3SjRF?=
 =?utf-8?B?N2UvK2xqUnFRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVA4WFlSRmRsYVorcHZ3d29IYS9ONXpOOFludmloZjhuUmV3Z3ZLa2ZrbG41?=
 =?utf-8?B?aW9UUmZDaGlHcnBqbS9WSzlBRGZHNkc1NThjUTRVVnp1NXJjdERFcERzV3lD?=
 =?utf-8?B?M3ZyWXVLbHlrRlByOXpmZzYrUUI4cXR2L25TcTRvYjBaRklMVkpvYTYvS0g3?=
 =?utf-8?B?c2pnWnhxeVpCNzZ6MWJncXVaWkEwNjVVN1YrTEo0SmVnUkMybC9nbDZHZG5z?=
 =?utf-8?B?djZ3bDZvNmJJL0NXTmtzNnN4bXdtOFFqTk12dXErUVVZZ2JHcHVwUWc5Z3Iw?=
 =?utf-8?B?azFRS2h0dW1nL3FqVFVzRmpoM05RZEtmUGpZcHQ3c0tqYmVjRGVpa0F0eXpR?=
 =?utf-8?B?ZFA2RUovTExYZnJuMjhWdVFFQmNEcVdvTytWUWhFQmxYdXZpWlNMWnRXdkxZ?=
 =?utf-8?B?cnVqM3drM1hEVFFsTUVaZEZ5bUpqT1FJODZDbk8xUEx1S0R1Z01UZEI4Nlc3?=
 =?utf-8?B?SEpNaXR6b3NYK3ozOXdNU2JFWUxKOWhOVDFYNCtXWWpmQS9MRVhaSmc3Z3FR?=
 =?utf-8?B?LzY3TDZmL3J5ZmRkNnY2ZHlYbUtxYVluejN0dmx6LzVpV1VzR2Y0bGZ0c2VK?=
 =?utf-8?B?dnZYazEvQ1psZlZVNXFXR0RESzNUcmhVSFlGK3VPNEpBak1WUG1jVlNnQ3VI?=
 =?utf-8?B?YnlkRmFrMVlYUUNxa1hjbWdoVE13bmJqdHdCUGhRRVRWUkcrVkV3bjkrZXRu?=
 =?utf-8?B?aU1xTy94dmorTjBpekwrRTFGN1ZCU0Jpd1Y5VFRjVU5iMy9tRG9JblEyMXlI?=
 =?utf-8?B?ZFZiRHNyOUllUG9Gdnpwd2hjQlArNWJGYk8wRklpRFlvWHRPQStKbE5ZcmRS?=
 =?utf-8?B?MW9wc2RIeG5yMWVPUXlKSllRTTIxVnowaUh0ODc1TExuQms0WGk2ZzZQdkxV?=
 =?utf-8?B?RHFIWTJQTUNpZTVPMFhRWW9XVzFWbUJyalJ4VzdxWGRRMVRZTzJXRnhObjg5?=
 =?utf-8?B?WVE4UmNJVnM1YW9RbjBMQWUrSXczUTdoaDZtMlpGbkJqLzBzbDFXNW1FaDNK?=
 =?utf-8?B?cUlnNjhqbnR0aWJKWW5PSm1WbEU0RjFmUUszcERseUNFSzdkQWNRb1o2TnRY?=
 =?utf-8?B?MktRbUlnbU1XQW5MN3lWZHhldlJxeU1vcWl0aUh0Y3ZrRE1qQWJrNFo0cDli?=
 =?utf-8?B?TTExOUtmTGZvWU1uQmlqd2pBRU1GeUdYdDFlZDBES0xHWWVUc0JocERRTmFX?=
 =?utf-8?B?YzVXenRtbitMUlhiTG5ZNDJWbVFBdENheE5vL25OanhlNEtXb293Nk1sKysy?=
 =?utf-8?B?bzFGc3kwcEZLSjNPSEt0T0VsbDczNHFwZ0Z5alpmMzM0cjFsY2EwQUVob3Rr?=
 =?utf-8?B?dVJCT1ZNeFIvWlBCUnArNWVxdTgxM2h2anJMdUR6SjFsNXBNNnZsdGt0czQy?=
 =?utf-8?B?bDN4OEI0am5kTnIxNmxIM3ZWTU5ZZzRxMUxhZTNsR3VNM25ic21HdWRmQzk5?=
 =?utf-8?B?YkRTTVJabnU1cTVGVTBqYzY5UzNIek5TRFA1WXRSMFpLZjdSbld3NjFJVjRF?=
 =?utf-8?B?Qkl4ZXo5bnRJMm45T3NZM0FzajFDWHYwa1BsK3Z3MWl3WGczMTZYZjcyaTFt?=
 =?utf-8?B?bzhQaXhVTjVyYWwySkh6amdlVFM0R0NLQkN1bm9QU0xCQmlwdGp2ak9iQnhJ?=
 =?utf-8?B?VWJxZGRjZWhYaXUydXBGNlNGNERtdjliNFFvdVM4dDBySDNPZDlxWGVUM21k?=
 =?utf-8?B?SmZZUnJaN3BjUGoyNXhRUXB4M29hMFR1MUt4MEtvcHd6RzZKNjNsTXJrTkg3?=
 =?utf-8?B?WWR1M1c3NVN4UGRvWENBVnJmVkNrOGZ0SG5kWHpDQmt3S2VJMExPY09KRUVu?=
 =?utf-8?B?QTBhNmowRFFkZWtpZldzWDNVNHVCQ0pUM0RLczVabXZqK1FYZkF0UnlZMC9K?=
 =?utf-8?B?UkFackNoVEl0MGVCNUpacW9HZ2lrYmIwL0paaHlGNmpGMDZkclJFYTJkV3NI?=
 =?utf-8?B?Z1lOMEtnKzN0ZTM4NmhhSWRIMUg5d1VZekM3ODMwcVFnQ1F4V0Y1aTBUbjNC?=
 =?utf-8?B?OWEyWDZHWmtIWk5oZTRjNDJrRXB2NS95dzVNNkpEZHlFdSsxLzNKaTc3NUVK?=
 =?utf-8?B?ZjVQRmdVNERWZ05wekRmeXpkdTdBUUxadUpVWGx3WEFnZjdzQzBPeUxvZk5z?=
 =?utf-8?B?UW9WWW5qU1RKa3JJeDV2eDc0OGEzTGlvL0xGN3QyNkwwRWE5bzlaSzQ1UTZS?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b52f4da9-af3d-4798-298e-08de07a41693
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 02:24:07.0660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMHygRAT3MEsCHAL5DEmsPhpF9HepPaEOePYAkTiajlUvuZiN0DsSVSbzjgjJAfPhrI+dkZwyBrejX3JTkd5xuiE1meltfoHhvZKWgs5x/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5793
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_192419_091518_221E0B90 
X-CRM114-Status: GOOD (  17.75  )
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

Jonathan Cameron wrote:
> On Thu, 09 Oct 2025 12:43:49 +0530
> Aneesh Kumar K.V <aneesh.kumar@kernel.org> wrote:
> 
> > "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> writes:
> > 
> > > Make preparatory updates to the ARM CCA guest driver:
> > >
> > >  - Switch from using a platform device to a faux device (based on
> > >    feedback in [1])
> > >  - Rename the device from `arm-cca-dev` to `arm-rsi-dev`, so that the
> > >    host driver can register an equivalent `arm-rmi-dev`
> > >
> > > These changes are purely structural and introduce no new functionality.
> > > Subsequent patches will extend this driver to add guest device
> > > assignment support.
> > >
> > > [1] https://lore.kernel.org/all/2025073035-bulginess-rematch-b92e@gregkh
> > >  
> > 
> > I noticed that, this will break autoloading of the driver. 
> 
> Ah indeed.  You'd need to arrange for the arch code to call the init()
> directly (possibly arch_initcall() as before or maybe directly from
> arm64_rsi_init), which makes it tricky to do in a module as there
> is nothing to kick off module autoloading. You could kick that off
> explicitly but that's a bit ugly.

Does ARM64 not have the equivalent of MODULE_DEVICE_TABLE(x86cpu, ...)?

