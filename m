Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B73E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 08:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LrpQoisZ4hkRX5AUtNWavW/NkiE2Jxm5Rt4bdJj0eA=; b=wo/wClbWZzdCfpDdsn7Sp9LTda
	9zai03v5R8urexDUQZw4YY+BbMvqWEZnXYSGRLaAE1tkLZunBs/IGrsgJLa1RLLmsxTwydp9mR72+
	f1njNf1U42dnKtqfok24W2daLk9/g0uEx3HbmSMHIhfHDDLQT+TkPQ1T28Vh9XdK5uDqIX9ZBJIYN
	C0BX0DNlfKegCTa3QLy9N8szB0f55QwXJqZMQBLFL4b9e7Uj1mX28OhPCCq7zNbU4D0JoJ8KLbf0e
	RjoJ9qvI/l4VzzH/nJ7tQaCXX4DPEm0eAgzsE+km4ujeEmQTvYf3Rp+QToprUY2E9WpwvWDlDBO8y
	61PbMWgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXcQ2-00000007qID-1oYq;
	Tue, 14 Jan 2025 08:37:02 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXcOo-00000007q9w-035j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 08:35:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DuMMxsz4JSBp+HNQ7fYXjI1MskujrVVlINKsAZ+yRcFFoHfWry+wdVdRb+Hxo4jsvCpqPk39wpNDJyQFk/bAxlyTLHwkhT04k3IuGS1jPc03brCf2Ih0AbfMlypCD2em+xbaBwp6AKguO2XTHr8xyLXWpavZgpjt0e+qobiYdux14jkvV+6U6Qtv9+E3v1qyl4g6B+XM7ojuh/9scM22P8awo+i0iWUY0Lp5Fmwr2JrLoRojkQ2mj1rt2as+i03XRObEAeAIVr8+IHtc3SfMywXNCrog1x5WWuGHMiIE8t6oDR0DJDEBGWFLV70J4DlSL0uypl1ri1PW/MkweYLkmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LrpQoisZ4hkRX5AUtNWavW/NkiE2Jxm5Rt4bdJj0eA=;
 b=mjW3rU2FdYwlJ0BTOkSWbn+Be5zSYn8q9M3Bl78+xuPxEDAACRgoP4ycYexVrc+KyH1MA+jOO8iqW22OeAt1nJJj/UD4/S7CcaArJGmbJiq1HYFYUctGH4aIVgHIaDR6N/C/CAf6P1EXIvBTDLfY6m3BlzUx5sv04oRFMdaBGv3qddhMHW6+WteKT+aIfnF6P/tWGL7mesbXdHdQE1fVQ9w8p50dhjLO9EMzP311o0SnC7TydFjMiGdQ7Df0g34U6vif0oCxLoPGroDbvP9NsgPcgxFhnehOAtUFyBpwNATCakM+EUVTcI7iEhOZRrLLHLS7EHX/Bpsf0O0XKLM1jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4LrpQoisZ4hkRX5AUtNWavW/NkiE2Jxm5Rt4bdJj0eA=;
 b=FiUozVwJ5ReBROYk8jsz5qake/X+4Nhx/aGZJGSM2iZdVZOTMaFCm33MLG0DgLZnkH9VPWuts7j4MTaYorIn0y9udsBR/X70L3TQenBxvPnUUt3SD23fvUlF2NZShkHRRUhQPemG2HLkEDOmRh6umMN3QtyB3LZkRzSYoqxEs0zU/tgkeNYn+Nw+EOdsaXC7e439gZpxybuB10PbZPj+5/+CMiI3JwXsJA4TMbm/BKYmEIuRE38Dabxt3l5M0swNbzRyAiaBFUdt6/Z2md+mmbxSU/A7AIEYgMg6d7Py31sbRflFAI6Vt+KgNfElXpnGGeJsfakK/wkveXQXs2K2UQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB10695.eurprd04.prod.outlook.com (2603:10a6:10:580::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 08:35:41 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 08:35:41 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 2/2] nvmem: imx-ocotp-ele: Support accessing controller
 for i.MX9
Thread-Topic: [PATCH v5 2/2] nvmem: imx-ocotp-ele: Support accessing
 controller for i.MX9
Thread-Index: AQHbYZsaAtqq5Jn1xUGKkk8ZemwvxLMMqVIAgAEiMQCAAHVZAIADR+kAgAMeDgCAAVOusA==
Date: Tue, 14 Jan 2025 08:35:41 +0000
Message-ID: <PAXPR04MB84598515572A669E5856379F88182@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250108-imx-ocotp-v5-0-a6d90e18ebe9@nxp.com>
 <868241455.0ifERbkFSE@steina-w>
 <DB9PR04MB84615C152538FD411F462B19881D2@DB9PR04MB8461.eurprd04.prod.outlook.com>
 <4956524.GXAFRqVoOG@steina-w>
