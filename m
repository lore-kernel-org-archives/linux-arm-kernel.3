Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38149606A322
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 19:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qNwAfJt7;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=FMx7O0wt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GhU0cQp7MT+digRCMQRkrThIUiG/SERTvcLRcWm4aEk=; b=qNwAfJt7Cbq2C/EH7EJ8QtDTyO
	NefFYk+K3DZ+EvlUsQBJZE92yxJD3wtmls5Te9tmtbvbUzULrxNbFOPqjRF6kTdN4GmG/YoFpwpL0
	zfnjw94HqDZBtnn0RtbQII4XyXWY8VQL3hj1O4wBM0wNu/nu8zxwkYHt/ePYNeZ4uPhqiqFI7tsuh
	TiZjCBdtNt+6sIwW8RsDa6bZO5v/7jceqUKAP8JLaZMcV4h6nvh0dVL77yBRRYJ4sc76zPk+CAQ+1
	oEZzXF6uPEwAmH8pF6YPV9fixGaRmSrLYAln26XdyMdCOVlx3HQIX+VUM8dlol9TCbB7wuC/TNZE1
	NrSOE13A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKhVK-00000000T0A-3W9a;
	Sat, 24 Oct 2026 19:34:10 +0000
Received: from iad-out-010.esa.us-east-1.outbound.mail-perimeter.amazon.com ([34.197.254.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKhVG-00000000Syo-2aVT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 19:34:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1792870446; x=1824406446;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GhU0cQp7MT+digRCMQRkrThIUiG/SERTvcLRcWm4aEk=;
  b=FMx7O0wt4ruBDhM9bKM6uz3H3m2HlnJ3hKFEdvT+1Co6HNum6eJCJy9Z
   XYRLkHQ3mhyQYHl+JYLsWruVFG4Mi3yEng/+cVn2Jg9f45enlJIQW6Sp5
   faP8+Tq1j+/haSByXY/6zywxlzGcBDseLvIpLkjBrRcKsVFZ9lFVrh9XS
   bt4ouawfTW384ZM6Z10wwERfKxWgz9zltsy1E+UvaCYbIUiNX93wWuPzq
   aTT1ZhhkOibpO6+Qpb3w3RvVhJRZGP82oEgrvMyUPYCU3Hzdg9FiAtFWe
   hDVN+JDMWYmoCRQ5FAAS9w2tQcQbS0XJysmcDtifeTEgSp8Itc8NoyPdk
   Q==;
X-CSE-ConnectionGUID: IqkNWVoQRcqjxx6BR2rWiQ==
X-CSE-MsgGUID: 9BJfgg9gSV6SkO+/BQ5uog==
X-IronPort-AV: E=Sophos;i="6.27,176,1787011200"; 
   d="scan'208";a="30115827"
Received: from ip-10-4-13-79.ec2.internal (HELO smtpout.naws.us-east-1.prod.farcaster.email.amazon.dev) ([10.4.13.79])
  by internal-iad-out-010.esa.us-east-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 19:34:00 +0000
Received: from EX19MTAUEA002.ant.amazon.com [72.21.196.65:4046]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.21.57:2525] with esmtp (Farcaster)
 id e55f42ab-3f8f-4e7f-91a0-ee00b328630f; Sat, 24 Oct 2026 19:34:00 +0000 (UTC)
X-Farcaster-Flow-ID: e55f42ab-3f8f-4e7f-91a0-ee00b328630f
Received: from EX19EXOUEA002.ant.amazon.com (10.252.134.207) by
 EX19MTAUEA002.ant.amazon.com (10.252.134.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53;
 Sat, 24 Oct 2026 19:34:00 +0000
Received: from DS2PR08CU001.outbound.protection.outlook.com (10.252.134.239)
 by EX19EXOUEA002.ant.amazon.com (10.252.134.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53
 via Frontend Transport; Sat, 24 Oct 2026 19:34:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XozWEJiULqR4kmh2Zn+yCQVVynANuYPFnzASgxI+NfE9pmVYFA2gwfDQyJUPU0L1tg4E84h6qN8SXhQXdRkXydLPwbfkQ0sDBHQEVTaOmRZs+A/MQY6c5p5/2jnS7RgIyxG5xD/X25ZbizPRSn1yOhzQwXafsseMC3tVbEyoU70qRrvwKwGJlrZSe0KCEcEbRe64iMtbPiV3ebV7pV4rV7xqsXZecjei5Cl84qIryGNYrbkQWYxygi7wQvGPZwcfIISR/Uh0nV6s4RUjWoWfLeqDr9SxKiUCrkdi9Qc0DB72lLIc8vxHZtGX3YL3vQqZMwK8Xvuh8zAJy77/87XHWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhU0cQp7MT+digRCMQRkrThIUiG/SERTvcLRcWm4aEk=;
 b=aCtTy1fm3Vl0+yYKouVPKjv20fn67RqAW330A3zwIdadMfcCxiNIQiZGhrWDVHUEQcX4nchXD4or25O9xn8qTtHi3+K7b4gAUWSsNwQKjXsK1vCSb7GM8x2jFfBwUEdffYy17NNagKGjdvAWOQ6iB57jY8+AK4Hy/8eCJuCDO1WSKM8IfKKGPKdrG+SXH8VdFHhHcJbImYw5NVraEqC1xdvxhnzlJqUWXKgf1FlcefWmpy2muvzXpDg8KCdjMPqz6t2g7YQPVVwCagHYYadWqqnyWhybNK8lXPv2Bm12bvlou7cAwuebUe5VE857WwjfYsDMAP6P8aM9AMGjtr6WTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from BY3PR18MB4722.namprd18.prod.outlook.com (2603:10b6:a03:3c9::19)
 by LV3PR18MB5706.namprd18.prod.outlook.com (2603:10b6:408:1ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Sat, 24 Oct
 2026 19:33:58 +0000
Received: from BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219]) by BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219%4]) with mapi id 15.21.0451.022; Sat, 24 Oct 2026
 19:33:58 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Radu Rendec <radu@rendec.net>, Thomas Gleixner <tglx@kernel.org>, "Antoine
 Tenart" <atenart@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 4/4] irqchip/alpine-msi: Add debug logging for MSI
 allocation
