Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3ABC02185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 09:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1wzOoPXsvWdDxMxjsnDbL1CeKaWY4yC5vEVQwJshpzI=; b=V5vDwROQAMm+7dFP6ZsPza6sMn
	ThvAqXAbLc74f9alGSZJrFPtCaW6azT8QBpPGeHTxd0AjYe3QaTPIY6QPt6NPpq2HPxOfq+zG+KeK
	aFIscefuqbHWmvw+9bQ6UhOTurM56Tvj93I5NN8ekPZ4XsBS9q73IDVf1+2OkiC+So9A3wE/w7oPQ
	iKmy9XXrPlXjroz5Vq5OkGoGOl8wBPtht9LnEMkVRDSC0LB47VY7gTedenBll9d0pNtf9yRkKNoP1
	XnxmtdMdaJ7AxQgBJx2focDPO6Z9cdKEoMQd8wdbkx5zyZc3AwfYbidoT/cH8mssdJaJANS0Abs5x
	kJCBb6Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZoEq-00000005DLW-2xsQ;
	Mon, 20 Jan 2025 09:38:32 +0000
Received: from mail-westeuropeazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c201::] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZo1c-00000005A3X-00Y2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 09:24:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XJu6P9O8aSXJuenMGko+TS0jm+tlBlZcRAmInOiZNHN//D+ClzAokIQTjADBRkFzrsfQMSC8zUkFDT8EdVbPtDN1dJ9LNfUiw4hV63MPoasppJgIEpowLpCaekPEM051I5EfsML+/xK6V/biWX2T/InEulsDkRumLPVgeAtDehjIB7Hivvw9KgSkV4A0108sinR0g3NbUGTZVy+wzB2jsgz91ctc0MmLJKaXbKnIGTo+i8v+XmfHpjkZXSZALSvpdjjYSEjnFjZw7zi3Bf90Z7buBmXtoJks6K57Q2kgFLjb6CXxrkMIX747hrWRBpR5sER6lCX/ftTH1t7IqSalsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wzOoPXsvWdDxMxjsnDbL1CeKaWY4yC5vEVQwJshpzI=;
 b=l0PDDrY2AUHLK4dQaf6fTWePzUvRvHNGT/2A8EN9sMThNxrsIYFgAspwd1XwfOMopfYL2/2x2iX9ByIPgVFxJO2r8wXVJr0XeBXtwH7vRe1GlOhsl9AyZyBUEiN9wFIQpW2rcPGSgragoNvwC1GJkxmREcyKRwmYUyrcbua6hElSTlN9Z2SP2WmXQ1F5EJCHMm9Oz2hgzVMIAZ5BYuVUFLt//Eca6Nf1rLwW/Jhxx8pf5FeQTsVpqeT8ht9a/EMSAAta0Otxp4/83UOkxU3MCtgbH6a+vXa/1Wh1N5rfKrVtmKaS0E1fHRTRK2rQP3iwIr9qumkwQQ3g4TFPC6QswQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wzOoPXsvWdDxMxjsnDbL1CeKaWY4yC5vEVQwJshpzI=;
 b=EWF9PUSOj9S1fA1x1PgrGyTBwAOEMHvfbM0MxIffTIt3DSL5YrK8uAMSKh5HdeRkEJpaV8pc1pLDPKa3phFUe5+AP6rxaRfZolfDOD+Gg1WtNfH7KCenve5pOJLcqx2DdO35/52vcR05DdTRp/gP8Pi29zAZ4GLUeh8IEhtC9RlTl+m8ODVj4kp3R2qfs1Y6w2H2aj57fv1GXOvlAQRWH42lRCAa64ij3NBBYYjotDXKqUWZF3txwZajEgXPjwcRogO2foRgxZ/3f9rr0kNx4yxGhuYVrspB1xEyT4KyrbWGL6boQZRQJlv3QlKIsW+B1EeSLvo1pfmeh0mQWgfZRA==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by VI2PR04MB10954.eurprd04.prod.outlook.com (2603:10a6:800:278::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 09:24:45 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 09:24:45 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Recall: [PATCH v11 4/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Thread-Topic: [PATCH v11 4/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Thread-Index: AQHbax0kiWTTSfEJlEqmCoCY46r87Q==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Mon, 20 Jan 2025 09:24:45 +0000
Message-ID: <AM9PR04MB860405B93D3021A82A46516195E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-traffictypediagnostic: AM9PR04MB8604:EE_|VI2PR04MB10954:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 763a719c-a1db-47b8-0d15-08dd39344745
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?6d4YwTbrsnSo/bWMNO24HMsPWNC85lSHbHVCndUH/fv609fb9j7kxcfaxDTC?=
 =?us-ascii?Q?KoblFJ1Jidvr79tbPRpgjUlCSM2JW65ONRYgLcKVMmfFxg/9KQ3TPhe+wjVF?=
 =?us-ascii?Q?+BsTmgqDvoy5Ux8lz+lDqWZynB+Da3OqIdTWC/ePSPSi7r+PnBNfzHaFKvkv?=
 =?us-ascii?Q?VKjDWxELRUA1adCcw9u6ll8glPjYCR/ODFOy3+s3SPj5Fs+VZ5n/yAHmqYj1?=
 =?us-ascii?Q?xbrD4tBZXVW4qu1ENKs+QzfUBrUKGaBMui8ftJsKujL0JgPcKAATb/lknlar?=
 =?us-ascii?Q?JEbc4jQTKN+fz66YE0qX45W9nwGNKwMa43MprMUGjuz6vkn9T+BM9BdrpgQ5?=
 =?us-ascii?Q?rveElgRYYV2OembB0ZRBdmnytqndi2x4ruL0Gzd0UiS7T5Cdf7PhVDdhI39Z?=
 =?us-ascii?Q?M4j7ecYPhOFZ9M0ZuDbQOfA1FMTGXtsFCBifB3e5hE4s72SgDb6hUGzkOBAb?=
 =?us-ascii?Q?/yZ9kkxzQ79VqKs4smuiIuFtY0cj6XXEBaqxHhSXQG57eEQFML+tw1c/Hta5?=
 =?us-ascii?Q?HKf3v+gvJuPL7qTH6/Sms9BFYWzeJP0r/Uejp3HXyEgpDUQvhOeqdjufOcD8?=
 =?us-ascii?Q?5CnUqx8HQhT/0w7DX0pI2Wd1nW0E/IZ8GGdIu/j6JYRdQ2PP3CvOlVqB6DfT?=
 =?us-ascii?Q?GooiW91pmJ57h49k9QKrQHqOfj/Zv4pztu0ADvsXzPHPrdEsqsYTvsqIY2Oe?=
 =?us-ascii?Q?gU0B6ai/2P/N5xBVsAi2Kw+o479Pyqvute2bSgaWrRERYb0lj0yBlCu3PMHz?=
 =?us-ascii?Q?h6SVqEsa/tcPHfFt2yMJFvD6V5C++Vy0nkuec+fb+VYJuj762mX658EAWDcc?=
 =?us-ascii?Q?XsZHTBt7+6MtGWUzYMPyikS3BjOpDw57gxoxGSrrbspV3Vr/jGLGxcg2TNLL?=
 =?us-ascii?Q?LUf7qzv0KwoCCiqSfj24BbPkMfw1Dwwg3NR+rKUXsBVgmc/eq4MG9KnBDmIk?=
 =?us-ascii?Q?qNaPSBOxdB0Stv6WC4zlO9M/oWioD7nJ5JbWBg83WoVeH5Pc73LoL2blxdW8?=
 =?us-ascii?Q?1vunlccI+aajHR0QGBJE/C9rS0IHDso6sPRkbrmtsm1bUyPwoiTNKzyExiUw?=
 =?us-ascii?Q?vxgyK6JBEv1zRl1W7ZCF+DZw5E9eJXBFggXDtPVRJXxiGPRF7j4JUias5RaJ?=
 =?us-ascii?Q?ccMxWkQTi7VP0p+K3GPgUE8hbkEiovavKWbxggoRupOnQbXUOqc0sy2TCUUi?=
 =?us-ascii?Q?d3V7nCEtn1P8D9LESOzvo258qTbVZhV6LPM30KRydegJ6GoPfpSn+lDE/RZe?=
 =?us-ascii?Q?j+VykwOBX7blGTU758Q3v/cpjwBRaW4QuqMHjkGIXl7vHAOvJoJlu/nHcD00?=
 =?us-ascii?Q?ISLiaaTsuHLyoRa7HGSIXSUOiLgFH9/2jZqNoHl0tQD/94XrrJBkGJOF6CrW?=
 =?us-ascii?Q?h11i1kdLSrOQ9hQJyybLoAUDX6tINIq0UB7NOJqO5cIWCWqFJGt9/Oy3WR0C?=
 =?us-ascii?Q?nOsIfjjoF1yGrv2zaaEnSRAA/mqvMykY?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9g+1Hq3b+7bGVNc4LXBpl/zRVfNnfBpElrMdix6JJ71aNhiO71jWai9xRgO4?=
 =?us-ascii?Q?HHr2zFFr6dfSrSeh8QKJzL/HhFrOApUqs4WEG0qVMKjGeMsAyrkpd0pTglvz?=
 =?us-ascii?Q?Ws450I0svDbCbKz2TNFWn4sCFCw1RKj6xG44s/l5+MNRnkfS50gwbpdZiGJe?=
 =?us-ascii?Q?iPDPRdCiZL0wXUvY3TwokCqOPl7SolehDFhNa3ILHIuWBCwJJ3OfOvbtT7C6?=
 =?us-ascii?Q?s6r9I9MJpT04undJ0nxPgtRaas3cRFkHmLeK40wAREJEKdtShlo2vWYSLkte?=
 =?us-ascii?Q?B2rwaTEV75rkxXNJO3r1S9AMYQzOFjdbL0fC4zZMrjv5dd+CUdSepdDJbAHc?=
 =?us-ascii?Q?2R2jEtLwCaK/mZ7HeejxZNoEJga7xmIPdwjq5vGW4qrnNkunl8XWzi8y5tT7?=
 =?us-ascii?Q?W9R7EObOw6bwNAzDCGkZNepG9TYCbD9ruSeGLTwQiHouUVWxjSJ1dHBCXHrM?=
 =?us-ascii?Q?akHHjttJk4SHx98/asyzOo2tnUlxKEXbcMVV+P6MBsHSrvW2yBmBsiJvdkn4?=
 =?us-ascii?Q?oihouFllQfwtBuYI4SCZdps+CdABV0O6xi9WE+AZaRyA8CMGNTEqEMXj1ROv?=
 =?us-ascii?Q?w1TcfdOj1HTR9lmIT84ilFxGwVnC6suMGLjDkLXFnN07FJaOek4S8HO3eUWy?=
 =?us-ascii?Q?Wvo3IeN5DM1QYpjedHb0qR8M5f77Uq/aO98uP72ku7sY8llmh8CjtlxD2sK1?=
 =?us-ascii?Q?4Lkx2bZYVksC7AChNUARy5UlT0f62ohNW/QNLeYJKME/4DZQn4myGVoeZB4q?=
 =?us-ascii?Q?LJIlpW57BULfChF1VJMsru1Ek8eSa3It+FOwfZz0LWr0O939HkI7jyw207Ow?=
 =?us-ascii?Q?gF9cA+c1aureXB/uTag/dJnrAHtU4Ch6adpbjdlPdITzWyLlBrRPNDCXavL7?=
 =?us-ascii?Q?crlSkH/Q6zPm5IpYDFLWEStEBScaM+dI4EyigH/cdbTeFsNek85QAicspxN5?=
 =?us-ascii?Q?RGp1o5GQnxsNpodFSE9k4bYHYwb0+6F1q6mRF95XCr8n2MIjgMXGyQPpgFL1?=
 =?us-ascii?Q?V9RKVsbkC8IE7oZI+6/aAoJYTMzdz67uboMIYwTgebJ/oVi0h36CSh4LYJj6?=
 =?us-ascii?Q?04mjQi2luqD4uUQO2pAf0fcvhhnBCq9Uv6rwKgAIdR/RGBSMW0qQ88c9DRJb?=
 =?us-ascii?Q?cyXAMz3S/cH8Q6clcdmxKT5p3LiYq6WdtUD6hYE2SWeymU8d874NALt9vW1h?=
 =?us-ascii?Q?asZkwm2qXlxz8Eb9q8yh+yKGRHOotSaFPoXvdCDaupKFanLg4qFD1/HUvuHi?=
 =?us-ascii?Q?tVvzMmwNBY640wQvkgfB4O1fTsAdnr8vRCWR1l85CYHi3/6mxA0fi0WoaIIT?=
 =?us-ascii?Q?kIXEC+lTElm7+v5MJZNxLAxstyOzgj1UrNlcH3rF9Kb/WZNAEYIoUdwG2MGT?=
 =?us-ascii?Q?EJUwXbqkg57hTKgkZGB4teJoaYyFCCqblxz09qZbxwEskBVzVHYkNF9WxsK+?=
 =?us-ascii?Q?DXL+OSo+yTtoZuRbMS2rHpX7odMihqPzSMOA6jjaNQ+xkR6Jo4nXxcwbW2lL?=
 =?us-ascii?Q?4soHkiTjjrecZe+KPvWKtk/S/FyjUMrnuYvlhk8nRKedXj8TnjyfBP4Lh7iL?=
 =?us-ascii?Q?lLloWSWrxIa/TzU7qm15JfmlDrKXv0YPtxVvwIjS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 763a719c-a1db-47b8-0d15-08dd39344745
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 09:24:45.3179
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yvx0tcTsFnSnvGDOVVObvt9K5P36+NAZHDPpDeVbw1x7vjCU8p8KXZkV5q3jLNm/CpXn2QrDrHLI8t2bMDg1PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10954
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_012452_185113_922B83C3 
X-CRM114-Status: UNSURE (   6.87  )
X-CRM114-Notice: Please train this message.
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

Pankaj Gupta would like to recall the message, "[PATCH v11 4/7] firmware: i=
mx: add driver for NXP EdgeLock Enclave".=

