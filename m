Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B52ACA101C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+Z/7yMBxQb40jBAHsvE8vNdDAOSYkl1IRJRqIqtSLw=; b=SJ2/ltoLDfprDgIL7w583Qmnwl
	DGQGkz7wOqZkxWBKjG73TFYBlgAPhVWqN2C9bxf1R3mjuAdwABNy2XjSDhauPLZIu4hzgSuMQMhYh
	TbH/kE5Gqf+QiJ9u9cu02DnLtMbylGODLxuplQjiz7lyMIOUoXGJroHixRqQZF5NmXsqv1z0287gt
	sZWgGy/KThEasN9jgSo1E0u81WHsxCyeJXONk/TekbnmuoL0HpSCAwHjPG4Tj0GxwPJrJm7ipJGNl
	24vWHZjbwEMsJVHUw5RQ9xT/su/1r8eF3ocFJzslW7AmL+7DKQ3N9kPhOOyvKuYDZuy+fhicCDs4I
	IqTM4Y7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM6E-0000000G5AK-3fBL;
	Fri, 05 Sep 2025 02:22:50 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuICr-0000000En5s-1j11
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 22:13:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U16LalbQiSoozKN5/vj6tO6dkF4pYRm5F7In4IDiQMDAhTwiUG1T/5r7pVBmYkEOMTy7++x3cpqRu3ULgTjGzCa30IrMcKIu8ZSyWliBEnqTruhrgpsl+wWIuWP1ug+/RF0+Yu4FkeCvYdZechmf7tVxsLD03jxSqvi5v1TxoxA/l/kRLXcS28KQCBbvDt2AVeHp4qI50atO/01BoXaPU0A9RQthA46decRSlMPYVH219kWuLyA9bErwLisZFJry7ysuAQveRmQcAntHFK155BBWoJ66aFtF40kdUA/S3gnueD6dx8ooKKXzj1UZ2rePjIHcHP4vA7vg4hxkbkY0TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+Z/7yMBxQb40jBAHsvE8vNdDAOSYkl1IRJRqIqtSLw=;
 b=NORQgfrT59m8jfPVDvWv4UTLRqd6X2UQLxtuBy7SkuVVWg7elEcGUK8SNAAFcZzpqRuyBW6MWkilGcQFEdt8UZe21vItgqeE/U6Gv4K7C1+zMAZKPg2iMXfBuBTU+SsxjEk6xINV2cQNxAlrY7cqYw7BcrFSw/2jtT19zSi+oYJoF4V2epIbNK+W8tMquLKjEapVgwteNTgXderejnrVXZYQdgg+T4hMolSwwDJHITObRSG7csESEkubfK4+6jg4p3XT/g4tMf6AbYDHbWa7WT5QCplWg1VtTsahvjqiQAAKbVGlX/Qk6TxH9I97AzpiNdq7AR46E5RTGyxA5WdO6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+Z/7yMBxQb40jBAHsvE8vNdDAOSYkl1IRJRqIqtSLw=;
 b=PdVEKevUf1layMOZ2aZBll0QsIxi0M1zAe977ENA7qU8PgBhcPaf/wCj1b5xZRjKc6qWiWsQ32MCIKa1+JRwxT/wNwgW6tWKfjYEn9lpxGh9nZHtHFOlw8DjSpGrpjBJtl23pM26REvfu7B05vLF2utf5gozkGHTGVBQAK9WcAFXhnEUi6em+R0/pgjmlGmOHv+cWVsgTaMnA8ix2a+3hRDEpUcfh2PdeqWO2kc4ceN4jPJjQoTh73cVB6FXVq51lu54ZHD5HtRpBKxw42Vfr8y+CiIHW2lyV7hfhGYs1AUoDqA2d1gxjh4LnkJjnY9L0fc/k75YaunJqcKzlm9x7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB8989.eurprd04.prod.outlook.com (2603:10a6:102:20c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Thu, 4 Sep
 2025 22:13:17 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9094.015; Thu, 4 Sep 2025
 22:13:17 +0000
Date: Thu, 4 Sep 2025 18:13:11 -0400
From: Frank Li <Frank.li@nxp.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/7] ARM: dts: lpc32xx: a number of dt binding clean-ups
Message-ID: <aLoO99v9aJD5aU9w@lizhi-Precision-Tower-5810>
References: <20250904184647.397104-1-vz@mleia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904184647.397104-1-vz@mleia.com>
X-ClientProxiedBy: PH8PR02CA0053.namprd02.prod.outlook.com
 (2603:10b6:510:2da::24) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB8989:EE_
