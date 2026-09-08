Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3530FC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TLWkUEbLEWlXHQeJUXl8BBsGUUfHkoKud5OicPgz49o=; b=d9Q0FYFxh6LGjtq2stHXtnW4n4
	jyWZy+qaW2jZ7vVeZTv0C9XkIqNDnIGhwuoOJZ/cZ5O+6NMKX/DPITwcTAaEyoCmDJHrwr6nAX39r
	Ag3xusrdRvUhga8qj2k4M3BGSUlVoNTfrVax5VpaVhgC6AYEHaVtJkAWWh7dW/Hy1WDRqYuVX3xef
	3myppb6S76DVYK9MKdGiAV3g8YKy3UF7QR4yxfpCh6spsPIrbT+I79GNkL8k3sqTExO2GZXuarPWo
	vSoRq4sAIoYv6kDy2ovZCf9YQnEqmtvQztUi02czeWsLYryi1/xcZL7Y9vEYY9IwaL8z9X2foNbmk
	Y6peAybg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xrN-00000009Vgm-3R3H;
	Tue, 08 Sep 2026 15:35:45 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xrK-00000009Vfu-0OrB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:35:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788881742; x=1820417742;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dqJ3X3K/upnyFAAdPZ4XIbnffcYiGuNuwKvJAm0sGRk=;
  b=aedIr/QX4L7TEkHxauzd5e0TnbiD/snjBHxaRiW0KbEv5PjuBezjwfqu
   CJ8D+H15EJeqRunGZ8ZxCv/wObL7+hX+EgPTLOjck6in68ssbhoCkF9oP
   T1gyCeCZYxfIqUEVhM/XYC1ujslPFZAeDI1hV1toSnnp0lRD9uGRWeyA1
   snfNPQ3sakCtqKmEMprQOm186qlEMkB2T3yQXaeZLcQYJ4H4d0V1mxvu7
   OlwFZyBZt7bKEVy4NoV94WqgkcIWdxH8lT3NpTjVAs10w/PZnR2vSCob2
   O9ptIwM6k8v1qF6XOh8vxlAltAgqY9TMPPnBhQS8/HADXpOhwBv4emtUg
   A==;
X-CSE-ConnectionGUID: DYXAQr3rSJOy7LsXY++uiQ==
X-CSE-MsgGUID: kovebIDOSRyyGlyExqFnNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99949697"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="99949697"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 08:35:40 -0700
X-CSE-ConnectionGUID: Nfwflql9Q9eDPqEI07sIqQ==
X-CSE-MsgGUID: YBrmvQ2tS1KsYHxr5CUMuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="267798696"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 08:35:40 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 08:35:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 08:35:39 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 08:35:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i41wdscjNvsxE0opl7Qnrt11Ubl3J7p2LCm3sumfwXmlKNacEJx5dH/U2UcjlAC5B1DccL7vz4TYn4+/2vMyCT0vcIOnjZeHd9Bu4/ys8j7O3dbFkprfwFZIBHCaqjz7oqMrerGNrUDQf6Ct4uEmDRg3yJV2Uly+DjGc2T2n+A8i4YbDpFkrq7TPlm/j7ox7YA7qcUuI9n5scLTvLBrLFHawmdo6fG0UBtcSkmUIjUZuOBaX/rr+wM7bgrsgpIrmhoOmYPvugNGWe5qpXPtyPAs0NhYqjlL6nLVWrcWJX3W5hoIp3rnFHvQyLcQcH+Rr7rBeyrz2oZRCys2FQY2dEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLWkUEbLEWlXHQeJUXl8BBsGUUfHkoKud5OicPgz49o=;
 b=WoR6QG928eLmAHpZJDAclcujzsR1729o5cINtCdC3wBbVrwUB3ClVWABLYobXAGbV2DAFxbkEmPCUfUWBm2Vkm993wU5koEYsUeEiXWPPlegBx6A20UAtedjKoGvRUVSDUbUUyihC5FRiIPuAyexhdHcT3u3wd0TiK+jJiwUXvpxmVs/12hv4K7upRIOnUi/aSAM2ycLQZn9EouGNUaD3vi9qZyg2sisa+Rb9pTXY+EPu3kO72FdD7zgXIF9Delji62Y2Cw75+/NpkNyVrqliGkVNWV+HZKdHMxWDDjiXsZpubn6PELaipTfwqo9rbltZ3ueaSggCx//FAKUxgL4bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SAWPR11MB9709.namprd11.prod.outlook.com (2603:10b6:806:4ca::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 15:35:28 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 15:35:28 +0000
