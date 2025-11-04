Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60773CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 04:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lot3DtwWi80JbWMATFcxvIfoaNoirdL9IvXdG1wMjKA=; b=ZHMfzIUKkY3Fw5NngLz0LEcG8O
	8jDLuz1wo17nOnF9PT8fWDMbG+LZGnxSWF6PpkPgc2NPVZxHT1zKtittYZbr+RMjwxGEfTuKx9XRR
	vQl6CwRP4pappaqDs/a3igsA9+Hm82oGOpGw5C730WTeNjq4pe9H48IUL7fwreSZf9Cvg+xvsHyqQ
	K4M5RVLbVaWeu7yvezhjartPQS23JCR6oVi9eUa27VNazQcH5295ArcoHZHYIS2NWN9Cs81j+by9k
	LIiXwm+hqdztKfxj+E66MOk9YxUUxrveSWYcBd1HsSj7yv9UILMAKp6WPRSAQjvgW0L+vHJoSWWtn
	AgcH+slg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG94N-0000000B9uz-2qrX;
	Tue, 04 Nov 2025 04:54:59 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG94L-0000000B9uZ-0RHk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 04:54:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uyPveV8TwtG28RvjSfo2jU5aDINfVmZSsdi2cP/Qk1UCOhFBKJeyXkpKLJReguL4mkG9fJUBYTFzFaY7fGtozrwoXcYNis73jBI28yuW9buKffAIN2aaxh0zdD0YZl2dIM2e9oURXaWCI1hBIXBr1j61IL3Sxk63rpBzG0pAEI4rrkWEgqh+s+ylYwhgAETH0YJtCOIFpzL3xJmn2wji64+VqDauIwi0syx6/XcEXCZ4s2v/kzv8xY4kBAtAC9+m26UJRmcdl+QjwPpcL4xXoPX1xVrcxdjDAqSLCL/ybsjKcQqHlEfWsdelNOl/txn2riLgXG1qb8wMr8gbo3Xqqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lot3DtwWi80JbWMATFcxvIfoaNoirdL9IvXdG1wMjKA=;
 b=WCTZmcw61VjeizIESTgBCOis721G4vnT7IMLWoemsBAYCinZY/qitTkiI50tK7TFU4oftRSa5CnzoltI4ft4aIXmJ42Fh0E3lbg3HWpVJgD0bmMwTP3ELvzXkQfSuK7CP5AXhp8TCNBdP0XfOepLZ71TCt4pPdGEuuaz00m2y3CGhS9xn8NB36M0IynDaWbFpoRV72+ytGd687SfyQLyXzvoQfZKvEwJfXEcTlSThI+IeXAHuXnEyURXaqbUqQgGP3N6iKambNMxbimwmqilkf/kFqS0aqGJ9EBjeoyv1paqtvXwXMCqtwpqGXIoICyDx/0vFLPsIOBcY+xWvJhOKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lot3DtwWi80JbWMATFcxvIfoaNoirdL9IvXdG1wMjKA=;
 b=okwq7U2LqasBliyI9PGvXAXGAOhx3qu5GDvjZOSG99oAEc15wrlMfimaktRiRblapPLXJ7wia3ZxAxH8oU+quWGj0/VMRZaDOEtPnNFTxawR/aBCzaCTXgwUx+MYUP2TE2haia+wsp4cPB6HBmaPWZ8VqR+1d4kMEJbGEmZi9PNOXFKwmnPA9pq8juALgtRWYZGomv2lMNMCv4IC3WVwiAUQrvwdwGsWYFXbrUzXWl8i8MLHNznqImKzsHuIj9ISZX1ane00QWU6EYbyv5roGct66PVIFvyq83/WX9qfM//uAsj7CZLv89BvGj1CYA1ZAc41KAroqfJiiyDewiyTiQ==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by TYSPR06MB6751.apcprd06.prod.outlook.com (2603:1096:400:476::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 04:54:47 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%6]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 04:54:47 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Po-Yu Chuang <ratbert@faraday-tech.com>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "taoren@meta.com" <taoren@meta.com>
Subject: =?utf-8?B?5Zue6KaGOiBbUEFUQ0ggbmV0LW5leHQgdjMgMy80XSBBUk06IGR0czogYXNw?=
 =?utf-8?Q?eed:_ast2600-evb:_Configure_RGMII_delay_for_MAC?=
