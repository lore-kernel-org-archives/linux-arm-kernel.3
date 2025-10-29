Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BE9CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 10:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWMNnbEGzYOm1zfhzgwhb54fQbaXZ1zvEy/txL90oDQ=; b=ryLtTuoBMf737u7IFweoVmbCEA
	bLXfPH15NHsCt5GPMmEN1jy4kpYwFIfH/Olw42ik9Ap1jztAyrLOU9+q476MtIldD/fNDF2qnMm0h
	TeT7A2RkGlP1Rf3Oh10+P7PQ62viZFpA1VpxXye7Nh9rdbVWCIcSPvnW8bk25ALW53ZqjyTwx8Kp7
	dzJ3ev8KuNTVMp15gsuXb4kGTfQJVyWnUQwl+XWM6Kr++Av9zTYsmwEzljMFwsOsN1oJGM7SLazY/
	DyKyAqYvJ95dCPit3bFVGTL664ScXOvCncIEDI6xHlQeGSv0fo3mFDjajJ6A3g5dYzzCanqMKlu7y
	kwv99jKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3KP-00000000im9-1bFG;
	Wed, 29 Oct 2025 10:22:53 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3KL-00000000ij4-3ruT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 10:22:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRf1f0RCwuE2k7MfSrGQDHaX0a5HyFZyCG5CwsfzsG/zJqOyskrz87L5RQyzgWAWf4wjGMNCz5g4J4Sjq2b/XApITnjNxbGhnTzY4ynw63jtpYryoifwk/5ZIWzrjQWmb4S8nEZees7TvHzRN8QNLTJf35x+L+1xuuthRaUZ/DsecqIhFkUL4TVGcEJwia08uz/9ZZwoy98cgAufnHWBUVEcd5bJZPYjP7pQpnRqbvnKXhsMgLYcdIu6qrtcM+WNJ6TjvLGHCpNI1nT149XI7JUk6KpsYmJdgBulMVhtYQIYd7ehdQ2RaOL/3L7ykSK+sAkYsklOdmLEqHx03N72xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NWMNnbEGzYOm1zfhzgwhb54fQbaXZ1zvEy/txL90oDQ=;
 b=eERNjfRxEvrV57IiRpTB2lD9bX1t3qPzaZZdsZ+IdsZELsgGuY2nkB6zgv1UN8xEtVwaU8t7VImBvSWU37jtnsSojOXP5bLkT9PQNuiaLjz1KNPM1AnzUKwRGIoAR5Dzfq76zTsABWbwsa/yfM6971JMpAdUu3T7uMmWyWmwGsxwG1HLr8KGBKX/NFFePA+hD1r3Ih6eQh+njlKQ9dUmSDxDxs0ikc+exbXIda7GknSM3g0HANzPr/hgsOiPxxx6dnKmzkxL9JY6ZflRRYi+leTHr3dycWC0WG88p8Tbyt1uzTQksBhvLNaiz/Ff4T1jRvCw2PY0oAd3QI/IhuZaOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gondor.apana.org.au smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NWMNnbEGzYOm1zfhzgwhb54fQbaXZ1zvEy/txL90oDQ=;
 b=ePS6ytm1yi7AxAfjmyGkCfOVrAPJ+F3oHBn336lNJJKZJcCCeXFGdinEeNwb5G36xhLkwN+yx3SUgcXpLn3b9f+C1IUbmBYqae/TFz5CdCra6bsE4L1SJ45VcqF1DbKpVXrNEJ130GlihJopOFvtyj+jneUqoKEwpG6Kfnq85u4=
