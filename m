Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1143CDC198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 09:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmFNLDhJPPtYIHKpMvQr4DdUUEpwS3Il/WVt/6KCEEk=; b=IrNASNpN4huZ43DLd2vadl/KMl
	dtldaSDZBMz3xxVwSolSj5pq3D/Dabh80MBOL6aePcjjQvNFGPzmRkXuqk44CYplWxC+Qqw9SW1W3
	65FLbDwiadgarWBlVLM5uJKg0UPFfDqUjx7OcxTDcOwk/MnzzjUeu6PLexnnWwIa4leA8iHbia+o6
	3XrMlQ+Cs5Pq6kinDb2kCaQd3xoKjRtOOsqftdmtYDmXMUF0yQopm2uFlW7boqIVTh99xn80ETDg0
	1z4SKI+ymVDKsDd+Da03iYlgHo0weP5OAU1BRdw5v/ETTPYj+bGtX+12noyw/sc7azN8fdFzdbwpG
	FWD9uL+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQ5u-0000000EZyD-1dAr;
	Wed, 07 Jan 2026 09:44:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQ5j-0000000EZos-2tNG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 09:44:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079RDRr4136987
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Jan 2026 09:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fmFNLDhJPPtYIHKpMvQr4DdUUEpwS3Il/WVt/6KCEEk=; b=igRpbmDTosRzSClx
	zQ/5eC85urbe8w7xC+tpDkH7XyEy6e1M0MJQYDmtfHQVcuAicUtr1WTb5IH03G94
	jUUA5YlHOj0yyqk7XnJlqNniC399hXpef2hu64OvAK3FcKM04dYgvdFBwuZ60c/i
	uDlH2rMx7raaosMVx+08m5B0FYrGwPyUDq7ksrsjoYdzFAgFESb4Gy0NjRX6/Pmu
	5NUbrLdWjOnYv/Zf2GLogF89tmwZibun5uSuA9bHhcgHMJObvPyQQfXVEJwyC9cV
	Jl3gPkQuleI+2mLyIB40NhRGRDFGFwefZFtIe23UGr2B355vweiaDz4e9riRAWzX
	i/wyIg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66e2sua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 09:44:35 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7d481452732so2669398b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 01:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767779074; x=1768383874; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fmFNLDhJPPtYIHKpMvQr4DdUUEpwS3Il/WVt/6KCEEk=;
        b=Y2lSrrUrKr1qabANSSTj4RUXyfdfTtsUF/FjTsRHzFCphTlFQe7Q1qZ4HENsCixMF+
         2YOEWbvXrvBz/VpLaUPdQwxCidhS150MV7QjEUGkvhPocFaVrMQ8y4f8ImebCv6wZ/VO
         vCnM/C50IXBL21GGYaSvlO8HrEyEB9nny2dGYsOF+Q12KU1e8pCIOt9THAalq9QeERoO
         pCDk94NyCy3xc5IrB6XR9pS7ImnimZwmr7bQyz3jtDehllykX59XU5rgYPfDBzBIxLEL
         0W8NlHNHug6FQR5oGGxIyuJOm2dKsh6rJmgBepHgSbuLh2IUVM9TYotfdwdxSXMt0LZ9
         +vvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779074; x=1768383874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fmFNLDhJPPtYIHKpMvQr4DdUUEpwS3Il/WVt/6KCEEk=;
        b=unzMqRJwV7EdRi1U/dLQ/nrED+T3NuwpsShviwW6gnc/2vQqrheKl9dGol3hZ6zAOm
         CqPmDhbv5nYDsdjs6BKJBOyC1UqbrQIdFr+aMDchAgf8uwBe7UDoBO7pLzYyyXEr7Dlx
         8DHfwf7CaY7aJd7nveeZ0Caqs6uE2TVK1p18XBfXlh6BW9j2l1mq8tkrP6cnOzHF/gcO
         1Kmh8m7f9gKSNDrMB+xX+cUzFM4TKCtgJd3iHC1VIwjAGuBWz7iY/j9OUZI+X5lejiCB
         ZZJW75E+fNGhpqLQP5yy0Tp6aqRCXojDnTyyWDJcGG0fNf2MWaAd+ft96jT/3vNb6iPO
         K1DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc6iGLeUtn5ilKzT6lUSkAqrZQxhT2FwZg9WkRCNssU4xdY6A5i/YAndMGFLGTNgfMnaief8H+L2J/Zysbu4vx@lists.infradead.org
