Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA95C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 22:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Subject:References:In-Reply-To:
	Message-ID:CC:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jw8U+PMeBonFC5U2SguSj+ZTWcYHt3PqPtEe3/g76Zk=; b=NN0XQH0c50Zdxy
	mOfhWlQGI8fu5CLLgwYdRlRnd6jXJi6g8U7DOZhQbr5qef6nTCK03AE48dIMNCPYyKmF5jf/7zysT
	KON1PTT1/AK5mL1MBrs8qKHGJwAOstP1FrKNxtb8BHigvMv1haLkSmj3swFnxzXz5kK9OiAd8hLSA
	iJmeOFExwhoQOjNEEo3EwjfGyU8ztbEUag68URsPggniOsB7BYdbdke5UMGE09oaeowtfFHY6PGa/
	XK3eCpuJ40nry9g/xWpT+2BBLbDpROoJ27tcoR/3z28ELctHM2PCUB0q0yvFTNN5agapnPyLIMk+/
	QPkFDcwLalQcxthPfinQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdkF-0000000AC2I-45Ti;
	Wed, 09 Jul 2025 22:58:33 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdKR-0000000A5st-0HoR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 22:31:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752100311; x=1783636311;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=MwP4yFqP3MMc4yQDdr79v1S+ZSZh3mt9lC+nM+rjzag=;
  b=IL/Yg74wOKZjDKRRITYRGILIskPOSraHedD0pEGNiiZqjGLOqlNmYqjT
   Vxr7NYWo8f/inNW7gqpYP2wLSaMjVRHBKBvCVnYfWlwwZYlQ0X2ijWs7t
   TJsWjGZBNU35mmcymFNDLVBqjv4VsV08n3A01veWOyLzaVX7Onl0PnlyM
   0DU6Vjh5YuyOSI6NsXqW/IJkHeAYj7iMgImuuZGVT9O4DJCh8/r+C+TI3
   diuW7MydKfBNzU0qyOw7uL42UPA9DzeZMn7jH96QYeEmZbIL9LcMl7RuA
   6l0Xv2ygWJzCgvX2C/GjLBPS6NJeSHfbNHQn5JiaTXvIPWlpYHsQwrsUi
   g==;
X-CSE-ConnectionGUID: O+tlF8TgTfO4e3nn3O7wSQ==
X-CSE-MsgGUID: T9yv/bO0RFShr7Yqixb0GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="64630330"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="64630330"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 15:31:48 -0700
X-CSE-ConnectionGUID: c5bL/E1WTVKJbtJ2RPGDPg==
X-CSE-MsgGUID: RO8tzH1jQ2OoReYHr+WlSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="161553367"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 15:31:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 15:31:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 15:31:47 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 15:31:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H10RMsOcK3QoGIb+SdOK/l0Kh71MzIqKXIoJpd7KESjIBdvZdRIptL9Bz2Uk3jPJ8drvVDEKEm1qPk/QvEwFijc9iHAok91UcUqsAXSmvmjpkBWdYUV/QTWaET7eCD/fcK8xy0Y1f5m7JADSDCZvcM9WTocTfBWXufyiglwVzNPColhE6E5Ctcu4936LC+ytRS7+SEzEgzXr9C4KyJggEMegq7ee1fhgmUFaF7D1Y52/tgSu03bRsn+neIwyjYAAptUPtYiRG5Gm3k6VtTyQq6Dn+BiTqNs8m1KT4DqSW/TnLwljop1s2cOVOAdifGuCSYF1UDJJLdCt9d1LdzJhxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jw8U+PMeBonFC5U2SguSj+ZTWcYHt3PqPtEe3/g76Zk=;
 b=g+Mrnf7i1ORwro5ZMlQY6XS7QFZxJs4ixc7JO2qSo+Km8yJZewFGpRSergwWxaSllfQKZfZLMvuaVCEvkjh7E/wnLd5a8eWF5T/pQyuxFu1v5yr9e9jnMmzkD3RiyUi64xPe9CHe0Ay0ywTz1iDR8wfg7n8khlsljBwQwoyEiEPmwXinvv8OwISKBnUS9eLp2EhXczghikaXgl0I04hWpwa3nKfK35RgL/z9NVCEaOzvtdQYiCjW+Ff9Zg//82z7bXKkgjfjhJmQwLXOpmwQ0ceo/EKhUUVtjDQtvjeZ52C57UQItXZwtZ3I16d3AKBAzdEFW0IZz8HI4C4Q+bXEWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH8PR11MB8258.namprd11.prod.outlook.com (2603:10b6:510:1c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Wed, 9 Jul
 2025 22:31:16 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%6]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 22:31:16 +0000
