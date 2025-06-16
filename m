Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468C1C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 12:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGDK7L8tGmHwaPv5rX3/sHfQBGGSmCukiUUZxLtysiQ=; b=MHMB1vj8E7mlyj/8h81epQpPj/
	MNsSgqLiYXn867dpZnz7bKNOpNRQPVXRpGMQvcEM4bfaCJtgPZHBioD5/CGNjLukwMHhAs/NP5iSb
	lnDQatrAOZuoUbzXHivmOWos1bYIsInnE5XgNwypEh2Hqrxxtc5FuCem5V4DOYsDw/fGAWcJ1Nxl3
	f8oATACEMIwkLvoGf4KWpm0XOnKpWdAfVj52I56TV4DbAaX+yUGuOxwjrzzaEtyVovQqOa/xKFc7m
	LyvoMbYchUfvDPLIxwkvqfS/5uZHe2+Qssw/PTO1IgVDfQhoD2IAqDTFvUQsKthkKMKQ+ONFXKOSU
	P5RCIoHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR97O-00000004OY5-1x0b;
	Mon, 16 Jun 2025 12:39:18 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR87B-00000004DUR-1Irq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 11:35:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750073701; x=1781609701;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1/XOEHvDJkFgh0M0aG2q7lVHd/pXuNDdx7J5/XUcYAM=;
  b=ET2stmw+c1pbW1yWVTD4t/HTIgDsSisIp2ZPkThr6OidhF+eOU/9oW6O
   4TyZD/oe2+y1ezBHbpV2DUAvEhwAqadcyhzWF/cJqUtDwMCNaqiHK+Ewr
   nFdGzFx0d3pTB+n0Xq/YigwlPkZwkc62mm9IR1NAtB5UWIhOI4SJNZ/Rt
   tpeQbSlivd5tdKPevrkHL5+edBO8Oku74zJSnUPuoAZlGsqeBv2BDmvBD
   NIFkqQMBpoBzWIXBh/xEFU4PWNfppMALun5XTR5VJhK+jRF0taQl8MWbP
   gdGApEzNd35Mgha+U/d37CpEgy970dtVaowmyJWywu1cdHOoI+XuCc6/M
   A==;
