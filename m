Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F435CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 03:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRs3E6XYJFP2n905LhT/DxgKVk6bbVkUK5bfx5yHGus=; b=iXFzB2mbBMRt4KkvftDBD5LTdJ
	LR4/2WgjVBIOgLo06n4V/igDBGaItf00ICblRjXR5gXXZllizuddXZMv2lflIz0rY0CGoDeaeiR8/
	PffNsWpd+dODyA0ImS5iyTsJvhrfC2+uJRBLoa7rQmtx9CCMecLtAqxF1x5tGVA7f/BOZI5U9dv+9
	knD9033SwU/PJ/FI5AS5OEqVR5GinnTE7iLj5DRPG7I2QyYxZ9CNzi4xHHHIxgPE+pvVyWrjiU3Od
	08WEq3TaXyEK3IpvKRCTrfmVKH/5hjgY2uw1aYnSvzu4HHTuIoGxKZi+0L3YoySaPz65sc5a9Ga+q
	Vq7qv08w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v73rR-00000007ZNV-26fa;
	Fri, 10 Oct 2025 03:32:05 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v73rM-00000007ZE4-1fd0;
	Fri, 10 Oct 2025 03:32:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kwewomEwyN3bjl2gVkX5sh1iqANIW7h7KUtMeLMFuWW2GW0jLvDswmsZYlLvXuBDQLMyPdEx114/peLBhxU30DzAXpegF7ohh0ka64fvUoezaSQWvCbAe/y/WCo91l0aTFl56Y+txfKsmccZfNMMa7OI6lLeTsQHMMU6PG+r8fvcJKlE9JeYI7tGvWD4llljnOKjUabj1rjJO1q+MQdyJG3hdUw6RuyqQU5tVdYCRxgka2WtBhUk/ZuM91v7zyI7+YKykkSF9r4VvZp+6Tf5N92MhGfA5MvkY0loihY1O5E0JSK+DYv/P0BTbUSJG6/+2HGqdW7rDLjj2fkKfG6U0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRs3E6XYJFP2n905LhT/DxgKVk6bbVkUK5bfx5yHGus=;
 b=LxgiUT1rbbuTRz/8TjkxM/yFCSdWsHtiL2O7n0mzacEdXNsztE2gRb7H9dMCn6g5PvZkufR12S8oxUANQQ6R5B84HXbL0eJPDFLJn1OK8GHw6YqbZR+ek+CEasxvPOl6HtRhuOglSg+oAylNpAl/JhEzgjqVtDL651tsHIL0QKLMI10BHHwhId3sf+t+j8GmyJZ/VGs5arc7SEjk4HN95w/FEPHjPkkpaKGQMnaOwAuIe223y4ms35do9PwdFdQhMBmLfiz6teIlbo3o/vShw14mBONRk+pFxgR1L0+jt20a3HGJV/kzJJaeFMgR5pqfuqYZiWNO4fdagkz0o7pthw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRs3E6XYJFP2n905LhT/DxgKVk6bbVkUK5bfx5yHGus=;
 b=GNRHU9Y8Z7d8OEFXQ1IOcbOAjSn9FhFXvYAwKOqvsKcvhufBC1nbZ2/1GR2ScSC7mXZTJxQO4Bn2M7yfwHycizKY195arA7Qlw3zTC0G2EPcnvTEu3OomJ0ilfL2YKNKlninAs5cl+6wz6ORGbMJtMgPBjHa7n7pvbqMzsTrLddPoUTxsHa6Y9U+jJofcKe2opzxwXu2N7++VVSDknSoU9hfdDqRY+DTHSo0sFcCeai8vaBwa1IzCx7GUz2Z0O1uJn/hgpNIeWg02BclwAWkQhwnKdxAkR/RJRiebA065j09ng4xZ8CAEDcA/EWsYtrnpzw65G2tA/IwjBSgxQyZ0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by DB9PR08MB8359.eurprd08.prod.outlook.com (2603:10a6:10:3d9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 03:31:52 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 03:31:51 +0000
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
Subject: [PATCH v7 04/17] spi: airoha: remove unnecessary switch to non-dma mode
Date: Fri, 10 Oct 2025 06:31:23 +0300
Message-ID: <20251010033136.1475673-5-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: c60e1356-a1e5-454d-d062-08de07ad8d6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dSAdfOPG1x6349yiPtGrIY2eIWSnvN3gPLX0cdGjnXABGkheUx/kp/4Lx5zd?=
 =?us-ascii?Q?5t8fEmI2EE4s7QMDy5698VxKT1kz+wxzdtkvRkwosousQRuOpD8/VTko3v7E?=
 =?us-ascii?Q?vHOguWOnfK2IiQ0D2ytVRypbP/3IE7Wzm6hZPax89fkBlVs0A8xaNzTcpDPY?=
 =?us-ascii?Q?8aN/wGB8KQv+uvsGz/TCQizKs7NCQoW5WukPudNmQ31b6i+8aseAsKTmuTe4?=
 =?us-ascii?Q?h/gcuVKSkfkc46bq6roEKX6h6sehEu3fwplHEKRw50TmOUUQ6/Wzbf/iMaRw?=
 =?us-ascii?Q?uCroGqPBlXc6xYLBCQSlUKKJTfjCeEuChGCthXvguB9hLSU7m0WGf9gwYQtG?=
 =?us-ascii?Q?GPMzKFg5ONBKEhzKqidv68SoTDP8MGPSrB7iYTSTi4mL7zbXRSbyICGVOHv9?=
 =?us-ascii?Q?S12ZCIIWMdy185DGOuQw3l3pjLI+mQ1j414MHkwrjn5xzZaI1f2eZJp1eAFb?=
 =?us-ascii?Q?FRYvYo7U7gQGnztlfdnh15ASVCNVwOTmHIbVe2C6Uc34O4eJzJkJSSYkEW4F?=
 =?us-ascii?Q?E4Ua0m1RBpC1qa7QWPnmLib7uokbMZwu5E0DaQZYmzi+4i8ApHctWfwVG3b1?=
 =?us-ascii?Q?oPZfETKcuhsL5ZX7NgJpqJE8R3ER/mTCyjUcRbmuwzChHPlSbG5cAtLSwBkJ?=
 =?us-ascii?Q?l46lPP3t5YIln/Hw7b5iYVA64Cg5/ABrFvHuIoY4klWkeXkhg00LXBCAAoDq?=
 =?us-ascii?Q?fLWcdlifZYaWVf25fDVPYS9swZP2SdnHM16amr2nHWxNd9rGuPRBWdgZ2xFC?=
 =?us-ascii?Q?/ApnO+/yjyCU8X2mIypSf2ik6zgAn6QaVq/UWCgqwo2P8pfP1B5Bwf/6fOOW?=
 =?us-ascii?Q?/WlO+1vEXwGJZpLnyeGAXhttr+7/5UiIRBWh/wMIr3AtBvZYzhI8pK2R2ckz?=
 =?us-ascii?Q?abBl/tr7a/hRXElWXwdzplaEfMfVL0Xtaqngz6F2C2jWXYDZsLaonHIR9vJg?=
 =?us-ascii?Q?9Q5BU4mpVj7gySAYbdKaib5zBBz2yD8nM2lU9IVATsu7/YJ4BqQLNIHnpZNW?=
 =?us-ascii?Q?KoExYpZCW2J2thA3V/o0CSTFSSuHQJXdIRck3+p8bCrHoMUkTm1z2XTGWOSj?=
 =?us-ascii?Q?imda3sxE7v2Tk15PU2+Pk+xiwZFCx73MpSbDyRFax0pKkM/9GL8biSQSpNHS?=
 =?us-ascii?Q?HHllZk8+qOiUHJt0a2lthqmpEbakK5+kN/GI2CTzWypzg7189PG6b9Xm9PSs?=
 =?us-ascii?Q?u6xJ0M81ImHM+GYJqr5E9q3FmAj44e9rEaltKPU1546x+VFNJccgpDvlvKct?=
 =?us-ascii?Q?KFICTGoThmRKoUxCODqVWvkIrir9O6d3zfnZnaIkJ1iMtRRDmtB23ytmQiho?=
 =?us-ascii?Q?LtWip5SI3itJC+0sUYLj8oThEuDe2HuLz3ISMLugbik3GcX28gfbwixZFbLg?=
 =?us-ascii?Q?/zDp4vHJlzUn1e53dZ2MaD0XePIoWAS5zOyouX757qyjrjCmraakUa3RTi+w?=
 =?us-ascii?Q?ZhqL6A6xeiT5aHiSH8QBPl9ionJLClHTt0cmU0i+vWQe2NFGVHlSqzAHhkJ3?=
 =?us-ascii?Q?w6FikL7/wiXnkI0NSY42AvAInXvbdbSLeXSPwVDMfc9Gxi1gCLudL989Nw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(7053199007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DzjKw7NM0soiFKIXIwpC1uhSTqnQEKZLquzdZ3JT++qP+3B1pHkl3fMUggdC?=
 =?us-ascii?Q?PEvRSUnlR7es7Hn65nHAfUAo7sT0R8c7pjR4w+xejPm/mocxdBJPAQRck3+L?=
 =?us-ascii?Q?5dk1frmHU/IucuTsfvDmOsCyF2zfrMo5SXuIU308BEt0mQIwZO9X0Slfbh8Q?=
 =?us-ascii?Q?GJucgLEmR71r7Epx3zskwnptXALX6FVH+RhpU8y+mPWpehRcIVtReA+o/89C?=
 =?us-ascii?Q?yalquug0RcGaoFCRO7rFZV3TfKu8OJiLjqQoLJPX1L0NV7cABvumx3uGN25/?=
 =?us-ascii?Q?k4BrEuha88IPsrn37jR/ZoMHf/5724yGv6k5BH9XLXDK4RDFHwPTEovDmYrP?=
 =?us-ascii?Q?idEYom8pUPgWDbL+N9qfaWovy2RvVWWXAQA+kTRV9k2x6ksluBbJOVpM7eNw?=
 =?us-ascii?Q?IDpB+3A0ZgDiDnzEDJ8PJeBNKCTsAyyzvtJPs1F183C/dtoTW5Rkt1lrJZAv?=
 =?us-ascii?Q?wKhg4WFJDedgWmzbJrP0NCeuqLN9h9cAQajxPeWm0R9lW3+4Bvrr7GMFQKeV?=
 =?us-ascii?Q?eAaLkBdvCkIFR8Mhfu7TtyMp3xaUrOBvXHQdjtdXVjHZPMwP2YtA1Kn9ZNLb?=
 =?us-ascii?Q?hgK08p0Xz8eYGLMKEMnox/qllprnJ1jyEwQKZjTox2bG6n83okNYye0YDIIg?=
 =?us-ascii?Q?+7Zl7CNkLEB7CmYGJqbIn6rIDEa9Tr0o464wM8x0DYftKX8P4OyLgaAcl1QW?=
 =?us-ascii?Q?OkUadMOAGMK8F01ihuZHD/SKZFTz/KmQP9aFLC1Lm35hRfCPDeFjkbjqjmR2?=
 =?us-ascii?Q?uJqwFEvtHyoYr5Tl6L++uhqfh6WPksNqSK6mqhSwF7AstRN3b0Zm2r04ZuRN?=
 =?us-ascii?Q?DX/WjcMK5hAZvoOKAyn0YH8Y88RqP+OAli770NoRvkwe5XpjZ7QyGRL7dzNf?=
 =?us-ascii?Q?uFzHi7OdVRIxm8B6CB1LFRoksvHT1Q9Fw1Q/NExeMrTicjUzQTtBj4KumX8L?=
 =?us-ascii?Q?jzgmkwdeWoecllJNO/dyt4gQMcibAsTTl/y/b2AHi3pI6DePBs91ZmxsDRG1?=
 =?us-ascii?Q?0OjSnZ0Aiwl6iZebZXUQYYvAjw7saTFAv/TDWUw2x1YcWhxFZiUUqGvKvr0L?=
 =?us-ascii?Q?cjog30chx9eo1Hi0bH6K3aLH5jqboGnOhaucNeaZV1Qjr0t6XTF8iOLy0htO?=
 =?us-ascii?Q?C3xv0211u1TN7+Meb1NL4q0LkF89ZsOxYhLUiztqM+/44BY9agMZckHjxrQg?=
 =?us-ascii?Q?z2AwyhrbYtVplngqnEi0TEPJ959BL3JaQTlex/3hFQdOVDIwe6OR9ufg+Dap?=
 =?us-ascii?Q?kyqX/11hQwQF9U3luOj+eGWS9WROVz8fDAXyEoC+a2k96KrNSobwuEBFm2H2?=
 =?us-ascii?Q?b7B3+67NKrXRl1o/+cBIw5/mf6RAKSAeQTeTcZNv13XEpe2caU8pYHmwDe4I?=
 =?us-ascii?Q?ZSDPTAC0MN2Yb6vradmrNZT7I51btaHKIedjcXdwd7BlRQ6LHrNhl/Fa/hMP?=
 =?us-ascii?Q?WHnbcI0aR7uwprgV0ZEPU3t375G9VZvA8R60iweZV8gjygJCz1VDxepuvxFc?=
 =?us-ascii?Q?FqcdW6RvoPsWkexUxHG312MHd2EBO2Qd9cPLekMMJrhLMnIBtTu0s0ThzvxH?=
 =?us-ascii?Q?29AIXkqCKJlaFunf3zcqrDTk1q2k0UE8w2/55n9Aw3UwJSyrqy7efdMK4Fgn?=
 =?us-ascii?Q?z3/U/lIKBG4saUeVSbinRgg=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: c60e1356-a1e5-454d-d062-08de07ad8d6e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 03:31:51.8899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVaf2vK22uD7JuJXkx/hYbP+oNe9A0YBec4S8MVgAhKB3VDewmz/BR0xdftJp2qkufARMn/hRkbe+y7BmMMyqTLP+TmRjdy1BxTjaP48LtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8359
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_203200_475490_B1A519E9 
X-CRM114-Status: UNSURE (   9.22  )
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

The code switches to dma at the start of dirmap operation and returns
to non-dma at the end of dirmap operation, so an additional switch to
non-dma at the start of dirmap write is not required.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spi/spi-airoha-snfi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index fffed26ff990..2d86dc62dbde 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -812,9 +812,6 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 	int err;
 
 	as_ctrl = spi_controller_get_devdata(spi->controller);
-	err = airoha_snand_set_mode(as_ctrl, SPI_MODE_MANUAL);
-	if (err < 0)
-		return err;
 
 	memcpy(txrx_buf + offs, buf, len);
 	dma_addr = dma_map_single(as_ctrl->dev, txrx_buf, SPI_NAND_CACHE_SIZE,
-- 
2.51.0


