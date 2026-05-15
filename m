Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745AECD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 07:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V14V6ZZA8a5aRrlfgYc5WgG38bUAokClxl4k/plNE3k=; b=QmslO85VDOS5KCmnxC5Gq4RiPp
	iN4F4Q52/ktZvcDz/OzyJiBfc+8BL3dC6Ml4KSc3sjH4gFSu+QzaSjQUNlnjw7g/vh20q2cvMnwlR
	xaQwDjU5L3gZxePNDxLYReSIna7wNw7cgcr/qRnVW4wHzZVGr/gI2LiAP5JGY8sH8o/Pk+2ua4kfX
	NWy6Vd4qjM9o+3EjXrLKlzECBC8J/UDN3/ZlXWoNvhiXkeSGwG3IjQhcsxQ7SN7zO3F124q+LckMX
	ckzriWx7IuLOYWmBiw52ZuhlaQmZNCPPsla0uiSAiCAfWLN2xZnXsAwmQbpQTyhWHGZW+N9lKp/MU
	dRVPwd+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmnz-00000007bS2-3uE5;
	Fri, 15 May 2026 07:17:55 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmny-00000007bRX-0jj1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 07:17:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGKiANpseZwLQAzT9KgZLEZYionKBJDM5UJNBPsUxLX+cwIokkeTgCI8ve2UQ2JjK5g+3ZnfaSNEBMMydiGxem1VYQ0bxFJLTLEqdQqHNdQl22+wpXq0ETLw3Z2NOCBCFE25vJ0hu9vAQ4899SYTJjgUv6YGq9sYfIi+gQ/HSGYB8iGBzkviTyA3nLaGxxEqW9XXkp0ToSnWA5c6tEYERHqH9IfWRJ4b7pP8SLop99hC6nHsGLGQfj5WUozaLtMCmLY0Ma1XFhCeDasUPlXXltWZONBxSmpSRKmY+vSN73P1/LF5pfLKu5xSP86dN989vWDSzPCrDkxNi9846Clw8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V14V6ZZA8a5aRrlfgYc5WgG38bUAokClxl4k/plNE3k=;
 b=QlFPmz4zZbxNnKpAp+RnEYzcpoMYf/vvkM3oODKVzoS3nRJL8FTE//BzOvFsuZLzUFTCJCu8i4f4L2V3gkAnX7+HXwqhO22b66/oon2PZsLyzV4fFTlGbsKkclpeYXUA/s54QDnSGhN6lv011X63Cl7O5dt7yoKgBnXSfm4imqnF3iM4OT6wevZqhO+aSqvGPg+S1RPCoZwgov88ZDJcdK1JcXukd8wg0pksM0LgEpeJ2XJeQHSTwuzuM/G13nusIiSp1ouW3NxG+e3ndXjFDYvYEnPSeBQe3CwrHtQOiRFpdeY/0Y7XDovTokUBYpgPFEXuRUVsrXkRozG0IxJHnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V14V6ZZA8a5aRrlfgYc5WgG38bUAokClxl4k/plNE3k=;
 b=kVUjzAKaNAFaqv8E5E/rImPFMMD1Ms3ktGvzIdjwiQmfNn9eUwWDm6r8anQGtrXC5dlyJFAVgUx4p0RJ/+rDuYtk0B1QSZKAVReSFgZS/M4ae4GA9V8cgmcFW2RnIcI1TYB6aiXL3ZVVeRvxCAo9NWHk1C22nokQdKgsdoGlg0ueJRz19/CuMOwOrehGUBpNAgApdHORGBWHqaLV8/ov/dK9mR8e9uHnOjtIHfPaMTwt80fUJGF2F3xnvntu0elAz76kZeui3CSpmEdhPydrP4Gj3NnoY3GQ8/uETlLQetXNbzRzIQCwa/83uitLekdEKraE4VnWCWAWKo1NyejwtQ==
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::14) by DB9PR04MB8140.eurprd04.prod.outlook.com
 (2603:10a6:10:249::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 07:17:47 +0000
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe]) by GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe%4]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 07:17:47 +0000
From: Hongxing Zhu <hongxing.zhu@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>, Frank Li <frank.li@nxp.com>,
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 1/3] dt-bindings: PCI: imx6q-pcie: Add intr, aer and
 pme interrupts
