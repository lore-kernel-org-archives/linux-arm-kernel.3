Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58356C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 11:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qy4UvRv8R1fvFYcsplYFjyNHgVIJ3DdWtpVk2DfaI3I=; b=o2Iz96fpHjCAPPCFMCuTTdy+7V
	EhPuoYxhTobSfQT3NxrWZjq26W3KV+zwIvLiZ7E0cPk2MKfqKxEIRlp6XACcXQf1Z9sDZi77XnS61
	/5FSeMU8QaaWteNceCNK+gBqI9qvV5L+Z0QTm29O5iHSjpmDsAT8vTP8EH+syr3yBT9z6vv1MVWpb
	96MPbfsQoIgfm7yLZwkTj6Fyasfea9/FsRJzqTm9/HNdGHG911StkUYMNMV4CC/BmduKqgwylFbNF
	Wi8uovwJfXwTJhUCixJRtNiGUzlaBFfO1jWX6NzezYoiqZuLj4++bryWeUlipi0fRiFnMcq75nm3Y
	CANTgSiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4I1E-00000001m41-1b6w;
	Mon, 14 Apr 2025 11:30:28 +0000
Received: from mail-db8eur05on20720.outbound.protection.outlook.com ([2a01:111:f403:2614::720] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4HzM-00000001lnN-20X8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 11:28:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qgzIviNUXuXaoMDf3uk21fcHW6Y0AHgKwaOhU6YCkUs2vdmoW/4vtroP+BigCUGBlIJkQE2ZzysYBRFxbI7tZOSqDio/qHsQQdXkAL8kyziwUwKxXqj1I4Cv1bXW5iM2uziVbL5iVLtKF3D/OXk5Wjc27/ZkoKq5zwbpSE6YU98utyU7HEALd7LBJaqQW0jtAOcQwpOKjd853tMvtxTDc+anBaN43NG1lCrYKb5acrBxQ0u6N/HMjM2XK7UY/GpFd8GBOfIl6BqTZBQs92OSDIBaxPUS9zHftcQYpZs3OlDXsMakR3Y0AGB35qBR6OdnTckssTaO9VfK7j2mitGUWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qy4UvRv8R1fvFYcsplYFjyNHgVIJ3DdWtpVk2DfaI3I=;
 b=oiJCgDdiHfc9TypRYy74UILWvb4E73Q1tk6jimfHi36rojmQYoyB5zzN2umtf/FG8NypRH+L7SQe3gUID9BTQfEKxy4Hbk17DygM7dPSMHwE+QdSr4gbvrkY7hmI3Z1Ao4AIodu1pGU0o2VJu91KsW68O0zJv+bBeit1CDtsMx5FUQMHQb0agbvBeRHWYIUSho+QrnZ4OlsGtG4QneGmUHlpoG8LcMoJHyio7fBJSnSXe3Yv5yiL9pAELsDT4TAPCBemplYyH46hSNz1+b7YvwotniPtIvRHDDpbyICRe2bKKZADT6n5zmUqoEw/df0ATzjWY92ZnQ2R2uXRmimDeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qy4UvRv8R1fvFYcsplYFjyNHgVIJ3DdWtpVk2DfaI3I=;
 b=GQ9c6PlAOOifu1Bg7mm+I2nNgxFsBy1pzIojsq/NHzjwsK7w6n1uhIoKeyX5qLzvlOiNNO36JOg+lcKqiE5FYcgvwDjM70GeSEBNVUCisYFKm6/pzRlvkph3KqClh78TftagrFGviA+lZHlTSZ1K/1gg1sBcP2VLbFSIk7cZpWnRiZPcvQcoaB2YIMbDoa3fuRq9w2q5ZqYNo6N04geZ97nvppI64Tpeq1v2/1uCMI4ndCFIbXZzDv/YY+7wkf2o3rMXDXO3b9tg1E4lUC3Cb2tOX4VOELvagwxTRgYriabUDhgGu+gxpKPGRKhDAM3WmmHqgHzCyUGBd2v+kvHucw==
Received: from GV2P195MB2328.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:dc::8) by
 DB3P195MB2180.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:430::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.32; Mon, 14 Apr 2025 11:28:25 +0000
