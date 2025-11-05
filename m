Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFCCCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 15:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuaIKbhMnmjJhjq4tHJQ+U3v3S206RH43wf1LcBjGeA=; b=pCc075+2hg74WFWgm7F2TLgX6n
	sKUon2E+tOvD1wUnBu1uTwnATguzfdHzD2emdYJpej1Fup76j9dpQlTfV7SIMMDeawnSeH8qD+h//
	obtfIudBOIE5MkHJXTATTvKPRBs6Dlsk9/ENV0HcBCCI6/wHfv1cebUXqUVRLYXn6SSZMDmojlNYf
	pEDtgMErr+dldAYuUWng/y3JZoFYGpD4PlRYQfx1EgUNBvoFnafBn6fJK8klnQGmaebcqoUTdke7F
	clGrS5UvKtI+vAfc1xeNIjJS8k1RrEhXm2kgdgAc7P5ZOTeXaaKGpTGY1FZp/cZi/zmfRE6S7NoKg
	LdXE50LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfhJ-0000000DyUk-15pU;
	Wed, 05 Nov 2025 15:45:21 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfhH-0000000DyTW-09Wg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 15:45:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762357519; x=1793893519;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JNkD5RcwlicjMXBIHTRbv/pu2K07kCOpI2r7cANpcdY=;
  b=G6QrnqWNl6LBrLhpyC/qNLlHvrEgG8dNMc7v/WuRN4DEu/z9nYrIlGoU
   xEhY452qBWC2TSctQyJ3SrGch9Y0GeyF8mFYaQzap5FCIIL+nfycBnJXB
   VH9lZE+rY678z094CgLomYKx3EBSjvi2874RVwG0JWlPOxzub0W9ftT9f
   iOQlOFcCP138ekJwjWccDbUarKpKy2arMFJCRHomW8eE2I56PPshpiM3D
   NYDhGFj2ztmPaD3o6yc4g2fr93S4Yggkdw0QjIsrQtAqQAmQknL7j3y1f
   rudI3c0o8czNrW1WRXhQw9ExkcroY1U9z4ksMCT6T64E2VUF7F2FNyXUD
   Q==;
X-CSE-ConnectionGUID: TYeb69TYRVC9IwdzeMH8yQ==
X-CSE-MsgGUID: f5OdJwaqQfOxV7ttgMcjBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="89937209"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="89937209"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 07:45:15 -0800
X-CSE-ConnectionGUID: oDohjNznTSOi4JqUWCPVgw==
X-CSE-MsgGUID: blCuoHWSTi6nCVQ0isTreQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="218132373"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 07:45:14 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:45:14 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 07:45:14 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.21) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:45:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/HSaeET/jlXzlXzHGpCXXL6teleH72/0iIr+62qn+wW2FZ5+cX6wdYZgOhJ8T+R+MnBNSa+1J2N8rvnjor6coB3BI/o0t9z722YovX3wfVRX9IhsbufmMTg4E5pMNB6aDG/r0xpa/gi4tlc1/hABSM2qzwss03yx5KusIf1lDhQMrjCmhjspUNp0FYJq9UgK++cv6V0lAmeo8oZF5uRCjF6YXXb+y5afRospLQHF8lH3g0Endspp7afWJTfnBpGU+ugO71AXYg/aP6VKY7ytrf+4UbQjcxNu5rsjpWgSXZI2mDs7gUYic07o4CupZpjS6L/GpTVdVfZOyIu3Eb//g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BuaIKbhMnmjJhjq4tHJQ+U3v3S206RH43wf1LcBjGeA=;
 b=rlyBc9qVpXsAjG1pIBT5E6m+nj15jBhCb5pSRdTdB4VPjaPYPiXWWe15DLUtZhDnnVxI8pPj5CdmLp7nwVR5EgTcXc2yDkD+RA7czqIs41Lyvnh0SuO3yjx3uHgw4P+i44svpjkLo2jHlK3OYVyld8GOk5bvQMCmDElaEOkmlZ8wwt8+G/y1hPdRVKYXOvc/qF7VaRYo54Qt7O8T2KJNDzh/hHFIlqOPyxg43PpSmF3YA5mauOfw2I6GTrp+SMUVVnnPNspqlNpY6Y5vsPYgkI1j+2jl5IxyB0OVf64eTh8BFG5BH7kqaBCv750TUHUh60quBvxetDtlfw+8faPnrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by PH3PPF7A88A980A.namprd11.prod.outlook.com (2603:10b6:518:1::d32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 15:45:11 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6%6]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 15:45:11 +0000
