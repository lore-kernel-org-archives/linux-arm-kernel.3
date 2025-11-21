Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12ABFCF2564
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 03:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+cq9kIbBG/VGLCSF78IYQPXYzt4G1fX1MAWMmqNbhJc=; b=DlRRb4fnsrw8f92W0WCJ4j97Sg
	FZvwRN7NbG9cfSX9x+bXcDbXaktetrPFuhpXDnIFYlpLVDxEYqiI5n/G4ggD1Srd268VzVmoTbTq3
	PQpuE9sUwK7wGfKTsjFvSF5kW78hetUlW82ufnyNArq8cW6rt8UbYm/VadW/obCDsffy8FexAlauc
	X8uZIM2T0JtqRKJgjTUC+71K5Bh2kBT0wGmmzhxunc0c1qtQvGbDkDlLn0lEETieUNXZ1tnl8I5XQ
	A7GXCK07LgOR4vHJRjPzVbW/yuI/h50Ua/v5uGwsatxjc9Q62xNfNsdjb9gNRiAGodi1+q9SyUrlF
	T5NxmOKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMI3J-00000007m6M-3zPm;
	Fri, 21 Nov 2025 03:43:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMI3G-00000007m5p-3oah;
	Fri, 21 Nov 2025 03:43:16 +0000
X-UUID: 33ec2660c68c11f0a52f393f94899d25-20251120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=+cq9kIbBG/VGLCSF78IYQPXYzt4G1fX1MAWMmqNbhJc=;
	b=uzvDgeTp3q6dJlUK4MTCwkoKCYweFxdLkQu4+rMds+mcGDviki07fEHPn3hf0ayUdovJcw9Pq9nH78jHQ/OdIRJTqpI3TZr1FWlz+bzZ+Ko5eA6njwFaI65UoFPrnqF5400FS6tWVWZE7CDiqaM0zszy81CL4FirTDFSnuMlcwU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:3586ab7d-caaa-47b2-8170-e563b2f02f6d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:2b91e382-b6af-4b29-9981-6bf838f9504d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil
	,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 33ec2660c68c11f0a52f393f94899d25-20251120
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ot_shunxi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1258726592; Thu, 20 Nov 2025 20:43:11 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 21 Nov 2025 11:43:09 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 21 Nov 2025 11:43:08 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ti4NznedbgsnMELQfe5PLI58KlA98FVYBflG5Vjxou2V90LKwkC4Qb/QHJsoXa1n3k9wJLFphZKcGq9+uhP67+U67spjWVXuUE14t8mHDBhKYc8VXc/bOPP/Nc4W7hMepryFgVgHW93afvNsLX4HEyzcwK3HOA/56nXxLZ/4W8ViUcgglM7BdCOIi9bsKafbY7KIN+sba7xG5XrY/SX5viEbl98BsgH0bag/vSRCLScM2/ReZE/TuESdSG0VBJnMmEYhrdQQkkQbq8JYK61F0lhXBPNhXtAIiiuPTYXbZXtD6TmCYpvwgIHlAlzdQGwGM2q7chD4q/I1fZEALS2zqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+cq9kIbBG/VGLCSF78IYQPXYzt4G1fX1MAWMmqNbhJc=;
 b=JMEIoEQ4IN9XC2yEip0zE1e57w7kONaNDgqGfbl4KduJP4/yc0eaLSTG8BvAL/cCyEXO/PfwWAICrYBHxf2A8PjcYcNnF6urRlfLz75XCuXL2TXTnc+ZKU/MlYQ77QgORrqUjVxE9Qb2LOiiJduIww3KLsSqrYtx+vy3+UpNk0uEWyql3KgStlXdWOneXqzJTdNW4ncP26OchH7cHYKdEtQkN9tyY5UKks+C4l7fO+LH8tqIaifAPpIiTPvr3d4Y8Ham5mFNFJAVlz4CrrsJaFo0tm74ty+fjoLLonnQ5WctqXxznCbLyKcWyEXdx/k8v6VN8n+C40MF8FFO0kWa1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+cq9kIbBG/VGLCSF78IYQPXYzt4G1fX1MAWMmqNbhJc=;
 b=Oorl7z3db3qakHkUdkjvkXn+057tKrA3/vU5QX/x1QlXRVhiO1rBvfmttJ1m74PsYMa5jXvAoMJ6skVhZcJ5wvF4JmjkTEbzDAtB+cM2g2a4g0pQgWoWYEyALYbJDblh9Da3dKbbN15ZDwZ9rWSpd6KowzEfXX0tzXHhkHVggeo=
