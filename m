Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85F1CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 23:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pk70erFYcO2AfKKE1Z7dwoVNONUYzVa0slzE3uRgPDI=; b=k2saEOGkg/WbZAebycSHJG2xbp
	Ra56Uvf7mRUXg3i20kLUnCweIqK/LJkGpwcNYgpalARU+i6JYWAtTdef8yEphK5CiC6IkTNWQx5yv
	EI1xBOD7TRbfLdQT/nk7yrzyr20m65gL8lH4bqB1IZCdvWgHnYlrmbW5h7sAbxLBstbx2O/09QOV9
	PnbzahJwC+i07w0eFviYD69DvGJUFLa1dq21tRvcrmbBgt8W54rI3Zin4OwvJrYUDNKrgQlw49OGn
	X/laUeGQ0EUZIDX3KgT0AfqOihL0ZXOn+Bcn/yU3Ny9CtEA9vrtwrRY27Y4AP6SVI7G2hgLhRCwEY
	gdSPk5JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ZM9-00000004sa1-37hJ;
	Wed, 24 Sep 2025 23:57:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ZM6-00000004sWz-42Nb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 23:57:04 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCwa5o023773
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 23:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pk70erFYcO2AfKKE1Z7dwoVNONUYzVa0slzE3uRgPDI=; b=Av1MGkWJ70XVj0nm
	6HHG1YbZ7o2pEheSiQC9+IH9tkgrnYvyMZkmhZadYH2LfcdGe5Tr3Xufno0k9h+q
	bwDkAStGyTIkmMnhB+auBc4pWLmz3xWv4G3oq2Abq7j2MIJ9NnRiBVVZ2Zv0dM1j
	BBU6lYnn6FrlCWZhHUjuId7rMrtV9RpfHUD6gO8LCnhx5gWf++JDU+kbP2MwgiJs
	kX0ERGKgaxm/+Q65D+gXB4QO8RxBlVdEQm2W5wI/1EH5V2yvItODyHxQjtzXrELG
	mMuhCrk1YR41I8/0qi1iFVAQ2BEspTgnvQNJIN+lu+PNqs/9atcubZtoKjH6obEF
	bOX8BA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0d4f3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 23:57:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-26e4fcc744dso2460375ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 16:57:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758758221; x=1759363021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pk70erFYcO2AfKKE1Z7dwoVNONUYzVa0slzE3uRgPDI=;
        b=rQgTt6IGs8eE6FaYj3i0AwMwvznIkX2hVMUFA800ZdzlFNxkLzz678TfdxxXlCghf3
         7IAlE//DBM2ksY8GyZbY9XYDz6pPk4YZDZqfqg3Y2iaZ1VliQYogn+i9aEzOW5rOzO2R
         T5IFoLgBVL1kGLnBWo/xQU0wMzkrWqg6YcfF1tGSA4ehIKeh96gq3wXjx6NUCyQa29hn
         wXxsG1zpX0dHXPQI90lZp6ebl6Rl54/6gBTebnIls3XXCqIGRj2v0qFCHPqalSh0F2uK
         eW2W2VAO1XIthVGHoK6lgvrD5YuX+0FkcPdOE5xTcwgMNR3GZHdfvRM+YI3Y8u+wGJSy
         K8/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVlWgIVJWrlZCmH8PHWhS5++j4Gs5dCrdxYKjQvXOTt1MyPmEOWpSMfd8dEgdvt4VpQGUFygxlt72JyYL07JWwU@lists.infradead.org
X-Gm-Message-State: AOJu0YwtVECeqRQS/kXqAk8B5b6ezOu27lSdPB0q9EioQPENe4c0v77X
	LMqg605aSYOLtLM4ETAg0YFxdxVyAqGGQyuUKpqU0U5bC3H6rvFj57uh8sw8ciTPAfyKzX9IO5J
	jK5zpF8kKsuhZ63CG1cuOplhAeBIPa+h1c0K7SkpsjL00QlTlSsvPZSPTIqlWpAaLETGIIrhGMr
	RRTA==
X-Gm-Gg: ASbGncsI1hVVqPLuRAIYcUDBKYZkCR1nH+IycIZhCs2M0teev/JCNnjfPsqlopu9ZRY
	OiMaFoMbBjCIUs0sj6fne9ihJUnP7Jdztj4+chbOdkdTVWrKgGQ8WZe3UPEjzTX8gxLTn6Vc544
	Hr4LSNYoB7MzmRRgGmqEOsUfd5BMEgAz0pNZCQCUQV1XarnGqXtyfOH7KdbWabRMKyinKH0UGtp
	gkGlQiP2EQRFCN12F0moonMCcqCBwiBtTKxuEfSDuUqgpFeNx5PK7gaN+PrJiTcqVrp8jVnKekA
	l4QjV2maweWgGPf8Ws9b/DE2gJkOHZspWw9mLneaeFrgSMVjK+4jqfnaIr2vFZYkIkE5eWOCtGf
	4vT6htLJSYcqRXnQ=
X-Received: by 2002:a17:902:fc47:b0:264:1afd:82e6 with SMTP id d9443c01a7336-27ed4a60f9bmr13196095ad.53.1758758220440;
        Wed, 24 Sep 2025 16:57:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbTbTp2me/2Ozbja2PwjyojwjJ05KsAp6cuIPrATe9oMmVCAbQuTu3rQBw9zmosE+LnsGZKA==
X-Received: by 2002:a17:902:fc47:b0:264:1afd:82e6 with SMTP id d9443c01a7336-27ed4a60f9bmr13195805ad.53.1758758219947;
        Wed, 24 Sep 2025 16:56:59 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6881fd6sm4557185ad.87.2025.09.24.16.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:56:59 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:56:45 -0700
