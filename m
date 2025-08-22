Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B467CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 21:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vP5wAbK3FAQeQqxFqL7ORB0uCD/C1oFkYhIpb0pz7Y=; b=2D5wZUL9+JB1dL2xovWQRUJhmd
	E+C1FKrPOswgneKMsMhSzoeiXIOr4GD3DiJ035XJjx4drZMCWZMezGbcxfcNgiq7EvdD3wV5/NSNc
	czrEFjuZa+UWj0qF3xS+Gvj9wxCCtnKcXsd2nVVhsP7gMCDxksqwza23/8k6+f1lLuKLrJDEqwhln
	0m+r2Dg/5JxS05b3wUHJGHwGm2KI6pETnnvBNST7oxPy4hDRPRJTmLmU090TSGvT4mAGG4IykmmbI
	9vobr3ubUT4tN8LuxyY/QlZwfqInkMSoPAxSRee/bZW9gLkUTSwnopemRyZ3hkSoaId+Fnaa+dqS4
	5N3hkJHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZaw-00000003X0d-3Azo;
	Fri, 22 Aug 2025 21:46:46 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upNOE-00000001yHR-2wWF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 08:44:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CG3sUk12wks79r1JaCx2DXBml3Bpu150y/7yJIQEXad4F3BMm6ZNq8wIoj0Qy7y+xmtQlHbXBnPTssECqGko2yzCA/wtXlLY7oW6QD/ehG5ouI0YYI5INoVA90Ijstt0lfxlyjU4i0kQoXluCSNcnK2erQOuJ2GwoxvbPF2t1EeGjg1wREcRV6j3SI8zqeEnMaitnz6eIQZjkimG8awnWiB+qZ1Th5Yq4WOpPtnY/g6IGVWH3qGz+U4T3Le0Tt3Jv9mufUjYVi8cxEnRTAl6AqzQy3bPE3LR2VOrek3HZbMTVDdHfc6SuwvnmJrPVMf6HKkn6sIlPlTYOPwc0YEJuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vP5wAbK3FAQeQqxFqL7ORB0uCD/C1oFkYhIpb0pz7Y=;
 b=gjNuvncXG5kawWZNjY/SmouoW6MNxEJyrNgzf8CHgArRkOMYj7ZjVshGOGN8X1fd9/FVaDu8I9nvazZ8EZf0lqyurHUwkLIA8i35ypoPDqX2V7ZVORLz7uF/4HOCmuxE0BSKE/SoQbN3/tAtliz+/ZHJ1yKVeJN6I1JOiyCs+I7xaI4NLzK2M/5shDrw/D30Eej1miz7bN8ro+a7AS9PRdpeONYJj3Kp8Yb/y/mz41WUHDubIAeQxZhh1Wpn13AiBYnhg3Z97/HTqDdFmwzJh/uL9uWA0B8TQeKXDd0X/eJHpYhKV4idDRw0GG2U+m5dXZBCXSJ/z9z+Eto5hvkD2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vP5wAbK3FAQeQqxFqL7ORB0uCD/C1oFkYhIpb0pz7Y=;
 b=DG1VrVavUPjYWM4lYsenfv9YfiF/VkM31iUfUgh2cP99zLh0nhMRWKHSQ9QgFW9yqrN+QCTXSuA4/ScmmBdCXKPmTLCeUszp2DXYTIoegNDMxrnNfN/JjkPQ/D4px4/eiTjShcdjB/cpM2LBrxEWAVAy0T7ZS7XRTHjtLHyNOullgG/g20l/yOFkHB6zmjtt0R9t+4EO4jVQSdwU4U2YXJ/jREi6YfVJIdXN7qZBjKZrMDeh4Z73n5sOvJTaach/hf036oDhAcR0lbUQulJOJLxo+oFJHN0xhlqxk3nMsb44fs0ZF0b57euUs9IUNyJ7eyBTpyH8kiJx0Wv3dujNwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 08:44:49 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%4]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 08:44:49 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	jingoohan1@gmail.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v4 4/6] PCI: imx6: Don't poll LTSSM state of i.MX7D PCIe in PM operations
