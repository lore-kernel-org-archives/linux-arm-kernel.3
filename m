Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D2AD58B07
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 12:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHalHVYPS8n0/VkVWJjI9WEjHFqOaOVZUo5eajyrP/Y=; b=uQ/8WZAZfxYBtv+Db1RHAryA04
	kgw/V7EMwfeBS06YdlvFIA7qMHrW73NhxT5SKhHfh+1AtJIbjrxyXSt9TWTizdvyev0RvBQlo/qFS
	lNnjap7SGTugVPKPDSDoF1MD1eYzjTMwMKq98Ldvm9LIEdNuTEzBuI7Erb+biHmrwGTnrTqLgvUqs
	u82HB8SkdycgsP9LehaBrNCqzbD5LPbcpAptP6T7e1FJzvhO5/yUKuopgzgDGnJmAieHqnubVSkf4
	qeFntYWG1dyS9ug8YM+k1fBVfoBqlNXjTMETPe87edsbR4Pq1jCseVZvLTi1hqOHWLHLltBunPWAM
	5Zm1VP7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26yN-00000003xKs-1tGH;
	Mon, 16 Mar 2026 12:23:03 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26yI-00000003xKF-1R5g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 12:23:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AP9pRF4vMxDXPezkh5v4wJxDP0SmiKGc/bWMDWwmXM0bkCKn2NK6Sm2ORzWpQ1mjs7pqwv3LdBd2FWSKYxb2VN7jAk5/6GGRtv5z6suriFWLeIlYFfuXa6GT4paOkOAxzO8MPKnX5AxNyAIZsjehUt3SgH4Sz93OgYhON8iRm2lFGwQS/Xb8s/QQeN74snWKlUXCrXe9n7VajCX9G2CRXnMti1YEYxoe5QHLcxgFwh9t4vC+nD5hkWM0AQFETexH8peaXnmREgXmWkbAqHmxidEd/PBwo/7Z+iCEyDkb5kA1FHkClTNdU4Md1iiH79/hQYEjRc6dq4r16IljVNctMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHalHVYPS8n0/VkVWJjI9WEjHFqOaOVZUo5eajyrP/Y=;
 b=ZExY94ylXLtbfQ0AEHWBU0mth8QPfDydW5ie6fESR8G9paK50NfUZMoiYTTXPo42DfsKvmPGmDuvetHzG1o0cxoua87RG9ucH+prGcK0JxSE4vG98ORGpyDA833Hoj6DZd5t6l2zsMeyfB4KwtX/dDo04/plXGDQEV0BcHCnNRjDoQAH8nJoZ/Vwc29lIA1Wmjw4biG9hGL/kNlRD635cIRaIcY5heCOJ46Bv1JMipgPzkQN4uTbyBFIP6CVQKs/nV8UEU/n5Nxx5k5wU7zq972MARpf9TlcSoVKJdI993NeVuWfnL+fXzjonKQTIymJ70smgh0Qz3C12pnIIIM5QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHalHVYPS8n0/VkVWJjI9WEjHFqOaOVZUo5eajyrP/Y=;
 b=N8FsJJUXNZM2Q40LkDqXFrVkDcopQDHtbqBT/hbWAlAixfXQV9pu1noXu4v5PFbAolm50cXfHKVZKV1HLZMhQZMeswKxcDczIA4BMrCkmeMqakudQcDOokNzsFHEVzXRwQiMx07YXjwlFVtMQF+KvmTSR0rY6kmr7UAaVI7r6iB5UMjbaKy73xsKzJy0Q+wjXVPLvPJEBSNakG2Nyn5Ht/KX1Bzjl0RQ8aB1NTgP2li+aYQrAZVG9CRafPXhe6zocS1zCAyltxrqA2KA2QQYgDn/CqmWpnUWMiYqAZHZPsrEgqg0yEmIoYQwEVKe4xUYkg6w2Gi+YTBcppstuOgkOg==
Received: from PAWPR10MB6877.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:33a::21)
 by AS5PR10MB8104.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:678::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 12:22:39 +0000
Received: from PAWPR10MB6877.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::913b:c641:4f20:58c4]) by PAWPR10MB6877.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::913b:c641:4f20:58c4%4]) with mapi id 15.20.9700.020; Mon, 16 Mar 2026
 12:22:39 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "jm@ti.com" <jm@ti.com>, "msp@baylibre.com" <msp@baylibre.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Disable mmc Schmitt Trigger
