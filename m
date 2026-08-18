Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9637BC5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 03:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gq6yqqcZKc0uXDMf9Mkywd3g1kzFUuFs6VHpLtUJKnc=; b=EzojGZXWKrl2qbQQVwVTBClop4
	WydANeJ9zXOw7RfcwewAgGx9XarMkvUir0B1DOfRC4vSI+0Fb8kGudnBM+xT3GNNP924h1KFiAgx9
	QjYSN8jpe9TH8I2mlS4sdHPqrqXpxyiVBu8kbzypl5SvvPSy1adbwvxXGPh9GD3DYjqfQFp8uPyTd
	HbE0cXdP4WOs1ocErSFXRnMa9MTsMbrRjjd4PK7PxA2PfGz9cKh6pkBioAxptFK+SpoNYpJcYgz1l
	a1oVJI6inVjVhmbTnv6kFJ7+Pk2l2qyRQKCODRRwB/44HHQqj0nSRW5gCc13Dh4YrZjDPjZ+PPtCX
	H/kSiJaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwAav-00000007CED-0F2k;
	Tue, 18 Aug 2026 03:34:33 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwAar-00000007CCh-49QY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 03:34:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQprYtlcpqIwF0FSyaCzJ2lxyqjeGZcQJVXxVY0OtxJyzGvoikAbRWdIUyao2+/7Uv0ZM9XeWeDmXe8aDTslwpOc6AnzZInxk4evIvmC4Zkev9st1IrK5TskmO80EExB1iRy2fc9yggtjQ7skXt1olaTzNYMBXBOzuV+Kz4IcTofVyJLsLw8v7PHMGEj3WPgth3N9jvdonOzbkL364cw5j5SiV2LaVi/MF0gF1dag4DL5/t9fj/m5m9ge1K9i/tl3xX7xzlorVkh4tj+ADhOOan6ao0U9B/+R5hNJDNa+TPipprGRjnEqeDeIgY9/V/XWyk4T2gsM+JusTxjQgx2Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gq6yqqcZKc0uXDMf9Mkywd3g1kzFUuFs6VHpLtUJKnc=;
 b=gPQQDgBgFOvBuSxRpjHlR5aosKuKtApQW60NKBvDBc0ZHN1RZjyqhD1mWlKWWkm454mrMlKp67UnKqg39c9tLVzjQjeGxRHz2t0zLTiBq5d23bVjXUJzmUKfYhXbVVUwiMQi3et90ek05w+thAmAUCnWoh/r21XuK0dxr74kjPNOcE2ZmqM3mVVsPgqlsbONZvjAoU3Z4Ht7I5ooHY1rpCmNxmecVVGJQqvT6T2UiE5N+Yck/UxV7ihCFqEtwBVjHl8oXCnZUM7cxkVGJ/tdzeSAT7/gW/YdOYXu7mbtG/vEKwUgCpPtDwkX0IGfLqmNaVc1ZcZXygPteFtDh3JzWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gq6yqqcZKc0uXDMf9Mkywd3g1kzFUuFs6VHpLtUJKnc=;
 b=qqtA+qEGGd///6hp4ZT/7KQfdCQUQrJuYcViWVrLUGW4GsvI74D26QCrxrWalfQzMuK0NgeA9w2Bi9Tf3HGJDTI2PbSRHkrr7Na+az5VnZN5Y6UUtq2qablbnKxLoq/uKEd445jsZWuITZj2NzRBt9kNW83aX1/2m7sy8qpAV0BS3BlAGhNGE7SkXu5g51cqxZYtK3KUXxDGn8aT03+xhQY9amDZBGQ3CzB9cbKxX6vULhStSO0UUgn4QpCULBYCB6ENQ/dgsHtxMofFYl0NUeRdr6MdS+pU0d1yeLECK1c9+Arn/LHf3wr0lJ3JhnNixVm4i1FK88/aiHn0aBUO4w==
