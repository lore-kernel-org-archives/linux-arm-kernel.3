Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2D5C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 13:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8DWkV7ltxW7FesSqM+JDVnXJ3amBNgQdP2vTAMuWCIs=; b=ipBQyGV+0beY3fKx3udtqFxnw6
	/vF5S4AIKMr/NLRl0sPCTQW54nmfgBPKW+YMEy6O81V7AymluORWyvu/RZbi0n7M6YIPCDmppSwlv
	AuM4ZpV86UN198v1KzO2m8kkGzVXv/YUSCCRE4GJ4q8RYW/AkNCiFneGBwhUqQncDyiUqSMnx5+6P
	gvzSsr4Vk13bMk0A4ZhV/XOaWBsk3t9AkA8JixHLIE2XN9tI4sYpsUzCs+yQ2CwLiM4SGNi9Ii4ML
	CEFe+cGhpQxU6k7mNzSg4cErTGvgJhNu6CEsoMN3XA5aTgrHdAXkrl/xSdf4IGQXFUjVsx+jb5HTd
	iyCB/C8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9Ym-0000000Eq8u-3Vu5;
	Fri, 27 Jun 2025 13:56:08 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8zh-0000000Ekti-1VuJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 13:19:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751030393; x=1782566393;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OzLDABU4smB7FKAR+wG6M18vAuJFXbhqNondiOLDBVs=;
  b=NRjJrs0f2OVMPe2hAsg2zTEf/C463SeHP539XVOFPnLser5HxkO/9l5J
   k5eU5ckgCdupPnDOC5EJI3QjZ8HMvTNcRoFShklF7aZTlt+flFSgAKfMq
   F5ypI0emKgerlJSmwxCQrqlD+UihdT4VKrpvpAISLqax5HX53RtTwZhXI
   qlK3mIAfbJDdqUxU+EsYB3GMR7skmvOpGg+7U+BB6BTFCF7A6oxLlGGm+
   cabYd4WguEiLHMHs7283ozd0Ls7JGIV9z0rXyCrkuiAE8HYLkNnDUbbn/
   4dePkt4rWjIydAxY7DxmCnzaeR8uGdh+NWzlv0EXl5JMdsaa2s4yyclDe
   w==;
X-CSE-ConnectionGUID: WHso8njqT6CqC8aJLfnzlQ==
X-CSE-MsgGUID: 5XJj9Z7wR6SyLejKXitZVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="64034458"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="64034458"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 06:19:47 -0700
X-CSE-ConnectionGUID: g9/bIyKpRby1lZxCxckOCw==
X-CSE-MsgGUID: +XZ+kTAaSLy+d4h/wdw9+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="158288205"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 06:19:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 06:19:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 06:19:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.89)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 06:19:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDOdKdqXsMjh4k/OpJ2DOSHJUIsQXtomXj1CMm+5vJslFgpabMm+EILtSU1c9Hg7ZVXjwF5eQyIDZnxbTNyIZ3CptwCT2XrC4IV8MpScNTbXvJyOd60kjcKGNW22GGHqucIRCf1rAHriXy3IgKjRpzi8X2LyINoatsE4UxQGvqec2bzzIRoUohhhK/x3DGUr7WPXrkHxam5mBi87b49RlnD3IT2vRf5I9Pt7em39tp+QQcinadQQ7bdwh5tNPO84j4EG4Jl2L/xWwe06R0bFL/qg+F644M1hzf/JrIxnVbEkC5Zug1Ck86uWvbwVOMBH3p5ZB3QuxhmLnJ/3fnJGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8DWkV7ltxW7FesSqM+JDVnXJ3amBNgQdP2vTAMuWCIs=;
 b=jQfgo+H/eDOtLh6aCfzmCURGoM2VUkjdH50Y2gW02Y4pKTdADfpnN/JkmxuCKqfQObL9uvTyEi+q3L/6kXx5Nmse6U1e6UHawqU9ti1p8L1MTUEUvW+lFoX0sLwmxbWClMhmfaItR4uB8DNsTB3HUurNBwzxeND2xOihHbSu5vQwpxmP/TCnKmlafag8Qz1FXDp2N/ly80OmRClIbYLAPi8TwVSdAaubCl8jxEze2fwNqHQQnQ0pZ2lxwNRSr1z06YATGpBDOyg8F2e/1sIXmh09sddfwkDdbxLeNvmW+XRYu620s57C0D9UMn3XGo4ULYOSrfoycTKJlikhqQZAFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN7PR11MB2708.namprd11.prod.outlook.com (2603:10b6:406:a9::11)
 by SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Fri, 27 Jun
 2025 13:19:30 +0000
