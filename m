Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A591ECD9B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 02:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+P7ccfzXvz0cVkl/XgMdzWbrfEUeDo2ZJss8UFlr0o=; b=wcuYL+X+IpJr+MJscX2CBvATq/
	5TVFzWF899HknTNt5rdflZllJfezS4UeEGwQWPUHzaVMgfgmprAx1MyDnv/wjb4x3JSQsGzbATO2s
	2WIeATvg6fLt/dNUdrEjUtfpbT6eqOEzE8L8nFnjkgIj1eix+gyLEaof9FIEvUHS72u1Y1d7Zfh6y
	aYSWR38yB2Ul10Q9TBowTqevN9VVxPKdsRQ4gtGw9iO8yLdFCvfrGABy/XMOSuhnX8xs6JGamUroW
	74y9aql8+bLb6u7pTlK2ExpK1nBpX6rJkw7/dip8MFunoC5vpnE3LcPOBF3ICwjxRzD+Z/xc8LwTZ
	z9XCI/4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voBeE-0000000Aldu-2yaJ;
	Fri, 06 Feb 2026 02:32:42 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voBeB-0000000Albe-2ab5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 02:32:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FHTSqw0zH6bvjdzLIsGSyWYIvX300eTHbIW6aKkskQYUTkBs3waZwfntbfcMrX3gJeNmWDtpMc2wcS7Uyg5qvAZws96GjF8VyuOPb65ZbcxP2PEHjD64QSGvUKyrWpu13vaclUcTO/BUiNkk54VeUllRQoNQfH/AwsmC9ypMMjYmID8v8hI7bzZc/8lGuSyM6a97s/lUx5JzZK54qyMpigWT5Dy0SPkoeFAlPX6krnciv4BtKi0UK+zO40wj5Gw1eHSgpr0AVLaK/snNBkX7B+8W7h7FSlHXZVtifEM1JVa8AGIsURTx0wh61y5ZAyd+EJx7hAM6clAPGs6mHwq2Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+P7ccfzXvz0cVkl/XgMdzWbrfEUeDo2ZJss8UFlr0o=;
 b=MlYeISpFDZAon6kNAti748wO5CEkKOtWjPSBd7aF/32dMtHuKfmRzNcCIc2/+T84dfKRGn6+ip5TPYcdleCduDUrtLACq8bL6eKtwZtYcex6xH4kVNZX6Tn4LpsADf3qkdjS4dUupSIf+lxSX2kSrkyn8pXvXxzhFqrjRgwQzXFaSb5dSyKcQEFAAKI+IBNqfif+oK2QAZWnuFnORBd7iFdCxsBzlGfbMIsa6VOIqoBVnTzfE9UdmTFTUwdLczgHbOxqGK7UiRBI5XIK7bAsV87HSqedpKf1DrSPWPoPK3i/huYrt+IqpwA3kCe18vIj75wsgMuILbgj91Z6T2uHYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by SEYPR06MB6250.apcprd06.prod.outlook.com (2603:1096:101:df::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 02:32:32 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::f320:58f6:4dc6:b908]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::f320:58f6:4dc6:b908%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 02:32:32 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, Peter Chen <peter.chen@cixtech.com>,
	"unicorn_wang@outlook.com" <unicorn_wang@outlook.com>, "inochiama@gmail.com"
	<inochiama@gmail.com>, "alchark@gmail.com" <alchark@gmail.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjcgMy8zXSBhcm02NDogZHRzOiBjaXg6IGFkZCBz?=
 =?utf-8?Q?upport_for_cix_sky1_resets?=
Thread-Topic: [PATCH v7 3/3] arm64: dts: cix: add support for cix sky1 resets
Thread-Index: AQHclXrrFsIpVnVUA0qE564ZVqSep7V0eYMAgAB7DTA=
Date: Fri, 6 Feb 2026 02:32:32 +0000
Message-ID: <PUZPR06MB588741C462CBBECB9D8BBD0AEF66A@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20260204020644.155094-1-gary.yang@cixtech.com>
 <20260204020644.155094-4-gary.yang@cixtech.com>
 <37966c65-69d6-466f-afe3-f17e549e369d@kernel.org>
