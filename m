Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB31F532C7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 02:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExwpzYkQ2958OgtxZe6wVSCT9MASafpRZXg9CTt03ps=; b=Ga23Zk8K9MYeMg0GFxLwsQvsuW
	MrA3FxpzAm10nlSuYOxH9vQ2cvUWco7qNAQHdJbWsl9PfwD5ds82iTRZ1Bfyi+qAZo1K3IxfOWk3Q
	vFubYIwNABV7hB03LLEbxebIVD4ra0xy6BKXplDhPulXyNMENNjtBb/8kUjyQ8iE66zKLELaR0Vj0
	VRjlUZ1U9s00kNcNcL5UL/n2w7xQ0m8fHP62JpxWsAWSnMFTdJj4XFnn5VBTM/Xm1htXBxUmTs5m5
	JmaU+g5pdySrpFiznXeoLXE0nkIpoT9vKqPYsL5Y3WjolzOLt9VwmXHzXe6vELZahE9V6nPT0P6gU
	4dbS9SxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4rRp-00000000OIq-1tLf;
	Tue, 24 Mar 2026 02:24:49 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4rRm-00000000OIN-0NSj;
	Tue, 24 Mar 2026 02:24:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yiMp6zzrB3kDW3J0SPgk34o7vJaVeoSn0mdE/3d8AmaEA76oTaz4oW4DB9z8QKqvAtghvJR8qmAiQClot8EmHNzSIGHWlKd6MCLiV8uR89nBtyrEBjV+VCBqkW3VsPHDCcNVQakvdh9jO0deabkBqJxyuX8Dv9EXUOg+tJt5HlaAY7AHkHtwvSCUJ+ZWEiGVG/hCHS+IrW4L9oA96vsJqW3Cn4hM7mgXB5QDNaSLa6tldWtb7Z1ZlUacwTpZ1+v0KSwmVwMMq2TVAKxWw3Wa/uaaB+pP1T2C0WZcDMy5/8uRFFcdtfO/tYCvJL8UCa/VYC/gVHCce1lsgOPfgOdDrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExwpzYkQ2958OgtxZe6wVSCT9MASafpRZXg9CTt03ps=;
 b=vCGqpl2a+/I95B1rxB6J7pn0LhBQhQJVjJfE0sFhxWCDlZDQxgdv6/CUjzty8X1JmfK16P84ZRk+GS1pCukR4f3jWmCygvh2klar6aDDvhBbNILAhHFBfrgamFfy8v0vPiy1ZUVKz/EED4rpnyeRkIuiSc0Ml2imRs0LFPEP8IhX92u559LOXfF/x+ElWaMTWkz9+5UH/jrDJNXVzM3oN4xYDqADDBh3MI3Y+bkAdw/tuRLPxlHujS4pXQdPIYKhqZS6LxUQAaA8duJriDsX4A2UwoGNV5HbXR0PrmoT9YqW/HxlQCuxPuIb5YzERc56FyG9TtzpsjW7UuwE1Fv9QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExwpzYkQ2958OgtxZe6wVSCT9MASafpRZXg9CTt03ps=;
 b=GhD80TbHtXLQsXBlZEhJONwzpjm3y2UB6IV5ebT0cOEUTgwUEgmpb7CFRr1ZmEKLqSwzWtrTxpmSfV2XRcs8vSbA6uWdOfssiptGMw59sMx/gyGgMhkBKquMKCiJyNvrBKG4c23Xl8EXRs2a3zX1jQ8WTSue2IQZ8wVYghU/PxWk3KVF/hTYwJSCAx8ZNg4qizpW5PQf9TrdT5G+aGjllFBMw7WfgzKeZE/Zu0kxbnJahAQVi3cuR9tEmq34EEsey7eWiExuB6AeaZCmcsryRkJpw2Mv/NpcU9OuiDOLkc4Wohdu8Lexwt1DrcPvWWpyritr5wiq2Il/VjAT7uL5nA==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by TYZPR06MB5760.apcprd06.prod.outlook.com (2603:1096:400:268::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 02:24:31 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::8c70:cb01:78fb:d9c0]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::8c70:cb01:78fb:d9c0%6]) with mapi id 15.20.9723.018; Tue, 24 Mar 2026
 02:24:31 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Thomas Gleixner <tglx@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: RE: [PATCH v2 1/5] dt-bindings: interrupt-controller: aspeed: Add
 AST2700-A2 support
