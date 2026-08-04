Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0662EC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 17:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VSDEP9DFxsC2WGKb9Mm8ttM1p92PZNbAVOez4KimUXs=; b=m/ktg54mKzfetRpBDIqnmW0Upf
	aSxD/GbjtZbtIXrxIGm2qDRN4HvZBJel6P6qVx4sPfIFkGMvIdBnCND00COhH3x0ukexl2fwv5mDR
	HDa+wnr3tJplTstbjRjdkAFnJm3SNAtHhEKUojCON7YQxyYXSnjWelx95DVXsB9zk1KjrlGEC9ps0
	nIUTH9SYKeUoXtHObRbhJQNap5411s1u4TH8y6h6gPKz0Vo8VxHrz5d3ABmcpaIfrJW0ZDPmS9WwE
	BL/KQeo7dAT1+FO5tzOgn4H+acaAFfoGKA5RdjfNz1UtucK8ya6pDWDFBCs4gQCoRd8JDpmyXzDJP
	iKfwBnvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJII-00000002XTS-2vWV;
	Tue, 04 Aug 2026 17:51:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJIH-00000002XRM-0L6V
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Aug 2026 17:51:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=VSDEP9DFxsC2WGKb9Mm8ttM1p92PZNbAVOez4KimUXs=; b=peZvYfASYK8WIUjgjyRRe9XCMq
	44Ss+hKIvffRv+EyW0H4hHUbi+0lA8xSdkT1a7YcGhOq30Q9ygKrr60YF3J1OM4CT85i1dfBQ+17F
	3uvumhstfY5Ov4yvTNnruHBI4zKeG9InYg+0odcDwCuXH3Qs8JQ1e+aWeai2MtT8Bw912kmc+4C4U
	5QONQezA8mipS4gG/lMM66J99bt9DhmvmvoIfljM6gd4ZrsRftY/R4Uwt+zHUEJDvmaqj3CROSo6K
	oY+3w+EfaaUqOGMYkr0jNaSbqTR9qVqZHtB6JD6t+JMmz4ME0kqP6KGIrbK/fW0uDphph5ukEYcHq
	UJp6B8kQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrJIE-0000000A8fF-0cD6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 17:51:11 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674FfT3M070753
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Aug 2026 17:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VSDEP9DFxsC2WGKb9Mm8ttM1p92PZNbAVOez4KimUXs=; b=GInJQocPDqFnfqzj
	cLx07Q+ofcw2HykRMzzvJtbPNG7/V/bUvRKQfPxmxJFKX9RTVb4NnUAV4EVUnBXW
	BNQwTHnleAYDS/45m3DsHrFx41I7lr/O+8koUCE6WrjD/ii7nqjgJ0gbz97ECC14
	ucWWYjOS8lyVTBIrxRbvLjRRlvbZ6w0FtFBvWV8M5PqBYN6r+7aV2uAeQUIsHreb
	8Ih3XPr/fHJgtv5t33M0mYMkBPmUMdgOIH9qvzV8qBgBt2wOhPHXz1twS5j7ZXLE
	xBRvW7QeIKKStr+z2Jmnewbn1vNwFalu4ABCie44JDTyXm9PRfzvQneMUJCgRlIJ
	xaVanA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fujwsgnpp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 17:51:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca124bf0189so1002237a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 10:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785865868; x=1786470668; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSDEP9DFxsC2WGKb9Mm8ttM1p92PZNbAVOez4KimUXs=;
        b=Pqv3p/OVkR+U/Idoe0Svje2N6w2neKA4Hyg5PEIA/nlAvS4aBkXfCuuKVKzWHYsCix
         Np5KcDxtN7eE2o9BXupZZWfxKK3pVS505xTca9HwtrgRgMob/c/lpUo7La+8hkt+FCHq
         BQbMLNI8elv+giHey8f7Dy5MoWPV9XnwMH5MUFpikmQVHh6xDzoNbO8sjf+oyMhYEzfP
         OBLCpucMt9vil+OiAVoFGanvLe4ykjAmZPCgsq2h4u9bT4QZdkFYdO8CZaZ8/n8qH+Tm
         gtijyf/3ES7PQ6F8guW4kRtt5NfpLNh7O3QG8xKUTJ9TIPCqH96/iqyek0vOjymyhCSL
         tfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865868; x=1786470668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSDEP9DFxsC2WGKb9Mm8ttM1p92PZNbAVOez4KimUXs=;
        b=OyPNftUQ/Xy/oGJXacPgos3gKJofr93STgyRp/Enxn1x8OhX1n+788OsIi31CTib8+
         M6ko9MvWbzUQ4BmU54C33mtnSONHFZPGs4DNmG2GsiL/Upedxx1wFa8P4ES5U8trohyy
         a07etSD5WjjngwefagpYl4VMIzDcjDb/QxhZgUjiKrf4TK5x13q6AwcyVGvJrzqTF15g
         jccX7LQQja7MWFBuhWG098CtKY03EK61OQAJiGJSEtsF+OxP/AVejrXhezs6Nq50rTts
         2urfr9a4CFbfJwi2Z3nTpMt7w78+ZCF4P34u21nghHw9v8jnVcHHI39Q8Ut7Z5NhxkUY
         YTaw==
