Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0EFCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 14:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0DMstAAzIVUNxAkb64PoVNpFX/uqMB+3Ui+l/OkLYE=; b=MH32ID16rlWu502IZvQuTc0hMJ
	oUyT1ZOmpvxrc6j2oldUF+wQlhxdqYjEolh4cQ8H1SikaCGgD5SltajW7FyTXww69Byu7BgBe252h
	jhEZf68oR4awSeCJxwyVWW89Zdh9g2PkENNEAe61cQZIC3cXSY4YsQhLO/9Laf26mxAMLfD9v0SqB
	9F2zjuAwiXN0HPKQbFmkl73Pgmdm3NGpl6Xb4OXLk0BuvoLWr+dfoUYggFhW/To3Z1p0qhYXyqNnR
	NTFOPexhtk0QdLcv+CLyXI/43wOmVnIi2gK4rw+8/EdeHjhNBS/xMwUDPp4QOUBqNeNmzRQ+xgizx
	PtIUCZ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAUm-00000002u9v-110x;
	Wed, 13 May 2026 14:23:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAUj-00000002u8r-3f8C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 14:23:31 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8wsnn4159821
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 14:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v0DMstAAzIVUNxAkb64PoVNpFX/uqMB+3Ui+l/OkLYE=; b=YW1nN8JmLbhEhtNu
	zw5HDVTkNvyD1k/yriEQgu4yHWefe18S55v1j0hE29Q8fraxlBVgYRYriMiZfwYx
	aOlPEI/ms5aVWueDYxaSLcxIGEwvRnzyShIoHJOat1CwvlNV5tGMvJXg40YpfAE5
	2NoNvOkWObVa5CenPoRQf/RwkDU/WjYdUlRXZghVd98L9e3AIrypNK9WxVo7W/p3
	HXNSvZ6EOCozGlR34ax0qrjKHFnlIUvIibkNz+hW6bZ020BWZ1564aM/2/ONVMeS
	EAD6yYyzp2xSdsZvqUCe2R5TK3Ej1ESVlIDl4/piTxtUT0ehjY1u3CfJNESPfoKt
	f1kxlw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91s7pn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 14:23:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bc763c7256so96519905ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 07:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682209; x=1779287009; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v0DMstAAzIVUNxAkb64PoVNpFX/uqMB+3Ui+l/OkLYE=;
        b=g6WOJLVrkG5Buk/4DO2tAgz8o0iR9o+DYnFob58Krhupk3XpDgJQpoeQCA9esdCZSZ
         Zmc1IxgaTd78S4xUep0Uzvy/4T+6w/dMnd8rfLRp6C1B+NFqzIjHOs59pdh0eL2L6/rd
         pP+m89OpXR5dE8YYYN/gfFqDv3hldAFM+7tHsSVYDtu7cSFmWkTE4c9AKw682tgSVXTw
         oMFj8h5A3BWDPVkRA6BRdO8VMUupCX1LJPc7dBoOlZwfTA0frJUggll4riLeuxQxrhOO
         cNSpK2ueWlt+vaiCfr/PD1w7ifkcaWkrSbFf0cMezUJZ9OZqDTPBo9whwcKuCL0eurIC
         WSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682209; x=1779287009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v0DMstAAzIVUNxAkb64PoVNpFX/uqMB+3Ui+l/OkLYE=;
        b=Hd3QFvyLlLpVXAwlcTR3P6qgH3GXnqZuocn7QSPSt2jVpdj5+ByxYlqW/OFI7yCERZ
         1gxDpW2542H1K/C2nOc75x0hUXh1isln8YS9e0rLGlGtSyulqWRsekOMXQvt+CIilZUR
         yJAWHtbrLQMHf2S859RTX2r0+QflpvmK2fJO/+WLFbSUXjocbZwdBX5kCvT7Pc+PQxeD
         zX7mrDbdJMZhU1rfi5rCz6sMccoCCCjUZkzn4MVVTT+/KGtGIUvPpVZnmMPXL6DJcc9G
         D+Go3LcaxqpIRHgHbrEq/i3dpcC9cjwihzda/UO8vvv2ZtZF2GmZTCYPbU+YC4PfEAMe
         2BnA==
X-Forwarded-Encrypted: i=1; AFNElJ/FmsExmaZn/kCfNJ08QI+YFdHFLdhiAHZBd7EgyOeg46ox3GH0IQIdJeIiI4+xFU8TbvEDj6CnA6UpLdW7Tjii@lists.infradead.org
X-Gm-Message-State: AOJu0YxXXXcQ7UpAYdwC9xjQm8uUjm62Ot0QPlfdgYqyKw+Ou4D8ABV8
	yoND+Le31k8b+ut0CvCawxyewGFiIsl23xpgeSwqr0JLIPCKTUgidpUZHqG5lnRyAF4RnQQzxi8
	EY+D7scYZpO7fE8KjsWYk1z9JFxNo3H23rrj74RcrXaOCcrlHKozpnges5rbwIiVF+U+hI9V4GH
	ZDrQ==
