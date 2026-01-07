Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF78CF6C1F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 09:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BmL1fsReQ3EqbYLmu0dDnungq+1usCCgvUzKgEWGjPc=; b=BiDW2gxjAPbJ7+nr2Dayr9spDE
	OOCBJtKo9ETF0J7JlG0shEy0jzPatjZb+znFE8mfeCPx+6BoLOEhHFHnB1TBsT32DkUcn29o1n0/F
	ns3mTwSOZkfeu3HgZmo3pJLbeeXlmqqgLtbeCfwo32NqVDnjWeePx6qBxwYrDlI0R+BLGqPkp8swf
	lq7botqfy0oBz2HV9bE6ChgKHPzmJSwABxeiZW/EVM6JqlStIbhsEi9V3KelhxDLpDdymyfllx67x
	yLsP1eSgLFvqwypzTRzioqdJ8DP8m9d2C1EvI8SJ6DC2qs/+dZys8wYv9VSADR3P7rVK/e/YWnkZA
	JIRfwsvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQ5l-0000000EZqu-2HsW;
	Wed, 07 Jan 2026 09:44:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQ5e-0000000EZjB-2tqo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 09:44:36 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079ehdw2988528
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Jan 2026 09:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BmL1fsReQ3EqbYLmu0dDnungq+1usCCgvUzKgEWGjPc=; b=Y/bSfezaIgHE1cFP
	y1xWLG/rBQO/cMWWtEwGd/N0C656IdXceK0VtOukRaOF8lZpWWwNv7UbVJ1zBeNi
	3BCCUXdXr3QmKyHf7CzYu2fTu/k+mQEf3ctwIyZemJvVq8dVqY16dJNmZVME2GT7
	aAtjw0A2Cgum8CB3izYtp4TMnweP4tAmXceyU5q+iEfQ3Qwyn0LAfHtq1Kbs30w1
	98/Wq7SVT/uNgdBHEs9hF0TnGliBjkkOD2yLW3CaAZKm2/coqyV9Z0HDGYdOWRLW
	BG//M8f2TeDY0H/fsxWM9H4/6cTZkT87v9eazPHIYBCKJqp1hpgpRfYcUrqN0Ssa
	0xlO1g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn2nr0eb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 09:44:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7c240728e2aso3277264b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 01:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767779068; x=1768383868; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BmL1fsReQ3EqbYLmu0dDnungq+1usCCgvUzKgEWGjPc=;
        b=iJQIxA3HdVW4WGxwkqDlgQ1iY27Vz9FPtz9mc4uLM8j1f2zZlI8h3RPQzPe5NC5n9C
         X0Un6WZbOEFT87ucMmO9zuVNDvmdMoXjMztsiomXfSynWey9Dh6//eh1V2Fm+nfvj2FX
         AMj2raS8scb6R3128yw3XZOD3PEgKZfMGIXMC81CZs05R4xPh5/+Dnhy2m1zVwBzDXFc
         Ud7QrzWwZIwchX20Z94aRjkA2daP4FneS2GDEirYBfiQek21OZEhBbFW5VmOXQpPAQnI
         XFX9m6dfGj3Shxjg0oDosBGQYJsSal8X6BpfiEG970Ah1tU6hKOVNXfSm3PsF/p3bxyj
         AHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779068; x=1768383868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BmL1fsReQ3EqbYLmu0dDnungq+1usCCgvUzKgEWGjPc=;
        b=UZQyAHX6NZzVLobeuOfudV1M51+Ngl8dIZY1/Yqb7HQmZMC0Oy23UezkdeHveqblr2
         1LYSfZMh8Nx3q503YPbhwsjzsFNcE1mQsZJJ9IjkbtjqCTOUAiA8jSWBFsuVVJLehZjG
         6RwNMALWOUYBBxzRomtLgaX2JZcIva8F58j9FDXvwJ+qHNiPCNJ5H+WrISSo8CqB86kc
         KRu5kq43VW0YE9eJ1Wn5Cw3EdDrVIKaWnjmFaVlqz1fRm1jvt+C9ULOj9AGzsNDEQNRU
         usBq9MesjylSMO0Wka9yyrBqRB4hRivdJu1+kEqQdt+oZZyOEzoYxz+yu/Wrsd94jfb9
         EAkA==
