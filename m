Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A0AC54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 12:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hprIEnfaAqq9X64wFEw4/wyQLsBqatsqaOggPU6zj4E=; b=xPV70MwtO4tRRblKrGSK9FRC0S
	AV2qa2omaaVt1esUSlax5nbFOStdsI28/PSGtdNxBKu5C+Xs5tlzIbry0QGSMQVILJsK/XLVVFPJt
	nb4BWHyYvW/ysqvAajH4vdJCT79pwC5HqsoxHQ7Y5nQ5im4Pj0vSqRF2YFxdBOH1xh/cSangGehEa
	Y+9OmZxE3T93yEGGmommLZCsc6jz81vPZ3uxjrIJwvyvn+4CSA+2Hrs4ArFnyR3yT+kmQjGjqnKZp
	DlHAem84t0RXxIFxOBjbA9xWvxCpMA4+XMLkz1a4qnsp85TN1tHzfb23uQEvSAoquLaXIO6qQ+pIe
	/Rh2ARMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3op-00000007ykW-01bE;
	Wed, 29 Jul 2026 12:55:31 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3oj-00000007yiR-1G2a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 12:55:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HyB0FsXqlGmjSlpMkP7JJcVL+8C9QOp/7tYDnUbqutWQLchIjtw0dL8rUCEjjN3Bs0nmuFrIh8Nry7aJxYuHQvy4eRERA3msAovuXh6rGtypmWBQIE2bEBz0RVq5raO7agHR+EjnXlist1MR3PeYLqfOgqvYuXrdBo4bVOc2oTVmJF8vGRpZNcWFtuzJaYCusktEHR2UlLaJlj8p+4t8ux5jCQ9wgDK59nL3H+VeU13QQYwRgKt4nBdxg7uaIu1vIkTwLbcRQL+jeV88sgaViHj4W6W1SapI8euWqeFMYKo9MSPB+gGgXq53jMv7JeEYBZ9d86wOAJnD0WlcAHPicw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hprIEnfaAqq9X64wFEw4/wyQLsBqatsqaOggPU6zj4E=;
 b=cZHMKgXxi6i62VJ/ECwNdniEQV1+j0gM6oAIBzNkjs13pt0GoSOo+gjsD2hLUFniVJQQvUISwEX6QsQ75m3FV+0uKAPcEImHSji/+/sMdFjWpUetvYn7vJSX9nvqtD+qUH6TYuL+bXI6Qcs9qXqpRecbhu1UP+x9LvTuj0umDRDEmMi8PeM8IjKlVmxFySj6vxtbMEc9EVkQJ63wFj4SodXbPkiJXFUPmeadavjlwmdTwjjngcQ6EXeqHTuErph4eBPa/sOzZCir6oUEAWoOu1e6ZajSpPOPscmGfPEgSjc9oMPuIUIG/gRJVLVsaNsWBhqq8l0eXcdz7YH7DdfA8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hprIEnfaAqq9X64wFEw4/wyQLsBqatsqaOggPU6zj4E=;
 b=ZofVV6ONLyYUd4ZGc1ymGmR4xYjpgF6xBLlcvWzqzU9Ggj4CzptfmS9gLWj8TXvHXe5KrnHXOJLHL1JQfLCxc81xTMRbAWgVOahiGuJQr7XJ/PMXph2Z4axFmdcf4OVn4eVisEH7CW3POIPpGC/PJ7eYUCoPDAuVSmqd8s66Dtk=
