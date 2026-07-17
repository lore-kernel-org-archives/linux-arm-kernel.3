Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CD6C44517
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 07:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=; b=ADoU0IwWLLC/CnD6UDEgGcFr5b
	lAi5fZpnFEVKfc0+dQzi+KqQ91mpnQBcsDYHxbY1lJBkVFYEhx3K7vEnUHd7bYFIQJwMck149FUf/
	BilmTodtEcp5UkKGY6J4sylY3nXGrD0ouRPczBPYToRIwrUBgdLgVM5FQcU3zivXntm+7imJEtV46
	kS4WkR6KDDdw7Ug7iS0DkBOFhkrnA+PvxyfIAorPGTF7LW5AEKyR5ModNaVxO9+jw8giuBcq6vKXh
	mLj0NVPC/ehjx5QzAxDCo1CULxwjXZDQYIgWWpItVo2EOrwL0+7OJ0RLDJs6pe9rUJEMhvCgEpqnz
	PWt7L14A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkd3d-00000001Scf-0Fr6;
	Fri, 17 Jul 2026 07:32:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkd3a-00000001SaP-1YOV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 07:32:27 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cGix1160822
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 07:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=; b=VzVaTHXf74prcAeU
	DSBgbbdmA6hjw1hc6acb2iUzSr87Qaml5boUwtfa23hkMTlAFLEG9qjjXdro9+Vz
	WeR5tzOMyI54FhnwIv/6uCAc8r876pjTzf5k9pTs//bGmbkRhaL74CPdpketAfF1
	VjDwKIzVbHUxHwWIdNhKpcPwTvt0Nlai3hOs7srMAR6di2ASksiTVTuYTbHumLzl
	cq0+uWdh7mWnESq6Jp/s3PZ+VSd0gUX9w7+e76kiCbUOPwATu7dzK0iI42wyeca6
	BYXJ9kVc8M5QkNW2Kr5RcCfc6wYg6xYnE4OJHWyt+GTEFyEScdVmP58Aw5YLlCjB
	a8Df8g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffd3arpt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 07:32:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc88e22f92so154529315ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 00:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784273545; x=1784878345; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=;
        b=gmP76FGuHc67pv5Kg4Sqbom67XTHgWlLKyEAXrMHeeeVYUhZHalWtdrz4rm9J1aEc8
         fNHpH5zPjsD2owXPDgDF1ZxQ2XAiIKq+hwQUYh6TS0rIuLVenckWjignYBH9k70jrAXV
         gVLJlnjfE7I2ALe7e/+GEZydXHSqfPgd16CnoHENTt0YlZm90tmDSazYBZ2aRJ1NK+Vd
         wsAIxPqTgHIATikPenZXJhHy0FTPY8yqJWCHwVawe3eGRIIqFc1c0k6U2IXZaQNRgfd0
         SM3JbiVOZTGRJggsl8T4fFoxE4q93BPYiRPg1GonFv11hto2mKFdgo1WLDFVem7bd0er
         F5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784273545; x=1784878345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=;
        b=QGzHh2iNDCbXdX/k6wshlYDTwjVXDkl6hfsRel4+eI4hEyNGq5C66EuZBXLR1MfQOm
         yksYB0Sq+FoKOYDl9g7SKbSq3vHTtL6ZPWjn0+w9jm9sMfev4h1HJErmjCCWB/INsErK
         hahrqGybvlDmB+SppsGsWyFDZntc1hA5KrbfbhCrGqU3BT5B9wER9wjQVm+DhN06yPW5
         zgut2OCrkdJs+gEB44tIvwLRkB91o8x5qWiNFVh0nCbkVSmKmSIwmFlPV2VFqbunqxmf
         qTez5HUfhrkekVo0Ga01Fmo/LA1N3AMXs23qJaTcsQm+lXk+Mxwc45tk8OWOuFHZGE71
         gvNA==
X-Forwarded-Encrypted: i=1; AHgh+RpikgKGCHIw1oC9HIzYTLz5RDsx1ExVUj86tmkVJkpfOfsieNNqBlvTakWTcJpsjSlJxPAu9dV1oKX4UzJkjvQI@lists.infradead.org
X-Gm-Message-State: AOJu0Yye2cM97itiqs/Y5oTaEkZjLQKcUJK7da2Z3rezxvIKNDhOaWiu
	S8yRgLZryyA2Jtd2eOT/uKGwsXPnS+HEOFQxdbbbvwx1e2415zANXKWD0thnepXyK1mb45gDWJJ
	R6LwNGtWnYV5ueYvs1K116F8rlQOMcTwZSKHp81Y0nbsIC0JBEsby7vaJFzJx2wwqCv9ssDJ8Q8
	arXQ==
