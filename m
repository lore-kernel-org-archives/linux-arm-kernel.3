Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A22F364A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 18:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bu3dKBdAyA/j7qLfZHBYJ2fod42VDSFy9dJneJBN82A=; b=xDzNkSMAYnD2EYiUci7mHpTubJ
	GlSk4zj7fvsjQgyz3cAdCSQeI5ADrSOOZnmFnhOvuMOUo+zkLofETV3PEpvDbbpz2HnuXx3fhXs67
	Jvshz9egxXgU4BAlHOy/tppc8rtfWcL40rMMDpzyJLgvnaUGor6vz2hoo/xQ+W399jJ50HRzyFjdj
	KJQDn8eQhLIfRAwuLf0XDmUjM2S3zxgUPV+ZAvmS9yEoLSErtIBJckaNG+efyA5XX1xzHSAbBVMLD
	TmOaH8QoImuYWBCQeo9KSsgO1saR7zrxMJHCrt6oTWxE9s7VMtWW3Sg9s3dZW/ia180a2tHu/rNYJ
	RMUtPsPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAtqj-0000000B3qF-40rk;
	Thu, 09 Apr 2026 18:11:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAtqh-0000000B3pC-3eQO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 18:11:29 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639CZT0q780153
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Apr 2026 18:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bu3dKBdAyA/j7qLfZHBYJ2fod42VDSFy9dJneJBN82A=; b=CF21KeUgpbLMARuQ
	2Ipa2y0vjs9S3b8Kal7stHaMklM7mBgI6JQvlkpSEbEa/GwzjTZOYvIGZAeuoYxw
	4SGNrBcYF46PygDyqizoXyx2Kyi4o8scRDz5LJemjZmXCjl+wkp216fsvN6CXv42
	Vc6jpUA7/PBVmgGKoUYTmEtgM7DJFobJtDHzUhJHxl9zFxycqhvbSm+EdXRM7x6G
	reKp8ykmdr2U2PgR5VsbWKWcku6RqVSf1G6BSNVxsuJkn7JwD3HX/6HmHQU850S6
	GUk6quc3I6+xX8Jv0ZatUkQCKs//LcVGizTw82hP5kIe9eOI6UqVV9RE7sTBcbna
	2DvU+w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec8hsd6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 18:11:27 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6e24ee93a6so583664a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 11:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775758287; x=1776363087; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bu3dKBdAyA/j7qLfZHBYJ2fod42VDSFy9dJneJBN82A=;
        b=ZGelW3KaZXdDtiuYqmodfCfx4E9BiGkneQHMTb4FnrJKe9VRChR6sGDjDpqt7KX0dn
         n8hGNwtokObtFP7knD2g1AWjjcwJnEiVYTZ3M7UI9IyDpytD2d3qReLAivoQEc62YT8N
         IAkAZEax2Fnz2UO/XegQKPIF8a6fu2Tg2BlV45b9UDrAYMYNYO2Dl+5qWhaqHFabw3Nj
         loJohlUieElAhUP8ri4Q6xYFkzLvv3aHlCjXFwsNWINEDmZpCGwusV9TYtPLDFFr32wu
         VW428tI03/vgW1rGbLsO+XCD1SvfJjm2fFuFXjgJz2XwQNR6cObxPboOLETmCsn2a0FU
         D8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775758287; x=1776363087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bu3dKBdAyA/j7qLfZHBYJ2fod42VDSFy9dJneJBN82A=;
        b=PrWfMeoYRKzaKp6OtvKNHr1CkSOUyXKVIufTkHucxPLpNKUkcIJbvS0o6ioLLce4WU
         D1RUOK11Jf4ttG++R/V8ISKN22XehmypH4k4aZA+/aUdbKiMhaVvUGNcfh/QMJ5qWfaS
         7PYkpfzzfzUgz+KDzHH6eBJCnYeABnzXJJyTtWeGa2NPAPqxmohcpDUz+vRdFX/Sg2A6
         WIsHgy+TjBB0FAjqq54chakYTSaYMLG0yRkz24lgn8SbpVSy6wGhg6CcH3DIP/hqqaVa
         OOTb2G+r0dJsjWj1MsUyfwHpOftQQjtfFrTFhCmrVM0yTq2UQmfbRVccaWYvY+0FNeXu
         R2vg==
