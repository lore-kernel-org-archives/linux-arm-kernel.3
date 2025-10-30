Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AD5CCF9F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 09:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0qIG4Tb5LaEWWtFfIg71f8a2JEhYCKrBGdft9UHOXjc=; b=i3S36o007H8rBJHCmyu5NAhRn6
	MhpZXrCcCDuo24H8HVwJin7snlniiCFJB1eCM6IT50BfQg0gY+VBvokIkCEh6Ch5hfyiaB4VBEHwY
	uN7116FpLg6AVkcoKKAyD7y53Y9f/M40qcGnOCD92z2QPuasM60scpQjv5C/E+lXWzvFfZIyzyfgM
	6MOUbTdxJkSZO4S8IwDFzplCmofwoYrNbPP/dhzA0LiH0CPhGf/PDls/KnzpR4GmqvSEjxt7xf7ed
	A3yxw0FoGPJFcjFl3B9zjU79iDtOf77oLkYGoQvdkj9mELk29ziFpLMRdfwy9E+MR/B1CjviCm/LA
	WWIOp2bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPR9-00000003uq8-3Ekx;
	Thu, 30 Oct 2025 09:59:19 +0000
Received: from [114.94.151.114] (helo=mail-sh.amlogic.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPQz-00000003ugj-0ZN3;
	Thu, 30 Oct 2025 09:59:10 +0000
Received: from rd03-sz.software.amlogic (10.28.11.121) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.61; Thu, 30 Oct 2025
 17:43:50 +0800
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Xianwei Zhao
	<xianwei.zhao@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	"Dmitry Rokosov" <ddrokosov@sberdevices.ru>, robh+dt <robh+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
CC: Jian Hu <jian.hu@amlogic.com>, devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>, linux-amlogic
	<linux-amlogic@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 2/5] dt-bindings: clock: add Amlogic T7 SCMI clock controller
Date: Thu, 30 Oct 2025 17:43:42 +0800
Message-ID: <20251030094345.2571222-3-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20251030094345.2571222-1-jian.hu@amlogic.com>
References: <20251030094345.2571222-1-jian.hu@amlogic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.28.11.121]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_025909_177484_5D0CDA06 
X-CRM114-Status: UNSURE (   9.59  )
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

Add DT bindings for the SCMI clock controller of the Amlogic T7 SoC family.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 include/dt-bindings/clock/amlogic,t7-scmi.h | 47 +++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 include/dt-bindings/clock/amlogic,t7-scmi.h

diff --git a/include/dt-bindings/clock/amlogic,t7-scmi.h b/include/dt-bindings/clock/amlogic,t7-scmi.h
new file mode 100644
index 000000000000..27bd257bd4ea
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,t7-scmi.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (C) 2024-2025 Amlogic, Inc. All rights reserved
+ */
+
+#ifndef __T7_SCMI_CLKC_H
+#define __T7_SCMI_CLKC_H
+
+#define CLKID_DDR_PLL_OSC			0
+#define CLKID_AUD_PLL_OSC			1
+#define CLKID_TOP_PLL_OSC			2
+#define CLKID_TCON_PLL_OSC			3
+#define CLKID_USB_PLL0_OSC			4
+#define CLKID_USB_PLL1_OSC			5
+#define CLKID_MCLK_PLL_OSC			6
+#define CLKID_PCIE_OSC				7
+#define CLKID_ETH_PLL_OSC			8
+#define CLKID_PCIE_REFCLK_PLL_OSC		9
+#define CLKID_EARC_OSC				10
+#define CLKID_SYS1_PLL_OSC			11
+#define CLKID_HDMI_PLL_OSC			12
+#define CLKID_SYS_CLK				13
+#define CLKID_AXI_CLK				14
+#define CLKID_FIXED_PLL_DCO			15
+#define CLKID_FIXED_PLL				16
+#define CLKID_FCLK_DIV2_DIV			17
+#define CLKID_FCLK_DIV2				18
+#define CLKID_FCLK_DIV2P5_DIV			19
+#define CLKID_FCLK_DIV2P5			20
+#define CLKID_FCLK_DIV3_DIV			21
+#define CLKID_FCLK_DIV3				22
+#define CLKID_FCLK_DIV4_DIV			23
+#define CLKID_FCLK_DIV4				24
+#define CLKID_FCLK_DIV5_DIV			25
+#define CLKID_FCLK_DIV5				26
+#define CLKID_FCLK_DIV7_DIV			27
+#define CLKID_FCLK_DIV7				28
+#define CLKID_FCLK_50M_DIV			29
+#define CLKID_FCLK_50M				30
+#define CLKID_CPU_CLK				31
+#define CLKID_A73_CLK				32
+#define CLKID_CPU_CLK_DIV16_DIV			33
+#define CLKID_CPU_CLK_DIV16			34
+#define CLKID_A73_CLK_DIV16_DIV			35
+#define CLKID_A73_CLK_DIV16			36
+
+#endif /* __T7_SCMI_CLKC_H */
-- 
2.47.1


