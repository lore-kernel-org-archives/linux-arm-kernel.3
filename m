Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DC9106FD69
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 02:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQyhKF7mVTGKt1VJ4tCDKmZndhbwG+m2EFBRAafYluY=; b=XhCRt2m8uoxAV4oeavwPYx/5mZ
	h7N3SbUoUF9HI/8T5OHs4xxCT4D7oo5O6iBPvmxBwDXGI9W3sS+1fXOCf/j7WBNn77tAdfq9abouU
	usbvvVtoLuHO+PxxMWxpI3xLGOriKWijEmgHEppVw9ibgHsJSZJt5C/yxJ2QfW1mRSgw6LtPyCYa+
	vZfC/UxEcqRKT8KFFsJ78DccpTeGHUhfwrV1+YbMmiAXn9zMLKKzHDgmnt/H6fu0UU3Rxd/bB9fW7
	XnDD7gnYUroiPoW6/AChYqZ10Q4gCa3Eznj0gtbqp1BejPlGAqJeJQypdimka3Th4BOWBwluKQ2QI
	/CIhxegA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0sFN-0000000GEb7-2Gqv;
	Fri, 13 Mar 2026 02:27:29 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0sFL-0000000GEZy-0Nql
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 02:27:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZGUQNFEhnKFXhuy9PC8RSQDQhQQ3uGxHNagrpr1mRCqRwSsqlPc6HRQmH0vzynbSWNRTqH3/ezZPpA3PH2uewViMabw1K/InOJrMjLLEujjxEZi6n+P8/0Cxwijuqu9m6HeRap8qkqstGPBMAWUiLwkyXlsxhznb4GH2fEX22Y+nIssP4wuJ9N/hx9BI0qJOPQymyzJiu/ij5qXpWlX2mhHLJsb5430C45yYkyxQiWr3oP0JaWNV73ZAqQIr8/axFft71kQT2ZOlcbMlji03odMrrejsMw+P1soYKxAEw4m0XaMwrLOQxaDIq7ehiDwYo+zIp4AfGvpTdCKN4WNRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQyhKF7mVTGKt1VJ4tCDKmZndhbwG+m2EFBRAafYluY=;
 b=YYGmzkd4mNSpdlrmSk9/k5vWNgUZuvSFg5uzRrZbLwCN+k2QKvfrsGWtr2iKvnNBC7EhkozNONbyZgCHUd+TJaiz2R4vBlvizh18K0e/g9gZzVl4zwbxWw4GTN4uyZ5EeH1nbDI/L6yokkg6tpNSAzlOicOw2d34Q09Lso8ttDMbGaFBC52ZW5m3q33jgRBfX3Hr/ED7ivD9WLqbr6izU014VDdLo8sc4X+UuTFMuldfg4PZMKQH2xQgv4nuSFk0TF/I1urWflJ/pJ95SbnHh4xFsdWh2h4KUT/wv+yAA23wqzWmTWQYve+rurzgyHfVosYPdFg1u5TM7DK+2x2JeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQyhKF7mVTGKt1VJ4tCDKmZndhbwG+m2EFBRAafYluY=;
 b=LkrthrFla1a167nHqDwLCMHiswYDe5RnksGuaYD9lKTR43E5L+tnuvf6lvm9NEsrsEa9/1BNNJGz5wqHKKWXGVqnBEfdyrDjk471JaEEWE6w1mi4tLUAGZVK8lbXiXFSCDQTrAaSq4seQhblwdhM+8ryT1hXyj8jEl++2NDG7CH2NgUenWs+W2HvtmHNn2fzo9i98k/+XeTBi/E+dPudCbYZ3HhYXhIo1hRoktg/YwkvVb2o5sl/pOxi/WIP8J25tcWJ7UEYhjzBFCROcPDdElIaPnzhdOKCz1IThh33c5jy5tbQW3/6AAAi6Zr3yKlEV8qJ/SxWSVGuZSQNW8y/Lg==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PA1PR04MB10940.eurprd04.prod.outlook.com
 (2603:10a6:102:480::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 02:27:09 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 02:27:18 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Hongxing Zhu
	<hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, =?iso-8859-2?Q?Krzysztof_Wilczy=F1ski?=
	<kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob
 Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li
	<frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel
 Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jingoo Han
	<jingoohan1@gmail.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: PCI: fsl,imx6q-pcie: Explicitly
 deprecate reset-gpio
Thread-Topic: [PATCH v2 1/2] dt-bindings: PCI: fsl,imx6q-pcie: Explicitly
 deprecate reset-gpio
Thread-Index: AQHcslAvPRd3NV8vsUK8f1lUXc6zS7WrvElA
Date: Fri, 13 Mar 2026 02:27:18 +0000
Message-ID: <VI0PR04MB1211433ABEE52392089255E639245A@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260312184344.42337-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260312184344.42337-3-krzysztof.kozlowski@oss.qualcomm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|PA1PR04MB10940:EE_
x-ms-office365-filtering-correlation-id: 4d3cd569-0b0f-46e6-0d63-08de80a80ca2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|366016|22082099003|56012099003|18002099003|38070700021|921020;
x-microsoft-antispam-message-info: txOZo3qEgF7aJ/0k8QqOdO8GkyYD0VaF5ULymAb4n8yldsffS/Vb4y88rdAsOIx1ebAiyZx2LfSOxYk6yJJJi9SxLQTmC8l2OclgX0xaDDrjDPJEIHRlkR2WrCP7ZKxq7SG7SNIWQGwyGy2a1ouzP1Y4pb1FTI06+Mzvfs8NkBDrwKoB2U/lmw+s/8gFuY+n15I9+fy71R16HnDi9WBcSEfGDpYUuH7hGttIOUQC4TdV8IEg9FLJlTPPu5pC4sY7vD+tUlTI+hfUCPkTXnhtQFLJxKOA2hIQRE3DeK3r293HWE7t0ttkCsD7gL2lDpd281jCQZWOyBFEi1u38hq0DQ2Udt6uykQMcZWOAF3W7XIc/4/8oD8tEzLFPqMmAWgJW+v2o3qefgoSYZAMF2DYMLsEJEqFf35RSNfiy88PtIrI9HfpKheuESqP6L10/B4YlRq06TdQh9kVrVkAKNm9Dn73yNZ4tjFA1+Z9xEddB/pOHB3z2mgElM4lcHfD/EB96MsjpwsL7WeN32HrvWgeBaqDkdWnIqKgBo6JSBA2wkfceLTg9vuOghBQMa3jYPDUlWswSiJUtk8QMqtibls6hvy1hJRn2puv+9hySW3sUesD6wx+lbrY5/CfuPNeBUrny9MPTG/PlWZ6WTMy2xbvIKcvFhNv1kdjCTdqX9UoOQzZXnc8jg7/sygKaHGSFf+cMh0vlSI3lpJ8VQiDejJkawYivGRfceh7rVgHF3GWIHr16zfMsYUmJ31DBXTFAK8D
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(366016)(22082099003)(56012099003)(18002099003)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?4dsahqLFfNeA0fPqIQKiLP8fht0KPySUV2fuoQOMYmbxXg3UmH6I8of1Ag?=
 =?iso-8859-2?Q?yNSzULMCQ62MYccGIfzBUa5Q8N11P2orD0celWuVtBWxwOwftp8LzZDYoD?=
 =?iso-8859-2?Q?+78Uczbg6mlaRfQ06D358Nx5m17Kg4ek4RTuna8kA+jmd1pGEBhn5wFJg5?=
 =?iso-8859-2?Q?2/DZEmjb4YTgfIhi1+m84kPS65l7VlZfo86iMphbF8JQP6iwmXRhd1Y/S+?=
 =?iso-8859-2?Q?Me6KBRTUa9hg79VEXTqm1k6Qeu4ju4EL4/Xjlh7PMmgKLZQbPGBwTNgSYq?=
 =?iso-8859-2?Q?VbGDpc+3QXGNuxBUIjzAch1LvIDfL3xQ9k6+ChxfnJv10i3TB82mLEFH5A?=
 =?iso-8859-2?Q?1s8h6Aro2PU/hDhDVLzV7puYuV0+K/J6ZRfH1yCfWQtBfmmC+svEp4J6CW?=
 =?iso-8859-2?Q?1Yb0x0PegHXelJPdjxorpg+zFHmiRMgJHN/Ps954ZzhDuu3TekGfTx1u/a?=
 =?iso-8859-2?Q?KvYnwUQftTcjBNqmqQeNrglXO9VHi10ulz/L/VvGlConIlZIz9xwkWup9+?=
 =?iso-8859-2?Q?DKw/iM+KF882jaGMLC1JIXzgibZ/R4PcqfmbVqGjckPwetJaUGhyVIn2ku?=
 =?iso-8859-2?Q?a4sze0wV4klxDIe7gGGoLjAAf95MRrDduo8vNDjecb09u6W2pa+9J4Gbty?=
 =?iso-8859-2?Q?AS/uSWscwk5NFGcXIrUh/IbEUId2PHIJJKarFRZJTo2x9eQ/LMl50HOL7i?=
 =?iso-8859-2?Q?eiENDMoZ1COxghEVXayOD4KpoWq8VUyfdwrAezqzf4w2+RI7PMdEdy2Udb?=
 =?iso-8859-2?Q?cf1PEthxECvKRuVUTHARcRKbGaiyYbW0RlB8fEfRqt0S5+fF9E+nOjLpHy?=
 =?iso-8859-2?Q?CiNBEID551qBflp/4DDVIoCrPjDoa7M5ZakNXeD6btwk8kwjywTlMfNLJX?=
 =?iso-8859-2?Q?rA7SiEsS7DeiuMkU8nQwiOjW0zwDbCRkVUjosOTXIM8Gh3bpicsjTUh6Px?=
 =?iso-8859-2?Q?JeuARMBuToouOHzUBx2sVF89iwTOOUMhTo7+KGpxwPmB4I730/SFavfncn?=
 =?iso-8859-2?Q?Toin0DF35O2n1vMKG1kOSTNIY6rfZr5Rrkv8ZEXkz4BjR5uV8iQVo95GNC?=
 =?iso-8859-2?Q?rH2Wuw1yLTiA1BusfDiZOSTqr7NGRCMxG3zKaimStV9mTRLw1DZO/iDwMb?=
 =?iso-8859-2?Q?6E3HGZU7Ti8bZjcla9WsMMTqmO3rldEbn7UzLD8sh8QcMHwY4VEsP421d4?=
 =?iso-8859-2?Q?ISv2rCCLaPPtNe9v3kam/EwTijA9r6nHooIF7Rnh/EBp3oTn9EdINfDLPi?=
 =?iso-8859-2?Q?jCgT2z+XP+kgr1EpML9wbWqMz8aYZiger+RO8GKkbHGOYXjmCY4mWW87Kj?=
 =?iso-8859-2?Q?ephGNo89og7S4INKTfJE8irJMpXYLcdrWmy5bmwtvtk0vaoJY+pHCyJ9B/?=
 =?iso-8859-2?Q?qYI+iRnL/LG0gzG2Zx99lJ5BrQcRBhpiiX1eM9nZmcXBopeb75lBwkBqob?=
 =?iso-8859-2?Q?NK4NcLn8Dt9KVun32FtoHALCZmmgEpd8Cbl1X2Y++m17Gaavdj5tQVjqJF?=
 =?iso-8859-2?Q?oeXDN1Yf+6mcKbolLtzusbRe6hunXyLb4wK5zf5zXWfwutHh3xq4EJ8N6i?=
 =?iso-8859-2?Q?5Ik48ZNbuznvdzSyFULysPL0HFUU4IxFj+LLRM+cw6p2fyWSfjAtPs3u2Y?=
 =?iso-8859-2?Q?YsfKio1hKMIEpSIMFkKIVoUt46SNy0onS+WhJf5wWND4rZdOwcLYha4SFa?=
 =?iso-8859-2?Q?Y7T+teJWIVZmgVoJtBJIfrpyYn0B6qx9iyeQLs0wxAeYWsb+tKaOGPIzc/?=
 =?iso-8859-2?Q?woyuq3dSv9Is6EbSXJlAL2CqzEJmtTTs2SYW/DE4niMr4w?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d3cd569-0b0f-46e6-0d63-08de80a80ca2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 02:27:18.7389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: heMqa1DX7ljP+BmByBkXXGgch1QWE6ie9wH4TvQfnp3jHpYM/SE0iVI6O7JxzCJ8ymrvTBy5Ks3blWLvkRdiWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10940
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_192727_159125_6DB3DBCE 
X-CRM114-Status: GOOD (  22.31  )
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

> Subject: [PATCH v2 1/2] dt-bindings: PCI: fsl,imx6q-pcie: Explicitly depr=
ecate
> reset-gpio
>
> The binding references snps,dw-pcie-common.yaml which already deprecates
> "reset-gpio", however mentioning this property here lacks this mark thus
> code is confusing and suggests property is not deprecated.
>
> OTOH, the property cannot be removed from this schema, because it is an
> ABI implemented by Linux kernel in gpiolib-of.c in backwards-compatible m=
ap
> between compatibles, "reset-gpio" and "reset-gpio-active-high"
> properties.
>
> This creates code and binding which is not obvious to follow, so rewrite =
it and
> be more explicit about:
> 1. Deprecation of "reset-gpio",
> 2. Relation that "reset-gpio-active-high" is used only for that property
>    and not proper "reset-gpios".
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> ---
>
> Cc: Sherry Sun <sherry.sun@nxp.com>
>
> Changes in v2:
> 1. Rewrite the commit completely after Sherry Sun comments - keep the
>    property, but add "not" clause to forbid usavge of
>    "reset-gpio-active-high" and "reset-gpios".
> 2. Because of above not adding Richard's ack.
>
> v1:
> https://lore.ke/
> rnel.org%2Fr%2F20260311154955.145120-3-
> krzysztof.kozlowski%40oss.qualcomm.com&data=3D05%7C02%7Csherry.sun%4
> 0nxp.com%7Cc630bed6bc4f46715b4408de80675002%7C686ea1d3bc2b4c6fa
> 92cd99c5c301635%7C0%7C0%7C639089378371805072%7CUnknown%7CTWF
> pbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4
> zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DA%2BiFa
> kDVdjPn0JJxUDlTDt1ej4iqnBivDktjwbcpFK4%3D&reserved=3D0
> ---
>  Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> index 12a01f7a5744..12cd1b9f78d0 100644
> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> @@ -62,6 +62,9 @@ properties:
>      description: Should specify the GPIO for controlling the PCI bus dev=
ice
>        reset signal. It's not polarity aware and defaults to active-low r=
eset
>        sequence (L=3Dreset state, H=3Doperation state) (optional required=
).
> +      Deprecated, use reset-gpios which respects the polarity expressed =
in
> +      phandle argument.
> +    deprecated: true
>
>    reset-gpio-active-high:
>      description: If present then the reset sequence using the GPIO

Hi Krzysztof,
This property also needs to be deprecated as Rob suggested in my previous p=
atch :)
https://lore.kernel.org/all/20260121164002.GA3427694-robh@kernel.org/

Best Regards
Sherry

 @@ -224,6
> +227,11 @@ allOf:
>              - const: ref
>              - const: extref  # Optional
>
> +  - not:
> +      required:
> +        - reset-gpios
> +        - reset-gpio-active-high
> +
>  unevaluatedProperties: false
>
>  examples:
> --
> 2.51.0


