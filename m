Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD35C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 06:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yMefMc6R5BQEnTcCHHlwlU1nur/XkFEVPuz7N9D//yk=; b=M5kMz47O8DL9jMCkb/qjJVW/fy
	iJwPIi788GaENzeelCtnxwd1JGUXNqv3kilCtS4SnWlzSddEeShs24a1NAuJcXGrwdw8Fhi6UZxFp
	7t7UMjCaiNFGTGfxiZkPkkbRO+b9qzc1xmISE9MdBumeDTyHV7CGJ1H+AP1RRtrntBUlck8B0DLH1
	cPuzNatUzt4a8yYHwDOR2MF7pa+Pnog/pc2TmJ8WWG/T1K0N4k7JzK4jk3Xcwp0I7BkkEdI08o4ya
	o/Dn57w3omxZkhFAtrHPXikSz+K1LNDNtgo9t6E2DOKq5jArM4octKi0hvvbk7q5o8hsTK72xky1M
	UqujRlDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qLn-0000000D2kL-275I;
	Thu, 24 Apr 2025 06:46:23 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7pyW-0000000CyYo-3zQn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 06:22:22 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso5303685e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 23:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475739; x=1746080539; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMefMc6R5BQEnTcCHHlwlU1nur/XkFEVPuz7N9D//yk=;
        b=XADgBm2K6AnXf2lkOaS3eLLno5HK+LRiWoPQyl41rTfWI+HrYscx4Llr4ZPX/VqSXQ
         CsSKKrgph730PqqnKBUkPTDBepneaSgsLPbHsosSSCl0dE++Q4flXdPlHIDaTH+7Y5iF
         0LWNZrO7RubooMVITG4cG3S1GgK7zPOIdNFRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475739; x=1746080539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMefMc6R5BQEnTcCHHlwlU1nur/XkFEVPuz7N9D//yk=;
        b=hJ3BU7AhDSkIzAU4IxviW5h/eQ1JQ5L/+Kp79gkqBbHceOUFUtK9tEuF7zAEx9cbm3
         XKkxUTcYjp+PSEHg/L1qLduyzC4+D8weO0jCuhPsrRvDpD23xzUitLIMXYdrAiy1sARD
         dJ/XEvsRMvkjMZ59LgYVAMpZX/TMa96XBQ+ECPiQM5hGN7Qsu1hazxwWnBVnmF/tn3+G
         1VN1Ho5uihHVfLDxV9sR8POtqoYQ4qO6Z6rbd+bE//vD9nKh8V462sM0qz06ClD3Y//t
         iZ2MxJG5iga0DFECfiKPcD0qjftinjzCz2q3Z7LMaZ1V+dwNTwcxcT5/Z9pCNVprNmZW
         WSpA==
X-Forwarded-Encrypted: i=1; AJvYcCXsI9RpKFm8kC7QgakVUp7EzxyQPxyx3lxDcBiZxrnneWmw677WH1NIA/QAu/u9TBnumVlsbLvAOgLVuJr7AA+7@lists.infradead.org
X-Gm-Message-State: AOJu0YwrSq/k97cugaATl0ky3ZZ2osd0UwKVXVuk1IYAN2QjiiTdbbc6
	cNrHNg0ndMul1bJMd7rYN85FTC+8PFUKaa3El/gT6rE00tudIyLGEGTmUORTmi4=
X-Gm-Gg: ASbGncuZmxvcaJsitXtRve6FRwttx0fAgbn/t4bmt7ZP+oVMWFnoAQaYhBRYBRw9aOL
	tjOUNCG2PG22zHDnGCgv/TBR0cHYebc5jzr62HO5ElXjIhslaPDBELxHqTNLoMo9UtIXlRXMAcH
	lZmtwFM92fW571TlsEC2Esqq/uIZbEWzw2h/gKLL6OI9i6KAOdwFCckEgBEIimyQlmW7jtsJtL6
	Bj6wimT4NO/NG0x0k9ItCskKOJFdDSCEJxe7L6tnT7aq0sF6FSceDSS+79aqacGaMe2pxUQM+ds
	PLYlZRaWiw037QsI/PhhLdUZudRREso9Unc0mr73UGiyD01eTV0QwQ5yzHgAp9ZzsrNeqq2sAEY
	Gyg8W
X-Google-Smtp-Source: AGHT+IGyNU7L1TesGiHh66iwWd3fieYpKxnu1bX2IRPndmxa4ThID+Ks98ICvQ6C0/f/lFgYhKdQrg==
X-Received: by 2002:a05:600c:1c10:b0:43c:f64c:44a4 with SMTP id 5b1f17b1804b1-4409bd0cbddmr8569285e9.8.1745475739038;
        Wed, 23 Apr 2025 23:22:19 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v12 11/19] clk: imx: add support for i.MX8MM anatop clock driver
Date: Thu, 24 Apr 2025 08:21:41 +0200
Message-ID: <20250424062154.2999219-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_232220_999621_8DB171AD 
X-CRM114-Status: GOOD (  16.90  )
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

Support NXP i.MX8M anatop PLL module which generates PLLs to CCM root.
By doing so, we also simplify the CCM driver code. The changes are
backward compatible.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>

---

(no changes since v11)

Changes in v11:
- Add 'Reviewed-by' tag of Peng Fan

 drivers/clk/imx/Makefile            |   2 +-
 drivers/clk/imx/clk-imx8mm-anatop.c | 287 ++++++++++++++++++++++++++++
 drivers/clk/imx/clk-imx8mm.c        | 172 ++++++++---------
 3 files changed, 367 insertions(+), 94 deletions(-)
 create mode 100644 drivers/clk/imx/clk-imx8mm-anatop.c

diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index 03f2b2a1ab63..bf35b1236591 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -25,7 +25,7 @@ mxc-clk-objs += clk-sscg-pll.o
 mxc-clk-objs += clk-gpr-mux.o
 obj-$(CONFIG_MXC_CLK) += mxc-clk.o
 
-obj-$(CONFIG_CLK_IMX8MM) += clk-imx8mm.o
+obj-$(CONFIG_CLK_IMX8MM) += clk-imx8mm-anatop.o clk-imx8mm.o
 obj-$(CONFIG_CLK_IMX8MN) += clk-imx8mn.o
 obj-$(CONFIG_CLK_IMX8MP) += clk-imx8mp.o clk-imx8mp-audiomix.o
 obj-$(CONFIG_CLK_IMX8MQ) += clk-imx8mq.o
diff --git a/drivers/clk/imx/clk-imx8mm-anatop.c b/drivers/clk/imx/clk-imx8mm-anatop.c
new file mode 100644
index 000000000000..4ac870df6370
--- /dev/null
+++ b/drivers/clk/imx/clk-imx8mm-anatop.c
@@ -0,0 +1,287 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * clk-imx8mm-anatop.c - NXP i.MX8MM anatop clock driver
+ *
+ * Copyright (c) 2025 Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
+#include <dt-bindings/clock/imx8mm-clock.h>
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/of_platform.h>
+
+#include "clk.h"
+
+#define IMX8MM_ANATOP_CLK_END		(IMX8MM_ANATOP_CLK_CLKOUT2 + 1)
+
+static const char * const pll_ref_sels[] = { "osc_24m", "dummy", "dummy", "dummy", };
+static const char * const audio_pll1_bypass_sels[] = {"audio_pll1", "audio_pll1_ref_sel", };
+static const char * const audio_pll2_bypass_sels[] = {"audio_pll2", "audio_pll2_ref_sel", };
+static const char * const video_pll_bypass_sels[] = {"video_pll", "video_pll_ref_sel", };
+static const char * const dram_pll_bypass_sels[] = {"dram_pll", "dram_pll_ref_sel", };
+static const char * const gpu_pll_bypass_sels[] = {"gpu_pll", "gpu_pll_ref_sel", };
+static const char * const vpu_pll_bypass_sels[] = {"vpu_pll", "vpu_pll_ref_sel", };
+static const char * const arm_pll_bypass_sels[] = {"arm_pll", "arm_pll_ref_sel", };
+static const char * const sys_pll3_bypass_sels[] = {"sys_pll3", "sys_pll3_ref_sel", };
+static const char * const clkout_sels[] = {"audio_pll1_out", "audio_pll2_out", "video_pll_out",
+					   "dummy", "dummy", "gpu_pll_out", "vpu_pll_out",
+					   "arm_pll_out", "sys_pll1", "sys_pll2", "sys_pll3",
+					   "dummy", "dummy", "osc_24m", "dummy", "osc_32k"};
+
+static struct clk_hw_onecell_data *clk_hw_data;
+static struct clk_hw **hws;
+
+static int imx8mm_anatop_clocks_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	void __iomem *base;
+	int ret;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base)) {
+		dev_err(dev, "failed to get base address\n");
+		return PTR_ERR(base);
+	}
+
+	clk_hw_data = devm_kzalloc(dev, struct_size(clk_hw_data, hws,
+						    IMX8MM_ANATOP_CLK_END),
+				   GFP_KERNEL);
+	if (WARN_ON(!clk_hw_data))
+		return -ENOMEM;
+
+	clk_hw_data->num = IMX8MM_ANATOP_CLK_END;
+	hws = clk_hw_data->hws;
+
+	hws[IMX8MM_ANATOP_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0);
+	hws[IMX8MM_ANATOP_CLK_32K] = imx_get_clk_hw_by_name(np, "osc_32k");
+	hws[IMX8MM_ANATOP_CLK_24M] = imx_get_clk_hw_by_name(np, "osc_24m");
+
+	hws[IMX8MM_ANATOP_AUDIO_PLL1_REF_SEL] =
+		imx_clk_hw_mux("audio_pll1_ref_sel", base + 0x0, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MM_ANATOP_AUDIO_PLL2_REF_SEL] =
+		imx_clk_hw_mux("audio_pll2_ref_sel", base + 0x14, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MM_ANATOP_VIDEO_PLL_REF_SEL] =
+		imx_clk_hw_mux("video_pll_ref_sel", base + 0x28, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MM_ANATOP_DRAM_PLL_REF_SEL] =
+		imx_clk_hw_mux("dram_pll_ref_sel", base + 0x50, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MM_ANATOP_GPU_PLL_REF_SEL] =
+		imx_clk_hw_mux("gpu_pll_ref_sel", base + 0x64, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MM_ANATOP_VPU_PLL_REF_SEL] =
+		imx_clk_hw_mux("vpu_pll_ref_sel", base + 0x74, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MM_ANATOP_ARM_PLL_REF_SEL] =
+		imx_clk_hw_mux("arm_pll_ref_sel", base + 0x84, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MM_ANATOP_SYS_PLL3_REF_SEL] =
+		imx_clk_hw_mux("sys_pll3_ref_sel", base + 0x114, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+
+	hws[IMX8MM_ANATOP_AUDIO_PLL1] =
+		imx_clk_hw_pll14xx("audio_pll1", "audio_pll1_ref_sel",
+				   base, &imx_1443x_pll);
+	hws[IMX8MM_ANATOP_AUDIO_PLL2] =
+		imx_clk_hw_pll14xx("audio_pll2", "audio_pll2_ref_sel",
+				   base + 0x14, &imx_1443x_pll);
+	hws[IMX8MM_ANATOP_VIDEO_PLL] =
+		imx_clk_hw_pll14xx("video_pll", "video_pll_ref_sel",
+				   base + 0x28, &imx_1443x_pll);
+	hws[IMX8MM_ANATOP_DRAM_PLL] =
+		imx_clk_hw_pll14xx("dram_pll", "dram_pll_ref_sel",
+				   base + 0x50, &imx_1443x_dram_pll);
+	hws[IMX8MM_ANATOP_GPU_PLL] =
+		imx_clk_hw_pll14xx("gpu_pll", "gpu_pll_ref_sel",
+				   base + 0x64, &imx_1416x_pll);
+	hws[IMX8MM_ANATOP_VPU_PLL] =
+		imx_clk_hw_pll14xx("vpu_pll", "vpu_pll_ref_sel",
+				   base + 0x74, &imx_1416x_pll);
+	hws[IMX8MM_ANATOP_ARM_PLL] =
+		imx_clk_hw_pll14xx("arm_pll", "arm_pll_ref_sel",
+				   base + 0x84, &imx_1416x_pll);
+	hws[IMX8MM_ANATOP_SYS_PLL1] = imx_clk_hw_fixed("sys_pll1", 800000000);
+	hws[IMX8MM_ANATOP_SYS_PLL2] = imx_clk_hw_fixed("sys_pll2", 1000000000);
+	hws[IMX8MM_ANATOP_SYS_PLL3] =
+		imx_clk_hw_pll14xx("sys_pll3", "sys_pll3_ref_sel",
+				   base + 0x114, &imx_1416x_pll);
+
+	/* PLL bypass out */
+	hws[IMX8MM_ANATOP_AUDIO_PLL1_BYPASS] =
+		imx_clk_hw_mux_flags("audio_pll1_bypass", base, 16, 1,
+				     audio_pll1_bypass_sels,
+				     ARRAY_SIZE(audio_pll1_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MM_ANATOP_AUDIO_PLL2_BYPASS] =
+		imx_clk_hw_mux_flags("audio_pll2_bypass", base + 0x14, 16, 1,
+				     audio_pll2_bypass_sels,
+				     ARRAY_SIZE(audio_pll2_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MM_ANATOP_VIDEO_PLL_BYPASS] =
+		imx_clk_hw_mux_flags("video_pll_bypass", base + 0x28, 16, 1,
+				     video_pll_bypass_sels,
+				     ARRAY_SIZE(video_pll_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MM_ANATOP_DRAM_PLL_BYPASS] =
+		imx_clk_hw_mux_flags("dram_pll_bypass", base + 0x50, 16, 1,
+				     dram_pll_bypass_sels,
+				     ARRAY_SIZE(dram_pll_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MM_ANATOP_GPU_PLL_BYPASS] =
+		imx_clk_hw_mux_flags("gpu_pll_bypass", base + 0x64, 28, 1,
+				     gpu_pll_bypass_sels,
+				     ARRAY_SIZE(gpu_pll_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MM_ANATOP_VPU_PLL_BYPASS] =
+		imx_clk_hw_mux_flags("vpu_pll_bypass", base + 0x74, 28, 1,
+				     vpu_pll_bypass_sels,
+				     ARRAY_SIZE(vpu_pll_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MM_ANATOP_ARM_PLL_BYPASS] =
+		imx_clk_hw_mux_flags("arm_pll_bypass", base + 0x84, 28, 1,
+				     arm_pll_bypass_sels,
+				     ARRAY_SIZE(arm_pll_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MM_ANATOP_SYS_PLL3_BYPASS] =
+		imx_clk_hw_mux_flags("sys_pll3_bypass", base + 0x114, 28, 1,
+				     sys_pll3_bypass_sels,
+				     ARRAY_SIZE(sys_pll3_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+
+	/* PLL out gate */
+	hws[IMX8MM_ANATOP_AUDIO_PLL1_OUT] =
+		imx_clk_hw_gate("audio_pll1_out", "audio_pll1_bypass",
+				base, 13);
+	hws[IMX8MM_ANATOP_AUDIO_PLL2_OUT] =
+		imx_clk_hw_gate("audio_pll2_out", "audio_pll2_bypass",
+				base + 0x14, 13);
+	hws[IMX8MM_ANATOP_VIDEO_PLL_OUT] =
+		imx_clk_hw_gate("video_pll_out", "video_pll_bypass",
+				base + 0x28, 13);
+	hws[IMX8MM_ANATOP_DRAM_PLL_OUT] =
+		imx_clk_hw_gate("dram_pll_out", "dram_pll_bypass",
+				base + 0x50, 13);
+	hws[IMX8MM_ANATOP_GPU_PLL_OUT] =
+		imx_clk_hw_gate("gpu_pll_out", "gpu_pll_bypass",
+				base + 0x64, 11);
+	hws[IMX8MM_ANATOP_VPU_PLL_OUT] =
+		imx_clk_hw_gate("vpu_pll_out", "vpu_pll_bypass",
+				base + 0x74, 11);
+	hws[IMX8MM_ANATOP_ARM_PLL_OUT] =
+		imx_clk_hw_gate("arm_pll_out", "arm_pll_bypass",
+				base + 0x84, 11);
+	hws[IMX8MM_ANATOP_SYS_PLL3_OUT] =
+		imx_clk_hw_gate("sys_pll3_out", "sys_pll3_bypass",
+				base + 0x114, 11);
+
+	/* SYS PLL1 fixed output */
+	hws[IMX8MM_ANATOP_SYS_PLL1_OUT] =
+		imx_clk_hw_gate("sys_pll1_out", "sys_pll1",
+				base + 0x94, 11);
+
+	hws[IMX8MM_ANATOP_SYS_PLL1_40M] =
+		imx_clk_hw_fixed_factor("sys_pll1_40m", "sys_pll1_out", 1, 20);
+	hws[IMX8MM_ANATOP_SYS_PLL1_80M] =
+		imx_clk_hw_fixed_factor("sys_pll1_80m", "sys_pll1_out", 1, 10);
+	hws[IMX8MM_ANATOP_SYS_PLL1_100M] =
+		imx_clk_hw_fixed_factor("sys_pll1_100m", "sys_pll1_out", 1, 8);
+	hws[IMX8MM_ANATOP_SYS_PLL1_133M] =
+		imx_clk_hw_fixed_factor("sys_pll1_133m", "sys_pll1_out", 1, 6);
+	hws[IMX8MM_ANATOP_SYS_PLL1_160M] =
+		imx_clk_hw_fixed_factor("sys_pll1_160m", "sys_pll1_out", 1, 5);
+	hws[IMX8MM_ANATOP_SYS_PLL1_200M] =
+		imx_clk_hw_fixed_factor("sys_pll1_200m", "sys_pll1_out", 1, 4);
+	hws[IMX8MM_ANATOP_SYS_PLL1_266M] =
+		imx_clk_hw_fixed_factor("sys_pll1_266m", "sys_pll1_out", 1, 3);
+	hws[IMX8MM_ANATOP_SYS_PLL1_400M] =
+		imx_clk_hw_fixed_factor("sys_pll1_400m", "sys_pll1_out", 1, 2);
+	hws[IMX8MM_ANATOP_SYS_PLL1_800M] =
+		imx_clk_hw_fixed_factor("sys_pll1_800m", "sys_pll1_out", 1, 1);
+
+	/* SYS PLL2 fixed output */
+	hws[IMX8MM_ANATOP_SYS_PLL2_OUT] =
+		imx_clk_hw_gate("sys_pll2_out", "sys_pll2",
+				base + 0x104, 11);
+
+	hws[IMX8MM_ANATOP_SYS_PLL2_50M] =
+		imx_clk_hw_fixed_factor("sys_pll2_50m", "sys_pll2_out", 1, 20);
+	hws[IMX8MM_ANATOP_SYS_PLL2_100M] =
+		imx_clk_hw_fixed_factor("sys_pll2_100m", "sys_pll2_out", 1, 10);
+	hws[IMX8MM_ANATOP_SYS_PLL2_125M] =
+		imx_clk_hw_fixed_factor("sys_pll2_125m", "sys_pll2_out", 1, 8);
+	hws[IMX8MM_ANATOP_SYS_PLL2_166M] =
+		imx_clk_hw_fixed_factor("sys_pll2_166m", "sys_pll2_out", 1, 6);
+	hws[IMX8MM_ANATOP_SYS_PLL2_200M] =
+		imx_clk_hw_fixed_factor("sys_pll2_200m", "sys_pll2_out", 1, 5);
+	hws[IMX8MM_ANATOP_SYS_PLL2_250M] =
+		imx_clk_hw_fixed_factor("sys_pll2_250m", "sys_pll2_out", 1, 4);
+	hws[IMX8MM_ANATOP_SYS_PLL2_333M] =
+		imx_clk_hw_fixed_factor("sys_pll2_333m", "sys_pll2_out", 1, 3);
+	hws[IMX8MM_ANATOP_SYS_PLL2_500M] =
+		imx_clk_hw_fixed_factor("sys_pll2_500m", "sys_pll2_out", 1, 2);
+	hws[IMX8MM_ANATOP_SYS_PLL2_1000M] =
+		imx_clk_hw_fixed_factor("sys_pll2_1000m", "sys_pll2_out", 1, 1);
+
+	hws[IMX8MM_ANATOP_CLK_CLKOUT1_SEL] =
+		imx_clk_hw_mux2("clkout1_sel", base + 0x128, 4, 4,
+				clkout_sels, ARRAY_SIZE(clkout_sels));
+	hws[IMX8MM_ANATOP_CLK_CLKOUT1_DIV] =
+		imx_clk_hw_divider("clkout1_div", "clkout1_sel",
+				   base + 0x128, 0, 4);
+	hws[IMX8MM_ANATOP_CLK_CLKOUT1] =
+		imx_clk_hw_gate("clkout1", "clkout1_div", base + 0x128, 8);
+	hws[IMX8MM_ANATOP_CLK_CLKOUT2_SEL] =
+		imx_clk_hw_mux2("clkout2_sel", base + 0x128, 20, 4,
+				clkout_sels, ARRAY_SIZE(clkout_sels));
+	hws[IMX8MM_ANATOP_CLK_CLKOUT2_DIV] =
+		imx_clk_hw_divider("clkout2_div", "clkout2_sel", base + 0x128,
+				   16, 4);
+	hws[IMX8MM_ANATOP_CLK_CLKOUT2] =
+		imx_clk_hw_gate("clkout2", "clkout2_div", base + 0x128, 24);
+
+	imx_check_clk_hws(hws, IMX8MM_ANATOP_CLK_END);
+
+	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
+	if (ret < 0) {
+		imx_unregister_hw_clocks(hws, IMX8MM_ANATOP_CLK_END);
+		return dev_err_probe(dev, ret,
+				     "failed to register anatop clock provider\n");
+	}
+
+	dev_info(dev, "NXP i.MX8MM anatop clock driver probed\n");
+	return 0;
+}
+
+static const struct of_device_id imx8mm_anatop_clk_of_match[] = {
+	{ .compatible = "fsl,imx8mm-anatop" },
+	{ /* Sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, imx8mm_anatop_clk_of_match);
+
+static struct platform_driver imx8mm_anatop_clk_driver = {
+	.probe = imx8mm_anatop_clocks_probe,
+	.driver = {
+		.name = "imx8mm-anatop",
+		/*
+		 * Disable bind attributes: clocks are not removed and
+		 * reloading the driver will crash or break devices.
+		 */
+		.suppress_bind_attrs = true,
+		.of_match_table = imx8mm_anatop_clk_of_match,
+	},
+};
+
+module_platform_driver(imx8mm_anatop_clk_driver);
+
+MODULE_AUTHOR("Dario Binacchi <dario.binacchi@amarulasolutions.com>");
+MODULE_DESCRIPTION("NXP i.MX8MM anatop clock driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 8a1fc7e17ba2..d39de0a81a6f 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -25,16 +25,6 @@ static u32 share_count_disp;
 static u32 share_count_pdm;
 static u32 share_count_nand;
 
-static const char *pll_ref_sels[] = { "osc_24m", "dummy", "dummy", "dummy", };
-static const char *audio_pll1_bypass_sels[] = {"audio_pll1", "audio_pll1_ref_sel", };
-static const char *audio_pll2_bypass_sels[] = {"audio_pll2", "audio_pll2_ref_sel", };
-static const char *video_pll_bypass_sels[] = {"video_pll", "video_pll_ref_sel", };
-static const char *dram_pll_bypass_sels[] = {"dram_pll", "dram_pll_ref_sel", };
-static const char *gpu_pll_bypass_sels[] = {"gpu_pll", "gpu_pll_ref_sel", };
-static const char *vpu_pll_bypass_sels[] = {"vpu_pll", "vpu_pll_ref_sel", };
-static const char *arm_pll_bypass_sels[] = {"arm_pll", "arm_pll_ref_sel", };
-static const char *sys_pll3_bypass_sels[] = {"sys_pll3", "sys_pll3_ref_sel", };
-
 /* CCM ROOT */
 static const char *imx8mm_a53_sels[] = {"osc_24m", "arm_pll_out", "sys_pll2_500m", "sys_pll2_1000m",
 					"sys_pll1_800m", "sys_pll1_400m", "audio_pll1_out", "sys_pll3_out", };
@@ -288,21 +278,20 @@ static const char *imx8mm_clko1_sels[] = {"osc_24m", "sys_pll1_800m", "dummy", "
 static const char *imx8mm_clko2_sels[] = {"osc_24m", "sys_pll2_200m", "sys_pll1_400m", "sys_pll2_166m",
 					  "sys_pll3_out", "audio_pll1_out", "video_pll_out", "osc_32k", };
 
-static const char * const clkout_sels[] = {"audio_pll1_out", "audio_pll2_out", "video_pll_out",
-					   "dummy", "dummy", "gpu_pll_out", "vpu_pll_out",
-					   "arm_pll_out", "sys_pll1", "sys_pll2", "sys_pll3",
-					   "dummy", "dummy", "osc_24m", "dummy", "osc_32k"};
-
 static struct clk_hw_onecell_data *clk_hw_data;
 static struct clk_hw **hws;
 
 static int imx8mm_clocks_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
+	struct device_node *np = dev->of_node, *anp;
 	void __iomem *base;
 	int ret;
 
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (WARN_ON(IS_ERR(base)))
+		return PTR_ERR(base);
+
 	clk_hw_data = kzalloc(struct_size(clk_hw_data, hws,
 					  IMX8MM_CLK_END), GFP_KERNEL);
 	if (WARN_ON(!clk_hw_data))
@@ -311,96 +300,92 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 	clk_hw_data->num = IMX8MM_CLK_END;
 	hws = clk_hw_data->hws;
 
-	hws[IMX8MM_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0);
-	hws[IMX8MM_CLK_24M] = imx_get_clk_hw_by_name(np, "osc_24m");
-	hws[IMX8MM_CLK_32K] = imx_get_clk_hw_by_name(np, "osc_32k");
+	anp = of_find_compatible_node(NULL, NULL, "fsl,imx8mm-anatop");
+	if (!anp)
+		return dev_err_probe(dev, -ENODEV, "missing anatop\n");
+
+	of_node_put(anp);
+
+	hws[IMX8MM_CLK_DUMMY] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_CLK_DUMMY);
+	hws[IMX8MM_CLK_24M] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_CLK_24M);
+	hws[IMX8MM_CLK_32K] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_CLK_32K);
 	hws[IMX8MM_CLK_EXT1] = imx_get_clk_hw_by_name(np, "clk_ext1");
 	hws[IMX8MM_CLK_EXT2] = imx_get_clk_hw_by_name(np, "clk_ext2");
 	hws[IMX8MM_CLK_EXT3] = imx_get_clk_hw_by_name(np, "clk_ext3");
 	hws[IMX8MM_CLK_EXT4] = imx_get_clk_hw_by_name(np, "clk_ext4");
 
-	np = of_find_compatible_node(NULL, NULL, "fsl,imx8mm-anatop");
-	base = of_iomap(np, 0);
-	of_node_put(np);
-	if (WARN_ON(!base))
-		return -ENOMEM;
-
-	hws[IMX8MM_AUDIO_PLL1_REF_SEL] = imx_clk_hw_mux("audio_pll1_ref_sel", base + 0x0, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MM_AUDIO_PLL2_REF_SEL] = imx_clk_hw_mux("audio_pll2_ref_sel", base + 0x14, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MM_VIDEO_PLL_REF_SEL] = imx_clk_hw_mux("video_pll_ref_sel", base + 0x28, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MM_DRAM_PLL_REF_SEL] = imx_clk_hw_mux("dram_pll_ref_sel", base + 0x50, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MM_GPU_PLL_REF_SEL] = imx_clk_hw_mux("gpu_pll_ref_sel", base + 0x64, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MM_VPU_PLL_REF_SEL] = imx_clk_hw_mux("vpu_pll_ref_sel", base + 0x74, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MM_ARM_PLL_REF_SEL] = imx_clk_hw_mux("arm_pll_ref_sel", base + 0x84, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MM_SYS_PLL3_REF_SEL] = imx_clk_hw_mux("sys_pll3_ref_sel", base + 0x114, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-
-	hws[IMX8MM_AUDIO_PLL1] = imx_clk_hw_pll14xx("audio_pll1", "audio_pll1_ref_sel", base, &imx_1443x_pll);
-	hws[IMX8MM_AUDIO_PLL2] = imx_clk_hw_pll14xx("audio_pll2", "audio_pll2_ref_sel", base + 0x14, &imx_1443x_pll);
-	hws[IMX8MM_VIDEO_PLL] = imx_clk_hw_pll14xx("video_pll", "video_pll_ref_sel", base + 0x28, &imx_1443x_pll);
-	hws[IMX8MM_DRAM_PLL] = imx_clk_hw_pll14xx("dram_pll", "dram_pll_ref_sel", base + 0x50, &imx_1443x_dram_pll);
-	hws[IMX8MM_GPU_PLL] = imx_clk_hw_pll14xx("gpu_pll", "gpu_pll_ref_sel", base + 0x64, &imx_1416x_pll);
-	hws[IMX8MM_VPU_PLL] = imx_clk_hw_pll14xx("vpu_pll", "vpu_pll_ref_sel", base + 0x74, &imx_1416x_pll);
-	hws[IMX8MM_ARM_PLL] = imx_clk_hw_pll14xx("arm_pll", "arm_pll_ref_sel", base + 0x84, &imx_1416x_pll);
-	hws[IMX8MM_SYS_PLL1] = imx_clk_hw_fixed("sys_pll1", 800000000);
-	hws[IMX8MM_SYS_PLL2] = imx_clk_hw_fixed("sys_pll2", 1000000000);
-	hws[IMX8MM_SYS_PLL3] = imx_clk_hw_pll14xx("sys_pll3", "sys_pll3_ref_sel", base + 0x114, &imx_1416x_pll);
+	hws[IMX8MM_AUDIO_PLL1_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_AUDIO_PLL1_REF_SEL);
+	hws[IMX8MM_AUDIO_PLL2_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_AUDIO_PLL2_REF_SEL);
+	hws[IMX8MM_VIDEO_PLL_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_VIDEO_PLL_REF_SEL);
+	hws[IMX8MM_DRAM_PLL_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_DRAM_PLL_REF_SEL);
+	hws[IMX8MM_GPU_PLL_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_GPU_PLL_REF_SEL);
+	hws[IMX8MM_VPU_PLL_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_VPU_PLL_REF_SEL);
+	hws[IMX8MM_ARM_PLL_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_ARM_PLL_REF_SEL);
+	hws[IMX8MM_SYS_PLL3_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_SYS_PLL3_REF_SEL);
+
+	hws[IMX8MM_AUDIO_PLL1] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_AUDIO_PLL1);
+	hws[IMX8MM_AUDIO_PLL2] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_AUDIO_PLL2);
+	hws[IMX8MM_VIDEO_PLL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_VIDEO_PLL);
+	hws[IMX8MM_DRAM_PLL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_DRAM_PLL);
+	hws[IMX8MM_GPU_PLL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_GPU_PLL);
+	hws[IMX8MM_VPU_PLL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_VPU_PLL);
+	hws[IMX8MM_ARM_PLL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_ARM_PLL);
+	hws[IMX8MM_SYS_PLL1] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_SYS_PLL1);
+	hws[IMX8MM_SYS_PLL2] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_SYS_PLL2);
+	hws[IMX8MM_SYS_PLL3] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_SYS_PLL3);
 
 	/* PLL bypass out */
-	hws[IMX8MM_AUDIO_PLL1_BYPASS] = imx_clk_hw_mux_flags("audio_pll1_bypass", base, 16, 1, audio_pll1_bypass_sels, ARRAY_SIZE(audio_pll1_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MM_AUDIO_PLL2_BYPASS] = imx_clk_hw_mux_flags("audio_pll2_bypass", base + 0x14, 16, 1, audio_pll2_bypass_sels, ARRAY_SIZE(audio_pll2_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MM_VIDEO_PLL_BYPASS] = imx_clk_hw_mux_flags("video_pll_bypass", base + 0x28, 16, 1, video_pll_bypass_sels, ARRAY_SIZE(video_pll_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MM_DRAM_PLL_BYPASS] = imx_clk_hw_mux_flags("dram_pll_bypass", base + 0x50, 16, 1, dram_pll_bypass_sels, ARRAY_SIZE(dram_pll_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MM_GPU_PLL_BYPASS] = imx_clk_hw_mux_flags("gpu_pll_bypass", base + 0x64, 28, 1, gpu_pll_bypass_sels, ARRAY_SIZE(gpu_pll_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MM_VPU_PLL_BYPASS] = imx_clk_hw_mux_flags("vpu_pll_bypass", base + 0x74, 28, 1, vpu_pll_bypass_sels, ARRAY_SIZE(vpu_pll_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MM_ARM_PLL_BYPASS] = imx_clk_hw_mux_flags("arm_pll_bypass", base + 0x84, 28, 1, arm_pll_bypass_sels, ARRAY_SIZE(arm_pll_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MM_SYS_PLL3_BYPASS] = imx_clk_hw_mux_flags("sys_pll3_bypass", base + 0x114, 28, 1, sys_pll3_bypass_sels, ARRAY_SIZE(sys_pll3_bypass_sels), CLK_SET_RATE_PARENT);
+	hws[IMX8MM_AUDIO_PLL1_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_AUDIO_PLL1_BYPASS);
+	hws[IMX8MM_AUDIO_PLL2_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_AUDIO_PLL2_BYPASS);
+	hws[IMX8MM_VIDEO_PLL_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_VIDEO_PLL_BYPASS);
+	hws[IMX8MM_DRAM_PLL_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_DRAM_PLL_BYPASS);
+	hws[IMX8MM_GPU_PLL_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_GPU_PLL_BYPASS);
+	hws[IMX8MM_VPU_PLL_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_VPU_PLL_BYPASS);
+	hws[IMX8MM_ARM_PLL_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_ARM_PLL_BYPASS);
+	hws[IMX8MM_SYS_PLL3_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_SYS_PLL3_BYPASS);
 
 	/* PLL out gate */
-	hws[IMX8MM_AUDIO_PLL1_OUT] = imx_clk_hw_gate("audio_pll1_out", "audio_pll1_bypass", base, 13);
-	hws[IMX8MM_AUDIO_PLL2_OUT] = imx_clk_hw_gate("audio_pll2_out", "audio_pll2_bypass", base + 0x14, 13);
-	hws[IMX8MM_VIDEO_PLL_OUT] = imx_clk_hw_gate("video_pll_out", "video_pll_bypass", base + 0x28, 13);
-	hws[IMX8MM_DRAM_PLL_OUT] = imx_clk_hw_gate("dram_pll_out", "dram_pll_bypass", base + 0x50, 13);
-	hws[IMX8MM_GPU_PLL_OUT] = imx_clk_hw_gate("gpu_pll_out", "gpu_pll_bypass", base + 0x64, 11);
-	hws[IMX8MM_VPU_PLL_OUT] = imx_clk_hw_gate("vpu_pll_out", "vpu_pll_bypass", base + 0x74, 11);
-	hws[IMX8MM_ARM_PLL_OUT] = imx_clk_hw_gate("arm_pll_out", "arm_pll_bypass", base + 0x84, 11);
-	hws[IMX8MM_SYS_PLL3_OUT] = imx_clk_hw_gate("sys_pll3_out", "sys_pll3_bypass", base + 0x114, 11);
+	hws[IMX8MM_AUDIO_PLL1_OUT] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_AUDIO_PLL1_OUT);
+	hws[IMX8MM_AUDIO_PLL2_OUT] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_AUDIO_PLL2_OUT);
+	hws[IMX8MM_VIDEO_PLL_OUT] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_VIDEO_PLL_OUT);
+	hws[IMX8MM_DRAM_PLL_OUT] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_DRAM_PLL_OUT);
+	hws[IMX8MM_GPU_PLL_OUT] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_GPU_PLL_OUT);
+	hws[IMX8MM_VPU_PLL_OUT] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_VPU_PLL_OUT);
+	hws[IMX8MM_ARM_PLL_OUT] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_ARM_PLL_OUT);
+	hws[IMX8MM_SYS_PLL3_OUT] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_SYS_PLL3_OUT);
 
 	/* SYS PLL1 fixed output */
-	hws[IMX8MM_SYS_PLL1_OUT] = imx_clk_hw_gate("sys_pll1_out", "sys_pll1", base + 0x94, 11);
-
-	hws[IMX8MM_SYS_PLL1_40M] = imx_clk_hw_fixed_factor("sys_pll1_40m", "sys_pll1_out", 1, 20);
-	hws[IMX8MM_SYS_PLL1_80M] = imx_clk_hw_fixed_factor("sys_pll1_80m", "sys_pll1_out", 1, 10);
-	hws[IMX8MM_SYS_PLL1_100M] = imx_clk_hw_fixed_factor("sys_pll1_100m", "sys_pll1_out", 1, 8);
-	hws[IMX8MM_SYS_PLL1_133M] = imx_clk_hw_fixed_factor("sys_pll1_133m", "sys_pll1_out", 1, 6);
-	hws[IMX8MM_SYS_PLL1_160M] = imx_clk_hw_fixed_factor("sys_pll1_160m", "sys_pll1_out", 1, 5);
-	hws[IMX8MM_SYS_PLL1_200M] = imx_clk_hw_fixed_factor("sys_pll1_200m", "sys_pll1_out", 1, 4);
-	hws[IMX8MM_SYS_PLL1_266M] = imx_clk_hw_fixed_factor("sys_pll1_266m", "sys_pll1_out", 1, 3);
-	hws[IMX8MM_SYS_PLL1_400M] = imx_clk_hw_fixed_factor("sys_pll1_400m", "sys_pll1_out", 1, 2);
-	hws[IMX8MM_SYS_PLL1_800M] = imx_clk_hw_fixed_factor("sys_pll1_800m", "sys_pll1_out", 1, 1);
+	hws[IMX8MM_SYS_PLL1_OUT] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_SYS_PLL1_OUT);
+
+	hws[IMX8MM_SYS_PLL1_40M] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_SYS_PLL1_40M);
+	hws[IMX8MM_SYS_PLL1_80M] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_SYS_PLL1_80M);
+	hws[IMX8MM_SYS_PLL1_100M] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_SYS_PLL1_100M);
+	hws[IMX8MM_SYS_PLL1_133M] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_SYS_PLL1_133M);
+	hws[IMX8MM_SYS_PLL1_160M] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_SYS_PLL1_160M);
+	hws[IMX8MM_SYS_PLL1_200M] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_SYS_PLL1_200M);
+	hws[IMX8MM_SYS_PLL1_266M] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_SYS_PLL1_266M);
+	hws[IMX8MM_SYS_PLL1_400M] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_SYS_PLL1_400M);
+	hws[IMX8MM_SYS_PLL1_800M] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_SYS_PLL1_800M);
 
 	/* SYS PLL2 fixed output */
