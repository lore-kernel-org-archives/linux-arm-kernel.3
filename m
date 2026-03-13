Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B81B106FD98
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VhDEdo0SqHjfiUVNkXuzZvaiGvwACdlAeFsF2xtcncc=; b=tw7Y3a3dpO6ur7WkyEh3jfPF66
	f9+3rXJnHsvc4YHdrA+viUa8559TnDHC6WW+naU1ZjdhLjqRpbDp0t9IzzERouPrvYo1CZLwNdN7/
	wlObNt1euu2465yL4q26CYJwnHV7SM7Tp90tkdfKCQnwQ7O4AbcLnOtlEoowFr4ijcbQa+W2K5+4I
	p/jiPASBeFZwYAmCD9jGFmyL3yIBkNbCwqYt0tS6xE0zwkqr3XR3k9THDAUwei3+A+Jcq608vfye8
	c8H8PpfLVTACEUi6E3Xw+a/J4vhYla/GM7tm61grJRs6VCO/mOs/2adEV6XVJDAv2PDwH/jEWABtL
	nzW0XURg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xP0-0000000H9Mk-18Ay;
	Fri, 13 Mar 2026 07:57:46 +0000
Received: from mail-westeuropeazon11010023.outbound.protection.outlook.com ([52.101.69.23] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xOx-0000000H9Lo-46Sx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 07:57:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUEJpTx3vH1DBterfJhi2NeYct8AJGhsqYv0hG1//jpg9Qmocc033SLZP69HPzZoIkat7zfgv7sGHC5hMI3Z00wSBOvlcVTtOFWZlkcG4pHPThtt5AZAYjcIr+jeLOb01rxyIqcjgzLCG/m5bRNUA3BVSdXx3MICecTeXLHEhGSTVZYb4+ZqMKaJg6AV0Lm9Gyjx+RzmV1D/Q6jAzw52WDm8kLl4tbYXPtU7GvdS9ene4TIpz1RnsnHXyUAZo/1GBRGktcgYrjtfv2AkAfrtZRDRE2S0IuwyYwZz1AmsCYWYuMXIG69mAjfd4hQqNV85B5w3Vd6Bnrx6PmwaXgNJuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VhDEdo0SqHjfiUVNkXuzZvaiGvwACdlAeFsF2xtcncc=;
 b=Kt7qAQC2hLWo1EDLXx27fCkUxw8kdyetlLPpZ8oKdgi6i0A3zYU3Lny8kuYt311Zdg+MfXF8kNyhWquj3y2g86nOvgqUuacsVKyFuMc9GXzpi2DkL1Qk7sT6I70wV0efi4JXPFu7sHst39Rn7CdDs+gadFVhOC7LeiLDlvjrq/fObiLXsj0gOK7KJVDmHHOCn+rYJtt1B5F+peFOE/n15OsJ5IHbU1YUsJwY19pXj8Mo4ksp61QTU0euQwC6QmbEQp0kTuHR/8bS7yB106YptvUNK8msMGVq/IRcBLSGSeoYAgWq3f8r3KKQrw+TCP1j3FBisSQm/0m9f6Nap5Cwbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VhDEdo0SqHjfiUVNkXuzZvaiGvwACdlAeFsF2xtcncc=;
 b=A1RgJ63nAp3qF1N6db9aMfNA8+JCPch3U+PcC8eLE+xmvl4jLZSkDyCaFL2v1NDfbeGDdIc98PcY0DPYw3s6TODVrivdfkjYazv58qxbcrBpBvtD6OzCyiiaEpurEnnQXpNO+gLLOPOADuIi58k/87qzNiFBcOsjzUcHzi1gw9/x+MzPX4fCBpa190Okqdd97hsgzBkPivuWme++Z/VDdk2HGNOOa8IytmuPkoqDCz3U9TtQw61tV/3/vIGKA6IDhIe5AYaOnUQ5w86ciqs6FjUw7eBOvihYR0L9vrMZ2Ai/VGfQlQhryLebsBNgskRKH+Bbjg0NNgPttKIJj1SHbA==
Received: from DU2PR04MB8840.eurprd04.prod.outlook.com (2603:10a6:10:2e3::6)
 by AS8PR04MB8753.eurprd04.prod.outlook.com (2603:10a6:20b:42c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 07:57:25 +0000
Received: from DU2PR04MB8840.eurprd04.prod.outlook.com
 ([fe80::7c5d:60c1:2432:86a1]) by DU2PR04MB8840.eurprd04.prod.outlook.com
 ([fe80::7c5d:60c1:2432:86a1%6]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 07:57:26 +0000
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
Subject: RE: [PATCH v6 2/5] dt-bindings: PCI: imx6q-pcie: Add i.MX94 and
 i.MX943 PCIe compatible strings
Thread-Topic: [PATCH v6 2/5] dt-bindings: PCI: imx6q-pcie: Add i.MX94 and
 i.MX943 PCIe compatible strings
Thread-Index: AQHcsqiBwOUlMFZpKEuAL79eKxkiGrWsFP4AgAADjqA=
Date: Fri, 13 Mar 2026 07:57:26 +0000
Message-ID: <DU2PR04MB88405F0C55E46D74828E6CA08C45A@DU2PR04MB8840.eurprd04.prod.outlook.com>
References: <20260313051718.1931375-1-hongxing.zhu@nxp.com>
 <20260313051718.1931375-3-hongxing.zhu@nxp.com>
 <20260313-real-dangerous-dove-46cdca@quoll>
In-Reply-To: <20260313-real-dangerous-dove-46cdca@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8840:EE_|AS8PR04MB8753:EE_
x-ms-office365-filtering-correlation-id: 50500d9f-092d-4851-ec50-08de80d62b2b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: pFggjzMD6yl1CLrxj8HBsTDCQzrOOANAp6ZGkr6QrAreIeRCwVDSfDMhxmMpV+WgMvQy3sDS+W2jk8MqCETASBJz0dYj1KWAskSEr8GQImlWNOVLINhOIcy2dwFB/QH+LLmKclDMmjNDN1A8YSFzIUwqMttJsnSfK2z3odYHnRP5f50bGw94jsPQ33GvfulefU5GZunOCVo9/YHZbijZ+FpdUil53zY+5OQz0USGBPYjGNMKjQoIk52rHNVOGL/+VDjHmNOklOk2D+xgBrmUvJGuRK3jBG/s251NjMshUScFUJHfpYRZrjd0eNuEIfgb9m4eNLWTVI7l+XB/eXDehUJd6w34g+OtaTEyxlYog145JZSZa9mwlbXQQ6XppRejaa6YruHLfpkLha8370r4LJr8kWPKMjESh+snR3DwpVjm3tjKsApJRj0EkUu05JGEF/8eRTqiRdRdCvM6Ldag2CRB7ROiybCFJgIEQMy1mHKtveYNF/ZbhFvdWENCBliCLvqXXXb6bUdwKyFF4ZGMSo/9mKB/T2I+CeAFkd3P50AwfLvzHaNZ73Mfj04ziFUcJXgfpCZlgj8rsxasXhcvPrKRA8V1aE7RlHCoP/1U9qV7ffBWvtLzBKYI3YiicD7pnNGqOBnwLLiGTTIuqB5dhOHKvRA4VJT/x6zx3XmaWko0cdiv2EsUFRuh4BToWsKc8n9lHtOSn2cGJFSzUWFOJxgTc6vXqfp9NIkFoFValsSLBhdzwqkvXaA7MmTPGYhfIp/szc4CyHIL2VjtmH3HPPPjjDdArzTCFAXSnuSWqPk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8840.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHVkYkJTM3RldXZmV1NLRTNyOFNCYk93U3gvYWxOTVptajNLRkhBQVpWYTM2?=
 =?utf-8?B?RmRpRkNzajJLZmM5aW54L3NubEl0YzZ5WHFRMHgrKzZiVngzN0I3M0NZYTNK?=
 =?utf-8?B?T0pDOTM2R1Q3K05mZ01tcW92VTJrVDlTNFFCWDllKzV4YWtxY3lTU2JZbjNu?=
 =?utf-8?B?SnQ4Y0NlV1hRd09ydTkrY2p5RG41WStPRTQ5VWgxVE9rL2JZUWlEbmhvVmJQ?=
 =?utf-8?B?djNWRkJIb2xVZ1pLZGx0dERReTRDdmxKdmdOT3E4Z3Y5UVpQdURsZUVaanNG?=
 =?utf-8?B?WWQ4YzRvRzBYQWRpbk1DMnpta25WZWZuLzlneTM0T1hORm82OTZ0L3dKOWlm?=
 =?utf-8?B?ZEtRNm5jaERVdG9mbkVuK3JCWEF3bk9mdW5YdUZaK1g3dDhkaVRXQTZtaTho?=
 =?utf-8?B?blJqc3J1U2hEekIwaXlna2xKRmx2R004NTRPZUdsMHBwRFdISlZLMzdxbmpT?=
 =?utf-8?B?WnVRNC8wYkxPK0ZHTy9FMUN1MTFkV3JtYVZRTVdpUTZNdWVFa0VJUy9YRTFP?=
 =?utf-8?B?b3k5Y3Jla0NwOU5PeUNFaE5Mdk1OR2FvMzcvV21RQ05TcTI3VUdRWUVKUjk1?=
 =?utf-8?B?MEU3ZXpEV1NwWW1ENUdDNU85UzRRaVFiZUx6UnU2ZW1SdWNjZVk5cVVneDlB?=
 =?utf-8?B?Q3hjVGh2R05CVnAyYTBZMXJvQTBvV2ZJZVI3VGswOTRJZXIyakwraUJGVkoz?=
 =?utf-8?B?NGJyK2VBajVCVTdHVEExV0t6ZjVBaGJUQmJSQ3BCa3JRL3ZzMXZsVmFYaHd2?=
 =?utf-8?B?Y2JKTnhZdmpUdkcxL21adEwvLzhvWG5FSWRQTmwzWDJyTk8vM1FRUXo1bytW?=
 =?utf-8?B?ZThvOC83cGFDU2p4TTd3b0ZiYnhOZ1RsUTY2STdVZk1UeW0xeEdoWDJVOFJE?=
 =?utf-8?B?WW81K01hOFBycE10ZlBGTGYyTnRUWU1QQzJKSGFFZGg1YzdaeUZlYVZYdml0?=
 =?utf-8?B?MEZqWXFteHNkb0lVLzUrOFF1WC91WkNLaXJUZ3R1Y3Irb0lKa0VoS1NQRy9C?=
 =?utf-8?B?cGNYMGYxc1BadTB4Q1ZQbXBBRjNzVzUvcjhtdmg5TkVrd1pObXUrazcxMHVD?=
 =?utf-8?B?TUtndTdJVTgrMnJsVzI5Sll2bi9YdjY3dmhGRU8rR2twdHpYd2prQzc0UWUx?=
 =?utf-8?B?ZEZDc3NvTWt0UVFOUnNGMUgyK1ZjMlpKSkdlSDFhVVVidUVtT3dqaU03eHhv?=
 =?utf-8?B?VGZDY0txTVkvcDNnY0g3aEl2Y1pHRUIweW9nTC9QbmtrVW4xSEd0c2ZaQW9j?=
 =?utf-8?B?MEdvQnFCbVNOcnJMN0J3VXVPVmw3VUxBRWIrK2V5WmhrQVp0cGRVRENDdmdn?=
 =?utf-8?B?OUptSFo1QmZrS2tBUFAwQ3laNkdDc3M0aTA2c1k4eDkxZEVud1BuSGwzVWpl?=
 =?utf-8?B?dnptdDdRSVBQcmdxVkZ2TGh1dk9qcnEvRHluczhWM2JhN3dlbDd0Wjl0NHEv?=
 =?utf-8?B?TjBMQXpMSmdIeU9aNTFQakVQRmhvNCtJamZNb2E1QmhmVGxVd3YydS9zWVdF?=
 =?utf-8?B?TWdKN3hOdWdGNk9YYWJPQ0d2TFR2eVVBa21XSlRvQkpzZU5ldHVHYzFHWWV1?=
 =?utf-8?B?RjdpVFc2anZxNUcwbWlsVThqU1ZzSk1MSGszZEozZ0Fsc0N6NzIySFFuN3Iw?=
 =?utf-8?B?MzVubzljYkdIa0RsbUtmWE1jL2drQWttQXBldGxXKzVZVkJPNGp4c3BQOGhP?=
 =?utf-8?B?TkNac1NZRUQyWStTN0JVUExDUzdJUkxLeWc2T1hja1JZcmlGMHB3YkIrZWVQ?=
 =?utf-8?B?aVJzWmRWZndXNllndURrZHpQQ3JFWG0xN240SVVCcHdlUk5YWHVRRlJXbVhH?=
 =?utf-8?B?djIvcU9HQXQ2RkJVVCttLzJyMWUxbjZodFdDcFl1TTRwWndGd0JMRHgrL2Vz?=
 =?utf-8?B?MEttcTR2VVZtZEhyanFUeWUzZi8xQU5wSThTNWtYVzJFbG14c3RYaU9hYXZx?=
 =?utf-8?B?R1VieThEZGZYU1dmeVV0bWRTSE5BbTF0dDRpQlBpS2NJeGNHQjBHbFRCdDlL?=
 =?utf-8?B?RnBMNmN0WE1vblZTT1JYWHVvWG1BMHpuU0FpRWdwanFLUFQ0THFOQUszeHBL?=
 =?utf-8?B?c0d1MGdvazJzRERMdmNKSFRyYlVHb2E1dGN5SGp4MGkyZWFaVEhBYzhFUnVQ?=
 =?utf-8?B?RWVGQkVJVEVlMnFXY1NaTjQwallCdTB1b3JDSUdZVEZ3ZGl2K25RRmM4Mncz?=
 =?utf-8?B?SjBoWmdrbGh0aFQ4ZklvRmFUbVV2dWRWT0V3ZlNPNWVJSUt3c3VyQnNwaGM2?=
 =?utf-8?B?NG1ONFlvUlVOUHNnYUREMXRxN1pzWXNJbnBmVGYyZmxsS1BEWm5YTEZpK2Jq?=
 =?utf-8?Q?DeE2N4XPMcSxodBASG?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8840.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50500d9f-092d-4851-ec50-08de80d62b2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 07:57:26.8767
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d6/xmWtyCICcUxfnYPGNDQMWoPPjGkHZmtAOutKyrjwbMddN/jqqZqJKnklpPX3spDIZ/Gjms3jhYPQQDARnTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8753
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_005744_025906_2B0D16FF 
X-CRM114-Status: GOOD (  16.42  )
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
IDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjblubQz5pyIMTPml6UgMTU6NDQNCj4gVG86
IEhvbmd4aW5nIFpodSA8aG9uZ3hpbmcuemh1QG54cC5jb20+DQo+IENjOiByb2JoQGtlcm5lbC5v
cmc7IGtyemsrZHRAa2VybmVsLm9yZzsgY29ub3IrZHRAa2VybmVsLm9yZzsNCj4gYmhlbGdhYXNA
Z29vZ2xlLmNvbTsgRnJhbmsgTGkgPGZyYW5rLmxpQG54cC5jb20+OyBsLnN0YWNoQHBlbmd1dHJv
bml4LmRlOw0KPiBscGllcmFsaXNpQGtlcm5lbC5vcmc7IGt3aWxjenluc2tpQGtlcm5lbC5vcmc7
IG1hbmlAa2VybmVsLm9yZzsNCj4gcy5oYXVlckBwZW5ndXRyb25peC5kZTsga2VybmVsQHBlbmd1
dHJvbml4LmRlOyBmZXN0ZXZhbUBnbWFpbC5jb207DQo+IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5v
cmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gZGV2aWNldHJlZUB2
Z2VyLmtlcm5lbC5vcmc7IGlteEBsaXN0cy5saW51eC5kZXY7IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAyLzVdIGR0LWJpbmRpbmdzOiBQQ0k6
IGlteDZxLXBjaWU6IEFkZCBpLk1YOTQgYW5kDQo+IGkuTVg5NDMgUENJZSBjb21wYXRpYmxlIHN0
cmluZ3MNCj4gDQo+IE9uIEZyaSwgTWFyIDEzLCAyMDI2IGF0IDAxOjE3OjE1UE0gKzA4MDAsIFJp
Y2hhcmQgWmh1IHdyb3RlOg0KPiA+IEFkZCBpLk1YOTQgYW5kIGkuTVg5NDMgUENJZSBjb21wYXRp
YmxlIHN0cmluZ3MgYW5kIGZhbGxiYWNrIHRvDQo+ID4gaS5NWDk1IFBDSWUgY29tcGF0aWJsZSBz
dHJpbmcuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFpodSA8aG9uZ3hpbmcuemh1
QG54cC5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9wY2kvZnNsLGlteDZxLXBjaWUt
ZXAueWFtbCAgICAgICB8IDI0ICsrKysrKysrKysrKy0tLS0NCj4gPiAgLi4uL2JpbmRpbmdzL3Bj
aS9mc2wsaW14NnEtcGNpZS55YW1sICAgICAgICAgIHwgMjggKysrKysrKysrKysrLS0tLS0tLQ0K
PiA+ICAyIGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQ0K
PiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9w
Y2kvZnNsLGlteDZxLXBjaWUtZXAueWFtbA0KPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9wY2kvZnNsLGlteDZxLXBjaWUtZXAueWFtbA0KPiA+IGluZGV4IDBiMzUyNmRlMWQ2
Mi4uZjQwNGIzNmY4OTE1IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9wY2kvZnNsLGlteDZxLXBjaWUtZXAueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvZnNsLGlteDZxLXBjaWUtZXAueWFtbA0KPiA+
IEBAIC0xOCwxMiArMTgsMjAgQEAgZGVzY3JpcHRpb246IHwrDQo+ID4NCj4gPiAgcHJvcGVydGll
czoNCj4gPiAgICBjb21wYXRpYmxlOg0KPiA+IC0gICAgZW51bToNCj4gPiAtICAgICAgLSBmc2ws
aW14OG1tLXBjaWUtZXANCj4gPiAtICAgICAgLSBmc2wsaW14OG1xLXBjaWUtZXANCj4gPiAtICAg
ICAgLSBmc2wsaW14OG1wLXBjaWUtZXANCj4gPiAtICAgICAgLSBmc2wsaW14OHEtcGNpZS1lcA0K
PiA+IC0gICAgICAtIGZzbCxpbXg5NS1wY2llLWVwDQo+ID4gKyAgICBvbmVPZjoNCj4gPiArICAg
ICAgLSBlbnVtOg0KPiA+ICsgICAgICAgICAgLSBmc2wsaW14OG1tLXBjaWUtZXANCj4gPiArICAg
ICAgICAgIC0gZnNsLGlteDhtcS1wY2llLWVwDQo+ID4gKyAgICAgICAgICAtIGZzbCxpbXg4bXAt
cGNpZS1lcA0KPiA+ICsgICAgICAgICAgLSBmc2wsaW14OHEtcGNpZS1lcA0KPiA+ICsgICAgICAg
ICAgLSBmc2wsaW14OTUtcGNpZS1lcA0KPiA+ICsgICAgICAgICAgLSBmc2wsaW14OTQtcGNpZS1l
cA0KPiANCj4gV2h5IHJhbmRvbSBvcmRlcj8NCg0KV291bGQgYWRqdXN0IHRoZW0gYnkgYWxwaGFi
ZXRpY2FsIG9yZGVyIGxhdGVyLg0KDQpCZXN0IFJlZ2FyZHMNClJpY2hhcmQgWmh1DQo+IA0KPiBC
ZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQo=

