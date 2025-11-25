Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5509D0EE00
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 17:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fcze+Z5M95zMTHyAarxADGPc1EfZnUg/Zksfc+m9oxI=; b=gJZ4OQFrVJ/vGRtsmPCzT1loJ1
	koIUpjFkxTm1VpDXlqtOSfVlWeOX09BNfkPY81tbPNtUbd+dV8KheuoPQ1s/vzIYSWGxENu66GfRd
	MG3B4dfXUwCwFDFaUuhH4Rk96vzOGqgJbgUMXlZEt68x3o9IOfQpK3aX6EJ1DsZh4qtOSjcaDEBhI
	7mxvgrHFxFRovbY08NtU0fZfLmNDc8wg6/2qvh0qT0KuHxHcn4AsAuTNEbsLZDCTC+H4sdhHYhyB3
	YSAtuJMwButn14tdptckm9FgDqEhMm7LQ0dUugWhu+ifJxnku/8D1J834b+ABTBXcHZKFLNGU7RdY
	VHLmI6xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNx7J-0000000Dgur-1U6j;
	Tue, 25 Nov 2025 17:46:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNx7H-0000000Dgsj-0QfX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 17:46:16 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APHAqI33890959
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 17:46:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fcze+Z5M95zMTHyAarxADGPc1EfZnUg/Zksfc+m9oxI=; b=TUOxagG+VNde+kgy
	tFNeXTBD6tdFq2a5urHdfarWlwbIWxFCLbxL+jYMmOxvodUNPhYpMnWNdc/6WKJ3
	JFHs5wOSkwvx2PuJOLpFDWC7eMNmdmG/Mo+XAYCcTGppAbHHfwHPtgaZJbF4aynV
	SlY1k6cborfqc9NeddEf+VIZ4Rfjd48y01/R5a/2REaXjIOOPKBzTJypnozjiLWx
	XVYqOA+koE85QUrV03CZ5L7JDib4+9EhfKkNeOtuE1bQQ67GnLx1jhMoZbQVc9Xf
	Z3obU4elpKWaaUB8rulKqzNiY4U3qTugh7gjy/RbTvVkmPPCPZr41Z7XxTL/XckK
	IXqjtw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4angme83ct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 17:46:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297ddb3c707so47444195ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 09:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764092773; x=1764697573; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fcze+Z5M95zMTHyAarxADGPc1EfZnUg/Zksfc+m9oxI=;
        b=UOnh+k11jJBv2+WjaD9SZIMapnmXk07NMz7hjWplSMrl9blXjzasLz5Gi0ivGIz4Cd
         UPV2te0Wb6D814Ox4KjapJkkrFDGolsiYBT0sS+3Kqn1tcHQHvwWPGJzwyG1L6pnCVKX
         Yy8keK3QDYGQzjcjzTR6gvJqALWilr2hrayveUvahVe5lgoiGAU1/HbRzAPTKMR9nIf+
         Tf89zOCaZdEPGmeXuqUOAven0x5WHsVodjDwciYrtYm/F9VZe9gI6QX9b658yiKnx1Ag
         q4WSfv2FLTWjrVq/Cjr/nrMTPALIV3gRcxpdoIh8vX7LaPwaMxOPEs8Ophdbz2/Rcy/d
         4IXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764092773; x=1764697573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fcze+Z5M95zMTHyAarxADGPc1EfZnUg/Zksfc+m9oxI=;
        b=ua19unyckJBIK/vkrmZ05Q+6ljIxb2f5Hv741u/d0JS5dH4AV/Qigdqe6PUd+Ybgf0
         nrFhjzE+HjytQ3CW4PedF0I1zXGIEMP/yK0VjkcqogmAoALrbIMupyzDdkpzT+LVEgax
         GB09xEbVyOnSRRfjd1iUgnzagvSZAan5wIHEIo9uhp05vMQIAkNsR8i2qEQR1yG8wVRI
         nrdudpIGji3qggLvbubqtbI0hlFvaJBSoIAD/50DUDtuw34VJJMZ8cNTMPiTvp1y+VQC
         Gm0RuLXuCUyC2+VlWhw0ns3GNjlJNfeYkg9dq5BBF5aqb/xfso6ruEfJcmeHZiI4KVR1
         VUOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWehteI58iQ9UWVxaD3INcuZOPW+4gOF1baYT9++Qn7ExvzLJILr0ANXIbwXE7T8SG/QCwOvhuG/ZBzS4GFjmj+@lists.infradead.org
