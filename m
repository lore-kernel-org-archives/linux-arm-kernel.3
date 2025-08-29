Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07051CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 18:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3gXZ7lsIraGy1WszJGwL+w6/y9DQE0xhXqjtBzm/pw=; b=R2GZBlUsOBrgB9LpSubfu9Q9pH
	EYYz13IBc2yEcctYm+4ra4A02W6Snbg2Aga8eP9Gd8iXWXEkEVvoLAljfTCod9109+aTqEhuGnp9y
	qDObYJKL7TpPbsDWQSyPa2drWCfkNsLK4cHp8uFjRpzBMr86vu+dMZkmpFAGsfV3ph07OyuRJK5sg
	IQwCfP62o3OfVjD1cGBLOEg3KCmX1HmhrXh5pryWz5UthxVn7+m8vkXdlG9S6SZgKMwOETZQrY+n/
	prdJmC2bn/yBqhwrnDYReiWAYufxbxw8seYe5LcA/urRt/7vLYFI+E3OFu3UUH4gedxRs55su+3aA
	7ItH92HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us3ht-00000006ciC-33e7;
	Fri, 29 Aug 2025 18:20:13 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us07G-000000061tH-164D;
	Fri, 29 Aug 2025 14:30:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPvw9WmQ8732RPJXn/AQCYmzjBNSOk+hImj9Mv1QzBr5cgfuRrFDYKaDFHa2KHv8EeNvJQghqw6GqrHZzGHKzW5Qza7wS3WBVoTYWtKqrktjoXV7NVM6MHFoms7VXp8sh7V5iRjwYqcpahqCs2e54U6VhmTt/c0cHBI35xPl/Sy5roJUA/6E5Hkct1i+D8glx0vepXCChSz/054v9p6i6zUJArfw4OEm7tK3rGfRvlyWW4C4FtsWnZczoU438ES8+pSyUCeIrAukRjovPMUsHRTdOPA1iplyty3LXIvilMJhtAC4AZ9rMgAAzynRb37ZWF9KKHgKmgl0caBzQRInYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3gXZ7lsIraGy1WszJGwL+w6/y9DQE0xhXqjtBzm/pw=;
 b=BB+WkGZtqXfZVhO9D2NoxQycDdxFKOe8qhO0bHJNY6qWqEa4TjxSdRW1yK1gCFKKFcolsLNi1goNvKIi1yWfA/ZrSNG7cw4NRDKVXkJU1/tjIf+C4UEE/UGqQXBckYR7XaRe83FgTpW77LY8n2xhXckxSSKT0sX7F2skMT4Pi9FQWuX9MGxEjHPNrfcL7tw5olY0N9/xyyEYhGqx3aV6u72QlLZOb2pDIXeVq2RIpwZaaakCki6uIBhSjCIX+RQcdkEFMaPzzr4fdOCNWh0aijPTaq7cINLZFpcH6VItvc3zfybJtCNs9J7o4yzdtaHgyrkKM2HG7LubbrgnN9RP3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3gXZ7lsIraGy1WszJGwL+w6/y9DQE0xhXqjtBzm/pw=;
 b=DB0wTz5WM952OM2DIF6iwRC9VZW8oBFr4NnR/LhROexp24M6cxLNnN+YTwD8dgPdUKTFZEkERFExmeAwEUE8eTOV1NXvYp2J4+/CK2MynACbfUL/sXi1iM8M0ZjOOYO9NIUX24Bp/gSq06JD9wvSApkvCOqecg0xXvKSuSmUchda+NOeAXPz781Sh5mVgeZ/aYjkOst3PLiA7ugbWLWk6KxE2GncUAEUHjWDjlygGvVIsS7fjm3S3999IbF8tVxpLRGTg4llu/Wv3wUlTtYfM9ptljm84xiGbRV+jRXy25rdEbfT7jwzzHvWcYrr3v3jGXYhV1NORS2S9SMUIhBtGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AS8PR04MB8660.eurprd04.prod.outlook.com (2603:10a6:20b:42b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.14; Fri, 29 Aug
 2025 14:30:02 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%5]) with mapi id 15.20.9052.014; Fri, 29 Aug 2025
 14:30:02 +0000
