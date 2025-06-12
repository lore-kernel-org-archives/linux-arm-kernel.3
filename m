Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4ECC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9pLvlIBkv8+4JMqSJUiSprXjutGitm7jd9JqgnhFeos=; b=1Ad18JoMzbRn2zR98kGV7DPKxC
	IOAsCKcRqAzq6SwspPn4OPmywZgd68DJsYwVO15t4e5ZIJZNaPlypDlZcfRqV+BW4DTcq/kVkOQRt
	iby7aKWSrn8/Ji+zwmO3ZwCt43RTuMveJsaK18b3qSN5SfYnhdfh8P8SJrkd7ASqHvrUtOQotw89n
	WuzJ3IeKzkpzbxNx3uzxMYjkzJ92qYIo7Jm9d5iQ1K1URdFkTJ0zin6Epc/fKoYBE4x7L8zy6p0Nn
	3R/Hzl7MdjNoK1ZyKlBzFrkJErvbzZ67RbJigufJYSHKi40SPc5/xIWJpJg2fXfzq0MtKuz+WDOqI
	U9Pfdt6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPntM-0000000ENW8-3QmF;
	Thu, 12 Jun 2025 19:47:16 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPlpl-0000000E2ql-302Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 17:35:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749749726; x=1781285726;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vpMCHXkqzh6sV4DrhHnSnIoCurWOvoHk9GqrS9RqJl4=;
  b=MsoFgAd6SEwY7vzl3v8l0fFEYfzIoAFmuToZfgp8NLvtd4S4NZ3I7A8K
   jXkXK4w9zRtwgsxIuYkEYlC5XhziSYeCkpfECIujcbvrBW5wb7H6ovQbV
   lX2vaoEKzLrywf/mkUZe5VRup75deii8lCs3TqqlvAYhHocy1S/tio99g
   hyDMG9nA8v0QXrxUHOeOrnuD1zZsZZmuec7eNIWwlyFtX13nJUpK0swY3
   9Lz2VF0lnPSeu5PPKB2HZe8MS+6p6VVm+Vo4HPyegbZvWwO2U3SjciKbz
   7LtTtxAkyIHVf3sgCln3fT0bXvDFJkPgd7YGnqi3gCGjBLQ5uz7vWFXm5
   A==;
X-CSE-ConnectionGUID: d8xz3vyUQ+STvONc2YCoqw==
X-CSE-MsgGUID: Tmy5YRRVT/WG277/WFXXfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="39556242"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="39556242"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 10:35:20 -0700
X-CSE-ConnectionGUID: j/QzrOLTSzeLa0PZwbrIRw==
X-CSE-MsgGUID: Q0TSMsfEQc24umE9kjfm7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="178552430"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 10:35:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 10:35:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 10:35:15 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.49)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 10:34:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZxT9t46D2n/JzNuAUHMYD+WbjLQY5pp1tp/cqCJaY6Rexup9RQek2+IRb4s5PpftEOyL4ltUJLzNzc73pZtUl5GDpeQ3MVYMBzy8cnBRwOcwoSA5lL/MQV+0jWT2Nkm3U392m6hMZJ4ZyJ0MGRFFdRDzuhXLqEzyqKXnuDM3jxljAybDq3DnPnAxGj1wDgXPe5GrPTfeDHZmbFFrY0MRhC8ny3T8YDO2hiQTMOFrTc3owJg7pWHXMhgqq/kOginNJR5DyZ3TvRLrOd7zHV+cEOWekw6RtpSbR52U5cjrhsAUTZ/zE4jMlbJLDDs73xE4TYkw8zQW+LQB7z7wxJiJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pLvlIBkv8+4JMqSJUiSprXjutGitm7jd9JqgnhFeos=;
 b=rhuxC+Uf6xOx8j2m0dqCQgYzlqWqDesXWaDKuSDkaX75VsKMyC9YsH7hZsH4lXac0ndvwRW9a3OUSYu20miDwZxyYZgiyrFSgLMy65FI1EAA1Z5Ge8/knomKAZN1iZyRFFW5F3UeZBoYYGb73Zl+VD7QLa+e27ZpR5qSwDM8LRVHGkxymbe2dmOXuZcyVU3Z/zsNCzhpbtckkU7gibSTi6Mqj7xQKllmP6uTHXGcA0b/norY9Zj2y7nGB8hflCWmh+cNvqtAZzb4lvBYSqTfAI10gpoFUWAGwiMmRSMXMkHdlxWmTYBUhfdDXGyxUI6+2ZsQG2ZIARw70TkPwKXkMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by CO1PR11MB5105.namprd11.prod.outlook.com (2603:10b6:303:9f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Thu, 12 Jun
 2025 17:34:38 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::215b:e85e:1973:8189]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::215b:e85e:1973:8189%6]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 17:34:38 +0000
