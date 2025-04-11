Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F99C369A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 11:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjDed0Czyts9lAVkpTQEGechVazK//Kmz2MnSiTMqG4=; b=C3/pO5AtHP5xlq8psEcyTpixQM
	PdBJprSh3YiSF/HwsyrrUDVq3BtCOTcA9OR8eCWamztFM+Y4rK86iISI5lAx1Hz3lP7TrPfihXgUG
	QwNdCrr4y2p86DEeYlaPfAKqJKUKad0kPXfUEg+wnUt1Bi9iTQFHyVl0r/aPpXgOL85JLj9EjLFcA
	znCppXjFXyA+WnBCruRpF5OL4FKQVNfifWs5mQgqV9f7fNBdeXKSXaUYeumyvpiOtUYq59q0jBJAv
	FXTaNZw5A4QxlQ2o3pL8NrCGE5KdLpTsNm29nlmCNCv7vz8DVhIzHNZJZzbqRz7+6L8PwJQNyr9sY
	cmOGYgDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3D1Z-0000000Delw-2eIZ;
	Fri, 11 Apr 2025 11:58:21 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Cri-0000000Dd9H-42Fm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 11:48:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744372090; x=1775908090;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NjDed0Czyts9lAVkpTQEGechVazK//Kmz2MnSiTMqG4=;
  b=cpOxOQ9pRL4fIfaK9NnOWBV8k1/oc69gR7Y0NHFon0ux2YroaiRjORpP
   f+QzhZDJlVJMSkttzKpRDL4by4TaxcePG8WP4ozWMTS88Ylt25DrKHnvc
   999BZWpdAR/iR3lDLMbXbHcKRYo4lW0Ioww4wB8OaDH4O848B7Rg+BeNy
   U0kpVUUuUBe67bJp/Pg+z5F7yvpMJ3N9tOZHwehf8odIIuttb5KHIwrdP
   XxyY5jg8j+iVDQDpbtCDRA+/O0rvIi8KVX6FBxxlO60JX21xwhyjyeG7T
   2IaAdOC89j85jTnVmcAp8SSwXS5ahFtxVSGIPiezZ9kVNdfT4EJyzFqAp
   w==;
