Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA759FEDA17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 01:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/sPbwO/IS/dlyOMyqOdN3fV8xMMIea2XkTBrzq+MNQ=; b=fSPuc0XU862+zEaPjYLFYAcsml
	/dO5C/1I7sV8zg3mzOLzvTWML0lIZR+6wepjJe1zFI6WznNt8LXfBAKiqLZWsaWyXNUYdD7y2qI3e
	wCJfIoTB3RT3ZGiqVXFzsxyy89ND6mK4dRqOOPKxFbbimV80clH3vYv/ymbDJoIb8f3/XJKgtpOU4
	9eKvWVG+XOCSGYiCL6RrV8TEa1c1DTJuqOLhVSoNtPrZuu5hGu1VDUio+Y9qv+M7SfysiI00VUuqQ
	jfEoSA76IDB6d1d2VrD6n3NI+o3NjAFDo/UDW6Spzy7PJu1eCdkQ8aijwmHSgtq78SELaW2NS52fU
	Yvo2yL5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2fnz-00000007ZCd-211a;
	Wed, 18 Mar 2026 01:34:40 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2fnx-00000007ZCC-1R9D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 01:34:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eogL/8m0twUBooUr8okVEsPUMIGYxk6JF67HnbW4xZ0eBtj3JiwIXa0S7O5LVTD5/HtOHFJnsuDB1LaUEb+EPr0PlQiX36bKlkBdq5G9yEIJ5sC5rVG6QZOvgaIRagCUOcmsTdBBTQV3yV0wIH04iFTmJMmQE3wyZMWCMbBEHpMti03PgBkPqwMZh0KkwtprypgHdXIF/0Q3A+kilAcZ7DOrZ/QtJwxTq7oft51hWEt7PSlTR5EjUdQVsSA25G4wsNiVLMrAHuw6rjcmMGGhqh1JF71MGz76JaaMJabVRwHrc2WFy+qp/qOg9x7GJ6lgdbjNeQLYv95l/DJbA2k8OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/sPbwO/IS/dlyOMyqOdN3fV8xMMIea2XkTBrzq+MNQ=;
 b=MXMu8A0k3NDSVxNG37R2sFMr7jf63pMk8Zel5clHQGeGqCF7HDybttGWUxGLYjxBOR28SgrV+7PpKpKubcZnlg5rMEYoYcq7tfI7FIpf4rFDtGAxq7vuqvaXGLJuEUwOpMQhoaetBjMXVQUsikEmv5tvwjXzkvcHxqUucwzE77aF/w2wXNCkHlgUwnvETOUfXuI2E0k3WhCjLSTkwH6eapUDcXBYQt6VqVM7l0FhwLXp6oQB6fFvQPsasOSc6IzFhAOJ9LVuSjyzoFsu9Mnhba/PLeEGLODNiRitwj91czEnPjdm8uwhN3Zhz1TTBHk05T/x/2YS0pNwFkBCsj9hhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/sPbwO/IS/dlyOMyqOdN3fV8xMMIea2XkTBrzq+MNQ=;
 b=IvGiX6+27mIhOPJNer8dTLjVtr7zfhbBJ/nsZmlmY7yYOezr+zgp6kEPLrWqkvyplSqqxBYbCczMHcg4OjX/f9nDZn3DW/54tQ8YEs2FrUEFKhSejrT0WaQpN0YRHUWCLU/y/PitcsPOCKr8eLVF0ElbOTgkjPuDkNiabaUgZPKAWXbBBKplGEb2ILKd4PpI3U7hu0FDgh/rEl0VoQR5Ottc8rtmEybu2ea3Cspa8dtK/E6R3GxRpkSKd6lAWJRc2rdn51cCCPzvlB4dBdTm7iMHHKhj2OdzvNzBfosXI6zCOEzrmujQvCRLitYo3Gp7krHy6s7GZIRICGeK+to5+Q==
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by PA4PR04MB7837.eurprd04.prod.outlook.com (2603:10a6:102:ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Wed, 18 Mar
 2026 01:34:31 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af%4]) with mapi id 15.20.9700.024; Wed, 18 Mar 2026
 01:34:31 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Abel Vesa
	<abelvesa@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Daniel Baluta (OSS)"
	<daniel.baluta@oss.nxp.com>
