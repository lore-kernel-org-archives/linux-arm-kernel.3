Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAE7D0EE0D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 17:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJV9JSoyhFejkAvB24QFaPgQ4+AZ+/ZZaA695tRGBm8=; b=lw4gjJnQVliFBP7yg2F6sUXN6X
	Ni9y9sjp7bu0c422KxZLwrAfPvS61bZShKZs/dPr2lzRTvc0UC8mDrrkNeIsCMg36f1wIlH255RPy
	0NaW1qh/py6qudCNo5Z4fTbuQnQjL90BRMJ5Asz6rwZ9jN15w0OKcoj5ZGTJhXAnaOu73GZfp/BpI
	2RKxdLB2XMSRMlnWaMnvQEn/OGjHXYne7mqnb+fKxfitWHvflsFKD1HriGXcr+YCEB0ZFo5k0Ns/j
	KcHgOArHGtC4yEoRLDlABGkn19TRbTSn/USKNK7VCAyUOnmiL15oKR3FoffZXetR4l0upugqh1Or8
	94Y5Ae/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNx7R-0000000Dh10-375G;
	Tue, 25 Nov 2025 17:46:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNx7N-0000000Dgxh-3QeJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 17:46:24 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APH2unq3738346
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 17:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xJV9JSoyhFejkAvB24QFaPgQ4+AZ+/ZZaA695tRGBm8=; b=izkUtrV+vYaeiwXg
	DENuHQqW3UDDXJIQ9nt9B/vNe8JSuaT2xKvS8MM8MrN7bBAmyiMB/j1tCy3sGrTJ
	WNH85HyFL98BT2YerreryvHEsWETcaTFOWVEtibEge7GLB4qXcOZBnqdqBfIqNlc
	8zCwiwGZRFs9pxoNHC23kju6PcmcJFqvaMfETGWdc96TZy1qMTGp9WJkeQc1VSTc
	P4SWLaCfnTpTgZR+k5i0buwTCer2Qf+9FiIZB/IWhzffYdXCi3yebWYhgvk7iuPL
	kTtpLjtBg/uCOnDfE5cF+f1docF35CRN8bdb2HeWGZYeKcXOBE5GMyYwkCKGFF/q
	ndaDOA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anggyg42w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 17:46:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297dde580c8so203991595ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 09:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764092780; x=1764697580; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJV9JSoyhFejkAvB24QFaPgQ4+AZ+/ZZaA695tRGBm8=;
        b=G7+pjefibvDymW7zu7F0XxsksZOdGIfIuhojRw9HFDyml1JV+G1UixbljjpV30zEn1
         9NmdlCB+9TiGgPmW//+IHhwiym9fkxSbjLVqStAULqM0cf4DCbupIR+zKfiAJHYoA3ZA
         nrd2lu4WwBIRNyw7sVUmjQJxkZegi+KB7Ldf/vkkNsp7wbpttWhkq0bmETts/L4fgcR6
         gmGf9+hZ/AvVmlVGZkdQapeYrr9Xq/R0p8I2x7LG3dLym5jf1BsRH+cGt4ht+UvnC1Id
         jAZOBH4evzBk+aAJyt9NoPGqi6/2w8UVBpHI2c/q5a3qKgGUXSjcl57J7SxLB6A77IMC
         vkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764092780; x=1764697580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xJV9JSoyhFejkAvB24QFaPgQ4+AZ+/ZZaA695tRGBm8=;
        b=cnLUXGrBt0wegR0GUxpg8qBIOooKVooq8S2ORaeKiyjE/gtQyqeqQm9ayWZQMkETMP
         aZQWGwCVG00pVi5zuoMF5vW0hl0jm8mfKfO1DrhV7gGcss6fytn9q1jg+tPgT1TyZ3mr
         8FUWARuxDPIgrgmlACi6bKqYgSqLcFX+hD1Ze9ZMT4+BfVw5TwdK8GK5zZEV3ykICTH4
         KfcPUgI/m2TlHjFazR2jqz8dM6jlcnvr0Kyfbe4KfI98XBvgfBnmO9qFJmQHDtxkfncs
         QG/BC+AzG1JOWgr7aZxh/sC1WL6wqjLdC9HYHWr6cfGE7yqGKHVrANdv+OG3xtVuWssj
         xnyw==
X-Forwarded-Encrypted: i=1; AJvYcCX5CrkYo8uT1uYagU3zOwODn3jCyi9ZTanbm7dODh+bgAiC/xsQMlnDeq8GyZHMhpAFrrG3X/f9mVHSQVAeS5JP@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy8lfiHqhKHiPuBz3kzbWdUINOKCjJJ7zD5tvj7KN68MATyDCh
	zm+Scr7RmmLHoc3DmwR2zVaEiJYsQvY9O998QBYBg28o2CFPWnKK9c/9mkgYEiHRh4xi5vXAZ4k
	+bRz6TPxwnb0V+vglugRiOMHFpjc3SlDMNtPEc8RdcpZBjbxz5xkA0J2cDTd9MitURLY3Q9qMRG
	ls8g==
X-Gm-Gg: ASbGncv2uSa+ZcxLy+6UxO/BPG729s/1uT07Ks913QJPr2xHAbZKDZUtLookoaC27z6
	GLj/OeW7lPnWiGPQ8Kib0aNXt3Gu7VHc8ojnK2UBI/YL2UJZpUdXZ3EO3ImsHx0lC2leR3npq5G
	TBD2zH/5fSQPE+TWBSYcHOISKS9KMODxm0gVHXJqADfmm6GM92uX6f0lG8YDGxe47sViZjoxqc8
	Eeklh067KdHWGQO0w4SELNHZ6HEmRGqFninewRHzz01hblwO9LiYh2Ottql8gJvTKlQKavkpbbT
	iWM8Ogq4shFapnlJJtoe6HGYYtDAgMtB+6yqKK85urY6FSg/I2crz4YKDfI195xws0LtTXC3KWa
	4pjo/cnL+/Wj+cz2sufrIP+aIrIMsYnuFJg==
