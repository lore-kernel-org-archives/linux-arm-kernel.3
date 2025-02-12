Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4EDC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 01:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BtbwtkMlTiUXwmTKGBlosNkfhKuXFyFFFsrSxFEZq3M=; b=uXnu26ZeK3WkMKQFVa3CWzgSjZ
	G/WzLqhB1NYFFTqJHHOUoDH8TBzYIF6OE/bw7Ph7rTC3K0w/VVyV0yA1HjJnsjwn4bFS4zLz+73dF
	gMs/1tC5uELIj6ibEzM+F0ERWC8nEot/+FmCkAoiJpMNERir1I2MvlLR9RpAP3xiURitBBF5kyZ2d
	iZZSnoeHpYtX0bTm7qJtzZZxCXrtwr9Ra4PtT6KUwsR9eeNjw/xq9876QE7lzBQDuJB5JZs6/kWt0
	cCY5PKpLnEmPZFfTUqWFuzAolx0isDM0GVPLSMt/ijXc0o0Iq0OsrfoqDW2TjNzDqWgmXXTLdV8IH
	OOXZBRwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti1iy-00000005qk5-1dXp;
	Wed, 12 Feb 2025 01:39:36 +0000
Received: from mail-eastasiaazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c400::] helo=HK2PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti1hY-00000005qVZ-3KWD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 01:38:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qCEJZJ1FXdRnWwNUccALXT+81OOBWlwhI3srufezNboqhLJZ5XsPWMM90wwAW83bNcZ2czQiRmTooCPa3qVR/uUhKdRWy2EmstD/+kAbai+ygA+luwSPEchaz5X117F8ppdOFYJc0HKZdaZBgKK3pplqRI3ljO2+DGCCyBasN4l20U2hx5MfoW74vXVLjz7/OxwrSvToWw0TsOecsKmrK0o5k/B7w+Us+XaaEjk/zE6UWpIo2U1TWlFQuN5wN8zI5jjP2Ursu+u5Bs3WbgPSAIPq//TAiBWYo0mOFfC54zHZ7hcU/0COpeknCvJh5ZzVX/ZUsq1jPuOLEGW6Ua5sPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtbwtkMlTiUXwmTKGBlosNkfhKuXFyFFFsrSxFEZq3M=;
 b=EOrAiMXZmNpLvmdnl8VBjDolnJg0g+89cQYa2bg8x91JOpUqCzqlF+yY98D1dKe99HPYioEZQBd8bfdwFPBAG14kq8JtReOWN6oiDefSEziTLw+9uCDJDtzdU6y4jy+ZGX+m01AmnmHNYvhVyaXjALP+CwvkVYH88HIDj7HRJxOFBRi0jJhDa0VsoGSo8iNytAVvmf65AgWDyWGG05YdSlrk00wN9PoIM6IM7KsGS/aSXVVH5EUI8YTfv8d0od05qlebUGmG3mtzRJenu7yuK95aPcsRp+nhddFSQ9XLBmXFx0z03tbu9W10Lg0pPBaDbqbtmeubZWfJThboxKcZ6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtbwtkMlTiUXwmTKGBlosNkfhKuXFyFFFsrSxFEZq3M=;
 b=UgormYURHDXcm+kKEgUaO4GB4KQgNsc9cBGA2E12Q9pw1dfLX/fiRUwqM9pLirMB1B686ZSmBDlrDimFUIrYLtynydMpqt427qJh5lsSfHu6x8XReMWhmMe21i8sszucysl7+O02ukLFgWIAxBAU6TGhcxvYTB5Yjz1/3PP8Nki95/ZASfwgkFkBvniEf017LpewUMk2Nn9sY5PyLnpprqWUn7O760l1uHyb4ydrPFSXW8tXM0yGyt/QW3pHoMycuoaOGQUZjwpaIXhA5Jae9W5rFAnCqi8wlXhYCgbg3FxqxRa7AToOSKvIYZHVt+vytDPyFWGQIXAhikVzWEHu+g==
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com (2603:1096:400:45f::6)
 by SEYPR06MB6279.apcprd06.prod.outlook.com (2603:1096:101:139::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 01:37:51 +0000
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b]) by TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b%7]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 01:37:51 +0000
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "eajames@linux.ibm.com" <eajames@linux.ibm.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au"
	<andrew@aj.id.au>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4] media: dt-bindings: aspeed,video-engine: Convert to
 json schema
