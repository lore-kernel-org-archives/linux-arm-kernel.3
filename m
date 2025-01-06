Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D495E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 14:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s31AXm/N6uetpyQk/+44+5jBSHQa97a2lQdX1NzcAe0=; b=SdDjuSKePjMgP0A69uMCLEhS9l
	czHCjengLhdx+moQznKnhz4am1fzeJOF2Plgh9K0aqiuSG2U7ANmdL3+CWbOaK12KIfiKEkwm5HcI
	HXlC38UvF+mBzxqjMXDw4yK27gdx6N1DpHo0pCayTdcTqGvtFvVgSj5YSpz6nMfggyMD+D8A5SCkK
	94jlHU+UR8iGv15GtBcsP3s94AwfOtijOUmifLHCYMmQ80cQDVSq8tL6xM6QhlrIvABsCo7ab5KhL
	QKhlvBWU2XOi+LIYvoVjw6fFn2A+wDu4gv56uMOkrG7VJeLNNlSGX/4EZgVdW24ne4prJ3eEzID61
	vNRxtR2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoUE-00000001fqp-0jXE;
	Mon, 06 Jan 2025 14:53:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoER-00000001bNe-1nxA;
	Mon, 06 Jan 2025 14:37:29 +0000
X-UUID: bf152ceccc3b11ef9048ed6ed365623b-20250106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=s31AXm/N6uetpyQk/+44+5jBSHQa97a2lQdX1NzcAe0=;
	b=OWDEf26vOYVjMh+k2GGURBzPRNmXuesf/WiYiPz2Xxw9Wb/BnjaRVORsJ9nF/twkl8yA6jBZRxNRnYmlli5wvYik2u5Cyyn1aK/j2WyxA164N7XZuUwFKsOlmxjNteDRRlo2/HKyDdAeaHz2i2r7FfyWQMVyzxw94gt2sOyNth4=;
X-CID-CACHE: Type:Local,Time:202501060734-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:622a279b-71a8-420f-ab0a-b0c38d57f469,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:5508be25-8650-4337-bf57-045b64170f0c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: bf152ceccc3b11ef9048ed6ed365623b-20250106
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1705179738; Mon, 06 Jan 2025 07:37:25 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 6 Jan 2025 22:37:22 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 6 Jan 2025 22:37:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2xQ9X971KlrreOLrKEU/0XaYTjZFSIwX2hhVvMypGi2P2YkRiYOhzGYzk7mdqbAJaLPjhZleukIV0m5KADJNW1Q1gt0JraiJdRLT8fTHsReBKU2ovc8wOJP28RcNmYZLwCBZfIvefcTJOpPDn58aUUy7wsdHZWwQgFkbI/Tq0cO3sMv7QkfjGodITnVeQDmL9bLprCpj1duVmxAHpdBUw0VQzC6+7vfrV7RxS12G1bJDirEMVG+NP4x+7+HKbfsrvkxX40DF9lNozcQvTJ8hhVCwxWhVoGKw69czafCe++gQkNsVr4o7B+JMzbC0UYNvPH5GI+pRYM+lkITCD2rPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s31AXm/N6uetpyQk/+44+5jBSHQa97a2lQdX1NzcAe0=;
 b=Q0e9qwjJxv7zVFt6rHM0QTftAa/2q254amATlFLOjcYFAKvk1zzduTSrk+6SNPbaNy+4z5cIehRUuVdtc8XnzrzDOlYVQM+38h3MuAu4bcRDxeWG87802Vge4HWJou3WAbBjXcv8bmXvCmbNYEsF4CgB25d2wdYrGf9o3mdpSEhXzXauN95n/i6EI+O4thZvvandyKs2Ryw6aDbuCF00c9ccffqsnstyGRctT26wUP04Pa75fuF5mSTaRGg6CZqH0m0IfScKNLd48SvckhzC3+0oM/MriVu+jsJaaD4DRSfhdC+OWZOHIjcarBhl4m/uNiXhRTs7UbRo3Lw1xdN/7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s31AXm/N6uetpyQk/+44+5jBSHQa97a2lQdX1NzcAe0=;
 b=lQk6smxePEKZzn7+KciGOc9vMfJsooHt8T8mDP/JmzQv9IG/6t+xhobEPNTLM6ZiyPe8dc/4fC6WMBzSvNI3ssp15muRocK1sOPeU/LrZJq/okGadxbzSQui3GDDijC895G3cnN+1bnpQ5eORadNths6abthTwNX3jdBeJaJ+e4=