Thread-Topic: [PATCH v4 1/3] dt-bindings: PCI: imx6q-pcie: Add intr, aer and
 pme interrupts
Thread-Index: AQHc4oMP2qtfM3AiAUmVXZ9FYe2uOrYNUFyAgAFHNNA=
Date: Fri, 15 May 2026 07:17:46 +0000
Message-ID: <GV2PR04MB1201966F8BD9A813B919820518C042@GV2PR04MB12019.eurprd04.prod.outlook.com>
References: <20260513025101.1498104-1-hongxing.zhu@nxp.com>
 <20260513025101.1498104-2-hongxing.zhu@nxp.com>
 <20260514-lush-onyx-trogon-48eca5@quoll>
In-Reply-To: <20260514-lush-onyx-trogon-48eca5@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB12019:EE_|DB9PR04MB8140:EE_
x-ms-office365-filtering-correlation-id: f35a6dd5-f51f-412c-f1c2-08deb25210b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|19092799006|366016|18002099003|56012099003|22082099003|4143699003|38070700021|11063799003;
x-microsoft-antispam-message-info: 2lFHp+FaIN6cj5FBuq+NDRQrFP6WozNvIfLFtCgNA6WrCNBDKz5VX+JRuiwE3MROkbDrOiYHnWm3N3ADNRXlrMKHoE0tuERmCykiNYrIAoT+2Ok9FVbjoIt8saRLtO9URkiIw4E7xthOqlbtAz9jHH6DI0SpVNii8K8eF2flUEBoQLfbv1bHpWGxLGWvB5w5UalnOH2apLT87pnNpD7zKu/CAIaymI2mpzyfLhya0gUfSEw9pgeZHDog6U4LnyzBMiC9GsoPGbZpHB+kvZ/eg8e4iMpWRCmfFBCpIrWY+hNkyqqW6x+eLFwTNVd6Bkrs/ckDSp4tgP2VEb6epqz8mlrtCVgjtEmTJ303aHOtadnjKq9dCj14tvlacHUhcxPY1PGbl2fjtPMMMmCZYEGVFkmRyDYMlndutw6jKYi/+lDo33yUm0NxNfcurM3XsvsrzJMTp7FsbBeZRDAehRVaaSBpJn/Pt1nYaPR3SXf7VIHjjrRwlB9bKpdaXHNYbfJhblqsjKPF+bq7aOOK/4MYMUbUFPKCW4aEwJSmyYn+1GhZe1CS+Efh0Rk2a2OGVGpPj+ilOn6QYM5rQPPlqre28TqFKNUgzrJDH0A/Yb+/TAklmkXQWSCj7TDSbarckSOIXE01AQ0oZiK+WDTMo5ZiNU/7fDzsJ42lpgbVD0DFejoXEXwd6pUrv7EleJNvgDeoxUmQryRlgDjiOlCZ4nzb+uSC+rCGimb8L3LgIobbScnV8Hu8FbH+hCdx0wfVF3XW
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12019.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(19092799006)(366016)(18002099003)(56012099003)(22082099003)(4143699003)(38070700021)(11063799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjZZM0M5R3Exc0IvT3orREV4OExvVlBPTS9saTFBSVJJVWxoT1pCODR0Ym4v?=
 =?utf-8?B?VGRGeHMyZ2F6dkhpVGxFUXpudnRxK1p4V0VpYUEySTNBSzlBejVNTDczYjRo?=
 =?utf-8?B?WDZDNzgzUkJsM250NHpFalRxSTVLZUNEVDJyUDFTNnZiTUZCSVU3Sld5ZVMw?=
 =?utf-8?B?WUN2K0xzeHNRalpiVDV3K3dodUZUSVBBYy9Ya1oxMXd2T0tKMkljVVJCM3l4?=
 =?utf-8?B?cUtndStXRjEzTHJiWlNNTmFzZkJxbjZEQ1ovNkRmaFdBMWJPVThRSG9EWktx?=
 =?utf-8?B?TmlRUFJWVnlxRGh3b1lPNUpTd0ZFK212Ti9qSWJ2dlRvY3NQdWJuVGR4MkxF?=
 =?utf-8?B?b0pyUXVLb3ZuVlZxRE9Nbjl5OVVUWG9DTEZZMU5YR2VIZXJuSU55WVF6bC9y?=
 =?utf-8?B?TlB6eFZEZ1U1VEwxZDVlS0hESVNvQ1FaOG1FV0sxamVIeWxYZ28vNktRcGdn?=
 =?utf-8?B?Rk4zdFdDb2xSMkEwVEpiV293eGJGK1VTMEhOT3ppWGVoRVRRU2ZnSCt0dlJL?=
 =?utf-8?B?Q01LVHRQdm5sTXFEVFhKL3FXMXFSN2J3MGRWWVNKNWtxMlZldWE0SVJjZkRx?=
 =?utf-8?B?OGN6QnB2QjBRczV1WTU3K3I3dDd6SFNuQlViQW5TREpKZTcrNjFhWDg1UlBS?=
 =?utf-8?B?TjVacEFYamV2S3Qveno5M2RjN2c4SHdicVc5QVJ0SG1PaDk0dGsvOXRsN2E0?=
 =?utf-8?B?WlgxQWZtNklxY3BOUUs0M2luLzdMR2NsUGRreXROUDBSWnpYaFJNdVJjZnIv?=
 =?utf-8?B?NkE5K2tNOUlXTGl5SnVqUlRGUTlrd3p4RkJVZ1JiYm5Ra0xWMlUwdThTZmVS?=
 =?utf-8?B?SVFsUVVod1prakhiOHpYWVZsaTYraGZ2Ry90WkNUQ3RNSERzRjBDUHdVRDRI?=
 =?utf-8?B?UlFmSDl0QmhZemtqY3E4bW1mWTE4RzNxRUM5UjY4ZzFMajg4SE9CeU81Qmdv?=
 =?utf-8?B?VDJadE43bnBiS3plKzJ1STZBN2lCaFNJWXZEcnF5bk1SUjl3V3B0cnBCV0Zq?=
 =?utf-8?B?LzdQd0llanZheGFrOU5JQ1AyUWp0Mjc1VzExRFVvd3ZLUWF0YlZadzNSekxS?=
 =?utf-8?B?ejUzT3hIYzU2SXVTelJ4d1RHdS9IYm5SaVBuUzQ5V0lLQVIrRHV5S3VmenpV?=
 =?utf-8?B?NFIzNmt1NENUQmVjZU5lRmxiQXJRMlROUXF1UDBRQm9Ia3BtbUhVSjF1cFcw?=
 =?utf-8?B?eFpCUDB1UEhxWWtGVU1Eem5FUms2T000emlRZzZsV1FPVXBTVmpkdkdDck02?=
 =?utf-8?B?SFp5ZXVtcUZ2WWk1OUFMY2QvTFN6TmJ0QVYvcGFWY1R4OEp5bEJYbFRyR21T?=
 =?utf-8?B?TnVFNHg2MmY2YWxkdHplNmFPUDZlaXA5K0V5S0RUaWlqMEloaGNZMkpUUDJr?=
 =?utf-8?B?SzJIT3BFM2tIaHg0OG5RcDBCOS8rV2hqdzhJQW9BTEQxdEQ2SWJMUWx6azYr?=
 =?utf-8?B?QmtpWXhMK09RU0FtRnVpL0xBTUtOWkg2Sk5qdk1vN283YjlRUDl4OW1YWW5o?=
 =?utf-8?B?Nm5KTkw4Rk1oNzhXZHJxcGJjMXYxVStiWk5YT2JieEgrL3ZKNVJKdEdhaDIw?=
 =?utf-8?B?Rlpzd3dXWjJGMkNwam9YNFlCclJ5OGpSUTMwM0k3WmNiWHF0eTQwZjE4a2k5?=
 =?utf-8?B?bCtYNDNXc2N3L0tCVE9uZ3p0aW9QVWpYRllockxDLzRIaXNpV1pHd3UxWWJt?=
 =?utf-8?B?bHBocmR3d2dRNlZBUXhSYkhKakx0NjlRRzlhc2dtbUZVdDY1NW1hU2Y5RnU2?=
 =?utf-8?B?TzBmYVlCME1DSVFnZDh4SFdEckJqWElibUhEZHlrVlYvMm5MelBUZ0VYMEtT?=
 =?utf-8?B?d2Zvb1UySHo1UHMvSnVPQUh0MXZiMUNHRFdPSmxpMi9VaXg0T2pIUTlRV2U4?=
 =?utf-8?B?bHQxQzYwOWozcUNidmhrdm8yVDc2a2plUFlQN285c05YTXZqcThPOVp4VEdo?=
 =?utf-8?B?SVU0d0x4dmxWQTBPbXFlRGJnT0dPaVBJTm1tNmNrb0gyYkxmUThIdmM4RkpN?=
 =?utf-8?B?M2N4eW5BVVo3VW1CSG51b2ZQT2JLd1cvZGF0eG1PUk4vcU1mTDBkZDRWTy9n?=
 =?utf-8?B?Q2c2MGZWZW5ib3JxOE5ZL0dYWk1KYVhLb0tjSVZaZzJnNFVsT1Z5b2FZN01T?=
 =?utf-8?B?QXNSY2lEa0R1YTdiUm92S3p5b2NRNWFPNmY4Y2FvM1UxdVZKVE54L0J1ZmRV?=
 =?utf-8?B?VzZrYmNhVW5TL0h0RWZYZXlvWm5iRUVCWm9UMC93aVFBWFA2NS81dTNUN2RK?=
 =?utf-8?B?a0dDNml5eDBydTBMYk51bkw2WDZGNGJMSEpnUnpnZ2JXTTE4Q0hjVjhPdzRy?=
 =?utf-8?Q?KLJSL61UlVd1j8TQnf?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12019.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f35a6dd5-f51f-412c-f1c2-08deb25210b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 07:17:47.0379
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kbyKx5Jgp+4LFAvYef8AcyHINaaaNVnYkvta90EKzHKuoLAZO91ywnAGsz/TPDmG66XbOSayRjtQiRANJvFpQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_001754_220848_4BFD4542 
X-CRM114-Status: GOOD (  16.30  )
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXkgMTQsIDIwMjYgNjoxNiBQ
TQ0KPiBUbzogSG9uZ3hpbmcgWmh1IDxob25neGluZy56aHVAbnhwLmNvbT4NCj4gQ2M6IHJvYmhA
a2VybmVsLm9yZzsga3J6aytkdEBrZXJuZWwub3JnOyBjb25vcitkdEBrZXJuZWwub3JnOw0KPiBi
aGVsZ2Fhc0Bnb29nbGUuY29tOyBGcmFuayBMaSA8ZnJhbmsubGlAbnhwLmNvbT47IGwuc3RhY2hA
cGVuZ3V0cm9uaXguZGU7DQo+IGxwaWVyYWxpc2lAa2VybmVsLm9yZzsga3dpbGN6eW5za2lAa2Vy
bmVsLm9yZzsgbWFuaUBrZXJuZWwub3JnOw0KPiBzLmhhdWVyQHBlbmd1dHJvbml4LmRlOyBrZXJu
ZWxAcGVuZ3V0cm9uaXguZGU7IGZlc3RldmFtQGdtYWlsLmNvbTsgbGludXgtDQo+IHBjaUB2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGlteEBsaXN0cy5saW51eC5kZXY7IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAxLzNdIGR0LWJpbmRp
bmdzOiBQQ0k6IGlteDZxLXBjaWU6IEFkZCBpbnRyLCBhZXIgYW5kIHBtZQ0KPiBpbnRlcnJ1cHRz
DQo+IA0KPiBPbiBXZWQsIE1heSAxMywgMjAyNiBhdCAxMDo1MDo1OUFNICswODAwLCBSaWNoYXJk
IFpodSB3cm90ZToNCj4gPiBBZGQgb3B0aW9uYWwgaW50ZXJydXB0IGVudHJpZXMgdG8gdGhlIGku
TVg2USBQQ0llIGJpbmRpbmcgdG8gc3VwcG9ydA0KPiANCj4gRGVzY3JpYmUgaGFyZHdhcmUsIG5v
dCAiYmluZGluZyIuDQo+IA0KPiA+IGV2ZW50LWJhc2VkIGludGVycnVwdCBoYW5kbGluZzoNCj4g
DQo+IFNhbWUgcXVlc3Rpb25zIGFzIGxhc3QgdGltZS4NCkhpIEtyenlzenRvZjoNClRoYW5rIHlv
dSBmb3IgdGhlIGZlZWRiYWNrLg0KDQpXaGF0IGRvIHlvdSB0aGluayBhYm91dCB0aGlzIHVwZGF0
ZWQgY29tbWl0IG1lc3NhZ2U/DQoNCmR0LWJpbmRpbmdzOiBpbXg2cS1wY2llOiBBZGQgb3B0aW9u
YWwgaW50ZXJydXB0IGVudHJpZXMgZm9yIGludHIsIGFlciBhbmQgcG1lDQoNClRoZSBpLk1YOTUg
UENJZSBjb250cm9sbGVyIGludHJvZHVjZXMgdGhyZWUgZGVkaWNhdGVkIGhhcmR3YXJlIGludGVy
cnVwdA0KbGluZXM6DQotIGludHI6IGdlbmVyYWwgY29udHJvbGxlciBldmVudHMNCi0gYWVyOiBB
ZHZhbmNlZCBFcnJvciBSZXBvcnRpbmcNCi0gcG1lOiBQb3dlciBNYW5hZ2VtZW50IEV2ZW50cw0K
DQpFYXJsaWVyIGkuTVggUENJZSB2YXJpYW50cyAoaW14NnEsIGlteDZzeCwgaW14NnFwLCBpbXg3
ZCwgaW14OG1tLCBpbXg4bXAsDQppbXg4bXEsIGlteDhxKSBkbyBub3QgaGF2ZSB0aGVzZSBkZWRp
Y2F0ZWQgaW50ZXJydXB0IGxpbmVzLg0KDQpQQ0llIGJhc2ljIGZ1bmN0aW9uYWxpdHkgKGVudW1l
cmF0aW9uLCBjb25maWd1cmF0aW9uLCBhbmQgZGF0YSB0cmFuc2ZlcikNCndvcmtzIGNvcnJlY3Rs
eSByZWdhcmRsZXNzIG9mIHdoZXRoZXIgdGhlc2UgaW50ZXJydXB0cyBhcmUgcHJlc2VudC4gTWFy
aw0KdGhlc2UgaW50ZXJydXB0cyBhcyBvcHRpb25hbCB0byBtYWludGFpbiBiYWNrd2FyZCBjb21w
YXRpYmlsaXR5IHdpdGggU29Dcw0KdGhhdCBsYWNrIHRoZXNlIGhhcmR3YXJlIGludGVycnVwdCBs
aW5lcy4NCg0KQmVzdCBSZWdhcmRzDQpSaWNoYXJkIFpodQ0KPiANCj4gQmVzdCByZWdhcmRzLA0K
PiBLcnp5c3p0b2YNCg0K

