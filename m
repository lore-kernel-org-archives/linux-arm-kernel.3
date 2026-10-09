Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B8DCA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 08:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pDiB7kup0nlUwdeeMcie428u/Pp6JxQSQcqLOmB4IF0=; b=B3aeSrkxgcgMYmfG8Z0hK6FZqN
	uU/rL6UBkN/cqtSE7v8fqMF4d4OYVB7wsrZ3cRJptUUYp7+FKMb+zaPhuSfpkOQlygTtDMxZQX8+V
	3pMybNoJqXK9c9lc4AYReugQBd/R35FwBrc1TQTh1yP+1CbFpjM7xW6muvdtSrh4nk+/WlhCIvPDf
	vT+VAsReHTbvSd9dn+hRTklmu1py9kENqbvJBzLkaLdSntDNlQ79LWvFkK1TuNCQvtGTl8LIbUL6+
	p+Sxxe/03A3juL3wS/EgSs31a8zXwIWqkkgbLzHV3tSGuajzkg87zk8i/nX908WxN0TaU7vIh2KJA
	Jr6NOtSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF5mx-00000005nYJ-0MtX;
	Fri, 09 Oct 2026 08:17:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF5mv-00000005nY0-2neJ;
	Fri, 09 Oct 2026 08:17:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:CC:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pDiB7kup0nlUwdeeMcie428u/Pp6JxQSQcqLOmB4IF0=; b=okROyXg3SVTnOyuduP1R17Zj4f
	8qYNTI15UHsWutfUj0K7klLwXO4CFaiIECCDUmmexvIpLuXb79fTlMTuq/FK+hWV6R/XPclJ6jeuc
	8KS8PB4FvxCQM2HfIxO2CZWiFeVi/w7GeZxq3nr8zndSfnT7n9KGSfbnq571dfJGQhUUAKTErmWZR
	EDw0QektZFnBgb2SknHVolwWEoe6yKAuO5oROPLaFZ6bd+AJLKxFOxLWBbsEcLp2kW76z1unJbJZB
	V/Xiy5RRaWFeJM1bBmvFqTT/51Y9veyeL663KOdG4GV46TGRU8wUmqEs0BemJ9QobRqGvHmzIK+0Q
	O556S3gA==;
Received: from mgamail.intel.com ([192.198.163.7])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xF5ms-0000000B1KI-0x5i;
	Fri, 09 Oct 2026 08:17:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791533827; x=1823069827;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vROYfeursea5rZoJmaeNDovDBPM+F9gN78iwCAPpRCA=;
  b=lF3eJYa7ATv8j5Ys4dDUyB2YpjJsIZ5yCv4oHZy2R6nKGtgB+bW5KWPK
   NqC5IS8KAa6Uz7fBgX+wYem0f4ZH9002kT1anyi06o3l0tix0qZ84ayov
   ysJR+DaFm4HZP9RPTA1SFzrdz6bL2O2W7eI3fkYNSUaWs69IyYy0ZztlE
   /lAaM7daR78NrexSjg64kTzLe08LO7QmWEfg6iohjPNBK1OQf0a3Gdyg/
   h/d9e8Rh7AkNX193Si5tAH/B6p68ict8+XDJNaDWTKRIi5QDPNfnKVM83
   JPiilDKDDORANEYtKscpYkmgk8v1LsCeiQXo5dU5BhHbzhjD9vePZCfDQ
   A==;
