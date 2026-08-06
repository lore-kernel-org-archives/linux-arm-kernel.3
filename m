Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD9EC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 10:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+26XuUP3Fydp9wXPGBKweo3zecrROBeJ8poLkSSC/g=; b=0rhJz4nc2wwuZ1/KNU7YyqJPuL
	wyF8Ly76+hRvNETlENDUq1Q61MCRDPRo5O1VKRDujMIkpn/cMoEYN6UwPc/GiXboMwGJ9amUf/YHM
	5UVwfIgqPeMbzthJxfM/RM/ia8HU7TuGwHmd6m1qumljt7szXAhAsjY1GAmPGku74RPNU+DDDaZFl
	xtzv3NW0C6g6MDSwDmFdHTKFSeCWGvvsL62UTMP3DBNWST+9IRaSwpFC54hHGbNggGkXFrF461E97
	xebRJwPYXiKg7NTuA46AOap1uv/rNb7sA00vvFUJBCBA3ESpET6IIVCtKKMEu6KgovE5PuDZ2yREL
	gQ179wXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvRe-00000005Yz9-3NLe;
	Thu, 06 Aug 2026 10:35:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvRa-00000005Yva-3y2r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 10:35:24 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769negl865580
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Aug 2026 10:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s+26XuUP3Fydp9wXPGBKweo3zecrROBeJ8poLkSSC/g=; b=j3g7I6b6n9E/rGWb
	TdLIr0y0DQednZxALodHye9gfW5qh+m/oOABMeMxUfZXcRRcQJS/V/zPHuzEsfT5
	X7OWau+A4N6pxH2VHqxsahU0zn1tHv6FBgFOVAiErNs9C4nr8Bxd8Onpjr0/OvTm
	B9FjsPEyLOo/zktfrgCA+aIFT1NUO4CI+H1h1a9xQB7+jv3KWugshZj60uiLEUn8
	TYGkubOvAtAegIOs7lVS9IhJqE7VGtz4+lKD7Tkwyx/hy817C3gcPUMSnCt2bq/w
	lYzfpIwAQ66DqM0J8WFs1p1k51CemjDGXbIAIxw0mVza2XNA2D2O51kNb1hwdowo
	JNFgSg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9f5bq83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 10:35:22 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84c4cd31b51so1086000b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 03:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786012522; x=1786617322; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s+26XuUP3Fydp9wXPGBKweo3zecrROBeJ8poLkSSC/g=;
        b=dEMrMVes2iZeVJzDvG7Kybxk/3EP5HSMPyELWkXagq0sZNFu9vL3YJGtgISmOQ9JA4
         mN5yw/oMOaVSq9hAeovzhnaqHdqFs6zjIEogBWm+p6Qx23q2u0YIgClWBXJyfwkggkr+
         jKKZqQMtMm1BtUWT0ic33S6lMv0CXUJ/BvdhpJh3tGl8KRhB/wP9WQiBLmHel+lUTYEv
         HEWQSaFNNJHpX0THbfWtMH7hX5Qxc8kYPPMhw8k6vtZ0bVzAdW1+Y/H0/zAjemaaLUvL
         F3lDe9SotTju1BvtZ1UUEhLwPPttptjQGqeJM+WUJB2YtwMPdsJk+tQwbmeGpiZxXF/L
         TDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786012522; x=1786617322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s+26XuUP3Fydp9wXPGBKweo3zecrROBeJ8poLkSSC/g=;
        b=aqqGdmDF/DUxU5gWV1psVN7diJNcWcvbeC20iKP+hgEa1ZX7+D4P5vO9OcNkj/n3NJ
         13giGmWTcB8+OHYyeEImtEh24baj73u9bfeNuk7W3Ytb4SzDR1zHwX15LznKLlGtj/5G
         1tmQyTUCdf1DQcKVy8neHLEGdo6gXkYNENYs/TsBZMUqR+ZYG2XTr//JaqfUrmU+yC15
         n8InciCuz7Ak3oiyM/aP0d5OG/Fkh/pxRtaOYfK7Ga1curbwNrTYWF7g9RF0Fa1yZpwn
         9FSJsc5NYRQr5GRBFPniWamAOuf77eRGvIhrNYM6dkaKvqEswqGQNUVXMqt77/eOlXWJ
         Fj5Q==