Message-ID: <32bf62cf-ce05-4e8f-8e3a-85b24b931fb9@intel.com>
Date: Thu, 12 Jun 2025 10:34:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: improve .set_clk_tx_rate() method
 error message
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Andrew Lunn
	<andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>, Paolo Abeni
	<pabeni@redhat.com>
References: <E1uPjjx-0049r5-NN@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <E1uPjjx-0049r5-NN@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0341.namprd03.prod.outlook.com
 (2603:10b6:303:dc::16) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|CO1PR11MB5105:EE_
X-MS-Office365-Filtering-Correlation-Id: 166ec6b5-694c-4409-9e82-08dda9d7680c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFk4bVpGVlJtQk9VMFJOMWNXRXdOcWtyVkFhR01nUVhidlJJRVROUTRpUFho?=
 =?utf-8?B?eC9aQkpnK2swTzl2amRrS0F6WkZDbkFyTHB2OUFyQkl4V3dHeDVHb053YmQ2?=
 =?utf-8?B?akVVYTBjQ3lWM3lsSDFFOUhDZzZtTGhnMGU0TjIxOWpFdk9ESWdTWm92b0Zp?=
 =?utf-8?B?V3lmQndNVFB3OWJmRzZORFFKMyttZVdLdWRhVXorN2tENzA3dVYrV0VmdWVh?=
 =?utf-8?B?QXpBRld6YnRWQ0tKOVdtemt2TDRRR2hJUjlhL0dSbEVOeUtpaFVWaEFzV2lm?=
 =?utf-8?B?R2ZTL0NYK01KMGdLN3E3dnVKM2FhTWE5ZVZza3oxZzVBNzJvcmt4QnBRWlNu?=
 =?utf-8?B?YmNlV1hiQVFNZXJrU3h1TGErQ3ZNU0xwSlZDMW5kZkhVbWVHazg5cmtNVktJ?=
 =?utf-8?B?L0VmSXhROEVBZWFhL2hjam85YUtjYkxVZVcyVTYvb1JocXI3NVd3elBPbmNX?=
 =?utf-8?B?eEVKbXMvZnE2WnZJb0p3OHdFTHVKOUdDcHZaRWMzaGRObzhWTXVvSmExR3dX?=
 =?utf-8?B?VGhLdTRlTnEvQ0pxL21iczBYNWRkTW1VVE5uTkwvdWdaQmtYOE1DM2w2R0lj?=
 =?utf-8?B?eGFKbms0eC9kcm1zTllMZ2U2WlVibFQ5Zm8wWHYvVzFhQlNiOHRTcDJRR2g4?=
 =?utf-8?B?d3I3OW0va2VpYitERUduTmZFNWdSUVRPbnRieGFnRlRzaHBSZEpvejBEOW5Q?=
 =?utf-8?B?Q0ttREowTXJvN01BWFdQZWhxMGVUR01rVjQyZVAyRVJGZnE3eTFuRDNMZDBm?=
 =?utf-8?B?dklwT0JuNTYvZE9jM2UxS2E2NDZhQTBuNUo3TDkvTkFTWWt2eVBtbUdwdnRY?=
 =?utf-8?B?QU1DSDVFQ3EzM3lwVU1rTS8zZ3VOYjFNR0U0SExROCtwQS9tcTdlWTBpMlRP?=
 =?utf-8?B?d0VxUG04ZW14R0h5V2RILzhpNkFqNVZuSkgxaWZ0UjFOWjVESHBqYmFZMm4x?=
 =?utf-8?B?M3hWdEp5QTZXYThpbVlJT2pHcFZDOWlidnhlUnRIYkxmRTliNEN0a2h3a09I?=
 =?utf-8?B?Q0RaaGRmZUg4dURJNHQxTll6KzV1L2FtVWwxTzZicjB6cFdTSFkvSVBoQmRm?=
 =?utf-8?B?YSs4NGJBUll5bHFkaUlIUW9FSUZKVEJLTDQ1dElHRnFCbFA2ejE1Uk92bXZi?=
 =?utf-8?B?L2tQUEg5NnZzc1dBekIvbmdVdytMb2lmMkdVN2Fyb2RPb2JmSzEwaWgzTWRY?=
 =?utf-8?B?N0NrOGFHQVFyb3VINU5LVnFudmZsY2JpS29wU3p0a05PVUxpN3htUlZNalBP?=
 =?utf-8?B?WEEwY3I5SW5SZ1ltd3g2SHg0c0R3TE0xdXNWNDE0ZTYzOHFoeFNQc1ZPeVFu?=
 =?utf-8?B?N21OWlgzL0hOeFRjSzdlYWFZbVFXYkhUaEFRMjZoZ3NkUUw5R0xNOFI5aWd4?=
 =?utf-8?B?d2FrT3lyM2YxMUxZZWRsbzVDbTBEblhGWWtUYzJseExqcW9IYU5VMmFRUUw1?=
 =?utf-8?B?MVF0dHJUWGtVVGl5RlNkZWVNRnNKMDhQcVhQYUE1T1R1TGhTQnp1MzhnTkY2?=
 =?utf-8?B?NGRld3ExamxvK3M3RmxENld3RjhNamY3cml3RHFTR2c3cko3eHgrcWlVd0l5?=
 =?utf-8?B?UUkxUlY1b251WmduSzJNL2xhRnMxSDA1RldtUDdPV0dTVFFlT0JleUovSERq?=
 =?utf-8?B?dUxKZkZLbExxRko5bytvbzNEZThtTkN4amo2dEZoRzNpRUdaSk8vUHA5dTEx?=
 =?utf-8?B?Wm1TbnVCcERsY2FQbWFEaVp6aHQ4a3Z0eVJTL3Q3VE4rNmttdkthUE16ckJI?=
 =?utf-8?B?NXgxb0drRnlibmEvZHlaODBoUVRrUURuOENWbVErY3ZLdktvTG1LOXJWVmJw?=
 =?utf-8?B?dEtmb0FjMXJZdHQ1UWlINXI0V0Z1QkE2dEN6N2kvRjU2K1ZiZnBqd3UzWTFz?=
 =?utf-8?B?azU1WWtoZlFUSFlmQVFpR09ncFpRY1Z0c1NMc0F5ZVVDTXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5095.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dE5MajJJeEFodWhsaisvN0hLV3dDK0hYd283ZzhpUFhYZmlEQ1RJUldQYjdj?=
 =?utf-8?B?ZUdQUkxESDUwOVA0OWFUYzRjV0h6MnRSUjVBdjhVV1dmVFdjT3JvZENDdG54?=
 =?utf-8?B?SXRGN0RoUlc3clNLR2ZqNFFWRWZYTGY1QUJMVkdaVWd6UVE4UnQ4ajZzWnpp?=
 =?utf-8?B?THZMRm1uVi9NanVVazNNbk43MEtyOTZVbVUra3RLRlBscnlCajQwVUZWR09W?=
 =?utf-8?B?WjZxcU5mMlN1cWdnUk9laXdRb1Fpd2pySkNPcDVYRXgvYXYyaDFsaTJBVmxi?=
 =?utf-8?B?SnVtZWdLbmNTUHpPMWNBdmxkSkwxNmZPQWhXVmVTRXBtZHZkL3R4OUJ4SWpK?=
 =?utf-8?B?cG4zOFV2K01DTTVJMkNHVHUzNjUzelZSS2QvSUJVV1JZWE54VmVoU0dYQWVu?=
 =?utf-8?B?TjNaUzEvZUlHSEhjekcwclJZUFNwUTgyYysvbjJmak9xalFGcGFMOWRjeTJC?=
 =?utf-8?B?RERvdVI4M0U0R2ZJSldBUG9KSVdtaWJocHhmT2xHcnhkWWplNEtOUkVQd0RR?=
 =?utf-8?B?UldxYkJzRFdOWGh0djYwRmRDWTBMQWpNRG15WFUyVFNBRGJjUTdBdERxZ05K?=
 =?utf-8?B?ODR4SDBzcUVKRnkzU3pQYUhJc2ZuTTJZR2VESzNpdzg2aFg3T20xZ0pMdUcv?=
 =?utf-8?B?a0NyQVd5THhzYldlck1MWTErbVoyRHVKb2pUQnJzaU9oWVQ3Szk3NmVmeHJI?=
 =?utf-8?B?azRQNGg3N21JbGhGNHhWTDlFOEhNa21SQ0ovNkwxNXdESmFPY3NORnpkVDRr?=
 =?utf-8?B?RmRHTWtXdlFCTEZITHcxQld2QWRaczhWbkIvUDVtaUN4STJXYVRaaDZ1WG1Y?=
 =?utf-8?B?cWV1dWxVMDBIVUdXM3BWc1Q3M1BXaTFqRWN3b3hIQXVmRi9JNkhsUGh0S0Z3?=
 =?utf-8?B?OG1ianJKclhVZUd1MEk0Q25GOWo0Rk1aSTVoZXhja3dWYy81cUhleXVIMzNP?=
 =?utf-8?B?ME56V25YUllaV0x2NVgvK01pdVVBVWhkVGxQNmVKL3lVUzdwZ29ZcHpoMEFa?=
 =?utf-8?B?cFJWZDdiR01td1Y2RDZxK1hTTGwxYzRxWWxQSTRiU1hMYVdDS3hMdGRBYU9H?=
 =?utf-8?B?dmhtNUtqVWFLbXd6b29YWmlldDNXZ3hoN2tjUWlWVEcxU1NWbGszM3p5UzlN?=
 =?utf-8?B?Qm4yV282QVFiWUpQbEVZZU84RGJhcEt2d0N4Zkp0SWtXZFVPOXVqbE9CZlZT?=
 =?utf-8?B?VHRxYXJ4NnFyelFER0ZvemhxUzRpb0R4a3JZVUJwTnN2T0x3dnVDTlRiQUVK?=
 =?utf-8?B?a2VkT0lQbjhhOEJ3SjJ5UWlEMkFCTUFmNkZ0a0hYV1JWb3puWnB5c25XdkZp?=
 =?utf-8?B?NHVyU05HS1NKOUZXWkxVcTdPbnNCMFNJcG4rN3RqYVNVSE1BMDdBU1lXbDE0?=
 =?utf-8?B?S1RYaHBRMStreVVUMW5nSWsraEFPZVFpZXMzcmwxWUdOYXI1QkxrSFRkUVBY?=
 =?utf-8?B?Nm9KYU5MSm8zYTI3a3RPa0VhZzFLSGRwVlRhZ3JpcDN4WktFenhEemJ6TnNi?=
 =?utf-8?B?Kzh4OUtqaWJQeXEwSE03eHV6YjBtbnRPRUZNWis4NUR6bkxZWTk3RCtDaitN?=
 =?utf-8?B?Mm5ORjZ2VDBmblZkcit2N3pFYUFweWVoY0VES0pUWnNvRngvY04wMmluY0w5?=
 =?utf-8?B?L2RYUDhGdmoyVXIwN0JoMkVaQzE3WVpuNnpkb0hWeXJoS3JuN1I3Y0Nvei8z?=
 =?utf-8?B?cHF4ZU83TnV2OVdiRWFCakNUcXFMcFJNWEpXRmpDOUU5dG5ZZHFqVkNhZ3ps?=
 =?utf-8?B?RGhyQldER2NvbzEwMlJGS2pidlBaTkJ6ZDlNeEtRVzFCSTFhMExSK3N3VFNx?=
 =?utf-8?B?azgrVE03bzRBRmpUOXg0bmpSRzI4a1llVzdML0NHOFAxdFpKcnU5cjNqTEcw?=
 =?utf-8?B?bmNUY2k5aGE4ZENCVVhQK3dEWkd1Q0ZxY2pKSW5HSS93VUQ1YjNIYTZJRWNQ?=
 =?utf-8?B?REhjb3NIQWsxeUUzMC92dURZY1lWVzhsU1pTdUpDK0dycGNWbFlZc2JOZGV1?=
 =?utf-8?B?Z1NsL3d0QjdMK0MzNHJFQko0TGsveGtZdWxScUlJQmhTdFN2K2kyYUxDZmZU?=
 =?utf-8?B?YytXaGFWb1lPRUNvTlR1VDZRWldPdnNCVHRzdjIydDJnZnNZM1o4cUhVUGls?=
 =?utf-8?B?SE9XQVRzVDB6UXV5OHVLNTlwWXhEa05Ed2xmTUVhb3IzY2EySHppcFVpRnJK?=
 =?utf-8?B?dkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 166ec6b5-694c-4409-9e82-08dda9d7680c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 17:34:38.7213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JMW/rL6AtOAzjxw4A5+Z04+9r3atV80WYLunJG2SkGY30ASB94MTQ8YDcjAhcbieET53SzUKauKl/Ol9u9XaLqEwEF1UxANPV8kQucyofFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5105
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_103525_781878_4A8EF88E 
X-CRM114-Status: GOOD (  14.25  )
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



On 6/12/2025 8:21 AM, Russell King (Oracle) wrote:
> Improve the .set_clk_tx_rate() method error message to include the
> PHY interface mode along with the speed, which will be helpful to
> the RK implementations.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 1369fa70bc58..24a4b82e934b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1062,8 +1062,8 @@ static void stmmac_mac_link_up(struct phylink_config *config,
>  						interface, speed);
>  		if (ret < 0)
>  			netdev_err(priv->dev,
> -				   "failed to configure transmit clock for %dMbps: %pe\n",
> -				   speed, ERR_PTR(ret));
> +				   "failed to configure %s transmit clock for %dMbps: %pe\n",
> +				   phy_modes(interface), speed, ERR_PTR(ret));
>  	}
>  
>  	stmmac_mac_set(priv, priv->ioaddr, true);

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

