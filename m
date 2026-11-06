Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498E0606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 08:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RMv78yFt;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Sf4vJ/ca
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IpqVapdmaNvaZjNm5nNBwgM6ekPayTRWFOsP2LIK93w=; b=RMv78yFtQbo1Zd
	RtM0poDg3dKCi6wMfvdWpf3N0etOISBfuU3yXlLWDRDon6CZesW2TDvLf8xWWQLwG9RSyOQHAb+nP
	OOq0Iu+0bEg9XAAsN2fWcj8PWI5ypaxe45NR98gguFk0VmeUQLU16oqJ8gP8Xei31i5Ox1Cw7se+S
	e37tteVg2RGDsG0mAULRWfG+dpytNklCLC1+/FzvrfspZAJGvp/Y5aHienG4+aM4rC5kW1SPN8tJg
	98lK4+2gLYA8AKBf+tZv1fGsbHVcpXZ1C03vVleCaipgme9s/eswMkxcrtHdwRcRtuZJgpGGaAG86
	ZQOFJpYa8r6BKHVlz7jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFLj-0000000BaJh-1A4i;
	Fri, 06 Nov 2026 08:31:03 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFLO-0000000BZju-0l6C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 08:30:54 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48e4831c028so344422f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 00:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793953840; x=1794558640; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IpqVapdmaNvaZjNm5nNBwgM6ekPayTRWFOsP2LIK93w=;
        b=Sf4vJ/caNWKrkObJhhm5ahaloCBhHIMXlouTn7AIAkH532DRJirKXzrYP8G35AiJ9S
         BHJolRFaBcq54fkAwpXWUeGI1Aq0VRHqQ8QFhsIAbvHyxL7N+UYQoFMVqwb369pxr4N0
         lUnij6d3o9PHhq+o5cfilU/p73Np1vBnNHaXrs1dxm3U5daCzfp9NydNoC31WNt3XOsY
         LjgkCNydxeUtQJT61fxmXBtjijU/w/0rIkIVxQgCV9sNPBd5BiB5rKi62/8ViIpHDjxL
         ggUgIBXmymLUG7Eo0Thq8NN/YeEDBmQRZ1BSF5UtYSbE6GKimNeJV01woOixVfazPamd
         xLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953840; x=1794558640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IpqVapdmaNvaZjNm5nNBwgM6ekPayTRWFOsP2LIK93w=;
        b=eb7Bv7ZlVlTlHisCNR0qyjeKHBXgGUf5aSQAac8dc1kTbkak2INv5rex6SNigwmOfT
         gXJBtsJPplC4ZhO5NObGHDZnFwgyVggC73C81eKGqjvjZPeLH/Xaby1SHDxzfit4kfT9
         XbM7HElFSngucE6/P3qeNroVE9aD602h8hDfRSKjCiUdbtMNJ7Cgl18u/vET+JMv0jzz
         7TDLZR3sqxmlJjhAw2wo8JsB8LY4FoHLqWz8ozijUh0I+uff5cgtB94ZvW4TD3XPtWGJ
         RhDZAGbPgxi7LH7D1+L55D8AjwDBPQtCAJKdEZAvGvl/On9smQK1t+Xiz94m9MtujP4X
         ekGQ==
X-Forwarded-Encrypted: i=1; AL+hErGvo5VKP+yYuSUiH6FIQ7j3FA0klx+rwaxDLXT1ImS/DjafB88JstEC5IR6DNXKqwcGrK61EzJlDnk7Emw82BT0@lists.infradead.org
X-Gm-Message-State: APuU4Z/4VH1zvf4RKhno1cAcT2GiimTb09Pb1j65rc8JA+SHHlIg0n0t
	dXiRjs9oRePP/Rf640Q1Cb+m9MhiXQVp8ZuSM8Df8t8F1HvKPrlEvYfNoMMiKvYN6VY=
X-Gm-Gg: AYBFou1vrU/ALMQUtDDY74Elq0ldV/U/N+VvhdgaXG3vZZ1I5qL99MZ8Mj5FUDOW3Uf
	ciBy/MVj+gqDav0B5vRds/uPdHfnjb64duK7Ss3YPWZ74lUN5kh87dBRPOxz5JQzxX2+AKdG0xU
	0ZQDjfpwPNZ7KpUr/afqrQXD4OrAMFxO/ySOYHaqDF6yPTyapRbKn0cKhY34SmlOM8cfGYkGQuj
	nCFnumnM9E2Em2FPGNMrC4HwX/LBsFiZYiMbqfdzMoMMCsWLkQtRMboI9r+ZpCZlez0pjc8R2ly
	fK+oAjmvzwsVgjRv9rD4op4XmQCKsdqBAc2McJkzW3tj5uUKkHkQehdv7mssOKSLhXEBHvNDjqR
	J4avygLQZHI7cdSYgCzTh2kTDl6Wqii5LfGbEChrcLJspu/Mk9R/i/lFJd7haLLGRNkwJgS+H6Z
	y1QWjczXpW/I1ltXAwsLxvnYHEbmup9tsYOQNO7/eBimSGHfWU92KjStqjtW6KoIatfIG4AokyC
	YHYx79IpxYlLbXx5ezKRQRcHQubAqtT/oxJ4lZ+lI+KjEBtueMISKHIGow2Ib2trm2wCyLjZTVn
	x1Vfov9b8m/bZPT1dgCnnCohvSFw9WcUqi4+4ozvcjbCIzpF/DXYkrK94iEj7gbIKTU9qIQYa+D
	cS+jb7ZoHiLCwuRKDYVNI5C0r0kegodBJaF+A9DGT2i3utQ==
X-Received: by 2002:a05:6000:1a86:b0:486:e707:42eb with SMTP id ffacd0b85a97d-492760da5a7mr3859484f8f.33.1793953840292;
        Fri, 06 Nov 2026 00:30:40 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d8472969sm2366839f8f.58.2026.11.06.00.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:30:39 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 06 Nov 2026 09:30:30 +0100
Subject: [PATCH 7/7] clk: amlogic: Add S7 peripherals clock controller
 driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-upstream-s7-clk-v1-7-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
In-Reply-To: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_003042_712799_DCFE658E 
X-CRM114-Status: GOOD (  17.45  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The S7 peripheral clock tree is derived from S4, but its clock sources
and routing differ.

Add support for the S7 controller so peripheral drivers can obtain
and manage their clocks through the common clock framework.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/Kconfig          |   16 +
 drivers/clk/meson/Makefile         |    1 +
 drivers/clk/meson/s7-peripherals.c | 2149 ++++++++++++++++++++++++++++++++++++
 3 files changed, 2166 insertions(+)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 35f2971448af..43de3653afc3 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -229,6 +229,22 @@ config COMMON_CLK_S4_PERIPHERALS
 	  Support for the peripherals clock controller on Amlogic S805X2 and S905Y4
 	  devices, AKA S4. Say Y if you want S4 peripherals clock controller to work.
 
+config COMMON_CLK_S7_PERIPHERALS
+	tristate "Amlogic S7 SoC peripherals clock controller support"
+	depends on ARM64 || COMPILE_TEST
+	default ARCH_MESON
+	select COMMON_CLK_MESON_REGMAP
+	select COMMON_CLK_MESON_CLKC_UTILS
+	select COMMON_CLK_MESON_DUALDIV
+	select COMMON_CLK_MESON_VID_PLL_DIV
+	imply COMMON_CLK_SCMI
+	help
+	  Support for the peripherals clock controller on Amlogic S805X3 based
+	  devices, AKA S7. This controller provides the clocks of most
+	  peripherals (eMMC/SD, PWM, SPI, I2C, UART, Ethernet, video and
+	  multimedia blocks). Say Y if you want S7 peripherals clock
+	  controller to work.
+
 config COMMON_CLK_S7_PLL
 	tristate "Amlogic S7 SoC PLL controller support"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index 9d439106d11c..5a684f4d6a6c 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_COMMON_CLK_G12A) += g12a.o g12a-aoclk.o
 obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o meson8-ddr.o
 obj-$(CONFIG_COMMON_CLK_S4_PLL) += s4-pll.o
 obj-$(CONFIG_COMMON_CLK_S4_PERIPHERALS) += s4-peripherals.o
+obj-$(CONFIG_COMMON_CLK_S7_PERIPHERALS) += s7-peripherals.o
 obj-$(CONFIG_COMMON_CLK_S7_PLL) += s7-pll.o
 obj-$(CONFIG_COMMON_CLK_T7_PLL) += t7-pll.o
 obj-$(CONFIG_COMMON_CLK_T7_PERIPHERALS) += t7-peripherals.o
