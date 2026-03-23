Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C35EC01A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 07:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3AyIx475olH2C2g+uM9vRsRlHsLGPzSrQGUbFMikhk=; b=a+kGENFQvv/u9NbtW/QoBK1/br
	pFKdB9dVLSUrvT/C4GbaMWqPPBubR4yZwNtU4EnPm6U4JGgMhuz2Zivm3Nu/Eou/1s4Bpiq+X6FoQ
	EG8UMg2INKy6J7fDjitMhfpFAIt8GHQIM1kuA0DIGTpaCyD1eGuvfItRx/hfv9jedEl5GVvOwvmDG
	1hvYeUVzqD517oCFyNuD6mcMEJAvWWQ+mxUXMWT4rADsyQ4viKIQF/BUqI2B93mVjwMrYMQJPeNZc
	EMRmZ2yHkafCc4y7Pu+qXOcnklIXJEK+f2eVpkGg2zXWutmV9Q7xbvSAEGskL48vdWmOXrfknOw1N
	ic4iyACA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4a9E-0000000GFKL-1lCQ;
	Mon, 23 Mar 2026 07:56:28 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4a9B-0000000GFJS-3MEt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 07:56:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zgw7m1WKRwDl1Rl0eX3CCVA7moiHLlvEJ09AhmgOq0QmD/fuUCpwTw/8LS/3e8slxELkRDPOCQ0ZTk/SdbbRlgv2wwMGiM9vf4XJRou1s1lT+R/VbYhXnAzdwYV7M8nu77ejWFxTBTsboO9SzS0KPU0OuOUHmd5j2WmTZxXg+Xu7idUb4KIvQHeWrx1XZJdE1+Qhy0ymweXLPTreriRBR2jdCfgl0vfSbZ7rtN/K4gVSwMaB92KOen3bhkltYG0/L6RJU+adwpgybgkN+8azogXrvqy2gPA2f3WIiAHAyCB4dObqCeXALCv2uvut0R/cjiH1HJjqWf4gIc0sN3iDyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3AyIx475olH2C2g+uM9vRsRlHsLGPzSrQGUbFMikhk=;
 b=js2wjnmnJtSyDdZpcGu2uEGBAqYe5wdZUxxUL4GEfuQZF8EAO63xsGVOaDU6LMA5YS8fZYCcQJdcFcIHkdC/o1Tj8fwPZKdj/UxLbXksAvvwIzKmn0yJjcYzAir0XV2lFb3C5zzjLkzFWnQPqJFae02Lv1YsmmYUZXggq86JHBwFRVFDumFZVzL61soaVP6Z+eyXSqhJz/uKICYRq7V4jUJ8CVPswa+mbB0HFPNr97NzwLhZV18tigO12H1KhE8ieNyj1pJhtxXpBZ5KxxZKvWvD1dkPoUwDAKVYtuCl+Erg4oGoJHaWuUAv+stOJuDYoR6KoHF2aIqAGgOakCAU+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3AyIx475olH2C2g+uM9vRsRlHsLGPzSrQGUbFMikhk=;
 b=g5iUVu0sxSRnxcNdSfCmw4DKEAUF7uwBrS+9I0xMo4oMtuBvSlZOF/myOj1VQR3uHGrDmtv9RAi0zhjv6BIFFsdQ8ysQkY8HMi+HvUzLFJ6DzbOUzum0BO6ycimpq5dXGI06rUOjkJX+nuQX7ABgmXh6hDtaqgd9NQ0XKTmTMDc=
