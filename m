Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93529CDE00C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 22:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=76hKP9lY+LAFCw8x0XhwoMbGCFStx5LySozwOu2sBDE=; b=csa8QoBQkN8F1pWheM8RofZzr7
	YCcb8tLITEGk+Mnq6KNSVSHY/Bx2vyiJme55YgAzKiGXLANBt4HD4MRTZ7oAJVIFAT/1GdrC6nxEA
	VX7Ftxait9UUof0V3G6+5MS7P7jC5fs4lchSnDf0W09ukLFogvWxqIRiM8QOycjMNL6Ec7j5iKlRe
	7XGUZvR3XWI2DHe7PK/Sq5B3AmOBxT5E0q46hGZMbSV3db5/Wicrjv1kcEehNFNIJZ5q7Ne4kvA+/
	omEBB5us1sETI+tDS5wiTyKvs4BED+sBBYQO/I6P036OkrIJeNiRmGTA14up3t7S2wtg/+zGF6FA+
	PmLoGU/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcsND-00000009vEK-0Ix0;
	Thu, 25 Jun 2026 22:16:39 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcsNA-00000009uyW-1djY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 22:16:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782425797; x=1813961797;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QzJV/q/eO1Ha2qqiZ+w9OGhs1l1ULt5WSytDd2Ggv6Q=;
  b=i7rCc3U/pARF8tw9K1VM45d+ZH6C2rtFXZuBf3vV8zVceIMKspVBJMJ0
   BTHfGh0Gsm5TRmOaa4+NI6p+AxPKklXNP/lFhhXtujy6oJneJi8NdDWLM
   X9Y95rP36io4ctqmqG0p3MKGBoYyu1GSgiHP/RRjzpx2gmFO6rkpFL58K
   z5xEU1gLeB+hgSwvckD1Kj5o3EZDYtI6TyO4CUoZLsstlPNUnlHVbCnuP
   TfXeJt2sS9bVKqNnAqNKE+tPsQtxS2qvtp2yNKJKS5h+HqZxUXUJAelIi
   oxmob8v7C5NP7wvgMZ6J/E+Fx6cnWykUAekO5DGBtaAMMl8C60FtC9fh+
   Q==;
X-CSE-ConnectionGUID: q1UV9WHGQxScN+Tb6xIFgA==
X-CSE-MsgGUID: 3WaENXOxQkimvCKORQKo7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83097392"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="83097392"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 15:14:36 -0700
X-CSE-ConnectionGUID: 1WqERzTVQEKnC6yy0RrK2Q==
X-CSE-MsgGUID: HA+yv8cNTsKOB94EwP0izQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="247139373"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 15:14:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 15:14:35 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 15:14:35 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.28) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 15:14:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KFovUOgA8/KgyzxU6RUDjQz+Z6dq2cg+NgkMGKwcN1677N0+s8zQSuUQkLnLHv0vwditDlZNFTUpXxe406qRDaJtt+ufzmJKXSjp/IW2/pR00KLmPdrvsUIvMGQGpS+Gs2QljXayKa+g4+Y9E59WvJIDwTqI43KkqYzhTzr2wkqOfAZrIiTWTSNhL/IQLmX0QmsfOTS1XAqPb1i1EARnPou68y0jITqS4wvksmKbP73amb7uJpgvfwsa1JkSOylIR/dxMsNVWg06mezXmSZe+ip8jZuJSAc7cQxQm3UN8a30K9USM0A0fBaogTTQQIeJCAZZPLRIWJJdCYaqZOUPRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76hKP9lY+LAFCw8x0XhwoMbGCFStx5LySozwOu2sBDE=;
 b=MFMChUmH9zeynHKtWNS32DrOYzCtaZSmx9nGws7N0VUtsAwCI3V49jpPoySTkq3dYhRh5Gwob77VBuSkno1d01bj11D0pvl1DPEnHxml4wSkKMGaphe27BxM1yfRkOjV38cDU3FbPslQi/JvECqSrNezDoAYbtwdFZNXB2gc6l8UgJRAF6MnjqjGvrWUnHYdVmOsmKinq1vs4sP8pIUl4tJNt1dx3JZPu4FYykYaSreWQLPk7DCvBbFzkK1JzlmGsVykh4fQu395tKYiF4oUFuLfJymksYoKZt9DwSpMLqPceHhtGYxY2ElTKWjmuw9fAExkvDZPz/td7FC9jizCrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SAWPR11MB9709.namprd11.prod.outlook.com (2603:10b6:806:4ca::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Thu, 25 Jun
 2026 22:14:34 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0139.018; Thu, 25 Jun 2026
 22:14:34 +0000
Message-ID: <77d30d2d-91db-456e-bf41-2cc31165bd2d@intel.com>
Date: Thu, 25 Jun 2026 15:14:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] selftests/resctrl: Replace counter index
 references with pointers
