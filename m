Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8E4CD8C90
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 01:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eo4wmMp6XkZy5Ws/ms9yoc5gZo2JNWiJFFHFOsi8tMM=; b=412gCr/SXU+qxDuH291U2YCosX
	7S7noelwk/5YNCKIvRho1e4RsF9htnBhmWzgS8rI0bALDnVe2PI5DTRrOTaIgfxnP1Lf0QfRuTCGr
	j3N5gDC9587l6nSo5knbOZ2J+45pgQy99NrED28esB7Te61VOesrMWTy+xUURFEAVU97H7zsH/T8l
	E7yFH1N4/XyPo/bZlroz8qortUhWe7IGn6iBhqPWFDkGeajQ82jesTnV4MR8BkDQwX1QYRx2RnImN
	cSbw6SrhNFeA3qHkLlNo2sIFq1O/iCviWK5CB9nC90an9e1+3CUzUkCg8qmmAtOki9ZuRpycICRFd
	nwuDuLdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWOvJ-00000002ggH-0jHG;
	Mon, 08 Jun 2026 01:37:05 +0000
Received: from [216.200.240.184] (helo=mailgw01.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWOvF-00000002gfg-3yh9;
	Mon, 08 Jun 2026 01:37:03 +0000
X-UUID: 871d9aae62da11f1afed4741b24580c9-20260607
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Eo4wmMp6XkZy5Ws/ms9yoc5gZo2JNWiJFFHFOsi8tMM=;
	b=dsFfboYKI1dJAaPzXjvRKe1TK3U08PX8GoPPVX3VBr4H896MmclotItyTA7nlNoJ3V0MoDBSmAvIje5Xza75NOjS6emSAhu5XHsxdndMoCOqfvnR4yc8qTD1x+lLpuTaGTPn/LeyEGE8bmYuOXhUBJnvr4HRbUeGNSKnXUlLYSQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:d73b1657-15ce-4505-b2ab-02677f601f4d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:69b9f83d-478d-4046-b9e4-1eabacd041e4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS
	:nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
	C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 871d9aae62da11f1afed4741b24580c9-20260607
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 332231581; Sun, 07 Jun 2026 18:36:53 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Jun 2026 09:36:51 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 8 Jun 2026 09:36:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rm5jIw2vZ4ksuYeKnfHqagA+xee/HrK5Sy3umO4r/kpxU4Vb7ufWcYJQEnKdF3TFZAhfiAAc+wuc13rJrKwz7h14qhdQatE116PNfTJ/46qEqNw16NIbhiVCm+AxCAqwNvGDWTAzQ3pV48tm2UPU1LbEseQmyjee62L/zu1rfErsM6HxA3N0KZgFQTganFpCTC56jJSVdAeRwUOypfi8EnymRn3VtaBdnl5LJFyq46YGXhjxr0ECxE2ZwiNR7O2alVzMD9NUhE0VmPh6P10rEEDCLFroYDrIzdc16yzOBtC1kgIKfI/eU7iWUCfZTggVjyXNZ/dpj/bvW1AMiKEb3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eo4wmMp6XkZy5Ws/ms9yoc5gZo2JNWiJFFHFOsi8tMM=;
 b=Std88DQb5Rs9B2NniUjXfcUgML+7yb/3TP3RyYfftKw9ZFhwIWQRr94wTIrcQkLPHgs3yDwfqPYSICL51ozakBRm//EGOHxzrCxL+T2BOddbDT4CSDU4lI2Y40L108kVeX2wdQ2PzOGYd5PJJpv5NtYxup8ALfE5bThCuTgwJ7voehYiXaKZd8MdFkLxspdqChQHgl4i5yQvDUnJuxzuyr0d5UvBAuaQ504X1CXqFga0nqL0c2oHjo0/Ilu5hP1sVoHR5oDP9X5DhRaxwoMNYtn4kB4oKX1sRbjrqJkXSV/81d4XwfNnUmr3RzmNbFfGrP7NUocXM6sDUwRFZmSqQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eo4wmMp6XkZy5Ws/ms9yoc5gZo2JNWiJFFHFOsi8tMM=;
 b=vz9nkcoqQhxh/Q+r53PbAkD2FaY7JiKLd20G77iyXTWQ4Ohp0gKDDyIVE6F7t6NAi+tgmx0chwLbFkPkZ6BGjPzY0JbMhPKlGCNHLariRDRbRTYcj6Y78fVh7HorggFMgidrybNtneOE9PQbd4ePn9dj/xPicfPoF5eICyT0gVM=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by OSNPR03MB10035.apcprd03.prod.outlook.com (2603:1096:604:492::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.8; Mon, 8 Jun 2026
 01:36:48 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%4]) with mapi id 15.21.0113.006; Mon, 8 Jun 2026
 01:36:48 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Sarang Chaudhari
	<Sarang.Chaudhari@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
