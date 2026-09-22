Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF82C982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j7KSLUk7rKqyy72KK4YGR+UvKHMrq/M+XADMiZj5/Wo=; b=keVtIQL5eJZv9boTDmEkXBW2n0
	OEPTlq3cndDVleqIB6WpTNkA1LJsCWnloafPwPlkm8Ov2RctbuTkn2vfm6S2ckSMI+VgVY0uHmVBV
	gPiksTF5W36vZQcYAfPN312iI4PD7JJqduccgNvZwKqB8DIC7fmX/vbxcJ0prcTLxsOMHv6nBWPsG
	RfS7avQnZdl+U372lI8Qd+N7MogSyn8c0v/cabkxHRzmukUTaAJi9BWWN5+CJjXsPe/P+JOuRoEkm
	zCn8ipUWU175xHmlbk+lmn6DPtLeo6ejeoLot99pyHzJJfbqdfpN/MkzPMZeog0t64evrG3eAzq+K
	YyToOiQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vSm-00000004bKh-22b2;
	Tue, 22 Sep 2026 08:02:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vSO-00000004asr-2R4Y
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 08:02:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:CC:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=j7KSLUk7rKqyy72KK4YGR+UvKHMrq/M+XADMiZj5/Wo=; b=Jbs3Sq8Jot+Aqtk3uX9p2K5Ksw
	wzZiv3JtJd1JLRRMeGSXmoHw/Cu+ts9jJmJ1tuTPdPNNyldZzJhKEiF+uOhLKJq9k6XNoUZDP2v/x
	SCaZWILwhPzdfy3vOlcGcAS3YZ8d/VxzquMRCFK0mizQDJJQEvzWCiJs5b/d4QvXt73psk1/tSbtb
	IQuiHqIhQV2GC6U5aeZkl338+Y7vCeQE/bro/H1ZmX+6R/WLyJoERMqi3uFNGdrQGCZv4/KwUAK3j
	mgeimPPZBmNVs+DCM7md+c+7QcSh0eG9YovfyjswtzgGOGgCzTjP/j3fRcWYNNZYubNbdbx9oVCqw
	LvHYJTcw==;
Received: from mgamail.intel.com ([192.198.163.5])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8vSJ-0000000DEqL-3PNO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:02:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790064144; x=1821600144;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=h7WXmbzlEhrH2EvdztPXGL/clsI6K6nxZzDQRA/HTG0=;
  b=LiaL4BwuVZ5GcPVL4FlYvc2DUwdjd1FnHQxJkG+VJhFubWiSxz/bDa7P
   RgHN1wwva5v15sWChuLLbnXiL7dA+WPyqxityDQp5CljkrX5K0TsdIPyy
   gIZ7/NtTJSbEZ0f8wMSXGdU2ExzQowVlL96Dba1VzBasOrm93fVmkpY5e
   w7V1D2FilifdSvQ5wvhuXtui9CU3GOcqkAdWMUJE8ve01a8K13gTbH38U
   c3ivCoHhgdYDghdSCSqgrEsQm6qnNfLrfyPjpN8hwEfo0x8GICcu6Cl4e
   5UsHXtKSuuVHpbJmLIwmqnKxGYpiAEb0nMtVVrNmTNE/6lHnXKoIPedLd
   A==;
