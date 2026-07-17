Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E23C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 10:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s6s1HFxHSgq2AoLabWmhGUqRdLTUsmRIu50ZTheVawc=; b=4d0qIVIKXiuu/Ffbkgj1IGADPL
	g79grO+pfU9yjwm0lMOCFL+jPJvq0PHRC+ejKSFfRhMcnhZshCGvHlYx0bezb+o/KxKhiDyIDNkhY
	l1ny/qMhBaIaZQ15DBC2GqLEPuwkCF8kVaylaxTABl6uenG4jCsWFH0DaVLuA8fqOd7RHmFRqsv+w
	lnUL09H3jizHT7hOfe1f3N20cZEVLxbwOREuyS3uD2iHtV9cqQ1g/zN0BDHl+OZCKygQzGXp3TqIP
	kAIvRkpaihb7+fyQmI+Qqgky7diNZEYLZWhMRzdjprr5vifiB2iAISKCaUl4U8RyB4g6duiPf/KWP
	PTydgfmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfSL-00000001uso-36Vw;
	Fri, 17 Jul 2026 10:06:09 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfSD-00000001upv-3aQI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 10:06:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/gq04JK8TR6qmvlp6VCPj8sBwfvn0fuFjJiDhWN1kiyXG2b+fjcfJwap4Oij4ZNnLAHgksJCcAewdddAaY+jmJOOJ+F+qYZ6ekaCk5CTmk3trgPhla62r3IFkMr4uFZVzS/bCbjI/XGR5US2OJzsF6uZKfFW02GZV1I/1CgLg0T8Y7K7mVmQd1mN++LHugX5pS9ckxRHIusEAgLP2occQ8Z7orMcpz0Xwk9wSZIPdcJ8eHX5MKO7peJZhiqy32SPUw20kqcq7JxaFXjn+OsqyBusAsXY6ORWdY6Gi05YuLLXyCpw3AwRB+ErlQqjh1mTqjRFp4yFb01pSavoAWkzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6s1HFxHSgq2AoLabWmhGUqRdLTUsmRIu50ZTheVawc=;
 b=Oz6tgIHE1mOTXlyoy1i8aGcwKw3RlhQKsBBC9tSAH8Xfm4iZ3uHIRzZYz6LDGb8QPxxR7dqNy+1GUiJznxKmHeypKOTlr6oAKmQ+ISfOZ/zVURySc1avTxMhCgNBy/FJS2ls88iiMt1a1RTMGd2H/aGhI/g/ISxJgssqsA3FA6bIe0uKRhzWzS6UqCjQiAU0k9GE2cqgZ5x17BAvT4IfdIArmw81Xb9xNFQpZ0xsd2r8y5hY/GkCDphmW6bCu/upF2rIvuH5Eb+OnnMqGKQurWA6PvYkgEfkqvciW7Swljco4eVcqtkXGt0N/2TnnpR2awfdAwJxgetq+DwYR1zBQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6s1HFxHSgq2AoLabWmhGUqRdLTUsmRIu50ZTheVawc=;
 b=ohw48bk6gErAPd8xvEr7x4t9WaIgQpeAoPMKppT0LezDhXa8GPtIUHHtqIszk2VJq6jySaASuEBU+sdnicfg4wuKDOApKEWxnSkIymmBnxoZKQ83nTxo9lINvR6Hl5OIO/HKteNGgZ4sxwvXgh1L/JyhAVmPaB+K1QXRMq9OoKviMjOuo007v10BYrUREXAYQWs4rRYsYGXa7DwDAxwVRxNF80fxyUDCiyYhkJPmNq+R+Y3nS/KPJTyDdICHeW4VuTuIck0iHTXvwY+XUm2MnTfwD66Q93bicPusZCE7Zo7e+LzAvN5GzX0Cg+Jsq+zQ4lYB/Oh3RSP1ZUs2hNvx/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by KU2PPFBE3986883.apcprd06.prod.outlook.com (2603:1096:d18::4ac) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 10:05:48 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 10:05:48 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vamsi Attunuru <vattunuru@marvell.com>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 2/3] misc: Remove redundant dev_err()/dev_err_probe()