X-CSE-ConnectionGUID: 675IUHUOQ2yYuRwB3U+clQ==
X-CSE-MsgGUID: BCEZZGoASeyJDRwtvt1rZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="71307596"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="71307596"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 04:48:07 -0700
X-CSE-ConnectionGUID: 5FqMyC3iTHu50jJ3dtR+pw==
X-CSE-MsgGUID: 9YBdSVoMQlCfqdq8ECXcTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="128947384"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 04:48:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 04:48:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 04:48:06 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 04:48:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mOn583wRBZNk4JWQjk71GqmIk726fsuJI9VH31BjW28c/a9KaE8kpnysnB8VciJSKI9BsZsjE0O8a6XVHk0/RhBnUMSjQJNZ6RSSJP0gHvLH+ZJse1LeWSXW0qjfS65UmbNPCkH8P9OcxjKY+Dp7gHecEJcWf7TDOTPoe4M4rL2K0KEGOC0FU/FSO2NiB5okNxr3pydA58Jp2VReN0PlNlXHpftTC99xZvQT3lnYP176L8tAomfeI6K5I2gBS0XRPb3f0Agya5BZjsAVJ249kXpRYtr9j4zSHd12oNPRncqKHogsH1fGcTXMUiIl5SdjKpbHC8A1XMFCyWivljclGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjDed0Czyts9lAVkpTQEGechVazK//Kmz2MnSiTMqG4=;
 b=CLekWyPeReKUglQA0LI7DeWDa/eqzIHwil1C5DZcPgjeZX/aJMaV95CaPBf1YiH/jJt4TfXeHPFnTmjgEcOsgJnq/IX7uGNFSjFynaSnLDdGtDwafRu2F9MZNxoXNTimaJoLfB0YShxfeNpw0TXmar6c0TgdNGVowoYxVBdBjH/P/6vR8uwkZ5gjfLx7W6+oZ28rMo/37Eu7TZnOdAqvoH3Ko11uS/uRhAKBK+heXqP0xOTmOxKldOkDX+RVdMK9SBXFsJ3nJ44aWtesqyU/BKkkmN0bEDDQ238DJhGnm8xFSYN3RW1HzjZVhQ2X9/tS9HXNWBTggceykVfuXGN8dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3605.namprd11.prod.outlook.com (2603:10b6:a03:f5::33)
 by IA4PR11MB9036.namprd11.prod.outlook.com (2603:10b6:208:565::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.25; Fri, 11 Apr
 2025 11:47:23 +0000
Received: from BYAPR11MB3605.namprd11.prod.outlook.com
 ([fe80::1c0:cc01:1bf0:fb89]) by BYAPR11MB3605.namprd11.prod.outlook.com
 ([fe80::1c0:cc01:1bf0:fb89%3]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 11:47:23 +0000
Message-ID: <0204ba93-a987-4e88-9992-e160b488b680@intel.com>
Date: Fri, 11 Apr 2025 14:47:12 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] [PATCH] [v2] mmc: esdhc-imx: convert to modern PM_OPS
To: Luke Wang <ziniu.wang_1@nxp.com>, Arnd Bergmann <arnd@kernel.org>, "Bough
 Chen" <haibo.chen@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
CC: Arnd Bergmann <arnd@arndb.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Josua Mayer
	<josua@solid-run.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, dl-S32
	<S32@nxp.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
References: <20250411085932.1902662-1-arnd@kernel.org>
 <DU2PR04MB8567B7E1DF735B19F54A987FEDB62@DU2PR04MB8567.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <DU2PR04MB8567B7E1DF735B19F54A987FEDB62@DU2PR04MB8567.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0230.eurprd07.prod.outlook.com
 (2603:10a6:802:58::33) To BYAPR11MB3605.namprd11.prod.outlook.com
 (2603:10b6:a03:f5::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3605:EE_|IA4PR11MB9036:EE_
X-MS-Office365-Filtering-Correlation-Id: 6470cf78-0d96-45ff-8cf9-08dd78ee9f77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z25ZbVhHR2RoVUNrdVlXZnBWRG8reGVKbCs1QjMyY05vL0RDaGx2REVoK0w4?=
 =?utf-8?B?bjh3bXRlcE1mZjM4NWg0TCswc1cvWkVlbGlyRUNBRjE2YWtUVll4cWFUQWRV?=
 =?utf-8?B?UjNlMWYzMGxRbzZEa0VWUUR5aHlYUXVOSWJTU1ZHYjV5OUpwVExiekpGdi94?=
 =?utf-8?B?UTFoN0hEMzVscVNXejhjMlFzYVhZUWM0ZzBlSFZQenpSUU9lVlhlSCtPK0M0?=
 =?utf-8?B?SS8zZnN4eXpmY1VJR0VtMDJWNGFhTnA4bTJUQVMxcXNwMHdsejZKaHdvalg0?=
 =?utf-8?B?aCtkTkR3Q3liSVpWdEVmQUszUStobkZ0R1J3cXNqSzFWemdWeDljN3BWNXZR?=
 =?utf-8?B?dm81cmJ6MGs5djM0blZFZVlMaTB3UWt5NUwyUStqQU04RXJXV1o2K2luTXgr?=
 =?utf-8?B?M1h3dUdFaW1kbjhxUVRkVEFHbXNNek1TT0VIV1YzdWwxVC9qVWVNdEtVbHhy?=
 =?utf-8?B?S2JCOGdyTGZSdlFCZXRUcmVKbWRwZFFrSmJEVnVnOEJTMnpvTzFSa0FmaGkr?=
 =?utf-8?B?ZisxajdaeGcrS3ZENVpyaFBLZ3MwcnlLMmJXeklFaWhZMnd6ZTNBWHBFRU94?=
 =?utf-8?B?cVhhdTl1SFBNYUFUZVJSM2RGZFZybHkyUVBRMGtOYUFUemRZcHFtaUdwc2Nn?=
 =?utf-8?B?MmhvelNBdktvK3dJM1FITXZMUjFwK1AzUWJZa0hFMTZETWZ4aWN2dlFUc2NX?=
 =?utf-8?B?SWdCczgyaEExVmtRNlZUUUZPTTQzOHhGYTZCVXJaWXRkMGh3eDJ1UENqQTlR?=
 =?utf-8?B?N0lNWjdJYnFFYWFTS2FWbDhZRWgvTnI4bEJMRjg3TWI3T3B3TG1aZVdRbWVW?=
 =?utf-8?B?aERvYThCV3ZHMWJWdWZNdUtmbEU3U1JYTjBHQmRsdzNJRzRqSTR1YnpUYmhh?=
 =?utf-8?B?emtkVjZOd3dhcjJMemRZL0ZrT3dZN1FhbjlQQyt5czU1NWhydXl3VmhQekt1?=
 =?utf-8?B?cEsxZkpqaW9DTkRTVi94d1A2TldMQVZpNWorZzBsMnVsUy94ajlUMjB4NGFK?=
 =?utf-8?B?cGtnN2hYYzFPdGU3MXV2Q2c2SjFBVWZsTjMxSDFBWTgyeEZ6MVE0Z0Noc1A5?=
 =?utf-8?B?Mm5QdjJIMmk5M00yTjd1ZWtuZGluOHVmeWIrRGtvSEp5VXg5b0loOGJnUkJF?=
 =?utf-8?B?RjVybEUvR3h2NGdycVY5ZFRZR1h6TWpZMytrZnEwUmRDUERndU9xN3IwWVo4?=
 =?utf-8?B?SGlYOUlObnhxRVdvS2Yzc0tLMzdaQmxDd2FpNlFDOHRYN2ZlOVlSQnZpWUln?=
 =?utf-8?B?YXEzUEwxR3JpWFVPMjZ0b1lmV1gzRk14dGppTFYwMUJGNG1QazFjZUhsRHFS?=
 =?utf-8?B?VG1aVURwWW1yT2lqOXJZUXJRSlRqcDlRRHZ3QVVYSlYvU2RoTlJ4R0ROVjlV?=
 =?utf-8?B?YUVpZWtGUmpYMU05Wk1qb3ZTUVZEV1VaeWVOSnVVY0F2bWtSQnlOd3A2cVFW?=
 =?utf-8?B?WmtiN0NabHljNDlwbEg3NTR4ZmJQZWxrR1lZdk52TlVMRXZUVW9FSkNqTldr?=
 =?utf-8?B?eklNMGxVdFpRSDN4UUE4dk5EZFRvRys2VXJIMmlvN1pBUnR4bzFFTGhSQkJP?=
 =?utf-8?B?bVllNDhUSEd5TnFiZm5FVVY1dCtqb2p3c1lqSU02TVFxY2lqSXUvakZTSU90?=
 =?utf-8?B?Y2xiQVZqUjkrUUFwV1hFa0hGSTNZNUI3MStiSENMRmpLM0dPSDNOUk9vSmVD?=
 =?utf-8?B?VFQ3dmZ0NDhtb0NzWVNzTS8vRnZDNm9EcG9pRURHSEtWODJQOUlMa2s0eGxK?=
 =?utf-8?B?M040b29vUlNicFZXVHV1bWtXOE1ZRkd3VWU4V3MzWlE3empRVEt1dEkwS3Av?=
 =?utf-8?B?YW90SWt6c0tXTHFmMm9YUitoU2N2dkdXbTNKRXZoN0lobmZWL1ZKMFF6aHNH?=
 =?utf-8?B?NlhxRWVXY2tUelNnVXN4TEgzTUtnaDdxS1ZUSURvRHRVZlZhMEo2NVJRODRa?=
 =?utf-8?Q?LDpjCxMVjXY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3605.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXhYNzJkYUw4bkFZenJKKzVKRnJOKzhSejVoL1FJcU1oL216anJhVUIrMUJY?=
 =?utf-8?B?ak1lbklLbGR3STQyZFMvNkhWeXc3ZmVGdHRqcWNPU2ZaNzdCdnVSdDkvVU16?=
 =?utf-8?B?UDJ6Z0c3Zy9rQTRjUTZZQTI4RlQ0NnhmbWdSQjg4eHpUTDNWZHFWWGVHWlFw?=
 =?utf-8?B?OGZoTC82RzcyNEdjSTRzZEVNTDJxT051UkRpTWRTTURrckJEMm9kMzB2azZm?=
 =?utf-8?B?M05xc0w1S1YxMTlINGdER2w5NkE1QWJoaXYza1lzTEJFYlN6UFh6NWJaeU9C?=
 =?utf-8?B?T3R6ajFuRzRVQnFib3FxVUVzR2RCVlRkN1ZRZ2NjSmVQWXFnKzBldnNlVWxO?=
 =?utf-8?B?VlpDT3ZKSTA4UTBNSjNxRGZ3WkFTaUhFLzNWWkMyVlJKbkVLak1obFY4c2xu?=
 =?utf-8?B?SW9ZUWVyWDZ0dTdyTzdkcEpMUVNKeVhHZEtwaCtwTkIrSzhOTSsrN3hWRlV4?=
 =?utf-8?B?VXJWTStsSGhsUEVRNjJ3bWVZRStOR1hXaEpwWEJueVhqd3BGY2prVE9KUUxu?=
 =?utf-8?B?TmtaSlhacEhET1JpQjdEd05HdjBLaHVnc2ZCQ3YxK0QvenJYMVpaNVhIY1Z5?=
 =?utf-8?B?UG5oek5FeStiZEoxbndxeTVmNHI2ZGg0UzZIQkYwS3g5Z3ZLSzljamJzV3Vv?=
 =?utf-8?B?TDFVRDNDazRvN05LOFBWWCthUGUvV1BuSjYvUmRDbjhiNFlKK3BjKzVBaXpj?=
 =?utf-8?B?YVlnQ053emRTSWxHcjZDMEpUWHFWS1Z0NjI0d1ZXZ3piR2FlNVpUVmR2WFFw?=
 =?utf-8?B?RE9GeGo1U2cvNSswdVpTaHZNUVA0TjFSZk5zQjVoZWUrMWFEYzk2WStYMGFx?=
 =?utf-8?B?RHFVd0RCdnJmMnRCNjhQUERYMHZCZ2lJcUlmb2JhcFVIaS9RZEx6TXFpUmdu?=
 =?utf-8?B?bjNWd1dHRnlEZ3ZMNjZWUlZORHorUjlDcnFRN01aZU5Bc0VYTUJjcVBxc0NU?=
 =?utf-8?B?YWsxSnFLbWtISFZxQVFheE1RTTFqRWo5aklwZUF1YUx6WitUdlArL1hHcDRo?=
 =?utf-8?B?TGpVbWpMMEtjUTB1Wm5QOTJHdHVsMDlBM2k4NjZ6OW5iS2RaaFZlS1hNU1B2?=
 =?utf-8?B?dGZTbzdMT2xYM1grcTZMclJEUC9EbHVlSlh2aXk0b2RvSUVyRWF1RlNCUkg1?=
 =?utf-8?B?eWowSlhIYm5qNnppUE80ZkRKNkViT3JPOWRFNHRnSWJZRW02N1hUMEJka0s1?=
 =?utf-8?B?WjRBdk5sNktEeExrRVFsWWJFY3crSmI5Q3NqTkRiZUpQY1FpMHB1WGl2cGxZ?=
 =?utf-8?B?SzdGTWt2bTg5Vi9BT1VQUW1mNEp2Y2tDbWRXMnlHR3lsN2lWMmJZMmpYOXhm?=
 =?utf-8?B?TFJuRS81MG85MWxUekxCci9wY0JPZUc0V2RPajVwK3RjWlNRc2RXaFJTTTRQ?=
 =?utf-8?B?bURvcWhYZktnWGR2RmZaV2U0V0NETkYzMk1JcjB2ZzRLTXlObVFUamI3cWta?=
 =?utf-8?B?S05OSGxMUDd0NVZjMUhabTZwclNRWVdJdk1hQ0hEQmlWYWUvOWxDS04zaUtT?=
 =?utf-8?B?Q2NkVVI5Mi9CV2o0bTFkL3UyYm9TN1FsMm1MTTYrRWtRQWpXNmZyQm04ZG5M?=
 =?utf-8?B?Vno1V1pGTWFNQ1ZZSkoxWHEwNFdmQWZ2eVV2Z2NOemFjc2VSYlFNeHRKS2M3?=
 =?utf-8?B?MTc2OUZRS2JjV2pmcFBUQS9kRkN4RDR2a1NpU1FYd2tSaTErSTBDMXhYNHEv?=
 =?utf-8?B?V0JzZWdNYythNFdsYzRYWllJeEVpY2pKOW83RWlOVUk3WFNVUzFxd2JBbDJW?=
 =?utf-8?B?bVJCV0hZL2kwamJMcWNFMUxDVm81bGFMREVvZUxFSmFkU2RGZEhNRE1ZUHF0?=
 =?utf-8?B?UDZKTk84cHlydjFKcmZoU2Z3QkZGaFlWK0NWeU9JaXQvSEN4N3JVYVBlQ3J2?=
 =?utf-8?B?dkpSU3VidGlsYXJIbWNsa00xZEtOTzdENDVZUmRIZW5WaUZlWkxyVXEzR1Fs?=
 =?utf-8?B?WjRWbGxkVysyK2w1emh4T0NhdVo1M2FzRmw1ODhBamRDeHhYQ1BXTFZ5Qjlk?=
 =?utf-8?B?RGN0OWVFRzhNWXc2YWd4cDdxaWdwRWFEdXlPZHVqcE8rMU9DQ2R6aHRxemRW?=
 =?utf-8?B?b1ZCRDFnWFdCYjVUb0RBcEp0bDZwQnNmYUZjVkNEVW5vUndUQXZxU0dKZk9G?=
 =?utf-8?B?WXoybzFIT0hCdFBnaUNtQWUyQWhUMjZ0MkV1RVI5UWRyekphMEoxaHI1Uito?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6470cf78-0d96-45ff-8cf9-08dd78ee9f77
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 11:47:23.4304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EzW3ZXiic5gL38xddELF/qPOg44pQC08wFf60+YO+JPINvo6XYjRg+hcX44JpD3EAotrtXLtpSEJ9pLlrpq4lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9036
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_044811_056151_ED38922B 
X-CRM114-Status: UNSURE (   6.01  )
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

On 11/04/25 14:02, Luke Wang wrote:
> Tested-by: Luke Wang <ziniu.wang_1@nxp.com>

Did you test with "# CONFIG_PM is not set"? Because FWIW
it does not work for me on x86 with CONFIG_COMPILE_TEST=y


