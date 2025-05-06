Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3777C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 23:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BdXPtpok+5oIf31eXxzR+63jXa3M8WoP8W/Fv5j+Ulc=; b=Tkuz/7oHvg22Cn/fpNG0yNiQtO
	uPP6ehSQJ4/zr9OKewozvmRRCDDsg00x2vaQ6j8tLre4T8PmZOEyuJLnEaIhRfEiOY5Bdo8TYdspW
	1EPhYeLkP7cOLjK1Msq1gM7n+oem6F0sbntWniIu3PM2bx7BAqbyyXJGCNdr2DnY3f2oqZG/y6mE+
	gmJRzKBz88Y4NYWn9S7uq83wLGBN4bt77qZfe3WmVo84DNBTdCSG8CwF+fLP8bHVMsjf9NKI94l9F
	cFVqIfcXxkCtZzDvvn1Sk8piKqQUobCGxQNohRDdnCGmhmg/oGxWeG0iSkp46NtKZhd8iiTwu0/St
	bgubzWBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCRpV-0000000Dg7h-0xxQ;
	Tue, 06 May 2025 23:36:05 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCMx0-0000000D45q-10Og
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 18:23:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746555810; x=1778091810;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yVwAjqZbZntE6o8MwhST33EneM00s+/2ZTGO6vQeLAM=;
  b=aefBevcDguSZ1V+IkfcaJ1zXr30OC1TZ7xb+KXBHw8pZVeP919pVJ4Mm
   TAP+1BjXbtQPg2SzYfxEIJRH+Qi6m2ubU+UqM6V1GEOLSCxOa088aM792
   d4GB4zVItmzSPXNGOWZsmHrclmc9RMm0RKNgptJm+v5uYuHMvTT30L9ZT
   F0wiXC0Vfp2ACieTMRazyHLyikiyuBX1PQmszjZ8WJVtCRGNlLVLhY9Jx
   Zg3Q5ULZTHfTqrrPzS/C0iT7hYU8LCfMogieEsxEDa9H34Hu/O77KyGuu
   NRJrWfJx98A9bA9tBkj7/eGiFGevd+ljZk1H0Ty9yTUbFPnrVpmrUKSfV
   w==;
X-CSE-ConnectionGUID: DBZnHyX8QXmDTPUQW/CIPg==
X-CSE-MsgGUID: 5KFkShw7Qmq4RkYCWv2O1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="35873124"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="35873124"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 11:23:30 -0700
X-CSE-ConnectionGUID: Coe6CdF8RGK5F8AjXkP+Jw==
X-CSE-MsgGUID: uNIFhEw6SwmnSXSQbitjCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="166629173"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 11:23:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 11:23:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 11:23:29 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 11:23:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tjjZFSAzTH6jQNRAvsd4FIPD/DuthVLLa5Dx6mUCuDZebFctiqAwfLaHxt2Yu7FbVJaWci4PwfAh+k7Tl8le/tqGV2hZOadKjz7HB0cuhCjE1qkp0DHFFacxyj4OfaO8fuCbiElsYj+Hh775hEGY9QezHcZGEiQqokVWoOYC1zrOLdB9W9Fd4+G5PaN8N4bJZE7guBYtmPJeVPkvRwUT765Qx8M9Tafmc/WdHXxgmZvLOWVLgPDHqytIe2Re5B0so+foR0dVzoDfd5eZqJZv+QeDNjQrQC3glyrYkQctWIIAaWgjWDIQVNm9QLg32Q15BM2NJr15GEdSN8gdM10Nxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdXPtpok+5oIf31eXxzR+63jXa3M8WoP8W/Fv5j+Ulc=;
 b=JBFJMEurO7e9VhSXYy98sCPmNuaxWlmD5HBwmQMA5frvQSlA9E5DEdCtHnr8Aq7/0mIl3EqSfuxjPNYZw03weX1GxxOw1SH4PlhEYCV1qipsWDP9iq+gi7tQLZl+SrEboWw/ydm7c/S9ybs0sW2SFbMcr+s3zd+chCsdKtEEP3AnNGyFJ86h/Q1HFOFkMca9zvcRITfuHUu1wIMCgKTzbMsF/0UlgaeBHecVUvcRx4leKVg3NQufMsHSdypt43saIAqau+WWRh+TFMu5Fq35ZB9FZhVCjeWe4EMcAto6KKEOUJ86dxTrLocwjPUhr1vTbyzPK2SVb67N07fl8Z9VEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by BL3PR11MB6386.namprd11.prod.outlook.com (2603:10b6:208:3b6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Tue, 6 May
 2025 18:22:38 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%5]) with mapi id 15.20.8699.019; Tue, 6 May 2025
 18:22:38 +0000