Received: from BN7PR11MB2708.namprd11.prod.outlook.com
 ([fe80::6790:e12f:b391:837d]) by BN7PR11MB2708.namprd11.prod.outlook.com
 ([fe80::6790:e12f:b391:837d%5]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 13:19:30 +0000
Message-ID: <b6bf0b53-8812-4099-b5d3-39e7fd264777@intel.com>
Date: Fri, 27 Jun 2025 16:19:24 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/9] mmc: sdhci: add Black Sesame Technologies BST
 C1200 controller driver
To: "yangzh0906@thundersoft.com" <yangzh0906@thundersoft.com>, ulf.hansson
	<ulf.hansson@linaro.org>, gordon.ge <gordon.ge@bst.ai>
CC: bst-upstream <bst-upstream@bstai.top>, linux-mmc
	<linux-mmc@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, geert+renesas <geert+renesas@glider.be>,
	victor.shih <victor.shih@genesyslogic.com.tw>, shanchun1218
	<shanchun1218@gmail.com>, arnd <arnd@arndb.de>, angelogioacchino.delregno
	<angelogioacchino.delregno@collabora.com>, pbrobinson <pbrobinson@gmail.com>,
	ben.chuang <ben.chuang@genesyslogic.com.tw>
References: <20250528085453.481320-1-yangzh0906@thundersoft.com>
 <87619781-629b-4393-8c14-b34483a7c734@intel.com>
 <202506271822530452465@thundersoft.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <202506271822530452465@thundersoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2PR04CA0262.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::27) To BN7PR11MB2708.namprd11.prod.outlook.com
 (2603:10b6:406:a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR11MB2708:EE_|SN7PR11MB7018:EE_
X-MS-Office365-Filtering-Correlation-Id: f57e9923-6f78-4c3c-c770-08ddb57d3f23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clI4dFZGVzlxTGoycE1yWUdNa2k5ZGdUcVdoTzBEWXJ0ZHBXMERTTnR6dFFl?=
 =?utf-8?B?Q3NHV1J5SU92SkdOZHIxMzZ0Y0JoMUc2aHFjNGtZS0NSa2hxWnR3WEZESFBn?=
 =?utf-8?B?cGt3Wmdqcmk1RjJ5ekRGaDhTT3IzRzdNSTY0eFN1ZlpCWkJ0bmVZSzc4Qkcw?=
 =?utf-8?B?NFRGY1VVeHduNlZIbXpvdlk4Y3Z1aUJ0cVhubGV6NVIzZWt0VWtIRjJWRU5s?=
 =?utf-8?B?Q0NxUVBPcHlGVU9uS0VuOVFNVzBNWWQ2WU5qSGdhN0RjL2swQ1RpQTlXdUZO?=
 =?utf-8?B?S2VwL0liaTlWNjhycTJuS1I5WDJrQWxFL2NUSG9hbkRXcWpKcjBUVkZxL2hI?=
 =?utf-8?B?cWRWT0JnYm14anVJWW5ubS82cmJIN3RVc1N5REpHZW5aQmZHejJ5ako2N2xO?=
 =?utf-8?B?bXdlM3Y1TmZxQ3NHam5mOWsrZVEveFovVjlLdVVBV0RKalEwNlBrUHRES0Zz?=
 =?utf-8?B?RHFiSmsrNU1NTHNRa2VJL3Q2WEQ2cVZMV3hYT2tCY0lac1lhdW1ZSmE2M0xk?=
 =?utf-8?B?eGNpU1BwUTJCdlVURW1JcnAxK2lQZ2h0RWxQa1Q3VkllVDBFN2hDVTVUcmNs?=
 =?utf-8?B?eEpNemVuWFlsN3lRdDFuV3lYWlpTQU9HWXRWR29UQmErZTE5cjdpQVpLdUdC?=
 =?utf-8?B?Qi9pejFQekEyTVZmR0l3RUMwd2dueUc2NlltbDdXOFpuWmRZUGQxUXo0cDJN?=
 =?utf-8?B?eStpVmZMQTJtVjBUNWV4aVd5NW9hVVZ4MFNjSzZocXd2M1BINTBtWTBRUG1Q?=
 =?utf-8?B?MFJwU2FqOEQxMXJ6UDAxY2xYcFlDRFdIVEN1bWJwZHhnaDRDVnZFNitGK2Jq?=
 =?utf-8?B?UjAyY3d1TVkwOXR3QU96U01lMzladXJ2L1IwWkpFSTZYREhMNEdKcmR2Zk9x?=
 =?utf-8?B?WnMvaXlvVWgyZnduTUhnK25lQTRlVktRZ3A0dUFKVUFrK29SOHJKMTdiTTlX?=
 =?utf-8?B?MlBUT1ZoY2hmMnlnRjFtZUFhTTlicHlDN3J0OXM1NW1pSE54TFVWWXZUNm5r?=
 =?utf-8?B?Wk5YSElWQlBveGZoR2RLUkJSRk1lOCtZeGRjWXVOQ05MQ3R4cmQ0SDhNbnZ3?=
 =?utf-8?B?aHZKM25aVmxOVVk0R3A4NVpQT01xcHBHVXFYMDk2WFpabUhlbk5zbFN3b2li?=
 =?utf-8?B?TEpPVWFLUmRaclVHcXJQVnp3YlVVRGFvZGtQUU01dmxRZHhWU0gzUkIrenVk?=
 =?utf-8?B?NFh6YTNMNlc4ZkxNMTM1cWFUVytvYVZwQnZHcW5ObStvNlZZZWVaT3dTeW9u?=
 =?utf-8?B?dkZKTmgyMVJEZklKakczblNVTTNGWndWeWlMUXZwQmZzcU15YXc5YVgrUnYx?=
 =?utf-8?B?b1o5c2lzRDBBRm02WlBhLzVlNVdTa1A3RXkzMmRSYVpoRmk4K3VYNmhPMzlJ?=
 =?utf-8?B?Y0hWTHdoLzFqbmEyQXdTeFFyNXVVYVBtWmpzYU5qNHNuajQxYnJhZWprcWJT?=
 =?utf-8?B?d3pPcEJhamlPZTlOdGRxd3FuS2hYbHA1VmF6eHkyUFNZRjR0cWNWaXB6Mnlt?=
 =?utf-8?B?QTdPZmpycExjcnVMZ2U0emcrVE9td2FSVmxCVG90NnZnd2N3K2lOREVvZytR?=
 =?utf-8?B?UVlXWG41WXZHM055QTFNUUpocWdLdUtUYnVqb1prU2cwY3MvYmJXY3ZVVmRH?=
 =?utf-8?B?OEFMN3o0VmpYMjEyN0xyMGJmbDNzb25QTUhJbCtUSlJMeG1RYkNOeS81YThi?=
 =?utf-8?B?MGhMbkVjOG9UWldHbFNURTVUSm10b2c2WnZib0U2T3VhQmgxZGpFMzRnUitx?=
 =?utf-8?B?YTBtUWVoMzlKTWR6eXNHRlBMNXNFVXNITWJSc252cXhzKzFNT2VnczRVM09H?=
 =?utf-8?B?VjZZQnlSRTVqSDMybHY5TzBCQU8rdUNSbzh3NTQzMUx4RWNid0dJYjV5UkNo?=
 =?utf-8?B?Q1l5UjIveFZ1bTluWE5OMUNTbG1GbE8xaTNiL1hSdmNCclp1QXRyWWlUL3Vm?=
 =?utf-8?Q?hyWgDbxTf7k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR11MB2708.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU5BRHYrTEZIUXpKQVNnWFFZb0JSalRiS2JpVTkwNStCZDB0aEQwOGdDSXE5?=
 =?utf-8?B?QThrN0QxMGttRERPZXRPeFd6TXlmeFFUOXFNNlNEQ2wrWUdmSEIvRThENzgv?=
 =?utf-8?B?SmlyUkpZM2lPb2pERW02blJYVkV6U1VIY29QVmVCbGJ5c2Fhb0s3bjFTbnZJ?=
 =?utf-8?B?ZzFsZkdyVUozeUJ6djBKeXo1Njkrc0M3eTRMQ2dwTk1lWURtZklPM21FRi9q?=
 =?utf-8?B?eFgwR1BnUUtqM1cydDNSZG13SVZvS1FOd2RLUWlwdmdWS05QYmFma2RqNSt4?=
 =?utf-8?B?L0lNNDV4VDA1RFkzVEt0ajdIZkRKVjVic3RiaE90ZmNjSkt2WDhFOHdjZWpM?=
 =?utf-8?B?T1h5NjF1bkJDbFBpNWZDRWhSZ0VWSmdZSllRVWY3SUZqVEhzM2JxaVZoS1l1?=
 =?utf-8?B?ODRkR2JqVjFHU2ZwdFlWYUNEdk9meDQ4aG9RbExaMWxkcEhYYWRSM0paZEN5?=
 =?utf-8?B?dG1XWVI5dXRINlFOdzlmMDRJTEs1eWc0NWJzV2tSWW9sVHBRT0xBL3UwNEtx?=
 =?utf-8?B?azh3eXAxeHFwTFRrZWMyMnhIOGFROCtwZG5mWWp1aHphdGJjRzQ0Zks4YTk1?=
 =?utf-8?B?REJTZlFUYzJSY1VEK1NjdWN6QVBKY2IrandreGNuelJEZWlwQUtHWHhacXln?=
 =?utf-8?B?bEtIYXpBTUVnZEtsVnhwT3NQMm5QSDBzazBNMGVYNFd6d0EvUE43UzVFdVk4?=
 =?utf-8?B?eCtzUEJ0S2w5U3oxSkJvR3BlV090cWw2N0pDU1JGUE8zV09QSG1zUjFjSFRP?=
 =?utf-8?B?TTZBbURqbkdZVUJDRGhKdWEwdXlVcGxUOXpKTytiZTFkZDhXNXVlek9QelFC?=
 =?utf-8?B?U0Y0eFJacWd3SVQyUmptSTNSU1VNSENzUms2MGNTQUNIckZiNWdVUGdpdDBj?=
 =?utf-8?B?ZVNXaEdYU0xKQWtLNWJucllRWHpQR1JYWndQU09qeW92L3ltU0NUeE8rSyts?=
 =?utf-8?B?aGQxVytHbjNQektmWG8ydzRTTHlmd1JBdzQ1dk9pb0k0Y0lER1pOT0RYaCtR?=
 =?utf-8?B?dnBVL3FSc0lrRzN1bUVkY2FSRGpZd2Y3K3FhUis5UWtpVWt6ZENuNnJydHNk?=
 =?utf-8?B?MEpvTmJueEZmVXRMclE5eTZrTUI0N3dWOW5MM3BlekhDc1dEelVLZ09QbVZ1?=
 =?utf-8?B?Zzl0QVRaVWdueVVlaDBSeVV1MlhURkhsSVNNVHlGdFRvOGVBOG01VHE0bllF?=
 =?utf-8?B?aDBZUno3SUREUCtMem92L29GMVVIdTlBWVBVVXltSE9taUdwNFBoTVhBOEFS?=
 =?utf-8?B?TFFJb0xyWTRhRVp1Y2p1a0FDQ2ZlM1o2WDN1ZjRVUmsyUGZRL1BzMDFTdnl4?=
 =?utf-8?B?YTFIS2lwTTJWL1VyV3pHSitYMEQrYVVDUzk2Uy9VSFdqRllORXJoVllrbXcz?=
 =?utf-8?B?NXpyb0dGS0NodEFYVXlGcWRvVEw4SmQyQXNYeXFEV0dWTjVMLzlDSWRMU25J?=
 =?utf-8?B?aTliKzJ1R2E5bWhRb21PV1pFOWtEUnpMUFdXck1kMkt4RFdWUEVPY1FwKzQ2?=
 =?utf-8?B?YU01QXEvdDZObXovcjRqUUlja1AwOUpaRnM3UXpFd2F4eXRycFhwUmc0ZEIv?=
 =?utf-8?B?S2VtVFM4ZVNOWkxYaGNUUHd6VHRBNi9xcEJYSG85eFAzQityRndBOTEwZTFQ?=
 =?utf-8?B?WStsd1Rka1lSV0RjbVlLTVR5Z2I0ZlcvbjJGQUtST0dUL0lIeCt6V3NySVpk?=
 =?utf-8?B?Um9WQUtpbzNzRTY1bzJZVzFEOFplSng3YU9CK3ZUdHFHVytTeHV4ZnNibTJ0?=
 =?utf-8?B?ekppcE5NSWtEMjY4eVF4U2MwZXJFMjZFQ3JKbEE3eUtjSllJM2tnN0xUamtM?=
 =?utf-8?B?QjMzMnJMaUxRQU5hUGVJcmhTNENyd256TUNtVUJXbVphbVp1b0dhR0dZT24x?=
 =?utf-8?B?eHRSOHJRd1BHQ3BHSG9WTHF5RkRpR1h6SFV5MFIzYm8wcStnNE1Qd0hkTzJ3?=
 =?utf-8?B?THpjeHlUSTU3VXlNUk5XTWU3QW9RbzM3VHRaakZOMENsWDBPZXBwSEU1bFV0?=
 =?utf-8?B?Q1orZ2ozQWQrMDFnYW5seCtqd3RDV1FVanJ1d2pYYlNENjRWRGZBVS9NN0ZW?=
 =?utf-8?B?aGx1NTRJY2RORjZYNzA5Um1nelc2TXQ1dk9lcFp4MVBRZ1VacEFVV1V0YzZp?=
 =?utf-8?B?N1hXQU1jbnBmdEpvMHc4dGg3RVo3Zkc1MEZPSkRacjg0aWJEeXVSUlhNRzNz?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f57e9923-6f78-4c3c-c770-08ddb57d3f23
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2708.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 13:19:30.2188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/DVMhfkYraCMaObsfr8yQT70Ws8F2Hxytd3AKPHmRQVY+egJrKa03TEu4Fv2td2oWWznRerRXxjv6vVGXvjVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7018
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_061953_424024_72D656DC 
X-CRM114-Status: GOOD (  11.06  )
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

On 27/06/2025 13:22, yangzh0906@thundersoft.com wrote:
> Dear=C2=A0Mr. Hunter,
>=20
> Our platform supports 64-bit physical addressing, but the eMMC controller=
's SRAM-based DMA engine is constrained to a 32-bit address space.=C2=A0
> When using the standard SDHCI interface, which allocates DDR-based DMA bu=
ffers with 64-bit addresses, thedma_map_single() operation fails=C2=A0
> because the DMA engine cannot handle addresses beyond 32 bits.

SDHCI controllers can use 32-bit DMA or 64-bit DMA, however even with
64-bit DMA it is possible to restrict the DMA addresses to 32-bits
by setting a 32-bit DMA mask.

If the host controller capabilities indicate support for 64-bit DMA
but you want the driver to use 32-bit DMA, set SDHCI_QUIRK2_BROKEN_64_BIT_D=
MA.

However, if you want to use 64-bit DMA with only 32-bit DMA addresses=20
you can instead implement sdhci host op ->set_dma_mask() and in that
function dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32))