Received: from DS7PR03CA0344.namprd03.prod.outlook.com (2603:10b6:8:55::28) by
 CH2PR12MB9518.namprd12.prod.outlook.com (2603:10b6:610:27e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 12:55:19 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:8:55:cafe::4b) by DS7PR03CA0344.outlook.office365.com
 (2603:10b6:8:55::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Wed,
 29 Jul 2026 12:55:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 12:55:18 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 29 Jul
 2026 07:55:14 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 29 Jul 2026 07:55:11 -0500
From: Dileep Kumar Nagavarapu <DileepKumar.Nagavarapu@amd.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Dileep Kumar Nagavarapu
	<DileepKumar.Nagavarapu@amd.com>, Sai Krishna Potthuri
	<sai.krishna.potthuri@amd.com>
Subject: [PATCH v3 2/6] iio: adc: xilinx-xadc: Add helper functions for the device setup
Date: Wed, 29 Jul 2026 18:24:51 +0530
Message-ID: <20260729125455.95893-3-DileepKumar.Nagavarapu@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260729125455.95893-1-DileepKumar.Nagavarapu@amd.com>
References: <20260729125455.95893-1-DileepKumar.Nagavarapu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|CH2PR12MB9518:EE_
X-MS-Office365-Filtering-Correlation-Id: 01ad860d-8985-47b4-6768-08deed70a489
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|56012099006|10067099003|6133799003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 7TrXyJHbfq52jIvw387eeCLK3+hMcHH/GjZ60HfWgYrELzhIUwPzdEJdEpxjAj2swO3st8/fKFVAPSgCx6mal6qoYx8Y0Y+KWDNm3aEPJoitowFYbZfUoNWzduwzSpXKbWZjLmazMm1C/1V9EGHvZ8jIED5uDobtL8qplvffKyuEdBHILcmAQCpAHT/aROEyJGPKrfw/JcEJlpHC+T7a3vaV0hS8i8LW7m5jPeJSqpVVuNUpUAuOEmt/+2XOivsQUOOJrGNnXzJAsO4Ay0gHWucr1UXPXkVc8Z3xmmUUsFzHyE7++ndvWSOCU3ucIcMkHKNC+0aT0HVD2ZzaM+fkQepQL8E2I5z6GggwYE3G0/9ce4VH2tD4SWaUr00F1LzK+Hque5Fp0lpeEnZmd9HiP16n1sXfY8qHH8NgmEBPlvYyB+bd53HBSd23tMdh+N+z29pI4g73pUsaJKQK57WnBgAAl28vMB1NODp7xNzyrhTiOInZqNmmxI+nOt7XO3T0paTFiITenTRbkbfKNcxp8Turn2CeKibmXl1Is+n36I0N/Ek1/chQiNGHF/0O2LNbvSE+Wlsuq16JvrfhmHR+RyVDVbREmMaJ59WH+TzoxVYZrwzJgXB6JrCsQS3b02K3khGdOE7bHv+lC9Iu7jrJZOnBsPtv/pSSvDsaZpT5J8pszKy0IFKBML+YDWUW/7jGUnOLeDiZ01gI3uLC6jmHCA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(56012099006)(10067099003)(6133799003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: R6VQQdAXkcxcHu+EkGgYbVkFsIBHQ/IdJcU8k/s2bqMgorjhHtu1Bte2953JRlViG3iM8KB/oCON1DKBUpLmnrp+zf0Mme86T/JasgzHLPs3H89Nodle1Di567+FaQrBzURiXsbfgw3eAzf9/nmmPHqV4Qwi8bLwMSK8zVrIRjFBGOTlNGeDUtlBDLKMBZH95AfltqoVWt8frXELCtEl661F4frug2q5Y+KicbF3O4+LzHNyJijmutd5QC7hXTGHAohBku9nX0nO3NnwI/NofNHSwV+pO4GPcfRgmjjCrKfJM/acFP3xT1d+bOFyUGphUq4M7ebNi4bRLrdmT/mXpr+J+Ce/fTRdf8LGlDo5eauL/kMy+AqX8f5P/s1rNBGGu3OLspb7iL1VsOQ910wYcbb79HgCX3veuooK5Moh9qi+pnj0z/AXC2jDH2zl3gO4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 12:55:18.4878
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ad860d-8985-47b4-6768-08deed70a489
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9518
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_055525_345401_2257B573 
X-CRM114-Status: GOOD (  20.05  )
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

Refactor the platform driver probe function by extracting device
setup and configuration logic into reusable helper functions:
xadc_device_setup(): handles IIO device allocation and basic setup
xadc_device_configure(): handles device tree parsing and bipolar mask
configuration

This refactoring reduces code duplication and prepares for sharing the
common setup logic between platform and I2C drivers.

Co-developed-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Signed-off-by: Dileep Kumar Nagavarapu <DileepKumar.Nagavarapu@amd.com>
---
 drivers/iio/adc/xilinx-xadc-core.c | 104 ++++++++++++++++++++---------
 1 file changed, 73 insertions(+), 31 deletions(-)

diff --git a/drivers/iio/adc/xilinx-xadc-core.c b/drivers/iio/adc/xilinx-xadc-core.c
index b468179736f7..dd1470d2bf9b 100644
--- a/drivers/iio/adc/xilinx-xadc-core.c
+++ b/drivers/iio/adc/xilinx-xadc-core.c
@@ -194,12 +194,13 @@ static int xadc_zynq_write_adc_reg(struct xadc *xadc, unsigned int reg, u16 val)
 	ret = wait_for_completion_interruptible_timeout(&xadc->completion, HZ);
 	if (ret == 0)
 		ret = -EIO;
-	else
-		ret = 0;
+
+	if (ret < 0)
+		return ret;
 
 	xadc_read_reg(xadc, XADC_ZYNQ_REG_DFIFO, &tmp);
 
-	return ret;
+	return 0;
 }
 
 static int xadc_zynq_read_adc_reg(struct xadc *xadc, unsigned int reg, u16 *val)
@@ -950,6 +951,33 @@ static int xadc_read_raw(struct iio_dev *indio_dev,
 	}
 }
 
