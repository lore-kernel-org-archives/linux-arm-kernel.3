Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA31C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 08:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KH/5JWG1RFXkzjsScR8gzdfDMEju35jIQzyEPDmWGgs=; b=bUqwPTHaZFEB/sijZaRF9snN+J
	X9JjMpjv1GDv0r1VDwV6oE+vZMIlGFIXY4XG9vJ79GkXzpS4L84S9VaclsdnfEp9LTPTmZBKbaCsX
	ikCnyx8I45sQXIL9G9sokBxbd/4jyhypjZhkHPHc5ZIe7FskPsLR3iozr0E/Iq/x8ZWHk9gHfN0a/
	lEFyVavVMQeqXxxXMzx6pj+WYoz5kQe4LBo6PQbuuWaZY28i4P/wWczTdAKHwMrknzqfRUm1/E5Ve
	Gm//yelpBL7QWGYDzUI+hWYDNZN8iPK9Wir+/m8OYBpl/nM1xTcoFXNlmjYm+/v7mI4QAlz9SIvY/
	OJZ+Im4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhl23-00000005Ehp-0sYU;
	Fri, 01 Aug 2025 08:22:27 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkov-00000005DKR-22AK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 08:08:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SK3+MzT9Wt2c2JDYAYiL0Jxs7SmBpYSRMNV9RoEynBlqWLo1dRjzVQ3W5Fes9QmkTVsrx3qbHkY6JM0sx1fgzdQuAm3Rr3c5vDujmoX9oRvilDLbHrVbuoCCK9/bl+6ftptBEMeJZ2V6BCw7PEX8hXV9RBKfI+Rp7pZiMiOOHtodv4QjJI6zffGhE4B+6c+wmXbLXiTmnhLJYGPxRE7BL6QKkJE5koGZdeUNmq2w6fRmrNbucL3ufGEO8v1CfkouvyuTSYyYzzgfRTFcHMPivsXd8FNXFuCZTMgo5lz2HoXUs5OIF3pB1VIOAARlE6qZxOrLvBc89csiQoT/DSnjqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KH/5JWG1RFXkzjsScR8gzdfDMEju35jIQzyEPDmWGgs=;
 b=Rwaghr/R7YR8hzFlXGg31DSTuTDpfvlsrJjEWsaH/KSrGSwqtWhwie2uyEkU3q4rPyp4UjBnAjjSOldNfJik+ViLOBvJzsmMmbYQFux/+/po6JkaQ5JcVA+tdGUla4LB4YKQyvVViK+WIHqgERQR+pzWtYCxDw+FJdMH1DIUQoovVbG8EYHZ80h6g5gDrq8GZEpO8ZnB9bMLwz8pUieoUgGYUh0BOHo8PNP989YOGhUjspPlfSHX0x39hRAS1PMQ1ioSDScOPDKlIvHcH5RhA6/l2jib0tHKpmrFhetUdZhiyzRr/xn9ijW2Ge64VEBjphPuIPitJt+bKDP8zvcHBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KH/5JWG1RFXkzjsScR8gzdfDMEju35jIQzyEPDmWGgs=;
 b=dO7pfCs7F/9kLJwvLAEFyt/uy7y6eqOFi0o/UCm4rj0tR5tRMyrE8tLPK0kZk7XWlOitjS5ePT5TkRGCEsNLPe5n8xHWD21OjYeK7MBuIhb2ZGAOhG3LltZdiKd4Hvl4LA88dXiUmjxf+2HfYqWL5h7ZEDRy+vB0mmgjUknLzRDsPEiJ1qgO/nzdy/T+FqX4Zs2dU07kO44f/CfHjUHv3LWYJev2j6g2Y9ZNJUBckvlSTOM472Yr0yVN/04s+TeWuL0z9dvvIYW1IPD8XP7sq0GEw5SKsVzI/tEfoWluofk7OgRvwMV9q7SgxbF1AX5ZZw+0P++wRjgzGjJBdqmM8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by AM8PR04MB7986.eurprd04.prod.outlook.com (2603:10a6:20b:245::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Fri, 1 Aug
 2025 08:08:48 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%5]) with mapi id 15.20.8989.015; Fri, 1 Aug 2025
 08:08:48 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: krzk@kernel.org,
	rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	festevam@gmail.com
