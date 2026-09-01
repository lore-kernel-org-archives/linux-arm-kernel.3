Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F8FC624D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 11:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKCeWdD3esCiQBbiy3fpNmUiloQNTLOC1fFjOsvDmFg=; b=zhO+mZXUd/V2hg5l1/FUNcQxkX
	evieuQYYb6dCaO5JhBQ8i3ArwoorzSvEpDxVzK/B2YT+3G1MH46PIGgwuVYbL84gmAgDkNCXHbDfs
	iBOnPn2py0DqbK+WeJDz2f9iqJXvGZ+N/P2w9jOV6QDvtkp24nahzP0FyAn6+P2DRtwOZAIuMPhC2
	92NVtvTMJ3JJjLvHqXRBS3JQPBUeXJOTwfKbRfI7NjnP3A3SKpv2fU+OElJWDYXvYFkmakMbOuXFA
	0bPlHDJqxH1wKHCo2QK6cROf/HcXxnI3u1vM979j3OSQSnxihDKAImAYdif866RaZOmyvK6vpiZd4
	rLla2C0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1MmW-0000000BhaT-1peN;
	Tue, 01 Sep 2026 11:36:00 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1MmT-0000000BhTz-3yfb;
	Tue, 01 Sep 2026 11:35:59 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 1 Sep
 2026 19:35:39 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 1 Sep 2026 19:35:39 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Tue, 1 Sep 2026 19:35:30 +0800
Subject: [PATCH 3/8] i3c: mipi-i3c-hci: Add a quirk for 64-bit DMA
 addressing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260901-b4-i3c-hci-ast2700-v1-3-19909e7cbd7e@aspeedtech.com>
References: <20260901-b4-i3c-hci-ast2700-v1-0-19909e7cbd7e@aspeedtech.com>
In-Reply-To: <20260901-b4-i3c-hci-ast2700-v1-0-19909e7cbd7e@aspeedtech.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788262538; l=2535;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=w8DwWiTyjCgKHUh3jNegniNOD5FFOdIu9HTX8Den63I=;
 b=zakcGFU95zIF9c596EWGOrqXlXM4wUfpzGev03srlA/CbJygcFlzgNMnkc2Q3kd0uBFwf9HFP
 5576jPxF/gFAjNsiAAYqwNub4CH4bWgjn3W7UY6ik5cId2GXEvjb1vU
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_043557_991540_8D73D128 
X-CRM114-Status: GOOD (  13.74  )
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

The HCI ring base registers are 64 bits wide by specification, but not
every implementation wires the upper half, so the driver leaves the
platform device at the default 32-bit DMA mask unless told otherwise.
ASPEED platforms place all of DRAM above the 32-bit boundary
(0x4_00000000), so under the default mask every dma_alloc_coherent()
call for the DMA rings fails.

Add HCI_QUIRK_DMA_64BIT for controllers whose DMA engine drives the
full address width, and declare a 64-bit streaming and coherent DMA
mask for them before the rings are allocated.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Assisted-by: Claude:claude-fable-5
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 7 +++++++
 drivers/i3c/master/mipi-i3c-hci/hci.h  | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index a624e3c40484..c03c3a9cbe4f 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -10,6 +10,7 @@
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/device.h>
+#include <linux/dma-mapping.h>
 #include <linux/errno.h>
 #include <linux/i3c/master.h>
 #include <linux/interrupt.h>
@@ -1167,6 +1168,12 @@ static int i3c_hci_probe(struct platform_device *pdev)
 	hci->quirks = (unsigned long)device_get_match_data(&pdev->dev);
 	if (!hci->quirks && platform_get_device_id(pdev))
 		hci->quirks = platform_get_device_id(pdev)->driver_data;
+	if (hci->quirks & HCI_QUIRK_DMA_64BIT) {
+		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					     "cannot set DMA mask\n");
+	}
 
 	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &clks);
 	if (ret < 0)
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index f50fc1e22a85..2110f806a53c 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -178,6 +178,7 @@ struct i3c_hci_dev_data {
 #define HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET	BIT(8)  /* Do PIO queue SW resets after DMA abort */
 #define HCI_QUIRK_DMA_REQUIRES_HC_ABORT		BIT(9)  /* Use HC_CONTROL ABORT to abort DMA */
 #define HCI_QUIRK_DAT_INDEX_IS_ADDR	BIT(10)  /* DAT entries are indexed by device address */
+#define HCI_QUIRK_DMA_64BIT		BIT(11)  /* Controller DMA supports 64-bit addressing */
 
 /* global functions */
 void mipi_i3c_hci_resume(struct i3c_hci *hci);

-- 
2.34.1


