Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A86C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 10:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TgJzSlEaTm+ipkxh9702YdVYhTa6tx3+B72KA/e0w98=; b=ugp703HjKwo6iIKg3IcmxCYCcR
	WE/k64jjUKPYm+aywLkBd1GU4c0xaPiRXMh2RdW4ZytoGoI32Ht+sQpSYM1gbLuwwAjbUWihHmGJH
	zvFS0K3G/azDBsbMiDRJKTe1eku0zWF7qK+FDyu3T5Z8ydjAAQg40R3r0L9IXV4vd3Q9L+5eDUF5D
	8yohtMvUtzg/0jvMRgHt9wOflIdT2PrY2wJxoGKeRaTBO09aM/q9IzV6crWLC6zkc41EKuKePy9u9
	nT5RE+dyTbKIc1wvSkL3MXu8yXBuPIX0RB6acMIQMnNykZAfqgVTCIS4IvMI/eioAYgRi/nPPqRMy
	R2q+IlMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH82-00000007k98-0KZ2;
	Tue, 18 Aug 2026 10:33:10 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH7P-00000007jL2-2eqM;
	Tue, 18 Aug 2026 10:32:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787049152; x=1818585152;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yZ+B+ABPkgfUJyqM3Cs4+t92taZUKLM8H4tKhoDiEOY=;
  b=D2iDWRoxN9RpEJ9rK1mfRnGp/wCUB/qEyL5duWcYgZXejFTFCbPvp6dK
   CMrW0GbsLGtuhslgYL9xiEacW2DFSgkwIN0konVolYSfliAQ8ke9w18jQ
   5U640KZ5QB+mr6hftMIyMidctO2wa53rVga/vPbB6ONOPv5+QQjaBTCHb
   vxWksqocjcRP2D0ntd54EeB99Wls70HRSjaeSE1clG9sCPGDkXymvmwSk
   Imnu3zPi5Eguqjp/3seYdCOtQIJoE1QprgV+4TmuzFZGKa8TUJXeCjBwI
   9RkDSYZnIWmYYS3eGcvpQnOIIN+ca6DnE1tAEQ6SVuKzS3Xgf4ei6dAkl
   Q==;
