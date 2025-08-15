Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C38DCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 12:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d73qjOd5W/rOPROGBgxPR827jZ9XedACBzM1ItxdaR0=; b=Ow71NASv10muZ/QOMx6Y67gBrD
	7QeDCJm/GISdgHOJpTHCibG2H2AADIzL/OUwHyCvnGqriIiSAV+POmlEhTLMdhPgMSAKqAUM848Dz
	P+UYwgYUyodbSg7pA2Idb5mwO7eJQm9/dibeYgrzS+nuwS74urxBRh6ZwGa4A1q/Q1VHYDDaNqaX+
	KlT6uw8mmkwppV8HKPU76qkyLciumRCo79BkCDbzMybBkEOoF3XJbTJtRSpWo2EgdLNcHmasSKwI+
	e9o9NOs4slaZprpEdEFAb2cIQI1y9KeuMAUccYiJCV0V5QREP300S+DTNrFgC2SkhSihUWc+HLxCe
	luy5VsOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umty9-00000002VKw-4532;
	Fri, 15 Aug 2025 12:55:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqoa-000000024ZW-14Ko;
	Fri, 15 Aug 2025 09:33:37 +0000
X-UUID: e782241e79ba11f09f706fa2197c6ceb-20250815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=d73qjOd5W/rOPROGBgxPR827jZ9XedACBzM1ItxdaR0=;
	b=Fg7ruUQIbRcBKCWZc64fYPUn1QNKt5dIJ2falv/GuV3DAtNdFhs1D+bQBfLRmBrGNwgCXW0tHs2ps/MoMUCz6T9tchWq0CAajpkqyHxg46apeVDIKXc6/We3JgYxKBaJtsEWiFi/qZ9FW9TLT2PyabX1Ng7OivtGISc5NTi6PJQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:1c1e0051-e114-4b12-86d9-66488363d52d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:14ed416d-c2f4-47a6-876f-59a53e9ecc6e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e782241e79ba11f09f706fa2197c6ceb-20250815
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 501143617; Fri, 15 Aug 2025 02:33:30 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 15 Aug 2025 17:33:26 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 15 Aug 2025 17:33:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ThQqlXAcHktEk7uN642wJtB+9AzOoWACKmc4u9znw91nCpi1LxAA/65HHY3EHhc1vT34g7/Aq8TVi2zCEjKwAa6n+pf4jy/0dcMHb2Nx/MMZTON/JfuipUatOyC78AfQVv5Yqk9daSeJh6kfBYjcUt/3HQtsYncaaqOizDX20enHmXJcEG+Yx7GIyAQD92oTWDZv45i0KImy9+2dORnfWHDKf/4PCEkV/IyNESwfVVctvYTFwOn1RYkBD+aja28TUAzh0JzzuFhsf2eGZv54gDJAqNEq2FKWss4npmgpD1oLrpTrHaTEt7SeonGpaipofLgNqF9+9F1vbg4/gh8FVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d73qjOd5W/rOPROGBgxPR827jZ9XedACBzM1ItxdaR0=;
 b=W8go5h9NfGvCO3TUc3AXFNobU/ybFOdrekATv/MQ1g9n15dbpLVIfyqpGQmnbJ3jLLCL2E4wA04eTwu/746nd5OlSaE12yLkuKC6YPO1XRRun6qSoto+fdUU/0FFVl2bfBlwi/Q+CACOysVuv55rJ2qxIOackWRMi10gGV7NkcJU2dHsFdEy8jmCym6L6NlzKog0tnUJsCBcOdTCOuR0nCJ+ILLNcYlr0kEXx0viUdcc7aVR6hssi2LNhth8L0m/zjEWSFv6EHDp657+gsetX8JJWGbqxb2iqLZl+/7WAa3W0xzQDAH4mPo2P6i6ils26CH5aMg+zBVZ2h5OHqcOjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d73qjOd5W/rOPROGBgxPR827jZ9XedACBzM1ItxdaR0=;
 b=mcNkwwx44KrJoF3LK4G7gui7fKtmQr07KmgRh/9T21Va3aBcGbaUsWOFU7Ey0LcF5iEC4+L/GWcQ9HFQ8LcrewkWdADnk4Go9cA5R6h7EGmSeTFXDEA/LmRv68OrfIHhkd6a5oIW5NwxVLmOBd7GkK9Y6uJCje+Ph/fEhvJ8Kgk=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7997.apcprd03.prod.outlook.com (2603:1096:101:17c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 09:33:22 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 09:33:22 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "airlied@gmail.com"
	<airlied@gmail.com>, Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kernel@collabora.com"
	<kernel@collabora.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 10/10] drm/mediatek: mtk_hdmi_v2: Add debugfs ops and
 implement ABIST