Message-ID: <649aef0d-f915-4288-b3b0-4092adb783b0@intel.com>
Date: Tue, 8 Sep 2026 08:35:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time
 conversion to be per-arch
To: Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>
CC: <x86@kernel.org>, <james.morse@arm.com>, <fenghuay@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
	<dave.martin@arm.com>
References: <20260709093111.367851-1-ben.horgan@arm.com>
 <165e7636-d7e9-4d16-aad1-657b4a9698d0@intel.com>
 <b0a7035e-7ffe-4e22-a4ae-a177640234b8@intel.com>
 <20260904033751.GCapo9D5ZZXWuQkIpc@fat_crate.local>
 <20260904173615.GOapsBjyiT7uXHd-Qc@fat_crate.local>
 <a82061f1-bb23-403f-b772-d5adf7acb871@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <a82061f1-bb23-403f-b772-d5adf7acb871@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:303:b7::19) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SAWPR11MB9709:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f34c893-73e7-4fa6-ad6d-08df0dbecf1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: aZGuBKd8WC6yPdMofBtW6M+kCLScvCuw+KXeO9iZs701zaw7Zeo8AcO3HK2pPBvmeKBGg/2lPJmucUvxW+n8q5HvvdtbessREYQHRT7dFZTxcXQslv9JWU+pl3V7XW0GOA+EtGfMcGd08fSSpNdIqLjUD9EbH2VEo0TZutyhmx6VSYuy0YvJRGDlTCvIUgi6fTTXOTpHdPvpc6xW2qlb/sNxlFwXPuu+Nm3RJj3ace1rtM4zxP1aPKMevulTuhw08v62KA3p9Tf+gzT5OkM+9wgpRlbrN4bZH7fvc4fZWWsxV3v0lXlAbf1KXh/6bFJC5rEHskxHHpUtqJXfwdRBW+Ndww2Lgd5PuLRd07mJuXJnQt+UyCMWRcpPQ/8Ta9h33G3xmM+fT9D7YSiL/Imlhh4CKTBpfdNbgD3yStwofHNrpl0YcwIH5qa7/m/9avSBggKWLP3ihIChH/ztNkgbnhK9sqZjfdaYiIoHksID8uoLCAmYk88J9p/mYYRsUB3TK7tBRak/HD93VLBVUHPOZH39hRelORGpF+PpNdXkh1IKoIwk1JAGK7CbA2xYAdm8lXdPesuPCnANfAG3yo6S0+oIc99qDHr/qavAP4liyC0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REZtMWdGemJGaVFXbHhKUlFaTmliRmlCaVlhdUZzVmF4TTlMS1FKaVpGeG82?=
 =?utf-8?B?bzNMWm5RZUIyQ200VnBBbCtrUWlSQ0F4SmdCTEtCZlpXWDV1QllpeWVsd0hi?=
 =?utf-8?B?T0FXUUpRK3pnb1pLRHFRQTJLeHZ6eU9hcXA4dWZTNS9ZdFlNRFFXVUZ4ODFR?=
 =?utf-8?B?Mzl3TGRmYWk3Zktya01JbW13aWtrY1I4bmpPcGM2SmgzN3RrclBvUGhhSFZu?=
 =?utf-8?B?bEF3TmxjUzZYNXJ6YkxvaDB4aER5YVZMT3dWTC8rU2NRRDhCalNEY1NEaGNP?=
 =?utf-8?B?cnpVM2l0SmZWSldQNUtnNGYzNDRsWk9NM1hMd1ZKNDZySmFpbDBwZWljaHg0?=
 =?utf-8?B?aWlnVjVGaUcwSm1EenNSb2RFLzlvNVNYZ29neTFQYUo5c3VjUFBqSGltVHdi?=
 =?utf-8?B?d1krVU5ISHVBWURoQVR4UVZGYkdmbzE4cmVYUEcyQlJhZlNUSldaVDlDbHpa?=
 =?utf-8?B?ZmwreXFudUwvNXdBN3M0TDBDMlVQdndva3RzaGVNZ2k2c1Q4M0xhT1BQajFn?=
 =?utf-8?B?N0Mrc29xYTVvWHI0eno0b0ZuQUJiNWtQWGFqbE94bjM3bGVDRTBJeDNmU2VT?=
 =?utf-8?B?dUU2TEI3OEFIT0U2NTVCYzJWMjdVOFExcU9vWFJvb3VWUmFMaURSWFNOZHJp?=
 =?utf-8?B?bFZMRUJCbXd6NStPeERqL3gyQWxsSU43STlYMDA2UUMwQytNRHE0TDMyQVFQ?=
 =?utf-8?B?Z0MxcVVIL0krdjZLS2RWVUJ1ZGliUjFwdElEbmo3dTZPSUxhRUdjRlcySUEv?=
 =?utf-8?B?QWd5TlRMNzI4Vm9sM2grS1dPZzVlSnRIbnptRnlzUlBiSFJTOHpYaitJUnZX?=
 =?utf-8?B?WW43eEFybnB0UElBaUhleGhzaWRPSlFleTU5dXZDQnk5RmFsT3hTa0hTMFJP?=
 =?utf-8?B?WGpRS2ZETTdEblFBVW5iVGhzdXNkOGNlNjBWVlhHc1FkZjg3TllaM1MwK2F4?=
 =?utf-8?B?Z0RQZkZhQWM4cjlndnIzenBsYThiWUZtYlgvaVpPZDNGUFUxYitiV3lKMGYz?=
 =?utf-8?B?bDRIL0tuREN6N1VpMW4zWmcwKzlxUU54RDdZMVBwakJXTmxiVVAvN25ZWWZi?=
 =?utf-8?B?RGhVM3Z6OUhwMDNKb00zRmtnNXJqWWtTUGlES2lORDVFWHoxd1pBWndtZk9a?=
 =?utf-8?B?OXVUS2paUlVYSjBUOG5KM3NrRjI3SG5hTkRrdE5ENmNyUnFtUHFSNGhIV2dR?=
 =?utf-8?B?RHlKc3JUbG9Cb3FrSStkalNsOWlmZHcxLzF2eHdrMFRBU3lmWVQza2MrRHE2?=
 =?utf-8?B?Q3QwbWgveTVUMmJKWklYMkRMb0NOcXFScVp4aFhTMTdPOWNIQUVLMThJWDVN?=
 =?utf-8?B?dGd4R0I5Qkt5QXFFODd3VHozSTdWWUZYUitPZHc2QWZUeXZvSDd2dVI5UXU1?=
 =?utf-8?B?TEgzTzIyajJ4dGxjczZVTkxUQWt2VXVaUURsVUVnbEhCbGR6R2VrVGVpSzU4?=
 =?utf-8?B?S0JBYlpTaE1TVTdoYksxQVNEN2ptVVhBR1htMjhWdkFuQTZuQk5QczFzZDBs?=
 =?utf-8?B?cm5Nb1FEakIrN1V3Q2FJN0p1bFBKRTh5cjVpZHZPaUxEbGUzUDRUWmR1TFBJ?=
 =?utf-8?B?NGhtNmt2SVRHay9CRnBrRElyeW1USStlM08rNzdqWWppckZBMk8wZjVJQ2tV?=
 =?utf-8?B?b2NIUFBPd2ZEQmZIcXZhdTcyNUFwR3IyTXVQQkRzZzhtQUMwdmdzVE9SUGgr?=
 =?utf-8?B?dnh3Mkp4cDgwc2JIQnNzakIySkt6eEN1R0J6QUxtdDZVQldkeEhLZHZYVGpW?=
 =?utf-8?B?WUpmUHhUNk1idjBxeUxJdnlaWU9meG5wd0ZYdFZxTUJxTWFxcnJMNGx1UCsr?=
 =?utf-8?B?eitId3luSUF2UTlvTk5rRzZLNGE3NXZtWkd3cTVRL2R3Mk03Z3V3clpsOWhB?=
 =?utf-8?B?RUw3djd4V0k4aG9FQlZQUExrQWxwcEwxREhlV1dSUUtEanZtRXYrUk4yMlpH?=
 =?utf-8?B?U25jUXJ0WmxwTENKSlVGbSs0L3QvRnRJTFBuZDliaGdGNmxKbEJGVWN1QzV1?=
 =?utf-8?B?V24rR2ZPRXBCeUFTS1JlZUJhOTBZRHplWG1lNmFmOG5zRW51aFZwNXJIRW9Y?=
 =?utf-8?B?eWc2Nll6ODd5dk0yOVE1emt2SkZ3bUc3Um5keTBTaXNmRXI5dVVOb2trQ0ZK?=
 =?utf-8?B?WGdqYkpSWnA2dkRvLzdpcFQ0MmVWSk52cDNMbStHWUdGTHl1RzNwd09rQldV?=
 =?utf-8?B?NzAyV2llbWo2bEtndlY0RUFLSW1mSXMzUzVXeWthVXBUVlBQbzc5dFg5K0Mx?=
 =?utf-8?B?eG5ZbkwrY0RLOW5XWENCRWxxdGgvbW1FVWR3NERrbjh0MzNUQmZNVmgvaFNw?=
 =?utf-8?B?R3dvMHc5Vm1Na0xSUkpab0VZMmZzZFh5UGVkL0xxUi81bjRickp6WVE0R0pE?=
 =?utf-8?Q?6kSHf6UGjhxTB9lM=3D?=
