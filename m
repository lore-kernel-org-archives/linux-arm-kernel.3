Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91EAC56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 10:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ireCd0anUM3BwjaU2KQpNy70na3aZjg/3Q0yeNJ8RaM=; b=3Y6o2UivP1iyHCtWIMIx78vYEt
	44NmVp0wi+l/h0ckNXH6vuHCUzC0pvH+rLCZfVAQLOTrauNAKj+YwqpEIf4ODqFnZCuPixuuuaW8V
	oJJClsYpB9pXLCo0FU2yrknZ9yz0F2MMr/N4oLvjskIiQf4/lnWg+v0Sdh7VUFoTAEu0Qxjapqei1
	IeS2H/w+gNEhO9PSTJqIUGUR773MpfaiEY+XEsi95J7GXkgrq9fLk8uWmbyG5OFDnauBFdk+7GCPZ
	63pm4e19QpCpmXJe2QmKj8NVapHgbExJOnNd89KS1zb2nhoEK6vuKyuinm9A1oWyQq5eR5z7F0MRV
	XjU/AB1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvRO-00000005YmD-1JP3;
	Thu, 06 Aug 2026 10:35:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvRL-00000005Ykq-46Kz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 10:35:09 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nsjY1278138
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Aug 2026 10:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ireCd0anUM3BwjaU2KQpNy70na3aZjg/3Q0yeNJ8RaM=; b=VphPBT3F2lYwSS60
	f4EOnSOhYG0Sm6bukKlv5WVMT8R05FKOWn2OqH7y90opwgpMEwja7LKx3UcNQG8g
	JBlCI3in4pZVpuDKDyRlcR2BEpJ0Kmej2mgmn7xhje7wfESqfGgDfTkvGy2vsFRz
	dV8JYbjaeI+dDlsn3wyuWNIMxA0E73TM+gX/dB6Wl63HW6/2WfU3+WmW+JVo1qqT
	VNyR66l+ZzHC4GdE+2iGyDNTkFA+icTMv543bQvtiL4jR/i+QXtxb3/ifLD+jqeX
	POSSgebKtP8hAJBuv95bh4bAU5qiw6LveMb04qYwRsnsuK3Mt2RPJGpfA+840pgf
	zRU2hw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjuehjn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 10:35:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e4ef486c7so797498b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 03:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786012506; x=1786617306; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ireCd0anUM3BwjaU2KQpNy70na3aZjg/3Q0yeNJ8RaM=;
        b=i7xQBrRHu7TA7in6XOHO1wAeEFtNLV/p2n5uLR1qLT/gPW59M6h3wHlwRUGxUDSjc6
         pPqVpnKAOceLAqfaXfk7SfpKvdbaha0l5RDlMf9ia5uKl8pTeLegAaufEdAaZ1pfu7bf
         TJvlmnKRpvkCzRXM4vejA8bHppHuj5V/1Yw9QiNWfW5/HrCFDZQL1L3dmZg4uj6Jo9/b
         saocDB8JL/NCZ9qZYDE7a5vA5ygw7aoDlOfZTtNdIGioY/c9phmNFBMackFI+k25cEFc
         ZJNJvmIi+qwDZcLcLrwx/SjYwDdkRdgtbHoUGV61+Aq69IN5Z/pTSn0g0DH3u3ZzizNT
         WkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786012506; x=1786617306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ireCd0anUM3BwjaU2KQpNy70na3aZjg/3Q0yeNJ8RaM=;
        b=cg49QTZmA0XF6dBt5O0k2WucNF4IGEawAiQ+5HAphAuQe7MwTGUNG+uF34I3/A7u6+
         uWtb8mDg1qZnTK6K9gmot7YaKFbirto1/K5KEy8WDFRJhzXcFM6bKsI9lllTbS6Ha/jO
         L1Pq55sH5TYxSQGBlMyYITMwjszf2JxzvlH5u76h8euRxIyErzI8G2u+m3o7P7p9s8JG
         EtwSMpIDTvhFIcMJ8FB9yDHvGyzgFvsEDLccVU2qJGRtIulMrVlMRVjgERLxdOT/ZVNn
         8SQ+6c3Uch0B08MEbeL1Nucu/Zy+Uabf8wwp2Z7ilAYDIg7cd961IJjZuypWEuwRJSdU
         9MUA==
