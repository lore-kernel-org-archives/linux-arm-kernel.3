Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA33C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 07:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:CC:References:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uFnbhFQf5JsKgq2s7b5UpmbTFqLs+qmV3WNCSU0Veag=; b=I2Z2IKqY/ZKQmbjAW8jlj5EVT3
	iurFMUNG03vTCEKMLx6n7Rp0J+PatqGaoxCoP4ph3eNA+gu1VWYdlBDH+Y6rrGkg02qf/4w1iGkIy
	xAcy1LDjlQYzIDCXw1MqKBX3Rkl6Z+fIuyzTKqcaBRW+2o614B7QD+Yb8Dm/XDE4WW90mxXhxRiDh
	lpLniaKjJ8YZUEQ0zdCoifKAyWhfvqBXzmTt1XUae8+tGg2XFg56eKdTlUeplsEjfFQCL1kbYOFRg
	kGAXQxFSXjsIvSH69ET1E3WqFQdDLMLVLiSWQDwMmnKNVugebg8oalGyeI9Yzxfs/4DN6u9Bzoa0h
	+xuJ/s3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPbt-0000000HZUI-1OmM;
	Thu, 13 Aug 2026 07:12:17 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPbq-0000000HZTp-1JAs;
	Thu, 13 Aug 2026 07:12:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786605134; x=1818141134;
  h=message-id:date:subject:to:references:cc:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FwLiSt8zlRNkb1BMM5qF8qOeze+cLQCCGLHZ0huiBRk=;
  b=fK86Fl4u5Cgu1dmqN9woYMWPAPnLjSfypJWczNGZJEMxWZE7xIfHgtJl
   juzKxsrZnSMErhROgjqBoC+dZ2KR4PDZhp4TRPCAq6lUJMzHPhjG9OJCD
   2/4FXWOYRKGtVAXW++bNIitQ4xLlDKGbMUeSeMs7p+XNuuDqxxHO5wc+4
   0CEr1qpdkK31q89EAsfUiaBB1HSwFS5D7M2+mzqb7HCOSa8jxc3OMu/6m
   hUD2ZhzdN5sEFAenQuWzmxYym7pNKnPURD2kHWx3Fhdb0SM0g9BuYSNcN
   CBSU7MK90cPzd7w2xNQD0k4ZUmxJLHvNHBi5Y0oyjivfxnjVYlgYTY7Mx
   A==;