X-Gm-Message-State: AOJu0Yze8WJXxG2c4pxCNrOp+Vh2vowzsu24uvH/k7lZNSfP75o+kSTd
	kID2uZBudxLLAfJ83kaSV+iddgFwWQDffTPaIFein1Kmv+rZI4U1NwMVqmJdS+rDYODK7GnzohS
	bBclF+tZiiPmtaUpOPIId+Mi9ckKDk1VsrUU1UL4tWiznKcA3TSISCW4sYSY6rKhvWqocq/DLro
	Ftgw==
X-Gm-Gg: ASbGncttlK0DQI2OlOkVOSFlrPurNUczYymfc0I4XjpqDr+YHR5wWnmoVnxAYV8Aju8
	U8QBRiXwrRXKkbzCRT3Ku12Mpkf+ZKmLYazpIBbpC8y4rzi/Zpd4BrVDF49tM+wh5WSXjzz9vWs
	oc5fuZedFfAo47PWJhtkfvRJ0GYWNZPW4gH7aHkF5OpB3aKP19RwRSV/GVsPtN5eF7Y/8RfrGaN
	018w+Wcw0mhSGGG0ULBxxoOOTsLvw0PNzd506Iv4ySv4Gb8X6N8AUN98xMr0Sbx/gSk0XrQrVPP
	n5QaT1Y+h+vxSQfg27gsdlf6tQwzDNueUaDMsVbAtS26+ZfWQrDfdx/U8sQDmIArWy8pVmkO078
	kpX0zn7nqMm4SVyZnCO0=
X-Received: by 2002:a17:902:c407:b0:297:d4c4:4d99 with SMTP id d9443c01a7336-29baae454d1mr43798685ad.6.1764092772922;
        Tue, 25 Nov 2025 09:46:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsX/SvGhV77knoqc60F/1w3/azvBYmcyHgOJsy1m2dcG9nkCuwP5HRNq2T5SUVbWuuLLz3aA==
X-Received: by 2002:a17:902:c407:b0:297:d4c4:4d99 with SMTP id d9443c01a7336-29baae454d1mr43798395ad.6.1764092772441;
        Tue, 25 Nov 2025 09:46:12 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13964dsm174500785ad.38.2025.11.25.09.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 09:46:11 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 23:15:16 +0530
Subject: [PATCH v2 07/11] dt-bindings: clock: qcom: document the Kaanapali
 GPU Clock Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-kaanapali-mmcc-v2-v2-7-fb44e78f300b@oss.qualcomm.com>
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
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=PJgCOPqC c=1 sm=1 tr=0 ts=6925eb65 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=dEo2bzUl0lUh28VgVkgA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE0OCBTYWx0ZWRfX+Cg/nZs9yTa3
 ngWd90/6NeCbNiqrj0nOPkYqorAnyQv0Xhy5xUrparSOWsI0NmJI+gwHac0e1/XZ9tihJRjGBsN
 XVoOBBhim0CdR5Y6T0fyFzxBmqYlExHeyCJDYUpkgEnmU461xzwHAiocxe/3XgYgCUpYHxLssn9
 6YvG03FUzlemcPRzLoyf5JmFGOZPOrQhYKBC9F6kiATDZwEGmpCHErGWc5s+SWOG4+MhHyP/7Qx
 FugJdWnzlu4Dsi9f2r3aHhnfcs8AWi8t4tII7fEZHrlf8x1Gniqz/b9CnNoUhoSbGTXkhSVkrRK
 xBoSwyk8zQVkK0dswihJStSewC7kD33FVGB59cAWxU6OqL06vK3eGXMAWShTl5T6V8DqzCxqr9F
 Nk4RGvWmR9eEKsesB0TkXXNFf45qLQ==
X-Proofpoint-GUID: oyLXTa3Lbdfh1mXRNG72-MLJVZqFmAEq
X-Proofpoint-ORIG-GUID: oyLXTa3Lbdfh1mXRNG72-MLJVZqFmAEq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_094615_270361_50070206 
X-CRM114-Status: GOOD (  19.09  )
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

