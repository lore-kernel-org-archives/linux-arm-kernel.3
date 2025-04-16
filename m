Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81330C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 12:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/TOBsywHHrz4At5vNrGQtgkvowSTWGDjVvyYx7zjLZM=; b=Lfjf1oDaMVf7RtuXa+IjDG6Mod
	Vwcb5QXgUlTLCdkQwk/DmOMHXfRvktnjaNaM1liOqfUTQoquqaH86Xc9ONvqH/LEZHeAMNW00li+r
	Bf7jA6hfQ46jgMqgSX1baSLB8Fu7AiZ/9P3mA0pvjs6y5JZ23HUOvmPSPoERlzweozOQbHAR0O1+R
	gguA3dFDYlRmOLYHg/pSJxS3JP24xoPtyt0o8LNyB4wElOhuJCyVUXjqJ/C+5MEkNvGTvSI/Z+0vk
	SjYOu6c4VncBDLESI2Z/e5gBuDqXUZ8CaA+KwKjtBt+B5K2XvKyz44Yuo3RsZcBcIWIc9jnUs0754
	xxELP7qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51tB-00000009W1U-0z5r;
	Wed, 16 Apr 2025 12:29:13 +0000
Received: from mail-db8eur05on20709.outbound.protection.outlook.com ([2a01:111:f403:2614::709] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51pp-00000009VDW-1JTh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 12:25:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ORQ3L5ENebfH9Q0OFkKcenXxdXzdFR7kde0zmDdAK/+aLSzdMPfxN21ZxyInEcqw61JjMmbGYF9gbwGdLmDx5k6Y+HNzcCxDX7pLfRNju8QtoawBz8CeiSEGtG/kVd4z1zyVWENhx9w9Ig/5bHu9SBiAJ/jtr/K0NplAsXxf6WWc1V/R3cdmmxmxc/00/nvYXBadNeYaq0h+1BGaCNBRhREyKaA+H7GMYR+WTBHweZHXDu1m1PoVWtDv3UqmvKYUABScU18n60Hd+HlhKXXuQ+mGMzNu+zaEBL+F7/O86FTVgbHIdGF546EPapOUVHCrjiJAP4fy6lm51VrRJUrkXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TOBsywHHrz4At5vNrGQtgkvowSTWGDjVvyYx7zjLZM=;
 b=p3tUqIt8u/O7rP1g+rScxTb+CgVmFv6HvSXMjzXIUIWkQRKuaEjmENAGd0AgSjh1lBE6sVlviEe6HLlnX4ZYTBCNq/8TxSA+3MewLaJ1ida6/VPoGpmItWAt0De1S8fbTVGkXUl7GaL3FgNgHqJinVFx/mTYsej5gj5LZDTHNuxAbNuU2odWfyhTNGiOQAM1AalW16uCCDak/AbVs20K4V84yRANq7ayhoLihJEnoPQKavdaDuKg5dHjZr/w4up3PV2w3GiuaX4s61c0RT5IHgOQqHqX8ZJXem2itHyljMeGHjiAYXEhgPUdvIYU31enLz+VXEQoj+ZKzBzvkQxwLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TOBsywHHrz4At5vNrGQtgkvowSTWGDjVvyYx7zjLZM=;
 b=gUUU+60GcGbvq6R1oTn+PZrfpIOeI9gi9+0Yto3UA5sIauqg9aSYX36Y6RIzW7zl51PejEtEH7yC9Kx5IF2xxAOtR+Y1bokGOfYzR9D5WpCzt5jnuBIU4fOmQO5Lk2aouvamn+HutQ62ssyQwg9fqkgMpYtcmri8e5jJIlG84nBwEiSStHZRuX9FEFNf9e5T5CfsdEryew5jgeNiiquwPDUR78f9VKja1Q4eoEe6TPdDhEc5JRSITCq699FSxjBhy244fFLAyqYLEOQtApjIAZ2FfLVH+2MSZGUsLXt3DWMimvRR++qxFFP3lEpdBTu/fAOwj7kzyG6Ftdih+wFp6Q==
Received: from GV2P195MB2328.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:dc::8) by
 PR3P195MB0521.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:35::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.36; Wed, 16 Apr 2025 12:25:36 +0000
