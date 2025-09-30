Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271C4CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 09:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1QU/X4FJP/Pl1q1qZ9o2u/vyqhuHmO3VaMUumbBtBCI=; b=ZvFFo2cTbnBmwrJvory1R3/B/D
	qlOYn/n5AMPo6LVXMQKd3fuBgqsQaJUG1Mdkoi4hX9vEui3KwcgcbHkfVzsJ8GkUv8HgnRoMEI0k7
	Zp3EphQW4AUhPoq0fHEVd4uv+BMA7R96ZQ+qFQhcBtrQQFZNlH7BD1nYHn8WfhJBTBEWUdk80u0YD
	Gnti41Km1xOeRk67DQM32ryNYwRN7ekbgI886JaYPGeD3l08U6ITNU5Ito5lPScPB7h680G2vRW/u
	mkE1kZsZkvH5M9mcvDZx+wdtq54/Dhhvt5wDDwlvWWFEwxd9m1nkEakdy3DFrKSUbMYCvkDCRYmgg
	Xj12IqvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Wnf-00000004q4U-1h7z;
	Tue, 30 Sep 2025 09:37:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Wnc-00000004q0I-0omY;
	Tue, 30 Sep 2025 09:37:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 838A745913;
	Tue, 30 Sep 2025 09:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F585C113D0;
	Tue, 30 Sep 2025 09:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759225051;
	bh=tvbsNP2qVU1cS/ayMypPvum2ysqLXXw2xrupi3Us5z4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rr6/GDpauEY2HHAqRcDmiTNhPC7TN9DAYYCycVXlDHtgTxBjCkc0uJgP65l+B+keg
	 IG5OhTR5p2myHJndvJuwe6EBdnrjZG+N3ZocVpjpthu4fDFCEKSIhqnL0tv99g9Z3f
	 /V4WdCoMcyEn11g12Y7Dmojcrfqdi5QKtD7H/QqDqdPPB3elrqmiIhYMOcG76ao0z9
	 /eT1wpxwfTl3tvjwkyJwiUWcYNPXbRbeqkNYAiifZ7b8iIdE14ORShYP/+C9deIr4Y
	 Dpj5k0HogW95ceGK2HuPd2zss+gv7edzgvwTBJ8qWqbvCT8eVyCL68ADpgGTBa2DVf
	 cOxoDpwD8M2vA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41289CAC5B8;
	Tue, 30 Sep 2025 09:37:31 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Tue, 30 Sep 2025 17:37:14 +0800
Subject: [PATCH 01/19] dt-bindings: clock: Add Amlogic A4 SCMI clock
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-a4_a5_add_clock_driver-v1-1-a9acf7951589@amlogic.com>
References: <20250930-a4_a5_add_clock_driver-v1-0-a9acf7951589@amlogic.com>
In-Reply-To: <20250930-a4_a5_add_clock_driver-v1-0-a9acf7951589@amlogic.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759225047; l=1814;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=lepg6iT8bmM81rEU5ToL/dWT4QLnpMs52RztUgBBpJI=;
 b=9DlKusjYS9lvJ5c+yIorherlGXVHoEWA7WXl+kn4Crs79ES3JyMECgX8nYfKzxnBZ3aewWJbC
 PNqO/UxUUyuC5w6Rvv8v4ryBepX5x7v5MVHuUbUJjfzWlvDFRb2nrux
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_023732_366708_5E4E283C 
X-CRM114-Status: UNSURE (   9.98  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

Add the SCMI clock controller dt-bindings for Amlogic A4 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 include/dt-bindings/clock/amlogic,a4-scmi-clkc.h | 42 ++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/include/dt-bindings/clock/amlogic,a4-scmi-clkc.h b/include/dt-bindings/clock/amlogic,a4-scmi-clkc.h
new file mode 100644
index 000000000000..454e492f8f6f
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,a4-scmi-clkc.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2025 Amlogic, Inc. All rights reserved.
+ * Author: Chuan Liu <chuan.liu@amlogic.com>
+ */
+
+#ifndef __AMLOGIC_A4_SCMI_CLKC_H
+#define __AMLOGIC_A4_SCMI_CLKC_H
+
+#define CLKID_OSC				0
+#define CLKID_SYS_CLK				1
+#define CLKID_AXI_CLK				2
+#define CLKID_CPU_CLK				3
+#define CLKID_FIXED_PLL				4
+#define CLKID_GP1_PLL				5
+#define CLKID_ACLKM				6
+#define CLKID_SYS_PLL_DIV16			7
+#define CLKID_CPU_CLK_DIV16			8
+#define CLKID_FCLK_50M_PREDIV			9
+#define CLKID_FCLK_50M_DIV			10
+#define CLKID_FCLK_50M				11
+#define CLKID_FCLK_DIV2_DIV			12
+#define CLKID_FCLK_DIV2				13
+#define CLKID_FCLK_DIV2P5_DIV			14
+#define CLKID_FCLK_DIV2P5			15
+#define CLKID_FCLK_DIV3_DIV			16
+#define CLKID_FCLK_DIV3				17
+#define CLKID_FCLK_DIV4_DIV			18
+#define CLKID_FCLK_DIV4				19
+#define CLKID_FCLK_DIV5_DIV			20
+#define CLKID_FCLK_DIV5				21
+#define CLKID_FCLK_DIV7_DIV			22
+#define CLKID_FCLK_DIV7				23
+#define CLKID_SYS_MMC_PCLK			24
+#define CLKID_SYS_CPU_CTRL			25
+#define CLKID_SYS_IRQ_CTRL			26
+#define CLKID_SYS_GIC				27
+#define CLKID_SYS_BIG_NIC			28
+#define CLKID_AXI_SYS_NIC			29
+#define CLKID_AXI_CPU_DMC			30
+
+#endif /* __AMLOGIC_A4_SCMI_CLKC_H */

-- 
2.42.0