>=20
> To resolve this hardware limitation, we implement a bounce buffer allocat=
ed via dma_alloc_coherent() to satisfy DMA addressing constraints.

The bounce buffer should not be needed to satisfy DMA addressing
constraints.  It is used when SDHCI ADMA (scatter/gather) is broken.

Also please be aware that "top-posting" is discouraged, refer:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html

>=20
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----------------
>>
>> Best regards,
>> Albert
>>
>     =C2=A0
>     *From:*=C2=A0Adrian Hunter <mailto:adrian.hunter@intel.com>
>     *Date:*=C2=A02025-06-16=C2=A019:19
>     *To:*=C2=A0Albert Yang <mailto:yangzh0906@thundersoft.com>; Ulf Hanss=
on <mailto:ulf.hansson@linaro.org>; Ge Gordon <mailto:gordon.ge@bst.ai>
>     *CC:*=C2=A0BST Linux Kernel Upstream Group <mailto:bst-upstream@bstai=
.top>; linux-mmc@vger.kernel.org <mailto:linux-mmc@vger.kernel.org>; linux-=
arm-kernel@lists.infradead.org <mailto:linux-arm-kernel@lists.infradead.org=
>; linux-kernel@vger.kernel.org <mailto:linux-kernel@vger.kernel.org>; Geer=
t Uytterhoeven <mailto:geert+renesas@glider.be>; Victor Shih <mailto:victor=
.shih@genesyslogic.com.tw>; Shan-Chun Hung <mailto:shanchun1218@gmail.com>;=
 Arnd Bergmann <mailto:arnd@arndb.de>; AngeloGioacchino Del Regno <mailto:a=