Thread-Topic: [PATCH v2 1/5] dt-bindings: interrupt-controller: aspeed: Add
 AST2700-A2 support
Thread-Index: AQHcrUBIO0E6jeH7906M7PSbMeKkVbW8lgyAgAB5tVA=
Date: Tue, 24 Mar 2026 02:24:31 +0000
Message-ID: <TY2PPF5CB9A1BE6D0E2D45243DE85BD7191F248A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20260306-irqchip-v2-0-f8512c09be63@aspeedtech.com>
 <20260306-irqchip-v2-1-f8512c09be63@aspeedtech.com>
 <20260323190721.GA1013496-robh@kernel.org>
In-Reply-To: <20260323190721.GA1013496-robh@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|TYZPR06MB5760:EE_
x-ms-office365-filtering-correlation-id: 33cea6e4-80a9-4ca9-59cd-08de894c7b6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 4UIdB45R6Z1AOtBk0Dx3LIamX0sMLEaC/RTnqAy4hafF8iYltQz2fbtgOyxtmhcabgdo1tCICnDlNBL1VERKgs39zgsy+8QDGzr5hayv5g21gqeXg1902ZTpakTresr2+n0hSzuG2I8Z6aBdNn1sWyOOmPqKoc0THEcEDZ4938WfdZlwxAveZEpJwiN1ZKHw8tpMHeiZexXxx3oweLV1Okzg1bWU8f4NyXpeg+uTPQAOXoVwSuGufynYeBtyNBFmWtgUlobGGnkSTuY21XXht2/sVltI4JmJKy4q3CIOByQSpipEZyhrI5LZtBZVCdwkbWYrmhHWx5VUXYOSHarOE6bk4t/EBquDl9JFxjTrXHctOo+nOg7WSc+rP+H7Pe/M/WZLH+0QCHOO9n5i/vbRUl0cbpQ0fee0sleyqnhnwXcUV05WnAiS0ckJwskM8wm4Dr/58qU997QjVz08x0l/BXXJAjwdDUoCJYjFPjSdIy3iXTG13zm7bujQ2pOSVjlAq0/DPFwNP0aKFxdzl3VsCCJFKzUSGTlLBBT4fByA9rMB9rCSkWIb8ovfiKmfVAPtroVXxnnKhnRgt/RGAU8J9UhxToJsdVSXdHvTpkqaUyE3KaSLS3DpaZ6IM1KF84DvOYogPQd3qt5pzYTwDrCXf75zAce3q7GI1ETFYwHrZbHQ82QHdxEeKOv03j8AJYZsi4ez9WUNxLwWIRiZNRKsPjpygQJA+RMJFlMlduTFryCKE62T9JxWeqf6SYAuMAmi
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iRWS0ThFQ4UifE/H8rRDZp1LHKYz3/MWzE2DpYwqY7margUO2Ea5gAiwGNqv?=
 =?us-ascii?Q?PipbxYZMSKEEg9zvw3aPv2/2n5rA2EmqUqP15CaK/BvFPgECXzFzfuduHMgx?=
 =?us-ascii?Q?y630luUX9IEoXUE32hhA0q6ViG0LDeqQZR0dTndDwQN36+GKawvWT4nyUcpF?=
 =?us-ascii?Q?0bOmxSTJ/NPgDMU6FTYQCDLt3BXVQeXwWsvdcMdFZRuMg7Ow6WrupHtWRwXI?=
 =?us-ascii?Q?Azq7DM7Yfa9vfa7NvrplYx/dLPfIf3tfRyIj+/7yq0n+ltiFM7nUYKyd7zkB?=
 =?us-ascii?Q?K7LNevMXC1IC21ASt3dinv3bdu9ROU+H/QPFiDnBW3kWWWIcgBBCFxJjQLrL?=
 =?us-ascii?Q?19tERsMOL84yZtmNlcFcy2BKrmtBPJD3gVho/cBBXURHVtPWjxG2cpABSICW?=
 =?us-ascii?Q?sCnFb0QqVCf3pckBrL1xA8heqPU4AtR53mHoH350zmwMGM8h5ky7ThEinkBz?=
 =?us-ascii?Q?9EucsUtApNyAEOd7LHZZJouWKiUDftyCpFqDVlZtGpO0WZZEYcgWC/FUklnI?=
 =?us-ascii?Q?1qD+9UYSQ0eOYS7x8LQpCwQZ19dAvRDM44g8aDsBF2Xmd/R8tUFg8j8DztU9?=
 =?us-ascii?Q?ZHMsG65EAOLLxRerDHli+jYZUPE6NegqDD8u5V/NYrvMOmSQQFbw2O99tlb9?=
 =?us-ascii?Q?gRbLWVl0LKbJhmdj+FQf4twayYXLCcHlQrzs6jbvNejyW1t6I4KByPy3IsFI?=
 =?us-ascii?Q?Cgu/uR/uR5P1UI6mqyk29jTvmOA3oJR8BvJqx8n2X/f4Eg1jti4TdCg8PK8N?=
 =?us-ascii?Q?2xlufXo4SMKmDRQG/+EJaAsFGY2h90prVsZoX0AQxAu3Tc/uXgUGi/R2+XCq?=
 =?us-ascii?Q?FVccbhP6nA0KaOBzleQ3r629yNGbNSnep1AcLtg1pg7VmdnTaL5PJCPOZACM?=
 =?us-ascii?Q?zhvM+imTdehVbFhurV9ag+Jv5e6r1e2v6RODu9STuQ81dRjNMHgHTSQL8j21?=
 =?us-ascii?Q?gRyEt5NWoLH0+B8CSPukmvpZ5k/rLIly5eKEjrMEG1MT7wPeuCNMMk+NDHrc?=
 =?us-ascii?Q?pM8UKrY73gXgGwwXGCzpGKHdB63ouEufWh0pks6R1Ta2Oxfs1vYvA7ucXfXL?=
 =?us-ascii?Q?WKlMAmLIE3uxiC9nqRv8J3K6xdC8783GaRoPhI54bW88ddUIjFPDE4sw6kpz?=
 =?us-ascii?Q?2swTwoQWI/38pc6R+125vZEgWDqR94zz/iyL/4GOMVfY+MMDsetEzk++Dmwb?=
 =?us-ascii?Q?58038F7HWMRap3ZvoNsu6i4/yXGJ7+FykrZY45PWL6EBUOSz8TGN9H36TDdP?=
 =?us-ascii?Q?CxqwIQ3jlNmxq8Ii/GtupSEzOCksiKon1qoxKs41cexDAQwjfj28SM4HNUGs?=
 =?us-ascii?Q?np2dLFQRbZnA089itJIp643wUiASEqAE59e3cj7dIwvKNhA2qf+hOT9WiFm4?=
 =?us-ascii?Q?SlG+lGhPkk7CGTHetYXuRziF7YVl1BdqKEiQmeX4SGPv1V/3dxfU0dK25V4+?=
 =?us-ascii?Q?sRRhFYOZ20wyU42IvrGK1RkD6wUiLi+1/VdwI80sRuF6TQ5PJTWV7FAIRUNq?=
 =?us-ascii?Q?9NPD+bnkpqVCnKckUx3vtAhJgVYYJkkgNkorQSdBGs2KrTdXSSvS0NQAjYHv?=
 =?us-ascii?Q?GMXGMyMOX6C8JIernjsUh1h7fJ6zBTZWnYPG77y5fgrw0HiEZl0mXhznMwyj?=
 =?us-ascii?Q?YBdx8pyyE02T8dvgH2txz7/Iwbv/FwpM1oLVA8HqJd9kbe4sL3l8+vJ77DPe?=
 =?us-ascii?Q?fv3U+SGi9597SZVXy9Tzp+GHNnrViI7hSCWULRpzIpyptDZmki9iNOSyDmjt?=
 =?us-ascii?Q?TRPQb+fzjQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33cea6e4-80a9-4ca9-59cd-08de894c7b6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 02:24:31.4104
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /QIMeSW6VC4uNzRMFioeAOICvzKR9/4O/9fhd3v3eOngHBS5zwF0yLi+pw9inVPqj8p/jNXGgrCwqnIzaXWknvMn2UMjduGy7Xh9RszTG9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5760
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_192446_545118_F3EBB8A6 
X-CRM114-Status: GOOD (  30.28  )
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

