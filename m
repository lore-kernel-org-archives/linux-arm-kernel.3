Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB66CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 03:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9mCSqQP2YYT8qCG0rQBCkYeWUrHd/3jO9Wnyf0M+Ia0=; b=AALJLXfk6gm7D65H/7Ju+ah9jr
	yFI9QzdDi6/9Gpc/ywI6Uor+g8/AQND/s8UJIW1fPWnBA42sERA/B33OV6dsxvRzI/JsTas7+Xwth
	/ebgSTRNjx3vL+4HAT1QrglZXpQsZLhDTrjyEbXHNB1u3c4bsFHfADY1lTiVy4KfaDGEBCOmhoFK8
	6xa3Hod4gxHoFQ/ytGlHEoYkUSZ/hpx8L8CMLhZGYlxFHP3/KFBeyGqmxufhipgJTyJ1oMKKh7UBz
	VZpkcEnO7KMdx7gtEcOLmi1a6/+CdGCmpgSVEkO85MO3bUJdumanjg6dpLYJ/19/P9B6O6LYmoZG2
	DEOswP6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPuMR-00000002quo-0abL;
	Mon, 01 Dec 2025 03:13:59 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPuMO-00000002quH-1mpl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 03:13:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NNA4fi+VN0Iv5aQNTcBVrj4lXHVwzugMASxOkRHA7CuzrHCa6SVAdPcbGTMlyc1nKLxxcwTt8keGRuREmdTXA8GFlv0B5rIwkUmhlmO6etPqyMEtuzWLK99wW10BT/G7sTk5cgIJF4iKId3V4tf5IEhwba9AO1Mjurs75xc1WijrIs9VtsvzWaZEsG6z/EzGiKLSdCBB/avoWdEEcAR4apm39rRUqT5nSpRJvMTFZx6kRASf8OwB6O+kq9L0KdVpVaW+rcgvs+QKqHkNcu00Sd/YkfFFT4n8H2UIBD3heRRlNAb3ofbUrGgZNNjKKwVZNR+VYTIDS4Jhnq+9U9hG9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mCSqQP2YYT8qCG0rQBCkYeWUrHd/3jO9Wnyf0M+Ia0=;
 b=w7bLZJEEzsuAeJHTh6KBbgV/jHsSSJFbm68Bwip/yrCBtBJmPrgXC67zU/9XjGMni/Dnl7pl3JPq3FEEYJYwUPcMObQ3T85ANpW2tlHAMoNM3CLcTUXMX3zLc1mIWbExhRvqFCkoe3s79xqyxwkHUPf34QKSFhpFKUI5oHi5LjXbMV9ffFHoyta9dc9HWCpG32EXrU466tS+n/nKcBH7Th/z1v6O0JUvV3TuV4rPlhYUKHn4QvPgemL9zU0YKisom2I9BsccXIaH1tlwFysRGigAj7HfhZIrlYbuwp1AlbRRh98rKqaPmIHv6+w0BvNyOocOSg2rJGnjqJTFFlzWwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by SEZPR06MB6087.apcprd06.prod.outlook.com (2603:1096:101:e7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Mon, 1 Dec
 2025 03:13:45 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d%3]) with mapi id 15.20.9366.009; Mon, 1 Dec 2025
 03:13:45 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Conor Dooley <conor@kernel.org>
CC: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: =?utf-8?B?5Zue5aSNOiDlm57lpI06IFtQQVRDSCB2MyAxLzNdIGR0LWJpbmRpbmdzOiBy?=
 =?utf-8?Q?eset:_add_sky1_reset_controller?=
Thread-Topic: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjMgMS8zXSBkdC1iaW5kaW5nczogcmVzZXQ6IGFk?=
 =?utf-8?Q?d_sky1_reset_controller?=
Thread-Index: AQHcXQwhfNCb98lfBUeduaIW5fDwVrUCPheAgAEy2aCAAebuAIAGzwlw
Date: Mon, 1 Dec 2025 03:13:44 +0000
Message-ID: <PUZPR06MB58873EBA3818208D061FF866EFDBA@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20251124063235.952136-1-gary.yang@cixtech.com>
 <20251124063235.952136-2-gary.yang@cixtech.com>
 <20251124-selector-blemish-ec6e9a356bc6@spud>
 <PUZPR06MB5887CB84BC4D006EC594B654EFD1A@PUZPR06MB5887.apcprd06.prod.outlook.com>
 <20251126-dreamily-shorty-cb543d993e7a@spud>
