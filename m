Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8F6D4336A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 09:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oz7vYhgPHG1PjjrNekncJuLS5n3OwxZ69IuhoWlNXCM=; b=Z4iEiHe/XckKxuy3bihXterqzm
	WRskVx7Ew6IYKjcpsaWeoO5KDzGHFk0WCOS3xvlwjNWf8UXSF8nafu79SvFkYazC6ImtgnfXwdWGi
	qxgt3KmebsKHDKEVe3gd+Yqy5SPlq2P+OhTyjm/gIx0dDUAObVEkx/D+lNuPpsoSG3OfTJyTOBrR9
	lgFu9edunl2X4a2BlaqMfEbZJYaobz2V2DHtMYkWMf3jF3HKbvaRqEsaBIRX9czjZsidsw+sN0NPA
	FCu8GvzUC5A6feEIkGknvY5dOt7BvbBu6RsBXngC7qOdXjHZmm2IRiuq5V523z4J8YJaTicjlZLTu
	SZmvZpSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTz7P-00000000JJw-2TWp;
	Fri, 12 Dec 2025 09:07:19 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTz7N-00000000JJc-044x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 09:07:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lvakheHoX81vl6NRpstw2gcnhWdjUpSD25pMrXIgPIy20zORehZIVoov/vsDhbfpmxjaSAMmHQMJPXUW9klvQIXtDIff8mq+Zv0qudEs5Fd23NnKukT3kJzub3BkqaFWwxNktw3HIj2IJUWzGzRPFOtbsxcQtZWluG2SWBAm6XxLIfZoilPc41jHy33JojZywYSxHVdAwSXFLPuZlvZ1DQGrduTpZLi13deqYZVxRVsUlPk+7BaVAmn4XcdKXkM5H6OSDyrrpUBpiuRq01EtM5C4N1UPjH9USNiZYYsHeYMyNeEoyM8pEk9bph5Q2pPecAn0zcdzbBzR1DFca/hn8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oz7vYhgPHG1PjjrNekncJuLS5n3OwxZ69IuhoWlNXCM=;
 b=SWPYwSxLPF6mKUHR4Ha8QG9tdcrzdzMntt2EuvY3aUczqfMUx1A+XAh8qob76PrNR1pCCWjQ4RonSp1BRzx/4w/NvfJbVSrWKWTCJM3TJrKkXp+TByes7yxU7Th9NoImSzUJLcVeRlGoAb5YzXun4uteLpCP/0uIqnDlLRsQgH/aOn/IgqZYRt1B/dAgur2gnSOxumSkdsVmL6GvDkcMhe+XPB+U8ERr9INm37iaGgVmXMtovrJqeH7wSCAzWYskmkD/c+HwPeUArozh4WgePMAOgCuCQgFR6VDFMA63Py4AyiuyPDW/pn+LysytzeGCvpCjWHKPgUp9ptSf641Bww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oz7vYhgPHG1PjjrNekncJuLS5n3OwxZ69IuhoWlNXCM=;
 b=aJyeVHlWmTflKGF/NGBi9RpdwD2yowC3uBiwDZsevgCUQjLGXxuXKyFzx5xJUMI7KEVoNNpb2q585ijkMLiTpnmIY13DdELvYKOSEcgcrNjkKjdhvP5oHoadAB0pxkh+sSIfIcVBtgXSCoygHtiE+edK4ea0TdXLKg9HDokVUvcHJ5x3s/KHJAdEVcOVAZYMR8beHP2anudJ3bQ9d3vGnu4gNaq0WEI52hzs5WkeTWPXbPgerjiFQqrqqS0KZ7q3DMLvkXblzALB1YwcmJ/UPnIE+7eSQ4DQoM1Ke1uaVmZJ+tV+Mfkmr7gOIzVuGnI9gBLX8DnGkw7I1boDZoFJGw==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by GV1PR04MB10524.eurprd04.prod.outlook.com (2603:10a6:150:1d0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Fri, 12 Dec
 2025 09:07:12 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%3]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 09:07:12 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Frank Li <frank.li@nxp.com>
CC: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH v20 3/7] firmware: imx: add driver for NXP
 EdgeLock Enclave
Thread-Topic: [EXT] Re: [PATCH v20 3/7] firmware: imx: add driver for NXP
 EdgeLock Enclave