Received: from PSAPR03MB6236.apcprd03.prod.outlook.com (2603:1096:301:9d::13)
 by SEYPR03MB7725.apcprd03.prod.outlook.com (2603:1096:101:13d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 14:37:20 +0000
Received: from PSAPR03MB6236.apcprd03.prod.outlook.com
 ([fe80::2b28:30c4:61a8:20f6]) by PSAPR03MB6236.apcprd03.prod.outlook.com
 ([fe80::2b28:30c4:61a8:20f6%4]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 14:37:20 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "vkoul@kernel.org"
	<vkoul@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/2] dt-bindings: phy: mediatek,xsphy: add property to set
 disconnect threshold
Thread-Topic: [PATCH 1/2] dt-bindings: phy: mediatek,xsphy: add property to
 set disconnect threshold
Thread-Index: AQHbP68py1rCfJL+MkWe9w25qfqE7bLJLQYAgEDkn4A=
Date: Mon, 6 Jan 2025 14:37:20 +0000
Message-ID: <61b4d5ac511684fb950373724b5606afd993bd82.camel@mediatek.com>
References: <20241126025859.29923-1-chunfeng.yun@mediatek.com>
	 <42p2d3zi6q2ohod6wqfhhp2g56hffftw2asuavtttzrtaa6x4a@qvc4zwkef5hq>
In-Reply-To: <42p2d3zi6q2ohod6wqfhhp2g56hffftw2asuavtttzrtaa6x4a@qvc4zwkef5hq>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB6236:EE_|SEYPR03MB7725:EE_
x-ms-office365-filtering-correlation-id: fb2e09ad-ef5e-42cd-0c11-08dd2e5fa042
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WG1va3Y4TW40cXJXSC9vMkFvNEQxbm5IMnRVb011ZkI2cS9BczBXRzhsa1hD?=
 =?utf-8?B?cHNPR3NEZWc0eHAxNVpveEcwTUpQRXZNMS91c2kyWTFDYjUzMlQ5YjhmYk9o?=
 =?utf-8?B?andtRGFERU9ScVZybEQ2ZThVNVhISEtmL3B2ZVpGMWI1Wkw0QVZ4bW5qeTdz?=
 =?utf-8?B?M0ZsYy8rdUZQNll1RzZ1cjZWQVpIcks5MDE2QWg5ZXhNU1Y5NVBhdUM2NDJX?=
 =?utf-8?B?cjdRRG5zeDdma25IU0g1Z2hEbnlQSXhqZTFGaXRDVFdJQk5ISEV4NlJTSEF2?=
 =?utf-8?B?V2hXMWJ2WURza1VUS3RRdVA5TFZ1SmRXWWhPNHdJdnJtUmMzZEtpd2ZIL015?=
 =?utf-8?B?d3B3Zm15enZpZXVEWGdaZ0JrZTVlQXZGTktvbXo2K3lmMnMzOXd2WWxRaHp5?=
 =?utf-8?B?ZHlBNkh3YUtVTStzY1pjOG12Tm9NMUhSMlIxcFZWVmY4K3N2Zm85MTJ3NDdK?=
 =?utf-8?B?NEZ4VjlDSm4wNmlqQmo5WVp1VDd0bzV0RWMwSEdLWm1qRGxvRTZBOVN3Qnk2?=
 =?utf-8?B?ODZSME1HbGNlTG9SRUpXYWJ3TWRrOUtoN0t4bnlQVVhQNDhZaEVaN3Q2WkU4?=
 =?utf-8?B?SGVCZGpLMkFqbGVuWTluNE80dnNYQkZoUDZqOUhIcXlNMHZlakprSnpSWlhj?=
 =?utf-8?B?WjNTUmQ0NzA2RmVjRmo4bElVWU5CWHFST0k5dW16aFdFS3MwVVpabUttUU5K?=
 =?utf-8?B?WHNDQXBXbExUaURKZFVyM243VnlLbzNlM0RicE9yYXVjSHU1bjVqUUp0aUtp?=
 =?utf-8?B?T3RJZDVFVWtiVXFkRXBDSm1GNXYvUExXQkRVaHZaSHM2clFkelZXZUFiQlV4?=
 =?utf-8?B?enl3c29PK2V2c3NCekZjT2diQ3ZMWm4wMWZibjIzaGRwT1ZKR1JxZGt6WFRj?=
 =?utf-8?B?VC91dFgvUFZGeEhyalV1dHU2a0dja0ZvRUorMVlhc3IzYzBUb091bS9oelVs?=
 =?utf-8?B?cStYa0ZwRHpQK3FnOUhtRWdZN0NtRmlyL3dXbE85bWFBNERWVWZtdHNENWNJ?=
 =?utf-8?B?akYvUHJmbE00WmNBY2IwclFoNytKNlNHdGZSK3d4TlpCajh2eld6Nkp2N25u?=
 =?utf-8?B?RXduYWxpekxqSGFyR0tqWnN2T1U3YmRFZndtUXdGUFRPTk1VWUpRVEpnZmlp?=
 =?utf-8?B?S3dHMU92OVphVnd0ZGxNbHpUeTM3cU9tQUJYREU2Wm0vU1VUc3Fpc1ZIMC9V?=
 =?utf-8?B?TmtHaDdvQnF0T3RRZU1kVGw5WXpZMGF5M2FKdlREeTl6ek5ma1V1K2EvVUtl?=
 =?utf-8?B?UWQrcnhkdXVvcXNBbkQ3Wml6bnpkSkxLbUpRWU5sQlhzeU92b1Raek9USmFJ?=
 =?utf-8?B?c0JDTml0QXdUUzlLYStZSTFudVQyZ3BqNm5yU1NCekc3cVJCWU80Y1ZyUjR6?=
 =?utf-8?B?SXNDWlVFV3V0b2l2bVl5T20rbDczTEpQbXZUYkVEbml5bFArenppZVJ3VEZy?=
 =?utf-8?B?NjJaRVNJM0NDTHRrT0hoV1N2L1hwODBXRlJibHFtK1NjVlNaTStzaGJ0T2wx?=
 =?utf-8?B?QUNCUjNiTVZHTDRHTGdJV3hDai9GeWVyUTJIVDE3RDhKSnEwRi9PTlZHcjkz?=
 =?utf-8?B?QXk4N2hmMlVKb1NtMHBaQ0RCWU9JL3NzT0dibkk2MURLL3NpS1g5UzJ0eGpp?=
 =?utf-8?B?dVFZaVJySklLVjhISFg0YkxoOTk3cTl6clJrcWxZT0FjSWkrRGIybVQwRkZ3?=
 =?utf-8?B?a01OZ0VXNWNnbUdEcDdxcTRmTGpNNjZMcHk5d1h4WmNJakpqS3NNWjNLQWdO?=
 =?utf-8?B?TjB2QVFVdnl3bkxGRHNzZk8vL1E4cW8xVlFZT0hVcmhuUW14ZTk4T2RtdUs3?=
 =?utf-8?B?VDJYNlg5RHlFdDlDSm1rcy9QdS9wNk03K0dxOHFudUtMZmJybWFvSnY2V3Yx?=
 =?utf-8?B?SCtpWFZMQW5MblB2cEdVdkd4YS9nQkdXa3hFWjlSZmFvbVhBS0Fwa1NIS3Ru?=
 =?utf-8?Q?LGM1YXW9CFjPOTCh97TK84fXT7tEPV6Y?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB6236.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aTV6dlNtbmg0S3Vsa1RzbVVkQUxobkJVczdaMHBBbFhBUTh1Rk5nWVRkbTNG?=
 =?utf-8?B?NWs0emRwOG5qeVc4QjRBZkN0WHhOU0JOYm44TXcyMVg3RnMzTHFWTm1qSjZo?=
 =?utf-8?B?NXlRcGFqMW1QN0F3Ky9nZXVVUkk2NGxncHp1cFlNTXRRRU5UM0NBMlRvRGJF?=
 =?utf-8?B?VHV0bVZTakdNTURUdGtmeHlTaGJGeHNNZGhaaGVQeng0R1FpYTAzbnkvQkVB?=
 =?utf-8?B?M2RiQjdBZkY1UUl3V1RwSVpRRGFzV1pIRm5mT3FVR0J3bzhZRllkTE95Z0d5?=
 =?utf-8?B?R0lKMHBnanduenp0SC81UjhEMmYzV3BnMHZ3L2ZqVStmOGZQZC9YZCtPWnR1?=
 =?utf-8?B?enlVKy9URmtXcWQ4TWpPUWd1TFRKendYVnQzTnRPNkRrSTdwYTdmRWFxTzQz?=
 =?utf-8?B?S3J2bkJSUW54M2pHVGh3d2ttR2xScmQ3TTlzckVZMmU2NFVuZkFIS2NycmQy?=
 =?utf-8?B?d1NiMjNzZnhxWUQzMWdNVjE1dGI3MXBLSVFYbUt1SWp5SjRDS0FvVytCdTF3?=
 =?utf-8?B?cDVBWWNzM21iZUwrRWVpQ1RrYTlUb0VvWXBhVmdGdTNlQS92WHdkYUpGQUVY?=
 =?utf-8?B?Q085Z1dOUXVtQ2EwZ2JHc2RjTTlXWk9XZWlORFR3QkhudHNCY1FqVkpqaVlP?=
 =?utf-8?B?amVuS3ZkUU5vTlN0S3pjTGFqR0k4Q1dzME5EQk5lY3hOTFVIcTNHcFdPNk0w?=
 =?utf-8?B?cVFNS2twVlpudDlOUTdzd3gzQ3I4TWZKWGNXNmFVZHZOelRQN0RFeDBMQ1Yy?=
 =?utf-8?B?REh0bGlMd1o0cXliRWxmb1VialR4UExtb0lKTlhNZFJ0VU5jODlPM1FTM09s?=
 =?utf-8?B?WTFGNzhyTEhQQ09pVWJhT2drSEhvbGdldkFqMVpXcDE2bUljQndYWERNVlV0?=
 =?utf-8?B?UGt0L21SK2lCN2wxemVzN1IvVE5vaDU0bThGSkhpM0FUalpaeXJoYnNTeGg2?=
 =?utf-8?B?VW1uMWxFYW1vU2NSejh3MEYxZVIxWFFrMVNES3Y2V1c2OVZqVjNjWlRiVDNo?=
 =?utf-8?B?ZGRjYUg1K21FSlhjYjE0aDcvQ3d4bzI4bXJrTjlRQUszZWtrMDRyTWgrWDhU?=
 =?utf-8?B?bW1LaXpHWWpJU0FjQytHbUs4eThJalZWZ3N1UlpBK1ZYSUMwU0pSK1RCaHFx?=
 =?utf-8?B?Q0wyZkJLQ3RNcUd2VFNLdDJpcWZpWU53eDVST3lqWW9lSE5jNXhWT09CUDRY?=
 =?utf-8?B?c0NGdlhWWjhXaW5wbVhxeDd0SHBYWUhYeXgzVm4wYjVEbWpta0U5T0wzTlZj?=
 =?utf-8?B?SVc5aTVENnhWOXZaMU14cE94ek5YRTB2SHRsMEc5cFZsZk9VUmRFQVpsZmwr?=
 =?utf-8?B?bS9EV0hWUGZBU1A4MkNjQ01UQndzT3plOG9Cc21IVEkycCswK2lsQVlIc0sx?=
 =?utf-8?B?b0dRMThMRk9CQk41M2RvaEd4UEFWOFFzZjZUTVNSa25wQmlTMjE0dlZ1VFhQ?=
 =?utf-8?B?ZkpJdnA4UlRaV25VT09NaEh1VWp5bHdCNUU0VlpUUXhOa1lmQ2xoOHpLWWwz?=
 =?utf-8?B?MlVXUENRc0V0MjJEdEFadHpWL1I3c1lSVmJnaUFBUVUxL3JGeGF6ckkzWjNI?=
 =?utf-8?B?ZGM5b2JvTnNtVkxKUmVDSkVGaGNTeFBES3oyZ0M3WGtTZlR6MGNOSGY2STN1?=
 =?utf-8?B?NEJZTEMxejZLTzZFZFFITVZpS1pRNnlMenFVZWF5YjdOK3NFTkJuS0JTQ2k2?=
 =?utf-8?B?L0JaVjlWb3hJRmRLS0dST1Eyd2Z3dG5qYndCTktwa1pvd0swaVZxUXQ2UW1K?=
 =?utf-8?B?U0k2MGlacmZCWGp4VWt1WXRxOFZ3UkI1TFlaLzBORnE1ZUFwbnc5c1loazVh?=
 =?utf-8?B?aFpySDFmc0F2bXdDeWdDMkc4YUk0UDBoc0VSdGN5eHVYL2dPVE9QUk9WZHN4?=
 =?utf-8?B?MjJhaWUzNitacGx5ZTkxTjFTWi8zd1dVNXNjeTY1cG9EeC9ObVEycXpDbHU5?=
 =?utf-8?B?MjVNK2RwWmZicFgxbUwxUkJ1VGtvdGphcXZNTzR6UnhyRGxoRHJLS0FLckN1?=
 =?utf-8?B?YlN1SFdLSWxTVFRRcnkrU1A3Y09PNE9pSmFqNGxSZG0xV0poeGlPa3k0QmJu?=
 =?utf-8?B?a2wrczdpY3M5djZyc3lGUWkrejRxUkR6L3hQeU5UMnczOEc4WmtidW8vcm8r?=
 =?utf-8?B?bTY0YzN0ZC9BQ3lEK0JvVXJVOVBMeDlwbExsSng4cC9lSWVaSHRXTWY1aDUr?=
 =?utf-8?B?K0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <143025ACFB16B54B80890A6A1B18AD46@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB6236.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb2e09ad-ef5e-42cd-0c11-08dd2e5fa042
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 14:37:20.1908
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wumNbc2V79p3Mw5S6CDUAWlQSwGHasqzdJGYz16mvcZesYrQLX1OLwzwHVxMLGI5UdQkyasQvaK90aatUP3RFY/HOQ+GMet28SG8Eis/yAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7725
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_063727_480465_E4166A15 
X-CRM114-Status: GOOD (  17.75  )
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

T24gVHVlLCAyMDI0LTExLTI2IGF0IDA4OjM4ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIFR1ZSwgTm92IDI2LCAyMDI0IGF0IDEwOjU4OjU4QU0g
KzA4MDAsIENodW5mZW5nIFl1biB3cm90ZToNCj4gPiBBZGQgYSBwcm9wZXJ0eSB0byB0dW5lIHVz
YjIgcGh5J3MgZGlzY29ubmVjdCB0aHJlc2hvbGQuDQo+ID4gQW5kIGFkZCBhIGNvbXBhdGlibGUg
Zm9yIG10ODE5Ni4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHVuZmVuZyBZdW4gPGNodW5m
ZW5nLnl1bkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWsseHNwaHkueWFtbCB8IDgNCj4gPiArKysrKysrKw0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdp
dA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9tZWRpYXRlayx4
c3BoeS55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21l
ZGlhdGVrLHhzcGh5LnlhbWwNCj4gPiBpbmRleCBhOWUzMTM5ZmQ0MjEuLjJlMDEyZDVlMWRhMSAx
MDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21l
ZGlhdGVrLHhzcGh5LnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGh5L21lZGlhdGVrLHhzcGh5LnlhbWwNCj4gPiBAQCAtNDksNiArNDksNyBAQCBwcm9w
ZXJ0aWVzOg0KPiA+ICAgICAgICAtIGVudW06DQo+ID4gICAgICAgICAgICAtIG1lZGlhdGVrLG10
MzYxMS14c3BoeQ0KPiA+ICAgICAgICAgICAgLSBtZWRpYXRlayxtdDM2MTIteHNwaHkNCj4gPiAr
ICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTk2LXhzcGh5DQo+IA0KPiBLZWVwIG9yZGVyLg0KWWVz
LCBpdCdzIGFscmVhZHkgb3JkZXJlZC4NCj4gDQo+ID4gICAgICAgIC0gY29uc3Q6IG1lZGlhdGVr
LHhzcGh5DQo+ID4gDQo+ID4gICAgcmVnOg0KPiA+IEBAIC0xMjksNiArMTMwLDEzIEBAIHBhdHRl
cm5Qcm9wZXJ0aWVzOg0KPiA+ICAgICAgICAgIG1pbmltdW06IDENCj4gPiAgICAgICAgICBtYXhp
bXVtOiA3DQo+ID4gDQo+ID4gKyAgICAgIG1lZGlhdGVrLGRpc2N0aDoNCj4gPiArICAgICAgICBk
ZXNjcmlwdGlvbjoNCj4gPiArICAgICAgICAgIFRoZSBzZWxlY3Rpb24gb2YgZGlzY29ubmVjdCB0
aHJlc2hvbGQgKFUyIHBoeSkNCj4gDQo+IFRocmVzaG9sZCBpbiB3aGF0IHVuaXRzPw0KSXQncyBh
IHRocmVzaG9sZCBsZXZlbCwgY2FuIGJlIHRyZWF0IGl0IGFzIGFuIGluZGV4Lg0KDQpUaGFua3MN
Cg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4gDQo=