To: Yifan Wu <wuyifan50@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <zengheng4@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260522090540.444554-1-wuyifan50@huawei.com>
 <20260522090540.444554-3-wuyifan50@huawei.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20260522090540.444554-3-wuyifan50@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0070.namprd03.prod.outlook.com
 (2603:10b6:303:b6::15) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SAWPR11MB9709:EE_
X-MS-Office365-Filtering-Correlation-Id: 02263023-17f1-4e61-a0c7-08ded30722f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|921020|22082099003|18002099003|56012099006|6133799003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: bhnfrYfweZ9WE7qC3/ucZcRIOycwu5BfSY6lS7/UDl7p1ofUrTzoMYKXGmn9zUO/QYwqsbiJXFhjTKq1YglO2Bt83kweEHslW1mUpG9KDeRol+20T8++VeLy6lYaDuatvBbKgy6NbEsDlZyVMi1T1WK2KXpXqsewdlnunsla1l60vJYvYbJBtR8rdMLpmhhESnXuyuBIszVexpYRlB3syjXrZswPc0YkiE27y7VwOhYaP8QO6tY6JxUhSAok8vXBtDLgosm0DEcFI7gcWePiB8MbSJ3+3mVh2zFIqs238nf2UUKGGaOWwTx6VYbpsRdX4/VdpuBwb7OSt2oz7oeN9LBAryfIgbF4SintBdhUGT+wIqAhPZQuKYLCfsUd9RFhk1Y9Z6utgoPr2MalA6ZoDyEeNy97pYX0tRXA6P1dQSu00KVMoZPjKnHUD6ee/YXKf4wf8ajxn8ESFOSPR5uqfDPK/rCx5ltFH6GpekxwBRV+zZkcmgp8CFmVpZJViOdhCbrCzkryLUh1/Xq4bfHg3AxEX9+SIZHLnKiusb0Htw2aoMrJtZ/i5N4H8pX3kFdMHLLa7fduEPisWUOAiaA/p+CTL+NgEtMxHr0tfIFyWHy7HWqJs2t6XFtejwjRInmHCkW8yT2gbsWd8EyYZDD26ogojQwrFPJ/vGnjZyVU8ZdpK1yrg8JS6FoGCVAvU1QKOpfTf70sKLzYX3R//t0PUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(921020)(22082099003)(18002099003)(56012099006)(6133799003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzlyQXAyZUsrQjdiSmRoUTZFWXhpNlZNNERkMmlDVE16QlVxSGUvWS9WaU1y?=
 =?utf-8?B?QUprdnI5SFc5RXJ6Ylo3K0VzN3NKNU44R1RYREtKRXVMek5DR0lpRmpUL3VT?=
 =?utf-8?B?VGJNaUt2d21qYVU5ZHFxZVJ0bU84YXZJc3F4U0c4QmlDeWdMNHV2cnZMNEMy?=
 =?utf-8?B?SFBUS0lQa28rb0VnV0FQZm5VN0p2TmVhbW1HUGpTRjQwRDFNa253WUZyUksy?=
 =?utf-8?B?ZnZVM3NvbnU3V3dVdlkzbWJJaklibWMra0laYzJJV2FPTFlDMUEzT081aEhO?=
 =?utf-8?B?L2pLTEJ4K1FXSksrTDVXaU03bHl6clovNTZkWllodkxCWmZ4T1NabW5mSDZR?=
 =?utf-8?B?d0twVW1rcWdCeTlyWDV5MWFheHo4TUJHa2t1ZE1oSm5nSUtsUGF5K041Qk53?=
 =?utf-8?B?Ukw2eUs2RGJTYU5zWFdlMjM2R1BNNEpneDFwMDl4dWNJd0FqTGFCd0pQZTc2?=
 =?utf-8?B?ZHl0QkZ4bGZKRUxoRU9WYlkxQ0dod0FFOEZlYkYxTzZoVjFoUnk3ZCtjYUdK?=
 =?utf-8?B?VGhwR0g1OVRYWnZYcVZicER2RzY2ZE94ZE5FandNdFhXNWJ1dm9zMThGOUQ5?=
 =?utf-8?B?TElaSlFDSG1pbWVzZjErU0VTTGJ0Sm02ejV1WXFSQnBldE14cGEvbmowRHY4?=
 =?utf-8?B?d3BLKytyejVNNHdQZVJLNGN4Y3pDdEU5UDg1Q0VaRnlteXJKYUpGdStPbGNx?=
 =?utf-8?B?ejdJSll0dUFZRVI1dHlnTStHd3RnK0RzTitWMjFhSTgxTDhHYzk1RC8zaGhY?=
 =?utf-8?B?VmR2ZGp1MXVwZFRkMTd1d2p0dFYzZWNLVmlVZzdkM2JUU0x2NTczbSt0RmFw?=
 =?utf-8?B?UkdWaXltM2prbjZFTzl2MXQrbzZ2OHhqbmxHZUhTeU1xVlJtRzgxMG94T29V?=
 =?utf-8?B?QTY2S00zcnNSSW5YR0hvWS9kSlVDcWQ4K2NtZXl1WVFnRFowcGR2cGc5anUx?=
 =?utf-8?B?dGZiSGN4QUZwZzM3N2twSHJuWTFSaHVtOUQyWVhHUGxsc2FUbHpLUVBKMFYv?=
 =?utf-8?B?YXZmd1ZiNlU5cFJNQklnRlFMSTQ3eUNuOWp5dXRDWnNBNERWSlFMOXNKT0N4?=
 =?utf-8?B?L3d5Z1JCR2FiSFF1UE9QeDJDTnVwdHRtenhkQlF6c0tEMVBIdDZOYkxVTmJi?=
 =?utf-8?B?UWNoQzZIY2Ezdlh1L1VXejVqZ0c1S01pdTZ2UnZlOHNGenVXOFkrVk5UZ2R1?=
 =?utf-8?B?azk4SEF1bnlnWUZtSkFsNE1lNXFzWDJTaUtiWVlqT1NaREpmdmtjaHdnK2Z2?=
 =?utf-8?B?cUZ1Qjc1WlNSSHZzTHJwL2UrNEJYVnJFcHBIMjF2bGJRb0svcElQZCtMUU4v?=
 =?utf-8?B?b2RPNFJnKzlUR3NOVWNlUHB4WEROMHZqaEhabkk2MWo0Q3dkakVhTmVvN1Ji?=
 =?utf-8?B?REc1SGcwZENtTVc0ZTRTZUEzV2wxL3Q2cUhhNW5ITTVTbzM1eFpUcXpFTDVh?=
 =?utf-8?B?OERFdEdOUC8wNmorNk1iWjVCS2NLc3RXd0lJVDBRVTRldE5XcldJNHJySTFE?=
 =?utf-8?B?Y2RLQjE0akw3Sndqa3FCV2QvejFQOXRacE96OVlQcmdtM3ZJZFovK1BoUjJQ?=
 =?utf-8?B?Tk5iOGdxV1k4bnVsamQ0Tyt5Z1VQZUlpVFFER1VCV2NYU0JHSWFTN2hxM2xH?=
 =?utf-8?B?RC9JZGptNnU1NjR1RUUwNnZLQyt3aWlPbHQ0LzlxMGtieHNkeHlXOCtERUc5?=
 =?utf-8?B?QXIyRzUvSFV1MWdqYURxRjFYUVROejJXNE9FMjZaSU9OeVVPWGtqOXI1Rkpi?=
 =?utf-8?B?OG5rMGkrMENTSlVSSUJyekN0ZW9zWUNBT2pvY3ZqKzlxZnppd1JPbnF0OVA1?=
 =?utf-8?B?ZktSbDVNZThoV0ovWUFSTjhpMElhWkU3eUJid3NpRDdtSjNCQTZnSUk1SU9R?=
 =?utf-8?B?VXdkcU4xaG16cG5NaDNCTGoyR25KRWFNVjlmdW1UR1IwSWZrbDd4MEVyMXZX?=
 =?utf-8?B?WS9FV2MxTXd3NkdmNEd2OUJUN2wwb0FaeWlML29SbUoyUWQ4OHlvVWhLRXBF?=
 =?utf-8?B?Ym1adlo1c1R4VThVWjR6R3FHNTlHcW5mVEZmR3A5K0VMdFpVMjduRE5KZGdT?=
 =?utf-8?B?TFZqeUh3RWNQcVVqNmJtQ1M3NjV0TFpFd3hUQ3BySUZjVW90M05qNXY5WXVy?=
 =?utf-8?B?N2wwSEF6c1BzcVF5NVBWL3RodTFkVEtRM0xES0NjUStuNFJsVlNwYVV1cklJ?=
 =?utf-8?B?a01YN0krR0JXWUo3UXJFRGRaZEk1WThGek1MNWhBZVk4M1BMSVpSc2JBU0w4?=
 =?utf-8?B?UFhYWnd6a2FmMjZIOEVSc0pGcXA3UFZ3WTNYS3BvTlZRSnVFUHIxTmJzdzhZ?=
 =?utf-8?B?NVpGWStJZkUrOWRnZDZpc2RnSFNCVTdCS3pCVW50MURhZXN5OU5XbjJhSnk5?=
 =?utf-8?Q?vh/g1S+c3MjlVuCs=3D?=
