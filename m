Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF671C3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 20:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6MomBjoqaVpKcZZSYoiP/GHDVHkz4EP9azdM00CI3Q=; b=UxiPF7FCCAPQ6Vne792sxLaPZL
	BLqyvGJlL/69ZO/oiv9WkgsSU/ZMJAWSY+nLFth87ebx2GrpaCGbekduDSzRNnN2zQH5leIjUz+ex
	J0qtla9/LhI3GvI8Sc1UI+xqphRk2AMWnpp4ioz4cUVWIEbPhJZVNqH3e3b79vtjVrwaqE9hRWABo
	+9QUjwPSJC9rgBLlYOL7VydkVu/qzIHkjlERcrVwi5HAo3VdXDx0L4nVonW/UGG9HGS6kYIT0lbEV
	1HYKMPh9zCRyVpBQ5Iz4V4hciUN3XjkUCOiDhKjXI43ug4/4ODvfOWFWTTA/hDwracoPFLucg65tp
	4+kqXLoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9rKf-0000000Aidr-0ZBH;
	Tue, 29 Apr 2025 20:13:33 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9rHP-0000000AiOn-1Naf;
	Tue, 29 Apr 2025 20:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745957411; x=1777493411;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=M9jxvM6jK/UoxobRUVLJA95Vbd2364JNS2DlxHg6+cY=;
  b=coMSY9VgypdMTcvJxvrIbtFCq99RYiIVKzycg04RGYLhlq0MX7RkGoiH
   Q/rOXeefndLSrM+as5SmpvKVMFnhEVhmmIunfXQtcJejVKB1pBg998avO
   jZENuqP3yO2xw10bCbvSpgiezk3huROfRGtoIg3FfBXyHkptP8ALcnnoY
   RHLtl0xudKu3Csa5+gtYe/YJSljm4CJnixrYpTU65Vj/4GlEcvKCvz5dC
   JZcXLf+oeoRHBzJKGO2sOXKs6LDJume6n5HCbJKsy9JLmwyk7VPJk0pxU
   Df1Pz03g4C0+VXLtpnwypeahE9AKdpVSXK7kIXN5bi94kj8s+lAkw5azn
   A==;
X-CSE-ConnectionGUID: QGGeV37jSOaPct0Q9eDUEQ==
X-CSE-MsgGUID: NBM0E+IYTPKKhmvg4vnoMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="65011219"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="65011219"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:10:11 -0700
X-CSE-ConnectionGUID: vj6641UaRRqYHTB/+vbJwA==
X-CSE-MsgGUID: jC7Q1kJITRi8EAzWCok7ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="139106245"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:10:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 13:10:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 29 Apr 2025 13:10:10 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 29 Apr 2025 13:10:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJFEiQeDO06iAd3nXLYLhkOJLJeW6O66NRieaWcPd7c2607OWpfVWnV/PYuHkUkgioqmyO4Fm/Ac35NgpgNKuJAeDlRryFxqmMEVt/EQUDVHyvQOdtEl6ksj2HH8ygNxDz9V4PmT3BzbSAMox79hKdOAOy+G92+ZIbsoQGtbOnFLzUtpmCUT7QXe4uyZA/scmvfq/gfSO57uDOFWGGSq//NrIwEohp56ChZ1DBS4xoiKYt4lRZRlK4tps/wP8Qz4XbtT+D/VfSySEWNUBDR66DpXUA2QoZJgLyndV7MyRA7JLikg4e87VsmeYOrSdtCbfPwgdA1PituYodsba8Js8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6MomBjoqaVpKcZZSYoiP/GHDVHkz4EP9azdM00CI3Q=;
 b=Xpxh4ovjU1uyGUtb4SgsP8nV75jpgPGX6Aq3avS+ty2gBpkjoCj2lOhesdNrJJxnmSrIVLliPbdQnorpw3rZOf8EFqAMwmnYoeYKBfLkpP8AGQTcbLEYZ2k163+Vj19kqGUqqHTxFwukd7zy4RkKddPYEvC/v72R1cKb+5wvXfTcXY0mnr+1XMc4aCaortzo+V+ZEAeS/WOjYmj5do/CaNR0aIX9GIVpx3neecWw2x8/ERNKJydYjBSQLfe9bzTzTTz3zzqxeMKJoaG5GY54OMWHo1Qn+rbOtEdhfKzDhDho68mj/dYvFzTHeGQDccjCjum9jGKkX+/PQ6oO9yDC8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by SA1PR11MB7039.namprd11.prod.outlook.com (2603:10b6:806:2b5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 20:09:39 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 20:09:39 +0000
Message-ID: <62776652-4fe0-4c44-8588-341780d2b8ca@intel.com>
Date: Tue, 29 Apr 2025 13:09:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4] net: airoha: Add missing filed to ppe_mbox_data
 struct