X-Forwarded-Encrypted: i=1; AJvYcCWKQj1gMnlnf3BVB+F9H5u6RcyqjjLDuH1vcH1QJjkwbSHjy3awWcrk/hRX9W5l9dGZbUEOllux/YgbM6hpIPHH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2++RsuQEQanZzBJ0VMzfMca3Vt4aKbWd3aB+/vI0WREDAXZYb
	inSEHrVTGzPjfYfF10gclpBF87WoVmhh5K/BIqFJ3rMuG+kWPUJR4fCVOSq6yuRaUKdL2CKVbRd
	EFr0cBi1/1CIeSnxqhhFBWFa9ktzzr4kFytJeuYx43h1xoPUxzV551PELrD3AR8IMtl/EMKabFe
	0xJg==
X-Gm-Gg: AeBDiesQlda3Kdc0VaBpenKxPEfWJpP+rHCvfwHsX/r25TBgwjzfdfYZFzAnHWv+k+I
	0MQEweWL7H1q++YppFOlTUjlpsz2SNCuEaS8DCwBz4psDPoVlhl46JRuRfuR6naehepMW8radK0
	9T5ET+9k1d2oniEMUMDMWYt/QIzjTcOmPG3DTkTMvNJhYyEAQLcUIoWdVAtQSbhqcCfbdvAVspi
	liRmK4O7xCGzTMihlUUVrOvD0h7HUahp4vbkz18pd6i8kHEJ+dyPxTDCfMQjyOH/iEzwgKKLL/8
	vwVegCAAM9Fsv0/h74YBeMV0e/f28ELTDn5LxVHJoQtd5rLFhdXP/F/Kx2y8hc1fwss16+6/+eB
	WTugPiEbzU4OG03bDnTqf/zzCknI3swIwUDjwcQ5fyU+84w==
X-Received: by 2002:a05:6a20:4326:b0:39b:da1e:3fad with SMTP id adf61e73a8af0-39fc9309b47mr4534951637.9.1775758286309;
        Thu, 09 Apr 2026 11:11:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:4326:b0:39b:da1e:3fad with SMTP id adf61e73a8af0-39fc9309b47mr4534903637.9.1775758285514;
        Thu, 09 Apr 2026 11:11:25 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a2d9ebsm66132a12.30.2026.04.09.11.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 11:11:25 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 23:40:45 +0530
Subject: [PATCH v2 4/8] clk: qcom: videocc: Add video clock controller
 driver for Eliza
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-eliza_mm_cc_v2-v2-4-bc0c6dd77bc5@oss.qualcomm.com>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
In-Reply-To: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=PMM/P/qC c=1 sm=1 tr=0 ts=69d7ebcf cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=fDr36jkL0Xr7p1dDRlIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: Gzx241b0WHzKfF4YDe4NpWCavIw4NpAh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2NyBTYWx0ZWRfX62ylemTP91xT
 a/ntVG/V6hR5Jy5Ke85BhliiEqxU3vgcqvWHVkGRpClOyc66hb5pMc6BXkaiYCBg7zKL3sU3X9L
 Ufl1sWDgTmmBQoqXJGokSqZTdqbHWF52OGjkQvwqjiBEknESuIHeJAWT7WLbuWo4v/s8Ka9amQ9
 7G563mA0rwzIvFx+7PPFNH2oy6H8HOy1tzIo7tKL8gERcX/YdHavr9tDooTTFBI0Va9Ha6tZXCi
 ri1ArgD/7B8nCfXZCUczsqS1dyrAbtzBPiIBImJVqnjawGLUoKLh0uFbvo5ZuU2P592Acjpj3A3
 ba6Eku2qu2f/XM3MAZFWJEDN//HN9dhMaQixxJJ1LwQc77UK9DD/rnkoK8BzrttYx3PZwRUhWTM
 VvT/FatpO8sMXcJJngybwnvJfKo2EQSiPpHMua6xFqtFqBYCOA7p2yYoWZgUgCzT0MN6RP0YLin
 AUZidZGKRjI6i4e2zEg==