X-Exchange-RoutingPolicyChecked: CmxQ2jdMefqrUhdEpAvPBuABZFZ0O2ph6T8lFEQt5qNOmmkke9h5woRMYUaOcoM/5+6grAa6uRWGnK21sG0ztARquRZ3DyNlfScncQ5MRfMo5EHb604Y7oIYE326joKnFojuYXq5wN2+1AJF1OwFsBfNkzLrwimBlxUv01r6LS69C4Lhhy+n2v0HyhTKFiQRaDjzlRLs1pk9/TZSaJik4DRU37b/rU4qy2dAJQ7Kax5YmsrpEJdgZwJKANVN88TM20PcNJYQmkRsKSAnSGVuIIxBliGC5jpd2iO9XEUwKCOaAAr86Ejijqn2xWLmAEt0wCHX4BhrnHB8y80MFJqp6w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 02263023-17f1-4e61-a0c7-08ded30722f8
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 22:14:33.9412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d8Uk2hX6LJWan5DISjIgAJh07ZCocZ6ge4PNF5/7geD4bgdchTIunGyRpecADGnTNZjiH4x2bPt2u5F2MuoGVkjQgp559qVDam9J9zClyto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9709
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_151636_457603_82103B48 
X-CRM114-Status: GOOD (  16.64  )
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

