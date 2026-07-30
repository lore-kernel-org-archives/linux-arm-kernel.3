Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA98C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 04:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yai/FK5olmzpvGIXsNjJr6yDRTp8/ppSubXsW3pbopk=; b=VxNcr2cdWWqduwOgStGMbpdVeA
	hTZEXxet0zgeYNb9Nb8j3emDbqx+2ebThkMs9U6dWxYoX5jW6N2XdJxoWjoCghGPPaA33QvIonplF
	t9Rdn6zeWbdEUYtjUxDVskqf1HYW6sBSZXNQbEl+j/3EApOtyNK5i4gPlo8lbqwpBoIwCWd0g1zxt
	hWQAO18gCrKNXN0zMNodhoX/YiQDiFogVACj6cB18hTKzpvRfIIoRn6neDMBu8MzZZaFkYrauZchx
	xvg1ZCHyg81WKvdBdg0DjvEQv+TwJQWMyDEa4mtP0PDhgPfoCON0mZsj/gTyG4FETAokhhaedwWfN
	qroLEERw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpIWT-00000009UYR-01SD;
	Thu, 30 Jul 2026 04:37:33 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpIWQ-00000009UXX-2Xmn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 04:37:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mn0R1gyqkJ17H9/6Q3LapndgKEl6UGrozSH4okwnH/GfAjQC87VhgbzWKvVNEDCwpZB5uclIxQOpjHXcT6VtJ8N1+6rwvIu6OwY125ezDOiY2g10+lQa7cyMz5VA1ZAdbyVlluftite3BhrQZ1A4m99qdYrHBc8D2jWg9xf2eybzH31uQa+lm7Dl5dzBRhpJVqdHR3Z122HDUG8xsNzvc/7QKWoa07S1m5uvVTQjUkQDKjVqBwYT18XqLutyNq1kUiH1GIikLAJqUmBdvBfY4ueVySeHAR1sI5fKBaz8S8HsbB0IxnRKsyzFTB46YwJEyRvsuFgdfQfIBGSLGR6XIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yai/FK5olmzpvGIXsNjJr6yDRTp8/ppSubXsW3pbopk=;
 b=ROgRhslIWn8xmxyiOAAzQMy4gqN9sSsJCervWyV5D6u4/pkzn9anz9T23l9WFMUeQkJyvvq/SfrWfcyjEtqPmWV20TEgDZWaezZO8ZqXZaGVBGIDhqBBL0jVdhH80m00n7Y3tffAPiBFJ+mmrV0nsnyRS3BJHlfouo+WjMm+geEKBzOdrcLH+GXk45X0K3kX8Rh5vBrYoY1qXeKx221RRj7v6Fn9v16GvG2wRzSNDVsTyTISKtOiIi4cuEYZKfrTt/LURcw6qImaALZ1P6jkb8Zfy9doQ7E3kILuD7KaJP9dkjMPypELIGFl1XUWk3v+4aJyN1YbZJ8Lh0uiDAyHDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yai/FK5olmzpvGIXsNjJr6yDRTp8/ppSubXsW3pbopk=;
 b=hBoz3koyrMPrIX17bFkVKdmJ6akXASOyf6X2UkTChML+UozdgEGsSaRUzXF6ZHzzPLfmWkj9qZfzZP6NHtWfSpT+cgQs4DIHmRO1XIxymvCFAQCdFxkd2VRyC+cXXJAet7qeNxL5CTtRosjrr0RCe6yfvD3Fysbm3KtoJq/7jwGUV1oELBXgqSMCttL6JeRhcbUdKJXG+Y43KJtrK/p8Q08Klw+bRIvmQhgpzq+uqtBjGDBN6Vv1c7j/lcJNlGk+L89USXR7AOnA8SK5Btk3z34IhZ8CwsyMr5nUssNscyHNRINTKRU/fJ6y2tZk4clvKinMMz5KdXlOkz1UHKZWtg==