In-Reply-To: <20251126-dreamily-shorty-cb543d993e7a@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|SEZPR06MB6087:EE_
x-ms-office365-filtering-correlation-id: c0eb60f2-246a-490c-a137-08de3087a32e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?bTJYdUlKeXpudWJWVlZUSHdib3RldUVDRWpCZ3ZYOVB4ZG5maDNxL1lQRStV?=
 =?utf-8?B?TzVIRGZQYzl0MlBleHhEZUNZbXpndDkra3E4N1RKWkM0MXgzR1V3NjVJd0RF?=
 =?utf-8?B?dS9sRE1xUGxDdUtVU2s3OWN3OWZCNEV4Mi9nZWZUYzZ0TDNES1ZlMXc4ZVV5?=
 =?utf-8?B?U1dZN21nWE04UGE4UnJycEZHRUVMcHVSOE1OWU9qNDVxR01OY1pHYnZSSFdW?=
 =?utf-8?B?UWhQNnpCS3RLbUEycUJ2VUhUcWdxNmIwUkt0YzcrNWxPTlZzZGM5aWlKR2tK?=
 =?utf-8?B?K0ppdDdUV3JhbG1kTEQrV3VTTHJrV1VWeEs3WUtuN2pyQWFJWThMUG02bmc2?=
 =?utf-8?B?Y2FDN1Z5azZJWTdHNnhEeWhvaTBEUDNOZERtVENvSDhOVFNVY0F4M2FKR1Vu?=
 =?utf-8?B?dnBycWJLWkU1ZlVNb2lNRmM3dnBiTjROV3lqS2NNY1hzalpvQWtRQUNiYjZU?=
 =?utf-8?B?WmRIckdnZE9NQlZKUGd3RE9vSWRBMnF2K3NYL0p1RVgzQjczSDZzaDhqRDQx?=
 =?utf-8?B?NE40MGN0QTZyajB0NTA5cU9BNjdjWGV2b0tLc0NHc2NRUnNlYmhJVnVDZDNW?=
 =?utf-8?B?OFVMbFRKOXZDTXhUODlwQ3IxTFVndmMwYW80Y0pIbjVHNkFGQ2dZL3kzb1N3?=
 =?utf-8?B?VVJsTkI1WUdOWU13ZFMrbWo2T1NsS0FmK3RxVktRSGVvRmxvcDVBZzVqVWsy?=
 =?utf-8?B?NlpaM25PSkxvSlk1OEhqWTEyNU4yaTZ6TmVnYWVpbnU5cHhzUWR3aGx1U1ZG?=
 =?utf-8?B?YjZaUVhoeDVCaHB4VGJLeXl2OFl5MXo2R2RYL01oRndQUzkwQ21MYWtuVzNP?=
 =?utf-8?B?c2lzWTQ5WTVseHFBM044Qm5TdmlEK2E2eHVSWWxDRTZtZmE5UnVWTmloZVBS?=
 =?utf-8?B?ZkJ1OW5QTUJPSWRwUUZ4eHNueXpRZjBlVU9rTFBod2RONWxScXFoTEhlNHJp?=
 =?utf-8?B?bXAzMXRFN21wVm1WVFpXbVRNUmVKL0JSM2JsQ0RGdmhXVm04S3d3eEpGbGJP?=
 =?utf-8?B?SW5yOENOWW5GL3MwWkFOOXBESDlHeWJwRHlvbWw3Z21CV1JRMTJ6UUFPVXRl?=
 =?utf-8?B?bE5xa01pYnhwbjM4eGhQaGZrOVZmRmJGb216RENiWWRTS0crL1RYRjBEY2dV?=
 =?utf-8?B?dUpadDI5UnRHNGFscExIM3Vsck9pSFR1OHB4SUtkRURrN0hkb0lMeDQ0a1ZQ?=
 =?utf-8?B?V1pFUkN6T3ZOeW5vdW5JYStiNFFBY1grckNxc1VvMWljYWRiSDljSFZNUkhH?=
 =?utf-8?B?dGovWTZISnVINThCTWgxaEMwbEJUN0EwSmpRYkJBNUN6bmFrOEdRcHFGcXZI?=
 =?utf-8?B?eEJqZktuRnpnMXpOOVJYcGNKbldjYlliTGFoTnhndDFZdDBYRGtqSmhMdHps?=
 =?utf-8?B?SWk4M25rdHhFdjZ4ckpJOXNDQ0tiYUd4MHhGOGpITlhYWGdubytWa0NkOG0x?=
 =?utf-8?B?Qkg2R25uVmhzcUU1dkxaVjhOaXVZa25XZnpNUHMrOEErTUxmMk82NmhlOWpp?=
 =?utf-8?B?UEFja3IrcXMySHhQWlFRSDd6ckVaUlI3QWVwd2s3VmJsVlRsMElkeDhsWGYr?=
 =?utf-8?B?Mk5hTE1Cek81RzBqaE9HbGhLK1J0WFQ4bU5TRDRaQm52cDNGMmhMUkpWNWtk?=
 =?utf-8?B?S0xQdy9MeCthQ1lIV3RXNW1JVzBZWEkrNmRLS21LL05EWFpDVXF1YjFvbXlB?=
 =?utf-8?B?ZkU2SmN6RGFCcm44aVYxdkF6dzl0UWZjTURXNTl4dER3cjBUVFhVY1FRbDNO?=
 =?utf-8?B?cjZRckd1WW9kT1RSdkZoQTRNd1JQSUR1RnBWN1k3T3Y1WE1JY0NtRjh2elRu?=
 =?utf-8?B?U01SQS9QanNYUlUrUkpETVJwNk15VDBlVFFUV08zSmd1Zytad3F1UFlpV3Ev?=
 =?utf-8?B?Q1VLZjlzRGxVSEhselZNTzNFQXZ3S0ZJKzhzd2lldkxCMmN3V05IOUdOY0lr?=
 =?utf-8?B?cEs4Y0tDSHR4bG9jaDhOUE8wQWpnWFNCZVpaSXF2VkZtK1dzSFNXZXY3MmtV?=
 =?utf-8?B?S2NUL29YcEhRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEpjcUltMWxIYW5adm1tNEN3MzlVUy9xYld4cmhEZzkvdUp4b1J2VTBaY1BJ?=
 =?utf-8?B?ai9aZHRZRWlMVDRxY016aEtJL1FyMVVjU2xlVW9wS09pMnF5bGNveHMxSGt3?=
 =?utf-8?B?WjJEcmJwbW1RWnR2L3p1RWt6MHU5VWFwaTFEUkprQStzYklqRXA2dmZYdGhL?=
 =?utf-8?B?aHNlSHdmTTlWNmxsVlJDMmJFT1EwckNGeUtRa1RHM3NNV2Z6V0VOdFQxaWlP?=
 =?utf-8?B?SkFYaHN0eDhWOGp0QmtucVVka0V2ODFYcmlNWTBOVnA5cWcrZUxnT0l2T0ZR?=
 =?utf-8?B?YmZkN3dGNXFJamo1WUtzd3RtMjJVVFk4bDFCUDEvYW5yQmhqOU5MNThxV1du?=
 =?utf-8?B?TzU4VGszQ200Z0FCcDh1azljQ3MzRTdpSU1rV3M5TDlVZ3Nha25VemVHWFp3?=
 =?utf-8?B?VkFLUnAwWDFMUzhHNVl4U2RIVmJ0MTBnMzMzUEIycE90VlBXaFdPK2pkMDla?=
 =?utf-8?B?Q2pLK1IxR2M4TTNQamZCa2tnWms5VzNMbXhQZEp2MlErMjY5dmR5WkxhTk55?=
 =?utf-8?B?SW5qZDVLV2g3ZXRxNzhNclpVQWdGUXhBVlJvMWJJclpNSkxjNHNOMjc5ZmFR?=
 =?utf-8?B?eDFhYTI0UEJMWStoQmtJUjYwdUNDaWxhbXN0SW5DUnRXcnd6SVJ3VnpocU84?=
 =?utf-8?B?am9iQWc1Vyt0aEs4K0ZYM0Zac2FzT0Y1eXE2cVBnSmcyeHlSUDBPYjYwWVh5?=
 =?utf-8?B?NHo2N0dmQTRPQXVYWmMybUJPZERLT3lVRU9mMTJ0aThXVE0xQVc1V0ZEc3p6?=
 =?utf-8?B?M3B5TFhYbzV3enQ2d0FWZFFUWjhxaHNHV2xzMy8wdys0KzAycXJqamVKZWVv?=
 =?utf-8?B?Nng2dTNWSHBVK2dSUFovWGJEeDVFalpDYmtkVWZLc0JqY283aFNoVkc0cU1r?=
 =?utf-8?B?bFZ5WGdURE1xZzMwbUc2UDFsa0ZuRGU5c1lTRG1Hd0hLbmc4cHFaVnhSc1Bv?=
 =?utf-8?B?cnRYMlJrMjBPMFZ5L21DclBDMU5IZlp3TkY0MUtLZDZ3aXptZ2RkUWRJcTBW?=
 =?utf-8?B?eHRnWDNUWnBrV2pqRU1VWjdHN05IRERETUxJeW5NRmM5ejBiMnRwbjM3LzRK?=
 =?utf-8?B?MDFBUUdjb1IxZXJ6RlU4dGpwVDNhY2NCZUZKVldNaFlYQ2c3S1RIczI3c0xX?=
 =?utf-8?B?MDZwUk44R05oeFpFM203NTN1R3p1Q0xSUEdpUW83Ly83aXRDSWJqMEMveTRU?=
 =?utf-8?B?WWVaQXlRZmUzWldCWEFISzVtaDROTDB0UlBVQjAxTm1sZ0s3dkJEbTVrdHVq?=
 =?utf-8?B?bDVnRDBTaWNVVlNFOFFNTkRnNGxmaVBEYjlET2R4RXBFTk4yM3ZrRlMrVUc4?=
 =?utf-8?B?WkdCbEF4SWJBaFg0Y3I2d3B6dWVFRkxKdEVPNC82M0xjTXo2VG8yeDMyRXQ2?=
 =?utf-8?B?eXRkcytYWWoycnJKUEEwdWNqemFPRnpQcTFjRkdvYWN5a0dwTGtjV0pKVGlu?=
 =?utf-8?B?QS8vM1o2dGFnZkZLYThBZHN0S1hrTDUyQlZNc2ZaWXNidWlXdEs3bUZ1cHNJ?=
 =?utf-8?B?SmZwdi9WNDlEZ2VEK2pyRFFpNDFSeTIweXQwZnVHeHpjVkxNZTZWSEErYith?=
 =?utf-8?B?TDl0dktBNzJqVzJQQ3JYMDYvcXBESnFzdlRxYW04SVlucmREbzN6SWtUSjN2?=
 =?utf-8?B?MlpVNmVTMmpudGNGZ2dUb3FXWDNmclhZSGpPTFprb1JaVWtQQjhpZDU4Q2xT?=
 =?utf-8?B?Nm51V21jSmZ1QUdPRkpQQ3lPOGFZMDcvWXRrWWV0eE0yVkNBWGlET0ZRTklT?=
 =?utf-8?B?MTBIN0lUd0lKbnNFRXpKdzFRSTQ1U0hNQk1JQUhNSXc0QjFUSEJObm0rck5C?=
 =?utf-8?B?bWtOSXVaTXMvbFRsME1rNmRjbVJ6c0dtYTE2UWZ3b05pcWVIMnFFa2p6cWdp?=
 =?utf-8?B?RVJ2ZDA5RW5taEF5SWw1NVBvMzVENFQ4UGhTYnFyM1lOd3FMQWVXY1Mza2Er?=
 =?utf-8?B?bzlCd3poV3RvaG0wVWtIMWg2Mi9NYzh2STJsR2R2aEVQNXliNEswaVRyMTVU?=
 =?utf-8?B?Ri9SMnBwUk82eVF5NTg5VU1ERUMwMS9mVXEwS3pJTkhka3ViSUI1ZFdsQTdr?=
 =?utf-8?B?eW16YjlvZVRmMWdkWGxKOWVpUlhnYkNxOEl2ZFMzbDFRVkxNSFRROGtEb0sw?=
 =?utf-8?Q?NDUa6i/dwiljPv+jkv923J/Yn?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5887.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0eb60f2-246a-490c-a137-08de3087a32e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 03:13:44.9478
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KqjiGV1zi1oRo3UJADxyO2hCKDNkgZaaO3NTXPSzOBHMU1XUyNsJ///Pr7Hzrb0ZARp40LD80YZCDcfpgQuODw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_191356_580412_7DB73615 
X-CRM114-Status: GOOD (  28.94  )
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