X-Forwarded-Encrypted: i=1; AHgh+RpyQK33hPyoPFPfTXb6C4jWzt4I266SvmlZTGYIR5wYU5VHSo06ztbtpWUCeS+3KKDOgDcw/6ZqrDv21F+7OSpo@lists.infradead.org
X-Gm-Message-State: AOJu0YygyAdxztbCXRBI8NlbDgwNa+K1Kn1yzCDqWl39M9wpC2xIA66f
	ru9M2Tcj0yrtWA6XN5Pul6p9OH8kwPf/0yv32eyUYPl7QZ5oMutWdQa8LRxWnPvYGJDdV2k/xDn
	w3aYmZaA13Ex6E/cwjVbLs6Uyx01CRyqQhcdvDKT1yHsR126SU5ngt/aSwsvu4TE1ZLoYJlbYlz
	26LA==
X-Gm-Gg: AR+sD11exITk7Uv+2wMEDbAJ1ZeqCLNqb9WnWZFOk8JdYm37E+sbHdcj1afAXnp2iDo
	/z8/VuNfHSBrmBLVwUMAwZk9yOKaFCmcKIntQ4npxEOoGfQhEJzN6bjLoZ+U0J1L59UMfTI8VWa
	Eto2PRX6bv7K/9COnuAf8AjfUDFjbaBM8pBEk88kSWtAljNap/4VoX9PqtqiaNy81n/KJnA5fXg
	dIRhMkffemMKQWyVtkeh+3tF0hZLNyxtxBxgNkUuzIxpcqYeIpGqCogLoHob8thwUUX8MgObv+l
	uOzNJtDDnCyAQ2iKUYfPhKnOHMKUW6P+HS75Mr2XvyDMTB6UGOQiJ/E3PI2f5qL4w7ZAD4Bvfl+
	dzaDHhHEaF0G95/+8Ir5+MI16
X-Received: by 2002:a05:6a00:1c82:b0:84e:242:4bb2 with SMTP id d2e1a72fcca58-84f47d119f4mr3855863b3a.4.1786012521410;
        Thu, 06 Aug 2026 03:35:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c82:b0:84e:242:4bb2 with SMTP id d2e1a72fcca58-84f47d119f4mr3855748b3a.4.1786012520793;
        Thu, 06 Aug 2026 03:35:20 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45389e5bsm1141098b3a.1.2026.08.06.03.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:35:20 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:04:13 +0530
Subject: [PATCH v10 08/10] clk: qcom: gpucc: Add GPU Clock Controller
 driver for Eliza
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-eliza-mm-cc-v9-v10-8-6ba52dd14343@oss.qualcomm.com>
References: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
In-Reply-To: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: bqrgjVKAHSbod_kWxQ6d4tSD8zzWZVVL
X-Proofpoint-ORIG-GUID: bqrgjVKAHSbod_kWxQ6d4tSD8zzWZVVL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfX5rXuGVwBMD/C
 55LdbBYFph2Kq+lac8qGFlaTO9OQypOLpdXAhWrETOY9X+FCjuPYqXG+uQ/12wUyS8wPFxcaHnZ
 k57xk0l0z2u5NhV5J24lT1fzMquNFCg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfX72FlHUITEe0/
 5Hrv+dzI2Jh5qtJgBrvu8Sdde/o+UklcrBjeqZeUG5awrKA3Kv3i7opwgfOLkRp5uoICpdVInT7
 evmF+IqiHt7r8aR/BkC8mRYBSItkzKs19UfyRatFJtpKDwXbtTC1W/OZvfsJPezt3723HeGYKc3
 qPf5JoHbPkR/jGajz5AiA6iWyKmh/K0HPB9MXSljfibtp/YSDKqq5W5etkD7XQUZE64mwHJxmb/
 twWSjA6D1l9FI/vg26/rS5pMyr4e+8AV/y9mgFFWieaXy+g0kXAcBjz7Vc87AegFyXAHdzL9eHT
 mpP7m9f6sBYAPjw7+V2ILYnnnJXHGw/IgrqYqtkvwtGAT4nknajr9k8P2y6urz3Kq3sigm4E8KT
 1CeO8b2cX59QxlI3axAVQByxIoAATwiP/NkgyUgfYlU1Qz1NZlPR5qhd9JqBHFhIb12rFbiAv3e
 jNuyk8HFyjQeFRxACRw==