Received: from CH0P220CA0026.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::22)
 by DSWPR18MB988406.namprd18.prod.outlook.com (2603:10b6:8:3a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 04:37:24 +0000
Received: from DS2PEPF000061C6.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::6c) by CH0P220CA0026.outlook.office365.com
 (2603:10b6:610:ef::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Thu,
 30 Jul 2026 04:37:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 DS2PEPF000061C6.mail.protection.outlook.com (10.167.23.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Thu, 30 Jul 2026 04:37:23 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 22A1F4186B5D;
	Wed, 29 Jul 2026 21:37:23 -0700 (PDT)
From: Swark Yang <syang@axiado.com>
Date: Wed, 29 Jul 2026 21:36:51 -0700
Subject: [PATCH 2/2] mailbox: add Axiado AX3005 mailbox driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-upstream-axiado-ax3005-mailbox-upstream-v1-2-8961b7350338@axiado.com>
References: <20260729-upstream-axiado-ax3005-mailbox-upstream-v1-0-8961b7350338@axiado.com>
In-Reply-To: <20260729-upstream-axiado-ax3005-mailbox-upstream-v1-0-8961b7350338@axiado.com>
To: Krishnakumar Kesavan <kkesavan@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Swark Yang <syang@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=13061; i=syang@axiado.com;
 h=from:subject:message-id; bh=TduEoIE41mqQKiOiL2cbXZ7x+p4K8mbzePWindp1VJs=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhqysq0z8zSKfNdIuPRNI+mRx5v/UDM006z3RUp3/dx4/3
 fqfOfFxRykLgxgHg6yYIstXnW/5J3O173XuXVkKM4eVCWQIAxenAEzE4x8jw1P5LuYnZmufFB/c
 fWYzY8I29oUZVeWbptge0xGpC1or+4uRYZvcS8Xw2PN/Lv1peFFS6jmvRGzaiZfBnrHnRK/M2BL
 4lw8A
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C6:EE_|DSWPR18MB988406:EE_
X-MS-Office365-Filtering-Correlation-Id: 6892a920-5e2c-49b3-f406-08deedf4402e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: op6T3v+5MLahSE1qtgyK/7iOHRNlgJHudfnN7Hz1TpDBDJQw1fwXfWtYlg2V4DapB5bvH1ARg3rdmkMI04y4Cfvb8GXdHSuvAJ8uTQNHT/F8dfv6njLVETavX06uK9wdWirK9InGeFKZ9cY7NJn/SIjdxrgWRG+MGjQ7nACMg0Go5vqm+fIrJ4ZbZPbW3JDEUwQ6snehozZj8p6+p0wAvkYWRmPjjOdxNTPXySui6efzaxIJT/M2Y2F8H5zuIpliN/MnE78pxMDh5NXFSp6gu4mx0U32Moba6qEMjYDuo4s7S2tR+8xCwAUunHO5/HfTTdZ/PrslN2bHybwJvQP9cAp94Ew9+11Kg5CIVifV+XHziDjViJApf2+w7wwE7q+O1ia/Dr5lONGHTUHLyzXjX24GAGTTA3/cQO8jDN63uLF2n1CYfYnWenuDzhh/Jjgi6Jh/bDZxpZdb2XtI8r1gcDhZ/6Cdrk0fEw1UwdEw5M230GUHNaVuin5/LhLBLwT1hWGdsywYHEEcC1/3VbGFR4+CQJ3goZ1+PVVDfDeRfKG0uNjV4fUJY1CihwiKcorXoD7PLTzavdN08Ldszw6uAy+GaR7iq3ajBnJI0xTLS1b/8B5UXXg7hMTaBJJ3s/tHonZmF5IhYBvNvdzo6Jgsd9J9yqRDMFFIHqQ45FBeuLjGFPytKEf/uNVRnTX9iZb1T4DBiJoWnVgq2ovkjqLMVQ==
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RzheKI4mqJMpyiOzhTi5Z9opHmHu0I2Da6vy6GZATgV8CRPtAQ/nz94TvpWltgI6aHIaklAqRs7KxGNwtZ2ZXiUr0pkC1pjsTcsjp5rlHElv42kzkWnZ9l3Lb3dUcdX+adKRKKameM+nyviJ0xWSMVHN6ZAdcFwZT2SCbxniWYTVbsITeezMFQsUA21ftgDAsRySqgE99DvnM4waGx8yW+/hVx8rzEiEShk+N696Z9Bt4m7xgqTGb4fHZ+n+eclab6yiwBNH36WNzLflUtaiQuqc/ORITWicVQKjij44L0qRbpVoZ43kufseG/l4ygFqXRY48atnud8KBsCUTOJMtWiKIijshmUi92AuzkdTJgcxFKGfbPn4Xt5XfscqRGL9Elc5nKeDCgDFe3j4FB3ecWZGqxoBa4kP9puEjE+cITSDsvHDftQvlqIEzCHGCJdH
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 04:37:23.6135
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6892a920-5e2c-49b3-f406-08deedf4402e
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR18MB988406
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_213730_715764_9DD11A8C 
X-CRM114-Status: GOOD (  25.45  )
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

Add a mailbox controller driver for the Axiado AX3005 SoC.
The controller provides communication channels between
the host CPU and the coprocessor.

The hardware provides 8 TX channels and 8 RX channels
through separate register regions. RX channels use
per-channel interrupts, while TX completion is detected by
polling the FIFO status.

Add the driver path to the existing Axiado mailbox entry in
MAINTAINERS.

Signed-off-by: Swark Yang <syang@axiado.com>
---
 MAINTAINERS                      |   1 +
 drivers/mailbox/Kconfig          |  10 ++
 drivers/mailbox/Makefile         |   2 +
 drivers/mailbox/axiado-mailbox.c | 379 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 392 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index af6c3571c9f2..80db69111889 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4443,6 +4443,7 @@ M:	Prasad Bolisetty <pbolisetty@axiado.com>
 M:	Swark Yang <syang@axiado.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/mailbox/axiado,ax3005-mailbox.yaml
+F:	drivers/mailbox/axiado-mailbox.c
 
 AXI SPI ENGINE
 M:	Michael Hennerich <michael.hennerich@analog.com>
diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 3062ee352f78..ab869769e278 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -399,4 +399,14 @@ config RISCV_SBI_MPXY_MBOX
 	  or HS-mode hypervisor). Say Y here, unless you are sure you do not
 	  need this.
 
+config AXIADO_MAILBOX
+	tristate "Axiado mailbox driver"
+	depends on ARCH_AXIADO || COMPILE_TEST
+	depends on OF
+	help
+	  Enable support for the Axiado mailbox controller. The driver provides
+	  communication channels between the host CPU and the coprocessor on
+	  Axiado SoCs.
+	  If unsure, say N.
+
 endif
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 944d8ea39f34..45dc59bb3e7f 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -84,3 +84,5 @@ obj-$(CONFIG_CIX_MBOX)	+= cix-mailbox.o
 obj-$(CONFIG_BCM74110_MAILBOX)	+= bcm74110-mailbox.o
 
 obj-$(CONFIG_RISCV_SBI_MPXY_MBOX)	+= riscv-sbi-mpxy-mbox.o
+
+obj-$(CONFIG_AXIADO_MAILBOX)	+= axiado-mailbox.o
diff --git a/drivers/mailbox/axiado-mailbox.c b/drivers/mailbox/axiado-mailbox.c
new file mode 100644
index 000000000000..4f1daf394a27
--- /dev/null
+++ b/drivers/mailbox/axiado-mailbox.c
@@ -0,0 +1,379 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021-2026 Axiado Corporation (or its affiliates).
+ */
+
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/bitfield.h>
+#include <linux/iopoll.h>
+#include <linux/mailbox_controller.h>
+#include <linux/math.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+#include <linux/unaligned.h>
+
+#define AXIADO_MBOX_TX_CHANS		8	/* 0-7 */
+#define AXIADO_MBOX_RX_CHANS		8	/* 8-15 */
+#define AXIADO_MBOX_CHAN_STRIDE	0x4
+#define AXIADO_MBOX_TX_REG_STRIDE	0x40
+#define AXIADO_MBOX_RX_REG_STRIDE	0x30
+#define AXIADO_MBOX_RX_POLL_US		10
+#define AXIADO_MBOX_RX_TIMEOUT_US	500
+
+/* Mailbox CSR bit definitions */
+#define AXIADO_MBOX_CSR_EMPTY		BIT(0) /* 1 = FIFO empty; 0 = data available */
+#define AXIADO_MBOX_CSR_OVERFLOW	BIT(2) /* write 1 to clear (W1C) */
+#define AXIADO_MBOX_CSR_UNDERFLOW	BIT(3) /* write 1 to clear (W1C) */
+#define AXIADO_MBOX_CSR_FLUSH		BIT(4) /* W1TRG flush; startup/shutdown */
+#define AXIADO_MBOX_CSR_LEVEL		GENMASK(11, 5)
+
+#define AXIADO_MBOX_CSR_ERRORS		(AXIADO_MBOX_CSR_OVERFLOW | \
+					 AXIADO_MBOX_CSR_UNDERFLOW)
+
+struct axiado_mbox_data {
+	u8 num_chans;
+	u16 msg_size;
+};
+
+struct axiado_channel_data {
+	void __iomem *mbox_reg;
+	void __iomem *csr_reg;
+	void *rx_buffer;
+	u8 channel_num;
+	int irq;
+	struct mbox_chan *chan;
+	u16 chan_msg_size;
+	bool active;
+};
+
+/* mailbox side */
+struct axiado_mbox {
+	struct mbox_controller mbox;
+	const struct axiado_mbox_data *drv_data;
+	void __iomem *tx_base;
+	void __iomem *rx_base;
+};
+
+/*
+ * Checks OVERFLOW/UNDERFLOW, logs and W1C-clears them if set. Shared by the
+ * TX and RX paths; RX additionally flushes the FIFO afterwards to resync
+ * framing, which TX must not do since it could discard data the peer has
+ * not read yet.
+ */
+static bool axiado_mbox_clear_fifo_errors(struct axiado_channel_data *priv)
+{
+	struct device *dev = priv->chan->mbox->dev;
+	u32 errors;
+
+	errors = readl(priv->csr_reg) & AXIADO_MBOX_CSR_ERRORS;
+	if (!errors)
+		return false;
+
+	writel(errors, priv->csr_reg);
+
+	dev_warn_ratelimited(dev, "Channel %u FIFO error: %#x\n",
+			     priv->channel_num, errors);
+
+	return true;
+}
+
+static int axiado_mbox_send_data(struct mbox_chan *chan, void *data)
+{
+	struct axiado_mbox *mb = dev_get_drvdata(chan->mbox->dev);
+	struct axiado_channel_data *priv = chan->con_priv;
+	unsigned int idx = priv->channel_num;
+	u8 tail[sizeof(u32)] = { 0 };
+	const u8 *buf = data;
+	unsigned int tail_len;
+	unsigned int offset;
+	u32 msg_len;
+
+	if (priv->channel_num >= AXIADO_MBOX_TX_CHANS)
+		return -EINVAL;
+
+	if (!data)
+		return -EINVAL;
+
+	/*
+	 * The Axiado mailbox message ABI stores the total message length,
+	 * including this length word, as a little-endian byte count in the
+	 * first word of every message.
+	 */
+	msg_len = get_unaligned_le32(data);
+	if (msg_len < sizeof(u32) || msg_len > mb->drv_data->msg_size)
+		return -EINVAL;
+
+	/* Only touch the hardware after validating the message. */
+	axiado_mbox_clear_fifo_errors(priv);
+
+	if (!(readl(priv->csr_reg) & AXIADO_MBOX_CSR_EMPTY)) {
+		dev_warn(mb->mbox.dev, "Channel %u is busy\n", idx);
+		return -EBUSY;
+	}
+
+	for (offset = 0; offset + sizeof(u32) <= msg_len;
+	     offset += sizeof(u32))
+		writel(get_unaligned_le32(buf + offset), priv->mbox_reg);
+
+	tail_len = msg_len - offset;
+	if (tail_len) {
+		memcpy(tail, buf + offset, tail_len);
+		writel(get_unaligned_le32(tail), priv->mbox_reg);
+	}
+
+	dev_dbg(mb->mbox.dev, "%s: Ch-%u sent\n", __func__, idx);
+
+	return 0;
+}
+
+static bool axiado_mbox_handle_rx_error(struct axiado_channel_data *priv)
+{
+	if (!axiado_mbox_clear_fifo_errors(priv))
+		return false;
+
+	/* Errors leave RX framing out of sync; flush and resync. */
+	writel(AXIADO_MBOX_CSR_FLUSH, priv->csr_reg);
+
+	return true;
+}
+
+static irqreturn_t axiado_rx_thread(int irq, void *dev_id)
+{
+	struct axiado_channel_data *priv = dev_id;
+	struct mbox_chan *chan = priv->chan;
+	u8 *buf = priv->rx_buffer;
+	unsigned int num_words;
+	unsigned int remaining;
+	unsigned int i;
+	u32 msg_len;
+	u32 word;
+	u32 csr;
+	int ret;
+
+	if (axiado_mbox_handle_rx_error(priv))
+		return IRQ_HANDLED;
+
+	csr = readl(priv->csr_reg);
+	if (csr & AXIADO_MBOX_CSR_EMPTY)
+		return IRQ_NONE;
+
+	/*
+	 * The first word contains the total message length in bytes,
+	 * including the length word itself.
+	 */
+	word = readl(priv->mbox_reg);
+	msg_len = word;
+	put_unaligned_le32(word, buf);
+
+	if (msg_len < sizeof(u32) ||
+	    msg_len > priv->chan_msg_size)
+		goto invalid_message;
+
+	num_words = DIV_ROUND_UP(msg_len, sizeof(u32));
+	remaining = num_words - 1;
+
+	/*
+	 * The not-empty interrupt may occur as soon as the first DW enters
+	 * the FIFO. Wait until all remaining DWs of this message arrive.
+	 */
+	if (remaining) {
+		ret = readl_poll_timeout(priv->csr_reg, csr,
+				(csr & AXIADO_MBOX_CSR_ERRORS) ||
+				FIELD_GET(AXIADO_MBOX_CSR_LEVEL, csr) >=
+					remaining,
+				AXIADO_MBOX_RX_POLL_US,
+				AXIADO_MBOX_RX_TIMEOUT_US);
+		if (ret)
+			goto incomplete_message;
+
+		if (axiado_mbox_handle_rx_error(priv))
+			return IRQ_HANDLED;
+	}
+
+	for (i = 1; i < num_words; i++) {
+		word = readl(priv->mbox_reg);
+		put_unaligned_le32(word,
+				   buf + i * sizeof(u32));
+	}
+
+	if (axiado_mbox_handle_rx_error(priv))
+		return IRQ_HANDLED;
+
+	if (READ_ONCE(priv->active))
+		mbox_chan_received_data(chan, priv->rx_buffer);
+
+	return IRQ_HANDLED;
+
+incomplete_message:
+	dev_warn_ratelimited(chan->mbox->dev,
+			     "Channel %u received an incomplete message\n",
+			     priv->channel_num);
+
+invalid_message:
+	writel(AXIADO_MBOX_CSR_FLUSH, priv->csr_reg);
+
+	return IRQ_HANDLED;
+}
+
+static int axiado_mbox_startup(struct mbox_chan *chan)
+{
+	struct axiado_channel_data *priv = chan->con_priv;
+
+	writel(AXIADO_MBOX_CSR_FLUSH, priv->csr_reg);
+	writel(AXIADO_MBOX_CSR_ERRORS, priv->csr_reg);
+	WRITE_ONCE(priv->active, true);
+
+	if (priv->channel_num >= AXIADO_MBOX_TX_CHANS)
+		enable_irq(priv->irq);
+
+	return 0;
+}
+
+static void axiado_mbox_shutdown(struct mbox_chan *chan)
+{
+	struct axiado_channel_data *priv = chan->con_priv;
+
+	WRITE_ONCE(priv->active, false);
+
+	if (priv->channel_num >= AXIADO_MBOX_TX_CHANS)
+		disable_irq(priv->irq);
+
+	writel(AXIADO_MBOX_CSR_FLUSH, priv->csr_reg);
+}
+
+static bool axiado_mbox_last_tx_done(struct mbox_chan *chan)
+{
+	struct axiado_channel_data *priv = chan->con_priv;
+
+	return !!(readl(priv->csr_reg) & AXIADO_MBOX_CSR_EMPTY);
+}
+
+static const struct mbox_chan_ops axiado_mbox_chan_ops = {
+	.send_data	= axiado_mbox_send_data,
+	.startup	= axiado_mbox_startup,
+	.shutdown	= axiado_mbox_shutdown,
+	.last_tx_done	= axiado_mbox_last_tx_done,
+};
+
+static int axiado_mbox_probe(struct platform_device *pdev)
+{
+	const struct axiado_mbox_data *drv_data;
+	struct axiado_channel_data *ch_data;
+	struct device *dev = &pdev->dev;
+	struct axiado_mbox *mb;
+	unsigned int irq_idx = 0;
+	unsigned int rx_chan;
+	unsigned int i;
+	int ret;
+
+	drv_data = device_get_match_data(dev);
+	if (!drv_data)
+		return -ENODEV;
+
+	mb = devm_kzalloc(dev, sizeof(*mb), GFP_KERNEL);
+	if (!mb)
+		return -ENOMEM;
+
+	mb->mbox.dev = dev;
+	mb->mbox.num_chans = drv_data->num_chans;
+
+	mb->mbox.chans = devm_kcalloc(&pdev->dev,
+				      drv_data->num_chans,
+				      sizeof(*mb->mbox.chans),
+				      GFP_KERNEL);
+	if (!mb->mbox.chans)
+		return -ENOMEM;
+
+	mb->tx_base = devm_platform_ioremap_resource_byname(pdev, "tx");
+	if (IS_ERR(mb->tx_base))
+		return PTR_ERR(mb->tx_base);
+
+	mb->rx_base = devm_platform_ioremap_resource_byname(pdev, "rx");
+	if (IS_ERR(mb->rx_base))
+		return PTR_ERR(mb->rx_base);
+
+	ch_data = devm_kcalloc(&pdev->dev,
+			       drv_data->num_chans,
+			       sizeof(*ch_data),
+			       GFP_KERNEL);
+	if (!ch_data)
+		return -ENOMEM;
+
+	for (i = 0; i < drv_data->num_chans; i++) {
+		ch_data[i].channel_num = i;
+		ch_data[i].chan = &mb->mbox.chans[i];
+		ch_data[i].chan_msg_size = drv_data->msg_size;
+
+		mb->mbox.chans[i].con_priv = &ch_data[i];
+
+		if (i < AXIADO_MBOX_TX_CHANS) {
+			ch_data[i].mbox_reg = mb->tx_base + (i * AXIADO_MBOX_CHAN_STRIDE);
+			ch_data[i].csr_reg = mb->tx_base + AXIADO_MBOX_TX_REG_STRIDE +
+					       (i * AXIADO_MBOX_CHAN_STRIDE);
+			ch_data[i].irq = -1;
+			continue;
+		}
+
+		ch_data[i].rx_buffer = devm_kmalloc(dev, drv_data->msg_size,
+						    GFP_KERNEL);
+		if (!ch_data[i].rx_buffer)
+			return -ENOMEM;
+
+		rx_chan = i - AXIADO_MBOX_TX_CHANS;
+		ch_data[i].mbox_reg = mb->rx_base +
+				       (rx_chan * AXIADO_MBOX_CHAN_STRIDE);
+		ch_data[i].csr_reg = mb->rx_base + AXIADO_MBOX_RX_REG_STRIDE +
+				      (rx_chan * AXIADO_MBOX_CHAN_STRIDE);
+		ch_data[i].irq = platform_get_irq(pdev, irq_idx++);
+		if (ch_data[i].irq < 0)
+			return dev_err_probe(dev, ch_data[i].irq,
+					     "Failed to get IRQ for channel %u\n", i);
+
+		ret = devm_request_threaded_irq(dev, ch_data[i].irq, NULL,
+						axiado_rx_thread,
+						IRQF_ONESHOT | IRQF_NO_AUTOEN,
+						dev_name(dev), &ch_data[i]);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to request IRQ for channel %u\n", i);
+
+		dev_dbg(dev, "RX chan %u -> irq %d\n", i, ch_data[i].irq);
+	}
+
+	platform_set_drvdata(pdev, mb);
+	mb->drv_data = drv_data;
+	mb->mbox.ops = &axiado_mbox_chan_ops;
+	mb->mbox.txdone_irq = false;
+	mb->mbox.txdone_poll = true;
+	mb->mbox.txpoll_period = 5;
+
+	return devm_mbox_controller_register(dev, &mb->mbox);
+}
+
+static const struct axiado_mbox_data axiado_drv_data = {
+	.num_chans = AXIADO_MBOX_TX_CHANS + AXIADO_MBOX_RX_CHANS,
+	.msg_size = 256,
+};
+
+static const struct of_device_id axiado_mbox_of_match[] = {
+	{ .compatible = "axiado,ax3005-mailbox", .data = &axiado_drv_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, axiado_mbox_of_match);
+
+static struct platform_driver axiado_mbox_driver = {
+	.driver = {
+		.name = "axiado-mailbox",
+		.of_match_table = axiado_mbox_of_match,
+	},
+	.probe = axiado_mbox_probe,
+};
+module_platform_driver(axiado_mbox_driver);
+
+MODULE_AUTHOR("AXIADO CORPORATION");
+MODULE_DESCRIPTION("Axiado Mailbox driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


