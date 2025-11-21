Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6831CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 02:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U8NclBKoUCdRnUCc1lgfJRIN+lH8plCEj0MMpNwfNlA=; b=HlkqbH6uZ2+OWYdg8WTP1xbST2
	0XwrO8JSQvzpgdUe8XcMaOv+RwY/42+ZZZAcNIhR7elXG7ozudAQw1DqSpzuIDQVvrGV21b25+Ft4
	xFnuU40XunUpEJu9HjdzF3ZalaVXZrDym3LwwQWioJ6MIJjArW2BYHmeiQapjQ6qIdkKOEYSZG18d
	huNcEO9JFAyzw3cZz7Ju1yQ6fmaJunom/8CAfHVxXIgNUrs1i1moPNw/1n7u9UlDZTal+T1XfOKTk
	eJSfTa/hGlIxYd22UESyX1VbWXLXKo9c//nf+iR+2Wb5HG90qnYvvXu4cPtqlbr3TjcSFJoYCt/kx
	MP6XYgrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMGSc-00000007fQv-0EbK;
	Fri, 21 Nov 2025 02:01:18 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMGSa-00000007fPN-01Un
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 02:01:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GVvgONwnkfFLIY4FSH5FoXL4qNIK2JmsSM9QCLl1Vof1XdA1b0nYLUkV7oRf+lt9RcY8HahI8Q+OypyVhWd7V+vxaS3asXKsKk/FdnFP4YYdn/46loo2LoYtji5HA546dfPXoyaYXdjv12f4kEJuQZSVjIgPWWKxEFb3hJNKt4Ekxm0F/1KNhMBTR72DnMEtSwPWmvdAYpSC/llA4LEpZAZTWu4OVG/v+hWK8bCPsMbAFmViW7a6mbcYaRuSYrE5SashxtoFLQ7sjQlpejlsLpX/si7Pxd2LdwPQwN4buf1t3g59ezo53XUr1ZUpODwNLfPXRcmKVxlTOzwhxdUW+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8NclBKoUCdRnUCc1lgfJRIN+lH8plCEj0MMpNwfNlA=;
 b=q7SyWAPm9KcqWjTyo3Di9GuoY+oPvHEuSrLUyVXfmjzMtChkM6AWfG8FAglmFkGk3nd5uSCftxAHP3PT9W2Pr7okrYJJ2042MTPgHIr5htSWrUDmojIcrZYDNprZEbb6B9qtUc5vRCKs80hbfr8XVbmyGwO2NHmrU2yeUraJkiOvPP7xxVorE/IMTyR7HscYVlrNhFTw2p/PujWYfTwi2v68y+a1538eKtoNcwB3PQWnbCsWVuG24ek2//yg0eWo40/6/piwdkcbEGKO2835lKTJuFMKI6uiuDK8ygTXgdPy93y57/9LBamHyP8XfwpUpEsaSipUyr4Jh4J8eEgi5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8NclBKoUCdRnUCc1lgfJRIN+lH8plCEj0MMpNwfNlA=;
 b=Hz27xfv4SRtuuRYSshGbiVMMDaR7xTkybxZSP6zqMouCtluuNIqC5uW8gttL9HPp52tT3yRtdkmm/LdW4VlyN8ta1W1vR5UsU9+toM4uqbGntg0SSt73dRQYcJELWP7fdUY+f3nMNCq5y3rNDJDx1UqgTeXm94LWgw6kp8MdiaRg+49bk9JSpvb4lN3/nDCl4CzO/kg2hlQGg4vkpjUKnadDpv3fONGMzm1eav6KuoTkZ0j6ouklHIoW00SoaIxO1zYg6ggBKgwfQk1WnmX20zFyksc/xjFskvk11kw6yZ9OiQN8SoeIIvNJYxuD2X9SJ80M1cITHstQbxdqt7hVGQ==
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by GV2PR04MB12140.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 02:01:09 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%6]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 02:01:09 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
CC: Aisheng Dong <aisheng.dong@nxp.com>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, Frank Li <frank.li@nxp.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH v2] i2c: imx-lpi2c: change to PIO mode in
 system-wide suspend/resume progress
