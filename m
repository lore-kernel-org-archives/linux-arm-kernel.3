Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0E4C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 04:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcjwgzJuu4GKdW6MOzMtH4k6Gjp8Fj9ec0RGvqyijPg=; b=RQO/qzyxIty9+gm8pmqfiouXOs
	nRh9TIB8mviYmVM9bVgsg6TzhwGPEq5arLxuhMrV4SYglE6qohJvcO0a6B9KZjz/wI8Ur3Q/Q/KJJ
	tuxUoQWpk5YktAjTRVtM2Q8XnttllI23jJiqthxyTx6h/ygV0yCz4WHwOolTUScRvO8CWI5O3RXQY
	ND+tO2JIcxboM2XVkBw6ikemnUsAvTrEttZf+9i1VbcR9VTvybaaEsS0AKJhRQ30T2CnanTRkdisL
	qOkYlqnc3F2gQLXX8GhNuQl0EsEB2alkKudp6s81eY9YuRjaIWJa0W+3uKkWC0cPL6VQ2dfQSsQdC
	E+VrxWvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vim7L-00000006Q5k-2sPj;
	Thu, 22 Jan 2026 04:16:23 +0000
Received: from mail-westeuropeazon11023106.outbound.protection.outlook.com ([52.101.72.106] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vim7F-00000006Q2p-2x6U;
	Thu, 22 Jan 2026 04:16:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nm7cLDp2KaeozC+1E9n/UI8ANVCglGwmE95svz24bjdTm0TDFPF9QvueARMVJ8BVBsXvFe/3t59kS09TuiDQYT4XHEIiN0Tzc7H0yG/TrMrTf832ha2GGVt2+6WpbmMXFBV5OhjpwxvicwaH2xCPuUlB3C5xqet1Qcq6UW9ZEoFKS/vT4IvDwfwXjp1m8FKdpkOc/Uz8eLsuwAw1nmoglvHdjpEgSHVlk9g7raQcnOdxWd8s7Y+W8m/xVaf9PJBUfhS37ZVYJd5F5w8rVjHbV+1YuQ3ZZqOy8SpYlh3fgkUl80MePlHsoxo9Reww9Nfqf7m7qW3uSKUDcD0G7pDbtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcjwgzJuu4GKdW6MOzMtH4k6Gjp8Fj9ec0RGvqyijPg=;
 b=AYdLXGbbGhnN7GDzIswEu71enR3SPS7GszhEpbOqteVZRk+K1TNT85tKkAZUqOihURGWyAQy1jtQb5iHdjXui2gpI5mRec0p0d7sCMspiUZMPOt/JwmjaNqkPJjK0ZHPWcicmM/yotLoDuAHRKUVcENunDC1VudRwn+b8FfmjaTF5V07xGnZB/dSY10YB1qzyDLBEb5H8sKKg0YiwW+ZRDUNd1a0XQZ5cnQN/9BmfS0Njbu7x36aeVn+Tq9+5guis2KM3H7lKoNoo9rOo00fhyLP4ZoQzKhXje3wiAPOKVHgSYTv2SmTG2OapP4OQdz/DYRts0ssA3poZIJrMrc8Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcjwgzJuu4GKdW6MOzMtH4k6Gjp8Fj9ec0RGvqyijPg=;
 b=XKer2m7y4x8f0PBKcrTxqHRzWu1yqJkrPsbCeZjj8Hi7PTKR8xEaJL1Yf6wbueCRbRo590rdd58EPjOwbiMFHTIJi+14NvdfEpKYLz2CSDtKnVjQ1GDDKH3zdCFBMhNFwURwbakgxG9hnq+zDwm7YZ5+vnq0gx9wsMCzeF+GNQPB1YXzDeUR59mak4qHcnHQzTMe6NzrUs5pBwge9UrCJw64Sc6q087FUCUPRJd0TXDhM5Y72/Me4G15UtR2/Q1LYFRNZSuqaG7MY/Itn3TEnTITBwwl8WXdXN+7iG4DPDPp3xTN1heLU+EyieKpXABoRz5rd7ADQ8pH1uU4A2Tlfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by DBBPR08MB10771.eurprd08.prod.outlook.com (2603:10a6:10:53a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 04:16:11 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%4]) with mapi id 15.20.9520.011; Thu, 22 Jan 2026
 04:16:11 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v3 1/2] ARM: dts: airoha: en7523: add node to support spinand flashes