X-Authority-Analysis: v=2.4 cv=d4bFDxjE c=1 sm=1 tr=0 ts=6a74636a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=-vWcHKkLGHRqTAwGlSsA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_033523_004746_B09CCEDC 
X-CRM114-Status: GOOD (  19.00  )
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

Add Graphics Clock Controller (GPUCC) support for Eliza platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig       |  10 +
 drivers/clk/qcom/Makefile      |   1 +
 drivers/clk/qcom/gpucc-eliza.c | 606 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 617 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 638912172e1ed0d4174ca2fdeaca3ce6741d0723..c182668b38d0d7be4c5d04fd05e19d8728340ae5 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -39,6 +39,16 @@ config CLK_ELIZA_GCC
 	  Say Y if you want to use peripheral devices such as UART, SPI,
 	  I2C, USB, UFS, SDCC, etc.
 
+config CLK_ELIZA_GPUCC
+	tristate "Eliza Graphics Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_ELIZA_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the graphics clock controller on Eliza devices.
+	  Say Y if you want to support graphics controller devices and
+	  functionality such as 3D graphics.
+
 config CLK_ELIZA_TCSRCC
 	tristate "Eliza TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index b394d9218989a5a38a3ef6703519a3413d8efb81..1f22cdce829f1a3d760f93d8d6aa1cf75c39f36c 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_APQ_GCC_8084) += gcc-apq8084.o
 obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
 obj-$(CONFIG_CLK_ELIZA_DISPCC) += dispcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_GCC) += gcc-eliza.o
+obj-$(CONFIG_CLK_ELIZA_GPUCC) += gpucc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_VIDEOCC) += videocc-eliza.o
 obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