Thread-Topic: [EXT] Re: [PATCH v2] i2c: imx-lpi2c: change to PIO mode in
 system-wide suspend/resume progress
Thread-Index: AQHcWgjDQMuVHMkgJ02wkgZ//qr+H7T7lq+AgADKfYA=
Date: Fri, 21 Nov 2025 02:01:09 +0000
Message-ID: <VI2PR04MB1114781A90818E35BB49452A8E8D5A@VI2PR04MB11147.eurprd04.prod.outlook.com>
References: <20251120103039.1824209-1-carlos.song@nxp.com>
 <CAEnQRZDcaWAQTLVHL1q+n2nhk3Cop2-fbOL+BqibrJHze2F9xw@mail.gmail.com>
In-Reply-To: <CAEnQRZDcaWAQTLVHL1q+n2nhk3Cop2-fbOL+BqibrJHze2F9xw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2PR04MB11147:EE_|GV2PR04MB12140:EE_
x-ms-office365-filtering-correlation-id: dfb5b346-fff5-413e-d980-08de28a1d6bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|19092799006|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SkE3T0tEMnZ6OUVBRU1ZWGIxQXE2aUZYSDh5SGgzcFZaZTFYU0dGallBL0Ns?=
 =?utf-8?B?SlpYSi9uL3h0MEZ2L2paeVhvayttS1RwZWdraVFOZ2VKNDVDc3BPeE9xSXhE?=
 =?utf-8?B?Zzg0K2Y4TDBhVDBHL0ZETnRESDlWcjFOL2pwaVIyU3pMTzdkbmF6Yk94M05m?=
 =?utf-8?B?T2c3Y0w5M2YxUEhoYmJhMVc0aG9rRkxDM2VTMFZlam1RQjVxQUFCK2sxcGd2?=
 =?utf-8?B?ZWxXUytQUnpvZnNkYUZQUzgvazVBejlIQUxWbzRLcUpqMmR5VUtzNVZEbmxD?=
 =?utf-8?B?ejRaYVZ2K1I3bmZlOXpBUkV4UCtwc0M4bjlUUVdoYVJ2amk5L0V1YTNyQjRa?=
 =?utf-8?B?S2NyL0Q3My9EWWNLUmowQ0U0WkZyL1BxNTZRL3V2NktXejJBSzVDOWRKRnlp?=
 =?utf-8?B?WXFKc3F2dWhZZnBBNW92T0s0Rno1UmpWOXpEKzhLMmpYb0xYMzVBRHUrd3Jm?=
 =?utf-8?B?bVpPTG1vYTBQWXZ2UDVvVU1hNEEwejQvSlpWbTNScmN3K0dsQmhUendQUGVn?=
 =?utf-8?B?Yk53QzRRMCtmcG82b2ZoTmlsVXQyZWhveUJNdkVXbjBkczRhNXJycFF2WUhR?=
 =?utf-8?B?KzY3alo2ZENKL2NCSFdJSGpualVFVzE2SW05NUdIYTZWbVhiaE9SbGdWeWRG?=
 =?utf-8?B?SERlaVN1R3dIY094NUpjWmhZcHJtcUxZTSttYjJGbGlYRmx4Uzlta3N6SHo4?=
 =?utf-8?B?Qk9rdERScitlR0pwUlc0ODFQeEVmN0IxRlFKaWF1MWpySFp0T0ZXTGRTUUtm?=
 =?utf-8?B?YXl1RzhLMXZndGUxd1VsenJaY3ppb1VEOXYvaXFMYkVkRGpHeU5kUGFNd3c1?=
 =?utf-8?B?SWFyMmwvek02RUFWQlV0bXZ4Tm9JSDIzcTRBd1hHOCtUdktzSGhiQ010ZC9W?=
 =?utf-8?B?RnM3eXVhZ0g3SCtxeGliS1A2SWxyU1p0T1hkaEFNYWo4eGlGWWpZcGVYVzFj?=
 =?utf-8?B?KzIvNURFTFNNVWNTU0l5aVBHY1lqM21FYnpsT0E4UllZTXg0blZ5ejRaTXlN?=
 =?utf-8?B?Mi9FcllVV3dBNHVVVzdCVGkyT00ycEdFWEEvOC9hL2ZHb3B3c1kyMTZaWkx2?=
 =?utf-8?B?am51MDhseGZzWEZUZ29xbExBS1FIbXFxZkprbUJKZGxXdmZIcVFSbFlEeTQ0?=
 =?utf-8?B?QWNtU0VmbVJzaUZyanFmV0hucE1icmVPd2Z4U2NIeW84cm5lc05TQmptRDZ2?=
 =?utf-8?B?YmFHYXQwanBTQUY4ZUtsUHpidE5aM2J2T2I4K2phdjVwNnNDb0kwSlBTYUV5?=
 =?utf-8?B?WFVTa25TUXVtNndmVnFQcUlVenU3WVdBMWsvQzZuOTFEd0gvL2ozaFdySkJF?=
 =?utf-8?B?Q2lHTHU3L1pxUDZJeFhUemdJQ2hEWVkxTnpzU3hDU1VMQU42T2JrdHdrLzVm?=
 =?utf-8?B?T1NsSGk0d1VvVHY4RWFkemVTK0NTV0s5eG9qUW1OcHpVbGZxVTY0NWMxQ2RB?=
 =?utf-8?B?bWNxdHN6emJoNlcxMy81bWdNaThJdVBzR0lvNnJrOVVqdmhxTytyYzB0OUpa?=
 =?utf-8?B?T2IrRWFGUDNJcWliWFBOYUcyZmpLSG4ydmk0d3lwaVFvWSt2ZEp3QmE5dlc0?=
 =?utf-8?B?TU1QWjVGN2J2NGdSeDlFejZiWWFneXJaQWtaNmgra1hnbzRkSWFiKzF0UDcv?=
 =?utf-8?B?bUVPcEVlZk9GN3MrZDNjSS9uWXkwWGJMRXlTS2xLS0NSTC9FUWQ3a0s0YkdM?=
 =?utf-8?B?czlFZGNOaDBPYlFaOHlNRm45eno5eTROVDJIVTlIUXJ6dWQrZzNGSmRDRURw?=
 =?utf-8?B?ejFuMUo3VGhvTkZoRFZad1huRkhIZVliNmI0Q0xJcDdRMGRubFpXVisyZ0p0?=
 =?utf-8?B?b2dOSHFJR1pFWVdmVkt4R0R2bGg2NmJieVJrRU9ieW1BdFZlT09EU1ZzdTBQ?=
 =?utf-8?B?bGU4QlRoRFcyaGxPMmlwRHYwc0ZOTHIvSnJ2RUhmbUEwSGtuVVpjeW5XT05F?=
 =?utf-8?B?TXJpOGpLYUE1SzBNa3VJRjdmN0paZjlzMEZndmdLZDFNZXZpZHJ5U0VzMy8x?=
 =?utf-8?B?UTNtTUVSSnJ4ZFZlbkJPMnJDdzdjWHBYUFU1UTh5bTRNa0cwUm9VZUFzZm1Z?=
 =?utf-8?Q?/ruvYA?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnE1eEM2Nzhqd0ZXSk4wYVVVVUhMaU5rQlppUHlMWDV0cXUwdkp2RGx5VTZW?=
 =?utf-8?B?akZpRHFlb3VBTGpTa2dXRzFqS2xqVU1ZTEhPUTlqUWp6KzFtRXYzOXZSUDNF?=
 =?utf-8?B?R1lNNEUvWHI3ZHdRTGgvT2lGeC9LRzVSc3Q4RmpPazhaTE5CbWlPWlhmbWJx?=
 =?utf-8?B?R3ZHMlBwS3pvTzdGVmpvcXQ3M1VOdy9YYnovYXRFWG4vMjZOVFZmcElHa0ZP?=
 =?utf-8?B?NFdPR2VOYWFHVjUxSnFSUk43OFRWQ0wwVGFDU1pLVU9KclZ2NWRKTmJLeGRF?=
 =?utf-8?B?SW5JaTRmME13VVYvSkNtUTlKRkV1US80M0dPTzBxdnovQ0dncXhiOFpuNXJX?=
 =?utf-8?B?QXFYNlVJeWU1cXNxWHVUK0s1enFVb2Y2VnhJdm1NbE9xVS9BQy9aVi8vM1JX?=
 =?utf-8?B?ZVdpalkwQUhrcjBRb3FkSlpFSkdWM3cxd2RSUmdqaXc5Z3NPcVNBSkZrL1Yv?=
 =?utf-8?B?MW42dmlVR3VwRXM0RzluamhsNUlOcHJNV0dxZzFyeDJOVDcrbFlManh3bzF4?=
 =?utf-8?B?UUpHYmo4TjVocE03NW5EZXhXRlBrdDFSVHlmNjljYlRCUnZZcVdGZVBTSGh2?=
 =?utf-8?B?QkhDWXJ6ZUpBSmtvVU9aYjB4ejNaSVJBRkpDKy9EVmYvTXNKUE1FcmZqQjRG?=
 =?utf-8?B?U2JNd3VwVHRoNE1PNFB5bkw2WS9vWjNQSUJsMndDMmJYdmhGVUFSTjJXZ0hR?=
 =?utf-8?B?VnpWcUpDUFFISXA0R3J2LzdTZkoycngzMzZTZ0dmamt0TmlnM3RBYUNZSTJm?=
 =?utf-8?B?N2JmckVqMXR2ekRJYThXVUsrRWdHTDY4My8xVXovWUJhTUV3MEVxT2ZTdTIw?=
 =?utf-8?B?c1pPVVorRVo3bHpsOXVBQzMrWFEybEE1c0ZJZEdWMXJYbFNDaUJrS1VjbDNz?=
 =?utf-8?B?UXVtaE9WOThucW8wRjJ2Y28xVEhSSmdrMm53Q1dCdUt5SFJLY3lKNW5xaE9V?=
 =?utf-8?B?dGhIalg2S0p0aklqVFN4K3FpZHFMWERIclpzYXRScCtlRkdVRzdMejZLYWdH?=
 =?utf-8?B?MVhOZ011WSsvL2V2Y2Y0Z3NmaStzTERwbjJQTEx0VVgyQ1dXMllCS2RSUXpn?=
 =?utf-8?B?Wlh3SmFLOW1hNFFVTFhhaDV5bytoMC9LWXZQMFdYWTk1STFQNTZTWElrTWt0?=
 =?utf-8?B?angwVkpqOGUva1l2WmIxMFVrNGJiVy85N09GaHhtSTRUbWlGOG5jcUFXenpy?=
 =?utf-8?B?ZGdXZ2JmcWxJa0U5MHY3emZVVTZJNk1iWkQxNGxJRHRoOXVHMmV6Q1pOVTZi?=
 =?utf-8?B?VlhHWEh2aEovQm0zQVcvamE2T3RydUo4U2VKdTNzVi9IME1BdWt4YUptZ1Fl?=
 =?utf-8?B?dm91ZENDMU1Bd0JvL0trQWNIYU5mSUFuVWZWWmtqeUhHdVVNRDR3bFBPT05N?=
 =?utf-8?B?RE9Md0VoMHhWc3lxdTNmT1ZCWGNxZFdEeVFiak5tdDBFdzdVNHdNek84dm83?=
 =?utf-8?B?WVAyOEI3bnJHbGI3aGVieUtoV2t3aGlocGM3RVNiYVBFMzRISFNRV3o3YVN5?=
 =?utf-8?B?d25aalNyS21nWDZRYlhHam40dHNsNE1QN3IzWVVISWZla1daMW93VE1xY0h2?=
 =?utf-8?B?Z3NsV3JoM2VqSndpZHByb1JKaEJQcm5JSUVsdG92eGF4eVRkU01rWjMwRUZV?=
 =?utf-8?B?ZjgwRTF4RFJqa0dJK2FJdkhFQTYycDdCV2NhNVVBNFEzSGJWeFZveFFmeVAy?=
 =?utf-8?B?NjFvYlBLVjJjSUJSc2pMSmkrMGNTM3ZDbUJjSldib0tkS3VTTkhYWWs1enh4?=
 =?utf-8?B?cUZ0NjhhYU5rTU52T2pNdjUrTHVKMEk0Y2RwRkhIb2dyR3RtdWQvYURQSUlC?=
 =?utf-8?B?RXhzV3VpaktJeFpDVFMvYlRObmtTZDUySTd2S1gvclJZMStHaHUrczVIa0p5?=
 =?utf-8?B?cU14azYyWjV4SUZLOXpWQm5YUG14Q0lDR2xPRml2YWxTZlFWdlA1bHY4TU1V?=
 =?utf-8?B?OEVUMEpBVVNNQmVFZ3RDdXhpSjZYMmpKMDVHTDZ1MmdlL2w5Tit6TWw2SkhQ?=
 =?utf-8?B?OXlFcGkrWi9DcGlWaEF6eTg2cHlLNTh0NVA1MHBQb1pZdDBiMVV4MVltQkF1?=
 =?utf-8?B?aU1UV3hCbXc3Rkt3TmEweENDc21EdHBkL3poY0FJOSs1RU9jODA0aVdGT3F2?=
 =?utf-8?Q?76Ok=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb5b346-fff5-413e-d980-08de28a1d6bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 02:01:09.0702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zCXexK7NdS8LBPzEmI5s7AF2s1AqN/ZPysEOxAuhVX3FScDdIRpVpZJk1aMs9em+VGI17rehPU/I+U1KdBQyQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_180116_074487_75F06EE7 
