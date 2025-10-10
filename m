Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDFFCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 03:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pOCfiWomdoIp/HBa3ZxGqu6+NC+604MYExFFxc/vSzE=; b=akpO/ZDcAjvhdn7QhOvjfiYgiR
	K0t8aXW396gkCxMjJJwRJfZBGmI5n5Wi7iMK7g9AzLpgAB9fv/7mSJmzFTAT+U63NGj5p3GN9G47n
	awLvJUWlc4QDhBEWrHkKTvXg5uAysKwdyV1Yb3N8klP9HV7BnxvLNkMnxHD/RpFwEZL8tkIEVsxxy
	PshYPPNAU59KKnCK2L9rqw7JTOqmxW35QyP23o0w88HBzcnW2MirZPj1ZNcRIL/g0S72MMEqKxVST
	Mwp0n2oHTZ9aT/EkjMgiC8EBUKA/YfN/iLJj3Nr/fPJSEBIYUM1RvdZzUTs2C/bmDlWR381udRfBx
	4UScYZKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v73sH-00000007aKY-3QyC;
	Fri, 10 Oct 2025 03:32:57 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v73rd-00000007ZGa-3DgW;
	Fri, 10 Oct 2025 03:32:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HC+N4rwcvwRTX1ImwWOXjcYXY21x57h3V0jUppF9+6zUYLoIZWHcRt6KltQSD7X4gNzzQXOC97or3+fmM/VczTZehrUbdd3uU+KWGJNrcHS4CLZ0Sv4fSaDTyTi0DYcAcizRlyEspCiq4+jkVfYmCph2dvX6Z9R0DnmZUt372wBMklgx4XZRN7J8mUGyc66iheHCl7h5duzHwvHxOzb6q4eAHjDC7q2RSKc48dX38Qjo67Xef8Yd3ERTtySBTtC8yU2/8fNpLb0mUpbbyXbUbdn4Oh/GbvOMIeS5q7pWmyQ5ZknGnHSdUvbJaz1lxN/d+OUO1ZaM9vdB/GLiu5lGig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pOCfiWomdoIp/HBa3ZxGqu6+NC+604MYExFFxc/vSzE=;
 b=WFy8YiqCa00oD8LTqmXGJ8cVZyDiM1NBWiYHJORL+03nGmc0VvQid7cQpihsOEFZe2Z88T0Sz7RBhGBOZPvVtk77xGYV3mnanjixPZTE+kBxGBLb5RB3cUyuT4reMT1gA3AluefjqxZih5ghKUEpgHt9d8QdVz4v6lwaG3nWqbcqQGjRDCvipLYsTVw1Gj0nXTp0D3FQVqEv1amCxZ73lZsrBS8+WCseQgSoRCzh8f2J8Ksx6Gbh/a8QQuezdrQivrVZVbv7f5KpsgUSii12QpRR1+Jl5M2jFL5el1XqUEPuj7dcTEadb57OJ4kirWwekCsDEYf14ibD+XRm1HG5zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOCfiWomdoIp/HBa3ZxGqu6+NC+604MYExFFxc/vSzE=;
 b=r4gITdKKXpg1TyyJQ/1K8pDm7nsIjFq8KbYE+WC82eoy9p31YccMlH6PaQr3Dey0s2UTmKiq8y8KaAKln6VDivI0VtkGZrmKdfIF7nuavXvPIZd77E1hBxK18kFlakazRvzbStssGTKihDtiouuN1+0JPNT3FjQ44/TkKBJ8jxACy9mnjPwApBSMRpHMfkUIFzx/bzZTCLfDqjHRx8fuI+Dr91L07gbo302LQJx/c6rJHZ7m58nDsflGsmZ3xNr+4sB5uggyzsqbiMXqCibVCHVzWHkQ8tGybFuIZYFwuVUVB38CGfMopN3IwY2D3HiS+XDBvTjpZn10aIssQF9ahQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by DB9PR08MB8359.eurprd08.prod.outlook.com (2603:10a6:10:3d9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 03:32:10 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 03:32:10 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH v7 16/17] dt-bindings: spi: airoha: add compatible for EN7523