X-CSE-ConnectionGUID: O3yItGSHQcGofVK+ovneUQ==
X-CSE-MsgGUID: rLZeMCV+Sr6Ceul0Pqhfdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="91220307"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="91220307"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 03:32:30 -0700
X-CSE-ConnectionGUID: ZY30t82KQmmxOafI3csE0Q==
X-CSE-MsgGUID: QKjVnZ1eTuyjmpi2k5gRiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="265222763"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 03:32:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 03:32:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 03:32:29 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.29) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 03:32:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/v91SIldgK9lkQpmX9fJ4I/4gv82WFHwTbd+ZZaVdu6qonSexAofWdbesyRuNGKrJCp4r/2ostyq+SakVMoL7czGlUuD4Fy3a/qq0qzouJEupS/ao0yMyeJaWyOmFw8gce40StC9Zxnid/rpSphRKTdwygc++YOwmcrpDzLeFri12ff1OqfdODjlFI3cFxtiAWxVwtIclGV26f8vPmzuIIMlvfXSfIhO9csKuGRE0JwbMEh52AShmrfMR8ehsXy1jrl8gBmkw8a0028W+gyNvRbKkeIWjKR4TK3EP37YdxignCirnbgjD1Sd86dB4wa2kQ0RRyxpdtDQEIPgVn5yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TgJzSlEaTm+ipkxh9702YdVYhTa6tx3+B72KA/e0w98=;
 b=ZKnTmuiFPFmERl8t4MFQMOb18Eu2x1jK6XKG6uDVdpEFyBfljQNUjjTlFHh5dvUDArYRfRkz3nhTLasg2eEdeM8IKpgts80TLk0hWphvTlMH11NwcisXtxZ/wPkLDAPssOwxh5L7/X1rN9mTQXTgsgsQeHez9O4X6ssgFN0bVH2GwOHd7ZVCqcm3kQsk5VvuzsEtEi3eHpHnmbdZ+Rf/vNhfQ794/zXrWtBZSTGAInlEQdsCdaP2z72vcOdq3zCF+NWlE3YezI6DIEgF3DAXjiOAzggA8wAafE6RSWmlmcbUXLnBwpKLOpSfTb/Ab4CL+pXMCh5yHgJpdfr17bZu3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by SA1PR11MB8795.namprd11.prod.outlook.com (2603:10b6:806:468::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Tue, 18 Aug
 2026 10:32:21 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 10:32:21 +0000
Message-ID: <109a59a6-0b3b-48af-a274-c6a58e5c7246@intel.com>
Date: Tue, 18 Aug 2026 12:32:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ASoC: mt6797: fix wrong unwind order and error code
 in enable_clock
To: <phucduc.bui@gmail.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
References: <20260817113249.69252-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260817113249.69252-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0009.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:357::9) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|SA1PR11MB8795:EE_
X-MS-Office365-Filtering-Correlation-Id: ae4a37d3-e07d-4bb8-a7a6-08defd13fc5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|22082099003|18002099003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: /BZe6iTMqrhSyutTdRDCwNk2QwWiopJY2hFvqQx+BLK9Voit4vjO5/z9IBpRJ8+mCf/K1aTzeaPmQ95d8oqfjZwxaQqhAiUrqlkI369Ut4ds5naGKr+pnzhHxf0vJxSS3lNUl9Uj3RtlBLPyEyDmHuPEmV+tDZbmkoJhk0yPRxjwoRl51YR/J0UbIfmCisJRFZx9XOckYuvm8tdRtQZ72E5gUfpi/HulxbiTPmbJrrbNaIgcCWbzu8EHGytdZLr8y4NqRSVji0jAtP+fv3YzIjTZRlffVxeojkN9aOkrrbNhgfZk9zzWU2Y6VNRDPZioh28K1qT0qz/afecqIn+4LmvTIkbLbOnl7vBf7ZdOZR43IXgXSt7eU1oudVS8BX8GgMMO/BxtpAWWeRl5P3AbKvReMPCFqfa+uk00LKFo/ab3KqI+NPuh309qdKBr/h467xHsW15t8GFxtWVasQjwPB/IGbF140YVUcKSX9dDLy3P28sIaABAos+ryiMk0M4LmMeCc8E3sq0+PnVcluU3ZVoS0pD6bNKEOn25Wtso3C2qEpUa/RtYfUK3+wS+sVSkhg/3e2Z+D/fAgm5i+Qk5BhTVNeopYNQLrZ3J5RwAdYrl8nRBpu8noOBsO13rIy4Q4jhw14NWPCwUMt2Wo1LLR37Ovr2r4kyMMMf+vlhDsiI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(22082099003)(18002099003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STNpTVhTSTIvVkpJRExiQ291dVExQ0tEYnc4TjNNOUhhS082YUFLZlRuRVpy?=
 =?utf-8?B?dVBETXdmVUpCYlhtaXRjckl2K013MG93QkVYdW9vWlpwUElLZlREMk44NU9L?=
 =?utf-8?B?OXo5TUVRWjB5VzZtaHVKaE5xOVBxRG1XenNLRUVpY3VSVUFhK2orazIzQ1dQ?=
 =?utf-8?B?QkJLRCtKVjR4R0lZOXl0TDgvNlN2bjBUQUhkeXJVU0IyUjM0Rml2Q3BYRzlP?=
 =?utf-8?B?MGpiZ2tsM2E4aHRaMlc5dXlkd0F1djlSMGZkejJwR3I3dWc5OHR2ajk4SnQz?=
 =?utf-8?B?K01ESnk5UlB0Kysrek5KZ054RkR0SEhkWEY0SmlDVm5OZWRhUTVyZHZRNjZJ?=
 =?utf-8?B?UXM0ME1nZTV5VzdWcEFENUErNlA2S2xneVJmS0NFeGVRZFM3dmF1eVlPa0ZF?=
 =?utf-8?B?Sm9uTjFhdThTNloxRnNzYVF2amRBZU5JbHJ0ckpVbkx5VFpwVTQ5dFJDMDlF?=
 =?utf-8?B?TTBnd2dUSUZ1dTRaZGFXdVJmRXF2L0YySXVzNGltbFVpam0wYzNZRlJJNE1m?=
 =?utf-8?B?eWdPNCs3ZFJFWXZyV2tMV0pJeUJrUnB5d2ZuSERyRUVSamhiR0t2aFpPam9S?=
 =?utf-8?B?VE83Z2xHNVVaa09wZ2dYTHIybW5McU10b1E2aGljYnNpMVJCaEc5RTZiSm90?=
 =?utf-8?B?b0Z6blJwZ1lKOExGa3M4LzgxcERNd3pxVjBoNVkvanpaUzNKdUxLZmUweVIw?=
 =?utf-8?B?OHBqdjFoblA5TzM2VUpPNkVVVWNjT0ttNzd0dlFEMFBLV0NoNDY5VEhWeUsx?=
 =?utf-8?B?dHBTSm9GZFE2aGxFWGRtTzVhK0hhQjIza3ZES3RSTFVicFZ1OVB2bXpuUjg4?=
 =?utf-8?B?MzlmcHRYUjMra25Cb0xBR3VMMHlJekkyaFgvUk5XajBVQ29GWlNmQlU3TlBP?=
 =?utf-8?B?VEZEc0VYbUoxOHBsVFpMZDJhb2o1U0NZbmRiekRhMnEwOFJtSXVNT0RlRjdu?=
 =?utf-8?B?UGlUeEwrNWpPVlA0cytoVlZrbEp1S3ovamtXMklnM0Zad1BsSzhmRVVUaEpw?=
 =?utf-8?B?RS9YeVpPL2p0a200V3BiV0FEZGJGdmtWbldDQnRMS3VkTjJ2ajlIM0xSb203?=
 =?utf-8?B?amU3ZlRqRFVSdUIzQzBoUVRJdUYyWVhDcU9rbFJQZks0S2ZkSlE3S0tyY2t2?=
 =?utf-8?B?RGtJbUFKbjdZQVZPWFpIQkJTVXlWNk5FVmpiSWcrek1oL1F5YkgvZEI1V24w?=
 =?utf-8?B?MDVNSENpTi9yQmtpWWJFeVh0NUZPSjRBSjVNTlpheDFZL3hJalMxQk0xYzRC?=
 =?utf-8?B?TmI0aHpWeXJkUmthcHdnUkVIbzM4c0tOMkFROXc1QjRWRXluRWU0R2twMDJR?=
 =?utf-8?B?aXZpV05WaTV2QkQ3VUxma01admJ0WGsvR3E3ZjZDUXZ4bGt6eTFuU29ZV2Ev?=
 =?utf-8?B?M3pkY0YrWlJYRWxwUWZhN1gxZUpOM3VlNkxxLzBmZ2tobGF5TTkwdVZsT2VL?=
 =?utf-8?B?QVZrWDB1cmVMNzVKUFpxTDF2azRJdHY1OW15MTBrVVczOHMrdUlSOWpGcldj?=
 =?utf-8?B?NkJWa1hqNHRxZExoYmFMYWtYUCtrc3o4KzAvY0J6QndROEF6ZFp0Q3VncXJj?=
 =?utf-8?B?Y09QUllBME9HeHhLcUNnNjVqOXZtYjR3ZkN6T0x3d0Y3dmkxWGZlQzZudnBw?=
 =?utf-8?B?WTVaQlVvd0UzVFd0Y3lRclMzTytiMVJUdENNQjExNEFzQkJHZG5ZZmFGdk5v?=
 =?utf-8?B?R1lWNDNoVEVIQmpLaFRZY25sS0RlKzhrTWF2di90YTlYOU1IMmNUZG1LZllG?=
 =?utf-8?B?ejJ2SU5xK0QzR2lqM05IdVpQTHlrd1hJS3hhMndYbm9FV0wzaW9oRnhPSFVn?=
 =?utf-8?B?T0lSWkEzYWptNStoTHFHSm40YlQxdnlMTkkrSmVtQnNqMTI4K3RZRFFSTVRv?=
 =?utf-8?B?ZVRZbldGVkhoRzVjZnArQmdQcVVNMitZampWSGFxOFlBMUp5TjYyMmJEbnZI?=
 =?utf-8?B?TUpBai9HQVNGOWYxU1AyZzFMWUFZSU1CVWxmQ3QxdUFXa3Q5ejRRY0dwR29x?=
 =?utf-8?B?Z1h4QWlyZy9ITk1tTy9ydWNlcGJnMEppUXVwbzdUSkpNYlB2bVJlNDd0eXhu?=
 =?utf-8?B?eXUrZHdzbmVjUGN2TDdRZm1HVEdSYU9BdWVFRitsZnNPSUZyV2k4c1kwM1hX?=
 =?utf-8?B?SlFGeEdmd0xuemUrTDRtK0VvU2RiaXd4eGdYcWErTS95eVpJRXVsK3F3WHN4?=
 =?utf-8?B?WXZiT1RIcStrL0pxcGpFZGhKQ21wRzdnUk41MXhyaXB0WW5vYktZdzE4ck9N?=
 =?utf-8?B?QXVpelhuODB6blhkTHdQN3VWWFp2bk9UN0JsM0VKVkhTU2M4UkMzQXZHYVdS?=
 =?utf-8?B?NC9hWXhYUDVZenhKY3FBNG1mMTVzeXM1YTQxRWFnb2xzVXNwTjFaVno1RjVo?=
 =?utf-8?Q?buX82QsJF0PXz9KE=3D?=
X-Exchange-RoutingPolicyChecked: CdxOiqyc1A1mN3DdgQ+zwzpG5Jvq6t02/eji2xvy8XuytcfuMgGnc9HO1C1W+wTLtzvbmy6gY19PRz1wKA3Q/P6lwdwEU2eHqhcJ+xINS5FhGV8cAsjabjnHtFIYMrJk7XEfNAnz+BuiLUB6SyCVKW6bNYybEFkk4oy8VIl4sToG1Z+mXiDMgSH2OF8RlHSTpfpPhZwMLDjyfdSg5Npf2IhOW3UIHs7qSptOOA3E1NP9SaTs6GsPvV+uWrwYcg+pq6FBu/oL5ZyoLNBQNwEcmrrYlECtr9iiF8tDixtC8RmpTMit/Hs2i4o2fCH4Lhg7ks+VJ3DTUYYRvNruis9siQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ae4a37d3-e07d-4bb8-a7a6-08defd13fc5a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 10:32:21.5589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RIqmtudYqadkqWhB0sWO4+j1m96X3iu5jzT0dC1vi5u7SuSCXA8ADcLY+nu5K5V4jNnwbUkF4S5aZLGvr2w9QdPXpfmlnMvHi/z5XD0bGsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8795
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_033231_794214_C18A16EA 
X-CRM114-Status: GOOD (  10.18  )
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

On 8/17/2026 1:32 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> The error paths in mt6797_afe_enable_clock() use incorrect goto labels,
> causing clocks that failed to enable to be disabled during cleanup.
> 
> Fix the goto labels to only unwind clocks that were successfully
> enabled, and return the actual error code.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>


Aside from my comment regarding mt2701, this mt6797 series should have 
its title updated:

	ASoC: mediatek: mt6797:


