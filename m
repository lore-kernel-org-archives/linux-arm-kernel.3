Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBD0F513ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 03:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m+Jlh6OFRaQjJbYusefR/wyCPIG7gE1+hdr4Uw2RhC8=; b=UEcKOuMXbcOKUVRsgk76jSWFhe
	nPz6BHPbgwOwA92Bfv/a5eDYz3nUpFkvujrx76lr882tpsa/6qTekd/pqM5wH5QL9exARzZwyRWXQ
	yv66VDwYe/J/EgwaFYBUD57l0JRUoxApFLKFt1wOBpJypVMZpwdMCDeqEwiVZtTKEnrirlmt8YWvF
	iFmJmXO7ouFMzZpMYfxMyJAAbVEagAw/+2Nr1u0apRiKJnGmT/xwnsA00aJIse5A13p7/WpR5mzUN
	wX/jA28dvdRCHhv7u8hsVt00CfpQTCRWFE/04TTCIJMsMk9fXI0VnL1dwYh6vs36qmHqgFPv+a/36
	Rkj1lNwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLY7-00000002vge-1rF8;
	Fri, 06 Mar 2026 03:08:23 +0000
Received: from mail-koreacentralazon11023074.outbound.protection.outlook.com ([40.107.44.74] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLY4-00000002vg9-1CBi;
	Fri, 06 Mar 2026 03:08:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e6ggImIg9w8RDspotnJjDFZreoo0GNGYWZ/QqSKeZtmPhUIZM2ouxSBKMKiDx4okkcVHqKb1r70xwBYcG0w8aCY2APPRbEYiAkAt4+rpUKOmitkPTFkr+fK3qyGWF1CLBJxBLSaMiykhzv51aAb5nwhRX6wtnx9oNE74821vzWOlrMgflMjgFIblV+1jh71fUj5ueEJt22iafgeFaLWJ7twMJ7zaVVWhxzF84bib55FTL4AFX4uuXFDLyz3+eXWzyomFI3FfRC+l6XIr41RpXRe6sLrKZ6A9HW3lh8CgIFFvZvzuEh6LBrlDNkZ+bWwXRfS4lQbnv7pVLnY0y26B5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+Jlh6OFRaQjJbYusefR/wyCPIG7gE1+hdr4Uw2RhC8=;
 b=g7k/bDbl6VuBMMj7WoCCECbLMG2OtCpY2zuKneJ7bBbc5tCH9Hm6jquw9kXvIzAZuqsdSvGKo+YeA5YzDDlgElUp5a17XBqtbSkrKQ/fFTgDttQ6phKDR3fCCucBkKRejkAjItD1m/iPNDfmnnC7yhZ4LLT1WWhhb3p5t1H050wO9/y9Qs25uaK34/6QgAfBQReK0M4Ehqp9p1zW8/L/QVJNjn2kPv8+mJcy0JDEPltrX30cbWbV6b0qSzxBgougfL3uK3Wxoiy5yYNW3cZ7n1MPsUux0zi0yKz/HMrT9pDYl0ODhn1japPN4ND1wXFmYXQnlFQK5PgUKv7PbdoTdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by SEZPR03MB7267.apcprd03.prod.outlook.com (2603:1096:101:73::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 03:08:08 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 03:08:08 +0000
From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	jbrunet@baylibre.com
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nick Xie <nick@khadas.com>
Subject: [PATCH] arm64: dts: amlogic: t7: khadas-vim4: fix board model name
Date: Fri,  6 Mar 2026 11:07:56 +0800
Message-Id: <20260306030756.2421841-1-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0015.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::21) To PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 (2603:1096:308::2da)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF62EEA9B1D:EE_|SEZPR03MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: da8ad934-ccd4-4a98-2df7-08de7b2d9794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: a+41BossUh0qZrohgICZCFlyqHEOG/PZH1L2gPSIXhJk2xP5FfAfs2Qz8EUcxX81YlquREhXesCgWMHs+lguHBQYT9qt7PcRsGP3igeXAgif+0YHyeDaQRZLJrsrBd97FkYQ+EaNhCWphbF1aUx+QjoxVY1Zt2ygvSIVeWh63TpxRHOyzslZW3bi3obNvHxxhtBAWlEyrsCNz5PeGFU+jl4t7JQ01IBCPoGdmTT6Z+8oVVcSIhyrXvBSHQPJ3RZzkMks1rupuvrCaCGfXpM3MfSblAhQku0qR1OE+GzCxLIs/+WF3JJ1jq7dl0nOwHarvUgUV9gc8r24HBodCOWdlNkTcWhX8Wk+RRUuIBfv5Yb6mkjEpfi1yhD9x+yKR/cFNu+2a1ohOb4iGtq2lGreXWuXiPCFHORQD1cDcBC7PFitVMOhFCKDB4jLlxRgbNHIIXhf6uKnijXpCfU3F8r1gL+eOXOa4YWrLjda3GWywQ6ImLOcMwx8ACm9hMHnshj21lmPtoLB602VSzr4CFO78zC/D0nJq+abvlliTDYNeDlUTLnnaZJx+zkhGOXXOd0sUGFYvYhWAVXoja/OmokHF1msWvbQf5QgkRuZy8YkNrDQ16mgWFIFR2Xcxe+374wp4cO9eqDpRN8tLyUYG5fmEr8ytXNASh/da10sdO4k7gq8/4whkkC/y/uEQ3z/p92qoCcQM5SErPnRKg8Te6kn0bRQNGbT0jJKg6pYq2AJ0MvTRhzVVpKWqQrG0w6UVPrfzzjtP7+0NUf5k5jsK81HKp3A5RmmARLGNpyy7czoQ1c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9Js0kKQnn1nynnJbqlAt/C8qgX+DXCZWh16yk3bUwEWw+mgvjEO2qVuN9Imw?=
 =?us-ascii?Q?YHnydJJAJqTf5D6nYKBjXdpj6HsHWNcZIQORXWJ/Ar/cpFOXa4orcC5dsF/6?=
 =?us-ascii?Q?tF4oImi8pIjGq27ldg9CLJraVo08PB+Ojo6N2+Q6A3rxTztbCpOJj08gQgmQ?=
 =?us-ascii?Q?Eo0lpj/SHkcPogH2P0n7lXm28q9sFaJQyqKhgVbRIDaIOh4jhEvTyNhuAkYX?=
 =?us-ascii?Q?HHZlAb519HqPZtbPENwG7RUtAIcXJ9GBMYOU7ylwR802nVXxPq8cUfCKZpe7?=
 =?us-ascii?Q?ZOfWK7payvbgyWwC8kugt2H/vWz7yPwZVIKt6mSxdDGdEkP3LW3Fu63kDR5t?=
 =?us-ascii?Q?/yl15DS5QhMWW+d+qWbTqJntB4Vnq0LTsGjVpZJChn9iuOu04T/v0zNTHHLM?=
 =?us-ascii?Q?XUVLPM33B9A4mB9s3Bfwrle2gpMOQ8wbszOKJ+VTiECQyWXPYheeE7vjEoDV?=
 =?us-ascii?Q?3K1TjVdR3DcRGEiNyNY3VXsZ83dNeGsiSKTVIzs3wmjHMAk0kPHlW1XnaR2K?=
 =?us-ascii?Q?QbQLAQzONFtvh85ltr8v/NWWVdZlHiZuN9xMyGjFwHzqdL6Nju1dFM6RmArP?=
 =?us-ascii?Q?GAjaI6egWObcjNrXUOPHsjPa/ZluEDQJYqy/xAUORNawvGCQCjGSOvPuuwMc?=
 =?us-ascii?Q?mnax2Ud9t4RcyD7KR34rCH9cQNcSuAiW721NQSXkFilLTDKY8LXEwZ8Vwisa?=
 =?us-ascii?Q?UaAGmOkELJyZ115iD0q7y5tXd9GEpOPCrYo5krvoPyHUixsTpZHRdPkUApMl?=
 =?us-ascii?Q?nipGbZKeggkhVF2SbhKIsywQn26E/U8z59GjBStWWH4rKehmU9x5eG27QjLD?=
 =?us-ascii?Q?Kacjv9DpUvUqwD/0meEXnEgd+ib/RCw14hjoH7PZzSGkNqqU34pdwpbfHyxk?=
 =?us-ascii?Q?Ay7YucmhDfp9vJKQrMWL2dI7lL0CRo8vFzsVdxGKYxCNSjeKlW1i9I44glB9?=
 =?us-ascii?Q?Z45NA9JnBYghsOLLsnQ4BG5wA4dnOPqVE8nrChRFuGNDvtcv25counzl5lWy?=
 =?us-ascii?Q?amRI9JlJ7Y13TMaqczk/9KmOVY4IGE+7CjHxJbx+raScDWoGoBAnGmRkJWAd?=
 =?us-ascii?Q?0V2dRHTThyNB7c9tvPfFlxjimQh1F0+YY7hvtxTLaorbb4VlQmaEdBzSbOIV?=
 =?us-ascii?Q?scPFzsQhF+xVppm1jDSA3eRNnQ1YEYBcS6GdCuE18HFSME/X6sld7KVl3mMt?=
 =?us-ascii?Q?umjUxsF56tZPxQqoD4Rltc0kkeFLuw7Zm4ulALhO8YvNI1fR6O4wgwopxZjz?=
 =?us-ascii?Q?PaJHQcgAe0e/0yRQAbbTsePOHujAIGu5bCreed3E7yBHDm0BM+OyYCTc3yKy?=
 =?us-ascii?Q?BVXiwe0hAg1aA+uzI831pTnFmVgEWmcwMFQuljfLCKIgBUSTUrLejwHBSgUW?=
 =?us-ascii?Q?Jo9DbrAKoUFKbR77zHhkZSiWN7Yzvrr0xmp8/DEqM7kWLOeD8G94fKYhiyw1?=
 =?us-ascii?Q?9KLPjz6w24fjqkACMGJ3eZalfSywfyPyoWzyBSI34PsCLeqaaWZxtbxu+4bw?=
 =?us-ascii?Q?OQ5fHAKVx+wzyLpR2lF5PQcaavT/WWHbkICcynDmi7xViNcEklwpSNnG7STP?=
 =?us-ascii?Q?dIQscJhuKvt+cLixXveOXpGp+IeM/Mp2/PhWwuHsZ03hSCI+MwHURkYDlzzY?=
 =?us-ascii?Q?fq4tDikz2WiOXkrcSDSPTGd+OngLKBrgyTHJr3VyExwCZ1rNjRerYX5L9jN4?=
 =?us-ascii?Q?eZhB3nu3wkZECy4KtIGvkmhi/E0jw1IhUnyZvQSaG5zw9ean?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da8ad934-ccd4-4a98-2df7-08de7b2d9794
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 03:08:08.2684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rnX///FkSJT1seBf7jme6ywOYCxSfK0avFXUuNWUQ2D7vhrsOocp7W60+v755eW2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7267
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_190820_327694_2E265701 
X-CRM114-Status: UNSURE (   8.90  )
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

Update the model property to "Khadas VIM4" to match the official
product branding and maintain consistency with other Khadas boards
(e.g., VIM1, VIM2, VIM3) in the kernel tree.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index fffdab96b12eb..25b478e106451 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -8,7 +8,7 @@
 #include "amlogic-t7.dtsi"
 
 / {
-	model = "Khadas vim4";
+	model = "Khadas VIM4";
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
-- 
2.34.1


