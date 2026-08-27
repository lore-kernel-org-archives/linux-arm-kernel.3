Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F444C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYHgBCRZLEB3XoVwSokcAPnaY99rEFsjH7u+mtUXlls=; b=dKNWzSx7oPOcnsv/AWIazu9vBL
	PrxBW3zmRlKAd3EljVmaMMXElvGum2A8ta56GRX0gi5HlBii4aMDsiX9v5lBHLMxB26ClGsvXaAwL
	TJ6e2QGr9/6z0mP3PehwP1fegN+CLlRDScuuhDmLJZk1hsmkco27DqBR+PaPfQYsJ7gUiRIpxk58b
	Pvv5es87RULowAISNqUqZwYoAkxOUw0C7Uq/9YNaalzcCWhPu9735bR8f79+TSb5Zof5CTjYZRGSg
	02BtJN5hAcIH5HERs7SP5I6pVZuqQVnA4raOoELLvkZYN1/EjbYVenITWzlwdgdtv8AEz/JfBURVz
	TUTPwjoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzd8t-00000004NFm-3lkG;
	Thu, 27 Aug 2026 16:39:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzd8q-00000004NCX-0t6l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:39:54 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFclhb359158
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XYHgBCRZLEB3XoVwSokcAPnaY99rEFsjH7u+mtUXlls=; b=CVpL4ZfAqXMzDcJZ
	ljxvyeaPmM1kRXJtJvHHnkMcgARG58d3PvinlVj2Dmat7mny6eTPgEgZb//ViJyK
	Bhz+725jeHRfKpEo8b+95P7nOdxjWoJRaaY2/KweC1pQDFgTRWRf/09LUXkYYhXG
	f5/iT9srv11pCQRP6joxLV07p02Ujj6uivqBM2G46hbZDvzKRhVT4ZeFkKsScd6n
	x24jZQWBzDt/IVMkvtWlTG+XuWOi4qpguRu05xfXZRAEO/Y5nXSH/faJsw2wruJ/
	na18C9DjSFXT8JpFFLmHa25Y+4IUv55IdfVO+dl4SJ8fRoTWIUnICn7x5eAUuTza
	cDUu7w==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ganr68var-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:39:51 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e9dc0f5900so2289683a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 09:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848790; x=1788453590; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XYHgBCRZLEB3XoVwSokcAPnaY99rEFsjH7u+mtUXlls=;
        b=KakspIKztojJVsCc+MKb8WJXfblODc7Bp/TnXySgPa78mOMgWafmK24xUfOoTHAiDj
         p+DODg2/IVbfXEWZfdbSyCDkkPeN0k3FF33SFxwmKgDEJFnGOTziOhlojSdKUeUb+miU
         4Z16lCpDIuFKREwcbjcV3uEE1oSeVAcI0ROGXr0pezOoulwl7bXD1DjLOve9vaIThxu6
         TZkl3yvenXFD74SxEaXo2Y9zgbJ+tiOoZP9gYDx5ceMEsZYRBiiXElULOBBwXxmigs12
         bvsBpdAkyXoMox1fufDJ8SPNbQMeMz4FK/UNi7DS7SWTLl/7MnYl8g16R9t9A7eQ9m2h
         Rv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848790; x=1788453590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XYHgBCRZLEB3XoVwSokcAPnaY99rEFsjH7u+mtUXlls=;
        b=P5Soq5lKsHBwqcA1rN5+OY56CW7dm4cManOXu5XzsNbs/C0nTw0ybcKDJTpVs5hQPN
         VbxZxhGWrEL9RmEDPFQ7UjSpZrcwAt9831GA1oj6Jey/9PlbL+4JbQqMnjFHS2lfNjIs
         ojS5MFQDbGBgOpxhFSuZVRTISCcvRmavdDJApUcq2860TIIOgwIu68r6ECwy3Y6dUcIa
         7PGYVibFx/ExghbiRpwuAPh8q+WPMQGiIEM0FR4HV4wZXOPEmOrHwiTthJ0w8441O2+Y
         0aCtANMp07/c0PAeW5Uj8Cu5/xqJ5N2WmQ6NvpGooPIuMirtQfEe9xj/FLq7+qbHLzfj
         8zlg==