SGkgQ29ub3I6DQoNClRoYW5rcyBmb3IgeW91ciBjb21tZW50cy4NCg0KPiAtLS0tLemCruS7tuWO
n+S7ti0tLS0tDQo+IOWPkeS7tuS6ujogQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPg0K
PiDlj5HpgIHml7bpl7Q6IDIwMjXlubQxMeaciDI35pelIDM6MTUNCj4g5pS25Lu25Lq6OiBHYXJ5
IFlhbmcgPGdhcnkueWFuZ0BjaXh0ZWNoLmNvbT4NCj4g5oqE6YCBOiBwLnphYmVsQHBlbmd1dHJv
bml4LmRlOyByb2JoQGtlcm5lbC5vcmc7IGtyemsrZHRAa2VybmVsLm9yZzsNCj4gY29ub3IrZHRA
a2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4g
Y2l4LWtlcm5lbC11cHN0cmVhbSA8Y2l4LWtlcm5lbC11cHN0cmVhbUBjaXh0ZWNoLmNvbT4NCj4g
5Li76aKYOiBSZTog5Zue5aSNOiBbUEFUQ0ggdjMgMS8zXSBkdC1iaW5kaW5nczogcmVzZXQ6IGFk
ZCBza3kxIHJlc2V0IGNvbnRyb2xsZXINCj4gDQo+IE9uIFR1ZSwgTm92IDI1LCAyMDI1IGF0IDAy
OjEyOjIzUE0gKzAwMDAsIEdhcnkgWWFuZyB3cm90ZToNCj4gPiBIaSBDb25vcjoNCj4gPg0KPiA+
IFRoYW5rcyBmb3IgeW91ciBjb21tZW50cw0KPiA+DQo+ID4gPiAtLS0tLemCruS7tuWOn+S7ti0t
LS0tDQo+ID4gPiDlj5Hku7bkuro6IENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4NCj4g
PiA+IOWPkemAgeaXtumXtDogMjAyNeW5tDEx5pyIMjXml6UgMzo1NA0KPiA+ID4g5pS25Lu25Lq6
OiBHYXJ5IFlhbmcgPGdhcnkueWFuZ0BjaXh0ZWNoLmNvbT4NCj4gPiA+IOaKhOmAgTogcC56YWJl
bEBwZW5ndXRyb25peC5kZTsgcm9iaEBrZXJuZWwub3JnOyBrcnprK2R0QGtlcm5lbC5vcmc7DQo+
ID4gPiBjb25vcitkdEBrZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4g
PiA+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZzsNCj4gPiA+IGNpeC1rZXJuZWwtdXBzdHJlYW0gPGNpeC1rZXJuZWwtdXBz
dHJlYW1AY2l4dGVjaC5jb20+DQo+ID4gPiDkuLvpopg6IFJlOiBbUEFUQ0ggdjMgMS8zXSBkdC1i
aW5kaW5nczogcmVzZXQ6IGFkZCBza3kxIHJlc2V0IGNvbnRyb2xsZXINCj4gPiA+DQo+ID4gPiBP
biBNb24sIE5vdiAyNCwgMjAyNSBhdCAwMjozMjozM1BNICswODAwLCBHYXJ5IFlhbmcgd3JvdGU6
DQo+ID4gPiA+IFRoZXJlIGFyZSB0d28gcmVzZXQgY29udHJvbGxlcnMgb24gQ2l4IHNreTEgU29j
Lg0KPiA+ID4gPiBPbmUgaXMgbG9jYXRlZCBpbiBTMCBkb21haW4sIGFuZCB0aGUgb3RoZXIgaXMg
bG9jYXRlZCBpbiBTNSBkb21haW4uDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEdh
cnkgWWFuZyA8Z2FyeS55YW5nQGNpeHRlY2guY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIC4u
Li9iaW5kaW5ncy9yZXNldC9jaXgsc2t5MS1yc3QueWFtbCAgICAgICAgICB8ICA1MCArKysrKysN
Cj4gPiA+ID4gIGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvY2l4LHNreTEtcnN0LWZjaC5oICB8
ICA0MiArKysrKw0KPiA+ID4gPiAgaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9jaXgsc2t5MS1y
c3QuaCAgICAgIHwgMTY0DQo+ICsrKysrKysrKysrKysrKysrKw0KPiA+ID4gPiAgMyBmaWxlcyBj
aGFuZ2VkLCAyNTYgaW5zZXJ0aW9ucygrKSAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gPiA+IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZXNldC9jaXgsc2t5MS1yc3QueWFtbA0K
PiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvY2l4
LHNreTEtcnN0LWZjaC5oDQo+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1i
aW5kaW5ncy9yZXNldC9jaXgsc2t5MS1yc3QuaA0KPiA+ID4gPg0KPiA+ID4gPiBkaWZmIC0tZ2l0
DQo+ID4gPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2V0L2NpeCxz
a3kxLXJzdC55YW1sDQo+ID4gPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3Jlc2V0L2NpeCxza3kxLXJzdC55YW1sDQo+ID4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+
ID4gPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uYTI4ZjkzOGEyODNkDQo+ID4gPiA+IC0tLSAvZGV2
L251bGwNCj4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jl
c2V0L2NpeCxza3kxLXJzdC55YW1sDQo+ID4gPiA+IEBAIC0wLDAgKzEsNTAgQEANCj4gPiA+ID4g
KyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNl
KSAlWUFNTA0KPiA+ID4gPiArMS4yDQo+ID4gPiA+ICstLS0NCj4gPiA+ID4gKyRpZDogaHR0cDov
L2RldmljZXRyZWUub3JnL3NjaGVtYXMvcmVzZXQvY2l4LHNreTEtcnN0LnlhbWwjDQo+ID4gPiA+
ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMN
Cj4gPiA+ID4gKw0KPiA+ID4gPiArdGl0bGU6IENJWCBTa3kxIFJlc2V0IENvbnRyb2xsZXINCj4g
PiA+ID4gKw0KPiA+ID4gPiArbWFpbnRhaW5lcnM6DQo+ID4gPiA+ICsgIC0gR2FyeSBZYW5nIDxn
YXJ5LnlhbmdAY2l4dGVjaC5jb20+DQo+ID4gPiA+ICsNCj4gPiA+ID4gK2Rlc2NyaXB0aW9uOiB8
DQo+ID4gPiA+ICsgIENJWCBTa3kxIHJlc2V0IGNvbnRyb2xsZXIgY2FuIGJlIHVzZWQgdG8gcmVz
ZXQgdmFyaW91cyBzZXQgb2YNCj4gcGVyaXBoZXJhbHMuDQo+ID4gPiA+ICsgIFRoZXJlIGFyZSB0
d28gcmVzZXQgY29udHJvbGxlcnMsIG9uZSBpcyBsb2NhdGVkIGluIFMwIGRvbWFpbiwNCj4gPiA+
ID4gK3RoZSBvdGhlcg0KPiA+ID4gPiArICBpcyBsb2NhdGVkIGluIFM1IGRvbWFpbi4NCj4gPiA+
ID4gKw0KPiA+ID4gPiArICBTZWUgYWxzbzoNCj4gPiA+ID4gKyAgLSBpbmNsdWRlL2R0LWJpbmRp
bmdzL3Jlc2V0L2NpeCxza3kxLXJzdC5oDQo+ID4gPiA+ICsNCj4gPiA+ID4gK3Byb3BlcnRpZXM6
DQo+ID4gPiA+ICsgIGNvbXBhdGlibGU6DQo+ID4gPiA+ICsgICAgaXRlbXM6DQo+ID4gPiA+ICsg
ICAgICAtIGVudW06DQo+ID4gPiA+ICsgICAgICAgICAgLSBjaXgsc2t5MS1yc3QNCj4gPiA+ID4g
KyAgICAgICAgICAtIGNpeCxza3kxLXJzdC1mY2gNCj4gPiA+DQo+ID4gPiBZb3UndmUgbm90IGFk
ZHJlc3NlZCBteSB2MiBjb21tZW50YXJ5Og0KPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsLzIwMjUxMTE0LXByb2JsZW0tb3ZlcmJvb2stMzgzZjhlNDVjZDBiQHMNCj4gPiA+IHB1ZA0K
PiA+ID4gLw0KPiA+ID4gSSBhc2tlZCB3aGF0IGVsc2UgdGhlIGRldmljZSBkb2VzLCBidXQgeW91
IGRpZG4ndCBhbnN3ZXIgbWUuDQo+ID4gPiBEcm9wcGluZyB0aGUgc3lzY29uIGRvZXNuJ3QgbWFr
ZSBzZW5zZSBpZiB0aGUgZGV2aWNlIGdlbnVpbmVseSBoYXMgb3RoZXINCj4gZnVuY3Rpb25zLg0K
PiA+ID4NCj4gPg0KPiA+IEZpcnN0IEknbSBzb3JyeSBmb3Igbm90IHJlc3BvbmRpbmcgeW91ciBx
dWVzdGlvbnMgZWFybGllci4gV2UgYWdyZWUgdGhlIGZhY3QNCj4gdGhlIHJlZ2lzdGVyIHNwYWNl
IG9mIHJlc2V0IHNob3VsZCBub3QgZGVwZW5kcyBvbiBvdGhlciBtb2R1bGVzLg0KPiA+IFdlIGZv
dW5kIHRoYXQgd2hpbGUgdGhlIHJlc2V0IHJlZ2lzdGVyIHNwYWNlcyBvbiB0aGUgc2t5MSBwbGF0
Zm9ybSBhcmUNCj4gbm9uLWNvbnRpZ3VvdXMsIGEgc3BlY2lmaWMgcmVnaXN0ZXIgc3BhY2UgYW1v
bmcgdGhlbSBpcyBleGNsdXNpdmVseSB1c2VkIGJ5DQo+IHJlc2V0Lg0KPiA+IFNvIHdlIGNhbiBy
ZW1vdmUgc3lzY29uIHByb3BlcnR5IGFuZCBzcGxpdCBzZXJ2YWwgcmVnaXN0ZXIgc3BhY2VzLiBB
bGwgcmlnaHQ/DQo+IA0KPiBObywgbm90IGFsbCByaWdodCwgc29ycnkuDQo+IEl0J3MgcGVyZmVj
dGx5IG9rYXkgZm9yIHNvbWUgcmVnaW9uIHRvIGRvIG11bHRpcGxlIHRoaW5ncywgbW9zdCBTb0Nz
IGhhdmUNCj4gbXVsdGlwbGUgcmVnaW9ucyBleGFjdGx5IGxpa2UgdGhpcy4NCj4gVGhlIG5vcm1h
bCB0aGluZyB0byBkbyBpcyB0byB0cmVhdCB0aGVzZSByZWdpb25zIGFzIGEgc3lzY29uIGxpa2Ug
eW91ciBlYXJsaWVyDQo+IHZlcnNpb24gZGlkLiBUaGUgcHJvYmxlbSB3aXRoIHlvdXIgdjEgd2Fz
IHRoYXQgeW91IGNhbGxlZCB0aGUgd2hvbGUgdGhpbmcgYQ0KPiByZXNldCwgd2hlbiBpdCBpc24n
dCBqdXN0IHRoYXQuDQo+IFRoZXJlJ3MgcGxlbnR5IG9mIGV4YW1wbGVzIHVzaW5nIG1mZCBmb3Ig
aG93IHRoZXNlIGtpbmRzIG9mIGRldmljZXMgYXJlDQo+IGhhbmRsZWQgaW4gdGhlIGtlcm5lbC4g
VGhlcmUncyBzb21lIHVzaW5nIHRoZSBzaW1wbGUtbWZkIGNvbXBhdGlibGUsIHdoaWNoIGlzDQo+
IGZvciB3aGVuIHRoZXJlIGFyZSBzdWJkZXZpY2VzIHdpdGggdGhlaXIgb3duIG5vZGVzIGFuZCBv
dGhlciBkZWZpbmluZw0KPiBtZmRfY2VsbHMgYW5kIGNhbGxpbmcgbWZkX2FkZF9kZXZpY2VzKCkg
d2hlbiB0aGUgc3ViZGV2aWNlcyBkbyBub3QgaGF2ZQ0KPiBlbm91Z2ggY29tcGxleGl0eSBmb3Ig
YSBub2RlIChsaWtlIHlvdXIgcmVzZXQgY29udHJvbGxlciB0aGF0IGhhcyBvbmUgcHJvcGVydHkN
Cj4gYW5kIGlzIHVubGlrZWx5IHRvIGJlIHJldXNhYmxlIG9uIGFub3RoZXIgcGxhdGZvcm0pLg0K
PiANCj4gPiA+ID4gKyAgcmVnOg0KPiA+ID4gPiArICAgIG1pbkl0ZW1zOiAxDQo+ID4gPiA+ICsg
ICAgbWF4SXRlbXM6IDMNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAnI3Jlc2V0LWNlbGxzJzoNCj4g
PiA+ID4gKyAgICBjb25zdDogMQ0KPiA+ID4gPiArDQo+ID4gPiA+ICtyZXF1aXJlZDoNCj4gPiA+
ID4gKyAgLSBjb21wYXRpYmxlDQo+ID4gPiA+ICsgIC0gcmVnDQo+ID4gPiA+ICsgIC0gJyNyZXNl
dC1jZWxscycNCj4gPiA+ID4gKw0KPiA+ID4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNl
DQo+ID4gPiA+ICsNCj4gPiA+ID4gK2V4YW1wbGVzOg0KPiA+ID4gPiArICAtIHwNCj4gPiA+ID4g
KyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcmVzZXQvY2l4LHNreTEtcnN0Lmg+DQo+ID4gPiA+
ICsgICAgcmVzZXQtY29udHJvbGxlckAxNjAwMDMwNCB7DQo+ID4gPiA+ICsgICAgICBjb21wYXRp
YmxlID0gImNpeCxza3kxLXJzdCI7DQo+ID4gPg0KPiA+ID4gPiArICAgICAgcmVnID0gPDB4MTYw
MDAzMDQgMHhjPiwNCj4gPiA+ID4gKyAgICAgICAgICAgIDwweDE2MDAwNDAwIDB4MTA+LA0KPiA+
ID4gPiArICAgICAgICAgICAgPDB4MTYwMDA4MDAgMHg4PjsNCj4gPiA+DQo+ID4gPiBUaGlzIGlz
IGFsc28gaGlnaGx5IHN1c3BlY3QsIGFuZCBJIGJlbGlldmUgd2hhdCB5b3UgaGFkIGJlZm9yZSB3
YXMNCj4gPiA+IHByb2JhYmx5IG11Y2ggbW9yZSByZWFsaXN0aWMuDQo+ID4gPiBEbyB0aGluZ3Mg
cHJvcGVybHkgYW5kIGZ1bGx5ICpub3cqLCByYXRoZXIgdGhhbiBwYXkgdGhlIHByaWNlIG9mDQo+
ID4gPiB1bnJhdmVsbGluZyBpdCBhbGwgbGF0ZXIuIEkganVzdCBkaWQgdGhpcyBmb3Igb25lIG9m
IG15IG93bg0KPiA+ID4gcGxhdGZvcm1zLCBhbmQgcHV0dGluZyBpbiB0aGUgZWZmb3J0IHRvIGNv
bXBsZXRlbHkgZGVzY3JpYmUgc3R1ZmYgdXANCj4gPiA+IGZyb250IGlzIGFjdHVhbGx5IHdvcnRo
IGl0IHJhdGhlciB0aGFuIGhhdmluZyB0byByZWZhY3RvciB5ZWFycyBkb3duIHRoZSBsaW5lLg0K
PiANCj4gPiBZZXMsIEkgYWdyZWUgeW91ciB2aWV3Lg0KPiA+IFRoaXMgc2NoZW1lIGlzIGRpc2N1
c3NlZCBpbiBvdXIgdGVhbS4gSXQgaXMgb3VyIGRlY2lzaW9uLCBub3Qgb25seSBtaW5lLg0KPiA+
IFRoZXJlIGFyZSBzb21lIG1vZHVsZXMgaGVyZSB0aGF0IGhhdmVuJ3QgYmVlbiBwdXNoZWQgdXBz
dHJlYW0geWV0Lg0KPiA+IElmIHdlIHRha2UgdGhlbSBhcyBvdXIgaW50ZXJuYWwgbmFtZXMsIG1h
eWJlIG1ha2UgeW91IGNvbmZ1c2UuIEZvcg0KPiA+IGV4YW1wbGUsDQo+IA0KPiBJZiB0aGUgbmFt
aW5nIGlzIGdvaW5nIHRvIGJlIGNvbmZ1c2luZywgdGhlbiBleHBsYWluIHRoaW5ncyBpbiB0aGUg
ZGVzY3JpcHRpb24NCj4gcHJvcGVydHkuDQo+IA0KPiA+IFRoZSByZWdpc3RlciBzcGFjZSBiYXNl
ZCAweDE2MDAwMDAwIGJlbG9uZ3MgdG8gUE1DVFJMX1M1LiBJdCBpcyBhIHN5c3RlbQ0KPiBwb3dl
ciBjb250cm9sIG1vZHVsZSwgbm90IFNDUC4NCj4gPiBJdCBub3Qgb25seSBpbmNsdWRlcyByZXNl
dCBjb250cm9sbGVyLCBidXQgYWxzbyBzb21lIHVzYiBjb250cm9sLA0KPiA+IHdha2V1cCBzb3Vy
Y2VzLCBjbGsgZ2F0ZXMsIHNsZWVwIHN0YXRlcyBzZXR0aW5ncywgZ2VuZXJpYyByZWdpc3RlcnMg
Zm9yIHNvZnR3YXJlLA0KPiBhbmQgc28gb24uIEJ1dCBJbiBrZXJuZWwsIHdlIG1haW5seSBmb2N1
cyBvbiByZXNldCBjb250cm9sbGVyIGFuZCB1c2IgY29udHJvbC4NCj4gPiBUaGV5IGFyZSBjb250
cm9sbGVkIGJ5IHRoZSBkaWZmZXJlbnQgcmVnaXN0ZXJzLiBTbyB3ZSBkZWNpZGUgdG8gYWRvcHQg
dGhpcw0KPiBzY2hlbWUuDQo+IA0KPiBUaGlzIGlzIGFsbCB2ZXJ5IG5vcm1hbCBzdHVmZiB0aGF0
IHN5c2NvbnMgYXJlIHVzZWQgZm9yIG9uIG90aGVyIHBsYXRmb3Jtcy4NCj4gRGVzY3JpYmUgdGhl
IHJlZ2lzdGVyIHJlZ2lvbiBiYXNlZCBvbiB3aGF0IGl0IGNvbnRhaW5zLCBub3QgYmFzZWQgb24g
d2hhdCB5b3UNCj4gY3VycmVudGx5IHRoaW5nIHRoYXQgbGludXggaXMgZ29pbmcgdG8gdXNlLiBN
YXliZSBsYXRlciB5b3UnbGwgbmVlZCB0aGUgb3RoZXINCj4gZnVuY3Rpb25zIGVpdGhlciBpbiBs
aW51eCwgb3IgaW4gb3RoZXIgcHJvamVjdHMgKGxpa2UgdS1ib290KSB0aGF0IGltcG9ydCBvdXIN
Cj4gZGV2aWNldHJlZXMuDQo+IA0KDQpZZXPvvIxGaXJzdCB3ZSBhZ3JlZSBzeXNjb24gc2NoZW1l
LiBJdCBpcyB2ZXJ5IGNvbW1vbiBpbiBrZXJuZWwuIFdlIHdhbnQgdG8gdmVyaWZ5IHRoZSBuZXh0
IGFjdGlvbnMgd2l0aCB5b3UuDQpPbmUsIHdlIGFkZCBhIG5vZGUgc3lzY29uQDE2MDAwMDAwIGFz
IHBtY3RybF9zNSBhbiBleGFtcGxlLg0KVHdvLCB0aGUgcmVzZXQgbm9kZSBhbmQgdXNiIG5vZGUg
Ym90aCBjb250YWluIGEgcGhhbmRsZSB1c2VkIHRvIHBvaW50IHRvIHN5c2NvbiBub2RlDQpUaHJl
ZSwgSW4gY29ycmVzcG9uZGluZyBkcml2ZXIgZmlsZXMsIHdlIGNhbiBnZXQgdGhlIHJlZ21hcCBw
b2ludGVycyB2aWEgc3lzY29uIEFQSS4NCkFsbCByaWdodD8gQnkgdGhlIHdheSwgSG93IHNob3Vs
ZCB3ZSBkZXNjcmliZSBzeXNjb24gaW4geWFtbCBmaWxlPyBBcmUgdGhlcmUgc29tZSBmaWxlcyB1
c2VkIHRvIHJlZmVyPw0KUGxlYXNlIHNob3cgdXMgeW91ciBzdWdnZXN0aW9ucy4gVGhhbmtzDQoN
CkJlc3QgcmVnYXJkcw0KR2FyeQ0KDQo+ID4gSWYgeW91IGhhdmUgYW55IHF1ZXN0aW9ucywgcGxl
YXNlIGxldCB1cyBrbm93LiBJZiBtYWtlIGFueSBtaXN0YWtlcywgcGxlYXNlDQo+IHJlbWluZCBt
ZSBraW5kbHkuDQo=