X-CSE-ConnectionGUID: XBAAbHy5So+/v+WjFj9Vbw==
X-CSE-MsgGUID: DN2yyfeSTWioA5nNh/Vi/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="91047258"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="91047258"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 00:12:12 -0700
X-CSE-ConnectionGUID: x7UzEhRhRc6YWQbE/gM9dw==
X-CSE-MsgGUID: TcpR7rdLSh2LfuTjwyjKxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="302123644"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 00:12:12 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 00:12:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 00:12:11 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.45) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 00:12:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7ZgFEvScywKUYPFb4RPLS/OJ1dAZE7u209/OBzA9ObdOHr/BTb9jY5EzcPGyC6KUgaiuXGR86x2oZdyY8jkuVTImkXWV0mD/DYY4pth8VuZTIIHDCcF7Nh4RuwZxCrnQuoCUAGEybpXpOx83dMggajrp8OK3v6jGi5/s5Juk6ef0lA497FF90UU0YSEZnDPKQfDew++z5KAN7Xp0vhZB3bF3gH5NpHEEEo+lbmeRaDDaGpGZQNCf5NNDMLHdQQiIvEXgQy38kZPfQOgcimXx3zflyRQsOq2F+L3gfMQS3ZUTobrEv2YYe9JDu9S0drMlRNlh4fFxdH4uwdZ1+XV2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFnbhFQf5JsKgq2s7b5UpmbTFqLs+qmV3WNCSU0Veag=;
 b=wl10KAh/1qs544MKne8U0j5SvgJg5bfTgWAlviixWEF0g1DsTRvJ/8G6io3/JeM6Qhp2qvvsF6L5jAGsquLiZ0WCUerMnWXm1pIfMr0kJmFPv2FkQfNLVQ/aPifXTzoCSXFyB5oo+h8Zem6BiU5AC/1UkSwRsozOVHMwl9yXXinWqV8zqzaKLsyGJVsb3yY7IVurMKnxB5ZwiC4YS5vGeWDNTgMI4qkWdBCDMNsGuAZnv0TTGlAJOy6ou7uTMCDpyEOyTH5MqLiLFqmnMYXP5UFh7mjxgrmVqopqg9aZ/f3ZeylVmJCqXwE9toQKJMCmQHJteoK0AJz+/1XGjWrVjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by CO1PR11MB5155.namprd11.prod.outlook.com (2603:10b6:303:91::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Thu, 13 Aug
 2026 07:12:09 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0292.024; Thu, 13 Aug 2026
 07:12:08 +0000
Message-ID: <70c968e1-8e48-4765-8fc1-4468350babe2@intel.com>
Date: Thu, 13 Aug 2026 09:12:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] ASoC: Add support for Airoha AN7581
To: Christian Marangi <ansuelsmth@gmail.com>
References: <20260807200936.201827-1-ansuelsmth@gmail.com>
Content-Language: en-US
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	"AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>, bui duc phuc <phucduc.bui@gmail.com>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260807200936.201827-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIYP296CA0007.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::12) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|CO1PR11MB5155:EE_
X-MS-Office365-Filtering-Correlation-Id: ac9fc6ca-b0d5-4c82-beb0-08def90a3024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: Qhahj5AkRmnJ6ei3aOPS7fI/vRshr2zAe7vqLbYe5x9Gu/hUqpNS9PKBzLVqJ2V+8q26Wneh2SSHdODuDGBjqTY2ZXfTDRzT9RBwMCJgbsQQlEnatobgsTvfQQx0ZdHZ3aZgmETl9cGo6HDlzBHSQz3+b0mCWmV4q6HccDAUDZq5AUVt2+5gBCM2T6A2t2ncS8SM1lEcvJnEMyMsHFUH429yGOF29k5W4EwwsrecQBhLQtWDy/rmhkFNzbizasrzyLIDjQ8siQjHsXM2PU+D55vpsxJb6wNqb8KQD7yLh9K/6V6CrCbB1/oDWRq13ytZUdrMLVv5MoG1PX7Qb6mWPHBxyuYxB+QLGV+YaxK4w4C711Ve/X8Y1LKT8ZA2KAcYY73blqJwG+W93tbtN5I2rdoXIEZtgnIQ0eeA9u6f9lWjI8J5H7VgtBRjtyEi3qgrfIMMfvuqX+vlC/wxztq+CdqDP9sE5z52UqySOC6bo1+CxYfxJfl/xqI9TCGkvj47b2J7E5byqu+Vkdd0LYto/0f+MUU//YirNASshHwpAAcCSUb7jWAtjqYjUYEd2dvBjdMyRORU5A5q4vlOl0y+5fPmGIWn+bRsnKfqrPnJVqUP28ZozPWGu7uBoQDXyoC4WmfXOoUJwC+fJAL2z+0Y/pg4Upn8hGaG426VeUQWV24=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUJxNG4rNlBPQlY4UGhSY2pPUENoL1kzbWhiZS9YWnJMVWpCdmRWbTJ4c2h4?=
 =?utf-8?B?V0VlTkpVN2dmdzByV0VKS0xCcTB1bGtMRnA3T2F1Ym82YTF3dk5sZWc4YXpr?=
 =?utf-8?B?ZDJlY0hrS2VubzJkbGxXVVpBcStUWGlYT0tuMDhlZWd0OFNYS0N2NFRuMmpC?=
 =?utf-8?B?am5Kbk80RVh4bHJ6OGZCeVN4cmxiNjFYNk5OTXBXSU9kSlIvTDFXY3JPbjVz?=
 =?utf-8?B?aHZ0RjJrRnk2WElaZDBBd012TU93YlZ0ZUZOcVVwNVFSQXpXWFRPSnpnVGtV?=
 =?utf-8?B?S0JzbG4yUzdaL3R4Y255U0RjaDQ1bjdUOGo1YzNZWWR1clZpK1l5L0JOL0hj?=
 =?utf-8?B?blc2V0FqYTUyT0VvUkxoZStDUThBY1dzbkdxeUZDa3NBSDBzaXVsZ3dxc2FF?=
 =?utf-8?B?Q0tqdWxwcE1OYTFnMW9DbjQwOGZ4cHVEN3ljTUxBemVHY05kTk85K2t3UEVY?=
 =?utf-8?B?Q1lJNGk0NHBNLzdGZDc5Z0FZd1JubDIwK2daZ2E5QzhNd2dvdmpwUGlaQUkv?=
 =?utf-8?B?R2l4QTBEc0tjMitHTTNtSm4vWVNkS2pFODRyZnFvWGYycFpuWFRaUkZWN29w?=
 =?utf-8?B?RENoWlQ3aG9vOHEyN1JQNnN5cUVSNzNIVnZ3d011NEYyc2ZXamFEeHBJRzVK?=
 =?utf-8?B?Ykx4VDFjZC9RbzJ0L1Azc1YzSnNkVlp5dDBSWkVmV0Nab2FGMlNvZmZsZHNi?=
 =?utf-8?B?Mm92ck1IR0ZWVnFuQ3dsMnAwNmVneURkMzlZQmh4MkVtMnhadDdFU1JUeUxh?=
 =?utf-8?B?YVdtUmlaQllaU3BrS2dydnpHYlI2TjNLeVF3SUllbXh5eGdyOXZrWVZLRjNv?=
 =?utf-8?B?MkhwYXpDa0Z2YVpjaGN1MXlMc1REanQxKzBYZUphWXlDSmFpSGhDckZLS3Y0?=
 =?utf-8?B?UW1KeVN2Sis1UUF5WEJBOEFlQlZMUy9GN2NLb1hua3JHbUpVU1kyY25LY1dH?=
 =?utf-8?B?SXlha2kzZHlXNEw1Q3pyNkZHWGpLUFlKYmhwRTdlaTZoVDFrZGxRRnZwWjVL?=
 =?utf-8?B?U0lpOTJEYzRDY2pySFI3U1ppL3FxT1NQcUZNRXl1WFR4VjM3d3ZoQUt1M1Zj?=
 =?utf-8?B?M3JjNzRtY3dCUFhsaEZ3UFl6a1R1aFk1dEYvbFo5Mml6ZXUxcDFiTnhxRHpJ?=
 =?utf-8?B?OTZvREtxM0V3eHl0cmxxQkZxK1R1WFEzUUFkRWZTeHc2d3o5a3RuN3ZBeEZk?=
 =?utf-8?B?Qy9HdkowRVZWQ0w5N1dtU3h3aVVRenYrZlhmSWUzS0VvZDBZcjZtMG5FMzM0?=
 =?utf-8?B?U1FHWEs3OGpXUEF0cWE0UXZFaGl5K2tqQ3R2Z1FtaXY2bWYzWGljVFlyaDJJ?=
 =?utf-8?B?S1E3UE1GRjlsNlJTekJrcW1QNzlFL3oyRDFZRHpFZGpXSS95Tk40L3ZDYWhJ?=
 =?utf-8?B?U0hyVE5PWi9KbmwySzZ3eDlGcVJ2OE5GN1VZOWdMZTdnRVNpdWd2UWsyYjBT?=
 =?utf-8?B?NC84VjNWUDNuNWFldnZwUDlBckVzVkFTSFA2Mk1hWHduOHY0Rmdhb2hSaEpV?=
 =?utf-8?B?cEJxVUNFM3ZuVjduK1U2NUxwV1hGVjRJR3kySEp3YkJPYzJUa1J3SWRVdjls?=
 =?utf-8?B?dXJSMmplbExDTFFzUkhUSzlmdlVyUE4wUjBIVjliM3R1RDZOVHY5a1lOcmxZ?=
 =?utf-8?B?SlBNWE9UTkp4Qlhxb21MYnl1MldGMjd2b3B6dDNHQS9QelErWWszZVdvTHZD?=
 =?utf-8?B?QndBMHBMUENDUzRqd2FFRFRtQU4raFQ1dFgvWEM1Q0FqN3ovYzZyS0hsZ09S?=
 =?utf-8?B?anFSN1pCcks5b1FlMnRLWWpENldReTRBUmJ2S3FXTko2STBJeTF5b1l4ekZr?=
 =?utf-8?B?aEc2WWZJeWlONWdVZkhwSnZ6K1hQdTFrRWE4ekpnZlpPczc1Tjl4ZmdtQ2hv?=
 =?utf-8?B?UFg4S1Q0cHFvOFFISGxGR1krblRrRkhoU01nZUtJU2kwMEoxUmhsaU1aQmQ3?=
 =?utf-8?B?WkR1aHd6Lyt5ME5vVk1LMzRiRUJDdjM0eGdDc2Z1TXYxUXhvSE1aMXIyWEVa?=
 =?utf-8?B?dURuMDFLYjBDZmxmb0s1cm9wbFdaZGk2NXppQ3llZUI2c1d4QmE0WlIrMklB?=
 =?utf-8?B?bjFpZWNDL0VSc2RxQm5tUFh5QlhnckNubUtoenpQYS9pQ1JYRWdVNlpyKytD?=
 =?utf-8?B?ZmV2Tnk5dWp0NmVnRWNuc0JNWkdENjMrR3JuVlpLMjhTZUR2OEJUTU1Za0M5?=
 =?utf-8?B?R2JERW1EUXI4cTVpV2tySXNGZk81RjZjcG8xM2pxTGJzV1BlNk8wUG5seUo5?=
 =?utf-8?B?dGU0TlVRNlBCa2xISHg5UXlYRktSdHNReDRjUFpVSmppT1JZMnRHL045dGc0?=
 =?utf-8?B?cFBacCtIWm5CQVBjbXFoMGdvcFJGaDJnWXBSN1JkbmdWRUZZaTJrTm9aZWdo?=
 =?utf-8?Q?L/z9ucbtmiGTWH/I=3D?=