CC: =?utf-8?B?Wmhhb3l1YW4gQ2hlbiAo6ZmI5YWG6L+cKQ==?=
	<zhaoyuan.chen@mediatek.com>, =?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?=
	<Teddy.Chen@mediatek.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v6 4/4] media: platform: mediatek: Add MT8188 AIE driver
Thread-Topic: [PATCH v6 4/4] media: platform: mediatek: Add MT8188 AIE driver
Thread-Index: AQHc9MWtzYHwrEMsa0OqEXkU1WvClrYz5P6A
Date: Mon, 8 Jun 2026 01:36:48 +0000
Message-ID: <9d36deb7c708233abc1c1279b9412ee7a3653c76.camel@mediatek.com>
References: <20260605083039.2591285-1-sarang.chaudhari@mediatek.com>
In-Reply-To: <20260605083039.2591285-1-sarang.chaudhari@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|OSNPR03MB10035:EE_
x-ms-office365-filtering-correlation-id: e32dec37-8f75-4f12-cd7d-08dec4fe681e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|42112799006|366016|1800799024|376014|38070700021|56012099006|11063799006|6133799003|18002099003|22082099003;
x-microsoft-antispam-message-info: WMysiLeQlXmoRaXFUYs9xGyFAzLmsqy/tIAB4vYUXq+NG0tsN+Bu299duIgRfqD8MZjIE5has3uhN4Zq7Rw3Znu65WFF237Tu5AzdLPXdcECHlBgGg8FFrs7mtJitTOFt5OUMJTyisiPN/c1QtO88C+cqiBmVgR737MzDW2yLQMBd3H8SNIuXgQ0umg9d1YkE7QVXsDcEUIpm1ZpF6foB6wDtaftqBUDWZvHJ/OXwdjQmBZC2Eh3dBo4o+jT39X0K1bAfhbbox45jYI1Ox8LZ5+LfBj7eyc0d0sc/phpnAiPFcRjgjQluZtngcBZ7OGgdVmzcLD1IiL/MbqCSIXcVFQPly0SwaXZdy6kUOpMvXvfQZ+YiHv7T9yafdsMwLa9xR52l0TmDoD6eOE1iTOBe99TpkA7xqwuS6jZZ2IOwHspvLpRcTgyxa5Q7FMnvUPNinQdRqAspgglX2RDWsgmeMR0okz7d7vjLjETgOF9zmwuCB83AHnQhzXtF8mRFpHa1qTImvGkO9mMcBRWeYOwaH8rAc9ZE32AlF52o64502dDxHl9W1jPFUL62NL0TC3FgtXNqLo1OAdfmIFRt0wVAz7FN/+/Phqz3uty8uZs5W5Q2k30KHy/y4fuXJ/ygaa52vQ1a5Pjb3RcV6MhxWej8mTTPZt2TgdPGXJtVTnYX5e9HLhpn/y3r4GcUqEnI5dzs6Aya9z5qhfRCac1v/+C9KKwTQgnuiJ5bxNW/NzDNS0t09MiZpzh5rhXEbDdQxLa
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(1800799024)(376014)(38070700021)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QVhuVVA5bHFwRmNtUldaQ1p6Y3liU2IrS1cyTEhabkJ3RkUrY1BTaGlaRzE1?=
 =?utf-8?B?KzhYZEFmR0Uydmh5RXRVWFNBekZrcEZ4L1FJdkFxajJPbDhJbnFzVS9KUWhL?=
 =?utf-8?B?cnNYSTFTQXdMMndsZEdPS1ZCZlpzMkFmUlZ1Um1UcWpzVDB2UFhhTk5ya1dv?=
 =?utf-8?B?Z1lHK2tsQmJkVC9rYnk2M1gxd0puRExhREM5djJQUDFwVWhVS1JMMGxkbXdi?=
 =?utf-8?B?bldUejlLc1ViNlBhcUtja05XaXNIV3ZJTndYWTB0OElRVUdrN3U4K1ZnN0lR?=
 =?utf-8?B?aGJEK05QMEJxVU9tcHk0MTQwYk5NTEhXQVVGN21PcnhwcEZzZU9uR2lIb3Jn?=
 =?utf-8?B?U3plU2cvV01DanpMRWZ4cWhNbmpRQ1lYL3hVWDcvTjgrYjhibjMrdk1WMnhv?=
 =?utf-8?B?NUdXNW9Pb3VuNVBIUjJQVGlxb3RYL2lEU2FFOTBnT3lJTElVZzJ5K2VLaU9W?=
 =?utf-8?B?U2g5VVlCUjZjV3lJUmFQYXhLUnArMER4eFBjeldCeHRSNmNrY0JKTG43SE9G?=
 =?utf-8?B?by9xZVhpNXBub2ZPaytjNGEyVE5iWWJMTG5WYzF6VDdZTnVnQnBDdE9HZEM1?=
 =?utf-8?B?Z3g3dWhFcnRKK1l3NkVWZVQyODlOTjhrb1U2ZzBDZmptSDNENnp6N1kxT1NK?=
 =?utf-8?B?eUlnc0RwNEFjNXBOaDJ3TWRQN2VhcjJuc0xhWEhhQVFtOGc2T1Y1Uk9WV1pu?=
 =?utf-8?B?ak4zV3hpRDB1elNvUnFNcHV1U0Q5UlExNVFQaVQ5YUNKOWtXdysraDRjZHBN?=
 =?utf-8?B?dllMd2pmMDZMNWxHbDhLM1BKYk9LSGJwYjlBS0RxVXByL0RJbDVmS25kRXRR?=
 =?utf-8?B?aGlQQnE2K2dWVkwvT05nQWMyOU9FbW5vMnF3QWxzdGM2U281SnJkUkVSV3pq?=
 =?utf-8?B?Sm8xQksvOHM5QlJuaFFTeEgxUGd1dzMwblp5NWFBcndFTk5ERmtMWWJwTnZY?=
 =?utf-8?B?a1g5TFBjZTYyTjVJQy91M1gvd1cvNlc2ekdvNWY3dytvRHhlRzN5QzdTR3Fw?=
 =?utf-8?B?K0JBcVV3NnNFUnJ4QWRaVDg2SU1yYzR6eHVEMVRmUWhVajV1V2JXTHduN1Vx?=
 =?utf-8?B?VTAwQjg2dWtpa2FzWG5BU1Z6QTJRQ2VrNE8ybUpEL1k0OTVMVlBXTVU4NVNX?=
 =?utf-8?B?c20rZzMvSUo4UTJIUmdDaE9HMythMXFYczNYUGI2Z2duR0xrQ2NTT3JjTHdC?=
 =?utf-8?B?d0ZBN0FycnpFUmNYM29MNlhEeE9kZ2hsZ282QzZoNHR2WFYrMXJFM1QyNDZV?=
 =?utf-8?B?RXptcjhUalhGVUhMNEQrZUxJUDlyNVd6dzNZZXdxMWF4d3J3ak1yNU5CTWRF?=
 =?utf-8?B?U0FDYjExWFltRUwyWC96MDN4U1BDMnZmdytrUTY5R3VFaDd1VlgwczRNbVhy?=
 =?utf-8?B?MjhsWk5qcGk2TDF6RVd4a2VmZE1LTisrYlJzYk5ZZnNaWUxYZ25RcXlEdFQz?=
 =?utf-8?B?Yk5BRTV2LzBxZGMvVVF4UHB5ZHo1NlMwek9KeUpxc3dhSjhnSzVhNDJENGti?=
 =?utf-8?B?VUdzd0RwWVV6WUZYT3crZDNLcTVhWVc0QWEzZHVONGE1ZmY3MGhidTdvaUUy?=
 =?utf-8?B?NnpwRktzZWl1cTNXdUlFUlpad2p6c3RBY28xRFBqMlliWThzL3YwNjIvd1dQ?=
 =?utf-8?B?TzdGcGJZZUtlUHdVS1QxRFJhT2ZDd0lNdm5oNEVNNldiQ1lQRnFkQ3NudDdG?=
 =?utf-8?B?ZUorK1hKRG95NVRlOW5wVGNoTnhhWktFcVNEaGR6a1R5SFI1OXpEbmpCUWxN?=
 =?utf-8?B?cVBxK0RsUmZKbWptNTFLODNtZHRWYUpuWTBuLzl4TXprRzhvSnpSZHF6eklk?=
 =?utf-8?B?QnJrVnR0b2EzK1paL0gzV0JrdG0vZW4vMlFieVlOMlBLL2J4dkVoM1VHZTlv?=
 =?utf-8?B?VmhiZXc5dUpCYTJPaTZHTjVNYVlCRGd4YVArVGk0dG82SytLbDlwYnpOSzU2?=
 =?utf-8?B?RzZFQWRuOUc1N1dsREpkbGJNVXU1S0lxMXVCTVQvbzN4NC80NGpMMTlsWEdj?=
 =?utf-8?B?aVNwcXg0WEFNVVB0NjRMZHlXVkpUSG1DdngzMXUyM1h3YUJHU1BmWDllazU4?=
 =?utf-8?B?bVhNMHJ5ZmNrR3JVd0xBdWg1aTFrN0I2VzhEWEE2UGxrS2lzTXpEQXFhbERR?=
 =?utf-8?B?MC92ZC9lS1pWbUVoZldSVXZtMVFWVFFFQnB2RlZNV0xvQzcvNzM2M05GR1Ir?=
 =?utf-8?B?bTZENnBNYjlFOGt5ZUF2RjlCeWtzZ1UxY0pDT09HbFppSFJzbHZYeks3UlZ4?=
 =?utf-8?B?WmdPTzZUc2JSSTlNdlZEZFZqVlV3MTZqSHRvYWJtQVNTWWtmcXpxTUdIZktt?=
 =?utf-8?B?TmdzeGRFTVM5M2NoWER1WnllOUlZQWEyZmswMHlWaGcvYktKeU0xQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5538F8B536A6B41985A0B7633D10215@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QOBNrnWpYPFNr9/DtCmjtNItXbz8EBRoMnazmEkfjnRG1kY7ylgaCh5CEtWlK26E0ZNwTG66O0ItuFWIdUEGx3DYPqukKSjes1oV2eBN7r6Isy6dWc6SmQjojBX6q26uKpFtFe7ToQc4WkdXEUQBRjzoAnwnOZIYC4L3WErig/3WTSTeIaLtWctjHJET4r1Epe8JhMCwjqsXqpMxc7/kRypSamT9RdIJZcLCy4+mf5/NMIWt7nguTaDz5cv3b1NhVYuGKBgfFH/OVvqhdLawk+XEJXsgx5noUHBJTE+wOibDgZKxjv1J64QdVhGIv4OiRafXcoQpTgOpgC8dzDUfLg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e32dec37-8f75-4f12-cd7d-08dec4fe681e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 01:36:48.0477
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkw41+0BQtN4K7Z/eT6SmpRgHOzhwGALxaibOTCMOE7gNsI1Wvs2CMIanYLMk920uf9KFjBSJXcdsvmH/jZBzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR03MB10035
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_183702_021424_314BB51C 
X-CRM114-Status: GOOD (  11.03  )
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

