Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AB2C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 07:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pdWOnkjrGr7CoNSe/h27aD/h8K5JGObZMHwgAV4qMWc=; b=FswY4zjfu7kBmCRlwLsq/D5gn7
	TbA44fkY77roHmg8NRs9hNkzyEt67jQSPnnD2AMY64nVPj6f5cIP4xJiYb7KFSCXzyM9cWsJI6Rnl
	pYBir0xwEp+MTCw24Bjuff+4OdrsddSV3Njuv+gghBgfp6p6MUOhNjFZTFTvBRwofRLxgrpShaIf8
	7+UDdUtKelxxtAEORfW/kxbyaaZWzeyFMKH+jD3hfyB0tkS4Vspaja5yxjNguJ5tQB7qzjonxNt7s
	aoB2AVY80D3rlz+L+oIcdKPdGwiTEakkKZLIcfXC9jIA9YX25upSUUIDFvjdzG0YeBy7BtTJH3HgU
	jypRvXHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua807-0000000Dvez-07Pu;
	Fri, 11 Jul 2025 07:16:55 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua7xl-0000000DvNM-2jaH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 07:14:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fng6/Ax4jGL4URALDhdwuZQRmf802GuM0JIWL4w3PomftGU5cFihJ7xRO4C34LzgVHDa6dWx7fw0FdkX4MSlqxi8aSZq/qO6SPBxJQGdS+o1OwkzklHJ4eBdForq3unPFsV9OG88nQE25BTbq+IKyx2H11uartA5cv9Y0VCZuKUEAcDGhT6meHyrj79lD4mbGU6+RevRbZ25YlZ1RCms7TTCGF81lErQm8iKUcqtQVFeqTmtCscSJQ3K+gI8OZHglvYIpTE0RqY1p0xjruksiep3TAFs7fVkDOuCF3051f0u40dCcw6/9+ynfS4Pvv13+JeBcE2auEm6Iw4yCe+2Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdWOnkjrGr7CoNSe/h27aD/h8K5JGObZMHwgAV4qMWc=;
 b=UZoqegk92hxwAQZwb1hMhT3lBUHDh2hfED7uVDlaujx076voNwKb+YBK5xkpD84e6vXsmgQTEKq3/GgUCLxSSP3FH68Lnbew+93Ee/eRgZiDtLZWQoqLBpe+ZDNegD3DpgZsH+bKtsXcnYh5qjSTUOMra3RGGRc7B8tkTR5IbX9jjIlc6tTrRThWZvanU5Zzy1PUggeT6V+xLnUllaqzlUJZsjC+J83zyDOmJl6kuQ2lWxTnvhMq5D6cWxoWWBb3TMd80sNH36z9120TU+uBck41qH9yVUyQkVUWwZPqA+tSs65CuynR2WeQ1oGmeMh3U8mL5XCCvLdRw0Z2dNiPHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdWOnkjrGr7CoNSe/h27aD/h8K5JGObZMHwgAV4qMWc=;
 b=H0nO6qFeDgzf25r2oQcz+Jbo5H3G/uae2jERWDWMD0XA+61MwXeTfJ7QnebRJy4hkv4ukVj+DYaufnr426jEFFwt+yoJyV9J6dcDJUir2YQthJhy57EFWK0Kp9Z6nNCdhVCGO/qEmuaEidE4ZxzotQjb/zopm41/S65fgXE9oXrS/Quhe0BtsQrAWycWAjRq4+EXC2354JbnsB7Nt8ABi4p1/n6UywLRrWsHzUdtVgsuOJiZbybV5IkCe4LDO4fUUVszyMoTtEqGSu919iZYcEdcDRNSMJWZbCn/dpnPFJg0/TVYQ/r6XD/xWNf8sHPUm+rjCIVI9wtn+GSqEuHKoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by AS8PR04MB8596.eurprd04.prod.outlook.com (2603:10a6:20b:427::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Fri, 11 Jul
 2025 07:13:59 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8901.028; Fri, 11 Jul 2025
 07:13:59 +0000
Message-ID: <ec2c3099-fa6d-440b-8ef7-14b7865729f5@oss.nxp.com>
Date: Fri, 11 Jul 2025 10:13:55 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/12] mfd: nxp-siul2: add support for NXP SIUL2
To: Frank Li <Frank.li@nxp.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, chester62515@gmail.com,
 mbrugger@suse.com, Ghennadi.Procopciuc@nxp.com, larisa.grigore@nxp.com,
 lee@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 festevam@gmail.com, aisheng.dong@nxp.com, ping.bai@nxp.com,
 gregkh@linuxfoundation.org, rafael@kernel.org, srini@kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 s32@nxp.com, clizzi@redhat.com, aruizrui@redhat.com, eballetb@redhat.com,
 echanude@redhat.com, kernel@pengutronix.de, imx@lists.linux.dev,
 vincent.guittot@linaro.org
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
 <20250710142038.1986052-3-andrei.stefanescu@oss.nxp.com>
 <aG/oUTQAyRwc3/ia@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <aG/oUTQAyRwc3/ia@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::7) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|AS8PR04MB8596:EE_