X-CSE-ConnectionGUID: lr7R4JMZROKC5iWwoJ5ziw==
X-CSE-MsgGUID: +e1kHXeYTMO1WqPPmTJjVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="222438"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="222438"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 01:16:56 -0700
X-CSE-ConnectionGUID: dyBO2hbzQZGRclI1Q+Xwrg==
X-CSE-MsgGUID: eoPJ5/KjSXSyom+H19yk/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="2000075"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 01:16:56 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 01:16:55 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 01:16:55 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 01:16:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMH6sjQNXA+VlIHNfvkwqcFWuCFY7X3VrCf+49F60S0eNqSVtdeeLAmFz6VzQJ1mMFcHdsWu3j3UDsA7GrVUwmq4FgKbv81IPMbYdgmjuJEjKuGy2FT4D5hSJBZvJzdoWNUxMQpxPZBqiGUaPfrVDg9twsj7UJxlbplyFP0SPK1jB9tsVXLhw59C8Zx2WN4osCN/Qx4S3gUD6ZcFSi+MYJOihfHUhrqi3faWfBC7riSHOE1iHcR/yGQ6K/LYTvZORPq3hmVXe5fF/Pt1H4hXXG3StT+fFHLxYnackbKudIRC6fsixbpxe0IwphOjsldmc7Xveb069ux9Rral70tKjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pDiB7kup0nlUwdeeMcie428u/Pp6JxQSQcqLOmB4IF0=;
 b=ktMbSizJMPK12y593VLuYfrmJ5b7YxS4myoE2ATr2PUIKLg42oCPrKhyCnwPDKHvIPDN989VoYd7ajM0dzThRlXy/F4EniMy1/gp85TIaQG/tTnyZjvzexGDPSd1XYQelRKQt29Couc0MGdRZVl48649ntNi9Z1ovaozm72G8762sUxdbN288cfLBGHxD8cuff1rZmrQq537y2Vu+jKgXhCQrTeSHjtAhn2WGHm6byi2ZWNsy8xRBDFIUyPzTwnlq3n1+PxoEYYTmoBsE2aXkiaOmHGWoI6YX3bYjy3PrjoM0BElMxIa+I8YtiAA9cIM7fU0j9WZjEFTnGIKoiTdYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by MW6PR11MB8339.namprd11.prod.outlook.com (2603:10b6:303:24b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Fri, 9 Oct
 2026 08:16:53 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 08:16:53 +0000
Message-ID: <731a8c1a-df71-4480-9c1b-47b3afd51e20@intel.com>
Date: Fri, 9 Oct 2026 10:16:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/21] ASoC: ops: Introduce 'snd_soc_deactivate_kctl'
To: James Calligeros <jcalligeros99@gmail.com>
CC: <asahi@lists.linux.dev>, <linux-sound@vger.kernel.org>,
	<patches@opensource.cirrus.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	=?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	"AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu
	<baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-6-7b47ed6335a8@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20261004-macaudio-v2-6-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0026.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::22) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|MW6PR11MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bdb2acd-a2bc-454d-0f9f-08df25ddacbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|18002099003|22082099003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: VzqMo0vrBzCCNtE3grAcFPwgUPupZfaa+WueTV1CZ+9voDTp3SMgOXtzqOYMp9Nbw/rRwnvsUTyblwbjURc0t9QmI2x0PLgwRwD1wgz5lHBDiJOqxiY/dJMUHfW4jBP3AoX8vOF7dejqrXIglHBu+/Rld67rWYqE3iy2pjBPHieqeU+eDrOM5Ww+mX2y7VBOl7nn8pF+JM8h1KbnckTu5t3C54k0jfDytK913WTVqi78YSZ18rpuVDHrCe0uKYoiHoSfCsFpHMHsHbj2xCJRp6tTOnp2v6LdTzs5XyLLhYyCxcC6+sAcG9+9Pr1LdIqLgsumg5Sxek6jjjmhbHPInaXqGd37evEGdSafC5e4+VD6xA473A0J2uLmH5TvJXW+trQvytL2heIeTUmbc/LllXn7nMQhx+wsfN97G9NyznXBK5E05yjq18Q8+4mX89vHX/bj5cc2F5JmzI0F0zMQ4X/M+IxnI9Yu0NRH/T3RomAyN/BzXWbgEUi23zDX246f36/j5ciJioo8bswQ5jm8i7nRRFcvK3E+P7dr93pGiwbvc1WORvMrCtVog3rWRKe8iAnju1rUV3pMbFwAV+rc2DkuPn2Y1/Mjq5v9nDCteEr8Uu15DnpLk7pW3qETka3qPX6tzlyTgcuoI8Ufo7hWoOHH+yMkUlA6r/l+h/Q9cP8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWl4ZE05N2FEMDNBSE9DVWJoODh6T1FGSDJnSTlLUzVWc0hJd3RmcmR2a3pP?=
 =?utf-8?B?TTFlOXlyMVhCK3ZJV2tnL2RQNzJLOEYyWUJGdk05VWxua1NpSzJZU3VaYzNZ?=
 =?utf-8?B?ZTRVNWZmQ2ZxaTA0bGZSVVJLNE9GSG1FbjBnNDJ3ck56QXU1RDNScEFUbzlB?=
 =?utf-8?B?aGI2aXZQdjZJeVZmR2Z0SGRLaWQrNDVWdEJqRUhwK252d2RIMEg4MEpBdEo0?=
 =?utf-8?B?Y0dpdlhhalNDelNnY0VpUG0xMFN2SnYvay9DMGxUSHRKMG5hSGNwWEx6Qksx?=
 =?utf-8?B?N2Jka2R3SndydVNhdnRqOC9RMHloTDkwSmNyUFhiVEtsbnF6S3gxazk0L2hr?=
 =?utf-8?B?UFFPelpyZWNMdlBZYmcyYmNyOW5mSXYvdkJYUUZ4SDRGSVRObUZXQXBDVUdh?=
 =?utf-8?B?a1N0M2Y5c2lGQTgwTHM4eWh5UjcxZzAyeEZQMkdTaXlHTFRMSE02RXdqRC93?=
 =?utf-8?B?NjJFYUt3QTdPYnpGRkFEMnRGeUpNczJrSGhlbHFvMWxxZWMzL1BrMzhweVgz?=
 =?utf-8?B?V0dzWTZvSTh5MUVpWGllOGhlc2JKNGJsVGpmNE5Qc0xndVJucFdOSVFWbkVZ?=
 =?utf-8?B?VmdKOG13OVRUQTF5Znh6SDhHV2pja0s5R2lJRTlYTWVOcmk2MzdiS1pZZmZ6?=
 =?utf-8?B?c3A4Ym4xd2U2MWpmUGx0cnFTV1V5dWdvSkVVcWFSbkovR3JWMmFWbmZlc0xn?=
 =?utf-8?B?VG5uM3ZhRWE3RjZMTVRKL1B5ZXZZM0JTcVl2RDV2K1A4dEczY1RubXBLVENC?=
 =?utf-8?B?VFhHK3g1Q3VSdithQVdyWldaandiRnNXR25TWlNkZllqaUxGMHhqdTdtai9X?=
 =?utf-8?B?cXlJeVdBdVErS2t4b3cwakpMbGZvVzBiQkhaTG10aDI1bC9pRXJ1VUh5VnN6?=
 =?utf-8?B?T2UyUDNRd09Wc3ZWNnVVNjFwWHg5MFNickpjME5KTGEvby85ZzVoRjhGa1hv?=
 =?utf-8?B?K1M5TUVTUzBQV0d0RkNKRFd1VzMrdzhMZ2tpbzNOVlFabUczL3AxZ2I3Z29H?=
 =?utf-8?B?ZlNPVE4zSFBDQlJvZ0l1UitVbUJmbVNBWE9zRzVsamVBQTZZVklkanNOV1M3?=
 =?utf-8?B?S0phOG5VeURtWWlhSUZmOUd2WG0vOXF2VHg0VGxFMDFyMHBlTjNBdEZlZUZo?=
 =?utf-8?B?VlJRV0YxaXNnVTJsRXZJSDRxTi9pdXg3QU5oQ0dxRFFzYmRzZmxSQ1daaHBz?=
 =?utf-8?B?NG5mM2NZQ3hiUW0zZ1d3ZGswejF5TnFSUDJXZk1TT3FxeVptYUwrcDNtM21z?=
 =?utf-8?B?bWtGUjErbVdZeHRpenRHeUpuK0wxU3I0Y0xBdG1VWnhqUzFWSWdMYVMzTDR4?=
 =?utf-8?B?NEZ3VFl4dzFmR0dBNEI3ajcrWXhXblhCWGNOcmxZeDRnVmlnZXBLZlIrU0pq?=
 =?utf-8?B?d0pReWFHQ0VOSyt5Tm91MUZYaHRBTTJ2TkNteXJ6MnV1c0t3VHZyWlNXcFA0?=
 =?utf-8?B?TmhPVFQ3SzZYOTNqU2VUR1hzWE5DbnFXUG9Pb3d0NXdVYzNacE05ZzNqRUdZ?=
 =?utf-8?B?dnBuRERhc0Zsd3lIMjlaUzFuWXNKb2tpdVNuanRrVTlhNGZXRzNDSFQ5Qm1i?=
 =?utf-8?B?Rk1jMG1IRXJNWE5vcmgwNTAwb2ZadU53YUx2YVNNZG13cmhwTzRvVlZ0NHBZ?=
 =?utf-8?B?c2RUeFpNc2F2OTVQWHVsRktsU2orNndzQjN4dkI2dG8yT2J0LzBqb1J4YWFX?=
 =?utf-8?B?VWprUTk0TXpMeXp1YU5EM2FxSjJVdXI4czNQUnNLdFR6SWNwSnZreTVtT1dp?=
 =?utf-8?B?Uk5OZk9GaUVjVDYrVG5UcGxsQTRFci9uQ0szN1pKY1JCa3U2RG1wV09aRGE0?=
 =?utf-8?B?ai9pZ01DYXNabWludUZKUk9CSzFnVkowdHpkN3JWbURBZjVvK2JYeXB4THhS?=
 =?utf-8?B?cmNYUjBTUXNhUExjSUNXZUtZSzhwaDR2bDNiTTNTWFF2Q3dSb3FlQm1hbHlC?=
 =?utf-8?B?S0dpL1FkcVkzK0cyMUJWYk0wakpRUFBiWnFvaXlrbmpMY0QyRHpSYmxnc1BI?=
 =?utf-8?B?M2xHOFZmRUJaQmdRa1U5NHg5N0Q5d0ltSGlOQkxlSUNKV3dnUDVhd2JIMjRz?=
 =?utf-8?B?bDBxT1BXd094NHAxYytYa1k0a0dBbkhlOXdTRHNEZHFyaWh3dGlkM2tXeCtv?=
 =?utf-8?B?dnlUY1NHdkxTWTZVOUpRcFFhSWFGTkpTVlFMUmVIU1Nnc3RhS0JldTh2WWRN?=
 =?utf-8?B?NWU4Vk85WjU2eUhsWFFCUXh3SWxJejJjM3YyMGJWRzVrWkRISUllWS9HVExP?=
 =?utf-8?B?RlJtd2gyNUcxc2xXZkNxYUNXeUw2V1c1V2p2azBYVVBhcGpKckZ2MzlnZFpn?=
 =?utf-8?B?dEhrRXdaWkVTREZxMi9BSFFBNzdtVVltUEhra1A0Y0R1dVhxWVY2ZDdKck43?=
 =?utf-8?Q?sAe5jUKCQk6DiuE8=3D?=