From: <dan.j.williams@intel.com>
Date: Wed, 9 Jul 2025 15:31:14 -0700
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Catalin Marinas
	<catalin.marinas@arm.com>, <james.morse@arm.com>,
	<linux-cxl@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-mm@kvack.org>, <gregkh@linuxfoundation.org>, Will Deacon
	<will@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Davidlohr Bueso
	<dave@stgolabs.net>
CC: Yicong Yang <yangyicong@huawei.com>, <linuxarm@huawei.com>, Yushan Wang
	<wangyushan12@huawei.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, H Peter Anvin
	<hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra
	<peterz@infradead.org>
Message-ID: <686eedb25ed02_24471002e@dwillia2-xfh.jf.intel.com.notmuch>
In-Reply-To: <20250624154805.66985-2-Jonathan.Cameron@huawei.com>
References: <20250624154805.66985-1-Jonathan.Cameron@huawei.com>
 <20250624154805.66985-2-Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v2 1/8] memregion: Support fine grained invalidate by
 cpu_cache_invalidate_memregion()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0074.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::15) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH8PR11MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b513506-7807-4c14-f451-08ddbf385196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dTFjN1lWNERPK053aGx2YVZKb1RSMlA4T1l2bUNWZkVadWtpZHJoSXVDR292?=
 =?utf-8?B?cHQrT1ljbEpudjg1TTRocTA4TE1QNXVTMjNJZ2JXcjJ1Tk5ERGlXYkpNVHcy?=
 =?utf-8?B?LysxeHFKdk9oNEJqMTdBZEdLTU5hSTNWeGkwQXl2YzJvTm4wTnd1UHkyQWMw?=
 =?utf-8?B?UENDdUdjRVJHT0V0b0VjUlZxL1lQRVFwdTBjNzFJOXJjOEJpVHJqa2lTWlZR?=
 =?utf-8?B?eFZTOE5aY2dBejI5YzRrd2tTbVFXMTNwRTA2bVNkWkw0U3R3aFNJNndjL0FL?=
 =?utf-8?B?UHMwdSt6WFBuTWNIZ0hPZUdNYU4vVlFmK1V4MkUybkVCWDFqWU82azRyVjRC?=
 =?utf-8?B?U2ErL2gySXc3WStiNVJGWXI1UEYzTFR4b0F4c2VobFBFNUE2L2krVHZqWExs?=
 =?utf-8?B?LzM0WVdnVkJFNDNiaGN0elpEQStBbmh0L1lYdTlObUkycHZzTE1DZ29zeTJ6?=
 =?utf-8?B?QW5xamZlOXB1ajVBZUJxNklHM2pEK2VPOEd2cUg4WHpNMm1qOTZjMXlVd3lT?=
 =?utf-8?B?S3QxWnI1aEw2c043ZUQ5SGcrTCthcVVEbFI3NTFEZWQzUFpiQm1Lc1FrU3dD?=
 =?utf-8?B?ckcyYURnRXA0cmRrcjFzMGNjcjhKRi9OS2FFVmhCSlRTTUtQSmswQVJseE1a?=
 =?utf-8?B?OVhDMEpLaSs0MEVQQVE5dlpFTzRFNzBCbkszUkpDaTRTWitPeWtock5MNXlW?=
 =?utf-8?B?K0xDdTNYVTJSc2U5YlFQcElMV3RkRE54Z0VmanMvZHBoR2hhbW1hVytEVE1u?=
 =?utf-8?B?VVVjbWxTbUZKbm9NS1lWeVp5cC9nYXJRVlJGbzBKTkNjVFFSbEdFQ1BNbjZI?=
 =?utf-8?B?Q2tSV2RyRVNFcHNHdmhlK25CYmxPZVM3Z3NRWkdwOUt5L1RlN1R0blZSRmhS?=
 =?utf-8?B?d2xxNGlqN0VPOUxDcW5WTE0rc1pQaDJDVmJTOGpZRmZTblljZ1lpZVVFQjBY?=
 =?utf-8?B?ZWUxQTg5SHVSbkpuMmRnYll1bk5SZnU2V3FwMzFoME1TQ3k5UTR5bmZRVElV?=
 =?utf-8?B?ZG9raXVZTVhUWVdEN2c3WjZVVVBPZDZTV0ZwanF4SHBsOUF0UkR0UFdEcXFE?=
 =?utf-8?B?YzB3S3psVGJKRUZsVGRzOWxJeGh0WDVFcU83ejg3VTZZcDhuc282RHFMck9G?=
 =?utf-8?B?bzhRR081bSt3Wmt1T1N2MlByRTcrYlY4M3dKRkVWU2J4aE9tTjRoa1g4MVY4?=
 =?utf-8?B?YjZnN0I5VHpTMnF6c3dqQS9NSDZRWTdIdVMrekNYSEVqZ2tyS0RJOXRoQlFJ?=
 =?utf-8?B?SXo2bFVRT3V5dlBONTcvUWpKRGFlbXpvTzQ4emY1ZURwVHFXZnRjd0tYNngz?=
 =?utf-8?B?a3dMUU9DUWxvT0hoelFLckFvM0NpQldpSjRCSnMxS3I0TzY4QjgvbnphNVhH?=
 =?utf-8?B?YUk3UEl5RSt5Qy9RVUhDWmdhWXlnbFg1TG1INlljeUxqNWhUcmEyeUtLVnUx?=
 =?utf-8?B?V0cwbUdtbStNWnpDMm5jTHRGQzBvbHVPVGJXZ1ljKzlYSWlCZmlEZ0lPbnNT?=
 =?utf-8?B?L21UUHpINWk0MTNSSEt4VnFlenRPSlcrcnJnY3hHWFBCWGxyd3ljazA2TVdD?=
 =?utf-8?B?NTZsSW5SdTFLdEdGYXhiWERTZVdDRkNGSDRWOFViSnZuU1NrelljbTc0NUxC?=
 =?utf-8?B?OGcvVjhVZEd0aWI5T3FaYitzY0RvYUtwTDNaZ2wzVjRHVWo1U2Noa0xNNlJT?=
 =?utf-8?B?ZkhwRGc5YW1YMkFGTUwvc1Q3ZlJzZVF3ZUtJZTZyTnpFbFZ0VE9meUNxWkY5?=
 =?utf-8?B?aG5oZ0UrK0NIL3d6NW5JbXlFVm90UXpoUmlpSjEyUW03cnhUVlVqVW9MK3NK?=
 =?utf-8?B?UnFOYWhUTFZsV0RxaG1uQzJnNlhnNHhNUDhyT1VqWEdOVWE3aGlrSmFhbjRt?=
 =?utf-8?B?Tm9QeUVHRS9pektGZjhTcFZ3T3ZRendUaUVZV0hXNEYwUnlnNW1CaDRobnE1?=
 =?utf-8?B?WWttV1VvYlpORXg3aVdnQWxTY01JS3VGSzBYaHRFTTZTWnNhZ3pkYVpXVFZB?=
 =?utf-8?B?bnEyb2o4TUV3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0FVWXpWa1VQTTZwVkpoUTZuR1NkYlQ5TmZ0UzVna0xjR1d4UlVIVWZyZ2tZ?=
 =?utf-8?B?bmFNTzZvY084OTEwY3dRbFJtdThPcE1GdlFTNDJ1R2ZmTVRPWTJwelEwYm5h?=
 =?utf-8?B?SGo0Z1NOeUhpWS9YbG94SXM5dW5zMWE0MitoejJ5QzhKSURtcjZPc0dxZ05s?=
 =?utf-8?B?cnBRMXhtN3l2RTJSd0tQUmpBWGhFZzZreTNPUkpHWjg3UDZNaHh4UERoUkE5?=
 =?utf-8?B?dDR5Q0hCbWIyV2cwM0htNDdqNzR1Vk5HM3lZdzVLaUpLbW9vMHBsTkJZbVlD?=
 =?utf-8?B?WG1OL0ZyU0xQUUgxUzlWamMxekY2QW5BVzVCc3ZQUXFGNGlmbU55TDVic1JR?=
 =?utf-8?B?YVVscXRjd1lTdVhqSnZENjRaKzRFOXJHU1FXUFowZ25Uc0hvVThWcnI0WlA3?=
 =?utf-8?B?TW1XdkNTYVhpcFd0TjljVjIrVTQ2ZTZibnZCZ1FJcjF0c2pXcXNjZEZMczdR?=
 =?utf-8?B?b1B0bGNTc1ZEcHc4WHZwYzNxcDczRmpiT0N4cEg4ckhBUjU4Umo0Zm11ZlUy?=
 =?utf-8?B?NjAyNHJ2MDdtSktTSEI1Z2JBYVJNVDBhUjB1YWhiWjAzVEUwN0hPTDhoL1Fn?=
 =?utf-8?B?c05OcnhSNTFWek1aM05xSjd4ajZCaFo5UUlRQ3piS29LbUVyL0lHN1AwOHA4?=
 =?utf-8?B?cWMxR3hqeWVpelEydG5SOE9WS0xvQ0JUY3c1S2lXUEtXRDROdUpUVTg3TnVt?=
 =?utf-8?B?WTBwV2x1MkIrQmVlUHlFK2V6SlZ1aVN4eUZLZlpMTU1zQ29yY1F2eWJOOXRU?=
 =?utf-8?B?TklqSGV4ZFhIQnV0eFBvVkEvVjBleG5RbTdRN3hsTVNEZm5oY1UyVXhTbDQx?=
 =?utf-8?B?WGxIdkIwZFNuKy9UYW1VTlUyZmpGS1BpRVlFanIxNXV3ckkzTjNlTGJ2NjFq?=
 =?utf-8?B?UTFLWXJ3T2RnemhiOFBhWkd4ZkgwNmZYeEtnT0lXaERPOEJpdWtjdm1wRXdp?=
 =?utf-8?B?SkNyUGRBMmVIcktSTmh3S1JkbkRWSWEyVVFHb0hkMnJhSnVreU1DdC9mZW9h?=
 =?utf-8?B?cmo1MGxZUUV3clQ4aFR0Q1o3MmZHZloxWmg5MmNRd1A4SDNsNUlsaVQ0b0ZK?=
 =?utf-8?B?dHdnL0hCaE5FYzlkcytSUTBsSjVGd25Ya3NkbjZ6UE1palJoQVhIVm5Ub0ZJ?=
 =?utf-8?B?cFNrYVNsZlAyYmFoUTRXbjJ0eVllSXFhL3lTREdnL1BQV3VIOFVGNzF5d3Bv?=
 =?utf-8?B?UDVHS3FMZEgwQ1FiV0JWeG9vUEM1Y25CcGlYRE1GVjltcC9Ebnl2Z0hleGVW?=
 =?utf-8?B?aFZueUNYbEMvcEV5aWdELzZyNm9LM3hPb1RRRitIaU0wNUgwKzU3QmE5dDkx?=
 =?utf-8?B?LzdDeDZCcmRIU0wwRG9MUURFNFg3LzBhVHB3WjU0dEhoUEJOendLVG5JcGhn?=
 =?utf-8?B?TWJNUmdlTlBhNXZCMld3ck1sTXZTM25RVHdyRW1abDdiamord0ZWOC94eXRk?=
 =?utf-8?B?VEx5cndYMGUvOWZhTEU4ZDF0RGcrbzNrUWdGVjdpNVcwdHc1NzVzc1VMR2J6?=
 =?utf-8?B?Ynk0UWVVc3RWOE9KeU54MmxWWmd5N1RibmpPNzJWWUloUkhjaGlWaGlQdzJV?=
 =?utf-8?B?QzY5a3FoT1YrcEZNdDdvN3JybjZCSGRDdUdGYjd4TENabFFhWUVqaVBUcE9P?=
 =?utf-8?B?WlhKcDR1MGZUMDBzT2p3ZmdOTnRqNjlMOGtYdlEvc0doeFlGQmw0SE1oclo1?=
 =?utf-8?B?cjlIaXFXa0ZpeUlhZ21lV0N0a3duVEhiOU5MNExrNHJEbThRdHhGeGN1YjZO?=
 =?utf-8?B?VkRSTGdVbys1VHp2MzF2NldoNnczQVgwU3Z2Ym5MelhMUHcyaXRDWkF0dkth?=
 =?utf-8?B?NE1GODhaS082V3RlU3BmVGFUaEFaaW1ZSWhyUzVzejlReXkzVzlxV3MyQUFZ?=
 =?utf-8?B?dEZhZW5yY3ZzamYvdXVOamVSM2o2alZHWC9reVlKZHBDK3BwcEp5V0kwcnRT?=
 =?utf-8?B?bm5aejFRaVNBQjhQMFNlOVkrSnA4V1BFSGU3K1JVdWllTXgrWW1ZK0pNVlZn?=
 =?utf-8?B?NEx2NDhiN2tTWlJaYWlMODNxYndOQy9kYzJIZXpscHZ0cHRLNUI1SVYyWlYw?=
 =?utf-8?B?Q014QkMyY1kvd1VDRHRCdzBjODl4TzBRREt5UlRxSTQvbDRrVFh0OGFmT1pC?=
 =?utf-8?B?WGxlR21Zb0JqbkNIVTFSejUrNStpdVVJYXNWQTRaL3UzQlJOZzVtb2VSdEgx?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b513506-7807-4c14-f451-08ddbf385196
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 22:31:16.6526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RviVRfrd6YYlmsoQhNA808NDKHGpPi82ZCzvCLJRm2A+D9L2Fqw+uTmBAgmlMuceCpIlTyg36evH9hJ2fwphQrUnPRCx1O4W057RFUHC74Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8258
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_153151_521003_22E51398 
X-CRM114-Status: GOOD (  19.13  )
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
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Extend cpu_cache_invalidate_memregion() to support invalidate certain
> range of memory. Control of types of invlidation is left for when

