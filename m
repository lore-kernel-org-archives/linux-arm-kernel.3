Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC6AC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 23:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83RP+Z7IeeyCw3v45/YF5vjwiMXSF79fCwohvOIh6KA=; b=K90EO2f2OcyjbihP5Jcwe6k2jq
	q9FZntBLhraKVSxinceHfrV8BhzdvgrSZCAeh96ZBgaQt8Hfikx1PBz866s6YaRrdgLzc0IafWIlf
	5X6zApwul2JIsKTonFTQIlZ/CDntmlwPSzZPDcOwDzrz9kT1kb+SY41A6q5K0zJ0zBAFn7mFjeWbo
	sm5RfmWftqgfhiI2rX1tewOfg7/dyzxq2rn0zNW8p8c1bcDVkue8Ru5E0bdzKHfyDAjBno8HQT7wF
	wOWaFxNvjnOdZ6N+XhsdRmT3+3CkWH/j216t90S2PZaHS4bVAyjyZzfCm/NVceCyzmPGyyNhZZrGE
	zPkHSptw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSl1z-0000000GnoR-3tWA;
	Fri, 20 Jun 2025 23:20:23 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSkQp-0000000Gkit-3Cye;
	Fri, 20 Jun 2025 22:42:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750459319; x=1781995319;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cbHKZWkbchk/sdUUaFcMFl1Q4WIRZoPZo6URnkpJ/PA=;
  b=RwLNj04rP6UVF2woHYC2AuTjxe9dh0lY6Hsir8fZnIxJOFAjKGoth1DY
   joLHsOJupeM6+/kuKme3oo8Gh0A9Dv+upKgVkfy89PmbzWkMG84kcSAn5
   YHz5pllNamdv8S4O1+BEarD34eyOG9YZ4sOi4A1L1agaVji1/syjn9dOf
   SHpMjjzGyIPX/KbRLxVavDb/88qV3ig+3q+sgqB8P2JhBds0WODeSOrJZ
   BLLiOY3M41ahT3vs+H6ISkb9lWDBHRlTHMd/DDpmRI9jK6mtOjEOLSbh1
   WquyCshRuinwVB3tLJFqDOdoPyycTjCgW1TT70EWZtNPd6yw6almccqS1
   A==;
X-CSE-ConnectionGUID: CPVxvgNkRtazSPKmyhbxyQ==
X-CSE-MsgGUID: 53liyBXrScerpf83tM0kPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="40339371"
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="40339371"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 15:41:53 -0700
X-CSE-ConnectionGUID: AnPn9ZDAQiyPOrrPJmohxg==
X-CSE-MsgGUID: F6QsbO67Rh6gkvXt2P0J/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="156835197"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 15:41:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 20 Jun 2025 15:41:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 20 Jun 2025 15:41:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.81)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 20 Jun 2025 15:41:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=crqSlfCrHWJpNsN0d3MDyXFYcRX+d/I5YmomgFNFZJsxnkFrjhHL5cYRnIZ5LFfpTT4D6YFKiTyiTh1dQQpI5AGWq6OMv+HFzASQlm/xEnI2xrso3mOXraVaLgAM7x18kuJmLQQIZfyY+jFsaIxZI0uxzEetnfXcJz4ZWZjglK4iVpZIvi6Id8YtiwYYB5z0XQFw2HNVarQFYUN222BgrsZfsi3aBenN7k/e+F2wGeuY9MqOzs5YkhkrYTqFXpc89Ohyleyca5NjaVkNbhdGZEvuXw5KhgiTlbelNC+6mXlaCXTlBzzzoaPMSLCYXzx4hHDfdlTvTwNtanwrllTg0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83RP+Z7IeeyCw3v45/YF5vjwiMXSF79fCwohvOIh6KA=;
 b=ganTlGbWAy3W8Wca8Ee/kU9Y3ioBk7op1JhGi2UGhd8vDfNK2In0ZrBK+v/Sc0eT9J1CMeHGhUkDkQ9maaDzLFYq10JOO9atFGIb8zQJbkMXWP0LbGyCM+yswQ6BGsa33UaQKCu8B2owX+14HrGM1G+mTwIRmdrut0G7wNHUg0NBOaVsCvSGmuJEsT7fC0Qsrjt1EPqErz0dneTjfpwHmQTiGa+93JidY28WA3hRrE8wh5x3vFAiSYILTu4voZ7E4NmU7f4Aw8Ragt+SLxp+2/VHH+5PtdGRpIMI801lg35RRN1KkVJxezYHnB67g6/5Tw/dE9PWfX5erzV+V1wUlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by IA0PR11MB7790.namprd11.prod.outlook.com (2603:10b6:208:403::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 20 Jun
 2025 22:41:50 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%4]) with mapi id 15.20.8857.022; Fri, 20 Jun 2025
 22:41:50 +0000
