Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DFACCF9FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 09:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/69YnKWOl5jS5V6ZzIPYtDw/Ohjo+Dxk6mdU4apLuY=; b=NvXBJo0iDV0xYx0hDWj+UTmEUV
	S1pTIhokrD/2LEmRhK4R2DYzUFHUggJp8QesGqMjEY0LpwH7KeAxZo7xwQyqq2j7JaOF0+6THbqCI
	yPkAcO4R29uolgcGrAV1REWrcrloEwjcNYoGG8w6r/YFfxnnLnAjHbtnRDmHvsFw8ihP/+DbRUocv
	+7cs0heALzSZkchuaqf/qQcADyU1yTXXM5P8KlwnN+ws58b10GbX1OFJQ985hudRc9rtv85VNELet
	cH+HWJtZcuVsO4TyqXBpBljyiF2qBXki6njTqaUz9Q/aWRZd75Dm7kb3JzcwYOMaPXpbEgNPFKco/
	IQMI1RAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElU7-00000005oTg-17tY;
	Fri, 31 Oct 2025 09:31:51 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElU2-00000005oSw-27ff
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 09:31:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eORfKxJ+ReJS1PMF571C/m/K1t/Qc2UXw8+eMvtUKTOHzKFMw54ubr8fAerBH91DN5B+0dohoD61IrsqsBBH2wvPP4/P+i5YCVPy/amNc78SdqCcOlsHeU8w3EusDKdvjOgSn0j2gjM3vsLJhof51CuL5X/ZSWhWhQzevNas89XkwPKXVhM3/pE31zV879LBQ+UAPSDfGPuCdio1wgs6PC8HLe74dlX1fkdYYen2vmDCjSMaNuDPUrD6cFm6WwQ2Vqny9zx6RqoiF70BbnOXUpotgCbxuabN9wCjEOkShk1s/XuKYyi2zr9ZNleBzvrWAhpVj0JSlKuaegAC8OIh5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/69YnKWOl5jS5V6ZzIPYtDw/Ohjo+Dxk6mdU4apLuY=;
 b=mJkQ5nrTrWOACQisQnsCWUehz3UmmV3s67JdRqKcOWRpMl3vsMDo6KqViuPY3iSLta/hxEVpXFIrTHWpCZ94KCi43OD9FC1PI8cHqp7P7xPQY5QFCb6qtNX2XYLp0CM7tB1HLp+TnDPKgKOlXigXYjJqryi7qKIPIZbFb6ISyMywBBWKLSDB8b6zXGSSgQon3dKXh97MDpjum72Qq0JeAyXgpzBYTYcECeB1fpxU9ZIDQBtzuReP0s0aHRHk7i0i98rp5gTmees79d54UYHepZDIDHXgAMvwigtWTSrWcKHk8GLobvVi4iPKZxyOGZoQSKuCh9lZJMayiAxvCmsqQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/69YnKWOl5jS5V6ZzIPYtDw/Ohjo+Dxk6mdU4apLuY=;
 b=TEeFvSaOiQrnyjGBZ+tw01d4m6PJjxc9i3B7lnYwtbk43w/8gR8Se9Nsi4eLYhEmv+1jlTGhKofSmG0EaO3fuP1m0/A2W/khZTz5IiEvweRXRRNhz1iuIYagT2Ml62ZdXtFJnqkjcPOtdmROa0Z+paw1+UzkdrMkGaj8ChkgihuhS/86m6V3RUGSI7+wW8mjj82IgiCtSuW1/uMMPxjHeEkVvRAPUVqM2nFJt14Vkl31DxvEJGrDwyRpiokrt1HHgkRxmYMYvbjBn466exSh8KzTg9JMRzSFk7VypXKdrHzRBoIb9KOqjgxv0WWHMiNo8kEADBlsbuZsJeV/ExzqPA==
Received: from DU0P195MB2325.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:425::22)
 by DU0P195MB2894.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:59b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 09:31:39 +0000