Thread-Topic: [PATCH] arm64: dts: ti: k3-am62a7-sk: Disable mmc Schmitt
 Trigger
Thread-Index: AQHcoAz+v8NLvcx+EE++zWoSs7wclLWG4SyAgAPZWYCAAAj/gIAme4IA
Date: Mon, 16 Mar 2026 12:22:38 +0000
Message-ID: <e1df4ba929c54fccd906a03ad6bccb5a71d4d59a.camel@siemens.com>
References: <20260106-topic-am62a-mmc-pinctrl-v6-19-next-v1-1-1190ac29aadb@baylibre.com>
	 <c47697b4-6ebb-4af9-be96-c964d990835d@ti.com>
	 <DFO764ES0FNP.1SUQK9R0EUUDQ@baylibre.com>
	 <1a91fd40-e814-4b4c-8914-d8f0c4768e07@ti.com>
	 <DG59D7WGM35A.1WNIIMNCQ8U3C@baylibre.com>
	 <7ae7f6a1-0ee1-4d56-b1d0-f038a7d22b4c@ti.com>
	 <b649669afe4e2c829389a6bedabe47446d2f3d2b.camel@siemens.com>
	 <615c56c4564b38fe82585e9873949b538f24ae7b.camel@siemens.com>
	 <7ad9d8bf-a962-40f0-bc8a-92228aeb0b4e@ti.com>
	 <b22958ce-fb67-44d3-841a-d02a185942e5@ti.com>
