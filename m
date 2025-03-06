Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60703C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 12:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qow0y1JgvxsIZ8Ivpc0WKC+eabYDvLpiGdsQ7xFrnsM=; b=1yGa8zUpsKNPzf6fUsu79l7GH3
	4j+j/6nUdpBVzg3PnWHgu7eojYu9Enn0gVrt55eVOvmAL/viVTbr65Ee2aN/F0YHHOMU4To61NjVy
	687VdKDa3eXK3feRQXmASomeJw+VOn8nWH98mfFAPvkz1F6OOQH+JWLMjfGNZ+GN1fe0Ee50FPcKv
	T589YfiOKrvKYOMbHLVu3jMK0R+rpokKawYOk3M6aTwC8u7vwjCoYFOPa9Xj4Z41XcNTpWwIH5Rnp
	wEU3YEthWAJesZ22QpYyPR3cnmJhaL0sUgdi5ScsrJFeL7ZN2MUtLosMybWc1LcUBLckkJo6u71J1
	I2/P6Kmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqA1W-0000000AsNR-0KuX;
	Thu, 06 Mar 2025 12:08:22 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9RE-0000000Amo8-1SJJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:30:53 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso5670535e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741260651; x=1741865451; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qow0y1JgvxsIZ8Ivpc0WKC+eabYDvLpiGdsQ7xFrnsM=;
        b=bMcRIozeTkMJ2rGw/vCrbIc2OWa+/jhhUo96Y4Kuo6su+bBxvDYOUSdQSCIADqZzCe
         3Y5YH0B0CjtUPB7a1/+RvD0JPYWcY/M+COJJo0LdoMOf/DZw/LYFTtZzom6aN+OGa1W/
         zvh4Ua6IzLxpLbnVgtfy14YVzMdCuZQsHL2kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260651; x=1741865451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qow0y1JgvxsIZ8Ivpc0WKC+eabYDvLpiGdsQ7xFrnsM=;
        b=MLjr11vRA9Wvh/6geVTJEeWtOMGizHAQmMwX8cau9of90pQ6mXb1jgjN2xtrZ3myT5
         W0tph3N4L/bDrvq6dPl0uW58QK55Uy33ykuaN0LL3BWeHbQa64jYfQi4hq7+KGgUhTC+
         TeFojt+8ENPnsqUSBNUkRVYJV2i2sc6gCTsQMD1C1zN6vB1XKJbfhVQG63JqrJB9SYb5
         BQrHKx7HNDt7U+G/wDCbg3qbQYomR0/mFedLL2L9mugSpMdocD2OLlmsZgyTtQ4OLMwm
         nJLhrOYggsh5etNQeAQJCNiqqs+LWWbNui6BDVqk1gXq/7tS57Oe/qXqGjMlKenSHtxv
         aVdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ+xdAsdZiWuvrZks94Kcpa2W3spmrvue5XShEJBe6K8M1+6isEF6o+rZ8mohOg6zlGix/Ja7SJXFlF1lWjgCl@lists.infradead.org
X-Gm-Message-State: AOJu0Yz44bWAzaPzZvkRIB772c9qnMRTzNL9A+J3sdKyRhP8W1PUux/3
	A97XPz4j/xy3392TIV3mJy+mTqbs4ofrenh2yd1GiCCwYQikMzvcSpiFMr8Z4pw=
X-Gm-Gg: ASbGncthSvkJwpsZhOKMGujCyC4UcnxCBqTZ+BRdTwIXesfrer/r0vswxF0PFqXdf9j
	ScCJKGojF8turY+0jdZT/13ZUe8lE6NGI8c/cZUJNY3WImqWgniwheMUz9M2nR4my6WTtvD+lFi
	KzefugDTmkeTCFlu+T2DkWuiN3T4C76C42c89PPKUaBIc0G/7wgxqEfL6nsqGv2LX1f3ta9NaCV
	VuARtG92RV938dr+1EHsaVHyZ1aHN3p4IY082hVCkylGXiv8ZXOotQYuFEFdVqZarFJWVwA6hdK
	9CYMjHH1hZFkWIt6w6103Wb0040xjWG2kAgFNb8aIGLVPwhEVl8feRHz2dKPkU2MapDLu2edSXU
	8zjJVSA==
X-Google-Smtp-Source: AGHT+IFNrXJuMosHeMpF3mriZJ3lC1n/qPJDY1F9XSAb3AlnhEenH//Y+wSE35HbmHiYXfm1o+nMWA==
X-Received: by 2002:a05:600c:511a:b0:439:a0a3:a15 with SMTP id 5b1f17b1804b1-43bd29695e6mr67745045e9.14.1741260650616;
        Thu, 06 Mar 2025 03:30:50 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4703:aa8c:6eab:8161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79b9sm1749650f8f.3.2025.03.06.03.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:30:50 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v10 13/18] clk: imx: add support for i.MX8MP anatop clock driver
Date: Thu,  6 Mar 2025 12:28:02 +0100
Message-ID: <20250306112959.242131-14-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
References: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_033052_393314_E23B78AA 
X-CRM114-Status: GOOD (  17.25  )
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

Support NXP i.MX8P anatop PLL module which generates PLLs to CCM root.
By doing so, we also simplify the CCM driver code. The changes are
backward compatible.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 drivers/clk/imx/Makefile            |   2 +-
 drivers/clk/imx/clk-imx8mp-anatop.c | 306 ++++++++++++++++++++++++++++
 drivers/clk/imx/clk-imx8mp.c        | 188 ++++++++---------
 3 files changed, 391 insertions(+), 105 deletions(-)
 create mode 100644 drivers/clk/imx/clk-imx8mp-anatop.c

diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index 8e0f42a0c69c..311a557900a9 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -27,7 +27,7 @@ obj-$(CONFIG_MXC_CLK) += mxc-clk.o
 
 obj-$(CONFIG_CLK_IMX8MM) += clk-imx8mm-anatop.o clk-imx8mm.o
 obj-$(CONFIG_CLK_IMX8MN) += clk-imx8mn-anatop.o clk-imx8mn.o