X-CSE-ConnectionGUID: juGvpyrcSly63bVORbR5TA==
X-CSE-MsgGUID: v8qpL5vISw+YuTQGoSbOBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62822038"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="62822038"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:34:59 -0700
X-CSE-ConnectionGUID: 7o1X0g2kQfe9fARxN9xWtw==
X-CSE-MsgGUID: 9uMp3DA6SFCaNn0qNM8BBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="148350757"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:35:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 04:34:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 04:34:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.76)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 04:34:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vhc2Jp7ZE7DiuA+2ZC2E5ca5zU4zosNstlo9SWkjfP2+c28rYKo8+AfV0oGNDo1vVnsssIRf/t77asT11o8+XBP9gzVVqZgYV+u5JQh5yHECkJRdXpZOocZjJqeOXJcxAGh0D0ugRBUZSwGsdq4MPr/2DkQNSV9+/pYJ1UlHU1K04sjjWxExB8AQESQKl0Jx0VuCc92z0rMPvfDppIvx/l4vErtyIaVgTawTWHDe8DJo0JTxy2Ry8ljf5VUafy9bq1AJHk5pILoKGMloBxpWXgjhXk616WD1rPM6VeNLz4MRchoTsdNTlGyKraoTnwhnNhAXg8EzP/Q6klHD8VY1AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGDK7L8tGmHwaPv5rX3/sHfQBGGSmCukiUUZxLtysiQ=;
 b=j6u2mL4bIL+2OuZQ5AT/JHPTCh//weg/syLuQyk18rNZL5/X0IxTgVkchsrxwAxXueW0UiOqSI4YGjJEgQiFi+CTKztrqhQoFXkXguEAfjCvTTTBfIMrWtuwF4MvDzqf4pBZRf/aKh9ZQ+qLU8PqdHw7vXNXnBhIA3j84t8q32lVp3cdGFXCc/oP9y6jwekRDFTD7eOG1DM0HKSkYx6TTgbzVtEM0IW0ydwl73zXJstg7KSwwVRecyLV2IQALr/ztpb2ldw5UtqZG0da8mOQoxwDif1AQX7KMImicyBhH8WC5ReK8xy+oB8HaovzttGrcjhiz7CPS3WjYv+BJoB+IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3206.namprd11.prod.outlook.com (2603:10b6:a03:78::27)
 by SJ0PR11MB5086.namprd11.prod.outlook.com (2603:10b6:a03:2d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 11:34:29 +0000
Received: from BYAPR11MB3206.namprd11.prod.outlook.com
 ([fe80::4001:1e6c:6f8d:469d]) by BYAPR11MB3206.namprd11.prod.outlook.com
 ([fe80::4001:1e6c:6f8d:469d%4]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 11:34:29 +0000
Message-ID: <3184c0bc-95a0-4ee2-8804-345bb30e99ac@intel.com>
Date: Mon, 16 Jun 2025 14:34:23 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mmc: sdhci-of-arasan: Add shutdown callback
To: Paul Alvin <alvin.paulp@amd.com>, <michal.simek@amd.com>,
	<ulf.hansson@linaro.org>
CC: <git@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250612054136.5860-1-alvin.paulp@amd.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20250612054136.5860-1-alvin.paulp@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU7P190CA0004.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:550::33) To BYAPR11MB3206.namprd11.prod.outlook.com
 (2603:10b6:a03:78::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3206:EE_|SJ0PR11MB5086:EE_
X-MS-Office365-Filtering-Correlation-Id: c8a46c6d-6dce-467b-ea26-08ddacc9c18b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGM5YkFZSVhSd0VXaUhLNGd4N2lURzhpUHpnakk0dGdGeTQvamVVVDFlVXdq?=
 =?utf-8?B?MUdBdkdZUjU0RmhyZ0Njd043Wks3R1U5ZWFhenROQVN3UEZMYy9aWndtb1JU?=
 =?utf-8?B?b0RzRXVYTkdpTXVLUlNNQitRZkRFdXNWcDJINlBNSlNpRTlWUE1tZEpxWXR0?=
 =?utf-8?B?aVozWkFyV1Q3UTEvc1kvdHQ3ODNBZHpDQmhhTlRmWnFiOWQxbjlScWhOVjlZ?=
 =?utf-8?B?TGlnRTlUYnpQOXMrZDFNdStKanJHQ05GL3MyMnhpL3I5Wm0vYkRFUlhqbmdG?=
 =?utf-8?B?dW9oRU92d2xoKzFjQ1NHbTBaZXlHNUwxTWVPMmJhTnh5ZWw5NTUrZWRJSmpa?=
 =?utf-8?B?OG9oTzZGRDZsb0JJa3lZMWlzSk1uQm1wdk03MXJ3V1V6b3RITjNEME5LN2pj?=
 =?utf-8?B?dXBaZzEvSHJOTXlRM1NDZElQNkZ3Z2hUWjdZVjZOTUJ2N1JyVklhaHRZdnpN?=
 =?utf-8?B?YmZta2Q0MDJJdHdQY1h2dHg3UnNNeG5veUZESlYzQlhBMEpJQkRFQ0cyRitt?=
 =?utf-8?B?VlpnRC9lN0hmRzRvVmFzb04wQzRiaXZZOXUxRmNFeDFMOVhUZEttTGNzTnZv?=
 =?utf-8?B?WHJLOHBMZ0NaTndERkNVcEdOcDdnSG9icWVFd1I5eFJyeFQ5YnU5RDh1RXZC?=
 =?utf-8?B?UkhoN1E4d08zTEJUWFcxbjBEbGpGY2lDdXBoSU1GNkFjcEpyTXllV3R1UWI3?=
 =?utf-8?B?RkNiMFJLZXhlZHRLRXgwbVk4S0MrYW9VaDh0dGF5ZGdHaUJ6TVpKWjI4Qlo0?=
 =?utf-8?B?ZnFBWTlheHhNU1ZUUVJLMkZuUWNtU2k1T2w5T21rT0ZoVWNhVW5sN2tMSjYy?=
 =?utf-8?B?L0J3Z3hDMVFmUzhoZXVLcjVJZFlnTUUrK1VlYU9HdGFKek5sYnBwS1V6TDdj?=
 =?utf-8?B?U0pIMXk5ekk5RFdOMkJoL3gzdDRYYUJ2Mk5ncndDOFF2TG1LUTk3YUlZUnJT?=
 =?utf-8?B?WEUwZ292YzZ6ZEYyT2djcmFrN3BvNHNHcFBYcG4zYzZ3Q3RrL1MyTDNOUUxQ?=
 =?utf-8?B?eEd5L25SaEc4bFdnRlFYR3VPMTQyajJqZkRpY1M3YWJ4SjllQ3J5V0p2YTZW?=
 =?utf-8?B?TTFhd1AxZHJkTEE5ODgwYjIwazZaZGdLRzhTYlhpai9NdEZHMU9Qb3grSjlz?=
 =?utf-8?B?TEZ2eWVUYnU2dldjTTV5RDNzWUY2QnpqcE16STF4UGZYR2VOck5SZUlyUFRx?=
 =?utf-8?B?K1hFOWs2RkFMQk53ZmE2SGw2Zk4wVzZFcHNRaTNOYi8wcU9nY3JxY1k0YlRt?=
 =?utf-8?B?dWVjUWRBaWZQekd2c0V0S0I1MDBZSW1zeEJONjVwZ0NDWFpucjZrd0dtd2lo?=
 =?utf-8?B?Y1VhbjMySGYzdFVpYjBmZDVYNXc1VDlJbnc2NlNmMzJVRWdNSURsZ0hhMVdV?=
 =?utf-8?B?WUlWMzNIWjJqOXErTXdaTTNxT08rOUtPOENBUllMUjc4N0RHYUVBbktyNk03?=
 =?utf-8?B?Z0h6bkJZcTY3TnhYN25sK0t1dG1JaGdydmhVdHZoZnQ5MGdKWU5KY3I5c2Zu?=
 =?utf-8?B?WFJmdDN1aTZDUTRmS0I2cTM4aE5mWWVQUFZGby9qeS92ckR4THViWG9qUCt5?=
 =?utf-8?B?YjlpeEorRHpOVDZJV0QwTDllOWQ2RTI4aWZXZ3l3SHlnME9RZmhHYnZtc29J?=
 =?utf-8?B?aDJrVFpraW9VNjlnb2ZEN0o2MXVRVUJjbE1sQ2hRbWFuN3JOK0NvdERiNkNC?=
 =?utf-8?B?ODQ1VXJRSkhZWVpEUk4rbXBncnk5R3lNdUptdkhzSVE5ZDkya1RyUmd6Yndo?=
 =?utf-8?B?cys5WE4rTGtlZlVYRThEbHlwSUdGKzcyeVdmMnhQSGltT0lDZnpyTHQrK3dI?=
 =?utf-8?B?QjBtNzc3Ly8wVHpiZUlPU0o0WlVWbm1QSmdGbHdjOHIyOXJZNmZOY2JHaHFZ?=
 =?utf-8?B?R2NhVVdRcndHY3BUK0hqNFRzQk5MM0JpQ1I1RzM0anQ0MXBXN3J1TGNBWWNJ?=
 =?utf-8?Q?/BFCUs1Rrys=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3206.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlFlY0FHaVpETVFrajJjSW5LUEM2c09XS1hKb2NXTUcweFc0N0xWNllMeWxa?=
 =?utf-8?B?RWl0ZTR2cFhGeHUrRTYwTHFsSlduSk9aZCtpa3V3WVp4ZnhIZHcwU3VIc2E4?=
 =?utf-8?B?Tzc1WjZXblh5UGloYVJoZUN3aXhibjR1MlBlalBIYWMvREtxOEl1NlVEeDU4?=
 =?utf-8?B?b0JicDQ3NDlaU0djbkJuVWFJaXFWcTU2NTk5NGE2a0VpRzArTUtPRE96anNO?=
 =?utf-8?B?ZzB3WXFyK2k4aDR4RkcwUHQ3ZmtmZ0xYMFE0S0xPQmE5eGJ3TndEQmZ2bXRu?=
 =?utf-8?B?dDlqc2x0Z1k4T1J0SU1GLzYza0xpR3NybWZ0Y1cwTHpEVVpVdFAzTWl6ellC?=
 =?utf-8?B?dEtpZ0xkR2R0UmdHZlc2T0txTW4yRnNXZThTWjlnSEhDcXB2b2tmTTEvU3Vn?=
 =?utf-8?B?TkpEb1RDeU1DZzVJNWsveVc1ck5lWkgxZHZjZmpUNVV2VHVNMkJpNHFzenNB?=
 =?utf-8?B?Z1o4SXgxWXI4WitocDdyU2pzWVluSlh2dDhZNDFPNmdQSVRpd1NOY3VrTC9D?=
 =?utf-8?B?QnpqNnlCKy9HbFZBSjZLaUd1V0oxS2ovQk8wRGhwb25sU0R1NWtYUnZJNTNW?=
 =?utf-8?B?NGtkVWdLV3MvTHpzRnNNdk8wellSN25rQk1pTXJFUG40VzlaT1l6MC9TVzdv?=
 =?utf-8?B?dVF4T0tPMDBUQXBuWlRPY1IyYTlKTVhZNFNRMWcvTU1KZElzK0Fscy94aTNx?=
 =?utf-8?B?SFVxMUI3cEtIdjNYZXdoZzd4ZGZ3SFpyOXZWdkdHU2Noc0h4QnNyQkgwd2NP?=
 =?utf-8?B?MzhodkJPWTBKdjNpZmIyanhNd2loOFNYa25rNUFRTXlxM2J3NzdQOXpOM1dp?=
 =?utf-8?B?RG8yTEhVUEhhQ3hWNlp0c3JlTFQ0aFNaOVY5S0Z5SHRGSXhyYVhaaVJhd2FC?=
 =?utf-8?B?MjVFaW9ZdXV4TzgxdDlqMi8vc2NLOC9xN1VTa00ycGJrWGlZdXFRd0I1VEhN?=
 =?utf-8?B?K3M2T2N2SzBXczJsY25WakFDUkMrVFBwTmc5ait2U21LZUVscmo5KzJXTm9v?=
 =?utf-8?B?RGl3Z1ZwaDJJeVVTcUlXYm1Wd0orMmhmVW9sRnRmQVViaDBZUXo5d3NjUi9B?=
 =?utf-8?B?L0IwVGlydEVjZTR1cll6RFVkRE95SnVEV1dXdDhPT2dhYkJHK3FWUzk5dDIy?=
 =?utf-8?B?cnB5eURNV2g2WGc4SE8wVVZ4cmhiSy9nRVdVZGp4MklUK0xsZTMvdC95TTlr?=
 =?utf-8?B?U0tuMHVUQkZOb3dxQmRLazZjclp4T3c3eXg5cS9xZkpYOXA1R0N6UEJWbEdy?=
 =?utf-8?B?eHRjVXo2ZlZHWXFGMU5ITDluQ3BvUW5pZldBaVJMdTg1UVc3b0oyMVRhV1Ni?=
 =?utf-8?B?MG9tZVAvc3pQNkQrTEcxeHltamFOWUFONUh5a2d6VGsxak9rY1Y1eit6d2xQ?=
 =?utf-8?B?ZVF4Q3djamJXcHZYZHcxN2tFdTNKd2RRTWNpQWhEVjhrK0hCQUloWmgzMnhO?=
 =?utf-8?B?Z25hYUErb3VBMTZGa3dFbDI4bDN1WGZLWFNvU2dYM05nNk83L3pXalFUeURa?=
 =?utf-8?B?WWlxMWtJSEJ1YW1yMXlkczRNeUt1UmEvYVRzWTBwSFhCaGFDem9Dbjcxa3VN?=
 =?utf-8?B?d1Q1YmNkT2xaVGFUZ3V3cFRkZVIzWjY1dzV4MUloUXBaK2FNejZnSTBzNUcv?=
 =?utf-8?B?UEU1eTVNcmw1UXAra1Vha0l5ZXIySlhNU1RzMGVuS0hXaUxUZDR4cVJPY2Qy?=
 =?utf-8?B?ZzdaSWt4SFR5a3dRR2VsdmRybW0vNnU3N1MwaWtveC9GRXExb2w1SWxmQ25u?=
 =?utf-8?B?TFlQV0NmbWFjQjRaMzZiTzkvZFdsQXlVcGJRSWE4VFZFVEhEcDBOVHBvVVdu?=
 =?utf-8?B?VXk2a2xGa0JVVVNnUFNJWVZVVE1abGdKMDkyVGFsblR4cFVaVktXK0xTcmZo?=
 =?utf-8?B?cklFQndRa3VyTC9Edm5jL3FLRDlTZEJtQldJemRsVnJTclZKVkdQbVZYZXY3?=
 =?utf-8?B?dklJWjJqNldFTjZFM1F3VkZ0N1JtbGpRaXBjSTBxT3FSTUlONnhPdWJ6U3VD?=
 =?utf-8?B?cnVPVTVZZzIwL2xNb0ZYU0JJZkJYaGh0RDJ4Q3hmUit3bjZCZllWMW05NFJU?=
 =?utf-8?B?aUIySGVlSWp2QTFBdlFJaGtIUlQzUlRpUzF1UXN5a09aajVYZFF6U0RVL1pV?=
 =?utf-8?B?MU1PN1pjd0tPZmlNYVNkQ3FNS1U3OEU4SDllenVSeFgzay93cE9aQjZjeFVo?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a46c6d-6dce-467b-ea26-08ddacc9c18b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3206.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 11:34:29.4606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kjrw6vdrqq+gNoCha/Ao3Xpoh9r+mSplIxWqN4ZHzJGHqP6xRDpzL15Ndz6FKmvwvnUZRFONXC08Xa/MWPq1vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5086
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_043501_371955_C423003E 
X-CRM114-Status: GOOD (  22.00  )
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

On 12/06/2025 08:41, Paul Alvin wrote:
> Implement shutdown hook to ensure proper host shutdown by using sdhci
> platform suspend. This ensure a safe transition when the Kexec utility
> calls the shutdown hook, facilitating seamless loading and booting of
> a new kernel from the currently running one.

Still sounds a bit unnecessary.  What happens if this is not done?

> 
> Signed-off-by: Paul Alvin <alvin.paulp@amd.com>
> ---
> 
> Changes in v3:
> - Updated commit description.
> 
> Changes in v2:
> - Make use of platform suspend instead of driver suspend as driver
>   suspend will only get defined if PMC_SLEEP is configured which
>   results in build failure if it is not configured.
> - Updated commit description.
> 
>  drivers/mmc/host/sdhci-of-arasan.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
> index 8c29676ab662..4abdad3c4e5b 100644
> --- a/drivers/mmc/host/sdhci-of-arasan.c
> +++ b/drivers/mmc/host/sdhci-of-arasan.c
> @@ -2056,6 +2056,11 @@ static void sdhci_arasan_remove(struct platform_device *pdev)
>  	clk_disable_unprepare(clk_ahb);
>  }
>  
> +static void sdhci_arasan_shutdown(struct platform_device *pdev)
> +{
> +	sdhci_pltfm_suspend(&pdev->dev);
> +}
> +
>  static struct platform_driver sdhci_arasan_driver = {
>  	.driver = {
>  		.name = "sdhci-arasan",
> @@ -2065,6 +2070,7 @@ static struct platform_driver sdhci_arasan_driver = {
>  	},
>  	.probe = sdhci_arasan_probe,
>  	.remove = sdhci_arasan_remove,
> +	.shutdown = sdhci_arasan_shutdown,
>  };
>  
>  module_platform_driver(sdhci_arasan_driver);