X-Exchange-RoutingPolicyChecked: rj9/3/Hfg4m6DKrwJNVyypAyP4B3AsPCuGJDhVOTafuCaHo+bbNxd7yprG1givYQlOck4oDEWgw5IrqoGfd/khKLf7DQDoO1gnZdQJM+GtEgEpGEMVjHet+5fLrDjaLhuAJ7ikMcP69/gz476fEQnhHbh5E+o7XHctWd0YQtkmadqhsFThNfSxvLPsrGRp0W9Jm74YkvUs0I8WUI0TOujlnsVBB+LpFbFZBNc35KQHLm8fnxj1jASRyg0HZlKG6l6H1WOBMUrw1AfnJ8PaM0ca8ALVPagbVPtsvInD5Sn0OZteX2tipjm9UbpKbqVOd0QeIxlHO3yaqfNNZfyN8mEA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f34c893-73e7-4fa6-ad6d-08df0dbecf1c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 15:35:28.1472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AY4Jo8gxchuj4U088klU0z7a0zaIf/AX8LgbCXRSixRT2bHWOK9Lq0TasppHxpCTrox9yxz4vWaUufc8xVEu7SrZdh9tN7qaUQMz61lMntc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9709
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_083542_176686_BE661981 
X-CRM114-Status: GOOD (  16.79  )
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