Date: Fri, 29 Aug 2025 10:29:53 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
	linux-can@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/6] dt-bindings: phy: ti,tcan104x-can: Document NXP
 TJA105X/1048
Message-ID: <aLG5YQvw1rVRc//I@lizhi-Precision-Tower-5810>
References: <20250829-can-v3-0-3b2f34094f59@nxp.com>
 <20250829-can-v3-1-3b2f34094f59@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829-can-v3-1-3b2f34094f59@nxp.com>
X-ClientProxiedBy: PH7P221CA0065.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::31) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AS8PR04MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: cb61d927-d6be-4645-c5c0-08dde7088a34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|366016|7416014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mQX2mxw1FP6yx878sHU9U7Fc74O4c476nYKu3ytwy2OLxFuhrEPXnF/hSLG2?=
 =?us-ascii?Q?Sy+rPUxejNGevdWmx1NJ4WLpT4xOSw4tr2VHLG4PamrfwY+Bs6vXpHJU3INL?=
 =?us-ascii?Q?DpuMvBzB/mpoxPgKSZKfRvbaHqMaJDPJtGnj2vuL3E3F4dnOWQq7MroyVcwE?=
 =?us-ascii?Q?GxhU2OGgkQ1VEElauibspZiKoumoVETaBbXDV5zzKEhXxoo7w/b2sTFdspVk?=
 =?us-ascii?Q?xWgUdJmHyBVOmTuxBsR93LREQFDZoZVKO7yHgiHEorZTHl0OoL1oY5D14H0h?=
 =?us-ascii?Q?ihgA9G4ZWK3Cis7S937OowzVC3CKa8JZh/XVez46SKPgyzEWsDY4rU9CuQOn?=
 =?us-ascii?Q?nlyvQ7nLSXnPZsMggCLvGcZEd49Gr1Bkf8sgrZT0vnIn0DlJ9B+fOwEc/SFV?=
 =?us-ascii?Q?2pH6y2Vto4ctYiJgLh3/U6CrNgoI5YvaAeCkFkLbHAmq9cy0m7YaGHdiiogF?=
 =?us-ascii?Q?rG40THuL+7dDrM5ETE0+D+eWAuH+cvpg5fc6BCEZjEA/0BhvEUB9pWUknJ1h?=
 =?us-ascii?Q?du5hKZzCfXLGIhi/WEX4HRTepE+wWK1LFpjHUuk2seHrZwff5tdDiQONa1Yu?=
 =?us-ascii?Q?AF6bu7BgC3Go2Zz1EOb5/oHdr03QuGIOv3ZvozXtgOyDEiQgvUa5MGeJAu4m?=
 =?us-ascii?Q?Kot9goLQrf0+EJFbwYa/q8Iwmb0lLW3r1V2D1JUzyPAHbV5xJ5LqbRHyByQp?=
 =?us-ascii?Q?g0zb9+YN0WNNNgd+Cs8yI/AN3yzLzor1MOD98gv8dS83RowcfsQf5SRW4Ble?=
 =?us-ascii?Q?V29IH93JIkJbVhr1HNArQN3zYvyRwmtIzMltlwhddUZDCyi2OhmbRv4JV8Ag?=
 =?us-ascii?Q?woxBAiRqAaGGUtdA4hc0HRFn+S5kY+VNTqv/4XMnpoWl3VA9Kb9HLmkRt3q4?=
 =?us-ascii?Q?2Hx+6r/zf5o9RjH6mXsXVibAf1IRdSObX06Z4c8Mrq01czCDkVwK/rGv6Kbi?=
 =?us-ascii?Q?gLgnmu+5g7bML3m6TUcaSKC1Ke9ip9jp6whZ/s3inAVvn7fig2KgQfIBMYu9?=
 =?us-ascii?Q?M+fxdWCa/P4it2CcrJYxeNIhEZKjA6jKPjGLylDBkFG75tcMnsZhRF4ZuHKj?=
 =?us-ascii?Q?qjgnk+IiFLpFIVN7++WLjQoJapuVu7TaL9NkZlnVwqti4/Yf/CRrLQFpvWVM?=
 =?us-ascii?Q?KDHUB/RDOZTqz/1j9NO6nYxQoM8vo3H9k20v1aDdI+zhobU1i9u6HcVFvBx0?=
 =?us-ascii?Q?+7hdfa2vC/N4zmL0+M+MxdC5/OY+LdilRfr+5M8ZuHMZUmO8+ZoiuJbMx8as?=
 =?us-ascii?Q?0AcyLfTN+dMphphQIFhC2/xXs+YIjTWpACJrBS8xyGXzOECwk8/RGiV0lUOJ?=
 =?us-ascii?Q?qhDKBqwyZg1Lo2Xgq2VtNa/pjtMTdlv2tm5f0KCOl3IUYrcD8t7rGLqg51ru?=
 =?us-ascii?Q?6gAYlFSD83nCnfjkxwcnXIj9TVdgYHT3xb7s82iNQg6+TPPNuDJ3NidH7uVr?=
 =?us-ascii?Q?hFntJVxX1yqCr6TrXnMJzOhnSx19q093dTjk2NN44GUoAJ6EugpdjA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(7416014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sSmAfqZmLWi+PPEOS6d4v0DQI5EsJiOhl/kyP6IHb5Ki+TOaP2dst2W2g/74?=
 =?us-ascii?Q?LRTYUJlKDi22/TSCgdblAlTkfX5/L1LEHVH2TEuPwQJl5NheLFdb58d9X9+I?=
 =?us-ascii?Q?QiKAFQDJ0r8i+/nH8dz9JJC5dBJuecP0upgZQZg+bq2JGgHhQLlEaiWNP9wg?=
 =?us-ascii?Q?YhLV7xpr2sVWe5rLfiLjz8HK3qQMvJlIPFgouPwYdxPmS5cH0oe70m74qDSf?=
 =?us-ascii?Q?SxT/wXkafrtoc7UWcJQRXNQdGhVzJWWSqWsw6sH70WwDxD1Sskg9p8SEAIiv?=
 =?us-ascii?Q?yHUgaPnaQFO7eUOon5ezbjXGvpmDZasVacoBljw5O5ccvv+iYPOCo2ZE+5Nq?=
 =?us-ascii?Q?N3zJrNfQ52+z6hn6Djd2io0z/bRkhHaxbdUuckKvk+9nOTP/M43Kio0g+X2j?=
 =?us-ascii?Q?8UDklJC0gV4yNAe54o0f+i1Cp/fC9U+m4jRnavT2yOJVyUrAiNTZUZ7NU8fI?=
 =?us-ascii?Q?eTGJW8T8dPR/2FsFPzRN7LzzgqWqDck01GtcvKIbbHq67+XzY+Yk7/8Eezp2?=
 =?us-ascii?Q?Djv+0XoJ7XWsP6rQwcYdnk1oXIC9DTXYHm4uj1lhiIpCCYh+iyp5gCOTMc8w?=
 =?us-ascii?Q?Z5gPTURYSAMelAb5a2EeoBG4UjrpBZbILD6MtfvdghYTpJkqlvY9RjiLSFkm?=
 =?us-ascii?Q?zstBYZa8CTRhgsE4Tb1TuHffZ0Vd/SIaTRV562gei6GZQu/Tv82w7bYuKo3/?=
 =?us-ascii?Q?vRKJvFlQ9oUNdnLgf8iwWW76/9zA0kH+945kd4c3WOcktsRGlZXYR+Eb2tuC?=
 =?us-ascii?Q?YInQlSSXbtFyGedw9r6dSoD0yPZukv7J0/gik6AHcgs8TSf2OVQW5HGdVBiu?=
 =?us-ascii?Q?IEqAz0wHLeSBYVsV1RlIc/aDotQXzO9AD7KR4AsjmdUNJSdldo30ULQH4Cr1?=
 =?us-ascii?Q?UZXC3D5+boUyQs7mATPT3O/C8o/Z1qwIeWerdfMQBr7DIQbU6L9+9LeqHPe8?=
 =?us-ascii?Q?vpS/hIA9jokjzsQeXRCGVAOWHri1pJkG+nyw0MzY7to4NctwZ7OxFeFRgfYC?=
 =?us-ascii?Q?ObnO83atfdy9BRF9eA1Hphj+zIkoTR32bVwtDUooPH0XDBygG5Q1ID+ruJ30?=
 =?us-ascii?Q?FCwPa7W4ZURk9ydzOlr7qnd5v4Io+yPNok716UX/5P/YgeyIPi8AZYV5rosg?=
 =?us-ascii?Q?aOo/43eUcrqvM1QQ32py1FnwVGL70IQaHZjdjUWivQ1bkITWGoXiWW8kK4tQ?=
 =?us-ascii?Q?Ej2aCBMmtCxMF+kZoqRXdWhDSVYzGoRlIltRz0BNfsplp7HkQ4hCa91oBupm?=
 =?us-ascii?Q?xTG5/M3zGxwpatPIDGRWVXLiYCbb7sQ2tTQmp1fkQUnaHsAu3Pesr1z3sZMF?=
 =?us-ascii?Q?9FZrVsN4KLV3syaJNs0XpRjhxXB1G1A4rDP53RYTZp4/lXx21SDpVIzV4gz+?=
 =?us-ascii?Q?UGGH9K43zEcsz6j9R/ATwk0asgcBQ2cyPibJoojG7fdQWdCzIMF6hbitRpF6?=
 =?us-ascii?Q?aa3HcEpoOk7tzMY1ynjtgEpYsqvngEJynA5wET3GMyG/TnphEJ++dsywd6nn?=
 =?us-ascii?Q?bIl1LTEHSPf4qRhVGnEfQbAejUlp4kMRL/IybyR91wQdaUheblDmKT2TFa9E?=
 =?us-ascii?Q?5Qw8JdxEIAxryRGUKKsQ9SV8H4I/geRWdBRlNZoR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb61d927-d6be-4645-c5c0-08dde7088a34
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 14:30:02.3342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4SL6OF3sI/POnGTij0RF6c998yMk/dzf2BcMrL8rlKadtjpUOVEGAYOoFpyCOCLm7asu4ZhahYlbYZeBSvKzrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8660
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_073010_308174_125F4D0F 
X-CRM114-Status: GOOD (  16.07  )
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

On Fri, Aug 29, 2025 at 03:08:56PM +0800, Peng Fan wrote:
> The TJA105[1,7] is a high-speed CAN transceiver which is a pin-compatible
> alternative for TI TCAN1043 with sleep mode supported, and has a compatible
> programming model, therefore use ti,tcan1043 as fallback compatible.
>
> The TJA1048 is a dual high-speed CAN transceiver with sleep mode supported.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/phy/ti,tcan104x-can.yaml   | 32 ++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> index 4a8c3829d85d3c4a4963750d03567c1c345beb91..a225540545301e443e3460b933effbad48786597 100644
> --- a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> +++ b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> @@ -19,18 +19,25 @@ properties:
>            - enum:
>                - microchip,ata6561
>            - const: ti,tcan1042
> +      - items:
> +          - enum:
> +              - nxp,tja1051
> +              - nxp,tja1057
> +          - const: ti,tcan1043
>        - enum:
>            - ti,tcan1042
>            - ti,tcan1043
> +          - nxp,tja1048
>            - nxp,tjr1443
>
>    '#phy-cells':
> -    const: 0
> +    enum: [0, 1]
>
>    standby-gpios:
>      description:
>        gpio node to toggle standby signal on transceiver
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
>
>    enable-gpios:
>      description:
> @@ -53,6 +60,27 @@ required:
>    - compatible
>    - '#phy-cells'
>
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nxp,tja1048
> +    then:
> +      properties:
> +        '#phy-cells':
> +          const: 1
> +        standby-gpios:
> +          minItems: 2
> +          maxItems: 2

maxItems already 2 at top.

> +    else:
> +      properties:
> +        '#phy-cells':
> +          const: 0
> +        standby-gpios:
> +          minItems: 1

minItems already 1 at top

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> +          maxItems: 1
> +
>  additionalProperties: false
>
>  examples:
>
> --
> 2.37.1
>