Received: from MN0P221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::6)
 by CH3PR12MB8851.namprd12.prod.outlook.com (2603:10b6:610:180::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Mon, 23 Mar
 2026 07:46:14 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:52a:cafe::2e) by MN0P221CA0003.outlook.office365.com
 (2603:10b6:208:52a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 07:46:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 07:46:13 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Mar
 2026 02:46:11 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Mar
 2026 02:46:10 -0500
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 23 Mar 2026 02:46:07 -0500
From: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>, Andy Shevchenko
	<andy@kernel.org>, Michal Simek <michal.simek@amd.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<saikrishna12468@gmail.com>, <git@amd.com>, Sai Krishna Potthuri
	<sai.krishna.potthuri@amd.com>
Subject: [PATCH v2 2/4] iio: adc: xilinx-xadc: Add .setup_channels() to struct xadc_ops
Date: Mon, 23 Mar 2026 13:15:03 +0530
Message-ID: <20260323074505.3853353-3-sai.krishna.potthuri@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260323074505.3853353-1-sai.krishna.potthuri@amd.com>
References: <20260323074505.3853353-1-sai.krishna.potthuri@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|CH3PR12MB8851:EE_
X-MS-Office365-Filtering-Correlation-Id: eed23862-262e-4b6b-ea6a-08de88b041ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|1800799024|7416014|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: x6v04Ad8yb7tHF301MgJvqqWtEZHSXgzNUFCqJxmn4DHgcaHMAUE6HGRHRuE5F5f6sNz91vcrTYR8h23wl8UfNEefiU3M93JkCUneBd4oquAEmB2Wa7JIMDcxtfloXatnbSHTB4UeXoD0H77po7p4oTALxD4fVd3bkqTizIcSzS59ipxTcZPe1JopFaZO78Z8O/p8BHqd6YtHkt8LV53ZdQDK/RfKhRbimBSdXehEsoZm79rDKCirItewvkGAvHV+7vJwquMfcZ1yYp4TuBfTWPmhi5Mze0ZXf6ttLsjfVNMMkkmk/UeA6A1viOODqtLMG1mmF56e8Hpq2hPkXVoxCSgFEsOD+y2dexcayYWUroxLx6RVGlmcZquR9Jm/hzoQim/zTFM8IxwZP2NfV8f3t3HJJ2OqPB49vWnMF3LHjybUPZychdFIsajQsN621SBzLlIx/T0t39Zm10LRLjkIQFTf+QPBr2NlWoLs92qEDfhiJDnZhMfDi/XthWcmbiQ/sbqOLuUkdGRssC79Hg3KHdLO8eMpowE8sFJJh3zYn32lAI+Xvm3VggMFrtzj3hLKriX9J79JTpo5SlMAlvC3hmDADdi6/B/7QV8cLJxGQm1MjWagDROWq92YY+ZV+7C86x8dLLnAb2RI7FjySh84ISSuNSDXXTLrziY57CH1L2iy/AZNN3UqADabt/yILdO7s3eLjFav42vliEdAXSSFfrIlaBcO8vUIuyYHpqTvFkW6Slu8AbGrCTn0JKvMpUt+bc6WLFwoMvf9ip2Tgs6rQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(7416014)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: H7+BY9k2ebRekqMAW9yPgGKF1RhKBEtzkbcwwu0j6/ZagB2Dnt843xh57ILzOIJrZypC8UvWZNBiS5JGXFakfdz2XaCMUeVm1nQeVE0gLkrOhlD0jZKynY9ZLNrpgyCtM2cIjz0JC0zNL5SWOKmMdeeSdYgEdwQSwoyDWVa0XHWBpaaZDG9Tr65upNkWzfzA7ij4++WU9xTw9tBuD1JjD0ZmaNW+WXzwYya9U8bfYvWVZPrafTkztEFGYbfityioi55LfeE4HTMFb6FJZ6tbgld92vZTvsPGsx9Y84wOQtQQjwOyA9rK4SsL620XK3rPaEzKA5ZuC685qTOKq1sptCvDvaio2Bs4Wur1LBxyyFoXt/wQcCzHVTDZwo+0QjtPXHXcCkbZcu/svzOzPGXY9md2qCV/NfYC1Kuj/B0z6uhGM2XOcG0tHFibjH+sCDja
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 07:46:13.4454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eed23862-262e-4b6b-ea6a-08de88b041ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8851
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_005625_845169_FC1F9586 
X-CRM114-Status: GOOD (  15.49  )
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

Add .setup_channels() function pointer to struct xadc_ops to enable
different interfaces to have custom channel setup logic.

Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
---
 drivers/iio/adc/xilinx-xadc-core.c     | 6 ++++--
 drivers/iio/adc/xilinx-xadc-platform.c | 3 +++
 drivers/iio/adc/xilinx-xadc.h          | 2 ++
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/xilinx-xadc-core.c b/drivers/iio/adc/xilinx-xadc-core.c
index 268e46e5349c..7fbf55f8e0bb 100644
--- a/drivers/iio/adc/xilinx-xadc-core.c
+++ b/drivers/iio/adc/xilinx-xadc-core.c
@@ -653,7 +653,7 @@ static const struct iio_info xadc_info = {
 	.update_scan_mode = &xadc_update_scan_mode,
 };
 
-static int xadc_parse_dt(struct iio_dev *indio_dev, unsigned int *conf, int irq)
+int xadc_parse_dt(struct iio_dev *indio_dev, unsigned int *conf, int irq)
 {
 	struct device *dev = indio_dev->dev.parent;
 	struct xadc *xadc = iio_priv(indio_dev);
@@ -760,6 +760,7 @@ static int xadc_parse_dt(struct iio_dev *indio_dev, unsigned int *conf, int irq)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(xadc_parse_dt);
 
 const char * const xadc_type_names[] = {
 	[XADC_TYPE_S7] = "xadc",
@@ -791,10 +792,11 @@ int xadc_device_configure(struct device *dev, struct iio_dev *indio_dev,
 			  int irq, unsigned int *conf0,
 			  unsigned int *bipolar_mask)
 {
+	struct xadc *xadc = iio_priv(indio_dev);
 	int ret;
 	u32 i;
 
-	ret = xadc_parse_dt(indio_dev, conf0, irq);
+	ret = xadc->ops->setup_channels(indio_dev, conf0, irq);
 	if (ret)
 		return ret;
 
diff --git a/drivers/iio/adc/xilinx-xadc-platform.c b/drivers/iio/adc/xilinx-xadc-platform.c
index f1ffbf5cff42..9015b131daa3 100644
--- a/drivers/iio/adc/xilinx-xadc-platform.c
+++ b/drivers/iio/adc/xilinx-xadc-platform.c
@@ -401,6 +401,7 @@ static const struct xadc_ops xadc_zynq_ops = {
 	.get_dclk_rate = xadc_zynq_get_dclk_rate,
 	.interrupt_handler = xadc_zynq_interrupt_handler,
 	.update_alarm = xadc_zynq_update_alarm,
+	.setup_channels = xadc_parse_dt,
 	.type = XADC_TYPE_S7,
 	/* Temp in C = (val * 503.975) / 2**bits - 273.15 */
 	.temp_scale = 503975,
@@ -508,6 +509,7 @@ static const struct xadc_ops xadc_7s_axi_ops = {
 	.get_dclk_rate = xadc_axi_get_dclk,
 	.update_alarm = xadc_axi_update_alarm,
 	.interrupt_handler = xadc_axi_interrupt_handler,
+	.setup_channels = xadc_parse_dt,
 	.flags = XADC_FLAGS_BUFFERED | XADC_FLAGS_IRQ_OPTIONAL,
 	.type = XADC_TYPE_S7,
 	/* Temp in C = (val * 503.975) / 2**bits - 273.15 */
@@ -522,6 +524,7 @@ static const struct xadc_ops xadc_us_axi_ops = {
 	.get_dclk_rate = xadc_axi_get_dclk,
 	.update_alarm = xadc_axi_update_alarm,
 	.interrupt_handler = xadc_axi_interrupt_handler,
+	.setup_channels = xadc_parse_dt,
 	.flags = XADC_FLAGS_BUFFERED | XADC_FLAGS_IRQ_OPTIONAL,
 	.type = XADC_TYPE_US,
 	/**
diff --git a/drivers/iio/adc/xilinx-xadc.h b/drivers/iio/adc/xilinx-xadc.h
index a2d208fbd13b..feec8ef76e4f 100644
--- a/drivers/iio/adc/xilinx-xadc.h
+++ b/drivers/iio/adc/xilinx-xadc.h
@@ -82,6 +82,7 @@ struct xadc_ops {
 	void (*update_alarm)(struct xadc *xadc, unsigned int alarm);
 	unsigned long (*get_dclk_rate)(struct xadc *xadc);
 	irqreturn_t (*interrupt_handler)(int irq, void *devid);
+	int (*setup_channels)(struct iio_dev *indio_dev, unsigned int *conf, int irq);
 
 	unsigned int flags;
 	enum xadc_type type;
@@ -233,6 +234,7 @@ void xadc_write_reg(struct xadc *xadc, unsigned int reg, uint32_t val);
 void xadc_read_reg(struct xadc *xadc, unsigned int reg, uint32_t *val);
 struct iio_dev *xadc_device_setup(struct device *dev, int size,
 				  const struct xadc_ops **ops);
+int xadc_parse_dt(struct iio_dev *indio_dev, unsigned int *conf, int irq);
 int xadc_device_configure(struct device *dev, struct iio_dev *indio_dev,
 			  int irq, unsigned int *conf0, unsigned int *bipolar_mask);
 int xadc_read_samplerate(struct xadc *xadc);
-- 
2.25.1