Thread-Topic: [PATCH net-next v3 3/4] ARM: dts: aspeed: ast2600-evb: Configure
 RGMII delay for MAC
Thread-Index: AQHcTJUCZICfZYvm9kmBC8ErdgUa2LTh5hYAgAAN/vA=
Date: Tue, 4 Nov 2025 04:54:47 +0000
Message-ID: <SEYPR06MB513451111EEC8147900B33B79DC4A@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20251103-rgmii_delay_2600-v3-0-e2af2656f7d7@aspeedtech.com>
 <20251103-rgmii_delay_2600-v3-3-e2af2656f7d7@aspeedtech.com>
 <afdd366b-8bf0-40a4-ae02-dfc2ff79011f@lunn.ch>
In-Reply-To: <afdd366b-8bf0-40a4-ae02-dfc2ff79011f@lunn.ch>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|TYSPR06MB6751:EE_
x-ms-office365-filtering-correlation-id: ab5efca6-c4db-44f5-3282-08de1b5e47b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZkRyVm5vMmJCMmlGS0RReEJ2eG5sOU5SNzFrMFlySUVJdnF6d1ZmVE4xMUNw?=
 =?utf-8?B?MFlMMHZCWHYvaTRjbjVqME5oZ2g5UnkzSVZwU05RLy8zdVRnRHRPQmFlOU9w?=
 =?utf-8?B?TTVHNTBuaXhZMEcvUS85OUxoNFB6clRFOFk0b01GWHVFTy9IRCtwMWxJaWZT?=
 =?utf-8?B?NEtMY2hIUlpFOHFYbEZCVFdhaTAyOWc0OTYvMTNqYWo3enJxTDZxSVFMN1pi?=
 =?utf-8?B?REV0bGdDOHh2Wnl2SjZWVld4clRFU0g1SlBBREI3T2ZyT0xvQVYwSzlCOVJC?=
 =?utf-8?B?a2tVamxGVlgwUEFKRVloZkxBL0R4Qlcwd3l0OUh1L3I0L1ZoN29wN3dWM1Vo?=
 =?utf-8?B?NEF5eGJZbXAyTFc0c2lHNjNxbzRpN29FSGpiZ1RiVHl5eE5LWXBpSE9zOHN6?=
 =?utf-8?B?RWYvSVFOcGJUZzZQZWl1aVJ0cmI5T0dXSDhSRTFZZW5xcDZkZHpPQXVzU3JM?=
 =?utf-8?B?OGdDTm1mblRJNGpGZTZkc3VyQVI5cy9QN25xdkZsNEd2RHdqVEZ0L0FVZldO?=
 =?utf-8?B?T29Eamg1NUVmM0dYR3djeVo1eGNZMHltYzIrTHVLVWovVVRpdE51WTdaR2Fl?=
 =?utf-8?B?WkpHSGNNZjJwWE85T3BmWFl4ZFcwSERLTDlUNysrMkRRM3dVSVFocTA5cWxS?=
 =?utf-8?B?NlFIbDZObGRaOXJRYmlhNG1UakxnaDVKL0E4UmROdW1NZlVGYmhlb2dPOUNW?=
 =?utf-8?B?QnZGeUYvQmd4aVVSbVBNMUw3RDd1MDViZzVWYlQ0NDZrTlpSTG1ZWW5pZjlL?=
 =?utf-8?B?U0Y3cE9Zc2tHL1BwOUlCd2pFc0dlSUJOcEdCT2Ixak8zTjdUeEwzZG1oV3Az?=
 =?utf-8?B?N2pFRHN2ZnpXdVdlRVZNbk1xeFg4aEtNMTd6c3ZLeFNSRW12eGxUMmlwU09D?=
 =?utf-8?B?NElJRHhQSEFMakh2NnlPWElVelA1YTRlZ09rcENYdjJYc3pzb3oveEliSUtE?=
 =?utf-8?B?YXFydFJFSkkyWVJ3bTVMSWlhUjdDSnNkOWIrQjB4UGdMVHVBcVZYbC9wU3hU?=
 =?utf-8?B?QzJYTWJrbCtqS1lKM3lGZU1rN0NLdTZyMGZobXE5WjJHMFFTYWt3U0hoZnlO?=
 =?utf-8?B?cmtVNmk1dXhEZXlrMHJNVC9pR3E4a0VvcUhXdnVXUE1aQnpHRTNyUjRBMTll?=
 =?utf-8?B?Mkdna3FwSnJyblhaNGFod0Y1TFUxMXM0M2o0NXhvVFZibVExMTBUVkZvektt?=
 =?utf-8?B?OXQ1cXY5R2FZOFZBb01sbk9aMGJ3RnBmeTdHYlhXQnBzeUV2djVCdmtnemxN?=
 =?utf-8?B?SHNuaWNGWXRNZm1KbHh4K1RPR2FFdTAzOG11cjZuMk1jUVZGQm1kei9TRGY3?=
 =?utf-8?B?bjZONmI0dS90L0JtS2lRNU5OcXEwRlpaU3RtVW9CbmtsTXkrdk8yYzE3UDRp?=
 =?utf-8?B?ZXVTdXcyeUk0L29CMXc1N09BYWhoNXZKcWF0Nk5pNUNRc3R4ODhqdkJWSnFK?=
 =?utf-8?B?Vk9ZQ3pzWDNiZnZGWitsRFpTektCclJTODFwc1RKWXROTk51VmNSbUFGYWpC?=
 =?utf-8?B?Z0dEYUtWekZhZVFub01Vamhzck9hYVdGNVQyZzVZcVg0NEtITXZPY1hKemYr?=
 =?utf-8?B?UkduMVZGVGFSTDVBOTBITnN3OWhtZnJiajU0dWx5MXh2NDVXcCtINUs4OGFI?=
 =?utf-8?B?YmNuZWYrVUF5cHdDYjlkZnEvWEVDK2lYTEhOOXkrTzdOVVlWTzlzdHIwTUZm?=
 =?utf-8?B?RloyUVZ4Z1doRXdEbG40L3FlWlQ1OWZYT3ZLaXJRajN3enhyRWFvdG9jaWpD?=
 =?utf-8?B?OTNtT3FTSUhKYVVvTDMxdFg5bHNNVTBneGg5L1ljbzM1eFN5eWlDdGdNb2Vv?=
 =?utf-8?B?alh0VjN2VmVJRnBIcmhxc3QwcVk4M3MzRCtHZW81MkxiUXZZTzc1YUdNTllQ?=
 =?utf-8?B?WlNMcGMzMlp0TS9PbW1taWc0L3oybTNqb3BwSnl2Z2twVTJuVTVyeFBHTGlp?=
 =?utf-8?B?RnZGOWpadm16cnMrSGN1UDdXeEJnTXp6aUtranV2UytOWGNSblVzK2s1aGtI?=
 =?utf-8?B?V1FzNnpsY0ZBVlZLelZxQXdYZytCUkR1bkxvdVFuNGtSV2IzZUFXbHhMc3Ix?=
 =?utf-8?Q?qehA5K?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?THlGRHNwaTJMQ0s1MDdleHhoMk5WMTZUQi9CR3NwdHcvL0JGZzRKYWMvRlVF?=
 =?utf-8?B?RVFFdi9KNXo1VkFBQnlBVVpRVGNyUmk5TUpDdU5VTTNpV1F1NGFCRVFwenRI?=
 =?utf-8?B?U1hUemtxS215TENGNlhnYzBZQ2pzcVZGM0k4ZURNVXRHb3d1Q0FkTGZ3UEh5?=
 =?utf-8?B?UVJUTUJ4MjlqOU5CSHA1QkQvc00xZmxzMzhwd2prY2dnU083MDlsWnNiaWVj?=
 =?utf-8?B?bksyUGJMOXpiSFhRMzZYeVRjZWtzd1htOGxoRy8xWW1jYVdVTHZYa25sV2Fq?=
 =?utf-8?B?ZGNtZ0lZY29HTEJ5bkdqTjRxSGxVKzVrVVZBV3pBT20xdG55SHRnR09NbGVK?=
 =?utf-8?B?ME1FeWRqelBtbTl6UEV5c2VsdWtvVEhpU3ZxMnlIaFNvNHZCTXBOK0MzK2Er?=
 =?utf-8?B?QjRkS3IybEtyQjlnTlNuODN0ZnZudUV3SjlUTFJ3RmRES0RzeWdORG1NcE84?=
 =?utf-8?B?YlBJbUg5TUdaREpLalgwUTBNeVdwd3NuSUpJSkNKalV3UERTRmRibnJ3cjQy?=
 =?utf-8?B?REQveTFVSVdxcVpJaUxUT0pwWjBHdEVoSG41ejdMZktZY0hoRTY2OG1zVFgx?=
 =?utf-8?B?V0NxTDYvTzN1TjV6YmJCVTBxcThObkRxU0l0MlhORTZLU0duWHI0VVdXWU0y?=
 =?utf-8?B?MFh6ZXU0b09rdlExTTBJNTI4VXN5YVMyUjlSNEJWWmdUYWtPbmxSVmNFQVZF?=
 =?utf-8?B?eXBJWm9jMnhWa2NXc0RwdUJQS0ZudG16VnFXbWh1QmxVSlNELzRBN0Q3T3Bw?=
 =?utf-8?B?cHd1Mkd0aHJiL1A4OE9XN25xZE9ibThpV1ozc3pIQXVqVkRhR1NrcFN0YmVl?=
 =?utf-8?B?YnFROWFkQTRtVjZPcU5vV0ExazRYNS9LcEQzK2hZRVRNKzRjbkpya2lqR3VG?=
 =?utf-8?B?ZjA1eXdVZFZuUEp4K1BONjdiY01CY0pOSFM1bzVHUTY0RDk3U1NIOEhjRXpU?=
 =?utf-8?B?V0V4a2VhNDRoRW5pQk9DT1ZNb3pydzJEbEdjVmoza0VhTGVXajhqZlg3T2FD?=
 =?utf-8?B?MStsQnVWSHl1ZlZqbWpMUDdZRWVFT3FMWFVvVTlrcFUwSkpuOUpBaldxUjVm?=
 =?utf-8?B?YVVBREFDRjZyTWM3cUN1SVFZb1RGL0JmemZObkFCb3o4M0xaRXZYNDI0S0N5?=
 =?utf-8?B?eHhxODFmeGRtZ241OHd1aU95S3M0Q3hvRkorVUNFdXBySTZpNjNyWjNRbWhZ?=
 =?utf-8?B?c0pwZnpxNVFrQitnbGIzV1BKc1d4TThBN1ZkeW8zdWc5RktITW5RSGpRV0Yr?=
 =?utf-8?B?Nmp1QkptclBCMGJCbXJNTkZWUTdFM1FxaEdidHVWZHBjTlI0V2dVWEc3Nko3?=
 =?utf-8?B?NmJNUDJOMGhuRWI5NzdqNDNyc2FzUTFNdkZzUkxjYjcxSGRFZG9RdHpsbXp4?=
 =?utf-8?B?REdWUzhLU0IxWVowOEp4NlBWYWRjNFJBczhFZDJ0alJ1bC93ZVd2amFSTzY2?=
 =?utf-8?B?ZEU2bXJPK1VvV1ZHZFZLUDJuQkxPOG5IRGVNV1Z1anczTkRlZ0RTNkZ5cHlR?=
 =?utf-8?B?QmIzZDY4VFZ6eG9XekJVZjBzVnZjWkJsc1dQZ3pobnNKVVNGMXAwOUFxUXNK?=
 =?utf-8?B?TTAvMlJKL29rNVN6RnNmdzZ6ekRES1lvZ1J4SjF0aEdUcFkxMWtoQk9wS0FW?=
 =?utf-8?B?MUhhMlUyTjgvTkVQYXJMVEZVRWxLWC9sU0hNOHNHYmhZZ3pIQ0l1dnpCWkx0?=
 =?utf-8?B?SFhoNEtvd3BNaFIrcVRoQkRrMnZvSlRTdHYxVEFXNGxCVmRWeWRRN0ZpOFky?=
 =?utf-8?B?YlZqS09NR2ZDUXJyRjBLWGxHK25sWVlYejAzeTVUTEM0M3VKWW1IcFhEWndS?=
 =?utf-8?B?MmxxS2t5ZG5ENVBodVBXNDg3bmpaRkhuM0RhTjhRdHhCOVRqTHRhN1ltTjFZ?=
 =?utf-8?B?TmZKRHlTcThBQU02ZUJ5cHFzYTNCQllmQXJ5cDZ4VDIzN1YrQkxzcEMzM2xy?=
 =?utf-8?B?L2RNMmUrME12UER3R2RjTHQzTTFPSjVNYklKTzd6dmlzODBpU1lXUndVbFlO?=
 =?utf-8?B?N2hQWkFzaFdmUXZQNW4yTWJGL0RGeDlRTWNvZHdxVGVrNzVqSVpzVlpnMkt3?=
 =?utf-8?B?M0t2V3NGZzdrV1dJTXFrbnNja2txL0wvNmoxNG9VUExYTzZUamRMZUU1eDJp?=
 =?utf-8?Q?bpxjvCqFb1tYgN+d1ygu8pcU3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5134.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab5efca6-c4db-44f5-3282-08de1b5e47b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2025 04:54:47.6828
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bZTJpftnY1k9+zANk+NprBd3oKGUJfZlfECll9p4HfjKTrxQNyPfSbx5mfb+7oaEqblRBGAISvev5Ifuq1rML2lSeeWyDe0fzZCqmLb7uVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6751
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_205457_151282_55B10F71 
X-CRM114-Status: GOOD (  18.76  )
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

