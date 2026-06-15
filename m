Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06DACD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 08:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ngG7jwon0ngWsRZbQzoUQvuXyF0wOFK1utI302Mczqs=; b=SE9q6iy23d7q5uelnd9SSeudCT
	iC9dUC+qfL4mmagH08Mwg/0uZgRGYUkc4VCmFjf6nNlL3lulrbaH784YCQmMb9628WZx1Hc6KbhZO
	QEc3fq/qRZM5/phIWXJz6trTsKrmNSIgX52jWxBaPwEI90o23knXPrvdhF9NTbYW/fzlpm0ETdsTr
	B+Yzo8j5Ej7dRNMASvvNeC0UzfWSwfKNosNs0QnWq3qEDY3sIC7Us/W2Sv1Pf/WnufxuDqJHCDUUt
	tQzXhvWt9MNqRHi5knDRW+q1k1hsowYEj6O1kjrhYzXkePgxwPXLRaGfsaDw5X5Q5wh4nNaZfsypx
	/plaNq6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2w8-0000000Dtpb-2aQO;
	Mon, 15 Jun 2026 08:44:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2w3-0000000DtoW-3l4C;
	Mon, 15 Jun 2026 08:44:49 +0000
X-UUID: 75e3659a689611f1acbe4559397dec65-20260615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ngG7jwon0ngWsRZbQzoUQvuXyF0wOFK1utI302Mczqs=;
	b=Yd3wjpKdK2vBrfoOgyyiRjQe0/sD3cWs2t9f0/ANFtP3xYpeDoMbk+P/wt5DGNdtQFRjIlfDepHdCPaYt5PMk/hWCUtPiEvEkqkVCYOIhhZgm7zyQqCsmCcYM6CE8sz/0kn4RsXTNxkk+Cj/7pALszoGTCWoe0Hkum2qQLD8Uos=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:db22a62d-c399-4bfd-b5ba-6402cc43555b,IP:0,U
	RL:0,TC:0,Content:14,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:14
X-CID-META: VersionHash:e276073,CLOUDID:10b0ce30-7784-4a77-a538-47ed6151d81b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:3|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
	l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 75e3659a689611f1acbe4559397dec65-20260615
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 166055024; Mon, 15 Jun 2026 01:44:45 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Jun 2026 16:44:43 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 15 Jun 2026 16:44:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnBhXqcYSss4lX+CKkDZzhCIYgO0N12S+8jBZDPovAPojKyiy92kXDz1Sd8Ed8MX7VjNLN8A2OAHLtDlyO36D/SVOZWE57CaQpONVA4j+HKXSvFINBU1PaATKo+VMzJkIzHTZbXl9FlxoQKQEyCVgge1OSMohhuoJRuOtFjj/4M3g+FsNmYjfDzmhbc7yDBG/BUmuvmN8oWYtuXplNfSw5uPuQgZM8jBjKA95NUT1bdjrJjaCA9kVSWkgr7UtQrCf1tSFVr/gXtYg80bUUm5OhKFkbFL04qE00aMVVPISnVm2Ia4VWJa24TkN0af2e36jVlr2sE1UOz+MWq5MPzJFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngG7jwon0ngWsRZbQzoUQvuXyF0wOFK1utI302Mczqs=;
 b=nOJ5iI6HCS1w+21TAp5pjMqHkch3o+wkQoWOiH9CFDxeX0i3KXGPr8KkCrl9KxJO4tZHjf5X+dseUHNkZrBX6pL7Tue0jt+wEieS2sHeqlWrt06cCuVmkdruf5rgFN0zglYhkIRo5TJTn2YJ0EkNis2eXhpdczp4jPp7o0k2DkMTKwSSJqTPLdkfF3G6j35DgKcFYJLsf93L12giN9P7ec+YAJG3qo1RbyMh7zmu4e+YWlTu2G2IHrAmJOTOdkw4nCf3q7h99CO0Rf/M04yvbb6WTkfd2oB8JVzzkRA6WbleX3RWJ1eKokyOev9/M3dqF4Vfm2nYajBKezYiuJ4nvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ngG7jwon0ngWsRZbQzoUQvuXyF0wOFK1utI302Mczqs=;
 b=gZy73VUWMkGme4aMCrT2CFjyG6UF0GQHIXi80bmL95SrTIQ/6AjdxNBGLh9B/MmOhghbPkSuhAI8aSIoLVoL1dmB/1udo8j9kXzaHNcQZDqVedWCF7kLpTQfqmhu0Tc22cFcNmgl0Y7PpIIRNHHZTc5GD1twYP+f/j21GYvcbjg=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by TY1PPF4A10620CF.apcprd03.prod.outlook.com (2603:1096:408::a51) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 15 Jun
 2026 08:44:37 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::165:d36a:3f76:2925]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::165:d36a:3f76:2925%6]) with mapi id 15.21.0113.013; Mon, 15 Jun 2026
 08:44:37 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "avri.altman@wdc.com" <avri.altman@wdc.com>, "linux-scsi@vger.kernel.org"
	<linux-scsi@vger.kernel.org>, =?utf-8?B?RWQgVHNhaSAo6JSh5a6X6LuSKQ==?=
	<Ed.Tsai@mediatek.com>, "bvanassche@acm.org" <bvanassche@acm.org>,
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
	=?utf-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?= <Naomi.Chu@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, wsd_upstream
	<wsd_upstream@mediatek.com>, =?utf-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?=
	<Alice.Chao@mediatek.com>
