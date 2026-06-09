Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463FDCD8CAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 15:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=; b=kut3XPPy/SxDIluKmfxAX78e+b
	AMXHyxip2nktrEevxCgEgfgASaHFd1eGiROd9eM20h3P81xRDtr+Cb2ePEf+nOrJL2Qo/Zz/s5HNT
	pFwB9vS1vwxmewr8wIQxZLYeErVxWW3wU62aU8uWbYOr13csurdZIdiE9BcgIjlm/DJAeBcF6COAk
	kWFjzgZRMMMTBIlVBE+kCWRj8zatqqn0hsB/5IjGNr3kDpAXdRg/tz/5fbCQRrBry60SXJg8qotTE
	1sx7DPX51avXsZU0xbXHsZN4iBOs52e/ykvkfCJdVtezP5y0+W5afkrkkwF3Oo7p0RtVfySy6tmNh
	emjKsdkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxzD-00000005qaW-0guP;
	Tue, 09 Jun 2026 15:03:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxzB-00000005qZr-1rVO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 15:03:26 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClUYA2693944
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 15:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=; b=P1k7XNYvWkjAlAtm
	n4ayrXTq4wktwI9mgcGcvab+oAlzTpu82qdlvu+oqB2rbm5fKbOKUJ96ylfkKjbM
	ChUEQHmQCb5NNKixFLdOKUBiFRAyQ2zH9NT+m2J3lyfxMAmIFEAi61+XylEodkzu
	sz1pSHctu9SQcT0eJoZljjhFYh1VrQk3zWbC1JKWoA2qjE8A5Eau8oGsRP7gdEXR
	OalDIBkqZo5lfyDdjBh0wfyaRMtYiMJ6sg8oiH4OUYlWBj37H3OaBB60fGYmD7xe
	+XohJakXa6CRYlrDUMjPOdnQkZZKSlA0b1kEbAeUON/AIAv+zEyQiZuNE1UT5jcP
	C+hzCw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3v1mky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 15:03:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423f544944so4176915b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 08:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781017403; x=1781622203; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=;
        b=Jhsy/IhBYFrl20UVN/7NlzDi4vSublTx0m9MMvR6cXgUzmlJg5UugV+HLMH/KticNE
         qBysm1VWaz9R1hdijxntZCHtP8w/Ihfki4fqxX/Fhg/X3Hifc8ZMpqjl6yeaxiAwb7Sk
         x4ZoYbaY187l+Ku7LwmIrkNH1ZmthOfETgQtLm4OgFTqU5M63avz2msLMGtgToCXKD4S
         nPO+eg9VZ4GrIUknbN7fVkkZLoRUUnLbNIDI83U2uUzwg5+vt8Ei/UC4E7EACqaLFkJB
         +7Y+0YTUr3qh5ttu/7vAUG75O5h/SwNirGmTgc0+7Mdqofpe5GOzEKksyY7tRdvxOf/b
         LSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017403; x=1781622203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=;
        b=MR+NkgEKllU5oHePCfhjBacwFJSqfQFeeXJrQA7CxVUkVWF9Eho7jHCB8GEW1M/lbT
         ChAHMxrEnSJUhVYthnroHMgb/GOe2CITiArFXqruOkBMVXF7EZr88EmBss36GdeXnAeZ
         d5Y/EBI63bX6YLMsTSlE+KRq4NxnFLMCW4nwLb1GzDcbGsdJ/gG2x3B/1XKeo/MeHB2N
         peI4hcbb1YBGt/MQq0gpeQNrdpdeg6mZG0MeefRVGpwDO1N9yyd6twHtCuGa5E83pj6B
         Qm7viuovPAl9kSmK33Ny2yZKnEPDXwtS6xMPwGiqgPd/TnYazQlORfrt+xMoPn7bN7i7
         PKqw==
X-Forwarded-Encrypted: i=1; AFNElJ/Hy3IyvrEJWvJwSlVWLYf0x5kuQLntmjrSbNj7zJFvJfD5lVnqiOv8C1WPVYYF4STajUAS4b86YJsvlClMwLzh@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3ZcB+lFxA0bKJ32zusJdgEnQbvqF2Os9AnqRra/vTa0GSbAlA
	7ykmcoCfKlfEJW9tOOhetAJffBrdBTA6LZ0xP2anaEo8dXTtuXz7oN7/08kvI1dTScqVYvXylYA
	AaGR5fMVhsvYAKdw3f1oju4C9E1TmcjyTkwk6pSGfjVHZaNTaVMzO5S9cqFO+zZFaxZOthzUwTd
	jc0A==
