Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C784C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 14:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+VjjxCUrVfyzQSjiOQPgE3e196rs7+73UEEAIFoxLwQ=; b=Yn9MpTSIBERLM7Mu0OAP0mo+6U
	SWPDvpTHFM13Nb7cNn9XyfLEX8OGHTDxJIuKoKx8zDfHLXg4yLzYuEevgC4dw88QU2rO4Pv6YLvDO
	3sHs1ffhVT2QtxVKA4Fo2FQwHVLGr/bmWG+GW5tlH+dr5i9FwX760BoKKYCghnaMtP1buyj4ASU/O
	a0e5QWA92fkmUiBlt7zxd/JBlPYMq2kHzZBWQrmojNldFau3IzVs89W7d0E0icQYC5OFjEIj6gUQ3
	Ynq4o1DoWbvxf/MzVh0FspgqMpVTDjW1ATvXHpnwjU0NtSKxdRo0u1ZGw8+4pZD7Ri1xu5hJy+Diq
	coVGO/BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh796-0000000FDQM-1BBr;
	Tue, 07 Jul 2026 14:51:36 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh794-0000000FDPX-07ws
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 14:51:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783435894; x=1814971894;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2uh3MECbv6lwAS3fQHoJ3DlET2jp7zqdCwbkvtbY0AI=;
  b=jc/7G+knd9AMAEIID65vjy8ZDUSkWUj+ve4rhzmRo1Y9K77hQ+ljj6uM
   QbAlltgjCO/uKToufDANiCrGrY1fgblVhYUM0YqysHoFUvw77pLV5dTLQ
   kJ12HkgCrZe+ARjFJdZxyatk03NpALquP+xubx5FwIxuEa5P6E/Tjn1oR
   KL3jUysooyUAYWRFl5pHsz24ph8Udd0JC0SDaYDApGcAUWoU2y94fUTU9
   RCZ0w1dcv4UDTeElbU+QzrN7OMts6meHbGMGRJp8norh3YS2+q2o1ETGD
   cVQkuh5sSJu96itMuaEpbWoogc/Jfoq9MG3CW/E8KEreiShju+Gh4tZk+
   w==;
