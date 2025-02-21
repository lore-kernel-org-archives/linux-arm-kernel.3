Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0E5C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 22:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iof7+zPLC4l68j8HAVnMxNHkCFnqbYpbounMTIrgYj0=; b=W4An8k8w3roxU8M+IYY/cu5clJ
	T4SBI5o4h7lwar/lzEALqJxJwVJbh2QP2wTNCcuZRovZlUBHxroXtvRV/aMEioHDyx4fx6hvPpaAt
	/kyuoH1HlpXX17nMnBPCHy5LtXEqCLvQpchvWzPqMygYLMF8pDMaQ2pG/H0CUle2nTXoH/7N8pCt5
	zoBzZI+riMZYFXEUZXwZtR/znhTlncxvcBiFRFCfgtqjBMLPkt/fdfRv8evjw9/xaSkTdLsQTkbcC
	9f1JFMtnjanpZk5tSXLJJssPIbA6iFAxs3YbcP0bvZuMV8ZF6QuBL/hdD4maqrbVAwAjRmYUEX2pD
	xk6B3NAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlbRf-000000070KX-3Tsc;
	Fri, 21 Feb 2025 22:24:31 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlbQC-0000000709t-0Krq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 22:23:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740176580; x=1771712580;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pje060e43ZWi8kvbw2ZtdBNwQjkyGMglQj9n8rKn8sA=;
  b=M5v2LttNwtNXAWfme1AB8TyPfFIXBem5wyUs8qZOVS9ljGmGNpL6OkEp
   qEwZJ8tbnLL3pziU8KEXzwkDM3yl3Jml9EkejGK2z7r7m6N4pWiw1CRfg
   OYzu1Stqym/t0PUEwDBZOib+o8m2LQalWHjH94XjtBidqkOwBEKzjrqz/
   dbiUfx6ReueI/pJuRk3x54ViR1SC6+XPi7+/mGrWoU1YYXzBpdEr3vAHe
   QLzoYXhrIm9AbHDskDtZqQ3JppmYJHx1R/H6M9izJ73BAdHXYkyC8pbXC
   MGV0zuE2gMrS/UlE9z8AuUMxGWch7jUHUoeYfc+D8Sl5ZKeas7QG1NyvM
   A==;
X-CSE-ConnectionGUID: b4Un6b6pTH2L3ncC0eajFA==
X-CSE-MsgGUID: JVW+0wKuSHWZoMlaS/Z08A==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="28606902"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; 
   d="scan'208";a="28606902"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 14:22:59 -0800
X-CSE-ConnectionGUID: WWj3lycxTcyNNJUmwLr2lA==
X-CSE-MsgGUID: XPfET5XoTIy0fpYSjuQ8Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="146381841"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 14:22:58 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 21 Feb 2025 14:22:57 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 14:22:57 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 14:22:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=brQhmWkE15Jxmfn+o1VB/n2wcbJc2dm1vREbW9yZ/EoX5XaW+gFO1vJsb+HYagHxaebV73/zMimmD2/0LYNDt/2Mr+mqROJ9zBEYPp7xff9Arkwk4OZQhntdqHo5INv+Fmv3BkI8sfR+6BZ4fSoZyl0M1WNx33Lhyz3/sY9wNpb0Pcj1l5g+sRUyvfVYPb3Kh1UWdNudelXfIklSACNFxIftzYXnNcbeDNq3IfRbaYRliv/1AZYrxYmVf+bvfqeXcd4uvLJ/7T2KXE+YbbxiiWXI/HqjrRrxux+plb2QuldSj744tHcvlWnbEUQIRfI3L/LF7QY8O5Vvnv8zLeVgQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iof7+zPLC4l68j8HAVnMxNHkCFnqbYpbounMTIrgYj0=;
 b=hsStcCyE+NGQ5m4+yiwYEri8OFy7h4HT0wjvc8cSeJzJWqa8hwirocaZhsplloLXriO7FFendVmBG3x2dmD9kIbqmRvDV8T62hLyCkQJyrmzrHHj9/GrBWFlZ9afFP8Lb/OnpySKsgyutxZwUrRj/GRYFzg8fVhSiuV0whyt3PjMwZKqFJxT5pPV4UiuTeOZMZuXmPb2kmieW6yVdJkNomf8JgZCTOiaiOD/0MEptP2NXeXFbXM7QMRu4SD2oWdObAgsO65o/GXxXJRssqCrl04sUsHD8a7mjMcDPep3y5YAK9Z8q6fSgvskqTVHbtUzoKTizXb0q5WnnfiVk+FdeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by MW3PR11MB4729.namprd11.prod.outlook.com (2603:10b6:303:5d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Fri, 21 Feb
 2025 22:22:53 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::215b:e85e:1973:8189]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::215b:e85e:1973:8189%6]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 22:22:53 +0000