diff --git a/drivers/clk/qcom/gpucc-eliza.c b/drivers/clk/qcom/gpucc-eliza.c
new file mode 100644
index 0000000000000000000000000000000000000000..57a28502f3257690ac93c16e1dcb057b01db6c03
--- /dev/null
+++ b/drivers/clk/qcom/gpucc-eliza.c
@@ -0,0 +1,606 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,eliza-gpucc.h>
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
+	P_BI_TCXO_AO,
+	P_GPLL0_OUT_MAIN,
+	P_GPLL0_OUT_MAIN_DIV,
+	P_GPU_CC_PLL0_OUT_MAIN,
+	P_GPU_CC_PLL1_OUT_MAIN,
+};
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+/* 518.0 MHz Configuration */
+static const struct alpha_pll_config gpu_cc_pll0_config = {
+	.l = 0x1a,
+	.alpha = 0xfaaa,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000005,
+};
+
+static struct clk_alpha_pll gpu_cc_pll0 = {
+	.offset = 0x0,
+	.config = &gpu_cc_pll0_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+/* 440.0 MHz Configuration */
+static const struct alpha_pll_config gpu_cc_pll1_config = {
+	.l = 0x16,
+	.alpha = 0xeaaa,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000005,
+};
+
+static struct clk_alpha_pll gpu_cc_pll1 = {
+	.offset = 0x1000,
+	.config = &gpu_cc_pll1_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct parent_map gpu_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct parent_map gpu_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_CC_PLL0_OUT_MAIN, 1 },
+	{ P_GPU_CC_PLL1_OUT_MAIN, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .hw = &gpu_cc_pll1.clkr.hw },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct parent_map gpu_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_CC_PLL1_OUT_MAIN, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpu_cc_pll1.clkr.hw },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct parent_map gpu_cc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_3[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct freq_tbl ftbl_gpu_cc_ff_clk_src[] = {
+	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_ff_clk_src = {
+	.cmd_rcgr = 0x94b8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_0,
+	.freq_tbl = ftbl_gpu_cc_ff_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_ff_clk_src",
+		.parent_data = gpu_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
+	F(220000000, P_GPU_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(550000000, P_GPU_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_gmu_clk_src = {
+	.cmd_rcgr = 0x935c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_1,
+	.freq_tbl = ftbl_gpu_cc_gmu_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_gmu_clk_src",
+		.parent_data = gpu_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 gpu_cc_hub_clk_src = {
+	.cmd_rcgr = 0x9430,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_2,
+	.freq_tbl = ftbl_gpu_cc_ff_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_hub_clk_src",
+		.parent_data = gpu_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gpu_cc_xo_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_xo_clk_src = {
+	.cmd_rcgr = 0x9010,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_3,
+	.freq_tbl = ftbl_gpu_cc_xo_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_xo_clk_src",
+		.parent_data = gpu_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_3),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div gpu_cc_xo_div_clk_src = {
+	.reg = 0x9050,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_xo_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpu_cc_xo_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch gpu_cc_ahb_clk = {
+	.halt_reg = 0x914c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x914c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_crc_ahb_clk = {
+	.halt_reg = 0x9150,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9150,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_crc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_accu_shift_clk = {
+	.halt_reg = 0x9480,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9480,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_accu_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_ff_clk = {
+	.halt_reg = 0x9184,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9184,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_ff_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_ff_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_gmu_clk = {
+	.halt_reg = 0x916c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x916c,
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
+	.halt_reg = 0x917c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x917c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cxo_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_freq_measure_clk = {
+	.halt_reg = 0x9008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_freq_measure_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_xo_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
+	.halt_reg = 0x7000,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x7000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_hlos1_vote_gpu_smmu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_hub_aon_clk = {
+	.halt_reg = 0x942c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x942c,
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
+	.halt_reg = 0x9180,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9180,
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
+	.halt_reg = 0x9188,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9188,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_memnoc_gfx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_mnd1x_0_gfx3d_clk = {
+	.halt_reg = 0x92cc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x92cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_mnd1x_0_gfx3d_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_mnd1x_1_gfx3d_clk = {
+	.halt_reg = 0x92d0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x92d0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_mnd1x_1_gfx3d_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_sleep_clk = {
+	.halt_reg = 0x9164,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9164,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc gpu_cc_cx_gdsc = {
+	.gdscr = 0x9110,
+	.gds_hw_ctrl = 0x9124,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x8,
+	.pd = {
+		.name = "gpu_cc_cx_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc gpu_cc_gx_gdsc = {
+	.gdscr = 0x905c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "gpu_cc_gx_gdsc",
+		.power_on = gdsc_gx_do_nothing_enable,
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *gpu_cc_eliza_clocks[] = {
+	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
+	[GPU_CC_CRC_AHB_CLK] = &gpu_cc_crc_ahb_clk.clkr,
+	[GPU_CC_CX_ACCU_SHIFT_CLK] = &gpu_cc_cx_accu_shift_clk.clkr,
+	[GPU_CC_CX_FF_CLK] = &gpu_cc_cx_ff_clk.clkr,
+	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
+	[GPU_CC_CXO_CLK] = &gpu_cc_cxo_clk.clkr,
+	[GPU_CC_FF_CLK_SRC] = &gpu_cc_ff_clk_src.clkr,
+	[GPU_CC_FREQ_MEASURE_CLK] = &gpu_cc_freq_measure_clk.clkr,
+	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
+	[GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK] = &gpu_cc_hlos1_vote_gpu_smmu_clk.clkr,
+	[GPU_CC_HUB_AON_CLK] = &gpu_cc_hub_aon_clk.clkr,
+	[GPU_CC_HUB_CLK_SRC] = &gpu_cc_hub_clk_src.clkr,
+	[GPU_CC_HUB_CX_INT_CLK] = &gpu_cc_hub_cx_int_clk.clkr,
+	[GPU_CC_MEMNOC_GFX_CLK] = &gpu_cc_memnoc_gfx_clk.clkr,
+	[GPU_CC_MND1X_0_GFX3D_CLK] = &gpu_cc_mnd1x_0_gfx3d_clk.clkr,
+	[GPU_CC_MND1X_1_GFX3D_CLK] = &gpu_cc_mnd1x_1_gfx3d_clk.clkr,
+	[GPU_CC_PLL0] = &gpu_cc_pll0.clkr,
+	[GPU_CC_PLL1] = &gpu_cc_pll1.clkr,
+	[GPU_CC_SLEEP_CLK] = &gpu_cc_sleep_clk.clkr,
+	[GPU_CC_XO_CLK_SRC] = &gpu_cc_xo_clk_src.clkr,
+	[GPU_CC_XO_DIV_CLK_SRC] = &gpu_cc_xo_div_clk_src.clkr,
+};
+
+static struct gdsc *gpu_cc_eliza_gdscs[] = {
+	[GPU_CC_CX_GDSC] = &gpu_cc_cx_gdsc,
+	[GPU_CC_GX_GDSC] = &gpu_cc_gx_gdsc,
+};
+
+static const struct qcom_reset_map gpu_cc_eliza_resets[] = {
+	[GPU_CC_ACD_BCR] = { 0x939c },
+	[GPU_CC_CB_BCR] = { 0x93e4 },
+	[GPU_CC_CX_BCR] = { 0x910c },
+	[GPU_CC_FAST_HUB_BCR] = { 0x9428 },
+	[GPU_CC_FF_BCR] = { 0x94b4 },
+	[GPU_CC_GFX3D_AON_BCR] = { 0x91dc },
+	[GPU_CC_GMU_BCR] = { 0x9358 },
+	[GPU_CC_GX_BCR] = { 0x9058 },
+	[GPU_CC_RBCPR_BCR] = { 0x9224 },
+	[GPU_CC_XO_BCR] = { 0x9000 },
+};
+
+static struct clk_alpha_pll *gpu_cc_eliza_plls[] = {
+	&gpu_cc_pll0,
+	&gpu_cc_pll1,
+};
+
+static const u32 gpu_cc_eliza_critical_cbcrs[] = {
+	0x9004, /* GPU_CC_CXO_AON_CLK */
+	0x900c, /* GPU_CC_DEMET_CLK */
+};
+
+static const struct regmap_config gpu_cc_eliza_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9988,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_driver_data gpu_cc_eliza_driver_data = {
+	.alpha_plls = gpu_cc_eliza_plls,
+	.num_alpha_plls = ARRAY_SIZE(gpu_cc_eliza_plls),
+	.clk_cbcrs = gpu_cc_eliza_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_eliza_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc gpu_cc_eliza_desc = {
+	.config = &gpu_cc_eliza_regmap_config,
+	.clks = gpu_cc_eliza_clocks,
+	.num_clks = ARRAY_SIZE(gpu_cc_eliza_clocks),
+	.resets = gpu_cc_eliza_resets,
+	.num_resets = ARRAY_SIZE(gpu_cc_eliza_resets),
+	.gdscs = gpu_cc_eliza_gdscs,
+	.num_gdscs = ARRAY_SIZE(gpu_cc_eliza_gdscs),
+	.use_rpm = true,
+	.driver_data = &gpu_cc_eliza_driver_data,
+};
+
+static const struct of_device_id gpu_cc_eliza_match_table[] = {
+	{ .compatible = "qcom,eliza-gpucc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gpu_cc_eliza_match_table);
+
+static int gpu_cc_eliza_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &gpu_cc_eliza_desc);
+}
+
+static struct platform_driver gpu_cc_eliza_driver = {
+	.probe = gpu_cc_eliza_probe,
+	.driver = {
+		.name = "gpucc-eliza",
+		.of_match_table = gpu_cc_eliza_match_table,
+	},
+};
+
+module_platform_driver(gpu_cc_eliza_driver);
+
+MODULE_DESCRIPTION("QTI GPUCC Eliza Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