+int xadc_setup_buffer_and_triggers(struct iio_dev *indio_dev, int irq)
+{
+	struct xadc *xadc = iio_priv(indio_dev);
+	struct device *dev = indio_dev->dev.parent;
+	int ret;
+
+	if (!(xadc->ops->flags & XADC_FLAGS_BUFFERED))
+		return 0;
+
+	ret = devm_iio_triggered_buffer_setup(dev, indio_dev, &iio_pollfunc_store_time,
+					      &xadc_trigger_handler, &xadc_buffer_ops);
+	if (ret)
+		return ret;
+
+	if (irq > 0) {
+		xadc->convst_trigger = xadc_alloc_trigger(indio_dev, "convst");
+		if (IS_ERR(xadc->convst_trigger))
+			return PTR_ERR(xadc->convst_trigger);
+
+		xadc->samplerate_trigger = xadc_alloc_trigger(indio_dev, "samplerate");
+		if (IS_ERR(xadc->samplerate_trigger))
+			return PTR_ERR(xadc->samplerate_trigger);
+	}
+
+	return 0;
+}
+
 static int xadc_write_samplerate(struct xadc *xadc, int val)
 {
 	unsigned long clk_rate = xadc_get_dclk_rate(xadc);
@@ -1274,6 +1302,41 @@ static const char *const xadc_type_names[] = {
 	[XADC_TYPE_US] = "xilinx-system-monitor",
 };
 
+struct iio_dev *xadc_device_setup(struct device *dev, int size, const struct xadc_ops **ops)
+{
+	struct iio_dev *indio_dev;
+
+	*ops = device_get_match_data(dev);
+
+	indio_dev = devm_iio_device_alloc(dev, size);
+	if (!indio_dev)
+		return ERR_PTR(-ENOMEM);
+
+	indio_dev->name = xadc_type_names[(*ops)->type];
+	indio_dev->info = &xadc_info;
+	indio_dev->modes = INDIO_DIRECT_MODE;
+
+	return indio_dev;
+}
+
+int xadc_device_configure(struct device *dev, struct iio_dev *indio_dev, int irq,
+			  unsigned int *conf0, unsigned int *bipolar_mask)
+{
+	int ret;
+
+	ret = xadc_parse_dt(indio_dev, conf0, irq);
+	if (ret)
+		return ret;
+
+	*bipolar_mask = 0;
+	for (unsigned int i = 0; i < indio_dev->num_channels; i++) {
+		if (indio_dev->channels[i].scan_type.sign == 's')
+			*bipolar_mask |= BIT(indio_dev->channels[i].scan_index);
+	}
+
+	return 0;
+}
+
 static void xadc_cancel_delayed_work(void *data)
 {
 	struct delayed_work *work = data;
@@ -1293,18 +1356,14 @@ static int xadc_probe(struct platform_device *pdev)
 	int irq;
 	int i;
 
-	ops = device_get_match_data(dev);
-	if (!ops)
-		return -EINVAL;
+	indio_dev = xadc_device_setup(dev, sizeof(*xadc), &ops);
+	if (IS_ERR(indio_dev))
+		return PTR_ERR(indio_dev);
 
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq < 0 && (irq != -ENXIO || !(ops->flags & XADC_FLAGS_IRQ_OPTIONAL)))
 		return irq;
 
-	indio_dev = devm_iio_device_alloc(dev, sizeof(*xadc));
-	if (!indio_dev)
-		return -ENOMEM;
-
 	xadc = iio_priv(indio_dev);
 	xadc->ops = ops;
 	init_completion(&xadc->completion);
@@ -1316,30 +1375,13 @@ static int xadc_probe(struct platform_device *pdev)
 	if (IS_ERR(xadc->base))
 		return PTR_ERR(xadc->base);
 
-	indio_dev->name = xadc_type_names[xadc->ops->type];
-	indio_dev->modes = INDIO_DIRECT_MODE;
-	indio_dev->info = &xadc_info;
-
-	ret = xadc_parse_dt(indio_dev, &conf0, irq);
+	ret = xadc_device_configure(dev, indio_dev, irq, &conf0, &bipolar_mask);
 	if (ret)
 		return ret;
 
-	if (xadc->ops->flags & XADC_FLAGS_BUFFERED) {
-		ret = devm_iio_triggered_buffer_setup(dev, indio_dev, &iio_pollfunc_store_time,
-						      &xadc_trigger_handler, &xadc_buffer_ops);
-		if (ret)
-			return ret;
-
-		if (irq > 0) {
-			xadc->convst_trigger = xadc_alloc_trigger(indio_dev, "convst");
-			if (IS_ERR(xadc->convst_trigger))
-				return PTR_ERR(xadc->convst_trigger);
-
-			xadc->samplerate_trigger = xadc_alloc_trigger(indio_dev, "samplerate");
-			if (IS_ERR(xadc->samplerate_trigger))
-				return PTR_ERR(xadc->samplerate_trigger);
-		}
-	}
+	ret = xadc_setup_buffer_and_triggers(indio_dev, irq);
+	if (ret)
+		return ret;
 
 	xadc->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(xadc->clk))
-- 
2.34.1