In-Reply-To: <37966c65-69d6-466f-afe3-f17e549e369d@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|SEYPR06MB6250:EE_
x-ms-office365-filtering-correlation-id: 660dcde9-c799-4a1d-fd01-08de6527fb3b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?aWNmWnJZNGw4bFdyRkROVkJDd1JDeS90V3lNdWFvMTRDUWN6S1FlZlNYbU12?=
 =?utf-8?B?dGMvY1FPdVZkZGErejNlTW96L2UyMXhZdUVORENzd2NISmxBOEx6SXcwdjJl?=
 =?utf-8?B?OVVUZHZBVXVjTG44amNFeXFBZldmNmV4U3hBdUFodWNmdVlYOG9zTldlMCt6?=
 =?utf-8?B?Z3NHOWYrNnpDdlpIVkRrNFFaRHdrejNnNGFVdXk0dVhFTFdjeEZ5dTRxZkk3?=
 =?utf-8?B?cGxaOUJXZlNVWVFHQjFBd2JRUWdGMXlRaHQrK1ZkakFGc0tNSllFL2lGVStn?=
 =?utf-8?B?dUZVVDFoN0VhaVJBVnZnVENYUmNrYXVobzB5c0ozWEhWY3FjREVIYm9jWjJR?=
 =?utf-8?B?RXQ5YUJRMUM1aWZ3T0JxY0FveXNmcVJWMEx1OXVFWDJKNXd5KytBMWpIWGdM?=
 =?utf-8?B?YWNzYlVHRXlIajNMbENqRXVMRkYra3grM3NtMjMvUFZ6NHJKM2RQa244WUhp?=
 =?utf-8?B?Mm1YeEVVNFEvNlJtekpDZjdSQUFiM1MvQUNuUUdMYys0K3I1a0Nsdy93SmZQ?=
 =?utf-8?B?MzZiRHVKWlBhTERQYWVBQTBjT2xYTmQ5MzB6NnFJMlM0LzNjcmsvWjNCRHlH?=
 =?utf-8?B?UFRZOVF0RzRldHU1K2F6TTVuOG9YSFBaUEFxbnlTKzdCVFh0RzRBdkdZcXUz?=
 =?utf-8?B?Wi9VQlhZYWpGYTBkZ01IQkloc0J5YWd2YTc5SlUvaytrWElGN2NCeVJET29U?=
 =?utf-8?B?N1FheUxORU5iWFN4YWNBL3NkeEhnT1JxRFNEcnYxWlloZ05rLzdmVFVzbTBQ?=
 =?utf-8?B?KzJuK1AzbjQ4MUZEVmZZbzZzYXdlWjd5aWJKdldHMjJtU1lHRitmdGRCdFBx?=
 =?utf-8?B?YTFibUQyMVI2ZDB1ZU11WkJYWGt0TFlSOFRHUFJBTDFjaWlaVGZsSjZCaURt?=
 =?utf-8?B?Q2FrSTk5MXREL012aitQVmh5U1lsUHpHeWNOcktMb0E3NUpBK2hTcjRsbXBM?=
 =?utf-8?B?TmxKS203cWp2bnZEVWNkejFEWUxLdHpxeEZxem5FSFl6REd4dm1NZzFvbGFG?=
 =?utf-8?B?NUNIUk81OUtwNGVNMWc5blFHNldMQnpobGw1YVlQeGYra2ptL3Z1eXZOZ0Ry?=
 =?utf-8?B?UVlzcy9LS3FxMVVkRVhwSlBsVVduN2FjM0F3S1dmd0NveFZZOFQ4Z0JIWnZD?=
 =?utf-8?B?Zm42T1FBNkVnRGlTZ0UxcjE4QmwxTmNHWENpSm4vZVUrTStkL0tSemV4V1BH?=
 =?utf-8?B?WHowU1FkaHFTWnZWa1dlcm9pNVZZN0FtRU12LzZYNzFhakpEVkJ0OVUvUGtk?=
 =?utf-8?B?Wlg3Ynlwb2ZCcTR5NlQvRGs3UXIxWlJOMnVYMkZYa2w5MytiNm5URnZuTTBY?=
 =?utf-8?B?UHIxclhMYWN2V2tockFsUUozNXpqWkV1QkdOVWV1RHdRM2RVUGNtTnBOL2xx?=
 =?utf-8?B?RktYUTliSVBGdTA4OTNHaTVxZWJDd1RRVzBNMzZzOTZaaWlkNm53dzRRL3kz?=
 =?utf-8?B?alREN3hLWElKV0FQSnZ5QXRscFo2SVkrQUVTT05NR25PMlZZanNPWUM5MU5r?=
 =?utf-8?B?WFlBYmJFdWFkR09PYzcwRk9YWGY4US9OWVA2RlpTaXdVVmttK2hqcmdCR0xV?=
 =?utf-8?B?UU16MC82TmlQNVhVa3BqTWRhU1F1Z2tMRVlTMExEMGpiRXFnYUFtdGhpOU56?=
 =?utf-8?B?NHB3NmJDMDR3a0NDaFBwelYzQUZvRHNlS1QwdzFuY29iT0M0Qm5DRjJ5QzR6?=
 =?utf-8?B?RFlPellSVEFwZWNHTFN1anM0UThaV2s0dVhRUzJxOXk5dkxhdThGSzdyTmlw?=
 =?utf-8?B?ZVFtdG9VSE5xSlhTQXhWbXpPR0RPM0liRkQyV3dJempYbjAyYmNUb1ROWTMr?=
 =?utf-8?B?UGg1NXNFR3V4Qkc0RGNBOHVoZHRCcENPSVBxWTJuLzQraEI0TGNiYUFrVklo?=
 =?utf-8?B?YUVycWl6c1ZFSVpPV1RRVDNZdjFjYnAreXpJaVRLa0JtdXZoWmYxZlB1blRn?=
 =?utf-8?B?MmlWTGRuK2s3QnhUbjhpSmlhVzIyUElOR1RHNUwxcXM3c1VxZWE1dXBSYWVG?=
 =?utf-8?B?ZTVzNlZhK01ydE9pK3RaekNhL0ZiUWpWRkkxNW9JSEdCK2JTQVk0M3haQ3pB?=
 =?utf-8?B?RjVldk1EYlo1N1VuSTFYMm1wRWVuN0hhUHpUT3VKaEZDWXFwT25OTDFtbEFy?=
 =?utf-8?Q?BLHw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3o3djdzVmdwTEZXQ3huQWpZRlBWSkpTTzNXdTB6U0NnaXVSZkZNY1VVTCtR?=
 =?utf-8?B?b21PeWxobCt6eVpuU0pUZ2pGT0g2alZHZ0c5OHBkQTM0ZHI4TVcyU2VQYkJ1?=
 =?utf-8?B?b0xvenU0Yk83c3dacDdQOHJwYlhZL1Z0QlVTcFdiajFNOHo4RlFwZ2c4S2tO?=
 =?utf-8?B?S1dzMnN2SUxoajhpZGlaMEZKMTVGTnRZUnpPVE5BYzZIbVo5ckxvZ20wQVh5?=
 =?utf-8?B?UVVaSFhiM3Q3WEt2amdrTTM4MWZiRnFFMFhqOUdWQkRXNGh0V05QWnBwNS9B?=
 =?utf-8?B?Um04WEtGZk5TSVE1NHVxa1NWb1NncXI3aWpuV1E3emFkMHhVbERGdDYzSFhO?=
 =?utf-8?B?OWR3N0RUaGRUQngzVXdZZkZGaGpYTDdDVnJheUdwalg0dlU4VHZUU2FuRjdN?=
 =?utf-8?B?SThmU2t6eUNQaG5iMDVFZEhuYk5tdGVST2VCWThYcWZTNG5xTm1TYlkvQkV4?=
 =?utf-8?B?WDhYRmZDWDlHUE0zVGk5T0MxbmtCQVhpWVlCV2Q3ZWh4UmxBYnNQM2RZR2Ex?=
 =?utf-8?B?STUxc1N3RW1CMzk5S0oyS2JYYVJNSnN6cno3VVQ1RkljUHdHTVF3TC9kdDVP?=
 =?utf-8?B?TG4xUk1HM1lpR2h1cGpzSlVoa0Q5bVdJMlNCN2N1bXFZbkdXUlF4YVVWQTBl?=
 =?utf-8?B?Sklad1J2U240RW8xbDczK2FkdVdXTHVRUW9uN2crTHdXL3F4ZlZYclJTcVl3?=
 =?utf-8?B?cTBPNyt1YkhTMkxCd3ZNT2VndTQ4OFg3UkUrWXpzZ21lMzV2TCtRTkZhZ0Z1?=
 =?utf-8?B?SkdBYjlIeGZTeVdUc09IZ1lKNDBUc2FBU0dweGtsbzJVaTJDQ3NBR0RZSG1s?=
 =?utf-8?B?RkExbmdsWmtnTjVFelNyWndrcVFEWnhncXNzU3d2cnZBVXdtbUkzWWFKYzY0?=
 =?utf-8?B?dkFUT25YYkhXSW1vbnZHSlg0dStYOGZzOW9RanZOYnFrMTR0dnlJVmtTSm5P?=
 =?utf-8?B?amFIaVd5Rlpxb0JsbTBhQi9kdHQ0ZVcxMWNmL201MGpGRkNVWXQzYUNYTFp3?=
 =?utf-8?B?NjZQcjFGZGdjS0Q0VGU5NUVzdVRuZW1QZDIwQWx4QXdUaXRGRWg0cE83U1Vs?=
 =?utf-8?B?ZE43dXNkaGtnRHc3TTRNRWFqdlZ0ZC9xWEg2S3BGTlgyVG04OW1pK2hrdDBy?=
 =?utf-8?B?RFZJOE9zdkdicTlWL3RGb0pic013dzMvWmluQUhDZ3A5a1BseXhySG1rZ2F6?=
 =?utf-8?B?U3E0MnJOelZaaWFiUTliVHc0Z2FkNVF2a3ZXanV6Y3VSaGo5NzBRZS9udGdo?=
 =?utf-8?B?dTdVMUZYQkRrUUs4eHNPV0ozRjErK0JueXMxUUNmdTl6R0IzT0Z6Y3VuajhD?=
 =?utf-8?B?TEV4cGk1SVhxYzdnYWgrc0cwZEp3dVlOVUI2YkVnMmc2cDVVK05RNS9lV2hj?=
 =?utf-8?B?bkxNRjlVU2VKd0JvekJTU3NWUzRhdzlKT1p1SDcwY2JRMVBmVlNydUtWcHIy?=
 =?utf-8?B?Wk8xTDEwUTJSSlVha2dRbnQrTE5jWENVeGJEWkZLNWpSWW1wNS9EUTc2ZzRI?=
 =?utf-8?B?dExWak5EWnVBRE5ndmRtRnBMeGE3WkRzbTZoT0NlZ2Rkczc0VUhGVTMxbHYy?=
 =?utf-8?B?S1pvbVhvMldXT2F3ZVpGd0FMRnYyRlZ4cGZhRGkrOFpiYXdvVW9aNi9YVkNB?=
 =?utf-8?B?UmtxemZQSlJERjNkZmNnY2txTGRDUHp1akJic1NKbFluT1gxLzF4TnVQd2V4?=
 =?utf-8?B?UEo5ckJhOSt0VlZ1TjF0MlN4OURjVFEzekdLNEo2MGpmVkhZTzdXSVRxZEVQ?=
 =?utf-8?B?VzhFZXJSK0hkQm0rdGJsVFAxWWIvakNjRVlsVWlVdDVXWXcxQ1RZRzl6L3Z2?=
 =?utf-8?B?Y0ZoY05rVEF1eDNkblpBenp4MzRSK3ZPY0RURmNCRHB3cG5Ga1ZNbElqSFNz?=
 =?utf-8?B?V0U4cGZmenVxUmhLZHV5UGN0NUxzUzk3VmtkQW9HV2lvRFhlMEdLclo1Vncz?=
 =?utf-8?B?L2RScmZWREpSdnRyUTduYXlmYWRFZ1p6ZmRMblgvdXNOTXU5NWZCUWpscXRX?=
 =?utf-8?B?NVVwYkl1R3BlOTZPbU5yVitySjhwZDkyQVBZR1hZQWF5VVA2Wmpzd1FGcU1T?=
 =?utf-8?B?WmM5VmxoSVdHRDdkZHBGRk5yTDlFY3NBdDBtTmZjemdtNUE2K0c1TS9BajJ1?=
 =?utf-8?B?VWlZemZEeEFGMWhMSkl5K2FYMmpkTWh4dFh1dEdnekNFeVU5UjRNNDBoQktX?=
 =?utf-8?B?dVlvRUtxKzkvajZnZHhVTkhUS1VZVFBYNm5IM0JyS3MrNlF4eU9xTHlCSDZP?=
 =?utf-8?B?enlDcWpnNmMzYXZQUVYxVFZOdWEzVmFiNjlnWDAzT2hPc2FweDBaSVErQUdS?=
 =?utf-8?B?QmVEcmNYSzZlVnB2NjkwS3FRenVWZ0x5c3JIOCtSUzcrNlJGRnN3Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5887.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 660dcde9-c799-4a1d-fd01-08de6527fb3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 02:32:32.5931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dRkaxi7sxv/XC9DwX47+34OXwEaHHalaf1rd84Qv6fIxpVQBsotwnnENmV/3yMXzuTa8R/mylv7SCJEgY/mh4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6250
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_183239_656075_56AD97C2 
X-CRM114-Status: GOOD (  19.19  )
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

SGkgS3J6eXN6dG9mOg0KDQpJJ20gZ2xhZCB5b3VyIGNvbW1lbnRzLg0KDQo+IEVYVEVSTkFMIEVN
QUlMDQo+IA0KPiBPbiAwNC8wMi8yMDI2IDAzOjA2LCBHYXJ5IFlhbmcgd3JvdGU6DQo+ID4gVGhl
cmUgYXJlIHR3byByZXNldCBjb25jdHJvbGxlcnMgb24gQ2l4IFNreTEgU29jLiBPbmUgaXMgbG9j
YXRlZCBpbiBTMA0KPiA+IGRvbWFpbiwgYW5kIHRoZSBvdGhlciBpcyBsb2NhdGVkIGluIFMwIGFu
ZCBTNSBkb21haW4uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBHYXJ5IFlhbmcgPGdhcnkueWFu
Z0BjaXh0ZWNoLmNvbT4NCj4gPiAtLS0NCj4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9jaXgvc2t5
MS5kdHNpIHwgMTQgKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2Vy
dGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2NpeC9z
a3kxLmR0c2kNCj4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvY2l4L3NreTEuZHRzaQ0KPiA+IGlu
ZGV4IDY0Yjc2OTA1Y2JmZi4uMzdkY2E5N2I2YjY3IDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvY2l4L3NreTEuZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
Y2l4L3NreTEuZHRzaQ0KPiA+IEBAIC0zNDgsNiArMzQ4LDEzIEBAIGkzYzE6IGkzY0A0MTAwMDAw
IHsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiAg
ICAgICAgICAgICAgIH07DQo+ID4NCj4gPiArICAgICAgICAgICAgIHN5c2Nvbjogc3lzY29uQDQx
NjAwMDAgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImNpeCxza3kx
LXN5c3RlbS1jb250cm9sIiwgInN5c2NvbiIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAic2ltcGxlLW1mZCI7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJlZyA9
IDwweDAgMHg0MTYwMDAwIDB4MCAweDEwMD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICNy
ZXNldC1jZWxscyA9IDwxPjsNCj4gPiArICAgICAgICAgICAgIH07DQo+ID4gKw0KPiA+ICAgICAg
ICAgICAgICAgaW9tdXhjOiBwaW5jdHJsQDQxNzAwMDAgew0KPiA+ICAgICAgICAgICAgICAgICAg
ICAgICBjb21wYXRpYmxlID0gImNpeCxza3kxLXBpbmN0cmwiOw0KPiA+ICAgICAgICAgICAgICAg
ICAgICAgICByZWcgPSA8MHgwIDB4MDQxNzAwMDAgMHgwIDB4MTAwMD47IEBAIC01NjgsNg0KPiA+
ICs1NzUsMTMgQEAgcHBpX3BhcnRpdGlvbjE6IGludGVycnVwdC1wYXJ0aXRpb24tMSB7DQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgIH07DQo+ID4gICAgICAgICAgICAgICB9Ow0KPiA+DQo+ID4g
KyAgICAgICAgICAgICBzNV9zeXNjb246IHM1LXN5c2NvbkAxNjAwMDAwMCB7DQo+IA0KPiBOb2Rl
IG5hbWVzIHNob3VsZCBiZSBnZW5lcmljLiBTZWUgYWxzbyBhbiBleHBsYW5hdGlvbiBhbmQgbGlz
dCBvZiBleGFtcGxlcw0KPiAobm90IGV4aGF1c3RpdmUpIGluIERUIHNwZWNpZmljYXRpb246DQo+
IGh0dHBzOi8vZGV2aWNldHJlZS1zcGVjaWZpY2F0aW9uLnJlYWR0aGVkb2NzLmlvL2VuL2xhdGVz
dC9jaGFwdGVyMi1kZXZpY2V0cmVlLQ0KPiBiYXNpY3MuaHRtbCNnZW5lcmljLW5hbWVzLXJlY29t
bWVuZGF0aW9uDQo+IElmIHlvdSBjYW5ub3QgZmluZCBhIG5hbWUgbWF0Y2hpbmcgeW91ciBkZXZp
Y2UsIHBsZWFzZSBjaGVjayBpbiBrZXJuZWwgc291cmNlcw0KPiBmb3Igc2ltaWxhciBjYXNlcyBv
ciB5b3UgY2FuIGdyb3cgdGhlIHNwZWMgKHZpYSBwdWxsIHJlcXVlc3QgdG8gRFQgc3BlYyByZXBv
KS4NCj4gDQo+IGUuZy4gc3lzY29uDQo+IA0KDQpZZXMsIHlvdSdyZSByaWdodC4gVGhpcyBpcyBt
eSBiYWQuIEkgaGF2ZSByZWFsaXplZCBteSBzdHVwaWQgbWlzdGFrZXMuDQpJIGdldCBhIGxvdCBm
cm9tIHlvdXIgY29tbWVudHMuIFRoYW5rcyBmb3IgeW91ciBhZHZpY2VzLg0KV2Ugd2lsbCBmaXgg
aXQgb24gbmV4dCB2ZXJzaW9uLg0KDQpCZXN0IFJlZ2FyZHMNCkdhcnkNCg0KPiANCj4gQmVzdCBy
ZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg==

