Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41088CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZEyKm9FEeCZLquISkYDu1E6hhGfkNEZQPUDqJwMTzg=; b=bAtI8DoVyRXPH5EGz79XTTZuY3
	jDxAtuBhDw7kGnkAYzACj3ttet3ehIQFyTFCMQ4wPpO/eFH9r2LetEXQ1YZCDHQ+9k5/mKTZi4QW1
	ji73z+xUQzHdEuseSoaPOc365RXPbKbsaQ/NFKmWkoCCiO64JXQcI2tJ3sPbzzTsK1ydGy/kGKuWP
	ea+qiQ4ckbe76z8GD1PMshJXCOnMKQ6OsWNcTSpxStdHBTs7FMA/5WiwHVL/iVpu7lp7vuO1Ws9jC
	f30OXfidj+ZfxteYl0Af43iMpw3NP4u5RZhBK0b6y14udi7n1h1xa+F6stIN7iW4LZqFDqGNY5qfE
	WKWcSqtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9m8-00000007B4Z-0C4G;
	Sat, 30 Aug 2025 00:49:00 +0000
Received: from mail-dm6nam11on2070b.outbound.protection.outlook.com ([2a01:111:f403:2415::70b] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us3fM-00000006cVY-3Xgf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 18:17:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mNlZ0XKZMP9sLvnifnOzSbQ2QCwvwWTpCqNbMQ/MkzoQhjgMET7NNlJ9oQSQgYsFH13I45N2X469zU6zFcDPqgas/Qs2VjeTEyAgGX0Swwl39QOHXnkOWPFQqkHXjNH512M2UF3AI0IOySoJgi5KIBybC28CQke/Uwm/SABA1In12ng+nzpoV6W5c5rnE+GyCV3Vyl/ZKTFiNHcEEw+59QzfbaHSf06UjEU2xNSxwewEQoDe9KPrYr8vs+OflBXxmVxBNyMlqePWbCVaR0fcVxptj8lMM84pZlqZfJmuK1fdfbP9vVMVfYlv2glBeXDWoT8PNDU99oD56UpaK50Nlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZEyKm9FEeCZLquISkYDu1E6hhGfkNEZQPUDqJwMTzg=;
 b=pPvRJ7c1357xqGX1d0DWVvhlnuOYtQOW3/WEUBeNMKHYW9UAJx0hlHJLCTfisRkV4U9BCqnHMB2z5iMrOxy0GhETZ+qtY2s5ihwgC9SzZkrxIYMobHS5RGgk1APT+YJlrI5VBvY1Mx7yT1GOpN4kXmsA6hGX/oMWf3qLj7LUsfcXCyk3/B8WTUV9npNKdmmBWyKRok1OGF6wZ266jns0nXc1ImeGjqzDpnt7VR6ZiDxUZdbK62IxhGzx8u8m95VZp9Rzto6F2IMglYu0udqCkT7xseA35wx/auhK/pCzyf1TpdVbWmiFOgPJA6vTBACWfKPhPdWo1ABPonPHVPBhuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZEyKm9FEeCZLquISkYDu1E6hhGfkNEZQPUDqJwMTzg=;
 b=OKbrGx3uaIFgVsIAHZlVn9w3vWSbHyx1QTOgQVhNIqEgGU6H5zkeQqpOhm8aOIk1QrTSc8iddk0XkC88fjYzpP3+JS8Tch8hI89HMw2taQf7Wd6m/0vVcOvurGAWncFERQKvwkIcXIxRMUF/4OhwrBkrFxLUNPTljQpvLzod8eKYJYh95r/xwGW8i6Orq4Jt+mkgm9UI1vKYMMB+WlbwO79XbaJKHOcsLW6C9mv6TCj17cS8VcasIoCOL8zqx6maEoZQ0Rk/wKrFZyyfj6PxYzDufBhbwAOTpeRIyrQRlqVRZaeyfP1IMbkrZ2avHbC2Amtx4M8DUoK01yw1+ctBgQ==
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::c3d) by MN0PR18MB5944.namprd18.prod.outlook.com
 (2603:10b6:208:4be::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Fri, 29 Aug
 2025 18:17:19 +0000
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::fc1b:1122:169a:5b79]) by IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::fc1b:1122:169a:5b79%5]) with mapi id 15.20.9052.014; Fri, 29 Aug 2025
 18:17:18 +0000