X-Forwarded-Encrypted: i=1; AJvYcCX0wI/V+8VTQvckQjymjlC4RHbhpV0Q8v/Iq7kwkdx0/C4n1Cgb+zdODSkpxJKade7OonsmkUcKIH53wtg4apIm@lists.infradead.org
X-Gm-Message-State: AOJu0YyGF1z4sjgPefR/TS8DC8w+ve095JosJY0dhhT4tOl5DDm83IUQ
	VXMSQHLyUjPQnDhB2RewqYlnV/bV3k3egDuBSAGy20dhmKVv6qhP7+CN+ruhAh6R1Cj5iz3SSxR
	pmXHt39Kz976rz3sWunfixto5q5kFBjLGCQ8BCofxPsB8MUQobpscAAdcR9UfU7JePN69ei6rD5
	dTjbUm/CZ7HQ==
X-Gm-Gg: AY/fxX4nnVs26Q9OjCswP7LXQ/nh5/W/8zn4zyweeP0bRGak5RIVS3GCNaPxWTBZ9SX
	waMU8EybezO5TC6hsUGEQSaHtSiEz/kSjXYDSA3Nc3gzGCiJAhczOTMZXFuO5p2FMm96Lw9Z4wf
	/XzzaXpOB0S9eXwh2J+qvumxAh3JxGR/Nsy+SR6ngmIGhXQqjKCznLXFD1H6Ef5q150PvXltK/y
	WEpb4RYsygCtC3YCTwh4Uf61xO1bd8wYNQ7nce8/egDQcFPUupJ/h9PrqqDzCEzfrml4BU+FePq
	xj9RvY+2z1fAX4IDuifGPyygEeHfvjKpyrVopB4lHdEZXA4sPQ54aFPVSfEPL/YkkT8rXRCR/+w
	Q1X6QM+6NJ2mRv+iiPa21kppT0veu6BgQNw==
X-Received: by 2002:a05:6a00:6ca0:b0:7b8:8d43:fcd1 with SMTP id d2e1a72fcca58-81b7d86729cmr1731264b3a.9.1767779067974;
        Wed, 07 Jan 2026 01:44:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDqZxN8jMneAymzVFFQqBxxgshBHtG8GbHsf7PcTiXhJ9PeVa8Gr0wycIqhuFlS2ddg0Mz3g==
X-Received: by 2002:a05:6a00:6ca0:b0:7b8:8d43:fcd1 with SMTP id d2e1a72fcca58-81b7d86729cmr1731220b3a.9.1767779067293;
        Wed, 07 Jan 2026 01:44:27 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9568sm4472944b3a.15.2026.01.07.01.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:44:26 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 15:13:13 +0530
Subject: [PATCH v3 10/11] clk: qcom: Add support for VideoCC driver for
 Kaanapali
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-kaanapali-mmcc-v3-v3-10-8e10adc236a8@oss.qualcomm.com>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3OCBTYWx0ZWRfXw+zTDKDW00sG
 GuWQy1a0Yuw06aW608qlDHNQRXWOGadNanZcSJR4r/00xhVd+GZD8WwHa+NU8NZf6t4MZz7hy1U
 MWvv72OEiclC3XtTwXoGscbaSuBl2W7cM++Npb6pRzYYIUY4gqhL5M4xrWVcz35DBAcuBjxszsq
 XNBBPI1Qtqzogm/83E+xoxXBEAcYM2JZrugRezfRRZ3ASU6iZ+r7I5+3q+bLLMH4xlt3aXnxOhk
 3SmEJzyfDcEOpycueuzGfG2TdpXjgVFpymJq8FapDFEaGWI44iLwUNZ46LTU5PchuZQeu+PrEuY
 8hUlOOiBAtCPwhINdogzW4VQaT91xtoCJsnZxTUMNZwWQOx0gOqy+7ezCqGEUCImIWgQKIlBYmO
 nLd/TNxma+Jl2As5341zwVhDhWfxBf8v9651DzFJAxd62pVku4OGumRK0qKobk88w5Tkp4tfCD+
 y5/wuRleTJdkB5Lsmhw==
X-Authority-Analysis: v=2.4 cv=CYEFJbrl c=1 sm=1 tr=0 ts=695e2afd cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FXoFOq9PtT0JJl4RUvYA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 0aBUvKPitiMywIMuEuIkpBLq-U3-ckFL
X-Proofpoint-ORIG-GUID: 0aBUvKPitiMywIMuEuIkpBLq-U3-ckFL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_014432_216584_99AEF68B 
X-CRM114-Status: GOOD (  20.59  )
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