s/invlidation/invalidation/

> usecases turn up. For now everything is Clean and Invalidate.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> ---
>  arch/x86/mm/pat/set_memory.c | 2 +-
>  drivers/cxl/core/region.c    | 6 +++++-
>  drivers/nvdimm/region.c      | 3 ++-
>  drivers/nvdimm/region_devs.c | 3 ++-
>  include/linux/memregion.h    | 8 ++++++--
>  5 files changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> index 46edc11726b7..8b39aad22458 100644
> --- a/arch/x86/mm/pat/set_memory.c
> +++ b/arch/x86/mm/pat/set_memory.c
> @@ -368,7 +368,7 @@ bool cpu_cache_has_invalidate_memregion(void)
>  }
>  EXPORT_SYMBOL_NS_GPL(cpu_cache_has_invalidate_memregion, "DEVMEM");
>  
> -int cpu_cache_invalidate_memregion(int res_desc)
> +int cpu_cache_invalidate_memregion(int res_desc, phys_addr_t start, size_t len)
>  {
>  	if (WARN_ON_ONCE(!cpu_cache_has_invalidate_memregion()))
>  		return -ENXIO;
> diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
> index 6e5e1460068d..6e6e8ace0897 100644
> --- a/drivers/cxl/core/region.c
> +++ b/drivers/cxl/core/region.c
> @@ -237,7 +237,11 @@ static int cxl_region_invalidate_memregion(struct cxl_region *cxlr)
>  		return -ENXIO;
>  	}
>  
> -	cpu_cache_invalidate_memregion(IORES_DESC_CXL);
> +	if (!cxlr->params.res)
> +		return -ENXIO;
> +	cpu_cache_invalidate_memregion(IORES_DESC_CXL,
> +				       cxlr->params.res->start,
> +				       resource_size(cxlr->params.res));

So lets abandon the never used @res_desc argument. It was originally
there for documentation and the idea that with HDM-DB CXL invalidation
could be triggered from the device. However, that never came to pass,
and the continued existence of the option is confusing especially if
the range may not be a strict subset of the res_desc.

Alternatively, keep the @res_desc parameter and have the backend lookup
the ranges to flush from the descriptor, but I like that option less.