X-Proofpoint-GUID: Gzx241b0WHzKfF4YDe4NpWCavIw4NpAh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_111127_928962_DD64042E 
X-CRM114-Status: GOOD (  19.12  )
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

Add support for the video clock controller for video clients to be able
to request for videocc clocks on Eliza platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig         |   9 +
 drivers/clk/qcom/Makefile        |   1 +
 drivers/clk/qcom/videocc-eliza.c | 403 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 413 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 22eb80be60ad3bde897f2c507ac9897951fbb8fe..4b0d40a38a6328fe9c41ebb15ae6821012223920 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -45,6 +45,15 @@ config CLK_ELIZA_TCSRCC
 	  Support for the TCSR clock controller on Eliza devices.
 	  Say Y if you want to use peripheral devices such as USB/PCIe/UFS.
 
+config CLK_ELIZA_VIDEOCC
+	tristate "Eliza Video Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_GLYMUR_GCC
+	help
+	  Support for the video clock controller on Eliza devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode and decode.
+
 config CLK_GLYMUR_DISPCC
 	tristate "Glymur Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index b818fd5af8bfb85a51ee90fdc3baa93af30dc39a..e7e239c5a0d088b2e78354bf421d871a4e4e6d9d 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
 obj-$(CONFIG_CLK_ELIZA_DISPCC) += dispcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_GCC) += gcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
+obj-$(CONFIG_CLK_ELIZA_VIDEOCC) += videocc-eliza.o
 obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
 obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