Subject: [PATCH 4/9] dt-bindings: clock: qcom: Add Kaanapali video clock
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-mmclk-v1-4-d7ea96b4784a@oss.qualcomm.com>
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
In-Reply-To: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758212; l=3732;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=0aHzA87ne9/I9u0KuPsqyfzOGqP9ZE4Qht8AQaI9SGA=;
 b=bfaEOWxv1PpaU5TCtCim6m8Ui/1XV/Z5ELraJs8RZIFMQHjsxdCFjvh14YtqielMA/B97NvTr
 OAtVVOXv3NOBInq0arVHFQzREhI8KWLdmxqYVb/o1gaV5NHfMBA/fl3
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d4854e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=_xnZC5tmkvlqoiR1VIgA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: UVeoZrEbLhbMO5ahJlKnXKmmzy-oMMvz
X-Proofpoint-ORIG-GUID: UVeoZrEbLhbMO5ahJlKnXKmmzy-oMMvz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX1NHO934nV6md
 dpOunjNmnWB/w++U+89MY3Ep0qYChD2lylGR7Ysp/HilPvufMrizU2AXWA2JxGSl67A1U8DCMyv
 MzxgUR4URq+a+KrN+dCqgdspHo/o/4fXuidRPyioCzBlQFhOwxJK4foU/HCyiS77WS2DdUTLtiI
 ThOPDkibWV5NDQRjNJirhZo0bISMFD4oOz83NP3dfsRTF0qKMdFCTyOXYTSCVECQk+3mPl46S4K
 94q1CQEs3RQztHRZzf/kUkeGr2eBNG7FbNA9UC5Q42Fm/7VkSiEX1tLA8Z49aoSZtWpysZaibC/
 d0hs50we0RWylT/mY6SC3E2Ax7ORFEQuuwxunD31ZPn0hlbho1HK0g8YIwRqx6FmY4XYA76lpHb
 KYG2KnpL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_165703_131173_FD24A7AD 
X-CRM114-Status: GOOD (  16.42  )
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

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add device tree bindings for the video clock controller on Qualcomm
Kaanapali SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 ++
 include/dt-bindings/clock/qcom,kaanapali-videocc.h | 58 ++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index b31bd8335529..e6beebd6a36e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on SM8450.
 
   See also:
+    include/dt-bindings/clock/qcom,kaanapali-videocc.h
     include/dt-bindings/clock/qcom,sm8450-videocc.h
     include/dt-bindings/clock/qcom,sm8650-videocc.h
     include/dt-bindings/clock/qcom,sm8750-videocc.h
@@ -22,6 +23,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,kaanapali-videocc
       - qcom,sm8450-videocc
       - qcom,sm8475-videocc
       - qcom,sm8550-videocc
@@ -61,6 +63,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-videocc
               - qcom,sm8450-videocc
               - qcom,sm8550-videocc
               - qcom,sm8750-videocc
diff --git a/include/dt-bindings/clock/qcom,kaanapali-videocc.h b/include/dt-bindings/clock/qcom,kaanapali-videocc.h
new file mode 100644
index 000000000000..cc0d41b895c9
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,kaanapali-videocc.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_KAANAPALI_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_KAANAPALI_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_FREERUN_CLK				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0_VPP0_CLK					6
+#define VIDEO_CC_MVS0_VPP0_FREERUN_CLK				7
+#define VIDEO_CC_MVS0_VPP1_CLK					8
+#define VIDEO_CC_MVS0_VPP1_FREERUN_CLK				9
+#define VIDEO_CC_MVS0A_CLK					10
+#define VIDEO_CC_MVS0A_CLK_SRC					11
+#define VIDEO_CC_MVS0A_FREERUN_CLK				12
+#define VIDEO_CC_MVS0B_CLK					13
+#define VIDEO_CC_MVS0B_CLK_SRC					14
+#define VIDEO_CC_MVS0B_FREERUN_CLK				15
+#define VIDEO_CC_MVS0C_CLK					16
+#define VIDEO_CC_MVS0C_CLK_SRC					17
+#define VIDEO_CC_MVS0C_FREERUN_CLK				18
+#define VIDEO_CC_MVS0C_SHIFT_CLK				19
+#define VIDEO_CC_PLL0						20
+#define VIDEO_CC_PLL1						21
+#define VIDEO_CC_PLL2						22
+#define VIDEO_CC_PLL3						23
+#define VIDEO_CC_SLEEP_CLK					24
+#define VIDEO_CC_TS_XO_CLK					25
+#define VIDEO_CC_XO_CLK						26
+#define VIDEO_CC_XO_CLK_SRC					27
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0A_GDSC					0
+#define VIDEO_CC_MVS0_GDSC					1
+#define VIDEO_CC_MVS0_VPP1_GDSC					2
+#define VIDEO_CC_MVS0_VPP0_GDSC					3
+#define VIDEO_CC_MVS0C_GDSC					4
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_BCR					1
+#define VIDEO_CC_MVS0_VPP0_BCR					2
+#define VIDEO_CC_MVS0_VPP1_BCR					3
+#define VIDEO_CC_MVS0A_BCR					4
+#define VIDEO_CC_MVS0C_CLK_ARES					5
+#define VIDEO_CC_MVS0C_BCR					6
+#define VIDEO_CC_MVS0_FREERUN_CLK_ARES				7
+#define VIDEO_CC_MVS0C_FREERUN_CLK_ARES				8
+#define VIDEO_CC_XO_CLK_ARES					9
+
+#endif

-- 
2.25.1