X-MS-Office365-Filtering-Correlation-Id: 861cf120-bb00-4b63-1ba0-08ddc04a8190
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NG91VmlVNmVIcURjeHoyVDMveGNrZzZZaU9PR29hNmdObm9tWjc4UU9JTjFD?=
 =?utf-8?B?T0p0b3VsanNEZi80M0ZhZUZpUU83QnI0bFJQcEZxbHJxRVlycDNtSGQ5cFRk?=
 =?utf-8?B?REdrdENldCs0MWxUb3BpVG4rNEdIdFhpcllPZUt3Tm5oSHZ3N1I0MGtUNFNE?=
 =?utf-8?B?RGtiRjhlNS9yQVdOYXBFd0pPV0MwM21ncnN6aDh3dTJhdm5Rbm9VL0NxNjFs?=
 =?utf-8?B?RHpIalRJa0lyTmozMHppTEFpYk1NSjhuRnNOaDFQenF1MDNJYjhLTEl2dEJ5?=
 =?utf-8?B?TkJDeHRzQ3J5ZjZiYmpJb0h2S1VJbjZxOVk1aWtCcnFWOG9iL1U1emRNUVZJ?=
 =?utf-8?B?eUVhbTdGNXc3aHZDcDJVUEtINEZ5V053UnFiN29mTDhpNjg2ZEdOYWZqK0Nv?=
 =?utf-8?B?a1h2b0lIdzRrWmVjNy95N0s2ekIycDJjU0VvNUtrOXNXWlJiWkFwclRMb1JZ?=
 =?utf-8?B?ZXJ0T3RmTDZDMG8zckY5cGdSV2JSbXpwckc2cjNvbFpLMHFwVmlIOTVmVkRl?=
 =?utf-8?B?d2FrUXFld2lUQUpjMEJtQllsVUNUYVRWMzdIV3VJSmROQmZ2Zm9ld1dmNW9v?=
 =?utf-8?B?QitYcVNVUGxBdmxKYXlaak1zand1NTlUWjVnSG9UTXJpZ0I3ZGdwUEdlMTdq?=
 =?utf-8?B?VXJxRDNsVVlQL1R5YS9ZK1I1MXp3Z3cvTHZrdUhCZTZJN3dRalBtMzFRTjFB?=
 =?utf-8?B?MzRjMjVEVnY5SVVBb0RIeW0xbkMzbUFFb2dPWjh6ZjMzRjA3ZTZxY2ZBNzhJ?=
 =?utf-8?B?K2xLenMyTHZ1cTlZQUFNYXF4VVJLM3ZnYVNVVmFTeVl5NnRuOGlLRWNwTEgx?=
 =?utf-8?B?ZVdGdUFIaWlBbER4SUQ0ditvS09xNXN1VmhlMURBd2tVZWxLSVBnQmRKVnBO?=
 =?utf-8?B?c3piLy9ZZXVaN1F4VElpRDRVUEZRWHduTEUrUXlycGVFdER6c3RwTzVNZFFY?=
 =?utf-8?B?V0lWaFpwc0Q5VjhtNXh5a0xzd1YyYklOTG5UbVpDd2ltUENxRDlZWEVPN2xR?=
 =?utf-8?B?dWpkYkt3Q1Z5dXBNZDkvdGYrbXZwa3pBSlFjNm5uQzdiemE1cGtLa0dkWDQ3?=
 =?utf-8?B?Mi95dHpkMVExSGt1QjJnNzN0OWtUVFVnNnViZ2crU0pZdjAyOTk2TWFBK2lU?=
 =?utf-8?B?d051UmdyOHZvZ3FNZmNpSnlwamRlMWFEclhzL1BjVnN4R2ZpOFBlckJyMnZX?=
 =?utf-8?B?TjlrTFczcmY4bFNSQTRIR1hNTzhhMlkwaUFDN2ZZNlZnV3NmZnViWGtSYUdG?=
 =?utf-8?B?c2RuUEtEenBnMXdYa3I4TW9kc3V1U09rTTZCUk4wMTZuWVpWK25qbFh3OVF2?=
 =?utf-8?B?cDN6d3ZuQU93M3BhcGkzcjhWYmdJN1h5UDVlNmpLSE5EYS9QaXJjSkNoRkFk?=
 =?utf-8?B?emNqNUUyNFk4aWdGYWFSWHRld1Yzc2k4SkdtL2ZZcUI3QmVnYjNSU0g2Mnp6?=
 =?utf-8?B?S3dTNGswQlVvaWJTTkw5aVdWeWxLZHVWN2c2WHNtMWwzY29LVW5Vc2pYeHNh?=
 =?utf-8?B?dlNsN0hZUWdVRW4xOW5USUNwRGlxVzNHdVFtY3NUKy9vWXJjR05iWG9udXFR?=
 =?utf-8?B?L0JXanByMGppbE5OaS9CclVCbGw4a3A5ZHYyTFFHNEFibFJJbzlRZlBpK1ZJ?=
 =?utf-8?B?ZUxENHNIWlBHK0hKKzJLUE82R3YxQ1hPS1c0dkFjT1ArTXdlOTBzY0RSSUFI?=
 =?utf-8?B?R29zZlgrZ2E3RDBPTUxacFVTV0I3bXlQblVwTGt2SkYyYmxGUmRaOHVLSy9G?=
 =?utf-8?B?ZUJpWTNScW5YcnFtTDdnbW1aaDVmeFVzRE56K1NXQ2RxZTg2L1kzcS9uT3Vi?=
 =?utf-8?B?YkpmOGxYajdXL0c5dmJOQlNmeUNyZVhZZEdGbXdLRkcrdlIycUhqYlo5dFFh?=
 =?utf-8?B?YlNZT2ZubDMrQnZseWc5OXlpOG12NmhMV3VJOGxoclZnV0JVRUdJeEFhR3Nx?=
 =?utf-8?Q?0gS95Nx86nI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTZwQzJHaS9veVNOell6UmRSV1JueGpLY3RxLzNRcmljSHBzOEhIYmRKejFw?=
 =?utf-8?B?cndnK3RPeXJlVGpvZzJqSUc3YnlOYjZqZDZvcUxURUQ2SmMrTGJ5NW92bzlV?=
 =?utf-8?B?alJUNWxMajBnQjVKSUtXRXh6bU1od09Rd25NT1FFSXllQnl2VzFKcWxaalV1?=
 =?utf-8?B?dzlzRjA3cVFOMkRjSi9WUXVPa0hsbytjYzlOVXMzWEtZbU5uQ2lCbTBjUVls?=
 =?utf-8?B?QktaOXYwTDBxZGY1MmdXRnpMWFVKWjY2RUtaeUIxYXhzN011QTBYZzFpejg3?=
 =?utf-8?B?M0p5S1dUWjJvTzZVWDNvanc5aTN6US8yVTZSYzRJdGU5U1FZSGc0N0JJeDRa?=
 =?utf-8?B?MUZIUHFXcDM4NVhmQnRJS2c3YTZZUi9lVFF1bTIrbTluLzFKVmRsTkNWVWlF?=
 =?utf-8?B?d0JlR080bEpGakhwSUY1ZmV2TVNGbUhFcTZMS1UxQ00xMitDMDhOVjhJZ3RP?=
 =?utf-8?B?MFdsbU9TN2doa0MzTFltVEJiMjFtZEtnVk11YlpQNi9mUjdUek9WdDZISFMz?=
 =?utf-8?B?Z1JkY2xQU2Z5VVJ5UUEvVTZtMHNEUy8yeWNOTVJQbHhCbExHSFcrRFNBSEdq?=
 =?utf-8?B?dURCTno2R0dlVENDaXJUNW0zcTNzbThmUWlzSzJtdXdxeUdGcWx3M0NCbmIy?=
 =?utf-8?B?em1UeHdidGNxZmJTdVNiZkxQT3Nad2VDMzVGd3Jwc01CTUZ6K2RwNjVhS3lr?=
 =?utf-8?B?MDBOWGRZODdIeTZRZ3VhblhybDhKZGNjcVRXN0dGMHJoay95TVk5aVdva29q?=
 =?utf-8?B?cGRHUUNEK1FXN3J0TU1sdFo2dUpURzVlUkRaeWhFVGRKcUZXaEFlenBQZUhG?=
 =?utf-8?B?QkNMeVk4L1F3dU1MM1dTSmJrYXlVNUNVN21jS0NRT0ZUeDRxMDVjdy9UODRP?=
 =?utf-8?B?YnlZczJKejdYdm1YdEhCUFVaMjdxU3JVb1gvL0JUcGl1SVRJb01MeXp0TDRB?=
 =?utf-8?B?L1dtN1hVbkFYelRGZUZ1am9nUEtsOUZZUmtaWkRYZG10V0dsaFMyYlIydGly?=
 =?utf-8?B?K2ZnNlNEekc2S2dVM3Y5Ujl5TWJyZ2cwMGx3cXI2a3NwaW5lNjJWVHdvSjBv?=
 =?utf-8?B?Q2sydGpxOVBjb3ZWaklSenZEQ0NLbHNpTzlCSWlyYjR3NUwyNWErL1I5Nlh6?=
 =?utf-8?B?cmhHemRvcnFTTFZzSkFmT2g0bTE4dVA1RUpLd1hKYWtKZzFnNlUyWWI2MGxI?=
 =?utf-8?B?TnNzL0k4dUYreTQ4NE4xMGtjdDZSV2RKT1doenZyckltTVNoRDBYTnlOdWUr?=
 =?utf-8?B?bVBTcExDZzlvcm4rZDU3ZmlmMkxyRmFIS3hSSGlZTWRMVVFXY2hlYnVKWnpu?=
 =?utf-8?B?TVRWMWpTYWo5L21OeEkwRUViQTZHM1dFWmxkRDNRSWxlNm05N0xJdHh6azVR?=
 =?utf-8?B?Zm41aVNyVlJlOHpJYnE3UkpnMkt1Rkt2SlhiTWZaV3d4THlqd1h2ODZkVUdJ?=
 =?utf-8?B?aDhZcWovRTJDYTN2bVZCQ0pXY29zZ0RIcVJmRTlLa04ranoyM3hrMG0yT1py?=
 =?utf-8?B?ZzdNR01kVXU3ZzlSbzEvTmtZS1AxbEdFMzVtaERwRForYkVWRjR4Q2Mrd3pU?=
 =?utf-8?B?M2pCeDZWaWp6aTFQK042VEN3dWpqOGpValF4d0pOZWd5QUZXcHJSeDNnMzhV?=
 =?utf-8?B?TnhINDZDelJUM05QRjlRK2xhMXdDUDQ0YXZRZ1RnTjBqcWVReW1naGtDZ2hO?=
 =?utf-8?B?WHpBd3NHZGhtZEE0UWNEZXNDbmpYQm5HVU54TTBzd21TcFRvRmE4R21ld3g0?=
 =?utf-8?B?bHVuamRFL1I4RGNkWVFQZ3NmMktTdXZVVEpNWGhuMFZ4empFM1VsVDB2eXl3?=
 =?utf-8?B?dG40UkhGa2d3THZTci9iRlg1aXFRcHBad3dzVlF2cW80TnlkeEZwQXZ3cTZV?=
 =?utf-8?B?OFI4OXc0U0JiS3JDOHdCcVkxT2FzRlNUcEpUbnBrYU13Yms3K2NKa2Y0Q0Zi?=
 =?utf-8?B?Y1RucHZRSDdzSmZIMVYvL2NLUDA0cXB6MTNLZzlyYVE3cHREWnJaWjMwclp0?=
 =?utf-8?B?VlZ6UzFKRVVUVTgvbitsMEZIY0V4ZDZRM1ROc2JDNHkzYWxrUXJWM09lNWZa?=
 =?utf-8?B?NGZGL2hGNS90VXZtZHhBUVpkK0ZQdi9KSmFpSTB2YjNoT2pqR0VlcGNUb0Ns?=
 =?utf-8?B?Rmw0aXlmeFJVaW1BMzZ5a2RZcTV4azdLVDdnMTRpVHdaWTc2bEh1ek9KNDhM?=
 =?utf-8?B?ZHc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 861cf120-bb00-4b63-1ba0-08ddc04a8190
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 07:13:59.4409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gtCpfn6eJAJvAKRl5cKgZqJ7sSgY9Fw56K9/bcAxoR28OlAJ+W5NpKezYrJeJcGGFSygIETWnT9fdxPWU/fy0j7nfIjYRVSQPANYvrJqmB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8596
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_001429_686374_75B7FB9B 
X-CRM114-Status: GOOD (  10.74  )
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

Hi Frank,

Thank you very much for the reviews!

>> +	}
>> +
>> +static const struct mfd_cell nxp_siul2_devs[] = {
>> +	{
>> +		.name = "s32g-siul2-pinctrl",
> 
> I think you can add full list here.
>

The next cell is added by a later commit. Could I add the name here even
if it doesn't match an existing driver? It will match a driver when the
NVMEM driver commit(the one from this patch series) is introduced.

Best regards,
Andrei