In-Reply-To: <4956524.GXAFRqVoOG@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DU4PR04MB10695:EE_
x-ms-office365-filtering-correlation-id: 793fdefc-5816-4277-c88e-08dd34766deb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?VGz0xYRJyPU0FxDe5y7qiF++cn7yWBUxbQDTZBFStPre54y+vXSOR+a2KE?=
 =?iso-8859-1?Q?zsAE3zCoDbEE5o0Z9aobIUlvrv6c5BN4xyVH31iMyPkf8BYiZUNaOn5Ov5?=
 =?iso-8859-1?Q?iJAIsweteVTHAuroWbvbbrYyLTGSTie0f54zlibY0kNiOTCgHHzpIC1xGu?=
 =?iso-8859-1?Q?2AxXMhf/Afb4as1BpFUmphcd2VsP0GQxKnxq8bXZ7yuszoWkdjccQU8BNe?=
 =?iso-8859-1?Q?iacZOl2J/d6UdMDcfdc8Fuj/ZtoGTE1Tv3YshqG/92nwOT5lzmyPj5OuGD?=
 =?iso-8859-1?Q?G+h0C9+lry4O/W7U0B5vBcjeah9vfELjLZxKLJRxDPSA5262cxunHG9q+v?=
 =?iso-8859-1?Q?NYGY00yWqyazsEpvNjjkwASS7o2gxLbnUjYedjq1wsaZMZLW6XdH6IO0S+?=
 =?iso-8859-1?Q?F2+sd8KL58l6mbBfm0dxH1Pfb1L9e6iitJn2im2Ft3ILewCX2/6svEs8bK?=
 =?iso-8859-1?Q?J41Swux7u+MiY4VceytZlkqKRwkAbY5Q2gvBNxD1boalrjC1Y63MuzGngf?=
 =?iso-8859-1?Q?gaYkwHO5PMCmlJmHN2VJgZRvMGoa1yNPOc9+K2CqSixRtVw4QtwvYUTiP7?=
 =?iso-8859-1?Q?wEAEV0JUu9GMlyZFtgJGKl+X7XKwuA9/k4cOjrJXbjrGc/lt4nr0zesY2Z?=
 =?iso-8859-1?Q?JZADvFPQYghvE3ZOceVe1FgruD9MLpMfs7vN5Bc1SU4XzJYyDeeCTV7epW?=
 =?iso-8859-1?Q?WpVMIrieN8clRSlSc0P016ieXN9hUxeeiAMpWNiL+d0463xS6dbYO8O+iY?=
 =?iso-8859-1?Q?ZfMWe1iK0lrl8PlIk4ZFt4HSh8fjqwihn/Ph9czEPd2/YR31UK/ZAjNGFd?=
 =?iso-8859-1?Q?wM3vXxMXC866ZdSTpl5W3J8DBUPrSFkYF56FgLu0p9cD/QVAiuL1caVYhs?=
 =?iso-8859-1?Q?LO6IF3DGpq72ZrkXiUDCH1IcqMFdkpd1318TxyVIUkOw1w2vrdS5bXqGus?=
 =?iso-8859-1?Q?IuVjlovPek9rOlgTA4fAO4OC7CbZDOUrnpqZKs9qqiHe/pcLF8C0rcAJCZ?=
 =?iso-8859-1?Q?pkAbOzourFdK/rEVLo7xyV65anzM7BbYYN5JuDbRLv1Gu8i6f604PmTsX1?=
 =?iso-8859-1?Q?OFpMWkrS05yMFkZJ4xQuGvWf5BhN3M9ZHvpdSrUBEQFySX/6lCP6fWA9MG?=
 =?iso-8859-1?Q?RtxZB1QbZUzwpTNY5DxS6YsG0h24s4PWrPV/FfKyqVEK0291C6p3eCsUVk?=
 =?iso-8859-1?Q?LB5ynBAD+rfCnf0UOd38uYpwVQaBQNFAa6uxMUyIfQPlAwrLgGDzXZJxdL?=
 =?iso-8859-1?Q?iaquNFuLiNL3G86Cee0DOnWKmX9K25Cs3/JpBZNqjN1JHLEcGokuy6rlUS?=
 =?iso-8859-1?Q?jNxWCwuMn8zdlxAkcu1I4XOdq+3ToV06KgXuGi2QNDNlNtiRxZRmV3J62I?=
 =?iso-8859-1?Q?BwxDvDnjbNmh+65Ol8A+XND5POtDx9rCidxBP4uo3cUXqz5i+LNPqE2D1Z?=
 =?iso-8859-1?Q?0iYrf+RPsbyy8tBi?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?a5/qkcFV3+Kp7n6UC8uuWZJ5XYR72jYGpVjaenesD2HLD61lx2sDJlOtPV?=
 =?iso-8859-1?Q?4avaujKkXvpOohgM22cIqMOADseUuk8MT06zq4vw4LRbnVwabTb4RHUtm7?=
 =?iso-8859-1?Q?4+Il1E3D1X4h7M5+zKrYtccrGr6bqJNkvopNac5WEIIM46CGgeiQaz5CNW?=
 =?iso-8859-1?Q?nHNo9wW7ehKSDIpYHljnQAUlB/hEMKuwydfWdQbESnQUmeo+8g6GpSz7YI?=
 =?iso-8859-1?Q?xNhL/7g4COg9GHeWCdLyItrGuMkgyzQwJk5mdoOIFojvB4PU23Ub0bTKkn?=
 =?iso-8859-1?Q?+iGTW/J3+2AuWFW6sH3IphaxCOCgNKqyJmJUl+GG30uPWuFfprKMG+pqat?=
 =?iso-8859-1?Q?Q1orTUm1Hmgx94cWq1sHz323M3r1AzGh7uLTLx9De1EY7vRRWdO2f544Ni?=
 =?iso-8859-1?Q?g5FMMPGLIY6kpc3noOuU8NOwEv7/lDDP0WRMXCrt/aaIAnguKZ6OpkPQV2?=
 =?iso-8859-1?Q?NIU5LsfheR0tgRWgeN2FWcvav9+Xe8RyF4/YjUzV2d/nnO65g7/l1R12dZ?=
 =?iso-8859-1?Q?V5EltAvsUqqx17Rwxv8M1DeUaAR2Z8n421pTeZHwwzYwTzlLRfHKbRWWH0?=
 =?iso-8859-1?Q?RNh5sV1HYYYBl0pzzeAHPOyCassB1BwDzUXkTJKHP5Y6X2LISEZJ0keAvf?=
 =?iso-8859-1?Q?msjbNXrZZL2c+qms8eLmBnaqDrZvg4F0mgPBwZDSb89LJ3nRaNkAM8Xusl?=
 =?iso-8859-1?Q?5tv3EyU3BokuBcXg4dhxZvNhWjjmY7ndSHtyMhQOBM0OXtb8lwrCE1Kcca?=
 =?iso-8859-1?Q?MIDqLAl0p7X9TZrDDubVCocArV2RcSHko7bzCNF0D54LK0xi/GWUq8M/6w?=
 =?iso-8859-1?Q?0UQNNjJmoZdlct+pNfeEslkXJ7GNoXVzvDXuJ1Az5t+GyDRlX0Vgtp0ByS?=
 =?iso-8859-1?Q?j2AG08MCWdrb0tpQReNoXO452S7u1/LewsDpK7BLRXTHL2ZLWv5COdZxyg?=
 =?iso-8859-1?Q?QnzdjqlCFl/WCoC42FRhTn9nWFKr+dBJVxfwz/1JjpFbiccEXmK0qA/x4r?=
 =?iso-8859-1?Q?/TJG/BcwaDYEMcWiElRqunDTkr8R32NveLfvnnBcDimt85vylRgR7QgObm?=
 =?iso-8859-1?Q?AtfuaoAn8/nIyXTxFOv53vrVRPCoDjfBem7UC26jV5Z4NGyg8vO8VCqTd+?=
 =?iso-8859-1?Q?rOWu811qyL+MJkH87jE8btz5gF3ZzYOyhMhzTcjcS3vkeXPEJN/BoQpLoG?=
 =?iso-8859-1?Q?UCPXzApCtOMkH73opj2VD2qxvmAbHM9IxhN3R1QKAAiyPM82o8zS+X5Myu?=
 =?iso-8859-1?Q?Y7i0JLyqH1PQhTgQ+PiO/64s5uBarM6sl7H6IAlSJrsvl5csXmqf6EKeeX?=
 =?iso-8859-1?Q?ze+FXn3sqxTygAR6kaevODpcDgBioUdlfLwfpupi5/WvFrccDZ1KkOw/JB?=
 =?iso-8859-1?Q?8MDaWaKWZOojOpvggy68+G22k42tWyAfZ4uyOki06tXp6ENYOQtJ/vnSzI?=
 =?iso-8859-1?Q?BILX1F+Ky2mXzHxQ5B3Xrnx2eo/a76B8yE9AhapFzHCHliVWV1kuE9envP?=
 =?iso-8859-1?Q?ojwwFMjnfobP9oqT5RxE/39vv09PNhHmBYi8sw/RlQGCjM2NQnYs20P22L?=
 =?iso-8859-1?Q?Ko242/n8rXdKdnVCbtTRmmUv15SzcHUXGrpWGn+B9vxjNBHWBFIdzI14oq?=
 =?iso-8859-1?Q?lSnT3WNL4syVE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 793fdefc-5816-4277-c88e-08dd34766deb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 08:35:41.1039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fiTClo4kbJyJekrIbGcs+8U4zP/2Eqy+RMkkn/07YuThpofkj7JL/iMI/TdrU2+Q/9ySLYqfgux0GQbNWNuenQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10695
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_003546_056522_7F5C1D9B 
X-CRM114-Status: GOOD (  31.78  )
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