Received: from GV2P195MB2328.EURP195.PROD.OUTLOOK.COM
 ([fe80::c6fe:e602:7166:f258]) by GV2P195MB2328.EURP195.PROD.OUTLOOK.COM
 ([fe80::c6fe:e602:7166:f258%6]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 11:28:24 +0000
From: Dominik Haller <D.Haller@phytec.de>
To: Nishanth Menon <nm@ti.com>
CC: "robh@kernel.org" <robh@kernel.org>, "kristo@kernel.org"
	<kristo@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "vigneshr@ti.com"
	<vigneshr@ti.com>, "m-chawdhry@ti.com" <m-chawdhry@ti.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>
Subject: Re: [PATCH 2/2] arm64: dts: ti: Add basic support for
 phyBOARD-Izar-AM68x
Thread-Topic: [PATCH 2/2] arm64: dts: ti: Add basic support for
 phyBOARD-Izar-AM68x
Thread-Index: AQHbqt1vH2lyv2T4/EiyxidUCqbk47OjCumA
Date: Mon, 14 Apr 2025 11:28:24 +0000
Message-ID: <0f37e6867a057c713f9da7b3bdfac06bdc7f4184.camel@phytec.de>
References: <20250411101004.13276-1-d.haller@phytec.de>
	 <20250411101004.13276-2-d.haller@phytec.de>
	 <20250411122942.3gh2prc6cqrynfva@darkish>
In-Reply-To: <20250411122942.3gh2prc6cqrynfva@darkish>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P195MB2328:EE_|DB3P195MB2180:EE_
x-ms-office365-filtering-correlation-id: 09594395-8995-464a-ae5f-08dd7b4777e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NFJUMFFNcmJHVzdBNkt2R2NvTGNEU1pPRXBlWVEvSzZoY2NSSXRJVExkc2tR?=
 =?utf-8?B?ZVgwdVBmR0tGV0FNSEhJeW9CZDBmbnVsTlBheDhlMlA2cWdSeWp5djRzWjdB?=
 =?utf-8?B?VFZzK3VQMVlYRG1DZmlDYTd5Z1Y5dUpoc3lDOSthWk5FV2hTV1JMQ1I3Sjhr?=
 =?utf-8?B?eDk4bjJLQktRRkkvMU15dXZ4bmZGU0hzRklzdFRSdHFXQW9ZcHF2QzhheDRz?=
 =?utf-8?B?QW10bHV2eFdGRHpNTk15c0Z4VnBXVHAyeHAwbVJBTm1XakFrQklTUnRJdG9R?=
 =?utf-8?B?UnhMMWpGUGcvcklTSTZneHNSYk5GZzhxcXBYNm1BdEZjL09XbFJsR1lTWVVm?=
 =?utf-8?B?eE8zYVByeVhsVldya01LMHNKUmVES2lCakRVWlNNallkNnJiNnNXV2lCNW9a?=
 =?utf-8?B?RmE0a1lvOWloM01leDZTTVJVUUpHU1pBdjZGemZsUjl4ZExReGpSYzcvVWo0?=
 =?utf-8?B?c1dQeWxidWdRM0hHQXA4eWtudzJmOG5KaDkvbElrYjRjUlFzLzJydVZDclJ4?=
 =?utf-8?B?UHdnWGFjZDQ5dUo0NnFqOUdLUlc5VmIxeG9SLzV0TlN6bUpnNGpucHVCZUpv?=
 =?utf-8?B?c3R3YXo1WUpxMEdQR1A4Sm8rOVdkdytieGhhR250RjNNajZ2bHJ5QXpMdytm?=
 =?utf-8?B?aWVzTUxBWVMrNTFCTW1taHdLUUlSdWQ0ZWNlNWdVR1cwYWh2cGYyRWNUWlQ2?=
 =?utf-8?B?RUE0ZCtXS0paOUY4TEU1dWcrVFZSWllTSnMvN2l0Si9kbzRUaWtQYmF6Ry9K?=
 =?utf-8?B?amR6U0tuMFovT0VEOUFYYzhxYW5FNGFaejNHOGhQWS9TRzhySGJ2cGphSmFF?=
 =?utf-8?B?cXBkNGJGMVJKRDV1VWgyVnJ4ZnJTbFdaSVlxeUpqOWpqNnZhUWRQM05sMTI4?=
 =?utf-8?B?SFJMNm0xSiszemYvelpZOXRXR2hZUEZKQ0hjZFZHZkNhckQvQ21xWnRGcXBl?=
 =?utf-8?B?VVFDOWNRMVpQbElyK3RUSDZ4NWV5aVBxbUplU2NzV3VuUFNLZFMvVUt0M09K?=
 =?utf-8?B?WDRhemh4cVdheGduRGhRVHNsN29mMnZvcnlHMGJUY2IyTFh4cFY2QWFaT2J0?=
 =?utf-8?B?Z3dFQjcxY0ZaMElSeWEySSs3VlhkN1A2YWNlVG1jWE1mUUhFV3RJSkUyWk5m?=
 =?utf-8?B?QjNmeVFUejVJRmNEYWo0NHYyUTEzM3ZTUGwzUkU4OGd2ZUNmUkducVRmOGxV?=
 =?utf-8?B?OXFCVkMrYlZFelVqQ3gvSDM3TmtuTjYxZndDbG8zYXVibkpwM052QzJXZXFN?=
 =?utf-8?B?S2JvampPc2xHdm4ycmM0eVl5MnhRckZZWUltWlBnNnB4S0pyYWswMzRxU1hE?=
 =?utf-8?B?MTZCUmpDcU1LOTRPNG40Q1c0bW4zaUJPU3dQcGxLbVVXQU54Y2syT09jM3Jj?=
 =?utf-8?B?Ry8vYWgzRS90TGZqMUQzUWg4Qi91OGZ1TXlXNVdvWlhkSHNTcVMxdGd2Z3dP?=
 =?utf-8?B?TnNVcmJaQjFWQ0NlT1p0UGRnY3htRWNTMHJ6cGxvZ3JzdmZEMTNSVmFkbXI5?=
 =?utf-8?B?bVdOd21YS21Od0R1QkRWcUswbG5aeURYSEg1aUpmQ1RGQm9ET09WSUQ2Yjcv?=
 =?utf-8?B?L3R5UGJMd1RYdHpNMUs4UEI2NlhIcDhyaUlsTXlPbk5sRWJKa1ZMMDdaREpM?=
 =?utf-8?B?ZkhCWE81WDR6eXl2VHROa2NIV00vdlYrYXZXbXpmdXgwMmdlbTN0WXdQcHp0?=
 =?utf-8?B?UEZEY0J6bS9KUXpId2dpY0dRSkhaZExrK2RENGgzM2RUYm0ySzQyUFlpSGRI?=
 =?utf-8?B?eUwxVHJnT2tIUFRmaW5NTnFPbzZZbWx2cW1WNGhuc3ZGWUNHeVY4Mnhpc2JU?=
 =?utf-8?B?SUFJS202ZVRud0tGNVF5T2xPb25LMTlmNTdXcmdiUjFJeGVOd1ZkRTlaNVIv?=
 =?utf-8?B?VUI2TzUrNlFnZ0pPWVI0dm1zN0E3NGdsWmFIRWFsZlVxek5mRCtpQmFoYlRP?=
 =?utf-8?Q?cH9ttqYuBJR8Y5KXLdMKFjokZ81oy7KI?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P195MB2328.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkhEdTF2WEZzdEhBWXpMd3ZaeGg0aStFajhTSGcvS296REJndEVQTjZRczl1?=
 =?utf-8?B?dnp2bEZFRXk4YnFWZEJhSUNTVnBwMDBLNFBiVkR6ejhyS1pjTWo0ZHJndkxI?=
 =?utf-8?B?YmZWb0UyRjJWL0luWGozRFhybUVXYm1DS1NBOWdFcysyVkhjc0xjb3ZmVDdj?=
 =?utf-8?B?ekRyYlFwZHFUMmRLNHVQMHNCRGwrUFlvYTlVVUN3ZWViS1dpUlQ5RkFDa2Q2?=
 =?utf-8?B?Wjl5dWtWMDRoNUo0Z2FOY2RzZWlEazJDN2xBUGJxSXhuVHFHMXhKQ0NFYVF1?=
 =?utf-8?B?SGFGcXAwWlo4Um1ldjJLeCtkem5jMkdSUUdBb2dDN3VpRXhONUxWY0pXSW1n?=
 =?utf-8?B?aGFML2pabGZEKzNITGRYa1NqWU9HQVZsc2lFWEVhMi92QVMyaENZTXUrU1NJ?=
 =?utf-8?B?eEsvRFo1bmpIdXRRSVFVSEkvYkc2bk5EQkYxMnZwQjdqc2ZSOUZUeDIyTlRI?=
 =?utf-8?B?SEJIR3VuM1lqa3FENThBa2oyU2VtcmZHbHFNaVQ3WnpvQmcwekVFRXRjVDRI?=
 =?utf-8?B?b2Ivd1d2cFRNK3ZQRWkvU1grYzhsOW85YmI4WVNzWnZtTXFGMEJWNnA1aC9Z?=
 =?utf-8?B?OFdFK1pIWDF3TGRFckNKSmF3UzJvWUxUZHc5WUJsUDUxOWFOaGZXeWx1akVM?=
 =?utf-8?B?Um04bjhGbDJKOTdUNTlXVzkwZS9rSCtDZ3VvSjIrZWExQWNrQ0k1VklxYm5k?=
 =?utf-8?B?ZkZseHZ2eGcyR0FZOVFJS0VsbVpWOExad1Z2aldqbEdFWm9hWWpaR01IL0NF?=
 =?utf-8?B?S0hiMjNUYVVBZGFRYXFlQnRWaHRaVklRWllEdldEYyt5TUJDNTVwTTZiVFVp?=
 =?utf-8?B?RzU2QTJnUUh6MUVQelhEVmhaUTBobkg0MFpwL1czMWpxaGxSZVM5eUR0cXZ1?=
 =?utf-8?B?UFhNbTZ3UEZsRDJYTmIrNVVqellDOGZXTXhkUXFEejRMbW8zRVRnNXZabnE1?=
 =?utf-8?B?cG00elVER3VyT2FyWDdpY2h5RFZUNmhiVGgvL3RJK2lBRCtuQnkxaHpCQ2h0?=
 =?utf-8?B?MXF1UGliNngzNXp3M0lhSkJDcmhFNkN5ZFBZTW9KcXFld1lDNXJKcFJSVVMv?=
 =?utf-8?B?SXphSjd3eXR3VFJpbGxBTDl3aTFJdm9hOVVIcUVOVTNmUWdIU0pmNnIvUUJ5?=
 =?utf-8?B?QWk1WkdGRnhDWUJXSXhDeG5PSDVDR1VXRmd0YzN0ek5NdGhRS1RVZ0QwVVFN?=
 =?utf-8?B?N0ljR2ZCNzdTa0IvZU5ZNldMc2EwSHk1OWtweXc5SEVyUGlGMlFaSVJqSnY3?=
 =?utf-8?B?NkNoRDNtemRlczhvKzU3U3FJbHdTUDYyOHZnd1hVMDljRC9CRDFwVjFFYWtH?=
 =?utf-8?B?WHdKbnFuNTYrL1JWaXlNWHVqWitNT2M4bU5qcVZWaWp1bm1aM2JKYmo0R2RH?=
 =?utf-8?B?SUxleUVvaWpKeWFWSEZoaEY1ZEQzV3pyZHVXOG5XL2hhMGFLRUdxaDZNRE91?=
 =?utf-8?B?YmVvaWliMWFTUk9TUkEvU3NFTXdDVmtuRHpOR2F6K3RSRkFDaURlWTUwUzZs?=
 =?utf-8?B?RSt6cHdnSGFwQnA2WnBjRUNKcnBxMlJqMHFnV01HdFNxcnhJd1VuQzY0Rit1?=
 =?utf-8?B?M3UwbDhBcnVqR1V2bXhXUEs0UEVVZnpYaEhTdVRnZXdUK1psRTBkbFpqTUR2?=
 =?utf-8?B?M2FYcWFxZ3IvdGxsTnJpRklkTWhGbzR4RmRMRXZ2NlJFTERuTk5OOGx1c1F4?=
 =?utf-8?B?cHh1ZW5OZFZzRUVLSzAvaEE4Nzh1U09xYVZWK05aS2xOU2hyWG1tL0NWWFhQ?=
 =?utf-8?B?Qk4vWWFJNFBNbzdoTklrKzg0NDZUeVNjTzA3Rk40VmN5a0xseTEvRWhYbG9H?=
 =?utf-8?B?b3BicWZtS01CM2VUVHA3cXBlSVNjYkRLNjhwL2JlcmhIODBxZDVaSnBmSEtr?=
 =?utf-8?B?UmVJbTQxSUpQbXB6NDlocW1ySHp4K2poUm5KRk9ueHRIVjJiaXhiRW1ya0Rx?=
 =?utf-8?B?bFlRRm9vVE9GNEkvbXBUckF0dkVQZjlkVnRlUk5xY1FERWNrUmVHQWkvRVA4?=
 =?utf-8?B?cDhJNG02Y2NTUHN4VmJ6cGMyT3pWRUU1d3JrWlUrOFZ2RjJUUllBVDhMUmky?=
 =?utf-8?B?bDhLbSs2Uzk1MEdSTHhvSkJXcUFaVzB2YXBWZ2FycXNDcGorK1FETXlGY2pa?=
 =?utf-8?Q?Wn6g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF140C267DEE10498C3AA712353EDBCC@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P195MB2328.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 09594395-8995-464a-ae5f-08dd7b4777e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 11:28:24.0602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OAk/3uORwWUqd5lgmCpLz0wHymUCu6wyPyJleKLaQGvZhjDSK63WVBT/8KkEGqt6EWeiirL1tqzxAkGjw/GAVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3P195MB2180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_042832_817949_4A6E485E 
X-CRM114-Status: GOOD (  19.92  )
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

T24gRnJpLCAyMDI1LTA0LTExIGF0IDA3OjI5IC0wNTAwLCBOaXNoYW50aCBNZW5vbiB3cm90ZToN
Cj4gUXVpY2sgbG9vayBjb21tZW50cyBiZWxvdy4NCj4NCj4gT24gMTI6MTAtMjAyNTA0MTEsIERv
bWluaWsgSGFsbGVyIHdyb3RlOg0KPiA+IFRoZSBwaHlDT1JFLUFNNjh4L1REQTR4IFsxXSBpcyBh
IFNvTSAoU3lzdGVtIG9uIE1vZHVsZSkgZmVhdHVyaW5nDQo+ID4gVEkncw0KPiA+IEFNNjh4L1RE
QTR4IFNvQy4gSXQgY2FuIGJlIHVzZWQgaW4gY29tYmluYXRpb24gd2l0aCBkaWZmZXJlbnQNCj4g
PiBjYXJyaWVyDQo+ID4gYm9hcmRzLiBUaGlzIG1vZHVsZSBjYW4gY29tZSB3aXRoIGRpZmZlcmVu
dCBzaXplcyBhbmQgbW9kZWxzIGZvcg0KPiA+IEREUiwNCj4gPiBlTU1DLCBTUEkgTk9SIEZsYXNo
IGFuZCB2YXJpb3VzIFNvQ3MgZnJvbSB0aGUgQU02OHgvVERBNHggKEo3MjFTMikNCj4gPiBmYW1p
bHkuDQo+ID4NCj4gPiBBIHJlZmVyZW5jZSBjYXJyaWVyIGJvYXJkIGRlc2lnbiwgY2FsbGVkIHBo
eUJPQVJELUl6YXIgaXMgdXNlZCBmb3INCj4gPiB0aGUNCj4gPiBwaHlDT1JFLUFNNjh4L1REQTR4
IGRldmVsb3BtZW50IGtpdCBbMl0uDQo+ID4NCj4gPiAgICAgU3VwcG9ydGVkIGZlYXR1cmVzOg0K
PiA+ICAgICAgICogRGVidWcgVUFSVA0KPiA+ICAgICAgICogMnggU1BJIE5PUiBGbGFzaA0KPiA+
ICAgICAgICogZU1NQw0KPiA+ICAgICAgICogMnggRXRoZXJuZXQNCj4gPiAgICAgICAqIE1pY3Jv
IFNEIGNhcmQNCj4gPiAgICAgICAqIEkyQyBFRVBST00NCj4gPiAgICAgICAqIEkyQyBSVEMNCj4g
PiAgICAgICAqIDJ4IEkyQyBHUElPIEV4cGFuZGVyDQo+ID4gICAgICAgKiBMRURzDQo+ID4gICAg
ICAgKiBVU0IgNSBHYml0L3MNCj4gPiAgICAgICAqIFBDSWUNCj4NCj4gQ2FuIHdlIGRyb3AgdGhl
IHdoaXRlc3BhY2UgcHJlZml4Pw0KPg0KPiA+DQo+ID4gRm9yIG1vcmUgZGV0YWlscyBzZWUgdGhl
IHByb2R1Y3QgcGFnZXMgZm9yIHRoZSBTb00gYW5kIHRoZQ0KPiA+IGRldmVsb3BtZW50IGtpdDoN
Cj4gPg0KPiA+IFsxXQ0KPiA+IGh0dHBzOi8vd3d3LnBoeXRlYy5ldS9lbi9wcm9kdWt0ZS9zeXN0
ZW0tb24tbW9kdWxlcy9waHljb3JlLWFtNjh4LXRkYTR4Lw0KPiA+IFsyXQ0KPiA+IGh0dHBzOi8v
d3d3LnBoeXRlYy5ldS9lbi9wcm9kdWt0ZS9kZXZlbG9wbWVudC1raXRzL3BoeWJvYXJkLWl6YXIv
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBEb21pbmlrIEhhbGxlciA8ZC5oYWxsZXJAcGh5dGVj
LmRlPg0KPiA+IC0tLQ0KPg0KPiBDb3VsZCB5b3Ugc2hhcmUgdGhlIGJvb3Rsb2cgaW4gdGhlIGRp
ZmZzdGF0IGFsb25nIHdpdGggb3V0cHV0IG9mDQo+IGRlZmVycmVkX2RldmljZXMgVXNpbmcgdGhl
IGRlZmF1bHQgZGVmY29uZmlnIC0+IEkgd2FudCB0byBtYWtlIHN1cmUNCj4gdGhlcmUgYXJlIG5v
IGRlZmNvbmZpZyB1cGRhdGVzIG5lZWRlZC4NCkknbGwgYWRkIGEgYm9vdGxvZyB1c2luZyB0aGUg
ZGVmYXVsdCBkZWZjb25maWcgdG8gdGhlIHYyIHdpdGggdGhlIHN0eWxlDQpmaXhlcy4NCmRlZmVy
cmVkX2RldmljZXMgaXMgZW1wdHkuDQpQQ0llIGFuZCB0aGUgVE1QMTAyIHRlbXBlcmF0dXJlIHNl
bnNvcnMgYXJlIG5vdCBlbmFibGVkIHdpdGggdGhlDQpkZWZjb25maWcgYXMgb2YgdjYuMTUtcmMx
LiBJIHBsYW4gdG8gc2VuZCBhIHNlcGFyYXRlIHBhdGNoIHdpdGgNCkNPTkZJR19TRU5TT1JTX1RN
UDEwMj1tIGJ1dCBpZiB5b3UgY2FuIHF1ZXVlIHRoYXQgaW4gd2l0aCB0aGUNCmRldmljZXRyZWUg
SSBjYW4gc2ltcGx5IGFkZCB0aGF0IHRvIHRoaXMgc2VyaWVzLg0KDQoNClsuLi5dDQoNCg0KDQo=