X-Received: by 2002:a17:903:3884:b0:295:50f5:c0e1 with SMTP id d9443c01a7336-29baaf75c90mr42261245ad.15.1764092779079;
        Tue, 25 Nov 2025 09:46:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVgHKOqQQOzGLfAmFaYdIp3jq8l89kmMUm65uSByLKy0oPc5Jvugz94aAJwx2DgU83azILVQ==
X-Received: by 2002:a17:903:3884:b0:295:50f5:c0e1 with SMTP id d9443c01a7336-29baaf75c90mr42260775ad.15.1764092778373;
        Tue, 25 Nov 2025 09:46:18 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13964dsm174500785ad.38.2025.11.25.09.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 09:46:17 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 23:15:17 +0530
Subject: [PATCH v2 08/11] clk: qcom: dispcc: Add support for display clock
 controller Kaanapali
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-kaanapali-mmcc-v2-v2-8-fb44e78f300b@oss.qualcomm.com>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: 6xo14XSf-xcF43-y2w6p4N6p190OHGrS
X-Proofpoint-ORIG-GUID: 6xo14XSf-xcF43-y2w6p4N6p190OHGrS
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=6925eb6c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=CTeyeF6quU7oAeRjbeoA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE0OCBTYWx0ZWRfX7gXXHcNbCsHI
 rYYWWhqFBSmMkS3x3EQT4VhqX5ga80fnhNjFR4x0kAMXt3ES9bJyzOlwzZJ8A/wGcXhE+3EbVOP
 nwJlVO4kPG7u5+iaAzs3xks+AwTJXI1I0W+wdaAf1soFi+iwtAGRrdZute5hYgaoYL5A/tclt0a
 3DOoGe1kzPEobWXuGZY6ERoD9a9TeuhUXPiAUHFmEGNQT9ZA5A+9coDRRqKpF0At1QX9COtxt54
 /Plyife+iDZCL1AKVXRTtdCHttI2DcpToCcvSfcj08R6nhDkCL2vCbXyZZz890Zumyt7swXBPhr
 82JGIaTkZaG/ra0x+wJvfsm5xks9L7M03nd1VSlg1pyqEpAMX1LmnLoXOlWcUr7Wsl8fr+rvI8F
 aqAHbYCYvWW5x38Qj9eCGYDKB6lrsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_094622_076923_F63F80EE 
X-CRM114-Status: GOOD (  21.20  )
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

Support the clock controller driver for Kaanapali to enable display SW to
be able to control the clocks.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig            |   10 +
 drivers/clk/qcom/Makefile           |    1 +
 drivers/clk/qcom/dispcc-kaanapali.c | 1956 +++++++++++++++++++++++++++++++++++
 3 files changed, 1967 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index a284ba040b78ba2f7b7c7ead14023c0ec637f841..e293d1a816c2eece0291e9ee707698e97ed75cd8 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -46,6 +46,16 @@ config CLK_GLYMUR_TCSRCC
 	  Support for the TCSR clock controller on GLYMUR devices.
 	  Say Y if you want to use peripheral devices such as USB/PCIe/EDP.
 
+config CLK_KAANAPALI_DISPCC
+	tristate "Kaanapali Display Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_KAANAPALI_GCC
+	help
+	  Support for the display clock controller on Qualcomm Technologies, Inc
+	  Kaanapali devices.
+	  Say Y if you want to support display devices and functionality such as
+	  splash screen.
+
 config CLK_X1E80100_CAMCC
 	tristate "X1E80100 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 0ac8a9055a43230d848c6a0c1ac118c03c3e18d2..98ec8aeb5d5049855bb65f7371a10fb2418a468f 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
 obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
+obj-$(CONFIG_CLK_KAANAPALI_DISPCC) += dispcc-kaanapali.o
 obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_DISPCC) += dispcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_GCC) += gcc-x1e80100.o
