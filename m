Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03407C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 20:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Subject:References:In-Reply-To:
	Message-ID:CC:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HryzmMEqfTIAtHJjjAP/dOEAB2Lq9fwCb3ftCvAsHnU=; b=Qgchcm+lxhYEHQ
	SXK8i52mZ4Vin4g+kjiWBbZVHfBPHO8vcxQOQaOTPIeCVHl5yxGZwpz4P5CKfwUyf/2eLr6UOgrau
	sc/8u63c2cLfji1P3IUkwlkmM8WTpalT39pYAIFCVhIwgXPtRSVyHB9fosefCAt002paqpsn2NAn7
	6QrAOTXLluQwXxY0dDpq1uZ0eG7Iam/qbbPgmnLEhXr0bT5FXm50TUubII1ZvQot929xlYsZnVaKD
	TwKdb2CZfPghylruerTbHvHDWGQ5c4eDnp4c348N7lzwj3KGkixx4uo38dZiShEdVZhmoDMDRUnlL
	WOEd4tRZLo27SDIb1wUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyI3-0000000Cz8W-47ZY;
	Thu, 10 Jul 2025 20:54:47 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwgg-0000000Cmne-1Qbr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 19:12:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752174726; x=1783710726;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=7v9UBtsh/v4L9BIyl0PxIm4nHFosp0XDhUiX1B8cd/w=;
  b=kcAYEKg3pHVB9Ryg4+DAAHBJHT/nYhnQbJfBkmCquGdnn9mfWIj+eeL6
   JVPdb5RwkBLBeRjIZTT1OS9AAISANJ69o5DEgHLfenjo09Z4q2BxYK2IE
   /FipDLTOEHWgHsaGoiM0bYxGP4PP6foGS9glODG1BjeB256Eb0fSs1Z4K
   rZ/VAItYU9xKUjHN6Yd2grehEk/ScDq6A94G3Zirrd0LFqtrP/TcGRAjY
   4l4x88jFD4aL1wmNOBVywLGe64UboH3Oj8gZOKCkRKJSX7ER1Qn45+65T
   1GvZJhFJOv+qf2yf07kO+T0ZjW1GbpV5zI3SHKMW9GOWtgbv/u9VHC19n
   w==;
X-CSE-ConnectionGUID: zAr1FHIRRh2jqVICOuV7Qw==
X-CSE-MsgGUID: JIA4KXn2S1695c2P0xFutg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54623370"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; 
   d="scan'208";a="54623370"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 12:12:04 -0700
X-CSE-ConnectionGUID: dZ6RRUf3Sh+x1Wd6lbD7TQ==
X-CSE-MsgGUID: YP6pzkuMQy+FdBb6EJ1gnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; 
   d="scan'208";a="187181724"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 12:12:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 12:12:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 12:12:02 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.59)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 12:11:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HqrkSDOQzdpXgN3x2V2hLRsAM5sXnWfcZwNLdcJdIg6gmMuucwYQE5HbHEy1CzyrmNQloE7msIhUjCnOOqTOTUzK4idFdaOov3BxeOKAyU9ADZOV7FPInq6Tg9YBvPJiebSo76zKsfK9KlAv8b6u2RvO5Ccw1+vA9R506eu2CcTUESorvocNd/xlLhCoQyAk68/UMOg6CadJn9vjxFPRv8CY7MX2zhedbXOuPFn7jO0VeMhZzXlJzQpFTnfmJ4CUgUZ426sbnZOtpKgIrhYbKpAUiJgk93JK6isGLibo5GTPHqssQjt4Eo6Zl1wNUbBFU1LYOrOHarLnrnWQ+cCw/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HryzmMEqfTIAtHJjjAP/dOEAB2Lq9fwCb3ftCvAsHnU=;
 b=r7bN2OnzxNaaiy113Pdgi/Da4cFSdFKCWVR6scPTdgNqNd9mIBxq8ZwzLVi3Gi8Jt8UMKDZ2df2iBpANaJfkCxPLuRWxLwlN8lcDc6MxCR62u4nVhJtpKm1p19jHCLNbBWp5kcz0AvMxFL+IUHyOt/pwjpmyN/d02JTLV5QVRnyroHdJxdwiY9ml69JicAW6fR/MXikNUMrSOKGtWS/MjDSRaVAvY45VT4Axsv8hwAAQUB1tPN3Xv0d4fahluS5KlXmQRt9c9305syNVCKoSqsKMvrMLMLAbRNteFlPXgFwtc27uaMniwAwndh/+yvxW3LMkAynC6PpvVWtn84GlOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DM3PPF8F79256C7.namprd11.prod.outlook.com (2603:10b6:f:fc00::f37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Thu, 10 Jul
 2025 19:11:16 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%6]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 19:11:16 +0000