> Subject: Re: [PATCH v5 2/2] nvmem: imx-ocotp-ele: Support accessing
> controller for i.MX9
>=20
> Hi,
>=20
> Am Samstag, 11. Januar 2025, 13:41:58 CET schrieb Peng Fan:
> > > Subject: Re: [PATCH v5 2/2] nvmem: imx-ocotp-ele: Support
> accessing
> > > controller for i.MX9
> > >
> > > Hi,
> > >
> > > Am Donnerstag, 9. Januar 2025, 04:34:18 CET schrieb Peng Fan:
> > > > On Wed, Jan 08, 2025 at 11:15:40AM +0100, Alexander Stein
> wrote:
> > > > >Hi Peng,
> > > > >
> > > > >Am Mittwoch, 8. Januar 2025, 08:00:18 CET schrieb Peng Fan
> (OSS):
> > > > >> From: Peng Fan <peng.fan@nxp.com>
> > > > >>
> > > > >> i.MX9 OCOTP supports a specific peripheral or function being
> > > fused
> > > > >> which means disabled, so
> > > > >>  - Introduce ocotp_access_gates to be container of efuse gate
> > > > >> info
> > > > >>  - Iterate all nodes to check accessing permission. If not
> > > > >>    allowed to be accessed, detach the node
> > > > >>
> > > > >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > >> ---
> > > > >>  drivers/nvmem/imx-ocotp-ele.c | 172
> > > > >> +++++++++++++++++++++++++++++++++++++++++-
> > > > >>  1 file changed, 171 insertions(+), 1 deletion(-)
> > > > >>
> > > > [....]
> > > > >> +
> > > > >> +	return imx_ele_ocotp_access_control(priv);
> > > > >
> > > > >In [1] you mentioned devlink should solve the probe order. How
> > > does
> > > > >this play when the driver is compiled in (e.g. ethernet for NFS
> > > > >boot) but this OCOTP driver is just a module?
> > > >
> > > > OCOTP needs to built in for using devlink. Or the users needs to
> > > > be built as module.
> > >
> > > I don't like this kind of assumption. Would it make more sense to
> > > make CONFIG_NVMEM_IMX_OCOTP_ELE as bool instead of tristate?
> >
> > No. Users could setup their own system with this driver build in or
> > built related drivers as modules.
>=20
> Sure, but if the kernel locks/fails/panics while accessing peripherals ju=
st
> because of the kernel config seems at east very unfortunate to me.
> How is someone supposed to analyze/debug this?
>=20
> > At least for Android GKI, this driver needs to be as module.
>=20
> Any particular reason this needs to be a module?

Android has a minimal kernel which is controlled by Google.
Vendors could only built modules based on Google's Image.

Updating this to y in upstream, means we need to change
it back to m in NXP downstream android kernel.

If you need it built in, you could modify your downstream
config, right?

Thanks,
Peng.

> Which means any affected driver needs to be a module as well just
> because if a DT reference, no? With no means to know which drivers
> are affected, despite checking for the DT references manually?
>=20
> Best regards,
> Alexander
> --
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld,
> Germany Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2F
> www.tq-
> group.com%2F&data=3D05%7C02%7Cpeng.fan%40nxp.com%7C4f423e5
> af548475e6b0208dd33cc2d1e%7C686ea1d3bc2b4c6fa92cd99c5c301
> 635%7C0%7C0%7C638723674209718864%7CUnknown%7CTWFpbGZ
> sb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW
> 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3De
> qPs5lOuVSiIZYQwwNecUzgIL%2FtWiJP5bjd7b60Ul7A%3D&reserved=3D0
>=20