Received: from GV2P195MB2328.EURP195.PROD.OUTLOOK.COM
 ([fe80::c6fe:e602:7166:f258]) by GV2P195MB2328.EURP195.PROD.OUTLOOK.COM
 ([fe80::c6fe:e602:7166:f258%6]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 12:25:36 +0000
From: Dominik Haller <D.Haller@phytec.de>
To: Conor Dooley <conor@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "kristo@kernel.org"
	<kristo@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "vigneshr@ti.com"
	<vigneshr@ti.com>, "nm@ti.com" <nm@ti.com>, "m-chawdhry@ti.com"
	<m-chawdhry@ti.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: ti: Add bindings for PHYTEC
 AM68x based hardware
Thread-Topic: [PATCH v2 1/3] dt-bindings: arm: ti: Add bindings for PHYTEC
 AM68x based hardware
Thread-Index: AQHbriDaSp1ugqq07UmZXB/BRxTmzrOmOQsA
Date: Wed, 16 Apr 2025 12:25:36 +0000
Message-ID: <e93ea6f4c401089298dcf36ac35dbc4365deb9b6.camel@phytec.de>
References: <20250415130458.33714-1-d.haller@phytec.de>
	 <20250415-lark-deskwork-7850a95aa955@spud>
In-Reply-To: <20250415-lark-deskwork-7850a95aa955@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P195MB2328:EE_|PR3P195MB0521:EE_
x-ms-office365-filtering-correlation-id: 579fa47a-51e6-4d29-85e8-08dd7ce1ca79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MXBDL0R6L1paUlAxSHFRcUhvUVN1b1hNUnVCWUtwaWtFbDJYWjNVT3FsWG1B?=
 =?utf-8?B?ZXRaeFFma1pSeHRHbGd3ZjhhYU02YXplRGZOMXVNZkc3WDNvWkFMUE5TVm41?=
 =?utf-8?B?T0MzU3pRVlhYZ29scGdFR2NIRUdHd3Y4WWFsekJtUi85Zm03eFpnUWZkbFVx?=
 =?utf-8?B?SjBFaGhUbjZzWG45T3JVcjA2Z3lSOE93aXc2cnovNlkwVkVwSU1oZ2VtQWht?=
 =?utf-8?B?YlhYUUFSVk5kUTM2cFkwWmtUSTBlKy9KaHdYVm5QWVJDRjZTQ3hyczlqdmJ6?=
 =?utf-8?B?VTZ5c0Q0Y0NneHQ4V01lcmkxN1BVSm0yN0pLaGxPaUFITzlIckhIWDN4aGNj?=
 =?utf-8?B?VlB1eTdxV0ZEcGQ2aXZRa0ZlcnI5cUhKcTZCd3A0S1ZGZytudG1JWno0WEhm?=
 =?utf-8?B?aEJFdWpKSVZFWmZJcEJkc3hzZmRheU16K0hENzViaFdOanZCQ3BPSFNicEhl?=
 =?utf-8?B?T1c0SkxBRkpSZE9qV29pTGlmcm9qU0o5UmtpQzk4YjV6ZDY1WmRocXhWSEZa?=
 =?utf-8?B?YjRocDR1dThEc3pSbnhyR09FcFNrbDZZeGRoMGhETUIzejl4ZjB5NlJwd2VZ?=
 =?utf-8?B?R1lUVXlKQVZSY2gzRWxTUnVxU2RYVnBsalppSmdhQXUxOTh6dEpnYXBTWFUx?=
 =?utf-8?B?SkZhbWs4U1ZvN1pacjVsNUVlVlpLTnkrT1BXS1V0c2kzdHpRTVhNTWdHQnVC?=
 =?utf-8?B?c0lJWG5FTkpMdlpUV0xybVE1TUhmeGRXemhzd2s0d0Y2V1hvbEJXSDJESGJB?=
 =?utf-8?B?SEY4RjJQSUZNVVlPRlcrVnl3bWVXb0lGYUtzYVNEWFNrWHZLN1p5Z1oybEZ0?=
 =?utf-8?B?NXExYVR6TGg5UFlEelhpTDUxL29uODJmaGhOU2VEdGV6RjIvOUd1NmplcGE4?=
 =?utf-8?B?M2VpejBKWGhyU2UveUhRZStqRHo4bHlRL3lWVTArbzNPZmUyM2IrOXp3M3VC?=
 =?utf-8?B?M3NjVHloTlVmdjRiQ2VYTHUwSEpIdW5pVTVUcGdZOXRlSXRSSExtVGIrZlFH?=
 =?utf-8?B?eE4wUnA5OXdlSHh4Zk11VWkwTGZxY0FBN1JXZm50YVdaemJIYVk5K2VIUy92?=
 =?utf-8?B?RmJxMHBNNUlYc0YxY2tVNzlpNmMxN2tNaXZCYU96Y0ZEM0QyazJVblpxbU9z?=
 =?utf-8?B?S3JQbk5hanhjOW1panBPQXV1QnpxOWlUd0J6MkNZQWZLZGQzWmJOR2N5L2Fh?=
 =?utf-8?B?eGl3dXY4ZUhjSEtlcTZmZ1VVY05ZempvelpqUmtEVTlzK0FTdWQ5Q2xTbWJX?=
 =?utf-8?B?YWJUZFdLS1dYazlXYmpnOFBsOVQxaXNQN1VNVzhuZktCN1EyK3FPb3Z6SEpp?=
 =?utf-8?B?ZmlOYnhOZWZ5MFdOeGwvbWsrcFE5YkhERmh6ajFyQTBvazlZZXNhUWVQcU9i?=
 =?utf-8?B?Z0w5dFJMbDhnQ25GRllUK1pyamxCdEc1dVp0TWt2akk5ckI4TDJ5YmJpS3Rz?=
 =?utf-8?B?SXN4MkQ5cDNWOVBWSCtOQzR5bzhHNmZrb3U2dFJLZS9yMmNUYVg2elMwQkxx?=
 =?utf-8?B?R3JEY29Cbkk5WnYrUW9ITTd0QUIvVm5ITkZ1bTcvVmt0b01wU2xwMklOMlVC?=
 =?utf-8?B?UUxJbU1XRTYwdFJxMTVSemJtWWh2R21qZ0VnUWg3LzJMMlhKclhPSm4xaUdO?=
 =?utf-8?B?ckQyY1RiWmN4MkdrS2lVVTFzRGc4c3dpcVFoN1F1TThVQ3AzMm5DK1NCZjRB?=
 =?utf-8?B?MWpDK3lPbmdlVk41WXZjYlpRMlFBMUVlcXhjSk1PeFBBSit0ZTdwZW9Rc2JE?=
 =?utf-8?B?TVVXbnN4bEpEWnBmc09vdEJPS1Z4RE9MdEtFeldNVW5zcDJFcS84VGFVN0Yr?=
 =?utf-8?B?Z1BDazR3TDlKMkpGbkZIVHNsZnAwTFB3OWFNUWhBL0F1dUdXSW1NdHA4dU5D?=
 =?utf-8?B?ZGZtb0N0NVIrcC82Y2pQTHJvUWkyT2I5RjRSWnZDZzF6OTcybnFtWHFYT1pF?=
 =?utf-8?B?OGI5YzFTdnNTaHRIaXJJMDNOKzM5SWVNdFNkRVZuZUNucitmalhoWVZxeFFF?=
 =?utf-8?B?Wm1WM3Q5ZEFRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P195MB2328.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWZxZDRxUFBQWkFIRHk4MVdTTkQyenRBNnlQTlBpWEZEWVdUbWRaRG5PTW83?=
 =?utf-8?B?WEhZWU5kaVJZTUlacjZXU1lyQ0J0R28xNlBwVEl4SHI3QXptWFh0TGVhdk5r?=
 =?utf-8?B?bEFZdjVlRGhDTmdwN2YwK0p6elNuSUpKZkUzcHNxN0RGRTdyTlRBUzVLVGdY?=
 =?utf-8?B?aDRuaDFEdTdjczEyQ3Blb0RFRXNsa21SY1Z2bWRBTStseENmZEtDSEJPejB4?=
 =?utf-8?B?MUFHNHpjVVFNODVFQlJkaVRjMzFRQmtmVGtSZ1FnUmVzSVRia3NDVkk5Wkh3?=
 =?utf-8?B?ZExPb2ZwVmdZcFpEUkZhS2o3SmdBbGF5d1pXU0grc21YZE80cE0xQ3VDQk9S?=
 =?utf-8?B?MmlrQmhwclovN2hib3ByMmNKd3VEWnNiVXpZT0ZiVzc1UlhwcHNZbWZJRWxy?=
 =?utf-8?B?RitoNnBBOEhremZabWJ0T2pQcGN4aWEvdU1LREUxdGU2VzI2Z1YwbUZnOHd0?=
 =?utf-8?B?YmNrdHJaWkJEOGNCa3V1d01DYXlRdW03cWE1Y3ptdVJaN0k0ZHdHWTFNWkRq?=
 =?utf-8?B?QXQvS0ZUcmJZQ3kyNFVrWUw4WEwxdVEwVERhMEkvM2hqZHFrbnAzb3ZabExq?=
 =?utf-8?B?MWZoVTlPaTdXcHJPaEtCdGV4cUtZU082NDBLYytZTnhaQ2taRE9JZ202dEUr?=
 =?utf-8?B?NG1PY2tjWVU5Y045dU9NaXlocytIWmswY0RseG5WbTBpWVEzM1F4ZVVNZklP?=
 =?utf-8?B?SXdWWk5XRDlVNDl2SWJvS0ozQ2kxaGs1U0FlcGdreHZGNm0rQTByem1YeUtz?=
 =?utf-8?B?UWJqRGZ2NXdtSlFSWjl6bkM3eURHellhVHF6UWs3M2hVOFF3WFhUM3ExNnVH?=
 =?utf-8?B?Q3dRbEVJeWpIT2pibzlHNDgzS0d6RU8wVll5M3ZnZ3AzcUpSNXRrek10dVBZ?=
 =?utf-8?B?eGNTTDllWGdMVnJob3Y4YWxQVC9rQSs2SG5INTIzRTVidUg1cE9WZ0JMcWt4?=
 =?utf-8?B?M2Z3MUdOTmI1RWQ0MFJtNW5Id1NyV3hiVXM1S2Q3bzdvdjBtSXp4R29TaEhW?=
 =?utf-8?B?T2xXRW94OEUzUDg3VkZyb25GdkhWM1p1bjltY09INE9QNEFIWVVJelNuSllU?=
 =?utf-8?B?WWh5aXdpa1RtM013MURsdFdaM0ZCbnJTVjhEd0I5RDkxc3BzWHZqbjdGYXdK?=
 =?utf-8?B?czdmNEV4WlY1M2VxVVdUUmZvVDRVRWJsL1pjTnV6eE9zSktlRDMyaDRtQjJO?=
 =?utf-8?B?ajhmV2hpQjlBYW55NkZ1M3krNU1scmI2ZGlPcGx1K1dFWjFTdk4xQTRsanR0?=
 =?utf-8?B?YVF1N0syaFJqSXkrblNjeWNpdzJXUTF0UmUyeFNNOGlsVjdGdEw1b0MxL0Iv?=
 =?utf-8?B?TVdFK2N6NzdaZGJVU0NQQm9kakF5MEVnS2kzeGgrNyt5Zk5VcWw5L255aHRu?=
 =?utf-8?B?ZW1ETmtUYmlSL2ErWUF5eGtXUSt1ZWNHeXQzbFNGdzR4T3MwRWpjb1lrSW1R?=
 =?utf-8?B?dE9PcEw5SVNZRytzSThJbjFpc1hTTzZUUVM3b0JFVG5mSWVKeHVoQldISm5m?=
 =?utf-8?B?ZW8rdDdoSmRwVVNvMFJRNStONU43d0QwQW84NFd4dW9tTzZ3d0FIQnh6d2dW?=
 =?utf-8?B?Q1J4WmdkYzlGVDM2SVc3Zm83TnQ1T01HOEQ4T0J5MW9WM1NoM1R4VTNrblBD?=
 =?utf-8?B?eW1NdXNYZDl6UEJXMENzcWtCQnlaMHQyVHNuNnZvZzJFbUZ3cktITDMrS3B5?=
 =?utf-8?B?clRCWTVBd0tzS1puRDhkbTdFQmFiRzl4QlVMOGEyYlFMQU9DUVMrcEdtcEhF?=
 =?utf-8?B?K1V6T0Nja3FtRFNMcXVqOHQ2K0NWNXV3NHZjU213WW9MaGMxSnZtRXA5alZo?=
 =?utf-8?B?YjZweU94WjAyS1FSRFlMR2ZrSlpKUFBTa0ZuOWZIakR3bGQrQ09LL2ZzZXJi?=
 =?utf-8?B?S2c3OWN2L24vWW0xREJURzNaS0tmQzQ1dXVwTGdYaHZjcXlib2E1b0RmUUhF?=
 =?utf-8?B?WmgwVVhjeFdhaFpLcHRpRWtKRkZGOFZxaXJKODgzNWJMSmNzNWtSa2U1Z1Vz?=
 =?utf-8?B?WmdNMDBCWmlab0w1M0ZMbkQ0azR2WEM3N082eXVCeUpqUWtNVFhMMExJYWlI?=
 =?utf-8?B?VkxTVGYxVWhUcVQ4ejRxOFVIa3hDOGlITFpRMDI2Z29OSHg4Z3ozQ0ttUXpj?=
 =?utf-8?Q?rRcLUUH8giO6Cq/UAo2OWkNpa?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5EBB8F34D7DCF4DBD1997987FB30932@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P195MB2328.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 579fa47a-51e6-4d29-85e8-08dd7ce1ca79
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 12:25:36.2591
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dws2dklI8gbb4QOGIoEkoxSnRHHyxBdO0t8GUQSKDRLsSkxxBSRrnzXZAolqgmaAoTj3frSq0WUC/vgLBuEX4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P195MB0521
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_052545_664265_F078BC3F 
X-CRM114-Status: GOOD (  20.46  )
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

T24gVHVlLCAyMDI1LTA0LTE1IGF0IDE3OjA5ICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4g
T24gVHVlLCBBcHIgMTUsIDIwMjUgYXQgMDM6MDQ6NTZQTSArMDIwMCwgRG9taW5payBIYWxsZXIg
d3JvdGU6Cj4gPiBBZGQgZGV2aWNldHJlZSBiaW5kaW5ncyBmb3IgdGhlIEFNNjh4IGJhc2VkIHBo
eUNPUkUtQU02OHgvVERBNHggU29NCj4gPiBhbmQgdGhlIHBoeUJPQVJELUl6YXIgY2FycmllciBi
b2FyZC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogRG9taW5payBIYWxsZXIgPGQuaGFsbGVyQHBo
eXRlYy5kZT4KPiA+IC0tLQo+ID4gCj4gPiBOb3RlczoKPiA+IMKgwqDCoCBDaGFuZ2VzIGluIHYy
Ogo+ID4gwqDCoMKgIC0gbm8gY2hhbmdlcwo+ID4gCj4gPiDCoERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9hcm0vdGkvazMueWFtbCB8IDIgKysKPiA+IMKgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2FybS90aS9rMy55YW1sCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9hcm0vdGkvazMueWFtbAo+ID4gaW5kZXggMThmMTU1Y2QwNmM4Li5hMDNm
ZGI5YzA0ODIgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvYXJtL3RpL2szLnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9hcm0vdGkvazMueWFtbAo+ID4gQEAgLTEzNSw2ICsxMzUsOCBAQCBwcm9wZXJ0aWVzOgo+
ID4gwqDCoMKgwqDCoMKgIC0gZGVzY3JpcHRpb246IEszIEo3MjFzMiBTb0MKPiA+IMKgwqDCoMKg
wqDCoMKgwqAgaXRlbXM6Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGVudW06Cj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBwaHl0ZWMsYW02OC1waHlib2FyZC1pemFyCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBwaHl0ZWMsYW02OC1waHljb3JlLXNvbQo+IAo+
IFRoaXMgbG9va3Mgd3JvbmcsIGlmIEkgYW0gbm90IG1pc3VuZGVyc3RhbmRpbmcuIFlvdXIgaXph
ciBkdHMKPiBpbmNsdWRlcwo+IHRoZSBzb20gZHRzaSwgc28gdGhpcyBzaG91bGQgYmUgY29uZmln
dXJlZCB3aXRoIGEgZmFsbGJhY2ssIHNvIHlvdSdyZQo+IGdvaW5nICJwaHl0ZWMsYW02OC1waHli
b2FyZC1pemFyIiwgInBoeXRlYyxhbTY4LXBoeWNvcmUtc29tIiwKPiAidGksajcyMXMyIiwKPiBu
bz8KVGhlIGNvbXBhdGlibGVzIGFyZSAicGh5dGVjLGFtNjgtcGh5Ym9hcmQtaXphciIsICJ0aSxq
NzIxczIiOyBpbiB0aGUKZHRzIGFuZMKgInBoeXRlYyxhbTY4LXBoeWNvcmUtc29tIiwgInRpLGo3
MjFzMiI7IGluIHRoZSBkdHNpIG5vdy4KClNvIHdoZW4gSSBhZGQgdGhlIHBoeXRlYyxhbTY4LXBo
eWNvcmUtc29tIGNvbWFwdGlibGUgdG8gdGhlIGR0cyBJJ2xsCm1vdmUgbXkgYmluZGluZ3MgaW50
byBhbiBvd24gZW50cnkgYW5kIHVzZSBhIHNlY29uZCBjb25zdCBmb3IgdGhlIHNvbToKCiAgICAg
IC0gZGVzY3JpcHRpb246IEszIEo3MjFTMiBTb0MgUGh5dGVjIFNvTSBiYXNlZCBib2FyZHMKICAg
ICAgICBpdGVtczoKICAgICAgICAgIC0gZW51bToKICAgICAgICAgICAgICAtIHBoeXRlYyxhbTY4
LXBoeWJvYXJkLWl6YXIKICAgICAgICAgIC0gY29uc3Q6IHBoeXRlYyxhbTY4LXBoeWNvcmUtc29t
CiAgICAgICAgICAtIGNvbnN0OiB0aSxqNzIxczIKCj4gCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC0gdGksYW02OC1zawo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAt
IHRpLGo3MjFzMi1ldm0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IHRpLGo3MjFz
Mgo+ID4gLS0gCj4gPiAyLjQzLjAKPiA+IAoK