X-CSE-ConnectionGUID: UYlqe9kXQ32SdZSwA+0Y5A==
X-CSE-MsgGUID: rrTg8G7mSsuigvUvDqrZ5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="1147313"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1147313"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 01:02:18 -0700
X-CSE-ConnectionGUID: X42xkozTQeCxd5kErIKpJA==
X-CSE-MsgGUID: /hhbHmm3Tp+WhCd7XYT8tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="272227034"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 01:02:17 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 01:02:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 01:02:17 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 01:02:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GXYYoPzGiXc4/sC2I6c1zmS4xxnX3JEwblUetrdCmh/g5bBQxwgOsb7ueBiJNODZ2Ywb1APPX2cnn9vynrcUhSckL/Sk0TIgsYtEa4Pmiq5z8nZp23ZoLT7yzjHGJwqRFASFFJQ184NTWW3UNvTW1RbRnpd3/YGqax+gPydlGn9ZU7lGn6fgcHoLVjatC0Ziwd/YsNKEM8exi/dI2HsfV970dwbTV+eMg82AB659VAeVKzFr9yK4XxUeGFnCJIykqwyTIWGnjZeeS/JcMqw/v/7zMzW9ijnhpNJzlUPglnZ1qanxyh/BQ99kjmPDxek5oxzB49rrC77GMyM0vqwUhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7KSLUk7rKqyy72KK4YGR+UvKHMrq/M+XADMiZj5/Wo=;
 b=eYIYWTm1s5UJ0fWOsZo+fyBzbkWxhv8vJjh3z82qW+nHh6PA3CotngWgP8KvgZKnu2wr5e79dSVcATpEb3NC6/eyZ90hVA2WQlq/bWDiyIFbSiXVHX32tGktCPtvjDF8SRvIY2jn5b/A6dn47d9F4kG/t2t3n6DjotC5nZnmu9YkBuokwsQf0fww6DBd+IygI2tJIUet+NsF5wmve5wEkeX2cpzCP8+ADwZNPAdqfyAfDs1UicQ8pyd8JCaLLAkHEtUrgZqNx4mqatOYsVRiyEw7VAp6/2JMJHd6LAPgj8/cYL7OdhD5nD3hgOTmMSM2CQAKlLach+86MDRpFv6loQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by PH8PR11MB9856.namprd11.prod.outlook.com (2603:10b6:510:3c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 08:02:15 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 08:02:15 +0000
Message-ID: <eda00412-92f6-4fce-b5d9-95e278aca04c@intel.com>
Date: Tue, 22 Sep 2026 10:02:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 15/17] ASoC: intel: boards: Switch to use
 acpi_bus_get_primary_device()
To: "Rafael J. Wysocki" <rafael@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, <linux-efi@vger.kernel.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg
 Roedel (AMD)" <joro@8bytes.org>, Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Hans de Goede
	<hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, <platform-driver-x86@vger.kernel.org>,
	"David Rhodes" <david.rhodes@cirrus.com>, Richard Fitzgerald
	<rf@opensource.cirrus.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, <linux-sound@vger.kernel.org>, Shenghao Ding
	<shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu
	<baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Vijendar Mukunda
	<Vijendar.Mukunda@amd.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, "Mark
 Brown" <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Binbin Zhou <zhoubinbin@loongson.cn>,
	Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg
	<westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>, Linux ACPI
	<linux-acpi@vger.kernel.org>
References: <7995179.EvYhyI6sBW@rafael.j.wysocki>
 <15844908.tv2OnDr8pf@rafael.j.wysocki>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <15844908.tv2OnDr8pf@rafael.j.wysocki>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2PEPF000008B6.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::689) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|PH8PR11MB9856:EE_