diff --git a/drivers/clk/qcom/videocc-eliza.c b/drivers/clk/qcom/videocc-eliza.c
new file mode 100644
index 0000000000000000000000000000000000000000..cb541cfec50c12761251a822e32094e763922cdb
--- /dev/null
+++ b/drivers/clk/qcom/videocc-eliza.c
@@ -0,0 +1,403 @@
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
+#include <dt-bindings/clock/qcom,eliza-videocc.h>
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
+	DT_SLEEP_CLK,
+	DT_AHB_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_SLEEP_CLK,
+	P_VIDEO_CC_PLL0_OUT_MAIN,
+};
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+/* 576.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll0_config = {
+	.l = 0x1e,
+	.alpha = 0x0,
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
+static struct clk_alpha_pll video_cc_pll0 = {
+	.offset = 0x0,
+	.config = &video_cc_pll0_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
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
+	{ P_VIDEO_CC_PLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll0.clkr.hw },
+};
+
+static const struct parent_map video_cc_parent_map_2[] = {
+	{ P_SLEEP_CLK, 0 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_2[] = {
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct freq_tbl ftbl_video_cc_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_ahb_clk_src = {
+	.cmd_rcgr = 0x8018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_ahb_clk_src,
+	.hw_clk_ctrl = true,
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
+	F(576000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(633000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(720000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1014000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1098000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1113000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1332000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1600000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0_clk_src = {
+	.cmd_rcgr = 0x8000,
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
+static const struct freq_tbl ftbl_video_cc_sleep_clk_src[] = {
+	F(32000, P_SLEEP_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_sleep_clk_src = {
+	.cmd_rcgr = 0x8110,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_2,
+	.freq_tbl = ftbl_video_cc_sleep_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_sleep_clk_src",
+		.parent_data = video_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 video_cc_xo_clk_src = {
+	.cmd_rcgr = 0x80f4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_ahb_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_xo_clk_src",
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs0_div_clk_src = {
+	.reg = 0x80ac,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs0c_div2_div_clk_src = {
+	.reg = 0x8058,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0c_div2_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch video_cc_mvs0_clk = {
+	.halt_reg = 0x80a0,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80a0,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80a0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_shift_clk = {
+	.halt_reg = 0x8144,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8144,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8144,
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
+static struct clk_branch video_cc_mvs0c_clk = {
+	.halt_reg = 0x804c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x804c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0c_div2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_shift_clk = {
+	.halt_reg = 0x8148,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8148,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8148,
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
+static struct gdsc video_cc_mvs0c_gdsc = {
+	.gdscr = 0x8034,
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
+	.gdscr = 0x808c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &video_cc_mvs0c_gdsc.pd,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | HW_CTRL_TRIGGER,
+};
+
+static struct clk_regmap *video_cc_eliza_clocks[] = {
+	[VIDEO_CC_AHB_CLK_SRC] = &video_cc_ahb_clk_src.clkr,
+	[VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
+	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
+	[VIDEO_CC_MVS0_DIV_CLK_SRC] = &video_cc_mvs0_div_clk_src.clkr,
+	[VIDEO_CC_MVS0_SHIFT_CLK] = &video_cc_mvs0_shift_clk.clkr,
+	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
+	[VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC] = &video_cc_mvs0c_div2_div_clk_src.clkr,
+	[VIDEO_CC_MVS0C_SHIFT_CLK] = &video_cc_mvs0c_shift_clk.clkr,
+	[VIDEO_CC_PLL0] = &video_cc_pll0.clkr,
+	[VIDEO_CC_SLEEP_CLK_SRC] = &video_cc_sleep_clk_src.clkr,
+	[VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr,
+};
+
+static struct gdsc *video_cc_eliza_gdscs[] = {
+	[VIDEO_CC_MVS0_GDSC] = &video_cc_mvs0_gdsc,
+	[VIDEO_CC_MVS0C_GDSC] = &video_cc_mvs0c_gdsc,
+};
+
+static const struct qcom_reset_map video_cc_eliza_resets[] = {
+	[VIDEO_CC_INTERFACE_BCR] = { 0x80d8 },
+	[VIDEO_CC_MVS0_CLK_ARES] = { 0x80a0, 2 },
+	[VIDEO_CC_MVS0_BCR] = { 0x8088 },
+	[VIDEO_CC_MVS0C_CLK_ARES] = { 0x804c, 2 },
+	[VIDEO_CC_MVS0C_BCR] = { 0x8030 },
+	[VIDEO_CC_XO_CLK_ARES] = { 0x810c, 2 },
+};
+
+static struct clk_alpha_pll *video_cc_eliza_plls[] = {
+	&video_cc_pll0,
+};
+
+static u32 video_cc_eliza_critical_cbcrs[] = {
+	0x80dc, /* VIDEO_CC_AHB_CLK */
+	0x8128, /* VIDEO_CC_SLEEP_CLK */
+	0x810c, /* VIDEO_CC_XO_CLK */
+};
+
+static const struct regmap_config video_cc_eliza_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9f50,
+	.fast_io = true,
+};
+
+static struct qcom_cc_driver_data video_cc_eliza_driver_data = {
+	.alpha_plls = video_cc_eliza_plls,
+	.num_alpha_plls = ARRAY_SIZE(video_cc_eliza_plls),
+	.clk_cbcrs = video_cc_eliza_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_eliza_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc video_cc_eliza_desc = {
+	.config = &video_cc_eliza_regmap_config,
+	.clks = video_cc_eliza_clocks,
+	.num_clks = ARRAY_SIZE(video_cc_eliza_clocks),
+	.resets = video_cc_eliza_resets,
+	.num_resets = ARRAY_SIZE(video_cc_eliza_resets),
+	.gdscs = video_cc_eliza_gdscs,
+	.num_gdscs = ARRAY_SIZE(video_cc_eliza_gdscs),
+	.driver_data = &video_cc_eliza_driver_data,
+};
+
+static const struct of_device_id video_cc_eliza_match_table[] = {
+	{ .compatible = "qcom,eliza-videocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, video_cc_eliza_match_table);
+
+static int video_cc_eliza_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &video_cc_eliza_desc);
+}
+
+static struct platform_driver video_cc_eliza_driver = {
+	.probe = video_cc_eliza_probe,
+	.driver = {
+		.name = "videocc-eliza",
+		.of_match_table = video_cc_eliza_match_table,
+	},
+};
+
+module_platform_driver(video_cc_eliza_driver);
+
+MODULE_DESCRIPTION("QTI VIDEOCC Eliza Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