X-Forwarded-Encrypted: i=1; AHgh+Rrgy0b9neeH7YFfVhwz6jxsOViOtA4lbLeTV5+YumYtD/g4xoLXT3nCKKFowGH4rMmKbQxvNZkMDIItPNHnFtc2@lists.infradead.org
X-Gm-Message-State: AOJu0YyDKoVN9rQ37/cYG4wA+Mw4pQ9oxbFG/TcZtYDN9oNS49Yjm7rZ
	I+X4hoklH4kznB+h8ioWeilZE3p/7Usev5y4yvOeFQaBbazsWJfoSUULqEIQAk81OLJjCzMZxft
	XBKWJ6q/uiB57xkJmLWperqlu6S3bBpPSAuqdfkf7TOh5w9BVGcLr6AvsYxOV4UpCv6oyM0BMfz
	nRSg==
X-Gm-Gg: AR+sD11tZh+VXRulUEZrGQbTZxYA14UPC7+EvblRYikNcnRMl6N49zGbmP9xyEy+UPA
	sfYHbHEIs2NTu6I3wdLTaQUR1O+kfe1l1m7f5/8BaYDcfKts4ukdfiNt/aFPArJWrqI7alp5c+r
	l+FWndqFYn80tLDscUSQh8ZCuqqusb7CF+fhWlXNc0sIuliPT3lw8sqov8JCvui2uWBRtVZ3ab/
	1q8X/Et7XlI1oGmLx7fKSfbVUlf7wT9hvC8SC5q7bMWIAbPXuVWzWTZqud5kfWVILvPKDGgX+6m
	81lu0T8UzpZRPQtBHlSP6RGSLx3xNQtP+ZF+AGc/2DPyC6PhASJ02LtoHXsmXLPSJfZMGqrUhBN
	g0106xDGescR0+Zpl26Rt1QOn
X-Received: by 2002:a05:6a00:1887:b0:842:3838:cb03 with SMTP id d2e1a72fcca58-84f47d8cbf1mr3474875b3a.11.1786012506205;
        Thu, 06 Aug 2026 03:35:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:1887:b0:842:3838:cb03 with SMTP id d2e1a72fcca58-84f47d8cbf1mr3474784b3a.11.1786012505675;
        Thu, 06 Aug 2026 03:35:05 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45389e5bsm1141098b3a.1.2026.08.06.03.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:35:05 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:04:11 +0530
Subject: [PATCH v10 06/10] dt-bindings: clock: qcom: Add support for CAMCC
 for Eliza
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-eliza-mm-cc-v9-v10-6-6ba52dd14343@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=aNzAb79m c=1 sm=1 tr=0 ts=6a74635a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=DGYppUMeQ_Bf1fWCdSEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: dv_BBO7Ev9v-OEk7N2PVVlRCIcSbQlIy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfX8HCS2FAgEdV5
 mMqQzqdfCpGJsjArjTYCqjF+bWKrd+UCwLEpfmCaO3t+oXZX8oZErjMeYMvbKczTy61ONq77fcV
 u/hOMuy7yoHhZsimbBeNG/CKV5/md4sgLAfjFpWS8DJf6BYtC3mrbMPqacOZLcx+/qC1EY+xBC2
 7F+SuWHzGiZ1TtS5a4nICnb4gU8+CkRZNz7Vc3HXUkUReBShhnmBBRzbvy5ht44mzLS4IfAD6cR
 0DD7mur+JCynTNmOUlUMaRtev+GuaXmAB+28joSK8XhbmRmfnl2UpP0rEVRO68sGn+Pd+ycoxh4
 m9r7Sp3sPbIqXfmVV8nh0QCOGQO6MrURoFUsp3vS4ta3lsoH5+E5+uUHFBx7u5cLocxmABJpr+b
 xG4Q2QgFy9A4O9KS8OSxhm3uGPwG0V+7xugEEdE++c4kA5wXiotMe4GqH/TI01B2rG2uAWdisGL
 i6KllPztPgq6RXDucAg==
X-Proofpoint-ORIG-GUID: dv_BBO7Ev9v-OEk7N2PVVlRCIcSbQlIy
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfX2TLWZvP2rt7C
 pdjcrN2BRhHjQ9qRh/xQg3EiTV7UlgirgorhM89SYhmvQygwv5SBeA7iB8h51+6GxnD1VmLDRFt
 pF9uRvNzwyBCrXiY6eHmKBvKOi7V+cY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_033508_042737_BB96A63F 
X-CRM114-Status: GOOD (  18.14  )
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