From: <dan.j.williams@intel.com>
Date: Thu, 10 Jul 2025 12:11:13 -0700
To: "H. Peter Anvin" <hpa@zytor.com>, <dan.j.williams@intel.com>, "Peter
 Zijlstra" <peterz@infradead.org>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Catalin Marinas
	<catalin.marinas@arm.com>, <james.morse@arm.com>,
	<linux-cxl@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-mm@kvack.org>, <gregkh@linuxfoundation.org>, Will Deacon
	<will@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Yicong Yang
	<yangyicong@huawei.com>, <linuxarm@huawei.com>, Yushan Wang
	<wangyushan12@huawei.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, Andy Lutomirski
	<luto@kernel.org>
Message-ID: <68701051ec185_1d3d1001d@dwillia2-xfh.jf.intel.com.notmuch>
In-Reply-To: <575B5DF2-AE1D-43E9-9A4B-09FB78EFFC43@zytor.com>
References: <20250624154805.66985-1-Jonathan.Cameron@huawei.com>
 <20250625085204.GC1613200@noisy.programming.kicks-ass.net>
 <FB7122A4-BF5E-4C05-805A-2EE3240286A1@zytor.com>
 <20250625093152.GZ1613376@noisy.programming.kicks-ass.net>
 <686f4e20c57cd_1d3d100b7@dwillia2-xfh.jf.intel.com.notmuch>
 <20250710105622.GA542000@noisy.programming.kicks-ass.net>
 <68700a5428a2f_1d3d1008b@dwillia2-xfh.jf.intel.com.notmuch>
 <575B5DF2-AE1D-43E9-9A4B-09FB78EFFC43@zytor.com>