X-Exchange-RoutingPolicyChecked: lZRjcy7Udyc29W9DDuAITMZgdv6uVysHkRIygsY31XqONVeDgnY3RKSt5qVWEUajjb4YBdl/AB5t9EB6jK0vHxAnCrb7tqiHbA03JTBjZZWWXFsJTZ8/eCEdOC1tTTolOYBWUKmA9ZICfo4/Ol9RZ8MYHkeDnTYF1UfZtKhs5SgbD84Kq+79sZk/5FWUFCiPsuZqKdfTHuDA5UW+R/FSFMPJXVv5X7pa9QRo0Bd0IbMc9JvSC03a+5YEKRHbVKOai3hxWwqHs40tcFXd/L3gqZ+OOWFJukZFIUY89N9VA7t0Bnjl+f1RyZtXaeZgztc5rVPKFY9OLatjJIe0nprrDQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bdb2acd-a2bc-454d-0f9f-08df25ddacbe
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 08:16:53.3171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sAkp1aZPXB7aN5DeGIGnkuJbtNQ7CDF7zX3h/KWlvQm4P4QiEcrQg3H28Z/bhLgP4T1qtCiTvtazcI3yU2Kozpesshx5fpH/BvMnQ/bhxys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8339
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_091706_707603_62C892A5 
X-CRM114-Status: GOOD (  19.83  )
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