Date: Fri, 17 Jul 2026 18:05:31 +0800
Message-Id: <20260717100533.601899-3-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717100533.601899-1-panchuang@vivo.com>
References: <20260717100533.601899-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6PR01CA0015.jpnprd01.prod.outlook.com
 (2603:1096:405:3bb::11) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|KU2PPFBE3986883:EE_
X-MS-Office365-Filtering-Correlation-Id: bee78da3-22d8-4446-12eb-08dee3eaf95f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|366016|23010399003|11063799006|56012099006|6133799003|22082099003|18002099003|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info: iIu6v3O4vx6iKEocqHbv0lFJxlWj56IhZZ0ifRWkFQ9wYDGrxMmDI7Dd76/JT4IO05JSfWV5DglKSD70HBN7KohCPDZxNfboLP1jRd245vTxMjbS/4eDUvKKEGmlLSOttA4ZZFL5Rgvx7TNfwLQBuvDcvZFMSdNp8Kl10A4ArnWcL/qiPk2vammFFvqKru7CPLDJn0yE8lMRB0WRws0130ZAgeGCdqS9v/4lDkJwCa8ezWhiZoOIzXHIPuV5bbGGfF7Zk85PYtmk01gWCQmrfjjF5ebrpg3Xpg+Oz7LNR0GJ3PwQH0lKOn0V8Vr5Qulv8f88zKlCKp/igbYh9mBLdiEdodf4M6G/JagYk/7vEe8RJWbsWHImGJ4LbScCVto6Zl6QYFGpRQwmrDJgJ5ENLnhFmRnRoJWpJl+WfNRUSa4sVxVW8TgklWYBY3qoL8GpGmOO7+yLFB1zvO3SWn34X3R4BcRqDnRSfP15Ip7Ky1dSkhfPgMNOf75MDoq+fy9FcH0hL7nKoH9lTmY+r3gna+hemey3hzIOOBrOHYqfwX/UPRvLl6Z8mvfZxz/qd/P/KCqTI722uM7HcOrR8jSQWtcVMMTnxibXIt7xCDGCFMgN9fEM0affYrPlwXcrT1idxKZYZ+kXvsPufmzICW1wdKd1Om/xS/kzI7OIztH3OZ85nwsv9ggUb0+FLvArmlBbtHYdKVru+3jOhM7naQwq1V6S4yd1Y1udh5sImN7OWSY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(23010399003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?szptaybuVasacR2ocdwmN+PXJnoCJtQDHswZhNYP5EJQMP/ezdFBrH3p5XG3?=
 =?us-ascii?Q?Jn58wry/iDIR+wkf5cJRUx41QKmPSoy49k8e5l4hGI5nvNFCGBUp4m1OtHXA?=
 =?us-ascii?Q?fKLLBIXVyhVEpsW16OgHpgVrI2N6uDbARvxJSlNtiwrHvVSCZ6xAO9dKW9M9?=
 =?us-ascii?Q?9BUjefihxTAdE2beWFHYpwnpawA7Kg96qhd6fraXPZohU1GrczUN/+SUh5+S?=
 =?us-ascii?Q?G+3eQKYwvX7B6ZCZNmXI09a0k+wUpYEJO68aGgR8RS1vwoJtC5tGVk+WSVXd?=
 =?us-ascii?Q?Hse93yyxce1dwW2x5GzN80HZw15lZmgP2n3JCZbAiLIlktk6GRIYULB+XsW7?=
 =?us-ascii?Q?jSeKL62ICSgYsv4J9jV9wpfwHShADWzPsOVu8QSj5QZdupjD4EBnpbakCYAM?=
 =?us-ascii?Q?cnHSSn2vyeQNbMQ+2H33ByvGTU+/UUd8wDPm3Q8SpsaubzUJqkpRP74oOIZ6?=
 =?us-ascii?Q?S8dwwhzeilX1EM72dVr93lHhb0HC+TqRNUlB1ze9W4GISF5zMU9PFQ4IXAYe?=
 =?us-ascii?Q?EAmoegEoekyILq6B28arwhTVvc+eikQ6rHNVGH5u51e9DXJWvvNKIDpV2PRB?=
 =?us-ascii?Q?OUky9e/UKWRBLcQ4yp1s54IJeI3296pBJFbj7oZO1hoxZBsVp5TgOtaoUzRn?=
 =?us-ascii?Q?jy2R173sYEOsZGcw+zepJeHorUxZe1rlTgFvliuxBcsZwZDV97IURGNvpJXu?=
 =?us-ascii?Q?MIwM9n1W5nYT0KYivuE5qFUWosgKZSTu5STqtQy2Yp0UFCZpxcUIeU3O/PaU?=
 =?us-ascii?Q?KgJFqinIXmCFvKakLauAtLDN0SeKGE9bZOer8CYrYvGjX8xaCtIFTW8tAym4?=
 =?us-ascii?Q?Zz+xDG/SKyJynogrWVgNsTMCTz03JHWvbaNMhSOVQFRTL8MKvBMmVBDV+Ygl?=
 =?us-ascii?Q?kScWl/WJmSsrAhv8wWUZktub9rYMMUT0f60+WK9lFfdpAkstOQ9CZp97/wU2?=
 =?us-ascii?Q?ouGULR7htOG1/30fgygXDRPPQsFHQuW11h+cY/+CHuyf41Ik49PKrBfvzFOQ?=
 =?us-ascii?Q?wNSvCk+9DbxIvu7mTUlRWzYwwPhLPeIQ44s2camVSdP48u41qeDtl27fd+6Q?=
 =?us-ascii?Q?D7u9rdDQR1TPUZL85ljub9oPcN8ocsRcLaj4LH3r9tH95QDhzoRx36pz53pW?=
 =?us-ascii?Q?8FUbchvyY4nF9+dd0+nhPM9wpd+n/bK5U8LeHFJRYssStdqbT1Fv3gNjtyYm?=
 =?us-ascii?Q?E4scPmwwbDd4vhdp+Dqi5kUblkHjuh3A5C0yn6QOPoeXwEAvS7/FOGZf5T82?=
 =?us-ascii?Q?5XDX70q78T9P9vIWNXaLMl4iF6Zw+0Zys1Ix7rX/jvjIRjvkshBZNkgq1cbJ?=
 =?us-ascii?Q?zenKAqEsi2VufnznKSHuRA5m811dgEB/ujHXWH3HyMniBUd9zFrmtSbOBwqz?=
 =?us-ascii?Q?yJT9Oum7mKhcW/D5UQzS5Aub+GocM36AyRkUlAGxyDqkXjkOYNJ/aQLF+C/e?=
 =?us-ascii?Q?pGIGlgWNkGrCbpSrVBRnLdFz8tKYb03lHC5gaKUE4dtGlmIseZ7u826bTyS4?=
 =?us-ascii?Q?unl6+ERa9KgH7zaAUOYJvqvbsIcL8HKGfCoYlkbXXgjB4KOpHVuZ4Cty7k2p?=
 =?us-ascii?Q?FsleK+KoaY/ehJ8omU8xoLwGKtsdEoFj2h/+L9j3JQYWQao5nZmoanBss0jn?=
 =?us-ascii?Q?D3Ag+1UBHwEeShocSAr8m5qGIAstEMfdaxEs/gO9K0E8+umUrBrRlLSOhlOv?=
 =?us-ascii?Q?fDquIiV7NyFRJ9DGeT6cdTx5iTKre+M9oOSmSBagLh93Y0Q+h0ORcWPYgja9?=
 =?us-ascii?Q?ZzbIPxtWdA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bee78da3-22d8-4446-12eb-08dee3eaf95f
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 10:05:48.0731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5801Po7H3q3wmElYyEcXWnAvsDPziCP+JkjfqWP5kgotXuHU/Nt7tio20Bv1mENws0bvGRbjGA9vonAHFa4NvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPFBE3986883
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_030601_898884_702C49FD 
X-CRM114-Status: GOOD (  11.82  )
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

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() and devm_request_threaded_irq()
automatically log detailed error messages on failure. Remove the
now-redundant driver-specific dev_err() and dev_err_probe() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/misc/hi6421v600-irq.c | 5 +----
 drivers/misc/mrvl_cn10k_dpi.c | 4 +---
 drivers/misc/tps6594-esm.c    | 2 +-
 drivers/misc/tps6594-pfsm.c   | 2 +-
 drivers/misc/xilinx_sdfec.c   | 4 +---
 5 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/misc/hi6421v600-irq.c b/drivers/misc/hi6421v600-irq.c
index 5ba40222eb12..5f65ca91b342 100644
--- a/drivers/misc/hi6421v600-irq.c
+++ b/drivers/misc/hi6421v600-irq.c
@@ -274,11 +274,8 @@ static int hi6421v600_irq_probe(struct platform_device *pdev)
 					NULL,
 					IRQF_TRIGGER_LOW | IRQF_SHARED | IRQF_NO_SUSPEND,
 					"pmic", priv);