T24gRnJpLCAyMDI2LTA2LTA1IGF0IDE2OjMwICswODAwLCBTYXJhbmcgQ2hhdWRoYXJpIHdyb3Rl
Og0KPiBBZGQgdGhlIE1lZGlhVGVrIEFJIEVuZ2luZSAoQUlFKSBWNEwyIG1lbW9yeS10by1tZW1v
cnkgZHJpdmVyIGZvciB0aGUNCj4gTVQ4MTg4IFNvQy4gVGhlIEFJRSBoYXJkd2FyZSBhY2NlbGVy
YXRvciBwcm92aWRlcyBmYWNlIGRldGVjdGlvbiwgZmFjaWFsDQo+IGxhbmRtYXJrIGRldGVjdGlv
biAoRkxEKSwgYW5kIGZhY2UgYXR0cmlidXRlIGFuYWx5c2lzIChhZ2UsIGdlbmRlciwgcmFjZSkN
Cj4gY2FwYWJpbGl0aWVzLg0KPiANCj4gVGhlIGRyaXZlciBpbXBsZW1lbnRzOg0KPiAtIFY0TDIg
bWVtMm1lbSBkZXZpY2Ugd2l0aCBtdWx0aS1wbGFuYXIgdmlkZW8gYW5kIG1ldGFkYXRhIGNhcHR1
cmUNCj4gLSBUaHJlZSBvcGVyYXRpb24gbW9kZXM6IGZhY2UgZGV0ZWN0aW9uIChGRCksIGF0dHJp
YnV0ZSBhbmFseXNpcywgYW5kDQo+ICAgZmFjaWFsIGxhbmRtYXJrIGRldGVjdGlvbiAoRkxEKSB1
c2luZyBCaW5hcnkgVHJlZSBUcmF2ZXJzYWwNCj4gLSBQeXJhbWlkLWJhc2VkIG11bHRpLXNjYWxl
IGZhY2UgZGV0ZWN0aW9uICg2NDB4NDgwIGJhc2UsIDJ4IGRvd25zY2FsZQ0KPiAgIHBlciBsZXZl
bCkNCj4gLSBIYXJkd2FyZSBjb25maWd1cmF0aW9uIHZpYSBETUEgZGVzY3JpcHRvciB0YWJsZXMN
Cj4gLSBDbG9jayBhbmQgcG93ZXIgbWFuYWdlbWVudCBpbnRlZ3JhdGlvbg0KDQpUaGlzIHBhdGNo
IGxvb2tzIHNpbWlsYXIgdG8gdjNbMV0sIHNvIEkgdGhpbmsgeW91IHNob3VsZCBsb29rIG15IGNv
bW1lbnQgaW4gdjMsIHY0WzJdLCB2NVszXS4NCk9yIG1vcmUgc2ltcGxlIHdheSwgYmFzZSBvbiB2
NSwgZml4IHdpdGggbXkgdjUgY29tbWVudCwgYW5kIGdlbmVyYXRlIGEgcmVhbCB2Ni4NCg0KWzFd
IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRj
aC8yMDI0MTIyNTA5MDExMy4xNzAyNy00LWJvLmtvbmdAbWVkaWF0ZWsuY29tLw0KWzJdIGh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8yMDI1
MDIyMDA3MDExNC4xNTAxNS01LWJvLmtvbmdAbWVkaWF0ZWsuY29tLw0KWzNdIGh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8yMDI1MDQwMzA3
NDAwNS4yMTQ3Mi01LWJvLmtvbmdAbWVkaWF0ZWsuY29tLw0KDQpSZWdhcmRzLA0KQ0sNCg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogU2FyYW5nIENoYXVkaGFyaSA8c2FyYW5nLmNoYXVkaGFyaUBtZWRp
YXRlay5jb20+DQo+IC0tLQ0KPiANCg0K