diff --git a/drivers/clk/qcom/dispcc-kaanapali.c b/drivers/clk/qcom/dispcc-kaanapali.c
new file mode 100644
index 0000000000000000000000000000000000000000..baae2ec1f72aac04b265fb62433c75e9bd425d4d
--- /dev/null
+++ b/drivers/clk/qcom/dispcc-kaanapali.c
@@ -0,0 +1,1956 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,kaanapali-dispcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+#define DISP_CC_MISC_CMD	0xF000
+
+enum {
+	DT_BI_TCXO,
+	DT_BI_TCXO_AO,
+	DT_AHB_CLK,
+	DT_SLEEP_CLK,
+	DT_DP0_PHY_PLL_LINK_CLK,
+	DT_DP0_PHY_PLL_VCO_DIV_CLK,
+	DT_DP1_PHY_PLL_LINK_CLK,
+	DT_DP1_PHY_PLL_VCO_DIV_CLK,
+	DT_DP2_PHY_PLL_LINK_CLK,
+	DT_DP2_PHY_PLL_VCO_DIV_CLK,
+	DT_DP3_PHY_PLL_LINK_CLK,
+	DT_DP3_PHY_PLL_VCO_DIV_CLK,
+	DT_DSI0_PHY_PLL_OUT_BYTECLK,
+	DT_DSI0_PHY_PLL_OUT_DSICLK,
+	DT_DSI1_PHY_PLL_OUT_BYTECLK,
+	DT_DSI1_PHY_PLL_OUT_DSICLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_DISP_CC_PLL0_OUT_MAIN,
+	P_DISP_CC_PLL1_OUT_EVEN,
+	P_DISP_CC_PLL1_OUT_MAIN,
+	P_DISP_CC_PLL2_OUT_MAIN,
+	P_DP0_PHY_PLL_LINK_CLK,
+	P_DP0_PHY_PLL_VCO_DIV_CLK,
+	P_DP1_PHY_PLL_LINK_CLK,
+	P_DP1_PHY_PLL_VCO_DIV_CLK,
+	P_DP2_PHY_PLL_LINK_CLK,
+	P_DP2_PHY_PLL_VCO_DIV_CLK,
+	P_DP3_PHY_PLL_LINK_CLK,
+	P_DP3_PHY_PLL_VCO_DIV_CLK,
+	P_DSI0_PHY_PLL_OUT_BYTECLK,
+	P_DSI0_PHY_PLL_OUT_DSICLK,
+	P_DSI1_PHY_PLL_OUT_BYTECLK,
+	P_DSI1_PHY_PLL_OUT_DSICLK,
+};
+
+static const struct pll_vco pongo_eko_t_vco[] = {
+	{ 38400000, 153600000, 0 },
+};
+
+static const struct pll_vco taycan_eko_t_vco[] = {
+	{ 249600000, 2500000000, 0 },
+};
+
+/* 257.142858 MHz Configuration */
+static const struct alpha_pll_config disp_cc_pll0_config = {
+	.l = 0xd,
+	.cal_l = 0x48,
+	.alpha = 0x6492,
+	.config_ctl_val = 0x25c400e7,
+	.config_ctl_hi_val = 0x0a8062e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000008,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll disp_cc_pll0 = {
+	.offset = 0x0,
+	.config = &disp_cc_pll0_config,
+	.vco_table = taycan_eko_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eko_t_ops,
+		},
+	},
+};
+
+/* 300.0 MHz Configuration */
+static const struct alpha_pll_config disp_cc_pll1_config = {
+	.l = 0xf,
+	.cal_l = 0x48,
+	.alpha = 0xa000,
+	.config_ctl_val = 0x25c400e7,
+	.config_ctl_hi_val = 0x0a8062e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000008,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll disp_cc_pll1 = {
+	.offset = 0x1000,
+	.config = &disp_cc_pll1_config,
+	.vco_table = taycan_eko_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eko_t_ops,
+		},
+	},
+};
+
+/* 38.4 MHz Configuration */
+static const struct alpha_pll_config disp_cc_pll2_config = {
+	.l = 0x493,
+	.cal_l = 0x493,
+	.alpha = 0x0,
+	.config_ctl_val = 0x60000f68,
+	.config_ctl_hi_val = 0x0001c808,
+	.config_ctl_hi1_val = 0x00000000,
+	.config_ctl_hi2_val = 0x040082f4,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x0080c496,
+	.test_ctl_hi1_val = 0x40100080,
+	.test_ctl_hi2_val = 0x001001bc,
+	.test_ctl_hi3_val = 0x002003d8,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00e50302,
+};
+
+static struct clk_alpha_pll disp_cc_pll2 = {
+	.offset = 0x2000,
+	.config = &disp_cc_pll2_config,
+	.vco_table = pongo_eko_t_vco,
+	.num_vco = ARRAY_SIZE(pongo_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_PONGO_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_pll2",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_SLEEP_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_pongo_eko_t_ops,
+		},
+	},
+};
+
+static const struct parent_map disp_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map disp_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
+	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 2 },
+	{ P_DSI1_PHY_PLL_OUT_DSICLK, 3 },
+	{ P_DSI1_PHY_PLL_OUT_BYTECLK, 4 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_DSICLK },
+	{ .index = DT_DSI0_PHY_PLL_OUT_BYTECLK },
+	{ .index = DT_DSI1_PHY_PLL_OUT_DSICLK },
+	{ .index = DT_DSI1_PHY_PLL_OUT_BYTECLK },
+};
+
+static const struct parent_map disp_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DP3_PHY_PLL_VCO_DIV_CLK, 3 },
+	{ P_DP1_PHY_PLL_VCO_DIV_CLK, 4 },
+	{ P_DP2_PHY_PLL_VCO_DIV_CLK, 6 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DP3_PHY_PLL_VCO_DIV_CLK },
+	{ .index = DT_DP1_PHY_PLL_VCO_DIV_CLK },
+	{ .index = DT_DP2_PHY_PLL_VCO_DIV_CLK },
+};
+
+static const struct parent_map disp_cc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DP1_PHY_PLL_LINK_CLK, 2 },
+	{ P_DP2_PHY_PLL_LINK_CLK, 3 },
+	{ P_DP3_PHY_PLL_LINK_CLK, 4 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_3[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DP1_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP2_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP3_PHY_PLL_LINK_CLK },
+};
+
+static const struct parent_map disp_cc_parent_map_4[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
+	{ P_DISP_CC_PLL2_OUT_MAIN, 2 },
+	{ P_DSI1_PHY_PLL_OUT_DSICLK, 3 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_4[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_DSICLK },
+	{ .hw = &disp_cc_pll2.clkr.hw },
+	{ .index = DT_DSI1_PHY_PLL_OUT_DSICLK },
+};
+
+static const struct parent_map disp_cc_parent_map_5[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DP0_PHY_PLL_LINK_CLK, 1 },
+	{ P_DP0_PHY_PLL_VCO_DIV_CLK, 2 },
+	{ P_DP3_PHY_PLL_VCO_DIV_CLK, 3 },
+	{ P_DP1_PHY_PLL_VCO_DIV_CLK, 4 },
+	{ P_DP2_PHY_PLL_VCO_DIV_CLK, 6 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_5[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DP0_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP0_PHY_PLL_VCO_DIV_CLK },
+	{ .index = DT_DP3_PHY_PLL_VCO_DIV_CLK },
+	{ .index = DT_DP1_PHY_PLL_VCO_DIV_CLK },
+	{ .index = DT_DP2_PHY_PLL_VCO_DIV_CLK },
+};
+
+static const struct parent_map disp_cc_parent_map_6[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 2 },
+	{ P_DSI1_PHY_PLL_OUT_BYTECLK, 4 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_6[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_BYTECLK },
+	{ .index = DT_DSI1_PHY_PLL_OUT_BYTECLK },
+};
+
+static const struct parent_map disp_cc_parent_map_7[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DISP_CC_PLL1_OUT_MAIN, 4 },
+	{ P_DISP_CC_PLL1_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_7[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &disp_cc_pll1.clkr.hw },
+	{ .hw = &disp_cc_pll1.clkr.hw },
+};
+
+static const struct parent_map disp_cc_parent_map_8[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DP0_PHY_PLL_LINK_CLK, 1 },
+	{ P_DP1_PHY_PLL_LINK_CLK, 2 },
+	{ P_DP2_PHY_PLL_LINK_CLK, 3 },
+	{ P_DP3_PHY_PLL_LINK_CLK, 4 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_8[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DP0_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP1_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP2_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP3_PHY_PLL_LINK_CLK },
+};
+
+static const struct parent_map disp_cc_parent_map_9[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DISP_CC_PLL0_OUT_MAIN, 1 },
+	{ P_DISP_CC_PLL1_OUT_MAIN, 4 },
+	{ P_DISP_CC_PLL1_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_9[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &disp_cc_pll0.clkr.hw },
+	{ .hw = &disp_cc_pll1.clkr.hw },
+	{ .hw = &disp_cc_pll1.clkr.hw },
+};
+
+static const struct parent_map disp_cc_parent_map_10[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DISP_CC_PLL2_OUT_MAIN, 2 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_10[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &disp_cc_pll2.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_disp_cc_esync0_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 disp_cc_esync0_clk_src = {
+	.cmd_rcgr = 0x80d4,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_4,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_esync0_clk_src",
+		.parent_data = disp_cc_parent_data_4,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_esync1_clk_src = {
+	.cmd_rcgr = 0x80ec,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_4,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_esync1_clk_src",
+		.parent_data = disp_cc_parent_data_4,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(100000000, P_DISP_CC_PLL1_OUT_EVEN, 3, 0, 0),
+	F(120000000, P_DISP_CC_PLL1_OUT_EVEN, 3, 0, 0),
+	F(165000000, P_DISP_CC_PLL1_OUT_EVEN, 3, 0, 0),
+	F(200000000, P_DISP_CC_PLL1_OUT_EVEN, 3, 0, 0),
+	F(233333333, P_DISP_CC_PLL1_OUT_EVEN, 3, 0, 0),
+	F(261666667, P_DISP_CC_PLL1_OUT_EVEN, 3, 0, 0),
+	F(283333333, P_DISP_CC_PLL1_OUT_EVEN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 disp_cc_mdss_ahb_clk_src = {
+	.cmd_rcgr = 0x8378,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_7,
+	.freq_tbl = ftbl_disp_cc_mdss_ahb_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_ahb_clk_src",
+		.parent_data = disp_cc_parent_data_7,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_7),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
+	.cmd_rcgr = 0x8194,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_1,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_byte0_clk_src",
+		.parent_data = disp_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_byte1_clk_src = {
+	.cmd_rcgr = 0x81b0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_1,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_byte1_clk_src",
+		.parent_data = disp_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx0_aux_clk_src = {
+	.cmd_rcgr = 0x8248,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_0,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx0_aux_clk_src",
+		.parent_data = disp_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx0_link_clk_src = {
+	.cmd_rcgr = 0x81fc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_8,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx0_link_clk_src",
+		.parent_data = disp_cc_parent_data_8,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_8),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx0_pixel0_clk_src = {
+	.cmd_rcgr = 0x8218,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_5,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx0_pixel0_clk_src",
+		.parent_data = disp_cc_parent_data_5,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx0_pixel1_clk_src = {
+	.cmd_rcgr = 0x8230,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_5,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx0_pixel1_clk_src",
+		.parent_data = disp_cc_parent_data_5,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx1_aux_clk_src = {
+	.cmd_rcgr = 0x82ac,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_0,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx1_aux_clk_src",
+		.parent_data = disp_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx1_link_clk_src = {
+	.cmd_rcgr = 0x8290,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_3,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx1_link_clk_src",
+		.parent_data = disp_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx1_pixel0_clk_src = {
+	.cmd_rcgr = 0x8260,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_2,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx1_pixel0_clk_src",
+		.parent_data = disp_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx1_pixel1_clk_src = {
+	.cmd_rcgr = 0x8278,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_2,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx1_pixel1_clk_src",
+		.parent_data = disp_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx2_aux_clk_src = {
+	.cmd_rcgr = 0x8310,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_0,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx2_aux_clk_src",
+		.parent_data = disp_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx2_link_clk_src = {
+	.cmd_rcgr = 0x82c4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_3,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx2_link_clk_src",
+		.parent_data = disp_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx2_pixel0_clk_src = {
+	.cmd_rcgr = 0x82e0,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_2,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx2_pixel0_clk_src",
+		.parent_data = disp_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx2_pixel1_clk_src = {
+	.cmd_rcgr = 0x82f8,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_2,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx2_pixel1_clk_src",
+		.parent_data = disp_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx3_aux_clk_src = {
+	.cmd_rcgr = 0x835c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_0,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx3_aux_clk_src",
+		.parent_data = disp_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx3_link_clk_src = {
+	.cmd_rcgr = 0x8340,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_3,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx3_link_clk_src",
+		.parent_data = disp_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx3_pixel0_clk_src = {
+	.cmd_rcgr = 0x8328,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_2,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx3_pixel0_clk_src",
+		.parent_data = disp_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
+	.cmd_rcgr = 0x81cc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_6,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_esc0_clk_src",
+		.parent_data = disp_cc_parent_data_6,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_esc1_clk_src = {
+	.cmd_rcgr = 0x81e4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_6,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_esc1_clk_src",
+		.parent_data = disp_cc_parent_data_6,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_disp_cc_mdss_mdp_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(85714286, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(100000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(156000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(207000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(337000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(417000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(532000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(600000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(650000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
+	.cmd_rcgr = 0x8164,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_9,
+	.freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_mdp_clk_src",
+		.parent_data = disp_cc_parent_data_9,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_9),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
+	.cmd_rcgr = 0x811c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_1,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_pclk0_clk_src",
+		.parent_data = disp_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_pclk1_clk_src = {
+	.cmd_rcgr = 0x8134,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_1,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_pclk1_clk_src",
+		.parent_data = disp_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_pclk2_clk_src = {
+	.cmd_rcgr = 0x814c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_1,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_pclk2_clk_src",
+		.parent_data = disp_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
+	.cmd_rcgr = 0x817c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_0,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_vsync_clk_src",
+		.parent_data = disp_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_disp_cc_osc_clk_src[] = {
+	F(38400000, P_DISP_CC_PLL2_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 disp_cc_osc_clk_src = {
+	.cmd_rcgr = 0x8104,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_10,
+	.freq_tbl = ftbl_disp_cc_osc_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_osc_clk_src",
+		.parent_data = disp_cc_parent_data_10,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_10),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div disp_cc_mdss_ahb_swi_div_clk_src = {
+	.reg = 0x8374,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_ahb_swi_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_ahb_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
+	.reg = 0x81ac,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_byte0_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_byte0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div disp_cc_mdss_byte1_div_clk_src = {
+	.reg = 0x81c8,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_byte1_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_byte1_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div disp_cc_mdss_dptx0_link_div_clk_src = {
+	.reg = 0x8214,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx0_link_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div disp_cc_mdss_dptx1_link_div_clk_src = {
+	.reg = 0x82a8,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx1_link_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div disp_cc_mdss_dptx2_link_div_clk_src = {
+	.reg = 0x82dc,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx2_link_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_dptx2_link_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div disp_cc_mdss_dptx3_link_div_clk_src = {
+	.reg = 0x8358,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx3_link_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_dptx3_link_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch disp_cc_esync0_clk = {
+	.halt_reg = 0x80cc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_esync0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_esync0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_esync1_clk = {
+	.halt_reg = 0x80d0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80d0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_esync1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_esync1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_accu_shift_clk = {
+	.halt_reg = 0xe060,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0xe060,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_accu_shift_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_ahb1_clk = {
+	.halt_reg = 0xa028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_ahb1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_ahb_clk = {
+	.halt_reg = 0x80c4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80c4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_ahb_swi_clk = {
+	.halt_reg = 0x80c0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80c0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_ahb_swi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_ahb_swi_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_byte0_clk = {
+	.halt_reg = 0x8044,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8044,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_byte0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_byte0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_byte0_intf_clk = {
+	.halt_reg = 0x8048,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8048,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_byte0_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_byte0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_byte1_clk = {
+	.halt_reg = 0x804c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x804c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_byte1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_byte1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_byte1_intf_clk = {
+	.halt_reg = 0x8050,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8050,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_byte1_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_byte1_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx0_aux_clk = {
+	.halt_reg = 0x8074,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8074,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx0_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx0_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx0_crypto_clk = {
+	.halt_reg = 0x8068,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8068,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx0_crypto_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx0_link_clk = {
+	.halt_reg = 0x805c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x805c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx0_link_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx0_link_intf_clk = {
+	.halt_reg = 0x8064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8064,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx0_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx0_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx0_pixel0_clk = {
+	.halt_reg = 0x806c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x806c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx0_pixel0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx0_pixel0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx0_pixel1_clk = {
+	.halt_reg = 0x8070,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8070,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx0_pixel1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx0_pixel1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx0_usb_router_link_intf_clk = {
+	.halt_reg = 0x8060,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8060,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx0_usb_router_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx0_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx1_aux_clk = {
+	.halt_reg = 0x8090,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8090,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx1_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx1_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx1_crypto_clk = {
+	.halt_reg = 0x808c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x808c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx1_crypto_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx1_link_clk = {
+	.halt_reg = 0x8080,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8080,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx1_link_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx1_link_intf_clk = {
+	.halt_reg = 0x8088,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8088,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx1_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx1_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx1_pixel0_clk = {
+	.halt_reg = 0x8078,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8078,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx1_pixel0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx1_pixel0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx1_pixel1_clk = {
+	.halt_reg = 0x807c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x807c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx1_pixel1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx1_pixel1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx1_usb_router_link_intf_clk = {
+	.halt_reg = 0x8084,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8084,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx1_usb_router_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx1_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx2_aux_clk = {
+	.halt_reg = 0x80a8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80a8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx2_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx2_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx2_crypto_clk = {
+	.halt_reg = 0x80a4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x80a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx2_crypto_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx2_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx2_link_clk = {
+	.halt_reg = 0x809c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x809c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx2_link_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx2_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx2_link_intf_clk = {
+	.halt_reg = 0x80a0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80a0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx2_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx2_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx2_pixel0_clk = {
+	.halt_reg = 0x8094,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8094,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx2_pixel0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx2_pixel0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx2_pixel1_clk = {
+	.halt_reg = 0x8098,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8098,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx2_pixel1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx2_pixel1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx3_aux_clk = {
+	.halt_reg = 0x80b8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80b8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx3_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx3_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx3_crypto_clk = {
+	.halt_reg = 0x80bc,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x80bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx3_crypto_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx3_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx3_link_clk = {
+	.halt_reg = 0x80b0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80b0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx3_link_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx3_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx3_link_intf_clk = {
+	.halt_reg = 0x80b4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80b4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx3_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx3_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx3_pixel0_clk = {
+	.halt_reg = 0x80ac,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80ac,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx3_pixel0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx3_pixel0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_esc0_clk = {
+	.halt_reg = 0x8054,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8054,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_esc0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_esc0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_esc1_clk = {
+	.halt_reg = 0x8058,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8058,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_esc1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_esc1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_mdp1_clk = {
+	.halt_reg = 0xa004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_mdp1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_mdp_clk = {
+	.halt_reg = 0x8010,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8010,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_mdp_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_mdp_lut1_clk = {
+	.halt_reg = 0xa014,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0xa014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_mdp_lut1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_mdp_lut_clk = {
+	.halt_reg = 0x8020,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8020,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_mdp_lut_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_mdp_ss_ip_clk = {
+	.halt_reg = 0x8030,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_mdp_ss_ip_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_non_gdsc_ahb_clk = {
+	.halt_reg = 0xc004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0xc004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_non_gdsc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_pclk0_clk = {
+	.halt_reg = 0x8004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_pclk0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_pclk0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_pclk1_clk = {
+	.halt_reg = 0x8008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_pclk1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_pclk1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_pclk2_clk = {
+	.halt_reg = 0x800c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x800c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_pclk2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_pclk2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_vsync1_clk = {
+	.halt_reg = 0xa024,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa024,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_vsync1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_vsync_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_vsync_clk = {
+	.halt_reg = 0x8040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_vsync_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_vsync_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_osc_clk = {
+	.halt_reg = 0x80c8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80c8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_osc_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_osc_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc disp_cc_mdss_core_gdsc = {
+	.gdscr = 0x9000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "disp_cc_mdss_core_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | HW_CTRL_TRIGGER,
+};
+
+static struct gdsc disp_cc_mdss_core_int2_gdsc = {
+	.gdscr = 0xb000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "disp_cc_mdss_core_int2_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | HW_CTRL_TRIGGER,
+};
+
+static struct clk_regmap *disp_cc_kaanapali_clocks[] = {
+	[DISP_CC_ESYNC0_CLK] = &disp_cc_esync0_clk.clkr,
+	[DISP_CC_ESYNC0_CLK_SRC] = &disp_cc_esync0_clk_src.clkr,
+	[DISP_CC_ESYNC1_CLK] = &disp_cc_esync1_clk.clkr,
+	[DISP_CC_ESYNC1_CLK_SRC] = &disp_cc_esync1_clk_src.clkr,
+	[DISP_CC_MDSS_ACCU_SHIFT_CLK] = &disp_cc_mdss_accu_shift_clk.clkr,
+	[DISP_CC_MDSS_AHB1_CLK] = &disp_cc_mdss_ahb1_clk.clkr,
+	[DISP_CC_MDSS_AHB_CLK] = &disp_cc_mdss_ahb_clk.clkr,
+	[DISP_CC_MDSS_AHB_CLK_SRC] = &disp_cc_mdss_ahb_clk_src.clkr,
+	[DISP_CC_MDSS_AHB_SWI_CLK] = &disp_cc_mdss_ahb_swi_clk.clkr,
+	[DISP_CC_MDSS_AHB_SWI_DIV_CLK_SRC] = &disp_cc_mdss_ahb_swi_div_clk_src.clkr,
+	[DISP_CC_MDSS_BYTE0_CLK] = &disp_cc_mdss_byte0_clk.clkr,
+	[DISP_CC_MDSS_BYTE0_CLK_SRC] = &disp_cc_mdss_byte0_clk_src.clkr,
+	[DISP_CC_MDSS_BYTE0_DIV_CLK_SRC] = &disp_cc_mdss_byte0_div_clk_src.clkr,
+	[DISP_CC_MDSS_BYTE0_INTF_CLK] = &disp_cc_mdss_byte0_intf_clk.clkr,
+	[DISP_CC_MDSS_BYTE1_CLK] = &disp_cc_mdss_byte1_clk.clkr,
+	[DISP_CC_MDSS_BYTE1_CLK_SRC] = &disp_cc_mdss_byte1_clk_src.clkr,
+	[DISP_CC_MDSS_BYTE1_DIV_CLK_SRC] = &disp_cc_mdss_byte1_div_clk_src.clkr,
+	[DISP_CC_MDSS_BYTE1_INTF_CLK] = &disp_cc_mdss_byte1_intf_clk.clkr,
+	[DISP_CC_MDSS_DPTX0_AUX_CLK] = &disp_cc_mdss_dptx0_aux_clk.clkr,
+	[DISP_CC_MDSS_DPTX0_AUX_CLK_SRC] = &disp_cc_mdss_dptx0_aux_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX0_CRYPTO_CLK] = &disp_cc_mdss_dptx0_crypto_clk.clkr,
+	[DISP_CC_MDSS_DPTX0_LINK_CLK] = &disp_cc_mdss_dptx0_link_clk.clkr,
+	[DISP_CC_MDSS_DPTX0_LINK_CLK_SRC] = &disp_cc_mdss_dptx0_link_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC] = &disp_cc_mdss_dptx0_link_div_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX0_LINK_INTF_CLK] = &disp_cc_mdss_dptx0_link_intf_clk.clkr,
+	[DISP_CC_MDSS_DPTX0_PIXEL0_CLK] = &disp_cc_mdss_dptx0_pixel0_clk.clkr,
+	[DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC] = &disp_cc_mdss_dptx0_pixel0_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX0_PIXEL1_CLK] = &disp_cc_mdss_dptx0_pixel1_clk.clkr,
+	[DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC] = &disp_cc_mdss_dptx0_pixel1_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK] =
+		&disp_cc_mdss_dptx0_usb_router_link_intf_clk.clkr,
+	[DISP_CC_MDSS_DPTX1_AUX_CLK] = &disp_cc_mdss_dptx1_aux_clk.clkr,
+	[DISP_CC_MDSS_DPTX1_AUX_CLK_SRC] = &disp_cc_mdss_dptx1_aux_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX1_CRYPTO_CLK] = &disp_cc_mdss_dptx1_crypto_clk.clkr,
+	[DISP_CC_MDSS_DPTX1_LINK_CLK] = &disp_cc_mdss_dptx1_link_clk.clkr,
+	[DISP_CC_MDSS_DPTX1_LINK_CLK_SRC] = &disp_cc_mdss_dptx1_link_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX1_LINK_DIV_CLK_SRC] = &disp_cc_mdss_dptx1_link_div_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX1_LINK_INTF_CLK] = &disp_cc_mdss_dptx1_link_intf_clk.clkr,
+	[DISP_CC_MDSS_DPTX1_PIXEL0_CLK] = &disp_cc_mdss_dptx1_pixel0_clk.clkr,
+	[DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC] = &disp_cc_mdss_dptx1_pixel0_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX1_PIXEL1_CLK] = &disp_cc_mdss_dptx1_pixel1_clk.clkr,
+	[DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC] = &disp_cc_mdss_dptx1_pixel1_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK] =
+		&disp_cc_mdss_dptx1_usb_router_link_intf_clk.clkr,
+	[DISP_CC_MDSS_DPTX2_AUX_CLK] = &disp_cc_mdss_dptx2_aux_clk.clkr,
+	[DISP_CC_MDSS_DPTX2_AUX_CLK_SRC] = &disp_cc_mdss_dptx2_aux_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX2_CRYPTO_CLK] = &disp_cc_mdss_dptx2_crypto_clk.clkr,
+	[DISP_CC_MDSS_DPTX2_LINK_CLK] = &disp_cc_mdss_dptx2_link_clk.clkr,
+	[DISP_CC_MDSS_DPTX2_LINK_CLK_SRC] = &disp_cc_mdss_dptx2_link_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX2_LINK_DIV_CLK_SRC] = &disp_cc_mdss_dptx2_link_div_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX2_LINK_INTF_CLK] = &disp_cc_mdss_dptx2_link_intf_clk.clkr,
+	[DISP_CC_MDSS_DPTX2_PIXEL0_CLK] = &disp_cc_mdss_dptx2_pixel0_clk.clkr,
+	[DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC] = &disp_cc_mdss_dptx2_pixel0_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX2_PIXEL1_CLK] = &disp_cc_mdss_dptx2_pixel1_clk.clkr,
+	[DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC] = &disp_cc_mdss_dptx2_pixel1_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX3_AUX_CLK] = &disp_cc_mdss_dptx3_aux_clk.clkr,
+	[DISP_CC_MDSS_DPTX3_AUX_CLK_SRC] = &disp_cc_mdss_dptx3_aux_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX3_CRYPTO_CLK] = &disp_cc_mdss_dptx3_crypto_clk.clkr,
+	[DISP_CC_MDSS_DPTX3_LINK_CLK] = &disp_cc_mdss_dptx3_link_clk.clkr,
+	[DISP_CC_MDSS_DPTX3_LINK_CLK_SRC] = &disp_cc_mdss_dptx3_link_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX3_LINK_DIV_CLK_SRC] = &disp_cc_mdss_dptx3_link_div_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX3_LINK_INTF_CLK] = &disp_cc_mdss_dptx3_link_intf_clk.clkr,
+	[DISP_CC_MDSS_DPTX3_PIXEL0_CLK] = &disp_cc_mdss_dptx3_pixel0_clk.clkr,
+	[DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC] = &disp_cc_mdss_dptx3_pixel0_clk_src.clkr,
+	[DISP_CC_MDSS_ESC0_CLK] = &disp_cc_mdss_esc0_clk.clkr,
+	[DISP_CC_MDSS_ESC0_CLK_SRC] = &disp_cc_mdss_esc0_clk_src.clkr,
+	[DISP_CC_MDSS_ESC1_CLK] = &disp_cc_mdss_esc1_clk.clkr,
+	[DISP_CC_MDSS_ESC1_CLK_SRC] = &disp_cc_mdss_esc1_clk_src.clkr,
+	[DISP_CC_MDSS_MDP1_CLK] = &disp_cc_mdss_mdp1_clk.clkr,
+	[DISP_CC_MDSS_MDP_CLK] = &disp_cc_mdss_mdp_clk.clkr,
+	[DISP_CC_MDSS_MDP_CLK_SRC] = &disp_cc_mdss_mdp_clk_src.clkr,
+	[DISP_CC_MDSS_MDP_LUT1_CLK] = &disp_cc_mdss_mdp_lut1_clk.clkr,
+	[DISP_CC_MDSS_MDP_LUT_CLK] = &disp_cc_mdss_mdp_lut_clk.clkr,
+	[DISP_CC_MDSS_MDP_SS_IP_CLK] = &disp_cc_mdss_mdp_ss_ip_clk.clkr,
+	[DISP_CC_MDSS_NON_GDSC_AHB_CLK] = &disp_cc_mdss_non_gdsc_ahb_clk.clkr,
+	[DISP_CC_MDSS_PCLK0_CLK] = &disp_cc_mdss_pclk0_clk.clkr,
+	[DISP_CC_MDSS_PCLK0_CLK_SRC] = &disp_cc_mdss_pclk0_clk_src.clkr,
+	[DISP_CC_MDSS_PCLK1_CLK] = &disp_cc_mdss_pclk1_clk.clkr,
+	[DISP_CC_MDSS_PCLK1_CLK_SRC] = &disp_cc_mdss_pclk1_clk_src.clkr,
+	[DISP_CC_MDSS_PCLK2_CLK] = &disp_cc_mdss_pclk2_clk.clkr,
+	[DISP_CC_MDSS_PCLK2_CLK_SRC] = &disp_cc_mdss_pclk2_clk_src.clkr,
+	[DISP_CC_MDSS_VSYNC1_CLK] = &disp_cc_mdss_vsync1_clk.clkr,
+	[DISP_CC_MDSS_VSYNC_CLK] = &disp_cc_mdss_vsync_clk.clkr,
+	[DISP_CC_MDSS_VSYNC_CLK_SRC] = &disp_cc_mdss_vsync_clk_src.clkr,
+	[DISP_CC_OSC_CLK] = &disp_cc_osc_clk.clkr,
+	[DISP_CC_OSC_CLK_SRC] = &disp_cc_osc_clk_src.clkr,
+	[DISP_CC_PLL0] = &disp_cc_pll0.clkr,
+	[DISP_CC_PLL1] = &disp_cc_pll1.clkr,
+	[DISP_CC_PLL2] = &disp_cc_pll2.clkr,
+};
+
+static struct gdsc *disp_cc_kaanapali_gdscs[] = {
+	[DISP_CC_MDSS_CORE_GDSC] = &disp_cc_mdss_core_gdsc,
+	[DISP_CC_MDSS_CORE_INT2_GDSC] = &disp_cc_mdss_core_int2_gdsc,
+};
+
+static const struct qcom_reset_map disp_cc_kaanapali_resets[] = {
+	[DISP_CC_MDSS_CORE_BCR] = { 0x8000 },
+	[DISP_CC_MDSS_CORE_INT2_BCR] = { 0xa000 },
+	[DISP_CC_MDSS_RSCC_BCR] = { 0xc000 },
+};
+
+static struct clk_alpha_pll *disp_cc_kaanapali_plls[] = {
+	&disp_cc_pll0,
+	&disp_cc_pll1,
+	&disp_cc_pll2,
+};
+
+static u32 disp_cc_kaanapali_critical_cbcrs[] = {
+	0xe064, /* DISP_CC_SLEEP_CLK */
+	0xe05c, /* DISP_CC_XO_CLK */
+	0xc00c, /* DISP_CC_MDSS_RSCC_AHB_CLK */
+	0xc008, /* DISP_CC_MDSS_RSCC_VSYNC_CLK */
+};
+
+static const struct regmap_config disp_cc_kaanapali_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x12094,
+	.fast_io = true,
+};
+
+static void clk_kaanapali_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Enable clock gating for MDP clocks */
+	regmap_update_bits(regmap, DISP_CC_MISC_CMD, BIT(4), BIT(4));
+}
+
+static struct qcom_cc_driver_data disp_cc_kaanapali_driver_data = {
+	.alpha_plls = disp_cc_kaanapali_plls,
+	.num_alpha_plls = ARRAY_SIZE(disp_cc_kaanapali_plls),
+	.clk_cbcrs = disp_cc_kaanapali_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_kaanapali_critical_cbcrs),
+	.clk_regs_configure = clk_kaanapali_regs_configure,
+};
+
+static const struct qcom_cc_desc disp_cc_kaanapali_desc = {
+	.config = &disp_cc_kaanapali_regmap_config,
+	.clks = disp_cc_kaanapali_clocks,
+	.num_clks = ARRAY_SIZE(disp_cc_kaanapali_clocks),
+	.resets = disp_cc_kaanapali_resets,
+	.num_resets = ARRAY_SIZE(disp_cc_kaanapali_resets),
+	.gdscs = disp_cc_kaanapali_gdscs,
+	.num_gdscs = ARRAY_SIZE(disp_cc_kaanapali_gdscs),
+	.use_rpm = true,
+	.driver_data = &disp_cc_kaanapali_driver_data,
+};
+
+static const struct of_device_id disp_cc_kaanapali_match_table[] = {
+	{ .compatible = "qcom,kaanapali-dispcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, disp_cc_kaanapali_match_table);
+
+static int disp_cc_kaanapali_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &disp_cc_kaanapali_desc);
+}
+
+static struct platform_driver disp_cc_kaanapali_driver = {
+	.probe = disp_cc_kaanapali_probe,
+	.driver = {
+		.name = "dispcc-kaanapali",
+		.of_match_table = disp_cc_kaanapali_match_table,
+	},
+};
+
+module_platform_driver(disp_cc_kaanapali_driver);
+
+MODULE_DESCRIPTION("QTI DISPCC Kaanapali Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