X-Forwarded-Encrypted: i=1; AHgh+Rrej854FAIBFRpdbzlAbfnRCzsSNplBjur3mcT++DdT/2HUn9PN9oVwTZDWwWEf1r0ThhNfz3FbOmxkZLeQmHUF@lists.infradead.org
X-Gm-Message-State: AOJu0YxnAqpnY/iQOk61qHb77D2rGm8+mm+f2yRZYIHGNdTeXPtQdLjz
	q8JSjfBLs5jicBLgk9jLJFeagP94parGqwB0JBrURWl5NQCLdEuoqH2u2F/EikcbAUyK3z8iMr4
	QxbXEnryMaQZb9u8iBk2kbTFiG6kEigmU/idXaFSttgUMASa33Gd6wFvrUqi814gu7T/joZfOLZ
	cu6q+lRjwMbg==
X-Gm-Gg: AR+sD11b+cuAIltqzFJbnY6PWVJtN73w9ei5cQPFQZMXa4CupyyZWVjG6K2g18PhJJU
	2qYiIW9EJJpn7m9TKFK00xCkkz2ZWRMoy+gu4dXDdo7TVmTv+GYQ25mahFpQ+QkM2pZP3mtcK5Z
	ayhADaA4AuimxUUBngz9HG4bq7nYMkmYizZ2PCHL1NQFRa6Y4D6wVHPfWsDPwbJgeXlXZ8XlJg6
	N919i5zFRASc9GS32k8uMdc9/KE+4rGOynLiE6FfETmPbT8tPtE9ofInmE7e+630e2qiZlcOC5B
	iU4l0LzCqE2wmGIUTPikL7tqLVjVGa8k+IsepXES1FWbC3xxdQv9eVZGAVUCcL3Ct8mgvOEC8Xc
	uOe2VK8QnOyKKRuEO6vszDEvH
X-Received: by 2002:a05:6a20:a10b:b0:3c3:b57b:645a with SMTP id adf61e73a8af0-3cb85a5cbdemr749906637.21.1785865867660;
        Tue, 04 Aug 2026 10:51:07 -0700 (PDT)
X-Received: by 2002:a05:6a20:a10b:b0:3c3:b57b:645a with SMTP id adf61e73a8af0-3cb85a5cbdemr749862637.21.1785865867214;
        Tue, 04 Aug 2026 10:51:07 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm7052108eec.24.2026.08.04.10.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:51:06 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 23:20:18 +0530
Subject: [PATCH v9 05/10] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-eliza-mm-cc-v9-v9-5-39067760dc3c@oss.qualcomm.com>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
In-Reply-To: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: W9LGoi3OCPDEiE93Klgu4RrtGmmEtiex
X-Proofpoint-ORIG-GUID: W9LGoi3OCPDEiE93Klgu4RrtGmmEtiex
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX+Yo9wx7CO1YD
 EiGvbbuDXTJatGQSmDpCVb+wIWa1bsweoJ/22Cpb4Xlpdjm0O10pjVVrFF21TKh5+PbOCtNdFAe
 9s9aO8ZTwef0zqCx/rwAdUZ6T5tqSxU=