Subject: RE: [PATCH v2 1/1] clk: imx: pll14xx: Use unsigned format specifier
Thread-Topic: [PATCH v2 1/1] clk: imx: pll14xx: Use unsigned format specifier
Thread-Index: AQHctghP06OSQ6/h3E26NEcW0cj0cLWzgo0Q
Date: Wed, 18 Mar 2026 01:34:30 +0000
Message-ID: <DB9PR04MB846111CC304C2A3A19388434884EA@DB9PR04MB8461.eurprd04.prod.outlook.com>
References: <20260317121953.1100619-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20260317121953.1100619-1-alexander.stein@ew.tq-group.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB8461:EE_|PA4PR04MB7837:EE_
x-ms-office365-filtering-correlation-id: d730df00-fe1d-482b-21b6-08de848e8098
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: +Lz5oiNMJBW7IJt7KASal6NLoTNR8j7pvzuSDwLLH6VQTCv8zVnIv7H18HuyM2/HA0WV/dNDDHBXfr0ls2CH1y3F806zvsZcxIX7bqdsSG0huvVPKG12Vsu51WkI3ZwzgOroNnOpla2kEMKcFVrrd2TtPMSuGUGIc7ma2tjSA+ZD7/bs6iu0CgEZnQ9rFNwsggW8lN2VrV//EVHb3yWhZJMUYH54boLgR6fKAUXrYPpbBe7sqIoC0fafeC9/VicVs1t2G0GWC1b/B7oOIE4YMN1kdmX3U4yqrmGtVfQsfiUDP8XsYRIvMEMK9o51kMv9KZhzTl/KpUa6rFDtfp3v/R0O1wUvUdK/o28vD+Tj3ezLSwa+kkGsXNg6PsY9FzQZRu9xzG4ODHZvKnP1LLkoQslojXAEV/rqkyD4hg5dK2V8shTbWOF2DLJ0vJdJMsHSvapHxM91SagEa5Y6pV1O0ZtiOzt0llnnyDa782OZ4GhQCiYSH/1P0xrE0NlWgZGtxRRmAy7qawoq5o1iixfxIg3FVk7WQQfyw7jn1gCyPRs/D0aM91sDQ/ja/05WmfZvWJdzZdBwG1YulewwkPsaQ3I4vcUxAovxlJXY4amRovh7r5Vh8hcD1eW3aG2mOI/3pXT988g7TyEftmKkCMVtEjP0lxJSuxU7RYda/UGWgoT9StULZIhiKBfFmEykBUoYejVuSBgvLrtEKmEC9Olgw4QVi8RltySIH18V6Zy0pDQkPI7TW4xd2j8XFXrK8tqAhS4L/wEZvVCJLcizDAgyyqYO+L3gMv9YUB35YYa4V4Y=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cgKYaOZIZX9Z4e1m9QsqHwFydShq+rVX8kRFMrajKF5LgN0fNRCBr/HEQ1i1?=
 =?us-ascii?Q?Yb1lvhSW71EnLnLHURkTu6g6FxpAYacDGuZsj/og3n5BK6uZiof2kHtuIA1R?=
 =?us-ascii?Q?jOJuSX2SaTebd3D43NX1T1SdpaZ46iSqNzbHq1nS3CHGUuXePTrclJZZKfiO?=
 =?us-ascii?Q?VqUzhNTbsBSO9aEKCV/8+amjqPG81r2Bc2bRRZXmCxXyuNUBoBYRMI/nK+Rx?=
 =?us-ascii?Q?x+TMsZ1UrBr5jJ/ZntV7ivHtaRI8IlqgQ8prHuIi2EwPOR0awYBhqwC0mxlI?=
 =?us-ascii?Q?v5oouYS935abG7L7y+wSM2jB4aMJr9Kp/jTcmkBg45a2dllEInAIheFR0qKC?=
 =?us-ascii?Q?8DhEawQWWn3EAgsd2hngpBYYBf/9cP6xc7Yhl2yqTi96tea9PFD0hyg1thPv?=
 =?us-ascii?Q?aly9t5igv31+w8qYule5OgTvXr46RDyBSU8kWsWWoYuINyuNT+4AdluYdx5L?=
 =?us-ascii?Q?vOVSH07Rr14KdwNpyUMJb/qya7sUCz8/vuweCVuCldj3YabdpaDACll7W2pU?=
 =?us-ascii?Q?GljPRI5pd3cWSrgoaJ/iZEeG6r3CE6sDaQY8VVoQR+mFRXRuehmeHtSvpIZB?=
 =?us-ascii?Q?tGeLCbKZSRfose6qIqnn3OUpJn6F3uew+cmqHlw1QjwlQaJPVlskUeCFQHaH?=
 =?us-ascii?Q?cRvVHU5u6c/SLjfcmw+Moi1xkBUJhB975nnOj/tURwqMqpYg8eMO2HV7rA9+?=
 =?us-ascii?Q?V6Hq2dt0ZFuV3qiZXewUI10Xui8SG5j0wZn1L23mnEKhVoEw6/GDV8pDH0Ls?=
 =?us-ascii?Q?pAxXp36JMG9afI0NzhKD9ibknai5p8TApbgpe4imkBCAZ5S7u+Ed9uQ41m2G?=
 =?us-ascii?Q?KAiQjm9ki+ryYK9CG8ZjaJ3L56jbhL2c+yKUCeVw4rMW/grmHuIZwrThA/hR?=
 =?us-ascii?Q?/GRH1zcv0tkzqSv2JFpsWMmiGCmNGqkvsqCCyYLCRs2OI1UjliHhJbRTINgA?=
 =?us-ascii?Q?DsQKkgcYJHl5kkKvcCVdkcU8O3fGEFAZv9pJQNHe81T+4qf9C40UIUzx00iz?=
 =?us-ascii?Q?ydL/ZrBCTSow6FHWHOqpFkpy/sUgW5XX1cXqVcnuZZZ8fl52iv4qm6qCd/zD?=
 =?us-ascii?Q?Gq+sZHiBSzlAsQ6NM7YVnzrqTfWZnmzwgNdj5Ik4yumJM7CNulyjv5GkCcJC?=
 =?us-ascii?Q?7Hcj0Wk75k55kza7BcB+V9IGfI5v7IEsazCzsLQnsMWEU1F1j95cSKNoE11m?=
 =?us-ascii?Q?kWznfBlMj7s/WIxu0WgzsufXm4nYIS7MQDkqfxiwq7WFq694Wm0Y5U3xiCvm?=
 =?us-ascii?Q?nRwSfspkAeA65V9Fvy+nOpEr9RogBoMvWcfBsf25kser43kGPFAZ4YfrwcTu?=
 =?us-ascii?Q?XY5iwqLtjcRb2+1C7jyMjYvaPE+6zKRWatWG191R5aA7hl1Bx4rHyqmgNaeP?=
 =?us-ascii?Q?I0HiZ5dJV/MF4aSWUFCGRmkBk1jFqRseEE8sGaTUGB3ey9RucCXRqFbipigW?=
 =?us-ascii?Q?8FCX4u+9tEsffs6jGnXFCUYkp7jAg5wd0epPZUADj7FuhBUTPRlhJwXzcLcI?=
 =?us-ascii?Q?fIUPhLmMomupwIo44k9v3pM/VuObzfGNI0H1HJWjUWDtuRC9HKROIKXfCCtq?=
 =?us-ascii?Q?mhf4Mu01KIjPIy7LDAlTo8bj9IqoywNn2nJ5ChrErZTbWBWjR9eNalKaBBVK?=
 =?us-ascii?Q?5WM1Tpi7q6gz4z8K8VhqAxPFIIuNd8todgWLBlnamqix5Ha2zeanp88qK9Nw?=
 =?us-ascii?Q?w9NgfUVzgdB4jX1jaKgc0yTJMFkRRJE6o0ot1mSznjzRsM9c?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d730df00-fe1d-482b-21b6-08de848e8098
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 01:34:31.0290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CosaM6yx23NoQEWGXb1mEyu82kp8OuIl8mq5Kf+RRA6ikNpD/eHUInCrf9PQVuPpCMq//tzJUKrf4cQKDg9ULA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7837
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_183437_392339_79942C6A 
X-CRM114-Status: UNSURE (   7.21  )
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

> Subject: [PATCH v2 1/1] clk: imx: pll14xx: Use unsigned format
> specifier
>=20
> The debug outputs use %d for clock rates resulting in negative clock
> rate during rate calculation.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