Subject: Re: [PATCH v2 0/8] Cache coherency management subsystem
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:254::12) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DM3PPF8F79256C7:EE_
X-MS-Office365-Filtering-Correlation-Id: f80d47d6-7f0c-470b-7e0a-08ddbfe58b14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWVQY0lKZVNzZFVEd3AvVWw4RVNabjNKaGJLR0RkaUhwb0RzWXo2d2VtcHlR?=
 =?utf-8?B?OSt0VXVYRm15VzdZYVU4aGV4Wm9xczM4YWJRRVNjY1djdzh1UExDQ0JXYWdH?=
 =?utf-8?B?NWVCdVRxSklqTnhKR3o5NEdMS2pPeFpaQStNRjVQdlpaeXgwNGoyQSswRUEz?=
 =?utf-8?B?UWFCMVhHeG1xOVJ5YmN6NUQzSjlOQmtVTmY0Q2ZYSTJpY0gvMnBmZGd5eWo3?=
 =?utf-8?B?Q2NISnFRNnhvMlNidjBMUlIzcmNjKy9rNURPeURGWmdSSE9LSHpDTUFPWVJq?=
 =?utf-8?B?eTN6TzdMTTNlbjJTZ0Rxa2luRGpGdkwwb1NhcFAxd3FNN0ZTOERFZml4NWd2?=
 =?utf-8?B?dUxzWlJlckNrVG1UeEd0L1d1QXcyWDVuVDhtVm0yWG1FblV3Q2NRN0hwTGtK?=
 =?utf-8?B?Uktuc3huaGppbUJuWW9OcHYvVlJBRTlYdGVJMmtEYVhmaEVtS1I0R0pMbVR4?=
 =?utf-8?B?bHlHWFRRSjVPc1E2MlZVYTJKY2g5cFhwdTVhVHVydzdFaExBSVN5bGs5N1Ev?=
 =?utf-8?B?dWgxQk1GTEplazUrQVIzZkFJaFFHUmhaczFmVmJGWlJuUVUwTUNuYnJBcG5m?=
 =?utf-8?B?bUUvejBjOTBrRlFxdy9Oa3lYVWRuSS9VSlJjSE1uWGZ1UG53R1ZmSmJnVG1E?=
 =?utf-8?B?WmhiaWZzV1NZbDNTZXgzYkZ5RHlTWmJZVTVwZE5QbGxaSkZ6ZFNINEd4Tksz?=
 =?utf-8?B?RDlvaG40ekZUeHFsaFFmQXBla2VyNmNDSzNwOEd5NlU4YWhHR3F6Vmp3SkJC?=
 =?utf-8?B?bTYvWHlPQ3dWVlVLSnFDL3lFUEVzSTZYWGlqSVpoY1M5Y2EzbHUzTDFFVFJK?=
 =?utf-8?B?cHp2V0crcEhJdjFZNCtHUkhkT0tiR3E0aHBZYmhqb2N3RzVOazNMaFVGUndy?=
 =?utf-8?B?QXBTWHJGM3dtdVdnNlFIUFlPMkJZSUtUaDQrQmd2djl5dmx4QlAxbFY1VlAw?=
 =?utf-8?B?TnlGaUNwd3BuY29Bd1ZGc2dRZnoyTlZ1L0pCczJyZm0zdzhZMWJWdHVjV3RP?=
 =?utf-8?B?Y2tZQ0ZMaHl6SVREdW50aU9mbjQxcFNLeXZpUE80MUJxZWhSYytUZG51OU5Y?=
 =?utf-8?B?UUpZNW5xYTBIeW9mVXI2N3ovUzF6clo5QlNkSU9NMWF3TFpUS1VUT2N5cS9X?=
 =?utf-8?B?Z3NXYkJIWDJTTHlXUVBBbFNiRURJamRiTFBXa1pMdWRMa1VOUnF5WU9XRDVj?=
 =?utf-8?B?U3ZxQ24xVWxYVDVCK3VXSi9HYmdNWjBkcFFGVEhyMnEyeGpIVmpnVlQvb2w5?=
 =?utf-8?B?eExEZnYxZTJCYkVLd0dFQUZRZDNTdmVMMVBHUFhjaFhpdmtlTU96czllNTZR?=
 =?utf-8?B?bzRZQU1ESUVPSzFvTHlxTVlBQ2dJSmxoQkVtTE00NEtzNnY0dk9hTDl1YU11?=
 =?utf-8?B?ckJIakg1Q25HUGptM25wWmI1YmRtczROUWxqRUhFS2FUYk1selJLUHZRcFVk?=
 =?utf-8?B?Y0k5akZSdDBCcFlLbTVZaWhtUVlzd0hBZk8zY1Y0OEpWcCtlZTJiVnFjaURs?=
 =?utf-8?B?dWRjdDJFMVhYcUlxM1dueDZOQ2VmOHJkaDgwa0ttaXBrb2t2YmhRQk9USFBH?=
 =?utf-8?B?ejc2YmV4Mkx2WGdzSTI3UGtnV2RDS2R5aHRzbUViNkt5dDNSUENGV3hKaW0x?=
 =?utf-8?B?N05yemhnQ3BoTzcvamRkODJmUURVRjRYL2QzclRieWYyNXBJRlZFNDR5YkVV?=
 =?utf-8?B?NmJ3TE1Cek11S1ZrSjZMbEdiR0I2Mmg5b3lKcW1PcDdvVFpreU5nNytpaVBC?=
 =?utf-8?B?RnJYOGgyZWtIdjl0RVdoZXJ2S05UUTFIWm1QdjhJdHlYUFNzaHhpM1RudElY?=
 =?utf-8?B?QUxhRTc1RDllcmpGTVJ4b0x3dTRBc2lUR0QzakQraFF6UUJOUC9jMmlJSklE?=
 =?utf-8?B?akNDS2cxZVJtU3dpenlDbWtnTkE1clJWVXhObjdvemJpeWgzclBzMFBFeTF6?=
 =?utf-8?Q?cm2W/dEPtp4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amdzTmhaeGpPOHZXdHhuNTN6anVlaWFqUy9KYTR2cThIcjh3NS9tdGYrOHBU?=
 =?utf-8?B?bVNGbG1HOEdYeFl5TVlOMkNkejJYWWtUYWtEZ0c1NFdKYis4bXRqdWpGUGdS?=
 =?utf-8?B?cEJ6V05IdlhNdFFHRXhJSzNLOEtQMXRWQ2psOTliYTdoRG9sNW5aTUZOVUJ0?=
 =?utf-8?B?b1JjVWtaRE1WUWp1ejVoV2FGZEJzZXZxcFpKaGlOWnN1ZDdzQ1gvRTAyRUIw?=
 =?utf-8?B?dUpUU25BazlQbFdXR1dzV2RGSjREbElqVER2WDBpVTV3NHBlZU44U0NNOWtx?=
 =?utf-8?B?dmM1dkY0M0JQWXYwVzV2TE5DbnJoZFI4YnZBU21TQmk5Ly8vY2R1RU9XWU5m?=
 =?utf-8?B?TzFOK2srZWphWWJnTFpMdTJuWFRGdVkzaU4yanpzRmVrSmxaZStWdnBKTzEz?=
 =?utf-8?B?OThPTlN2SlZpY3QzLzBKSDB0TEJYQkhYbG5Ba1dENkZ1V3BxSGtBblRmWlFu?=
 =?utf-8?B?OGdyTUpYUzFPdWRpdXVQL1poNDdCWXRKNFV6dTQ0OXFzZlZWRHJEVG9PR0Yw?=
 =?utf-8?B?TkFWVGsyU3RlMmhTMjFILzl5L0VUcUE2dHFnTDBEWG1FbXNOWDhhK1FsMGR3?=
 =?utf-8?B?bU9rcVNOWHZ0bFlMdnF6MHZnSVFCNnp6UWgyTnl3TDdZNExHMSs1Um1hNUVy?=
 =?utf-8?B?cng5dldoWWhCZ1p4S1NrejlSN0M2MDVrVlFJWGxxMHg2VUprUGRQRm93NGZw?=
 =?utf-8?B?aGpDQjc0YXNKVnJnc215VFUvYWQ3VjNOdjFPS2o1RXZVOU54dzZwUE1aaTRo?=
 =?utf-8?B?ZmhYeko2RTdiZDdkOThyS2dyYUZzdDZ1OVNlbE1jd29vMU9EK1Mra0ZFMEll?=
 =?utf-8?B?ZGhKMU5QSEdZdmsrbUdHU1dtOTRDMExTbGNHYlVrSGRtajlDNlpCOVUrRGkv?=
 =?utf-8?B?V2tUSElERDZtYzh5d1JLMGZVcmJYRFdKNEh6c0hsWVMvMTZ2UkQveExKZHNN?=
 =?utf-8?B?Q3ZOcE1vNmpEWnRsWTRYbEljdmVSeEV3RUdlMjNqeW5Nd3FWTU9RTXZXUDNS?=
 =?utf-8?B?bnhEY0M2aWlBcSs2bXFjVGtFUlBjQUoxUW4yd2xMNzZhYUxMTVpqUUJJWDQ5?=
 =?utf-8?B?cDdQWEpSWnNwMGFnYm5FZWU3dC9JUERCd1RVZTVja01LNkUzUkNxTldMdk1h?=
 =?utf-8?B?NlNMU0t3QkxpL0RGNGFIZUZvNHkvUndxUnRUWEJKaDlKRE1nQ1E4bGtZQ2Qx?=
 =?utf-8?B?VG91ajViVGpWb0ZUWmYzaTFyOWNPUUFIZTRZY2o5ems1SXNPYzU3Mk01dFlP?=
 =?utf-8?B?bFN5MHBXdDE5M1dHU0M3bUZPeElZQ1hLVVBhSTFEdi9xK01jQU9zYXBjUU43?=
 =?utf-8?B?U056ZE56eFN5NUdHWGJXTEdoNlNiUlVZSmJadzg1b3p2NFp0aWZaZzRpQjRu?=
 =?utf-8?B?b3FOVHlOek1INjErSi8xVSt0dXRsT0gyMUp4bG15Mll1OHhHQWY2MmtPd0tJ?=
 =?utf-8?B?MGpXSnhEZXA0ZWQzUkFjRWFkYWZxUUxmRkZLOGZaSEl3ZGZMSW13dC82WXJ2?=
 =?utf-8?B?ZEg4UXhRZGg5MVRhWUlhVHdSN3RQVXJUQnFLWVJWdG91M29NMERyR0tZUGUw?=
 =?utf-8?B?K2pqL0RJK2F4T0lFV2Myai9UalZVM1c5WjlSQXRmU2pvSURiL21rM0ttbXpy?=
 =?utf-8?B?THBNR3Y1bFlHQXJ1K25pQ0ZYT1A5d2ZrUEU1alhpTFdRRjRhK2szc0h6WkNX?=
 =?utf-8?B?c0F0M2RiNjFmRXpHN1hSZUtCNTBhQy96Ym1waEkxUk56aWFzeG45ZEhseSt0?=
 =?utf-8?B?QmFzVG9MVmZoclE5bHZQblJPNUlEYzNQRzNjM2J6eFFGQXRsd3R1akFEYjhN?=
 =?utf-8?B?R2M2cWQ1M29ocW5IV0xVU1U0TlhWVzFEOUpHYzZTTGlwMTd6dGlHeE55WG5K?=
 =?utf-8?B?WWpmZTRKblJTSjBtcUJrQlJpOVFJYUcra0FMUlE4TVNWM2VyalVsMldCazhW?=
 =?utf-8?B?WktNbDJaTlUxd2t4bEdndVV3UzVUbzVoNGV5WW55K1UzbWRUWDlxenB6d0Vl?=
 =?utf-8?B?c2FkeGEyUTVEM1JUSW1ocnUzWG51b0k2Y2kzUXlXcVFrZTNkM0VBYTg2THVB?=
 =?utf-8?B?YlNzWVRTU2lieVVDTHp1eUlMTkNGWkhIL2JtSFJhbndPK0tZcnE0VExaSWs1?=
 =?utf-8?B?NkQ4TzVrN01kZHZNZEo4b3FaTlMvSngxbjg0dElROXBWakkwcEdMaVhmOWg1?=
 =?utf-8?B?RFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f80d47d6-7f0c-470b-7e0a-08ddbfe58b14
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 19:11:15.9496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFHATbK7R4dV0sTdo13BqswAF/lLxhbtFY4E6Dt1/iKoEDoRoXvgqktmwHA6BSkfDZ1QSsNZzY7blyGZu4K/lS7FXueWDwMmAsKzbma5bRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF8F79256C7
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_121206_409403_C612E118 
X-CRM114-Status: GOOD (  19.78  )
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