-obj-$(CONFIG_CLK_IMX8MP) += clk-imx8mp.o clk-imx8mp-audiomix.o
+obj-$(CONFIG_CLK_IMX8MP) += clk-imx8mp-anatop.o clk-imx8mp.o clk-imx8mp-audiomix.o
 obj-$(CONFIG_CLK_IMX8MQ) += clk-imx8mq.o
 
 obj-$(CONFIG_CLK_IMX93) += clk-imx93.o
diff --git a/drivers/clk/imx/clk-imx8mp-anatop.c b/drivers/clk/imx/clk-imx8mp-anatop.c
new file mode 100644
index 000000000000..ac23fcf92fd1
--- /dev/null
+++ b/drivers/clk/imx/clk-imx8mp-anatop.c
@@ -0,0 +1,306 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * clk-imx8mp-anatop.c - NXP i.MX8MP anatop clock driver
+ *
+ * Copyright (c) 2025 Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
+#include <dt-bindings/clock/imx8mp-clock.h>
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
+#define IMX8MP_ANATOP_CLK_END		(IMX8MP_ANATOP_CLK_CLKOUT2 + 1)
+
+static const char * const pll_ref_sels[] = { "osc_24m", "dummy", "dummy", "dummy", };
+static const char * const audio_pll1_bypass_sels[] = {"audio_pll1", "audio_pll1_ref_sel", };
+static const char * const audio_pll2_bypass_sels[] = {"audio_pll2", "audio_pll2_ref_sel", };
+static const char * const video_pll_bypass_sels[] = {"video_pll", "video_pll_ref_sel", };
+static const char * const dram_pll_bypass_sels[] = {"dram_pll", "dram_pll_ref_sel", };
+static const char * const gpu_pll_bypass_sels[] = {"gpu_pll", "gpu_pll_ref_sel", };
+static const char * const vpu_pll_bypass_sels[] = {"vpu_pll", "vpu_pll_ref_sel", };
+static const char * const arm_pll_bypass_sels[] = {"arm_pll", "arm_pll_ref_sel", };
+static const char * const sys_pll1_bypass_sels[] = {"sys_pll1", "sys_pll1_ref_sel", };
+static const char * const sys_pll2_bypass_sels[] = {"sys_pll2", "sys_pll2_ref_sel", };
+static const char * const sys_pll3_bypass_sels[] = {"sys_pll3", "sys_pll3_ref_sel", };
+static const char * const clkout_sels[] = {"audio_pll1_out", "audio_pll2_out", "video_pll_out",
+					   "dummy", "dummy", "gpu_pll_out", "vpu_pll_out",
+					   "arm_pll_out", "sys_pll1_out", "sys_pll2_out",
+					   "sys_pll3_out", "dummy", "dummy", "osc_24m",
+					   "dummy", "osc_32k"};
+
+static struct clk_hw_onecell_data *clk_hw_data;
+static struct clk_hw **hws;
+
+static int imx8mp_anatop_clocks_probe(struct platform_device *pdev)
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
+						    IMX8MP_ANATOP_CLK_END),
+				   GFP_KERNEL);
+	if (WARN_ON(!clk_hw_data))
+		return -ENOMEM;
+
+	clk_hw_data->num = IMX8MP_ANATOP_CLK_END;
+	hws = clk_hw_data->hws;
+
+	hws[IMX8MP_ANATOP_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0);
+	hws[IMX8MP_ANATOP_CLK_32K] = imx_get_clk_hw_by_name(np, "osc_32k");
+	hws[IMX8MP_ANATOP_CLK_24M] = imx_get_clk_hw_by_name(np, "osc_24m");
+
+	hws[IMX8MP_ANATOP_AUDIO_PLL1_REF_SEL] =
+		imx_clk_hw_mux("audio_pll1_ref_sel", base + 0x0, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MP_ANATOP_AUDIO_PLL2_REF_SEL] =
+		imx_clk_hw_mux("audio_pll2_ref_sel", base + 0x14, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MP_ANATOP_VIDEO_PLL_REF_SEL] =
+		imx_clk_hw_mux("video_pll_ref_sel", base + 0x28, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MP_ANATOP_DRAM_PLL_REF_SEL] =
+		imx_clk_hw_mux("dram_pll_ref_sel", base + 0x50, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MP_ANATOP_GPU_PLL_REF_SEL] =
+		imx_clk_hw_mux("gpu_pll_ref_sel", base + 0x64, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MP_ANATOP_VPU_PLL_REF_SEL] =
+		imx_clk_hw_mux("vpu_pll_ref_sel", base + 0x74, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MP_ANATOP_ARM_PLL_REF_SEL] =
+		imx_clk_hw_mux("arm_pll_ref_sel", base + 0x84, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MP_ANATOP_SYS_PLL1_REF_SEL] =
+		imx_clk_hw_mux("sys_pll1_ref_sel", base + 0x94, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MP_ANATOP_SYS_PLL2_REF_SEL] =
+		imx_clk_hw_mux("sys_pll2_ref_sel", base + 0x104, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MP_ANATOP_SYS_PLL3_REF_SEL] =
+		imx_clk_hw_mux("sys_pll3_ref_sel", base + 0x114, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+
+	hws[IMX8MP_ANATOP_AUDIO_PLL1] =
+		imx_clk_hw_pll14xx("audio_pll1", "audio_pll1_ref_sel",
+				   base, &imx_1443x_pll);
+	hws[IMX8MP_ANATOP_AUDIO_PLL2] =
+		imx_clk_hw_pll14xx("audio_pll2", "audio_pll2_ref_sel",
+				   base + 0x14, &imx_1443x_pll);
+	hws[IMX8MP_ANATOP_VIDEO_PLL] =
+		imx_clk_hw_pll14xx("video_pll", "video_pll_ref_sel",
+				   base + 0x28, &imx_1443x_pll);
+	hws[IMX8MP_ANATOP_DRAM_PLL] =
+		imx_clk_hw_pll14xx("dram_pll", "dram_pll_ref_sel",
+				   base + 0x50, &imx_1443x_dram_pll);
+	hws[IMX8MP_ANATOP_GPU_PLL] =
+		imx_clk_hw_pll14xx("gpu_pll", "gpu_pll_ref_sel",
+				   base + 0x64, &imx_1416x_pll);
+	hws[IMX8MP_ANATOP_VPU_PLL] =
+		imx_clk_hw_pll14xx("vpu_pll", "vpu_pll_ref_sel",
+				   base + 0x74, &imx_1416x_pll);
+	hws[IMX8MP_ANATOP_ARM_PLL] =
+		imx_clk_hw_pll14xx("arm_pll", "arm_pll_ref_sel",
+				   base + 0x84, &imx_1416x_pll);
+	hws[IMX8MP_ANATOP_SYS_PLL1] =
+		imx_clk_hw_pll14xx("sys_pll1", "sys_pll1_ref_sel",
+				   base + 0x94, &imx_1416x_pll);
+	hws[IMX8MP_ANATOP_SYS_PLL2] =
+		imx_clk_hw_pll14xx("sys_pll2", "sys_pll2_ref_sel",
+				   base + 0x104, &imx_1416x_pll);
+	hws[IMX8MP_ANATOP_SYS_PLL3] =
+		imx_clk_hw_pll14xx("sys_pll3", "sys_pll3_ref_sel",
+				   base + 0x114, &imx_1416x_pll);
+
+	hws[IMX8MP_ANATOP_AUDIO_PLL1_BYPASS] =
+		imx_clk_hw_mux_flags("audio_pll1_bypass", base, 16, 1,
+				     audio_pll1_bypass_sels,
+				     ARRAY_SIZE(audio_pll1_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MP_ANATOP_AUDIO_PLL2_BYPASS] =
+		imx_clk_hw_mux_flags("audio_pll2_bypass", base + 0x14,
+				     16, 1, audio_pll2_bypass_sels,
+				     ARRAY_SIZE(audio_pll2_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MP_ANATOP_VIDEO_PLL_BYPASS] =
+		imx_clk_hw_mux_flags("video_pll_bypass", base + 0x28,
+				     16, 1, video_pll_bypass_sels,
+				     ARRAY_SIZE(video_pll_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MP_ANATOP_DRAM_PLL_BYPASS] =
+		imx_clk_hw_mux_flags("dram_pll_bypass", base + 0x50,
+				     16, 1, dram_pll_bypass_sels,
+				     ARRAY_SIZE(dram_pll_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MP_ANATOP_GPU_PLL_BYPASS] =
+		imx_clk_hw_mux_flags("gpu_pll_bypass", base + 0x64,
+				     28, 1, gpu_pll_bypass_sels,
+				     ARRAY_SIZE(gpu_pll_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MP_ANATOP_VPU_PLL_BYPASS] =
+		imx_clk_hw_mux_flags("vpu_pll_bypass", base + 0x74,
+				     28, 1, vpu_pll_bypass_sels,
+				     ARRAY_SIZE(vpu_pll_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MP_ANATOP_ARM_PLL_BYPASS] =
+		imx_clk_hw_mux_flags("arm_pll_bypass", base + 0x84,
+				     28, 1, arm_pll_bypass_sels,
+				     ARRAY_SIZE(arm_pll_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MP_ANATOP_SYS_PLL1_BYPASS] =
+		imx_clk_hw_mux_flags("sys_pll1_bypass", base + 0x94,
+				     28, 1, sys_pll1_bypass_sels,
+				     ARRAY_SIZE(sys_pll1_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MP_ANATOP_SYS_PLL2_BYPASS] =
+		imx_clk_hw_mux_flags("sys_pll2_bypass", base + 0x104,
+				     28, 1, sys_pll2_bypass_sels,
+				     ARRAY_SIZE(sys_pll2_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MP_ANATOP_SYS_PLL3_BYPASS] =
+		imx_clk_hw_mux_flags("sys_pll3_bypass", base + 0x114,
+				     28, 1, sys_pll3_bypass_sels,
+				     ARRAY_SIZE(sys_pll3_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+
+	hws[IMX8MP_ANATOP_AUDIO_PLL1_OUT] =
+		imx_clk_hw_gate("audio_pll1_out", "audio_pll1_bypass",
+				base, 13);
+	hws[IMX8MP_ANATOP_AUDIO_PLL2_OUT] =
+		imx_clk_hw_gate("audio_pll2_out", "audio_pll2_bypass",
+				base + 0x14, 13);
+	hws[IMX8MP_ANATOP_VIDEO_PLL_OUT] =
+		imx_clk_hw_gate("video_pll_out", "video_pll_bypass",
+				base + 0x28, 13);
+	hws[IMX8MP_ANATOP_DRAM_PLL_OUT] =
+		imx_clk_hw_gate("dram_pll_out", "dram_pll_bypass",
+				base + 0x50, 13);
+	hws[IMX8MP_ANATOP_GPU_PLL_OUT] =
+		imx_clk_hw_gate("gpu_pll_out", "gpu_pll_bypass",
+				base + 0x64, 11);
+	hws[IMX8MP_ANATOP_VPU_PLL_OUT] =
+		imx_clk_hw_gate("vpu_pll_out", "vpu_pll_bypass",
+				base + 0x74, 11);
+	hws[IMX8MP_ANATOP_ARM_PLL_OUT] =
+		imx_clk_hw_gate("arm_pll_out", "arm_pll_bypass",
+				base + 0x84, 11);
+	hws[IMX8MP_ANATOP_SYS_PLL3_OUT] =
+		imx_clk_hw_gate("sys_pll3_out", "sys_pll3_bypass",
+				base + 0x114, 11);
+
+	hws[IMX8MP_ANATOP_SYS_PLL1_OUT] =
+		imx_clk_hw_gate("sys_pll1_out", "sys_pll1_bypass",
+				base + 0x94, 11);
+
+	hws[IMX8MP_ANATOP_SYS_PLL1_40M] =
+		imx_clk_hw_fixed_factor("sys_pll1_40m", "sys_pll1_out", 1, 20);
+	hws[IMX8MP_ANATOP_SYS_PLL1_80M] =
+		imx_clk_hw_fixed_factor("sys_pll1_80m", "sys_pll1_out", 1, 10);
+	hws[IMX8MP_ANATOP_SYS_PLL1_100M] =
+		imx_clk_hw_fixed_factor("sys_pll1_100m", "sys_pll1_out", 1, 8);
+	hws[IMX8MP_ANATOP_SYS_PLL1_133M] =
+		imx_clk_hw_fixed_factor("sys_pll1_133m", "sys_pll1_out", 1, 6);
+	hws[IMX8MP_ANATOP_SYS_PLL1_160M] =
+		imx_clk_hw_fixed_factor("sys_pll1_160m", "sys_pll1_out", 1, 5);
+	hws[IMX8MP_ANATOP_SYS_PLL1_200M] =
+		imx_clk_hw_fixed_factor("sys_pll1_200m", "sys_pll1_out", 1, 4);
+	hws[IMX8MP_ANATOP_SYS_PLL1_266M] =
+		imx_clk_hw_fixed_factor("sys_pll1_266m", "sys_pll1_out", 1, 3);
+	hws[IMX8MP_ANATOP_SYS_PLL1_400M] =
+		imx_clk_hw_fixed_factor("sys_pll1_400m", "sys_pll1_out", 1, 2);
+	hws[IMX8MP_ANATOP_SYS_PLL1_800M] =
+		imx_clk_hw_fixed_factor("sys_pll1_800m", "sys_pll1_out", 1, 1);
+
+	hws[IMX8MP_ANATOP_SYS_PLL2_OUT] =
+		imx_clk_hw_gate("sys_pll2_out", "sys_pll2_bypass",
+				base + 0x104, 11);
+
+	hws[IMX8MP_ANATOP_SYS_PLL2_50M] =
+		imx_clk_hw_fixed_factor("sys_pll2_50m", "sys_pll2_out", 1, 20);
+	hws[IMX8MP_ANATOP_SYS_PLL2_100M] =
+		imx_clk_hw_fixed_factor("sys_pll2_100m", "sys_pll2_out", 1, 10);
+	hws[IMX8MP_ANATOP_SYS_PLL2_125M] =
+		imx_clk_hw_fixed_factor("sys_pll2_125m", "sys_pll2_out", 1, 8);
+	hws[IMX8MP_ANATOP_SYS_PLL2_166M] =
+		imx_clk_hw_fixed_factor("sys_pll2_166m", "sys_pll2_out", 1, 6);
+	hws[IMX8MP_ANATOP_SYS_PLL2_200M] =
+		imx_clk_hw_fixed_factor("sys_pll2_200m", "sys_pll2_out", 1, 5);
+	hws[IMX8MP_ANATOP_SYS_PLL2_250M] =
+		imx_clk_hw_fixed_factor("sys_pll2_250m", "sys_pll2_out", 1, 4);
+	hws[IMX8MP_ANATOP_SYS_PLL2_333M] =
+		imx_clk_hw_fixed_factor("sys_pll2_333m", "sys_pll2_out", 1, 3);
+	hws[IMX8MP_ANATOP_SYS_PLL2_500M] =
+		imx_clk_hw_fixed_factor("sys_pll2_500m", "sys_pll2_out", 1, 2);
+	hws[IMX8MP_ANATOP_SYS_PLL2_1000M] =
+		imx_clk_hw_fixed_factor("sys_pll2_1000m", "sys_pll2_out", 1, 1);
+
+	hws[IMX8MP_ANATOP_CLK_CLKOUT1_SEL] =
+		imx_clk_hw_mux2("clkout1_sel", base + 0x128, 4, 4,
+				clkout_sels, ARRAY_SIZE(clkout_sels));
+	hws[IMX8MP_ANATOP_CLK_CLKOUT1_DIV] =
+		imx_clk_hw_divider("clkout1_div", "clkout1_sel", base + 0x128,
+				   0, 4);
+	hws[IMX8MP_ANATOP_CLK_CLKOUT1] =
+		imx_clk_hw_gate("clkout1", "clkout1_div", base + 0x128, 8);
+	hws[IMX8MP_ANATOP_CLK_CLKOUT2_SEL] =
+		imx_clk_hw_mux2("clkout2_sel", base + 0x128, 20, 4,
+				clkout_sels, ARRAY_SIZE(clkout_sels));
+	hws[IMX8MP_ANATOP_CLK_CLKOUT2_DIV] =
+		imx_clk_hw_divider("clkout2_div", "clkout2_sel", base + 0x128,
+				   16, 4);
+	hws[IMX8MP_ANATOP_CLK_CLKOUT2] =
+		imx_clk_hw_gate("clkout2", "clkout2_div", base + 0x128, 24);
+
+	imx_check_clk_hws(hws, IMX8MP_ANATOP_CLK_END);
+
+	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
+	if (ret < 0) {
+		imx_unregister_hw_clocks(hws, IMX8MP_ANATOP_CLK_END);
+		return dev_err_probe(dev, ret,
+				     "failed to register anatop clock provider\n");
+	}
+
+	dev_info(dev, "NXP i.MX8MP anatop clock driver probed\n");
+	return 0;
+}
+
+static const struct of_device_id imx8mp_anatop_clk_of_match[] = {
+	{ .compatible = "fsl,imx8mp-anatop" },
+	{ /* Sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, imx8mp_anatop_clk_of_match);
+
+static struct platform_driver imx8mp_anatop_clk_driver = {
+	.probe = imx8mp_anatop_clocks_probe,
+	.driver = {
+		.name = "imx8mp-anatop",
+		/*
+		 * Disable bind attributes: clocks are not removed and
+		 * reloading the driver will crash or break devices.
+		 */
+		.suppress_bind_attrs = true,
+		.of_match_table = imx8mp_anatop_clk_of_match,
+	},
+};
+
+module_platform_driver(imx8mp_anatop_clk_driver);
+
+MODULE_AUTHOR("Dario Binacchi <dario.binacchi@amarulasolutions.com>");
+MODULE_DESCRIPTION("NXP i.MX8MP anatop clock driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 063bf26453a0..9dda576e5fbd 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -20,18 +20,6 @@ static u32 share_count_media;
 static u32 share_count_usb;
 static u32 share_count_audio;
 
-static const char * const pll_ref_sels[] = { "osc_24m", "dummy", "dummy", "dummy", };
-static const char * const audio_pll1_bypass_sels[] = {"audio_pll1", "audio_pll1_ref_sel", };
-static const char * const audio_pll2_bypass_sels[] = {"audio_pll2", "audio_pll2_ref_sel", };
-static const char * const video_pll_bypass_sels[] = {"video_pll", "video_pll_ref_sel", };
-static const char * const dram_pll_bypass_sels[] = {"dram_pll", "dram_pll_ref_sel", };
-static const char * const gpu_pll_bypass_sels[] = {"gpu_pll", "gpu_pll_ref_sel", };
-static const char * const vpu_pll_bypass_sels[] = {"vpu_pll", "vpu_pll_ref_sel", };
-static const char * const arm_pll_bypass_sels[] = {"arm_pll", "arm_pll_ref_sel", };
-static const char * const sys_pll1_bypass_sels[] = {"sys_pll1", "sys_pll1_ref_sel", };
-static const char * const sys_pll2_bypass_sels[] = {"sys_pll2", "sys_pll2_ref_sel", };
-static const char * const sys_pll3_bypass_sels[] = {"sys_pll3", "sys_pll3_ref_sel", };
-
 static const char * const imx8mp_a53_sels[] = {"osc_24m", "arm_pll_out", "sys_pll2_500m",
 					       "sys_pll2_1000m", "sys_pll1_800m", "sys_pll1_400m",
 					       "audio_pll1_out", "sys_pll3_out", };
@@ -397,29 +385,16 @@ static const char * const imx8mp_sai7_sels[] = {"osc_24m", "audio_pll1_out", "au
 
 static const char * const imx8mp_dram_core_sels[] = {"dram_pll_out", "dram_alt_root", };
 
-static const char * const imx8mp_clkout_sels[] = {"audio_pll1_out", "audio_pll2_out", "video_pll_out",
-						  "dummy", "dummy", "gpu_pll_out", "vpu_pll_out",
-						  "arm_pll_out", "sys_pll1_out", "sys_pll2_out",
-						  "sys_pll3_out", "dummy", "dummy", "osc_24m",
-						  "dummy", "osc_32k"};
-
 static struct clk_hw **hws;
 static struct clk_hw_onecell_data *clk_hw_data;
 
 static int imx8mp_clocks_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np;
-	void __iomem *anatop_base, *ccm_base;
+	struct device_node *np = dev->of_node, *anp;
+	void __iomem *ccm_base;
 	int err;
 
-	np = of_find_compatible_node(NULL, NULL, "fsl,imx8mp-anatop");
-	anatop_base = devm_of_iomap(dev, np, 0, NULL);
-	of_node_put(np);
-	if (WARN_ON(IS_ERR(anatop_base)))
-		return PTR_ERR(anatop_base);
-
-	np = dev->of_node;
 	ccm_base = devm_platform_ioremap_resource(pdev, 0);
 	if (WARN_ON(IS_ERR(ccm_base)))
 		return PTR_ERR(ccm_base);
@@ -431,88 +406,92 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	clk_hw_data->num = IMX8MP_CLK_END;
 	hws = clk_hw_data->hws;
 
-	hws[IMX8MP_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0);
-	hws[IMX8MP_CLK_24M] = imx_get_clk_hw_by_name(np, "osc_24m");
-	hws[IMX8MP_CLK_32K] = imx_get_clk_hw_by_name(np, "osc_32k");
+	anp = of_find_compatible_node(NULL, NULL, "fsl,imx8mp-anatop");
+	if (!anp)
+		return dev_err_probe(dev, -ENODEV, "missing anatop\n");
+
+	of_node_put(anp);
+
+	hws[IMX8MP_CLK_DUMMY] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_CLK_DUMMY);
+	hws[IMX8MP_CLK_24M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_CLK_24M);
+	hws[IMX8MP_CLK_32K] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_CLK_32K);
 	hws[IMX8MP_CLK_EXT1] = imx_get_clk_hw_by_name(np, "clk_ext1");
 	hws[IMX8MP_CLK_EXT2] = imx_get_clk_hw_by_name(np, "clk_ext2");
 	hws[IMX8MP_CLK_EXT3] = imx_get_clk_hw_by_name(np, "clk_ext3");
 	hws[IMX8MP_CLK_EXT4] = imx_get_clk_hw_by_name(np, "clk_ext4");
 
-	hws[IMX8MP_AUDIO_PLL1_REF_SEL] = imx_clk_hw_mux("audio_pll1_ref_sel", anatop_base + 0x0, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MP_AUDIO_PLL2_REF_SEL] = imx_clk_hw_mux("audio_pll2_ref_sel", anatop_base + 0x14, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MP_VIDEO_PLL_REF_SEL] = imx_clk_hw_mux("video_pll_ref_sel", anatop_base + 0x28, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MP_DRAM_PLL_REF_SEL] = imx_clk_hw_mux("dram_pll_ref_sel", anatop_base + 0x50, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MP_GPU_PLL_REF_SEL] = imx_clk_hw_mux("gpu_pll_ref_sel", anatop_base + 0x64, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MP_VPU_PLL_REF_SEL] = imx_clk_hw_mux("vpu_pll_ref_sel", anatop_base + 0x74, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MP_ARM_PLL_REF_SEL] = imx_clk_hw_mux("arm_pll_ref_sel", anatop_base + 0x84, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MP_SYS_PLL1_REF_SEL] = imx_clk_hw_mux("sys_pll1_ref_sel", anatop_base + 0x94, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MP_SYS_PLL2_REF_SEL] = imx_clk_hw_mux("sys_pll2_ref_sel", anatop_base + 0x104, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MP_SYS_PLL3_REF_SEL] = imx_clk_hw_mux("sys_pll3_ref_sel", anatop_base + 0x114, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-
-	hws[IMX8MP_AUDIO_PLL1] = imx_clk_hw_pll14xx("audio_pll1", "audio_pll1_ref_sel", anatop_base, &imx_1443x_pll);
-	hws[IMX8MP_AUDIO_PLL2] = imx_clk_hw_pll14xx("audio_pll2", "audio_pll2_ref_sel", anatop_base + 0x14, &imx_1443x_pll);
-	hws[IMX8MP_VIDEO_PLL] = imx_clk_hw_pll14xx("video_pll", "video_pll_ref_sel", anatop_base + 0x28, &imx_1443x_pll);
-	hws[IMX8MP_DRAM_PLL] = imx_clk_hw_pll14xx("dram_pll", "dram_pll_ref_sel", anatop_base + 0x50, &imx_1443x_dram_pll);
-	hws[IMX8MP_GPU_PLL] = imx_clk_hw_pll14xx("gpu_pll", "gpu_pll_ref_sel", anatop_base + 0x64, &imx_1416x_pll);
-	hws[IMX8MP_VPU_PLL] = imx_clk_hw_pll14xx("vpu_pll", "vpu_pll_ref_sel", anatop_base + 0x74, &imx_1416x_pll);
-	hws[IMX8MP_ARM_PLL] = imx_clk_hw_pll14xx("arm_pll", "arm_pll_ref_sel", anatop_base + 0x84, &imx_1416x_pll);
-	hws[IMX8MP_SYS_PLL1] = imx_clk_hw_pll14xx("sys_pll1", "sys_pll1_ref_sel", anatop_base + 0x94, &imx_1416x_pll);
-	hws[IMX8MP_SYS_PLL2] = imx_clk_hw_pll14xx("sys_pll2", "sys_pll2_ref_sel", anatop_base + 0x104, &imx_1416x_pll);
-	hws[IMX8MP_SYS_PLL3] = imx_clk_hw_pll14xx("sys_pll3", "sys_pll3_ref_sel", anatop_base + 0x114, &imx_1416x_pll);
-
-	hws[IMX8MP_AUDIO_PLL1_BYPASS] = imx_clk_hw_mux_flags("audio_pll1_bypass", anatop_base, 16, 1, audio_pll1_bypass_sels, ARRAY_SIZE(audio_pll1_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MP_AUDIO_PLL2_BYPASS] = imx_clk_hw_mux_flags("audio_pll2_bypass", anatop_base + 0x14, 16, 1, audio_pll2_bypass_sels, ARRAY_SIZE(audio_pll2_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MP_VIDEO_PLL_BYPASS] = imx_clk_hw_mux_flags("video_pll_bypass", anatop_base + 0x28, 16, 1, video_pll_bypass_sels, ARRAY_SIZE(video_pll_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MP_DRAM_PLL_BYPASS] = imx_clk_hw_mux_flags("dram_pll_bypass", anatop_base + 0x50, 16, 1, dram_pll_bypass_sels, ARRAY_SIZE(dram_pll_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MP_GPU_PLL_BYPASS] = imx_clk_hw_mux_flags("gpu_pll_bypass", anatop_base + 0x64, 28, 1, gpu_pll_bypass_sels, ARRAY_SIZE(gpu_pll_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MP_VPU_PLL_BYPASS] = imx_clk_hw_mux_flags("vpu_pll_bypass", anatop_base + 0x74, 28, 1, vpu_pll_bypass_sels, ARRAY_SIZE(vpu_pll_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MP_ARM_PLL_BYPASS] = imx_clk_hw_mux_flags("arm_pll_bypass", anatop_base + 0x84, 28, 1, arm_pll_bypass_sels, ARRAY_SIZE(arm_pll_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MP_SYS_PLL1_BYPASS] = imx_clk_hw_mux_flags("sys_pll1_bypass", anatop_base + 0x94, 28, 1, sys_pll1_bypass_sels, ARRAY_SIZE(sys_pll1_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MP_SYS_PLL2_BYPASS] = imx_clk_hw_mux_flags("sys_pll2_bypass", anatop_base + 0x104, 28, 1, sys_pll2_bypass_sels, ARRAY_SIZE(sys_pll2_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MP_SYS_PLL3_BYPASS] = imx_clk_hw_mux_flags("sys_pll3_bypass", anatop_base + 0x114, 28, 1, sys_pll3_bypass_sels, ARRAY_SIZE(sys_pll3_bypass_sels), CLK_SET_RATE_PARENT);
-
-	hws[IMX8MP_AUDIO_PLL1_OUT] = imx_clk_hw_gate("audio_pll1_out", "audio_pll1_bypass", anatop_base, 13);
-	hws[IMX8MP_AUDIO_PLL2_OUT] = imx_clk_hw_gate("audio_pll2_out", "audio_pll2_bypass", anatop_base + 0x14, 13);
-	hws[IMX8MP_VIDEO_PLL_OUT] = imx_clk_hw_gate("video_pll_out", "video_pll_bypass", anatop_base + 0x28, 13);
-	hws[IMX8MP_DRAM_PLL_OUT] = imx_clk_hw_gate("dram_pll_out", "dram_pll_bypass", anatop_base + 0x50, 13);
-	hws[IMX8MP_GPU_PLL_OUT] = imx_clk_hw_gate("gpu_pll_out", "gpu_pll_bypass", anatop_base + 0x64, 11);
-	hws[IMX8MP_VPU_PLL_OUT] = imx_clk_hw_gate("vpu_pll_out", "vpu_pll_bypass", anatop_base + 0x74, 11);
-	hws[IMX8MP_ARM_PLL_OUT] = imx_clk_hw_gate("arm_pll_out", "arm_pll_bypass", anatop_base + 0x84, 11);
-	hws[IMX8MP_SYS_PLL3_OUT] = imx_clk_hw_gate("sys_pll3_out", "sys_pll3_bypass", anatop_base + 0x114, 11);
-
-	hws[IMX8MP_SYS_PLL1_OUT] = imx_clk_hw_gate("sys_pll1_out", "sys_pll1_bypass", anatop_base + 0x94, 11);
-
-	hws[IMX8MP_SYS_PLL1_40M] = imx_clk_hw_fixed_factor("sys_pll1_40m", "sys_pll1_out", 1, 20);
-	hws[IMX8MP_SYS_PLL1_80M] = imx_clk_hw_fixed_factor("sys_pll1_80m", "sys_pll1_out", 1, 10);
-	hws[IMX8MP_SYS_PLL1_100M] = imx_clk_hw_fixed_factor("sys_pll1_100m", "sys_pll1_out", 1, 8);
-	hws[IMX8MP_SYS_PLL1_133M] = imx_clk_hw_fixed_factor("sys_pll1_133m", "sys_pll1_out", 1, 6);
-	hws[IMX8MP_SYS_PLL1_160M] = imx_clk_hw_fixed_factor("sys_pll1_160m", "sys_pll1_out", 1, 5);
-	hws[IMX8MP_SYS_PLL1_200M] = imx_clk_hw_fixed_factor("sys_pll1_200m", "sys_pll1_out", 1, 4);
-	hws[IMX8MP_SYS_PLL1_266M] = imx_clk_hw_fixed_factor("sys_pll1_266m", "sys_pll1_out", 1, 3);
-	hws[IMX8MP_SYS_PLL1_400M] = imx_clk_hw_fixed_factor("sys_pll1_400m", "sys_pll1_out", 1, 2);
-	hws[IMX8MP_SYS_PLL1_800M] = imx_clk_hw_fixed_factor("sys_pll1_800m", "sys_pll1_out", 1, 1);
-
-	hws[IMX8MP_SYS_PLL2_OUT] = imx_clk_hw_gate("sys_pll2_out", "sys_pll2_bypass", anatop_base + 0x104, 11);
-
-	hws[IMX8MP_SYS_PLL2_50M] = imx_clk_hw_fixed_factor("sys_pll2_50m", "sys_pll2_out", 1, 20);
-	hws[IMX8MP_SYS_PLL2_100M] = imx_clk_hw_fixed_factor("sys_pll2_100m", "sys_pll2_out", 1, 10);
-	hws[IMX8MP_SYS_PLL2_125M] = imx_clk_hw_fixed_factor("sys_pll2_125m", "sys_pll2_out", 1, 8);
-	hws[IMX8MP_SYS_PLL2_166M] = imx_clk_hw_fixed_factor("sys_pll2_166m", "sys_pll2_out", 1, 6);
-	hws[IMX8MP_SYS_PLL2_200M] = imx_clk_hw_fixed_factor("sys_pll2_200m", "sys_pll2_out", 1, 5);
-	hws[IMX8MP_SYS_PLL2_250M] = imx_clk_hw_fixed_factor("sys_pll2_250m", "sys_pll2_out", 1, 4);
-	hws[IMX8MP_SYS_PLL2_333M] = imx_clk_hw_fixed_factor("sys_pll2_333m", "sys_pll2_out", 1, 3);
-	hws[IMX8MP_SYS_PLL2_500M] = imx_clk_hw_fixed_factor("sys_pll2_500m", "sys_pll2_out", 1, 2);
-	hws[IMX8MP_SYS_PLL2_1000M] = imx_clk_hw_fixed_factor("sys_pll2_1000m", "sys_pll2_out", 1, 1);
-
-	hws[IMX8MP_CLK_CLKOUT1_SEL] = imx_clk_hw_mux2("clkout1_sel", anatop_base + 0x128, 4, 4,
-						      imx8mp_clkout_sels, ARRAY_SIZE(imx8mp_clkout_sels));
-	hws[IMX8MP_CLK_CLKOUT1_DIV] = imx_clk_hw_divider("clkout1_div", "clkout1_sel", anatop_base + 0x128, 0, 4);
-	hws[IMX8MP_CLK_CLKOUT1] = imx_clk_hw_gate("clkout1", "clkout1_div", anatop_base + 0x128, 8);
-	hws[IMX8MP_CLK_CLKOUT2_SEL] = imx_clk_hw_mux2("clkout2_sel", anatop_base + 0x128, 20, 4,
-						      imx8mp_clkout_sels, ARRAY_SIZE(imx8mp_clkout_sels));
-	hws[IMX8MP_CLK_CLKOUT2_DIV] = imx_clk_hw_divider("clkout2_div", "clkout2_sel", anatop_base + 0x128, 16, 4);
-	hws[IMX8MP_CLK_CLKOUT2] = imx_clk_hw_gate("clkout2", "clkout2_div", anatop_base + 0x128, 24);
+	hws[IMX8MP_AUDIO_PLL1_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_AUDIO_PLL1_REF_SEL);
+	hws[IMX8MP_AUDIO_PLL2_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_AUDIO_PLL2_REF_SEL);
+	hws[IMX8MP_VIDEO_PLL_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_VIDEO_PLL_REF_SEL);
+	hws[IMX8MP_DRAM_PLL_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_DRAM_PLL_REF_SEL);
+	hws[IMX8MP_GPU_PLL_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_GPU_PLL_REF_SEL);
+	hws[IMX8MP_VPU_PLL_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_VPU_PLL_REF_SEL);
+	hws[IMX8MP_ARM_PLL_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_ARM_PLL_REF_SEL);
+	hws[IMX8MP_SYS_PLL1_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL1_REF_SEL);
+	hws[IMX8MP_SYS_PLL2_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL2_REF_SEL);
+	hws[IMX8MP_SYS_PLL3_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL3_REF_SEL);
+
+	hws[IMX8MP_AUDIO_PLL1] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_AUDIO_PLL1);
+	hws[IMX8MP_AUDIO_PLL2] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_AUDIO_PLL2);
+	hws[IMX8MP_VIDEO_PLL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_VIDEO_PLL);
+	hws[IMX8MP_DRAM_PLL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_DRAM_PLL);
+	hws[IMX8MP_GPU_PLL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_GPU_PLL);
+	hws[IMX8MP_VPU_PLL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_VPU_PLL);
+	hws[IMX8MP_ARM_PLL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_ARM_PLL);
+	hws[IMX8MP_SYS_PLL1] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL1);
+	hws[IMX8MP_SYS_PLL2] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL2);
+	hws[IMX8MP_SYS_PLL3] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL3);
+
+	hws[IMX8MP_AUDIO_PLL1_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_AUDIO_PLL1_BYPASS);
+	hws[IMX8MP_AUDIO_PLL2_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_AUDIO_PLL2_BYPASS);
+	hws[IMX8MP_VIDEO_PLL_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_VIDEO_PLL_BYPASS);
+	hws[IMX8MP_DRAM_PLL_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_DRAM_PLL_BYPASS);
+	hws[IMX8MP_GPU_PLL_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_GPU_PLL_BYPASS);
+	hws[IMX8MP_VPU_PLL_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_VPU_PLL_BYPASS);
+	hws[IMX8MP_ARM_PLL_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_ARM_PLL_BYPASS);
+	hws[IMX8MP_SYS_PLL1_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL1_BYPASS);
+	hws[IMX8MP_SYS_PLL2_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL2_BYPASS);
+	hws[IMX8MP_SYS_PLL3_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL3_BYPASS);
+
+	hws[IMX8MP_AUDIO_PLL1_OUT] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_AUDIO_PLL1_OUT);
+	hws[IMX8MP_AUDIO_PLL2_OUT] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_AUDIO_PLL2_OUT);
+	hws[IMX8MP_VIDEO_PLL_OUT] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_VIDEO_PLL_OUT);
+	hws[IMX8MP_DRAM_PLL_OUT] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_DRAM_PLL_OUT);
+	hws[IMX8MP_GPU_PLL_OUT] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_GPU_PLL_OUT);
+	hws[IMX8MP_VPU_PLL_OUT] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_VPU_PLL_OUT);
+	hws[IMX8MP_ARM_PLL_OUT] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_ARM_PLL_OUT);
+	hws[IMX8MP_SYS_PLL3_OUT] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL3_OUT);
+
+	hws[IMX8MP_SYS_PLL1_OUT] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL1_OUT);
+
+	hws[IMX8MP_SYS_PLL1_40M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL1_40M);
+	hws[IMX8MP_SYS_PLL1_80M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL1_80M);
+	hws[IMX8MP_SYS_PLL1_100M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL1_100M);
+	hws[IMX8MP_SYS_PLL1_133M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL1_133M);
+	hws[IMX8MP_SYS_PLL1_160M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL1_160M);
+	hws[IMX8MP_SYS_PLL1_200M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL1_200M);
+	hws[IMX8MP_SYS_PLL1_266M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL1_266M);
+	hws[IMX8MP_SYS_PLL1_400M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL1_400M);
+	hws[IMX8MP_SYS_PLL1_800M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL1_800M);
+
+	hws[IMX8MP_SYS_PLL2_OUT] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL2_OUT);
+
+	hws[IMX8MP_SYS_PLL2_50M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL2_50M);
+	hws[IMX8MP_SYS_PLL2_100M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL2_100M);
+	hws[IMX8MP_SYS_PLL2_125M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL2_125M);
+	hws[IMX8MP_SYS_PLL2_166M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL2_166M);
+	hws[IMX8MP_SYS_PLL2_200M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL2_200M);
+	hws[IMX8MP_SYS_PLL2_250M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL2_250M);
+	hws[IMX8MP_SYS_PLL2_333M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL2_333M);
+	hws[IMX8MP_SYS_PLL2_500M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL2_500M);
+	hws[IMX8MP_SYS_PLL2_1000M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL2_1000M);
+
+	hws[IMX8MP_CLK_CLKOUT1_SEL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_CLK_CLKOUT1_SEL);
+	hws[IMX8MP_CLK_CLKOUT1_DIV] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_CLK_CLKOUT1_DIV);
+	hws[IMX8MP_CLK_CLKOUT1] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_CLK_CLKOUT1);
+	hws[IMX8MP_CLK_CLKOUT2_SEL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_CLK_CLKOUT2_SEL);
+	hws[IMX8MP_CLK_CLKOUT2_DIV] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_CLK_CLKOUT2_DIV);
+	hws[IMX8MP_CLK_CLKOUT2] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_CLK_CLKOUT2);
 
 	hws[IMX8MP_CLK_A53_DIV] = imx8m_clk_hw_composite_core("arm_a53_div", imx8mp_a53_sels, ccm_base + 0x8000);
 	hws[IMX8MP_CLK_A53_SRC] = hws[IMX8MP_CLK_A53_DIV];
@@ -724,6 +703,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 
 	imx_register_uart_clocks();
 
+	dev_info(dev, "NXP i.MX8MP ccm clock driver probed\n");
 	return 0;
 }
 
-- 
2.43.0