Date: Fri, 22 Aug 2025 16:43:39 +0800
Message-Id: <20250822084341.3160738-5-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250822084341.3160738-1-hongxing.zhu@nxp.com>
References: <20250822084341.3160738-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::15) To AS8PR04MB8833.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|PA4PR04MB7630:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f6811b5-04e2-4042-f3d8-08dde1582722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|19092799006|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2I56k918qaMEi9rcfiw4MRoOQ34wvT7e2VUu20UK+oT29/umWQKYJQkpKS4l?=
 =?us-ascii?Q?rBIQCpz8v8RHQ23KL0jEl78/LJB4Q+U5acTYdLShwn5jufOtVthQTEHMO+GV?=
 =?us-ascii?Q?hpAS9xMsVb/JLgFy1ZiufarH/EyckV2si7cWCOWpXIQqRMtS7KtgNlJPrW4O?=
 =?us-ascii?Q?LSzxZJuimftnoEwRTlpMewEC3ikHgGSl8c2syUToEYFgD4srQ9x8YmFhrac5?=
 =?us-ascii?Q?azbsLILhMis7cz546oUp26MUXYtxQOoGil2xQG6yjRu7DKkXoNQSGotP3ZZ3?=
 =?us-ascii?Q?ygpra+2/xf4A1lGQdAO1DAJIH291bMlFGBJXu7aQUel/M5vTIvSahVz40wP0?=
 =?us-ascii?Q?Jd5UhdRgU4CoyBw0W9ReMyJ2ZEXKu0MPhXECopLb4/poTEy8HYzQmHKsO9hO?=
 =?us-ascii?Q?TpFC0kdTaNnh89A6/gR9NGbL5NHfQRXTIofMaki4E/myI2ozJWg3qujBEQjN?=
 =?us-ascii?Q?ZTGOVKmMkH7jgn7pZXVFCh84WfejnJzZ5JPa0Y75w2lck8q8zWd/BBraO2Pg?=
 =?us-ascii?Q?KmNCukemm/G8mI292wz+W1lNdkdqi7EQ80lWjvc1UX+E6+aRFLNRVvmoD5i8?=
 =?us-ascii?Q?lSRC/zfkqjlandnSOf+Ae270w7OKNy140g/ZzMw4LmFRJQCosRLnnVilCbgA?=
 =?us-ascii?Q?L7+M8AAMXZLYnzkhHzMJ49R2EbMMPfxdgFhM4Faxzo0SygSbItuypRvMRLqj?=
 =?us-ascii?Q?65RQCHoo0fMVMJy0kx7HubfP/ROfk7h8aEswu6Tu13qqn9ifvel5AHxbrvc+?=
 =?us-ascii?Q?KVwD20+oSBRWDisstHyDpoGunvR+tKFDB/mjdb0udBiI3O/OGtbzf68BpGL+?=
 =?us-ascii?Q?Jc3PquKg4Cj9QTO4jBFhmrwxNBLQcP4VOQN5zJgvGDFbHryVPAu59EOq5DTV?=
 =?us-ascii?Q?CzxWvjfUnCM6vDjfV+JWCLBfs23Xyoe6pmsuwSIheZmbc9Mvgl6X58xCWzct?=
 =?us-ascii?Q?WetfOby9dBK01omV/5Avkkzejv+cg0e+LrmWGrWda8A3r1vN9y/8juRL9L5F?=
 =?us-ascii?Q?LG57YiBlI4v0qsrpYFLwfbD/eE2ufg1dNEALzhDtABMHOtowry7P1E/zPFfs?=
 =?us-ascii?Q?i5T3Aoysx+T3GQ88/zdhXOHp016dtOab7TcwBEbA5tlEmgeLpx9nXW0xK1Yv?=
 =?us-ascii?Q?NB/zuEkqdKP8fRWwx8ZOgjQVyQgsT/N9HroYjJWM5qhc4c7wAozVLLE4Nt75?=
 =?us-ascii?Q?EH2oex/mBzhw0V/TZ0gCqM3CCx+6vxin/JVXq0QwILuLMJlYCyxK5RYFtXSc?=
 =?us-ascii?Q?x+M7wXSJiJMQS9DVZu4wTButm3pD23dzLVbbGCieUeszOT4BHhQHwzP7ApnT?=
 =?us-ascii?Q?mBuxv+f8m782LO278/qcq6B/yuyazjsV63cvlWKI98NwH2TDqf9PzMd9iKN2?=
 =?us-ascii?Q?0bjIbAtsVjdUzhJl6M9rXp/jUue8i0rnF/r1CzKKG5Uv0mzAZdMJR+5aueCy?=
 =?us-ascii?Q?iBAsPoudrxuerZAVaUHAMZ4eilhbuPu3o23j7ZNy4Mn4yNhS66AG1m3njlzF?=
 =?us-ascii?Q?31M1iiz2qrZBggc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(19092799006)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4M5Mw5ZApyKxMPjIO8c0YYGnauhgqY1tHjnmUZoiJla7ynuEy63H7Md+Ph+h?=
 =?us-ascii?Q?VdzwW5vwgrqYfB8rUjwiilwGT1EejMumT8C10wHjsOnDEYPpgXXDKdYTuFi3?=
 =?us-ascii?Q?1o8wxGBah6xSe2kR7WUaIV0zHVp7mcyptZigr3aPab82ybp7OfVJSWBnnvLS?=
 =?us-ascii?Q?1NKTELuKNsqtvwX73pyr0dEDh5q9FfeVeU2N+g3rFf5q68AHqFfSwsMvLTsa?=
 =?us-ascii?Q?o4xUTbFEUoTi4OqmFHid9L61AnBRCtsjbZ9OR8EVZOAb6YFdJYBf0vSiqtQ1?=
 =?us-ascii?Q?5WP0bV1jcXZllRXSgiy+0HD4iqwyJpZe/d+nrGwXyDFdn5PyuMSwAj2wkue8?=
 =?us-ascii?Q?VpQmhpdkBlLFH6d7p/r5xUPFv+L6Gbr4gXX9qjqu+/BgEeDnPI+xnCDAI0sl?=
 =?us-ascii?Q?P04oXaAvp5t7Dwm7n6CttM5KCuRFXmw+inatGo1t/auL0wvRg5LyoZoI9T/c?=
 =?us-ascii?Q?QWq8Wo5Ih9WIoi7DHBZJuE/vIlwpuT+HDn56s8Con/X6VpWuhN972LEl0DVt?=
 =?us-ascii?Q?3ix7EuOT1LDyVa1XdLOoWFXkxDoBnhM3ocYEWGNh9Z09umfuEFupp+Q+Zbuq?=
 =?us-ascii?Q?zYByovsf/ac7UV9sRPWIpXdeAMIYJg1V74hHLnncKm4FMn4ImS5PgeSedJnH?=
 =?us-ascii?Q?THMqKGDMiEcXiVYJfJwA0x7xZmPXc0rVlc9bXrTC1ywgVpUADB2dapzmV0gF?=
 =?us-ascii?Q?5hBNzQ7KaZUmtl5/9rjw6G3WJY8YxswXipt6ym21JD1clAepHcdgsUe4CRfa?=
 =?us-ascii?Q?4cdqq3aK6ikVkhVAzRMkyXWY+6998hD77goMO/iHPBtKurMNctct2dPcXSNY?=
 =?us-ascii?Q?KzfOT9rGXUKzprmZDhqo+KTd2Un76TRbUKwoVqhH/5waslWi2usHDTIzE5nL?=
 =?us-ascii?Q?wlTfYYew2wuo7BBlPTM7Liqms9UhdgKMBUT8HXcRt6FfK//YPSLi9ICd5XCz?=
 =?us-ascii?Q?WwHp1vhxzqhta8FJL3h2+eZ286J6siTKTzYxGjmfILbLUB7UPZYMnmlXMjbr?=
 =?us-ascii?Q?Vb6qgUtON2zYz3p/1gjMfmFT/UeiafvIdTCVVRQSW/Gs0NydDvKiq7xXUzHU?=
 =?us-ascii?Q?dPnT1lvH4LVQGJoGKCIv8CkTAJ8c2Fe9x+E3NuYueRKJJO4wvMHRmkVtGbif?=
 =?us-ascii?Q?gMsOONKxJy/fR7BoytGp6BNPKLRYfjHe7FeCdFSb4l5w4+1H6gKm1thY1xvG?=
 =?us-ascii?Q?W6wTh7lUGhXhPJcdGwzBVwlO3oZdtBQ2BLiburtO3FdqybaE56OguPqr/AI+?=
 =?us-ascii?Q?QnBQ/eNXSuAkVqfX35IlmdYQU0m1nG0DvAAaWJvHhb5A5oCuQ/8PeR9GIeFw?=
 =?us-ascii?Q?P4pyLTEILhaoxuv3LigVfbQAxF/jQhGzFCliiKC9X+8j/IDBnFv7AZBHIwdS?=
 =?us-ascii?Q?Yf2DUmZmeFfb05cr12s3PlebU2bycwoqwojXu8XDuVwRmnPWBqkzcs/m40Gm?=
 =?us-ascii?Q?0kVGdFdmm7xZZUGWarWIyOUnE2j/xf1+7C+kfK7l3aRkXidEnBkv3ZngULy3?=
 =?us-ascii?Q?vxh8XbX9WeUw/8FZbqkSE8Ackq6pG09Ro4Mr4G+IYs1yLfOq4ed6CqSaAscX?=
 =?us-ascii?Q?8LSHSX6jkraBpyHH+cAlaCP1XN3Ioc6GLF8oJ9Lt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f6811b5-04e2-4042-f3d8-08dde1582722
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 08:44:49.2036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hvzZC/Bp1Z5F7/CKfrRgir1fBXUNymKGbbyA6fQnZ55QmdYVvS9LHxhRJ6UMR4A27u3d7gCotMGt8EazOwALQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7630
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_014450_740450_01F76004 
X-CRM114-Status: UNSURE (   9.90  )
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

Add a quirk flag(QUIRK_NOL2POLL_IN_PM) for i.MX7D PCIe. Don't poll the
LTSSM states after issue the PME_Turn_Off message.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 18b97bd0462bb..a59b5282c3cca 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1863,6 +1863,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
 		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
 		.enable_ref_clk = imx7d_pcie_enable_ref_clk,
 		.core_reset = imx7d_pcie_core_reset,
+		.quirk = QUIRK_NOL2POLL_IN_PM,
 	},
 	[IMX8MQ] = {
 		.variant = IMX8MQ,
-- 
2.37.1


