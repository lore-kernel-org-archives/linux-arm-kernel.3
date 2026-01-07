Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043F9CF6C1F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 09:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uoxee+h4RjL1xykbTwqckzvbi5sXcV85vpSTPbs6KOQ=; b=mcHKPP/F7mf2HUlL5gCjLr19/M
	JgkkVMaVbqik+hdztUOKCi9Vqelc3O6T8ZW6jCKpepXqa3aV2gwvb+uLB+NgbpIZ1majCv9QVp+Dd
	YUfV2tL2cgAbpdWHaJli57K/0XiDBxTi05KIwK0fqtDCjaN+i5lKqlGBcVSwTUM1pIuBX9/N937sp
	rzRxo1LAdzRJTwSwsL7Q66BYEwvcVftBccOCiTyNWvCzRl3U7qJhRCScdWvBhOsI7xvKgNl7SxflD
	90xsty76dpJeecn89lPZ4Eotbsg1G0ckuHPRhDHiltLFbg7/wmkuVdzlBkgccY5VkeMuaOyFn+6Fs
	V0szjo6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQ5N-0000000EZSu-0ohD;
	Wed, 07 Jan 2026 09:44:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQ5K-0000000EZPT-14ev
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 09:44:12 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60737eKp4136999
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Jan 2026 09:44:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uoxee+h4RjL1xykbTwqckzvbi5sXcV85vpSTPbs6KOQ=; b=DP/N4zbBHZDeipLm
	2LAIhuwn41aPR3w0ZIv4/G1oWXv+U1EGInDJDTT28b6xtnHnjVmgliIV5nD1K8iZ
	hPJ8JaKdc8BYg8fiaP1rHR+jVcxJcWJvZiB1IQkvD3TUVW8mKz2rVBIc4qpiuSlK
	fmfZ4kLCIQbRoMH2Z1wrcWnK4vcLhhYWr8+WGrXhwsqT87Pa0FfyBR3uXKGKkXCv
	jxutgWDLKHKQa0au6p65G4kLCTUhtq3FQT45hqkShNBmgSTfKxzIs7y2ZN0J7h0D
	QtxcZNsNWKmMA77iuOdF/FQNzFnA952wNZ5twfBbxmgjGwL2/SxE2vxoltbWrfjS
	35GMhg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66e2ssk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 09:44:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7bb2303fe94so1936146b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 01:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767779049; x=1768383849; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoxee+h4RjL1xykbTwqckzvbi5sXcV85vpSTPbs6KOQ=;
        b=hbhj8ujhkefqGzwr9kb/f06mxmpksttd+64D+sFnSj2cgUWFq7sPUa0iKtKiCyd4Y/
         UyaDCFNgy1xBYeH8JNBWx8UxaMVj1O8te/axZogah1bRI9nxTsZFHSGhjhnNx55gOvxT
         G2kycPxUi2YfS68ECeev+oJ1YsVzPmY5ju/ReJGP3LCwt12TwRHbWu4IiLGtry6RVzMN
         xrLx7GxJb+Ctz2lEeVD7FfnEqhyLrIw4j9CrXta8iTwhoY/+XcQVNR43Ifu8mZCxk8bW
         B/tTNqyAaLTca4ouNAWWQylsTczpTOPB4O1PsZ2Z0vc4inCP8wTBpdZ3be1RqWOCQTGh
         zO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779049; x=1768383849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uoxee+h4RjL1xykbTwqckzvbi5sXcV85vpSTPbs6KOQ=;
        b=h2FjHZtXpgL9VxWw1NJ7Txw4wfzkg6WFNCUFm6gqvQtkaR1TEFMCL3Jd74BxJhhtbh
         PLDdK3+bhBcSpgX/2mHT0v/p/BRwPujAUJB6hNJL5P9EMAA4BLshXFb1nNUMwyhPbFRv
         bBstLBF/ZNeufMoPOEffbfiCujvz1s3DfiAg3lkV7ZImNMN/bK15xN5c72Hzx+6cDBEO
         BwxHw7mb6W5h+884J4IG4+rewwf47VIau4HVRkPJXT3h+E9l5uu+9am1nRRRzWa9GLJC
         LNq1fN+yFwDXrVjXUO5ddZ1R+WIh2sdfbPHxBTeiUt9pWUJ5eVzLO1VfDLt1y8qbhep/
         WJTA==
X-Forwarded-Encrypted: i=1; AJvYcCVNrHvv7OeuZ96vhNOapLwHeshAlTsmTXLpGqUG7UUScrkpJeVqaCEb2VxgKZZ5BrUhL4AdKZMwxc03/GLvioFW@lists.infradead.org
X-Gm-Message-State: AOJu0YzV/6kOQSmozzaQPKA+wGMZhpYHmFWb8FAXL9ZbyuTlV1VbMcxu
	J5JJH0W30cVfVIIg+BZINslXQa6chxYyNdjc6TX3fqNJPC6bVF8wfonGt74m6apJok5qzd8CB04
	ja+rTjYKjDSj343ixWWaoZTu8KLzTz2NSctj2sBF9XdwipIDs00NWyZYql/cfa8A3KlgD7Bgo/k
	rdFaw8pgRAKg==