Enable Kaanapali video clock driver for video SW to be able to control
the clocks from the Video SW driver.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig             |   9 +
 drivers/clk/qcom/Makefile            |   1 +
 drivers/clk/qcom/videocc-kaanapali.c | 821 +++++++++++++++++++++++++++++++++++
 3 files changed, 831 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index e8abfe708aa437cb0f093fb3842ce5864888af92..a97e18703f20acbcd605a8c24795b5073d7ad1b0 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -83,6 +83,15 @@ config CLK_KAANAPALI_TCSRCC
 	  Support for the TCSR clock controller on Kaanapali devices.
 	  Say Y if you want to use peripheral devices such as PCIe, USB, UFS.
 
+config CLK_KAANAPALI_VIDEOCC
+	tristate "Kaanapali Video Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_KAANAPALI_GCC
+	help
+	  Support for the video clock controller on Kaanapali devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode/decode.
+
 config CLK_X1E80100_CAMCC
 	tristate "X1E80100 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index ab0dbef3c63714c90a3496b1ee0921aee1ce9adc..781edb0bc9a3ea160d6755ccf2b04af815baa27d 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_CLK_KAANAPALI_CAMCC) += cambistmclkcc-kaanapali.o camcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_DISPCC) += dispcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_GCC) += gcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_TCSRCC) += tcsrcc-kaanapali.o
+obj-$(CONFIG_CLK_KAANAPALI_VIDEOCC) += videocc-kaanapali.o
 obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_DISPCC) += dispcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_GCC) += gcc-x1e80100.o