X-Gm-Message-State: AOJu0YxAQCdul+UwQnFo+1fzbjUleRf6eFGkJ5aiG54kdR/DQGtv9Ty2
	3DRcHhxM3z0yPc2eSKCbGdA3RhvNDFAlDZ5hPNkYVyty9F4+uy0LsmbXgI6lmf9n8mwhmV/5vvE
	HAPEVZ1umcxQlAauhAn2UrDk19F/jJxbRiTEASNwXHYh8vEYJohKFBtyjoziRvUu/vyQ4mNrdC6
	QHrlj7rwmcNQ==
X-Gm-Gg: AY/fxX4dLYV7vkA1R+sHo5nW034yu0DvmJnxjfrM1zXAoKEqVY67Tc4UiFhodIlu/B+
	NKrIeAJuXu565wOd78k02HTlUU5QbJ4k3pnVIoAgUFydvtAZ4mFsI2mkJihlr0sPKbzMQVejJS9
	g13ofAj2idr+R2AcEgmJdPpRlR5JoMqC8rNhBzW5/rHCI6BlUFonHN2E0Q64K79sxNBwAAuMSTw
	lObOqaw5s24hdwdBvDBPB6nekTjPvXRnMSKwudrYDhhqHIQ4wdrglNvaVk4+y8685cPmAT9R4Uy
	VQlYmO00iCebKd7+juZHcSGzG6zoIY1529GJUukWsJaTs5l3iaD9bvWo4VVtGPpZd9U4a32oawT
	IyX8E/4yNxlHMqJcxcKWf6CvCg4geIAKkpw==
X-Received: by 2002:a05:6a00:ac03:b0:7e8:450c:61c0 with SMTP id d2e1a72fcca58-81b80ac4ad2mr2061423b3a.48.1767779073859;
        Wed, 07 Jan 2026 01:44:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBwvQZhrbviBiibT0rpL9+0h1/qDZwiKUwNNauuQBOnmOUufQNE2l3XSvQJoJ8LH6o0AgEAg==
X-Received: by 2002:a05:6a00:ac03:b0:7e8:450c:61c0 with SMTP id d2e1a72fcca58-81b80ac4ad2mr2061377b3a.48.1767779073303;
        Wed, 07 Jan 2026 01:44:33 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9568sm4472944b3a.15.2026.01.07.01.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:44:33 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 15:13:14 +0530
Subject: [PATCH v3 11/11] clk: qcom: Add support for GPUCC and GXCLK for
 Kaanapali
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-kaanapali-mmcc-v3-v3-11-8e10adc236a8@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3OCBTYWx0ZWRfX2T9lTwwVegwU
 4SDiZOEwxmuDKDqeGoikFyMXkOv3jsylpxvVQI/iRdX9lwb7yjLr2trt+032fdXN1KHT74ZNFow
 i0QWAsdJV1b0Ioe8LPR60lMrhddSvnzIT45NMPEJW37hlyEFXOb4hZJ2WyhGoyn+mORSPukzLso
 6w+knInHkyPM4H0I9FD30xmDEtyA8QSeoxdOPPVQWnTh9wNy/xrtdGzfwTJ4b5Biytlw55kX8fb
 PndnrSIDCNui1z0c34NZ7ofxjQARJrzXMar/x4VZzBNwEPG6J1XsL40dnXdKlqPl0vr6gz9FybM
 n0QYxLNTPnju6R/ZdaUeqyyiT7rMTcPekf6xD8Y5+xlPbOiQ25gv9POkAh9n/Q7FfTT4WzfcDMv
 o/DPBqBPrUQ5cDZgTZTyFTDz4+UydI0EmDCcfnJ9XkhQ5a53h3HYCtnVwmdxWhKvI2t/I0cI1Wf
 bxj8ZdfmAgE7Ayr00zA==
X-Proofpoint-GUID: d6SMXXhMcRbXFSlkl5PxkIcegbB-rbc_
X-Proofpoint-ORIG-GUID: d6SMXXhMcRbXFSlkl5PxkIcegbB-rbc_
X-Authority-Analysis: v=2.4 cv=evHSD4pX c=1 sm=1 tr=0 ts=695e2b03 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=B_MwUqmwx3FHfgWfen4A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_014435_789319_BE8C7447 
X-CRM114-Status: GOOD (  20.76  )
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