-	hws[IMX8MM_SYS_PLL2_OUT] = imx_clk_hw_gate("sys_pll2_out", "sys_pll2", base + 0x104, 11);
-	hws[IMX8MM_SYS_PLL2_50M] = imx_clk_hw_fixed_factor("sys_pll2_50m", "sys_pll2_out", 1, 20);
-	hws[IMX8MM_SYS_PLL2_100M] = imx_clk_hw_fixed_factor("sys_pll2_100m", "sys_pll2_out", 1, 10);
-	hws[IMX8MM_SYS_PLL2_125M] = imx_clk_hw_fixed_factor("sys_pll2_125m", "sys_pll2_out", 1, 8);
-	hws[IMX8MM_SYS_PLL2_166M] = imx_clk_hw_fixed_factor("sys_pll2_166m", "sys_pll2_out", 1, 6);
-	hws[IMX8MM_SYS_PLL2_200M] = imx_clk_hw_fixed_factor("sys_pll2_200m", "sys_pll2_out", 1, 5);
-	hws[IMX8MM_SYS_PLL2_250M] = imx_clk_hw_fixed_factor("sys_pll2_250m", "sys_pll2_out", 1, 4);
-	hws[IMX8MM_SYS_PLL2_333M] = imx_clk_hw_fixed_factor("sys_pll2_333m", "sys_pll2_out", 1, 3);
-	hws[IMX8MM_SYS_PLL2_500M] = imx_clk_hw_fixed_factor("sys_pll2_500m", "sys_pll2_out", 1, 2);
-	hws[IMX8MM_SYS_PLL2_1000M] = imx_clk_hw_fixed_factor("sys_pll2_1000m", "sys_pll2_out", 1, 1);
-
-	hws[IMX8MM_CLK_CLKOUT1_SEL] = imx_clk_hw_mux2("clkout1_sel", base + 0x128, 4, 4, clkout_sels, ARRAY_SIZE(clkout_sels));
-	hws[IMX8MM_CLK_CLKOUT1_DIV] = imx_clk_hw_divider("clkout1_div", "clkout1_sel", base + 0x128, 0, 4);
-	hws[IMX8MM_CLK_CLKOUT1] = imx_clk_hw_gate("clkout1", "clkout1_div", base + 0x128, 8);
-	hws[IMX8MM_CLK_CLKOUT2_SEL] = imx_clk_hw_mux2("clkout2_sel", base + 0x128, 20, 4, clkout_sels, ARRAY_SIZE(clkout_sels));
-	hws[IMX8MM_CLK_CLKOUT2_DIV] = imx_clk_hw_divider("clkout2_div", "clkout2_sel", base + 0x128, 16, 4);
-	hws[IMX8MM_CLK_CLKOUT2] = imx_clk_hw_gate("clkout2", "clkout2_div", base + 0x128, 24);
-
-	np = dev->of_node;
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (WARN_ON(IS_ERR(base)))
-		return PTR_ERR(base);
+	hws[IMX8MM_SYS_PLL2_OUT] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_SYS_PLL2_OUT);
+
+	hws[IMX8MM_SYS_PLL2_50M] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_SYS_PLL2_50M);
+	hws[IMX8MM_SYS_PLL2_100M] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_SYS_PLL2_100M);
+	hws[IMX8MM_SYS_PLL2_125M] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_SYS_PLL2_125M);
+	hws[IMX8MM_SYS_PLL2_166M] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_SYS_PLL2_166M);
+	hws[IMX8MM_SYS_PLL2_200M] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_SYS_PLL2_200M);
+	hws[IMX8MM_SYS_PLL2_250M] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_SYS_PLL2_250M);
+	hws[IMX8MM_SYS_PLL2_333M] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_SYS_PLL2_333M);
+	hws[IMX8MM_SYS_PLL2_500M] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_SYS_PLL2_500M);
+	hws[IMX8MM_SYS_PLL2_1000M] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_SYS_PLL2_1000M);
+
+	hws[IMX8MM_CLK_CLKOUT1_SEL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_CLK_CLKOUT1_SEL);
+	hws[IMX8MM_CLK_CLKOUT1_DIV] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_CLK_CLKOUT1_DIV);
+	hws[IMX8MM_CLK_CLKOUT1] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_CLK_CLKOUT1);
+	hws[IMX8MM_CLK_CLKOUT2_SEL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_CLK_CLKOUT2_SEL);
+	hws[IMX8MM_CLK_CLKOUT2_DIV] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_CLK_CLKOUT2_DIV);
+	hws[IMX8MM_CLK_CLKOUT2] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_CLK_CLKOUT2);
 
 	/* Core Slice */
 	hws[IMX8MM_CLK_A53_DIV] = imx8m_clk_hw_composite_core("arm_a53_div", imx8mm_a53_sels, base + 0x8000);
@@ -611,6 +596,7 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 
 	imx_register_uart_clocks();
 
+	dev_info(dev, "NXP i.MX8MM ccm clock driver probed\n");
 	return 0;
 
 unregister_hws:
-- 
2.43.0