From: Harshit Shah <hshah@axiado.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "soc@lists.linux.dev"
	<soc@lists.linux.dev>, "soc@kernel.org" <soc@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] arm64: dts: axiado: Add missing UART aliases
Thread-Topic: [PATCH v3] arm64: dts: axiado: Add missing UART aliases
Thread-Index: AQHcGEmAHveBGp5910y12eBPOJIdDrR5I3OAgADOSAA=
Date: Fri, 29 Aug 2025 18:17:18 +0000
Message-ID: <cb78b679-e349-43dc-a6ed-5b63b10d0d7f@axiado.com>
References: <20250828-axiado-ax3000-missing-serial-alias-v3-1-393111f4bd9e@axiado.com>
 <4e51bbdc-744b-4a23-a695-a6c49d82e779@linaro.org>
In-Reply-To: <4e51bbdc-744b-4a23-a695-a6c49d82e779@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PPFBEC4B1F8E:EE_|MN0PR18MB5944:EE_
x-ms-office365-filtering-correlation-id: 95951073-f886-4c37-ae7f-08dde7284a3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?K1Q1U0g5TDJidGxHYWN1K1ZacGhsaktKMzhBczFQVmRqSkhydWxBQ0NBMDI1?=
 =?utf-8?B?VytCcDczR2FLNkZHemR1N3haaTdDU0luejJQbFhJU2pEby94NmVxcVZqcXNG?=
 =?utf-8?B?aVpaR0pJeGFteUVIUEpSWWRocGo1aGFuOXB1UzdmSDR6MUNPK09KNGc0TFYw?=
 =?utf-8?B?bFFlQS9wNUNzQ3lJbXFhOUZiNEd3S0EvU0pCQW4ralU5VjBDUDMvcGdYeUts?=
 =?utf-8?B?U2ZuNVYvOWtUTHhySVcxN0VaeWVnblZFT0R1dExOdFo5MnYrSlZLeHNxTjY3?=
 =?utf-8?B?UVNTSTBIbGFGZjhQN0t5TWZpN3RvZS9OVXJyM1VuckF6VnpQZGYxYlhmUWZo?=
 =?utf-8?B?WTEwRExHKzR3WkdWazZmc3V1UGhQSXdPcnhFeEVsa0JHbE1wdnpZSW1ML2Ft?=
 =?utf-8?B?TlN6WDROMVlBTGlTamM0Z2ZHZmxUcnp2MHVZMHFjRXhUWUtZN3p3N0hsUHAz?=
 =?utf-8?B?Z2greks1ODhFT1MwQXVDMWg5RFlZMTM5YVYyZStoM0VNTTQxSHduY24rcTNG?=
 =?utf-8?B?Z3czRmVtRUhsRXBmdklMMkluMlFKWFhIdlV6SGp6VWhZc1h0L1QyczFJTkxL?=
 =?utf-8?B?dXB5cm9CK0s1Vk5lRGhoRDJObHNkaTYxYlZqTUg1WkU1QWpGTGxXNXZzV1dJ?=
 =?utf-8?B?TXhqV2tyL28yeFFsY2NTQUxNUk96alJ3VGcrWFFDYTVLWlgzL2lUSVhBdE5C?=
 =?utf-8?B?Z09zUW9jZmhENGpTS1FNV1hxSUx6ZEpFdTFEM1grQk1PcFRzek93RUVPQmor?=
 =?utf-8?B?aFRQMFAwRVQxYVhDdGtvUlJEY1lsb0hiVWpSZXRxOGNOams5WXpYT0lOaTND?=
 =?utf-8?B?NmRRMkw5eCtPM3hwd3FBcnNqRFN5RGpmTDJXbHkvelRuVXFqU3VwalFDaVUw?=
 =?utf-8?B?ZEtoNExua3pyK3J4ckxhak54SmJ1NjlhT2V2ZTYveUpaRDFiRkNWU2h5TlQy?=
 =?utf-8?B?cnBML0k5d0htRVJpSDJFMUdnTCtvUUFrd2llUGpCNyt3VXhIZW1JZmNEcUsz?=
 =?utf-8?B?bktuNUE5MTkzeXFPUVVFK010Z1ZncUxUZFUwV0doRklLa1FQWUdUZmRZOTUy?=
 =?utf-8?B?eUhabE0vS1Q1akVVQ1U2T2V3dkUrU1ZVdThUYW5PYjc2djZ2MjhZM0V5czJp?=
 =?utf-8?B?WkJMME9rUWlsaXRnU1lnZDNtUlA2UWsvc3BjQkhmME5icGtHa01XVEkwVWMz?=
 =?utf-8?B?Ykc2UGJPUkF4Zm84ODZaemFqSWVJenN2ZDFpT2FWZUFyWDB1S01YYWlGaTZi?=
 =?utf-8?B?T3pEVnNIUDVuSCtSZ2xaZ0dld0Z2SmhCRi8zRUlNTEZvUmJKMVVMSjc2UVVj?=
 =?utf-8?B?NXdGSWN2dlVTS1ZqQzZKcUd4MzJQeUFIV2h0L1hXbmdqbmxWLzNQWWVkUEE4?=
 =?utf-8?B?VnhUTVBRUUI5aVVrMGZ4NVR5eWtxdFFHMEUzTU1wMUdIKzZ4QnpqakF2VmMy?=
 =?utf-8?B?a2s5clUxb2xNTTNWMExNMEhHbVJad2pCdkdKNGlyM0Y2VmJyUHZ1NU1LcDlH?=
 =?utf-8?B?MkVGNEtMb2hwNldVeVR0NjJmOWtzRTJyVFM1OW8zMWd1aUlDTzhHaTh0SGRy?=
 =?utf-8?B?YWJMdlIxbmlla1FaNEpTNExJK2JBTVgvdjM0MUJ6T2NBSWR5ZGluZ1g5dDNa?=
 =?utf-8?B?NDl2QTRJZml5NjNVT3VkMEY3WTJoNElUTVN0OUplZHVVaWZLcThvVGtmQ3lt?=
 =?utf-8?B?aEFTNkxRRjRYTTBraXhDa1o0WWp2OU04ZmVSU2Y3M3ViY29LSFFwV0hPU2tn?=
 =?utf-8?B?QWx0Q01DTStPVjl5eWVUSUFTTENRcDF4S0h4NjhlVHhNV3pRZzcySDNLRGhG?=
 =?utf-8?B?S2ZNWmFka09JWjc0R01HVVVLZnlRRlVCcDNtV0tqa3V2TGpNdUZibXpUMGhS?=
 =?utf-8?B?RjFZb3UwYWFGT0FLQmJwdTJpRCtoTlZKZ0x4OHJuakkwMUwxV0JtMHFLWVdE?=
 =?utf-8?B?elFrZ1lpTTIyYjZYYk8vOGZ1TmlsYUtjWlJLU09Qd2ZEWUpERXh6YitFSEFZ?=
 =?utf-8?B?Ym1rVnk2Qjl3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPFBEC4B1F8E.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWRBclFRNzNlY1dGZExTREpMcDVoNUQzSkkxZXRRQk1GaCtOV1oxcmRCNUw2?=
 =?utf-8?B?WlJjajVWUm5FTUJXN2hwYnJoNTJ6WTlCbFZUeVV1dnJ4aW1FaVJFd0FhV0tR?=
 =?utf-8?B?ZUc5L09BdkR4QWVsVmJVZEl1cmpQdHg3LzFYZGd0VXR2QWtYSlVTYk5WY3lW?=
 =?utf-8?B?bGs4cjZoRlN5WUthRUE4VmtGVlF1c2phZXBhOEVIckhua00rUUVqUUx3ZFcv?=
 =?utf-8?B?UFRNRXRQcy80WlBGTDl0RFpJUzU2eXRHcnRVemlvZzdFWVpxMk9XeEdEQlkv?=
 =?utf-8?B?Y3NzRWdJZWVzRjk2ZUhQOFNVa0Q4cnA5TjFaN2Q1S2tWWEFhY3cxS0RLYUFR?=
 =?utf-8?B?dHlFUXA4dFY4dk11SUt5MXhEelNhd2dxcXJkTVlleEhXS3ZhT3ZEODIyNitG?=
 =?utf-8?B?VnVtNWZzcGY3NzNRdjFYQ0VIUytXYjZieFBpdk9qUG9vL2Yxbi9EWHhRWW03?=
 =?utf-8?B?Z0xiZ3B4RHJxNHRTVzZRY0xITW4zVURBNjY5TDIvOWhjbW5YcW1JQWNRNFdH?=
 =?utf-8?B?aVQzVXVKSzVjWktJckh0bURFVm9lTWc4VG5uaHhWK2toTllRdEc1WjA5L3hB?=
 =?utf-8?B?dHVrbXNDRzZ3ZURiZGtEZWE0bW9QU3dIQmd0Y3NKWmlxa3NPbkgvL01jZEJT?=
 =?utf-8?B?Yzg3ZzAwbEh6VjE5VldIQzVZSEEwaW9hSE16SFNWajF4RnU1czZzSDh0R3ht?=
 =?utf-8?B?VnlGc2prbTFqbEhqU1pyVXdIb0dadW9NbUtNVDAwQzRvYjAwRy80MEM3amJB?=
 =?utf-8?B?ZjdUN1ZINUo5YzBWZUxRamsyREloYk1JK0FIWUI0S3QxZTZycWRXM2owb3FV?=
 =?utf-8?B?NlBzZy8rM21LV3A4Z09nbUlLN3F0U2NrNjBnNzFZcjc4QkZYNHlmNUJKbUF5?=
 =?utf-8?B?ZVdzTkkxVWppd21UdFcrVjhmb1hIK1l3eDByWkkyUGppd0xMaWNKMkI1YnA3?=
 =?utf-8?B?alhBYlQ0b3d2dmFIT3U3Q1B0YzZpRm9uMU5lRzN0bWZiQjBuNDBNaytqMXU1?=
 =?utf-8?B?VjIyTTVVRTVqb3N6S0pKRVdVYm40Zi9oRVc3eVdOVEVNdnYrUGpaaUtBcUZQ?=
 =?utf-8?B?eCtnUFJ2Wmc4bll3Z2diWUNXZGFXU3MvTHErM2N0T0FMUHRaNFdFUmJPZ21B?=
 =?utf-8?B?NEhnbzVXUlZrSVpNbTJBLy82em5VeFVkRGJwMkppK3NPa3RYR1lHK3hxWWVa?=
 =?utf-8?B?ZEZUclZ1N3E1ZGJZQk1JVWhQNmwvZ0Q5OERoUmF3T29oMjVVbDFZQ0lYK3Ay?=
 =?utf-8?B?WHhKWmtLN3ZOZTFQamlCL0dhdS95UUpIQStqaWlKaXc0Y1hSemhXMWFmaDY1?=
 =?utf-8?B?RGVSbnJaeFJrT3RNTHVTVVh0elAvc2ZHV3dGcFp5NG01MFAzTFZkaW5pUStN?=
 =?utf-8?B?RUJsOENiYmxOaVpWRGJoU3lDOXRxRDVVdlAraFIzT1FkZHZ1R0MrQ0pQckNT?=
 =?utf-8?B?SzlrRzdaTnpSQ0h3cjJKSVpCajc0TzRLNUFVS3h2Z1FMMWp0ZUVpR1BaT09K?=
 =?utf-8?B?L1hkR3RBNXE2bHNEQ1UrWlZSRnBQdERZOUN4QnBHaWpteit2bjQzSmRMYkxG?=
 =?utf-8?B?blRrWUtqRlg1dE0wTTNlYThKZWVMSFdUQUs2UUp0MmZUVTRvM1R3VTBkRUJV?=
 =?utf-8?B?UW9Id1lVMWdBT3ZQakc0L2ljVGJrUEhIZFppM3dORnBWUEp1VlQ5b04xcVFS?=
 =?utf-8?B?elJrTVRkb0w3eldZQWJwbVVCemJRVWZtbmM3cWthWXZZbExlRE5Bd3d3M2xV?=
 =?utf-8?B?R25FUGpKeCs2NnJSQkFkQk9leTRlaTkzOTNkWjZxRUZ2SE5tamNrMGM4L0RG?=
 =?utf-8?B?QjU5MGQvY0ZNeDYyTFI0eUJJbFJYUGNZSmxVZ3plYjMxM0xaR1JKT05oUktH?=
 =?utf-8?B?c09MWDNRazZNNE1rTnhNOVg1SEVHRjhzNVFjOUN1ajBlUGJ6YnAxWlgzYTll?=
 =?utf-8?B?UStaaDNQS1ByUVpBVHk0Ym16bGVNRldnSWIyL0VWVWtBY1p0RFFHODFpdHFo?=
 =?utf-8?B?aWpPQjZ6c2U1VkcrQkFCNkJqN2hMQzlVSkhMWVBOejhMbEVPajU0VnF5RzJJ?=
 =?utf-8?B?WkdSb0o0b3g0QXdVaWRRVHhmRWZ3d3NmNlphUnNaR1hZaHI1UVlZSjVsQkRL?=
 =?utf-8?Q?9dBc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DCFBCC4C36499C4EB3B7C4F55DEE0F47@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95951073-f886-4c37-ae7f-08dde7284a3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 18:17:18.6111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y4ukiYtgP2U28+1qwUmm6UXa5SLHeVQfzsyZQe+Ve5YJPcCj1D5MXAuC8Y63bFfiodNm9OwFSX8QwemY7vxW/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR18MB5944
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_111736_900135_A2C9B6AF 
X-CRM114-Status: GOOD (  13.38  )
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