-	if (ret < 0) {
-		dev_err(dev, "Failed to start IRQ handling thread: error %d\n",
-			ret);
+	if (ret < 0)
 		return ret;
-	}
 
 	return 0;
 }
diff --git a/drivers/misc/mrvl_cn10k_dpi.c b/drivers/misc/mrvl_cn10k_dpi.c
index 7d5433121ff6..d26c53af05eb 100644
--- a/drivers/misc/mrvl_cn10k_dpi.c
+++ b/drivers/misc/mrvl_cn10k_dpi.c
@@ -470,10 +470,8 @@ static int dpi_irq_init(struct dpipf *dpi)
 
 	ret = devm_request_irq(dev, pci_irq_vector(pdev, DPI_MBOX_PF_VF_INT_IDX),
 			       dpi_mbox_intr_handler, 0, "dpi-mbox", dpi);
-	if (ret) {
-		dev_err(dev, "DPI: request_irq failed for mbox; err=%d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	dpi_reg_write(dpi, DPI_MBOX_VF_PF_INT_ENA_W1S, GENMASK_ULL(31, 0));
 
diff --git a/drivers/misc/tps6594-esm.c b/drivers/misc/tps6594-esm.c
index 2fbd3fbdf713..50e121669c6d 100644
--- a/drivers/misc/tps6594-esm.c
+++ b/drivers/misc/tps6594-esm.c
@@ -62,7 +62,7 @@ static int tps6594_esm_probe(struct platform_device *pdev)
 						tps6594_esm_isr, IRQF_ONESHOT,
 						pdev->resource[i].name, pdev);
 		if (ret)
-			return dev_err_probe(dev, ret, "Failed to request irq\n");
+			return ret;
 	}
 
 	ret = regmap_set_bits(tps->regmap, TPS6594_REG_ESM_SOC_MODE_CFG,
diff --git a/drivers/misc/tps6594-pfsm.c b/drivers/misc/tps6594-pfsm.c
index 44fa81d6cec2..c3a0d6367f2c 100644
--- a/drivers/misc/tps6594-pfsm.c
+++ b/drivers/misc/tps6594-pfsm.c
@@ -308,7 +308,7 @@ static int tps6594_pfsm_probe(struct platform_device *pdev)
 						tps6594_pfsm_isr, IRQF_ONESHOT,
 						pdev->resource[i].name, pdev);
 		if (ret)
-			return dev_err_probe(dev, ret, "Failed to request irq\n");
+			return ret;
 	}
 
 	platform_set_drvdata(pdev, pfsm);
diff --git a/drivers/misc/xilinx_sdfec.c b/drivers/misc/xilinx_sdfec.c
index 3135ba3a58ee..fe7bea3b14bf 100644
--- a/drivers/misc/xilinx_sdfec.c
+++ b/drivers/misc/xilinx_sdfec.c
@@ -1390,10 +1390,8 @@ static int xsdfec_probe(struct platform_device *pdev)
 		err = devm_request_threaded_irq(dev, xsdfec->irq, NULL,
 						xsdfec_irq_thread, IRQF_ONESHOT,
 						"xilinx-sdfec16", xsdfec);
-		if (err < 0) {
-			dev_err(dev, "unable to request IRQ%d", xsdfec->irq);
+		if (err < 0)
 			goto err_xsdfec_dev;
-		}
 	}
 
 	err = ida_alloc(&dev_nrs, GFP_KERNEL);
-- 
2.34.1