Received: from DU0P195MB2325.EURP195.PROD.OUTLOOK.COM
 ([fe80::ce58:6abc:a395:f7c4]) by DU0P195MB2325.EURP195.PROD.OUTLOOK.COM
 ([fe80::ce58:6abc:a395:f7c4%7]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 09:31:39 +0000
From: Jan Remmet <J.Remmet@phytec.de>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 3/6] arm64: dts: imx8mm-phyboard-polis-peb-av-10:
 reorder properties to match dts coding style
Thread-Topic: [PATCH v2 3/6] arm64: dts: imx8mm-phyboard-polis-peb-av-10:
 reorder properties to match dts coding style
Thread-Index: AQHcN2JDX0GPiCwJlESOcylc3Uf88bTVmfcAgAaJlYA=
Date: Fri, 31 Oct 2025 09:31:39 +0000
Message-ID: <f5d8f4b5-21c3-4c14-8c15-27dd8e5469d4@phytec.de>
References: <20251007-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v2-0-7e5de62c79bf@phytec.de>
 <20251007-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v2-3-7e5de62c79bf@phytec.de>
 <aP8GFPBVQhyIA0-2@dragon>
In-Reply-To: <aP8GFPBVQhyIA0-2@dragon>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0P195MB2325:EE_|DU0P195MB2894:EE_
x-ms-office365-filtering-correlation-id: a3e63c4c-16d5-4c82-6b85-08de18604b9a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?REVSUWxzNURMa2kwLzdsSkliZm9OdmIvTU5QL2pYdUNNWWM4b0wzaG9MQjg3?=
 =?utf-8?B?WURlRnBSbkhFbHhFcGJZS1NoNHo5OFlBL0Y1dlphY25ZaFd5Y09TeVJ1QUN1?=
 =?utf-8?B?dTh3a2RUbi8reWlyNS9wL0wvdkpqLzhXT3Bncnp2RE5RWWp0T3Q0V1hjcE1y?=
 =?utf-8?B?dnhsc0J1SllhNVFldEpCTGthUHA4MFhzQlBRQzNOVU01T3gvSGNTM0l6aE1E?=
 =?utf-8?B?NkNtaHJjL2tLQldUUE16R0FZZjJ5Z1ZrRkN0S1gwSlBmQmU1ZzhNZzhiK1Bh?=
 =?utf-8?B?aFdmSWxKbzJubkF6YWM1a2hBNmI5ZXlyNVdneTVuYmc5b1lTU1kzSHdkN2xR?=
 =?utf-8?B?WkR3SkRpdVl2UGdsSmlTSjdDN1dmbUdBNkFBRnVWcWhZdjV5bjlpTjB5bUp0?=
 =?utf-8?B?WU4xMWw0RjB3ZnY3Z2NEQzArQUIwbFRSWkdubmE1d0tkOWk2YWdWMW1JTE5Q?=
 =?utf-8?B?VmV1cmdWUk50YUFmRXEyU3ZvMlM2bHFMb2UyUnlFR3ozbm4vTkhPYWEvaVYy?=
 =?utf-8?B?aGM2MnhHV2JBTUdYLzREeVN3NmZVQThyMzFWcWZGaWJDYkQ4OTBBc0NrQVJU?=
 =?utf-8?B?RTMra3ZNM3dZVEo2NXVyVERWNGgvRVRtenBBUk8xRmhIa3NqMDJHM3Qvb1JS?=
 =?utf-8?B?K3l2cGQ5ODBITmpWeGgrWkh3OSt1Uk5TV2lROXBJUkVXcFBMK0R2TDZMNFpS?=
 =?utf-8?B?WTJyaUNuU2gzMmJqUHFnaDg3MlBOQ212YmFGZmUrU0ZiWmg2dGQ1VW10d3I0?=
 =?utf-8?B?ajNJOFY1TEpKZlE1WHdCTk1uWlFwRzMvTzlOdi9KR1Azamo1ZWR4MndVNlFO?=
 =?utf-8?B?NEh0aXg2bmpYdnh4RTNQL0l5SlV5T3FTd2lNanVTK2ZSc3RzSUpHVTFsZ09t?=
 =?utf-8?B?QjVCU0FZZFlTUDJDSHpNMW1zbmNwalNXYTM2d0NpOVJ5MlUrOEk2MzYzTWdE?=
 =?utf-8?B?Q2dYTXFpZkhLSVlGMzZpZVFWdUhoM093R29ab1JoWGJsZlY3T0R2eE1RaEV0?=
 =?utf-8?B?eXBxakp1aVF1OVRHaFJRK29uZStrNVVwN0ZaRWwybTgyNkZNeUNmV0RBY1J3?=
 =?utf-8?B?dFhsWXI1ZTNkSGpJZTQxRkJvODJQZTRWbUI2TnVNVG8rTGVtMHF5b2k0LzBH?=
 =?utf-8?B?dk9UNEtnZXNZeEFVelRxZWNxbW9lSWFzcStsUkxyK3UxTlBOK3k3YUU3R2ps?=
 =?utf-8?B?ZXJxQkZBVmpVanFWODFNRDVTdXFkcW9UaS9qOExTZFRydTIra0lyQTlXZjh1?=
 =?utf-8?B?YTVwdEhxd29sTFdKQStWZGRZZnR2TFBnOU5WUVU1M3ZxeTdCaGNOeTJaTTZ2?=
 =?utf-8?B?N0xycVFYNjhxeGl3b21ySmRaWVlabStBckJGaHRkZ0FTbG4yZm9ydDBHMitn?=
 =?utf-8?B?dzR2TU8vVDI3SDVhbWJjdlpzM2Fpc3h1cVdqS0RMOUFPeFVvRmNUaHdiU1Rz?=
 =?utf-8?B?cDhCVWRwT2Z4TXVNdnl2TEU4R211UmNTZ0V0Z213d0RMNFp1SVZSaDhQdkRv?=
 =?utf-8?B?c1N6VHJ1QnNjT21SNGs5WUs2dTQxRGVJUi9JcUo0ay80STlZTlNWdXFWM0F6?=
 =?utf-8?B?YlQxaXBJbDJPeGVmRlFrMERtS2c4ZmJSb2FaODJFd2hYWFdlVHh6Y1JYRitN?=
 =?utf-8?B?b01pbDdHL20vU3BRY1V3SHA5RDhlOUE1OGNMVGlQTmttV3M1dm1jV29icVNP?=
 =?utf-8?B?THg3Vm16LzhlNTUrMytYNm8wQXEzakN4WndaSENZdWpHVDN5eXEyUHJ4U1Uv?=
 =?utf-8?B?NEY1MU1oaFdSOEc5d0hyOXNNeUgwSnRuOGVoVDdRNjNYcHJ3QmJLTEhKNnF0?=
 =?utf-8?B?d2xBaFd0NGErMzBpK01ydndGc1czQW1SSDBMam84Ti9vNll4MUg0YXpKMjR1?=
 =?utf-8?B?UTZSdzJmNG5KQnBPdjFFVi96b1hnV0dXVTN4ZG5WSGlEYzVIR1RONHM2NVdV?=
 =?utf-8?B?WEp3WHBBdkJCY0hxWDBBR2tUdzZMRjZZSHFiUUxKQmtXbU15eUpnZnlDTlJR?=
 =?utf-8?B?cWMzdmtrb2pveHNZdGJGd0hMd1dhK0ZBaTZ2dEZWRzJjQXJzL2dRTklBUGQw?=
 =?utf-8?Q?P7fuFO?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0P195MB2325.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VDJZRFhKTXBzT25DbWxSTDB6Mk1qWE13YTFYd3Q5MFhhSjdGVlF3MFBwd2hG?=
 =?utf-8?B?OXYrRDcxZmJqUFZLNTFTVEdvYVM0Yk5MUXUvVXRTLzB4MEZDR1hGMlJGcDJj?=
 =?utf-8?B?Sm4yNHczdGhkZkc3a0JZSGNTd1krTGdHTzgrR2krT2NmVTVkNjNva2svNkN0?=
 =?utf-8?B?MVozV21ySHZHL2tpd3FESEFUcDFvZitad3JYaEc2a25Uc3F5ekI1RkRGY2J4?=
 =?utf-8?B?YVFEVThyWFVuN2w3cVMwTWU2SG1Pc1FvSDVYSlFDbWdyLzFlQXRRMWNTRkFG?=
 =?utf-8?B?TWsrVmtEZUJldUpJKzdMV0RxMkxNOXNLWXdxWDVWUmt1T0dpU05BWXg3blU1?=
 =?utf-8?B?MU5YWHZhTmFoU2tRVEVBREFhaEF4WUl1WW1jYlExVS9GcmNiV3MxVnVZVG9H?=
 =?utf-8?B?dmljNG16djNSTm9JaS9JT1k1MzQ0QmxEVUJyb0lwRmQ4RHdNR09RaVBSbU1l?=
 =?utf-8?B?U3pwWDlESkZTZDFXb1BRcklSb3o4NFhBekJvcjQxZU0yTkpFVEtFVm9YSngy?=
 =?utf-8?B?TXh0UU1RRWJmYlRYMjgwcXg3TC9RZXdhaFlGNWtGazZSQmFxd0FGcEI1eUJD?=
 =?utf-8?B?Qi9wQnR5K2VTV3FaK01mbDhYMzk4ckZkZFN1SmRNejdzS3pLUU14cFVZZWtK?=
 =?utf-8?B?alpscDJpVGlCYktVMUx0dFozQVhIM2o5QXBIYTE3NmJaUFNQWDNTZEFaMjUy?=
 =?utf-8?B?RTVDMEpIS2JJMXhWTXF3Ymo1SVhuaFczcTJDZjcvTkcxbHNsSExuV25sODg0?=
 =?utf-8?B?Q1JmaFA0cXhvd214ajgyeG5aY3NYbTkxNlUrdUJVaXl6Sm5veXRtSkl6VHdl?=
 =?utf-8?B?bmNzS2RMazdJL093akRkcUhOalFtZkJpa2VTUnFIV1ArSnZFcWpCbGZFRGw3?=
 =?utf-8?B?VzAwbzFrN0lMQXR4N0hDNHd4K0lveW16dUtDV3hWSVVPTDlqaGRpMC9KNGtk?=
 =?utf-8?B?T1BTNHJvc0JjVWxhOGw2OFFJUWtibWdLR0pIbGUveGlWMGUzRmdVT296UHA4?=
 =?utf-8?B?M29xSjhMUkovRVpFcUkxT0ZOc2pqWi9OejFrcnVLUStxWGoxYmlxOUZtYVh5?=
 =?utf-8?B?VjNRUGtyaUFLNUh2UjJ6cjNvcnhqa1piVzVqU2drUkF4dUtRNVhnVHhOdVZH?=
 =?utf-8?B?Y2xvN1ZDa1JvWXpoQWplSDAyVWFtQjdGcUlpd3pWMkdWWllJazhuUDJlV3hi?=
 =?utf-8?B?eDM2ZUw3L1laeG9SSGFQMlIvckIwanFCbGQvVUhpemw3cmR2azA1TGNpRytw?=
 =?utf-8?B?NkRMR01MNXVSQWZCaHh4cXNnOXQyMUM5WFpvSWtBamRjazZLaXNkVzNXeGM4?=
 =?utf-8?B?Q1lQejZrY2FjYWRzaGo1eWNxNU0zVXg5Qjl1UWVTTnZpUjlIZ3lHamt1NGpN?=
 =?utf-8?B?L2F5MzJmcG03cEx5Ymt3MXNnQWRGRDVjblhEdlB0dXcreXRxNU1FcHl3YXA1?=
 =?utf-8?B?NWduQWZkYVYwNjBxazc1N0pFU0tWbFo2bHNSNWNMLzlQZDNnc2d3blRNbUxv?=
 =?utf-8?B?WHVpUWxoTFFJSjFZSGNqQkQxeHQzVHptVXFQWEdxV0QveFV1dkFHSG9vTG4v?=
 =?utf-8?B?WXQ4czlkQ3NRcVVJS01oTG9CYW80VEFWTnduamNqd1BuODVVcndQdHNhSEx0?=
 =?utf-8?B?MXE2UHNoTG9MU2ZKS0dVN1l6dncxczhWZW81eVN3Mno2Y25ySG5Rb24rOHlY?=
 =?utf-8?B?Z1B0c2dyTm15cThvNlA0RkFkSEx3TzFpSFVKZ0svSGVmRzlVZkpRUS9EN1lu?=
 =?utf-8?B?cEE3RlNlSnc5OXNyZW9SbVRmSkkvVWNsT2ROWC91bStmcng1aVFYeEdsdWFo?=
 =?utf-8?B?ODVKcHJoazdNemp3MGNBS2ZRVWwvYTAzRWFVZTNVODhERnVlN2dlQ2tXQXVU?=
 =?utf-8?B?MWQ5ZzR0U1ljL0VJd1pvUmpsVEZLUW9YMkN1bWJQK0Z3SG5PQXR6Tk5udWpL?=
 =?utf-8?B?OFQ2VXlhOG45K3dUTnZySGU5L3dBYVFjV3oyUk4yWUVvWHo2dEQ4YkM4eTZP?=
 =?utf-8?B?UU05cnBYWGxqZ3Y3U2k3Y0pMcmlyOEx5dzMxOTgybkVFYVd3LzFRNVd0akN3?=
 =?utf-8?B?OGxmelU2YnlSTStBYmZmTm03TXRuMks5WlpoYS9hdGJCRmNkMXNQQ3hVbUUv?=
 =?utf-8?Q?5ZOAu5HN41y9Np6KkA5Xy5tAt?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB95645B03E20F4E874B50FA87325C2A@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P195MB2325.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e63c4c-16d5-4c82-6b85-08de18604b9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2025 09:31:39.7106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZV11/tuKx3qIj/5M+kAY/JIq8vqhnN6zHC5ID/28i5l/yVVhA3Fh9OgnRrYPiUYx2ulfYI4dHkTFC18jSHTxqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB2894
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_023146_872569_E336FAB3 
X-CRM114-Status: GOOD (  10.02  )
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

