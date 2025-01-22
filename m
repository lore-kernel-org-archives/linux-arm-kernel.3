Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1490C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 07:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WxV5WHDJH/b6CY9ZFQ90bW03NR8XMRN7Qbb/KjRDvFw=; b=qNkG9hqaYOhTGSbExgoW8dEcyA
	Ds96fip/uwwEnND1KkuZwyzZRoMew6JY64V/tNmlpTXMljA7R64+0bn6kf3lbKGJLX+OIcTrs7X1C
	SvZZdJ6C99vQAkk62l5x2rHoaTHGe0MW6Ql8OTfXlw8BXf9VjjGIouHjOyapC3sdams61HnOOoNA/
	/5RhiNSoO0L1uOSbbsdk5+eiE7AUQrfHrtPZMYx04D3gujTDDNpq0Ko0jhZQvp5ONkLZ/QpQLDPDs
	S1ELQA3imxHZemNcT+9kpMW5oMzRBuNx3P9s8qqz7WDqVpFs/G0HFV3TGas8yPEYOHSVcTL+rnQu6
	sdkLwGlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taVOh-00000009cgy-2Sj0;
	Wed, 22 Jan 2025 07:43:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taVLc-00000009cIP-1nsS;
	Wed, 22 Jan 2025 07:40:25 +0000
X-UUID: 20482d7ad89411ef82ff63e91e7eb18c-20250122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=WxV5WHDJH/b6CY9ZFQ90bW03NR8XMRN7Qbb/KjRDvFw=;
	b=tOXwMZB5iqcaQK8KwZp3nMKNZz1bkMtNLbJ4SC6wVS/I9zAYi8DCLpQXfjwr7Z8nHoB8QkNtEK84WqppGlCfjUqYwJowEaR7M63/vANHbOpKcM66FgiqX7CMLz6VS2kegzoReYpJi1+Ib6AkVdS02gKCW7j21f4a6eKvrVBTHT8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:0e4a8be2-c6b7-47a2-b046-337b733d4093,IP:0,U
	RL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:2
X-CID-META: VersionHash:60aa074,CLOUDID:b9024738-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:4|50,
	EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 20482d7ad89411ef82ff63e91e7eb18c-20250122
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1507971506; Wed, 22 Jan 2025 00:40:18 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 22 Jan 2025 15:40:15 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Wed, 22 Jan 2025 15:40:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xdEt6zDAKxYU7AjJROaZz/ifIzNd93OCJETxsOB99cgkJhZcsVRyMi9nEFlBIzb4xJxz9m12YtV89URhF7amSNbbSYntp0duSY6drpPvLBlMAqX6cYGohDGsyl+yohkQhjpsG5yeGMxxWTo2mERSa6HtSIVBGgQGx2FQC//6HZbX92R0F4GSe7dCi5u3Z6QPkBlWBBSZkLYBTujm6Y8oomdF01nObtCHA9ypdmGIRbyWLPFAWiVnCQlQX5AQshqdXqk1WwNXKyHNwY+X42HnO/x30AEWaRRJ5leTEQpKhIsrARC0tN40UZjXUUjX5dHQrefPxxCnDH94Xi/rk/AsyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxV5WHDJH/b6CY9ZFQ90bW03NR8XMRN7Qbb/KjRDvFw=;
 b=v+7nL05SH+WVEVTXGgsAIf7uUtCQKqivc+VOY1hr3uwfXc/W/R7/hHYgyr93NbJmszXWuJdkUX9WVWth7ZmqSyZ9aBNMT+qbDf1s9v6ju2114tXR+jq97BY09yUbwK1AokDIRlyKesrmjqYGecMwgMv7OUpK0KYwZhRj75aglH6ylJ2Q2Ao/fKQQ6mhKP+uM8j2hIvEg98t+3KnAsXuPklkGU91SU9tqjSTqAJlSIGqFsMCxFYybIJV9HGvAfloHN+c1IWXsKoShsamB0VdQI9DP+sBADUc2MKO9iHRpYBfrrURIXtwICcqZvrkHP73+euUKlZWB8pyejw1PmXw3xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxV5WHDJH/b6CY9ZFQ90bW03NR8XMRN7Qbb/KjRDvFw=;
 b=bXnvFWo2HeG5fn4pUiTLaCEyvyB+7dGmBCHuLhTHMVEDk7MnEU5qQL94um96L7rNn2hVwq/Jd/lwTSvzobvBv9LCr+pCKJmVUTZMG6jeTzAoZBqHMCLoF1+Bw0gHiEjgGx2X/VBk8SBJrmz8MfHlF9pKQ4fK5SXTTiQDcQwxX1k=