Subject: [PATCH v2 1/4] dt-bindings: thermal: qoriq: Update compatible string for imx93
Date: Fri,  1 Aug 2025 16:11:16 +0800
Message-Id: <20250801081119.1999298-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|AM8PR04MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: 67b59fa7-51a4-44fc-b507-08ddd0d2a47b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eHGGTVEmjZP55P+kVR5FwUp4HoypXZP5hUkEzGe5vgGSvWLBe8WnAOAjN+Sg?=
 =?us-ascii?Q?LMp73FZ97ETax83vPiKsS261HDGqJUlkaqL+UGj86CvLrsehNRB8i000W/8O?=
 =?us-ascii?Q?h1EIJ1YX7Wge+7d7/wCH7JDXTxDxvCRPnjyhcsHBHHqrvKAID/w4fpocWT4H?=
 =?us-ascii?Q?q9m2Hht0MG8og0xMxL7bAx3NNY/ObVuBwc+8H/bqrMLtjjizFAVjE/enwV4L?=
 =?us-ascii?Q?Z95Ivxe6T6iNWZNOEJ72Nc5n4wir5VghAjVF6XHwoe5wDvI/EDGA02kgbuhN?=
 =?us-ascii?Q?L1YmaAZYp+csh759JUoUmv6u90Vfh/XcJ4UR6L+G3N92xLuVP1vfvKrN/RA1?=
 =?us-ascii?Q?6cX8YilYSPM+qrMaeR7AzBKR3QVhTi0uPrMmsuWQXaMFJejC6VA5Jll3Bb09?=
 =?us-ascii?Q?57rML6/rtydfre3g5ZD1e6RyMKQYAePhKZnxi7bAfCCqx4B1EkR8uxNFbP9O?=
 =?us-ascii?Q?NszEcySLOEdfEJRx+zKEkeyv9H/Mp90M28g6e+ye2YSvDbtqhY2Ow7QrUMpS?=
 =?us-ascii?Q?+oy5HzMrvjCDxADt9Wl97QprlTWhEZ7uxPVq6/m0pJfSK7YHxOQg2tSk6A9w?=
 =?us-ascii?Q?aYs5ig1qiZRlUxTHnjnq8rIg2Lkf+Bn0hW1c8XRlhmKk6nkiR1/2BMnX/fkj?=
 =?us-ascii?Q?wjZfDMkbZaRxT8stOirZ65a3qD6uakHWmAF8ndsFWLA4sfsmNAogRC+K6qwi?=
 =?us-ascii?Q?MynfFX8o1ZEyGR3aDZcOaL06uyCnEAIUu5/6+qQuThE2NZZ6o6BVDlvBHc2R?=
 =?us-ascii?Q?dDIWdFvEQ2Zmi+JuC87Qkqij2GATzxil24NACyByyy4LOE6lXXu73aLS4zp2?=
 =?us-ascii?Q?p+vG4KS3sICncNg9be1HHOXs7zFAte7QxYZEbB62+OiIfDGLQH/ex7BkF2YU?=
 =?us-ascii?Q?6A7EnkIZ4uC462id5KLwDpSRgq6wxm/xtfN8cYmSwp4vCHIi0F5zWqB34Nx6?=
 =?us-ascii?Q?5+AnnNSQ+uiyQx65Yc0lU0G/WHIb1nTKHJ6du/FaEAWMmywSsYb9WUoNeZk6?=
 =?us-ascii?Q?EX/9o/pukQ9YSk6m6BfXQ7A2q9l7GNPzqcfgGXXatluirbo8hj6qR83wyk5u?=
 =?us-ascii?Q?obTTUxbqEZGFaOHgHiXmJbFtej0NHkW7tQ6rehUajkOTPAEqSc49yataPyD9?=
 =?us-ascii?Q?bs1WJHvNv1nFEKWdJ8mWyqE7fxnD2ePSfVBLBiWzN/OKAcX2KCbNlJng/L98?=
 =?us-ascii?Q?ehc8Sh7KN7U86GyPZ5eQIBsrCRw3D4xsirAjdEpngF08i5O0xMk/cMDBk3M7?=
 =?us-ascii?Q?9LWPZipNo32gopEzhhh7TstwGL0D0O6ckIY22OGxGAxZB5iyiFEeBuEW1s7q?=
 =?us-ascii?Q?rzd/YqEBru4PL7IWENcWIPYZ1pG7emkyh5paS6H0oalJFlv9oOjRztjROK/E?=
 =?us-ascii?Q?ve+W/6fft7mQH+hE+AycP4CnC+UHJTg/N4xLqmNqtQok3EbU7nR9cDFQTR9W?=
 =?us-ascii?Q?ui6Hh840i10R01vgYsgdd+yX0yHy8Hi9bJQ5uVN0y9wWWeV4YD3B6A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kCuAcFHlLSxwPlfl/F4KMnS6Xte0dNFygh/BlBveqtDjL+uJltIvJlIMdkN6?=
 =?us-ascii?Q?L6ajwW73HQIXIVhqUtI4LqQWDtbLqFWw4WeciHYe3ySdTZ9WvJXwPur/0fOA?=
 =?us-ascii?Q?MI8yJgi3JG5Kh+427bXVXQfK1h5Kcl5ikJIajQ8vPR2lDSz1hhz3/8CbkVk6?=
 =?us-ascii?Q?nvqjDzfWbiKJGfrGVL+AcVX16WDfBQXB9g+duFJ1rqQ/nFKfNtviV8xpoRhU?=
 =?us-ascii?Q?FgGGq3HISQF3GUslT4K6EnC8hZIpmKd3m2DDz29bY/a3UrXQr1fVcjY1CYfC?=
 =?us-ascii?Q?oFaYLCJcHUs8zhDuurfUdu0eaK7XEipaAWLa0ZSGn8qUzeQVGyAKCUiH/B8F?=
 =?us-ascii?Q?HGaYIxU4lllz1Pm9aV/7azNGY8YywYkuasf1BrGgjUwwlHOOoNwBEhzzXkQ2?=
 =?us-ascii?Q?h3FiEa6c3C84e2WKP6+J7VAHmtA+2k4TtFuhnDLpSZZS7wZmv+HO757WSRb2?=
 =?us-ascii?Q?HPL3k2dM2ChRCeryEuW96FWxWtaiK9wzYH6Gozf+6zzVcb9QYLUiPy8Ez5r1?=
 =?us-ascii?Q?i3ZE/M1yYbVie84lbh5S9Efv4IllYhQRcjnO3sXYgDl9reVYlrCUYBqk6b1L?=
 =?us-ascii?Q?FD9GG/svJ1C9ifxUxSWP6U7GiiT1tFrjVJHGRO3cRDXD6Z7watNitktqiBoL?=
 =?us-ascii?Q?q89dxNz4RKxz3SE4Bxnt9uZlyTlC7JJzkgkz2rZ4VnbYVsfYLMHbd9U8WtiP?=
 =?us-ascii?Q?xbSRh7W2QVC01nd72nb/ktGGTX5xvmzRzMx6asZBsT7APg6UVxi3137P0hgn?=
 =?us-ascii?Q?XDjn2Xbwl0y64odxsoaROqhomsyc5AQXa/K867iciflDwBEGCo7CJG9DqtFA?=
 =?us-ascii?Q?+s+0vGLWkgIAt0LwqxYkFIxV8WTRG0jN+miNBUw6NAtILR0Sxs7UvljdvByf?=
 =?us-ascii?Q?Q932XdVUHbQnPyE+4SOhP/y+MGBs+5jCBf2ImnRXytqdC7Yh8EXexgZji8KZ?=
 =?us-ascii?Q?RT84KEOaUKoYMusIQn2FlBE2+79uUB48lftwDnQL93uU5a73FW7aby92wcUx?=
 =?us-ascii?Q?zeS4hEiK0oRaKvT7LUkOFvj0I+NYtsZNvWPtzCDnhEWJ987uFTSySjeTvHb6?=
 =?us-ascii?Q?8MIVuAWn2LLyTM+OZBni6riroAtDxPJmduz4G9YUs1f8jzi4Ec0i8HQXbZEE?=
 =?us-ascii?Q?7EI5c3B/OeHlWjTBnjiJAe/YRbSikbe+fK5u+TycJQxAnFbZMKMWBhdTy4bT?=
 =?us-ascii?Q?Sui1FP57VQZ8TSjUm7aC+UfcipWz+ucALPfsqYuNDCD8m4qmZFKTXkxWQpvM?=
 =?us-ascii?Q?pUd+oKc6FTdHmJDdVtLhr81YlzzsLUzoN1ZFo20+FXUDEHsS+G48Lv7PHjZD?=
 =?us-ascii?Q?i241MuhiST5JExylh4yCtItCvoGnhquPt+C/DIlE9z8+JvTXGeqlXtIjC5pP?=
 =?us-ascii?Q?a2ODXdlo4iqNd0tn5RJ2qeTI18memK8bVgQVcvugGeHOA+kHc3e9cNTJ+Xka?=
 =?us-ascii?Q?jDaaj1CIiGxuA+A0CFZDWC2sMBLnczmUxSZQ39+JYNx1GZ+qwMwCdM1Ni/Uw?=
 =?us-ascii?Q?dvQHSS/49/MOuxdByKcNr08GVbiQ1ukPQDMTcWlMDNU3cxBF6prnHGSJCM10?=
 =?us-ascii?Q?T7rloYFZYJN1nr5CLhyN6H30D4gRVP8MMqkFlgkg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b59fa7-51a4-44fc-b507-08ddd0d2a47b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 08:08:48.1681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h9vSmKxBHrRVEe7/c/mj+/PxctyEcf80af0kQ0uePkIZIHYHRdjUt5afEcL5HvBCw5ZzthSpH+VMNnJzg2uAKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7986
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_010853_550121_65BF1562 
X-CRM114-Status: GOOD (  11.12  )
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

The TMU used on i.MX93 has some slight differences and bugs compared with
the one used on QorIQ platforam even the basic function is the same. Add
i.MX93 specific compatible string and keep the fallback ability.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 - v2 changes:
  - keep the enum
  - refine the commit log to use i.MX93 and QorIQ name
---
 .../devicetree/bindings/thermal/qoriq-thermal.yaml     | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml b/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml
index aa756dae512a..6d8766c6a58d 100644
--- a/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml
@@ -22,9 +22,13 @@ properties:
             Value           Device
             ----------      -----
             0x01900102      T1040
-    enum:
-      - fsl,qoriq-tmu
-      - fsl,imx8mq-tmu
+    oneOf:
+      - enum:
+          - fsl,qoriq-tmu
+          - fsl,imx8mq-tmu
+      - items:
+          - const: fsl,imx93-tmu
+          - const: fsl,qoriq-tmu
 
   reg:
     maxItems: 1
-- 
2.34.1