Thread-Topic: [PATCH v10 10/10] drm/mediatek: mtk_hdmi_v2: Add debugfs ops and
 implement ABIST
Thread-Index: AQHcCE1Nt28jdB0bSUy2f+NnQhw9Z7Rjfq0A
Date: Fri, 15 Aug 2025 09:33:22 +0000
Message-ID: <6d3ba8d4286081e853ab3956234f5147189df540.camel@mediatek.com>
References: <20250808-mediatek-drm-hdmi-v2-v10-0-21ea82eec1f6@collabora.com>
	 <20250808-mediatek-drm-hdmi-v2-v10-10-21ea82eec1f6@collabora.com>
In-Reply-To: <20250808-mediatek-drm-hdmi-v2-v10-10-21ea82eec1f6@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7997:EE_
x-ms-office365-filtering-correlation-id: 6d71673d-e12e-4377-65a4-08dddbdec73f
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|42112799006|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NjBpY2hLM0VpU0k5a05sZ3V4cWNaY2NHakFWeHJDVy9QelNOM2hpUTdDcHJT?=
 =?utf-8?B?dHhYektVazIxOGxOY2NiSldFcnZHUk9BVmhSSm5zc3hhN0lWNTIwMTFtMDcx?=
 =?utf-8?B?UXdwc29NSFJuQXY2WDU4c2NUS3hsc2ZUUW9OY2FBMFNxalh2ckVVdlp1UFJS?=
 =?utf-8?B?UGw3MENGU1JUUHNCa2lRT3puNGZsS1o5WDlCR3lBS1RsNU8vWDZ4VDVPNWll?=
 =?utf-8?B?ZWhrUTRLb2JqdWxpSjA4NTBHalpybklPUDM4Nklya3NxT01iRDVQelJweFVI?=
 =?utf-8?B?ZXc2eDlWa2wveVBsNmFhbGpDelJBL2N1cWRXLy9nb0tiYTZ1amVqV3pvenMr?=
 =?utf-8?B?NFBkbnlnQUM2VDFoNVRCa1lVNnlxZktFZkRqUnJBS0k0eDA1WW9TcXR4cUw5?=
 =?utf-8?B?UUhnVURUZFR5WFhJa08rd1dYLzNPR3hVV3U2NmRDQ0ZMQ1RZN29Zc0R5UzZp?=
 =?utf-8?B?VFBQZHdrNVlENWRGZkRxL3lLZmdnU3BTRi9wVlF4QzlrTWtCNHJJUDYxSE11?=
 =?utf-8?B?L3JSOWtFS0xuUFphSWNXWFlYRWpwb1RGMW40SklDQVhlYnQ3T2ZaQjk4cUw1?=
 =?utf-8?B?YkVycUtxRm9IRTZYMU4rZGp1WW4yaU9tcmJOZHJaZHN0TzlmcmpNOTBzNUdo?=
 =?utf-8?B?dWlIS0Z0QmJLYVRNNHNtNWNNMUhCVy83U0NSRjh3bnJUNHlwb1k4NVpoNTBs?=
 =?utf-8?B?VjRJaGZTUXROdEhLa2J5bWVKVk9uZlBNWGVvVzM2MXpreXVhVVYvZWNrUEE4?=
 =?utf-8?B?cldwZFZ1ZlJoSHVUSVBEYXk4ckFBeVFzbUp0SVRPaHp1SXhkT1pPSnBySzRt?=
 =?utf-8?B?VklJb3JHeEhZbmtzL09XTUM4cDlmbUJZTHlKbkE2cnpEQmVENDMrL1RRNG9W?=
 =?utf-8?B?YktSdUNQcDYwZndFeUdRd1g2N0Y5a0k5cnJGemx2dk91ZVdnR2dvUFY4Rkt2?=
 =?utf-8?B?MW1yTzBudWsrSS9CZFNwWGthSFhrRDNkNmJGNVYyeU9yRk9HQ3QrRDV6WUYy?=
 =?utf-8?B?SW14WUtRTFFNclFlTG5qNW53TnM1bmlwbXZGZVlCOHpRQitDd1dqTW9wdkhS?=
 =?utf-8?B?dXlGbTFPY1NOSkxKNm1HZXpqNkg3YmpqNlZFWm95ajdBVFN3UkVyNC9Fdm1s?=
 =?utf-8?B?QzJiSGRzQzJNSWlsOGVGWFFzNTZmQmVzb3dNMkJrWi9icDVsd2dNQjVSLzdz?=
 =?utf-8?B?OFVZM3V2WEo4V1N3c09pUE5ZZGJJRlJja2U2RGIrcldXZXNWV1BUbzJSY01G?=
 =?utf-8?B?MVNyS1VRVGVYb1VCWnNlSDViRUdZd0huMndNNHcrdHJOU2dGWXV4bUFIaU0r?=
 =?utf-8?B?b0RKSVF3MDBySFQrWkxQQldZaTBSWHp2STFVaFhqYllyUVBRWGtJZldpTHAx?=
 =?utf-8?B?YzJ3Slc3RnE5M3I4SFFpZENmSFhoQ3JtanpVS3Y3K3FlKzJ0ZWxQZHdmemtY?=
 =?utf-8?B?MU5FcEwvdTloVGRSbVc2Zlo5VGpzMUJGWFN0emhLZWFKcFNrRGd2TDNqRDZw?=
 =?utf-8?B?WUFRaHlDMXN5UHcyNUxSQXJmbEIvTzFZaTFwWEErQk03ZDd4N0tLM2FWcWpt?=
 =?utf-8?B?MjlwT3RHTHltK0lOeEl4NmJ3bjh0L1hoSjJveTdRK3oxSG9aVTdZL1I2SHNo?=
 =?utf-8?B?R2tWaEtHQmdUSHYvaVE0aTdoWHdSVUp0b3llNU15WFBIcXRac25sdzU1blZQ?=
 =?utf-8?B?K3pTaTNwcDRmRjBBRTRRbHNHOGoyK3FIa3dQSFBIeTU1WXdqekVoWFZCOHZp?=
 =?utf-8?B?VjVLaGtOU3krV01GK3Q5Y2NxVFhpS3NaZnZyV3JONFhEYWU3ZlppMC9tTFB3?=
 =?utf-8?B?WlNuUk5PNTFKSWdnbU1LUlM0VG5aRUE5bnJsd2tHRG9QVzRLeFV3Q2JqdENx?=
 =?utf-8?B?eEMvUmN0T1A5cXhoN0NOUEMwTzE4ZCtKWUdNSUNkUklTZWE0dURJR0prU2xI?=
 =?utf-8?B?cDZtUnRiNzJ6N1dXSWYzYnROL2tsMEU5dVU4NStzcUdUSmx1VGZuSUt4SS82?=
 =?utf-8?Q?SkmIu7hOwSTE7EiQ742+MAgToGTbOM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0FMV3EybmlRS2plcHA5T2xPcnZSdy9LWDU4OHhJZ1VGRDdtK0RJblF2d3JG?=
 =?utf-8?B?T2tkamtucWpmOEx4RW5ML0M4MXJ2ckQ2S2pZMEJZd1hPcU1Db2xtb1R6M2JR?=
 =?utf-8?B?Y0RsR0NNUkhNUnpEd0JBT21JYzJNY2dkMUJsRFpSUmRFNDdrUDFKcXNqbXBi?=
 =?utf-8?B?aUgvY0ZRbWhGZzBnTzZVMXVnQlE1YVFKUjM2L2c5NWxqRHFPUkd5SThJYUVx?=
 =?utf-8?B?ZDRxcTNDUzMxbVRDZkdzbVdhV0ZpL2IxMUw2eGpndVJ0aUZNTk9zTlVuWHlO?=
 =?utf-8?B?djVHcFl3emJpREd3eVA5aE5TcmZpOVkzMGw1azVXbTRsWVExK2g2V0VFamZn?=
 =?utf-8?B?R2RzbWlESy9YT0w5bnc1ODlxYm1pcHZEbmp0VGlscmpOaHFaTklsV0ZsWTF4?=
 =?utf-8?B?STQycHJTRVcwYTh3NlBjM0lNanlFQXdnZm12NU5HcWJxUXkzOUhaRElPT1NL?=
 =?utf-8?B?ekwyMC9yN2V3TnZJd2ZJR29GSnBwdEs5SU1SSmJqTllYTjR5Vi9oTWRqNitj?=
 =?utf-8?B?YUExSmg3RXBHdzFtVFRpY2VseW9kSkFwbkRHd3VRK0V3R0Q1SGU0Z0w4UTk1?=
 =?utf-8?B?T2RBdThxZG5wU3l2OGJDc2wza0M2OUZvZ0laZ0dCK1lZNll6eVIzb200RGpZ?=
 =?utf-8?B?UWZOcUR0M0hkZm9PeVZ0TVJLWXVOZjYvSjJ1ZkxQZjBkNnkyZkVFUHBqeTIx?=
 =?utf-8?B?M0RJV3Q4WjJHbEtOOGJySTY5WW9nK2FQRVNLRUtkblJtdENzeTYvd0ZjT0Vk?=
 =?utf-8?B?YkFtZmhRRkRsTUs0UUpJTDdqY3dnQjRqWEtaVmxmNGdUSFJBeGJyL3hkdFFx?=
 =?utf-8?B?N3Q1RzVYMHE2bFVEbDdJTnhER3cvSkhubTBBNG1TMCtmWXk3cW5jUStLOTZP?=
 =?utf-8?B?eDV5WjlVWStJWDd1RDdwakw3QzJjS2hxUmdPQnQ3bUwyUjVQMEpLQlJhS1B2?=
 =?utf-8?B?d1dRWWl2VVNPSU5ucklhYlIxU0NsSG5BWnZmUTB6ZDc4bk9MeHo2NVAzbUc0?=
 =?utf-8?B?bFp5YXppQnRxOXBNMzNvM1FmVXN6eEpWaFRGWXFza1RWeFZsOEI0YnU4SWVD?=
 =?utf-8?B?K0JIVTVJK2RJRDBnUklXMSt3K2NpZTNpNEM4Y3MrSDB2eWc3c2k0bWtOYUEv?=
 =?utf-8?B?ZWo5QmhoSloyQ0FUeUJtUXJxQUdBdTlGeTNNU2l2Z1hqNThOQlRIRHJSR0tZ?=
 =?utf-8?B?am1aOElsL1RqeEx2blZ3WW8yTVNHWlRwcVJkb3BKZ0QzVG1IdTNjMzNjb1VU?=
 =?utf-8?B?ZGlpRTNNWDlIZ2JMYWZ4aXRCMFA2M1RZY21MSGdVU1dqNnpJVkFmeWtkcm5a?=
 =?utf-8?B?ZmdiWDJEb3BWY0haTGlYTnZEenAzY2I5MDV1RlA3a2dJVkg2aExSRE9BVEls?=
 =?utf-8?B?YThZUmowSnc1ZzNnV1MwQjN1RTE4RzlnUEtubE9BU0MvMEdNamRSdVpLZnZQ?=
 =?utf-8?B?QlpwUzVwRTlTUWVSajJIUmdvNWdOY0ZjaDQ5Yko3Sk1DVUluenJrYW0ycVpI?=
 =?utf-8?B?d20wUzBlWDRHcjl0VnMvcWc1bVdDaGJjNVl6enNQQ2lJR2pKRTYvN0sxMnEy?=
 =?utf-8?B?N0s3Z2dZeFBwWU02cUFpRjlQc2RyamE5OUtadi8zNVI5a0xVZGt3SkFTWDdS?=
 =?utf-8?B?VEZ4cC8xZk01RGt2VEhZeFZjZGJudklrZmhyZ2l0OGxDYVlqU3BsLzJuczNP?=
 =?utf-8?B?VGt1bTFOdEFvTHlLaUhCVHRQMURGd3c5aVFwaFg4ZllENThyZnVvM3A3bVZR?=
 =?utf-8?B?amVMTmsvQWtsbzNMUHBmR3pYYWRuSVE1VnV3ZHU1SUhveCtOaFcrbG1nN1cw?=
 =?utf-8?B?OVBFUGpMOFZ3dnE2K3IvMEJIZnFXTmltQnBCbjhSRTBRT1NHY2VsYlVVTEZi?=
 =?utf-8?B?dnh1QUI4WjhDMEtZZGJXSzdSWUxzNWNUS21YMXU0SHFuNURhZHArVlJVYlpY?=
 =?utf-8?B?b3dLdGdNMy9yZmFmeVFhOTl6eG43ME5uWWVHRnh0bFlGaVNmek5EaTlIQldi?=
 =?utf-8?B?bTBpYW5jdlQrdFQ4aTc4amJNeW1KOU5sNzBSbnlic21sb1Yvb24yM2ZCamRy?=
 =?utf-8?B?cXNFTWNmbm1kdEZoY1FJOENrOWsraVErRy9sVS8rVU5temFHZmUwSUNNbDlm?=
 =?utf-8?Q?cDMudQtgqr5bbMa1wTjK/pH+4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C3EA8473C08854F8B2C9C395A1C3D28@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d71673d-e12e-4377-65a4-08dddbdec73f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 09:33:22.8101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 73GBpdN8tpeHW5ZsDFrbSzVjIsOp+Zj+iKkGn68pBnvL1fM7rWSjkhSjAv+MqDob5Fh7CxyzYkVCcMUyD3/2Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7997
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_023336_301999_528DDCF5 
X-CRM114-Status: GOOD (  21.70  )
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