X-CSE-ConnectionGUID: xUEyMhVYTGKUe5FMlz2c9Q==
X-CSE-MsgGUID: siz9dohPRYe3rwpMdXh8Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84058240"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84058240"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 07:51:33 -0700
X-CSE-ConnectionGUID: lgj31MwJR8aS4OpGmmqRvQ==
X-CSE-MsgGUID: EVXCzVdASHyNc/4Lt94TGQ==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 07:51:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 07:51:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 7 Jul 2026 07:51:32 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.35) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 07:51:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZh1NIPouR3nH0LqcOUd4FjjE/50JUTTZondiw10SnMlLSFykq70ueVzNmhkryozr7Ey8GXTrimYfrAk0iR5o+TdjCtRH79wfgp4XEFUEt7d1indPX8RBqIPOPJTghwHti8vlBmbcUSvLE3460AQ4lfXdLKFBSiUK/fnyFux9w3++kB1HaqSx7MtMlCG+krSL+vWw+tTBe5ln57B4CdMTYhuIZqQipnW4NZMuBW1n+YWz+WJGsOWH9rPx5QY3gzn9vPK/F9klwzpLjx49YM2Ah/GRRIeXcagZO5YfBRJCVWnaRjYuo9JDzijDv6c7qTwvcLisnqrc792kbjYylUbkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+VjjxCUrVfyzQSjiOQPgE3e196rs7+73UEEAIFoxLwQ=;
 b=TOe4zzIedY9li8u9AQ4QcCrcTdZHH+eqD78Zl3A2qhNCXbY29cnfJbt66FGIC9pxRKVJWqNIZSGGBBkEu2fwrWebZAsHoIkGdZ7ntw3f8cQhC2X95UFVrRsKyRL+RR8oAIlrewlXZwqig4fTk/6d8tBxNaNr++ngtxO4wI94Q1rMdXkzuJQjQCf7+qw0SNIrhNnqiTJTWsUysk8mz6Nj4xLObstF1KXw6tz23sfs3KT2FZiUtUwphzzXg6h5uCy46QjDyjpVMzNnLh7EwkKNNVNoOHXs4c5NLtYjdd4OQDpTp0ylaicETJav8zvcVeY8bL+Q7Tx33vvidk9L3eBjFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SN7PR11MB7975.namprd11.prod.outlook.com (2603:10b6:806:2eb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 14:51:28 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0159.018; Tue, 7 Jul 2026
 14:51:28 +0000
Message-ID: <8d5d9c98-54df-44fe-8795-189554ea2399@intel.com>
Date: Tue, 7 Jul 2026 07:51:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm_mpam: resctrl: Add pass-through
 resctrl_arch_preconvert_bw()
To: Ben Horgan <ben.horgan@arm.com>
CC: <james.morse@arm.com>, <fenghuay@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <corbet@lwn.net>,
	<x86@kernel.org>, <linux-doc@vger.kernel.org>, <dave.martin@arm.com>
References: <20260706160639.2136674-1-ben.horgan@arm.com>
 <20260706160639.2136674-3-ben.horgan@arm.com>
 <4c520a28-9a72-4abd-8e5b-654a312c92fd@intel.com>
 <e9185282-94b9-4de4-89db-f9451e47b506@arm.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <e9185282-94b9-4de4-89db-f9451e47b506@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0167.namprd03.prod.outlook.com
 (2603:10b6:303:8d::22) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SN7PR11MB7975:EE_
X-MS-Office365-Filtering-Correlation-Id: affa975f-7d9f-4065-96ec-08dedc3739e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024|23010399003|4143699003|22082099003|18002099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: ki8x8rkbqWKI7OLKgCUgiSTtetQyFSwgD4qdt5oBMq/pI1Ig8s5QNCdO7C1AfK1GxHZQiQ3zVJtwwT1Z2m6njKayPtyuoP95OZKczqxUU89aartvA9caKLEA6y+fsCQDeyN3lIaZYb1nCKYtHAo5dwg4FWhmiKjjhpGARFsWREhj2Vc/kAwY3olsEe5Doojj/HXvECak0I3f7myd5OfwTrL+5G47KdldOAlUJqdDHe8TMgz6rzQY6etffMPyn1XWTObG9PEppN59XVspN8Q5Rhzh66OaZzmUIrYVlRr4ul85VUq94b9bu5fItYwQ6NrU8sirI8wL94qdXIm0rmG7fH5UdaOaGTVvHVPAPUAOZ/nZm9VUWzKWLGwgriemNbOZbSPHzGoJTqinYm5lvAttOOSLi3Rl6RaBZuab/0/WYdI9HX+W+2KeQxqB/XFma3Fl1MEg/GqpjsL43MH5nA5W8cFBP7AWK1G2PlbzXZttHHcjLlZjuXsEA1nQPOUu9R6fV77dbjN7dvsm6VmYO8SwA6sqEtqQg+p0ES+ywuv9JRX0tqdNB2/XLk84AzEb8fxRfRzxOmeCRerD3Fa71nqk4jnlCMgKfBCFaEnRs94wAz3WNXzpdz9amZoN+9C7JpHPapJ2yDGAFnS0E9qyRRoy38PZ9Wb21jpT6CUJvn4PH/c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(23010399003)(4143699003)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejRiNDJYSnBqUlM1K2FsODVteHVQdlBQYVc4TitMcXVDV0U0T3dWazUrd0c3?=
 =?utf-8?B?ZjRJZTVaZGxQcmp5ak81TUlXbVV5ejdKdG5NOGw5b1ZUcjRhdHUrbFQyTEtD?=
 =?utf-8?B?clAyZFdpbVIyOEg4WHl4aEFXZ0czM203M1RaWHk4TjhGREh6MzRBOWFReStk?=
 =?utf-8?B?dEpCUDJQcU91V0d6MDFNUm1yRG5pWHhJZ1RxNkVseDNNSVg4aTFxb3oyUE1D?=
 =?utf-8?B?UndjbVZOSTcxZTRSSkE5LzdxMVo5Ri95d3J5UEw5R1dhVDdzTnFidlBoMWxU?=
 =?utf-8?B?NVhHbDh0d3phTzB6OWN3Nm5QREdYV3FUcURFNXBUa011Z3EzTWcxRVJxb2Zl?=
 =?utf-8?B?T3FCZzRsci9uNWgwK1dEbXh4TktlWUJsTDdvSjA2SUhzeTBONERsYU5yekJZ?=
 =?utf-8?B?ZHlxd2VuZUtBTWtHUHhRenh3eW9MVkpqSm8rWVhzRlU4WThQb1NsbG0zQXRS?=
 =?utf-8?B?WDVlbmNkekpOLy8ySVhqZ3Q1NDBBMHA5QnNCYzU0UHBJbERRS0ZJU2lvY2FQ?=
 =?utf-8?B?ZFFPSmM5bkk0TFNnKzVDRWp2N2RBbHpBbEtHWjkydlNSYkxZRCs5WlIrTW5T?=
 =?utf-8?B?V243S0ZYTXdkU3U5cmk4ZW4rdGkyZzlkOTdQaUhQNFdtcVY2UTl3QVNIVlh6?=
 =?utf-8?B?dkhQTTRST3dySExlZFJJN21Zd3BlaGFsQm5KbFllZ2FIT29JeWhETXJhVFJG?=
 =?utf-8?B?dFovQUN1VVVZelBDMWZjd3dxVE9KRkxVRmdHdkYwV2ljM3NLZ1A4ekV2dkpY?=
 =?utf-8?B?QUFMTW56SUJhSUYxZ0JhZjU0SUlSVUE1LzlkVi9mRGM4bmpNbWQwRzlRNzRP?=
 =?utf-8?B?S3hXUjhDSnloVjduNnprSElVTXdUcHlGUFpQQ2JPazJCVkhFdFJJNm1NVWxm?=
 =?utf-8?B?VWtCOTdlL1BYbVVnR2ZmRGdaU2c2UUJYMFdxTVNad1BnY3RTc3g3ekJ6UVZU?=
 =?utf-8?B?VWYwNmZaazNMZHBmeFVhb05BRDhaWlFnQ2hJeU9OekIzYUdaSDVIV2ZGazVs?=
 =?utf-8?B?d0tjeFFDdEh0ZDBWbWxka1UzbTJGc2ExZjZvS1RyNjBoK256bG9Gb1dPZTdR?=
 =?utf-8?B?SmpRSlNLMmRQWE80VUxpenpGM0wwdElWZnozeWNlbHFrdXhvbjBRRnVlTHFV?=
 =?utf-8?B?TDlxNTcwQWRMbE5WOVN4L2wxNUlkY3lnRVh1dW4wVkozT1haYld1bzQ3RTRz?=
 =?utf-8?B?emlldnpiUURpU091Vm0vY0F6enBXeHBYS0s2VC9JbEY1ZWRrTkQ0RG0zSlZ6?=
 =?utf-8?B?emg5bVJTMlE4akpmSUYzTVBtbDVQb3FKZExSSW81Si8rRC94NkVFYjAvRFBJ?=
 =?utf-8?B?bGQxVFQxZXZlUmNJSUYza0lEUDU0UkNZUko4cEloMkN2ZE5pdzUvVms5WnlW?=
 =?utf-8?B?T0ZPckZFVzhBcjdOeWFtbnV5NS9pejlxMi9XUHQ1TDQ4SzZhLzBBdUhZSmVt?=
 =?utf-8?B?cVA1U3J3ZFFWZFo0VHdQZmNacUMzRnR6ejk0MmVOMmQ0RS91SmJlaitSTVZv?=
 =?utf-8?B?ZkNtcFVCSkM5M1dQZ0tHRFI3UmE3LzVqMEoyemYwZzJ1alJhK2FZc0NSckRJ?=
 =?utf-8?B?VTY2dmxoTExoZnNRK295MTVaS3ZYVUtHTFFGeG5vcDAwMWFBSzlDMFVMUGRQ?=
 =?utf-8?B?UnhIODVrSEN2bG44L2szNVl3SDRDNElRQTNldUJlMWQwYVlRSnhFWUhYSkwv?=
 =?utf-8?B?NzAxWFBKRS93UnZmS2NDbGpvN2lZVnBmdlZ6R21ERkg5VWJjbFpHRmNWb3d1?=
 =?utf-8?B?SVhhVVVXVk1NRWMyc0dCSXAzWFNyVzdjWkFiWXBXU2N0elk0MFJHejhsU3FS?=
 =?utf-8?B?RkllQ1lxMkkvMldYZlpEU1ZwNnhOdzlpbzcvemZPV1A2UWJTRHBnaTlJQUVn?=
 =?utf-8?B?Z3lKVVV0dGUyUWk2UFJrLzJrOVNaRHloVWJOZGxXVUdmTFRDb2NPa3pJS1NW?=
 =?utf-8?B?Zll0T2M4cnV2VjFZOFJHYi9zWG9oanNFQTl1T2VWc2YvVko1a1JVckgvczNr?=
 =?utf-8?B?bEE0VzRES3NyWWQ2cHlwVFZaekdtUWVOSkJGdEVkRnZ6SVVaOU5rRUdrZkNE?=
 =?utf-8?B?ZVkrQ00xcXpaNEVVeFVIYVFxemJNQ291dk5UdjFmWE81L0lxclRSVEVVQ2xP?=
 =?utf-8?B?aFhneUhBcHlZekRTTUZ1dHF2VTZ1TlZuQVh0QkZ1bnJJQ25GZU9rL2JQRkQ4?=
 =?utf-8?B?VnR2R3NFTUJ2UnBDc29mY1kzMmZEaGlPcmhOZW9Mb0F1Nkg0YmhFamxidndI?=
 =?utf-8?B?b3Q1UmJ4SDZhaCtQTU9mNHZPcGV3YW8zMXZNb0h0Y1pVcVlYOEEvaHNEZHdO?=
 =?utf-8?B?OVdIQXVhWmFRMWdtNWtOVTFpTjM3MU1OTlUycE9kVWl3TllwUTYrckY5NDgy?=
 =?utf-8?Q?xSHmjtCbtYaR23pU=3D?=
X-Exchange-RoutingPolicyChecked: VirgXzn9w+Uhk80eDpEnG4GeGFGj9TLDZJBmAjELkrmk+eP9ExopOZAun4Aa+Xg22eVUSyHY5708bfM0OrUiu/Kz15tQy4jYTckFHN34rJHPG+B91dkyFpJ9RbWyRJaPz4Qfwrs7f8lJpRKPON5jXIMzXUwW+AjjmXPyGkNerq3yLYj0w3/TV6UkxnRVh3jmELS16ViUVXELVf8DziGrOYLP7mc1CWpcqd70KK1fWo0WkIu/gINulET9Ywih9tXQVKbeQE6jfTAcWdCtvawn4t2ZZ4Amdn5bcgY0qncaAno7tYM3KAjB7FpBIWjxwpTTdwVJl744Clk9YapjRaq/7w==
X-MS-Exchange-CrossTenant-Network-Message-Id: affa975f-7d9f-4065-96ec-08dedc3739e7
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 14:51:28.7277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DtX9sBTkUao4SYxyx0NuEOF/E77tc51M6aHEjxn7doyLbu9FCmCm/K/cyw4VmYQ+SDZkthEj40ScCHjMru3oIwOzydB2tsnpEg33FvBHZnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7975
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_075134_122875_9A112DE8 
X-CRM114-Status: GOOD (  14.21  )
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

Hi Ben,

On 7/7/26 1:35 AM, Ben Horgan wrote:
> Hi Reinette,
> 
> On 7/6/26 22:33, Reinette Chatre wrote:
>> Hi Ben,
>>
>> On 7/6/26 9:06 AM, Ben Horgan wrote:
>>> resctrl rounds up the percentage value of the MBA based on the bw_gran. As
>>> MPAM uses a binary fixed point fraction format for MBA rather than a
>>> decimal percentage, this introduces rounding errors.
>>>
>>> Without this additional rounding, if the user reads the value in an MB
>>> schema and then writes it back to the schema, the value in hardware won't
>>> change. However, with this additional rounding, this guarantee is broken
>>> for systems with mbw_wd < 7.
>>>
>>> resctrl is introducing resctrl_arch_preconvert_bw() to allow the arch code
>>> to specify the conversion resctrl does to the user-provided bandwidth
>>> value. Add the MPAM version of resctrl_arch_preconvert_bw(). This does no
>>> conversion.
>>>
>>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>>> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
>>>
>>
>> Unfortunately the "---" separator is missing here.
> 
> Another silly mistake.. sorry about that. I've corrected locally and
> will send a respin in a day or two.
No problem. 

When you respin, could you please add a snippet to the cover about expectations
how this series should be merged? This will be the first piece of work that
touches the x86 and Arm driver as well as resctrl fs code. So far I assumed it
will go in via tip but I think it will help to state this from Arm side.
We still need a plan for if/when the Arm side touches the same code though. Thankfully
this work is small.

Reinette