X-Gm-Gg: AY/fxX6qjpewr5nNb1LkHwV5PNCoWQZF44Q0BTQ1iC4ivuFB8Mtbz8LWqBnmLTBtSaO
	rdy9DyVZqTSSJ/T4V/S1q8fv0QXyl3+r2HGI1oNXS+3AmbmcMLGdXRIZdmtnlAoGGaqPGGMTah/
	qMhioFh2feHGt3kiZoL0lar069b+TEUNhxgz+maLn47/qJEUoVij8q1SLTmYwynmdb5QSGNPoxf
	oscvlZTaSEW/w6gS2FTZMXAuuTCSjpBLUttuSCXaog6II80nM3VJ8GND+k36mc/sQIl2vHR+Qrm
	GSmoAnh+6S6eh9Pm9404Gjehj11keVd0vS4rmL/JxZH5Ip4o075x/d8BecG/Pqqe4f/y7PyZZT7
	Y5BMSbSphBWRmLDA3ehQWT24OyW0tGNNXBg==
X-Received: by 2002:a05:6a00:331b:b0:7e8:4471:8dd with SMTP id d2e1a72fcca58-81b7fbc8d76mr2091640b3a.62.1767779048724;
        Wed, 07 Jan 2026 01:44:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzlFxm5Gj5e+T1ypcUeQYLoHF+GV0ngio/WwkHD0VhUanJJDn3ygFj6ZVjFlWN3cas4gxBJQ==
X-Received: by 2002:a05:6a00:331b:b0:7e8:4471:8dd with SMTP id d2e1a72fcca58-81b7fbc8d76mr2091618b3a.62.1767779048155;
        Wed, 07 Jan 2026 01:44:08 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9568sm4472944b3a.15.2026.01.07.01.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:44:07 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 15:13:10 +0530
Subject: [PATCH v3 07/11] dt-bindings: clock: qcom: document the Kaanapali
 GPU Clock Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-kaanapali-mmcc-v3-v3-7-8e10adc236a8@oss.qualcomm.com>
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
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3OCBTYWx0ZWRfX4oJZ9fAxPIWb
 AYlE9QrO8790Y4z4fmiwaN+xY/ume9OOAnqQ1zVZbFG1ttmZ0VjnrruTECqqzAK99dTsUN0g8KU
 /qjyJXh5uKeMVICycPLBVmY7/2edvuRav2sWUAcZfXkNgHzXI4qsB6hcHYXqmy/a+XSVlJSpelk
 IU7wJsssM1Xp8otSJwpidmBzICRTOGLZpXIVhzkjHoGThC+Eg9aKR9SH43wpViNff348s46vNAN
 5xAfmfN5Vj2x+3fPRsZVEirX0FoFr79P3vZXfRT85i4DMvfgzM45WsK+6dcxsk4AN7rxUGN+kdc
 sGxcKNeXcPk6hlWivmrDlFxmS4SWH60mtUe6Y2Sa+DB2+o3p7MXK18g8oQmPynban4R+Qd9doLk
 VWbZHuL/GqZhPpUmGkP3xaVJYutP+ZuYVjQEHU1UNv4NV1aXZOZ1+egntWmN8AfMFQuFof2tbY7
 8tyqWks7PQbGPs+5RZw==
X-Proofpoint-GUID: fH_WHagJutcsGPnLCwRay0Sz8g1erwNA
X-Proofpoint-ORIG-GUID: fH_WHagJutcsGPnLCwRay0Sz8g1erwNA
X-Authority-Analysis: v=2.4 cv=evHSD4pX c=1 sm=1 tr=0 ts=695e2ae9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=l5CasOIcougls8LOFwwA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_014410_356209_A2D4CE75 
X-CRM114-Status: GOOD (  20.18  )
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

Qualcomm GX(graphics) is a clock controller which has PLLs, clocks and
Power domains (GDSC), but the requirement from the SW driver is to use
the GDSC power domain from the clock controller to recover the GPU
firmware in case of any failure/hangs. The rest of the resources of the
clock controller are being used by the firmware of GPU. This module
exposes the GDSC power domains which helps the recovery of Graphics
subsystem.

Add bindings documentation for the Kaanapali Graphics Clock and Graphics
power domain Controller for Kaanapali SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    | 63 ++++++++++++++++++++++
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  2 +
 include/dt-bindings/clock/qcom,kaanapali-gpucc.h   | 47 ++++++++++++++++
 .../dt-bindings/clock/qcom,kaanapali-gxclkctl.h    | 13 +++++
 4 files changed, 125 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..5490a975f3db7d253a17cc13a67f6c44e0d47ef3
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
+  Qualcomm GX(graphics) is a clock controller which has PLLs, clocks and
+  Power domains (GDSC). This module provides the power domains control
+  of gxclkctl on Qualcomm SoCs which helps the recovery of Graphics subsystem.
+
+  See also:
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
+        clock-controller@3d64000 {
+            compatible = "qcom,kaanapali-gxclkctl";
+            reg = <0x0 0x03d64000 0x0 0x6000>;
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
index 0000000000000000000000000000000000000000..f32dade67cf2f26e29b2df6a30018b2d1f62dea2
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
@@ -0,0 +1,13 @@
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
+#define GX_CLKCTL_GX_SLICE_GDSC				1
+
+#endif

-- 
2.34.1