Hello Rob,
	Thanks the review.

> Subject: Re: [PATCH v2 1/5] dt-bindings: interrupt-controller: aspeed: Ad=
d
> AST2700-A2 support
>=20
> On Fri, Mar 06, 2026 at 04:07:23PM +0800, Ryan Chen wrote:
> > Introduce a new binding describing the AST2700 interrupt controller
> > architecture implemented in the A2 production silicon.
> >
> > The AST2700 SoC has undergone multiple silicon revisions (A0, A1, A2)
> > prior to mass production. The interrupt architecture was substantially
> > reworked after the A0 revision for A1, and the A1 design is retained
> > unchanged in the A2 production silicon.
> >
> > The existing AST2700 interrupt controller binding was written against
> > the pre-production A0 design. That binding does not accurately
> > describe the interrupt hierarchy and routing model present in A1/A2,
> > where interrupts can be routed to multiple processor-local interrupt
> > controllers (Primary Service Processor (PSP) GIC, Secondary Service
> > Processor (SSP)/Tertiary Service Processor (TSP) NVICs, and BootMCU
> > APLIC) depending on the execution context.
>=20
> Unless you intend to maintain both bindings for some period, then you sho=
uld
> just squash the removal here. If both are going to be maintained then pat=
ch 5
> should not be applied yet.