Received: from JH0PR03MB7983.apcprd03.prod.outlook.com (2603:1096:990:3d::5)
 by SG2PR03MB6537.apcprd03.prod.outlook.com (2603:1096:4:1d1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Wed, 22 Jan
 2025 07:40:12 +0000
Received: from JH0PR03MB7983.apcprd03.prod.outlook.com
 ([fe80::68cc:b424:7a97:b11f]) by JH0PR03MB7983.apcprd03.prod.outlook.com
 ([fe80::68cc:b424:7a97:b11f%4]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 07:40:12 +0000
From: =?utf-8?B?RnJpZGF5IFlhbmcgKOadqOmYsyk=?= <Friday.Yang@mediatek.com>
To: "conor@kernel.org" <conor@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?R2FybWluIENoYW5nICjlvLXlrrbpipgp?= <Garmin.Chang@mediatek.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?=
	<Yong.Wu@mediatek.com>, "robh@kernel.org" <robh@kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: mediatek: Add SMI LARBs reset
 for MT8188
Thread-Topic: [PATCH v3 1/2] dt-bindings: clock: mediatek: Add SMI LARBs reset
 for MT8188
Thread-Index: AQHba9Dh6ozL/EN8bUaPBva6nm3iOLMhfKuAgADtcAA=
Date: Wed, 22 Jan 2025 07:40:12 +0000
Message-ID: <2bfb6c05a3471e54f51c06895709853661e82c9a.camel@mediatek.com>
References: <20250121065045.13514-1-friday.yang@mediatek.com>
	 <20250121065045.13514-2-friday.yang@mediatek.com>
	 <20250121-violet-widely-df3567b085a4@spud>
In-Reply-To: <20250121-violet-widely-df3567b085a4@spud>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: JH0PR03MB7983:EE_|SG2PR03MB6537:EE_
x-ms-office365-filtering-correlation-id: c79f34a4-64cf-48f9-1d72-08dd3ab80141
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dUdPUlovVWUxWWxVdGFuT2d3ZHl1RTAyT3F3NzJaTlBLczlBRDZ3bVNIVXhD?=
 =?utf-8?B?R3grTUJKZlRKMnJsaFlPT2d5SDFCNGN4ZjY0WGhUczBteFNKdVBORjdDc0h4?=
 =?utf-8?B?TjkwR2tIcVlOSTQ3QzBoVk45ZUZSaU0vTkczTWtCZTZ2UENMZ2gwcmRSeHFU?=
 =?utf-8?B?Tjd2YmplUHlyby9SWHNpYVRLVTl2VW9UdDYvL0k4ZnF5UVNwaE5BY2trdVdG?=
 =?utf-8?B?MGxyWlJxTENNL2dZT3d3ZkNXakZYMHlML0oyZC81RW5JRHNUd2UxM212Uzlt?=
 =?utf-8?B?WkhsQlJZRnVQYzBrOWdWS1FIZGF6cDA2TTVIZ3Z6ampERVd2Ty9OaDdkUG9s?=
 =?utf-8?B?WGVvc2ZwYThKTFRLbWRzOUZnSVlKNUZLTWdKK01iV1REU0xaVjFVY0ZDRm52?=
 =?utf-8?B?Slc1WnA0c0I0eUgvKzUrbmlVMTdaV0dtUXNYSVFnN1BLV3JpbjdEbDR6aUlm?=
 =?utf-8?B?a2l5R1pleENtd3JwMCszSlhHY04wTWFVVVlLYU8ydUtiQXl1cTVJcmZMaUM1?=
 =?utf-8?B?cnA1MnJLUGVEbjhlZTVMc2c1aHI4MjhJN0YwTHlUY3JVQm1FNUVTNlNGR283?=
 =?utf-8?B?Z2k4Y0hKc1FSay9QVkpXTEdFekp5TXZLNFByNGc1QWlScVloU0JQcjZ6dmVM?=
 =?utf-8?B?bVcwT2hxYXAxMzUxdUFpdTU1Z2lSbmNRMXdHRUtCNkVBWTd5OHNTRlkxRERh?=
 =?utf-8?B?TXVFd25CbTNFNFg4Y1MydzBBWVhPZEdEZFdvSlRoTzhLWWYyTVJ4RW5XelQr?=
 =?utf-8?B?cndnY0h3eFgvbDJGM0g5TUF6SDdsSjJCZEQ0SXUzVXBML2VIZTNzZGZDM3lq?=
 =?utf-8?B?QWhrUmdVV1prckEzM3dIWFB5Yk1VQVpKa0toTGd2ckJKTXJQdytHQS9NY1pX?=
 =?utf-8?B?NkpLQ0JSUTVvS1NVUkdDemlIL0NraGY5ZXo3MXBWcjNoUnhRLzI5SkNsV2JJ?=
 =?utf-8?B?UlEzRFpRd3JEZWV5a3dIeG10eXphdE5MMXZvaG5mVEdGWjJudVZuOHplak0x?=
 =?utf-8?B?cE1oVWg3MTN6RjFrY0dqTi92QTNnbjNnZFpsTjVtbnhLMGo4cFpPS3VKa25B?=
 =?utf-8?B?MnVKVU1UdzhodklzUXVTY1F5bG1saHVwRXVMSG1pWUtQOENoZDFGWlNKeWhI?=
 =?utf-8?B?WXo3ZVJrRFd4b0sveDlrVU9zMzAvVkJteEk2RmxZTFViWnQ2MmhITm8zeFVT?=
 =?utf-8?B?QUdQbU5kbUFFZlZCTWV1dUZBSWJ1OFFjejVnVjNVbVRBK1JSVVNtOGlOaEhH?=
 =?utf-8?B?N285bFBoUEd1bUlORzNybjJHOXVoUW9qaVMrUVVwenduN0ZzSmp2UUQ3VUNy?=
 =?utf-8?B?ZVpXWHZ4VExxRktYVFVkaDVxT3ZOcis2RmtrT0VoMFBHc1MzS09ZREJZRGxW?=
 =?utf-8?B?N0FlOUJ3dFl0VTZkVG53NC90bU9aOWlzWEwvUjFBSmJUYkdqRU1sQStZVGs3?=
 =?utf-8?B?NW1vemIwMUg0YkVsNU9sRUhqVEE0VDI1a3pnUUhBTDl1cWkwZzJnekQ1RlNR?=
 =?utf-8?B?M1ZocXdqT0oxeUpDUEdUcW1kK3pGaWp5cGdEQU01K2tmNDdoUGIrNzJLUzdE?=
 =?utf-8?B?cWVQdXJ0cktDcWIxRjJER0YvT29UUzVkQjEyNUJ3Y21XdlFnUHZFZWRkZ09Y?=
 =?utf-8?B?NzBrcFhBYTJMdGxqZmtWdmdxc3ZmRnNLMkdLVTFQS0JZdURjdHY0VWhmNFRB?=
 =?utf-8?B?elJpRnFScTB3K3JtTTUxWjRvSGhqci9kMHJuVFI3RTF6VmRtcGY3S3ZwZlNK?=
 =?utf-8?B?SnBKakZ2UjJhOXR6RVBnM3ppNXp1R0c2WDFkQlYwY09DYmUrdDhvOGc2UC9j?=
 =?utf-8?B?SUFpLzBOVzU5N3dzZlVmSEhQWWtUMmRQRDg5dmQzR0hGSXlJY2ZiOHlFWmox?=
 =?utf-8?B?dy8xS2YvRllCWWNrVjg5M1dFRUdIakYzNTFiMmIyQ2xNZVE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB7983.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2ZPVHpLL3NEK2dLOEdoR2NwRm8rYVhvTXN6SEp5Ly9CY2lKb1FsMnZEc3hF?=
 =?utf-8?B?MDZxQ2F1ZGpNbGR2SmdyRDJhUUVlNkVJZ2tnVkpGek9MVUk4Z2c4a3FlSEZl?=
 =?utf-8?B?ZCtqTlJNdE42UFplcVhhaXpsSTY3TEVPaE9HWjNRdGF6ZldaSC8wc21hdldx?=
 =?utf-8?B?ekd3Y09rZUliNE9lWVFYNHdlS1k1emViR3Z2WHY3YUhKTTVLY1BhU216ZjFB?=
 =?utf-8?B?Q3Y5WUxyTldIT0JnWlRlUS96ck0wcWV5S3ZPMmZMZUR6Ykd5b1RhTHNBS0Z4?=
 =?utf-8?B?MzIzYmUrL1RMT1BhRk9JeVpyQkljWGVWdklNQ2ozd0w3QnNBUWFVMDEwZXpl?=
 =?utf-8?B?RDJMY0o0Qm5KTHpiZ0RrbzVzbGdTOEVyT2xGS1didFFNcFRKcWtJa0E5OHYx?=
 =?utf-8?B?VHovalg1ZFhzbWJQMElGdkhFOWMzSXJyVVhEMUxSUzZCaUw0TTRINHkxSTRJ?=
 =?utf-8?B?ZWpjQ2tZb0xlMzltOXhaaG9xYVM0NXduMVFZTjhwOG1mdGRmcEF3b1U0Sys4?=
 =?utf-8?B?NFlvMEdXN256Qm1naThydk9ZZ1pCUTF1RUVkMFVJOGtteGpiRE8vcFo3UXd0?=
 =?utf-8?B?ZFoxanhnUHFmdTBHVXNIblZPelBlcTFRajVVVmVJZ2U0R2lrc0JRSDlNQjg4?=
 =?utf-8?B?YXBqeU5jWmpuT1pBcVlxU2RNb2F4S3FQYnVGZ250eU1wV05WSWFVb1BKSkly?=
 =?utf-8?B?S3UwNUhVOXhBdHZEYTJTNmowajFlSkZaSHVBMVMyUEVITkFzclp5QmRjcTY1?=
 =?utf-8?B?K2hYODZBQVViZzhPcjZVNHI4YmpGaTIySk1FSStBNlFGWDVleUdPMDZkTzVK?=
 =?utf-8?B?dnlyVWxiWjRvOVVUWWtNZE9JNlp6dS9ub0N2TXJGWlpsMUNjQlRTVVJUU3RX?=
 =?utf-8?B?UXFIc0gwbjQ1MWVxUGJGMEFCSzlvclBTYllKWEM5ZDhCcFY2aXVkOVdNMWY4?=
 =?utf-8?B?aXdZbHFBZU4yZkxkbllDTlFjZ1JYdTlHeDZ4dlFaa1ZzR3pZalkwUGJSNFUy?=
 =?utf-8?B?bTZ0dzJWd0NiUVliMUhlQmVsbVllZ2RrTmtoOFQ5YzZZcGlDWTNrc0JuVGo2?=
 =?utf-8?B?c2xtZnRnYW1qcEVjdWp2KzNhWHBlc05GdVhidFBJZDFWSXZleG15NE8razA0?=
 =?utf-8?B?TkRFVjZUeksvS29XQ2NiVlN3ZDdJT2JrNjdhREdZT3dpdUxQTEFZdnZIOVBI?=
 =?utf-8?B?NnlseHpNVTdheHRMbFlZamVReDVGeS9HOHVPWjFleXVFVmNzTFJCNGo1THl2?=
 =?utf-8?B?OEtQNFFzZUMxRE8rLysyYjE3bVd0S2t0dXg0RFc1MVFJUks4TG5qaUFUaTNY?=
 =?utf-8?B?QlRLaFZ0UWwzYW10d01wVjNaRTRYZVRIS0k1M2pzcGRaRGpscmVwSCtldlJk?=
 =?utf-8?B?UVF2b0w5WE8wRUtYdUN3N0lJK25LWWt4MSs4Y1VJVHVSTitxWlRrMnpDQ2k1?=
 =?utf-8?B?Z1hsSVNsT20zT0w4Y1hUWkM3T1FsWUo3a1BKZFplWUIwOFo4THpLdTlYNUMw?=
 =?utf-8?B?TEtjVHJ3clp2QVhNVUF5cHdKQk1pTUpuVWk5UHRjbkFHL3F3aWMwZUF5T2tk?=
 =?utf-8?B?ZVhHcjN4Sk1ZaXVqMXl0aU9UMmpVV0N3c2pSazZ2VlpObmZxMTVaeUlXSmE1?=
 =?utf-8?B?VGYzOUh3ZUMyOFo0VFhzVGZvZkp2SGZ4SHZsR3QxLy90NjhrNXRNMTB1SFNT?=
 =?utf-8?B?QVI1NXB4Q2ovd3ZkN2h1Qm5pajN0VjlWTS9mdmFzSUpzemhyeTZkUmtzL1hh?=
 =?utf-8?B?SzRZU3VGOUlzZHZyMXNHSmtVT0tSV21mcG5IeFpaVWZIOEM1M3FMQUZndWtD?=
 =?utf-8?B?UG5NZjVSN05Hc2FpQk1VZEhxM3lzTDBESUpmR3F3ZHJiVk5makJjOE1ndHY3?=
 =?utf-8?B?RTVnYnNuSEE1bVYzL0c0QW1YekpUUGVwR2ZpVkU2OUlpTUkrcE1TelZQdUpH?=
 =?utf-8?B?czIzMkd1OUJBYVdKZG9aOWs4V0VNKzE1L3NnRTVmVTFjNHpjRnFGZUFDamJ6?=
 =?utf-8?B?ZVYyVEtmKzJySUZUaFl5SXJta0lWL0JSdExKTHcyalhjSEFzMVJuVCt6U0RO?=
 =?utf-8?B?aUpkalllMnVWS3V0MlJJeFdpS2x0TzhweFpyeERsbVJ5UlBKdXlBT1dxQmxF?=
 =?utf-8?B?OW8yaktGeFZjbGo0QXZqTUpyeWo3THZROXV1c2tDS0x6WDh3UlFBQ2lkZTgz?=
 =?utf-8?B?WFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4F28414321EA643A186DADFB9CF1D28@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB7983.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c79f34a4-64cf-48f9-1d72-08dd3ab80141
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 07:40:12.5440
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q3iGFWv5SS2Dj5WZB3mptxcGbnZZZOfJ3puZyz82/09Kkia2OWzY4AAA6p01LCWIYmuKxNsNpAZEnrrtqEq19VoFEFUoZBj6dzhV7vJ1Rf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6537
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_234024_472944_5C06AD34 
X-CRM114-Status: GOOD (  18.14  )
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

T24gVHVlLCAyMDI1LTAxLTIxIGF0IDE3OjMwICswMDAwLCBDb25vciBEb29sZXkgd3JvdGU6DQo+
IE9uIFR1ZSwgSmFuIDIxLCAyMDI1IGF0IDAyOjUwOjQwUE0gKzA4MDAsIEZyaWRheSBZYW5nIHdy
b3RlOg0KPiA+IFNNSSBMQVJCcyByZXF1aXJlIHJlc2V0IGZ1bmN0aW9ucyB3aGVuIGFwcGx5aW5n
IGNsYW1wIG9wZXJhdGlvbnMuDQo+ID4gQWRkICcjcmVzZXQtY2VsbHMnIGZvciB0aGUgY2xvY2sg
Y29udHJvbGxlciBsb2NhdGVkIGluIGltYWdlLA0KPiA+IGNhbWVyYQ0KPiA+IGFuZCBJUEUgc3Vi
c3lzdGVtcy4NCj4gDQo+IEEgbmV3IHJlcXVpcmVkIHByb3BlcnR5IGlzIGFuIGFiaSBicmVhaywg
cGxlYXNlIGV4cGxhaW4gd2h5IHRoaXMgaXMNCj4gcmVxdWlyZWQuIFdoYXQgYXJlICJTTUkgTEFS
QnMiPyBXaHkgZGlkIHRoaW5ncyBwcmV2aW91c2x5IHdvcmsNCj4gd2l0aG91dA0KPiBhY3Rpbmcg
YXMgYSByZXNldCBjb250cm9sbGVyPw0KPiANCg0KVGhlIGJhY2tncm91bmQgY2FuIHJlZmVyIHRv
IHRoZSBkaXNjdXNzaW9uIGluIHRoZSBmb2xsb3dpbmcgbGluazoNCg0KaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsL0NBRkdyZDlxWmhPYlFYdm0yX2FicWFYODN4TUxxeGpRRVRCMj13WHBvYkRX
VTFDbnZrQUBtYWlsLmdtYWlsLmNvbS8NCg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0NB
UER5S0Zwb2tYVjJnSkRnb3diaXhUdk9IXzVWTDNCNUg4ZXloUCtLSjVGYXNtMnJGZ0BtYWlsLmdt
YWlsLmNvbS8NClNNSSBjbGFtcCBhbmQgcmVzZXQgb3BlcmF0aW9ucyBzaG91bGQgYmUgaW1wbGVt
ZW50ZWQgaW4gU01JIGRyaXZlcg0KaW5zdGVhZCBvZiBQTSBkcml2ZXIuDQoNCkkgcHJldmlvdXNs
eSBhZGRlZCB0aGUgU01JIHJlc2V0IGNvbnRyb2wgZHJpdmVyLiBIb3dldmVyLCB0aGUNCnJldmll
d2VyJ3MgY29tbWVudHMgYXJlIGNvcnJlY3QsIHRoZXNlIGZ1bmN0aW9ucyBoYXZlIGFscmVhZHkN
CmJlZW4gaW1wbGVtZW50ZWQgaW4gdGhlIGNsb2NrIGNvbnRyb2wgZHJpdmVyLiBUaGVyZSBpcyBu
byBuZWVkDQp0byBzdWJtaXQgZHVwbGljYXRlIGNvZGUuIA0KDQpodHRwczovL2xvcmUua2VybmVs
Lm9yZy9sa21sLzIwMjQxMTIwMDYzMzA1LjgxMzUtMi1mcmlkYXkueWFuZ0BtZWRpYXRlay5jb20v
DQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNDExMjAwNjMzMDUuODEzNS0zLWZy
aWRheS55YW5nQG1lZGlhdGVrLmNvbS8NCg0KDQpPbiB0aGUgTWVkaWFUZWsgcGxhdGZvcm0sIHRo
ZSBTTUkgYmxvY2sgZGlhZ3JhbSBsaWtlIHRoaXM6DQoNCiAgICAgICAgICAgICAgICBEUkFNDQog
ICAgICAgICAgICAgICAgIHwNCiAgICAgICAgICAgIEVNSShFeHRlcm5hbCBNZW1vcnkgSW50ZXJm
YWNlKQ0KICAgICAgICAgICAgICAgICB8ICB8DQogICAgICAgICAgTWVkaWFUZWsgSU9NTVUoSW5w
dXQgT3V0cHV0IE1lbW9yeSBNYW5hZ2VtZW50IFVuaXQpDQogICAgICAgICAgICAgICAgIHwgIHwN
CiAgICAgICAgICAgICBTTUktQ29tbW9uKFNtYXJ0IE11bHRpbWVkaWEgSW50ZXJmYWNlIENvbW1v
bikNCiAgICAgICAgICAgICAgICAgfA0KICAgICAgICAgKy0tLS0tLS0tLS0tLS0tLS0rLS0tLS0t
LS0tLS0tLS0tLS0tKw0KICAgICAgICAgfCAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAg
ICAgfA0KICAgICAgICAgfCAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgfA0KICAg
ICAgICAgfCAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgfA0KICAgICAgICAgfCAg
ICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgfA0KICAgICAgICAgfCAgICAgICAgICAg
ICAgICB8ICAgICAgICAgICAgICAgICAgfA0KICAgICAgIGxhcmIwICAgICAgIFNNSS1TdWItQ29t
bW9uMCAgICAgU01JLVN1Yi1Db21tb24xDQogICAgICAgICAgICAgICAgICAgfCAgICAgIHwgICAg
IHwgICAgICB8ICAgICAgICAgICAgIHwNCiAgICAgICAgICAgICAgICAgIGxhcmIxICBsYXJiMiBs
YXJiMyAgbGFyYjcgICAgICAgbGFyYjkNCg0KVGhlIFNNSS1Db21tb24gY29ubmVjdHMgd2l0aCBT
TUkgTEFSQnMgYW5kIElPTU1VLiBUaGUgbWF4aW11bSBMQVJCcw0KbnVtYmVyIHRoYXQgY29ubmVj
dHMgd2l0aCBhIFNNSS1Db21tb24gaXMgOC4gSWYgdGhlIGVuZ2luZXMgbnVtYmVyIGlzDQpvdmVy
IDgsIHNvbWV0aW1lcyB3ZSB1c2UgYSBTTUktU3ViLUNvbW1vbiB3aGljaCBpcyBuZWFybHkgc2Ft
ZSB3aXRoDQpTTUktQ29tbW9uLiBJdCBzdXBwb3J0cyB1cCB0byA4IGlucHV0IGFuZCAxIG91dHB1
dChTTUktQ29tbW9uIGhhcyAyDQpvdXRwdXQpLg0KDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTog
RnJpZGF5IFlhbmcgPGZyaWRheS55YW5nQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4u
L2JpbmRpbmdzL2Nsb2NrL21lZGlhdGVrLG10ODE4OC1jbG9jay55YW1sIHwgMjENCj4gPiArKysr
KysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspDQo+
ID4gDQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Nsb2NrL21lZGlhdGVrLG10ODE4OC0NCj4gPiBjbG9jay55YW1sDQo+ID4gYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svbWVkaWF0ZWssbXQ4MTg4LQ0KPiA+IGNs
b2NrLnlhbWwNCj4gPiBpbmRleCA4NjA1NzAzMjA1NDUuLjI5ODVjOGM3MTdkNyAxMDA2NDQNCj4g
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svbWVkaWF0ZWss
bXQ4MTg4LQ0KPiA+IGNsb2NrLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvY2xvY2svbWVkaWF0ZWssbXQ4MTg4LQ0KPiA+IGNsb2NrLnlhbWwNCj4gPiBA
QCAtNTcsNiArNTcsMjcgQEAgcmVxdWlyZWQ6DQo+ID4gICAgLSByZWcNCj4gPiAgICAtICcjY2xv
Y2stY2VsbHMnDQo+ID4gDQo+ID4gK2FsbE9mOg0KPiA+ICsgIC0gaWY6DQo+ID4gKyAgICAgIHBy
b3BlcnRpZXM6DQo+ID4gKyAgICAgICAgY29tcGF0aWJsZToNCj4gPiArICAgICAgICAgIGNvbnRh
aW5zOg0KPiA+ICsgICAgICAgICAgICBlbnVtOg0KPiA+ICsgICAgICAgICAgICAgIC0gbWVkaWF0
ZWssbXQ4MTg4LWNhbXN5cy1yYXdhDQo+ID4gKyAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgx
ODgtY2Ftc3lzLXJhd2INCj4gPiArICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE4OC1jYW1z
eXMteXV2YQ0KPiA+ICsgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTg4LWNhbXN5cy15dXZi
DQo+ID4gKyAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxODgtaW1nc3lzLXdwZTENCj4gPiAr
ICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE4OC1pbWdzeXMtd3BlMg0KPiA+ICsgICAgICAg
ICAgICAgIC0gbWVkaWF0ZWssbXQ4MTg4LWltZ3N5cy13cGUzDQo+ID4gKyAgICAgICAgICAgICAg
LSBtZWRpYXRlayxtdDgxODgtaW1nc3lzMS1kaXAtbnINCj4gPiArICAgICAgICAgICAgICAtIG1l
ZGlhdGVrLG10ODE4OC1pbWdzeXMxLWRpcC10b3ANCj4gPiArICAgICAgICAgICAgICAtIG1lZGlh
dGVrLG10ODE4OC1pcGVzeXMNCj4gPiArDQo+ID4gKyAgICB0aGVuOg0KPiA+ICsgICAgICByZXF1
aXJlZDoNCj4gPiArICAgICAgICAtICcjcmVzZXQtY2VsbHMnDQo+ID4gKw0KPiA+ICBhZGRpdGlv
bmFsUHJvcGVydGllczogZmFsc2UNCj4gPiANCj4gPiAgZXhhbXBsZXM6DQo+ID4gLS0NCj4gPiAy
LjQ2LjANCj4gPiANCg==