Thread-Topic: [PATCH v4] media: dt-bindings: aspeed,video-engine: Convert to
 json schema
Thread-Index: AQHbe6ayI47ZWP8RUkq40RulR4uWLLNC5fOA
Date: Wed, 12 Feb 2025 01:37:51 +0000
Message-ID: <TYZPR06MB6568FD90F6A416262C02FC02F1FC2@TYZPR06MB6568.apcprd06.prod.outlook.com>
References: <20250207101458.3757723-1-jammy_huang@aspeedtech.com>
 <20250210-crow-of-famous-drizzle-a4bb03@krzk-bin>
In-Reply-To: <20250210-crow-of-famous-drizzle-a4bb03@krzk-bin>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6568:EE_|SEYPR06MB6279:EE_
x-ms-office365-filtering-correlation-id: 3f64f15c-c2bf-4389-49d2-08dd4b05dd03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WjVxZStDZHhmcHdWR1Juekl6bjRsV3kyajZkMGVvdkJuTGdJSjE0QUZJUlZD?=
 =?utf-8?B?eGNYMy9SS2t3OFlMdEtYWVhBTUF0bWNjNzhoNndwWVE1TEpkcEVWMmoxTHp5?=
 =?utf-8?B?YnM1bTI5Unh3RXlocWFXbXd4UHNxbkgwY2VJc3RQOXk1Q20zNUVHYWpMYXh6?=
 =?utf-8?B?MkEwR1pQYmF4TUY3K09ibGFYeVVQZEVpakdHdGFuZ0U4emtZajMwYmVuUkFX?=
 =?utf-8?B?VWxyYmdSWnFaNUo0WmkxaU10WVZ4azhJL1hUbzlNcWdqcXBPSVhNTGdoTit2?=
 =?utf-8?B?OFNCVjB4T0Q4dTFDem1XRXozc0lpbTg3cmxFQ283N3IycHorUzJycDQrOFh2?=
 =?utf-8?B?VGlpQjhDeGhSWEVlQk9xRGZ3MGRNVlN1RDlyZzZIaDJKWVlqd0ZjSm85Y0Qx?=
 =?utf-8?B?cnB2SFlrTGR0bEZaeFNIdVZSZng5R3lTajNKMXdIa0ZnMWFxWUh1eXpaaUZk?=
 =?utf-8?B?SWc3b3B3UU8wRk5uUFhOTHJJYzFWWmxHOVh5dDFXYlNNTDNDRGZLdjljWEE5?=
 =?utf-8?B?VkpCRGl5K0ZsYXlndkQySmJLRzhDTkxnR1Ewc0Q0SFUrM2V4ZmtCQ1RmTXJW?=
 =?utf-8?B?Tnp0RGFRb3NDZ1RyUlNJOGRLQ3dnUkljcVROaVp0cjdhckNVOWFpMytnck4w?=
 =?utf-8?B?cXZMUi84cVk4aXZCRFJTUXoxc0FwaEh4Tnk3QklkZ2VlVWNOWHhodnYyVkZy?=
 =?utf-8?B?RUhRWDlpOVRKMFltYy9CaG1vZTZHUEFaSWVsQk5EZ0JHbHpaRHVaK1UycEhL?=
 =?utf-8?B?YXd0azI4aUFCWDZXT09BOE9EYlpzMDZpMTRBVmtGQ2dmcEVVWVZFZDhEejZR?=
 =?utf-8?B?eGVnSW9OM2FkOWxBNERCMUQzcWI3Ykl2UFRjdmFxc28ydEM5eHpPa25TdTZK?=
 =?utf-8?B?ZkNTM3dFRkFoRENFWlh2Znc1ajR6Mi8xQXdRb3JNcHJSN0VRNmxyRVlrV0VS?=
 =?utf-8?B?U0VsUzhSb1lJVWQwbmxLWlVCTy9KcFdtQW96ZW5PWVU3YVczeGhvdHF5aVhw?=
 =?utf-8?B?b3huSCtTVmZ0MEhOdmhLUHpOc1I1Vm9LRytqbXZIOXFPUGFrbWx6YjRLeUZ6?=
 =?utf-8?B?QXRSdStXdEhPRkgra0ptd0I0azBUcTR0bVpteUN4TVJrQnp2VTloSVFKNTBM?=
 =?utf-8?B?cGRNK0h0RHdMS014MWU3Wk52SXVudzdTL0gwNlBJZFQrUXhvVVhxeWFPZGsz?=
 =?utf-8?B?MzdxSTJXMVpoM0xvSUw1ZFovUmxNS3Z2dmpvdEorcFZHK09oYTg0L1dRZ0M3?=
 =?utf-8?B?dXQyRENLdWp2bjJ3djZiL1RCeW80VTRaYkFPMkFZUUplZ1lXOUg4RXV0Y0pS?=
 =?utf-8?B?cE9aZDd2bCtrM2pmaFMreElwNGp1QUJJWnR2b1Q3cXBxbmpHNmNGL0FhRHFx?=
 =?utf-8?B?K05pdFZ6ZzYxS1BHOERjYnlwVWJYa2pMMndNMDY1YWNNaG5USHhDQUwzTEF0?=
 =?utf-8?B?Z3NkU21SenJVdnZxSU9XN2pMVjFaenhJK2RLcUY4VXlHRlp2NEpWVFU1dXFi?=
 =?utf-8?B?WmJIOEo2RTZLdEdXSGdIWDlGYkRmcG4zK1o5QlE1L0h0OFVTZm1oRERQNEor?=
 =?utf-8?B?V1lyZkNiU2FmYXFzY1dFQUFmOUVaVnpuWGRZMDZDL1hvcEFyYUk5ajFGeTNZ?=
 =?utf-8?B?SjkycjFxTWtYYWhVV3lPZGtabzBxUGJaUExuc3ljOGs5b055M0VqMUVCRlRB?=
 =?utf-8?B?LzM5c3N5enBsa0EyRjVrMEhUMFJXWlUweXk3ZXMyc05uL0RQMC9heml3dDRi?=
 =?utf-8?B?Tk9jS1pxOUc0czJCL3dDK0R6aFBSeHlDK1BjOEN2THlDSm90eWpBRnJTdHB3?=
 =?utf-8?B?MldrRFJ5TnJxVDcreTBEUTdFR3hJTXhtTjdUNFpnM1JhZllNWlRoRmhNclZW?=
 =?utf-8?B?TjNXVGE0ekQ1akhtZzNzdUtvU3NadERUNDUyWHBGNS9YMzNwbkpGRFVqV2U0?=
 =?utf-8?Q?zOzBhpAD6if7XotFQY2iw8dPW/PKbFJH?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6568.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cnJpR1d1UFF6c2ROVzhXK1Rady85QXg2RWhsVERSb1pPZ3ZXbldXc085TElu?=
 =?utf-8?B?S0hRZlNjR2NsdXdGNmRuWGZZbUFqSVJlMWtKNHpWamhJOGxGdVlhbFlPaXI1?=
 =?utf-8?B?S3QwUWFYYWlKRElMYlI3K0Yzem5sNXBQSEk2SE40YmswTExOYVZRUDhJSDRC?=
 =?utf-8?B?M0pyT3Y0Wll0bmQybGJlZzNBMnJvMTJ6K3Y4M1VwWU8vRUIzdU1QZm52QkI3?=
 =?utf-8?B?aXRHRFg5ODFsdXNFMUdzUE1CMWE4UkJEOTBZYlAxT3d4NmllTnlEL2JpdnRh?=
 =?utf-8?B?ZGw4ZjJHY3VMWFZWK2huNUlTcksxMzY3Q3J4TWFmZzBNYXBxYjRsMVkzTzdy?=
 =?utf-8?B?ZTQrM0ZNMkFiM05BcFVVK2QwRkhvVEE0d0RTMnlTWTh0Wi8rQThocTJDelhT?=
 =?utf-8?B?TTY1dGI4RXFGUXl2Kys0VU50MmI4NW9xSngwdjYybGx0MENmeEdpcTMwVGx3?=
 =?utf-8?B?Tmd3WTJld0NJdU5NMnZrWWZUK2xNdmRweWFmaW8vN25vbU1vbVRDbFRFYnMx?=
 =?utf-8?B?a2ZlZjBRUktORzZNSDJkcHR2UW9pMzhUUFl3T1JyUG9qK1hOR1FDNDkzZUtK?=
 =?utf-8?B?c3o5WVQxbkYrdjJBM3Q2a2F3UDUzWHkyWGRoQzlJVFBQMXAxRmlCaHhJREpY?=
 =?utf-8?B?dUJLQnVCR3NscktGVkRocWEvOXoreXVNa3JMMjY1OWtXWitvWjVPQ0VTdmk3?=
 =?utf-8?B?b3hpUnZKMGlMT2c0OGRkWitWdzFFNzRNQ28yTkZFelZkc0Fsem1FYXlLT2xM?=
 =?utf-8?B?SFZSbnNlUnVOMFZpaXBjQkE0cGlPZWlabEl3VFpZQXhSbStGQlZxeENjbFpO?=
 =?utf-8?B?OFY0bVdqNnk2ZzZRbGNDQWhQUGd6eVJaMXVLRE93ajdEK1AxNm1qaFR2bTlu?=
 =?utf-8?B?VlRvRSthZk54QUw1UmtmVGRwRk9STEtTN3I4VFhIbjcvZTJaR3U3WXVhN0d2?=
 =?utf-8?B?MERSazVOeFJ0MDhtaXdMb0k1cGtrZDRJRExUemJmMW0rODRqejFOc1VrOVMw?=
 =?utf-8?B?V3hkOTlTaEhaSUFFUjViaXpBSlpnbXhGZWw4Z3cvU0dua2hwemFPeEJnZ3px?=
 =?utf-8?B?aG5oZUd5MTF2Y2JXZkJRZlpPVEwvVHdWeUpYaEtoUVIyUjdwSTRnbHVQVE9h?=
 =?utf-8?B?Z3hmNjJ1WnJFR2RaSHRDdnFORlArRGxTYXZoc3cxV01WSEdGemtmdktJcCtP?=
 =?utf-8?B?RU1xL3ZKZDVtOGhOcTgxSzE0UXBXUnlCamdWMmtWVTYzd3ZscUNEc1lkVHdl?=
 =?utf-8?B?cGpLMnNDd2RvYmJCZ2UxV1dyc2I1d1ZaZ0JYdERrbzNBN1Z1M1MvbDBVNnhQ?=
 =?utf-8?B?ZGZpZWZET1FaZklGazRnNVRkZmRpcjRVRm1UbXNZeDZIbmwxcFZXN3dnbjBx?=
 =?utf-8?B?RVI2VlhaZmhkeVlrbDFFOU9COU10eE1pYmpGU1pOR0hWcDhUN1EvaHNvdWN0?=
 =?utf-8?B?cG8vMDJhZkNnSldOdHA4bHM4K2pvY1c1bk9aejdhdU9KQ25IdDF4djlsL2hD?=
 =?utf-8?B?c0VpS3ZzS0syejFWaGU5RUxpTDQxWi9mSEllK1J5bnpQR0NpQ3ZXODhkdHdV?=
 =?utf-8?B?cFJJR2I1citoTGw0RVdiTGhXbnltY3VjS1FvKzFlQ1cvMFVocTUwM0tSNXcx?=
 =?utf-8?B?VDhuZEliaEFXeFFlNHBUeUM4VzZqOWFucm55WXIrdGdUTjZVTHlxUERid0s5?=
 =?utf-8?B?L3ZnTGNKanJFcUxzMjNGa2Z5bFNkVGxNUWdjbG4vZGxmWU5oRTNYQ25Ua0h3?=
 =?utf-8?B?NXN5NlUrbmRLSmcrbkwxY2p4eVo4Ny84Rmo3UjhYNFlaaDdycEVYekxCaVJj?=
 =?utf-8?B?Qjg1VTg0RVdpQ3JXT3BTdUR2RFpZUEkrVC9GVWpRakZRclJKdVdGRm5DNGtT?=
 =?utf-8?B?M2pTOFJnYVBIYlV1eVJpWnI0TGl0OWhOZTJmUVA0Mlg2VkZiUDFHOTY4WmJT?=
 =?utf-8?B?eEsvclgzWkJqOW83T3AzTnRTQ21ZeUlMcDY2WktneTRxNUw4RWtRbFgrKyt0?=
 =?utf-8?B?RGx1bXFKSXhnRE1ZMUFRcUhtNC8zSER4RWRKRjlPcEdpeHBwbG5VV0FWRUR0?=
 =?utf-8?B?TEdYNDhudUUvRWFtWlBuSEloNVNOS1lqYURDU0hWeExRSldjTFFmMlEyWU1Z?=
 =?utf-8?B?dUdxZzdzT3g4VzBZRktOR2NzV3hieUd3VjBVZHhEME12eTVEQ0NSUVVyVTli?=
 =?utf-8?B?M3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6568.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f64f15c-c2bf-4389-49d2-08dd4b05dd03
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 01:37:51.1094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z6Qx2JB2bfVonH+gC4iUX+TdHeidFC/cax90ITHgfn8QgwQVIgAuqSYaN0l/3ykyYgN8NdzppCG5RbVTbZm5IxkTqSAq6JiE+y8C484Y/XE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6279
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_173808_830102_2BCB6671 
X-CRM114-Status: GOOD (  14.82  )
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