X-Authority-Analysis: v=2.4 cv=Lu6iDHdc c=1 sm=1 tr=0 ts=6a72268c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=005LtiolIcJ_eoEmTSIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX6dYYmu7LuC9k
 UKxL39TLLPQiTrlS7v1gy+7yenbgModZzZ2J4rFu8iohuVe/nbu0AEQ+rGnYT8oCiR65KTvjIqi
 XhElzmWn5XZqRddkxBGuXMl5u52LvSGYNv9te6Oo9dHNiPNmTan9rYaEjPcW0IQph0dXbFIRFbL
 ROdEIld4mQ8N9hTHcEYdIsmJ5PbH0lLrnnjRk4WnGQxtip4mOgaY5k4dvPV3RYkxL7fdQxn7Llg
 saOQtijPGCEWUxnA4QMI07GAlO77ikvu5YwMcee+RHgVy6g8NkcIti6nsfAGYg+eGfhMEmj8e5w
 mikAS7NYKockpWiACkdF8fe3Bu1RPjGiR1lp8pZI84/P21NopzTiKokaizA51+Dd691apn6ON8r
 Ooeww+SWoi3kN14piGXhecRw/AAonatF7OpLunGNqiUMvEYShZtJEutDSedXXNyjcPKPbzlCuQy
 LwHUIm15SnKt+l5PORg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_185110_470593_5B6967A9 
X-CRM114-Status: GOOD (  15.04  )
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

Add bindings documentation for the Eliza Graphics Clock Controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  3 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       | 51 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index 2a2d37c59442de427874dfe42849cd0ec1a8b752..7eca456211e476b86cad274a81426f52cf24d527 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on Qualcomm SoCs.
 
   See also:
+    include/dt-bindings/clock/qcom,eliza-gpucc.h
     include/dt-bindings/clock/qcom,glymur-gpucc.h
     include/dt-bindings/clock/qcom,kaanapali-gpucc.h
     include/dt-bindings/clock/qcom,milos-gpucc.h
@@ -32,6 +33,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-gpucc
       - qcom,glymur-gpucc
       - qcom,kaanapali-gpucc
       - qcom,milos-gpucc
@@ -75,6 +77,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-gpucc
               - qcom,sm8750-gpucc
     then:
       required:
diff --git a/include/dt-bindings/clock/qcom,eliza-gpucc.h b/include/dt-bindings/clock/qcom,eliza-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..c3d9b7827325c5b8db696d1d95b4876e17c01c83
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-gpucc.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_ELIZA_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK						0
+#define GPU_CC_CRC_AHB_CLK					1
+#define GPU_CC_CX_ACCU_SHIFT_CLK				2
+#define GPU_CC_CX_FF_CLK					3
+#define GPU_CC_CX_GMU_CLK					4
+#define GPU_CC_CXO_AON_CLK					5
+#define GPU_CC_CXO_CLK						6
+#define GPU_CC_DEMET_CLK					7
+#define GPU_CC_DEMET_DIV_CLK_SRC				8
+#define GPU_CC_FF_CLK_SRC					9
+#define GPU_CC_FREQ_MEASURE_CLK					10
+#define GPU_CC_GMU_CLK_SRC					11
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK				12
+#define GPU_CC_HUB_AON_CLK					13
+#define GPU_CC_HUB_CLK_SRC					14
+#define GPU_CC_HUB_CX_INT_CLK					15
+#define GPU_CC_MEMNOC_GFX_CLK					16
+#define GPU_CC_MND1X_0_GFX3D_CLK				17
+#define GPU_CC_MND1X_1_GFX3D_CLK				18
+#define GPU_CC_PLL0						19
+#define GPU_CC_PLL1						20
+#define GPU_CC_SLEEP_CLK					21
+#define GPU_CC_XO_CLK_SRC					22
+#define GPU_CC_XO_DIV_CLK_SRC					23
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+#define GPU_CC_GX_GDSC						1
+
+/* GPU_CC resets */
+#define GPU_CC_ACD_BCR						0
+#define GPU_CC_CB_BCR						1
+#define GPU_CC_CX_BCR						2
+#define GPU_CC_FAST_HUB_BCR					3
+#define GPU_CC_FF_BCR						4
+#define GPU_CC_GFX3D_AON_BCR					5
+#define GPU_CC_GMU_BCR						6
+#define GPU_CC_GX_BCR						7
+#define GPU_CC_RBCPR_BCR					8
+#define GPU_CC_XO_BCR						9
+
+#endif

-- 
2.34.1