Support the graphics clock controller for Kaanapali for Graphics SW
driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
block dedicated to managing clocks for the GPU subsystem on GX power
domain. The GX clock controller driver manages only the GX GDSC and the
rest of the resources of the controller are managed by the firmware.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig              |   9 +
 drivers/clk/qcom/Makefile             |   1 +
 drivers/clk/qcom/gpucc-kaanapali.c    | 482 ++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/gxclkctl-kaanapali.c |  76 ++++++
 4 files changed, 568 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index a97e18703f20acbcd605a8c24795b5073d7ad1b0..301e52a78384674024a0c63e6ae0a298979515a0 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -75,6 +75,15 @@ config CLK_KAANAPALI_GCC
 	  Say Y if you want to use peripheral devices such as UART,
 	  SPI, I2C, USB, SD/UFS, PCIe etc.
 
+config CLK_KAANAPALI_GPUCC
+	tristate "Kaanapali Graphics Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_KAANAPALI_GCC
+	help
+	  Support for the graphics clock controller on Kaanapali devices.
+	  Say Y if you want to support graphics controller devices and
+	  functionality such as 3D graphics.
+
 config CLK_KAANAPALI_TCSRCC
 	tristate "Kaanapali TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 781edb0bc9a3ea160d6755ccf2b04af815baa27d..0d4d9f4eb582a1baa398727d2c32b80195e1bb2f 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
 obj-$(CONFIG_CLK_KAANAPALI_CAMCC) += cambistmclkcc-kaanapali.o camcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_DISPCC) += dispcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_GCC) += gcc-kaanapali.o
+obj-$(CONFIG_CLK_KAANAPALI_GPUCC) += gpucc-kaanapali.o gxclkctl-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_TCSRCC) += tcsrcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_VIDEOCC) += videocc-kaanapali.o
 obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