SGkgQW5kcmV3LA0KDQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC9h
c3BlZWQtYXN0MjYwMC1ldmIuZHRzDQo+ID4gYi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQvYXNw
ZWVkLWFzdDI2MDAtZXZiLmR0cw0KPiA+IGluZGV4IGRlODNjMGViMWQ2ZS4uYTY1NTY4ZTYzN2Jk
IDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC9hc3BlZWQtYXN0MjYw
MC1ldmIuZHRzDQo+ID4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkL2FzcGVlZC1hc3Qy
NjAwLWV2Yi5kdHMNCj4gPiBAQCAtMTIxLDQ0ICsxMjEsNjQgQEAgZXRocGh5MzogZXRoZXJuZXQt
cGh5QDAgeyAgfTsNCj4gPg0KPiA+ICAmbWFjMCB7DQo+ID4gKwljb21wYXRpYmxlID0gImFzcGVl
ZCxhc3QyNjAwLW1hYzAxIiwgImFzcGVlZCxhc3QyNjAwLW1hYyIsDQo+ID4gKyJmYXJhZGF5LGZ0
Z21hYzEwMCI7DQo+IA0KPiBJcyBpdCByZWFsbHkgY29tcGF0aWJsZSB0byBhc3BlZWQsYXN0MjYw
MC1tYWM/IElmIGEgZHJpdmVyIGJpbmRzIHRvIHRoYXQsIG5vdA0KPiBhc3BlZWQsYXN0MjYwMC1t
YWMwMSwgZG9lc24ndCB0aGF0IGltcGx5IHRoZSBib290bG9hZGVyIGRlbGF5cyBhcmUgc3RpbGwg
aW4gdXNlLA0KPiBzbyBwaHktbW9kZSB3aWxsIGJlIHdyb25nPw0KPiANCj4gSSB0aGluayB5b3Ug
c2hvdWxkIG9ubHkgbGlzdCBhc3BlZWQsYXN0MjYwMC1tYWMwMS4gSWYgc29tZWJvZHkgdXNlcyB0
aGlzIERUDQo+IGJsb2Igb24gYW4gb2xkIGtlcm5lbCwgdGhlbiB5b3Ugd29uJ3QgZ2V0IGFuIGV0
aGVybmV0IGludGVyZmFjZSwgcmF0aGVyIHRoYW4gYQ0KPiBub3Qgd29ya2luZyBldGhlcm5ldCBp
bnRlcmZhY2UsIHdoaWNoIGlzIHByb2JhYmx5IHByZWZlcmFibGUuDQo+IA0KDQpUaGFua3MgZm9y
IHBvaW50aW5nIHRoYXQgb3V0Lg0KQWdyZWVkLiBJJ2xsIHVwZGF0ZSB0aGUgcGF0Y2ggdG8gb25s
eSB1c2UgImFzcGVlZCxhc3QyNjAwLW1hYzAxIiBhcyB0aGUgY29tcGF0aWJsZSANClN0cmluZyBs
aWtlIGJlbG93LCBzbyB0aGF0IG9ubHkgdGhlIG5ldyBkcml2ZXIgdmVyc2lvbiBiaW5kcy4NCkkn
bGwgYWxzbyB1cGRhdGUgdGhlIGR0LWJpbmRpbmcgeWFtbC4NCg0KJm1hYzAgew0KCWNvbXBhdGli
bGUgPSAiYXNwZWVkLGFzdDI2MDAtbWFjMDEiLCAiZmFyYWRheSxmdGdtYWMxMDAiOw0KCS4uLg0K
fTsNCg0KVGhhbmtzLA0KSmFja3kNCg0K