Hi Yifan,

Thank you. I just have a few style fixup comments ...

On 5/22/26 2:05 AM, Yifan Wu wrote:
> Replace direct counter number references with pointers to remove the
> dependency on fixed array indexing and enable the use of different
> data structures for counter management.
> 
> Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
> ---
>  tools/testing/selftests/resctrl/resctrl_val.c | 62 +++++++++----------
>  1 file changed, 31 insertions(+), 31 deletions(-)
> 
> diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
> index a72dc4ae61fe..3d2b6919717a 100644
> --- a/tools/testing/selftests/resctrl/resctrl_val.c
> +++ b/tools/testing/selftests/resctrl/resctrl_val.c
> @@ -42,40 +42,40 @@ static struct imc_counter_config imc_counters_config[MAX_IMCS];
>  LIST_HEAD(imc_counters_list);
>  static const struct resctrl_test *current_test;
>  
> -static void read_mem_bw_initialize_perf_event_attr(int i)
> +static void read_mem_bw_initialize_perf_event_attr(struct imc_counter_config *imc_counter)
>  {
> -	memset(&imc_counters_config[i].pe, 0,
> +	memset(&imc_counter->pe, 0,
>  	       sizeof(struct perf_event_attr));

nit: above can fit on a single line

> -	imc_counters_config[i].pe.type = imc_counters_config[i].type;
> -	imc_counters_config[i].pe.size = sizeof(struct perf_event_attr);
> -	imc_counters_config[i].pe.disabled = 1;
> -	imc_counters_config[i].pe.inherit = 1;
> -	imc_counters_config[i].pe.exclude_guest = 0;
> -	imc_counters_config[i].pe.config =
> -		imc_counters_config[i].umask << 8 |
> -		imc_counters_config[i].event;
> -	imc_counters_config[i].pe.sample_type = PERF_SAMPLE_IDENTIFIER;
> -	imc_counters_config[i].pe.read_format =
> +	imc_counter->pe.type = imc_counter->type;
> +	imc_counter->pe.size = sizeof(struct perf_event_attr);
> +	imc_counter->pe.disabled = 1;
> +	imc_counter->pe.inherit = 1;
> +	imc_counter->pe.exclude_guest = 0;
> +	imc_counter->pe.config =
> +		imc_counter->umask << 8 |
> +		imc_counter->event;

nit: above can fit on a single line

> +	imc_counter->pe.sample_type = PERF_SAMPLE_IDENTIFIER;
> +	imc_counter->pe.read_format =
>  		PERF_FORMAT_TOTAL_TIME_ENABLED | PERF_FORMAT_TOTAL_TIME_RUNNING;
>  }
>  

...

> @@ -89,21 +89,21 @@ static void get_read_event_and_umask(char *cas_count_cfg, unsigned int count)
>  		if (!token[i])
>  			break;
>  		if (strcmp(token[i], "event") == 0)
> -			imc_counters_config[count].event = strtol(token[i + 1], NULL, 16);
> +			imc_counter->event = strtol(token[i + 1], NULL, 16);
>  		if (strcmp(token[i], "umask") == 0)
> -			imc_counters_config[count].umask = strtol(token[i + 1], NULL, 16);
> +			imc_counter->umask = strtol(token[i + 1], NULL, 16);
>  	}
>  }
>  
> -static int open_perf_read_event(int i, int cpu_no)
> +static int open_perf_read_event(int cpu_no, struct imc_counter_config *imc_counter)
>  {
> -	imc_counters_config[i].fd =
> -		perf_event_open(&imc_counters_config[i].pe, -1, cpu_no, -1,
> +	imc_counter->fd =
> +		perf_event_open(&imc_counter->pe, -1, cpu_no, -1,
>  				PERF_FLAG_FD_CLOEXEC);

Please improve readibility here by moving the above two lines up while ensuring alignment with
open parenthesis. Specifically:
	imc_counter->fd = perf_event_open(&imc_counter->pe, -1, cpu_no, -1,
					  PERF_FLAG_FD_CLOEXEC);
...

With the style fixups:
| Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette

