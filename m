Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A91EC1E97
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 10:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwnsdFkoqp1Zdz1N/ECCqmbbAHWwmUs/MaPVHdtmrIY=; b=huDRhNm0ahvK5iYq2PrH/OQSOG
	WQHh2UzmOi0QKvJ1ZMlijov4ZAwe+7xHDdEFwXhJmJFBqcv9iOR8yRXNUp1+EUbGXZ9EDJTPAojl/
	8Rsgxv7NqVksZs1mnNLVkrQInGLR9wjLbQqViCPeDlLXNBDF//NPeh3UlMQxu44qNyqqt/yDJ5WYW
	DpVjNRz8YBpn43nVh+SkiZPyS1WkSvFLS+s77CTFkB1aYIxTPJ2E3qq4IFOndVuJ6iBfGZogpLHU3
	ixAhXNTk9UrF8+PRtA1E0b3HgceMfJGlAULg2cHrBQjMKw1CQ/AZIL2lIDTWI6/eTaa9dbyV2zduY
	VWTicuQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwlc-00000009nEU-45Lb;
	Thu, 05 Feb 2026 10:39:21 +0000
Received: from mail-japaneastazon11022111.outbound.protection.outlook.com ([52.101.126.111] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwlX-00000009nE5-0mXw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 10:39:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MA+iP7Qx8uwM+aDk8hGd/R4NpzMg2PoiLapP1M2j36yqxvFHTjjQoTBv9/Qk4CMGaAZoT1MfxjB3RtU7c9Tr0Ku370+AwlritvY52NaxPWahhGkz2qt+98gI9vaLwFisWwDoYLwLrJ5+Cl+Wd+G5npmrMErko6DFQm5hnp0sFIFgIbdkhTydOBkK+9nN5ULiC6QuXMqxrJBuALjMqw5qPTAs+u/pPQeBPaFVgMfGfa0v3uS75ebmq68IdcUB49fAJIEgVwcgdKIgIGQG6wGmsvqSusyEAezPdlPLgryzk6M+5iYpx4xwlzgKWNbLhf29jGfFTK1IJ+neVw1x/fBemg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwnsdFkoqp1Zdz1N/ECCqmbbAHWwmUs/MaPVHdtmrIY=;
 b=B051yawjkl8pix8FYEVHOOqq1zDlP7Q/cbf/DWq3Sa4/eVKvuSQMNt0SghFvKuy/h/Jb4/9I5XOPyiCYq1QoBq4uuc7sRfhtV7RG5uF06EUehWWYWRCW3mFL892FaHBsGjo2QRFNQ1jx2Ri6aIt/va1MFJ9PmH+A406sK1bhxdm9T1IF2Ea9BhQVDLGsOMpdhGiCdsdICURuCcuRsd9wYuFF5munJXXzZJwNtP/kuSwtIUVXTtB75C1TiSjuK3+nCYeoTC6PsGafxfqW0MQyXXbFDk6hJP7hE8ZYqLYGkdmUuFmoRorutBUG0H5vvex4SO/oshaKLyBoalbA5Nv5lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from TYUPR06MB5876.apcprd06.prod.outlook.com (2603:1096:400:35e::5)
 by TYZPR06MB6745.apcprd06.prod.outlook.com (2603:1096:400:45a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 10:39:08 +0000
Received: from TYUPR06MB5876.apcprd06.prod.outlook.com
 ([fe80::6718:b716:70e:9b32]) by TYUPR06MB5876.apcprd06.prod.outlook.com
 ([fe80::6718:b716:70e:9b32%6]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 10:39:07 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, Peter Chen
	<peter.chen@cixtech.com>, "unicorn_wang@outlook.com"
	<unicorn_wang@outlook.com>, "inochiama@gmail.com" <inochiama@gmail.com>,
	"alchark@gmail.com" <alchark@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjcgMS8zXSBkdC1iaW5kaW5nczogc29jOiBjaXg6?=
 =?utf-8?Q?_document_the_simple-mfd_syscon_on_Sky1_SoC?=
Thread-Topic: [PATCH v7 1/3] dt-bindings: soc: cix: document the simple-mfd
 syscon on Sky1 SoC
Thread-Index: AQHclXrrewrnwC3gtEqZNCvf3astaLVz1EwAgAAGp9A=
Date: Thu, 5 Feb 2026 10:39:06 +0000
Message-ID: <TYUPR06MB587652FD43724BE26B15975DEF99A@TYUPR06MB5876.apcprd06.prod.outlook.com>
References: <20260204020644.155094-1-gary.yang@cixtech.com>
 <20260204020644.155094-2-gary.yang@cixtech.com>
 <20260205-noisy-fabulous-bumblebee-e0cb32@quoll>
In-Reply-To: <20260205-noisy-fabulous-bumblebee-e0cb32@quoll>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB5876:EE_|TYZPR06MB6745:EE_
x-ms-office365-filtering-correlation-id: 3ae365b2-a123-4b1f-098c-08de64a2ca21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?Qk5EeHRSOTVocGw3RFRaT29EeDNBd3BOYysyTFBnMWtiUHVDVmRiRFlSRnhn?=
 =?utf-8?B?WnVDMHZkUXJHdHM3OHd6bnppUWpJZnZOSmhsRDdJN0VJK3NBMC9SdEY4b1Fo?=
 =?utf-8?B?SWxCTnJWMUJ1bDI0alhaQnJQaEI5WVQ4RGcvMmIwVXQrSUhvUVE2T0s5V3d4?=
 =?utf-8?B?WlFCM01Ud2daeTREVmljZ2JYeXBPZzZuOGo4bllRUVVlTk1DWkFQNFVmaTV4?=
 =?utf-8?B?WnhrYWVaTWkvZGc2Mld4ZnRDSzRyWExPN0NMYjJtTU8rZks4M2FJU0ZtMlhE?=
 =?utf-8?B?dkFJQk90QUNPS2JjNzlZdUlCMU11Q1UrUk9nMkt2RWNhd0NObWg1L090d2hw?=
 =?utf-8?B?QVBZc1F1WjhVN09GWHZRU3VKd3dhcGxQTlFPVnNMYm9iTTVkVk1nNjFuTS9r?=
 =?utf-8?B?LzRiZzQ2S2ZqOU9ESW54N0NYeEpOQW9LS1ByMGZKL3V5cERKU0tJaW16b3Rq?=
 =?utf-8?B?VVJkZW1RR29odFhRRTQrUXB6MnpXc2Nyek52RTF4WUFTNXRxZUNxVGlNWWVE?=
 =?utf-8?B?SmhiQUVVSlR5K240eVdvR1lESVhkNFV1ai9uSVVoNTdReisxMlE0ZUF5OE9o?=
 =?utf-8?B?TjA2b2JQKzIwMlpWZnZJUVdXRjhYSXI1QjQySCsxNHZ5NDRwVkNUNG1vOStL?=
 =?utf-8?B?eGU3dWVyaFRxdjhSYkl1ZURlNHZxYWVWS2xqbHVZT1NjOHlKNTNCSlY0Y0Z3?=
 =?utf-8?B?b2VER0hINHdpd1RVc1BJdDZEVXp4bi93UHNNL1hHV1RXaHU1VHRYR0pDVjVW?=
 =?utf-8?B?ZnUyaS9rWElwK3I3VXFRQytFU3h6WHZXNGZkaWVTb25CWk5TU2RJY1NWc0VP?=
 =?utf-8?B?NzU3RzN4TDJUZWJmUEpyTG5yRm5IUXQ5bzZoSTAwZVFkMk4xbmo5SnNUWDFn?=
 =?utf-8?B?Ui9yejNENmdZVm00akNKL1huRHY3dVo2UmFhOVREVGFTUTVzdEJHMnM5Q0FZ?=
 =?utf-8?B?ZGFHcHJGVmQ2RHZQSHBsS2E5YmlZWlVIWkpRYngzU3hEOUVyWk5QVmZvTzls?=
 =?utf-8?B?YXpzMU5IL0NaRHc4R1hUQVpDK3dGajlvZnlqcmVZTUg1SVJ2cXV6ZkU1aG9G?=
 =?utf-8?B?cUVRdkFkYTlaY3VzODRuK09kb21yam5RM2drSE5vN2JSOUlzQnlkV0JIVXRs?=
 =?utf-8?B?ZnFhL0lGVFg5U3JEUVgwQnB3Vk1NWk9sQ0ZwM3Z3V21WNXBlNlUzZlpOVm1v?=
 =?utf-8?B?Y1lJZFhDK0FjRWxCSHNWdkhEK1ZOa09qM0duL2VFcXUzTzNaVFJTdGF1RG9r?=
 =?utf-8?B?TkZKbzY4Y1pSSUZoTzluQ3VpTnljUXY0ZitwdmdvTGVIaUY2YmJsSTlLUlJw?=
 =?utf-8?B?dTdITHNmOWZzOGlSVGFwYWF0bVg5eEovdklqeGl4NlVaNUhienk3ZjROSmYw?=
 =?utf-8?B?VDNoWlFEYlNFMk5NQ0s2YnBFT1BlYVNHZTRPajRPcklYMWV0NjVZNzhUOGhH?=
 =?utf-8?B?R2ZpZ3VxaXo2d1p5b3RkQldUdWgzVmVDKy8xU24vUlozVUtsd1NtSWQ2aVlQ?=
 =?utf-8?B?SzU4eHJCUnhsZlpKOVN0STRlVGN5Vk82dTlsSlhObmRwcUF5emZhMzZRckNv?=
 =?utf-8?B?TDlwTkszR0p6aU9ORFJuL3U4WXhUUWpLQ0NzanVpYklVSVdQNnVnaDRORXNN?=
 =?utf-8?B?ZmlZUVFKQVR0YWNBejl1R1ZOdmZKczNwd2F5RWRDeUkyWjhKT1VFdTJQbEZE?=
 =?utf-8?B?QnJaKytYMitTSCs2VmVMOUNYa1A5Z2ladEFyc040MEZEc0w2VEFUTDV5Ujcy?=
 =?utf-8?B?MnFKYTBVNTJpaUMwVG1WVy9hbkdNRXJoMEl6MCtYMWEydm9DRGtiZ3pRcS9l?=
 =?utf-8?B?RzBzcnNpZ3JVOE9DdDN6ZXc3OERLTlR0Z256eW5lWmMvOHl1QVI0TFM4c0RT?=
 =?utf-8?B?ZE16VnhRQlMvMjBRUGJlejVjR0FvTFk3Nkh4V0ZFbXRldnk5TGJoaTdTR04w?=
 =?utf-8?B?YzVMeDFkSDRxbm14SnF6TVErQzJJYzA2NHdZNVRIMkJMOHhBRi9SL3BlR0Rv?=
 =?utf-8?B?RGdHZlJhbW9EdEhTVUM5TnR5UWlEazVRVkhiZTJwaWNPQzNvcUhOTmEyUU9Y?=
 =?utf-8?B?OTNtSVAwTFAyejR5UkFpRm83amNkR2ZQbWVMd0F1ak4veWNFb3hpNUFHSDdO?=
 =?utf-8?B?UkkzNVBRMlJDWUtXc2lxWlI5ZndjSVhNN0tMK1QzY3UxbFFyaUVsT0lqbkhu?=
 =?utf-8?Q?VWMCh90w6JdE5v/W/hu8629CgnOX3gaazCMUBRchQ8ez?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB5876.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SytHaHJ0VTJvaXBxSDM2N3Z5T3BnZ0FFUm9pbkNiTmZ2QXhyQjVkRmJDSHAz?=
 =?utf-8?B?bjBoaDlrdHN6MHdTNXMvYzlrQXY1d3dVOTYwRThsSjRBWnlpdjBkZnBnQ25z?=
 =?utf-8?B?M2pRSmgzOTZ3UHZ0V00xbUlIRURQY3J6aFZiYXZKeGVnaTRPVjVVQ09wZzhi?=
 =?utf-8?B?b0U0c2VFWWdMcVQ1NXZjQ2xXNjY3dkFlVXVIZWwyS3F2Y0FCNlk2RmdFY3F5?=
 =?utf-8?B?VTdlSXlnSVk0ckNMYzZZZ3MyNW1EK1ZyQXRTQ0JoelJJQVk5RkpyeGN4WmpL?=
 =?utf-8?B?Zm11RS9mSVJYYmFNb3FqMWYydmxuWk9zc1prQjR0U3lkSW44VlJyQzJhZjJz?=
 =?utf-8?B?OGNqSmszcXhrSlBLQzVnRFJ0aVlTUmdlSlhMMk1leEl2UTVNOVhSbE5uNkVh?=
 =?utf-8?B?dEpib1IycWZ2L2V4czNSdnY2NmVYOFlNZjMybml5WUpFaEVhZ0RrZGNFS0Rs?=
 =?utf-8?B?TktXZjNOY2RZNVhUbWc2dGREZGRyaHdNeU1DRENIQlZMeUtEU0FWdmZLK0Rl?=
 =?utf-8?B?N3BlMWs1SlU4Q2RwV3F5T3RZNlR2aENTZ1BvNGFkTXd3SHUxYkZqa3F4eW5P?=
 =?utf-8?B?OXk4eTdRdUJJdlVsQktiMWMzTTFUOTlObzg2TEdjQlRONVIrQmNOT2RML1VW?=
 =?utf-8?B?THNZNWtSZHpkVUt5bjIvRGpSOHBBMkdXbnN1MU9Eby9RQnJoSGtQcUgxMk9W?=
 =?utf-8?B?bUxkd0tEZWpIdnNiaWxuYWRyWE5JdEhwa213SFNsSFdGUEY3M0FnbGl6QWxh?=
 =?utf-8?B?eUE3T2pZcXFya04zYUhkdU9ZNWlVc21INlVLN2ZuaXJ4ZnRZOHkxU0hWcTJq?=
 =?utf-8?B?WFZnR2Z3bnNBaTFtRS9TbDBMTlBwRWpBNVphZk1lOVp1R2NQdXVlSXp3RUJJ?=
 =?utf-8?B?MGM2OG00QTRFSnovMEZLSGdVSk93WjF1SkhYYXUzaHpETzBvZm1lZHN5Ui8w?=
 =?utf-8?B?a3F0eXZ3eWMyWjAyNnlFcDZSNFpHenhJV043WUJZVERFN1ZKMmJGejQxNFYw?=
 =?utf-8?B?K0hGV1dvU3NEOE05YTdnS2VSTDB5WCtVVHRQZ0xzZ3NXaVVIcVpyYzJZMW45?=
 =?utf-8?B?cWwycE1pZmY2RGNZeHhHNDlZcGNmbG1oNzVaWTZqQ0YrallRNVMyZXBOVHhj?=
 =?utf-8?B?dEsxYkE1cXNqY0NVSGtmNno5VVl3cW9FS0h3VVJkZW9jMUhpQTNwaVlmei9C?=
 =?utf-8?B?RUlBYzBhSmZGNjEwR2h6WWd0dmRXQWpRVUdEckhSUW8yeWJ0TjhkUWs3bXdD?=
 =?utf-8?B?dUJ6QU94RVRxZnVXekVlSGZwOU5GSjh5ZTV0cHlaVCsybzVhbDJNNGdBVllS?=
 =?utf-8?B?eHR4WVJIdWZRWGFlcVI5RC9ZRkNHRXY0djNZVnZ4c3N0ZzE0d2hhMWhEMXE5?=
 =?utf-8?B?L3pzQmMzSEF5cm1QV01VNDJORHJBZ0xZbEZsNlpQd3FLVTc1aXN0dGk1LzM0?=
 =?utf-8?B?WXo5RW5DOTFGUnBaR241RjJqZUFwZE1LMU1VUEEyMlFFMVpXN0ptMC9xUk8x?=
 =?utf-8?B?SzQyQmIxcDR1blkxRVBRQkdNN2FDU3JqSlU2dHpyWWRQbmlJNnVUNmlER2FC?=
 =?utf-8?B?bkFkU3dVOUZqemFiNkN3aDRwcFZiU1FwSHdONUFkVHhndEhCL3Y2MTV2bnF2?=
 =?utf-8?B?S21WWU9WeStBbUtNUHJkL2UyVDZPcUFreGdDN3RlMkxvRTdRNXBCT2YyQ0N0?=
 =?utf-8?B?dHZtMnlYV0FNMGpBTlJOM1M5U3IzQmpEQ0g2MVF5bnl2YkU2ZVgrRmt0SEhB?=
 =?utf-8?B?ZlJZR1pSSm1HWHFNK2FEVEtrWnUvclBPVWQrT3hLTFd0bktvZ21sckhDSVVZ?=
 =?utf-8?B?Mit5MEo4K09HQkhacXdYQ3FQTlR3alpDQnN4SzZ4M2VVL1lRaXp2TG5MbW5q?=
 =?utf-8?B?SEZpRDhyV0VNWnNsSGM1K2FlT0lSR1NaVnNGa3hLRzJtcnFkR3Q5K2ZXU0sr?=
 =?utf-8?B?NjBUaXZvLzVUSDNFUVlJa0JKTlVlMlY4SzlSM3paQWVjQVY1S0ZkYU1zelRR?=
 =?utf-8?B?L1kyNXljSzhDUS83bm45RysyREFwL093THVEdE1zRHQ2Qjg4WVhITEJva21K?=
 =?utf-8?B?bjNBVjNTbVZxc2JLTDd6MnFPc2VLdGFweXpwcmZCQXZpc210VUZtUWZGeHVR?=
 =?utf-8?B?eWlndWR0UXUyQ1BHWWdMY3M4djFLVlVyMVFHMVFMdEtJcWhhOXBOWXhOZ21R?=
 =?utf-8?B?dHFNSFBJd0ZkazFIc08vbU5sU2xSL3JibUphR29hQzI2RVNTRVZWTGQ4UVNK?=
 =?utf-8?B?RnNZQk5GaTEwWi8vbGcyN29lcHFTTXk3ODlDNFQ4aXBUSWVMa2ErUlY2NU1a?=
 =?utf-8?B?aUdLa1czNEJ3QXhVMUVuWXlPcXo2NzJrVHpFK05zMy95TG1EVFpjdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYUPR06MB5876.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae365b2-a123-4b1f-098c-08de64a2ca21
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2026 10:39:07.1264
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: otXlaHCyEU947J5FAOEciEDwtFmXORPhDU9+zycM84dfVFkoUb7HpvUZuQliGSr+d1Oh4KRGen2y2gNgt3geQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6745
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_023915_247265_C809FC10 
X-CRM114-Status: GOOD (  24.74  )
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

SGkgS3J6eXN6dG9mOg0KDQpJJ20gZ2xhZCB0byBzZWUgeW91ciBjb21tZW50cw0KDQo+IEVYVEVS
TkFMIEVNQUlMDQo+IA0KPiBPbiBXZWQsIEZlYiAwNCwgMjAyNiBhdCAxMDowNjo0MkFNICswODAw
LCBHYXJ5IFlhbmcgd3JvdGU6DQo+ID4gVGhlcmUgYXJlIHR3byBzeXN0ZW0gY29udHJvbCBvbiBD
aXggc2t5MSBTb2MuIE9uZSBpcyBsb2NhdGVkIGluIFMwDQo+ID4gZG9tYWluLCBhbmQgdGhlIG90
aGVyIGlzIGxvY2F0ZWQgaW4gUzAgYW5kIFM1IGRvbWFpbi4gVGhlIHN5c3RlbQ0KPiA+IGNvbnRy
b2wgY29udGFpbnMgcmVzZXRzLCB1c2IgdHlwZUMgYW5kIG1vcmUuIEF0IHRoaXMgcG9pbnQsIG9u
bHkgdGhlDQo+ID4gcmVzZXQgY29udHJvbGxlciBjaGlsZCBpcyBkZXNjcmliZWQgYXMgdXNiIHR5
cGVDIHVzZXMgaXQgYnkgcGhhbmRsZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEdhcnkgWWFu
ZyA8Z2FyeS55YW5nQGNpeHRlY2guY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vc29jL2NpeC9jaXgs
c2t5MS1zeXN0ZW0tY29udHJvbC55YW1sICAgICAgfCAgNDkgKysrKysrDQo+ID4gIGluY2x1ZGUv
ZHQtYmluZGluZ3MvcmVzZXQvY2l4LHNreTEtcnN0LWZjaC5oICB8ICA0MiArKysrKw0KPiA+ICBp
bmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0L2NpeCxza3kxLXJzdC5oICAgICAgfCAxNjQNCj4gKysr
KysrKysrKysrKysrKysrDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMjU1IGluc2VydGlvbnMoKykN
Cj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3NvYy9jaXgvY2l4LHNreTEtc3lzdGVtLWNvbnRyb2wueWFtbA0KPiA+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9jaXgsc2t5MS1yc3QtZmNoLmgN
Cj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvY2l4LHNr
eTEtcnN0LmgNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zb2MvY2l4L2NpeCxza3kxLXN5c3RlbS1jb250cm9sLnlhDQo+ID4gbWwN
Cj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvY2l4L2NpeCxza3kx
LXN5c3RlbS1jb250cm9sLnlhDQo+ID4gbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+
IGluZGV4IDAwMDAwMDAwMDAwMC4uNWZiNmI5N2MzYzAwDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvY2l4L2NpeCxza3kx
LXN5c3RlbS1jb250cm8NCj4gPiArKysgbC55YW1sDQo+ID4gQEAgLTAsMCArMSw0OSBAQA0KPiA+
ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNl
ICVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOg0KPiA+ICtodHRwOi8vZGV2aWNldHJlZS5v
cmcvc2NoZW1hcy9zb2MvY2l4L2NpeCxza3kxLXN5c3RlbS1jb250cm9sLnlhbWwjDQo+ID4gKyRz
Y2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPiA+
ICsNCj4gPiArdGl0bGU6IENpeCBTa3kxIFNvQyBzeXN0ZW0gY29udHJvbCByZWdpc3RlciByZWdp
b24NCj4gPiArDQo+ID4gK21haW50YWluZXJzOg0KPiA+ICsgIC0gR2FyeSBZYW5nIDxnYXJ5Lnlh
bmdAY2l4dGVjaC5jb20+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjoNCj4gPiArICBBbiB3aWRl
IGFzc29ydG1lbnQgb2YgcmVnaXN0ZXJzIG9mIHRoZSBzeXN0ZW0gY29udHJvbGxlciBvbiBTa3kx
DQo+ID4gK1NvQywNCj4gPiArICBpbmNsdWRpbmcgcmVzZXRzLCB1c2IsIHdha2V1cCBzb3VyY2Vz
IGFuZCBzbyBvbi4NCj4gPiArDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0aWJsZToN
Cj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGVudW06DQo+ID4gKyAgICAgICAgICAtIGNp
eCxza3kxLXN5c3RlbS1jb250cm9sDQo+ID4gKyAgICAgICAgICAtIGNpeCxza3kxLXM1LXN5c3Rl
bS1jb250cm9sDQo+ID4gKyAgICAgIC0gY29uc3Q6IHN5c2Nvbg0KPiA+ICsgICAgICAtIGNvbnN0
OiBzaW1wbGUtbWZkDQo+IA0KPiBEcm9wIHNpbXBsZS1tZmQsIG5vIGNoaWxkcmVuDQo+IA0KDQpZ
ZXMsIGp1c3Qgbm93IHRoZXJlIGlzIG5vIGNoaWxkIG5vZGVzLiBXZSB3YW50IHRvIHJlc2VydmUg
aXQgZm9yIGZ1cnRoZXIuDQpJZiB5b3UgZmVlbCBjb25mdXNlLCB3ZSBjYW4gYWxzbyBkZWxldGUg
dGhpcyBzdHJpbmdzLg0KDQo+ID4gKw0KPiA+ICsgIHJlZzoNCj4gPiArICAgIG1heEl0ZW1zOiAx
DQo+ID4gKw0KPiA+ICsgICcjYWRkcmVzcy1jZWxscyc6DQo+IA0KPiBEcm9wLCBubyBjaGlsZHJl
bg0KDQpUaGUgc2FtZSBhcyBhYm92ZQ0KDQo+IA0KPiA+ICsgICAgY29uc3Q6IDENCj4gPiArDQo+
ID4gKyAgJyNzaXplLWNlbGxzJzoNCj4gDQo+IERyb3ANCj4gDQoNCnNhbWUNCg0KPiBEbyB5b3Ug
c2VlIGFueSByZWNlbnQgc2ltcGxlLW1mZCBiaW5kaW5nIHdyaXR0ZW4gbGlrZSB0aGlzPyBUaGVy
ZSBhcmUgbm8uIERpZA0KPiB5b3UgcmVhZCBhbnkgb2Ygb3RoZXIgYmluZGluZ3MgYmVmb3JlIHNl
bmRpbmcgdGhpcz8gT3IgYXQgbGVhc3QgbXkgc2xpZGVzIG9yDQo+IGFtbnkgb3RoZXIgcmVzb3Vy
Y2VzIGZyb20gdmFzdCBkb2N1bWVudGF0aW9uIGZyb20gZWxpbnV4Lm9yZz8NCj4gDQoNClRoaXMg
eWFtbCBjb21lcyBmcm9tIG1pY3JvY2hpcCxtcGZzLW1zcy10b3Atc3lzcmVnLnlhbWwgYXMgY29u
b3IncyBzdWdnZXN0aW9ucyBvbiBWMy4NCk1vcmUgaW5mbzogaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wcm9qZWN0L2xpbnV4LWFybS1rZXJuZWwvcGF0Y2gvMjAyNTExMjQwNjMyMzUuOTUy
MTM2LTItZ2FyeS55YW5nQGNpeHRlY2guY29tLw0KSWYgeW91IGhhdmUgdGhlIGRpZmZlcmVudCB2
aWV3cywgcGxlYXNlIGdpdmUgbW9yZSBpbmZvcm1hdGlvbi4gVGhhbmtzDQoNCklmIG1pc3MgYW55
IGluZm9ybWF0aW9uLCBwbGVhc2UgcmVtaW5kIG1lLg0KDQpCZXN0IFJlZ2FyZHMNCkdhcnkNCg0K
PiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQo=