Message-ID: <d57548e1-3f23-4b9e-84c2-cfdc31e92e1e@intel.com>
Date: Wed, 5 Nov 2025 16:45:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ALSA: hda/conexant: Fix pop noise on conexant codec
To: <wangdich9700@163.com>
CC: <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-arm-kernel@lists.infradead.org>, wangdicheng <wangdicheng@kylinos.cn>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>
References: <20251105022527.69770-1-wangdich9700@163.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20251105022527.69770-1-wangdich9700@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0281.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::14) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|PH3PPF7A88A980A:EE_
X-MS-Office365-Filtering-Correlation-Id: b6689137-6e2b-48dc-82d5-08de1c824e03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0hVdVJES3NFeFptNVJCcEpuSEF4N2lEUTFpMmtLeDlZSE5ydjBaenh5UUd3?=
 =?utf-8?B?aW5UT1lWRVlvbEdsN0djeEFUdjl2OFRMVlJ6ZERjbVJFOVlZbUtGclorTzFs?=
 =?utf-8?B?cWxmbGxLdXJPZTRTdFF6TnlEZHErTEJKRnhsVm5iT25xQTFSdHJVTm5mZ1ZS?=
 =?utf-8?B?QXlOZlNuRHcyV2YwNHVzWUNZbTVWaFpoRU52QWk2WHRKYk41U1lDSHJ1Smhu?=
 =?utf-8?B?dzVBWGxPc2NJSjVqbzd4ZzZnRW5lWDZLcHhDRlpHMlBEblA3a3B1WXhLdXQ3?=
 =?utf-8?B?cThLa2FGTTVZZkxvTjhUblZCUXRMUmlRY2xxeEU3bXYrczhScmtKcXNjOU8r?=
 =?utf-8?B?TUJWOXUzdnNsYSsreWZPZVFCbWZPUWp0QUVXRVU4ZnRROWhoZTN5RzhtbjFp?=
 =?utf-8?B?SVVuQy9kY095M0RNa0pna05MV0IxWWxKS0g3Y29qZXFwTFpYRnlCOGpQWkpt?=
 =?utf-8?B?N3grSUk1Tko0SGFlbE9hZDkyb0Fwejd3VFNsblZlcXUwczBNWXg2bkNtMHBz?=
 =?utf-8?B?Ujc2ZW5qc2FuR0RGbW50OGh1OW5aU2JqcXY3RTJzNGdITDloemhCNG5NYnhC?=
 =?utf-8?B?amJubWRaS1k1M25BdkRocDZDeU51Tnc2YlRQOFZOTlcwQ0xDcFBESnBJZTYr?=
 =?utf-8?B?MVFkZ25NVmVvQmVFek96cXZ0NndkVTJsWjhzKy9taVVmYkd2TzZORFJnRHZW?=
 =?utf-8?B?WC9BWFJZWklOY1BONkdpRzRtUzFNMmM4cFJxalFacVlHelBmdWdPaWlPNXpK?=
 =?utf-8?B?ZTlWM28rSHNoUE5EKzQ2dUIyckVPTVBjS2VJQ0JobVpCaWd2YTh2TjZUUWdD?=
 =?utf-8?B?aWtSTWFKK0lJcmdISU5NYlZVN01IU2tuRkFiU2w5V1VqVG5GTGxvYmVLbTNS?=
 =?utf-8?B?QlFDMGYvMlM4ekR2dWVORUROLzFUeGxHOVp3cVFhVjFPVys4ZmxQcUwxbk1L?=
 =?utf-8?B?L3ZMU2drZi9BTGpSUjBUbnBhaFpHS243c0JidFhSOCtoS3hCUkJUOEV0YWlF?=
 =?utf-8?B?cUo2bGprQWd3cnJtLzFZTExmYVNnUzZGM3RoSFNMWkJhdWtNYUJnSHVoditQ?=
 =?utf-8?B?elVKL3RZZWlHUWx6dksweVZoVnBGdGJJb1ZKVEM3bEZtdDhvemJmRlViR2Rl?=
 =?utf-8?B?WkRoZGY3RWZrdjV6L3g5MUlXZGtIS1JTUXlxUllod3A4T21OaGM2Y28rMUE0?=
 =?utf-8?B?QmpOWFkrb1dIengwb3N2Nm9kR3lLQmRRSHVmTzdtUmFLaFpQSXp4MTV0eHI3?=
 =?utf-8?B?bmcrTnUwdFVXQjJaRWVsaWljSC9JMCsrT3JWZU9jbFNtSVMzc001bGJNNE5B?=
 =?utf-8?B?d3dtZjBVa1FSNHlLMWhQNklKQjloS2hxQWhHMGZBQ2x3M1dhak55QjNpZFZ3?=
 =?utf-8?B?VHY2eEd4YUdKWDhraitGT2U5eEk1eDFzajVLUE5COWNZa3VsRldFYlVrenJz?=
 =?utf-8?B?V1pQWjNxcVErSlBvUmZ6RzFOZURibFNDM0JHcnBDUHlaUHRSTXRyVzQyZXBB?=
 =?utf-8?B?TFZRSEdQcXV0Tlh3cVJWM3NUblQ2aW1kQ1J0d1lCZFA5Rno0MHpZWGo5eE1Z?=
 =?utf-8?B?N0hOYkUxWHNjWTZzS2E1ZkRLYm9ucWgzQkhFR0ZhVS9GRVZ2MVhNUDJERmhu?=
 =?utf-8?B?QXJIemZCdE5XdW1RRnRxY09IWkRPZUp1VXF6Q0F0TzVwQzdZOFNXczRaQmlL?=
 =?utf-8?B?Slk3a3NPendLaHNqTDZadVMvSEdocXZycThKTldML2Y4SkJWZlpEVmpvcWVB?=
 =?utf-8?B?aWozSEVTNjA2YndZVVZMQ0lFdkdvbVY3ZVdXQ21uenNnbmx5YWZiSDVZSUt2?=
 =?utf-8?B?eVpvVWgyVjF4TmFMZS9XOGxGaS9SU050MlYvOCtuSU9MemlvUmtqTDRBUmhW?=
 =?utf-8?B?UnJ4K0NXeEZEY0ptcUVIUU9pT3VZOHpxT1RZQ3hDTjlkMUdYRUY0di84Qklh?=
 =?utf-8?Q?8qAElxpgqS6KxmK4HFrnE/cz8LayuVjS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akk3S05JTmR2V21qSXZTbzNNNEN4U1FZME1WbFd5YkpuSHZPUzFYUTdVWnhp?=
 =?utf-8?B?U29rZ2dFVmtTcnZldjgrWTBpZDAzS3o2VlFTTnN1dmhqRXI4T2FBaEFvUUI4?=
 =?utf-8?B?QjNlejV4ZDlKQ1hkTE5wZ2RoeTNLZ2pwa05YQlF5MXordnowYU9COGsrem9u?=
 =?utf-8?B?WTE5RVk3VUFJbkNuWGhYRkEva3l2Z2t6MkZXQTFWZWR0ZUxKb0tTNmpqS1pZ?=
 =?utf-8?B?ZHNYSDc3dFVqM1VKTCs0UXU4TEFEMWFMemtOS0NYMWM2OEY3ZmdMWlBxU0Ry?=
 =?utf-8?B?bnI4MXJWTHhpTU1QbnhxbUNGdGFvVGdpZnVUcFlOMEtTVEFDY3hRaitrSnlk?=
 =?utf-8?B?K3Z2QXBNTVhJZFhXYmdpWlJzY2RvTU5vdDdQcVhiVGxBajlMNGtPSkc5RTJV?=
 =?utf-8?B?bllhYkd2TTYxbXJqbnhEeit5WWVwQzYrWFlrcTlzaEZUV05kcmhHSDc0bWly?=
 =?utf-8?B?WjJjeXpPR2lCZzlpci9UcFA1bVZyTFpGditTVktVdGhMbGdTeUpQcU1Td0xF?=
 =?utf-8?B?RFVXTUZtWVU1NnNzRWQvZEFVdUhacnQyTVh3OCt4NFFwcFlJdHNWYmN2UnB6?=
 =?utf-8?B?VDRzK2ZObWVCa0dZNlFOTGFFL3BIbWRiN3lUdld5R012ckFYZGYyWndoWE5N?=
 =?utf-8?B?UmF0QUtWTUhWV00rc3B4aWdjQTVHUFk1bE1CS1Q1WHh3dWNtTVYyUG1pZXg5?=
 =?utf-8?B?TVNROUdwM0hDVGJDcTFESG9DSzdQRGErWWVxMjY4WFVTRFhoS3N6NnZQUjAx?=
 =?utf-8?B?OXV3THYrQ1NpM0JJOEt5RHdmdVQvajBSVVNrRVF5SFpvNmpBOFVVa2F4Ymgw?=
 =?utf-8?B?VXVpNjhIWjF3bWNQRTdjMWpKdWZYS0YrejZEOWk1TnBhSHRML3hLazFlaWkx?=
 =?utf-8?B?bmh0TDdYNW1hL2dpTy9uMUREYnRDSW5PRmZQa1lSaXNOeXJXRVhQa0ZKZ21S?=
 =?utf-8?B?dGIyL2hyQzlKbDFnbWladnRCNU5oenE1YzBBVDlTNUVpcXFiOGw3dFRhY2hv?=
 =?utf-8?B?cmdaQlowblVWUFh4cWF3K0dkMHFSbHVIeUlBWC9aVUtZL2Z4RVVkNzJUQXFr?=
 =?utf-8?B?SnFrK0lRQklYa2ZIaXdKcWM4NHQ2N3ZaQ0s3RmxFYVdPdFhBSytPcW01aVlT?=
 =?utf-8?B?M245dGMyem04ZVhSQ1UxcTA3QUkxYUJCMG9tdU5uN3ZUVU5RTUtheGFKZXVv?=
 =?utf-8?B?RkhzdHFpYTNQcG5RaWxxYjU1SmdZTFhYQjFDT1RIVWpqUENZVnlpUFVYdlkz?=
 =?utf-8?B?MXo1cEVQNzV2RHJxempsSUkvcmMzelhhaTJ1ZmZQVjNETHF0Z0VIcUlObVdt?=
 =?utf-8?B?b25Pd1dGeng1bnhJcWZQeDVibmg5Q3pqak5TdVo2d2l6dWdQMkQ0YldqSDhR?=
 =?utf-8?B?ZnZSOHY2QTRYRi9GZUhieTcyNzBmbU5rOXh1S1RHdzBIZWFvR0VKQ2NwTlZT?=
 =?utf-8?B?RDV1RWJSc3M2T3g1c1MrZ3JTa1B6WCtwb1hocVlwcWN6ZkZUeXVkeTN1S2lm?=
 =?utf-8?B?TVFocGxLZmxWMUd1OXh6dmN5NzAweWYrN0lxWXNqaDVHT0oyOVdOSDJDZkV4?=
 =?utf-8?B?Vm1DRFBrMDVyRWk3S09KR05UYjRqV2NCamlsTGZiYWNucHpsUVJNOFlodFpT?=
 =?utf-8?B?eFZySTB6V2xIcWx0Y05XZFJuc1pCc3l1ek1WN3krS1R1V1pSbk53RFY3T0ZZ?=
 =?utf-8?B?TnFSNzZrUjNNN0NZVmhkMlpIU2JHaEtaVEVVVys4eTFxVUl3OCtBOWFQU0pv?=
 =?utf-8?B?TkJDZmFoYno0aTJ6WU0rbERvWGtaODRJa0xoUkZXQ2gwbVpOTG05UGNhanZN?=
 =?utf-8?B?R0NvYk84MHR0U2x1TUYxMldlRjdEN2NmMkUySTZWQ2lQS3c3SGNUNkpWVGtN?=
 =?utf-8?B?ZEJocEN6N1N5ckxXalNsVTRDNVRVTmNhTk5sbk5zaFNVd2VPS21OMitvMDlu?=
 =?utf-8?B?bkN2Zzg3aDhOTDdGUnRhM2NwUEpqK2xJVXpFNmxKQ3U2cy9zSDE4R2p4dTZ6?=
 =?utf-8?B?bEJpcFlpNTVzMkxPVGV0WkRHWlB1V0VYV2UremIxTFdhT2Y3OW5MTWR1Qlh2?=
 =?utf-8?B?alhaeWQ0NllsY2p6WS83ZVZYSjJENi9aUVljOWZMTTZod0tHWWhjQ0NqNE8r?=
 =?utf-8?B?ZmtsUk5kK01vNmJFYnk3SjkrMk1Uc2tYaDlud3ZrZU1aYm5VMHpGeVk3bVZH?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6689137-6e2b-48dc-82d5-08de1c824e03
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:45:11.6172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RdXOT0JWhj/T6BNcYg7devGm6RxIOJmN2+5mzZDQNjo+HfQ84oZiqzSX33XlKpgNT/3vr3DdM9po+h8M0QOSNvE0xZjexvgo6Og3sQGZqjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF7A88A980A
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_074519_129302_64FD21F1 
X-CRM114-Status: GOOD (  20.52  )
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

