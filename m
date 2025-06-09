Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE77C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 17:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFe5dS30+WBpiSNCqiQrb4vdTA7W9SS/h4EoebVqB7g=; b=h82l9CSVAvQGa4HvxJJwNnB/1O
	mzmv5tGfgae9MScl+4kNOaXMvYjHA7HkGFWJ+HaGFsKWOT3TDLVbclwwboTV+tlD6aL645zPAjxB9
	Erlx+6rO1342yI2Ix6lxnCnk7Ifn6EX/AHaDbl4HH/Ig461CCQdgDFsbrv6KdH6uYK406MgHLiQro
	etJkoNbg+/YmXDaoDMaHSkqeWUBwB1Mn6RwiWlQdCDVRzhqs2Y9uugk7zsjAWEOOvlvzamfi49M0G
	UANUa8D7HjII+vBQ8NT2alzd9IdVE97UTMvrtFN7dvUmldzAUsRHL1K++PwAGmn4Pp8xDP52+ypMq
	6NxYaOrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfx5-00000004l2M-2YhX;
	Mon, 09 Jun 2025 17:06:27 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOf57-00000004cmm-0R06
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 16:10:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ymXOYdSqFNIHdj69/KKRwzA8vDLzzXVSrg41hXjpGwPo0wVH5NSYgGnai3ND1Xd1ZWSz1onixMfzAfx5bakakS4PzzZDMSOv8F+77Bb5U1ABa/JC8P0u7kuOmdiQs0MYLma2Lkr3UTDz+x4GSADhFUo5Z8GLbMrSTzgOyMb0ETQIkbk4EqErPHe8SWmnbOqzSKjR6/tOgfS55lFEmbOYpgecS/4OnfB9Ur99aeHiHJ9t2UlPCv5H7WYpPru6zFVAVEuJM6kcoCeYE/bVexOg0XbTF7eBZLMz8nLTStGz+zHq0+822p7E1DE6RZujzB7yitEaPaiH6uLPeqGHj73cJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFe5dS30+WBpiSNCqiQrb4vdTA7W9SS/h4EoebVqB7g=;
 b=Or0xhRCWbt32CqzwWYePWe1287IqX39KygaOrpElYlXifmqr/72oyzt/c1svZ8Zrwywqv3alKgmp1RDxVoH3TYJ6FK+gWkXseD7tBV+irHaKj7ylNNsAmfuyAB5OTDpwHH2z9Hxdv8KqGpEyFfgZYKIPBBd0sNRRv34eN93sYI/EAuONGAvKUgobdur1VC8GavtILXi9eW8UKASdwQUK1wfvmoj4WCdz22dzwPT7yOHPMMpTBOEOSxRqizzLmLzcCpN9SagdmeLyGkMZWVjEJulNaOwo++KWt5Jr72LK4lWuBqBqAp06NHWl0yQxgUZmZOEt40x2PjnlNteoKpG2PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFe5dS30+WBpiSNCqiQrb4vdTA7W9SS/h4EoebVqB7g=;
 b=H75AC5JoTmd4cg+Z5NEbTYcwUVICAOli05XGxIW+EFWjNjsb0u62Ocra1q9RvszV1u++oq2a+fsGJxBwN3L5ORL5HpVTdPRPQ8ONql83ZF3rsCe1GRDLIVHpvPCuGdl1VgCIw0WjspHZxRlaGeux19fH2ZV/E3s/+cHQIg4D9yh0nGO/0IkciDQZEb9jeVkXlIeIm8VIyC678f8piS5j6WS9TPQuzNuhH6jPDJ3x2Fooq6favJi4Ae7pffDRpjHM0bIDW7q3tp0FE3aiPM/m6VrgWrtKk4E65fqGALpNEj0yWLRPz2wts8GEUpkkb7yd5sH+Omw2iOFpnHSmVRJ8Cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7545.eurprd04.prod.outlook.com (2603:10a6:10:200::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.24; Mon, 9 Jun
 2025 16:10:32 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 16:10:32 +0000
Date: Mon, 9 Jun 2025 12:10:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: fsl,ls1028a-reset: Drop extra "/" in
 $id
Message-ID: <aEcHcZucl4745yd1@lizhi-Precision-Tower-5810>
References: <20250607212813.747203-1-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607212813.747203-1-robh@kernel.org>
X-ClientProxiedBy: BY5PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::33) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7545:EE_
X-MS-Office365-Filtering-Correlation-Id: 37aa2f7c-04d0-4a42-26cc-08dda770292f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dD/MBkX4ATTLmxp61CwyyNY2JsDUZD+Q+zdrs7pymmjE6PCEx8CI4QmCATa7?=
 =?us-ascii?Q?oKs6jsDJYgnMpvCgo4i3m70roUqdTSwMm85TDd9gNLU8+EwcUafcEIC3bAqV?=
 =?us-ascii?Q?AYvou3b8FqIZlE+qLxBDS0IVVl6/t26N1Zw/5hCUIRcfqreAHLC4ah22QLjZ?=
 =?us-ascii?Q?RHTFw09zmQiiUfz+wRebJckFC2Uw12Lp2OQD+Z7FWOjNm9NIEUHoO05hUXdu?=
 =?us-ascii?Q?JxYYcLM94AIR2iQGmAMmDIIv1Lg3CT2+7L77e6AgScReRU05TFj3DalsLsGm?=
 =?us-ascii?Q?f2uKEyLHJbhhTLBf33CXnaTVahIsjcZb8HVF5poS7G8NKOG+flT+EV50oy/Y?=
 =?us-ascii?Q?a83KybpnZ6adwOW9onoKUmBM71dhZgdkgLDvwLbIsPzksnfKWHRuTuGpc/Hf?=
 =?us-ascii?Q?9P2yB8EST9j8jhjYfIHiyB6LW2rdzHYHISlNVHDWbCxHGnsg01OQQAKOQpX0?=
 =?us-ascii?Q?PbsfTIlaOAc8vvQlbSnxuF/+0cKeL1F8/D+aAQqAhkWCpMQlSEViAyIX4hOI?=
 =?us-ascii?Q?QIb1Uq3KfV0aDuPaHgQ+N4fGsxQhg2erXyVSLeoZefB6GDuquIVslVo841gD?=
 =?us-ascii?Q?Ee/SP5i3NxHUQb3Q0rqSeQ7jgx99pdETCTZwjDRabwFmXjWN3kLNz3NLB+fP?=
 =?us-ascii?Q?4cT3pMEXqVoWGGlPy2h6yKbUfvYCD4ugJpfZq2P6QBQe6ISJg0uPqkqH3kow?=
 =?us-ascii?Q?aPkGRGcVfU2znGQn9h8hrHGK4ghv44pMBIj/HYThoH/p8kpzyYw3NXB5WtMq?=
 =?us-ascii?Q?3eAxO+jNYQKRRPP4ntSfDIHzUycXbdxPyi2ihTYwMXpZjwQcTJtGj3hHEevS?=
 =?us-ascii?Q?sJ7N8wccBGgKiKFo6loeOq+nZYrtt9U0pjYqzIoh5NZCogo3/47PALSMSADx?=
 =?us-ascii?Q?8TkPpZ0SBlq9BLvqtmjguVG0jYfeLBX9Tb8TVjR7JlWEpDsMRflSOYjRayyN?=
 =?us-ascii?Q?ZCRKMUvy2Z7MwDpFo6QE4lWuZRwVdg8j0j9sBB2CSkJz55SeyLLhXVM/JT5O?=
 =?us-ascii?Q?SLF2epR0Anba5Yo/LJ+S15c7ow10Nsv/AKCiiGMM64Fe4AdSNOAZPnDfE9d2?=
 =?us-ascii?Q?yHbCn1l3bllkjU1xnaLExEXQKEgZbH921gMRauWDJX1+CXqHFNKraNEX/22i?=
 =?us-ascii?Q?6k7gHEZYcyeQmP8VhBf2yA4SwREABFVwE0V1XHkixklCRImcOpK2+s557o5P?=
 =?us-ascii?Q?Ued+yIWQ0ZwjJi5GN6+fm6wyWRoseqM4EXtSbNU0MVDD59633ETmSJ7P5Hx1?=
 =?us-ascii?Q?BMvwiGhG7/0VI1ciTqgfISGeCsuLzORGAbHdohQ6STisQUonVC+EKXUXF4bg?=
 =?us-ascii?Q?BdLyXvJc8nJv8j/wFrPbyFCChnEhHNtMvy0oZphyUa9gJcqjWQMyEue6WaFI?=
 =?us-ascii?Q?kGyn0e51QKmTBBM0YWd0yy3P0WXY+J+xezESe6B5CGe+xqEgWUdTm3+TltAV?=
 =?us-ascii?Q?GxJAKtk6SFyufOgPWnXlLXWdW1g6nLLu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FOI18SU8y3Z3vBTMGDgm4F5wJwbQa9mDj7fhQWwW0NcGx9kEV72pl80gHB25?=
 =?us-ascii?Q?pey5rZlOQfHiBNeyiq3vkOPNT2sEPTR+HlEPbiSyI3xtLbfM/HiwSXWUhwEg?=
 =?us-ascii?Q?3fKZxNyIwHbKJMXVBKIPE2FT6ehqtbNU9atCklsnfPiZqO8jywtqmCq3K09e?=
 =?us-ascii?Q?3O61Aze23sJocNf71AUW6H4mdejSCvU45Crs9I4Sl0NaByOiLHR4EHGxxjQD?=
 =?us-ascii?Q?S+Yt8Z7CiixS8Qy/frt4r1KporCZYp67gRIB0tnSxvLqYEjW1zetqbWmbZMF?=
 =?us-ascii?Q?gMuNxwrUDBdGNK1K/9Y9i+Q26yerAJlGMrbnwipqBYQ4VIqN3A+1j347VewH?=
 =?us-ascii?Q?qp7U01NcD8thlRmw/Haw1JXE2lOvQOJJbTvltzPoVI5oFpY70CE2vmMc98hV?=
 =?us-ascii?Q?VL0IK5u1P2XdK7C2TVOBl/m6EHAaPTxsThrQr+5Wg9HFTJWALW/c4JvjIZwm?=
 =?us-ascii?Q?XYepGLSN0QPoiEIRFbS3hS+xPqtkUUJhnXMYQ0W05g69jDsfGRK4ifZ8DVQN?=
 =?us-ascii?Q?Ne+0vQDPvOh79k9isEKXZ0uC2nTHIgjgDTPZLMfjQM6m8bP+Ml/hc5dRqd/a?=
 =?us-ascii?Q?BjxmAbhCojC+PAsQX4XGOEBSR78Vim7UCZO3jt2My2ea2Lka7r6l3q+9HOFR?=
 =?us-ascii?Q?thRkp6Jvx+qdujvdE5SELnQha2+cEIyybzWdf1l5wsECJuxxzfLhwunLpDhO?=
 =?us-ascii?Q?koMGWxm72t8XlxC0PCdWntp/ZN6IFrOXFqS9xcW/q/ZSB9R74EK1ySBCmDCx?=
 =?us-ascii?Q?hccMot3TJtmcfz/YnwGHSdIDq4PfFgzsFf8BA+9xBxCbam662zsoqKm4NY9p?=
 =?us-ascii?Q?lZ9DjwgkPrPZ5udJ4OXwdqLwgt9smrLSrSMLf0F+CUoHWxYjPSV8KcyOygVt?=
 =?us-ascii?Q?6k5bzp551JNGWN/iVD/kb5EjMg8pvfSQTMjwj0Bsm+HARAq/9KBJ5YoaNSMn?=
 =?us-ascii?Q?FVosUZn0MwAypOZKRuFXpNQBydqFVBsA/787Fxme3zuli9lgGHrI1Tr96ap+?=
 =?us-ascii?Q?OZpCh/JJgLZTquaVCuPYcN8P8n79AY06PrYCAwbSBI+LEXRpR26cpC4GVE1t?=
 =?us-ascii?Q?2pleaiOnZAtdnFdj+7aF8X59cHW+BDjcmEaFAY9mmZkruMitsuBdY4SkBRfz?=
 =?us-ascii?Q?v5fTXVSXJRiyplAHtTJAPDBA5dBh4yhWk3IbWXTfSKVGy23Rfw/bRlY4PmiX?=
 =?us-ascii?Q?eqyLLmdd1FupWw7rK0SzYhj7HSm9WuZd2iB/K1UJVY6dUuWsbeQm+4/2RhKX?=
 =?us-ascii?Q?XMGlhWLS5ltBgpcqg1vFPFfi7aPes2at3k27S3FL+Ta1xRWb7zC+OEHhN04U?=
 =?us-ascii?Q?xWdfu5mTR1wYpkmeGJXg6y0o+OPvx35J6a2JvqFeAGJ7lge3t3DB9e++9Ygd?=
 =?us-ascii?Q?OYuw2LvPbj/EePYDSklPqAFK6Wj/rtveotP59oMHZH3PwQqTG6Ymk6ZP6pf9?=
 =?us-ascii?Q?PakoquhGfIK1sA8Ey0r2wLttzGNyWn6tksvDNu9VvP1UAmliS1Xlhfgcxccy?=
 =?us-ascii?Q?AcV1xmO08QqtmTX1ql7dzSbDVYN5OyXCT6rf+w7BaC8NKA7fFpaMb2X34A97?=
 =?us-ascii?Q?XJTyDL2sZMSAQAlwUtsOrT2OPijHUxYmW3G0olE+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37aa2f7c-04d0-4a42-26cc-08dda770292f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 16:10:32.6960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ixthnq0q/HZBI1/Qwl6Me0/7WaJLvdlHstcVXeSwk8vR1A9f/Wzdi7rvWZsw2sNx27QzQwachvHZLLkuTrMFpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7545
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_091041_154472_FD589044 
X-CRM114-Status: GOOD (  14.41  )
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

On Sat, Jun 07, 2025 at 04:28:13PM -0500, Rob Herring (Arm) wrote:
> The $id value has a double "//". Drop it.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  .../devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml
> index 234089b5954d..b43df10c5ef4 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml
> +++ b/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas//soc/fsl/fsl,ls1028a-reset.yaml#
> +$id: http://devicetree.org/schemas/soc/fsl/fsl,ls1028a-reset.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>
>  title: Freescale Layerscape Reset Registers Module
> --
> 2.47.2
>