Eliza camera clock controller is on CX and MX rails similar to Milos.
Add compatible string for Eliza camera and camera BIST clock
controller to the existing Milos camcc binding and add the
dt-bindings header for Eliza.

The camera clock controller provides power domains, so '#power-domain-cells'
must be present in the device tree node. Add this to required properties
to enforce it in the binding schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,milos-camcc.yaml           |  20 ++-
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |  32 +++++
 include/dt-bindings/clock/qcom,eliza-camcc.h       | 151 +++++++++++++++++++++
 3 files changed, 201 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
index c4aba40e316ca746c7ecc6955823c7d1292d5547..0655cea72524e319cc70c62047755ada9a5c599c 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
@@ -8,16 +8,23 @@ title: Qualcomm Camera Clock & Reset Controller on Milos
 
 maintainers:
   - Luca Weiss <luca.weiss@fairphone.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm camera clock control module provides the clocks, resets and power
   domains on Milos.
 
-  See also: include/dt-bindings/clock/qcom,milos-camcc.h
+  See also:
+    include/dt-bindings/clock/qcom,eliza-cambistmclkcc.h
+    include/dt-bindings/clock/qcom,eliza-camcc.h
+    include/dt-bindings/clock/qcom,milos-camcc.h
 
 properties:
   compatible:
-    const: qcom,milos-camcc
+    enum:
+      - qcom,eliza-cambistmclkcc
+      - qcom,eliza-camcc
+      - qcom,milos-camcc
 
   clocks:
     items:
@@ -47,6 +54,15 @@ required:
 
 allOf:
   - $ref: qcom,gcc.yaml#
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: qcom,eliza-cambistmclkcc
+    then:
+      required:
+        - '#power-domain-cells'
 
 unevaluatedProperties: false
 