ngelogioacchino.delregno@collabora.com>; Peter Robinson <mailto:pbrobinson@=
gmail.com>; Ben Chuang <mailto:ben.chuang@genesyslogic.com.tw>
>     *Subject:*=C2=A0Re: [PATCH v1 5/9] mmc: sdhci: add Black Sesame Techn=
ologies BST C1200 controller driver
>     On 28/05/2025 11:54, Albert Yang wrote:
>     > Add a driver for the DesignWare Mobile Storage Host Controller (DWC=
MSHC)
>     > SDHCI controller found in Black Sesame Technologies C1200 SoCs.
>     >
>     > The driver provides specialized clock configuration, tuning, voltag=
e
>     > switching, and power management for the BST DWCMSHC controller. It =
also
>     > includes support for eMMC boot and memory-mapped I/O for CRM regist=
ers.
>     >
>     > Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
>     > Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
>     > ---
>     >=C2=A0 drivers/mmc/host/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 11 +
>     >=C2=A0 drivers/mmc/host/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>     >=C2=A0 drivers/mmc/host/sdhci-of-bst-c1200.c | 920 +++++++++++++++++=
+++++++++
>     >=C2=A0 3 files changed, 932 insertions(+)
>     >=C2=A0 create mode 100644 drivers/mmc/host/sdhci-of-bst-c1200.c
>     =C2=A0
>     <SNIP>
>     =C2=A0
>     > +static void bst_sdhci_allocate_bounce_buffer(struct sdhci_host *ho=
st)
>     > +{
>     > + struct mmc_host *mmc =3D host->mmc;
>     > + unsigned int max_blocks;
>     > + unsigned int bounce_size;
>     > + int ret;
>     > +
>     > + /*
>     > + * Cap the bounce buffer at 64KB. Using a bigger bounce buffer
>     > + * has diminishing returns, this is probably because SD/MMC
>     > + * cards are usually optimized to handle this size of requests.
>     > + */
>     > + bounce_size =3D SZ_32K;
>     > + /*
>     > + * Adjust downwards to maximum request size if this is less
>     > + * than our segment size, else hammer down the maximum
>     > + * request size to the maximum buffer size.
>     > + */
>     > + if (mmc->max_req_size < bounce_size)
>     > + bounce_size =3D mmc->max_req_size;
>     > + max_blocks =3D bounce_size / 512;
>     > +
>     > + ret =3D of_reserved_mem_device_init_by_idx(mmc_dev(mmc), mmc_dev(=
mmc)->of_node, 0);
>     > + if (ret) {
>     > + dev_err(mmc_dev(mmc), "of_reserved_mem_device_init error\n");
>     > + return;
>     > + }
>     > + host->bounce_buffer =3D dma_alloc_coherent(mmc_dev(mmc), bounce_s=
ize,
>     > + &host->bounce_addr, GFP_KERNEL);
>     =C2=A0
>     sdhci uses dma_sync_single_for_device() and dma_sync_single_for_cpu()
>     with this buffer.=C2=A0 Does that really work?
>     =C2=A0
>     > +
>     > + ret =3D dma_mapping_error(mmc_dev(mmc), host->bounce_addr);
>     > + if (ret) {
>     > + devm_kfree(mmc_dev(mmc), host->bounce_buffer);
>     > + host->bounce_buffer =3D NULL;
>     > + /* Again fall back to max_segs =3D=3D 1 */
>     > + return;
>     > + }
>     > +
>     > + host->bounce_buffer_size =3D bounce_size;
>     > +
>     > + /* Lie about this since we're bouncing */
>     > + mmc->max_segs =3D max_blocks;
>     > + mmc->max_seg_size =3D bounce_size;
>     > + mmc->max_req_size =3D bounce_size;
>     > +
>     > + pr_info("BST reallocate %s bounce up to %u segments into one, max=
 segment size %u bytes\n",
>     > + mmc_hostname(mmc), max_blocks, bounce_size);
>     > +}
>     > +
>     > +static int bst_sdhci_set_dma_mask(struct sdhci_host *host)
>     =C2=A0
>     This is identical to sdhci_set_dma_mask() just just drop it.
>     =C2=A0
>     > +{
>     > + struct mmc_host *mmc =3D host->mmc;
>     > + struct device *dev =3D mmc_dev(mmc);
>     > + int ret =3D -EINVAL;
>     > +
>     > + if (host->quirks2 & SDHCI_QUIRK2_BROKEN_64_BIT_DMA)
>     > + host->flags &=3D ~SDHCI_USE_64_BIT_DMA;
>     > +
>     > + /* Try 64-bit mask if hardware is capable=C2=A0 of it */
>     > + if (host->flags & SDHCI_USE_64_BIT_DMA) {
>     > + ret =3D dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
>     > + if (ret) {
>     > + pr_warn("%s: Failed to set 64-bit DMA mask.\n",
>     > + mmc_hostname(mmc));
>     > + host->flags &=3D ~SDHCI_USE_64_BIT_DMA;
>     > + }
>     > + }
>     > +
>     > + /* 32-bit mask as default & fallback */
>     > + if (ret) {
>     > + ret =3D dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
>     > + if (ret)
>     > + pr_warn("%s: Failed to set 32-bit DMA mask.\n",
>     > + mmc_hostname(mmc));
>     > + }
>     > +
>     > + return ret;
>     > +}
>     > +
>     > +int bst_sdhci_setup_host(struct sdhci_host *host)
>     =C2=A0
>     It is not acceptable for the driver to have its own copy of
>     sdhci_setup().
>     =C2=A0
>     Please describe what you need to customize and why.
>     =C2=A0
>     =C2=A0
>     =C2=A0
>=20