Received: from SN6PR04CA0094.namprd04.prod.outlook.com (2603:10b6:805:f2::35)
 by DS7PR12MB8291.namprd12.prod.outlook.com (2603:10b6:8:e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 10:22:43 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:805:f2:cafe::20) by SN6PR04CA0094.outlook.office365.com
 (2603:10b6:805:f2::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.19 via Frontend Transport; Wed,
 29 Oct 2025 10:22:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 10:22:42 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 03:22:31 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 03:22:30 -0700
Received: from xhdharshj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 29 Oct 2025 03:22:27 -0700
From: Harsh Jain <h.jain@amd.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<mounika.botcha@amd.com>, <sarat.chand.savitala@amd.com>,
	<michal.simek@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<jay.buddhabhatti@amd.com>
CC: Harsh Jain <h.jain@amd.com>
Subject: [PATCH 05/15] crypto: zynqmp-aes-gcm: Update probe to self discover the device
Date: Wed, 29 Oct 2025 15:51:48 +0530
Message-ID: <20251029102158.3190743-6-h.jain@amd.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251029102158.3190743-1-h.jain@amd.com>
References: <20251029102158.3190743-1-h.jain@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|DS7PR12MB8291:EE_
X-MS-Office365-Filtering-Correlation-Id: df232ba0-9cba-4c69-7f16-08de16d51896
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uysWVZMsxt/BUhIcTR8jGeXFm+EOs6O29ooR0DihFKfUAKMN3oDs0LEMdxVi?=
 =?us-ascii?Q?441wFTXFRoZP2X5D38a1BrxJj9K5jXvhVWR7Ju9ZJB3NkZ82o8B9O61C+GhC?=
 =?us-ascii?Q?UEVU6wchq3vDY0CMxtFowFPiPUhqzOfCQ8MtyN3Ci3fY48Teu2DE3EtL/7rX?=
 =?us-ascii?Q?G932bK8iMfpgm2w8C+kyanfHVe9vsmIt0aT0yMqT2j9RPiDOAyW4ypsSfG6g?=
 =?us-ascii?Q?mxVKIvR0BQPv8a5nIzhu6s4QjqjitfV0Ah/T/aYo46IazQG7z5so8pnQ0i9Q?=
 =?us-ascii?Q?mFoE0WsK2hdHoebL9fs2Z3Mg8aRzgY7+yVpLYxmlVsCLCZz9hL04RdieTZa7?=
 =?us-ascii?Q?6GvoSqjCDvvON/CbEC7/fbhkypPLioMsTsWpNi5LUR0dC2vxC2AYyx4Z/6MG?=
 =?us-ascii?Q?oJlao178CxKBH6dYyKmsDtY4PWTU6xxYKXZ3KlSjyD8QgpX6QeAx2Ld41Rz3?=
 =?us-ascii?Q?jJ8AFmp2XN+BCbuV4r6gDAOR82fAP6ycutN1TpVSjwgLpBVx2uYzl8O9BE2D?=
 =?us-ascii?Q?U++9fWRzlN0JJhbXkIy58lie3dvgs9V0AkeOmEgIBYq6q7ueCISYEno/A/Fg?=
 =?us-ascii?Q?W8IBYT4+YjAM0fxpJzwaGvrtJz+ZfhdbfAqOHT4VF7Slv6xRJEiNkivCh9Bw?=
 =?us-ascii?Q?uIvQyRqxNdHP/bvVrvuBkFeIzLuSEk5jeJuSdzx7f/QKky4UgMiAHYtUX+fQ?=
 =?us-ascii?Q?lSYjjlQcym5rs4vx4ZLLzvLS+7qeSWamdAkWr5c5xT1lmHBfwi0xZ3q3N0Mj?=
 =?us-ascii?Q?nuToYymXCV+hy8g2HiRtJJ1NavURHb2F+AEDx2YBYPASM8FXse0MpShgVABZ?=
 =?us-ascii?Q?NANLMgkEw2XlCa11hFJDhVnbES6eNi4CRm+gTVHYJD3XZfGYdFT7xOj4xK+X?=
 =?us-ascii?Q?ChggMjAjRvNNIEfFLlRZ7KFIY3r4bYHrhF9u3YOeCjBElxwc3D0LN76c3aXw?=
 =?us-ascii?Q?yp6F25XHsB10mvpdbsWXK9eJIdV3No5re7x6TXHszInCkQwWjNQc6nBzjCCU?=
 =?us-ascii?Q?JM70e+QBMAeYJfzoJvMAezjxAbbFFxOTwbnan8/FPay8IZd2HFEEKGuKHLo+?=
 =?us-ascii?Q?eSwvRjbKud8tWNuVQDas7DcdbfAn6SLwdCJNV/QiUuBfpNrPXQao03wzjOZb?=
 =?us-ascii?Q?p3+ED5yZKzM+rxKTHDglhoU8vwl1XQc/WrLVpSFza+VRJ0wk9SbbQMTT8919?=
 =?us-ascii?Q?kwQmIm1zLTABvkG+YtiqsA4EjOHnU0GU/PHDbUEWmaMTvOpC5B7oezusGO2s?=
 =?us-ascii?Q?yTYQ8MlkwrJsRESgYTNpiDW5w9ymsXI/2HhwyXD1nRru2IRclLhotvB7DLVt?=
 =?us-ascii?Q?ehvT8yZLHqw1kK/zvanaq9b4yL52YeAcMAQaK+jpUZRAXjYPq5S/qnD5zhH+?=
 =?us-ascii?Q?vdMT2z8FL/+eblNgfPuesxxJ8GAC7LSaVsLg8BU8vsDjhU9pI2OQITp9uJQS?=
 =?us-ascii?Q?7R+wcdEyyxQyUHAkSqcPDDQVG6LoR+FATU2KFN/nzFnhou06vdGiSR7e8pd3?=
 =?us-ascii?Q?tNjpVrfwTnpdnJxUtwZoqgaM4hDiekslsbkOPva+CTIy8uXISNfB/Yokd5yJ?=
 =?us-ascii?Q?EMyxtwbwwC3K3D4n6RPWWCaeDl5fH/ZcC5RZt52S?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 10:22:42.8940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df232ba0-9cba-4c69-7f16-08de16d51896
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8291
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_032250_065992_D631EF38 
X-CRM114-Status: GOOD (  20.59  )
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

Update driver to self discover the device.

Signed-off-by: Harsh Jain <h.jain@amd.com>
---
 drivers/crypto/xilinx/zynqmp-aes-gcm.c | 86 +++++++++++++++++++-------
 1 file changed, 62 insertions(+), 24 deletions(-)

diff --git a/drivers/crypto/xilinx/zynqmp-aes-gcm.c b/drivers/crypto/xilinx/zynqmp-aes-gcm.c
index 3ce1319d1a1a..04473ed9f08d 100644
--- a/drivers/crypto/xilinx/zynqmp-aes-gcm.c
+++ b/drivers/crypto/xilinx/zynqmp-aes-gcm.c
@@ -346,7 +346,7 @@ static void zynqmp_aes_aead_exit(struct crypto_aead *aead)
 	memzero_explicit(tfm_ctx, sizeof(struct zynqmp_aead_tfm_ctx));
 }
 