diff --git a/include/dt-bindings/clock/qcom,eliza-cambistmclkcc.h b/include/dt-bindings/clock/qcom,eliza-cambistmclkcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..7b8b285f18d2714393885149fc97c715b3fbb042
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-cambistmclkcc.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_BIST_MCLK_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_BIST_MCLK_CC_ELIZA_H
+
+/* CAM_BIST_MCLK_CC clocks */
+#define CAM_BIST_MCLK_CC_MCLK0_CLK				0
+#define CAM_BIST_MCLK_CC_MCLK0_CLK_SRC				1
+#define CAM_BIST_MCLK_CC_MCLK1_CLK				2
+#define CAM_BIST_MCLK_CC_MCLK1_CLK_SRC				3
+#define CAM_BIST_MCLK_CC_MCLK2_CLK				4
+#define CAM_BIST_MCLK_CC_MCLK2_CLK_SRC				5
+#define CAM_BIST_MCLK_CC_MCLK3_CLK				6
+#define CAM_BIST_MCLK_CC_MCLK3_CLK_SRC				7
+#define CAM_BIST_MCLK_CC_MCLK4_CLK				8
+#define CAM_BIST_MCLK_CC_MCLK4_CLK_SRC				9
+#define CAM_BIST_MCLK_CC_MCLK5_CLK				10
+#define CAM_BIST_MCLK_CC_MCLK5_CLK_SRC				11
+#define CAM_BIST_MCLK_CC_MCLK6_CLK				12
+#define CAM_BIST_MCLK_CC_MCLK6_CLK_SRC				13
+#define CAM_BIST_MCLK_CC_MCLK7_CLK				14
+#define CAM_BIST_MCLK_CC_MCLK7_CLK_SRC				15
+#define CAM_BIST_MCLK_CC_PLL0					16
+#define CAM_BIST_MCLK_CC_PLL_TEST_CLK				17
+#define CAM_BIST_MCLK_CC_PLL_TEST_DIV_CLK_SRC			18
+#define CAM_BIST_MCLK_CC_SLEEP_CLK				19
+#define CAM_BIST_MCLK_CC_SLEEP_CLK_SRC				20
+
+#endif
diff --git a/include/dt-bindings/clock/qcom,eliza-camcc.h b/include/dt-bindings/clock/qcom,eliza-camcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..d85ef9777d08d12ec349d57f6da5e76a305404f8
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-camcc.h
@@ -0,0 +1,151 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_CC_ELIZA_H
+
+/* CAM_CC clocks */
+#define CAM_CC_CAM_TOP_AHB_CLK					0
+#define CAM_CC_CAM_TOP_FAST_AHB_CLK				1
+#define CAM_CC_CAMNOC_DCD_XO_CLK				2
+#define CAM_CC_CAMNOC_NRT_AXI_CLK				3
+#define CAM_CC_CAMNOC_NRT_CRE_CLK				4
+#define CAM_CC_CAMNOC_NRT_IPE_NPS_CLK				5
+#define CAM_CC_CAMNOC_NRT_OFE_ANCHOR_CLK			6
+#define CAM_CC_CAMNOC_NRT_OFE_HDR_CLK				7
+#define CAM_CC_CAMNOC_NRT_OFE_MAIN_CLK				8
+#define CAM_CC_CAMNOC_RT_AXI_CLK				9
+#define CAM_CC_CAMNOC_RT_AXI_CLK_SRC				10
+#define CAM_CC_CAMNOC_RT_IFE_LITE_CLK				11
+#define CAM_CC_CAMNOC_RT_TFE_0_BAYER_CLK			12
+#define CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK				13
+#define CAM_CC_CAMNOC_RT_TFE_1_BAYER_CLK			14
+#define CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK				15
+#define CAM_CC_CAMNOC_RT_TFE_2_BAYER_CLK			16
+#define CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK				17
+#define CAM_CC_CAMNOC_XO_CLK					18
+#define CAM_CC_CCI_0_CLK					19
+#define CAM_CC_CCI_0_CLK_SRC					20
+#define CAM_CC_CCI_1_CLK					21
+#define CAM_CC_CCI_1_CLK_SRC					22
+#define CAM_CC_CCI_2_CLK					23
+#define CAM_CC_CCI_2_CLK_SRC					24
+#define CAM_CC_CORE_AHB_CLK					25
+#define CAM_CC_CPHY_RX_CLK_SRC					26
+#define CAM_CC_CRE_AHB_CLK					27
+#define CAM_CC_CRE_CLK						28
+#define CAM_CC_CRE_CLK_SRC					29
+#define CAM_CC_CSI0PHYTIMER_CLK					30
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC				31
+#define CAM_CC_CSI1PHYTIMER_CLK					32
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC				33
+#define CAM_CC_CSI2PHYTIMER_CLK					34
+#define CAM_CC_CSI2PHYTIMER_CLK_SRC				35
+#define CAM_CC_CSI3PHYTIMER_CLK					36
+#define CAM_CC_CSI3PHYTIMER_CLK_SRC				37
+#define CAM_CC_CSI4PHYTIMER_CLK					38
+#define CAM_CC_CSI4PHYTIMER_CLK_SRC				39
+#define CAM_CC_CSI5PHYTIMER_CLK					40
+#define CAM_CC_CSI5PHYTIMER_CLK_SRC				41
+#define CAM_CC_CSID_CLK						42
+#define CAM_CC_CSID_CLK_SRC					43
+#define CAM_CC_CSID_CSIPHY_RX_CLK				44
+#define CAM_CC_CSIPHY0_CLK					45
+#define CAM_CC_CSIPHY1_CLK					46
+#define CAM_CC_CSIPHY2_CLK					47
+#define CAM_CC_CSIPHY3_CLK					48
+#define CAM_CC_CSIPHY4_CLK					49
+#define CAM_CC_CSIPHY5_CLK					50
+#define CAM_CC_DRV_AHB_CLK					51
+#define CAM_CC_DRV_XO_CLK					52
+#define CAM_CC_FAST_AHB_CLK_SRC					53
+#define CAM_CC_GDSC_CLK						54
+#define CAM_CC_ICP_0_AHB_CLK					55
+#define CAM_CC_ICP_0_CLK					56
+#define CAM_CC_ICP_0_CLK_SRC					57
+#define CAM_CC_ICP_1_AHB_CLK					58
+#define CAM_CC_ICP_1_CLK					59
+#define CAM_CC_ICP_1_CLK_SRC					60
+#define CAM_CC_IFE_LITE_AHB_CLK					61
+#define CAM_CC_IFE_LITE_CLK					62
+#define CAM_CC_IFE_LITE_CLK_SRC					63
+#define CAM_CC_IFE_LITE_CPHY_RX_CLK				64
+#define CAM_CC_IFE_LITE_CSID_CLK				65
+#define CAM_CC_IFE_LITE_CSID_CLK_SRC				66
+#define CAM_CC_IPE_NPS_AHB_CLK					67
+#define CAM_CC_IPE_NPS_CLK					68
+#define CAM_CC_IPE_NPS_CLK_SRC					69
+#define CAM_CC_IPE_NPS_FAST_AHB_CLK				70
+#define CAM_CC_IPE_PPS_CLK					71
+#define CAM_CC_IPE_PPS_FAST_AHB_CLK				72
+#define CAM_CC_JPEG_0_CLK					73
+#define CAM_CC_JPEG_1_CLK					74
+#define CAM_CC_JPEG_CLK_SRC					75
+#define CAM_CC_OFE_AHB_CLK					76
+#define CAM_CC_OFE_ANCHOR_CLK					77
+#define CAM_CC_OFE_ANCHOR_FAST_AHB_CLK				78
+#define CAM_CC_OFE_CLK_SRC					79
+#define CAM_CC_OFE_HDR_CLK					80
+#define CAM_CC_OFE_HDR_FAST_AHB_CLK				81
+#define CAM_CC_OFE_MAIN_CLK					82
+#define CAM_CC_OFE_MAIN_FAST_AHB_CLK				83
+#define CAM_CC_PLL0						84
+#define CAM_CC_PLL0_OUT_EVEN					85
+#define CAM_CC_PLL0_OUT_ODD					86
+#define CAM_CC_PLL1						87
+#define CAM_CC_PLL1_OUT_EVEN					88
+#define CAM_CC_PLL2						89
+#define CAM_CC_PLL2_OUT_EVEN					90
+#define CAM_CC_PLL3						91
+#define CAM_CC_PLL3_OUT_EVEN					92
+#define CAM_CC_PLL4						93
+#define CAM_CC_PLL4_OUT_EVEN					94
+#define CAM_CC_PLL5						95
+#define CAM_CC_PLL5_OUT_EVEN					96
+#define CAM_CC_PLL6						97
+#define CAM_CC_PLL6_OUT_EVEN					98
+#define CAM_CC_PLL6_OUT_ODD					99
+#define CAM_CC_QDSS_DEBUG_CLK					100
+#define CAM_CC_QDSS_DEBUG_CLK_SRC				101
+#define CAM_CC_QDSS_DEBUG_XO_CLK				102
+#define CAM_CC_SLEEP_CLK					103
+#define CAM_CC_SLEEP_CLK_SRC					104
+#define CAM_CC_SLOW_AHB_CLK_SRC					105
+#define CAM_CC_TFE_0_BAYER_CLK					106
+#define CAM_CC_TFE_0_BAYER_FAST_AHB_CLK				107
+#define CAM_CC_TFE_0_CLK_SRC					108
+#define CAM_CC_TFE_0_MAIN_CLK					109
+#define CAM_CC_TFE_0_MAIN_FAST_AHB_CLK				110
+#define CAM_CC_TFE_1_BAYER_CLK					111
+#define CAM_CC_TFE_1_BAYER_FAST_AHB_CLK				112
+#define CAM_CC_TFE_1_CLK_SRC					113
+#define CAM_CC_TFE_1_MAIN_CLK					114
+#define CAM_CC_TFE_1_MAIN_FAST_AHB_CLK				115
+#define CAM_CC_TFE_2_BAYER_CLK					116
+#define CAM_CC_TFE_2_BAYER_FAST_AHB_CLK				117
+#define CAM_CC_TFE_2_CLK_SRC					118
+#define CAM_CC_TFE_2_MAIN_CLK					119
+#define CAM_CC_TFE_2_MAIN_FAST_AHB_CLK				120
+#define CAM_CC_XO_CLK_SRC					121
+
+/* CAM_CC power domains */
+#define CAM_CC_IPE_0_GDSC					0
+#define CAM_CC_OFE_GDSC						1
+#define CAM_CC_TFE_0_GDSC					2
+#define CAM_CC_TFE_1_GDSC					3
+#define CAM_CC_TFE_2_GDSC					4
+#define CAM_CC_TITAN_TOP_GDSC					5
+
+/* CAM_CC resets */
+#define CAM_CC_DRV_BCR						0
+#define CAM_CC_ICP_BCR						1
+#define CAM_CC_IPE_0_BCR					2
+#define CAM_CC_OFE_BCR						3
+#define CAM_CC_QDSS_DEBUG_BCR					4
+#define CAM_CC_TFE_0_BCR					5
+#define CAM_CC_TFE_1_BCR					6
+#define CAM_CC_TFE_2_BCR					7
+
+#endif

-- 
2.34.1