Thread-Index: AQHcZHY7guUrzF6CzkWjbB+TVSP+h7UQL2GAgA2U0QA=
Date: Fri, 12 Dec 2025 09:07:12 +0000
Message-ID: <AM9PR04MB86046ACCE6AF2BE7099FD3AE95AEA@AM9PR04MB8604.eurprd04.prod.outlook.com>
References: <20251203-imx-se-if-v20-0-a04a25c4255f@nxp.com>
 <20251203-imx-se-if-v20-3-a04a25c4255f@nxp.com>
 <1ee383c7-ccbc-4c90-adf3-bfbe87fb6765@kernel.org>
 <aTBsdW0lpZSCVsgp@lizhi-Precision-Tower-5810>
 <48d5895d-fde0-4795-8049-788fa3171fde@kernel.org>
In-Reply-To: <48d5895d-fde0-4795-8049-788fa3171fde@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8604:EE_|GV1PR04MB10524:EE_
x-ms-office365-filtering-correlation-id: aa7e9ed1-b86d-402f-36ca-08de395dd68e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|19092799006|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?QokYOMKqDD1ATBI2tU9OnnHy0H799JBb67LHxRXi8l+7w3RED9Lu33j4zr8y?=
 =?us-ascii?Q?49iksAx5bSeSyM5xlnzKTG18LYV0tika3tyKL70IoFfewexKzFgnmVZhVPRa?=
 =?us-ascii?Q?LNUtrJqGU+SFUtwxJf5vXu1qKdBRqbDAnlp+0ME9WbUYawscSb0M/CQBLmNE?=
 =?us-ascii?Q?NY7n0PkVNDqnYyze0D6WOZEutPjekes7YBF7oE9RqupHR7ye8ljVNVqKrHna?=
 =?us-ascii?Q?PFxT3mlfIznfx3ZN/hKph+KzqXYWoT/kANZAOgKo21TcYC0wqgsaSXgx/BeR?=
 =?us-ascii?Q?vy8WSoYtJgdnUMO1me4lsSNinsg3JaKOdC08WPdFLkeY/k4zrArai5vc3jBk?=
 =?us-ascii?Q?IQWU/P/U4wIltxfa+gRRpHLqPusUGbVmmHSBKyy6tXteo/n4MfNyuCfIuDWQ?=
 =?us-ascii?Q?6ZeIXMAqBL+qrFASWAHfyMe/RdMf5dB+7Zm8zgpqHUxnlr3Ox1aA43BVoDDc?=
 =?us-ascii?Q?yLdLcxwiptY9y1AQUQ5QQfyJH8DgDNBFtqW7sZYG9siVVEqKf/KVejRNrW+S?=
 =?us-ascii?Q?xlhN8+RRHJDmgbodhIeO0BQdsNnO2haAiKIvwjC/F4Ms+bE1pu9ngRme/DI+?=
 =?us-ascii?Q?HMSG3XonNQtLZfUYnpEUpMKvjcqvpjZxaUzSkU73uGtkCB4hQ6aENok0m2zn?=
 =?us-ascii?Q?1ea9XK4+h4SoKn8vnCZjN+MHUumuwmPqj1tZxICHuOXfby00EPlSGvRMy8mI?=
 =?us-ascii?Q?9oL50rSSmAaaBu+1gxR9SgUSrfOjGMTnAPGJU0+DSuUrk69crG3zMV8FZG30?=
 =?us-ascii?Q?DpaArcS1axALqoeFkz70nedZbWeuLlNIuflzLklHlrrZyZUdkLcpcs4Qe4LY?=
 =?us-ascii?Q?dk9jutMW/95lPYID9hTpz5fYUcHO6xTouc1/qLn1kgGhnwNVW5fYpcsDATTY?=
 =?us-ascii?Q?4dFNFES/wE6/IY5kmrP2B2r8jGlGGUZuC7QEihQqTKtcNBfNsBgA1eVc8TBu?=
 =?us-ascii?Q?dEn920xxHwL13irZSP3wq6eRxbfUBIn9vkN6ii2XAXvTV/GGHWcS2DMpR0gS?=
 =?us-ascii?Q?UAAV7HnsYVPSYSn9ybcDQu7aypAQnUM5mQxwuXpQS9/hRaumnHXvFymcErDj?=
 =?us-ascii?Q?0xng+TzlxMstS9OqODPdieivuPb+IcYPtl1X0ZpneqSoTUZtJuarfoctVDVw?=
 =?us-ascii?Q?p8/XMtx4S3jsGg61I4UJXqunCeBvrWl9MDQqGpN9JNTcr0a23MOAte6DkmNZ?=
 =?us-ascii?Q?C938ll6qTwzgLOjXS6v4R595L7wKy9gOG7MS6k/8RFj0YBbcGWdaKm1NcKKA?=
 =?us-ascii?Q?n1zkxQg/j1KikKAxuXMU/wtlAtoL1Rk2ILeX6QhgcWUUV+BQWbS2uz69zCZ3?=
 =?us-ascii?Q?+yKpezDAJ0ZTaCpjSVWSdwVcBUEW6ISs7SORPyZovILIK0BjEZwuFUL1ArCC?=
 =?us-ascii?Q?u6WYBCkxPqrx2Dm8zkvF92cTScX7MnOTXYW4hnDL3hYqVsLuLkUhPsXErTmb?=
 =?us-ascii?Q?zCFWnTdLqN0ZgDwKCFu7v+YPJLGclHO8kVxZ6ZG2dL+p2p+bdpvCBMPHEc91?=
 =?us-ascii?Q?O7U6e9W/g9Xznt+nsbIYWMY57F9jjwy0nIsL?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vdYn11hJ0hE6azjpDlW8LjFaJ09oxa9jiBK1tUPsDYd/TQjaRaIbFzudrzdn?=
 =?us-ascii?Q?cfP/r/QW8HD7HnZFdasd4LMrrWBc8bL1lWPak6Sq1fHUa9tlcTUWdNhNa/6E?=
 =?us-ascii?Q?ymlz9G6LrSnbEy2FNF9908c4H7Tzcvg8s3Gn9XeEuiTH9JnUQG5HYH3Hoo5N?=
 =?us-ascii?Q?NaPC35GxVXb/KsWkw8Edcbx+6UV/2KjaaMh94AKv0uhDXSVbS2fWwzM5rZxN?=
 =?us-ascii?Q?LS9qONgeGS9tCp5MI4pgJfVMwlcakCSngIvEz9NkOHNKofw+PhqUjmTaem7i?=
 =?us-ascii?Q?+VoDv9wWudtpba3xEvTUbTkVCUXQBEGQ76o/jjK2JLunW8VQTZ7abtetQnAU?=
 =?us-ascii?Q?RxhG31jDO3Ze4am5BihYoTZQFMxQB3QuCYlgnqtGtviHuYm+xRgLhAXq3B1y?=
 =?us-ascii?Q?6cUUK3qHaYnqy6ke/qPMmvHjcwTtMpA3XwLLtP0qPEw5X0U1bL8l9eceFbq5?=
 =?us-ascii?Q?LTJl1F+3sp5ha+7WggU9YOM41PbYqnpCy3vTNnLWBuQqEN8ELdQVLki4lwc1?=
 =?us-ascii?Q?whssCEj/rOvTOgsYnp35rXgG+Ur3Zgr4S5r5AESjODW/05Zg2ZWquDIEmQzO?=
 =?us-ascii?Q?GSdauC4Yod7Wntd8iSY497fUsaipwo00I0w/nIYU5//GFSynpvja7DahPYo3?=
 =?us-ascii?Q?xrZti0KNFcqOms/wJxa/ZTmEXSDSmlcC1zkktkWhnoWpkquEvcm2V0DstYC2?=
 =?us-ascii?Q?tlnakL/+oygEwhNsm+NfHfijuzAN1WrOuNmC7JBSN/cYamjzr/RlPqQ+pRv+?=
 =?us-ascii?Q?XdOH4rJC9DXv0GGSGQDmturdVyFXwQ8Vo24h7+ZlJvxEv7+aBMpkUntcgjTk?=
 =?us-ascii?Q?dGCF0599khll2STgPGzt6D8HXNDnuPcEsDeWzzsFguQoizCNx915XmWmeYOD?=
 =?us-ascii?Q?m3ilRetbzca+NAFZfIfLs7JUHMip25yGK/wfZcLHjsSvp8/SdYcPn1GBu9P5?=
 =?us-ascii?Q?zM4B6ljfDGOJRnjW6KVeBcYqwUMC0QxeJpdD07w0/6c42o5lvKiHic8119eU?=
 =?us-ascii?Q?QmHH3pwimlvnkwsm49tfs5B0vmKD3yvp0n/seUbBgbrrdgVbQjfPX6fL+bPj?=
 =?us-ascii?Q?a9mQ5NC2tMuVTAylYJStMpoPqc6OaZDcJWlGedK1Y3xjiOV14EPrbrax1izo?=
 =?us-ascii?Q?5BFNP1piVSDeOKeKYMHq3SLTLaAAYfVVDFZ9Kd9LB1bK7GvWYxcPQFpbdVVF?=
 =?us-ascii?Q?WFe38z3ADYo1RQKCBQTwXS8yHwbJTzhoatxJI1iba20eJshug2ZK/VhhXKYf?=
 =?us-ascii?Q?sL4vG/T9YGXbAR5iZkhQHG63fxL0pRSLaZ8t7ZsCaOHSpFoIbSrTp75KjtC0?=
 =?us-ascii?Q?EV2IMA5+Nmsej4J8P7mMiMQf2RibncpF4KRTYRojrPWik9iCys70KPw2duav?=
 =?us-ascii?Q?OhSPwjgxcJ7SUg3jj0/IbpBaCYBdwWmsk6bBjVNG+8pHjziFNm4oLY9es15X?=
 =?us-ascii?Q?UzcGOnH9aMcdw/qkJKbJwQfvCHBZpiRLGnJIP39nANsO4MzOxO6JOpChvlvs?=
 =?us-ascii?Q?/MyeERqit0wjLd88gC3ROFeYhr4Vr8CTG3pqNiNkvg3CsosqfrulAghRav3L?=
 =?us-ascii?Q?VXcdkEMwLlogMaTG1p4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa7e9ed1-b86d-402f-36ca-08de395dd68e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2025 09:07:12.7131
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tQsz81q2fngqGis1vw8VOkLh4Dupm9NR5L+T08U5e/NwfdcQQU55IhD+lNj2BKlRV9HOoyG7wY+TCsvsEwBL5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10524
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_010717_232794_5E1BADB5 
X-CRM114-Status: GOOD (  24.86  )
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