-static struct zynqmp_aead_drv_ctx aes_drv_ctx = {
+static struct zynqmp_aead_drv_ctx zynqmp_aes_drv_ctx = {
 	.aead.base = {
 		.setkey		= zynqmp_aes_aead_setkey,
 		.setauthsize	= zynqmp_aes_aead_setauthsize,
@@ -375,74 +375,112 @@ static struct zynqmp_aead_drv_ctx aes_drv_ctx = {
 	},
 };
 
+static struct xlnx_feature aes_feature_map[] = {
+	{
+		.family = PM_ZYNQMP_FAMILY_CODE,
+		.feature_id = PM_SECURE_AES,
+		.data = &zynqmp_aes_drv_ctx,
+	},
+	{ /* sentinel */ }
+};
+
 static int zynqmp_aes_aead_probe(struct platform_device *pdev)
 {
+	struct zynqmp_aead_drv_ctx *aes_drv_ctx;
 	struct device *dev = &pdev->dev;
 	int err;
 
+	/* Verify the hardware is present */
+	aes_drv_ctx = xlnx_get_crypto_dev_data(aes_feature_map);
+	if (IS_ERR(aes_drv_ctx)) {
+		dev_err(dev, "AES is not supported on the platform\n");
+		return PTR_ERR(aes_drv_ctx);
+	}
+
 	/* ZynqMP AES driver supports only one instance */
-	if (!aes_drv_ctx.dev)
-		aes_drv_ctx.dev = dev;
+	if (!aes_drv_ctx->dev)
+		aes_drv_ctx->dev = dev;
 	else
 		return -ENODEV;
 
+	platform_set_drvdata(pdev, aes_drv_ctx);
 	err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(ZYNQMP_DMA_BIT_MASK));
 	if (err < 0) {
 		dev_err(dev, "No usable DMA configuration\n");
 		return err;
 	}
 
-	aes_drv_ctx.engine = crypto_engine_alloc_init(dev, 1);
-	if (!aes_drv_ctx.engine) {
+	aes_drv_ctx->engine = crypto_engine_alloc_init(dev, 1);
+	if (!aes_drv_ctx->engine) {
 		dev_err(dev, "Cannot alloc AES engine\n");
 		err = -ENOMEM;
 		goto err_engine;
 	}
 
-	err = crypto_engine_start(aes_drv_ctx.engine);
+	err = crypto_engine_start(aes_drv_ctx->engine);
 	if (err) {
 		dev_err(dev, "Cannot start AES engine\n");
 		goto err_engine;
 	}
 
-	err = crypto_engine_register_aead(&aes_drv_ctx.aead);
+	err = crypto_engine_register_aead(&aes_drv_ctx->aead);
 	if (err < 0) {
 		dev_err(dev, "Failed to register AEAD alg.\n");
-		goto err_aead;
+		goto err_engine;
 	}
 	return 0;
 
-err_aead:
-	crypto_engine_unregister_aead(&aes_drv_ctx.aead);
-
 err_engine:
-	if (aes_drv_ctx.engine)
-		crypto_engine_exit(aes_drv_ctx.engine);
+	if (aes_drv_ctx->engine)
+		crypto_engine_exit(aes_drv_ctx->engine);
 
 	return err;
 }
 
 static void zynqmp_aes_aead_remove(struct platform_device *pdev)
 {
-	crypto_engine_exit(aes_drv_ctx.engine);
-	crypto_engine_unregister_aead(&aes_drv_ctx.aead);
-}
+	struct zynqmp_aead_drv_ctx *aes_drv_ctx;
 
-static const struct of_device_id zynqmp_aes_dt_ids[] = {
-	{ .compatible = "xlnx,zynqmp-aes" },
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(of, zynqmp_aes_dt_ids);
+	aes_drv_ctx = platform_get_drvdata(pdev);
+	crypto_engine_exit(aes_drv_ctx->engine);
+	crypto_engine_unregister_aead(&aes_drv_ctx->aead);
+}
 
 static struct platform_driver zynqmp_aes_driver = {
 	.probe	= zynqmp_aes_aead_probe,
 	.remove = zynqmp_aes_aead_remove,
 	.driver = {
 		.name		= "zynqmp-aes",
-		.of_match_table = zynqmp_aes_dt_ids,
 	},
 };
 
-module_platform_driver(zynqmp_aes_driver);
-MODULE_DESCRIPTION("Xilinx ZynqMP AES Driver");
+static struct platform_device *platform_dev;
+
+static int __init aes_driver_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&zynqmp_aes_driver);
+	if (ret)
+		return ret;
+
+	platform_dev = platform_device_register_simple(zynqmp_aes_driver.driver.name,
+						       0, NULL, 0);
+	if (IS_ERR(platform_dev)) {
+		ret = PTR_ERR(platform_dev);
+		platform_driver_unregister(&zynqmp_aes_driver);
+	}
+
+	return ret;
+}
+
+static void __exit aes_driver_exit(void)
+{
+	platform_device_unregister(platform_dev);
+	platform_driver_unregister(&zynqmp_aes_driver);
+}
+
+module_init(aes_driver_init);
+module_exit(aes_driver_exit);
+MODULE_DESCRIPTION("zynqmp aes-gcm hardware acceleration support.");
 MODULE_LICENSE("GPL");
-- 
2.49.1


