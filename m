Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B26E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 08:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XTMtOjPPrxqRVlVF/lBzawHTfdtmVJMDjkwTLkLq4M=; b=jxUrGK1dfcRH3Cs7jR7VSjQrng
	HBsBBZyahmeXExiL4vKw/bP83b/zT4w0xOlbDwKIdGqALuccsa1XzXx0undjMvk7ybHRQrQ07HoJe
	PPKwxkkTR6Wv5oWT+arhbFoxyjCL3Ub23PDmaqZBaVWLNd72ymYn4IFo6+eI2/kIvM0ZGSpN9b1kV
	titLZjLV0cSRy+uasc6nlJz7mNrxGQZGeu1rSYYnrXYe6AHu8uirBNjil6fVvPfzpPUcHSqnvKzQi
	wYz/UwsKSrxs9E0biQwf0f06lrGS0r+vSw7JBq1u0W7l67G2Y8D56poKwfhKzd7YgNIDUwaPEOvro
	bumFwqYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQMRv-0000000DQ1Z-1HjD;
	Wed, 25 Dec 2024 08:08:59 +0000
Received: from esa1.fujitsucc.c3s2.iphmx.com ([68.232.152.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQMQh-0000000DPwk-26ft
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Dec 2024 08:07:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1735114064; x=1766650064;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0XTMtOjPPrxqRVlVF/lBzawHTfdtmVJMDjkwTLkLq4M=;
  b=fOozExWbg0MU1rJnBPYBD6B7G3tjeQedyODM9qtiCWtyWWDkxawQju8L
   gv3JYNWwLRjDr4I2jTQtCOAD2/QPoMwIrLeyTur4CuaUyepYMTJAbO4ot
   Ye0suqNHZbCedF7ppzBu/4/NWBte8qfDbfKbC+FpJY3GNSioTDclrpid0
   JE7n6dlEV5scUrUQlGhPw0uoPJdtK6fV9bXEbVR86mLQ53boJjo1zwS+c
   rMSJqrrvBOU528ZF29SGj6qBLjYx0QWNUMeNDWtF+ixflWy9VMJyc5SyO
   nABDyoLIpWI46ZMWQc5noxL2z3AVWXkXEqnOZroXJZUfKQI9EPGjGwjZV
   A==;
X-CSE-ConnectionGUID: N42oK/iqSy+A6DTQPxy4lQ==
X-CSE-MsgGUID: eXX3iCyIRIaGOi4XOS30PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="52439912"
X-IronPort-AV: E=Sophos;i="6.12,262,1728918000"; 
   d="scan'208";a="52439912"
Received: from mail-japaneastazlp17010005.outbound.protection.outlook.com (HELO TY3P286CU002.outbound.protection.outlook.com) ([40.93.73.5])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 17:07:31 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZrfY+EIl4Siu7K8I8c/+AL9JpAef/9rkklo8QsxxV4dB1LKAQBgqEdm1ULwi8/YAw38qQltFYQ63Z7ZLwxhBIHS+1r74Bb1idTgKuYOTmDZOKoa4xD9ZzbjUc+tR5hyA/NO7qbxgGJUnWuV7AANS7L+0Q6QzLGbNsKMu8rTwByar3WpsI6ZPf7KAitQfUMv2c1JxnhDXet6LkYJbLskEruzlPyBvoj9vcCZdRhVBS58+43UFgr1XYAMDY59b+eiYk0Y9d/y+z/JvKUh4OC1MVJsL730Su9i9ti30N2oXdoci0UtyTl44Z95kgNVZyDClpfCTWFbwHUuF6AXbpXqEUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XTMtOjPPrxqRVlVF/lBzawHTfdtmVJMDjkwTLkLq4M=;
 b=TqJHpB3/GdDJUdv8Gvol1E/Q6UHtsRs0CtG/KOKxpgNnE0balIiuTU8Oh47vCs6M3AbM5aIVpiWQYb3q0Nj6lwSNSSiDNiTOem96w1afc6MMN+iuxQr7ZLfaImlfKEPB49OjtyCHYD6JF2DAkdYPHTXrWQ/0TnqRKpDMw33arjyb+3J7+soE+hIyt91RAs70hXmwCl4lcUb0atlV32dOWGt/FhynY0Wbiwf41nQZLcRgrx4wg90JAumD2DPlEui6uiVqq0Dgdy9R+7vBIKICloBZIvIRk2mqFr4Vx8j5eCq7DsnpoTFy/irJlNs1TihZfeKXuOZjSUwZMHf3maJ2TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS3PR01MB6903.jpnprd01.prod.outlook.com (2603:1096:604:12c::9)
 by OS0PR01MB5314.jpnprd01.prod.outlook.com (2603:1096:604:a8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Wed, 25 Dec
 2024 08:07:27 +0000
Received: from OS3PR01MB6903.jpnprd01.prod.outlook.com
 ([fe80::df96:5745:d1b5:cafe]) by OS3PR01MB6903.jpnprd01.prod.outlook.com
 ([fe80::df96:5745:d1b5:cafe%5]) with mapi id 15.20.8272.013; Wed, 25 Dec 2024
 08:07:27 +0000
From: "Yoshihiro Furudera (Fujitsu)" <fj5100bi@fujitsu.com>
To: 'Jonathan Cameron' <Jonathan.Cameron@huawei.com>
CC: 'Will Deacon' <will@kernel.org>, 'Mark Rutland' <mark.rutland@arm.com>,
	'Jonathan Corbet' <corbet@lwn.net>, 'Catalin Marinas'
	<catalin.marinas@arm.com>, "'linux-arm-kernel@lists.infradead.org'"
	<linux-arm-kernel@lists.infradead.org>, 'Bjorn Andersson'
	<quic_bjorande@quicinc.com>, 'Geert Uytterhoeven' <geert+renesas@glider.be>,
	'Krzysztof Kozlowski' <krzysztof.kozlowski@linaro.org>, 'Dmitry Baryshkov'
	<dmitry.baryshkov@linaro.org>, 'Konrad Dybcio' <konradybcio@kernel.org>,
	'Neil Armstrong' <neil.armstrong@linaro.org>, 'Arnd Bergmann'
	<arnd@arndb.de>, =?utf-8?B?JyBOw61jb2xhcyAiRi4gUi4gQS4gUHJhZG8iJw==?=
	<nfraprado@collabora.com>, 'Thomas Gleixner' <tglx@linutronix.de>, 'Peter
 Zijlstra' <peterz@infradead.org>, "'linux-doc@vger.kernel.org'"
	<linux-doc@vger.kernel.org>, "'linux-kernel@vger.kernel.org'"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] perf: Fujitsu: Add the Uncore MAC PMU driver
Thread-Topic: [PATCH v2 1/2] perf: Fujitsu: Add the Uncore MAC PMU driver
Thread-Index: AQHbPKZNz/bIRpbD4U+x/W9u+XfZB7LhCUiAgAv34OCACcw44A==
Date: Wed, 25 Dec 2024 08:07:25 +0000
Message-ID: <OS3PR01MB6903C0DAEAAC66FB86AAAC1FD40C2@OS3PR01MB6903.jpnprd01.prod.outlook.com>
References: <20241122061753.2598688-1-fj5100bi@fujitsu.com>
	<20241122061753.2598688-2-fj5100bi@fujitsu.com>
 <20241211113909.000039d0@huawei.com>
 <OS3PR01MB69035A6B5F695F039B5D77C3D4062@OS3PR01MB6903.jpnprd01.prod.outlook.com>
In-Reply-To: <OS3PR01MB69035A6B5F695F039B5D77C3D4062@OS3PR01MB6903.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9Y2E4MzBmYTktZjI4MC00ODZiLWE5NTMtYzEwMjUwNDhk?=
 =?utf-8?B?OTg2O01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI0LTEyLTI1VDA4OjAyOjQxWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?Q?81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB6903:EE_|OS0PR01MB5314:EE_
x-ms-office365-filtering-correlation-id: 06607d4c-c377-4bc3-109c-08dd24bb2b4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018|1580799027;
x-microsoft-antispam-message-info: =?utf-8?B?R3AyUmc2eGZ1cEZoZDVIOFBaTkE0UE1hWlJ4MlM2bHV1Q09PQlUyUmM2SVdr?=
 =?utf-8?B?elpLdkJoSDRZWndtazJIMzhSSjhUUGRjNkhnS21kVzZ1akdSeUdNdEo3ZkNG?=
 =?utf-8?B?Z0RlcmdYZ2xqRHYxTThwWUl4L2s0aUJ0QVVESEw2Z1VhMlhYd2ZmYkZPWVRB?=
 =?utf-8?B?ZG5OSGtVTEJMV2lRODZWVzBPN3lVZTN6aE1sTVk2S05EbWpINHFGTSszdWlx?=
 =?utf-8?B?MEdaR1NNOEg2akNaUFEva3lYMlFCd29KeHdjN3lQbHdmc1oza2ZndjVOaGh0?=
 =?utf-8?B?ekkvUWhGUGIyT0g1bENzOXVPdEUyaVJ6K2lXMmh0dWFvcVREckkvWjFxbmNw?=
 =?utf-8?B?eFZvRWlnM2VWSGNaOVVJbkdKdVdMNVJWLzYyQldZT2RCNTRQRWVXWnprTE1V?=
 =?utf-8?B?dHYrWnB2SHh4cTBjdUJ0RzFzbmNxek1aMVQxbTdleUlZRDlIeTl5bVpQQzJE?=
 =?utf-8?B?cWJCditCVGFGaS9TaG1RZFNPWGRzeEtlSExicXJKRCtzQzN4TW95U2VNR2ND?=
 =?utf-8?B?TEowemd0MmRxcnMydFFxK3BJMU0rREtrT3VWTVhQY3lOaUpxcFo5R3U5UkZ3?=
 =?utf-8?B?MjE5U1BLNW91YVhxM2JIeTNPeHp1REdEVlhqbWtDekRaWDBuSFd6VkJ0ZW9E?=
 =?utf-8?B?aFJqMm5OTkp3YkQyaEhCWTRheFF4Mjk0dk5PaXJ0M1M1ZWVDcy9ELzg1MWgx?=
 =?utf-8?B?dWRxNkZwK09FRXpwR0ZaWGp4aXBUV1J5R0pKdDRiRnd1ZXpEMVU4N1NFSGt6?=
 =?utf-8?B?cW5DM3l0UWNWc0prUGdtbzlreEJuamlYSkxwYVk3K1NuY282TU5iOTMwWEYz?=
 =?utf-8?B?TCt4elIvbFErK0UvT0JCUGZ1WkV4dWoyMGsydVBINFhvdzcyRHVwRDJBUkx2?=
 =?utf-8?B?RXI1OHFLNk9kSjlQVzdtWGlvTmpRdUlTckhDMk96eWNsa2svVWJyT3FFN2Q4?=
 =?utf-8?B?ZXNuSnpvam1rZmJ4L21veUtWTWUvVEd0ZUxMMEdiK242SmNOVExEdEp6c1ky?=
 =?utf-8?B?TG5RZFV5MzZlMXFtRVlNRUVLNk94U3RYTDRnOGkvTTJzN0xhaFVJWFhuNlhL?=
 =?utf-8?B?UWRMRFI3b1BYajlCaXluVUEyaStrR040SWkvNEVVcjNxL2VnZG5VLytLM21m?=
 =?utf-8?B?SjhOemN0NWJCckFXeXRMRitMQlJTYWt0czQ2UDR5REVQbnZMeFdhbnZIQzhm?=
 =?utf-8?B?bGs4VE9LNFZ4YXdLclh6c043OGpCTFp1WVJNM29xb1prUk41aVI3VWNPZ3hQ?=
 =?utf-8?B?Yi9zV0tXTHUxb2REaE8ycWJJOEJjR05BODF4Y2FwZnBqdEprY0psanF1QlJK?=
 =?utf-8?B?NmV6UjFGdTJrSVM4T3lZSVhpZUVtSHg4bWxFZWJQOTV5SmI2WEY3Z1V1UjVq?=
 =?utf-8?B?NHNWY21kUVdpZ0xVdHZmbUlqMklWd0YrRStpblVBekFjZTY4K1ZISWRXV1Na?=
 =?utf-8?B?U3lscXhWUERWVStZdFNLdmdVWFhOMnVyOGIxcGluOVUvdlh2clg2dk42TkxK?=
 =?utf-8?B?L0VkYzYvK0V0ZTV1ZzJuWndpUlVCQzdDUzJ1dUxZZUJVcTBYT3NiOCs4eWJx?=
 =?utf-8?B?TGl0OFAwcWk4NjBHdXR4TTZ3RzVpdUNjWXVMTkQvb2tXS0RCcC9hTEw1YkJ4?=
 =?utf-8?B?SUhWczVoOHhEdzJuQStzeVFVTmNIMitqM1VNa00zdjBsOVh1ODh0N0tvZith?=
 =?utf-8?B?Q3MyOCtWY25BRFBNeHU2YXpCUThFc1k1bmZjZ2U5Nmd4dEFoSWU5OUN2WXVH?=
 =?utf-8?B?aGFmZFp4dm5ObThMOTczL0Y4K0dKL2xSUEcvaTJCd3JVdllaZTJTbHExUHU4?=
 =?utf-8?B?NUxraEZYMi9MWUtxcThtQU9TRzVRTm5sdG9qOXhZTGRXS0lzTUdUN1BZMml0?=
 =?utf-8?B?aGxobTNtUXV5ZFh4UGJGWDRQVGJLZmhMcEFLencwNGJpQzNVWFNEazFlbXlP?=
 =?utf-8?B?c2FqejJNSGRXMTlwTkIxb1ZnV3RlcjF6eS9oTTdIMnVyZG1abVlwT0FQakIv?=
 =?utf-8?B?SC96MlM1cFJBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6903.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2I1U2l1U1hUYXhqUTk4RFpTYW5TOWNGZ2FWVDc5cldqSkRzcnYrbWNxN0Mw?=
 =?utf-8?B?WHlBVVh5aEViV241MHp6dk56L2FqN2hOQjNNazRDL2tYVmJtSkZXRC9BN01X?=
 =?utf-8?B?alU2QTBSamF6eUlWbmF6SGlSVzcxM3lQaGlFTjJNaGFDdkNPNlZIYXpFY1E4?=
 =?utf-8?B?S0R3bjBPWmdQaHVZUi9PeFdqZnhORTlZeDFnRUlkd3h5SFVZSnB6eDNPSDkr?=
 =?utf-8?B?d1VGaE1tdkVXSlRHSzMyeHhSNEErSmFTN1ZmWG5HZjNmdEVLYzRWSUJVZ0Iy?=
 =?utf-8?B?QTZMbGZEQStzQmp3QnRQb1QxTmZ2aVphSEdVdVkvU0haN1pDbDVmaUM0cGRo?=
 =?utf-8?B?U28ycGovOTlSa2pjRjUrWkNoZmx0amFRdkczdVVQTy9XWDBaS1RuNkVkWU9n?=
 =?utf-8?B?UnZEOVo1WDdpSzhNQk5ya2ZNRGp4Z3FrSlZ3RVB2eG4wMTVQajFnMXNFNm43?=
 =?utf-8?B?bEU4NFRwdmVXQVA4MGtDOFNZVGZmSSszV2cvK3I3ZTVwdEk5ekFqTkxMdzl1?=
 =?utf-8?B?NFUyeHdEMmc4Q1ZteTVIdStVRmZlSzNqUFRHMDZENTNNSDhpaEk4ZXpWaWgz?=
 =?utf-8?B?cEhweldCd3d4NGg0UnV1ZXlLaTFGQStHTEZaeTZiVE8rTE5aWmZxUWpWMFpE?=
 =?utf-8?B?STBTdmo1aFF4OUpCV2hOdmc1M2d1aGNoZ0s4cWgvSUVubjRKeW1mNUJwdml6?=
 =?utf-8?B?cVZic0FJWWdMUlE3VjFvQmZnUkVuVHBteFBiNFNMSFhlNSsvY3RSSW9RN0N5?=
 =?utf-8?B?Q1QxMWRla1I5NFlZM291ZzMvVVJ0VWFjT1BCZEVXdlVSM3NoQ2xFYm0rVWI1?=
 =?utf-8?B?UmRZbDJzeSswZS95Z1NIY1VVZU5ZYW9aTkcrNm1BV05vK2VOZWRLSWJXUEpj?=
 =?utf-8?B?dUs0YzFBOUlTeTNHeGVneFJqTU1XRmFsUXRTcUtEZjRhN21ESWIreVZ1YzZU?=
 =?utf-8?B?anBFd1FvdmNIUWp4Um5VSDk3SDBLTld3Zm1SNVdLdDhxa0pjZmkxb2wvTU9p?=
 =?utf-8?B?eloyMCt0K1pBdlMxYisyTlhxaWN2SzNmV0hsY2YyK1ROSEhyK2MzNmlFUVFj?=
 =?utf-8?B?UVZBRU1OSVRRUXVxNWFydEF1NFFlcEpKZ0ZlUTlDSzlLY3UrU0VwWTg0TkQ0?=
 =?utf-8?B?MkdscnN0TGsyKzBkSFBqTjBlSTg1WloxUzRMSVRhL0lUY2hoMmhma3dnM0lG?=
 =?utf-8?B?YzAzTVFpWU9qOHRheFkzeWpzUDBVWk9rMkk3dXdnZE1DTFQzd2QxS1VwRFRG?=
 =?utf-8?B?SjFCNTdJTUNad2lYczB4VFVXWVVjZzdzNHRQTTJzaGxqMzZmZjFuWDNtRUk1?=
 =?utf-8?B?UzlUZG9JVTRnMThmeHNSQW5hZy9aYThIeEgydEFxMEd6ZmpKZ21EL1J6d1Qr?=
 =?utf-8?B?YlBRZTloMFg0SGlheGh4VUdjejBwdnNjWUFRK0JCUU9ZTFg0dUNhV3VPYTRy?=
 =?utf-8?B?OHdiQVpNMkpmbjdJL0lCbEp1WVlkcDFXUmpIZ0JoR2ZYLzBLNW9YUHZZcDhs?=
 =?utf-8?B?SSs0R1F1TVdiaWVpNlFTNXJ1Q3FKSVE0bmRWdVRZNHNJV25KYUlSYWJDc04w?=
 =?utf-8?B?RllWb1RVNG95OU5xNmw1MmxZUkRXYlZJWk9SNklDaFZPUm9DRXdzdGNiUlEz?=
 =?utf-8?B?VGh4RkhETGpNTThQcWd1MUszbzhrOFpKVnlrbktscFZIYmFxNHZOdW9zaFRO?=
 =?utf-8?B?WEM2OTJ6b2svQlFUaWY4SWZORnFJSXJQYzZUYzZiZFRtQ20reGltK1IyV1JP?=
 =?utf-8?B?TTExK21WaHdLZUFScHNKTmtPeVRVdSswWllnTW91aERqTy93eHlMbktBLzlF?=
 =?utf-8?B?ZzdPaDBOeXVQWjVuMTMzbDBRaElrWlhpTURMOUUyT21hRnNCZTI2Tmt4NWtt?=
 =?utf-8?B?QTNnYzUzUDl2dFZURVBvVVk5TUo0bkw3ejIwOGJoMkczM3RJK3phbWNoYUJn?=
 =?utf-8?B?TnIremMxUVlYT0UvWUw4eUlIMXlEZFVqU29ZVjh4VjR2YnhjWVFnZUpaMHNB?=
 =?utf-8?B?cER2Y0FISTU0dnNuNjFSZTZnaGI1blVwbVZ2WSszZ3dzMUxWS1c2RW5La0VQ?=
 =?utf-8?B?Qi9JRjEzLytnSFdhVVE1YnFIVERrRUdhR1RycUE3blQ4dWJ3eFo2L1dubm85?=
 =?utf-8?Q?3gO19tzpx6ZQOilG9M+C3X9sI?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: jmhFYCeeaTOo9BF0ujuR9+dbE0Pxpd8cUGc9rDJ6uSzlJW6okd1/l8znNKeWrukbbW464srjVEPcLsNw5YkuMFYJgfHMvWeY03aYlobrMQjT/37aeDi4OV3KZVqkFC6A3+hc1m1L8M+qP+w1HdnDCHl+yovvcxtORc2AOgN9Jk4VV7LyUD8EgThHCirYqkZ24VrMacy0JootlQhGk23NMdLY7LxXYo0j7LvV0AYcJPt5UciqpnFttUCWKcOjr01ZY12CGJneAncnXgEO8Dju8+yNhj81UR9qkAkkbDmq4zpHSUGeThTB6pYqYvUuvLSXBnklSeuWTcS8EYJpG2XuPyG7SmTcZ3sa4p6xqTTv/OqhFZzN+riMO4XaWAz0B2eyKDhMXOTi7FxXMqR+mwxOcFjB6s0Kowz/uwA6svBaFfUHHa5XsiXhngKyJvUrhEteKhbrr/TFvO00a8aLvLmHoADYsSGS1tt53siU+zCqjoaH3GJj0f54qgl/Vjr4IREz1ZMu978NADOY+3hhKAPGusnSj+rq69m0aeQ+vTksGidOSy3ejpK+TLvAXh+VSyyXMx7qKjRsS/z52bh+rkEs/D+GJ/qyoO6gfWWcOKetFLlRvpmzk4M7IcQZhUCzXtcY
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6903.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06607d4c-c377-4bc3-109c-08dd24bb2b4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2024 08:07:26.0178
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RQPvGKlQai7gW+hymzzvzxmHO0jVz5X2EtU1KzCsnoBQQrb5X9VOCamjC4Vl0mV2k2bai24MrOl21djJoUWjJawNwgsAzyuACqnzvrtDlW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5314
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_000744_135268_BF1E3F8B 
X-CRM114-Status: GOOD (  20.82  )
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

SGksIEpvbmF0aGFuDQoNCj4gPiA+ICtzdGF0aWMgc3NpemVfdCBjcHVtYXNrX3Nob3coc3RydWN0
IGRldmljZSAqZGV2LA0KPiA+ID4gKwkJCSAgICBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0
ciwgY2hhciAqYnVmKSB7DQo+ID4gPiArCXN0cnVjdCBtYWNfcG11ICptYWNwbXUgPSB0b19tYWNf
cG11KGRldl9nZXRfZHJ2ZGF0YShkZXYpKTsNCj4gPiBJZiBhcyBzdWdnZXN0ZWQgYmVsb3cgeW91
IHVzZWQgYW4gaW5kZXggdG8gc3RvcmUgdGhlIGNwdSByYXRoZXIgdGhhbiBhDQo+ID4gb25lIGhv
dCBtYXNrLCB5b3UnZCBuZWVkIHRvIGNyZWF0ZSB0aGUgbWFzayBoZXJlIHRvIHByaW50IGl0Lg0K
PiANCj4gSSdsbCB1c2UgdGhlIENQVSBpbmRleC4NCj4gU28gSSB3aWxsIGNyZWF0ZSBhIG1hc2sg
YW5kIHByaW50IGl0Lg0KPiANCj4gPiA+ICsNCj4gPiA+ICsJcmV0dXJuIGNwdW1hcF9wcmludF90
b19wYWdlYnVmKHRydWUsIGJ1ZiwgJm1hY3BtdS0+Y3B1bWFzayk7IH0NCj4gPg0KPiA+IC4uLg0K
PiA+DQo+ID4gPiArc3RhdGljIGludCBmdWppdHN1X21hY19wbXVfb25saW5lX2NwdSh1bnNpZ25l
ZCBpbnQgY3B1LCBzdHJ1Y3QNCj4gPiA+ICtobGlzdF9ub2RlICpub2RlKSB7DQo+ID4gPiArCXN0
cnVjdCBtYWNfcG11ICptYWNwbXUgPSBobGlzdF9lbnRyeV9zYWZlKG5vZGUsIHN0cnVjdCBtYWNf
cG11LA0KPiA+ID4gK25vZGUpOw0KPiA+ID4gKw0KPiA+ID4gKwkvKiBJZiB0aGVyZSBpcyBub3Qg
YSBDUFUvUE1VIGFzc29jaWF0aW9uIHBpY2sgdGhpcyBDUFUgKi8NCj4gPiA+ICsJaWYgKGNwdW1h
c2tfZW1wdHkoJm1hY3BtdS0+Y3B1bWFzaykpDQo+ID4gPiArCQljcHVtYXNrX3NldF9jcHUoY3B1
LCAmbWFjcG11LT5jcHVtYXNrKTsNCj4gPiBBcyBiZWxvdy4gU2VlbXMgbGlrZSBqdXN0IHN0b3Jp
bmcgdGhlIENQVSBpbmRleCAoYW5kIHVzaW5nIC0xIGZvciBub3QNCj4gPiB5ZXQNCj4gPiBzZXQp
IHdvdWxkIGJlIHNpbXBsZXIgdGhhbg0KPiA+ID4gKw0KPiA+ID4gKwlyZXR1cm4gMDsNCj4gPiA+
ICt9DQo+ID4gPiArDQo+ID4gPiArc3RhdGljIGludCBmdWppdHN1X21hY19wbXVfb2ZmbGluZV9j
cHUodW5zaWduZWQgaW50IGNwdSwgc3RydWN0DQo+ID4gPiAraGxpc3Rfbm9kZSAqbm9kZSkgew0K
PiA+ID4gKwlzdHJ1Y3QgbWFjX3BtdSAqbWFjcG11ID0gaGxpc3RfZW50cnlfc2FmZShub2RlLCBz
dHJ1Y3QgbWFjX3BtdSwNCj4gPiBub2RlKTsNCj4gPiA+ICsJdW5zaWduZWQgaW50IHRhcmdldDsN
Cj4gPiA+ICsNCj4gPiA+ICsJaWYgKCFjcHVtYXNrX3Rlc3RfYW5kX2NsZWFyX2NwdShjcHUsICZt
YWNwbXUtPmNwdW1hc2spKQ0KPiA+DQo+ID4gSWYgeW91IGFyZSBvbmx5IGV2ZXIgZ29pbmcgdG8g
c2V0IG9uZSBiaXQgaW4gdGhlIG1hc2ssIHdoeSBub3QganVzdA0KPiA+IHN0b3JlIHRoZSBDUFUg
aW5kZXggaW5zdGVhZD8NCj4gDQo+IEknbGwgdXNlIHRoZSBDUFUgaW5kZXggaW5zdGVhZC4NCg0K
U29ycnksIEkgY29uc2lkZXJlZCB1c2luZyB0aGUgQ1BVIGluZGV4LCBidXQgd2hpbGUgaW1wbGVt
ZW50aW5nLCBJIHJlYWxpemVkIHRoYXQNCnVzaW5nIGNwdW1hc2sgbWFrZXMgdGhlIHByb2Nlc3Mg
c2ltcGxlci4gVGhlcmVmb3JlLCBJIHdvdWxkIGxpa2UgdG8ga2VlcCBpdCBhcyBpdCBpcy4NCg0K
QmVzdCBSZWdhcmRzLA0KWW9zaGloaXJvIEZ1cnVkZXJhDQo=