X-Gm-Gg: Acq92OHX8LxBpu2+oKgRpuGAiNmhxswVpZ9YG7v2ODyGq0fBces+ift9+9Oah4qRtRz
	/HsrRTNbOXAdN5XGX8WTfRd4cS1fY/4TkGV3bM4GDfIvSiTM13PeGKmHORBfj26E9vy6bI8NL+q
	gNDBuLAfzEP0QPkQelRmLBfR3RCfwU3jZvfCmD2LgYDMJVZKBjw93VVgg+aOKBKU054mqwbxd/P
	fZzKIAmGBCpZnpoqeOacRD4ozxVydMFBn8j0bDt80io2u+SJ71W2b3lPORro3Cam6MLnDHxQnQn
	RL5ppdeRrnaZ6dWa6PoH7Y0Dnl/6jMsh+w6PG5/IDB6Y4/kOXqedzX2C6i6s97O9LOQX4zyPTTS
	7zIPN0nKGeRtxnWA3hcgFfLII3jsc7gMDiKAeIodrlsHIVQ==
X-Received: by 2002:a17:903:1a67:b0:2bc:67cc:d1eb with SMTP id d9443c01a7336-2bd27708f97mr39369515ad.28.1778682208451;
        Wed, 13 May 2026 07:23:28 -0700 (PDT)
X-Received: by 2002:a17:903:1a67:b0:2bc:67cc:d1eb with SMTP id d9443c01a7336-2bd27708f97mr39368705ad.28.1778682207795;
        Wed, 13 May 2026 07:23:27 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d40427sm179296105ad.24.2026.05.13.07.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:23:27 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:53:06 +0530
Subject: [PATCH v3 1/7] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza_mm_cc_v2-v3-1-b59c370dc281@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
In-Reply-To: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: aOEnhPuR6F2BZ3WFxB4J_LknDeTmuQww
X-Proofpoint-GUID: aOEnhPuR6F2BZ3WFxB4J_LknDeTmuQww
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a048961 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=YkJq1ijSw-fIvXJVljYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NyBTYWx0ZWRfXwyCFg7pko0IA
 IZJNOwu147eUyyb6xRNopvela6+lcuZh0EcqGEhZZtaorcuV4+zgpNfncs9igPWs/VP3jauvuhn
 O/PjHfN8PD8qQ3KJAARepB8OCXKYVGBWLjw4OBKrt6qFjVpbTduWcuqtDHgsqL38Xy2CkNPqOs0
 8qMzPW4xDyQJAmDkbTo1xy97kiTHYdX7a7M/RwnEn/gm1HSU1hpWcxaBofIB+pJHPH67gcggMfy
 emc2eUm7gQ9YF/8pJdIFx9OpcMRPyPqbPJa4IuWfcuRMv1jx4zgslRAv7qsFaSuPNcEiBzgU9Rf
 qukfO3JHflWv9I/ZzJ9gAB+DVN+znShwfqIRt+yrw1tb+KsbDgTglTQfdgt08BCiKybIQkv2q+K
 u8D02/sEsj3tiu8rlQguWH3NdsWtWHxVmdts08hXwZq9fePMHft3y8hPCo7JIH5xtq2vZUxWM3C
 S3p+0xV2dHx/G0ooPCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_072329_922906_C65068B4 
X-CRM114-Status: GOOD (  18.02  )
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

Eliza Video clock controller is on CX and MX rails similar to Milos.
Add compatible string for Eliza video clock controller to the existing
Milos videocc binding and add the dt-bindings header for Eliza.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,milos-videocc.yaml         |  9 ++++--
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
 2 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 14c31efe1308aadbea61eb7be7e56039a923aec5..6e3e4424af78a93f6366378a66f2944a3bfdccee 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -8,16 +8,21 @@ title: Qualcomm Video Clock & Reset Controller on Milos
 
 maintainers:
   - Luca Weiss <luca.weiss@fairphone.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm video clock control module provides the clocks, resets and power
   domains on Milos.
 
-  See also: include/dt-bindings/clock/qcom,milos-videocc.h
+  See also:
+    include/dt-bindings/clock/qcom,eliza-videocc.h
+    include/dt-bindings/clock/qcom,milos-videocc.h
 
 properties:
   compatible:
-    const: qcom,milos-videocc
+    enum:
+      - qcom,eliza-videocc
+      - qcom,milos-videocc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,eliza-videocc.h b/include/dt-bindings/clock/qcom,eliza-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..1e922250a7fae77f5c996208d50ff372b252aa51
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-videocc.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0C_CLK					6
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				7
+#define VIDEO_CC_MVS0C_SHIFT_CLK				8
+#define VIDEO_CC_PLL0						9
+#define VIDEO_CC_SLEEP_CLK					10
+#define VIDEO_CC_SLEEP_CLK_SRC					11
+#define VIDEO_CC_XO_CLK						12
+#define VIDEO_CC_XO_CLK_SRC					13
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_CLK_ARES					1
+#define VIDEO_CC_MVS0_BCR					2
+#define VIDEO_CC_MVS0C_CLK_ARES					3
+#define VIDEO_CC_MVS0C_BCR					4
+#define VIDEO_CC_XO_CLK_ARES					5
+
+#endif

-- 
2.34.1