To: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <netdev@vger.kernel.org>, Simon Horman
	<horms@kernel.org>
References: <20250429-airoha-en7581-fix-ppe_mbox_data-v4-1-d2a8b901dad0@kernel.org>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20250429-airoha-en7581-fix-ppe_mbox_data-v4-1-d2a8b901dad0@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR2101CA0007.namprd21.prod.outlook.com
 (2603:10b6:302:1::20) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|SA1PR11MB7039:EE_
X-MS-Office365-Filtering-Correlation-Id: c737cc22-d067-4f78-d0d5-08dd8759c5c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUkvNUlwRUVHV1U2MUU2dGtPQjBmTUl4VFpXVWJ3NDFsc2VPUmRYcHdxOFJD?=
 =?utf-8?B?ODlQUUFkSGdpQzdqOWsyWWpmWmZ5VjRXOW5uRjliUHN3c1VHVENFMnRJL09G?=
 =?utf-8?B?aURMUDg4djZWZWtWQ1NXbE9oQXhITERiSXhwQy9XT05FNkgvYklvWkNaZ2hO?=
 =?utf-8?B?VTJRU0EyRUk1VjhLZVRxZExPVDFPT2ltQ0I1QUlZQ1dlU3hPWGg3allLY1hP?=
 =?utf-8?B?UGcyS2R2bkJ0R0VyRHk4WUF5Qlh5UnVrd1ljS012bXFXOS9sMzh6Qytia2tz?=
 =?utf-8?B?WFVpMGgwc1MxMnltdWV2Z2NqZ0szMW9Fd2puaGJXK3pUaGdIbEo0R1p1ZWJX?=
 =?utf-8?B?ZFFOanpJNTlnYlp2ckxTVkhRR1RpZzkrTG85aDRjUkVGYm5qNFJOeE8yUVhT?=
 =?utf-8?B?UGFJbFl3TFFmUWlyZnlYWUN3clF3MkV3ZGQ2N2thOGgxMWsvYUtDQmIxbnF2?=
 =?utf-8?B?WTgvOUVIQVZkVnQ4U0JRc2JvOFZrb2IxOEJ5S3BZNHhCOXpVc3dXY3VIUE4r?=
 =?utf-8?B?N0lSZVJvOWlmeER3Z1M2WkN1SVZkb2d3YVMwVlNUdlJzeE5nTmxucWVLSis2?=
 =?utf-8?B?VW9zNmp2YnF2Z3VmYTFaOHJDNUgzNHg1T1NyVzFQR08veDYrWHFPeTB5WjIz?=
 =?utf-8?B?S1RhbDFxQm1NOWJPMS9pOENFTkNQdG9qY0R1SnRLUHl4bGo5VVJJNk5EeEZG?=
 =?utf-8?B?RTl4b3NOa3lmaXFnSkU4VWFHZUZzdGZkbW12OHVFdGZXZjFtdW5KaG5zdnNB?=
 =?utf-8?B?OElxaEJRdmRCOUdpZVIwVVh5cGVJZ0ZMT3d2akF1THBKSGk1d2lzaHlmeFBy?=
 =?utf-8?B?cEcyd1JhTmR3bjBsZ3U2dmRiYW4xSE54MjNrcjQ4bTNUdlpINXpXeVF1cW5u?=
 =?utf-8?B?THhSS3RLenhpN2JMTnNaOVZwWS9GVENnVHBNYmNaYXFZUkZuand5ckkrbzZp?=
 =?utf-8?B?elBtRFpLYXBxZDhaQ2tmVEMzWDRJU29WNzAzbmQvMnozeFJGRmI2OWUrTVBL?=
 =?utf-8?B?M2cweTVjb0RpM2E1UittZ3lPVXBkUlVlTjEwdHhwRjNnekNGWmlvdFBhTURt?=
 =?utf-8?B?RXcyYVlNVVg0SE5yNUVHeFRoOGExTU9YWXdvQkJHMSt5TDMzSlhCdzZiN3R4?=
 =?utf-8?B?VWh6SUtEWm11ZUFxOVdVa3ZxL0RuOElwd3pHSm53cTFCYWVnK2J0RER2akhD?=
 =?utf-8?B?aGpWN2pNYWZ2UGxDRWRadndhK0hrQVpXNWZ4dHRPWm9DOXkwZUNkYVMxczFz?=
 =?utf-8?B?Z1VIU2l3R2RtSzRjbytic3UyYmRmUmpwRFBqenVNdzh2Y2tkWlcrZWY3Mmow?=
 =?utf-8?B?eU1TOWREYmlOZml6RWtmbVVUVE5UcWR3b3Z0bmNxSEEzQVVkWUlNMzloVUlD?=
 =?utf-8?B?L1dPL0NZUnFzY3BaeGhuL3YvZHUxeGREMnc0a0JUY3ZVRXEzREluZkE5Sm5r?=
 =?utf-8?B?VE0wWDJ6YkI0VVRLdXhqRU4yRlo5eU44Q1hubXRiUGdGaHZyYWE5TXRtMnpZ?=
 =?utf-8?B?aVlkcWhQTlo3ekVsSk9NWXJ1U0hqdGl0UU16S0tQOURRdHVwa3FadjF3b0NW?=
 =?utf-8?B?eGErRThqdXNkZUdubExFeFBwenQ4OERoYU5kQjZoWSs5UUpnRkV0NG9lVGNF?=
 =?utf-8?B?ZThobDFkSERxYzVoc1BQeEJGWWRxdnlncFI4c05QVkhFYlgwQ2RTN1NNVTdS?=
 =?utf-8?B?akkrRWI0QXlKYUd5bjYweDBETjllWDRkVC9Id3ZYYlpUR3o4bUJxcGg4V2li?=
 =?utf-8?B?eWNrYnVWa0pOY21jcWNWNUFqTThWa0NpY3EvK3RpR2hxQm1WM2RzYTh1Wlhp?=
 =?utf-8?B?N0VBR0pzWm5ZUVFncFVjYkFFYWEyMlpqc1pVRlFXTlFYL0ZId1VUQUpmMFFE?=
 =?utf-8?B?cGJGeHBSbVh6dWRiNTcyK1BtNnFoa3dlcVROV1VZelFOYlI5WnA1RGVqZDd1?=
 =?utf-8?Q?GsULkQnFMzI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlZLMGhZVGtBRVBWeTRpZzBnYW9sakFrZFdrWmJqSkxycUZIQi9KRmdlVTdK?=
 =?utf-8?B?TlpkbXAzYlI3NlBpQ3JLM01BVG55RldGenJlRkU0NjZsejMrSEVibkV3MjI0?=
 =?utf-8?B?R0lJYVlEVklJRmhkRi9hVXdaTkxGRlZIQkkvbW1WK2MyODJ0ZEFIU3dLQnhN?=
 =?utf-8?B?QUdxVzhxa3dNMVlqYVNkTmRqN01pYUlEdmd1NlllRHhJZElBdnFka0NCZU5n?=
 =?utf-8?B?MU9jemdsbG9oOTBhR1orRmxqNlNsWHk4TzJwTGIzQ3BnbktqZlhlU1gvcHlp?=
 =?utf-8?B?Ujc1c3BZeXRFZ1pWT05RNmswZVlpRG5HS0F4RkcrMGJTemwrSDI0bm5vNm03?=
 =?utf-8?B?WVRObXh1b1BoZTdQL0NGTCt1ajc5Q295V2VaZVptWGkvSDNUTFlxSW8vN3dG?=
 =?utf-8?B?RWRsQzUweU9hbzFyLzdzTFFiUXFobk5IZVlWMjIzSHVIVVRtcUVsRG1MZzJR?=
 =?utf-8?B?Uk1RVjArQmlBdVVTZkk4UUNocHNEUU5ET0VIcUhLb0dBZGFaNlVZSmFmbFFx?=
 =?utf-8?B?YVJncnB3ajV5bTRWcW90UVoxUy9sMmp6SnpjalMxbnFlOVF0b2R6YTRhbWRG?=
 =?utf-8?B?Z1RQNlRXNHdVWGE0V1pSN2w1UnFCa1RBcUlnbVJiZzd6Z0NKd0RTZnhtVVdm?=
 =?utf-8?B?aWl3aGw4ZEg0V281ZHR1L3dqOG1leW11ektOUGorU1o4Z0tKbytlb2U1YkdZ?=
 =?utf-8?B?cDlSOUk1dHdjaFo4QVJJczE3aEkvNnlCNzNEeXFYTmxXMGZUSFNXZWhyWk1m?=
 =?utf-8?B?SGkza0g3aGFkSlJ5NFZpZGo3NFVkSkZYWkVwbDFxaXl4MU85VnFQY3NZWERu?=
 =?utf-8?B?azBVeWxSV1R1VUpHQkJNaUV4QVpDaFdWdXl6cnNHQVpUdyt1cUUvVHA4Q3Ba?=
 =?utf-8?B?MU43eHlsem0rbUtmS0JhdGsraFJ6enpWaVc3KzJhWEpZbFRja3IwRVFVSUpM?=
 =?utf-8?B?YkRCOXZMZTFiWUdiUVJ3UDVoaXlUelREVHF5R0FTWmlOYjRWclJRM3hHMHNx?=
 =?utf-8?B?WCtJYnl2a3FKSXRUZTliSEd0WlMzTXhmQVlsTW00eWVDY3VTa3cydmJJRHlT?=
 =?utf-8?B?RWdKRjRES3IvVHlhcEJWd1JaYVJ3ZlFCNFlsMHQ3RzZwQWdab3dUeXVLVmFo?=
 =?utf-8?B?RjFLanVYd2liU3BBNjMwSW9oeVh5dG15RzNHVmgxVHN3SzAySzVibWZuR2Fo?=
 =?utf-8?B?ci81WlozSDQreDVsZUk3QUNoeFZaVU5iT1hLeDdPaHYzYlFXcmR4L1J5SUFk?=
 =?utf-8?B?SzMyc3d3M1ZVNXdGVlZrdmNoOGlQcWtQbW1acHpoU1Y5NWZJSFM3d0FZdlpq?=
 =?utf-8?B?TU5qcTNaN2pTcmdlMVh3TGRDdEpiN0N2R3BwdzJCM2E0bzdwTzFqdTFrNitv?=
 =?utf-8?B?NFVsRzBEOTM5ZU9PZkhsd3J3SUtKZGhuS2Y4NkZsYnE3cGlqcHY4UW41dzNm?=
 =?utf-8?B?ZEdTMGp0ZjMrQnUvd3daNFo5b1A4SkZxRWNRZktnNkJnY1lwQktIbnFPWkdn?=
 =?utf-8?B?aDRoQkk1a2VnYkx5MlNLM0lLWVFqMTRSL0kxeVpBNFQ2L2NjQnNDZ2JoUjY4?=
 =?utf-8?B?eHllV3duamNpaHhMZXVwTG5nVWVZa0liVTBrTEFEWExQL1A0L2FzZXU4Znlr?=
 =?utf-8?B?M25tZnoyVUJDaWluc0l0RlNPNzR1UDlNaHdyOFY4UDFnakU1OXhkTG95aHhE?=
 =?utf-8?B?RFhiUHpVMzZjbkJSSEhaTEN2SWI5OENTZW82NXdnYzdRVGd6V1V0STZua1ps?=
 =?utf-8?B?V25yMjBETHlORWtXK3k0Syt1bzVZaHRaS2FQbURPa2FLNjc2WTBDSVQ2NTVT?=
 =?utf-8?B?RFRJa3E5MU5FelM0MW1Qb1dVZkMrUWg1QWtJVWVhYmZ4VlB1c0ZHRnRDSWht?=
 =?utf-8?B?SHRmRlNROThkL1EvOUhmQlZuMVUzU1ZSWFBZRzg3cFJMbXBGbVUxWjlxck1O?=
 =?utf-8?B?aytHL3NrS0FrS3dFM1h2aldERmNBTzB2bXdnNmdMUjRvSk51RXRiRTAxRFVm?=
 =?utf-8?B?a1dlZ1BpQUJDd2ZzbnBPclMyU0dQL1c1d2R6anVHdkhhRWVManZ5ME90MXNS?=
 =?utf-8?B?bnpRZ09MNm0yQW1qVjY5SWVYRjY0VGFFUXpUdDFaYUdtYmVWcnlKSGNKbjhS?=
 =?utf-8?B?WExuNEczc1ZWSU8raVdXcXRNK1psN1Z6ODZVb0tPaVNXUHFwaVZnUHpvSUda?=
 =?utf-8?B?ZUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c737cc22-d067-4f78-d0d5-08dd8759c5c9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 20:09:39.7564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dlk7e+H2fNf20wqmtCPkCmOwBgpZ5JJK+Dr6KpmJeukzqoD28su4B5hsMN4cOPeCzCBvKV5+sn5r1Wm0O4zyCfwhDNmzQlSxl3Sc44/MWfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7039
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_131011_433126_97941782 
X-CRM114-Status: GOOD (  21.09  )
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



