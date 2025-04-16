Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63F2C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 16:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNR2saiZ7otvEt/j6kbDgdJp7+ZmpqaeHW8vLYpqX4U=; b=nTWoRWaU0JSdDXf1UqOPgTVs7o
	vuiPhVLmERja9OvU9wxVhXk34KWzx1OnnlsQrrj3I6uKoQ4cXF//R+Plbqm11g36fCjDqvosy9nzV
	s/R5JnEgoQWVjCpUuT/2AwqgictGviiEuxjqyrCgpWc+Wc9DO2UZW7UujHaB656mE6XQ8x5eil5FI
	ydD3SV83A2issEkkwkIKh8EYwpM1Wi6SDsfJ2YSTAHeZoxX+Snu2g7AHeDoBnpGSYaz/1wLx/k+7T
	i+CLnNFcZLZh3c1xMO1TQzkzUKmIlJJQ5zsTaNmt8tbMDuxBCJiQS6K7/BdJjF6VhoEREeNzzNFr+
	FgVs0dgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55a1-0000000AF4g-3TCt;
	Wed, 16 Apr 2025 16:25:41 +0000
Received: from mail-westeuropeazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c201::7] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54jv-0000000A5Uj-1WPt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 15:31:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ekjzjJD4MgM+D64CeCOZpms+c+EXN3dsZXHYGVKSsuEdhPh1ZtCKDlvRhysJsy0HFsbreNWZZ1EV4/4DFENsbtOi/BB53fNkrX1y2EAwCVfSaR4SG7dp3CEZ88Qz2aMPHKSVRNM2OEy7RtIQBW825LnIkXHMY9IPzRWcD4NMHhANpB/U6UShkt1aBZWWurjYgMv7VWfHqm7hcH4K2hU85Q3v8+T7b++Robf1GdnNdyChAXo0ShgVwo0T2wdrISg9oomshaKShVs7IX3N9cyGXtOUSG+yfKbvh8X5mvZiVmC8MKdnfceLwXHPA/acVVYw7Myfh7XreofBaZ4d4ZbLEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNR2saiZ7otvEt/j6kbDgdJp7+ZmpqaeHW8vLYpqX4U=;
 b=AcFoujPY7Qeuer3AP/AthlPpw2t8RAzoHRUg1B02iT+BKMOSg+cMF88Mloj4rBeqb6o8Qc6IIA3GrTfUf2dwueP3TLwcLjktyJ48X71JHSOXi10E7q53Dj7eDm9nAg2PWvwrRvcmDH5icyn7Iboc5n81DI3AzzZSreUAMPnCOsGIHjCKOZbb1/mg/vQUCIAx0RugV4QeIUGjz+YVznS315hHT8nypFWcgZ8bw/ubUqQA57gnD/Ca6C1XSg49cZcAoEjnSrZ/C8Qe6bc/rKXP+3A9OowIQC1KtZFJX9Y8Z4yyOYlwKAOtkTjwQh/Uy8ghfhcddy4aBOluehkLsyjJfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNR2saiZ7otvEt/j6kbDgdJp7+ZmpqaeHW8vLYpqX4U=;
 b=I4lc90DZ4unwc0tnlpzpIpqihQnK2R6KD/NEtyYq+HgKs4g9Oc1ZpzIQZ3RaoRXrNAdXAnwfWTnt9mr4v3Nz50r4KoDen4zIzmFJojVhlpMC5B6CnfakZ1JjJ+/v4ZKjUh00f1aoiz5e40Wjyg3gKK+ekfEW1HfzGnHiWp8agC9arxJ3izeGEQTsjtONi+JW+PhRn2ByYPRvXuVn7YF27A0IJEyiVVTSciWYD5VMM4uFXkv+vwSBoFPkCqyqUKZC1ny4XAQp88Tyh4Zk+3WRpmkF4evRVTQss84jqG8V+tdrm8zfkkXFxbkup0TR1ZGRgvqsPFePN8qRSywwzlDRPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8723.eurprd04.prod.outlook.com (2603:10a6:20b:42a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Wed, 16 Apr
 2025 15:31:48 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 15:31:48 +0000
Date: Wed, 16 Apr 2025 11:31:41 -0400
From: Frank Li <Frank.li@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: media: convert imx.txt to yaml format
Message-ID: <Z//NXcEB6UkEDRxe@lizhi-Precision-Tower-5810>
References: <20250414210720.3359301-1-Frank.Li@nxp.com>
 <20250416124226.GA2498696-robh@kernel.org>
 <Z//KCLUWlTMdsyd3@lizhi-Precision-Tower-5810>
 <14f2bfcd4604c5cf8b92a7d0dfc685e1f56b768b.camel@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14f2bfcd4604c5cf8b92a7d0dfc685e1f56b768b.camel@pengutronix.de>
X-ClientProxiedBy: BYAPR11CA0055.namprd11.prod.outlook.com
 (2603:10b6:a03:80::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8723:EE_
X-MS-Office365-Filtering-Correlation-Id: e2695395-01ea-4d18-8885-08dd7cfbcd6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0UaJDvXYZ6G2R5R0+ox+Y+8LkNMnTryPjuyjI2rJmyygioJsM8oVCeaKr4jI?=
 =?us-ascii?Q?rgN90Pka+yyrhGar4O5D6sOZoAeTdFw9O0USiGzkPo6mwIkzFUzdkn6A+w4w?=
 =?us-ascii?Q?z5SeyAJ2lyU/9BiphMVozNikZh5TpaQ3OQPuttcSa+ReUrgfVg7KjB8BfZJp?=
 =?us-ascii?Q?m6wMTtZ3ZkhUb9kSV+JIp3eXom1ecMxM9SBiEQYHgN5rxxPZf0IHIKsszQoI?=
 =?us-ascii?Q?OGqCG9aLxvj38uTgcdWNMoLVJawCKTIAOWIH/g8oVf+5/dGPUpyXpkVaLQAd?=
 =?us-ascii?Q?mykqbxjrdoUrq9H5LH5Xn9E2UXcrgC+dFYlOHzxNug/YPtEOkChQ4AGGkcee?=
 =?us-ascii?Q?lO5tATt6XgW+Wfj/dupxZRt0kLNvTifFAocl2T/i2aPkx9rqtFyRfVrPFRIF?=
 =?us-ascii?Q?cd1aAsbTojvPt51M6qP39pEL3PEvqEmq4CpZdRgyX5V0WHuG0+Dsgicm7ie1?=
 =?us-ascii?Q?8b444w6Jf6fEzOqugVHTWl/81FpcDLgTf2e4QEEG5bJdNnkSP/uYVCLHQMHR?=
 =?us-ascii?Q?kx5eO/WIzxHe2Pm81D88bMtBYwkqRZvAKvXiyBjR+5RpzoTVPM76WI21zefi?=
 =?us-ascii?Q?5o51VpA63MoZ25hUk612K2kdj9MOXSS+0Gxf9lagvLQ0sqTdEKBH1XntjWRH?=
 =?us-ascii?Q?uWF8gPpadpHGcQDrwkGfWFBjrwjTIWDHjemC9l/1zViSuSpq6gahUFM/Ff13?=
 =?us-ascii?Q?pGCPOKhon/XOVv4Xml9i9GDBV1NnZwIL88pOBs0LB1b6TqblIfYK/kdoBkam?=
 =?us-ascii?Q?NCxZu1+lKLmgg+jdj0iuCWEidUCj6ZbD0XJFrXnArRgmyisR9/jE9nQnTbfp?=
 =?us-ascii?Q?5pj/IMSOVzCTRxh/V8eTawPBrhvdpGxlv9FNjbMbTHifdAL8mFdSWC4wJ2bI?=
 =?us-ascii?Q?bfQlLbT5gu+D8/6M3TksKmplUcUvru7OssWkct3p66SOdx7cf0m/RP9xXhrj?=
 =?us-ascii?Q?P0vP8PLZLLIvaumNa+Gk8Pf9oqKg9JIpaKALANlvVouTaLYlk0PzEgC6OMKN?=
 =?us-ascii?Q?tamLh8CFEElnEg5MWY6lbgijB7bE+SVVfCgpNvzirA+f+rhaHX53ON1VHEzp?=
 =?us-ascii?Q?aW42JebzXHc7bVg8ceyjboaQveC6RUV+T3GCMQ+sid+6Mq+PVzIjRda7PBQt?=
 =?us-ascii?Q?e+7t3CagwIouE3NynipftWgb82jox5ZtY5F2nsgXxUfij2zHNpu6XrrdiprN?=
 =?us-ascii?Q?NE6/OnYmHYmdPtxgUcUP/HX0ks8TwAUmdg1dg9Zd+NV4Wd/sgwdsu96YP3kL?=
 =?us-ascii?Q?UyrOw6Nzixgnip2wEZT0dyxQuQ5B2qvaVnv8OK4vIGMQvK14SopPpWO9+Xq0?=
 =?us-ascii?Q?2BynOCSkEWNhaGrUOf3pCR34rxTRz/mS5vvT2E88w6EsCwrQYrmsVkhKdgQu?=
 =?us-ascii?Q?ihFw5t4WqlMasByTDVZPO4RH7/w9kUaASQIqbrkXSsdrMidttVa8ZmGGLzwt?=
 =?us-ascii?Q?A1HTSU3lMM4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jGb1iCW4atnPQWfRGaPYevLH0h0XOC8bW7pM+M2RymPA0fcooyV/FfJifSWy?=
 =?us-ascii?Q?eKTdd2kEuhsx4xvQLL5ykxUvBb7Yv64QSSF24DAB4RqUYgS8Z6KU6R1T5S8H?=
 =?us-ascii?Q?hVjG0MvubfSnxkaFx4tJfDu84g9/lMqSrf4l5CaKQKjnKdWGQC2cIXQh8I9j?=
 =?us-ascii?Q?2IQqJObtSqS9DAgbRHu6Qq24dbFZihQbV94e8CHsW5jo+8ienogQ3kiuQ3VN?=
 =?us-ascii?Q?QmOoPIq5PNIgMsuG0WWVIs+e4FarJdF1JIyrJQRA6dRv9+70jYyypz9O+DoL?=
 =?us-ascii?Q?E0WldBqEwoTjLG4XcPjKGM+dJSuY+6EjwiF2nQt6sUlWdfEt9p1jMQaoA92T?=
 =?us-ascii?Q?0AHmfzXuFeRB2Sdn+88tS0PFPt2+mUYbhwCFYx/ybpsIUd2aOBa8rjEP7vkQ?=
 =?us-ascii?Q?mn3P4tLCqnxA3BdI/V2Y0msOjlZgDYXSRehZBQH/UqviPgHhKUzt4rL7CEdH?=
 =?us-ascii?Q?n+Rn/5Yu5JPRCVfwxdB28wDfTNuXHg7RSDXj/hVwWYfuKZwL7yy9z1e5OJXx?=
 =?us-ascii?Q?9xSIdYcMd3pnkzP3Nk3TTTqUOIbPx/eYZhz/TKrw6UKKQ4Lar7oFxmzdzJhx?=
 =?us-ascii?Q?O8knRlAtPiuWFy4efDEiltnWvD38lX9EHvKftD5q3EPBSUueoqcJ7P3S539U?=
 =?us-ascii?Q?btBEr+yGga6nn/YJqzN3OdKgb7usd+uKOSWwYnYcjYzbCmrYZPW++zjXwF2f?=
 =?us-ascii?Q?LjZuBblrhLzFhNjfizLRD0r5PV1VjRGuOJIp7NT0Je7Lqd6FgZIY4/sFtfRz?=
 =?us-ascii?Q?27j3YhvikJ6tunqgXXfgSftk5LBWAjpidNJRaNRK96Ox24Xpdu9kpjAMVWZu?=
 =?us-ascii?Q?NjnLPD9Lb/FCHHx2g5Go5+isU59O2nkGsaeMfFjQp0fCUYWxw2XHw0MQTmJC?=
 =?us-ascii?Q?Ub/GriYXbB8wVZPYxe68k7zYIVI6K7HGMucqAk5orgy3mlj/lNdkd9IQ1Xey?=
 =?us-ascii?Q?oEO5KmkqVU7k3qpJZVpGsqgPZhB6E7vLWHs3aFPxr/LYre+yywjCVlC0VvVG?=
 =?us-ascii?Q?0lV+qPtzC9NC1I0I9jvzwNXsgI9wyEhIdQ57GvZGpZMJhgyFYf2lnO+la/NF?=
 =?us-ascii?Q?lbD1cKyysk9+WiC5xDOa2nm77YiR4Qj71EPmjDERUSDwchRgJ2UKI9bu/TOj?=
 =?us-ascii?Q?HHQGp9WDHuS1U4GSM74JjyBU1kRi0mb8mvhGuigwaisdDM5nLn9z4gi94JGt?=
 =?us-ascii?Q?vlSkHhLCP/GeURI4ahJZaE8ipkv3geZ5V7/fA+KrgTXqD2p44wQgoi6da61U?=
 =?us-ascii?Q?QieGuurCq0WZVFT5KSTe6hUJfkSDCd79bdCunInzNLqre15/4ZuBANZBs6Km?=
 =?us-ascii?Q?zBXRhzYkhXZcsUGuqXk+Gclnar+17mo2fwaTRwRDNK3qtG1BdRSxQPYOIjsB?=
 =?us-ascii?Q?TXIx8iyrrw13QaRbhvLxnVWaFtUiA5gLScZ5+k21jJBIyxQcJvluXvXbnFig?=
 =?us-ascii?Q?XVMNB1Pey9ObZoIT7cYIXHlnlslJJHGSsn3EgdOVrVwZBH51cmKamfP+KfY/?=
 =?us-ascii?Q?Kq0C2vCH0Y17m/GZAdka0AOiVaouM8S4b5aisLpg4HnImKJspwVb8g1akHCg?=
 =?us-ascii?Q?xoWFv40S8Bgnl3CIkpfUprkXbhFoe96RnZHmckI8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2695395-01ea-4d18-8885-08dd7cfbcd6b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 15:31:48.3275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Y5MhUkGI93Fbo/Mg/0+sfRffX73PH+IzQKY8CANDphLDl/WWvRonG4g0/ifql2gHa3NN3VyBVv3Igvfwuv2gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8723
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_083151_407865_26B0DE77 
X-CRM114-Status: GOOD (  24.50  )
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

On Wed, Apr 16, 2025 at 05:26:19PM +0200, Philipp Zabel wrote:
> On Mi, 2025-04-16 at 11:17 -0400, Frank Li wrote:
> > On Wed, Apr 16, 2025 at 07:42:26AM -0500, Rob Herring wrote:
> > > On Mon, Apr 14, 2025 at 05:07:18PM -0400, Frank Li wrote:
> > > > Convert binding doc imx.txt to yaml format. Create two yaml files:
> > > > fsl,imx6-mipi-csi2.yaml and fsl,imx-capture-subsystem.yaml.
> > > >
> > > > Additional changes:
> > > > - add example for fsl,imx6-mipi-csi2
> > > >
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > >  .../media/fsl,imx-capture-subsystem.yaml      |  38 ++++++
> > > >  .../bindings/media/fsl,imx6-mipi-csi2.yaml    | 126 ++++++++++++++++++
> > > >  .../devicetree/bindings/media/imx.txt         |  53 --------
> > > >  3 files changed, 164 insertions(+), 53 deletions(-)
> > > >  create mode 100644 Documentation/devicetree/bindings/media/fsl,imx-capture-subsystem.yaml
> > > >  create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6-mipi-csi2.yaml
> > > >  delete mode 100644 Documentation/devicetree/bindings/media/imx.txt
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/fsl,imx-capture-subsystem.yaml b/Documentation/devicetree/bindings/media/fsl,imx-capture-subsystem.yaml
> > > > new file mode 100644
> > > > index 0000000000000..77be3c1f37c5b
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/fsl,imx-capture-subsystem.yaml
> > > > @@ -0,0 +1,38 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/media/fsl,imx-capture-subsystem.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Freescale i.MX Media Video Device
> > > > +
> > ...
> > > > +        reg = <0x021dc000 0x4000>;
> > > > +        #address-cells = <1>;
> > > > +        #size-cells = <0>;
> > > > +        clocks = <&clks IMX6QDL_CLK_HSI_TX>,
> > > > +                 <&clks IMX6QDL_CLK_VIDEO_27M>,
> > > > +                 <&clks IMX6QDL_CLK_EIM_PODF>;
> > > > +        clock-names = "dphy", "ref", "pix";
> > > > +
> > > > +        port@0 {
> > > > +            reg = <0>;
> > > > +
> > > > +            endpoint {
> > > > +                remote-endpoint = <&ov5640_to_mipi_csi2>;
> > > > +                clock-lanes = <0>;
> > > > +                data-lanes = <1 2>;
> > > > +            };
> > > > +        };
> > >
> > > I would think at least 1 output port is required?
> >
> > I checked dts file, only input port. I think old csi2 only need get data
> > from camera. csi's dma should save to memory.
>
> There are no ports in imx6qdl.dtsi, but there's a &mipi_csi with four
> output ports in imx6q.dtsi and imx6dl.dtsi each, because whether data
> flows through a mux or directly into the IPU CSI ports differs between
> the two platforms.

Thank you very much!

Frank
>
> regards
> Philipp
>

