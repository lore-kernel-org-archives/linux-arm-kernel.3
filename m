Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA80CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 23:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aYlHDRqjBYatBpUqSlvnDDU2G61Ja+vJ8AQAOO995g4=; b=GnckI0xtMjOewwciTnkVJf701d
	AhvcbVA/N3vJjmn/El5v+1GvUh2qQrIJO42+WTFa5ocGD7IgQwn9WZRwOJGoZtNNrgGZLyjPKHG6N
	xvSJlrEsKW3vlcG3EjfsEYneEHbvYUedKTvGcAaLHt3SZr6jthIg3Q4RFWFYtRcpCDaldH9O4O5PI
	O81vj8/3Cn2k9/Ri4BmRIs221c/i+0lVLAIdbP9tgw5oIOApkWHCqTiSIqpFrS3h7qgKLFqoZua9f
	wmX4k9mfb8aX50yQlFHJhIcyy2P0eFEv7H7rWPofd3ccRokxT6ockTbz6QQ9oh2aQATA2dSGkHfxF
	+fPn/t/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1vqs-0000000E9BK-03n8;
	Thu, 25 Sep 2025 23:58:18 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1vqp-0000000E998-1BK8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 23:58:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758844695; x=1790380695;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=aYlHDRqjBYatBpUqSlvnDDU2G61Ja+vJ8AQAOO995g4=;
  b=RcBj/JDGX6J+sjA2WrEGchtM3TqagCcX5MWVOxkcIdxVd0B5+FAG8xRs
   rh3q9DPDh1fjHJE48+ZtV2xnuKoLJJwFyyiqzDADX/7nJ2/eZEEnKUSFd
   /tOkmMQ3EqOxFFIGeRh8aZVJJMqpdw5DOiv+G/gS/byNixMxOC3IfW24Q
   ZUGgQ3GwO4LUgn5CMFFVViuRYO1rjAZsxW68UHNFKzwD+q5JVGMcy0TgO
   iW9QudKPRvPxfwlG92YpQJNWm11JF/xKJwore8URzqUTH13FJH9SpFDlm
   X9GVM9XNffka69LlfX2IK1wMcRttaPSCbCQhy8ntai9cmnYWm7ytBPAqN
   A==;
X-CSE-ConnectionGUID: g+jTDrfITwOfbFrgZj/ltw==
X-CSE-MsgGUID: Pvr6T+efT4Kq9zla3e4x7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61344567"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; 
   d="scan'208";a="61344567"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 16:58:11 -0700
X-CSE-ConnectionGUID: W8HyFhb8TJesvTUiAMFfFw==
X-CSE-MsgGUID: T4c2Ee3FQfyTpFb6fk5NZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; 
   d="scan'208";a="177519044"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 16:58:11 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 16:58:09 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 25 Sep 2025 16:58:09 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.48) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 16:58:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybwzt9ewlzktEJPeF/Ztb+iRTjxqaHxAY5q9fbk4aJMr2QhuCJ5jdZGWQWBN796LOANR67m3hPvB59xmrWbFoB99S4BaocV04/J0TfBFDUbJ2k6or9H20pE9Ykun1W9j71veIdQt1dNstRY+K3gVRKCIqiAtObCvGa65HpjZv3KXWHbgAZ7GvJvZw3b7WZKR0hWpobiUUZasCXBlHK/9aKfy8WbkLWq3bb4Et1vc4M53iI0JeUvWyzHxAtX9KShwtbxpDmI/76dgllGw04Zie0EgBqjWbNPW6VHYrtXQuTw56nVEMvVTvtXYsxL2udyIVvy0mBv/0H/nOj6/gmJZaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYlHDRqjBYatBpUqSlvnDDU2G61Ja+vJ8AQAOO995g4=;
 b=Xg/dytn3lwKo8HWAJ15wFK9pK+45aQanfChp3Rx2rP1K/f03h5yW4wxA9vMEX2WN/pu7oXOsrynTfBzqy7S6L8kI5qTl+4KMF8I0mGo/FJ1ebErJY4xfYDRtpMpEpXRuA0HXGOAVROulVMVbvIxmoniL9rd0skTxz+EteTexIISmPJxAMZ7QP5Moopko/nRNhAruoi5gUwLiwINt66nVisKqdv5FxpeQHgb9v33FZ81j2CiTQKZiHb720AWTvKd/bhYnjIKktYb3aBGv7QFk3ezU0fuwM5ouXg7VWA7WPnSsidewK1f/OEBis95JYX06hQeZKNF32V69Ux6wsgBWXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by DS0PR11MB8688.namprd11.prod.outlook.com (2603:10b6:8:1a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 23:58:02 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 23:58:02 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "broonie@kernel.org" <broonie@kernel.org>
CC: "adhemerval.zanella@linaro.org" <adhemerval.zanella@linaro.org>,
	"nsz@port70.net" <nsz@port70.net>, "brauner@kernel.org" <brauner@kernel.org>,
	"shuah@kernel.org" <shuah@kernel.org>, "debug@rivosinc.com"
	<debug@rivosinc.com>, "fweimer@redhat.com" <fweimer@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "dalias@libc.org"
	<dalias@libc.org>, "jeffxu@google.com" <jeffxu@google.com>, "will@kernel.org"
	<will@kernel.org>, "yury.khrustalev@arm.com" <yury.khrustalev@arm.com>,
	"wilco.dijkstra@arm.com" <wilco.dijkstra@arm.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "codonell@redhat.com"
	<codonell@redhat.com>, "libc-alpha@sourceware.org"
	<libc-alpha@sourceware.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH RFC 0/3] arm64/gcs: Allow reuse of user managed shadow
 stacks