Subject: Re: [PATCH v3 3/3] ufs: core: Remove max_num_rtt field from
 ufs_hba_variant_ops
Thread-Topic: [PATCH v3 3/3] ufs: core: Remove max_num_rtt field from
 ufs_hba_variant_ops
Thread-Index: AQHc/IwBSnhfzpkK3EGJyMeVvcczXLY/TUsA
Date: Mon, 15 Jun 2026 08:44:37 +0000
Message-ID: <f332a3baeadcae410a99098d1459899a6a6c34b2.camel@mediatek.com>
References: <20260615055802.105479-1-ed.tsai@mediatek.com>
	 <20260615055802.105479-4-ed.tsai@mediatek.com>
In-Reply-To: <20260615055802.105479-4-ed.tsai@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|TY1PPF4A10620CF:EE_
x-ms-office365-filtering-correlation-id: bb187015-d391-4b54-0b26-08decaba552f
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|56012099006|11063799006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: /1hLmMz8VyhBc92rI66eQ5V6wKcRov0HdO9LbEOrTMY9lVAfZzsWVvTX5Dpm5W0Sau/2VpZSGRecpxdRU7ewCxwF3/5hCXtSaNE46X6QjOMBP3FxDdm/8Fouy4LnYvIy54f1xRa6f3BVag7PnMUg+hfWdx0J97EAnxm2jiw0Pn1rcSJqRq2Tbu7Y/thVq9vNrCc2m/8QzywvJ+9AoNPy3zDBTcprpdpLN3/CMVfgBuDMnHm7cn75rxQR0/63tPLtsDzXwKgezfZCzqZWcb3PFAcu3e9w739E/0DJxg6EMNntCaef749fN4Zy+axUlI8vp24qGNMOlAl8mKtT9usdSjP5IZK/K/OhN7bT9gFfLJAx3K/5fUIbErRTLI2PkAHNkSEXsxNUwaZN6mpAjThqEMBhcgqBjILj9Qj3x4Gmwz3C4DCVNqGy/Qq1H5goZRKKed3oaIPHqzTjnjyEJ1VI1nm/z7LKxdGQloKMQU4DNUqxGf9dRhyAfaRrjhYTR881v+PDWNqE8BUfb3fUvMXGFDBf9uxGAvO4723WzltX9bHOuooTZMfGb184wf+s+tpxozShr7ldN4oNjCRJdNz6ca93qMCdyWEfakDXt8tVOJgD0fyRgTKkJTyeyHmE2uefSL7RTts1ujEDzt5Wxgnc5rZ1iP6jJVL5OVteEoMAZXzExBJjsNN71EiV3FVXLsywKOqhRIYyUwxe4vEIJKQaSdqan1ZIgxXNdxQzoTVIjOS68P2vVp/CisTIzhiTFzlp
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTdhRXhsRU1nQWFwTWtoanpSaHlLdytORzBkSW9laDhJeWQ5dHM3MnIvZFVH?=
 =?utf-8?B?STByUHJqV3FxOFFJYmJ6dUdGQ3g0Y3VlTHUwbVFEOFBBMWZBeC9uNFF0YXEv?=
 =?utf-8?B?WDVSK2t1a2l0bzE0KzZBUHFmZ3cwQjBGSFo0ZzBkMG9abjF2ZWVNRklGWWNB?=
 =?utf-8?B?VGdabmcrc0pPTTRZeVJNNDdVOWxHMEF6MytwSDUvdUxhcmhPV1M4WkVQeUN6?=
 =?utf-8?B?SGtxOHF3SEJwaWtPNU5TcDRGRTUxRGpuR1UzeSszQWZrdGd5SjlFaXZabk54?=
 =?utf-8?B?RjFINERaNEtoaUdzY1E0WUI5NnJnVE40dVRLNGlIblBTSVpvazJueGc2RmJo?=
 =?utf-8?B?M3JCa2dIbk5ZaVlBcnpsWjdrNUsyaFF6Vk9SMTFiN2w0WEhiOG15NVpTV0RF?=
 =?utf-8?B?aVg0czg4aDZ0b2JueitpdXNPYjdncWhKMFpydGovdUhCWEk0QTE3NWx6dG1Q?=
 =?utf-8?B?SkF4UFBxWlR5R0phUXJQakN1azNJcU5MWnBxM0J3OXMyYkQ3ZFVHcWZlQUJC?=
 =?utf-8?B?UkV5MUVCc2pCWThlVjdVaWd2QVljcEcvSjJxMlFSb3Q5RThObEtkTjJaRkp1?=
 =?utf-8?B?aklNSlcvK00wT1YzVXUveWRxaUZ5S0NPRCswWXlHeWU3RDR6ZERJM0ZpaFlB?=
 =?utf-8?B?RTRKbUF5WmxTMzZSajRzZ3ljMncyYVFkZ1ZSU0RRMUQ3RVN1czdlc0lna2Vl?=
 =?utf-8?B?SFNncHNiVWhad0RFYk1sRWdKSXVaaUpzOWR1LzI1MXhrQ3ZWMjJrR1VRMDNi?=
 =?utf-8?B?U3VqUHhBbGhQVlF1ZnNjOVFzS1BTdzFJdCs4ZC9XZmpFWFk0TFpaOWlRRlJo?=
 =?utf-8?B?cCt4clFQaHptMGtwbG1XSzZnQ0NJOVhmN3VvV2haWVNmK0VmdmdoNG5SK0dm?=
 =?utf-8?B?Y3R1SGlTWVRGQ2ZKNElMczVKMFNlTVBibXh2R0JEV1drQ1lYbEdiK0xoRXpj?=
 =?utf-8?B?ZlVkcGlhazlSWGUrU1ZrR1FkUmpQTHpQM0ltSTZ1a3k0aCsrNW8xU2tRMko5?=
 =?utf-8?B?M1FMVlFYK3RWMW4wenlvdjdsN1QwZlVZTHRBZmt0b0dQcEpkZk11aFluRjJu?=
 =?utf-8?B?RE9qTC9VRXNHSjBqcUJ5UlRzV2lXSkVsSVBGZUFxUXFMb0dXcU5RZUhDMStE?=
 =?utf-8?B?OFR3d3hJZnhENzNDd2x0ZXcwa2hBSnF6NUVPc3JXaTMydStOL29IaFJtYUxr?=
 =?utf-8?B?MDVreUljcDVkM0gxUjVXZU56a1dDUEYwVWtvL2NhMTBmaHRRdHpJMTZnSnlE?=
 =?utf-8?B?ek1vZmx3MWNtUWJvbXc2MEFPUjFoUEZuQVJXajg2UnA0cnhIUjY4VGxuRjVo?=
 =?utf-8?B?ZmRYcC9zUzhocEtqZ3JDcXJrRXFMRVgvNmR4K3IxV1RDMlVKT0VwVWswdWZO?=
 =?utf-8?B?aHpSQVdkQlh0L2hOemtNWXZOL0pUUzF3ZWVBTSswTENTVU9YNHIxUGN4RlVx?=
 =?utf-8?B?SDQybmdWUHVIcVhYY1ZuMXRpMXlWME16YTNaem5tSlQ1YXNpb05XMHhrU2R5?=
 =?utf-8?B?dzlZVXFXSFBUdnZ4SWp1ZklqelQ5dnhUb2Nyd2JzYnd3Uk8wS2RRZHB1Um0x?=
 =?utf-8?B?bm5Yd2JvQ3VBMGdXcExZaHJBTEswbFNMM0hremhyM2JYUUtxTmxpRStPTHgz?=
 =?utf-8?B?RFF3S0VOcTlBYThQVEs3QTRKRHpDeDRNaTdTNmxFUUYrU2R3YXduV1FyOHRx?=
 =?utf-8?B?bmRRMERncjdCa2xZNWYyZEdUUm1IODc0bGlTR2xJeHVsbzRMd242dzNmYmdF?=
 =?utf-8?B?MUxsSjhOYlF6TXQ3Y1cwdWtvZFBVbWFQa1NUUVFWYjZkc0dDeUgva2xpRGl4?=
 =?utf-8?B?Z2VmcHd6aUdSWjJIV3pFM21rRHlwblNrU3hCNlRyWFpuQ2pCOHpvenlYa2wr?=
 =?utf-8?B?TlBhOUQ1cjRFM2hhbzBPMHJFQmNvd21UUlVsMkRxSG1SL1c3YXY1WmtiVEw1?=
 =?utf-8?B?M1lGVXVoZEJKV0pLZDlHaXBhNUNOVTlxK2M4OWRuenJwaGpMUXpod1dZdktx?=
 =?utf-8?B?OVI2U3dzU1YzYzRXUU0xWHJxR1o1M1V5bHdJVWhoNGZOUkZ4bFJNQ0U5azVH?=
 =?utf-8?B?TnZGQk1mUkZ0NTZQWStpd0pWY0dCSkEzeW1USjgyMS9Pa3A5Z3lVV1hpUCsw?=
 =?utf-8?B?T2NmNUN0Q2RhRWNvYnpNNjRDZTM2eit6bURDMm91RTBScHQ5dDBTUWVmQmkv?=
 =?utf-8?B?eC9DUGYrVnpNeHEvUC9SaWs5NHRNMmpWbzUzWnNjMkdCTjZzekl6VWlYZkY0?=
 =?utf-8?B?bmQ4UVhxK20xeUpDRmNrVSsxSVJUeXpyQlFpVS9OU3M1TDRzYUVkQkFZM2JG?=
 =?utf-8?B?WTVTV2RlN2ZkaXluVXdlMTlub2JaNnJXSHdRbkJMTzhrSWpWV3Ezd3loRE4w?=
 =?utf-8?Q?WgRXRgtm+uj9ZoHU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <253451DF34FE4546A1670DC1CD7E0E1B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: tN3qQ9MSDxR2CCIEW/B1xhxDk82QsJN7Sci4VG0q3OQoDkZCjpPV6YzhoXKSJ40IFJOq3wBv3vZxphehQbxBfOjTJipX5wELmtCAZ0LE4XZfvdtinQddqIvvgvff6Y+lpzuwCf7vwEBg9c3Yxwm2uklzeDcjLNNvFeQUarcHaZpO0ROuUP0NyvvN5uBzSiFJn6gS/vslenCoYaCmw4vBzaAScnmev+vD3hX0Hc+k2W89iH/ZQIC6Z7V6IFjVQJjf3xWDMCVDcHv+LaDqZSUMXRXnmO49R1v+2xkFDvpG4QMKPQwze8nVzXyInTPg2xCa0ISSFdqx0G9XwYLTey/q6g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb187015-d391-4b54-0b26-08decaba552f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 08:44:37.4516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cLhco4ct6/NDcQRWphlqP58gEGN0rAlW+uKIYJDMUfwx/5r83aHTXoGhP3KiNNF5d8hqdhc9M9C3r4ntLpFgug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF4A10620CF
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_014447_938896_37B7DF85 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
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

T24gTW9uLCAyMDI2LTA2LTE1IGF0IDEzOjU3ICswODAwLCBlZC50c2FpQG1lZGlhdGVrLmNvbSB3
cm90ZToNCj4gRnJvbTogRWQgVHNhaSA8ZWQudHNhaUBtZWRpYXRlay5jb20+DQo+IA0KPiBSZW1v
dmUgdGhlIG1heF9udW1fcnR0IGZpZWxkIGZyb20gdWZzX2hiYV92YXJpYW50X29wcyBhcyBpdCBo
YXMgYmVlbg0KPiByZXBsYWNlZCBieSB0aGUgZ2V0X2hiYV9ub3J0dCgpIGNhbGxiYWNrIHdoaWNo
IHByb3ZpZGVzIG1vcmUgZmxleGlibGUNCj4gcGxhdGZvcm0tc3BlY2lmaWMgUlRUIGNhcGFiaWxp
dHkgaGFuZGxpbmcuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBFZCBUc2FpIDxlZC50c2FpQG1lZGlh
dGVrLmNvbT4NCj4gLS0tDQoNClJldmlld2VkLWJ5OiBQZXRlciBXYW5nIDxwZXRlci53YW5nQG1l
ZGlhdGVrLmNvbT4NCg0K