Thread-Topic: [PATCH 4/4] irqchip/alpine-msi: Add debug logging for MSI
 allocation
Thread-Index: AQHdY+6dvpll8nvggkW2WsA/tucOcg==
Date: Sat, 24 Oct 2026 19:33:57 +0000
Message-ID: <BY3PR18MB47221A1FD4F6674E206DDEF1C6632@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20260923083703.38974-1-farbere@amazon.com>
	 <20260923083703.38974-5-farbere@amazon.com>
 <d413238a3c5533572013d1fb27142345aabdd101.camel@rendec.net>
In-Reply-To: <d413238a3c5533572013d1fb27142345aabdd101.camel@rendec.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4722:EE_|LV3PR18MB5706:EE_
x-ms-office365-filtering-correlation-id: 39a3b800-018a-4e3f-a078-08df3205bf92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261022105027099003|4143699003|11063799006|5023799004|56012099006|38070700021|261021121427099003|10067099003|18002099003|22082099003|261022075727099003;
x-microsoft-antispam-message-info: eKHh0zt8vlnKyxwsC/ZUoRqN8XYcTDEvfE0HbkurS4Vp3PPeWO4ZMUt6XuvCYSpaHRn8JtQ55MmJr/L+F8HNoEY9CQ8A1n7+xtTqKKYQVNF/bZEn7zJalviuAHNjC85OZsRkbxEkjESUKeDQ6zlzLcIztUrWjuIwFlTfXRe58GqgQshDC3QQ9kEhfezNlH6bPL63tgB8G7OxxE4qiHY2jSi2mWY+IwclrIbpOLoUNBXJdUjTtnQ4kNP5MKMIq1AeHGioVt+d+iLHNtXdFsoY3lN66t6iauAXoumZmqWAoE15bhZY7M/FgvVzieXEJB1+pSbUJobxDXXL4zmivpue58Fj9uTa8OHNQeDugH4eDQ6Sb4YIkJTAtJx/46jpADHUb0MQzWOkSCbmCk40+BCWBBXxdM2f1X40cmQo5qlMDOe+6x4QIlYIUzXj4RZV4eo1ip8yDUt/KC8UrhJDRl9xfikRSpuDF6gwNW96XySfp1gGFOiPQxEvY4xdhz4KlGVVLZ7fK3eLi8fmbTAArYoj32AmjdgQ33SaoK9qfwx5B08fJya7xK/RoXTnrrakuIkW3EdDOBb/wowZHnKpgG8ikSGmJC6B/Wm1T3z8bDr37jGTGuYoCXwFVK2QQmzeQxgQrDGPTfUFlg5civrxdHkpWGoeONBfXVY4qqS4T6lx2Fe5VAcOgUFhqhmmV0Kayi4S9NjTINliK0moTlLAwrfOGlNudaysz3I063a9cdYNu30=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR18MB4722.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261022105027099003)(4143699003)(11063799006)(5023799004)(56012099006)(38070700021)(261021121427099003)(10067099003)(18002099003)(22082099003)(261022075727099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTEvdUgxUmFlK05EOTE1OXhsd1dJQ3lGQldDd3JSbGxqU1JCSk4xNXFxV1ZG?=
 =?utf-8?B?NFhya2UxY1o5WWFJK1EvT2dPZ2tFU2RBbWRlQUpSWlI2OGpvNEMvRlJqU1g2?=
 =?utf-8?B?aXQwb0h3VnlkYkdGWk9hNDAyUkxnVzlKSDNWV1BuTVFWcDJyaUJLZXErR3Nj?=
 =?utf-8?B?WHNoY3BnKytueUpyUFk0R3FXUDl3TnZmRXFOckpQeTFtcmdENFlENkx0emNH?=
 =?utf-8?B?UlIxSFFwZTR3VXFOZWd6WExsNDM2U1FqRHQ2TFNUSXpPME9EbjkwUXhES2dW?=
 =?utf-8?B?ZDdISDJNVWxLRWxqVXE4alA1eURpejJFRHlSVjdDQkF5Z0FTY0t1VXJNcmFm?=
 =?utf-8?B?R2xpUG93T05rNHoxbGZsMm4yQUZIN2R4bU4vdm1XM01xRklWa3FIT1psT1dF?=
 =?utf-8?B?VXB2N0grVTh1aHhqR0RCdnNGeGVRVHRSOGxvZHBzYndVV0c5Smd0ZEl6bkhR?=
 =?utf-8?B?WU5MUXdqbkJITUdlNGRwZlp3Y2FscklwS09ML0NkMUdtKytvRE1ZK0c3OUFM?=
 =?utf-8?B?SXFzSUJGT1g5b0pGNGd4OXZMbUY3SVRJQTY5V2xRbkh5SFZQcGdkakIxTE1u?=
 =?utf-8?B?NDhSM3FqRHJ5T2FoQ1VNTUtPUUdYOE1FWlRuTGtndERrUnFSS20xK21QVHcx?=
 =?utf-8?B?V2lWVCthUEJuVTFKTUFmcWwyNmMxUFZ0bzlXMTk2RDF3WFppQ2RuMENPSFJu?=
 =?utf-8?B?QjhWZUFlR1VOSzAzaERzZ3FRbVJjcnZzUy81SXNNMjRBWS85Z3BKbUpBS002?=
 =?utf-8?B?S2diWGJlMk1kUmowZG5qSGdkUDhwM09HTjBUVnk4T1J2cWdqeXphODJLMjlS?=
 =?utf-8?B?MGdPUnZCekVsUVJ6U0JkZnRPZmo1cW9lMC9xaVE5blVHWWF3T3dlOHNTYTRP?=
 =?utf-8?B?Q1pQeTFjVlFtQnhUV0xKUmQrbi9xQmFrVEV1dlFUUXhIODFFVDVEaXNRRC8x?=
 =?utf-8?B?WFJUQkR6QmYzTEsyR2xjdWZLSUdqNWRWSkxSdnlrN2NRT0kxTnBzRk9zbU00?=
 =?utf-8?B?dUNLYW5ZamVPM2dCOFBJbDZXUUFnR3ZldFdJRHpEUU1zS1F6cGVqenhpbXZl?=
 =?utf-8?B?V2NCUnBoVkpRdzVrSTZtcEEyV2lWTHh2UGliYUVaRFBNaXhVdWJBcGlkb25t?=
 =?utf-8?B?TnJqTVpFZVpXSGJHWU9YUGNGMkEzWnZ5dzFuOEZPNzhaWGtWL2pmM2EwRHBN?=
 =?utf-8?B?SEJDNW84ZDdGeFRwdjJGZWI2Z25DTTgyRDNPa0ZLZ3pKL21YZmJQU01iZUpK?=
 =?utf-8?B?cWxLS2RFNU5ETjZZUVFKdUJhZWVPWUpYVk5rNmhmalM1aFg4a3ZsNWNRMmRL?=
 =?utf-8?B?RGtwalJRTG43ZEZTZjNvcUh0akpiQXNhTkIzKzVyWHhwajR3R1MvVWU2SVZP?=
 =?utf-8?B?ZmhFN3hKMzRQb0pETFZIbCt0L05KeWo2L29PaXpYVXdCZEhLRFRsYnlPVjAr?=
 =?utf-8?B?elM2V2dRbmM4TU8xVzREV2dlVkdiWUt0eXlhUWszcWdnQlBadjkvQ0VobFdL?=
 =?utf-8?B?bkpuL2tBczRBRnhBKzlDblhDV0RIY29zcHFqVzB3SlE1MHBjOGsycnNkWXc4?=
 =?utf-8?B?NWVDNHNrQW5HRzBJNzVIT3FrUlVnS213dktuMnRvRExMeXpyQm9QT1I3QkpF?=
 =?utf-8?B?L0lxSndnYUQ2QTBtcnVjbTFDWjh5VGRyQUxBN0JxaXR0YWtOaDYwVHI2YmJ4?=
 =?utf-8?B?MnNXUkM5ZFFxbFlZVUVMVUo4akhwQmpzK3MzRXVTMVE5aG94WlFrckpkZmhn?=
 =?utf-8?B?Ynd3eWZzUVBqRlRMWU5oY01PSzFLVlE1LzZtT2k3NlVsZmZqUnJoSUZRM3pQ?=
 =?utf-8?B?SEsyc0R6OXk1ZkRVbGNYY2lneURJcmF4Nkx0RElIa3NQQnhhVXlxNXovRVYz?=
 =?utf-8?B?SmNNbmo1clVHRlg5UEd0VFFPRjhhaU9zN2F1ZHF6dHhKOWQ2N0VVekY1NWtQ?=
 =?utf-8?B?MFNCSEx2dExWcGFVYldNa2FxbGNGVWQ3UU80aVFJYTNtWktJVWo1N3N3K2xQ?=
 =?utf-8?B?Z24wNUw1SU96YmVnRVgvVk5RK0pwQSszc25YOUNsNXJXaVYrbERyUnVqTlBZ?=
 =?utf-8?B?QStBSmRlUkFRcTEvR2pub2duYjNtL2dqV2ltVk9IR01zbU5WejF2LzJrYnFr?=
 =?utf-8?B?TG5oTDdqcWx3RE5OWE5BN2FXUTNYekhROC9UakVXWStlR0pyMkxiVjdPaE5U?=
 =?utf-8?B?MEpLa3g0aDB3M01jajFMQ3RSQ01ZbExSUUlvZ3FWM21pOFh6WGpYUmd3WjlX?=
 =?utf-8?B?clRYN3lNYzh1T09naU1UT1JZdDA2STFBOGlCQzhiVXNlcVg0bUhOZmh1KzBS?=
 =?utf-8?Q?u9ckqReYilCg+CCi5I?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: g/0nK0eX0hwKu85m+1YSJ+rs9pwD/aI2M/I8tX2iOTQVV/4oDCwGYDbf1mwmkhMfd5gVutACCnd596eK1/l/NV4+zPIRtuOJmetlHQY+i/+Hbt4FB04tu6NkVABYPdolynDA/HuqOmDVZDlbLy5KiQOctvfIcqRT4qupHEOQqCsUfS6BXQ0aCsGhJOO3uR57FvI3VJLnp9pcpTVVHVqWzfjL8Bc3Ieqe8UHu0V2tmwIqfz7rihBdzc1QQJPccTL0bcj5tWbCoI+057dv/jlkXw49n4dsOR1oFkSYCz8HtTEE0lSm+ZLrim2NZWOKbcLm7MriW7jlarmFWW4PeLsRpA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4722.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39a3b800-018a-4e3f-a078-08df3205bf92
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2026 19:33:57.9913
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LshfKaZZhLRyP/6+jFq/6vsHBaypLhTqfHIH1ESBuRdV4C++uslwmOriDsjez2jvr5Vw17sG1RIOlht+IET+9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR18MB5706
X-OriginatorOrg: amazon.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_123406_793887_FE946510 
X-CRM114-Status: GOOD (  16.69  )
X-Spam-Score: -11.9 (-----------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU2F0LCAyMDI2LTEwLTI0IGF0IDE0OjQ3IC0wNDAwLCBSYWR1IFJlbmRlYyB3cm90ZToNCj4g
T24gV2VkLCAyMDI2LTA5LTIzIGF0IDA4OjM3ICswMDAwLCBFbGlhdiBGYXJiZXIgd3JvdGU6DQo+
PiBBZGQgbG9nIG1lc3NhZ2VzIHRvIGhlbHAgZm9sbG93IHRoZSBkcml2ZXIgZmxvdyB3aGVuIGRl
YnVnZ2luZzogYW4NCj4+IGluZm8gbWVzc2FnZSBvbiBzdWNjZXNzZnVsIGluaXRpYWxpc2F0aW9u
LCBhbmQgZGVidWcgbWVzc2FnZXMgb24gdGhlDQo+PiBNU0kgaW50ZXJydXB0IGFsbG9jYXRpb24g
YW5kIGZyZWUgcGF0aHMuDQoNClsuLi5dDQoNCj4+ICsgICAgcHJfaW5mbygiaW5pdGlhbGl6ZWQg
c3VjY2Vzc2Z1bGx5LCBzcGkgJWQgdG8gJWRcbiIsDQo+PiArICAgICAgICAgICAgcHJpdi0+c3Bp
X2ZpcnN0LCBwcml2LT5zcGlfZmlyc3QgKyBwcml2LT5udW1fc3BpcyAtIDEpOw0KPj4gKw0KPj4g
ICAgICByZXRhaW5fYW5kX251bGxfcHRyKHByaXYpOw0KPj4gICAgICByZXRhaW5fYW5kX251bGxf
cHRyKG1zaV9tYXApOw0KPj4gICAgICByZXR1cm4gMDsNCj4NCj4gTm90IHRoYXQgdGhpcyBtYXR0
ZXJzIGluIHJlYWxpdHkgKGJlY2F1c2UgYWxsIHRoZXNlIG51bWJlcnMgYXJlICJzbWFsbCIpDQo+
IGJ1dCBmb3IgdGhlIHNha2Ugb2YgY29ycmVjdG5lc3M6IGFsbCB0aGUgdmFyaWFibGVzIHlvdSBh
ZGRlZCBtZXNzYWdlcw0KPiBmb3IgYXJlIHVuc2lnbmVkLCBzbyB5b3Ugc2hvdWxkIHVzZSAldSBv
biB0aGVtLg0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuIEZpeGVkIGluIHYyOiBhbGwgdGhlIG5l
dyBtZXNzYWdlcyB1c2UgJXUuDQoNCj4gU2luY2UgeW91J3JlIGNsZWFuaW5nIHVwIHRoaXMgZHJp
dmVyLCB5b3UgbWF5IHdhbnQgdG8gbG9vayBhdCB0aGUgb3RoZXINCj4gcHJpbnRzLiBGb3IgZXhh
bXBsZSwgdGhlIGV4aXN0aW5nIHByX2RlYnVnKCkgaW4gYWxwaW5lX21zaXhfaW5pdCgpIGhhcw0K
PiB0aGUgc2FtZSBwcm9ibGVtLg0KDQpGaXhlZCBpbiBhIHNlcGFyYXRlIHBhdGNoIGluIHYyLCB3
aGljaCBhbHNvIGNvcnJlY3RzIHRoZSB3b3JkaW5nIG9mIHRoYXQNCm1lc3NhZ2UuIFRoZSBvdGhl
ciBwcmludHMgaW4gdGhlIGRyaXZlciBhcmUgcHJfZXJyKCkgY2FsbHMgd2l0aG91dCBhbnkNCmFy
Z3VtZW50cywgc28gbm90aGluZyBlbHNlIG5lZWRlZCBjaGFuZ2luZy4NCg0KVGhhbmtzLA0KRWxp
YXYNCg==