Thread-Topic: [PATCH RFC 0/3] arm64/gcs: Allow reuse of user managed shadow
 stacks
Thread-Index: AQHcKvs2dWZnb030BEKK+EDimBzvQrSkY2wAgAAtHQCAAAnzgA==
Date: Thu, 25 Sep 2025 23:58:01 +0000
Message-ID: <ac0ceb09ffaeb1f0925b61ed1b82ee6475df2368.camel@intel.com>
References: <20250921-arm64-gcs-exit-token-v1-0-45cf64e648d5@kernel.org>
	 <760447dc3e5805bf5668e80a94bf32356e2eb2d3.camel@intel.com>
	 <8aab0f36-52ad-4fd6-98c3-bcdba45dbe16@sirena.org.uk>
In-Reply-To: <8aab0f36-52ad-4fd6-98c3-bcdba45dbe16@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|DS0PR11MB8688:EE_
x-ms-office365-filtering-correlation-id: d812792e-422c-4d6f-4455-08ddfc8f5c8c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?Rit3Mk1KYVh1bENIQjhvSHZxdDllR1RFQkpoVnovS0djZThjVmtWcTh1V1Vl?=
 =?utf-8?B?MEc5K1ZnR05nSk96S3ZvNWNPekQvRC9ua0RneFhVbC91TlJEWEd2aUx2Ykdz?=
 =?utf-8?B?cHR6Ymg4dWlqSGVPUEJmbnQyNjZucllXSHpKUTQ3akpZUDhsazdBSmlveENW?=
 =?utf-8?B?MUlKbE1ZWnNJOEJlVEVXSXFJNnowVTNLTUlQVzJieHN0bmNLOFVnbjdjaWRE?=
 =?utf-8?B?MGpEVGtyN0hnbE1CMGF3citpdS9ZQVc5d0xzMXdqczhQUzhtRG5ib1Q4djNP?=
 =?utf-8?B?R3NZTFo3ZE95WmdtckZQT0pKQ1owK2p2U2NrUXdTWHZFTDV1emw1NWFITHdT?=
 =?utf-8?B?Uk5kUXFmN3V4YjBZbHpCdy9Hejl6WkwzMXJPMFRBQ3pDMjc3NHdIOTlFQzU4?=
 =?utf-8?B?SmVoZmtON0R3UFJGNFJWRFp3a2N6czkydDlxNnV3UmJXZnJ5eHVqYVoxVmh1?=
 =?utf-8?B?ZGFJZi9ESDNzbDBwU2hBTHVtWXFSaktqT2o5UW9UeFEvM0pkdWdoYTZCUFdv?=
 =?utf-8?B?djhEZ3lJM0lwRC9kUlRZWlk2MmkzNXZNQ0piNW55dkIyQmF5cW5OMTlEd0xE?=
 =?utf-8?B?VDcrbmFab3N6VXYvWXpGQUlaR1B2STBmYjYxdzVHQzk3R3RkWVVPQVdKNzJM?=
 =?utf-8?B?WWhWRzZFZkYwQnVoaW9hajU1K0c4WmVFK3RlTk1JbHJmTWxya2NzSDJyZC93?=
 =?utf-8?B?VHFNZHdiSEZmR3dZWWp0U3RtM0NaVDRVcnlJTFZWK2hQK2hnYnQ4NkQ0Q2Ft?=
 =?utf-8?B?NFB1UHo1RzhzQVpZYlhIZWM0bVg0UFJpS2kwZ0NnNTdtbi9EdDVBUVZSWlRH?=
 =?utf-8?B?RnVQbG4xU213Zy9xQ0NMVjJ2MDd4ZFU1ZGZuOFVhTjZIN2hIYng3eDVLaHd5?=
 =?utf-8?B?QmNYSzZGWnUvQmMwcEpIMEVKS0t5dEUzQlFLYWt6UjVZcXBhekN3elRyYVd2?=
 =?utf-8?B?anU0dGlqRTNVdkRJeUtQemFZaEFCWFhpNnFZb3NqRFp4RVFtUC9mRFpjMUR3?=
 =?utf-8?B?d2V0THBLU1hBRjdOUmhpSS9MdFZWKytXMi8vWTY5TEJUU1lKTXltcDdIOC9N?=
 =?utf-8?B?R2lPb1JSVnc0N3oxWGRGRkpiYXM4alJCOXZkM2hNMWFaNG9LcnRtQ0p6MVFX?=
 =?utf-8?B?L3g1U0hYRTV4ekhiWEgzS3JsUUIxVWkySFg1RUVmY0pUdjlYZi9PMDBRRG5B?=
 =?utf-8?B?MGxRdzZVUXl4OHE5aURzUFZkUW1LdWI5Q3hBOS9aVWR0cFc4dmgzek0xa0Fy?=
 =?utf-8?B?SS9PZS82OU1CN2d3T1UxT09DamROV3U2b2NWMGFpWVJrK2VIaUFOM0VyM25V?=
 =?utf-8?B?bkJiUU9Id1U0WWcvWXRzVTgzakl0R0loeFRXa3FRU2czMGNQZXg2QUE4eHhK?=
 =?utf-8?B?ckJYTEc5Nit3b1VGcGlEQ1dmd1U3UWNvR3ZlK3d6cWRSemtaWVNzNUdheHV2?=
 =?utf-8?B?dlZLQldWZzltelB0NkNxVTF0dWlMeHd3bUlCeEZzWDM1OEp2a2o1SVhxT0hq?=
 =?utf-8?B?bU4veGx0d1hMVUgyU3NxVEgydlNkQzRBdFVFalVVNk1TM3JmeCtPMG9iVitL?=
 =?utf-8?B?Zmd5Yzk3cFZuWFNYKzY5VzBIajYvblFSRlpqOVhWcG5vaTlkUm9FNEdZU0sx?=
 =?utf-8?B?dE5iNmZpNWdUU08wc1JTeTU1Nys1aVg2NDBBWG1Ob01NRTEzVm9XaEhLd1lm?=
 =?utf-8?B?eEpuSjgzUWtEOTlxeFRLT2VRa0d0cU9SOWF5NjJnVUt5T1E0NUNtLzM1RGtN?=
 =?utf-8?B?L1R5bUdadk1OQkVoQ2dzdGt1d3U5VmFjK2hQdDZmZGVMZDF3dE5nNXFqRFhB?=
 =?utf-8?B?QmtSRGRXbGlya1VlYjNzZkppSCtSZktwTFpxU0hCSVpneTVjbUhmdy8zVW5R?=
 =?utf-8?B?emo0U2ZLWWVSTFZ6RTJSaVZBYmhRZWl1OURWdjJFSDFiN1VDMTYraHh6UFBZ?=
 =?utf-8?B?eHYxWjZZRCtwWW9uU3JXOWNmdGZzb0RsYmh1alk3QU9pNFQ5NTBKMmtSYUUy?=
 =?utf-8?Q?fyiczQVHioJnlS7LLMWb9XRnBERKnc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YS9EN0xobjVFelVETU5JNnIrZ1VpQmtXN281dWh2RDE4c21WWDlUcnZISVFB?=
 =?utf-8?B?NlU1TUYxU01ZZGxDaXZvUTNUWk42YVYyM0RxMy9zN3dodlEvN050M3RiQUdx?=
 =?utf-8?B?ZXZkRXg3UForNXJLNTFjQlZBbVRPSmpDTlBLR3owcW42cDFKMTlBQnZoNTY1?=
 =?utf-8?B?WnQ2cnJlM2VFbWdTbVhsMU5ZZk94S0pKUHBTK3NzcGdZOWNkeXRGK1Rrclpr?=
 =?utf-8?B?U3JIUFNzMi9xZDExaUN3eVpOMDB0c2QxMU5rT21jNFF2d3VzUHBjTS9CRllQ?=
 =?utf-8?B?VGJzeDIvM0h2T3I4WWQzaC9xR0grbWJ4QjNCTFgyNXlZSUNDNDB4QjV5cU5x?=
 =?utf-8?B?SGtjVUdFRHQzcHZLR0ZJblExMlFvZkxmSXRQY0ZBRXFLczVROEhYWk96UnFp?=
 =?utf-8?B?MFFnV2xxUWFkTmRDdlJUSEJlZmVheTZETkJGaW8vUWtURmw1M2hLUGx0K3lz?=
 =?utf-8?B?Vk4wZS8xSHhyQUF5ZGp6VWkySFFMc1grVEpPS1dSbUJJcHY1ZUpvM0haS21P?=
 =?utf-8?B?OVhhS0RzUG44RDVDL2xPMjJ3cUVJNk9Fd1BTZnRaZEpHczVaOVI0MHNHMHZu?=
 =?utf-8?B?WURVK3hwdFd5U1RXZ2xERmppQ1Noc3ZYQUV1YVhmaUxBTzg3SDNZaTMzakVG?=
 =?utf-8?B?eGdWclFtVG1PclFJK2ZDeEgycm1hR3AzVnphQmVnY1M1UFhucElSaUpMTDRa?=
 =?utf-8?B?VFFlOXpmVzIydHcyeVp1dmR3MUJnWWxLMW9wWmhkTW5WcnJ0azVVOW9ESnZz?=
 =?utf-8?B?bVF3YjkzMzZ1cmxWNytqSkZGUFhnKytUNElyaURHOVl0VzFtSGRtMkJsQ0sz?=
 =?utf-8?B?bllEeXlBaTBKUEpvT294a0g2Y1JqbHpWcU8wZU9oalJWL05DcUlzUnlkRzRm?=
 =?utf-8?B?cnBDVERRREdPaUtMdnZnWk5JWmY0OHRxMXhLREpscEpZZlA5a0NJanhqa2pH?=
 =?utf-8?B?ckdBdTc3VnRWek10UHhRYTlld0Z1Q0ZxQWNTTEFmaEw1dVZBNmdQUDlTczE1?=
 =?utf-8?B?VXVMQkhlZ0thN3dRWHVhMXRWNVgrN2NTZ2hlalQxd2hvRnMreW9odGV3R1J0?=
 =?utf-8?B?OW56MUNlNDlwcU1hUWw5K1Y5Mm96ZUZFM2VmR21RNmhhTXA2bC9vQm12VGN3?=
 =?utf-8?B?RzIwek9XOFlhMi9oaUh2dk5YQWEybEo3OHBOdDB6aFZheFcyTjFCd05WYkRC?=
 =?utf-8?B?R3BRWmo1YUREK3EyYTl6NXB2NlVUMGhUOFdlNjB6alQ3bWxETW9XdzZ1WWQx?=
 =?utf-8?B?bThzWCs5S3M2dGRtai92Tjc5ankxR0Z5UUxSVzJ5OFRFR3hIWmF3WlFidjR4?=
 =?utf-8?B?M0k4elEwbGZDKys2TEhQNE4wSTYzZ0I1T1JuR0ZGeVVjV1FwNmNLN2V0Umtk?=
 =?utf-8?B?QlBxaTgrUDloekQ4emtMdTlIYnVSV1RURHk1QlIyS1libUdpTlN1OGxrc0JL?=
 =?utf-8?B?QTQvUmF5b0l0akpoZUFIcTU5N0RpbDlteFVvcWNyZVZZZUlHMGZjLzJCdkxl?=
 =?utf-8?B?MmlDVUV4RVZ0SFliMHRSSjlNR2U4WHRRc2V4VUlCY1poSkpQdUJsdG1lUTFE?=
 =?utf-8?B?Q05rTnRIZGV2QzR2Q0EzdVBPdmJaM1dZSzZNVDU3bEc4RkhRNm1KM3FwaTFF?=
 =?utf-8?B?TVJRcHpqNlJ5QmszNFh2SGdjU05zeHh1cDhjbklzQ2wybkNubGt1SzRDbWo5?=
 =?utf-8?B?OFRQOXBLMkg5aE45d244d1VVY0hJYVhSTFEzOUFrTEFnSVJtWjJsVjZzdGJo?=
 =?utf-8?B?dnZMS0tUOGxTQ1JXb0pGS1M1QWgxbHkzc2IzRU5QRkZmV1IrTHZWbEVzYm9q?=
 =?utf-8?B?U2JFSGFTQkxVVWUzNGhtSW1OcmRiQ2tLNmR1ckxyWGVEQmt0dXplNGtDb2Vt?=
 =?utf-8?B?RCs5QUJoWGhxc3poRkUzaDE3L3BoMGNvQVFLdU16UDhyQmpVNjk3QUc0aFpl?=
 =?utf-8?B?TTNCVW5iUGpwZk1QOXc3OVRzcW52eWdrVmdoTnZCdGs1eWtEYUZudW4xNWh3?=
 =?utf-8?B?aGJuUjA3OEVVc2lWYTZvRUQvUFJnbEJPRG1oOExRZ3BrVVh2T0VndWwxNmZF?=
 =?utf-8?B?eGM1QTFlbWdUWWhHN2lOUlVLdUVyRDZpWTNvdHo4NmpOVXQrQWNqakxwWGo1?=
 =?utf-8?B?SE83anpUM0J6L2xLR1dFNFVsNmxBMUxncTdzaklxODBsdEp1dmlySmV5a0R1?=
 =?utf-8?B?V3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0AF8CE79469569499264FB55BA449083@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d812792e-422c-4d6f-4455-08ddfc8f5c8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 23:58:01.9079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UKiNF84JFVnPgZL/68N97NyX5qP5SZbA2l9FdvTyg8V9fmCnEUOBYjWMF4qEufpiyVfBzoT66WvWOGtRryFcPsGlnRFj1kKCAh54mGlL8xc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8688
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_165815_384445_B4D7C259 
X-CRM114-Status: GOOD (  24.90  )
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