Message-ID: <a7e434a5-b5f6-4736-98e4-e671f88d1873@intel.com>
Date: Fri, 21 Feb 2025 14:22:49 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 0/2] Fixes for perout configuration in IEP driver
To: Jakub Kicinski <kuba@kernel.org>, Meghana Malladi <m-malladi@ti.com>
CC: <lokeshvutla@ti.com>, <vigneshr@ti.com>, <javier.carrasco.cruz@gmail.com>,
	<diogo.ivo@siemens.com>, <horms@kernel.org>, <pabeni@redhat.com>,
	<edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
References: <20250219062701.995955-1-m-malladi@ti.com>
 <415f755d-18a6-4c81-a1a7-b75d54a5886a@intel.com>
 <20250220172410.025b96d6@kernel.org>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20250220172410.025b96d6@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0216.namprd04.prod.outlook.com
 (2603:10b6:303:87::11) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|MW3PR11MB4729:EE_
X-MS-Office365-Filtering-Correlation-Id: 1031bd46-2edb-4f53-1110-08dd52c64890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mlg4TmQ5VUc1bTR1OG82aFYvb1B5TWhpcnJadEphdEtrWk83bHNkdUdUSmlo?=
 =?utf-8?B?eG9tRkk3dTh4Y0pzU3BCYk5JeXJDKzlaZ0FablNKOHlaM2lucUR6NUlrblJ5?=
 =?utf-8?B?bW9GNHJmb2tPdHd6bGdodWVPc0FicTh4c0pZL21UcW1RNm1RQzY2OXdJa2Qw?=
 =?utf-8?B?L2VGbjJtYi9tTUJOTmo5OVBZVmF6YUU4bTdDcGhQU004akpiWk96L2M5ZkdB?=
 =?utf-8?B?QlQweldoTHFqaUh3UUpyR1VWa0VscVFIV1hFdEU5bE9DSmd1cCtWZXlsNWlB?=
 =?utf-8?B?WmhCcGQ4UmtXUlRpeFpiUC9yY3VBTC91Umx3SVQzeVdMY0dlVEczcG9yV0pO?=
 =?utf-8?B?QTZsd3JrZ2taUjY2VGR5RHBMaExmeU1SYWFFOVFqUmZjT0czdTF1dnBIZkg3?=
 =?utf-8?B?ZUVoK2NvTmJneVFNUDUrZm4yR2NZYzIrOHJVSC9IQTc3ei94YWFIRGkzaGJL?=
 =?utf-8?B?YzQ1TnVoZ2t1SHV4RCthYmpBSGFkR0RRMzg1SU1MNkNpbS91N0ExWHh0bENr?=
 =?utf-8?B?a01NVE9ISDBZWVJreEk3eXFvOTFtd2hxZUFJSUZNVXZtTGV1c2FqVkhONjVw?=
 =?utf-8?B?MWFLNXMyNjlCbHdiN0ZlSFYrVHlNbHlEcHZ0eCtrdjNCT0I2TVhEQXppRjl3?=
 =?utf-8?B?U3oxRGZDUklmR0lTNUF1WU9ET3R1Y01td1hmaXdXTTZDRTdmVjBMelkwTDlm?=
 =?utf-8?B?ZURqUkxSVEdsbFhlcXBFQjVwS2hvcFNhRmEza3RSOWM3TXFvZXFxS0pqWjdD?=
 =?utf-8?B?VkVsVXV4UGVXeXJIREVsVWpZYTFNckNOQk0zYUZRK0pKVFZzaGVCTG4vNkx5?=
 =?utf-8?B?Si9JeElVc1FDQWgwalNWbmtyMHRxTnZWT0VBRCtTMlFlNHN5azQ0QmVuTU1h?=
 =?utf-8?B?NTc0NmFXS3Z4NEg4R2tUR3U2Z3BKOHBJME81a3VYclBsem4xVDFsUUI0cmJW?=
 =?utf-8?B?dHplWS9FYzNwN3pwSVVzUmdTaFlwTGhTclNTWU5DdzlpOStKWVl5MjliT21v?=
 =?utf-8?B?ZzVXUlBhb3JSaitFMHlqU0xvS1o4S05DZFQwMEVhYnpwVXpFSnNxTFhMVTNI?=
 =?utf-8?B?MmJ4ZkRYSGp1bG9ONVlnQmVqd0g2UDJSVnBxbVQ3R3I2VTVNSXNUNVVoL0Rk?=
 =?utf-8?B?NmpMS2pxSDhXTG5OeUEvYjdCNGlvVmt5bWpZM21tSHF6a2t6c1RHMXFtN09X?=
 =?utf-8?B?OWxtNWNnajhsV1VRYUtvc3hBQ0YzdEkxSG1sdVo3QlpiSTJvZmtIQVV4cTcr?=
 =?utf-8?B?QzdZLy9GV1JSeXdOd0FvckNVN2RJdG5xUGR6dEt4Q3BtVnltckYzU2wxVGRJ?=
 =?utf-8?B?M3VEVGRVRGY1cUtqZzNsU3NLZUtyWktHZVA5NmFkWmordTNIREVhZmFCbFBG?=
 =?utf-8?B?eWZOblNjM0VKL09hbGh3OWhPSmlQZEgrYnpEZndtcGlBcEgzS2dlbHJzVFNl?=
 =?utf-8?B?WGIxSm8zOUJMdVgycnU4SUQ2SEdmTyswZFNYQ3FBWmhpV1JHS25zRnE4T0hj?=
 =?utf-8?B?NDg2ci9ieXlLcjd1cmxPRktCWExreGZnRE5XUUFFR25MMXFmYy85VDB2YklU?=
 =?utf-8?B?NXdjdU0zZ0FTMG5PaFpZckJuSkovdktWOTlXRVZjRUQxTkpiaDJvV05ITHQ1?=
 =?utf-8?B?NmRXMzhIMTc1NVRrMGgyYWQwOTN3TDd1ams4UEltQVhTRFhiWlYrOUEwSFJI?=
 =?utf-8?B?OFZQV1pQYyt4NWRvUmlpdzVDVTd3ZVE0MG9MazJLeFFvNnJxNTBBQlRzbDFr?=
 =?utf-8?B?N0pLOGE2WkNsN2xwdGcxTWJKZWEzWHMvRnJ5TGVkY1NBbDFWQjA4TVNwUWN5?=
 =?utf-8?B?OTd5ZUQyQUNoMDFJQ2xMbHRyc0x6Ymsya3h2RVFSeDZ1eXpJTEJ6VkFrcFgw?=
 =?utf-8?Q?vrUB5cNdypyJr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5095.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUIyV3VHS2FPcjk0aUswQWltQVh0SHN6QUhEMlcyZzE1UFBUZE9MUTFwZit5?=
 =?utf-8?B?cTdOYXEyTnN4eFhhV0tPL05XNHRoczN0dXJTUHZ3YUJzaGsxUXpZSE1BZWYy?=
 =?utf-8?B?L3Jta0pad0Q1bzkrekRDcCtCak5YdUpXcXlTWG9XL2hBSDYrbDFBZ3VKZytO?=
 =?utf-8?B?cjFEdEdYNnFTeXhtblhqRmxtUXNSL3BYak0yWVZLODF0Q2JORVVhT2dUOXI3?=
 =?utf-8?B?SjlRdkFTYTZTN0laeHI3Um9XamRDc3dtV0hBQ01MVGoveWx5bVBsVnpMWU4x?=
 =?utf-8?B?OE1TaDV2OHlUYjE1QmRxYXFYQlBVbGwvd29uQXhjcnZ6OUlaQnFzVFVHZkFa?=
 =?utf-8?B?V1VVNzVIVy9YOHB6NktCWHNaN1JZanhVUnBYTVVwSm5FQjg1WGR0YVN2ZlY2?=
 =?utf-8?B?dGphenV5c2ZKMWFFb3Z5OThKN1Q5V2VGWXFvTVhZUWsvUGpNN1VQL2k5U1hQ?=
 =?utf-8?B?Q1poYWFDZFdwZVZZVTV6cmRtNHh0KzdNa0VXWDNMVGpxWWl5bEdBVG5iYUU4?=
 =?utf-8?B?dFd2Vnh2VEFXTVFWUFZ0TWpGZlBHNWRoVG5tcnE4c2xqaVhhczVpc0tnOTZ2?=
 =?utf-8?B?eVc4V3N0dDBRTGtIRHdEanJoYUpPb0RvSVF3MkZrVFVLZ1BPTFV2S1JraHhq?=
 =?utf-8?B?TFJqUnVvVXljQ3BqSDd1ZUNXQ3hEdXhKZlNBWVJuS29hYjZKYks4WXJyV2Ra?=
 =?utf-8?B?VnhTTHlvcUNFcHloZ25OUjJGb1ZtZDZnVWprc1MvanAzUGt6MVl3cUtHVnU4?=
 =?utf-8?B?VUk3cEJQaXpSSG1UbUgxMng5ZGRaNjFNb0t5VXkzdHdMWkZuWmhlcldJNjQy?=
 =?utf-8?B?YnYxYkVBUTlxd1R0b1ZNZjljbGNadDQ5WVhtQlRYdk5EbHB5TFVRQTROQUJF?=
 =?utf-8?B?cWRma2J4bFdUSmxTN0NNL0Z4M0xJWWZObVFUK093SGpWMlJLZDh6Nk1KcTRh?=
 =?utf-8?B?Y0ZQcnprVUJtc1p6bDczaUtkdnB5SlozdCtkNWNyeVovYXdNQnU3ckFWZE1K?=
 =?utf-8?B?alVSQWJjV2p1dzRYS1lOTzlHdVE0RE9rM2pqZmNhUUU0c1NBcEJoVitQNG1h?=
 =?utf-8?B?S1pWUzhCN0hMUWZsT3AybEhxRks0QUVCdFJDRVBkSDFTcXRyMTZVaHFxelhY?=
 =?utf-8?B?Nk03ckNkeEpZZWJaQU5yaHFOUTZXRHFaQUxJYUNrSmtqSFlnSXJnU0wxeDk2?=
 =?utf-8?B?dTJuMjZNWWk5Z1l5dkZHS2kxRyt2WW9kTGpqVXdtNlZsRzBsWE14a2o2MEI4?=
 =?utf-8?B?eU5yLzJpcjdWZFlqa08zbm5qT0FhUzNZQW0rcFVGL3hsZC9SVnBGTXFJUElR?=
 =?utf-8?B?LzhNcDg0N3FvaUFGL1dMT1pLVFU1VWlMdjN1eCt3YnVCVzlTQlFuKzZhcmc2?=
 =?utf-8?B?VlJnQlpPWURmcEJCQWV4K1BKM2xZcWNVRGFHVkJ3QURyc3lCMVdNQ3doZ2ZH?=
 =?utf-8?B?aVF2K1RJY25LSW1KK0twK0ZhRlJlb2MwN0s2QUZaV242OGVDWG5IYXBCeDI1?=
 =?utf-8?B?bDV1THlKOCtKbnN3eGxSaHg1S1NDcmNLUTh2WkUwaUgwK3JKclpzSk9FQnJs?=
 =?utf-8?B?SmZTQU80SEhKWUs3UElldFRPRTNDUnNtaVBWL3BxUFllb2Q3UlhZUXljSW1P?=
 =?utf-8?B?R3dqbGJIQ29iMW5WNHhwK09mOWFOSDh0c284aHFNdUIxNXJQVm1JS2lmWEhm?=
 =?utf-8?B?cW81aElHbHBPeG5vUjhoa00vMGFLcWVxTWtqMlNBd0t1ZkMvei9TSVpWbEJy?=
 =?utf-8?B?K0JqRWdub2wveU1lL0l3Z1VLMXVZTDBwODk1Y0xlUnFPNjNhajlwcTRyZTFG?=
 =?utf-8?B?THphaXRjYlhwTzVSOU1iQno5NUNxMkg0citTOEM4WmdKamF4TzU5RE9xaGtS?=
 =?utf-8?B?RUJOWmgxMHkzUGM0eUJTT0lzMFNtenhsai9LWkJEdm5oTFEycjl4TFNqcTQv?=
 =?utf-8?B?SStBaUpGd3BRNDUzb3JrdzhTYXdGc2lrTXJKZmV5T1YxaGJPZGVtalBvZXk0?=
 =?utf-8?B?T3dnMkJoUUt2aFJseUpNS0crSllIZDBtaGZiMG02ZTB1MTRwUVVJbVRpQWw0?=
 =?utf-8?B?Q2dpYnVha2QyM3Izem03YjlWOUJueGNwSHFhVG4vUGpZNGlmOUxSb0VGQWxY?=
 =?utf-8?B?b1k0UTNFbVp4bDVRNUxtUllydWRjQU9zTlBIaC9VYlhKZEVTVEJNVW1ibFBj?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1031bd46-2edb-4f53-1110-08dd52c64890
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 22:22:53.5062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pv/VSnsMt4e822xt7lp8ft3QvuKB6xZOyeZ/cPywwSPToNTwL26a9cZgytY5Py1Zmki7qWjoDH3Z7DndVKIyBB56p3jaTtDlrrJEXS46cI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4729
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_142300_171891_AEE5C0A8 
X-CRM114-Status: GOOD (  14.97  )
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



On 2/20/2025 5:24 PM, Jakub Kicinski wrote:
> On Wed, 19 Feb 2025 15:37:16 -0800 Jacob Keller wrote:
>> On 2/18/2025 10:26 PM, Meghana Malladi wrote:
>>> IEP driver supports both pps and perout signal generation using testptp
>>> application. Currently the driver is missing to incorporate the perout
>>> signal configuration. This series introduces fixes in the driver to
>>> configure perout signal based on the arguments passed by the perout
>>> request.
>>>   
>>
>> This could be interpreted as a feature implementation rather than a fix.
>>
>> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> 
> Agreed, ideally we should get a patch for net which rejects
> all currently (as in - in Linus's tree) unsupported settings.
> That would be a fix.
> 
> Then once that's merged add support for the new settings in net-next.
> 
> Hope that makes sense?

+1 on this direction, its important that the driver does not accept
configuration which is incorrect.

Reminds me of my backlog to refactor this whole mess into a
supported_flags field in the PTP ops structure. Maybe it is again time
to revive that.

Thanks,
Jake