QW0gMjcuMTAuMjUgdW0gMDY6NDEgc2NocmllYiBTaGF3biBHdW86DQo+IE9uIFR1ZSwgT2N0IDA3
LCAyMDI1IGF0IDEwOjEyOjI4QU0gKzAyMDAsIEphbiBSZW1tZXQgd3JvdGU6DQo+PiBTb3J0IHBy
b3BlcnRpZXMuIFJlbmFtZSByZWd1bGF0b3IgbGFiZWwgdG8gbWF0Y2ggc2NoZW1hdGljcy4NCj4+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gUmVtbWV0IDxqLnJlbW1ldEBwaHl0ZWMuZGU+DQo+IA0K
PiBJdCBkb2Vzbid0IGFwcGx5IHRvIG15IGJyYW5jaC4gIENvdWxkIHlvdSByZWJhc2U/DQpTdXJl
LCBzZW5kIGl0IGFzIA0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJtLWtlcm5lbC8y
MDI1MTAyOC13aXAtai1yZW1tZXQtcGh5dGVjLWRlLWJzcGlteDhtLTM4MDFfcGViLWF2LTEwX3dp
dGhfYWMyMDktdjMtMC05Yjk4ZjI5YTZiYjlAcGh5dGVjLmRlLw0KDQpKYW4+DQo+IFNoYXduDQo+
IA0KPiANCg==