Message-ID: <5d909cf5-6eb8-4650-8225-06ed73f44ba7@intel.com>
Date: Fri, 20 Jun 2025 15:41:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] lib/crypto: move arch/$(ARCH)/lib/crypto/ to
 lib/crypto/$(ARCH)/
Content-Language: en-US
To: Eric Biggers <ebiggers@kernel.org>, <linux-crypto@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>,
	<sparclinux@vger.kernel.org>, <x86@kernel.org>
References: <20250619191908.134235-1-ebiggers@kernel.org>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <20250619191908.134235-1-ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0358.namprd04.prod.outlook.com
 (2603:10b6:303:8a::33) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|IA0PR11MB7790:EE_
X-MS-Office365-Filtering-Correlation-Id: 82f72880-d90a-4529-35df-08ddb04ba59d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjBValEyOVluaFkxRWJmZkhJQnhOZy94RElIUkxKM00xQ1JGSVNJcHU5dzVV?=
 =?utf-8?B?UFlxTjV1clAyWXRSSVY0ZDN1NTVOQ2FOVnoxdEh3ZjAvek1iZFJicTI5Wkhr?=
 =?utf-8?B?djJvOE1OVnIyOU9XNENPRzhKY1FnUHZFTTlIMmNJRENmNjdqYURxQzRKWlUv?=
 =?utf-8?B?R1pYMVpUcWc1c0pUOW5wZ29NZ1VJdFJkN2dvalBOcmhHNDJEOGllRHZNMmlS?=
 =?utf-8?B?QnJpU2RwRVZvZVcyc3JidWRmb0xpRHhudHl6cml1L3VOYVJ0c0JjVFluUVg5?=
 =?utf-8?B?Vjc0eUpnVE1MS1ZwY2oxMGF0UmkrYTZaQU0vcDEwTUtodGIvZkZEOStRbHZO?=
 =?utf-8?B?WjFBNFVYTGcwNUo5ODhYZytQa1EzV2dnNzVndmZqdFFnbXJaRG1ZK3FtS2Ja?=
 =?utf-8?B?TXUwS1I2MnF4bGhFZDVPQlo3WE0xbVFxb0tXSDBCS3F2SmpmMmZVRnlZODFL?=
 =?utf-8?B?eVRtQlpSL05DbDBWdDJBeGdVR083QVBYaW81dXd5ME5DVFg0TkxkWGVIc1V2?=
 =?utf-8?B?TVhYSkRDa1FlSVVWcGxtVVo2NU5tTkppbmVYQXBVcU1jNVRPelp3WVg1aHp5?=
 =?utf-8?B?eE1sdEhwd05VWjF1Mlo3dzBSWExWVDdaK1JsbHRiTHJ4OS9XRmZoRmwzMmlv?=
 =?utf-8?B?a2M2SDlxZ01iK1Z3T0R6VGZ3MndqYTVJS1hFeDdCQ2lUQ0w0WmM1RlZLTFZo?=
 =?utf-8?B?SWtPZmx1ZWU5OU50MjBjMk9rdHlNTmJiejdTRjVYaldLUWZBUTY0cHpTWFlC?=
 =?utf-8?B?eFRhVyt0Qld3VytEQ0kzWGVkN25lL2ZHdk1jTEdXbTV3NjdiT04xazFjMmVQ?=
 =?utf-8?B?TEVPM29ucTJ3THBEME56MjlUbnp2OHM2NnR2WTMzM1ZJS1BIQ1hueXJxNnJT?=
 =?utf-8?B?V1dvKzJtN1B6Nk5ybEp2SThaYVpBQjJhWUg1UHdQVW5XWkNjMFNCYWlSVFF6?=
 =?utf-8?B?TklsV3FoT3hFcVdLbzRocks0NjBUMmRJQ2Fja0tpWlFYcWJDQXloMGpGZ0xD?=
 =?utf-8?B?bTFOQ05ZcHNJQVhKSytXTjcvQWFDYjJuRVZkaUc2OUFpdUUybElzejNTT1JG?=
 =?utf-8?B?dTJicWRjUHljOFZOV1ZyZWwzYTBFVmhkOURvS0p2QzU3Rmt0emlET3VFSEdX?=
 =?utf-8?B?a0p1Rnd6RGlHY08xQ0NXaEo3TjhlR0hUTGZ6d2dnNDRMMDloRXdMODBJWUJN?=
 =?utf-8?B?VFJPWEdpNTlhbXc2V3d4UmlKWmdObU1uUkRlL1NFZGp3WG1zc3FiS0EzNi9O?=
 =?utf-8?B?NG9jTGdXRityeHZVOU4ra1lwSnFaU2l4bWNlK0tFSUE2aks5YXRUbU9lZ3RK?=
 =?utf-8?B?aG1aMFNHSWhIRmhteXpOcWxrQzhiTHVlbmRuckErV3FMUmxNOTZWMEkrS0pB?=
 =?utf-8?B?blg2a2FsR09scnA0TDZVeEhZQVZpRjMrSjV4T2pXYTJpQXF3SGFSQTBrTnpu?=
 =?utf-8?B?VERtWEV6OW0rRWltNTk5QTBDMDdRNC9vSTEvMEVXbUlmVENLeEw2cmVxU3lK?=
 =?utf-8?B?UGpyTTdQb0sxMzdIV21IMjBuWmRlaERaVS9UdXZkUXBlQWN0TFlqWE9VVlZS?=
 =?utf-8?B?cURxZjl0emwvMXdUM0Njb1JOMGtQeG01RXpEYmZ4T2RCVFdnSXFJUHJYN1dP?=
 =?utf-8?B?cU9tSi9XZ0xCemVYTC9ielNaU01PQ1lncHpIMGNpbWZTMHNzU0p1WmtqTHVU?=
 =?utf-8?B?MFdkVWx2RSswb1dSSzFOQTJPZnY0OXpxMWU4S0l5eFdxbG4rdlJNTC9VQ2xE?=
 =?utf-8?B?WXpGZ3pvWWN3L1NsQ2M1Vk5ma3ZibGdUN3NrbE54UFFEdWZwR1gyaW95dkxv?=
 =?utf-8?B?TXBvS2RWQWtJS2RDU1VJQWFRZTBROHZoWUUzR3pnRFZVclEvVit0Q3JvZnRj?=
 =?utf-8?B?WllzTzBCQjNhbGxIazBXTlk5bTVRUHZMQ20rYWNiVnluWjNyTURxYmJJVkl5?=
 =?utf-8?Q?GOFBlVtgqLY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjM1R2tOUFltUGRXZlNGVUw5NlpsU1Y5c1JjOEhRYVZOQnNDR2pQOHl6OFhB?=
 =?utf-8?B?cDFTZU5ET3c3ZWdBbjRQWk1RSEI0b2pDd1J4SmZDMmlRajR6TUZXeVhBZ0R4?=
 =?utf-8?B?bTk5TjU1bSt3enhNV1FwSzh6NXFVRUxIT2RlQ3IzWUVTeCtvbFpLRmZRZnh6?=
 =?utf-8?B?ZlhQZis0dDMwWkFZTFErOENkYi84MWprOGRjcDFZVzJaQW50bVRuWW5OY010?=
 =?utf-8?B?dHg5ZFhvVHdLTWxadDM4bGNvRUxDUkR0Q21FZTd3MWxKQmJPYm5YUGxUaVJq?=
 =?utf-8?B?UXY1SHNmUjRRSkxPcHQ0UzZMeGFOcDBCeWtOOEppOEJabU92QVhlbE1abVhN?=
 =?utf-8?B?d3BOa3Flam95RGU2b3NDK0tKTFdEOW14SE53eEh2aGJKTEtsWVQrQUR5MTYz?=
 =?utf-8?B?VEQ3NzVNSU9hdllTb211U1pKZWpCOHpRVk15OUVtc0p1NWhnQTB1cVE1Wjg0?=
 =?utf-8?B?d3I5UU5ub01ocS9PMHdMZFMwMTVDck52YmZnRTVqN201Tk9DQnJCbThjaGVD?=
 =?utf-8?B?aXNubko1SmoxWWdSSTFJTndTTFQrVTNLT2xsSTlnTmdmY2llaUtKUG9vMzlp?=
 =?utf-8?B?YVNTZWxxVHZ6OFR0OTYxZTF4L1dwdmdDWEQ0ZWxjTXlQQkY5R1A0WHZBWHZU?=
 =?utf-8?B?dnRNNjRmYThLTDVxalNCR3o4WlUwU0dlUkw5Y1BsbVVMemEwZlRNVFdaRm1u?=
 =?utf-8?B?WERkdEdTcFRDUjF6QWhzK3h4bjdIazRRMncvU1dqY0o3YUxLNm9oaUtDYlRB?=
 =?utf-8?B?YWh0VE5hOUVwT2ZlN2R5YTFTNHl2QnFyUFprOW11b0MrU3U3VXo3Y0V1ZGFE?=
 =?utf-8?B?V0U4V3EyTTZBaGRQb3VxRzhBL1FGWHVzMUI1Q3piQ3JMMHMzTVJrZFM2M0ly?=
 =?utf-8?B?VHZUOEg5MFdOYXRLYUZVNldWckxrc1dQUkNaclFrMlhSRVNkQ2NlSEZ0MUNF?=
 =?utf-8?B?cENOKzY2VnJLWkpCYnUydXp0cy9TUEh3ekNrdHBId1dYODNzRXVWOWRNR2RT?=
 =?utf-8?B?YWE5bzdnVXZqZllxdFNxbU16RkdnZFhOSjdFTXRHd0FSM01JVXFrd1BkUkVt?=
 =?utf-8?B?OWNHSjBuUnprYUZJcUlmWW9tSVRLUzZZSUcrMjQ3WjIrTms1dnJzNFN3NHUw?=
 =?utf-8?B?MTkrQ0E2ZlVyaHJ1aGM0b250cnBrenI3NEtuZkVLUjVXTkQ4OTBFU1pkVC81?=
 =?utf-8?B?cm5USTEva1Y1NEZkdzdWMW1aRWxKYVhWZ1FtbFdOclhDVk1jVjlDNjlHUFV6?=
 =?utf-8?B?MEl4NXk0dUI3OXV2ZGV4bUx4Nm1vUnhhZWNYbXJLSG52TTgrWUxZYjhaSmtD?=
 =?utf-8?B?ZmRzRUxmVUNKNWJoNmtCYnhqQStOTkFkd000ZkU3S3duYjc0anU0N1k2cmc2?=
 =?utf-8?B?Q2pIUGpxQ1pJNnhkU1pEaGpYem16Z0VhSzQ3MDdoNjRlVzNrZlBGYWNreGgv?=
 =?utf-8?B?TmhlSENwMVorZDI4d0hNK3luVUhnYkZCekI4TWZ6eXRhWjhlVDZRUHF4amVq?=
 =?utf-8?B?dktudXBiQmtYUVNLQVlOZFJCcnJJbm5sNGxiYWpxaXJvRmV0WmNEcFFjNUtx?=
 =?utf-8?B?TjREZ3Z1eDJaUE1uNk5mQmdKNEtQVGZialhUekVtemRONDNIMmt6TVRCQnhG?=
 =?utf-8?B?YVNUcnBJUE5VVjhxQmQ1b3lIUTBKT1ZZVkRFcWtsSGc4ckZzMzF0OVdnVGx1?=
 =?utf-8?B?ZzM3M0djNFc5VWNiUDVZT282SmYxUGJHL0E3ajVtSTIzUzRidSsrWHhKeE9k?=
 =?utf-8?B?Y0VPL1RSd1FjZUtPTjk3dWlPQ3BnanBHQWtqbXF5Wk9hLzFFaHhRNWk3UzJ1?=
 =?utf-8?B?RnhzMGdxOFo2THphajJieU5jZXdZL082Zmt4b3V3NlVWZmpTV1F6Y05ZeTZC?=
 =?utf-8?B?QlJEM0VSZlE5c2F0YXh2VlRXVU5icDlMeDRyU0RLc1ZHcDJFRGdJSlphYXcx?=
 =?utf-8?B?S0JwcnlqQ01RMHArK2xDMDZUazIySk5XT0tSVEd4Z2M3d3R5RXhERWE4VG05?=
 =?utf-8?B?Rmd6R2hLT3ZyZkhWenAwV2tWS2p4QTV4dE5BV0dOWDZ0TEx2a3RnWFZVdGtV?=
 =?utf-8?B?c2NDREtBVVRsbVdyVTViRytqbThmOUJDbExVandPdmFKZTZTTi9QTGdKckdh?=
 =?utf-8?Q?ZSTt9EGUG+HPKce86HEFgFhah?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f72880-d90a-4529-35df-08ddb04ba59d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 22:41:50.5099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Q2mILEq9TDR1/eO9MY1OB+aNTDOO2M3Vhp2VQvL48RRoemRfhwbqK9cLStdtDExR11rq9QDykmKKcf/JkdYFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7790
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_154159_812017_2B9649E8 
X-CRM114-Status: UNSURE (   4.44  )
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

On 6/19/2025 12:18 PM, Eric Biggers wrote:

> Eric Biggers (9):
>   lib/crypto: arm: move arch/arm/lib/crypto/ into lib/crypto/
>   lib/crypto: arm64: move arch/arm64/lib/crypto/ into lib/crypto/
>   lib/crypto: mips: move arch/mips/lib/crypto/ into lib/crypto/
>   lib/crypto: powerpc: move arch/powerpc/lib/crypto/ into lib/crypto/
>   lib/crypto: riscv: move arch/riscv/lib/crypto/ into lib/crypto/
>   lib/crypto: s390: move arch/s390/lib/crypto/ into lib/crypto/
>   lib/crypto: sparc: move arch/sparc/lib/crypto/ into lib/crypto/
>   lib/crypto: x86: move arch/x86/lib/crypto/ into lib/crypto/
>   MAINTAINERS: drop arch/*/lib/crypto/ pattern
> 

The updated version looks good to me.

Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>


