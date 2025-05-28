Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91419C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 15:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MdOS/zcoR8b4JTivCfSv2+EXLDpiH1RnQ+9LMBNffPA=; b=gJdzBs1Ob+8rxXF1z2n6wS+5gb
	5uDeGiS4+XH9wCUvKQZAbVHwtcsR8EEsh5BqVDvt5IZw8Hed/1iJE8erTx511gtMnCpQrjgNGpV+m
	sE9Z1uNSJbA1TYaojFJ+vQz/h8WN+CRWJNYP8qp5lb7uqM1WW3kFQoicI0KrMkddrGzYDCCN1Up23
	TBMErLbHIsmzIVO1BzBy6ES1jEgyfBWcUy0dbtKXySyE9BqfJzD0K1dNhR7Xhp12SJfq6gnIjrtrY
	P3rjZZ3QnlLueSThS3p+aSviXmkD99nN0zXZnPIjVryHBwBRzWyc307oILNDTHet6I1oNEZaY+NUp
	cW5H572w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKIJ3-0000000DUxJ-2Jqo;
	Wed, 28 May 2025 15:03:01 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKIED-0000000DUJV-2fQh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 14:58:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4JNvaeSzjoVLmHhs7nmY9HLtgnwmvZdqmCbKnlOmMQlQxDUK7ECNawuELQ81bMieH+afy5UwrVvAikdFirBTgfxvxSN80N+3celdg1yw3qKb5mHk580ISCxyrUdJf0Ir4p1P4WmHNRU7h/MS0/iBy+54tIznT9q/lvbDbETkMi96UCW3OKGExENsk6Byt+TtxrCpFhvN3aEr7nhsm+cK24knXUpusLzM0RHS/xfp+gaN2PmTj3ETHjUxIaRnwwtKmwjpvG8CFIuMwFQKnInEeUiJsYAbA6w7J64ZtZqNyCQrkaUCuZ+6aYcinFOenFrXommjVSZbk+di1WKLnTgSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdOS/zcoR8b4JTivCfSv2+EXLDpiH1RnQ+9LMBNffPA=;
 b=i8Oh84enCyqMizVSPpdwkQdf6kSSQHMcePWBciBsX+QbpXFxX+HZApKbqMeW6834x6KRBXo8fW1Ty4MAa0Z5bfkoF6Iwft+AutrgGFDA0g1pCLykuD9mPDXkz2PEzZZZBcjBAbV9ZyX1WV7OtaW/rBxCaxpGSJO9fRj45/EtNq0k+52d5UBLq8EYGuSjTkjH4aW7bjOlxub0KEbX8wxVp72w5f4S7fbVKrZ43gsHyafTVqD4XYpO+JSKYCLqoS60ThfGiKvQK5qh9+UjH8qLLTQyoBpV9f0k33l3xv5hvocc1LA0YW7CVxzC9D8rbweeTQMamA5Jb1ygETXF30LjtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdOS/zcoR8b4JTivCfSv2+EXLDpiH1RnQ+9LMBNffPA=;
 b=PKSJPzEx4+zAy6APKbW6MnGDk2zQ2dto1flrz2Yarkdk62MmSCugzTQArCbi0rMPX+Y0U7Y68Emzh7GbdpKmw5CIAC7JVwbP7cAEBz7BNW093JVnnSifqk+/LO5ZzIeLkuXgtkBQdsVB/oKjdNzGsEn0DXFM/6kmlf3N7SBK01i5dKtJFvQc5ZJ4M/lRHzZmmixjcHZtz+9k/a8q6Ot9L/iX2d68c8xu50FUJ0DC1PkCy9NUsalEAKQdoWe6JOFFstgPcyqD1htC+Ehqw5a5V8ULLTBzr/tJf3PEdq1wVD5UpSv2zPv3UYz5R1ZygsWYJeeGzFdE2weJ1HFpvGtPww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10103.eurprd04.prod.outlook.com (2603:10a6:800:24c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 14:57:57 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 14:57:57 +0000
Date: Wed, 28 May 2025 10:57:46 -0400
From: Frank Li <Frank.li@nxp.com>
To: John Ernberg <john.ernberg@actia.se>
Cc: Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Gaurav Jain <gaurav.jain@nxp.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 3/4] dt-bindings: crypto: fsl,sec-v4.0: Add power
 domains for iMX8QM and iMX8QXP