Received: from KL1PR03MB5974.apcprd03.prod.outlook.com (2603:1096:820:88::11)
 by SEYPR03MB8226.apcprd03.prod.outlook.com (2603:1096:101:1a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 03:43:06 +0000
Received: from KL1PR03MB5974.apcprd03.prod.outlook.com
 ([fe80::35d:48c9:580e:b5fc]) by KL1PR03MB5974.apcprd03.prod.outlook.com
 ([fe80::35d:48c9:580e:b5fc%2]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 03:43:05 +0000
From: =?utf-8?B?U2h1bnhpIFpoYW5nICjnq6Dpobrllpwp?=
	<ot_shunxi.zhang@mediatek.com>
To: =?utf-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	=?utf-8?B?VmluY2UtV0wgTGl1ICjlionmlofpvo0p?= <Vince-WL.Liu@mediatek.com>,
	=?utf-8?B?SmggSHN1ICjoqLHluIzlrZwp?= <Jh.Hsu@mediatek.com>, Sean Wang
	<Sean.Wang@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "lee@kernel.org" <lee@kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 4/5] rtc: mt6397: Add BBPU alarm status reset and
 shutdown handling
Thread-Topic: [PATCH v2 4/5] rtc: mt6397: Add BBPU alarm status reset and
 shutdown handling
Thread-Index: AQHcWhfeXN3jsfD5PUyb6nAJ/nhsIrT7o4QAgADaLYA=
Date: Fri, 21 Nov 2025 03:43:05 +0000
Message-ID: <b577d8395885af0603710d2d83cab71707696568.camel@mediatek.com>
References: <20251120121805.6775-1-ot_shunxi.zhang@mediatek.com>
	 <20251120121805.6775-5-ot_shunxi.zhang@mediatek.com>
	 <76325c39-ea88-48fe-b32d-00c1e0d31024@collabora.com>
In-Reply-To: <76325c39-ea88-48fe-b32d-00c1e0d31024@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5974:EE_|SEYPR03MB8226:EE_
x-ms-office365-filtering-correlation-id: 4643cd11-e5b0-4053-51cf-08de28b014aa
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?VTZzTUpUWVFNcmVHZHpDMVFNV2hEU0FmZE9BN2lsMGVSczZhSHlMWkt2Lzg3?=
 =?utf-8?B?MUNJREZPV2ZUandRTmQ5cDZtRFkrRmU2MTlUUDFXSk1zU0FFZXpsRm81RE45?=
 =?utf-8?B?RmdyLzhJNDR0ZEhEc2dBd1I5UXdyNGl2Zy9IcXBCTjFLZ2lhaW1Dbi9QY25k?=
 =?utf-8?B?NmF6OE51dDBGM0hsak1TbDhXSmJtRStlVFRvMjV5RXFEMkRqVWpzMSs5WEY5?=
 =?utf-8?B?bHJUUEVIWWk3cHZBU0VKS0xFVnpvWGZWQk1mY2QvTjEraUdsN1dVQ2RHazlD?=
 =?utf-8?B?dysvUmFlalVFVSs5M0cyMUs4djZ2NXNoSnFZdGVmSVR3RVAxVStZaGRVbjRJ?=
 =?utf-8?B?UnNZeHI3TEJaTWhScHRiUlBsdHdTamlwRnRhU1I0bVJ1WDhMYXp0M0RObHhZ?=
 =?utf-8?B?OHhnK0NOcGd0SXJTb2YrQ2loTkJIM1FIeVVyMWJXZHlqcGNXRTF0K3FHTzcz?=
 =?utf-8?B?TGhCOHJUSzJFZHZqYy9uM3MxSjAzZkJFcENXd1pEWnJCVXpHWVFJaGdBOVR0?=
 =?utf-8?B?NWJqM0h6NGltQmdiVUpBYzJpQ2dXYnJuQ29XdXlaNzBOUUlNUmtZOVYrZ2N6?=
 =?utf-8?B?YWNSbXhjVGNhS0NUUElEY3F4N1IyazRQdlh6N1o3MXhhZHZ1bkpQb25qOS9z?=
 =?utf-8?B?WTAvTVFzWjRkQWIwRXhEdDNGa21rcExaZmxVS3BJZWpjRHZRcnNiVVZQSDFr?=
 =?utf-8?B?MUhkeVJrSXFHZlNLMGlZSHZFNC9ZNVoxdE5TdCtSSVF2S3plV3hNQkFRaUZI?=
 =?utf-8?B?QzZnWkRKeW83N2VvWW1OUUF0eTdHWUUvTjFwSVlCUmcrOHFIRTNwd3JDUVFy?=
 =?utf-8?B?cGRvd2xqV0JrNDloNFo0ZkxKcE16cXRjakR0N20vbFZSTUozbUs5T2FZRW92?=
 =?utf-8?B?NFI3dGpsblk3VnRnam9DNzI4RDRMM2IrUml3NVI0SU1VK0lIQzVSWllvcHlx?=
 =?utf-8?B?WEJsZG1tREV2b1o2cWp6OGtiWnMyeXF0TVgzRkU2S0dBRGNPeVduL0NzNFZn?=
 =?utf-8?B?R2JncWpMQ3lzNjB4YTRIM1dQYlBrZDhPcXFhU3BDRTkwQ3dJMEhJSUs4akJt?=
 =?utf-8?B?aVBhZjRhS01qKzlNZnNUWXFmUU1JSFJ2aDk4R25VVk5iSkVmZTBjYmU2RTFy?=
 =?utf-8?B?QklKOWdpUnB6b3UyZzRCeE1xQWJyOUpjOC95S1pXSURqL3YxUG5JU0RxZ2JD?=
 =?utf-8?B?WGdYcFg0SmtBckIrbTZwZkF0aUwwN2JXY0lodHZ4OTNxcUNoaUVGUnNrUXJJ?=
 =?utf-8?B?Q0xZOWdpeFozOTF6dVZib0hyYXJTRDd2dCs5VWJ6QjFZejJKQ0JvWEF6VWJa?=
 =?utf-8?B?OHBZdHU4a3FYWTlMUkRwQUc4L2hsODhrdEhFY1lWZVRhQmdoRFgvNUxVVlE3?=
 =?utf-8?B?SzlmTW9QMGNSNk5JZDhFVnF4VitMUWNjUUEzZWI2eFVLZ0kzSXRtcWFSSm9S?=
 =?utf-8?B?eU9TVjNrbmZpTmY0c1Fia3FCVnl1UklqOTE0N0hlbE03eTUwUHUvWDNvaCty?=
 =?utf-8?B?bG1GbjRsbHU3dFJydE9VVGluLzduVWNlUENjNmlIRnNOVWhQMjBTbU1NMVRy?=
 =?utf-8?B?elFreUhkeEd1VjU0VXhsTUJjN3NpSnp4WkVnNEdoeEkzaHFCM21pY2g2Umx2?=
 =?utf-8?B?R0oyL1dxV3dScmdDdDgrQytUc1NzOU9MMTFDNW1SN244ZmpGSGVPV1NDSzNu?=
 =?utf-8?B?ZHNzM2twMGYwdTBGQVptMnVDeG90dEJSV1hwbCtOMXdocVVqWkF1b1hZOStr?=
 =?utf-8?B?eDJnSlplY05qMDBYdXpvcHRxZmI2YUpUNU1jaWNUMXBkM1NNWm9zdGpwQWlX?=
 =?utf-8?B?S0lxN2NZdVdiaytRMUQvQ0FUelU3UmNQYTdleVBOZ2NKS3YybFQ2a0VrT0FH?=
 =?utf-8?B?Y1RqVVlVQUwzL3ZjU1d1VWV6MWw2MUJiVHFETHhxVC80Qyt5K3hyajlJOEpZ?=
 =?utf-8?B?NURFOUxobWVoMlRjV3VuclVPVExFU0Rlay9nMnFzcVQ4QnF1QS91SFhFN0Ja?=
 =?utf-8?Q?rw6l9z1/C3Tl5PfC8u2ofJ52Z9Uj7c=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5974.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TnVtczdJaE9rNmNJMTZNa3UzajNRc1B6eUpSci9HdStZOHdHUUExaTZMSjZJ?=
 =?utf-8?B?dW1aUXRwSmFnSlBReGVTZi9kTmZBU3ZTZm91dlpTemI1dmdtL0tXekVmdFdF?=
 =?utf-8?B?UTRjQTdtaTFsYmQySEZwbnRySjRsVmpWVzdweWpReUR5eU4xVGxKem9JTmRV?=
 =?utf-8?B?dTErRXNLbVRYODJnL2RxQjZOTWpsZnZJbmhMc0U4Q25IRU53bTZRSjkwUVFp?=
 =?utf-8?B?TGlzUkpuc0tmZUQ5MHphYzR1Q3Z1ZVhEcVhIUG8xWXpYUno1SmQ4VHRiTXcv?=
 =?utf-8?B?QWJkdTRhdFU1RVVpWHNoSlFkNFpKbitOU3pmSWliS2VGbDZyU3VHQy9rR21S?=
 =?utf-8?B?UlBmUDZmMnlSMHgwTlpub1pXa2hqTmNDSXZJalFDeERnMEF5N1JBMHVhdHlN?=
 =?utf-8?B?b2x0ekRVSU9DMGQySGU0ancyYldZTGJESU1HWkx1YjZWUFRlaEJ4bnlscjF5?=
 =?utf-8?B?UHNxdElMSzFScFZpVG5CZG0xSnIzSHAzdEI1Zk9tdzVVYzZ0MHRyR1E3cnhY?=
 =?utf-8?B?dVk1MmVOb00xZ2FFTW9ZMzFIRjF3Rlg1NkxxYW1OSHFQZzZjRzhNTlJZWjBO?=
 =?utf-8?B?RitGTnIxTk1sTTFvTHEwTklsb3cwWS9CdndPMElGdHR2emZybFdOeVo5S3l5?=
 =?utf-8?B?OVlFN204c3IvbVkwQlBCMEdjTGgrUkV1UlpVdVBIbVBIbTRuVUJNdFI1TnlG?=
 =?utf-8?B?QTE0ZE5mcjgwaVlaNTlzM1ZOV0w5VjFHcHlobFBROGdwUmxwd3dmQ2ZCRVM0?=
 =?utf-8?B?RWoxUEl3azQ3WjBDb09tTFVUNlFpVjgvTXh3Ulo1bm91MFhVaEZMdHF0dDQ4?=
 =?utf-8?B?WGRxUmxtdlNVYm8rVkVLbmJYUEtBTHFQK0ZhTkdITUt2MnRFVTNNd3ZaQUho?=
 =?utf-8?B?M2FSNGx1d2dnMWNtQ1VWKzBhbnk3V2VWMHlGZUY5ZXdhYk5OM3QrRmdrL3lG?=
 =?utf-8?B?KzE5VUl6RWlTT2Z1RVU3cDNUUHc0TFF5a3RLY25UckV3QVI3cUZSTlBXY0Rn?=
 =?utf-8?B?V2FuNTZKZ2EwbHdqMWZQYnBPMUJldjBVbnRMQnpCTjFuS3JveVU4NWpyd1Zh?=
 =?utf-8?B?UzFENTJhYXRTMVR3WHI2VERIZFk2REJBTjZWbjRjZytkL2NiL0VScCtVOExV?=
 =?utf-8?B?Q3BvYnZEdG5aNlhjSWI2Q2ROMzJkR0lkRmNSZEhud01hV1pJUjdKaGErSU1t?=
 =?utf-8?B?S1IzL08weGFvV1NqWFNrUmRDeFE3eFNWTTNPOWllWDJkQXBXNS9xcXplSWtK?=
 =?utf-8?B?YjIrTUNSRXU5Q01OYWFEdWloNnh1YWF2ZitHWFh6dzN6YVRxUjVzZEphVm0v?=
 =?utf-8?B?K2pHMyt1azNlYWRLWFZBa0lyZTBWSldoTGRYYnBSN2JPOFdQcVJ3N205WTA4?=
 =?utf-8?B?Sk8vQkh0YU9XaGRPaTFUTVRvNnFlVzN1cnVXc1kvY1MwS3lUa1puT2syaTUv?=
 =?utf-8?B?aVdNbWZ2RU5NZVJ1TU9VNlFEWmRmSHZCazludDFJOFhRSGkyckRYSDVYcEF1?=
 =?utf-8?B?WmxpRm5kOFlLZFlsVDA2ZDVSWHo5UVI3M3VTeWNuam5qVmVTMGFOQ05QOW1p?=
 =?utf-8?B?QkczOWdiRUQweHpqaCt3M2dDU3JKRjBLSlZ0Z3dHdXd1SFk1VzllQ1NyTDhE?=
 =?utf-8?B?SGZVUFpBekhTK0YvU2l5WWp2alJmTnp3amNqbk13SnhjYWVWWWYrSnNZWmxx?=
 =?utf-8?B?TkNwbzV5a0E4U0x4SjhYTGk0S01zdlEyVXVRd2pFZEIzZTN4VDVUNkpaQjdn?=
 =?utf-8?B?L0thN3c0VmtZU3VzVmthbngyaVlVbU9pZ1J2RlNyZzRDTnp3KzA2UVZIZkVC?=
 =?utf-8?B?bEtNenczQm1CK240VnR0Ny9ubERUU1JHRU5CcUFORXhOeUtJUmNJTTl5SjZR?=
 =?utf-8?B?Znk2dTExTXV1TUJFalZUMnJTdmhTL1kyR0JmWU05c2VsUUdhb3JndzJVSURH?=
 =?utf-8?B?cm9DK2JIa1BiK2dldXBBWlRnVHkybmZkRFhucjkvZEExRUM3cTd1YWxZbFJY?=
 =?utf-8?B?b3FqTHJBYWg3TFg0UDJlcU5BRzRabUNkSWxwTXRlUG5HeFE5VVBjZGdVcGVV?=
 =?utf-8?B?NVQzY2R5Z0w2YnRWTWV1OE5vTUpUeFQraTdzUWFNeDNTNGpmYlk1Z0E3SUNz?=
 =?utf-8?B?UjV4VXBMNVRteXdsdVdyOTV1L1hla3FtZ1ViblJpNVU2QW8xUGZGY0NSbDVH?=
 =?utf-8?B?OWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8CCC7588D902E14FA16BD6FF2B162E55@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5974.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4643cd11-e5b0-4053-51cf-08de28b014aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 03:43:05.8854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: guSDvsa+rQ1PzQVGMIVLi2aRXQbLnjhsnmEkdA6vbLVlk4CEI5FF8wmwYrvN1z6WujhVc8+AmLAQYUZCpHxzwZrsBRTstOaSC2bjrtc9yZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8226
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_194314_988114_09100420 
X-CRM114-Status: GOOD (  21.32  )
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

T24gVGh1LCAyMDI1LTExLTIwIGF0IDE1OjQyICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAyMC8xMS8yNSAxMzoxOCwgb3Rfc2h1bnhp
LnpoYW5nQG1lZGlhdGVrLmNvbSBoYSBzY3JpdHRvOg0KPiA+IEZyb206IFNodW54aSBaaGFuZyA8
b3Rfc2h1bnhpLnpoYW5nQG1lZGlhdGVrLmNvbT4NCj4gPiANCj4gPiBGdW5jdGlvbiAibXRrX3J0
Y19yZXNldF9iYnB1X2FsYXJtX3N0YXR1cyIgaXMgYWRkZWQgdG8gYWRkcmVzcyB0aGUNCj4gPiBp
c3N1ZSB0aGF0IHRoZSBSVEMgQkJQVSBhbGFybSBzdGF0ZSByZW1haW5zIGFmdGVyIHRoZSBSVEMg
YWxhcm0NCj4gPiBoYXMgb2NjdXJyZWQuDQo+ID4gDQo+ID4gQWRkaXRpb25hbGx5LCBmdW5jdGlv
biAibXRrX3J0Y19zaHV0ZG93biIgaXMgYWRkZWQgdG8gYWRkcmVzcyB0aGUNCj4gPiBpc3N1ZSBv
ZiB0aGUgcGxhdGZvcm0gYmVpbmcgcG93ZXJlZCBvbiBhZ2FpbiBhZnRlciBzaHV0ZG93biBiZWNh
dXNlDQo+ID4gdGhlIFJUQ19CQlBVIGFsYXJtIHN0YXRlIHdhcyBub3QgY2xlYXJlZC4NCj4gPiAN
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTaHVueGkgWmhhbmcgPG90X3NodW54aS56aGFuZ0BtZWRpYXRl
ay5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL3J0Yy9ydGMtbXQ2Mzk3LmMgfCAzMCArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNl
cnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcnRjL3J0Yy1tdDYzOTcu
YyBiL2RyaXZlcnMvcnRjL3J0Yy1tdDYzOTcuYw0KPiA+IGluZGV4IGI4ZjQ0YTAwZGU1ZC4uOGJm
N2UwODIyZWYwIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvcnRjL3J0Yy1tdDYzOTcuYw0KPiA+
ICsrKyBiL2RyaXZlcnMvcnRjL3J0Yy1tdDYzOTcuYw0KPiA+IEBAIC0zNyw2ICszNywyMSBAQCBz
dGF0aWMgaW50IG10a19ydGNfd3JpdGVfdHJpZ2dlcihzdHJ1Y3QNCj4gPiBtdDYzOTdfcnRjICpy
dGMpDQo+ID4gICAgICAgcmV0dXJuIHJldDsNCj4gPiAgIH0NCj4gPiANCj4gPiArc3RhdGljIHZv
aWQgbXRrX3J0Y19yZXNldF9iYnB1X2FsYXJtX3N0YXR1cyhzdHJ1Y3QgbXQ2Mzk3X3J0Yw0KPiA+
ICpydGMpDQo+ID4gK3sNCj4gPiArICAgICB1MzIgYmJwdSA9IFJUQ19CQlBVX0tFWSB8IFJUQ19C
QlBVX1BXUkVOIHwgUlRDX0JCUFVfUkVTRVRfQUw7DQo+ID4gKyAgICAgaW50IHJldDsNCj4gPiAr
DQo+ID4gKyAgICAgcmV0ID0gcmVnbWFwX3dyaXRlKHJ0Yy0+cmVnbWFwLCBydGMtPmFkZHJfYmFz
ZSArIFJUQ19CQlBVLA0KPiA+IGJicHUpOw0KPiA+ICsgICAgIGlmIChyZXQgPCAwKSB7DQo+ID4g
KyAgICAgICAgICAgICBkZXZfZXJyKHJ0Yy0+cnRjX2Rldi0+ZGV2LnBhcmVudCwgIiVzOiB3cml0
ZSBydGMgYmJwdQ0KPiA+IGVycm9yXG4iLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBfX2Z1
bmNfXyk7DQo+ID4gKyAgICAgICAgICAgICByZXR1cm47DQo+ID4gKyAgICAgfQ0KPiA+ICsNCj4g
PiArICAgICBtdGtfcnRjX3dyaXRlX3RyaWdnZXIocnRjKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAg
IHN0YXRpYyBpcnFyZXR1cm5fdCBtdGtfcnRjX2lycV9oYW5kbGVyX3RocmVhZChpbnQgaXJxLCB2
b2lkDQo+ID4gKmRhdGEpDQo+ID4gICB7DQo+ID4gICAgICAgc3RydWN0IG10NjM5N19ydGMgKnJ0
YyA9IGRhdGE7DQo+ID4gQEAgLTUxLDYgKzY2LDkgQEAgc3RhdGljIGlycXJldHVybl90IG10a19y
dGNfaXJxX2hhbmRsZXJfdGhyZWFkKGludA0KPiA+IGlycSwgdm9pZCAqZGF0YSkNCj4gPiAgICAg
ICAgICAgICAgIGlmIChyZWdtYXBfd3JpdGUocnRjLT5yZWdtYXAsIHJ0Yy0+YWRkcl9iYXNlICsN
Cj4gPiBSVENfSVJRX0VOLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpcnFl
bikgPT0gMCkNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgbXRrX3J0Y193cml0ZV90cmlnZ2Vy
KHJ0Yyk7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgaWYgKHJ0Yy0+YWxhcm1fc3RhX3N1cHBv
cnRlZCkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgbXRrX3J0Y19yZXNldF9iYnB1X2FsYXJt
X3N0YXR1cyhydGMpOw0KPiA+ICAgICAgICAgICAgICAgbXV0ZXhfdW5sb2NrKCZydGMtPmxvY2sp
Ow0KPiA+IA0KPiA+ICAgICAgICAgICAgICAgcmV0dXJuIElSUV9IQU5ETEVEOw0KPiA+IEBAIC0y
NDksNiArMjY3LDcgQEAgc3RhdGljIGludCBtdGtfcnRjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UNCj4gPiAqcGRldikNCj4gPiAgICAgICBzdHJ1Y3QgcmVzb3VyY2UgKnJlczsNCj4gPiAg
ICAgICBzdHJ1Y3QgbXQ2Mzk3X2NoaXAgKm10NjM5N19jaGlwID0gZGV2X2dldF9kcnZkYXRhKHBk
ZXYtDQo+ID4gPmRldi5wYXJlbnQpOw0KPiA+ICAgICAgIHN0cnVjdCBtdDYzOTdfcnRjICpydGM7
DQo+ID4gKyAgICAgc3RydWN0IGRldmljZV9ub2RlICpucCA9IHBkZXYtPmRldi5vZl9ub2RlOw0K
PiA+ICAgICAgIGludCByZXQ7DQo+ID4gDQo+ID4gICAgICAgcnRjID0gZGV2bV9remFsbG9jKCZw
ZGV2LT5kZXYsIHNpemVvZihzdHJ1Y3QgbXQ2Mzk3X3J0YyksDQo+ID4gR0ZQX0tFUk5FTCk7DQo+
ID4gQEAgLTI3NSw2ICsyOTQsOCBAQCBzdGF0aWMgaW50IG10a19ydGNfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZQ0KPiA+ICpwZGV2KQ0KPiA+ICAgICAgIGlmIChJU19FUlIocnRjLT5ydGNf
ZGV2KSkNCj4gPiAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHJ0Yy0+cnRjX2Rldik7DQo+
ID4gDQo+ID4gKyAgICAgcnRjLT5hbGFybV9zdGFfc3VwcG9ydGVkID0gb2ZfcHJvcGVydHlfcmVh
ZF9ib29sKG5wLA0KPiA+ICJtZWRpYXRlayxhbGFybS1zdGEtc3VwcG9ydGVkIik7DQo+IA0KPiBZ
b3UgZG9uJ3QgbmVlZCBhIERUIHByb3BlcnR5IC0gdGhlIFBNSUMgZGljdGF0ZXMgc3VwcG9ydCBm
b3IgdGhhdCwNCj4gbm90IHRoZSBib2FyZC4NCj4gDQo+IFRoaXMgbWVhbnMgdGhhdCB5b3UgYWxz
byBkb24ndCBuZWVkIHRoZSBhbGFybV9zdGFfc3VwcG9ydGVkIHZhcmlhYmxlLA0KPiBhbmQgeW91
DQo+IGRvbid0IG5lZWQgdG8gY2hlY2sgZm9yIGl0Lg0KPiANCj4gSnVzdCBleGVjdXRlIHRoZSBt
dGtfcnRjX3Jlc2V0X2JicHVfYWxhcm1fc3RhdHVzKCkgZnVuY3Rpb24gd2hlbiB5b3UNCj4gaGF2
ZSB0bywNCj4gd2l0aG91dCBhbnkgY2hlY2suDQo+IA0KPiBDaGVlcnMsDQo+IEFuZ2Vsbw0KDQpE
ZWFyIHNpciwNClRoYW5rcyBmb3IgeW91ciBjb21tZW50LiBUaGlzIGNoZWNrIGlzIGJhc2Ugb24g
dGhlIGxhc3QgY29tbWVudCgNCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9s
aW51eC1tZWRpYXRlay9wYXRjaC8yMDI1MDgxMTA4MTU0My40Mzc3LTItb3Rfc2h1bnhpLnpoYW5n
QG1lZGlhdGVrLmNvbS8jMjY1MTc1MzgNCikgcmVwbHk6DQoiVGhlIE1UNjM5NyBpcyBhbiBpbnRl
Z3JhdGlvbiBvZiBzZXZlcmFsIElDcyBhbmQgZG9lcyBub3QgaGF2ZSBhDQpzZXBhcmF0ZSBJQyBz
cGVjaWZpY2F0aW9uLiBJIHdpbGwgY2hlY2sgdGhlIHJlbGV2YW50IElDIGRhdGFzaGVldHMNCmFn
YWluLiBJIHdpbGwgcmVtb3ZlIHRoZSB1c2VsZXNzIGRlZmluZSBpbiBuZXh0IHZlcnNpb24iLg0K
DQpPbmx5IHRoZSBNVDYzNTkgaGFzIHRoZSAiQkJQVSBhbGFybSBzdGF0dXMiIGZ1bmN0aW9uLCBz
byB0aGlzIGF0dHJpYnV0ZQ0KbmVlZHMgdG8gYmUgYWRkZWQgdG8gdGhlIFJUQyBmdW5jdGlvbiBp
biBNVDYzNTkuZHRzaSBmb3IganVkZ21lbnQuIFRoaXMNCmVuc3VyZXMgY29tcGF0aWJpbGl0eSB3
aXRoIG90aGVyIFBNSUNzIChNVDYzNTgsIGV0Yy4pIGluIHJ0Yy1tdDYzOTcuYy4NCg0KRXhjdXNl
IG1lLCBkbyB5b3UgaGF2ZSBhbnkgZnVydGhlciBzdWdnZXN0aW9ucyBvbiBiZXR0ZXIgY29tcGF0
aWJpbGl0eT8NCkkgd2lsbCBpbXByb3ZlIGFuZCBtb2RpZnkgaXQgaW4gdGhlIG5leHQgdmVyc2lv
bi4NCg0KQmVzdCBSZWdhcmRzDQpTaHVueGkgWmhhbmcNCg0KPiANCj4gPiArDQo+ID4gICAgICAg
cmV0ID0gZGV2bV9yZXF1ZXN0X3RocmVhZGVkX2lycSgmcGRldi0+ZGV2LCBydGMtPmlycSwgTlVM
TCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG10a19ydGNfaXJx
X2hhbmRsZXJfdGhyZWFkLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgSVJRRl9PTkVTSE9UIHwNCj4gPiBJUlFGX1RSSUdHRVJfSElHSCwNCj4gPiBAQCAtMjk3LDYg
KzMxOCwxNCBAQCBzdGF0aWMgaW50IG10a19ydGNfcHJvYmUoc3RydWN0DQo+ID4gcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQ0KPiA+ICAgICAgIHJldHVybiBkZXZtX3J0Y19yZWdpc3Rlcl9kZXZpY2Uo
cnRjLT5ydGNfZGV2KTsNCj4gPiAgIH0NCj4gPiANCj4gPiArc3RhdGljIHZvaWQgbXRrX3J0Y19z
aHV0ZG93bihzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICt7DQo+ID4gKyAgICAg
c3RydWN0IG10NjM5N19ydGMgKnJ0YyA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOw0KPiA+
ICsNCj4gPiArICAgICBpZiAocnRjLT5hbGFybV9zdGFfc3VwcG9ydGVkKQ0KPiA+ICsgICAgICAg
ICAgICAgbXRrX3J0Y19yZXNldF9iYnB1X2FsYXJtX3N0YXR1cyhydGMpOw0KPiA+ICt9DQo+ID4g
Kw0KPiA+ICAgI2lmZGVmIENPTkZJR19QTV9TTEVFUA0KPiA+ICAgc3RhdGljIGludCBtdDYzOTdf
cnRjX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiA+ICAgew0KPiA+IEBAIC0zNDYsNiAr
Mzc1LDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbXRrX3J0Y19kcml2ZXIgPQ0K
PiA+IHsNCj4gPiAgICAgICAgICAgICAgIC5wbSA9ICZtdDYzOTdfcG1fb3BzLA0KPiA+ICAgICAg
IH0sDQo+ID4gICAgICAgLnByb2JlID0gbXRrX3J0Y19wcm9iZSwNCj4gPiArICAgICAuc2h1dGRv
d24gPSBtdGtfcnRjX3NodXRkb3duLA0KPiA+ICAgfTsNCj4gPiANCj4gPiAgIG1vZHVsZV9wbGF0
Zm9ybV9kcml2ZXIobXRrX3J0Y19kcml2ZXIpOw0KPiANCj4gDQo=