X-Forwarded-Encrypted: i=1; AHgh+RrZM5f7lJl0aND9LgqmKOqxd8NttqqMGDGiHi4wBPy2OB/Zuqz9zzk+1b6bChvx5Ljs15f0oxcxOqjcdEU0VKWg@lists.infradead.org
X-Gm-Message-State: AFuF++mtjySXDNT8wY1YkVrY7rslIXGCyRypR4rOF1/JBnjP4DcddOMY
	I+2osRFt5Jmk70WvTX0Q9jI0pWS9i9ms1+fIwnfrRBiZozMrZNM7vA1LY2VIkR589BHNiag4Wwu
	OEZ1qd1uqP/skPEEt31MQDBSxhj3g4xgubIN/7hdA6dwOfHsvbp4SHyOI7LSaXyme8vVNRH7ygq
	LNjQ==
X-Gm-Gg: AR+sD11n7yE94cvTU7QNUubgyeBS6snXAavMSQrx3zXwN0yDOsmmzgBTM0uyjdhTdQg
	H+VmRCSnRwFAcvha2ZysEGmqhtZOe5yKBLtcsoLUqVvnGCcExKgfwEpIYH1kIlHrwEqNdi4NyrH
	zKlmQzdUtx62pXXeDKjRjyeUVETYH1orZk5eH6eUmoJqPv7GLlnad88ZcE7HJ5SumStJDWE+SIB
	ZZ+cwCiZyXxwddg3rFOOsowNe43ixU66gP3Oiosa5fCTHrUxfUff5bX/iJwCy67xxtB4Wn7T5XB
	2nfNNCh7ihCfC8Fbp89myp5m+faWEW8jvDzAwAokLNQDGE4mBIuPy2SImD2dvN1xZnOH6UOUpm5
	GCXaNhcimyNUok4OPMjYRZii6ygThxUvPJU+CZKO3tQBHmEz7DS5idrt+xjnJTuc9adjSJYId/q
	u5k/n+tsqGflwU5qNowU7xouo=
X-Received: by 2002:a05:6820:5616:b0:6b1:5a1e:f9d4 with SMTP id 006d021491bc7-6b1c49a5099mr279404eaf.8.1787848790128;
        Thu, 27 Aug 2026 09:39:50 -0700 (PDT)
X-Received: by 2002:a05:6820:5616:b0:6b1:5a1e:f9d4 with SMTP id 006d021491bc7-6b1c49a5099mr279357eaf.8.1787848789584;
        Thu, 27 Aug 2026 09:39:49 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:39:49 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:11 +0530
Subject: [PATCH v4 10/15] dt-bindings: clock: qcom: Add Kuno Global Clock
 Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-10-dd34f235fc1a@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=5749;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=9FPCV87eitw661yJc7gqbrscj5MlCzlDB1E+PFlfCyc=;
 b=THRecKjInsGkrbimoAUM4rAtwm+vArD8Vaf5lSlwEQ4dUSeGaQmP6dfSzryd5NEjMZ5B77BYC
 Ss+a1EuK9FRBwpWRMrja3mJJe+XTdiw2wkyp6OErQbQLVEC1HtMtIHG
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfXw2YEFMEA0neI
 A4hHw4rDte4wTPjsGsYBjBte5POdGd0kbb/C/Ej+CYs9/eW0osSJoUco/8M5s7+CnyvRbllCZ2g
 2bO4mnZsMBuoQBixKOF//KvWCvflJi2HAW5Gr6hP2+AZBV7e9253XsgZs3PAOYiat0DiPPlC6D0
 vRIrqxbKn2dUlA/O4bKKa2HWFPICTnqDw3ywY8yHxqaTC/w7qQUuYdf+PovzAVMph75Lb7il/Zp
 WqNGj1jCIUzQ6hhd9gc1XTM+7Y8cBEyQFVJzY5lACko7AOSGfnIYp4zWx10VpyIlry+R3RW6zB4
 k6AKPrnx3JVIerYir3kWAlYOUy8DiNGQy/JXDM53EtJZbfBWNaOv8c9lU4pm6rqTWvs3fpt0Ox8
 AyLofugNDYb7QgBnpssThAstrgTRp00xO1pdu/RrlHnDafNUlL51YvsukqU1KJzqFL3wmA5OBn1
 atp3/XXx/VHIm44pn1w==