On 10/4/2026 8:03 AM, James Calligeros wrote:
> From: Martin Povišer <povik+lin@cutebit.org>
> 
> The new function can be used to deactivate controls. It is something
> a machine driver may call in fixup_controls.

> +/**
> + * snd_soc_deactivate_kctl - Activate/deactivate control matching a name
> + *
> + * @card: where to look for the controls
> + * @name: name
> + * @active: non-zero to activate, zero to deactivate
> + *
> + * Return 0 for success, else error.
> + */
> +int snd_soc_deactivate_kctl(struct snd_soc_card *card,

The name sounds weird with 'int active' in its parameter list. Either
pair of wrappers:
	snd_soc_ctl_activate()
	snd_soc_ctl_deactivate()

or something of snd_soc_ctl_set_status() sort. I see that sound/core
uses: snd_ctl_activate_id(). Perhaps snd_soc_ctl_activate() is winner
here by being cohesive with sound/core even with some confusion around
'int activate' part.

> +	const char *name, int active)
> +{
> +	struct snd_kcontrol *kctl;
> +	int ret = -EINVAL;
> +
> +	/* Sanity check for name */
> +	if (unlikely(!name))
> +		return -EINVAL;

Not a fan of unlikely() in not performance-critical code.

> +
> +	kctl = snd_soc_card_get_kcontrol(card, name);
> +
> +	if (kctl) {
> +		ret = snd_ctl_activate_id(card->snd_card, &kctl->id, active);
> +		if (ret < 0)
> +			return ret;

The if-statement can be dropped.

> +	} else {
> +		dev_dbg(card->dev, "Tried to de/activate unknown control '%s'\n",
> +			name);

One line.

> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_deactivate_kctl);
> +