I will remove 5/5 squash to 1/5.

>=20
> >
> > Hardware connectivity between interrupt controllers is expressed using
> > the aspeed,interrupt-ranges property.
> >
> > Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> >
> > ---
> > Changes in v2:
> > - Describe AST2700 A0/A1/A2 design evolution.
> > - Drop the redundant '-ic' suffix from compatible strings.
> > - Expand commit message to match the series cover letter context.
> > - fix ascii diagram
> > - remove intc0 label
> > - remove spaces before >
> > - drop intc1 example
> > ---
> >  .../aspeed,ast2700-interrupt.yaml                  | 189
> +++++++++++++++++++++
> >  1 file changed, 189 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast270
> > 0-interrupt.yaml
> > b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast270
> > 0-interrupt.yaml
> > new file mode 100644
> > index 000000000000..13398ff8be12
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,as
> > +++ t2700-interrupt.yaml
> > @@ -0,0 +1,189 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-int
> > +errupt.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ASPEED AST2700 Interrupt Controllers (INTC0/INTC1)
> > +
> > +description: |
> > +  The ASPEED AST2700 SoC integrates two interrupt controller designs:
> > +
> > +    - INTC0: Primary controller that routes interrupt sources to upstr=
eam,
> > +      processor-specific interrupt controllers
> > +
> > +    - INTC1: Secondary controller whose interrupt outputs feed into
> > +      INTC0
>=20
> Wrap lines at 80 char.
Will update
>=20
> > +
> > +  The SoC contains four processors to which interrupts can be routed:
> > +
> > +    - PSP: Primary Service Processor (Cortex-A35)
> > +    - SSP: Secondary Service Processor (Cortex-M4)
> > +    - TSP: Tertiary Sevice Processor (Cortex-M4)
> > +    - BMCU: Boot MCU (a RISC-V microcontroller)
> > +
> > +  The following diagram illustrates the overall architecture of the
> > + ASPEED AST2700 interrupt controllers:
> > +
> > +                  +-----------+                +-----------+
> > +                  |   INTC0   |                | INTC1(0)  |
> > +                  +-----------+                +-----------+
> > +                  |   Router  | +-----------+  |   Router  |
> > +                  | out   int | +Peripheral +  | out   int |
> > +  +-----------+   |  0     0  <-+Controllers+  | INTM      |
> +-----------+
> > +  |PSP GIC  <-|---+  .     .  | +-----------+  |  .     .  <-+Peripher=
al
> +
> > +  +-----------+   |  .     .  |                |  .     .  |
> +Controllers+
> > +  +-----------+   |  .     .  |                |  .     .  |
> +-----------+
> > +  |SSP NVIC <-|---+  .     .  <----------------+  .     .  |
> > +  +-----------+   |  .     .  |                |  .     .  |
> > +  +-----------+   |  .     .  <--------        |  .     .  |
> > +  |TSP NVIC <-|---+  .     .  |       |    ----+  .     .  |
> > +  +-----------+   |  .     .  |       |    |   |  O     P  |
> > +                  |  .     .  |       |    |   +-----------+
> > +                  |  .     .  <----   |    --------------------
> > +                  |  .     .  |   |   |        +-----------+  |
> > +                  |  M     N  |   |   ---------+  INTC1(1) |  |
> > +                  +-----------+   |            +-----------+  |
> > +                                  |                  .
> |
> > +                                  |            +-----------+  |
> > +                                  -------------+  INTC1(N) |  |
> > +                                               +-----------+  |
> > +  +--------------+                                            |
> > +  + BMCU APLIC <-+---------------------------------------------
> > +  +--------------+
> > +
> > +  INTC0 supports:
> > +    - 128 local peripheral interrupt inputs
> > +    - Fan-in from up to three INTC1 instances via banked interrupt lin=
es
> (INTM)
> > +    - Local peripheral interrupt outputs
> > +    - Merged interrupt outputs
> > +    - Software interrupt outputs (SWINT)
> > +    - Configurable interrupt routes targeting the PSP, SSP, and TSP
> > +
> > +  INTC1 supports:
> > +    - 192 local peripheral interrupt inputs
> > +    - Banked interrupt outputs (INTM, 5 x 6 banks x 32 interrupts per =
bank)
> > +    - Configurable interrupt routes targeting the PSP, SSP, TSP, and
> > + BMCU
> > +
> > +  One INTC1 instance is always present, on the SoC's IO die. A
> > + further two  instances may be attached to the SoC's one INTC0
> > + instance via LTPI (LVDS  Tunneling Protocol & Interface).
> > +
> > +  Interrupt numbering model
> > +  -------------------------
> > +  The binding uses a controller-local numbering model. Peripheral
> > + device  nodes use the INTCx local interrupt number (hwirq) in their
> > + 'interrupts' or  'interrupts-extended' properties.
> > +
> > +  For AST2700, INTC0 exposes the following (inclusive) input ranges:
> > +
> > +    - 000..479: Independent interrupts
> > +    - 480..489: INTM0-INTM9
> > +    - 490..499: INTM10-INTM19
> > +    - 500..509: INTM20-INTM29
> > +    - 510..519: INTM30-INTM39
> > +    - 520..529: INTM40-INTM49
> > +
> > +  INTC0's (inclusive) output ranges are as follows:
> > +
> > +    - 000..127: 1:1 local peripheral interrupt output to PSP
> > +    - 144..151: Software interrupts from the SSP output to PSP
> > +    - 152..159: Software interrupts from the TSP output to PSP
> > +    - 192..201: INTM0-INTM9 banked outputs to PSP
> > +    - 208..217: INTM30-INTM39 banked outputs to PSP
> > +    - 224..233: INTM40-INTM49 banked outputs to PSP
> > +    - 256..383: 1:1 local peripheral interrupt output to SSP
> > +    - 384..393: INTM10-INTM19 banked outputs to SSP
> > +    - 400..407: Software interrupts from the PSP output to SSP
> > +    - 408..415: Software interrupts from the TSP output to SSP
> > +    - 426..553: 1:1 local peripheral interrupt output to TSP
> > +    - 554..563: INTM20-INTM29 banked outputs to TSP
> > +    - 570..577: Software interrupts from the PSP output to TSP
> > +    - 578..585: Software interrupts from the SSP output to TSP
> > +
> > +  Inputs and outputs for INTC1 instances are context-dependent.
> > + However, for the  first instance of INTC1, the (inclusive) output ran=
ges are:
> > +
> > +    - 00..05: INTM0-INTM5
> > +    - 10..15: INTM10-INTM15
> > +    - 20..25: INTM20-INTM25
> > +    - 30..35: INTM30-INTM35
> > +    - 40..45: INTM40-INTM45
> > +    - 50..50: BootMCU
> > +
> > +maintainers:
> > +  - ryan_chen@aspeedtech.com
> > +  - andrew@codeconstruct.com.au
>=20
> Name and email address please.
Will update.
>=20
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - aspeed,ast2700-intc0
> > +      - aspeed,ast2700-intc1
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupt-controller: true
> > +
> > +  '#interrupt-cells':
> > +    const: 1
> > +    description: Single cell encoding the INTC local interrupt number
> (hwirq).
> > +
> > +  aspeed,interrupt-ranges:
> > +    description: |
> > +      Describes how ranges of controller output pins are routed to a
> parent
> > +      interrupt controller.
> > +
> > +      Each range entry is encoded as:
> > +
> > +        <out count phandle parent-specifier...>
> > +
> > +      where:
> > +        - out:     First controller interrupt output index in the rang=
e.
> > +        - count:   Number of consecutive controller interrupt outputs
> and parent
> > +                   interrupt inputs in this range.
> > +        - phandle: Phandle to the parent interrupt controller node.
> > +        - parent-specifier: Interrupt specifier, as defined by the par=
ent
> > +                            interrupt controller binding.
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 3
> > +    items:
> > +      description: Range descriptors with a parent interrupt specifier=
.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupt-controller
> > +  - '#interrupt-cells'
> > +  - aspeed,interrupt-ranges
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    interrupt-controller@12100000 {
> > +        compatible =3D "aspeed,ast2700-intc0";
> > +        reg =3D <0x12100000 0x3b00>;
> > +        interrupt-parent =3D <&gic>;
> > +        interrupt-controller;
> > +        #interrupt-cells =3D <1>;
> > +
> > +        aspeed,interrupt-ranges =3D
> > +          <0 128 &gic GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> > +          <144 8 &gic GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
> > +          <152 8 &gic GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
> > +          <192 10 &gic GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
> > +          <208 10 &gic GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>,
> > +          <224 10 &gic GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>,
> > +          <256 128 &ssp_nvic 0 0>,
> > +          <384 10 &ssp_nvic 160 0>,
> > +          <400 8 &ssp_nvic 144 0>,
> > +          <408 8 &ssp_nvic 152 0>,
> > +          <426 128 &tsp_nvic 0 0>,
> > +          <554 10 &tsp_nvic 160 0>,
> > +          <570 8 &tsp_nvic 144 0>,
> > +          <578 8 &tsp_nvic 152 0>;
> > +    };
> >
> > --
> > 2.34.1
> >