diff --git a/drivers/clk/meson/s7-peripherals.c b/drivers/clk/meson/s7-peripherals.c
new file mode 100644
index 000000000000..d5413fc20d05
--- /dev/null
+++ b/drivers/clk/meson/s7-peripherals.c
@@ -0,0 +1,2149 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Amlogic S7 Peripherals Clock Controller Driver
+ *
+ * Copyright (c) 2026 BayLibre, SAS.
+ * Author: Carlo Caione <ccaione@baylibre.com>
+ */
+
+#include <dt-bindings/clock/amlogic,s7-peripherals-clkc.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include "clk-regmap.h"
+#include "clk-dualdiv.h"
+#include "meson-clkc-utils.h"
+#include "vid-pll-div.h"
+
+#define RTC_BY_OSCIN_CTRL0			0x008
+#define RTC_BY_OSCIN_CTRL1			0x00c
+#define RTC_CTRL				0x010
+#define SYS_CLK_CTRL0				0x040
+#define SYS_CLK_EN0_REG0			0x044
+#define SYS_CLK_EN0_REG1			0x048
+#define SYS_CLK_EN0_REG2			0x04c
+#define SYS_CLK_EN0_REG3			0x050
+#define AXI_CLK_CTRL0				0x06c
+#define CECB_CTRL0				0x090
+#define CECB_CTRL1				0x094
+#define SC_CLK_CTRL				0x098
+#define CLK12_24_CTRL				0x0a8
+#define AXI_CLK_EN0				0x0ac
+#define VID_CLK_CTRL				0x0c0
+#define VID_CLK_CTRL2				0x0c4
+#define VID_CLK_DIV				0x0c8
+#define VIID_CLK_DIV				0x0cc
+#define VIID_CLK_CTRL				0x0d0
+#define HDMI_CLK_CTRL				0x0e0
+#define VID_PLL_CLK_DIV				0x0e4
+#define VPU_CLK_CTRL				0x0e8
+#define VPU_CLKB_CTRL				0x0ec
+#define VPU_CLKC_CTRL				0x0f0
+#define VID_LOCK_CLK_CTRL			0x0f4
+#define VDIN_MEAS_CLK_CTRL			0x0f8
+#define VAPB_CLK_CTRL				0x0fc
+#define CDAC_CLK_CTRL				0x108
+#define HTX_CLK_CTRL0				0x11c
+#define HTX_CLK_CTRL1				0x120
+#define VDEC_CLK_CTRL				0x140
+#define VDEC2_CLK_CTRL				0x144
+#define VDEC3_CLK_CTRL				0x148
+#define VDEC4_CLK_CTRL				0x14c
+#define TS_CLK_CTRL				0x158
+#define MALI_CLK_CTRL				0x15c
+#define ETH_CLK_CTRL				0x164
+#define NAND_CLK_CTRL				0x168
+#define SD_EMMC_CLK_CTRL			0x16c
+#define SPICC_CLK_CTRL				0x174
+#define GEN_CLK_CTRL				0x178
+#define SAR_CLK_CTRL0				0x17c
+#define PWM_CLK_AB_CTRL				0x180
+#define PWM_CLK_CD_CTRL				0x184
+#define PWM_CLK_EF_CTRL				0x188
+
+#define S7_COMP_SEL(_name, _reg, _shift, _mask, _pdata, _table) \
+	MESON_COMP_SEL(s7_, _name, _reg, _shift, _mask, _pdata, _table, 0, 0)
+
+#define S7_COMP_DIV(_name, _reg, _shift, _width) \
+	MESON_COMP_DIV(s7_, _name, _reg, _shift, _width, 0, CLK_SET_RATE_PARENT)
+
+#define S7_COMP_GATE(_name, _reg, _bit, _iflags) \
+	MESON_COMP_GATE(s7_, _name, _reg, _bit, CLK_SET_RATE_PARENT | (_iflags))
+
+static struct clk_regmap s7_rtc_dualdiv_in = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = RTC_BY_OSCIN_CTRL0,
+		.bit_idx = 31,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "rtc_dualdiv_in",
+		.ops = &clk_regmap_gate_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "xtal",
+		},
+		.num_parents = 1,
+	},
+};
+
+static const struct meson_clk_dualdiv_param s7_32k_div_table[] = {
+	{ 733, 732, 8, 11, 1 },
+	{ /* sentinel */ }
+};
+
+static struct clk_regmap s7_rtc_dualdiv_div = {
+	.data = &(struct meson_clk_dualdiv_data) {
+		.n1 = {
+			.reg_off = RTC_BY_OSCIN_CTRL0,
+			.shift   = 0,
+			.width   = 12,
+		},
+		.n2 = {
+			.reg_off = RTC_BY_OSCIN_CTRL0,
+			.shift   = 12,
+			.width   = 12,
+		},
+		.m1 = {
+			.reg_off = RTC_BY_OSCIN_CTRL1,
+			.shift   = 0,
+			.width   = 12,
+		},
+		.m2 = {
+			.reg_off = RTC_BY_OSCIN_CTRL1,
+			.shift   = 12,
+			.width   = 12,
+		},
+		.dual = {
+			.reg_off = RTC_BY_OSCIN_CTRL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.table = s7_32k_div_table,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "rtc_dualdiv_div",
+		.ops = &meson_clk_dualdiv_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_rtc_dualdiv_in.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_rtc_dualdiv_sel = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = RTC_BY_OSCIN_CTRL1,
+		.mask = 0x1,
+		.shift = 24,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "rtc_dualdiv_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_rtc_dualdiv_div.hw,
+			&s7_rtc_dualdiv_in.hw,
+		},
+		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_rtc_dualdiv = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = RTC_BY_OSCIN_CTRL0,
+		.bit_idx = 30,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "rtc_dualdiv",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_rtc_dualdiv_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_rtc = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = RTC_CTRL,
+		.mask = 0x3,
+		.shift = 0,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "rtc",
+		.ops = &clk_regmap_mux_ops,
+		.parent_data = (const struct clk_parent_data []) {
+			{ .fw_name = "xtal", },
+			{ .hw = &s7_rtc_dualdiv.hw },
+			{ .fw_name = "ext_32k", },
+		},
+		.num_parents = 3,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static u32 s7_sysclk_parents_val_table[] = { 0, 1, 2, 3, 4, 5, 7 };
+static const struct clk_parent_data s7_sysclk_parents[] = {
+	{ .fw_name = "xtal", },
+	{ .fw_name = "fclk_div2", },
+	{ .fw_name = "fclk_div3", },
+	{ .fw_name = "fclk_div4", },
+	{ .fw_name = "fclk_div5", },
+	{ .fw_name = "axi_frcpu", },
+	{ .hw = &s7_rtc.hw }
+};
+
+static struct clk_regmap s7_sysclk_a_sel = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = SYS_CLK_CTRL0,
+		.mask = 0x7,
+		.shift = 10,
+		.table = s7_sysclk_parents_val_table,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "sysclk_a_sel",
+		.ops = &clk_regmap_mux_ro_ops,
+		.parent_data = s7_sysclk_parents,
+		.num_parents = ARRAY_SIZE(s7_sysclk_parents),
+	},
+};
+
+static struct clk_regmap s7_sysclk_a_div = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = SYS_CLK_CTRL0,
+		.shift = 0,
+		.width = 10,
+		.flags = CLK_DIVIDER_READ_ONLY,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "sysclk_a_div",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_sysclk_a_sel.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_sysclk_a = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = SYS_CLK_CTRL0,
+		.bit_idx = 13,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "sysclk_a",
+		.ops = &clk_regmap_gate_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_sysclk_a_div.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_sysclk_b_sel = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = SYS_CLK_CTRL0,
+		.mask = 0x7,
+		.shift = 26,
+		.table = s7_sysclk_parents_val_table,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "sysclk_b_sel",
+		.ops = &clk_regmap_mux_ro_ops,
+		.parent_data = s7_sysclk_parents,
+		.num_parents = ARRAY_SIZE(s7_sysclk_parents),
+	},
+};
+
+static struct clk_regmap s7_sysclk_b_div = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = SYS_CLK_CTRL0,
+		.shift = 16,
+		.width = 10,
+		.flags = CLK_DIVIDER_READ_ONLY,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "sysclk_b_div",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_sysclk_b_sel.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_sysclk_b = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = SYS_CLK_CTRL0,
+		.bit_idx = 29,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "sysclk_b",
+		.ops = &clk_regmap_gate_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_sysclk_b_div.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_sys_clk = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = SYS_CLK_CTRL0,
+		.mask = 0x1,
+		.shift = 31,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "sys_clk",
+		.ops = &clk_regmap_mux_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_sysclk_a.hw,
+			&s7_sysclk_b.hw
+		},
+		.num_parents = 2,
+	},
+};
+
+static struct clk_regmap s7_axiclk_a_sel = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = AXI_CLK_CTRL0,
+		.mask = 0x7,
+		.shift = 10,
+		.table = s7_sysclk_parents_val_table,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "axiclk_a_sel",
+		.ops = &clk_regmap_mux_ro_ops,
+		.parent_data = s7_sysclk_parents,
+		.num_parents = ARRAY_SIZE(s7_sysclk_parents),
+	},
+};
+
+static struct clk_regmap s7_axiclk_a_div = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = AXI_CLK_CTRL0,
+		.shift = 0,
+		.width = 10,
+		.flags = CLK_DIVIDER_READ_ONLY,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "axiclk_a_div",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_axiclk_a_sel.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_axiclk_a = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = AXI_CLK_CTRL0,
+		.bit_idx = 13,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "axiclk_a",
+		.ops = &clk_regmap_gate_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_axiclk_a_div.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_axiclk_b_sel = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = AXI_CLK_CTRL0,
+		.mask = 0x7,
+		.shift = 26,
+		.table = s7_sysclk_parents_val_table,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "axiclk_b_sel",
+		.ops = &clk_regmap_mux_ro_ops,
+		.parent_data = s7_sysclk_parents,
+		.num_parents = ARRAY_SIZE(s7_sysclk_parents),
+	},
+};
+
+static struct clk_regmap s7_axiclk_b_div = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = AXI_CLK_CTRL0,
+		.shift = 16,
+		.width = 10,
+		.flags = CLK_DIVIDER_READ_ONLY,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "axiclk_b_div",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_axiclk_b_sel.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_axiclk_b = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = AXI_CLK_CTRL0,
+		.bit_idx = 29,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "axiclk_b",
+		.ops = &clk_regmap_gate_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_axiclk_b_div.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_axi_clk = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = AXI_CLK_CTRL0,
+		.mask = 0x1,
+		.shift = 31,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "axi_clk",
+		.ops = &clk_regmap_mux_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_axiclk_a.hw,
+			&s7_axiclk_b.hw
+		},
+		.num_parents = 2,
+	},
+};
+
+static const struct clk_parent_data s7_sys_pclk_parents = { .hw = &s7_sys_clk.hw };
+
+#define S7_SYS_PCLK(_name, _reg, _bit, _flags) \
+	MESON_PCLK(s7_##_name, _reg, _bit, &s7_sys_pclk_parents, _flags)
+
+#define S7_SYS_PCLK_RO(_name, _reg, _bit) \
+	MESON_PCLK_RO(s7_##_name, _reg, _bit, &s7_sys_pclk_parents, 0)
+
+/* Named ddr in S4 and in older datasheets: the Amlogic bus to AXI bridge clock */
+static S7_SYS_PCLK(sys_am_axi,		SYS_CLK_EN0_REG0, 0, 0);
+static S7_SYS_PCLK(sys_dos,		SYS_CLK_EN0_REG0, 1, 0);
+static S7_SYS_PCLK(sys_eth_phy,		SYS_CLK_EN0_REG0, 4, 0);
+static S7_SYS_PCLK(sys_mali,		SYS_CLK_EN0_REG0, 6, 0);
+/* The always-on co-processor runs its own firmware, which needs this clock */
+static S7_SYS_PCLK(sys_aocpu,		SYS_CLK_EN0_REG0, 13, CLK_IS_CRITICAL);
+static S7_SYS_PCLK(sys_aucpu,		SYS_CLK_EN0_REG0, 14, 0);
+static S7_SYS_PCLK(sys_cec,		SYS_CLK_EN0_REG0, 16, 0);
+static S7_SYS_PCLK(sys_sd_emmc_a,	SYS_CLK_EN0_REG0, 24, 0);
+static S7_SYS_PCLK(sys_sd_emmc_b,	SYS_CLK_EN0_REG0, 25, 0);
+static S7_SYS_PCLK(sys_sd_emmc_c,	SYS_CLK_EN0_REG0, 26, 0);
+static S7_SYS_PCLK(sys_sc,		SYS_CLK_EN0_REG0, 27, 0);
+static S7_SYS_PCLK(sys_acodec,		SYS_CLK_EN0_REG0, 28, 0);
+static S7_SYS_PCLK(sys_msr,		SYS_CLK_EN0_REG0, 30, 0);
+static S7_SYS_PCLK(sys_ir_ctrl,		SYS_CLK_EN0_REG0, 31, 0);
+static S7_SYS_PCLK(sys_audio,		SYS_CLK_EN0_REG1, 0, 0);
+static S7_SYS_PCLK(sys_eth,		SYS_CLK_EN0_REG1, 3, 0);
+static S7_SYS_PCLK(sys_uart_a,		SYS_CLK_EN0_REG1, 5, 0);
+static S7_SYS_PCLK(sys_uart_b,		SYS_CLK_EN0_REG1, 6, 0);
+static S7_SYS_PCLK(sys_uart_c,		SYS_CLK_EN0_REG1, 7, 0);
+static S7_SYS_PCLK(sys_uart_d,		SYS_CLK_EN0_REG1, 8, 0);
+static S7_SYS_PCLK(sys_uart_e,		SYS_CLK_EN0_REG1, 9, 0);
+static S7_SYS_PCLK(sys_ts_pll,		SYS_CLK_EN0_REG1, 16, 0);
+static S7_SYS_PCLK(sys_ge2d,		SYS_CLK_EN0_REG1, 20, 0);
+static S7_SYS_PCLK(sys_spicc,		SYS_CLK_EN0_REG1, 21, 0);
+static S7_SYS_PCLK(sys_usb,		SYS_CLK_EN0_REG1, 26, 0);
+static S7_SYS_PCLK(sys_i2c_m_a,		SYS_CLK_EN0_REG1, 30, 0);
+static S7_SYS_PCLK(sys_i2c_m_b,		SYS_CLK_EN0_REG1, 31, 0);
+static S7_SYS_PCLK(sys_i2c_m_c,		SYS_CLK_EN0_REG2, 0, 0);
+static S7_SYS_PCLK(sys_i2c_m_d,		SYS_CLK_EN0_REG2, 1, 0);
+static S7_SYS_PCLK(sys_i2c_m_e,		SYS_CLK_EN0_REG2, 2, 0);
+static S7_SYS_PCLK(sys_hdmitx_apb,	SYS_CLK_EN0_REG2, 4, 0);
+static S7_SYS_PCLK(sys_i2c_s_a,		SYS_CLK_EN0_REG2, 5, 0);
+static S7_SYS_PCLK(sys_hdmi20_aes,	SYS_CLK_EN0_REG2, 9, 0);
+/* APB clock of the DDR PHY and controller ("MMC" is the memory controller) */
+static S7_SYS_PCLK_RO(sys_mmc_apb,	SYS_CLK_EN0_REG2, 11);
+static S7_SYS_PCLK(sys_cpu_apb,		SYS_CLK_EN0_REG2, 19, 0);
+static S7_SYS_PCLK(sys_vpu_intr,	SYS_CLK_EN0_REG2, 25, 0);
+static S7_SYS_PCLK(sys_sar_adc,		SYS_CLK_EN0_REG2, 28, 0);
+static S7_SYS_PCLK_RO(sys_pwm_j,	SYS_CLK_EN0_REG2, 29);
+/* The GIC driver does not claim its clock, and interrupts need it */
+static S7_SYS_PCLK(sys_gic,		SYS_CLK_EN0_REG2, 30, CLK_IS_CRITICAL);
+static S7_SYS_PCLK(sys_pwm_i,		SYS_CLK_EN0_REG2, 31, 0);
+static S7_SYS_PCLK_RO(sys_pwm_h,	SYS_CLK_EN0_REG3, 0);
+static S7_SYS_PCLK(sys_pwm_g,		SYS_CLK_EN0_REG3, 1, 0);
+static S7_SYS_PCLK(sys_pwm_f,		SYS_CLK_EN0_REG3, 2, 0);
+static S7_SYS_PCLK(sys_pwm_e,		SYS_CLK_EN0_REG3, 3, 0);
+static S7_SYS_PCLK(sys_pwm_d,		SYS_CLK_EN0_REG3, 4, 0);
+static S7_SYS_PCLK(sys_pwm_c,		SYS_CLK_EN0_REG3, 5, 0);
+static S7_SYS_PCLK(sys_pwm_b,		SYS_CLK_EN0_REG3, 6, 0);
+static S7_SYS_PCLK(sys_pwm_a,		SYS_CLK_EN0_REG3, 7, 0);
+
+static const struct clk_parent_data s7_axi_pclk_parents = { .hw = &s7_axi_clk.hw };
+
+static MESON_PCLK_RO(s7_axi_sys_nic, AXI_CLK_EN0, 0, &s7_axi_pclk_parents, 0);
+static MESON_PCLK_RO(s7_axi_sram, AXI_CLK_EN0, 1, &s7_axi_pclk_parents, 0);
+static MESON_PCLK_RO(s7_axi_dev0_mmc, AXI_CLK_EN0, 2, &s7_axi_pclk_parents, 0);
+
+static struct clk_regmap s7_cecb_dualdiv_in = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = CECB_CTRL0,
+		.bit_idx = 31,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "cecb_dualdiv_in",
+		.ops = &clk_regmap_gate_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "xtal",
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_cecb_dualdiv_div = {
+	.data = &(struct meson_clk_dualdiv_data) {
+		.n1 = {
+			.reg_off = CECB_CTRL0,
+			.shift   = 0,
+			.width   = 12,
+		},
+		.n2 = {
+			.reg_off = CECB_CTRL0,
+			.shift   = 12,
+			.width   = 12,
+		},
+		.m1 = {
+			.reg_off = CECB_CTRL1,
+			.shift   = 0,
+			.width   = 12,
+		},
+		.m2 = {
+			.reg_off = CECB_CTRL1,
+			.shift   = 12,
+			.width   = 12,
+		},
+		.dual = {
+			.reg_off = CECB_CTRL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.table = s7_32k_div_table,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "cecb_dualdiv_div",
+		.ops = &meson_clk_dualdiv_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_cecb_dualdiv_in.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_cecb_dualdiv_sel = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = CECB_CTRL1,
+		.mask = 0x1,
+		.shift = 24,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "cecb_dualdiv_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_cecb_dualdiv_div.hw,
+			&s7_cecb_dualdiv_in.hw,
+		},
+		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_cecb_dualdiv = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = CECB_CTRL0,
+		.bit_idx = 30,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "cecb_dualdiv",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_cecb_dualdiv_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_cecb = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = CECB_CTRL1,
+		.mask = 0x1,
+		.shift = 31,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "cecb",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_cecb_dualdiv.hw,
+			&s7_rtc.hw,
+		},
+		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+/* Unlike S4, channel 0 is fclk_div2 (the datasheet table says fclk_div4) */
+static const struct clk_parent_data s7_sc_parents[] = {
+	{ .fw_name = "fclk_div2", },
+	{ .fw_name = "fclk_div3", },
+	{ .fw_name = "fclk_div5", },
+	{ .fw_name = "xtal", }
+};
+
+static S7_COMP_SEL(sc_pre, SC_CLK_CTRL, 9, 0x3, s7_sc_parents, NULL);
+static S7_COMP_DIV(sc_pre, SC_CLK_CTRL, 0, 8);
+static S7_COMP_GATE(sc_pre, SC_CLK_CTRL, 8, 0);
+
+static struct clk_regmap s7_sc = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = SC_CLK_CTRL,
+		.shift = 16,
+		.width = 4,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "sc",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_sc_pre.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_24m_in = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = CLK12_24_CTRL,
+		.bit_idx = 11,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "24m_in",
+		.ops = &clk_regmap_gate_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "xtal",
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_12_24m = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = CLK12_24_CTRL,
+		.shift = 10,
+		.width = 1,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "12_24m",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_24m_in.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static u32 s7_sd_emmc_parents_val_table[] = { 0, 1, 2, 3, 4, 6, 7 };
+static const struct clk_parent_data s7_sd_emmc_parents[] = {
+	{ .fw_name = "xtal", },
+	{ .fw_name = "fclk_div2", },
+	{ .fw_name = "fclk_div3", },
+	{ .fw_name = "hifi_pll", },
+	{ .fw_name = "fclk_div2p5", },
+	{ .fw_name = "gp1_pll", },
+	{ .fw_name = "gp0_pll", }
+};
+
+static S7_COMP_SEL(sd_emmc_a, SD_EMMC_CLK_CTRL, 9, 0x7, s7_sd_emmc_parents,
+		   s7_sd_emmc_parents_val_table);
+static S7_COMP_DIV(sd_emmc_a, SD_EMMC_CLK_CTRL, 0, 7);
+static S7_COMP_GATE(sd_emmc_a, SD_EMMC_CLK_CTRL, 7, 0);
+
+static S7_COMP_SEL(sd_emmc_b, SD_EMMC_CLK_CTRL, 25, 0x7, s7_sd_emmc_parents,
+		   s7_sd_emmc_parents_val_table);
+static S7_COMP_DIV(sd_emmc_b, SD_EMMC_CLK_CTRL, 16, 7);
+static S7_COMP_GATE(sd_emmc_b, SD_EMMC_CLK_CTRL, 23, 0);
+
+static S7_COMP_SEL(sd_emmc_c, NAND_CLK_CTRL, 9, 0x7, s7_sd_emmc_parents,
+		   s7_sd_emmc_parents_val_table);
+static S7_COMP_DIV(sd_emmc_c, NAND_CLK_CTRL, 0, 7);
+static S7_COMP_GATE(sd_emmc_c, NAND_CLK_CTRL, 7, 0);
+
+static const struct clk_parent_data s7_spicc_parents[] = {
+	{ .fw_name = "xtal", },
+	{ .hw = &s7_sys_clk.hw },
+	{ .fw_name = "fclk_div4", },
+	{ .fw_name = "fclk_div3", },
+	{ .fw_name = "fclk_div2", },
+	{ .fw_name = "fclk_div5", },
+	{ .fw_name = "fclk_div7", },
+	{ .fw_name = "gp1_pll", }
+};
+
+static S7_COMP_SEL(spicc, SPICC_CLK_CTRL, 7, 0x7, s7_spicc_parents, NULL);
+static S7_COMP_DIV(spicc, SPICC_CLK_CTRL, 0, 6);
+static S7_COMP_GATE(spicc, SPICC_CLK_CTRL, 6, 0);
+
+static struct clk_regmap s7_vid_pll_div = {
+	.data = &(struct meson_vid_pll_div_data) {
+		.val = {
+			.reg_off = VID_PLL_CLK_DIV,
+			.shift   = 0,
+			.width   = 15,
+		},
+		.sel = {
+			.reg_off = VID_PLL_CLK_DIV,
+			.shift   = 16,
+			.width   = 2,
+		},
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vid_pll_div",
+		.ops = &meson_vid_pll_div_ro_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "hdmi_pll",
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_vid_pll_sel = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = VID_PLL_CLK_DIV,
+		.mask = 0x1,
+		.shift = 18,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vid_pll_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_data = (const struct clk_parent_data []) {
+			{ .hw = &s7_vid_pll_div.hw },
+			{ .fw_name = "hdmi_pll", }
+		},
+		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_vid_pll = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = VID_PLL_CLK_DIV,
+		.bit_idx = 19,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vid_pll",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vid_pll_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct clk_parent_data s7_vclk_parents[] = {
+	{ .hw = &s7_vid_pll.hw },
+	{ .fw_name = "gp1_pll", },
+	{ .fw_name = "hifi_pll", },
+	{ .fw_name = "vid_pix", },
+	{ .fw_name = "fclk_div3", },
+	{ .fw_name = "fclk_div4", },
+	{ .fw_name = "fclk_div5", },
+	{ .fw_name = "fclk_div7", }
+};
+
+static struct clk_regmap s7_vclk_sel = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = VID_CLK_CTRL,
+		.mask = 0x7,
+		.shift = 16,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_data = s7_vclk_parents,
+		.num_parents = ARRAY_SIZE(s7_vclk_parents),
+	},
+};
+
+static struct clk_regmap s7_vclk_input = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = VID_CLK_DIV,
+		.bit_idx = 16,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk_input",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vclk_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_vclk_div = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = VID_CLK_DIV,
+		.shift = 0,
+		.width = 8,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vclk_input.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_vclk = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = VID_CLK_CTRL,
+		.bit_idx = 19,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vclk_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_vclk_div1 = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = VID_CLK_CTRL,
+		.bit_idx = 0,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk_div1",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vclk.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_vclk_div2_en = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = VID_CLK_CTRL,
+		.bit_idx = 1,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk_div2_en",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vclk.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_vclk_div4_en = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = VID_CLK_CTRL,
+		.bit_idx = 2,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk_div4_en",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vclk.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_vclk_div6_en = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = VID_CLK_CTRL,
+		.bit_idx = 3,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk_div6_en",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vclk.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_vclk_div12_en = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = VID_CLK_CTRL,
+		.bit_idx = 4,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk_div12_en",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vclk.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_fixed_factor s7_vclk_div2 = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk_div2",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vclk_div2_en.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_fixed_factor s7_vclk_div4 = {
+	.mult = 1,
+	.div = 4,
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk_div4",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vclk_div4_en.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_fixed_factor s7_vclk_div6 = {
+	.mult = 1,
+	.div = 6,
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk_div6",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vclk_div6_en.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_fixed_factor s7_vclk_div12 = {
+	.mult = 1,
+	.div = 12,
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk_div12",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vclk_div12_en.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_vclk2_sel = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = VIID_CLK_CTRL,
+		.mask = 0x7,
+		.shift = 16,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk2_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_data = s7_vclk_parents,
+		.num_parents = ARRAY_SIZE(s7_vclk_parents),
+	},
+};
+
+static struct clk_regmap s7_vclk2_input = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = VIID_CLK_DIV,
+		.bit_idx = 16,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk2_input",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vclk2_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_vclk2_div = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = VIID_CLK_DIV,
+		.shift = 0,
+		.width = 8,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk2_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vclk2_input.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_vclk2 = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = VIID_CLK_CTRL,
+		.bit_idx = 19,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk2",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vclk2_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_vclk2_div1 = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = VIID_CLK_CTRL,
+		.bit_idx = 0,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk2_div1",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vclk2.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_vclk2_div2_en = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = VIID_CLK_CTRL,
+		.bit_idx = 1,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk2_div2_en",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vclk2.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_vclk2_div4_en = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = VIID_CLK_CTRL,
+		.bit_idx = 2,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk2_div4_en",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vclk2.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_vclk2_div6_en = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = VIID_CLK_CTRL,
+		.bit_idx = 3,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk2_div6_en",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vclk2.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_vclk2_div12_en = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = VIID_CLK_CTRL,
+		.bit_idx = 4,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk2_div12_en",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vclk2.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_fixed_factor s7_vclk2_div2 = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk2_div2",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vclk2_div2_en.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_fixed_factor s7_vclk2_div4 = {
+	.mult = 1,
+	.div = 4,
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk2_div4",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vclk2_div4_en.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_fixed_factor s7_vclk2_div6 = {
+	.mult = 1,
+	.div = 6,
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk2_div6",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vclk2_div6_en.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_fixed_factor s7_vclk2_div12 = {
+	.mult = 1,
+	.div = 12,
+	.hw.init = &(struct clk_init_data) {
+		.name = "vclk2_div12",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vclk2_div12_en.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static u32 s7_cts_parents_val_table[] = { 0, 1, 2, 3, 4, 8, 9, 10, 11, 12 };
+static const struct clk_hw *s7_cts_parents[] = {
+	&s7_vclk_div1.hw,
+	&s7_vclk_div2.hw,
+	&s7_vclk_div4.hw,
+	&s7_vclk_div6.hw,
+	&s7_vclk_div12.hw,
+	&s7_vclk2_div1.hw,
+	&s7_vclk2_div2.hw,
+	&s7_vclk2_div4.hw,
+	&s7_vclk2_div6.hw,
+	&s7_vclk2_div12.hw
+};
+
+static struct clk_regmap s7_enci_sel = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = VID_CLK_DIV,
+		.mask = 0xf,
+		.shift = 28,
+		.table = s7_cts_parents_val_table,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "enci_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = s7_cts_parents,
+		.num_parents = ARRAY_SIZE(s7_cts_parents),
+	},
+};
+
+static struct clk_regmap s7_encp_sel = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = VID_CLK_DIV,
+		.mask = 0xf,
+		.shift = 24,
+		.table = s7_cts_parents_val_table,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "encp_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = s7_cts_parents,
+		.num_parents = ARRAY_SIZE(s7_cts_parents),
+	},
+};
+
+static struct clk_regmap s7_encl_sel = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = VIID_CLK_DIV,
+		.mask = 0xf,
+		.shift = 12,
+		.table = s7_cts_parents_val_table,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "encl_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = s7_cts_parents,
+		.num_parents = ARRAY_SIZE(s7_cts_parents),
+	},
+};
+
+static struct clk_regmap s7_vdac_sel = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = VIID_CLK_DIV,
+		.mask = 0xf,
+		.shift = 28,
+		.table = s7_cts_parents_val_table,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vdac_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = s7_cts_parents,
+		.num_parents = ARRAY_SIZE(s7_cts_parents),
+	},
+};
+
+static struct clk_regmap s7_hdmitx_pixel_sel = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = HDMI_CLK_CTRL,
+		.mask = 0xf,
+		.shift = 16,
+		.table = s7_cts_parents_val_table,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmitx_pixel_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = s7_cts_parents,
+		.num_parents = ARRAY_SIZE(s7_cts_parents),
+	},
+};
+
+static struct clk_regmap s7_hdmitx_fe_sel = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = HDMI_CLK_CTRL,
+		.mask = 0xf,
+		.shift = 20,
+		.table = s7_cts_parents_val_table,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmitx_fe_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = s7_cts_parents,
+		.num_parents = ARRAY_SIZE(s7_cts_parents),
+	},
+};
+
+/* VIID_CLK_DIV[19] (documented as adc_pll_clk_b2) selects fclk_div7 for the VDAC */
+static struct clk_regmap s7_vdac_pre_sel = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = VIID_CLK_DIV,
+		.mask = 0x1,
+		.shift = 19,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vdac_pre_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_data = (const struct clk_parent_data []) {
+			{ .hw = &s7_vdac_sel.hw },
+			{ .fw_name = "fclk_div7", }
+		},
+		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_enci = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = VID_CLK_CTRL2,
+		.bit_idx = 0,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "enci",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_enci_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_encp = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = VID_CLK_CTRL2,
+		.bit_idx = 2,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "encp",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_encp_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_encl = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = VID_CLK_CTRL2,
+		.bit_idx = 3,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "encl",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_encl_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_vdac = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = VID_CLK_CTRL2,
+		.bit_idx = 4,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vdac",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vdac_pre_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_hdmitx_pixel = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = VID_CLK_CTRL2,
+		.bit_idx = 5,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmitx_pixel",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmitx_pixel_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_hdmitx_fe = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = VID_CLK_CTRL2,
+		.bit_idx = 9,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmitx_fe",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmitx_fe_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct clk_parent_data s7_vid_lock_parents[] = {
+	{ .fw_name = "xtal", },
+	{ .hw = &s7_encl.hw },
+	{ .hw = &s7_enci.hw },
+	{ .hw = &s7_encp.hw }
+};
+
+static S7_COMP_SEL(vid_lock, VID_LOCK_CLK_CTRL, 8, 0x3, s7_vid_lock_parents, NULL);
+static S7_COMP_DIV(vid_lock, VID_LOCK_CLK_CTRL, 0, 7);
+static S7_COMP_GATE(vid_lock, VID_LOCK_CLK_CTRL, 7, 0);
+
+static const struct clk_parent_data s7_pwm_parents[] = {
+	{ .fw_name = "xtal", },
+	{ .hw = &s7_vid_pll.hw },
+	{ .fw_name = "fclk_div4", },
+	{ .fw_name = "fclk_div3", }
+};
+
+static S7_COMP_SEL(pwm_a, PWM_CLK_AB_CTRL, 9, 0x3, s7_pwm_parents, NULL);
+static S7_COMP_DIV(pwm_a, PWM_CLK_AB_CTRL, 0, 8);
+static S7_COMP_GATE(pwm_a, PWM_CLK_AB_CTRL, 8, 0);
+
+static S7_COMP_SEL(pwm_b, PWM_CLK_AB_CTRL, 25, 0x3, s7_pwm_parents, NULL);
+static S7_COMP_DIV(pwm_b, PWM_CLK_AB_CTRL, 16, 8);
+static S7_COMP_GATE(pwm_b, PWM_CLK_AB_CTRL, 24, 0);
+
+static S7_COMP_SEL(pwm_c, PWM_CLK_CD_CTRL, 9, 0x3, s7_pwm_parents, NULL);
+static S7_COMP_DIV(pwm_c, PWM_CLK_CD_CTRL, 0, 8);
+static S7_COMP_GATE(pwm_c, PWM_CLK_CD_CTRL, 8, 0);
+
+static S7_COMP_SEL(pwm_d, PWM_CLK_CD_CTRL, 25, 0x3, s7_pwm_parents, NULL);
+static S7_COMP_DIV(pwm_d, PWM_CLK_CD_CTRL, 16, 8);
+static S7_COMP_GATE(pwm_d, PWM_CLK_CD_CTRL, 24, 0);
+
+static S7_COMP_SEL(pwm_e, PWM_CLK_EF_CTRL, 9, 0x3, s7_pwm_parents, NULL);
+static S7_COMP_DIV(pwm_e, PWM_CLK_EF_CTRL, 0, 8);
+static S7_COMP_GATE(pwm_e, PWM_CLK_EF_CTRL, 8, 0);
+
+static S7_COMP_SEL(pwm_f, PWM_CLK_EF_CTRL, 25, 0x3, s7_pwm_parents, NULL);
+static S7_COMP_DIV(pwm_f, PWM_CLK_EF_CTRL, 16, 8);
+static S7_COMP_GATE(pwm_f, PWM_CLK_EF_CTRL, 24, 0);
+
+static const struct clk_parent_data s7_sar_adc_parents[] = {
+	{ .fw_name = "xtal", },
+	{ .hw = &s7_sys_clk.hw }
+};
+
+static S7_COMP_SEL(sar_adc, SAR_CLK_CTRL0, 9, 0x3, s7_sar_adc_parents, NULL);
+static S7_COMP_DIV(sar_adc, SAR_CLK_CTRL0, 0, 8);
+static S7_COMP_GATE(sar_adc, SAR_CLK_CTRL0, 8, 0);
+
+static u32 s7_gen_parents_val_table[] = { 0, 1, 4, 5, 6, 7, 8, 16, 19, 20, 21,
+					  22, 23, 24 };
+static const struct clk_parent_data s7_gen_parents[] = {
+	{ .fw_name = "xtal", },
+	{ .hw = &s7_rtc.hw },
+	{ .hw = &s7_vid_pll.hw },
+	{ .fw_name = "gp0_pll", },
+	{ .fw_name = "hifi1_pll", },
+	{ .fw_name = "hifi_pll", },
+	{ .fw_name = "gp1_pll", },
+	{ .fw_name = "acodec_dac", },
+	{ .fw_name = "fclk_div2", },
+	{ .fw_name = "fclk_div2p5", },
+	{ .fw_name = "fclk_div3", },
+	{ .fw_name = "fclk_div4", },
+	{ .fw_name = "fclk_div5", },
+	{ .fw_name = "fclk_div7", }
+};
+
+static S7_COMP_SEL(gen, GEN_CLK_CTRL, 12, 0x1f, s7_gen_parents,
+		   s7_gen_parents_val_table);
+static S7_COMP_DIV(gen, GEN_CLK_CTRL, 0, 11);
+static S7_COMP_GATE(gen, GEN_CLK_CTRL, 11, 0);
+
+static struct clk_regmap s7_ts_div = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = TS_CLK_CTRL,
+		.shift = 0,
+		.width = 8,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "ts_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "xtal",
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_ts = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = TS_CLK_CTRL,
+		.bit_idx = 8,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "ts",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_ts_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_fixed_factor s7_eth_125m_div = {
+	.mult = 1,
+	.div = 8,
+	.hw.init = &(struct clk_init_data) {
+		.name = "eth_125m_div",
+		.ops = &clk_fixed_factor_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "fclk_div2",
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_eth_125m = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = ETH_CLK_CTRL,
+		.bit_idx = 7,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "eth_125m",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_eth_125m_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static u32 s7_eth_rmii_parents_val_table[] = { 0, 7 };
+static const struct clk_parent_data s7_eth_rmii_parents[] = {
+	{ .fw_name = "fclk_div2", },
+	{ .fw_name = "ext_rmii", }
+};
+
+static struct clk_regmap s7_eth_rmii_sel = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = ETH_CLK_CTRL,
+		.mask = 0x7,
+		.shift = 9,
+		.table = s7_eth_rmii_parents_val_table,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "eth_rmii_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_data = s7_eth_rmii_parents,
+		.num_parents = ARRAY_SIZE(s7_eth_rmii_parents),
+		.flags = CLK_SET_RATE_NO_REPARENT,
+	},
+};
+
+static struct clk_regmap s7_eth_rmii_div = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = ETH_CLK_CTRL,
+		.shift = 0,
+		.width = 7,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "eth_rmii_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_eth_rmii_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_eth_rmii = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = ETH_CLK_CTRL,
+		.bit_idx = 8,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "eth_rmii",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_eth_rmii_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct clk_parent_data s7_mali_parents[] = {
+	{ .fw_name = "xtal", },
+	{ .fw_name = "gp1_pll", },
+	{ .fw_name = "hifi_pll", },
+	{ .fw_name = "fclk_div2p5", },
+	{ .fw_name = "fclk_div3", },
+	{ .fw_name = "fclk_div4", },
+	{ .fw_name = "fclk_div5", },
+	{ .fw_name = "fclk_div7", }
+};
+
+static S7_COMP_SEL(mali_0, MALI_CLK_CTRL, 9, 0x7, s7_mali_parents, NULL);
+static S7_COMP_DIV(mali_0, MALI_CLK_CTRL, 0, 7);
+static S7_COMP_GATE(mali_0, MALI_CLK_CTRL, 8, CLK_SET_RATE_GATE);
+
+static S7_COMP_SEL(mali_1, MALI_CLK_CTRL, 25, 0x7, s7_mali_parents, NULL);
+static S7_COMP_DIV(mali_1, MALI_CLK_CTRL, 16, 7);
+static S7_COMP_GATE(mali_1, MALI_CLK_CTRL, 24, CLK_SET_RATE_GATE);
+
+static struct clk_regmap s7_mali = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = MALI_CLK_CTRL,
+		.mask = 0x1,
+		.shift = 31,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "mali",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_mali_0.hw,
+			&s7_mali_1.hw
+		},
+		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct clk_parent_data s7_dec_parents[] = {
+	{ .fw_name = "fclk_div2p5", },
+	{ .fw_name = "fclk_div3", },
+	{ .fw_name = "fclk_div4", },
+	{ .fw_name = "fclk_div5", },
+	{ .fw_name = "fclk_div7", },
+	{ .fw_name = "hifi_pll", },
+	{ .fw_name = "gp1_pll", },
+	{ .fw_name = "xtal", }
+};
+
+static S7_COMP_SEL(vdec_0, VDEC_CLK_CTRL, 9, 0x7, s7_dec_parents, NULL);
+static S7_COMP_DIV(vdec_0, VDEC_CLK_CTRL, 0, 7);
+static S7_COMP_GATE(vdec_0, VDEC_CLK_CTRL, 8, CLK_SET_RATE_GATE);
+
+static S7_COMP_SEL(vdec_1, VDEC3_CLK_CTRL, 9, 0x7, s7_dec_parents, NULL);
+static S7_COMP_DIV(vdec_1, VDEC3_CLK_CTRL, 0, 7);
+static S7_COMP_GATE(vdec_1, VDEC3_CLK_CTRL, 8, CLK_SET_RATE_GATE);
+
+static struct clk_regmap s7_vdec = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = VDEC3_CLK_CTRL,
+		.mask = 0x1,
+		.shift = 15,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vdec",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vdec_0.hw,
+			&s7_vdec_1.hw
+		},
+		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static S7_COMP_SEL(hevcf_0, VDEC2_CLK_CTRL, 9, 0x7, s7_dec_parents, NULL);
+static S7_COMP_DIV(hevcf_0, VDEC2_CLK_CTRL, 0, 7);
+static S7_COMP_GATE(hevcf_0, VDEC2_CLK_CTRL, 8, CLK_SET_RATE_GATE);
+
+static S7_COMP_SEL(hevcf_1, VDEC4_CLK_CTRL, 9, 0x7, s7_dec_parents, NULL);
+static S7_COMP_DIV(hevcf_1, VDEC4_CLK_CTRL, 0, 7);
+static S7_COMP_GATE(hevcf_1, VDEC4_CLK_CTRL, 8, CLK_SET_RATE_GATE);
+
+static struct clk_regmap s7_hevcf = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = VDEC4_CLK_CTRL,
+		.mask = 0x1,
+		.shift = 15,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hevcf",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hevcf_0.hw,
+			&s7_hevcf_1.hw
+		},
+		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct clk_parent_data s7_vpu_parents[] = {
+	{ .fw_name = "fclk_div3", },
+	{ .fw_name = "fclk_div4", },
+	{ .fw_name = "fclk_div5", },
+	{ .fw_name = "fclk_div7", },
+	{ .fw_name = "fclk_div2", },
+	{ .hw = &s7_vid_pll.hw },
+	{ .fw_name = "hifi_pll", },
+	{ .fw_name = "gp1_pll", }
+};
+
+static S7_COMP_SEL(vpu_0, VPU_CLK_CTRL, 9, 0x7, s7_vpu_parents, NULL);
+static S7_COMP_DIV(vpu_0, VPU_CLK_CTRL, 0, 7);
+static S7_COMP_GATE(vpu_0, VPU_CLK_CTRL, 8, CLK_SET_RATE_GATE);
+
+static S7_COMP_SEL(vpu_1, VPU_CLK_CTRL, 25, 0x7, s7_vpu_parents, NULL);
+static S7_COMP_DIV(vpu_1, VPU_CLK_CTRL, 16, 7);
+static S7_COMP_GATE(vpu_1, VPU_CLK_CTRL, 24, CLK_SET_RATE_GATE);
+
+static struct clk_regmap s7_vpu = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = VPU_CLK_CTRL,
+		.mask = 0x1,
+		.shift = 31,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vpu",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vpu_0.hw,
+			&s7_vpu_1.hw
+		},
+		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct clk_parent_data s7_vpu_clkb_tmp_parents[] = {
+	{ .hw = &s7_vpu.hw },
+	{ .fw_name = "fclk_div4", },
+	{ .fw_name = "fclk_div5", },
+	{ .fw_name = "fclk_div7", }
+};
+
+static S7_COMP_SEL(vpu_clkb_tmp, VPU_CLKB_CTRL, 20, 0x3, s7_vpu_clkb_tmp_parents, NULL);
+static S7_COMP_DIV(vpu_clkb_tmp, VPU_CLKB_CTRL, 16, 4);
+static S7_COMP_GATE(vpu_clkb_tmp, VPU_CLKB_CTRL, 24, 0);
+
+static struct clk_regmap s7_vpu_clkb_div = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = VPU_CLKB_CTRL,
+		.shift = 0,
+		.width = 8,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vpu_clkb_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vpu_clkb_tmp.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_vpu_clkb = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = VPU_CLKB_CTRL,
+		.bit_idx = 8,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vpu_clkb",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vpu_clkb_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct clk_parent_data s7_vpu_clkc_parents[] = {
+	{ .fw_name = "fclk_div4", },
+	{ .fw_name = "fclk_div3", },
+	{ .fw_name = "fclk_div5", },
+	{ .fw_name = "fclk_div7", },
+	{ .fw_name = "fclk_div2", },
+	{ .hw = &s7_vid_pll.hw },
+	{ .fw_name = "hifi_pll", },
+	{ .fw_name = "gp1_pll", }
+};
+
+static S7_COMP_SEL(vpu_clkc_0, VPU_CLKC_CTRL, 9, 0x7, s7_vpu_clkc_parents, NULL);
+static S7_COMP_DIV(vpu_clkc_0, VPU_CLKC_CTRL, 0, 7);
+static S7_COMP_GATE(vpu_clkc_0, VPU_CLKC_CTRL, 8, CLK_SET_RATE_GATE);
+
+static S7_COMP_SEL(vpu_clkc_1, VPU_CLKC_CTRL, 25, 0x7, s7_vpu_clkc_parents, NULL);
+static S7_COMP_DIV(vpu_clkc_1, VPU_CLKC_CTRL, 16, 7);
+static S7_COMP_GATE(vpu_clkc_1, VPU_CLKC_CTRL, 24, CLK_SET_RATE_GATE);
+
+static struct clk_regmap s7_vpu_clkc = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = VPU_CLKC_CTRL,
+		.mask = 0x1,
+		.shift = 31,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vpu_clkc",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vpu_clkc_0.hw,
+			&s7_vpu_clkc_1.hw
+		},
+		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct clk_parent_data s7_vapb_parents[] = {
+	{ .fw_name = "fclk_div4", },
+	{ .fw_name = "fclk_div3", },
+	{ .fw_name = "fclk_div5", },
+	{ .fw_name = "fclk_div7", },
+	{ .fw_name = "fclk_div2", },
+	{ .hw = &s7_vid_pll.hw },
+	{ .fw_name = "hifi_pll", },
+	{ .fw_name = "fclk_div2p5", }
+};
+
+static S7_COMP_SEL(vapb_0, VAPB_CLK_CTRL, 9, 0x7, s7_vapb_parents, NULL);
+static S7_COMP_DIV(vapb_0, VAPB_CLK_CTRL, 0, 7);
+static S7_COMP_GATE(vapb_0, VAPB_CLK_CTRL, 8, CLK_SET_RATE_GATE);
+
+static S7_COMP_SEL(vapb_1, VAPB_CLK_CTRL, 25, 0x7, s7_vapb_parents, NULL);
+static S7_COMP_DIV(vapb_1, VAPB_CLK_CTRL, 16, 7);
+static S7_COMP_GATE(vapb_1, VAPB_CLK_CTRL, 24, CLK_SET_RATE_GATE);
+
+static struct clk_regmap s7_vapb = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = VAPB_CLK_CTRL,
+		.mask = 0x1,
+		.shift = 31,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "vapb",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vapb_0.hw,
+			&s7_vapb_1.hw
+		},
+		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_ge2d = {
+	.data = &(struct clk_regmap_gate_data) {
+		.offset = VAPB_CLK_CTRL,
+		.bit_idx = 30,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "ge2d",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_vapb.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct clk_parent_data s7_hdmi_parents[] = {
+	{ .fw_name = "xtal", },
+	{ .fw_name = "fclk_div4", },
+	{ .fw_name = "fclk_div3", },
+	{ .fw_name = "fclk_div5", }
+};
+
+static S7_COMP_SEL(hdmitx_sys, HDMI_CLK_CTRL, 9, 0x3, s7_hdmi_parents, NULL);
+static S7_COMP_DIV(hdmitx_sys, HDMI_CLK_CTRL, 0, 7);
+static S7_COMP_GATE(hdmitx_sys, HDMI_CLK_CTRL, 8, 0);
+
+static S7_COMP_SEL(hdmitx_prif, HTX_CLK_CTRL0, 9, 0x3, s7_hdmi_parents, NULL);
+static S7_COMP_DIV(hdmitx_prif, HTX_CLK_CTRL0, 0, 7);
+static S7_COMP_GATE(hdmitx_prif, HTX_CLK_CTRL0, 8, 0);
+
+static S7_COMP_SEL(hdmitx_200m, HTX_CLK_CTRL0, 25, 0x3, s7_hdmi_parents, NULL);
+static S7_COMP_DIV(hdmitx_200m, HTX_CLK_CTRL0, 16, 7);
+static S7_COMP_GATE(hdmitx_200m, HTX_CLK_CTRL0, 24, 0);
+
+static S7_COMP_SEL(hdmitx_aud, HTX_CLK_CTRL1, 9, 0x3, s7_hdmi_parents, NULL);
+static S7_COMP_DIV(hdmitx_aud, HTX_CLK_CTRL1, 0, 7);
+static S7_COMP_GATE(hdmitx_aud, HTX_CLK_CTRL1, 8, 0);
+
+static const struct clk_parent_data s7_vdin_meas_parents[] = {
+	{ .fw_name = "xtal", },
+	{ .fw_name = "fclk_div4", },
+	{ .fw_name = "fclk_div3", },
+	{ .fw_name = "fclk_div5", },
+	{ .hw = &s7_vid_pll.hw }
+};
+
+static S7_COMP_SEL(vdin_meas, VDIN_MEAS_CLK_CTRL, 9, 0x7, s7_vdin_meas_parents, NULL);
+static S7_COMP_DIV(vdin_meas, VDIN_MEAS_CLK_CTRL, 0, 7);
+static S7_COMP_GATE(vdin_meas, VDIN_MEAS_CLK_CTRL, 8, 0);
+
+static const struct clk_parent_data s7_cdac_parents[] = {
+	{ .fw_name = "xtal", },
+	{ .fw_name = "fclk_div5", }
+};
+
+static S7_COMP_SEL(cdac, CDAC_CLK_CTRL, 16, 0x3, s7_cdac_parents, NULL);
+static S7_COMP_DIV(cdac, CDAC_CLK_CTRL, 0, 16);
+static S7_COMP_GATE(cdac, CDAC_CLK_CTRL, 20, 0);
+
+static struct clk_hw *s7_peripherals_hw_clks[] = {
+	[CLKID_SYS_AM_AXI]		= &s7_sys_am_axi.hw,
+	[CLKID_SYS_DOS]			= &s7_sys_dos.hw,
+	[CLKID_SYS_ETH_PHY]		= &s7_sys_eth_phy.hw,
+	[CLKID_SYS_MALI]		= &s7_sys_mali.hw,
+	[CLKID_SYS_AOCPU]		= &s7_sys_aocpu.hw,
+	[CLKID_SYS_AUCPU]		= &s7_sys_aucpu.hw,
+	[CLKID_SYS_CEC]			= &s7_sys_cec.hw,
+	[CLKID_SYS_SD_EMMC_A]		= &s7_sys_sd_emmc_a.hw,
+	[CLKID_SYS_SD_EMMC_B]		= &s7_sys_sd_emmc_b.hw,
+	[CLKID_SYS_SD_EMMC_C]		= &s7_sys_sd_emmc_c.hw,
+	[CLKID_SYS_SC]			= &s7_sys_sc.hw,
+	[CLKID_SYS_ACODEC]		= &s7_sys_acodec.hw,
+	[CLKID_SYS_MSR]			= &s7_sys_msr.hw,
+	[CLKID_SYS_IR_CTRL]		= &s7_sys_ir_ctrl.hw,
+	[CLKID_SYS_AUDIO]		= &s7_sys_audio.hw,
+	[CLKID_SYS_ETH]			= &s7_sys_eth.hw,
+	[CLKID_SYS_UART_A]		= &s7_sys_uart_a.hw,
+	[CLKID_SYS_UART_B]		= &s7_sys_uart_b.hw,
+	[CLKID_SYS_UART_C]		= &s7_sys_uart_c.hw,
+	[CLKID_SYS_UART_D]		= &s7_sys_uart_d.hw,
+	[CLKID_SYS_UART_E]		= &s7_sys_uart_e.hw,
+	[CLKID_SYS_TS_PLL]		= &s7_sys_ts_pll.hw,
+	[CLKID_SYS_GE2D]		= &s7_sys_ge2d.hw,
+	[CLKID_SYS_SPICC]		= &s7_sys_spicc.hw,
+	[CLKID_SYS_USB]			= &s7_sys_usb.hw,
+	[CLKID_SYS_I2C_M_A]		= &s7_sys_i2c_m_a.hw,
+	[CLKID_SYS_I2C_M_B]		= &s7_sys_i2c_m_b.hw,
+	[CLKID_SYS_I2C_M_C]		= &s7_sys_i2c_m_c.hw,
+	[CLKID_SYS_I2C_M_D]		= &s7_sys_i2c_m_d.hw,
+	[CLKID_SYS_I2C_M_E]		= &s7_sys_i2c_m_e.hw,
+	[CLKID_SYS_HDMITX_APB]		= &s7_sys_hdmitx_apb.hw,
+	[CLKID_SYS_I2C_S_A]		= &s7_sys_i2c_s_a.hw,
+	[CLKID_SYS_HDMI20_AES]		= &s7_sys_hdmi20_aes.hw,
+	[CLKID_SYS_MMC_APB]		= &s7_sys_mmc_apb.hw,
+	[CLKID_SYS_CPU_APB]		= &s7_sys_cpu_apb.hw,
+	[CLKID_SYS_VPU_INTR]		= &s7_sys_vpu_intr.hw,
+	[CLKID_SYS_SAR_ADC]		= &s7_sys_sar_adc.hw,
+	[CLKID_SYS_PWM_J]		= &s7_sys_pwm_j.hw,
+	[CLKID_SYS_GIC]			= &s7_sys_gic.hw,
+	[CLKID_SYS_PWM_I]		= &s7_sys_pwm_i.hw,
+	[CLKID_SYS_PWM_H]		= &s7_sys_pwm_h.hw,
+	[CLKID_SYS_PWM_G]		= &s7_sys_pwm_g.hw,
+	[CLKID_SYS_PWM_F]		= &s7_sys_pwm_f.hw,
+	[CLKID_SYS_PWM_E]		= &s7_sys_pwm_e.hw,
+	[CLKID_SYS_PWM_D]		= &s7_sys_pwm_d.hw,
+	[CLKID_SYS_PWM_C]		= &s7_sys_pwm_c.hw,
+	[CLKID_SYS_PWM_B]		= &s7_sys_pwm_b.hw,
+	[CLKID_SYS_PWM_A]		= &s7_sys_pwm_a.hw,
+	[CLKID_RTC_DUALDIV_IN]		= &s7_rtc_dualdiv_in.hw,
+	[CLKID_RTC_DUALDIV_DIV]		= &s7_rtc_dualdiv_div.hw,
+	[CLKID_RTC_DUALDIV_SEL]		= &s7_rtc_dualdiv_sel.hw,
+	[CLKID_RTC_DUALDIV]		= &s7_rtc_dualdiv.hw,
+	[CLKID_RTC]			= &s7_rtc.hw,
+	[CLKID_SYSCLK_A_SEL]		= &s7_sysclk_a_sel.hw,
+	[CLKID_SYSCLK_A_DIV]		= &s7_sysclk_a_div.hw,
+	[CLKID_SYSCLK_A]		= &s7_sysclk_a.hw,
+	[CLKID_SYSCLK_B_SEL]		= &s7_sysclk_b_sel.hw,
+	[CLKID_SYSCLK_B_DIV]		= &s7_sysclk_b_div.hw,
+	[CLKID_SYSCLK_B]		= &s7_sysclk_b.hw,
+	[CLKID_SYS_CLK]			= &s7_sys_clk.hw,
+	[CLKID_AXICLK_A_SEL]		= &s7_axiclk_a_sel.hw,
+	[CLKID_AXICLK_A_DIV]		= &s7_axiclk_a_div.hw,
+	[CLKID_AXICLK_A]		= &s7_axiclk_a.hw,
+	[CLKID_AXICLK_B_SEL]		= &s7_axiclk_b_sel.hw,
+	[CLKID_AXICLK_B_DIV]		= &s7_axiclk_b_div.hw,
+	[CLKID_AXICLK_B]		= &s7_axiclk_b.hw,
+	[CLKID_AXI_CLK]			= &s7_axi_clk.hw,
+	[CLKID_AXI_SYS_NIC]		= &s7_axi_sys_nic.hw,
+	[CLKID_AXI_SRAM]		= &s7_axi_sram.hw,
+	[CLKID_AXI_DEV0_MMC]		= &s7_axi_dev0_mmc.hw,
+	[CLKID_CECB_DUALDIV_IN]		= &s7_cecb_dualdiv_in.hw,
+	[CLKID_CECB_DUALDIV_DIV]	= &s7_cecb_dualdiv_div.hw,
+	[CLKID_CECB_DUALDIV_SEL]	= &s7_cecb_dualdiv_sel.hw,
+	[CLKID_CECB_DUALDIV]		= &s7_cecb_dualdiv.hw,
+	[CLKID_CECB]			= &s7_cecb.hw,
+	[CLKID_SC_PRE_SEL]		= &s7_sc_pre_sel.hw,
+	[CLKID_SC_PRE_DIV]		= &s7_sc_pre_div.hw,
+	[CLKID_SC_PRE]			= &s7_sc_pre.hw,
+	[CLKID_SC]			= &s7_sc.hw,
+	[CLKID_CLK24M_IN]		= &s7_24m_in.hw,
+	[CLKID_CLK12_24M]		= &s7_12_24m.hw,
+	[CLKID_SD_EMMC_A_SEL]		= &s7_sd_emmc_a_sel.hw,
+	[CLKID_SD_EMMC_A_DIV]		= &s7_sd_emmc_a_div.hw,
+	[CLKID_SD_EMMC_A]		= &s7_sd_emmc_a.hw,
+	[CLKID_SD_EMMC_B_SEL]		= &s7_sd_emmc_b_sel.hw,
+	[CLKID_SD_EMMC_B_DIV]		= &s7_sd_emmc_b_div.hw,
+	[CLKID_SD_EMMC_B]		= &s7_sd_emmc_b.hw,
+	[CLKID_SD_EMMC_C_SEL]		= &s7_sd_emmc_c_sel.hw,
+	[CLKID_SD_EMMC_C_DIV]		= &s7_sd_emmc_c_div.hw,
+	[CLKID_SD_EMMC_C]		= &s7_sd_emmc_c.hw,
+	[CLKID_SPICC_SEL]		= &s7_spicc_sel.hw,
+	[CLKID_SPICC_DIV]		= &s7_spicc_div.hw,
+	[CLKID_SPICC]			= &s7_spicc.hw,
+	[CLKID_PWM_A_SEL]		= &s7_pwm_a_sel.hw,
+	[CLKID_PWM_A_DIV]		= &s7_pwm_a_div.hw,
+	[CLKID_PWM_A]			= &s7_pwm_a.hw,
+	[CLKID_PWM_B_SEL]		= &s7_pwm_b_sel.hw,
+	[CLKID_PWM_B_DIV]		= &s7_pwm_b_div.hw,
+	[CLKID_PWM_B]			= &s7_pwm_b.hw,
+	[CLKID_PWM_C_SEL]		= &s7_pwm_c_sel.hw,
+	[CLKID_PWM_C_DIV]		= &s7_pwm_c_div.hw,
+	[CLKID_PWM_C]			= &s7_pwm_c.hw,
+	[CLKID_PWM_D_SEL]		= &s7_pwm_d_sel.hw,
+	[CLKID_PWM_D_DIV]		= &s7_pwm_d_div.hw,
+	[CLKID_PWM_D]			= &s7_pwm_d.hw,
+	[CLKID_PWM_E_SEL]		= &s7_pwm_e_sel.hw,
+	[CLKID_PWM_E_DIV]		= &s7_pwm_e_div.hw,
+	[CLKID_PWM_E]			= &s7_pwm_e.hw,
+	[CLKID_PWM_F_SEL]		= &s7_pwm_f_sel.hw,
+	[CLKID_PWM_F_DIV]		= &s7_pwm_f_div.hw,
+	[CLKID_PWM_F]			= &s7_pwm_f.hw,
+	[CLKID_SAR_ADC_SEL]		= &s7_sar_adc_sel.hw,
+	[CLKID_SAR_ADC_DIV]		= &s7_sar_adc_div.hw,
+	[CLKID_SAR_ADC]			= &s7_sar_adc.hw,
+	[CLKID_GEN_SEL]			= &s7_gen_sel.hw,
+	[CLKID_GEN_DIV]			= &s7_gen_div.hw,
+	[CLKID_GEN]			= &s7_gen.hw,
+	[CLKID_TS_DIV]			= &s7_ts_div.hw,
+	[CLKID_TS]			= &s7_ts.hw,
+	[CLKID_ETH_125M_DIV]		= &s7_eth_125m_div.hw,
+	[CLKID_ETH_125M]		= &s7_eth_125m.hw,
+	[CLKID_ETH_RMII_SEL]		= &s7_eth_rmii_sel.hw,
+	[CLKID_ETH_RMII_DIV]		= &s7_eth_rmii_div.hw,
+	[CLKID_ETH_RMII]		= &s7_eth_rmii.hw,
+	[CLKID_MALI_0_SEL]		= &s7_mali_0_sel.hw,
+	[CLKID_MALI_0_DIV]		= &s7_mali_0_div.hw,
+	[CLKID_MALI_0]			= &s7_mali_0.hw,
+	[CLKID_MALI_1_SEL]		= &s7_mali_1_sel.hw,
+	[CLKID_MALI_1_DIV]		= &s7_mali_1_div.hw,
+	[CLKID_MALI_1]			= &s7_mali_1.hw,
+	[CLKID_MALI]			= &s7_mali.hw,
+	[CLKID_VDEC_0_SEL]		= &s7_vdec_0_sel.hw,
+	[CLKID_VDEC_0_DIV]		= &s7_vdec_0_div.hw,
+	[CLKID_VDEC_0]			= &s7_vdec_0.hw,
+	[CLKID_VDEC_1_SEL]		= &s7_vdec_1_sel.hw,
+	[CLKID_VDEC_1_DIV]		= &s7_vdec_1_div.hw,
+	[CLKID_VDEC_1]			= &s7_vdec_1.hw,
+	[CLKID_VDEC]			= &s7_vdec.hw,
+	[CLKID_HEVCF_0_SEL]		= &s7_hevcf_0_sel.hw,
+	[CLKID_HEVCF_0_DIV]		= &s7_hevcf_0_div.hw,
+	[CLKID_HEVCF_0]			= &s7_hevcf_0.hw,
+	[CLKID_HEVCF_1_SEL]		= &s7_hevcf_1_sel.hw,
+	[CLKID_HEVCF_1_DIV]		= &s7_hevcf_1_div.hw,
+	[CLKID_HEVCF_1]			= &s7_hevcf_1.hw,
+	[CLKID_HEVCF]			= &s7_hevcf.hw,
+	[CLKID_VPU_0_SEL]		= &s7_vpu_0_sel.hw,
+	[CLKID_VPU_0_DIV]		= &s7_vpu_0_div.hw,
+	[CLKID_VPU_0]			= &s7_vpu_0.hw,
+	[CLKID_VPU_1_SEL]		= &s7_vpu_1_sel.hw,
+	[CLKID_VPU_1_DIV]		= &s7_vpu_1_div.hw,
+	[CLKID_VPU_1]			= &s7_vpu_1.hw,
+	[CLKID_VPU]			= &s7_vpu.hw,
+	[CLKID_VPU_CLKB_TMP_SEL]	= &s7_vpu_clkb_tmp_sel.hw,
+	[CLKID_VPU_CLKB_TMP_DIV]	= &s7_vpu_clkb_tmp_div.hw,
+	[CLKID_VPU_CLKB_TMP]		= &s7_vpu_clkb_tmp.hw,
+	[CLKID_VPU_CLKB_DIV]		= &s7_vpu_clkb_div.hw,
+	[CLKID_VPU_CLKB]		= &s7_vpu_clkb.hw,
+	[CLKID_VPU_CLKC_0_SEL]		= &s7_vpu_clkc_0_sel.hw,
+	[CLKID_VPU_CLKC_0_DIV]		= &s7_vpu_clkc_0_div.hw,
+	[CLKID_VPU_CLKC_0]		= &s7_vpu_clkc_0.hw,
+	[CLKID_VPU_CLKC_1_SEL]		= &s7_vpu_clkc_1_sel.hw,
+	[CLKID_VPU_CLKC_1_DIV]		= &s7_vpu_clkc_1_div.hw,
+	[CLKID_VPU_CLKC_1]		= &s7_vpu_clkc_1.hw,
+	[CLKID_VPU_CLKC]		= &s7_vpu_clkc.hw,
+	[CLKID_VAPB_0_SEL]		= &s7_vapb_0_sel.hw,
+	[CLKID_VAPB_0_DIV]		= &s7_vapb_0_div.hw,
+	[CLKID_VAPB_0]			= &s7_vapb_0.hw,
+	[CLKID_VAPB_1_SEL]		= &s7_vapb_1_sel.hw,
+	[CLKID_VAPB_1_DIV]		= &s7_vapb_1_div.hw,
+	[CLKID_VAPB_1]			= &s7_vapb_1.hw,
+	[CLKID_VAPB]			= &s7_vapb.hw,
+	[CLKID_GE2D]			= &s7_ge2d.hw,
+	[CLKID_HDMITX_SYS_SEL]		= &s7_hdmitx_sys_sel.hw,
+	[CLKID_HDMITX_SYS_DIV]		= &s7_hdmitx_sys_div.hw,
+	[CLKID_HDMITX_SYS]		= &s7_hdmitx_sys.hw,
+	[CLKID_HDMITX_PRIF_SEL]		= &s7_hdmitx_prif_sel.hw,
+	[CLKID_HDMITX_PRIF_DIV]		= &s7_hdmitx_prif_div.hw,
+	[CLKID_HDMITX_PRIF]		= &s7_hdmitx_prif.hw,
+	[CLKID_HDMITX_200M_SEL]		= &s7_hdmitx_200m_sel.hw,
+	[CLKID_HDMITX_200M_DIV]		= &s7_hdmitx_200m_div.hw,
+	[CLKID_HDMITX_200M]		= &s7_hdmitx_200m.hw,
+	[CLKID_HDMITX_AUD_SEL]		= &s7_hdmitx_aud_sel.hw,
+	[CLKID_HDMITX_AUD_DIV]		= &s7_hdmitx_aud_div.hw,
+	[CLKID_HDMITX_AUD]		= &s7_hdmitx_aud.hw,
+	[CLKID_VDIN_MEAS_SEL]		= &s7_vdin_meas_sel.hw,
+	[CLKID_VDIN_MEAS_DIV]		= &s7_vdin_meas_div.hw,
+	[CLKID_VDIN_MEAS]		= &s7_vdin_meas.hw,
+	[CLKID_CDAC_SEL]		= &s7_cdac_sel.hw,
+	[CLKID_CDAC_DIV]		= &s7_cdac_div.hw,
+	[CLKID_CDAC]			= &s7_cdac.hw,
+	[CLKID_VID_PLL_DIV]		= &s7_vid_pll_div.hw,
+	[CLKID_VID_PLL_SEL]		= &s7_vid_pll_sel.hw,
+	[CLKID_VID_PLL]			= &s7_vid_pll.hw,
+	[CLKID_VCLK_SEL]		= &s7_vclk_sel.hw,
+	[CLKID_VCLK2_SEL]		= &s7_vclk2_sel.hw,
+	[CLKID_VCLK_INPUT]		= &s7_vclk_input.hw,
+	[CLKID_VCLK2_INPUT]		= &s7_vclk2_input.hw,
+	[CLKID_VCLK_DIV]		= &s7_vclk_div.hw,
+	[CLKID_VCLK2_DIV]		= &s7_vclk2_div.hw,
+	[CLKID_VCLK]			= &s7_vclk.hw,
+	[CLKID_VCLK2]			= &s7_vclk2.hw,
+	[CLKID_VCLK_DIV1]		= &s7_vclk_div1.hw,
+	[CLKID_VCLK_DIV2_EN]		= &s7_vclk_div2_en.hw,
+	[CLKID_VCLK_DIV4_EN]		= &s7_vclk_div4_en.hw,
+	[CLKID_VCLK_DIV6_EN]		= &s7_vclk_div6_en.hw,
+	[CLKID_VCLK_DIV12_EN]		= &s7_vclk_div12_en.hw,
+	[CLKID_VCLK2_DIV1]		= &s7_vclk2_div1.hw,
+	[CLKID_VCLK2_DIV2_EN]		= &s7_vclk2_div2_en.hw,
+	[CLKID_VCLK2_DIV4_EN]		= &s7_vclk2_div4_en.hw,
+	[CLKID_VCLK2_DIV6_EN]		= &s7_vclk2_div6_en.hw,
+	[CLKID_VCLK2_DIV12_EN]		= &s7_vclk2_div12_en.hw,
+	[CLKID_VCLK_DIV2]		= &s7_vclk_div2.hw,
+	[CLKID_VCLK_DIV4]		= &s7_vclk_div4.hw,
+	[CLKID_VCLK_DIV6]		= &s7_vclk_div6.hw,
+	[CLKID_VCLK_DIV12]		= &s7_vclk_div12.hw,
+	[CLKID_VCLK2_DIV2]		= &s7_vclk2_div2.hw,
+	[CLKID_VCLK2_DIV4]		= &s7_vclk2_div4.hw,
+	[CLKID_VCLK2_DIV6]		= &s7_vclk2_div6.hw,
+	[CLKID_VCLK2_DIV12]		= &s7_vclk2_div12.hw,
+	[CLKID_ENCI_SEL]		= &s7_enci_sel.hw,
+	[CLKID_ENCP_SEL]		= &s7_encp_sel.hw,
+	[CLKID_ENCL_SEL]		= &s7_encl_sel.hw,
+	[CLKID_VDAC_SEL]		= &s7_vdac_sel.hw,
+	[CLKID_VDAC_PRE_SEL]		= &s7_vdac_pre_sel.hw,
+	[CLKID_HDMITX_PIXEL_SEL]	= &s7_hdmitx_pixel_sel.hw,
+	[CLKID_HDMITX_FE_SEL]		= &s7_hdmitx_fe_sel.hw,
+	[CLKID_ENCI]			= &s7_enci.hw,
+	[CLKID_ENCP]			= &s7_encp.hw,
+	[CLKID_ENCL]			= &s7_encl.hw,
+	[CLKID_VDAC]			= &s7_vdac.hw,
+	[CLKID_HDMITX_PIXEL]		= &s7_hdmitx_pixel.hw,
+	[CLKID_HDMITX_FE]		= &s7_hdmitx_fe.hw,
+	[CLKID_VID_LOCK_SEL]		= &s7_vid_lock_sel.hw,
+	[CLKID_VID_LOCK_DIV]		= &s7_vid_lock_div.hw,
+	[CLKID_VID_LOCK]		= &s7_vid_lock.hw,
+};
+
+static const struct meson_clkc_data s7_peripherals_clkc_data = {
+	.hw_clks = {
+		.hws = s7_peripherals_hw_clks,
+		.num = ARRAY_SIZE(s7_peripherals_hw_clks),
+	},
+};
+
+static const struct of_device_id s7_peripherals_clkc_match_table[] = {
+	{
+		.compatible = "amlogic,s7-peripherals-clkc",
+		.data = &s7_peripherals_clkc_data,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, s7_peripherals_clkc_match_table);
+
+static struct platform_driver s7_peripherals_clkc_driver = {
+	.probe		= meson_clkc_mmio_probe,
+	.driver		= {
+		.name	= "s7-peripherals-clkc",
+		.of_match_table = s7_peripherals_clkc_match_table,
+	},
+};
+module_platform_driver(s7_peripherals_clkc_driver);
+
+MODULE_DESCRIPTION("Amlogic S7 Peripherals Clock Controller driver");
+MODULE_AUTHOR("Carlo Caione <ccaione@baylibre.com>");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("CLK_MESON");

-- 
2.56.0