diff --git a/drivers/clk/qcom/gpucc-kaanapali.c b/drivers/clk/qcom/gpucc-kaanapali.c
new file mode 100644
index 0000000000000000000000000000000000000000..52be48c15c67203f64e54eb836d6cd67b505b77e
--- /dev/null
+++ b/drivers/clk/qcom/gpucc-kaanapali.c
@@ -0,0 +1,482 @@
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
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,kaanapali-gpucc.h>
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
+enum {
+	DT_BI_TCXO,
+	DT_GPLL0_OUT_MAIN,
+	DT_GPLL0_OUT_MAIN_DIV,
+};
+
+enum {
+	P_BI_TCXO,
+	P_GPLL0_OUT_MAIN,
+	P_GPLL0_OUT_MAIN_DIV,
+	P_GPU_CC_PLL0_OUT_EVEN,
+	P_GPU_CC_PLL0_OUT_MAIN,
+	P_GPU_CC_PLL0_OUT_ODD,
+};
+
+static const struct pll_vco taycan_eko_t_vco[] = {
+	{ 249600000, 2500000000, 0 },
+};
+
+/* 950.0 MHz Configuration */
+static const struct alpha_pll_config gpu_cc_pll0_config = {
+	.l = 0x31,
+	.cal_l = 0x48,
+	.alpha = 0x7aaa,
+	.config_ctl_val = 0x25c400e7,
+	.config_ctl_hi_val = 0x0a8062e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000408,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll gpu_cc_pll0 = {
+	.offset = 0x0,
+	.config = &gpu_cc_pll0_config,
+	.vco_table = taycan_eko_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eko_t_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_gpu_cc_pll0_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv gpu_cc_pll0_out_even = {
+	.offset = 0x0,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_gpu_cc_pll0_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_gpu_cc_pll0_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_pll0_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpu_cc_pll0.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_taycan_eko_t_ops,
+	},
+};
+
+static const struct parent_map gpu_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_CC_PLL0_OUT_MAIN, 1 },
+	{ P_GPU_CC_PLL0_OUT_EVEN, 2 },
+	{ P_GPU_CC_PLL0_OUT_ODD, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .hw = &gpu_cc_pll0_out_even.clkr.hw },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(475000000, P_GPU_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	F(575000000, P_GPU_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	F(700000000, P_GPU_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	F(725000000, P_GPU_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	F(750000000, P_GPU_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_gmu_clk_src = {
+	.cmd_rcgr = 0x9318,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_0,
+	.hw_clk_ctrl = true,
+	.freq_tbl = ftbl_gpu_cc_gmu_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_gmu_clk_src",
+		.parent_data = gpu_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gpu_cc_hub_clk_src[] = {
+	F(150000000, P_GPLL0_OUT_MAIN_DIV, 2, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	F(300000000, P_GPLL0_OUT_MAIN, 2, 0, 0),
+	F(400000000, P_GPLL0_OUT_MAIN, 1.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_hub_clk_src = {
+	.cmd_rcgr = 0x93f0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_0,
+	.hw_clk_ctrl = true,
+	.freq_tbl = ftbl_gpu_cc_hub_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_hub_clk_src",
+		.parent_data = gpu_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div gpu_cc_hub_div_clk_src = {
+	.reg = 0x9430,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_hub_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpu_cc_hub_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch gpu_cc_ahb_clk = {
+	.halt_reg = 0x90bc,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x90bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_accu_shift_clk = {
+	.halt_reg = 0x9104,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9104,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_accu_shift_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_gmu_clk = {
+	.halt_reg = 0x90d4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x90d4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_gmu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gmu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cxo_clk = {
+	.halt_reg = 0x90e4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x90e4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cxo_clk",
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_demet_clk = {
+	.halt_reg = 0x9010,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9010,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_demet_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_dpm_clk = {
+	.halt_reg = 0x9108,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9108,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_dpm_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_freq_measure_clk = {
+	.halt_reg = 0x900c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x900c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_freq_measure_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gpu_smmu_vote_clk = {
+	.halt_reg = 0x7000,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x7000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gpu_smmu_vote_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gx_accu_shift_clk = {
+	.halt_reg = 0x9070,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9070,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gx_accu_shift_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gx_gmu_clk = {
+	.halt_reg = 0x9060,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9060,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gx_gmu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gmu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_hub_aon_clk = {
+	.halt_reg = 0x93ec,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x93ec,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_hub_aon_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_hub_cx_int_clk = {
+	.halt_reg = 0x90e8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x90e8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_hub_cx_int_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_memnoc_gfx_clk = {
+	.halt_reg = 0x90ec,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x90ec,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_memnoc_gfx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc gpu_cc_cx_gdsc = {
+	.gdscr = 0x9080,
+	.gds_hw_ctrl = 0x9094,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x8,
+	.pd = {
+		.name = "gpu_cc_cx_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *gpu_cc_kaanapali_clocks[] = {
+	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
+	[GPU_CC_CX_ACCU_SHIFT_CLK] = &gpu_cc_cx_accu_shift_clk.clkr,
+	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
+	[GPU_CC_CXO_CLK] = &gpu_cc_cxo_clk.clkr,
+	[GPU_CC_DEMET_CLK] = &gpu_cc_demet_clk.clkr,
+	[GPU_CC_DPM_CLK] = &gpu_cc_dpm_clk.clkr,
+	[GPU_CC_FREQ_MEASURE_CLK] = &gpu_cc_freq_measure_clk.clkr,
+	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
+	[GPU_CC_GPU_SMMU_VOTE_CLK] = &gpu_cc_gpu_smmu_vote_clk.clkr,
+	[GPU_CC_GX_ACCU_SHIFT_CLK] = &gpu_cc_gx_accu_shift_clk.clkr,
+	[GPU_CC_GX_GMU_CLK] = &gpu_cc_gx_gmu_clk.clkr,
+	[GPU_CC_HUB_AON_CLK] = &gpu_cc_hub_aon_clk.clkr,
+	[GPU_CC_HUB_CLK_SRC] = &gpu_cc_hub_clk_src.clkr,
+	[GPU_CC_HUB_CX_INT_CLK] = &gpu_cc_hub_cx_int_clk.clkr,
+	[GPU_CC_HUB_DIV_CLK_SRC] = &gpu_cc_hub_div_clk_src.clkr,
+	[GPU_CC_MEMNOC_GFX_CLK] = &gpu_cc_memnoc_gfx_clk.clkr,
+	[GPU_CC_PLL0] = &gpu_cc_pll0.clkr,
+	[GPU_CC_PLL0_OUT_EVEN] = &gpu_cc_pll0_out_even.clkr,
+};
+
+static struct gdsc *gpu_cc_kaanapali_gdscs[] = {
+	[GPU_CC_CX_GDSC] = &gpu_cc_cx_gdsc,
+};
+
+static const struct qcom_reset_map gpu_cc_kaanapali_resets[] = {
+	[GPU_CC_CB_BCR] = { 0x93a0 },
+	[GPU_CC_CX_BCR] = { 0x907c },
+	[GPU_CC_FAST_HUB_BCR] = { 0x93e4 },
+	[GPU_CC_FF_BCR] = { 0x9470 },
+	[GPU_CC_GMU_BCR] = { 0x9314 },
+	[GPU_CC_GX_BCR] = { 0x905c },
+	[GPU_CC_XO_BCR] = { 0x9000 },
+};
+
+static struct clk_alpha_pll *gpu_cc_kaanapali_plls[] = {
+	&gpu_cc_pll0,
+};
+
+static u32 gpu_cc_kaanapali_critical_cbcrs[] = {
+	0x9008, /* GPU_CC_CXO_AON_CLK */
+	0x93e8, /* GPU_CC_RSCC_HUB_AON_CLK */
+	0x9004, /* GPU_CC_RSCC_XO_AON_CLK */
+};
+
+static const struct regmap_config gpu_cc_kaanapali_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x95e8,
+	.fast_io = true,
+};
+
+static struct qcom_cc_driver_data gpu_cc_kaanapali_driver_data = {
+	.alpha_plls = gpu_cc_kaanapali_plls,
+	.num_alpha_plls = ARRAY_SIZE(gpu_cc_kaanapali_plls),
+	.clk_cbcrs = gpu_cc_kaanapali_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_kaanapali_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc gpu_cc_kaanapali_desc = {
+	.config = &gpu_cc_kaanapali_regmap_config,
+	.clks = gpu_cc_kaanapali_clocks,
+	.num_clks = ARRAY_SIZE(gpu_cc_kaanapali_clocks),
+	.resets = gpu_cc_kaanapali_resets,
+	.num_resets = ARRAY_SIZE(gpu_cc_kaanapali_resets),
+	.gdscs = gpu_cc_kaanapali_gdscs,
+	.num_gdscs = ARRAY_SIZE(gpu_cc_kaanapali_gdscs),
+	.use_rpm = true,
+	.driver_data = &gpu_cc_kaanapali_driver_data,
+};
+
+static const struct of_device_id gpu_cc_kaanapali_match_table[] = {
+	{ .compatible = "qcom,kaanapali-gpucc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gpu_cc_kaanapali_match_table);
+
+static int gpu_cc_kaanapali_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &gpu_cc_kaanapali_desc);
+}
+
+static struct platform_driver gpu_cc_kaanapali_driver = {
+	.probe = gpu_cc_kaanapali_probe,
+	.driver = {
+		.name = "gpucc-kaanapali",
+		.of_match_table = gpu_cc_kaanapali_match_table,
+	},
+};
+
+module_platform_driver(gpu_cc_kaanapali_driver);
+
+MODULE_DESCRIPTION("QTI GPUCC Kaanapali Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
new file mode 100644
index 0000000000000000000000000000000000000000..c209ce5fe4f003aabefd4421eb4f5662e257912a
--- /dev/null
+++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
@@ -0,0 +1,76 @@
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
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
+
+#include "common.h"
+#include "gdsc.h"
+
+enum {
+	DT_BI_TCXO,
+};
+
+static struct gdsc gx_clkctl_gx_gdsc = {
+	.gdscr = 0x4024,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "gx_clkctl_gx_gdsc",
+		.power_on = gdsc_gx_do_nothing_enable,
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc *gx_clkctl_gdscs[] = {
+	[GX_CLKCTL_GX_GDSC] = &gx_clkctl_gx_gdsc,
+};
+
+static const struct regmap_config gx_clkctl_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x4038,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc gx_clkctl_kaanapali_desc = {
+	.config = &gx_clkctl_regmap_config,
+	.gdscs = gx_clkctl_gdscs,
+	.num_gdscs = ARRAY_SIZE(gx_clkctl_gdscs),
+	.use_rpm = true,
+};
+
+static const struct of_device_id gx_clkctl_kaanapali_match_table[] = {
+	{ .compatible = "qcom,kaanapali-gxclkctl" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gx_clkctl_kaanapali_match_table);
+
+static int gx_clkctl_kaanapali_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &gx_clkctl_kaanapali_desc);
+}
+
+static struct platform_driver gx_clkctl_kaanapali_driver = {
+	.probe = gx_clkctl_kaanapali_probe,
+	.driver = {
+		.name = "gxclkctl-kaanapali",
+		.of_match_table = gx_clkctl_kaanapali_match_table,
+	},
+};
+
+module_platform_driver(gx_clkctl_kaanapali_driver);
+
+MODULE_DESCRIPTION("QTI GXCLKCTL Kaanapali Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