X-MS-Office365-Filtering-Correlation-Id: 00a02361-d465-46b6-bba4-08df187fd0b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|23010399003|376014|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: WM7vzpHu9cuM8cKYLRqyXJYZb/ZBro4sbvbtHzhMDUWurYyAcjG4S9Vr9xzzIc+po3xn6Ck3ng95mrpnmDQoskfu0Iyrng56zLeNcDOnhtsvaDvi6q+s0b74zkCW/vHnPk/bDQefaGFmL0/bOAcl6EoHFu77ycVZL+SRixNqlsMhMlQakjKsXxwDSVmXq+oR/2hg2w/YqLajpkZ/mCvdhG17Yo68aeSblwfD1iWmi/S7Wi63l8wGnkYRLnP3H/KJSM6/nFLWZ7YLzwp+CB/A3XbWGU/zt3ysPaLhZOnFrLRCGdODcIwIzuAtxt1orSkA1UqN6ctklU5BX3ov0ycXRd3zgL0EVjmMBMeOzlTynYZ4l7PeaJk4HTarln/EQpFGt6grzcUrGzn22+8lU0x8JNlJS3JfYZWYJIq053ZezNHhW/vDhPfiEBQPKYGAWqgjlRc3fSusm32+uNIf1jdQ5X3yBSnLTrPg4wMUpJNJwtv9UTpjPt+VApt4A/R2gw1No71TsUYaElM7OqLGFTUmmAX8WobBwU9XBLVCgFRP1jxQfZBSSjuY3fyHBos8bh2Q5OO9RHOwL3tg8F3l7mxNxkzSFggZtJYweDJist76fqAfXMXFNa6JTvM8yy67S7a2Tp2BIrsuJXXeoeI5VODQ1Zbz2K/H/TwXIpeS9vanUPU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(23010399003)(376014)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTFTbnhuMjB3VUN0YnJ5WlM0L2NnUHRRRG5qOWMvL1Z3RWlsTTVBUy9ESEJm?=
 =?utf-8?B?UE01clBsb3JFL0JmK2tTelU2bnZTWkgyMjEzeTFRY2IzVkJUbjlndDZIV0xD?=
 =?utf-8?B?dEJwaHNhN3VUdURtZHlGR2VLWnRtdEpIQ3pZd3MzY3VVc245a3hyN2g4ZVBS?=
 =?utf-8?B?Y0RwQTB6UjJXY2NFM09McTkyL3hwanZtcUhuN3Bia0t0MnNCT3VCRHJ5SHJx?=
 =?utf-8?B?R3kzTyswRDMxUGQ1cE93THlKQXRaTzZrekpCL1UwNlczUG81S1JBZDZJam5K?=
 =?utf-8?B?eWk1UXEzWENxeSt4Q3RodlgyRWNWeHMrOWtzVnhMZkNSYWxmVGhEYXR4WWVw?=
 =?utf-8?B?Z1ZuOGJXWHY2Um83YmRwRHFsMHZJNU5UYVNISFg0ejJ1ZkZhQ2JKa2ErTjJz?=
 =?utf-8?B?UHdOdHVHVmpXM2NiNEJLckl5ZU9pa1NqUFFhbXZycEVqVGVVZzFTU01wcmZL?=
 =?utf-8?B?aDl4dXJCcVN1WU0zMUYwWTczOTBDMmp1bG5BalpuQ3lCZE1tRnRvdzQxWjNo?=
 =?utf-8?B?ckdDd3pCaDVvcExuRjlaR3BjcS9Qd25KNWxQZnVUUDR1bEprZm1BN3JhL2ZS?=
 =?utf-8?B?L3ZsOGh2b1ZvS2hRLzZPMy9RYytkQ1g4SHRLNkYzbzNpRXlJR0VrZnJxVkxn?=
 =?utf-8?B?UnpieFFIV0RYSm4ya3JDOVZrV1pkeHVyaFhUNEI2aHpid3Q1dzd0VXlvUHky?=
 =?utf-8?B?WFAzT2RVYnFGc3NGSWFmZktjaDhFN2k1NWpNZXB6MTdaTG1LMitwdk93cWNt?=
 =?utf-8?B?MVY1NFMyb0FvQlRsSGlTTUtFNWVOVmttUjFRVk1uZFFtaE9RM3cxNkRsd3J0?=
 =?utf-8?B?dlVHNU5uc0tLOUdwbXdEUTdGaFlrVXJISzBkNDhlU1cydWdNVTVrZ0duOXlo?=
 =?utf-8?B?TmpZZ29PcTZoOTA5azJQeVBBVjhMaVo3R1RiWG9mWUYwVk9rQzRNZ0pYVDkx?=
 =?utf-8?B?VHMzMkpZTmtLM0hndDZHVmxWUXFJekNBTU9FQ2kyTFk3dXBUWC85aTd5bEtV?=
 =?utf-8?B?SFBSdmtBOTdTcXBZMnR5MWZNeXdOSnM1dlVUc3RvclRHRlh1ZU96Q2NMczZm?=
 =?utf-8?B?Vm9zdTlTU093b0hsRXZrNlBTVENsTGN4Y08weGc0M29hUkppMmQ0Uzlqb1dw?=
 =?utf-8?B?aytKN1g5QTNDcDZ4NFEvc2ppbnphM0ZlZU41Qk1RRDVWaWx0S1lEZzF2anh1?=
 =?utf-8?B?NGZ3Q1F2RTdTMVpjMnVWQkxlV3VWYjJTampqUHdwQTc3SnB0V09ZMFJaQ0RJ?=
 =?utf-8?B?RzZnUEJ2R0thUWZQN0xkQW54aUFBd01WM2dxYzZHM2xmSUp5OE9YRTByaktD?=
 =?utf-8?B?d0padEcveTlmbmlERzltTCtKSTFEZUsxQlFoMDZRdnAxM0tteHNuVGV5RkZo?=
 =?utf-8?B?alpLTHh5K0gwb0dkNjRXWlFoSnV3WkF0UWxoYmFTN2lpdWVVSkNUWHRVdzhz?=
 =?utf-8?B?NFNJZCtBTXFYYUo2YXV2cmFLZUd2VTJjTXY1WmZkbDZwQ1hDSm4xSFlKZGFv?=
 =?utf-8?B?enlyL2Q4YkRxMy9vOHh0NkhtUDRzcDAreHFuOGJsOURKc2ZvMWRuMEQ5dXFu?=
 =?utf-8?B?b3hvOHhVSTErWGlvekhtNUR0SG1STVNQaGdYYnpTYzc2a0pNYU9salpReWgw?=
 =?utf-8?B?T3NrUkk0cFlURkxSWnduOTZoMlZsQllPblVqanFsMnVGRFVRclU1N0hQS1VJ?=
 =?utf-8?B?UXJBcjVsS0UreUFaeENtenBuZ0dLUHlWdzZzUHVXU1FYcGRMdm9VMDNWMU96?=
 =?utf-8?B?WCs2d09Ub0wzS1cyMU0zYmozcDN0Y0w3T1BEUmFJQXcyNElqNkRDOU9hakpW?=
 =?utf-8?B?RkN2dGJyK1pnamNsRk13eFJRMlAwaEIvUndpckl2U0d0bzliVmxobmQvZ1Z2?=
 =?utf-8?B?YXFFcXhsZkFTUkpXRVpnMk9yQ1dIUWE1WTN0aExDdm1BdWtXQlBtUzFoeFFC?=
 =?utf-8?B?QmZzZUFwL1h0K3FSU0hGTWlSaFZ6Y285dUFnNURJUnEwcnhHNC9VVFNPRzRq?=
 =?utf-8?B?S3pHbzhNTVNiK2xneHpMSlBBOGhuV3k0bERsNkc4UEVSVjFOSU9MbHF1cmVM?=
 =?utf-8?B?KzRseHdQb09qSHQ5Smd1ZTBxQXVYVSthSGhnV3Y5K2tuUSt1QmxCSVNLSjlF?=
 =?utf-8?B?ZXp4ditCODFNYWl4T3VSM0NVMFNWaGx0SHpMSjNoS05yTHRZdjhTRXRxZVNi?=
 =?utf-8?B?UVNoYkR4T2I5ZE5heHZ3WG5XaWJFY0hZaEozM0szanhzclYyN0RtcEkwY3Fl?=
 =?utf-8?B?SWZlc2lqM3pjNVJDbmV0NUc1b043S0VJK1I3QStmZVo1WWdGb0xBRDU4bkQ5?=
 =?utf-8?B?WWM1ZjBzS0ZkdXpYNDBpTTdsYnpQcWMvZzJrQlBmQVYwNWZTUVcrdWJIR3VF?=
 =?utf-8?Q?3ecueQL5OpFfFoMQ=3D?=