T24gOC8yOC8yMDI1IDEwOjU4IFBNLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiBQbGVh
c2UgZG9uJ3QgZG8gdGhpcy4gSXQganVzdCBnZW5lcmF0ZXMgdW5uZWNlc3NhcnkgdHJhZmZpYy4g
U2VlIG15DQo+IGluc3RydWN0aW9ucyB5b3UgcmVjZWl2ZSBvbiB5b3VyIGZpcnN0IHN1Ym1pc3Np
b25zLi4uLiB1bmxlc3MgeW91IHdhbnQNCj4gdG8gc2VuZCBwYXRjaGVzIHRvIHNvY0AgKHdoaWNo
IGxvb2tzIGFkZGVkIGhlcmUpIGJ1dCB0aGVuIHRoaXMgaXMgYWxzbw0KDQpIaSBLcnp5c3p0b2Ys
DQoNClllcywgdGhlIHJlYXNvbiBJIGhhdmUgcmVzZW50IHRoaXMgcGF0Y2ggd2l0aCBhZGRpbmcg
KHNvY0ApIGFzIHRoaXMgaXMgDQp0aGUgZml4IGZyb20gdGhlIHByZXZpb3VzIHNlcmllcy4NCg0K
Rml4ZXM6IDFmNzA1NTc3OTAwMSAoImFybTY0OiBkdHM6IGF4aWFkbzogQWRkIGluaXRpYWwgc3Vw
cG9ydCBmb3IgQVgzMDAwIFNvQyBhbmQgZXZhbCBib2FyZCIpDQoNCknCoG1pc3NlZCB0byBhZGQg
dGhvc2UgYWxpYXNlcyBhbmQgaXQgaXMgZ2l2aW5nIHByb2JlIGZhaWx1cmVzIHdpdGhvdXQgDQp0
aGVzZSBjaGFuZ2VzLiBTbyBJIHdhcyBob3BpbmcgaWYgdGhpcyBjb3VsZCBiZSBtZXJnZWQgYXMg
dGhlIGZpeA0KDQppbiB0aGUgdXBjb21pbmcgLXJjWCBiZWZvcmUgdGhlIG5leHQgbWVyZ2Ugd2lu
ZG93Lg0KDQoNClJlZ2FyZHMsDQoNCkhhcnNoaXQuDQoNCg0K