Date: Fri, 10 Oct 2025 06:31:35 +0300
Message-ID: <20251010033136.1475673-17-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010033136.1475673-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251010033136.1475673-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0035.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::28) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|DB9PR08MB8359:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fe76304-54bd-4bfd-ca25-08de07ad9880
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C4PeU1n64Dh2IpCkwtZWspQWndgv3mbR8M06fzjSv2j7FIHjcLHP5/5zXgdM?=
 =?us-ascii?Q?HWUUyv0gRijsbiv857YRhk9mONMqh+en8tQgo1Y7jUeKm2SNbSwANHxrqTXA?=
 =?us-ascii?Q?xGttYr2hZgQH9wbSsXy8jYyNq5q1ILp/c50eH4rSn5yW7/orjvE62vkMx9j9?=
 =?us-ascii?Q?3iYHLmi9mFTpgFRE5q0GghakvLlmNN3ob7rA2TcYpHjuWjAHDK2e38DKHkUw?=
 =?us-ascii?Q?836rfmYG5FIVkvP20m964e9evC0hGXpWUouC2YSuMsozrGhV7/DOjXi9gedW?=
 =?us-ascii?Q?xRCWV8h7Il2mSsK+i2TGky+R3fSCcyHD/Hmqs4J6WI+iJ69dK2rO56BZnfQP?=
 =?us-ascii?Q?l48UOz9Fb+6YJyG2VtN/964wM/OJkOT9Fe8RMvMC5UKiNrhp1rlfZRS2aLuS?=
 =?us-ascii?Q?PIp34Ln8gla9vzN0jVAIVEewcBpqyiDZl5jxM2upnyh0tygeENzfeGtFYnrf?=
 =?us-ascii?Q?BW2wdEoiqXpXt8UCNqzUDaxq/dTsvID2jDI19upVW+SifV+GExD1fsonWw/G?=
 =?us-ascii?Q?EAbYiuaZl1Q1mCKtCmVgB0Lu69kKiopwrWahRUlQPcrXEfdR7kwcujwdMMCw?=
 =?us-ascii?Q?GeZXx1MUkZhNBJXkUgYTspLUHrk1GvXMZ+94+vPIyObkcP4U5Udro4FUwWaA?=
 =?us-ascii?Q?3z75dkwDAq04jWx1UEa4UI8H/wz1VA8vkZENjMIFXkDH2tpW2nrSNFTuvaxn?=
 =?us-ascii?Q?uTCEau3wGMPU6cghIB9+zDfJwNtXraBiGNbZCLpMplpvFPsSEc+RUNe5/dw9?=
 =?us-ascii?Q?wN4InYf/MHwOySL5Gq+3iXahOyfSuGlXwb045512u5a4gwdt9BjW87XxhYdc?=
 =?us-ascii?Q?ZXs3Sf7N8MvWzGZC0RbJ9LEb0DOZX/0NFr3z9s+/l7FQpLw+sRSR97qLtm+p?=
 =?us-ascii?Q?j4xAbMIgVgPlDKved2v+QzIpAxS1Bhsrs2o2rDxD9G1Tw6C7zwkOz7o/1kuc?=
 =?us-ascii?Q?9FWZo5ZNGofu3oVlBQnRfh5CfrsgvrhN/2PW4mg1/f6Qtu8g6lygFtl2D+9H?=
 =?us-ascii?Q?u+h3vogojk3R4zsIBnts2Y9hQ4dNWiswrMtu30Uoldk4URSYYFz0bUHSYOCT?=
 =?us-ascii?Q?K1mVIiLANb+brqKKkz5NYII0H8wi0GOTyVEguw2nDo3r58LtklVPc0ipTK40?=
 =?us-ascii?Q?s3QhEgIYkL9+u7uwP8MQMr5BTFHijd0Zro8vWr2vmUgfIE7IgbIzBHfKpOoz?=
 =?us-ascii?Q?XgzcRYpDqp66IzJ/SuwwkzSIvt+ZSkJbYAI9+57pjJS5FgMjoZ1Q9ajRqbef?=
 =?us-ascii?Q?R65lXO39iRFqhywldZguem0rcU9xWWiQiYNlGTBxuNkg+5CFWkaAOR5Jsboy?=
 =?us-ascii?Q?H1iQRurOPlRpzipVWclhM9X3rimcHDgBQ4p9v2pvots8VujhmQLm4havgh/N?=
 =?us-ascii?Q?MDsjbCSWZM5HHZEFkqVtdmema7SqELMrvzBUZGQ8JCsWMI98i05lumeQEGK/?=
 =?us-ascii?Q?EWoWn8wKUQ2TjVn/GXbsimcCue0f0aZXPeMNrgXyQs3jth8t7Dc3WQj3di37?=
 =?us-ascii?Q?YqXgFbtIv+FpTt9Z1QMgFTWWwSPGMtaoGI/Ntdc/OfTULliL1JSjRF04fQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V68T8jODnck7oHC2iuytLYU23hG73ejY2Nx++E8lwkDz6DzzMFZlmwjqyquA?=
 =?us-ascii?Q?Gf+H2QUAGIW7Cge9e5PBfPd/jTS1zA+JrirKAWTD7jgvFCAIUmwKj42pDA4Y?=
 =?us-ascii?Q?RWfEdYad/K0N5NSQJwm6U+AunnmHQ+MtZWRD6r+78pQzxiygoXmfiJvUw1Es?=
 =?us-ascii?Q?nuvp5K1wBgN7jUCX3gvRYwPBG2CzsczuEtUzJRJmFn0uhfOH+ma5YXEPA34k?=
 =?us-ascii?Q?MXUIe4ZhnO6VGmE5mTSTBIaAxLc7ddujkXwAHLOJKkeTgFG1t07ZfA5OdDnf?=
 =?us-ascii?Q?fk/WwBs3Pxh9NSnNDCoLsZ96aIVH6OI2PkjKN/b5uEgzJCSTQxFBZrIWiDRf?=
 =?us-ascii?Q?V8X/QmpmPks+9vApZfaoRmg/4CPvna2eQ+9FNBNMw6AY+vzVo6/72owYe9I0?=
 =?us-ascii?Q?gEm7dPFP/sRM8bPPWPoeizRKH0EuQakPHUd7YbOdBE7TtSe8AwfeadazYTCS?=
 =?us-ascii?Q?qMyxidsGBv88HabuPLWl6/vBTNuOLGSF0kygd35p2hcQZDvDnEGxuW5eiMqQ?=
 =?us-ascii?Q?fbia0ZGmA3rZR7WQPLCRbHIcOJVpf35fzwUNX0LOGChtv9jvkaKRClSRpUC7?=
 =?us-ascii?Q?yJUdnrLfiGQlR1wPj7zOluqXdxqayq7oYOusBto+W7sAPTJwfBZE8QMExMiu?=
 =?us-ascii?Q?gqFBxyv+6+KkJnyqNGDvnaCoWiM584zZdBBJIk3SDm5n5pLI1qFT3ECiIhT2?=
 =?us-ascii?Q?HfCZuzgJWF9gykoslVEEdDG/DVVua3ssWGgxFQ3Cu6zO4nkzApW33kVFa5ng?=
 =?us-ascii?Q?B8BJi+9MPHlre2y/dCq8YU4IjehueQ5xFJxDYRTB2IPvEIf+7dGGDE0hoCYH?=
 =?us-ascii?Q?7WILxKP9gnx7KIfMFl+GpLi8IzGaspj3+7OY02RnaeTnCaLq82upgcPnE2D+?=
 =?us-ascii?Q?gHgoG2ln78CUYQuP8BR0qhwa0Wa5oksheJc1beoCKrhghHM9FX7ExufUBnZ2?=
 =?us-ascii?Q?wfKzqeoDfiPu8puLSf+QbUkG3XEd0UEMjlUoPa7gZhr8msG9HYxkKagFKr8t?=
 =?us-ascii?Q?+Sfek9l1BR3P/08C3dEcxZx4sF8ClvAQWW5mWRgfqmJLI70wq/ZGJUdwGGX1?=
 =?us-ascii?Q?+3LLyOzBIreU0gzO5Y24027btXP33RRusY4V+/1OYU2nh+kze+uTndYDLYLW?=
 =?us-ascii?Q?K6FU2hxAIiG2I2C3TwCyZndmCiwFJcD+rSMW2gAuLQQa0O6mTQudgDoSVszN?=
 =?us-ascii?Q?HCYnJAajczOH6nF2v9FtCNoQPNiTRxcJ8L6v3NBqtjcEFTdvdmwwDzerSLho?=
 =?us-ascii?Q?Wx3zgBBAFctU98F0RJTSWnlonTTq9QnoAshwJ8rtdqtMXuYE0gREXkmGH3ub?=
 =?us-ascii?Q?x5DxtWxPJiTYEL9E4GnOXL3jTEupxE3Jc4zr04+R5zwUjvzjetyoKFIrFAt9?=
 =?us-ascii?Q?kI8T26HuOmlbQytB60bn28tOGM8qUjCeiTzEEwkngWhMD4p2YKkGEe7vCkE5?=
 =?us-ascii?Q?NXS4WnYnvJmsUInYald3BbSgBOF1XKtk+NuNgnQGMdHOwTg+DDRPZNN5/Bg8?=
 =?us-ascii?Q?AX50X5cP3XtMAcD2UwTvN7YzAVN86vY+FP8MIYD2tTwdaVUDem4q5DycyTTz?=
 =?us-ascii?Q?lQOH/g4PwoUZ7140LKmpU/PEQl6W/lKYAW425+V4H8c4p21hai83tYPo9TkF?=
 =?us-ascii?Q?lP17g2ruV1gj0sDaGjRpfC4=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe76304-54bd-4bfd-ca25-08de07ad9880
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 03:32:10.4895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d/Zgx/IR3aE911JQLzcE/GVxbCEaMSIvTO+JX2tV+1hEOUVCK8cDIc/6dHyKD98LQyUUT3f2e65PnsMhT2FDE31gn2Ao/64IjrjGJ448kIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8359
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_203217_884351_2019C2A6 
X-CRM114-Status: UNSURE (   9.82  )
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

Add dt-bindings documentation of SPI NAND controller
for Airoha EN7523 SoC platform.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../devicetree/bindings/spi/airoha,en7581-snand.yaml         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml b/Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
index b820c5613dcc..fdc5b0f920cc 100644
--- a/Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
+++ b/Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
@@ -14,7 +14,10 @@ allOf:
 
 properties:
   compatible:
-    const: airoha,en7581-snand
+    enum:
+      - airoha,en7523-snand
+      - airoha,en7581-snand
+
 
   reg:
     items:
-- 
2.51.0