diff --git a/drivers/clk/qcom/videocc-kaanapali.c b/drivers/clk/qcom/videocc-kaanapali.c
new file mode 100644
index 0000000000000000000000000000000000000000..835a59536ba79c391d4a0a1e4bab0a66f253bef0
--- /dev/null
+++ b/drivers/clk/qcom/videocc-kaanapali.c
@@ -0,0 +1,821 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,kaanapali-videocc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+#define ACCU_CFG_MASK GENMASK(25, 21)
+
+enum {
+	DT_BI_TCXO,
+	DT_AHB_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_VIDEO_CC_PLL0_OUT_MAIN,
+	P_VIDEO_CC_PLL1_OUT_MAIN,
+	P_VIDEO_CC_PLL2_OUT_MAIN,
+	P_VIDEO_CC_PLL3_OUT_MAIN,
+};
+
+static const struct pll_vco taycan_eko_t_vco[] = {
+	{ 249600000, 2500000000, 0 },
+};
+
+/* 360.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll0_config = {
+	.l = 0x12,
+	.cal_l = 0x48,
+	.alpha = 0xc000,
+	.config_ctl_val = 0x25c400e7,
+	.config_ctl_hi_val = 0x0a8062e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000008,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll video_cc_pll0 = {
+	.offset = 0x0,
+	.config = &video_cc_pll0_config,
+	.vco_table = taycan_eko_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eko_t_ops,
+		},
+	},
+};
+
+/* 480.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll1_config = {
+	.l = 0x19,
+	.cal_l = 0x48,
+	.alpha = 0x0,
+	.config_ctl_val = 0x25c400e7,
+	.config_ctl_hi_val = 0x0a8062e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000008,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll video_cc_pll1 = {
+	.offset = 0x1000,
+	.config = &video_cc_pll1_config,
+	.vco_table = taycan_eko_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eko_t_ops,
+		},
+	},
+};
+
+/* 480.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll2_config = {
+	.l = 0x19,
+	.cal_l = 0x48,
+	.alpha = 0x0,
+	.config_ctl_val = 0x25c400e7,
+	.config_ctl_hi_val = 0x0a8062e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000008,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll video_cc_pll2 = {
+	.offset = 0x2000,
+	.config = &video_cc_pll2_config,
+	.vco_table = taycan_eko_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll2",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eko_t_ops,
+		},
+	},
+};
+
+/* 480.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll3_config = {
+	.l = 0x19,
+	.cal_l = 0x48,
+	.alpha = 0x0,
+	.config_ctl_val = 0x25c400e7,
+	.config_ctl_hi_val = 0x0a8062e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000008,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll video_cc_pll3 = {
+	.offset = 0x3000,
+	.config = &video_cc_pll3_config,
+	.vco_table = taycan_eko_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll3",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eko_t_ops,
+		},
+	},
+};
+
+static const struct parent_map video_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map video_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL1_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll1.clkr.hw },
+};
+
+static const struct parent_map video_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL3_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll3.clkr.hw },
+};
+
+static const struct parent_map video_cc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL2_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_3[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll2.clkr.hw },
+};
+
+static const struct parent_map video_cc_parent_map_4[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_4[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll0.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_video_cc_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_ahb_clk_src = {
+	.cmd_rcgr = 0x8060,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_ahb_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_ahb_clk_src",
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0_clk_src[] = {
+	F(240000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(338000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(420000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(444000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(533000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(630000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(800000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(1000000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0_clk_src = {
+	.cmd_rcgr = 0x8030,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_1,
+	.freq_tbl = ftbl_video_cc_mvs0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_clk_src",
+		.parent_data = video_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0a_clk_src[] = {
+	F(240000000, P_VIDEO_CC_PLL3_OUT_MAIN, 2, 0, 0),
+	F(338000000, P_VIDEO_CC_PLL3_OUT_MAIN, 2, 0, 0),
+	F(420000000, P_VIDEO_CC_PLL3_OUT_MAIN, 2, 0, 0),
+	F(444000000, P_VIDEO_CC_PLL3_OUT_MAIN, 2, 0, 0),
+	F(533000000, P_VIDEO_CC_PLL3_OUT_MAIN, 2, 0, 0),
+	F(630000000, P_VIDEO_CC_PLL3_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0a_clk_src = {
+	.cmd_rcgr = 0x8000,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_2,
+	.freq_tbl = ftbl_video_cc_mvs0a_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0a_clk_src",
+		.parent_data = video_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0b_clk_src[] = {
+	F(240000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(338000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(420000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(444000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(533000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(630000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(850000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0b_clk_src = {
+	.cmd_rcgr = 0x8018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_3,
+	.freq_tbl = ftbl_video_cc_mvs0b_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0b_clk_src",
+		.parent_data = video_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0c_clk_src[] = {
+	F(360000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(507000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(630000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(666000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(800000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1104000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1260000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0c_clk_src = {
+	.cmd_rcgr = 0x8048,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_4,
+	.freq_tbl = ftbl_video_cc_mvs0c_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0c_clk_src",
+		.parent_data = video_cc_parent_data_4,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 video_cc_xo_clk_src = {
+	.cmd_rcgr = 0x8194,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_ahb_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_xo_clk_src",
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch video_cc_mvs0_clk = {
+	.halt_reg = 0x80d0,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80d0,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80d0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_mem_branch video_cc_mvs0_freerun_clk = {
+	.mem_enable_reg = 0x80e4,
+	.mem_ack_reg =  0x80e4,
+	.mem_enable_mask = BIT(3),
+	.mem_enable_ack_mask = GENMASK(11, 10),
+	.mem_enable_invert = true,
+	.branch = {
+		.halt_reg = 0x80e0,
+		.halt_check = BRANCH_HALT,
+		.clkr = {
+			.enable_reg = 0x80e0,
+			.enable_mask = BIT(0),
+			.hw.init = &(const struct clk_init_data) {
+				.name = "video_cc_mvs0_freerun_clk",
+				.parent_hws = (const struct clk_hw*[]) {
+					&video_cc_mvs0_clk_src.clkr.hw,
+				},
+				.num_parents = 1,
+				.flags = CLK_SET_RATE_PARENT,
+				.ops = &clk_branch2_ops,
+			},
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_shift_clk = {
+	.halt_reg = 0x81b4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x81b4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x81b4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_vpp0_clk = {
+	.halt_reg = 0x8134,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8134,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8134,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_vpp0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_vpp0_freerun_clk = {
+	.halt_reg = 0x8144,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8144,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_vpp0_freerun_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_vpp1_clk = {
+	.halt_reg = 0x8108,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8108,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8108,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_vpp1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_vpp1_freerun_clk = {
+	.halt_reg = 0x8118,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8118,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_vpp1_freerun_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0a_clk = {
+	.halt_reg = 0x8090,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8090,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8090,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0a_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0a_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0a_freerun_clk = {
+	.halt_reg = 0x80a0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80a0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0a_freerun_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0a_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0b_clk = {
+	.halt_reg = 0x80bc,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80bc,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0b_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0b_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0b_freerun_clk = {
+	.halt_reg = 0x80cc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0b_freerun_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0b_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_clk = {
+	.halt_reg = 0x8164,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8164,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8164,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0c_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_freerun_clk = {
+	.halt_reg = 0x8174,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8174,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_freerun_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0c_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_shift_clk = {
+	.halt_reg = 0x81b8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x81b8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x81b8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc video_cc_mvs0_vpp0_gdsc = {
+	.gdscr = 0x8120,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "video_cc_mvs0_vpp0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs0_vpp1_gdsc = {
+	.gdscr = 0x80f4,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "video_cc_mvs0_vpp1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs0a_gdsc = {
+	.gdscr = 0x807c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "video_cc_mvs0a_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs0c_gdsc = {
+	.gdscr = 0x814c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0c_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs0_gdsc = {
+	.gdscr = 0x80a8,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &video_cc_mvs0c_gdsc.pd,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *video_cc_kaanapali_clocks[] = {
+	[VIDEO_CC_AHB_CLK_SRC] = &video_cc_ahb_clk_src.clkr,
+	[VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
+	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
+	[VIDEO_CC_MVS0_FREERUN_CLK] = &video_cc_mvs0_freerun_clk.branch.clkr,
+	[VIDEO_CC_MVS0_SHIFT_CLK] = &video_cc_mvs0_shift_clk.clkr,
+	[VIDEO_CC_MVS0_VPP0_CLK] = &video_cc_mvs0_vpp0_clk.clkr,
+	[VIDEO_CC_MVS0_VPP0_FREERUN_CLK] = &video_cc_mvs0_vpp0_freerun_clk.clkr,
+	[VIDEO_CC_MVS0_VPP1_CLK] = &video_cc_mvs0_vpp1_clk.clkr,
+	[VIDEO_CC_MVS0_VPP1_FREERUN_CLK] = &video_cc_mvs0_vpp1_freerun_clk.clkr,
+	[VIDEO_CC_MVS0A_CLK] = &video_cc_mvs0a_clk.clkr,
+	[VIDEO_CC_MVS0A_CLK_SRC] = &video_cc_mvs0a_clk_src.clkr,
+	[VIDEO_CC_MVS0A_FREERUN_CLK] = &video_cc_mvs0a_freerun_clk.clkr,
+	[VIDEO_CC_MVS0B_CLK] = &video_cc_mvs0b_clk.clkr,
+	[VIDEO_CC_MVS0B_CLK_SRC] = &video_cc_mvs0b_clk_src.clkr,
+	[VIDEO_CC_MVS0B_FREERUN_CLK] = &video_cc_mvs0b_freerun_clk.clkr,
+	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
+	[VIDEO_CC_MVS0C_CLK_SRC] = &video_cc_mvs0c_clk_src.clkr,
+	[VIDEO_CC_MVS0C_FREERUN_CLK] = &video_cc_mvs0c_freerun_clk.clkr,
+	[VIDEO_CC_MVS0C_SHIFT_CLK] = &video_cc_mvs0c_shift_clk.clkr,
+	[VIDEO_CC_PLL0] = &video_cc_pll0.clkr,
+	[VIDEO_CC_PLL1] = &video_cc_pll1.clkr,
+	[VIDEO_CC_PLL2] = &video_cc_pll2.clkr,
+	[VIDEO_CC_PLL3] = &video_cc_pll3.clkr,
+	[VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr,
+};
+
+static struct gdsc *video_cc_kaanapali_gdscs[] = {
+	[VIDEO_CC_MVS0A_GDSC] = &video_cc_mvs0a_gdsc,
+	[VIDEO_CC_MVS0_GDSC] = &video_cc_mvs0_gdsc,
+	[VIDEO_CC_MVS0_VPP1_GDSC] = &video_cc_mvs0_vpp1_gdsc,
+	[VIDEO_CC_MVS0_VPP0_GDSC] = &video_cc_mvs0_vpp0_gdsc,
+	[VIDEO_CC_MVS0C_GDSC] = &video_cc_mvs0c_gdsc,
+};
+
+static const struct qcom_reset_map video_cc_kaanapali_resets[] = {
+	[VIDEO_CC_INTERFACE_BCR] = { 0x8178 },
+	[VIDEO_CC_MVS0_BCR] = { 0x80a4 },
+	[VIDEO_CC_MVS0_VPP0_BCR] = { 0x811c },
+	[VIDEO_CC_MVS0_VPP1_BCR] = { 0x80f0 },
+	[VIDEO_CC_MVS0A_BCR] = { 0x8078 },
+	[VIDEO_CC_MVS0C_CLK_ARES] = { 0x8164, 2 },
+	[VIDEO_CC_MVS0C_BCR] = { 0x8148 },
+	[VIDEO_CC_MVS0_FREERUN_CLK_ARES] = { 0x80e0, 2 },
+	[VIDEO_CC_MVS0C_FREERUN_CLK_ARES] = { 0x8174, 2 },
+	[VIDEO_CC_XO_CLK_ARES] = { 0x81ac, 2 },
+};
+
+static struct clk_alpha_pll *video_cc_kaanapali_plls[] = {
+	&video_cc_pll0,
+	&video_cc_pll1,
+	&video_cc_pll2,
+	&video_cc_pll3,
+};
+
+static u32 video_cc_kaanapali_critical_cbcrs[] = {
+	0x817c, /* VIDEO_CC_AHB_CLK */
+	0x81bc, /* VIDEO_CC_SLEEP_CLK */
+	0x81b0, /* VIDEO_CC_TS_XO_CLK */
+	0x81ac, /* VIDEO_CC_XO_CLK */
+};
+
+static const struct regmap_config video_cc_kaanapali_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xa010,
+	.fast_io = true,
+};
+
+static void clk_kaanapali_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/*
+	 * Enable clk_on sync for MVS0 and VPP clocks via VIDEO_CC_SPARE1
+	 * during core reset by default.
+	 */
+	regmap_set_bits(regmap, 0x9f24, BIT(0));
+
+	/*
+	 *	As per HW design recommendation
+	 *	Update DLY_ACCU_RED_SHIFTER_DONE to 0xF for the below GDSCs
+	 *	MVS0A CFG3, MVS0 CFG3, MVS0 VPP1 CFG3, MVS0 VPP0 CFG3, MVS0C CFG3
+	 */
+	regmap_set_bits(regmap, 0x8088, ACCU_CFG_MASK);
+	regmap_set_bits(regmap, 0x80b4, ACCU_CFG_MASK);
+	regmap_set_bits(regmap, 0x8100, ACCU_CFG_MASK);
+	regmap_set_bits(regmap, 0x812c, ACCU_CFG_MASK);
+	regmap_set_bits(regmap, 0x8158, ACCU_CFG_MASK);
+}
+
+static struct qcom_cc_driver_data video_cc_kaanapali_driver_data = {
+	.alpha_plls = video_cc_kaanapali_plls,
+	.num_alpha_plls = ARRAY_SIZE(video_cc_kaanapali_plls),
+	.clk_cbcrs = video_cc_kaanapali_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_kaanapali_critical_cbcrs),
+	.clk_regs_configure = clk_kaanapali_regs_configure,
+};
+
+static const struct qcom_cc_desc video_cc_kaanapali_desc = {
+	.config = &video_cc_kaanapali_regmap_config,
+	.clks = video_cc_kaanapali_clocks,
+	.num_clks = ARRAY_SIZE(video_cc_kaanapali_clocks),
+	.resets = video_cc_kaanapali_resets,
+	.num_resets = ARRAY_SIZE(video_cc_kaanapali_resets),
+	.gdscs = video_cc_kaanapali_gdscs,
+	.num_gdscs = ARRAY_SIZE(video_cc_kaanapali_gdscs),
+	.use_rpm = true,
+	.driver_data = &video_cc_kaanapali_driver_data,
+};
+
+static const struct of_device_id video_cc_kaanapali_match_table[] = {
+	{ .compatible = "qcom,kaanapali-videocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, video_cc_kaanapali_match_table);
+
+static int video_cc_kaanapali_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &video_cc_kaanapali_desc);
+}
+
+static struct platform_driver video_cc_kaanapali_driver = {
+	.probe = video_cc_kaanapali_probe,
+	.driver = {
+		.name = "videocc-kaanapali",
+		.of_match_table = video_cc_kaanapali_match_table,
+	},
+};
+
+module_platform_driver(video_cc_kaanapali_driver);
+
+MODULE_DESCRIPTION("QTI VIDEOCC Kaanapali Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