X-Exchange-RoutingPolicyChecked: fkr7Cug4a0vEd3Gc35Q5A1Lp6ee8zEqm6LVZvq1VVHI4GyhTJ2hl+NMS4hEP9v1RpaKCuJUiKyBB1rfr6Gi0iKAEx4feINnlMvdahIB2HZ27+57FbXU45PxsEiC5LExwoIIxfkgphSfPHDghntiAU5usQnENpmMqi9N0nVZGYy+5vi8YtCGkz+ZWPZ0jW9ViH5VtpS8UIS+3vA2sUXhJuWIWfydDAIWqwiiMZQyudQanlhbwQtZnQN8abeaDMRj9WbfLALfzA6tZBMo2KuxoPcZHEg1BXXmoqjaZ9OquVGWd//WbDck9ORc5qbx89RMwURc4ntBQQYAANguqkOyPoA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ac9fc6ca-b0d5-4c82-beb0-08def90a3024
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 07:12:08.8867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z32X+ZPisA2ej7Gu2CMRZ5ao8ZGefvc6sKiap7ybjeDJ/gpGM1yq+/NsSEREnfv0zUFRxwSSs2+T+B2/KfmPo9fpG5JgGDhz+VDmlZBVZhk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5155
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_001214_432469_79E083FF 
X-CRM114-Status: GOOD (  10.21  )
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

On 8/7/2026 10:09 PM, Christian Marangi wrote:

> The card follows similar implementation with Mediatek with
> the codec present on i2c but with a simplified implementation
> register wise and additional frequency supported.
> 
> Changes v5:
> - Address comments from bot
> - Better handle concurrent irq status bit
> - Protect enable etdm
> - Add Review tag for documentation patch
> - Address formal comments from Cezary

Please do include the reviewers in To/CC when providing new revisions.