On 2025-11-05 3:25 AM, wangdich9700@163.com wrote:
> From: wangdicheng <wangdich9700@163.com>
> 
> Pop noise mitigation: When headphones are unplugged during playback,mute
> speaker DAC(0x17)immediately and restore after 20ms delay to avoid
> audible popping.

What's the device ID for the "conexant codec"? I doubt all of them share 
the problem. Once obtained, mention the ID within the title.

Now, the problem you're aiming to address seem generic - addressing pop 
noises during plug/unplug is a common subject in sound/ domain. I'd 
check if sound/hda/codecs doesn't have something for such occasion 
already. Takashi is more fluent in sound/hda, perhaps he could help here.

If such code exists, you could get rid of ugly:
	codec->spec <-> spec->codec

relation which you're adding with:
	struct hda_codec *conexant_codec;

> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
> ---
>   sound/hda/codecs/conexant.c | 65 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 65 insertions(+)
> 
> diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
> index 5fcbc1312c69..2c16d1930a75 100644
> --- a/sound/hda/codecs/conexant.c
> +++ b/sound/hda/codecs/conexant.c
> @@ -43,6 +43,9 @@ struct conexant_spec {
>   	unsigned int gpio_mute_led_mask;
>   	unsigned int gpio_mic_led_mask;
>   	bool is_cx11880_sn6140;
> +
> +	struct hda_codec *conexant_codec;
> +	struct delayed_work change_pinctl_work;

Not fan of adding 'struct hda_codec *' as part of the spec. As stated 
above, I'd first check if something pop noise -related doesn't exist in 
sound/hda already. If it does, hook into it.

>   };
>   
>   
> @@ -216,6 +219,63 @@ static void cx_remove(struct hda_codec *codec)
>   	snd_hda_gen_remove(codec);
>   }
>   
> +static void mute_unmute_speaker(struct hda_codec *codec, hda_nid_t nid, bool mute)
> +{
> +	unsigned int conn_sel, dac, conn_list, gain_left, gain_right;
> +
> +	conn_sel = snd_hda_codec_read(codec, nid, 0, 0xf01, 0x0);
> +	conn_list = snd_hda_codec_read(codec, nid, 0, 0xf02, 0x0);
> +
> +	dac = ((conn_list >> (conn_sel * 8)) & 0xff);
> +	if (dac == 0)
> +		return;
> +
> +	gain_left = snd_hda_codec_read(codec, dac, 0, 0xba0, 0x0);
> +	gain_right = snd_hda_codec_read(codec, dac, 0, 0xb80, 0x0);
> +
> +	if (mute) {
> +		gain_left |= 0x80;
> +		gain_right |= 0x80;
> +	} else {
> +		gain_left &= (~(0x80));
> +		gain_right &= (~(0x80));
> +	}
> +
> +	snd_hda_codec_write(codec, dac, 0, 0x3a0, gain_left);
> +	snd_hda_codec_write(codec, dac, 0, 0x390, gain_right);
> +
> +	if (mute) {
> +		snd_hda_codec_write(codec, nid, 0, 0x707, 0);
> +		codec_dbg(codec, "mute_speaker, set 0x%x  PinCtrl to 0.\n", nid);
> +	} else {
> +		snd_hda_codec_write(codec, nid, 0, 0x707, 0x40);
> +		codec_dbg(codec, "unmute_speaker, set 0x%x  PinCtrl to 0x40.\n", nid);
> +	}
> +}
> +
> +static void change_pinctl_worker(struct work_struct *work)
> +{
> +	struct hda_codec *codec;
> +	struct conexant_spec *spec;
> +
> +	spec = container_of(work, struct conexant_spec, change_pinctl_work.work);
> +	codec = spec->conexant_codec;
> +
> +	return mute_unmute_speaker(codec, 0x17, false);

return-statement in void? The code won't compile. Was the patch tested 
at all?

> +}