T24gRnJpLCAyMDI1LTA5LTI2IGF0IDAwOjIyICswMTAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBP
biBUaHUsIFNlcCAyNSwgMjAyNSBhdCAwODo0MDo1NlBNICswMDAwLCBFZGdlY29tYmUsIFJpY2sg
UCB3cm90ZToNCj4gDQo+ID4gU2VjdXJpdHktd2lzZSwgaXQgc2VlbXMgcmVhc29uYWJsZSB0aGF0
IGlmIHlvdSBhcmUgbGVhdmluZyBhIHNoYWRvdyBzdGFjaywgdGhhdA0KPiA+IHlvdSBjb3VsZCBs
ZWF2ZSBhIHRva2VuIGJlaGluZC4gQnV0IGZvciB0aGUgdXNlcnNwYWNlIHNjaGVtZSB0byBiYWNr
IHVwIHRoZSBTU1ANCj4gPiBieSBkb2luZyBhIGxvbmdqbXAoKSBvciBzaW1pbGFyIEkgaGF2ZSBz
b21lIGRvdWJ0cy4gSUlSQyB0aGVyZSB3ZXJlIHNvbWUgY3Jvc3MNCj4gPiBzdGFjayBlZGdlIGNh
c2VzIHRoYXQgd2UgbmV2ZXIgZmlndXJlZCBvdXQgaG93IHRvIGhhbmRsZS4NCj4gDQo+IEkgdGhp
bmsgdGhvc2Ugd2VyZSBhcm91bmQgdGhlIHVzZSBvZiBhbHQgc3RhY2tzLCB3aGljaCB3ZSBkb24n
dA0KPiBjdXJyZW50bHkgZG8gZm9yIHNoYWRvdyBzdGFja3MgYXQgYWxsIGJlY2F1c2Ugd2UgY291
bGRuJ3QgZmlndXJlIG91dA0KPiB0aG9zZSBlZGdlIGNhc2VzLiAgUG9zc2libHkgdGhlcmUncyBv
dGhlcnMgYXMgd2VsbCwgdGhvdWdoIC0gdGhlIGFsdA0KPiBzdGFja3MgaXNzdWVzIGRvbWluYXRl
ZCBkaXNjdXNzaW9uIGEgYml0Lg0KDQpGb3IgbG9uZ2ptcCwgSUlSQyB0aGVyZSB3ZXJlIHNvbWUg
cGxhbnMgdG8gc2VhcmNoIGZvciBhIHRva2VuIG9uIHRoZSB0YXJnZXQNCnN0YWNrIGFuZCB1c2Ug
aXQsIHdoaWNoIHNlZW1zIHNvbWV3aGF0IGF0IG9kZHMgd2l0aCB0aGUgcXVpY2sgZWZmaWNpZW50
IGp1bXANCnRoYXQgbG9uZ2ptcCgpIGdldHMgdXN1YWxseSB1c2VkIGZvci4gQnV0IGl0IGFsc28g
ZG9lc24ndCBzb2x2ZSB0aGUgcHJvYmxlbSBvZg0KdGFraW5nIGEgc2lnbmFsIHdoaWxlIHlvdSBh
cmUgdW53aW5kaW5nLg0KDQpMaWtlIHNheSB5b3UgZG8gY2FsbHMgYWxsIHRoZSB3YXkgdG8gdGhl
IGVuZCBvZiBhIHNoYWRvdyBzdGFjaywgYW5kIGl0J3MgYWJvdXQNCnRvIG92ZXJmbG93LiBUaGVu
IHRoZSB0aHJlYWQgc3dhcHMgdG8gYW5vdGhlciBzaGFkb3cgc3RhY2suIElmIHlvdSBsb25nam1w
IGJhY2sNCnRvIHRoZSBvcmlnaW5hbCBzdGFjayB5b3Ugd2lsbCBoYXZlIHRvIHRyYW5zaXRpb24g
dG8gdGhlIGVuZCBvZiB0aGUgZmlyc3Qgc3RhY2sNCmFzIHlvdSB1bndpbmQuIElmIGF0IHRoYXQg
cG9pbnQgdGhlIHRocmVhZCBnZXRzIGEgc2lnbmFsLCBpdCB3b3VsZCBvdmVyZmxvdyB0aGUNCnNo
YWRvdyBzdGFjay4gVGhpcyBpcyBhIHN1YnRsZSBkaWZmZXJlbmNlIGluIGJlaGF2aW9yIGNvbXBh
cmVkIHRvIG5vbi1zaGFkb3cNCnN0YWNrLiBZb3UgYWxzbyBuZWVkIHRvIGtub3cgdGhhdCBub3Ro
aW5nIGVsc2UgY291bGQgY29uc3VtZSB0aGF0IHRva2VuIG9uIHRoYXQNCnN0YWNrIGluIHRoZSBt
ZWFudGltZS4gU28gZG9pbmcgaXQgc2FmZWx5IGlzIG5vdCBuZWFybHkgYXMgc2ltcGxlIGFzIG5v
cm1hbA0KbG9uZ2ptcCgpLg0KDQpBbnl3YXksIEkgdGhpbmsgeW91IGRvbid0IG5lZWQgYWx0IHNo
YWRvdyBzdGFjayB0byBoaXQgdGhhdC4gSnVzdCBub3JtYWwNCnVzZXJzcGFjZSB0aHJlYWRpbmc/
DQoNCj4gDQo+IEFGQUlDVCB0aG9zZSBpc3N1ZXMgZXhpc3QgYW55d2F5LCBpZiB1c2Vyc3BhY2Ug
aXMgYWxyZWFkeSB1bndpbmRpbmcgYXMNCj4gcGFydCBvZiB0aHJlYWQgZXhpdCB0aGVuIHRoZXkn
bGwgZXhlcmNpc2UgdGhhdCBjb2RlIHRob3VnaCBwZXJoYXBzIGJlDQo+IHNhdmVkIGZyb20gYW55
IGlzc3VlcyBieSB2aXJ0dWUgb2Ygbm90IGFjdHVhbGx5IGRvaW5nIGFueSBmdW5jdGlvbg0KPiBj
YWxscy4gIEFueXRoaW5nIHRoYXQgYWN0dWFsbHkgZG9lcyBhIGxvbmdqbXAoKSB3aXRoIHRoZSBp
bnRlbnQgdG8NCj4gY29udGludWUgd2lsbCBkbyBzbyBtb3JlIHRob3JvdWdobHkuDQo+IA0KPiA+
IEFzIGZhciBhcyByZS11c2luZyBhbGxvY2F0ZWQgc2hhZG93IHN0YWNrcywgdGhlcmUgaXMgYWx3
YXlzIHRoZSBvcHRpb24gdG8gZW5hYmxlDQo+ID4gV1JTUyAob3Igc2ltaWxhcikgdG8gd3JpdGUg
dGhlIHNoYWRvdyBzdGFjayBhcyB3ZWxsIGFzIGxvbmdqbXAgYXQgd2lsbC4NCj4gDQo+IFRoYXQn
cyBvYnZpb3VzbHkgYSBzdWJzdGFudGlhbCBkb3duZ3JhZGUgaW4gc2VjdXJpdHkgdGhvdWdoLg0K
DQpJIGRvbid0IGtub3cgYWJvdXQgc3Vic3RhbnRpYWwsIGJ1dCBJJ2QgbG92ZSB0byBoZWFyIHNv
bWUgb2ZmZW5zaXZlIHNlY3VyaXR5DQpwZXJzb25zIGFuYWx5c2lzLiBUaGVyZSBkZWZpbml0ZWx5
IHdhcyBhIHNjaG9vbCBvZiB0aG91Z2h0IHRob3VnaCwgdGhhdCBzaGFkb3cNCnN0YWNrIHNob3Vs
ZCBiZSB0dXJuZWQgb24gYXMgd2lkZWx5IGFzIHBvc3NpYmxlLiBJZiB3ZSBuZWVkIFdSU1MgdG8g
bWFrZSB0aGF0DQpoYXBwZW4gaW4gYSBzYW5lIHdheSwgeW91IGNvdWxkIGFyZ3VlIHRoZXJlIGlz
IHNvcnQgb2YgYSBzZWN1cml0eSBhdCBzY2FsZQ0KYmVuZWZpdC4NCg0KPiANCj4gPiBJIHRoaW5r
IHdlIHNob3VsZCBzZWUgYSBmdWxsZXIgc29sdXRpb24gZnJvbSB0aGUgZ2xpYmMgc2lkZSBiZWZv
cmUgYWRkaW5nIG5ldw0KPiA+IGtlcm5lbCBmZWF0dXJlcyBsaWtlIHRoaXMuIChhcG9sb2dpZXMg
aWYgSSBtaXNzZWQgaXQpLiBJIHdvbmRlciBpZiB3ZSBhcmUNCj4gDQo+IEkgYWdyZWUgdGhhdCB3
ZSB3YW50IHRvIHNlZSBzb21lIHVzZXJzcGFjZSBjb2RlIGhlcmUsIEknbSBob3BpbmcgdGhpcw0K
PiBjYW4gYmUgdXNlZCBmb3IgcHJvdG90eXBpbmcuICBZdXJ5IGhhcyBzb21lIGNvZGUgZm9yIHRo
ZSBjbG9uZTMoKSBwYXJ0DQo+IG9mIHRoaW5ncyBpbiBnbGliYyBvbiBhcm02NCBhbHJlYWR5LCBo
b3BlZnVsbHkgdGhhdCBjYW4gYmUgZXh0ZW5kZWQgdG8NCj4gaW5jbHVkZSB0aGUgc2hhZG93IHN0
YWNrIGluIHRoZSB0aHJlYWQgc3RhY2sgY2FjaGUuDQo+IA0KPiA+IGJ1aWxkaW5nIHNvbWV0aGlu
ZyB0aGF0IHdpbGwgaGF2ZSBhbiBleHRyZW1lbHkgY29tcGxpY2F0ZWQgc2V0IG9mIHJ1bGVzIGZv
ciB3aGF0DQo+ID4gdHlwZXMgb2Ygc3RhY2sgb3BlcmF0aW9ucyBzaG91bGQgYmUgZXhwZWN0ZWQg
dG8gd29yay4NCj4gDQo+IEkgdGhpbmsgcmVzdHJpY3RlZCBtb3JlIHRoYW4gY29tcGxleD8NCj4g
DQo+ID4gU29ydCBvZiByZWxhdGVkLCBJIHRoaW5rIHdlIG1pZ2h0IHRoaW5rIGFib3V0IG1zZWFs
aW5nIHNoYWRvdyBzdGFja3MsIHdoaWNoIHdpbGwNCj4gPiBoYXZlIHRyb3VibGUgd2l0aCBhIGxv
dCBvZiB0aGVzZSB1c2VyIG1hbmFnZWQgc2hhZG93IHN0YWNrIHNjaGVtZXMuIFRoZSByZWFzb24N
Cj4gPiBpcyB0aGF0IGFzIGxvbmcgYXMgc2hhZG93IHN0YWNrcyBjYW4gYmUgdW5tYXBwZWQgd2hp
bGUgYSB0aHJlYWQgaXMgb24gdGhlbSAoc2F5DQo+ID4gYSBzbGVlcGluZyB0aHJlYWQpLCBhIG5l
dyBzaGFkb3cgc3RhY2sgY2FuIGJlIGFsbG9jYXRlZCBpbiB0aGUgc2FtZSBwbGFjZSB3aXRoIGEN
Cj4gPiB0b2tlbi4gVGhlbiBhIHNlY29uZCB0aHJlYWQgY2FuIGNvbnN1bWUgdGhlIHRva2VuIGFu
ZCBwb3NzaWJseSBjb3JydXB0IHRoZQ0KPiA+IHNoYWRvdyBzdGFjayBmb3IgdGhlIG90aGVyIHRo
cmVhZCB3aXRoIGl0J3Mgb3duIGNhbGxzLiBJIGRvbid0IGtub3cgaG93DQo+ID4gcmVhbGlzdGlj
IGl0IGlzIGluIHByYWN0aWNlLCBidXQgaXQncyBzb21ldGhpbmcgdGhhdCBndWFyZCBnYXBzIGNh
bid0IHRvdGFsbHkNCj4gPiBwcmV2ZW50Lg0KPiANCj4gPiBCdXQgZm9yIGF1dG9tYXRpYyB0aHJl
YWQgY3JlYXRlZCBzaGFkb3cgc3RhY2tzLCB0aGVyZSBpcyBubyBuZWVkIHRvIGFsbG93DQo+ID4g
dXNlcnNwYWNlIHRvIHVubWFwIGEgc2hhZG93IHN0YWNrLCBzbyB0aGUgYXV0b21hdGljYWxseSBj
cmVhdGVkIHN0YWNrcyBjb3VsZA0KPiA+IHNpbXBseSBiZSBtc2VhbGVkIG9uIGNyZWF0aW9uIGFu
ZCB1bm1hcHBlZCBmcm9tIHRoZSBrZXJuZWwuIEZvciBhIGxvdCBvZiBhcHBzDQo+ID4gKG1vc3Q/
KSB0aGlzIHdvdWxkIHdvcmsgcGVyZmVjdGx5IGZpbmUuDQo+IA0KPiBJbmRlZWQsIHdlIHNob3Vs
ZCBiZSBhYmxlIHRvIGp1c3QgZG8gdGhhdCBpZiB3ZSdyZSBtc2VhbCgpaW5nIHN5c3RlbQ0KPiBt
YXBwaW5ncyBJIHRoaW5rIC0gbW9zdCBsaWtlbHkgYW55dGhpbmcgdGhhdCBoYXMgYSBwcm9ibGVt
IHdpdGggaXQNCj4gcHJvYmFibHkgYWxyZWFkeSBoYXMgYSBwcm9ibGVtIHRoZSBleGlzdGluZyBt
c2VhbCgpIHN0dWZmLiAgWWV0IGFub3RoZXINCj4gcmVhc29uIHdlIHNob3VsZCBiZSBmYWN0b3Jp
bmcgbW9yZSBvZiB0aGlzIGNvZGUgb3V0IGludG8gdGhlIGdlbmVyaWMNCj4gY29kZSwgbGlrZSBJ
IHNheSBJJ2xsIHRyeSB0byBsb29rIGF0IHRoYXQuDQoNCkFncmVlLiBCdXQgZm9yIHRoZSBtc2Vh
bCBzdHVmZiwgSSB0aGluayB5b3Ugd291bGQgd2FudCB0byBoYXZlIG1hcF9zaGFkb3dfc3RhY2sN
Cm5vdCBhdmFpbGFibGUuDQoNCj4gDQo+IEkgZG8gd29uZGVyIGlmIGFueW9uZSB3b3VsZCBib3Ro
ZXIgd2l0aCB0aG9zZSBhdHRhY2tzIGlmIHRoZXkndmUgZ290DQo+IGVub3VnaCBjb250cm9sIG92
ZXIgdGhlIHByb2Nlc3MgdG8gZG8gdGhlbSwgYnV0IGVxdWFsbHkgYSBsb3Qgb2YgdGhpcyBpcw0K
PiBhYm91dCBob3cgdGhpbmdzIGNoYWluIHRvZ2V0aGVyLg0KDQpZZWEsIEkgZG9uJ3Qga25vdy4g
QnV0IHRoZSBndWFyZCBnYXBzIHdlcmUgYWRkZWQgYWZ0ZXIgYSBzdWdnZXN0aW9uIGZyb20gSmFu
bg0KSG9ybi4gVGhpcyBpcyBzb3J0IG9mIGEgc2ltaWxhciBjb25jZXJuIG9mIHNoYXJpbmcgYSBz
aGFkb3cgc3RhY2ssIGJ1dCB0aGUNCmRpZmZlcmVuY2UgaXMgc3RhY2sgb3ZlcmZsb3cgdnMgY29u
dHJvbGxpbmcgYXJncyB0byBzeXNjYWxscy4NCg0KPiANCj4gPiBJIHRoaW5rIHdlIGRvbid0IHdh
bnQgMTAwIG1vZGVzIG9mIHNoYWRvdyBzdGFjay4gSWYgd2UgaGF2ZSB0d28sIEknZCB0aGluazoN
Cj4gPiAxLiBNc2VhbGVkLCBzaW1wbGUgbW9yZSBsb2NrZWQgZG93biBrZXJuZWwgYWxsb2NhdGVk
IHNoYWRvdyBzdGFjay4gTGltaXRlZCBvcg0KPiA+IG5vbmUgdXNlciBzcGFjZSBtYW5hZ2VkIHNo
YWRvdyBzdGFja3MuDQo+ID4gMi4gV1JTUyBlbmFibGVkLCBjbG9uZTMtcHJlZmVycmVkIG1heCBj
b21wYXRpYmlsaXR5IHNoYWRvdyBzdGFjay4gTG9uZ2ptcCB2aWENCj4gPiB0b2tlbiB3cml0ZXMg
YW5kIGRvbid0IGV2ZW4gaGF2ZSB0byB0aGluayBhYm91dCB0YWtpbmcgc2lnbmFscyB3aGlsZSB1
bndpbmRpbmcNCj4gPiBhY3Jvc3Mgc3RhY2tzLCBvciB3aGF0ZXZlciBvdGhlciBlZGdlIGNhc2Uu
DQo+IA0KPiBJIHRoaW5rIHRoZSBpbXBvcnRhbnQgdGhpbmcgZnJvbSBhIGtlcm5lbCBBQkkgcG9p
bnQgb2YgdmlldyBpcyB0byBnaXZlDQo+IHVzZXJzcGFjZSB0aGUgdG9vbHMgdG8gZG8gd2hhdGV2
ZXIgaXQgd2FudHMgYW5kIGdldCBvdXQgb2YgdGhlIHdheSwgYW5kDQo+IHRoYXQgaWRlYWxseSB0
aGlzIHNob3VsZCBpbmNsdWRlIG9wdGlvbnMgdGhhdCBkb24ndCBqdXN0IG1ha2UgdGhlIHNoYWRv
dw0KPiBzdGFjayB3cml0YWJsZSBzaW5jZSB0aGF0J3MgYSBzdWJzdGFudGlhbCBzdGVwIGRvd24g
aW4gcHJvdGVjdGlvbi4NCg0KWWVzIEkgaGVhciB0aGF0LiBCdXQgYWxzbyB0cnkgdG8gYXZvaWQg
Y3JlYXRpbmcgbWFpbnRlbmFuY2UgaXNzdWVzIGJ5IGFkZGluZw0KZmVhdHVyZXMgdGhhdCBkaWRu
J3QgdHVybiBvdXQgdG8gYmUgdXNlZnVsLiBJdCBzb3VuZHMgbGlrZSB3ZSBhZ3JlZSB0aGF0IHdl
IG5lZWQNCm1vcmUgcHJvb2YgdGhhdCB0aGlzIHdpbGwgd29yayBvdXQgaW4gdGhlIGxvbmcgcnVu
Lg0KDQo+IA0KPiBUaGF0IHNhaWQgeW91ciBvcHRpb24gMiBpcyBhbHJlYWR5IHN1cHBvcnRlZCB3
aXRoIHRoZSBleGlzdGluZyBjbG9uZTMoKQ0KPiBvbiBib3RoIGFybTY0IGFuZCB4ODZfNjQsIHBv
bGljeSBmb3Igc3dpdGNoaW5nIGJldHdlZW4gdGhhdCBhbmQga2VybmVsDQo+IG1hbmFnZWQgc3Rh
Y2tzIGNvdWxkIGJlIHNldCBieSByZXN0cmljdGluZyB0aGUgd3JpdGFibGUgc3RhY2tzIGZsYWcg
b24NCj4gdGhlIGVuYWJsZSBwcmN0bCgpLCBhbmQvb3IgcmVzdHJpY3RpbmcgbWFwX3NoYWRvd19z
dGFjaygpLg0KDQpZb3UgbWVhbiB1c2Vyc3BhY2UgY291bGQgYWxyZWFkeSByZS11c2Ugc2hhZG93
IHN0YWNrcyBpZiB0aGV5IGVuYWJsZSB3cml0YWJsZQ0Kc2hhZG93IHN0YWNrcz8gWWVzIEkgYWdy
ZWUuDQoNCj4gDQo+ID4gVGhpcyBSRkMgc2VlbXMgdG8gYmUgZ29pbmcgZG93biB0aGUgcGF0aCBv
ZiBhZGRyZXNzaW5nIG9uZSBlZGdlIGNhc2UgYXQgYSB0aW1lLg0KPiA+IEFsb25lIGl0J3MgZmlu
ZSwgYnV0IEknZCByYXRoZXIgcHVudCB0aGVzZSB0eXBlcyBvZiB1c2FnZXMgdG8gKDIpIGJ5IGRl
ZmF1bHQuIA0KPiANCj4gRm9yIG1lIHRoaXMgaXMgaW4gdGhlIGNhdGVnb3J5IG9mICJvaCwgb2Yg
Y291cnNlIHlvdSBzaG91bGQgYmUgYWJsZSB0bw0KPiBkbyB0aGF0IiB3aGVyZSBpdCBmZWVscyBs
aWtlIGFuIG9idmlvdXMgdXNhYmlsaXR5IHRoaW5nIHRoYW4gYW4gZWRnZQ0KPiBjYXNlLg0KDQpU
cnVlLiBJIGd1ZXNzIEkgd2FzIHRoaW5raW5nIG1vcmUgYWJvdXQgdGhlIHN0YWNrIHVud2luZGlu
Zy4gQmFkbHkgcGhyYXNlZCwNCnNvcnJ5Lg0KDQo=