Message-ID: <aDckaszTLMcUdIiY@lizhi-Precision-Tower-5810>
References: <20250528144259.2603914-1-john.ernberg@actia.se>
 <20250528144259.2603914-4-john.ernberg@actia.se>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528144259.2603914-4-john.ernberg@actia.se>
X-ClientProxiedBy: SJ0PR13CA0240.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::35) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10103:EE_
X-MS-Office365-Filtering-Correlation-Id: 36f7253a-2655-4c35-adf5-08dd9df80800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Merm0J/RlBkneMNEnGKzXrUBp87qTFgFrWHD5zfFo3IQxaMoea59SJhG7eBs?=
 =?us-ascii?Q?BL1VtOjYeMz0azUPpDAJN9ZCQW7hmTZqBlAWA9NVe2QEzcnaoCeERQE4OOAU?=
 =?us-ascii?Q?5lJ1ftvPG0KJP/v8HeKWVELbxpn/ZueVZx2hTQ3TZ7OK2D99oravFo7W0MP2?=
 =?us-ascii?Q?jvmLsinwdKtB9353qHrHPf6nF1rygblIgoQvS7G2ebJUc6XuQCfbWxTWxZAS?=
 =?us-ascii?Q?1fra+qZHKQc7tQxO73jqdDSktdjAJKY0FymtDNIDTXgnM5YINZpeIGjaWkpY?=
 =?us-ascii?Q?jAh95vpGdW3VCMonPrt1n/Sz9CRw8xSwIxmhZhCVX2/XWhLusujH9Jxkm0hw?=
 =?us-ascii?Q?z2sadO0t63gJSsyy+w1xX36tetxCDyya8scIqJWuYkZ3JfKEpNm1bQZ3QyJv?=
 =?us-ascii?Q?8ml5lxgVDvLAm7r0hz/6942yGP+4LQM7t9jAsiqj6nqzMS5cpGNl8z/3SsGG?=
 =?us-ascii?Q?ky4eO/1E7fjD9WBDanmRZ/ohorC+mJXex5CZvvFIrTHv4r79NgbwMevCLnVV?=
 =?us-ascii?Q?CzDXkh9mSLKgkqg1T55YMZMeAfx7AYHQpngPg433HjXz0/LP5BhB9tCHQCos?=
 =?us-ascii?Q?YQWVYtUAkP7uTkEq6QmYyCCAUBhDjMqkif7A/e3X9Zk8gpjwF5+fQAbAty+E?=
 =?us-ascii?Q?hViRieRUMshftoRabNDmkuXJqA+eYE7M3gt1fZB92Q2N1iTRjJ2uSd8v3Byx?=
 =?us-ascii?Q?rmG0G2dTPtYgHtPLEGvAuVf9lxT+Zc4sFzNDmv52DR8OUBJq7rtLtTT8P+WQ?=
 =?us-ascii?Q?iPT0nEfqRD8ZTYaLwQy80TQWhTrD3gI/WZlg9njmtUxdXbNZk0d36zX5VucP?=
 =?us-ascii?Q?HBJPAONLOcUJYQl4cnWVzuSTTpBxnLgDWZJSRs3II1o2zI81qVHPFoeTlZ1q?=
 =?us-ascii?Q?/8L9hYl6N6l5J+8SPYv36GRfs3nvNIZhSCzq1wWFkxxBQM8GA2q5UxVE2Pbw?=
 =?us-ascii?Q?hQ4EAwnIhdw8SW0C8pDfO9SkmI6kZ9ox9ydlHe8hMvFBj8k15efSbCkuHRqB?=
 =?us-ascii?Q?xYxWMKm3r5nmSRle40dVgVPeWndiQ0JzY/yOsLxkV//NNrAR3ugVXCBhiDYk?=
 =?us-ascii?Q?25huY1JNL2Cv68bjLsay5Sc+iGLIWgM3h/4gd029ZL99wxNJ4kTeMlj5LNiv?=
 =?us-ascii?Q?cVhnV9ZRQsrXQdAZVAfWh6Sj8bB6EfPNz7FFxobhbZwD0yQT9VqKGRVTT0m9?=
 =?us-ascii?Q?NdAQB3vdwVUr9g84uQThhqThpobM9vod+mrpMZQUsmFeoW5xkow/lyH8qbtJ?=
 =?us-ascii?Q?pkpedpEetstbTwkKW4ROf/Fwbljsu/v91opxV565r9M0UefN/2uD+I0B7cm3?=
 =?us-ascii?Q?g4rdjnxZwiXR1WEPG6y53MJ2aJjB2n5+UGTzjUsGoSey9Jyt0b362m4LPUTg?=
 =?us-ascii?Q?Z08pI8z9NgdHSlJgX7QgTkC5WEH0NnyzRKOwUIvAMFZQCflWNoaXTM7GHQbF?=
 =?us-ascii?Q?Mu0V8DbwEWTr3ZeIRnhvxwBxom5ATAqJcz+KuCAzyoOZGCGKDdcEmXsIHrW3?=
 =?us-ascii?Q?lNF/0AXCdv/Xjj0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fDx/oCWBEqTfZDqvtRG3thDLAb6iG7ghER77wLHqeyjzIdr+OHO8eJzk3lB0?=
 =?us-ascii?Q?fLEkVCfCjFSZSj3t7bM6Bf/rEQWyymu6tR2MOhr9b2JY7D5w1A3KcgzVljC7?=
 =?us-ascii?Q?PQnLirJ0lqX+3brxVQijrNPrlSqhtjrwKwd/T6dLNwKhFI2ayFQOTKRrXqoW?=
 =?us-ascii?Q?8FHilhjhZOKsAtIYOeFCw2UXB/HD3x1fVcyPR6pgSDuWJZxQspdmnr1iuaXa?=
 =?us-ascii?Q?C30fzjo0dOCluUDs/sZdRN8r3St0Fqa4tH0NmcMMPIjA10CMWn49WCY3+api?=
 =?us-ascii?Q?y8Nq6eo70je4yARYl9VkT0cQFT3G61do/hGsF7USOR35iwtSbUIYAV3N9MLD?=
 =?us-ascii?Q?BPa8juAv9sDD+7o7YDHMERFuO25YWT3tOXf6RS3yAZPQZLouFQ1qJKYPtTVq?=
 =?us-ascii?Q?3el5gRro2OEUZx8NSVKJu2midhXoY4wqfqTBNOSop9BE8+BpphXNu5vDm0P8?=
 =?us-ascii?Q?L+vnhHszUdyFq+4jlzDbBmS8yArSVRykk4uGj0kFUruTsqq4WcBpwOlE52ao?=
 =?us-ascii?Q?YHvNO4H7dJPh0w3dEhrChqhlMRCI2jdGIfTe7GS0uC2OMnVNlRnN/ChRO2TZ?=
 =?us-ascii?Q?wh0WooGWxIv/2xyZT4EqPjGxOoB96vx6B9A5LFkkb3h16CPTtpFHklUNk+oG?=
 =?us-ascii?Q?mMIi0eY/f5WUBHYb/rMeKIIppQVa9VFuBcGBs9bF25smiR6LbxsyIsB9XTDM?=
 =?us-ascii?Q?UK87qMNI3IGV5UI7gKZbJTgkwEIxuxQfs1eajgdOMaC/Xj4VRISw+rCC1+2h?=
 =?us-ascii?Q?+Gj9th/YMVnhWP+3ePoJqDwlKupt1Bvpes6DYGDbZLCjAndzzMkG29hWhUXT?=
 =?us-ascii?Q?Qte6fvzDpe/u2eOs+PFjCwVj/QSjCgtNWdNq4zTirDOKnvPCCXPtVf0AVMJ9?=
 =?us-ascii?Q?zf/BeHS6TVFZavrL+o1Lrr93IVtrO0XH+Cc37uUc2/wEivEk5i4pk9DWqq72?=
 =?us-ascii?Q?60XKQN/Sd+kj4maiVbIRBcKyELsuPJX4zqiQ7FsFSE5DGQRJ+JnT0eY/fPHw?=
 =?us-ascii?Q?B4mzZk//yZoxLCxJzwOIl92Df1pltzhkXKcjX3h46gK/QKJXYYMZ6fdfykdE?=
 =?us-ascii?Q?29xF2GvjHpFqzWpTj1Ljd8YJDITp1n+U2UsipOjdp9Regnxuwb9qKqcO3FUb?=
 =?us-ascii?Q?OlvvbkzHyuPv0FwoB7o/7LT1WIdCt0HK2/XzOP/RDeMoM0pD0QytQbXIWOJM?=
 =?us-ascii?Q?hgg2PeEi4tv6VlZqDYUvSeJqKE8KQonKNDxpah6Uwey2VOzbri26uYHoRqrM?=
 =?us-ascii?Q?kETrJA29cCktWoSq6ZLTx4zrjXc28yYTw6uc553w0siD8weRLQZXR0bS65Yb?=
 =?us-ascii?Q?/4OqLjXPi730rAMwUBqobQKMLZGR6GoThi4Nt8TeieTWj0Y/17ug+PG1Xs9I?=
 =?us-ascii?Q?Qo/kqo97O9F5PHy720QYGnGXsd7/Mihoef9K3/64AHdslvae1++64UBSmdBg?=
 =?us-ascii?Q?huujAwnPapfyGvcP/kQC2v8NdCN7ORdTrITkPr7annbCFu5ufz4Sj60jl0Rb?=
 =?us-ascii?Q?SXePmMhw7oHgCzKxnlLTRHcTOq4iRW2etcksrNEBBrZc6ue9JOY+7fvSf0S4?=
 =?us-ascii?Q?yy2X9ZOl1dEDnUEabDc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36f7253a-2655-4c35-adf5-08dd9df80800
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 14:57:56.9805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 339gfDKU6L/BSd3TUNSeRUhbzFWb8IbGd4N9oJGCokXgvRSvhvwRz7wMfEXiMu9bQ/G1TRf4ZHR4Ci+xRWjvyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_075801_676870_C17ED0DC 
X-CRM114-Status: GOOD (  19.50  )
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