X-Gm-Gg: AfdE7cmA7tjQ+v33UxmXGmiYrKiQWGghawo3W+qpItpT8kXFGOtoXjaAffTUDMUhOj8
	XhA7WtncytkcYb/DDKMaa5z51eBsiNTSEaOPth4uKDq6Elnnw1rmbDIaQ6ybIUV6dA5ki2JCEzB
	MAdzRpuRyEnsWr1FOLUEeXUbjKCT9tFcNNkkpfWXK/tsjilM1Mdq/p4t+1pnmxvVmGYvLa495sY
	aNBO7YUtLziLzKEnBJ8LuKBXDzsQMOvM+L6CBptY5MdL5ZveZyjuOnI6jlirvC62pT05ErmG36g
	q/W+JDeCKZzkP3PlF05MnpRuqJJ1N8lhsU5XwZnRNxmqvZ8RkGdOvzH2DeSEjBGvbfyWRzURNVE
	hAhtc9Q4tvkJAjiafsDnrLOcg
X-Received: by 2002:a17:903:2a8b:b0:2c2:bd0d:3cf0 with SMTP id d9443c01a7336-2cf3497f5dfmr16503255ad.25.1784273545166;
        Fri, 17 Jul 2026 00:32:25 -0700 (PDT)
X-Received: by 2002:a17:903:2a8b:b0:2c2:bd0d:3cf0 with SMTP id d9443c01a7336-2cf3497f5dfmr16502845ad.25.1784273544677;
        Fri, 17 Jul 2026 00:32:24 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448fba7sm5882525ad.6.2026.07.17.00.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:32:24 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:01:48 +0530
Subject: [PATCH v8 04/10] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-eliza_mm_cc_v6-v8-4-5cca1bef2e48@oss.qualcomm.com>
References: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
In-Reply-To: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfXx3NWQ3GsEvIw
 k64lsOPgdk2sxs4/+E3fRjTA4Bmr7X1qRLlqZqOXji6+0r00uSyEhc53OK7Y3NIcSQmzPa+IcNL
 RO0BHqOmICXm06WnelV385JOQd5pRxw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX16P5SBuebnaG
 GH5uXEe8AqxgOt3i3ArRwEiNHPZRv28t0aSFBhd84yZIaY/PNOADbuPtpM1Eap2OihxikIit01x
 BeEpmIKhpc7BJwetMnO7KKM0nJfWZhJhG4Ztte804zTmRz4YpDcuNh7oA3/dlSHdJFK7hcNYigb
 7UzPouK6X7uYm+ztaOiEKmFmL0FF+rVWr3k6kXKaHNmDXxYQj1nO4UiXCg4s1pYDee/4WQNFZt5
 v8NTAZ6+Q4qeqSPTQ8txMs4Wz9eZME8OgGQ6QAiqsk0BxCDMlExCsZuhwEWNq4Fc7Lhjt9WVO6F
 Mt3AYTE3TVzfD4VnCZo6GZwkEYlt4L/aUY9vWJn+FT+5c2hxheaU9v/ObihTPUQ+BkExe68TVLW
 IX2bYj6poohPAfixMcCn+QjpG5kZ2F/TKBJL7VM2EJL6j52NUcS1RQkLAjNpSBQR5GBiaFKvnL4
 gtaogXWRK+A3PyM4odg==
X-Proofpoint-GUID: 5dZjHeFNFldQkS7GxekNYjxY0rFkIjKy
X-Proofpoint-ORIG-GUID: 5dZjHeFNFldQkS7GxekNYjxY0rFkIjKy
X-Authority-Analysis: v=2.4 cv=e/M2j6p/ c=1 sm=1 tr=0 ts=6a59da89 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=hPke8q22Y-dA_sy_I1MA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_003226_421736_C678C529 
X-CRM114-Status: GOOD (  18.07  )
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

The video clock controller exposes power domains, so '#power-domain-cells'
must be present in the device node. Add it to the required properties list
to enforce this in binding validation.

There is no ABI breakage and no impact to the existing devices, since the
nodes using this binding already specify the '#power-domain-cells' property
for videocc.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,milos-videocc.yaml         | 10 ++++--
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 4d8d109cd304ef0f5afc5c3fc7961a6156003d4b..08898f1d74e4ef0a3921eb7cc5f13d14bd02975b 100644
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
@@ -41,6 +46,7 @@ required:
   - clocks
   - power-domains
   - required-opps
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
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