On 9/7/26 3:44 AM, Ben Horgan wrote:
> Hi Boris, Reinette,
> 
> On 04/09/2026 18:36, Borislav Petkov wrote:
>> On Thu, Sep 03, 2026 at 08:37:51PM -0700, Borislav Petkov wrote:
>>> Lemme have a look.
>>
>> Sashiko has comments:
>>
>> https://sashiko.dev/#/patchset/20260709093111.367851-1-ben.horgan%40arm.com
>>
>> Please address them: if valid, fix them, if not, explain why they don't need
>> to be fixed.
>>
>> Thx.
>>
> 
> Regarding the first Sashiko comment.
> 
> The documentation change in patch 3 includes the sentence:
> 
> "
> The allocated bandwidth percentage is rounded up to the next control step available on the
> hardware.
> "
> 
> Sashiko rightly objects to the "rounded up". For MPAM systems this can be up or down and we test in
> test_mpam_resctrl.c:test_percent_to_max_rounding() that it isn't too biased to rounding one way or
> the other.
> 
> How about replacing "rounded up" with "rounded up or down" so that the sentence becomes:
> 
> "
> The allocated bandwidth percentage is rounded up or down to the next control step available on the
> hardware.
> "
> 
> What do you think? Should I respin the series with this alteration?
The change looks good to me since Intel always rounds up. By itself "rounded" may thus be deceiving.
One concern is that "next" seems to accompany "round up" to reflect forward/upward movement.
How about also replacing "next" with "nearest" or "closest"?

I think a respin would be most convenient to ensure the intended changes are made.

Reinette