X-CRM114-Status: GOOD (  22.20  )
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGFuaWVsIEJhbHV0YSA8
ZGFuaWVsLmJhbHV0YUBnbWFpbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAyMCwg
MjAyNSA5OjU2IFBNDQo+IFRvOiBDYXJsb3MgU29uZyA8Y2FybG9zLnNvbmdAbnhwLmNvbT4NCj4g
Q2M6IEFpc2hlbmcgRG9uZyA8YWlzaGVuZy5kb25nQG54cC5jb20+OyBhbmRpLnNoeXRpQGtlcm5l
bC5vcmc7DQo+IHNoYXduZ3VvQGtlcm5lbC5vcmc7IHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU7IGtl
cm5lbEBwZW5ndXRyb25peC5kZTsNCj4gRnJhbmsgTGkgPGZyYW5rLmxpQG54cC5jb20+OyBsaW51
eC1pMmNAdmdlci5rZXJuZWwub3JnOyBpbXhAbGlzdHMubGludXguZGV2Ow0KPiBsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcN
Cj4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSCB2Ml0gaTJjOiBpbXgtbHBpMmM6IGNoYW5nZSB0
byBQSU8gbW9kZSBpbiBzeXN0ZW0td2lkZQ0KPiBzdXNwZW5kL3Jlc3VtZSBwcm9ncmVzcw0KPiAN
Cj4gQ2F1dGlvbjogVGhpcyBpcyBhbiBleHRlcm5hbCBlbWFpbC4gUGxlYXNlIHRha2UgY2FyZSB3
aGVuIGNsaWNraW5nIGxpbmtzIG9yDQo+IG9wZW5pbmcgYXR0YWNobWVudHMuIFdoZW4gaW4gZG91
YnQsIHJlcG9ydCB0aGUgbWVzc2FnZSB1c2luZyB0aGUgJ1JlcG9ydCB0aGlzDQo+IGVtYWlsJyBi
dXR0b24NCj4gDQo+IA0KPiBPbiBUaHUsIE5vdiAyMCwgMjAyNSBhdCAxMjozMeKAr1BNIENhcmxv
cyBTb25nIDxjYXJsb3Muc29uZ0BueHAuY29tPiB3cm90ZToNCj4gPg0KPiA+IEVETUEgcmVzdW1l
IGlzIGluIGVhcmx5IHN0YWdlIGFuZCBzdXNwZW5kIGlzIGluIGxhdGUgc3RhZ2UsIGJ1dCBMUEky
Qw0KPiA+IHJlc3VtZSBhbmQgc3VzcGVuZCBhcmUgaW4gTk9JUlEgc3RhZ2UuIFNvIExQSTJDIHJl
c291cmNlIGJlY29tZSByZWFkeQ0KPiA+IGVhcmxpZXIgdGhhbiBFRE1BLiBXaGVuIElSUSBlbmFi
bGVkLCBpbW1lZGlhdGVseSBzbGF2ZSB3aWxsIHRyaWdnZXINCj4gPiBMUEkyQyB0byByZWFkIGRh
dGEgYW5kIHRoZSBsZW5ndGggbWVldHMgdGhlIHJlcXVpcmVtZW50cyBmb3IgRE1BDQo+ID4gdXNh
Z2UsIHRoZSBETUEgd2lsbCBiZSBuZWVkZWQgYXQgdGhpcyB0aW1lLiBXaXRoaW4gYSB2ZXJ5IHNt
YWxsIHRpbWUNCj4gPiB3aW5kb3csIEVETUEgaXMgc3RpbGwgbm90IHJlc3VtZWQuDQo+ID4NCj4g
PiBJZiBhIHN5c3RlbS13aWRlIHN1c3BlbmQgb3IgcmVzdW1lIHRyYW5zaXRpb24gaXMgaW4gcHJv
Z3Jlc3MuIExQSTJDDQo+ID4gc2hvdWxkIHVzZSBQSU8gdG8gdHJhbnNmZXIgZGF0YSBub3QgRE1B
IHRvIGF2b2lkIGlzc3VlIGNhdXNlZCBieSBub3QNCj4gPiByZWFkeSBETUEgSFcgcmVzb3VyY2Uu
DQo+ID4NCj4gPiBGaXhlczogYTA5YzhiM2Y5MDQ3ICgiaTJjOiBpbXgtbHBpMmM6IGFkZCBlRE1B
IG1vZGUgc3VwcG9ydCBmb3INCj4gPiBMUEkyQyIpDQo+ID4gU2lnbmVkLW9mZi1ieTogQ2FybG9z
IFNvbmcgPGNhcmxvcy5zb25nQG54cC5jb20+DQo+ID4gLS0tDQo+IA0KVGhhbmsgeW91IHZlcnkg
bXVjaC4gSSBtaXNzIGl0LiBJIHdpbGwgZG8gdGhpcyB0aGVuLg0KDQo+IEZvciBmdXR1cmUgcGF0
Y2hlcyBwbGVhc2UgYWRkIGhlcmUgYSBzbWFsbCBkZXNjcmlwdGlvbiBvZiB3aGF0IGNoYW5nZWQg
c2luY2UgdjE6DQo+IGUuZw0KPiANCj4gQ2hhbmdlcyBzaW5jZSB2MToNCj4gKiB1cGRhdGVkIGNv
bW1pdCBtZXNzYWdlIGFzIHBlciBkaXNjdXNzaW9uIHdpdGggRnJhbmsuDQo=