H. Peter Anvin wrote:
[..]
> >> > In the near term though, current CXL platforms that do not support
> >> > device-initiated-invalidate still need coarse cache management for that
> >> > original infrequent provisioning events. Folks that want to go further
> >> > and attempt frequent DCD events with WBINVD get to keep all the pieces.
> >> 
> >> I would strongly prefer those pieces to include WARNs and or worse.
> >
> >That is fair. It is not productive for the CXL subsystem to sit back and
> >hope that people notice the destructive side-effects of wbinvd and hope
> >that leads to device changes.
> >
> >This discussion has me reconsidering that yes, it would indeed be better
> >to clflushopt loop over potentially terabytes on all CPUs. That should
> >only be suffered rarely for the provisioning case, and for the DCD case
> >the potential add/remove events should be more manageable.
> >
> >drm already has drm_clflush_pages() for bulk cache management, CXL
> >should just align on that approach.
> 
> Let's not be flippant; looping over terabytes could take *hours*. But those are hours during which the system is alive, and only one CPU needs to be looping.

Do not all CPUs need to perform the invalidation for L1 copies of the
line?

Not trying to be flippant, but if wbinvd is only a one-shot per Peter's
proposed policy and the system experiences another CXL reconfiguration
event, then looping is the only option or fail the memory plug event.

> The other question is: what happens if memory is unplugged and then a
> cache line evicted? I'm guessing that existing memory hotplug
> solutions simply drop the writeback, since the OS knows there is no
> valid memory there, and so any cached data is inherently worthless.

Right, the expectation is that unplug is always coordinated and that
surprise unplug is unsupported / might lead to system instability.