X-Authority-Analysis: v=2.4 cv=d5DFDxjE c=1 sm=1 tr=0 ts=6a906857 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=PKuh8qK-LUMqOkA3WUgA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: GbzBEi-Iob3nPYH_WwzUSTOCRZeHB1TA
X-Proofpoint-ORIG-GUID: GbzBEi-Iob3nPYH_WwzUSTOCRZeHB1TA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX8oY802eylesI
 6oy3JWA1oC7ZuzSPjantXBrvfR7PbmJDq2UBcjxpxkgNui7ZZiW+HKtc9k93WPVDdfL+3U3L+iM
 1IYSqsA/ArSu8VwB76abtTAN8v1YcGA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_093952_398597_2C48614E 
X-CRM114-Status: GOOD (  15.79  )
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

Document the Global Clock Controller (GCC) binding and associated
clock/reset IDs for the Qualcomm Kuno SoC.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,kuno-gcc.yaml   |  52 +++++++++++
 include/dt-bindings/clock/qcom,kuno-gcc.h          | 100 +++++++++++++++++++++
 2 files changed, 152 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml
new file mode 100644
index 000000000000..7ae37033a1af
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,kuno-gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on Kuno
+
+maintainers:
+  - Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
+
+description: |
+  Qualcomm global clock control module provides the clocks and resets on Kuno.
+
+  See also: include/dt-bindings/clock/qcom,kuno-gcc.h
+
+properties:
+  compatible:
+    const: qcom,kuno-gcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board active-only XO source
+      - description: Sleep clock source
+      - description: PCIe pipe clock source
+
+required:
+  - compatible
+  - clocks
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@80000 {
+        compatible = "qcom,kuno-gcc";
+        reg = <0x00080000 0x1f4200>;
+        clocks = <&rpmhcc RPMH_CXO_CLK>,
+                 <&rpmhcc RPMH_CXO_CLK_A>,
+                 <&sleep_clk>,
+                 <&pcie_pipe_clk>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,kuno-gcc.h b/include/dt-bindings/clock/qcom,kuno-gcc.h
new file mode 100644
index 000000000000..a237b25a061d
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,kuno-gcc.h
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_KUNO_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_KUNO_H
+
+/* GCC clocks */
+#define GPLL0							0
+#define GPLL0_OUT_EVEN						1
+#define GPLL2							2
+#define GPLL3							3
+#define GPLL4							4
+#define GPLL4_OUT_EVEN						5
+#define GCC_EMAC0_AXI_CLK					7
+#define GCC_EMAC0_PHY_AUX_CLK					8
+#define GCC_EMAC0_PHY_AUX_CLK_SRC				9
+#define GCC_EMAC0_PTP_CLK					10
+#define GCC_EMAC0_PTP_CLK_SRC					11
+#define GCC_EMAC0_RGMII_CLK					12
+#define GCC_EMAC0_RGMII_CLK_SRC					13
+#define GCC_EMAC0_SLV_AHB_CLK					14
+#define GCC_EMAC_0_CLKREF_EN					15
+#define GCC_GP1_CLK						16
+#define GCC_GP1_CLK_SRC						17
+#define GCC_GP2_CLK						18
+#define GCC_GP2_CLK_SRC						19
+#define GCC_GP3_CLK						20
+#define GCC_GP3_CLK_SRC						21
+#define GCC_PCIE_0_CLKREF_EN					22
+#define GCC_PCIE_AUX_CLK					23
+#define GCC_PCIE_AUX_CLK_SRC					24
+#define GCC_PCIE_AUX_PHY_CLK_SRC				25
+#define GCC_PCIE_CFG_AHB_CLK					26
+#define GCC_PCIE_MSTR_AXI_CLK					27
+#define GCC_PCIE_PIPE_CLK					28
+#define GCC_PCIE_PIPE_CLK_SRC					29
+#define GCC_PCIE_RCHNG_PHY_CLK					30
+#define GCC_PCIE_RCHNG_PHY_CLK_SRC				31
+#define GCC_PCIE_SLEEP_CLK					32
+#define GCC_PCIE_SLV_AXI_CLK					33
+#define GCC_PCIE_SLV_Q2A_AXI_CLK				34
+#define GCC_PDM2_CLK						35
+#define GCC_PDM2_CLK_SRC					36
+#define GCC_PDM_AHB_CLK						37
+#define GCC_PDM_XO4_CLK						38
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK				39
+#define GCC_QUPV3_WRAP0_CORE_CLK				40
+#define GCC_QUPV3_WRAP0_S0_CLK					41
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC				42
+#define GCC_QUPV3_WRAP0_S1_CLK					43
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC				44
+#define GCC_QUPV3_WRAP0_S2_CLK					45
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC				46
+#define GCC_QUPV3_WRAP0_S3_CLK					47
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC				48
+#define GCC_QUPV3_WRAP0_S4_CLK					49
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC				50
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK				51
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK				52
+#define GCC_SDCC4_AHB_CLK					53
+#define GCC_SDCC4_APPS_CLK					54
+#define GCC_SDCC4_APPS_CLK_SRC					55
+#define GCC_SNOC_CNOC_USB3_CLK					56
+#define GCC_SYS_NOC_USB_SF_AXI_CLK				57
+#define GCC_USB20_MASTER_CLK					58
+#define GCC_USB20_MASTER_CLK_SRC				59
+#define GCC_USB20_MOCK_UTMI_CLK					60
+#define GCC_USB20_MOCK_UTMI_CLK_SRC				61
+#define GCC_USB20_MOCK_UTMI_POSTDIV_CLK_SRC			62
+#define GCC_USB20_SLEEP_CLK					63
+#define GCC_USB2_CLKREF_EN					64
+#define GCC_USB3_PRIM_CLKREF_EN					65
+#define GCC_USB_PHY_CFG_AHB2PHY_CLK				66
+#define GCC_BOOT_ROM_AHB_CLK					68
+
+/* GCC power domains */
+#define GCC_EMAC0_GDSC						0
+#define GCC_PCIE_GDSC						1
+#define GCC_USB20_GDSC						2
+
+/* GCC resets */
+#define GCC_EMAC0_BCR						0
+#define GCC_PCIE_BCR						1
+#define GCC_PCIE_LINK_DOWN_BCR					2
+#define GCC_PCIE_NOCSR_COM_PHY_BCR				3
+#define GCC_PCIE_PHY_BCR					4
+#define GCC_PCIE_PHY_CFG_AHB_BCR				5
+#define GCC_PCIE_PHY_COM_BCR					6
+#define GCC_PCIE_PHY_NOCSR_COM_PHY_BCR				7
+#define GCC_PDM_BCR						8
+#define GCC_QUPV3_WRAPPER_0_BCR					9
+#define GCC_QUSB2PHY_BCR					10
+#define GCC_SDCC4_BCR						11
+#define GCC_TCSR_PCIE_BCR					12
+#define GCC_USB20_BCR						13
+#define GCC_USB_PHY_CFG_AHB2PHY_BCR				14
+
+#endif

-- 
2.43.0