T24gRnJpLCAyMDI1LTA4LTA4IGF0IDEyOjEyICswMjAwLCBMb3Vpcy1BbGV4aXMgRXlyYXVkIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBj
b250ZW50Lg0KPiANCj4gDQo+IEZyb206IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdl
bG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IA0KPiBJbXBsZW1lbnQgdGhl
IEF1dG9tYXRlZCBCdWlsdC1JbiBTZWxmLVRlc3QgQUJJU1QgZnVuY3Rpb25hbGl0eQ0KPiBwcm92
aWRlZCBieSB0aGUgSERNSXYyIElQIGFuZCBleHBvc2UgaXQgdGhyb3VnaCB0aGUgImhkbWlfYWJp
c3QiDQo+IGRlYnVnZnMgZmlsZS4NCj4gDQo+IFdyaXRlICIxIiB0byB0aGlzIGZpbGUgdG8gYWN0
aXZhdGUgQUJJU1QsIG9yICIwIiB0byBkZWFjdGl2YXRlLg0KPiANCj4gVGhlIEFCSVNUIGZ1bmN0
aW9uYWxpdHkgY2FuIGJlIHVzZWQgdG8gdmFsaWRhdGUgdGhhdCB0aGUgSERNSQ0KPiBUcmFuc21p
dHRlciBpdHNlbGYgd29ya3MgYW5kIHRoYXQgY2FuIG91dHB1dCBhIHZhbGlkIGltYWdlIHRvDQo+
IHRoZSBIRE1JIERpc3BsYXkgdGhhdCBpcyBjb25uZWN0ZWQuDQo+IA0KPiBUaGlzIGlzIGVzcGVj
aWFsbHkgdXNlZnVsIHdoZW4gdHJ5aW5nIHRvIHJ1bGUgb3V0IGFueSBwb3NzaWJsZQ0KPiBpc3N1
ZSB0aGF0IGlzIHJlbGF0ZWQgdG8gdGhlIGRpc3BsYXkgcGlwZWxpbmUsIGFzIHRoZSBIRE1JIFR4
DQo+IGlzIGFsd2F5cyB0aGUgbGFzdCBjb21wb25lbnQ7IHRoaXMgbWVhbnMgdGhhdCBIRE1JIEFC
SVNUIGNhbiBiZQ0KPiB1c2VkIGV2ZW4gd2l0aG91dCBwcmlvciBkaXNwbGF5IGNvbnRyb2xsZXIg
cGlwZWxpbmUgY29uZmlndXJhdGlvbi4NCj4gDQo+IFRoZSBleHBlY3RlZCBvdXRwdXQgaXMgYSAx
MDAlIGNvbG9yIGJhciAocmFpbmJvdykgdGVzdCBwYXR0ZXJuLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9A
Y29sbGFib3JhLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogTG91aXMtQWxleGlzIEV5cmF1ZCA8bG91
aXNhbGV4aXMuZXlyYXVkQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19oZG1pX3YyLmMgfCAxMjMgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTIzIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfdjIuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV92Mi5jDQo+IGluZGV4IDJlOGQ4YWVkM2M0NzQxNzIw
MGRkOTUxNzU1Y2MyZTNlZjQxZGY3NWQuLmMyNzJlMWU3NGI3ZGUwM2E3MjY0MDJmNzcyOTZiMDVj
ODdiMjRlMDUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRt
aV92Mi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV92Mi5jDQo+
IEBAIC0xMTkwLDYgKzExOTAsMTI4IEBAIHN0YXRpYyBpbnQgbXRrX2hkbWlfdjJfaGRtaV93cml0
ZV9pbmZvZnJhbWUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwNCj4gICAgICAgICByZXR1cm4g
MDsNCj4gIH0NCj4gDQo+ICtzdGF0aWMgaW50IG10a19oZG1pX3YyX3NldF9hYmlzdChzdHJ1Y3Qg
bXRrX2hkbWkgKmhkbWksIGJvb2wgZW5hYmxlKQ0KPiArew0KPiArICAgICAgIHN0cnVjdCBkcm1f
ZGlzcGxheV9tb2RlICptb2RlID0gJmhkbWktPm1vZGU7DQo+ICsgICAgICAgaW50IGFiaXN0X2Zv
cm1hdCA9IC1FSU5WQUw7DQo+ICsgICAgICAgYm9vbCBpbnRlcmxhY2VkOw0KPiArDQo+ICsgICAg
ICAgaWYgKCFlbmFibGUpIHsNCj4gKyAgICAgICAgICAgICAgIHJlZ21hcF9jbGVhcl9iaXRzKGhk
bWktPnJlZ3MsIFRPUF9DRkcwMCwgSERNSV9BQklTVF9FTkFCTEUpOw0KPiArICAgICAgICAgICAg
ICAgcmV0dXJuIDA7DQo+ICsgICAgICAgfQ0KPiArDQo+ICsgICAgICAgaWYgKCFtb2RlLT5oZGlz
cGxheSB8fCAhbW9kZS0+dmRpc3BsYXkpDQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZB
TDsNCj4gKw0KPiArICAgICAgIGludGVybGFjZWQgPSBtb2RlLT5mbGFncyAmIERSTV9NT0RFX0ZM
QUdfSU5URVJMQUNFOw0KPiArDQo+ICsgICAgICAgc3dpdGNoIChtb2RlLT5oZGlzcGxheSkgew0K
PiArICAgICAgIGNhc2UgNzIwOg0KPiArICAgICAgICAgICAgICAgaWYgKG1vZGUtPnZkaXNwbGF5
ID09IDQ4MCkNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgYWJpc3RfZm9ybWF0ID0gMjsNCj4g
KyAgICAgICAgICAgICAgIGVsc2UgaWYgKG1vZGUtPnZkaXNwbGF5ID09IDU3NikNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgYWJpc3RfZm9ybWF0ID0gMTE7DQo+ICsgICAgICAgICAgICAgICBi
cmVhazsNCj4gKyAgICAgICBjYXNlIDEyODA6DQo+ICsgICAgICAgICAgICAgICBpZiAobW9kZS0+
dmRpc3BsYXkgPT0gNzIwKQ0KPiArICAgICAgICAgICAgICAgICAgICAgICBhYmlzdF9mb3JtYXQg
PSAzOw0KPiArICAgICAgICAgICAgICAgYnJlYWs7DQo+ICsgICAgICAgY2FzZSAxNDQwOg0KPiAr
ICAgICAgICAgICAgICAgaWYgKG1vZGUtPnZkaXNwbGF5ID09IDQ4MCkNCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgYWJpc3RfZm9ybWF0ID0gaW50ZXJsYWNlZCA/IDUgOiA5Ow0KPiArICAgICAg
ICAgICAgICAgZWxzZSBpZiAobW9kZS0+dmRpc3BsYXkgPT0gNTc2KQ0KPiArICAgICAgICAgICAg
ICAgICAgICAgICBhYmlzdF9mb3JtYXQgPSBpbnRlcmxhY2VkID8gMTQgOiAxODsNCj4gKyAgICAg
ICAgICAgICAgIGJyZWFrOw0KPiArICAgICAgIGNhc2UgMTkyMDoNCj4gKyAgICAgICAgICAgICAg
IGlmIChtb2RlLT52ZGlzcGxheSA9PSAxMDgwKQ0KPiArICAgICAgICAgICAgICAgICAgICAgICBh
YmlzdF9mb3JtYXQgPSBpbnRlcmxhY2VkID8gNCA6IDEwOw0KPiArICAgICAgICAgICAgICAgYnJl
YWs7DQo+ICsgICAgICAgY2FzZSAzODQwOg0KPiArICAgICAgICAgICAgICAgaWYgKG1vZGUtPnZk
aXNwbGF5ID09IDIxNjApDQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGFiaXN0X2Zvcm1hdCA9
IDI1Ow0KPiArICAgICAgICAgICAgICAgYnJlYWs7DQo+ICsgICAgICAgY2FzZSA0MDk2Og0KPiAr
ICAgICAgICAgICAgICAgaWYgKG1vZGUtPnZkaXNwbGF5ID09IDIxNjApDQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGFiaXN0X2Zvcm1hdCA9IDI2Ow0KPiArICAgICAgICAgICAgICAgYnJlYWs7
DQo+ICsgICAgICAgZGVmYXVsdDoNCj4gKyAgICAgICAgICAgICAgIGJyZWFrOw0KPiArICAgICAg
IH0NCj4gKyAgICAgICBpZiAoYWJpc3RfZm9ybWF0IDwgMCkNCj4gKyAgICAgICAgICAgICAgIHJl
dHVybiBhYmlzdF9mb3JtYXQ7DQo+ICsNCj4gKyAgICAgICByZWdtYXBfdXBkYXRlX2JpdHMoaGRt
aS0+cmVncywgVE9QX0NGRzAwLCBIRE1JX0FCSVNUX1ZJREVPX0ZPUk1BVCwNCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgRklFTERfUFJFUChIRE1JX0FCSVNUX1ZJREVPX0ZPUk1BVCwgYWJp
c3RfZm9ybWF0KSk7DQo+ICsgICAgICAgcmVnbWFwX3NldF9iaXRzKGhkbWktPnJlZ3MsIFRPUF9D
RkcwMCwgSERNSV9BQklTVF9FTkFCTEUpOw0KPiArICAgICAgIHJldHVybiAwOw0KPiArfQ0KPiAr
DQo+ICtzdGF0aWMgaW50IG10a19oZG1pX3YyX2RlYnVnX2FiaXN0X3Nob3coc3RydWN0IHNlcV9m
aWxlICptLCB2b2lkICphcmcpDQo+ICt7DQo+ICsgICAgICAgc3RydWN0IG10a19oZG1pICpoZG1p
ID0gbS0+cHJpdmF0ZTsNCj4gKyAgICAgICBib29sIGVuOw0KPiArICAgICAgIHUzMiB2YWw7DQo+
ICsgICAgICAgaW50IHJldDsNCj4gKw0KPiArICAgICAgIGlmICghaGRtaSkNCj4gKyAgICAgICAg
ICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiArDQo+ICsgICAgICAgcmV0ID0gcmVnbWFwX3JlYWQo
aGRtaS0+cmVncywgVE9QX0NGRzAwLCAmdmFsKTsNCj4gKyAgICAgICBpZiAocmV0KQ0KPiArICAg
ICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gKw0KPiArICAgICAgIGVuID0gRklFTERfR0VUKEhE
TUlfQUJJU1RfRU5BQkxFLCB2YWwpOw0KPiArDQo+ICsgICAgICAgc2VxX3ByaW50ZihtLCAiSERN
SSBBdXRvbWF0ZWQgQnVpbHQtSW4gU2VsZiBUZXN0OiAlc1xuIiwNCj4gKyAgICAgICAgICAgICAg
ICAgIGVuID8gIkVuYWJsZWQiIDogIkRpc2FibGVkIik7DQo+ICsNCj4gKyAgICAgICByZXR1cm4g
MDsNCj4gK30NCj4gKw0KPiArc3RhdGljIHNzaXplX3QgbXRrX2hkbWlfdjJfZGVidWdfYWJpc3Rf
d3JpdGUoc3RydWN0IGZpbGUgKmZpbGUsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgX191c2VyICp1YnVmLA0KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplX3QgbGVuLCBsb2ZmX3QgKm9mZnAp
DQo+ICt7DQo+ICsgICAgICAgc3RydWN0IHNlcV9maWxlICptID0gZmlsZS0+cHJpdmF0ZV9kYXRh
Ow0KPiArICAgICAgIGludCByZXQ7DQo+ICsgICAgICAgdTMyIGVuOw0KPiArDQo+ICsgICAgICAg
aWYgKCFtIHx8ICFtLT5wcml2YXRlIHx8ICpvZmZwKQ0KPiArICAgICAgICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7DQo+ICsNCj4gKyAgICAgICByZXQgPSBrc3RydG91aW50X2Zyb21fdXNlcih1YnVm
LCBsZW4sIDAsICZlbik7DQo+ICsgICAgICAgaWYgKHJldCkNCj4gKyAgICAgICAgICAgICAgIHJl
dHVybiByZXQ7DQo+ICsNCj4gKyAgICAgICBpZiAoZW4gPCAwIHx8IGVuID4gMSkNCj4gKyAgICAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiArDQo+ICsgICAgICAgbXRrX2hkbWlfdjJfc2V0
X2FiaXN0KChzdHJ1Y3QgbXRrX2hkbWkgKiltLT5wcml2YXRlLCBlbik7DQo+ICsgICAgICAgcmV0
dXJuIGxlbjsNCj4gK30NCj4gKw0KPiArc3RhdGljIGludCBtdGtfaGRtaV92Ml9kZWJ1Z19hYmlz
dF9vcGVuKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmaWxlKQ0KPiArew0KPiAr
ICAgICAgIHJldHVybiBzaW5nbGVfb3BlbihmaWxlLCBtdGtfaGRtaV92Ml9kZWJ1Z19hYmlzdF9z
aG93LCBpbm9kZS0+aV9wcml2YXRlKTsNCj4gK30NCj4gKw0KPiArc3RhdGljIGNvbnN0IHN0cnVj
dCBmaWxlX29wZXJhdGlvbnMgbXRrX2hkbWlfZGVidWdfYWJpc3RfZm9wcyA9IHsNCj4gKyAgICAg
ICAub3duZXIgPSBUSElTX01PRFVMRSwNCj4gKyAgICAgICAub3BlbiA9IG10a19oZG1pX3YyX2Rl
YnVnX2FiaXN0X29wZW4sDQo+ICsgICAgICAgLnJlYWQgPSBzZXFfcmVhZCwNCj4gKyAgICAgICAu
d3JpdGUgPSBtdGtfaGRtaV92Ml9kZWJ1Z19hYmlzdF93cml0ZSwNCj4gKyAgICAgICAubGxzZWVr
ID0gc2VxX2xzZWVrLA0KPiArICAgICAgIC5yZWxlYXNlID0gc2luZ2xlX3JlbGVhc2UsDQo+ICt9
Ow0KPiArDQo+ICtzdGF0aWMgdm9pZCBtdGtfaGRtaV92Ml9kZWJ1Z2ZzX2luaXQoc3RydWN0IGRy
bV9icmlkZ2UgKmJyaWRnZSwgc3RydWN0IGRlbnRyeSAqcm9vdCkNCj4gK3sNCj4gKyAgICAgICBz
dHJ1Y3QgbXRrX2hkbWkgKmRwaSA9IGhkbWlfY3R4X2Zyb21fYnJpZGdlKGJyaWRnZSk7DQoNCk1h
eWJlIHVzaW5nIGhkbWkgaW5zdGVhZCBvZiBkcGkgaXMgYmV0dGVyLg0KSSB3b3VsZCBjaGFuZ2Ug
aXQgd2hlbiBJIGFwcGx5IHRoaXMgcGF0Y2guDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVA
bWVkaWF0ZWsuY29tPg0KDQo+ICsNCj4gKyAgICAgICBkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJoZG1p
X2FiaXN0IiwgMDY0MCwgcm9vdCwgZHBpLCAmbXRrX2hkbWlfZGVidWdfYWJpc3RfZm9wcyk7DQo+
ICt9DQo+ICsNCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2JyaWRnZV9mdW5jcyBtdGtfdjJf
aGRtaV9icmlkZ2VfZnVuY3MgPSB7DQo+ICAgICAgICAgLmF0dGFjaCA9IG10a19oZG1pX3YyX2Jy
aWRnZV9hdHRhY2gsDQo+ICAgICAgICAgLmRldGFjaCA9IG10a19oZG1pX3YyX2JyaWRnZV9kZXRh
Y2gsDQo+IEBAIC0xMjA5LDYgKzEzMzEsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9icmlk
Z2VfZnVuY3MgbXRrX3YyX2hkbWlfYnJpZGdlX2Z1bmNzID0gew0KPiAgICAgICAgIC5oZG1pX3Rt
ZHNfY2hhcl9yYXRlX3ZhbGlkID0gbXRrX2hkbWlfdjJfaGRtaV90bWRzX2NoYXJfcmF0ZV92YWxp
ZCwNCj4gICAgICAgICAuaGRtaV9jbGVhcl9pbmZvZnJhbWUgPSBtdGtfaGRtaV92Ml9oZG1pX2Ns
ZWFyX2luZm9mcmFtZSwNCj4gICAgICAgICAuaGRtaV93cml0ZV9pbmZvZnJhbWUgPSBtdGtfaGRt
aV92Ml9oZG1pX3dyaXRlX2luZm9mcmFtZSwNCj4gKyAgICAgICAuZGVidWdmc19pbml0ID0gbXRr
X2hkbWlfdjJfZGVidWdmc19pbml0LA0KPiAgfTsNCj4gDQo+ICAvKg0KPiANCj4gLS0NCj4gMi41
MC4xDQo+IA0KDQo=