On Wed, May 28, 2025 at 02:43:07PM +0000, John Ernberg wrote:
> NXP SoCs like the iMX8QM, iMX8QXP or iMX8DXP use power domains for
> resource management.
>
> Allow specifying them for such SoCs.

suggest comment:

Add compatible string fsl,imx8qm-caam, and allow power-domains for it. Keep
the same restriction for others.

>
> Signed-off-by: John Ernberg <john.ernberg@actia.se>
>
> ---
>
> v3:
>  - Fix warnings discovered by Rob Herring's bot
>  - Declare the compatibles correctly (Krzysztof Kozlowski)
>
> v2:
>  - Adjust commit message (Frank Li)
>  - Only allow power-domains when compatible with imx8qm (Frank Li)
> ---
>  .../bindings/crypto/fsl,sec-v4.0.yaml         | 45 ++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml b/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml
> index 75afa441e019..a4ada0e2d97c 100644
> --- a/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml
> +++ b/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml
> @@ -46,6 +46,7 @@ properties:
>        - items:
>            - enum:
>                - fsl,imx6ul-caam
> +              - fsl,imx8qm-caam

suggest add fsl,imx8qxp-caam, fsl,imx8dxl-caam also

Frank
>                - fsl,sec-v5.0
>            - const: fsl,sec-v4.0
>        - const: fsl,sec-v4.0
> @@ -77,6 +78,9 @@ properties:
>    interrupts:
>      maxItems: 1
>
> +  power-domains:
> +    maxItems: 1
> +
>    fsl,sec-era:
>      description: Defines the 'ERA' of the SEC device.
>      $ref: /schemas/types.yaml#/definitions/uint32
> @@ -106,7 +110,9 @@ patternProperties:
>                - const: fsl,sec-v5.0-job-ring
>                - const: fsl,sec-v4.0-job-ring
>            - items:
> -              - const: fsl,sec-v5.0-job-ring
> +              - enum:
> +                - fsl,imx8qm-job-ring
> +                - fsl,sec-v5.0-job-ring
>                - const: fsl,sec-v4.0-job-ring
>            - const: fsl,sec-v4.0-job-ring
>
> @@ -116,6 +122,9 @@ patternProperties:
>        interrupts:
>          maxItems: 1
>
> +      power-domains:
> +        maxItems: 1
> +
>        fsl,liodn:
>          description:
>            Specifies the LIODN to be used in conjunction with the ppid-to-liodn
> @@ -212,6 +221,40 @@ required:
>    - reg
>    - ranges
>
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8qm-caam
> +    then:
> +      required:
> +        - power-domains
> +    else:
> +      properties:
> +        power-domains: false
> +
> +  - if:
> +      patternProperties:
> +        '^jr@[0-9a-f]+$':
> +          type: object
> +          properties:
> +            compatible:
> +              contains:
> +                const: fsl,imx8qm-job-ring
> +    then:
> +      patternProperties:
> +        '^jr@[0-9a-f]+$':
> +          type: object
> +          required:
> +            - power-domains
> +    else:
> +      patternProperties:
> +        '^jr@[0-9a-f]+$':
> +          type: object
> +          properties:
> +            power-domains: false
> +
>  additionalProperties: false
>
>  examples:
> --
> 2.49.0