Date: Thu, 22 Jan 2026 07:15:58 +0300
Message-ID: <20260122041559.240864-2-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260122041559.240864-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260122041559.240864-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0017.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::7) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|DBBPR08MB10771:EE_
X-MS-Office365-Filtering-Correlation-Id: 85dcde18-57e0-471f-2873-08de596cf98c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9mvciN84Y2WAu+60YyIvpDwuj8IBv6S3JsN+AWsMvxNksI+Q/U9KrShVSY5I?=
 =?us-ascii?Q?hJ/wLDmBGcaiiZ4hpwKkUovoFmHLprUKYR/V46UH0KbVavrgoxI+xfnaHEDs?=
 =?us-ascii?Q?iR650GUlwhcqRo9G2B6/KQHcy7JwiAwj6FqT8Z/yphvytHaRakLlPoGeKduT?=
 =?us-ascii?Q?FG4pczv5ey4+tR22S0/aj4x7IUW0rr53+e+9FfFcchHExyuMZ+0z1jSd8sjj?=
 =?us-ascii?Q?Gs53LYFovofR3JQ9Crm9H/faDEpmPKqzCJlyeRlYNn5MP5zEi+61J26MxsPt?=
 =?us-ascii?Q?J+itSBk1s2I/FX2ZeFM6F2swoLigzRpLChdUzK+dyR45OncXuiUNvCc6bvlK?=
 =?us-ascii?Q?phHyRlAYZ1B6oIPUPRp0eSK9+flUzc4qFh3ECpXd+lj42EkiRqrQaGJqO9ty?=
 =?us-ascii?Q?zsHNWWq4LefDYhmeKWA8hLrnlTJCaoT/PPm9/2msaLPQvMa2Jm5vzwz1tNyX?=
 =?us-ascii?Q?9Buh2SwV5JdqTmChKaKJk+AVcnMYZVJKgOd8R7k2kpXe7SIohsz6La44s/BQ?=
 =?us-ascii?Q?NDdIGPsjm8jzYb71WMnTPE4oedOvrDqhCWyYaYGlRs3HurUL4LwcjCby2a+s?=
 =?us-ascii?Q?l4maAvE5O/1J+8ZUi/z9igQnUD5VGshZ3SevVKo1p5os+0TFCJqVMcaNTh7Q?=
 =?us-ascii?Q?8BmvG+xqN7SsV+jg7eVSTZYejYZ8wNBBbT0gGkg5kUfoc6ujU4M5Tdb5C0nd?=
 =?us-ascii?Q?9npM5EZjOeffC6DhrX7yGftZb4/bE8JVmKh2+qRXn1873puao6igqbJ24aDr?=
 =?us-ascii?Q?hhne4qF+sBrKFRAAs32TJbxTPyigWvw5FprYug+U6SMSnlfIeWdNQhMF2vh0?=
 =?us-ascii?Q?0jBw+ohX1dIjfsYDgeqy+wDdl47Rw7yzdejIMGqolzzAz3FEtiRXe7+P1Xyz?=
 =?us-ascii?Q?WGrO6otnkstSF/fTIAgv3/+2NuEPTXzsF1oFoJ+rTPFEJlSYzQgHDPCEq0S3?=
 =?us-ascii?Q?hxYLjihs7IiPT2l7yz+qk1ihfHW6MW4Y06hFR3LHNvfrQrCs8C9wo/BZPjwt?=
 =?us-ascii?Q?US/dSPpJ/V5izkd9pzO+erGuNjkZuHdgLHz8BtEsGLsu7Vwcu08OpQMYbQYk?=
 =?us-ascii?Q?cvtWZr/Wu+APYqtGqiJqq2wZletIHJgTtGsIiYNsqGuAu2xuFGav8GS9Q+Hq?=
 =?us-ascii?Q?LmhzvxNByOTcm89wrXYYl80hxjh9q8RjbQCwbLPl988KRqd06M0fzqOD6are?=
 =?us-ascii?Q?svrAkbxFr40YgjL+0OHG7Xkl2U/0IEgF4Jxb+Fk2nFasmEroJg6Ja1jCxxWe?=
 =?us-ascii?Q?ZdA/BL6EUORTG9+glRWcURyQ42HsUObpzBrKGC2/ZdKH+lL5WOHs2Us8yEIL?=
 =?us-ascii?Q?njHzbBMGy6UovvvG6Tm40AMSbBZpNdP9fMFkufCG7Fx7ymw12UVDu/+p9cSr?=
 =?us-ascii?Q?N6lwg3oc8xBJ0gooJnlHomC1UkvOcFJKO/ExVK3L2WwxiwB0YpB3VxGPuWmh?=
 =?us-ascii?Q?o9jD7qWnjsZEpN70Jko/sXxbJ7bhckXHK7We91GqEwRk8LzwOcsqnrED3Xy7?=
 =?us-ascii?Q?uOf27a7zUYk8jbzcBdnqMfa1LCWt5qxn6Uq+C9fes6seDwlwL5eHD7dNVCy7?=
 =?us-ascii?Q?5SFnlKNKdc0BF9Fbk1G0UjPZzyP06IDmMcIgPby8bJOFk3e3gKGvWpuh4C9j?=
 =?us-ascii?Q?Cc5HamHigAUZB6pUQiEisc0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/PMxK0Md4PpanGShHqAT2Fufs0Iovyv4aOO7ExWYuk5xXnSfXJMsJLN2POPK?=
 =?us-ascii?Q?A2qR1WlgCzzBTBBeVoREqSfylekgtDPjx69/71acGQGqIcA75lDIHyMlMZZP?=
 =?us-ascii?Q?IHszd7pK77b8gnTwsF7XY3WwWGZgNiWIh7KbDIWAzeD5ANY186aqI+scaOQt?=
 =?us-ascii?Q?ZLBS8WSvGFQ762xN2T782gCX40SSpuaUwH7wwb9SkpebfSrsVQL4YPjRiR8a?=
 =?us-ascii?Q?jTCTcyV31X6jGMTMJo/ibSWFQeuG7Xs87r00zxLcADXRJwgPQfRKU/KZ5bsy?=
 =?us-ascii?Q?sAeGKcIzJ8bHEhE7EtpvrWQ4LfjsTeRpFiaEHVXPIiX58yeWDIKBJe22sW6+?=
 =?us-ascii?Q?zX21asyPAf0QGlKFbB9lWjTJiWmQsRvURXISNohh5EcCEeLvYu1IJzxWaslC?=
 =?us-ascii?Q?vvq74ytq3pRd+2rGI3kyAZEZ/i9HSjhKzq2fDZzbHzLI/ZtZwEkJh5hZPC2D?=
 =?us-ascii?Q?hGaqSu0XdW/9FBVgA9mt0oIzl4ZDGfGDXQs462tVlywJTj3s0QO2+FBuulRn?=
 =?us-ascii?Q?IqNdzaqb0Unjny5yGD4p2RRvWlt2z2mRseCIaJxqW8EqWFWle+rKm6FIK5K0?=
 =?us-ascii?Q?shkizdoQTQgkGOYHjKfAhf4Wxo6dvGhwFh5Y6v8XOD2zKG7pQInWaohRQpcj?=
 =?us-ascii?Q?Wl2Ut2bQV+1sBEsY4BbaX344B4vTs7lcpFX2w3ABW3ta1zj7eFvQZWlKHChj?=
 =?us-ascii?Q?w+YlU69gdv+8WRRHDaKQTK1IdRzRBccjPi4dC2XTDnNsQxheRy836/n8hF1t?=
 =?us-ascii?Q?/KtfGH4m94IhAndkoVrhc8npCJRBkyYKlo71aWICa/yK22xR3Uoh8aJ9kzMW?=
 =?us-ascii?Q?fuvBCzUwMKbCAo6oyvrF3VAhe9cCvjqoCKDsQ8zSvYO1JP7mX5C3+SCSJUJZ?=
 =?us-ascii?Q?hBSZ+wuHz2DDzT9sLo6hCFcv34vKe6W1MYZYQWySlOPM1PDZ2fiK3EjMJBa8?=
 =?us-ascii?Q?McUNMEGXqD/jqjCOP2FPLItofU1hB3IBnekGZJjatOPvxdg/Q+g12lEeTwxd?=
 =?us-ascii?Q?sPhLFJKlO7SLAa2+ByL5JE8dFsF8gI7D3a8TJGqktYn/I4+wlsBuMXnFm53s?=
 =?us-ascii?Q?OApe/JWy4MO718Ww+J8MTIdsBYFc7cYhxcFB0LWr80mX+bfxHbN6LUUFhsrR?=
 =?us-ascii?Q?ST1phIpYAtrTPvM3+EBa0U7Pjaw6p3TEweYoBfyNJBb0rigA2r2cHfWS0nkm?=
 =?us-ascii?Q?DZsersYrsWKgbvyFh7rieS++pdwgHzdfx8FZFJu6+7F4u0Yt51ubdBzKoYz3?=
 =?us-ascii?Q?g7w4gtq+WwR55oFjdnEXW4P8UxfoIMhM726Ga16xVz8HbWWnQ3fKfLeBdkzv?=
 =?us-ascii?Q?E/JiQmhCu2LmmTNXxhdemDX/lz2ynl2ryZCyi2LXZA/aGYssecdf2+Kzt7ZU?=
 =?us-ascii?Q?MyxA30DpJi6ZGG7ZAxGAhJFuoGm5U/EltYT8RAIiw9xjetueP4k2rT8ee2BU?=
 =?us-ascii?Q?0LnIF78FWmdoCkPWOqZ++ym8Y5lyDROkduAKkdqdTZBwzn5IGWJ0TFjq9qH/?=
 =?us-ascii?Q?7WqcyDK6kLB+AySNVuM/u0B0n2m1C1ySYtWFR/Mvd+JKxk8IfFgfr5iXlDmj?=
 =?us-ascii?Q?QJJ91+0AN8soHpqDnqs6tCIhbbfiB7j8iAgapWp8Wb8OrlIRpCFhQZXd8wNG?=
 =?us-ascii?Q?1hYumHM48lLHrGiqQD+pEqeGHe3Tn7cXm16mf2sIAWjTcCLiqGxYh8voTuWV?=
 =?us-ascii?Q?2EfFXxzYRYgOmqHH8ReMCs+oA+UeBg0hadf/S4xHKYUsV6Dipi6d1IUGnvwE?=
 =?us-ascii?Q?+0FdWzKh60M6imVoKCdlXNMN2zQk6HU=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 85dcde18-57e0-471f-2873-08de596cf98c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 04:16:11.3745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vSYv7aTEbExCYZfZron06M6bq4bG2xjprNuDAKx3m0RORbmvMAF8yk17D31cld5iPGKodpIEjEW35wJMvoKCY5PsRdlODJXCt9xZbUIQII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10771
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_201617_744062_9BC9AF6F 
X-CRM114-Status: UNSURE (   9.78  )
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

Add SNAND node to enable support of attached SPI-NAND on the EN7523 SoC.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm/boot/dts/airoha/en7523.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/airoha/en7523.dtsi b/arch/arm/boot/dts/airoha/en7523.dtsi
index b523a868c4ad..31191b8d1430 100644
--- a/arch/arm/boot/dts/airoha/en7523.dtsi
+++ b/arch/arm/boot/dts/airoha/en7523.dtsi
@@ -203,4 +203,24 @@ pcie_intc1: interrupt-controller {
 			#interrupt-cells = <1>;
 		};
 	};
+
+	spi_ctrl: spi@1fa10000 {
+		compatible = "airoha,en7523-snand", "airoha,en7581-snand";
+		reg = <0x1fa10000 0x140>,
+		      <0x1fa11000 0x160>;
+
+		clocks = <&scu EN7523_CLK_SPI>;
+		clock-names = "spi";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		nand: nand@0 {
+			compatible = "spi-nand";
+			reg = <0>;
+			spi-max-frequency = <50000000>;
+			spi-tx-bus-width = <1>;
+			spi-rx-bus-width = <2>;
+		};
+	};
 };
-- 
2.51.0