X-Exchange-RoutingPolicyChecked: vb/Q8pYiUIB2ExgOe3LG1ThWLWhi+Z9UFIfRLT5z4egPaVGQ8GJz/gIgqpeSenk0PFDH1fol80LeRX90V93zUox5dBS0ic7tr06SUXrsXxXhFQHUVX4qeHv/bTBBar0OHSWiG2nu+/0HzoqKP/Ah6rkDXVqpFsEPzOQdr/4ahvVtucnTlwAtjoojCV35kbeQq0ElOxUzN+UX+5DEkog5CCnKo7zeBKYJWNh6X9s7gcLI8nxpMkWgF7pZrwyffA2DrxWgDUMsuGyQtf+qCqVMPRtFi67IGiOtALjojXy35zPSfhJgZk0SpFq4AZv9fpJQHnVHzgh4ODO9FB+s5fHlAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 00a02361-d465-46b6-bba4-08df187fd0b5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 08:02:15.3686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MB6n9VNyjdECST+8c3PwD+WakaOP/Y4wHwdQsPMB9xSfY80YDp0qWvEuisg4frnz4jt0hOSS2W0qlLdBlAQ8zAAMdabg4h091/vbhex9BEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9856
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_090224_748292_6174AD56 
X-CRM114-Status: GOOD (  11.80  )
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

On 9/21/2026 9:55 PM, Rafael J. Wysocki wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> 
> Replace acpi_get_first_physical_node() that is slated for removal
> with acpi_bus_get_primary_device() that takes a reference to the
> device it is about to return.
> 
> This addresses a potential use-after-free that may occur if the
> device returned by acpi_get_first_physical_node() is removed right
> after dropping its ACPI companion's physical_node_lock in that
> function.
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>