X-Gm-Gg: Acq92OE4YLZIs/Enu7lfOLIfkjSVeJI3h/M5sQeBIwvhW6B0mir8VBx/RHBg5DXarbv
	FcnlPTQfUGtg7k6tMaqeKMa/CQG1j2OXt/XrfBjVIAOfFFeG5uT8Y0m11Fu5GdCRGuQQsch2Wf+
	9FzBFc8xAEKy9ZX2aQNS7dCwyfPaD0TMC+8pX/e7uZT/OZ9kIykDd7YmrhJIQFHxE3ikcKem7lg
	3TcoYv97tTSyGMWF8MjVgyQqgUq5IbseOw3aMrZJf5BCm9oLs4yuUyq3afnOPoB4IWb/M9IoFR5
	i3GLsgIUogBgRGmWpbE/fYgFIxdFpMlQg9AAVATcGbbo+jRQjjMR2IbdK61ltXZkzI+Hg0xScYO
	PaywtM7nvbl47PdcrRA3lwfDlH+FoVUHE9grjF9kkRKzZhU0dEPjXKOaG
X-Received: by 2002:a05:6a00:4216:b0:835:41f3:f440 with SMTP id d2e1a72fcca58-842b0e5d0ecmr22209075b3a.14.1781017402859;
        Tue, 09 Jun 2026 08:03:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:4216:b0:835:41f3:f440 with SMTP id d2e1a72fcca58-842b0e5d0ecmr22208978b3a.14.1781017402222;
        Tue, 09 Jun 2026 08:03:22 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bd1sm26987659b3a.44.2026.06.09.08.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:03:21 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 20:32:53 +0530
Subject: [PATCH v6 2/7] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-b4-eliza_mm_cc_v6-v6-2-17df09e5940c@oss.qualcomm.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
In-Reply-To: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=St6gLvO0 c=1 sm=1 tr=0 ts=6a282b3c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=eqSiwPykCNIpSPSkj8oA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: iyvMY_JUhWUBXH2yOL9QN393eB-4jEcE
X-Proofpoint-GUID: iyvMY_JUhWUBXH2yOL9QN393eB-4jEcE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0MyBTYWx0ZWRfX41nmu+NTubd3
 ZZg1fRL4ym1fVO9rJQ3aGcYDfYhPJxPuCAsBKq62QSpCPDqJ6H791IXBxS4MT+WybOhMHiIYgMa
 2oiw0RrUEAX4E+X9PYWhf4IMPeqUPEebEyIyE5IKD6IJkZwVMtbafPBoCdiSL4FTe7hh/FQ4t2J
 /5NLyCxfSUhvnmOiDlB86lSHqLZcrPmRSSJ/11OTI2MKYpiun9pHsUaD65rY1Sv772yVONZI/Bp
 1WjsbiZ6CWLfj0BKtGZ9w8oHvAU1Il7404I/5Nwzj2r/0HzipXuU+XS1eqHQnZMZafTH79yqjrj
 XyJN5PHma5UbzeBBvxng8y4lA6U5ehZlzYMnWv0csf8L7kMuFVgMq5ClS3X9F80K50BJ2GoJej6
 +kD8nhfBbjtBWvnBxHKhcT5bIj9FH6MSB7u8ztm2P2tCJlmwg7P4BWF6XR9crG4/sv/0n31jeYg
 rluisfj3OUbh9U29gTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_080325_609598_3EB84EA6 
X-CRM114-Status: GOOD (  14.78  )
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
index fdbdf605ee695637512ce4f98c9b6fcfacb9154f..734bab762a30800bda94c726f48013679f9ec542 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on Qualcomm SoCs.
 
   See also:
+    include/dt-bindings/clock/qcom,eliza-gpucc.h
     include/dt-bindings/clock/qcom,glymur-gpucc.h
     include/dt-bindings/clock/qcom,kaanapali-gpucc.h
     include/dt-bindings/clock/qcom,milos-gpucc.h
@@ -30,6 +31,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-gpucc
       - qcom,glymur-gpucc
       - qcom,kaanapali-gpucc
       - qcom,milos-gpucc
@@ -71,6 +73,7 @@ allOf:
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


