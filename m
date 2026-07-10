Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA99C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 03:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1uLnB5bj2dgLSsp2OXX2Of0g3VIOfE+u3HkCsRrFWU=; b=XvlwuUmKt8lUX+mGTZvGd2xg+x
	l9O+5gje1vcPCaqEm7kG+SbdVnWatTDalhSRbKuBV+yzBVEwbv29Gv+D7jflKLXf2cVa02B4YOhmw
	DgvhtZQzMQVjnzFqU3Xngh66Ip2h3ocvvWK0jCTlTu1I09/41DmSFUXfF9IIaF1LY57/ca/8i3t2G
	H9WzKxJP77ju0L2T0CIKD7aBqURO2jN9lrurz22VK4wQ+gyATn7ooNSZiKJW4ybF5XKCBPPI50OhV
	DpIe0dnfDU5bHSsNmnxJV3gUI2bzr4BAbhppDZDzzMmvtDj7teQ6DV40otByqVEwNieBqA8WwNHbD
	TlNSRWkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi1vP-000000042Q4-1fT0;
	Fri, 10 Jul 2026 03:29:15 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi1vM-000000042Oe-3MIP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 03:29:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGFvC60EkG441sfSOdlWSAFaTzPXAvmYJoCU7iVtwDNtEr/5fzihSQgXkaP6eMfHOF6K7n8eMIFwMXf97yaLfDHw+34/Gotg9QvcBYoT2kBDk6MCT+DVAwPnmmpnLaFAQak1FaYbMK2+POI95GuBpzwGyKgaaAMHumoUFV34jT9EKTuzxi91v8Bpd0DMxxJF/XKvd5BSolCI/w7/bmsEm7eMZztLWZv+I2DuZ4WyFc1bUjnIRqKGA6NxeEFvKeYbb/x+Nm2MOFe6Gw2Wd26WPf6H2lwTF0nMPO+KCtwIS2Lb2qhUaip2/UIgD233UhsnVSgXUrYn9hih8dgjs5bFsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1uLnB5bj2dgLSsp2OXX2Of0g3VIOfE+u3HkCsRrFWU=;
 b=VCGTGBa18fcQy16gaouScN5kgVrquK9SdrPbdlhzBYdXAZUAH3hzyBy1Bd9yA2JRo7a0wk24CsQY1VZjwm7h5h/S8T7hAVAktSzECyJtt6hZoZfs9nRSJzX2o5HqMp2/AVh7afVPp1ZooukfA1cPpalgUsM50peV3346knLOpx1TbRzKGZqrBgoodzKAesbwf4jd6NPNXX4n2j7jND/Q19b32S6jrcgKxkI4zsE/Ny3hBc/Qy2pURjvjQS6gSDKalK6ZQD3AI3JPpR7w4is32nlPgbA0mc7JknYxqXh3dWpG63w+PlNFlV2S3+m0uAS3V8/MxQP6g1FCgwN43wMIvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SG2PR06MB5384.apcprd06.prod.outlook.com (2603:1096:4:1db::13)
 by SEYPR06MB5133.apcprd06.prod.outlook.com (2603:1096:101:59::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 03:28:56 +0000
Received: from SG2PR06MB5384.apcprd06.prod.outlook.com
 ([fe80::7c6e:3b56:77b7:a354]) by SG2PR06MB5384.apcprd06.prod.outlook.com
 ([fe80::7c6e:3b56:77b7:a354%5]) with mapi id 15.21.0181.010; Fri, 10 Jul 2026
 03:28:56 +0000
From: Fugang Duan <fugang.duan@cixtech.com>
To: Peter Chen <peter.chen@kernel.org>, Arnd Bergmann <arnd@arndb.de>
CC: Gary Yang <Gary.Yang@cixtech.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: =?gb2312?B?u9i4tDogW1BBVENIXSBNQUlOVEFJTkVSUzogVXBkYXRlIG1haW50YWluZXIg?=
 =?gb2312?Q?and_git_tree_for_CIX_SoC?=
Thread-Topic: [PATCH] MAINTAINERS: Update maintainer and git tree for CIX SoC
Thread-Index: AQHdBU0CILSDzZ1Oa0iEKyVeDk6+8bZQzeCAgARO2oCAERCrUA==
Date: Fri, 10 Jul 2026 03:28:55 +0000
Message-ID: <SG2PR06MB5384E0065AE40BE256F03FB6F1FD2@SG2PR06MB5384.apcprd06.prod.outlook.com>
References: <20260626092015.1709904-1-gary.yang@cixtech.com>
 <21f81761-ac02-4771-9dfd-38e653d1f74f@app.fastmail.com>
 <akIV3eH0n9kRMNvf@QCOM-gEdNzOMOFu.na.qualcomm.com>
In-Reply-To: <akIV3eH0n9kRMNvf@QCOM-gEdNzOMOFu.na.qualcomm.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR06MB5384:EE_|SEYPR06MB5133:EE_
x-ms-office365-filtering-correlation-id: 1a6d4220-9c21-49be-30fa-08dede335f77
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|38070700021|18002099003|56012099006|4143699003|22082099003;
x-microsoft-antispam-message-info: lA/PsO38aYtOXEOQeRH4OIRdYXdlXs3xyCkNWF35baMlqZM5+4x2TXDXnJ4XxAQopt2GzcHJiMd2RjX8NaQsy2ZhwJ5+3QAQDKJB+joukd2uszGBsyScGgs8cnRwSOkzvYqGS26b99WREAu0CV+JrVTpGOwWZX0eCvEP01YtNNRK0et8wJoNp55dvj3xkETGh5JDL8Iok9DLstWYC4n5WOayag7A6JEmDppqIbnrOAdCLgOqj1I3UNY3HC8n9PiogrrlE2D3RD6lo1wj9BKhZY/VBq2cwSMuYw4J0nAqZKby0BI+GFkv0kPWBQnf6EtRLPucoVEiaEWnpxXu/uw8aTPNFFdDipaPMEIP+EIFOMImtF1N0GB4hQtSAluNjMOJCRduodg1uf3IfXfyguoo8a+oQIftwki/NIS9/EUaHNCc7toq4JP9T3RZlEXr41o2WgFHOIUKZEqO8S31ouYRlIQ2UuSaL/fsy8M5C8UncTrmofUxx7zMMHGkdjKtB+yPBhLxDXgEzB3LsZqd1DdFtKXiFbDSYqzVfaWySMHroiOvA3X2GcRQKBVtbz0lrPL3g6a5m52B2YpAcP/ad0JVYxoP6Dzt3Rx+mHJ1vlhG6UxKnpr5JpSfp5Sysh3SLxsGyEwD1UFtLWO+MqLOFkQCrXKqojcNNeJ5krQmj19v951wDy+a52/3wBWIf1jW2sDxwpAKRi2YXExP69xHJk04Mk0aKOTgZ04j8fjEaxZfg9s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB5384.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(18002099003)(56012099006)(4143699003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?L3FHblZKM290K010dlB5V1AvSWNuQzU2dGtLRG8rR0NINy9mdHV2N24wc0RH?=
 =?gb2312?B?K2svVllEQ3lSWU11OTRxMGdhQjNqUXFTZVlocUlkWXI0RDlJdm5Ic09tcyt4?=
 =?gb2312?B?b2FyRjRjZFFxYm9JMWpGYmtkNVZLUWtUNE9DR0t3V2VkajIrOTZmTUtNQ3dB?=
 =?gb2312?B?RUxpRVlLLzRXdlptZmpQZjY1aXZtcVNIOFdXakN3V1A3M3p6MUhkSGZCRVlU?=
 =?gb2312?B?WHV0RFVYaU1xTGhybjFhNlhNSFdoREpmWU9ZSlRDM1BBMzB0SnBVcjVRbmNE?=
 =?gb2312?B?OTZtU2dBNXo0UkpiNTM5b2RaOSt4MlNnMEdtQzhPL0crR1oyL0E0REFsNUdY?=
 =?gb2312?B?UExwMm9VVElaeDNWdkNmMzZwQkFJMEttdDArbFJpMXFXdjVlQS9WbSswdXdG?=
 =?gb2312?B?dlBrMDFFc3hBcmxPQmZsMWI3RTZuWURpeENJSkVUdi9VTzg0QXZycVozSlRZ?=
 =?gb2312?B?bWlLY1JBYm9ZdnpuOXUvT09wbTFLYzR0Mk1rbC9ELy80TC9tRlBRbTBGQVZR?=
 =?gb2312?B?eTE4bDhYczFmREhFSldrUVFRRFRmekJoK0F4djM1UkNwamhoWWFNN09zZmVL?=
 =?gb2312?B?cmJLTUxDVDBOY1hzekJGQU9IblRGd0JlQUozUDBQWXVleXpGdmhNMG55Vzhv?=
 =?gb2312?B?SXZHK1pkdnVLN2tYbkNRcDNYcTJlNEZYU1djb1lkYmRoVWEvclo2cXRDVnZy?=
 =?gb2312?B?VVl5OGJueWF1VVcrSkd1MksvMjJVQ2lSTGRZMmYxemRiUjcvTVVGbllDTGty?=
 =?gb2312?B?M0dlL0tOZUk1Qko4RnZRd1NSYTcydmF5RzVKckFGMHhVSzFuN2VmemdXZks4?=
 =?gb2312?B?aWJTUndoUTc3L3N5RVpOb0J1djF2RWZldkV3Q3BUcUdEU09QQUFadklrVFJj?=
 =?gb2312?B?WW0ycUVlVnArUXBlZTRQbklFWC9NQ0RlbEoyY0FmMGdhakY0azdUQWJWQWNU?=
 =?gb2312?B?VTJ2K2U2WkpIOVd0K0pvNzB5dHZCVXQrUkpOMElCUjUvUHppZGdTekVIWDBy?=
 =?gb2312?B?SFYzMk51aHVSZDNwOVdmOEQwTUUyUHlIdXhiaEd0TTJzYnlnT2x4S1JLVEJu?=
 =?gb2312?B?dWJiaWZ5UkFQVW1oWTJMUEFjcUNKN0MrRGN3bjM5UkZGTFBHWkIxSGtodFRj?=
 =?gb2312?B?ckpQRjd1RTNuYXV2cFRYTENRVWxMbXUrdk9QZHpMMjVXbE5XcytLQ3dsVFZy?=
 =?gb2312?B?eU55UjFhcDNUclQ2M1E1MURVcnpwTmNBNmdqaHp2aGhHSnZiSnFpc05BczR1?=
 =?gb2312?B?UlBFVSs3OU00SXo5TllnT1FwUjhrSWN1RlJ5VG1qQlNKMEdzSC9VQjlMWmIr?=
 =?gb2312?B?QldDZjExZEpKajdvWnhHdDNjQ2kwUWhhb3Yxc0hvdzB4d0dybTBuanAxUWF6?=
 =?gb2312?B?R0NsZWVoUlJqM21oZkdKd2l0MEY2dVUvbkxqRnVRMVQ3dDcrRlZNaGU4UUxn?=
 =?gb2312?B?Q1JORHQ2RDhXekVobjF3bWlvYm9yMVJocmZGRGNqUHowU1JhZGV6TkMwaXVa?=
 =?gb2312?B?Ym5NVDcxQ1pTcGdtRVIyTmFZNXJRZFZrczMwL3NHZVZnckw5U0hUYlgrWVFs?=
 =?gb2312?B?ZndEN1p4ZGFZaURtMEx6MnoxMm4wZldWK2I3SXdIOUpzZ2VJUUYwbml3YWNL?=
 =?gb2312?B?Y0x0SFVUME1CbUN2Ty9KRHFqaWlNaDlkYWhwNzRnOCtGN2JnZlRHOVphSWhW?=
 =?gb2312?B?bmNTVTZrc0xtTmZtcEw5V0xzNkR6blptRS9JaCtrYkt1ZVZJQ3dRMGpMM1p6?=
 =?gb2312?B?c3dMbThKOVQ4UG85aFF2aGU0NHo2bTI1ZlR1WUZIUXBMWngvUVM4RzkvdFgv?=
 =?gb2312?B?R0pwUFBsQ2IrRHFHK1haKytLeGxRZEIvY3k2cUhzQTlvL2dQWThJKzNqVUpu?=
 =?gb2312?B?N3lybEJVL29xVVJKbFR2VlJvazg5Z2ZGT2UzSTlwTTJ2MmV2MU9nNFZVanoz?=
 =?gb2312?B?NEdUNUp4eTh0RjRaTGt3Y3ZJaldaNW1NNkxZM3h2NmwwUm9rdXV4eHg3SEhP?=
 =?gb2312?B?clBzOVlGa2VUSlFWTWJkMjdtYjVwUm45eTdOTVBmOWhFSThGTFplS0tDSnU3?=
 =?gb2312?B?bkJlMUV3aEpCSHdUdlFTME4yZmQyRk1rNnRCZHUxcVNYcFd6OUVsTm9wdXhC?=
 =?gb2312?B?QVZsdTM2cGNCb1FaU3RkNXE1cUpVcHB2bnBwbWJUREMwTzMzTTRLUFJ3cTE3?=
 =?gb2312?B?d01ZMjlRWFBXajlqZ3liRjhEZ1YyQjdub3l4RzFNQTB1NFJlbEZUeHRPTmJr?=
 =?gb2312?B?QWJIWmkvVHpqS3NKc1NEbUloWFlCa05Pa0xTMzcwcHVQdlNjdVJ2UDdwU0dq?=
 =?gb2312?B?QmZCazMwcVZ5K05zWlZvNjYrY1krRlFUQ244QjNDTWxJenJ4L2pYUT09?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB5384.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6d4220-9c21-49be-30fa-08dede335f77
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2026 03:28:55.9488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PHPiL+0B3JQhTqvc86lUuT+1VU33/wUlmhENTw4tGPAFc2+pQMdRaZalX63c2UDlFY0GpRySCZpjHeJVoF+BMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_202912_843612_B583FD19 
X-CRM114-Status: GOOD (  18.59  )
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

t6K8/sjLOiBQZXRlciBDaGVuIDxwZXRlci5jaGVuQGtlcm5lbC5vcmc+ILeiy83KsbzkOiAyMDI2
xOo21MIyOcjVIDE0OjUxDQo+T24gMjYtMDYtMjYgMTU6MDM6NTMsIEFybmQgQmVyZ21hbm4gd3Jv
dGU6DQo+PiBPbiBGcmksIEp1biAyNiwgMjAyNiwgYXQgMTE6MjAsIEdhcnkgWWFuZyB3cm90ZToN
Cj4+ID4gUGV0ZXIgQ2hlbiBoYXMgbGVmdCBDSVggVGVjaG5vbG9neS4gVGFrZSBvdmVyIG1haW50
ZW5hbmNlIG9mIHRoZSBDSVgNCj4+ID4gU29DIGFuZCBVcGRhdGUgdGhlIGdpdCB0cmVlIFVSTCBh
Y2NvcmRpbmdseS4NCj4+ID4NCj4+ID4gU2lnbmVkLW9mZi1ieTogR2FyeSBZYW5nIDxnYXJ5Lnlh
bmdAY2l4dGVjaC5jb20+DQo+PiA+IFJldmlld2VkLWJ5OiBGdWdhbmcgRHVhbiA8ZnVnYW5nLmR1
YW5AY2l4dGVjaC5jb20+DQo+Pg0KPg0KPkFja2VkLWJ5OiBQZXRlciBDaGVuIDxwZXRlci5jaGVu
QGtlcm5lbC5vcmc+DQo+DQo+UGV0ZXINCg0KRGVhciBBcm5kLCANCg0KVGhhbmsgeW91IGZvciB5
b3VyIHJldmlldyBhbmQgY29tbWVudHMuDQpSZWdhcmRpbmcgeW91ciBwb2ludCBhYm91dCBtYWlu
dGFpbmVyc2hpcCBiZWluZyB0aWVkIHRvIHRoZSBwZXJzb24gcmF0aGVyIHRoYW4gZW1wbG95ZXIs
IHdlIGZ1bGx5IGFncmVlLg0KUGV0ZXIgaGFzIHBlcnNvbmFsbHkgYWdyZWVkIHRvIHRoZSB0cmFu
c2ZlciBhbmQgcHJvdmlkZWQgaGlzIGFjay4NCg0KSWYgdGhlcmUgYXJlIGFueSBmdXJ0aGVyIGNv
bmNlcm5zLCBwbGVhc2UgbGV0IHVzIGtub3cuIFdlIGhvcGUgdGhpcyBwYXRjaCBjYW4gYmUgbWVy
Z2VkLCB0aGFua3MuDQoNClRoYW5rcywNCkZ1Z2FuZw0KDQo+PiBUaGlzIG9idmlvdXNseSBuZWVk
cyBhbiBBY2sgZnJvbSBQZXRlci4gSSBhc3N1bWUgaGUncyBvayB3aXRoIHRoZQ0KPj4gY2hhbmdl
LCBidXQgeW91IHNob3VsZCBkb2N1bWVudCB0aGF0IHNpbmNlIG1haW50YWluZXJzaGlwIGlzIHRp
ZWQgdG8NCj4+IHRoZSBwZXJzb24gYnkgZGVmYXVsdCByYXRoZXIgdGhhbiB0aGVpciBlbXBsb3ll
ci4NCj4+DQo+PiBJJ3ZlIGFkZGVkIHBldGVyLmNoZW5Aa2VybmVsLm9yZyB0byBDYywgaG9wZWZ1
bGx5IHRoaXMgZm9yd2FyZHMgdG8gYQ0KPj4gY3VycmVudCBhZGRyZXNzLg0KPj4NCj4+ICAgICAg
IEFybmQNCj4+DQo+PiA+IC0tLQ0KPj4gPiAgTUFJTlRBSU5FUlMgfCA0ICsrLS0NCj4+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+PiA+DQo+PiA+
IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTIGluZGV4DQo+PiA+IDJmYjFj
NzVhZmQxNi4uMTdiMzcwNGJiY2RlIDEwMDY0NA0KPj4gPiAtLS0gYS9NQUlOVEFJTkVSUw0KPj4g
PiArKysgYi9NQUlOVEFJTkVSUw0KPj4gPiBAQCAtMjY5MiwxMiArMjY5MiwxMiBAQCBGOiAgYXJj
aC9hcm0vbWFjaC1lcDkzeHgvDQo+PiA+ICBGOiBkcml2ZXJzL2lpby9hZGMvZXA5M3h4X2FkYy5j
DQo+PiA+DQo+PiA+ICBBUk0vQ0lYIFNPQyBTVVBQT1JUDQo+PiA+IC1NOiBQZXRlciBDaGVuIDxw
ZXRlci5jaGVuQGNpeHRlY2guY29tPg0KPj4gPiArTTogR2FyeSBZYW5nIDxnYXJ5LnlhbmdAY2l4
dGVjaC5jb20+DQo+PiA+ICBNOiBGdWdhbmcgRHVhbiA8ZnVnYW5nLmR1YW5AY2l4dGVjaC5jb20+
DQo+PiA+ICBSOiBDSVggTGludXggS2VybmVsIFVwc3RyZWFtIEdyb3VwDQo+PiA+IDxjaXgta2Vy
bmVsLXVwc3RyZWFtQGNpeHRlY2guY29tPg0KPj4gPiAgTDogbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnIChtb2RlcmF0ZWQgZm9yDQo+PiA+IG5vbi1zdWJzY3JpYmVycykNCj4+
ID4gIFM6IE1haW50YWluZWQNCj4+ID4gLVQ6IGdpdA0KPj4gPiBnaXQ6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcGV0ZXIuY2hlbi9jaXguZ2l0DQo+PiA+ICtUOiBn
aXQgaHR0cHM6Ly9naXRodWIuY29tL2NpeHRlY2gvbGludXgtbWFpbmxpbmUuZ2l0DQo+PiA+ICBG
OiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2NpeC55YW1sDQo+PiA+ICBG
OiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWFpbGJveC9jaXgsc2t5MS1tYm94
LnlhbWwNCj4+ID4gIEY6IGFyY2gvYXJtNjQvYm9vdC9kdHMvY2l4Lw0KPj4gPiAtLQ0KPj4gPiAy
LjUwLjENCj4NCj4tLQ0KPg0KPlRoYW5rcywNCj5QZXRlciBDaGVuDQo=