> >>> NXP hardware IP(s) for secure-enclaves like Edgelock Enclave(ELE),
> >>> are embedded in the SoC to support the features like HSM, SHE & V2X,
> >>> using message based communication interface.
> >>>
> >>> The secure enclave FW communicates with Linux over single or
> >>> multiple dedicated messaging unit(MU) based interface(s).
> >>> Exists on i.MX SoC(s) like i.MX8ULP, i.MX93, i.MX95 etc.
> >>>
> >>> For i.MX9x SoC(s) there is at least one dedicated ELE MU(s) for each
> >>> world - Linux(one or more) and OPTEE-OS (one or more).
> >>>
> >>> Other dependent kernel drivers will be:
> >>> - NVMEM: that supports non-volatile devices like EFUSES,
> >>>          managed by NXP's secure-enclave.
> >>>
> >>> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
> >>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> >>> ---
> >>>  drivers/firmware/imx/Kconfig        |  13 ++
> >>>  drivers/firmware/imx/Makefile       |   2 +
> >>>  drivers/firmware/imx/ele_base_msg.c | 269
> ++++++++++++++++++++++++
> >>> drivers/firmware/imx/ele_base_msg.h |  95 +++++++++
> >>>  drivers/firmware/imx/ele_common.c   | 333
> ++++++++++++++++++++++++++++++
> >>>  drivers/firmware/imx/ele_common.h   |  45 ++++
> >>>  drivers/firmware/imx/se_ctrl.c      | 401
> ++++++++++++++++++++++++++++++++++++
> >>>  drivers/firmware/imx/se_ctrl.h      |  86 ++++++++
> >>>  include/linux/firmware/imx/se_api.h |  14 ++
> >>>  9 files changed, 1258 insertions(+)
> >>>
> >>> diff --git a/drivers/firmware/imx/Kconfig
> >>> b/drivers/firmware/imx/Kconfig index 127ad752acf8..5fe96299b704
> >>> 100644
> >>> --- a/drivers/firmware/imx/Kconfig
> >>> +++ b/drivers/firmware/imx/Kconfig
> >>> @@ -55,3 +55,16 @@ config IMX_SCMI_MISC_DRV
> >>>       core that could provide misc functions such as board control.
> >>>
> >>>       This driver can also be built as a module.
> >>> +
> >>> +config IMX_SEC_ENCLAVE
> >>> +   tristate "i.MX Embedded Secure Enclave - EdgeLock Enclave Firmwar=
e
> driver."
> >>> +   depends on IMX_MBOX && ARCH_MXC && ARM64
> >>> +   select FW_LOADER
> >>> +   default m if ARCH_MXC
> >>> +
> >>> +   help
> >>> +     Exposes APIs supported by the iMX Secure Enclave HW IP called:
> >>> +     - EdgeLock Enclave Firmware (for i.MX8ULP, i.MX93),
> >>> +       like base, HSM, V2X & SHE using the SAB protocol via the shar=
ed
> Messaging
> >>> +       Unit. This driver exposes these interfaces via a set of file =
descriptors
> >>> +       allowing to configure shared memory, send and receive message=
s.
> >>> diff --git a/drivers/firmware/imx/Makefile
> >>> b/drivers/firmware/imx/Makefile index 3bbaffa6e347..4412b15846b1
> >>> 100644
> >>> --- a/drivers/firmware/imx/Makefile
> >>> +++ b/drivers/firmware/imx/Makefile
> >>> @@ -4,3 +4,5 @@ obj-$(CONFIG_IMX_SCU)               +=3D imx-scu.o mi=
sc.o
> imx-scu-irq.o rm.o imx-scu-soc.o
> >>>  obj-${CONFIG_IMX_SCMI_CPU_DRV}     +=3D sm-cpu.o
> >>>  obj-${CONFIG_IMX_SCMI_MISC_DRV}    +=3D sm-misc.o
> >>>  obj-${CONFIG_IMX_SCMI_LMM_DRV}     +=3D sm-lmm.o
> >>> +sec_enclave-objs           =3D se_ctrl.o ele_common.o ele_base_msg.o
> >>> +obj-${CONFIG_IMX_SEC_ENCLAVE}      +=3D sec_enclave.o
> >>> diff --git a/drivers/firmware/imx/ele_base_msg.c
> >>> b/drivers/firmware/imx/ele_base_msg.c
> >>> new file mode 100644
> >>> index 000000000000..a070acbd895c
> >>> --- /dev/null
> >>> +++ b/drivers/firmware/imx/ele_base_msg.c
> >>> @@ -0,0 +1,269 @@
> >>> +// SPDX-License-Identifier: GPL-2.0+
> >>> +/*
> >>> + * Copyright 2025 NXP
> >>> + */
> >>> +
> >>> +#include <linux/types.h>
> >>> +
> >>> +#include <linux/completion.h>
> >>> +#include <linux/dma-mapping.h>
> >>> +#include <linux/genalloc.h>
> >>> +
> >>> +#include "ele_base_msg.h"
> >>> +#include "ele_common.h"
> >>> +
> >>> +#define FW_DBG_DUMP_FIXED_STR              "ELE"
> >>> +
> >>> +int ele_get_info(struct se_if_priv *priv, struct ele_dev_info
> >>> +*s_info) {
> >>> +   struct se_api_msg *tx_msg __free(kfree) =3D NULL;
> >>> +   struct se_api_msg *rx_msg __free(kfree) =3D NULL;
> >>
> >> No, don't use this syntax. This is explicitly discouraged.
> >>
> >> NAK

Accepted.
Will fix this in V21 patch-set.

> >
> > Add link for reference.
> >
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor=
e
> > .kernel.org%2Fall%2FCAHk-
> %3DwhPZoi03ZwphxiW6cuWPtC3nyKYS8_BThgztCdgPWP
> >
> 1WA%40mail.gmail.com%2F&data=3D05%7C02%7Cpankaj.gupta%40nxp.com
> %7C10fcf6
> >
> 46c5424c32be3508de32934df5%7C686ea1d3bc2b4c6fa92cd99c5c301635
> %7C0%7C0%
> >
> 7C639003805451655771%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hc
> GkiOnRydWUsI
> >
> lYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3
> D%7C
> >
> 0%7C%7C%7C&sdata=3Dqxkxvyfwzl970fCJNa6iMr1i1zWYIdCIg4AIQMowvX4%
> 3D&reserv
> > ed=3D0
>=20
> This is since beginning documented in kernel, so contributor could read
> cleanup docs before using them. Above Linus remark is nothing new, he
> already wrote it ~2 years ago.
>=20
> Best regards,
> Krzysztof

Best Regards
Pankaj