In-Reply-To: <b22958ce-fb67-44d3-841a-d02a185942e5@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR10MB6877:EE_|AS5PR10MB8104:EE_
x-ms-office365-filtering-correlation-id: 4ea5365a-99f4-4ac2-d02a-08de8356b6c3
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|18002099003|55112099003|22082099003|56012099003;
x-microsoft-antispam-message-info: pr6EBqCjIS/EaPn7hChuwxs/oX2kg7JXMY4NUoBQ065NtV7hKJZ7mMOSV6LJ1RbMWlo62dHoil+SBCz8YY9nGsFoWyxjxIPFE3A7L2jlXreNoMKPiqRkXs2ATPgyEYUnwilUvI6Pri6V9fwT2ELBSR9fAvC27kHNal5ExJpl80UTuNHVUh/YVhXyjL/68Dl07EauWunFlihKRSJWocHtGjgwn+V/7zdiso58A72gQiZBN+s4RFiURFynn7ldpa2wk8ZqHCPuNMfsYdPZ4h3rtIXYXO8mh37AYoPeEpYTBLx+ye+uQMA1fDrKSMoQ5uihjKR6Ym1D8ZPr2Gm5cb10+vfvpRikpP/gmE34ODROm9wtaVJx/n8n1d89ZyTb/pPkTOniXcQZYU/Csya2VmmemkJe4bU8XnZFA0B8Y0vgc/2NCk0lpiaV0hex3kJHykrALeZAA72RraY0Nanvz4yqsfsxevTKDTg9su6lZpQtXwdE7o6EjOgJrRjGPtJC2rieaK/ovbyzupk1DpYwEPxQc9PEnC9rXM2+/IfYM8ECXqdH9i0r3TvkUFSE4xqTxWV8Ah+cMRiBxMpMHDqNtnBLHNpeRBsLht2GOoDEo8FsXbiJlbxfoVDv1LHqMMigKCCP7Eb8Fjz1ibIgHN9vvtU3iHJiwyRAum14h56w8xbn+1CysynUrwqos13IJjk3Z97qVHxrI1xtvBv2JPlatETni8AXvVDQk8KnmSlkqQRxKUI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR10MB6877.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(18002099003)(55112099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akxkRDBpR2lLVWNMejluMmEwMFN5YVBQUDlOSGs0RWRtQmR0OTdXSldTdVdw?=
 =?utf-8?B?SURkaEF2a2Jhd29jdjJkZzN1TFpZVUJIVkJaVEZCd1hOZHpraUdOYi83QUFY?=
 =?utf-8?B?Tlh0eDVZQTBBeDYzaE1PV2R0TnFuZ3NoY2hEamVoWkNEL2haRFdPdzZwYkls?=
 =?utf-8?B?cVZLV2FMdzNVaTFVbXRyRUszVi9hT1hvNmljeWJmUnBWRTBVV3haNTMrRGts?=
 =?utf-8?B?QkZhWE5Na3lESko3VCtFN3VpaVF6SDZzb3dGTUJ4bDhOenY5bjdZMTlqM0hZ?=
 =?utf-8?B?blVjRHZaMnZsaTAzTVR0bTFzTFl5U1o1ekZLZTJUNFczcEJId0U3RnRpYnIv?=
 =?utf-8?B?QW56bzBxdUNZOC96V1RmU1ZFSGU3OHAzdkZXeHJTUnBlMncxOE9xakdmd1RL?=
 =?utf-8?B?NjNpTFIrbXhNQ3lBMDFRR3JoTFI2Z0ppK0g4TndjbFNyWkFNMVVRWXUvdTA5?=
 =?utf-8?B?SnU4UWtobUt0VGM2VnFpQlkzUWZJZTNwc3FiNkgvZDNmSE9PTW1ubE0rdXg1?=
 =?utf-8?B?azFKNmErdmVtc1kxdTJ1YTM5WHllcmVJbnZibXpmaXkxanZiR2ZzSTdPNCtk?=
 =?utf-8?B?eDYzMzJacXhyRm9xWHRDVlhFMXFkeDBxZTFVZGFCbHJXUWpVYkVjYVVIK3Ry?=
 =?utf-8?B?OC80ekhTN0ZiMktyTlI2QlI0QlJMYUI5THFManYzZzRTRmRER0pUMzYvcFFH?=
 =?utf-8?B?bVExNmFDMDlmL2kyU3dvOW5USUFPeVlIa2pmL1VCSU5hemZsaUV4MUd5Tk40?=
 =?utf-8?B?d0JlWlVOazRJb2VWN2hSc2c1aHZSeFAzamNTeDJhTTdLdk15eGNuck5SZ1NT?=
 =?utf-8?B?NHBoTm9qQ2puVDJ6Mzk4WUxYQTNoeWtzRHMva2ErNlZwcHZ6QTEzL3JoWnRj?=
 =?utf-8?B?RCt5aVNRSTFXTVREMDU5WEFiaFYyU1MwYnFrQXdPVFc2a2NDKzdmOEgvRkU3?=
 =?utf-8?B?NnkwTzlTcmoxVkdnb0lFcUQ4SjhvRkJpYkVyOTlndC9KTkIzYWVjbjVyOHUw?=
 =?utf-8?B?cXByNU9qeHBtZGh6Mk5EWWJVQ1ovMEtrWlNzQkZPMUIyUVRWUTdkYXlyc0tV?=
 =?utf-8?B?SEdrQ0tDUkJocjVtT2pSLzgwZXFLUFozLytmR1MxY09HcUIyL3YzT09HdWJh?=
 =?utf-8?B?RzRDYkRkc1lhNFIzYmN6djdOeFVIMEJxc3VJdjYxZG1YRWF2SDRnMHFCckdN?=
 =?utf-8?B?aktNMEVHbjQrZWtIbW81NERQV2ZPWDZMN2ZqMnUrd3RkWE95QytyYU5Ycko3?=
 =?utf-8?B?bWZOZDVLZ1VFemNRcS9GTU9UcWpIR3BtdVBHWmtaQ09FU0o4bU9mSEY1Y3BH?=
 =?utf-8?B?dkN4WXQvYU9GbmR2WFBYUGNORno1SzVWbTlUbTh4cGZjMXVvcXdob2pBQ1Ns?=
 =?utf-8?B?SHZqclNFc3B5Y2hUZGE1VmtNbk8rRjZOakE4TFArOFhxZkw1SjcrODJEZFNs?=
 =?utf-8?B?WStMeTY1RXNsdk9ST3hvNGNKV3ozTTgxT0RxbStncGFLTHhNdm1SYzh1TENo?=
 =?utf-8?B?TnBUeWlEZXMyUDZxTmxjTGxCalM0WHV3cWNUZERFUE54aklBcU9VdXBWMVNI?=
 =?utf-8?B?Q2ErMTdMeExpaHlWUEd1WituV003V2E3NjRmL0l5VXVvcHlmaEJ4dGlZTy9Z?=
 =?utf-8?B?cTc1Zmx5RzRUdkFFYW5LU3FLQjRoUEpxUlJlNHJZWjM0MExidnExWFUyQ0lv?=
 =?utf-8?B?aUtubkxVYURKSG1icURJN1BWWG54TU5la3BjNU1QYjl1UmhsNnc5UzRSMFFQ?=
 =?utf-8?B?NTRnREcrRW9ma21hR0NtYzlJSTlRNE9JYjBZa1VJK2hBQXFFbWFaTGtuQXkx?=
 =?utf-8?B?R3RiM0RhR1F1OVF1alNQNzhVK0dGNzNGKzc5Vk9kTFdmc29mb0MyZHEzd3Nj?=
 =?utf-8?B?L3RGaGlCazBOY1RJWXltazl5d0pBSmJSQWsvLzVsOWFOS3kvOS8yVHBJN3Ew?=
 =?utf-8?B?ckhZTXJFYlpCelJ1Q05hcHZ6RkQyckNPWmxxaFVlTEM3K2owMEsrcWc0MVlS?=
 =?utf-8?B?K292MXhCZzg1MlMzNERmb1BFWWdWb29RRUM1NVdTanlsRUtkbWxMZURzY0lH?=
 =?utf-8?B?UzFPYlp0dEdjL0Z1MGUzaHBwQm5wekdSWWVselExaFZJa05RWHRrekcvcHNZ?=
 =?utf-8?B?N3VEVUZmN1I2a3pMaVNxYkZxV0cxWjhJTmdqbi9KbXZ3NG5EclpDOXlwRTdX?=
 =?utf-8?B?M01jd3JPOGt4TkFVTkRXK2Y5aXB4UG1BY2oyZjFFVk5nbjRGZFdNR0t4N25T?=
 =?utf-8?B?S2ljMXNDTEN1THk3dFdKY0JLZnd1c3QwZkdxZnhIUWdpalk4T2M1OWdSdjlI?=
 =?utf-8?B?WHFUZi9NbXlTOG5PUzBMVERIYUJ2UXpYQ3pGK1QzYzh2UGxtekhuR3dMaVVO?=
 =?utf-8?Q?BFWu0k7dI2PFbaVUVhsgHKiDRYfj9iwZ8Q2mJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <130EC3E821A4C74589A7C47A37763B58@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR10MB6877.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea5365a-99f4-4ac2-d02a-08de8356b6c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 12:22:38.9743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LHsRW4a138N4cd+l/t8Ajcvk1Juq/EOL9uMd3rtQO17MUlCL1il9OHnMTnSeYdpgfGj4/UDCkISM5O/KKK41R+uD+Sfp5TQZ/O9nz6Yb4Bc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR10MB8104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_052258_780581_7A090EF7 
X-CRM114-Status: GOOD (  31.83  )
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

SGkgSnVkaXRoLA0KDQpPbiBUaHUsIDIwMjYtMDItMTkgYXQgMTg6NDIgLTA2MDAsIEp1ZGl0aCBN
ZW5kZXogd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPiBDYW4geW91IHBsZWFzZSBydW4gYSBxdWlj
ayB0YXAgc3dlZXAgb24gTU1DMSBhbmQgTU1DMCBpbnRlcmZhY2VzIA0KPiA+ID4gPiA+ID4gPiA+
ID4gbGlrZQ0KPiA+ID4gPiA+ID4gPiA+ID4gc28/IGh0dHBzOi8vZ2lzdC5naXRodWIuY29tL2pt
ZW50aS9mNGE3M2E4MzIzZTQ0YmY3MTdjNmQyYzUyOGM0OTljYQ0KPiA+ID4gPiA+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gPiA+ID4gPiBUaGlzIHdpbGwgZ2l2ZSBtZSBhbiBpZGVhIGlmIHdoZXRoZXIg
d2Ugc2hvdWxkIGJlIHRhbGtpbmcgYWJvdXQNCj4gPiA+ID4gPiA+ID4gPiA+IHJldmlzaXRpbmcg
Y2hhcmFjdGVyaXphdGlvbiB3aXRoIFNUX0VOQT0xLg0KPiA+ID4gPiANCj4gPiA+ID4gSSB3YW50
ZWQgdG8gYXBwbHkgeW91ciBwYXRjaCBhbmQgdGVzdCBvbiBvdXIgSFcsIGJ1dCBJIGhhdmUgc29t
ZSANCj4gPiA+ID4gZG91YnRzLCBpZg0KPiA+ID4gPiB0aGUgcGF0Y2ggbWF5YmUgbWlzc2luZyBz
b21ldGhpbmc6DQo+ID4gPiA+IA0KPiA+ID4gPiAtIGFtNjU0X3NkaGNpX3dyaXRlX290YXBkbHko
KSB0dXJucyBvdXQgdG8gYmUgdW51c2VkIGluIGFueSB1cHN0cmVhbSANCj4gPiA+ID4gVS1Cb290
IHZlcnNpb24NCj4gPiA+ID4gLSBuZXcgIm9tYXAiIHZhcmlhYmxlIGluIGFtNjU0X3NkaGNpX2V4
ZWN1dGVfdHVuaW5nKCkgaXMgaW4gZmFjdCANCj4gPiA+ID4gdW51c2VkIGFzIHdlbGwNCj4gPiA+
IA0KPiA+ID4gYW5kDQo+ID4gPiANCj4gPiA+ID4gL2hvbWUvc3ZlcmRsaW4vdS1ib290L2RyaXZl
cnMvbW1jL2FtNjU0X3NkaGNpLmM6IEluIGZ1bmN0aW9uIA0KPiA+ID4gJ2o3MjFlXzRiaXRfc2Ro
Y2lfc2V0X2lvc19wb3N0JzoNCj4gPiA+ID4gL2hvbWUvc3ZlcmRsaW4vdS1ib290L2RyaXZlcnMv
bW1jL2FtNjU0X3NkaGNpLmM6NTk4Ojk6IGVycm9yOiANCj4gPiA+ICdpdGFwX2RlbF9zZWwnIGlz
IHVzZWQgdW5pbml0aWFsaXplZCBbLVdlcnJvcj11bmluaXRpYWxpemVkXQ0KPiA+ID4gPiDCoMKg
IDU5OCB8wqDCoMKgwqDCoMKgwqDCoCBwcmludGYoImo3MjFlXzRiaXRfc2RoY2lfc2V0X2lvc19w
b3N0LCBtb2RlPSVkLCANCj4gPiA+IG90YXA9JWQsIGl0YXA9JWRcbiIsIG1vZGUsIG90YXBfZGVs
X3NlbCwgaXRhcF9kZWxfc2VsKTsNCj4gPiA+ID4gwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDC
oMKgIA0KPiA+ID4gXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
DQo+ID4gPiA+IC9ob21lL3N2ZXJkbGluL3UtYm9vdC9kcml2ZXJzL21tYy9hbTY1NF9zZGhjaS5j
OjU5NDoxMzogbm90ZTogDQo+ID4gPiAnaXRhcF9kZWxfc2VsJyB3YXMgZGVjbGFyZWQgaGVyZQ0K
PiA+ID4gPiDCoMKgIDU5NCB8wqDCoMKgwqDCoMKgwqDCoCB1MzIgaXRhcF9kZWxfc2VsOw0KPiA+
ID4gPiDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBefn5+fn5+fn5+fn4N
Cj4gPiA+IA0KPiA+ID4gDQo+ID4gPiBzbyBJJ20gbm90IHN1cmUgcmVnYXJkaW5nIHRoZSBwcmV2
aW91cyB0ZXN0IHJlc3VsdHMgYXQgYWxsIGFueSBsb25nZXIuLg0KPiA+IA0KPiA+IFNvcnJ5IGZv
ciB0aGUgbGF0ZSByZXBseSwgc29tZWhvdyBJIG1pc3NlZCB0aGlzIGVtYWlsLg0KPiA+IA0KPiA+
IE9oIG15LCBJIGFtIG5vdCBzdXJlIHdoYXQgaGFwcGVuZCBidXQgc2VlbXMgbGlrZSBJIGRpZCBu
b3QgY29weSB0aGUNCj4gPiB3aG9sZSBwYXRjaCBjb3JyZWN0bHkuIFdlcmUgeW91IGFibGUgdG8g
YnlwYXNzIG9yIGRvIHlvdSBuZWVkIG1lDQo+ID4gdG8gcmViYXNlIHRoZSBwYXRjaCBhbmQgY29w
eSBjb3JyZWN0bHk/DQo+ID4gDQo+IA0KPiBZb3VyIHJlc3BvbnNlIGFjdHVhbGx5IGV4cGxhaW5z
IHdoeSBNYXJjdXMncyBsb2cgZGlkIG5vdCBtYWtlDQo+IHNlbnNlIGF0IGFsbCwgdGhhbmtzLiBI
ZXJlIGlzIHRoZSB1cGRhdGVkIHBhdGNoIGluIGNhc2UgeW91IG5lZWQNCj4gaXQ6IGh0dHBzOi8v
Z2lzdC5naXRodWIuY29tL2Y0YTczYTgzMjNlNDRiZjcxN2M2ZDJjNTI4YzQ5OWNhLmdpdA0KPiAN
Cj4gTWFya3VzLCBjYW4geW91IHRyeSB3aXRoIHRoaXMgcGF0Y2ggaW5zdGVhZD8NCg0Kc29ycnkg
Zm9yIHRoZSBkZWxheSwgaXQgdG9vayBtZSBzb21lIHRpbWUgdW50aWwgSSB3YXMgYWJsZSB0byBk
ZWJ1ZyB3aHkNCnlvdXIgbGFzdCBwYXRjaCBjcmFzaGVzIFUtQm9vdCBhZnRlciBlbW1jIHR1bmlu
ZzoNCg0KRm9yIG90YXA9MzEsIGl0YXA9MzEgOlBBU1MNCmFtNjU0X3NkaGNpX3dyaXRlX2l0YXBk
bHksIHdyaXRlIGl0YXBkbHk9MTUNCiJTeW5jaHJvbm91cyBBYm9ydCIgaGFuZGxlciwgZXNyIDB4
OGEwMDAwMDAsIGZhciAweDE0MDEwMDAwYzMxNzE0ZWQNCmVscjogMTQwMTAwMDA4M2EyYjRlZCBs
ciA6IDE0MDEwMDAwODNhMmI0ZWQgKHJlbG9jKQ0KZWxyOiAxNDAxMDAwMGMzMTcxNGVkIGxyIDog
MTQwMTAwMDBjMzE3MTRlZA0KeDAgOiAwMDAwMDAwMDAwMDAwMDAwIHgxIDogMDAwMDAwMDAwMDAw
MDAwMA0KeDIgOiAwMDAwMDAwMDAwMDAwMTBjIHgzIDogMDAwMDAwMDBiZmFkNTUzOA0KeDQgOiAw
MDAwMDAwMDAwMDAwMDA0IHg1IDogMDAwMDAwMDAwMDAwMDAwMA0KeDYgOiAwMDAwMDAwMDAwMDAw
NDAwIHg3IDogMDAwMDAwMDAwMDAwMDExMA0KeDggOiAwMDAwMDAwMDAwMTBmMzBmIHg5IDogMDAw
MDAwMDBiZmIyOWNkMA0KeDEwOiAwMDAwMDAwMDAwMDAwMTBjIHgxMTogMDAwMDAwMDAwMDAwMDIw
MA0KeDEyOiAwMDAwMDAwMGJmYjE1ODg4IHgxMzogMDAwMDAwMDBiZmIxNTliMA0KeDE0OiAwMDAw
MDAwMGZmZmZmZmZmIHgxNTogMDAwMDAwMDBiZmFkNTA5MQ0KeDE2OiAwMDAwMDAwMGJmZjg0MDc4
IHgxNzogMDAwMDAwMDAwMDAwMDAwMA0KeDE4OiAwMDAwMDAwMGJmYjI1ZGIwIHgxOTogMDQxNzE0
MDEwMDAwODExNw0KeDIwOiAwMDAwMDAwMGJmZmI3YWEwIHgyMTogMDAwMDAwMDBiZmZiNzk5MA0K
eDIyOiAwMDAwMDAwMDAwMDAwMDBhIHgyMzogMDAwMDAwMDA3MDAwMDQxOQ0KeDI0OiAwMDAwMDAw
MDAwMDAwMDAyIHgyNTogMDAwMDAwMDAwMDAwMDAwNQ0KeDI2OiAwMDAwMDAwMDAwMDAwMDAxIHgy
NzogMDAwMDAwMDBiZmZiNzliNA0KeDI4OiAwMDAwMDAwMDAwMDAwMDAwIHgyOTogMDAwMDA0MTcx
NGFlMDAwMA0KDQpJdCB0dXJucyBvdXQsIGl0IHdyaXRlcyB3YXkgYmV5b25kIGZhaWxfd2luZG93
W10gYm91bmRhcmllcy4uLiBCdXQNCkkndmUgY2FwdHVyZWQgY291cGxlIG9mIHJ1bnMgb24gdGhl
IGJvYXJkcyB0aGF0IHdlcmUgYWZmZWN0ZWQgb24gb3VyIHNpZGUNCmFmdGVyIGFwcGx5aW5nIHRo
aXMgcGF0Y2g6DQoNCi0tLSBhL2RyaXZlcnMvbW1jL2FtNjU0X3NkaGNpLmMNCisrKyBiL2RyaXZl
cnMvbW1jL2FtNjU0X3NkaGNpLmMNCkBAIC00OTQsNyArNDk0LDcgQEAgc3RhdGljIGludCBhbTY1
NF9zZGhjaV9leGVjdXRlX3R1bmluZyhzdHJ1Y3QgbW1jICptbWMsIHU4IG9wY29kZSkNCiB7DQog
CXN0cnVjdCB1ZGV2aWNlICpkZXYgPSBtbWMtPmRldjsNCiAJc3RydWN0IGFtNjU0X3NkaGNpX3Bs
YXQgKnBsYXQgPSBkZXZfZ2V0X3BsYXQoZGV2KTsNCi0Jc3RydWN0IHdpbmRvdyBmYWlsX3dpbmRv
d1tJVEFQRExZX0xFTkdUSF07DQorCXN0cnVjdCB3aW5kb3cgZmFpbF93aW5kb3dbSVRBUERMWV9M
RU5HVEggKiBJVEFQRExZX0xFTkdUSCAvIDJdOw0KIAlpbnQgbW9kZSA9IG1tYy0+c2VsZWN0ZWRf
bW9kZTsNCiAJdTggY3Vycl9wYXNzLCBpdGFwLCBvdGFwOw0KIAl1OCBmYWlsX2luZGV4ID0gMDsN
CkBAIC01MjIsNyArNTIyLDcgQEAgc3RhdGljIGludCBhbTY1NF9zZGhjaV9leGVjdXRlX3R1bmlu
ZyhzdHJ1Y3QgbW1jICptbWMsIHU4IG9wY29kZSkNCiAJCQlpZiAoIWN1cnJfcGFzcykgew0KIAkJ
CQlmYWlsX3dpbmRvd1tmYWlsX2luZGV4XS5lbmQgPSBpdGFwOw0KIAkJCQlmYWlsX3dpbmRvd1tm
YWlsX2luZGV4XS5sZW5ndGgrKzsNCi0JCQkJcHJpbnRmKCJGYWlsZWQgb3RhcD0lZCwgaXRhcD0l
ZFxuIiwgb3RhcCwgaXRhcCk7DQorCQkJCXByaW50ZigiRmFpbGVkIG90YXA9JWQsIGl0YXA9JWQg
KCVkKVxuIiwgb3RhcCwgaXRhcCwgZmFpbF9pbmRleCk7DQogCQkJfQ0KIA0KIAkJCWlmIChjdXJy
X3Bhc3MgJiYgIXByZXZfcGFzcykNCg0KSSdsbCBzZW5kIHlvdSB0aGUgbG9ncyBzZXBhcmF0ZWx5
IGFzIHRoZXkgYXJlIGh1Z2UgZm9yIHRoZSBsaXN0Lg0KKEkgZ2V0IH42NCBlbnRyaWVzIGluIHRo
ZSBmYWlsX3dpbmRvd1tdIGluIG15IHJ1bnMpDQoNCi0tIA0KQWxleGFuZGVyIFN2ZXJkbGluDQpT
aWVtZW5zIEFHDQp3d3cuc2llbWVucy5jb20NCg==