Received: from BL1P221CA0012.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::6)
 by IA2PR18MB5885.namprd18.prod.outlook.com (2603:10b6:208:4af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 03:34:15 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:2c5:cafe::57) by BL1P221CA0012.outlook.office365.com
 (2603:10b6:208:2c5::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Tue,
 18 Aug 2026 03:34:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Tue, 18 Aug 2026 03:34:14 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 8632640BFE04;
	Mon, 17 Aug 2026 20:34:13 -0700 (PDT)
From: Swark Yang <syang@axiado.com>
Date: Mon, 17 Aug 2026 20:34:08 -0700
Subject: [PATCH v2 2/2] mailbox: add Axiado AX3005 mailbox driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-upstream-axiado-ax3005-mailbox-upstream-v2-2-25e713eccff3@axiado.com>
References: <20260817-upstream-axiado-ax3005-mailbox-upstream-v2-0-25e713eccff3@axiado.com>
In-Reply-To: <20260817-upstream-axiado-ax3005-mailbox-upstream-v2-0-25e713eccff3@axiado.com>
To: Krishnakumar Kesavan <kkesavan@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
 Swark Yang <syang@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=13816; i=syang@axiado.com;
 h=from:subject:message-id; bh=zBM3hKSuVqpzgeK9PV+FInK6q07NIPR2S8rP9pE4f1E=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhqzmS1ui8nhZ0p2S5q57IqbH/Vc17nvKrvqvhuvW5Ap/L
 LVt8pjYUcrCIMbBICumyPJV51v+yVzte517V5bCzGFlAhnCwMUpABM56c/wz1b6dWXozwuqLb/v
 HU3iP2VXGvlqgeE0vhqlm0YHT/ULlDEy3PC/H3V10ezNPTIWnWdrL0037hZ+flS/VnWy+TWXCb7
 8fAA=
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|IA2PR18MB5885:EE_
X-MS-Office365-Filtering-Correlation-Id: 06ce6a25-a94f-4479-efff-08defcd993b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: YQIkVbVecWHZTqAWBoNR4Ix0dzzZsBJHh39xAVYYQJ+EAWgHWJALMzjXwf6g3Ch83w1hX+GBaUKChjvvRozuuOPoTANZPu/8/rkfUmV6yztLKhtHlwMFqqWh/SwQWIVmNf8NjbayuBp/t9zvOHtA9aFiAvemM3roUfbR1aWE4hv4G5usymeO8HknIWiKg5J/JqlfELYpE6PP7Z0I3/F3qDQHZ0eLYqj3lnBAkXrvP5Ax0tNCxu3b/xjwCavy5WUcKqsgyo+mOTbaiNFNeQrCpn3RI3HQ7U4SNcUaOnG//Ks8g8b04feRZTThfahmNP/Si/JGue87I/e9dZEmnBzuOcDEw5j69stN5ugK7T3lsWI2lmXV/xxeyTHvP+TYABjiqoMiwguYIppWZolt4Nlj7UlPqgWzKfSczIdAImVj9E5qIHxWuPik1Ic0P4QNoJSesh4O248yu/cRnQPcnC2A6+CB1cm5xVx59gtyYy11wq7ctKlz695pFOY5+sV2PdMtTxD2AkrvmnFu4cVJoM4YWf68fy6q86feB9S4wwvJOrqtQL2rezv/cvCkUZ3Yws15BPk83FekIYzH5yJUKMw6xudt00GkDG0obQzzocxlXCujfidAENshfwnEjXNUSpV1KAqaJxRQjuPFyBaAkx2oBNTxWhuCRMZM8o0idbHfAY5d562nTWixNYvJQhC1gUSdbdK5jyDvDJd1Rsj0FknvcA==
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qV49t8RXYduu/PKS9ndcSg0/h8+3l+dHZawgkXuM3kS+FDtOoK64rK1uv6mAF9GmSZGV94gE2iK1FodT2ZZnrvYqBXZ627qd55LyXPt0CPStczw1bQq4oNSGAMJeDX/qqXMoJkxz41CP3GuFkCD8Fk4CPsvpzKL0195RuvUwdJM0T8i9ig7SQyPuPxX0cIN0nhevePMrmvI/UxEMftsyR8YLCrdAr82GS4dJXH6yOZwHQmtoDplqsnKo5wNP5B9ZOkWIZrTdIRas4UlKieFo1utXS4gxj/jjcWfo7tBbS5AEaVlx8nqVURWZMRyWg3K3i+mc0IC3g0PDnMP6bRKxfj64tisgHPRQVlSnABb03ItdZFM52n7U3JK7XBgjlZ3GvIWtRDV52qeYHnuRp7/yYKfSiPEwU0IG6kwxaL/554HJi5dtYSz52849V8CZNsE9
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 03:34:14.7830
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ce6a25-a94f-4479-efff-08defcd993b7
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA2PR18MB5885
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_203430_124630_20BC6BE5 
X-CRM114-Status: GOOD (  26.08  )
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
 drivers/mailbox/Kconfig          |  10 +
 drivers/mailbox/Makefile         |   2 +
 drivers/mailbox/axiado-mailbox.c | 395 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 408 insertions(+)

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
index 000000000000..3a3cf7421863
--- /dev/null
+++ b/drivers/mailbox/axiado-mailbox.c
@@ -0,0 +1,395 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021-2026 Axiado Corporation (or its affiliates).
+ */
+
+#include <linux/atomic.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/bitfield.h>
+#include <linux/debugfs.h>
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
+#define AXIADO_MBOX_RX_TIMEOUT_US	1000
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
+	bool active;
+	atomic_t fifo_errors;
+};
+
+/* mailbox side */
+struct axiado_mbox {
+	struct mbox_controller mbox;
+	const struct axiado_mbox_data *drv_data;
+	void __iomem *tx_base;
+	void __iomem *rx_base;
+	struct dentry *debugfs_dir;
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
+	atomic_inc(&priv->fifo_errors);
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
+		dev_warn_ratelimited(mb->mbox.dev, "Channel %u is busy\n", idx);
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
+static irqreturn_t axiado_rx_thread(int irq, void *dev_id)
+{
+	struct axiado_channel_data *priv = dev_id;
+	struct mbox_chan *chan = priv->chan;
+	struct axiado_mbox *mb = dev_get_drvdata(chan->mbox->dev);
+	u8 *buf = priv->rx_buffer;
+	unsigned int num_words;
+	unsigned int remaining;
+	unsigned int i;
+	u32 msg_len;
+	u32 word;
+	u32 csr;
+	int ret;
+
+	/*
+	 * Clear and log/count any pending errors, but don't discard data
+	 * on their account alone: a rejected overflow write doesn't
+	 * corrupt what was already safely queued ahead of it, so let the
+	 * length-based read below decide whether what's here is usable.
+	 */
+	axiado_mbox_clear_fifo_errors(priv);
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
+	if (msg_len < sizeof(u32) || msg_len > mb->drv_data->msg_size)
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
+					 (csr & AXIADO_MBOX_CSR_ERRORS) ||
+					  FIELD_GET(AXIADO_MBOX_CSR_LEVEL, csr) >=
+					  remaining,
+					  AXIADO_MBOX_RX_POLL_US,
+					  AXIADO_MBOX_RX_TIMEOUT_US);
+		if (ret)
+			goto incomplete_message;
+
+		axiado_mbox_clear_fifo_errors(priv);
+	}
+
+	for (i = 1; i < num_words; i++) {
+		word = readl(priv->mbox_reg);
+		put_unaligned_le32(word, buf + i * sizeof(u32));
+	}
+
+	axiado_mbox_clear_fifo_errors(priv);
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
+	/*
+	 * Only flush on a genuine error. A blind flush here would discard
+	 * a message the peer legitimately sent before this side started
+	 * up (e.g. during normal boot sequencing), which is not corrupt
+	 * and does not need resyncing.
+	 */
+	if (axiado_mbox_clear_fifo_errors(priv))
+		writel(AXIADO_MBOX_CSR_FLUSH, priv->csr_reg);
+
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
+	if (axiado_mbox_clear_fifo_errors(priv))
+		writel(AXIADO_MBOX_CSR_FLUSH, priv->csr_reg);
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
+static void axiado_mbox_debugfs_remove(void *dentry)
+{
+	debugfs_remove_recursive(dentry);
+}
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
+	mb->debugfs_dir = debugfs_create_dir(dev_name(dev), NULL);
+	ret = devm_add_action_or_reset(dev, axiado_mbox_debugfs_remove,
+				       mb->debugfs_dir);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < drv_data->num_chans; i++) {
+		char name[16];
+
+		ch_data[i].channel_num = i;
+		ch_data[i].chan = &mb->mbox.chans[i];
+
+		mb->mbox.chans[i].con_priv = &ch_data[i];
+
+		snprintf(name, sizeof(name), "chan%u-errors", i);
+		debugfs_create_atomic_t(name, 0444, mb->debugfs_dir,
+					&ch_data[i].fifo_errors);
+
+		if (i < AXIADO_MBOX_TX_CHANS) {
+			ch_data[i].mbox_reg = mb->tx_base + (i * AXIADO_MBOX_CHAN_STRIDE);
+			ch_data[i].csr_reg = mb->tx_base + AXIADO_MBOX_TX_REG_STRIDE +
+					       (i * AXIADO_MBOX_CHAN_STRIDE);
+			ch_data[i].irq = -1;
+			continue;
+		}
+
+		ch_data[i].rx_buffer = devm_kzalloc(dev, drv_data->msg_size,
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
+MODULE_AUTHOR("Axiado Corporation");
+MODULE_DESCRIPTION("Axiado Mailbox driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