SGkgS3J6eXN6dG9mLA0KDQo+IE9uIEZyaSwgRmViIDA3LCAyMDI1IGF0IDA2OjE0OjU4UE0gKzA4
MDAsIEphbW15IEh1YW5nIHdyb3RlOg0KPiA+IENvbnZlcnQgYXNwZWVkLXZpZGVvLnR4dCB0byB5
YW1sIGZvcm1hdC4NCj4gPiBVcGRhdGUgYXNwZWVkLXZpZGVvLnR4dCB0byBhc3BlZWQsdmlkZW8t
ZW5naW5lLnlhbWwgaW4gTUFJTlRBSU5FUiBmaWxlLg0KPiA+DQo+ID4gQWRkaXRpb25hbCBjaGFu
Z2VzOg0KPiA+IC0gVHdvIHBoYW5kbGUgcHJvcGVydGllcywgJ2FzcGVlZCxzY3UnIGFuZCAnYXNw
ZWVkLGdmeCcsIGFyZSBhZGRlZCBmb3INCj4gPiAgIHZpZGVvIGVuZ2luZSB0byBjYXB0dXJlIHZp
ZGVvIGZyb20gc291cmNlcyBvdGhlciB0aGFuIFZHQS4NCj4gDQo+IFdoZXJlIGlzIHRoZSBqdXN0
aWZpY2F0aW9uIEkgYXNrZWQgZm9yPyBJIG1hZGUgaXQgZXZlbiB3aXRoIGJvbGQgZm9udCBzbyB5
b3Ugd2lsbA0KPiBub3RpY2UgdGhhdCB0aGlzIGp1c3RpZmljYXRpb24gaXMgcmVxdWlyZWQuIEFy
ZSB5b3UgYWRkaW5nIHRoZXNlIHByb3BlcnRpZXMNCj4gYmVjYXVzZSB5b3Ugd2FudCBuZXcgZmVh
dHVyZXM/IElmIHNvLCB0aGF0J3Mgc2VwYXJhdGUgY29tbWl0LiBJZiBub3QsIHRoZW4NCj4gd2hh
dCBpcyB0aGUgcmVhbCByZWFzb24gb2YgYWRkaW5nIHRoZW0/DQpHb3QgaXQhIFRoYW5rcyBhIGxv
dC4NCg0KPiANCj4gPiAtIFVwZGF0ZSBleGFtcGxlcyBhbmQgaW5jbHVkZSBhcHByb3ByaWF0ZSBm
aWxlIGRpcmVjdGl2ZXMgdG8gcmVzb2x2ZQ0KPiA+ICAgZXJyb3JzIGlkZW50aWZpZWQgYnkgYGR0
X2JpbmRpbmdfY2hlY2tgIGFuZCBgZHRic19jaGVja2AuDQo+IA0KPiBFeGFtcGxlcyBhcmUgbm90
IGJpbmRpbmcsIHNvIHRoYXQncyBub3QgcmVhbGx5IG5lZWRlZCB0byBtZW50aW9uLg0KPiANCj4g
QmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0KUmVnYXJkcywNCkphbW15IEh1YW5nDQo=