Message-ID: <bbd00914-b17c-4f96-b204-21c9bf95158b@intel.com>
Date: Tue, 6 May 2025 11:22:35 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 3/3] net: ti: icssg-prueth: Report BQL before
 sending XDP packets
To: Meghana Malladi <m-malladi@ti.com>, <namcao@linutronix.de>,
	<horms@kernel.org>, <john.fastabend@gmail.com>, <hawk@kernel.org>,
	<daniel@iogearbox.net>, <ast@kernel.org>, <pabeni@redhat.com>,
	<kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
	<andrew+netdev@lunn.ch>
CC: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
References: <20250506110546.4065715-1-m-malladi@ti.com>
 <20250506110546.4065715-4-m-malladi@ti.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20250506110546.4065715-4-m-malladi@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0109.namprd03.prod.outlook.com
 (2603:10b6:303:b7::24) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|BL3PR11MB6386:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fb0e754-6343-47e8-586e-08dd8ccafaf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UXRTS0phTjVwWEw2STRVY1RHb3VQMU54eXVIaXQ5a01qYmovcEkxWWh2ZmY4?=
 =?utf-8?B?dUlwWld1Nkt3TDJzc2FSZEJEMENlcGM0ME1DUHU4OTFtcDRLc2R3Y1pySGVG?=
 =?utf-8?B?eXZ5aFM4d09Xb1BEdVI3ZXBJSlZhN2VkYUhvd3RuRUlVVXFLeURPeklrMk9E?=
 =?utf-8?B?b2ZFbU1kTEZodWh5TlhmTEgrVHZIc0orRUhUdFJzOFB3MEZEN1VVNGRTVUpm?=
 =?utf-8?B?MnIza2NPVVd2ZC96T2dNeStSbURURXdTREpHN091NnlxVDl2SHZsQU1GUnpM?=
 =?utf-8?B?dDExa3BCR1VUbHA5NENrcEJWWWlqVElDR0R3dlRPRmRoZGRLZnhpeDJpN0o5?=
 =?utf-8?B?THQ0SzVMV2RMbW5tazQvcnYyelZkRXJTUmZWM3JCb29jVjlUQlpIQnEvZGlR?=
 =?utf-8?B?OGU5QnZ0MHdONWp1UU9SUlN0bU80TEV6cUpmVmd4ZHNUZWs1bDk5YUdTOVVN?=
 =?utf-8?B?c3NCNXhjdGduTFdRWVJaR3dMR1VHNXlISkFIa09aSE1XTVVOeUJ4OWNGeXdl?=
 =?utf-8?B?Sk92azlDTThlU25NR2ZpOFhqeFZoNDRmNGo5VWpPMmlQa0paR2pVaFZGQzlv?=
 =?utf-8?B?NjNWVU53eE9KemZSUUxoeHdiVmxRZFhiOElDMG1ESkNHUlA1RkRoOFdlZmlF?=
 =?utf-8?B?bHJQQ0RHU1RQVHdTZG1hKzgxRlhXNEt1cHBFa0syRlc1T2hwQTJKd1pkVm5F?=
 =?utf-8?B?aG5BeENrYkVNYytpbjZTZ2poK25CNjZqR2pWN1A2bEYvR2NablRHdDVzVDd6?=
 =?utf-8?B?V2s3R3lmQXlMaVVhYjdXUE9hN1hRV0kzN0xRSndVcitKUm1GaWZZdTlkZ0NN?=
 =?utf-8?B?ZDVZNGRzQXdGUnFFNUtYYStTZmQrVlNNVGhPVXRoVXNTcFRQaTBNQjZCRmhy?=
 =?utf-8?B?eUZWRm53Y2VhNmdQS0xnSU50MjZyb29VT004NHRyK2VjYXJrdU9UNzQyN1Jk?=
 =?utf-8?B?Q0RWYnVHQUVMbHdNZktBUnQyQVRPcUZRNDlJQkNNa0xqUFB0NHNYQ0JISFEz?=
 =?utf-8?B?NjNMTlBpM1NEOXQ1bno2L2czUGE3bnVDVTdBN09PdUxPaENaTW1qM0JySnU4?=
 =?utf-8?B?ajFWSDdrQkRhYWVCTm0rMnFEd0RvOUFGVTJiZGNGd2ZpQTdHSU85Mk96U1Jm?=
 =?utf-8?B?WThJMTMrblNKUkxiWnVhazVMY1djdjR3TUphd21mRkxQM2FUOVY1OHA2T09Z?=
 =?utf-8?B?VTlLQmNkMjBqLytFVDZtd0JDNTJxa1lSZ1J5SDJtbmllZEJjeFBudUYxcUln?=
 =?utf-8?B?WWdLL1QvSHp2dE1XWm5mV204RURHbFpLckh1L2NUNzRWK3QwMDM5Y1hiMkN4?=
 =?utf-8?B?NFp6QVp3NDVONzZDTTQ4QmYvaWVXZDFwbVlSNnROZ3ZXaFBEZ1M5Vkh5YVN2?=
 =?utf-8?B?Mmx0NjdpRXNiSXBmVDNiNVl3WndhS284RXQyN1RqOTFNWHI3MWJpL0haZlZy?=
 =?utf-8?B?Z3YzaXJGNHh3d0orTjV5Ylo0VDQzeHV3T2RHa2hFQi9Va3Fpd3A5WmV3SlN3?=
 =?utf-8?B?aEtWL1JiY056V2lVYThia2lQRlpCUkk2UjlFZW1YdEpFVmgyRGoyWEh5bjRL?=
 =?utf-8?B?aGZYWHZ5L3U0cGVTZmMwRkxFdmtsbm5Bc3JGSmhyNU51Vy9hOWJwVFcvT01F?=
 =?utf-8?B?eHdKWm5YOWJDUlE3RVVjckdOTHRLK21Vd2Y0ck5kcTBFRU8xOFNDMU1ZekJj?=
 =?utf-8?B?SWVId0dNUVl1Y21DT1dJcUxuSkpSZFdCd2k1Y2RlVlRqaHlDc0tpNWNVNFlK?=
 =?utf-8?B?Zy9NcFhlMFozVVhwS2orTnU0eXVlaDBDZXZNNUoyMTFCUHZrWlNjdXZnL0Rm?=
 =?utf-8?B?bExudWpiOGIwWmpTRThGZEs3ekQva3BRMlUybGNRVThEaGI2NGNEVDZpSlRH?=
 =?utf-8?B?WHFWZTlOejZTaUVsOWI3aU1yV0dHVnJYUUpWdkZMMFRQNVBId2lwMGRwYS9y?=
 =?utf-8?B?YjlZMlNKbkppa0U3bGIxYzFBM3Q1a2ZhOFEwejZHTytERTlEUzVLUkVjNmpD?=
 =?utf-8?B?YUJyNlRVTW1RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0wrWVpTRmFZRExCNTRTWkI2UWphbHFMcmRYN0c3WDk0enM0bEh5UkkrVTFN?=
 =?utf-8?B?UWZVNmpOTDlqYkpnc0Y2ZjhXU1RwUUhPbkV0bkFUTmpEZTRsL3FsRml0eUxH?=
 =?utf-8?B?eE1hbURNUDl1SE9uY0pZalF5UHNYOTJ6MEltdDRsaWxtT3V4ZWY0akZHODVl?=
 =?utf-8?B?dkJUQytjZWJOM2VLRjN6TkpxSlRKUnVHMmNJRlVnMHlKek1hb05xaWhxREVy?=
 =?utf-8?B?MEh5dDIyNzNOc3d4ejZPZDk2bzh1T0FuZVgxY04xWWVXMHRiY0FmMDdid3dH?=
 =?utf-8?B?NEdEdFR6ZXdDTzUvZnNDK015UzJRQzVmdWRWUTlvR0h2K0RmTnh2bUl6QWZx?=
 =?utf-8?B?VnNhN29zVTd6TDJtNCtOczFmNnpoeGZaQW1YUUpWTjM0VVE1TWtKbHcxMy8z?=
 =?utf-8?B?YXR6NFpEbEhYdDJkUlF0UU1QeFBhZ3psS1A3emZwSUdzdUZnWkUySWxmVHpk?=
 =?utf-8?B?ZmxoSGFCMTRod2NiV1htdkRsS2JHRFZhallXM0NSdERyK1NTTUN0U3hrWGFI?=
 =?utf-8?B?M08vbTJ0M3lORkNpTjlrblhwZmx0TG1LeWpLSkpFa3lmYVJYOEdqT2xTaFFN?=
 =?utf-8?B?bWhrUmNmWGNnY0FEYVBnYzhobmpTZkh5YTJQcGdXalk0TURJMVo0aFhoK1J5?=
 =?utf-8?B?dTVQSW9IYVJxVXphaWRQRThvVWFORDVCR1ZiTUxZdmN6bFc4RGlyL0hLYUhK?=
 =?utf-8?B?ZzdTellOWXh5MDJJN3VwbTdrNE0xRnkwQUZHczlEUmZVRndUTG03d0pFalND?=
 =?utf-8?B?eVhMV2lUVy93WWJXTER2cno4MDNUZ2hkTDFHL3ZnNnNhc2FTajNIRVkzcE90?=
 =?utf-8?B?cWplS1JZUWdTUVdNQmZPclk5aCtOQ1JNYzZHUjRPY1hyNkFwY0d4cE5oVlhh?=
 =?utf-8?B?YVI4dlMzdnF0bnFlNDFqYzRuRXM5WHRzOFRPRDRSNEw1Mi9uQ0VFMEZaaDlQ?=
 =?utf-8?B?VWxQNit6TDJBd245aFlpM3Vqck8ydXBvdTZOcWljaDl5SWt3ZS95RW1ndjVV?=
 =?utf-8?B?Q1FkZ2NCdi8yMkZDRE1rcU9Wa0Z2MXhMdjJOTExnbUxHNlFOa0dLQURkSElV?=
 =?utf-8?B?NGtqZ2Z1aVpOYWx6a2xuZWNnUmpaMTdwWFJXczdTZTVTQzFvc1FjWmdmcjRk?=
 =?utf-8?B?c1ppNGpTT3Nzc09rNXhNc2pIWHdtaDN2Q21qN3dXUzc2QW1PRm5nTUtWNWNq?=
 =?utf-8?B?Wm5ma0dhdHozb3dRNjRwck9mSEdoUWlwaU9lK3lkL2Z3ZHRIdnphUVRlQ1Bq?=
 =?utf-8?B?Q2IyeVRLMGpoMmZrNEoyU0RsbWNuTzFtZUpEU0pjUGhtb0ZOenNLbmxLR3FZ?=
 =?utf-8?B?bVRnUnk0OGxOTS9WSWZhOVVKZHhxN0VJU09acnlhcEJnd1AzL1N1OU95dVB1?=
 =?utf-8?B?UjBwZUhDVUprOTVlSWRxdk00dnJTTFZVRGRsZUI4UDJsbFBHSUJnTW9UeHpS?=
 =?utf-8?B?NW8yWTlYanpZbDlvYUI0ZnA2KzRFMHI3OFhnUGlzN0N1ODBHc2VqMzZIbndl?=
 =?utf-8?B?VFY1c2dFR2M5NzJ4S1RmdGlEb2huc1lLbWNmQUJuWjNLbjFRN3I1c2MxWklV?=
 =?utf-8?B?ZmtYdUhsVGxKY3ZsYUxRMzA5Y1FTUm5odmdVcmtnSmpPT3NOYmhHcFRkd0dE?=
 =?utf-8?B?WG1VTC9wSHh0STJJcmJHaEYxbDlVM3lSVXlYYWp6clFUb2hkdVZyTWZqbG9B?=
 =?utf-8?B?cDBPZ1F3NW9UVDJIMk5tb2hOSFRwc0VXNStpTzdpNGZMWHZOc1FVcjZRTDNv?=
 =?utf-8?B?YTd1bTlCdi9EUkpYTjVnNjBYZldTRzFsOVZ4MUtuVUQyYmF5Ym8zMElvaXJF?=
 =?utf-8?B?TzQ4WFFPdlFsempiYzhLMWY0YU96YTRycHRzNDBUYVJmK2ZBY1VVNDRObXpy?=
 =?utf-8?B?cW92TW8ydlJSVzFjcWUzaG5sMWxZbnQya3pWUWcyYmg2QjNKem8xL0sybWRi?=
 =?utf-8?B?MDBFOFdKamszeUNqUENlSHdodTJsYzNHN2t3bzh4U01tRWZXSTBTNnZpckVy?=
 =?utf-8?B?U0Nvai92cjkyWTdJcHRLY2tjWUg3TzFFdEdubU9rWlp3RjlTa251UTFaWG95?=
 =?utf-8?B?VGhCbkFvbUxzdVJ6MW5HbWEvcnBRcUMrNVpsZW5HTDR3Zms4b0Riem5yNTA2?=
 =?utf-8?B?ZHNXTFRHM0ZKR1FVcXRhZ1VSR1VXSXpKQzlQZ0xMSTE3VkN1blJxRGpqVUFp?=
 =?utf-8?B?eGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb0e754-6343-47e8-586e-08dd8ccafaf0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 18:22:37.9420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MUb00LkP/0tirNDq7yovb2ZZjClFD1mPkV24/46c7ktYvxQgF/j6VzwxVt/BOAfAKw87Kwdn1UT8UZke1kfz6CGN19S7I8MxUz4FOYOjFF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6386
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_112330_298548_5A667AC3 
X-CRM114-Status: GOOD (  10.43  )
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



On 5/6/2025 4:05 AM, Meghana Malladi wrote:
> When sending out any kind of traffic, it is essential that the driver
> keeps reporting BQL of the number of bytes that have been sent so that
> BQL can track the amount of data in the queue and prevents it from
> overflowing. If BQL is not reported, the driver may continue sending
> packets even when the queue is full, leading to packet loss, congestion
> and decreased network performance. Currently this is missing in
> emac_xmit_xdp_frame() and this patch fixes it.
> 
> Fixes: 62aa3246f462 ("net: ti: icssg-prueth: Add XDP support")
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
> ---
> 
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

