Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06573D3C91A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 14:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48MwxEH5ckqOtizUHfaCilwb1RlQqGac1rOOMbozkjw=; b=fHPhQ1WhOz/bLj+UtYUGqFCSN/
	cZ9MvzfNqobb6CMSvJzGQe8Ye7+fqhGnYkrzg4AQ/C0bJm2afm6nKuWUeiceLbfcv5d9SjUuSD4Qg
	qRA1Po4n8c5kiGFxOCFlpX4pnYTysow8UFRmokGXbQu7sEdtpfbRdNgWFVz4E3IyOT0MT7YzNtYb6
	zUTw6DKDr7nZ+Vf1Q9BvoqXGvcq3kej/uiXyauzZAYuEXOgWZw4XbpQYX8ovxtX8r+QZPD9Ac8pme
	M0tT8OAYagGdhnHunn8EDaKDircfCDypoeN5X7pYlrul+JzKM4KMDHhzG+vMjsOxBTQmaUesS4xbo
	C5ZBMfIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTLb8-0000000FXCW-3Ewt;
	Wed, 10 Dec 2025 14:55:22 +0000
Received: from mail-westeuropeazon11010005.outbound.protection.outlook.com ([52.101.69.5] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTLb3-0000000FXC6-1y7O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 14:55:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4+bHjHx60IxjASkoZej3n868j7QWe0gGpxYPcYbuHuUUQwmjGyi2ESYnTUlKHv+WL9z69Gw7fYw15lSM3iRXwP/WQ5QdI4qozbvwBWybHr9kl2JzugJz4kPuNd2bNqO67pWxMa4YXqMLshhW0q9aMs4Fla+HicDXTUFVnGK23FeGONWpaPq4gG3Z8QFWSidIFixW7oJtJjcz02PSq+4KfDRW+g0+bGtzrQwdSTiPW0TxOxX11Jo7vyX7IB58XJ1625sgghKDwQ5mU3ySwhC5e2tgL6ssiT/cvHgmOFc3WanFZKFCwp2RFVqcyxY7DuJIlpOApVrrHyeJEZJYAt+yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48MwxEH5ckqOtizUHfaCilwb1RlQqGac1rOOMbozkjw=;
 b=CZrRNuM7bWQBjndbZDEJo+W12jrK6Uk6q5BWpH/M5Zg/ORgunRHzJ+L6Xaa0vlEAManQrZg/dj5q/cmMRMfxGrjMnNDfQIdtVTCw3GqqiJeZZqg6ALEUcdSvWR26bwODoMwKYtPMJFi3G753sDi36Fgn1igR5JAgaF7uSHbecIADfOJClRqy1lNJk+Mux5tFUYmtB4VKQpUgNXHdYUk6KKdlWPnSCP7AqBA7Mw+MfAeBWEhR8OrfYKI584t2EBiZ5GrgSH5N7gFZuB3R6fBlPh2XObC6CYPzSIhyzW6s/ZGFSTs25csMt6wytCv2tF4B4qZGaJEO62YV5Rl9BYq9pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48MwxEH5ckqOtizUHfaCilwb1RlQqGac1rOOMbozkjw=;
 b=GzHWvq+aXb/Rb749cOVrkK2Dpk/BVwMUlCPC/LRu0v2DYYCMd8NG694+mTWebquhyzby0cHm1hHCaVrsWDhbK5a2U/cubXGW9/bTDwaIoLsXcaVC8wtb3SRrudwZ7R3RHZxwuDodszEpY1W/Cexha6W3v5TceI/25OsbCmBTXxwuLIA0DGkjEZYdyJODovN8JjORoAVk0savO3gi5w3j6wrGNdmrZUAHx4QuakiQi33dsYzIdkKIRRGFVrlIuIvLY4MHvB2mVHU9jQajjao+BWQGqvphfOPpUuF00dxLs+ln+rIbn5QpjZdPcIeVdUGvQqS2jUiJ4JRf//8wYHRY0A==
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DB9PR04MB9475.eurprd04.prod.outlook.com (2603:10a6:10:367::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 14:55:12 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 14:55:12 +0000
From: Frank Li <frank.li@nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>, "Ivan T. Ivanov"
	<iivanov@suse.de>, Jason Liu <jason.hui.liu@nxp.com>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn
 Guo <shawnguo@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [EXT] Re: [PATCH v2] arm64: errata: Add NXP iMX8QM workaround for
 A53 Cache coherency issue
Thread-Topic: [EXT] Re: [PATCH v2] arm64: errata: Add NXP iMX8QM workaround
 for A53 Cache coherency issue
Thread-Index: AQHcaakGWttSyfkCh0SyEePD7QgEq7Ua9loQ
Date: Wed, 10 Dec 2025 14:55:12 +0000
Message-ID: <DU2PR04MB8951DEE7CB2D29D7E83CE03388A0A@DU2PR04MB8951.eurprd04.prod.outlook.com>
References: <20230420112952.28340-1-iivanov@suse.de>
 <20251210074550.GA10733@francesco-nb>
In-Reply-To: <20251210074550.GA10733@francesco-nb>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8951:EE_|DB9PR04MB9475:EE_
x-ms-office365-filtering-correlation-id: dbe04c51-2f96-487d-ed79-08de37fc1f04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?cTqF1/knCMdl/JTRvt1RKCpEW3igOV0Vn8W3MFrj2z2h2pUCL29Gi1UAr2+I?=
 =?us-ascii?Q?LbnQnxSnJXzHbLtVaElsr1ElCMQV3SNaUq/QKlbLqvGw+3ezvcWcDA73sUGk?=
 =?us-ascii?Q?NoZt0dqQ0VsU7sqEQSr+28hOmtPgtSsWvdRV5L0Me4JHOiClOD41T+G39n1c?=
 =?us-ascii?Q?I5SsKkT78snqIPnpaOUv/kNo29uj+Ks7V6wJORp+EhiynJysbXGJ4btvHmR6?=
 =?us-ascii?Q?ejkq+05qg5C3Mzta0xFaIYk9ic5E8kMfSE17Cn1kYljTQjEKvduBJ5K3uxbC?=
 =?us-ascii?Q?Bf6hgscq4iSrw/f4iA1OvtOqZR3PQo/HQadRN8yoIzT/YrxVCJdZBVqQPyKn?=
 =?us-ascii?Q?4wKuwvqa0ptaEWtABgBEdnon0kUC4vVkI44XyuRGQ4raX5DE6clRUTCg89lY?=
 =?us-ascii?Q?JTp6YmRrO7WP/3ScqginvbFy85/y3gd6lTE+H5cL9N7THa5Oq7zx4DBCWbRI?=
 =?us-ascii?Q?HNrxJKo1i4n0U+JN26JQTBfuuDzNQavgTJLzDzqj7Ouo54/cnJt5dpxzTHkR?=
 =?us-ascii?Q?+/q7hcL6wqJuDyQvlRnEvcBPJsWF/yUw8XLxS/1DFo9wJqUV+4hyuwf5HPSk?=
 =?us-ascii?Q?LIprUxiea28LuqyoyKFLG6iRnM0FUmcy4Hic9tx5T518qmv6oDLsLBzEJsRS?=
 =?us-ascii?Q?opqe1CUZOfrcuJgrHRCv8hcCViP+rpzyDbL+j4X7K+sS1Mt1H7GR0tbW8VNh?=
 =?us-ascii?Q?aGNSEtHHalK11kJhmjgj8qBqCdO/bwi18LVavMVxCkiFxuKZr2M9ZHOl9pJE?=
 =?us-ascii?Q?sLy0lQDErnTrRPmoqYO7q5wGQWMSOd5K02lwzSWZ0cNqc/PXOp4qb3MM/X+R?=
 =?us-ascii?Q?ESqxYAPvBnr5E+RqoPkE8rddlB5xAegccg7sXCwjgu+EI5YndL2F2+n2Fl3s?=
 =?us-ascii?Q?eh1xpnf3BEktcUSQBzUIjU7+mWaDLy8EXiB+zX96sEudfE3ELHTn/bB7UKg5?=
 =?us-ascii?Q?b1eZif3BLBRmfCQ/LE3Mu8ypTv2N7YC5yVWVOjZ0b8ekiEuQU8lFELWb162y?=
 =?us-ascii?Q?+xprgvkl0oFfSNqyyL6C9zO5sxBM1gTiEKeg39oG9Pzmej1o7nihAN3pWhD7?=
 =?us-ascii?Q?eb5ShFWkHoQ5sZkVhAqFVPX6hkKEVQExHI9Wm1zU4LDFUG6eHIh8OmhYJIj5?=
 =?us-ascii?Q?mxhLJc8qV33K6lMo3cbBjfSNUfv3ptvxG8UDMXY5kM9w2zTZ0SpG8ZKsLY3V?=
 =?us-ascii?Q?YUsB8P+s2tULfv95w0jGz+tJKkEq3J0Z7vkP3ZazUqRqGvkY2ebIeGrQILaY?=
 =?us-ascii?Q?5wayOEYGoJmBr+I5LzV3TDyjoMMKtP2HCCwOWACZOFYYc0LskvnFhoObRLRN?=
 =?us-ascii?Q?3WESlXvOr+XV8OcPcoG77+tK9+W3LMVGwT91NYxxPkzydlJCOEq3HfO1vHas?=
 =?us-ascii?Q?FmRxECd6UYlKfWG3sE/XZJ/OkTh7EsqPHQjMuBELbfuzyEUzdEsn0C1xYvce?=
 =?us-ascii?Q?NyJ+u11RLP9ytWnX31tk7n/ew1joN4EViUowpDIOdZracQJcG18l3Psnmya4?=
 =?us-ascii?Q?uy/AkxJlazwGU9wkxa+seX3mnYXX+8WIslnS?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ivlOtobU0j70T24IH8UKRQxR7tA/Mv5jvTPII6EWL9YYVWBon0pymzdZk1kQ?=
 =?us-ascii?Q?HfQhXqMJi3+OGD2kG90gTWfJ5bcPBKaNzSu7LnmYIbk7kbv6dVWPj0Y2F3fv?=
 =?us-ascii?Q?dWNq3lxEFEVQ6lxYPuzZJu9HO8N3OIiLcdjywGPDtoka5R4uH/XRggSds1De?=
 =?us-ascii?Q?lO3CIC6oK+FYeZtzlLASquncg0/6H5tbafg1tadXxXBIhWTw+eza18JKYwJd?=
 =?us-ascii?Q?jehOdkoPNcDaI1Mh6/wdgQPf9Akl5JtN9UGEGSPJ1MD8j7SKTLKvmqtkKOyC?=
 =?us-ascii?Q?VAzuQFCRYxUL6ETpCnkB5rGzmXVBmjKfLSbBZrjaN0vQvmG7U+jBBe2YDR2L?=
 =?us-ascii?Q?/uq031R4gfBgSi2J+69UbGt0chajfw+1QyVF9TnrwGUEVONe3T0EtySkZXyt?=
 =?us-ascii?Q?sR3r2MLD2XQRe0nLXAqYbJ9Ew/Iw6x24qvWE975NdZcLSoRogPLDpKbWoxmP?=
 =?us-ascii?Q?WzSrkHUiZ0l7tAwngJAJ0IuvOAbzSvR003Ax+3Hgx6adlYx/3FxYn2Q5yE5W?=
 =?us-ascii?Q?mI90j47L3uxoJjNyg2/skL18sfwdQ73sfdVFO2HEsqnWq5XQVdZHQWsZS4UF?=
 =?us-ascii?Q?esFfToVo54PbY+ZoL15ud5RBzxsiNPDaSFBnE1obA4aTJQ/U69sw/jM9iM31?=
 =?us-ascii?Q?UUCYiEwdt071Jgm1bg3xBGWI4FHlJuJrpVcR2XYYDgOZrlkQkMgmqVjozZni?=
 =?us-ascii?Q?3KnClNOC7Wy5bGTveRCxzWxv8jsCNCFFSY6RbkZBxcGhq6II/LI3rWi1hxMW?=
 =?us-ascii?Q?oy/k5Y0PgEitT/QdBMwtnUk0sO/RWGndKZLrzvItXHPiIPPWQiqkOfYg8cTX?=
 =?us-ascii?Q?Nvy2E70PhSgvwQfuOOFHWUf2IrNUk5hMYXBsKQ3O+nP5gcn2EMT/R6Kh1NXu?=
 =?us-ascii?Q?jyofYMdEwbQrWuK0dWp/5f70Ga7J5JKuw5I5HeSTaR8VHPOqmG4jbVZ++6H5?=
 =?us-ascii?Q?S2xmYDL7u+PqghJ+7RqnzbK2Hx6inScyu6JlO6fkY6SUQUAxgG2/uHCf+JJp?=
 =?us-ascii?Q?ifJ+/dy6S7vq98oreIQ9ndZAfAg8BWOYXfhaP7axYMMhlG2zctnw8E+Fm1GR?=
 =?us-ascii?Q?akpKZ1hUgLRo7aW0wnK7UdHoGaQbuiYlrhgdEid1MximjnOpoGQrjQgd+Llq?=
 =?us-ascii?Q?FKILAYygLsW8XXy6xSE9TUmBgXxrRrfKHtPAmUzJ763pJ8ympCEKDDluEcHa?=
 =?us-ascii?Q?o31gtaD3IrDyK1t2qU4vFCqyY+K6xGCrwnRWtWb2/dHU4lcsGqw9K23qqh2O?=
 =?us-ascii?Q?HM5vyjjsqSocV62VL04HF0E2s+E3kFvoS+NWiptqQESO6nR6sNkDN0RUkOoA?=
 =?us-ascii?Q?BLzm0OCF0tSHD6QFEhdMcVkiWkrqFTsGcCIn/48A028V0E2qR0gizafLuKJl?=
 =?us-ascii?Q?AyuweMYaSfzxTuo/GmVxAKLhEbnLxsUQJyHjL4aS0BW9gYc29MXPyyrExahk?=
 =?us-ascii?Q?qeKMbSRZ8aYxqZgwY5om8qNAhxiMII8tv7eIkIdEUCMQwvIh0j7pnrfeIcr/?=
 =?us-ascii?Q?Um8rX5bENQgzrVxkOSteTLon54EDoe+1mMecPhL5ISi2Phpe1m4kPFLSz7mi?=
 =?us-ascii?Q?zrY6O0/tdKpWhzdWMnE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbe04c51-2f96-487d-ed79-08de37fc1f04
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2025 14:55:12.4317
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q9ghEw4syJc/WaFJzL+wsEAFYvWSDfqaBfyd9CZrPprNtUmEAHFgWzoAfjxWlnGCVTYXnll8Q2lyQR/xloIAIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9475
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_065519_625497_1C9864F6 
X-CRM114-Status: GOOD (  18.39  )
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



> -----Original Message-----
> From: Francesco Dolcini <francesco@dolcini.it>
> Sent: Wednesday, December 10, 2025 1:46 AM
> To: Ivan T. Ivanov <iivanov@suse.de>; Frank Li <frank.li@nxp.com>; Jason =
Liu
> <jason.hui.liu@nxp.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>; Will Deacon
> <will@kernel.org>; Mark Brown <broonie@kernel.org>; Mark Rutland
> <mark.rutland@arm.com>; Shawn Guo <shawnguo@kernel.org>; Aisheng
> Dong <aisheng.dong@nxp.com>; linux-arm-kernel@lists.infradead.org; dl-
> linux-imx <linux-imx@nxp.com>
> Subject: [EXT] Re: [PATCH v2] arm64: errata: Add NXP iMX8QM workaround
> for A53 Cache coherency issue
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report
> this email' button
>=20
>=20
> Hello Ivan,
>=20
> On Thu, Apr 20, 2023 at 02:29:52PM +0300, Ivan T. Ivanov wrote:
> > According to NXP errata document[1] i.MX8QuadMax SoC suffers from
> > serious cache coherence issue. It was also mentioned in initial
> > support[2] for imx8qm mek machine.
>=20
> Ivan, from what I can see this patch was never merged and there was not a=
ny
> follow-up on this. What's the status? Are you planning to work on it?
>=20
> Frank, it would be nice to have this issue sorted out in mainline, any
> chance that NXP can help move this forward?

Jason worked the original solution, what's difficult of upstream accept the
Solution?

Frank=20

>=20
> Francesco