X-MS-Office365-Filtering-Correlation-Id: 489f0154-c7fd-4b42-3a06-08ddec003fcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Znukv1IkEaGQNX0SvryiU3/zr+O89ZDPIud2fFkCIwYZuZ1oe3Y40jQy3acu?=
 =?us-ascii?Q?kvuS+APbNzWd+bzjOcHtCTZ/aZ8EnDVnbOguNRMSAqCOxmjTHrxcTL9v62hf?=
 =?us-ascii?Q?PyqskSo1SSjRfeUlKlVV7YilztfcN6XQ33blVGwDcR/kuWipX5yPRV/7fj4B?=
 =?us-ascii?Q?R3YJ5aRcTr1Rls0hPeFkJIx4rscEehhaifrMp9uumamM69ug7D8TxCeTBuzi?=
 =?us-ascii?Q?aqfmmp9LJnJugBb2t+UOXsOu1zcQ6qKv2h7eiPWjIuK9kLYyORD1Mniqf87+?=
 =?us-ascii?Q?pCLZzRcb6ppd8DxjRFA5UKMTY9tfElJIb2u/HO67/WieRW0pEj7CacSuG64m?=
 =?us-ascii?Q?g3xLb9QKIofmMjkKiqdWa6yzslAS36RZZcBR4NgflPrA1nFG+cObmfiTtN/f?=
 =?us-ascii?Q?eYxg9KKVTJQeqMUgBHzKAKLu8s/tzqjb3e4bRODFQR4SK9OP6cxH60thbCYt?=
 =?us-ascii?Q?97ry3NUHHuBmpMBwPVCPkEH2JT2NmKJDJ3EHbTEnt6ZwTY1n23KcjNhr+IwR?=
 =?us-ascii?Q?gUUAU+kasRcHkNSPnbYJ4CHORSIl9IFoYvuQ0g3at8wdTo+boCJEEQQbBt/N?=
 =?us-ascii?Q?hbFRLunnGYQosJQMeh+GjK4kujQKvJbK5xy3Glbc2jrmO9xkuXSRV5jvtGWV?=
 =?us-ascii?Q?kyn6qTnvHyIGLXiulGpcLNNDe76Byv6KyLSXnDlUWsirZLNNNSjLR0uGQ4qZ?=
 =?us-ascii?Q?zKu5l6g9dpeQXHhiozfyhNRE8u+CnO1gH+8trDR1fB/kK4YSyuqYx5jBULhG?=
 =?us-ascii?Q?g1wQXCA7+yquAq2dGIDmEpcBM8sBIESzQcPUAJcSfSOiA9ruaKxuSj655Czl?=
 =?us-ascii?Q?mEzqJboaZlyXxIrIsFqFOGGf+LZfRq/R1NDv2cczAXJOQc2C/OiKzv2UtCPC?=
 =?us-ascii?Q?cWcKSAbzx8rsfUNXlxwmQuUEwRWgTyK+TS4+PMMBzpLfVV/fRmTCwmjXGF29?=
 =?us-ascii?Q?ml1ZmPYuL7yIfbdHBi8iUH6Z9DKEcj2TEaBnwpr7KduQsNUrRHu3hX4QTjP3?=
 =?us-ascii?Q?2zF9xst3pFfxGU7kNR0hPY6orb3uuP/mN1YFlS49o/QtCUPRvNj625GOTlWF?=
 =?us-ascii?Q?n+vuapKakTKnFcsyzTnD46AReltsjJaFWfzqfOpUAZSQBMG7AJrzV8EzoqaT?=
 =?us-ascii?Q?kHF9+c6cG670Do6Ck8jQMQMRIcaFLIHzd/Xo/XNrVOKJicva7E7KbxHF0U4O?=
 =?us-ascii?Q?hXBd+OCa0MAzn+xA2vvxPLpK7yNkpO2uj0qAGs9aoNmmJ9eKB0Wqnx9iMleO?=
 =?us-ascii?Q?MUR4W89gZ7LC5RyJ0J0XFsXwUl6oJHTCZsewMiUMM84+EcJcurzi3jLllxB8?=
 =?us-ascii?Q?Y3N8uJVdxQpzfk9YsWrXFL+LXR6gg4jZGNUU411jW/R8/Bk/n/ftyXL/LL3p?=
 =?us-ascii?Q?n9yJzTqRSdLvydByYd/6TKNk1zjM1d5QZxSRiq+Bkz/7G1B/bKzk1+CvL6BW?=
 =?us-ascii?Q?CX+SM514SzsYZ7MvMoNU9VlsNY0xAGjYhUn0J/LFzrpVI6SSXTegIQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hqr6ncssIpR8qMn6PJ26/vPVFhdusNISnvQVjZJ+vMKUJarz1JUvuV4MJdjC?=
 =?us-ascii?Q?LWtwWKBmnxmFB20GwcDwfWB0rIhv6piIXoIB9Fk+Y+RySdfz7dCz4COQgVu0?=
 =?us-ascii?Q?eKb4zjNcuuSbaHEXtAv1lKIQcAjSIE8jlaXngcMC4jSURHJkGGqGY9YciAKn?=
 =?us-ascii?Q?8eECehB7/psMpiQKGOrKNruB51qKqE3n2PF7rhC0zC/K0vei9n7hYEoU0upP?=
 =?us-ascii?Q?FTIGxVCBC1LZCdolaulXe32AecleuILfmIrkWmEZhc0+bABiS7kweq0fkBUC?=
 =?us-ascii?Q?bhOmw82wLQJYKb1DX7eKMSHkZMFBAyLo9iYDP189e07TUcQf0KN/wipuV38h?=
 =?us-ascii?Q?5TpYKzwxw6cdmwUKBfoXAs+ANvhsRpWJLIdtvAD36YrvTF3j9TTQe9hHG4Us?=
 =?us-ascii?Q?jC7e+1t4K4FvxchxjetIq4zJPtrT+It3KyWLjORiGA5BuYZl6c8jPDLK3VkW?=
 =?us-ascii?Q?ptVrmmwM61Q05F/V+rQ/w6fkJQ7xm5xVY8tl3KPDmwRhUIe6oDiVKrkFcSBi?=
 =?us-ascii?Q?6x86eyC327XRfaIsfqwzULx/h0lqX3KYn8FZGwdsd1dxP2tFCeXqc2cIpTjV?=
 =?us-ascii?Q?mtk4lXyTqaROYT0EV2fWxQEXYACEkBtyvPvRJXHPvNPFk4sPDhKc9J842+NR?=
 =?us-ascii?Q?12LZufO7xaU1ehy88+iWsbfbjdxomm55Q4hRTMUypO0jK8WVxvTifSbIt2/J?=
 =?us-ascii?Q?r+1PdzoKfUa8zhmPGBByTflIXnq9wqZBzX+idNF9RgTTiR+jjuT04ZDxvGXV?=
 =?us-ascii?Q?I0D/NBQf9Q+98FQUOADmy/0GkMeQabCpCD0ZbgAx5JBCubk8XW+pCJzNNBXj?=
 =?us-ascii?Q?YxGQ3aA2Ug37bozoNblAsFen22iabBthzbrnySs99q734hCXtOhRacjdwHKE?=
 =?us-ascii?Q?i+rV52jo9CB/dlVUqAo/h4McyFRrk3BF/1ThHO4U83vBpWCj7jLesl/Vy2ip?=
 =?us-ascii?Q?Bzzlmu4vcLZz06DJK5L9PZs5B+gR1QK/oALcMsBIF2HGRTD6L6fKOw4Yjqgd?=
 =?us-ascii?Q?0suVsAXyV0EfGfv0+CR/MNJcQD2/pR5dF7633XerHEjzLtrQs8DbYlDM+Ht4?=
 =?us-ascii?Q?tNsDdzzOpWs/+elpfief5jnD0O70n3jvD8ErpkTZCwi8ahLSVfK1I2DnZhV5?=
 =?us-ascii?Q?9kLgt4gKi8N15bodxFdF4KwJPyW4PmivUAEd13lRSz0jVX0N1SAiaJMuk8gO?=
 =?us-ascii?Q?/PIQ1WGYRONBM7cSK9mrYmZDpPHV8GC3/IT2jwLjkaJ1MBeV/ITnlx+8D0Od?=
 =?us-ascii?Q?VtmCMCeChb915jHtK/VTRDd0xnwzTI9GFWfDLgF6G/i3V3HeFD8wSaHFfhiO?=
 =?us-ascii?Q?zk72LhwXiEeN13dLsnMWIWFWNdaPYGgCGDNdgsnZLNPj5MbXFsSOi/Xzzbvi?=
 =?us-ascii?Q?Ar0OP097YQBO9d2P7igRI7Wm6FWpStpAzzsAxMRbqu6LhrkQ8HBoq626mxl1?=
 =?us-ascii?Q?PAHyrw9OjCBkGIhjeiE1I9MJ0tQYJhL1zeWlW2j08gstthSn2xlubHkZ3KY0?=
 =?us-ascii?Q?VJeywI3iDMIbOlM0sS5d2uQroxsIhMUa5LS2hTIqt+SxEMnT32DmV09jV2me?=
 =?us-ascii?Q?++Dryq2btJfjwCsgQ+3zINzOnlzri1vXL95I6Z3Z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 489f0154-c7fd-4b42-3a06-08ddec003fcb
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 22:13:17.5348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lozTmzO8d2f6XwNDXC7q9n4WDlB1Qa4ZS7/FKfMf1UrfxMvUkYRiHKxOD4uv7DTDbLOJW2owRbR3u+8Y2zBPUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8989
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_151325_468876_4B732829 
X-CRM114-Status: GOOD (  12.43  )
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

On Thu, Sep 04, 2025 at 09:46:40PM +0300, Vladimir Zapolskiy wrote:
> The short series contains a number of trivial clean-ups in a shared
> lpc32xx.dtsi file utilized by all NXP LPC32xx powered boards.
>
> Vladimir Zapolskiy (7):
>   dt-bindings: arm: nxp: lpc: Assign myself as maintainer of NXP LPC32xx platforms
>   ARM: dts: lpc32xx: Set motor PWM #pwm-cells property value to 3 cells
>   ARM: dts: lpc32xx: Correct motor PWM device tree node name
>   ARM: dts: lpc32xx: Correct SD/MMC controller device node name
>   ARM: dts: lpc32xx: Specify a precise version of the SD/MMC controller IP
>   ARM: dts: lpc32xx: Specify #dma-cells property of PL080 DMA controller
>   ARM: dts: lpc32xx: Correct PL080 DMA controller device node name
>
>  .../devicetree/bindings/arm/nxp/lpc32xx.yaml          |  2 +-
>  arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi                | 11 ++++++-----
>  2 files changed, 7 insertions(+), 6 deletions(-)

For the whole serial.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> --
> 2.49.0
>