Add bindings documentation for the Kaanapali Graphics Clock and Graphics
power domain Controller.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    | 63 ++++++++++++++++++++++
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  2 +
 include/dt-bindings/clock/qcom,kaanapali-gpucc.h   | 47 ++++++++++++++++
 .../dt-bindings/clock/qcom,kaanapali-gxclkctl.h    | 12 +++++
 4 files changed, 124 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..31398aec839d88007c9f1de7e1a248beae826640
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,kaanapali-gxclkctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics power domain Controller on Kaanapali
+
+maintainers:
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm graphics power domain control module provides the power
+  domains on Qualcomm SoCs. This module exposes the GDSC power domain
+  which helps the recovery of Graphics subsystem.
+
+  See also::
+    include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,kaanapali-gxclkctl
+
+  power-domains:
+    description:
+      Power domains required for the clock controller to operate
+    items:
+      - description: GFX power domain
+      - description: GMXC power domain
+      - description: GPUCC(CX) power domain
+
+  '#power-domain-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - '#power-domain-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@3d68024 {
+            compatible = "qcom,kaanapali-gxclkctl";
+            reg = <0 0x3d68024 0x0 0x8>;
+            power-domains = <&rpmhpd RPMHPD_GFX>,
+                            <&rpmhpd RPMHPD_GMXC>,
+                            <&gpucc 0>;
+            #power-domain-cells = <1>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index 44380f6f81368339c2b264bde4d8ad9a23baca72..6feaa32569f9a852c2049fee00ee7a2e2aefb558 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -14,6 +14,7 @@ description: |
   domains on Qualcomm SoCs.
 
   See also::
+    include/dt-bindings/clock/qcom,kaanapali-gpucc.h
     include/dt-bindings/clock/qcom,milos-gpucc.h
     include/dt-bindings/clock/qcom,sar2130p-gpucc.h
     include/dt-bindings/clock/qcom,sm4450-gpucc.h
@@ -26,6 +27,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,kaanapali-gpucc
       - qcom,milos-gpucc
       - qcom,sar2130p-gpucc
       - qcom,sm4450-gpucc
diff --git a/include/dt-bindings/clock/qcom,kaanapali-gpucc.h b/include/dt-bindings/clock/qcom,kaanapali-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..e8dc2009c71b705b4369a6c8cf83024a18c611d5
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,kaanapali-gpucc.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_KAANAPALI_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_KAANAPALI_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK						0
+#define GPU_CC_CB_CLK						1
+#define GPU_CC_CX_ACCU_SHIFT_CLK				2
+#define GPU_CC_CX_GMU_CLK					3
+#define GPU_CC_CXO_AON_CLK					4
+#define GPU_CC_CXO_CLK						5
+#define GPU_CC_DEMET_CLK					6
+#define GPU_CC_DPM_CLK						7
+#define GPU_CC_FF_CLK_SRC					8
+#define GPU_CC_FREQ_MEASURE_CLK					9
+#define GPU_CC_GMU_CLK_SRC					10
+#define GPU_CC_GPU_SMMU_VOTE_CLK				11
+#define GPU_CC_GX_ACCU_SHIFT_CLK				12
+#define GPU_CC_GX_GMU_CLK					13
+#define GPU_CC_HUB_AON_CLK					14
+#define GPU_CC_HUB_CLK_SRC					15
+#define GPU_CC_HUB_CX_INT_CLK					16
+#define GPU_CC_HUB_DIV_CLK_SRC					17
+#define GPU_CC_MEMNOC_GFX_CLK					18
+#define GPU_CC_PLL0						19
+#define GPU_CC_PLL0_OUT_EVEN					20
+#define GPU_CC_RSCC_HUB_AON_CLK					21
+#define GPU_CC_RSCC_XO_AON_CLK					22
+#define GPU_CC_SLEEP_CLK					23
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+
+/* GPU_CC resets */
+#define GPU_CC_CB_BCR						0
+#define GPU_CC_CX_BCR						1
+#define GPU_CC_FAST_HUB_BCR					2
+#define GPU_CC_FF_BCR						3
+#define GPU_CC_GMU_BCR						4
+#define GPU_CC_GX_BCR						5
+#define GPU_CC_XO_BCR						6
+
+#endif
diff --git a/include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h b/include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
new file mode 100644
index 0000000000000000000000000000000000000000..460e21881c4fec46f2b50ccf10fe504636a52ef1
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GX_CLKCTL_KAANAPALI_H
+#define _DT_BINDINGS_CLK_QCOM_GX_CLKCTL_KAANAPALI_H
+
+/* GX_CLKCTL power domains */
+#define GX_CLKCTL_GX_GDSC				0
+
+#endif

-- 
2.34.1