On 4/29/2025 7:17 AM, Lorenzo Bianconi wrote:
> The official Airoha EN7581 firmware requires adding max_packet filed in
> ppe_mbox_data struct while the unofficial one used to develop the Airoha
> EN7581 flowtable support does not require this field.
> This patch does not introduce any real backwards compatible issue since
> EN7581 fw is not publicly available in linux-firmware or other
> repositories (e.g. OpenWrt) yet and the official fw version will use this
> new layout. For this reason this change needs to be backported.
> Moreover, add __packed attribute to ppe_mbox_data struct definition and
> make the fw layout padding explicit in init_info struct.
> At the same time use u32 instead of int for init_info and set_info
> struct definitions in ppe_mbox_data struct.
> 
> Fixes: 23290c7bc190d ("net: airoha: Introduce Airoha NPU support")
> Reviewed-by: Simon Horman <horms@kernel.org>
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes in v4:
> - use u32 instead of int in ppe_mbox_data struct
> - add __packed attribute to struct definitions and make the fw layout
>   padding explicit in init_info struct
> - Link to v3: https://lore.kernel.org/r/20250422-airoha-en7581-fix-ppe_mbox_data-v3-1-87dd50d2956e@kernel.org
> 
> Changes in v3:
> - resend targeting net tree
> - Link to v2: https://lore.kernel.org/r/20250417-airoha-en7581-fix-ppe_mbox_data-v2-1-43433cfbe874@kernel.org
> 
> Changes in v2:
> - Add more details to commit log
> - Link to v1: https://lore.kernel.org/r/20250415-airoha-en7581-fix-ppe_mbox_data-v1-1-4408c60ba964@kernel.org
> ---
>  drivers/net/ethernet/airoha/airoha_npu.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
> index 7a5710f9ccf6a4a4f555ab63d67cb6b318de9b52..c81e25139d5ff4b6c52ce8802dd9c9b9b6c8c721 100644
> --- a/drivers/net/ethernet/airoha/airoha_npu.c
> +++ b/drivers/net/ethernet/airoha/airoha_npu.c
> @@ -104,17 +104,19 @@ struct ppe_mbox_data {
>  			u8 xpon_hal_api;
>  			u8 wan_xsi;
>  			u8 ct_joyme4;
> -			int ppe_type;
> -			int wan_mode;
> -			int wan_sel;
> -		} init_info;
> +			u8 max_packet;
> +			u8 rsv[3]; /* align to fw layout */
> +			u32 ppe_type;
> +			u32 wan_mode;
> +			u32 wan_sel;
> +		} __packed init_info;
>  		struct {
> -			int func_id;
> +			u32 func_id;
>  			u32 size;
>  			u32 data;
> -		} set_info;
> +		} __packed set_info;
>  	};
> -};
> +} __packed;
>  
>  

Content makes sense, and I appreciate the padding and layout being explicit.

With or without the typo fix in the subject:

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

