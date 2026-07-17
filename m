Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53878C44517
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 07:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=; b=Ex8Hxjqlrq4pDKoubJUgyly85q
	YaLuTNkJpueh1DpAGH9Ii26DVpKhq++6jiG+b1yTwctp//QSkcfMb9eJZTTToRsdtdQ9sKDSD+z2W
	wMXWC5vTIeeynuIwhUkivN2v6gLZtAycan1dLn3gZ8WsmtNGMdfoFukgx/7C+KnpqZE/rBC61cdUn
	MGEwI/jCyCIIExF3wjURTWTG+vbKQXtBqAUQXrTFDWCshQ2Us9krFYxZ2EAn0HkRWQfNKou3sd6Bv
	ILrBR0fIB7aUQ4zxKzLJk4Ee6cm7DgkpoY+tlDnhHweJx7xkLtN81SP4NMPfFQBm/LfU7X61fblDJ
	Sxudjjhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkd3k-00000001Sgv-0itq;
	Fri, 17 Jul 2026 07:32:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkd3h-00000001Sfp-2zkj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 07:32:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6d3Ft821153
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 07:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=; b=XTTYbCgyV4m11uvU
	Bxm23sW3tw9cP3ktjMtgutrpnBnHceoqV4fIYPWQ5JXvnrOjJ9h3JbIRwYrROJmO
	MQ6Ozs70rRXKRnYeqDUOoth0mhTZr0UqhMfr34ZKjSvGVF3gn8ZG/A9qUEJhD3wt
	Xm16u27tUnpZI7E8FjtgqsiOrp2WsUH9XRsUgiV4vqc3YdJbeKQVCtOFl0xWvIle
	MTMMAYRKOAxZJetughhykVtarfuJGS8DakbEP4vk2mA6Knlu2rERY8YxEmi8vjKv
	CzMSmvYRTma1DWdT4z+l20Dk8UgxDYEDdQ0J8KeUFlL2rms7wXKQPabe6JAZfX+4
	7gPchQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fffag86c7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 07:32:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cce02cb769so54057925ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 00:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784273552; x=1784878352; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=;
        b=WStJY5W6fZ+CY3TzfscD24S0bRm34ghlzQ+SNa6L004Fh7SO3/DjUioo6V4YEfCJLk
         m9NUNSfEIgVyjrO1NLaILJMboS1vQVC7gnid4gFigDPrZWREgRMPiLsun8o0ijv1Jiox
         8wBn2FyqTBvti/JmojoZAZSHd5kr+XjyOpRD6QqXNuY1mHSMz3u4LliHR9SuIgNORqV8
         +mba/3HiV7KzMQZYx49Jfog0RG4sjnwjk/DFuiOFD4F87eZG5H7BEWuqvsBC2z1tB+wI
         i7DEk9jecsTFS/1G5D2cavkjEkZxSCJf0kLBwO6HZCzO3Zrof77XrEgunhDJfHcpUxwo
         8Vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784273552; x=1784878352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=;
        b=L6bSAScTL7QreL2BTAguqrp1GvsGOZ/vTsJRW2b3i/7VHOKChoiZH2DtI64LwPpqvu
         yGynfWavho53HWHr7RWtQQOSMbNKn2sgmoqiv+iV07mD8cT6PzvuBnn8Y5iZVKeFK+z4
         tv6Wki5dZBGOk2vJkRM4x2fEMZJWnJK07hIT284SmqnY5IR6EuqW9sCrzJfwu1tY8YOc
         A1Hi7dtaIkh58cfjBfvbYhkFTxn0gyYZNiwWULvR0VuQy7/7rdNNmtsIUVxk493y9xmT
         W7kOJMD13yGUHHLCSmdsf9ElrigRK0u9ImP6lzJsPpleuMYwPMHlgrw5S9hV6GAcTH8T
         Um/g==
X-Forwarded-Encrypted: i=1; AHgh+RqTtYgGA7X29u2gXG7zT2loZwScy9aWTcH5R4URY1B84+EclicRi8jyHT3V6hQab/bvPBwxQfuWfoFoALv1sPPI@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7h0UQ4Uz5Th3AVQISOfmVIGnKLUjg/Junyv7QyTws8HRK5idI
	MbMqN1oHFCSGl2o/Rxwvs+pNgt5OgfDoZCpKkwSEfA6JWy+p7uy276TlTHDuyMPdNMn1ZNLd+kD
	m+BFlxLaX+Vc+R7zy1fEsys6bDthMo9tUkwwNvLbdtJRVJPLcTfC5BpXeFxyOWTy/sHriwaUuP3
	OV8A==
X-Gm-Gg: AfdE7clIaIaLC7VwLg0vJZAPzowTV1X6RQjmQ3+QU5YfTxTgoU0GB6t+uPmcLBfx2lh
	F4twkVNqrBQ7XXPd/Jc/yT1Xys+RKhTVGq9Dq0iHVVTevLasVzzppx7XURhuBGwf0ukqZ12VdQu
	yak+KM7TKD/vrs7bS9bhkY4rllCXd84ZpiJGCGw3eNk2vyK4qDP35YVf8TB7W+jbCwW7hdb9h6y
	AhhnWJB7ApKWb28cj6tqzVN2jy7LhFbVKslgVma90A5A94E1YOUjUBxxKf5w7JKgwfcJxZmxf/Z
	F+byRfNiIYIlQ/sTyQdJyJA3sTzIlgwB0xNS6JwO24oW0W6y+Q1ZdPXzbENFo65kNd/dtX6xYDm
	aV8NKrLS1Jij6L04dF4+SdPPN
X-Received: by 2002:a17:902:c401:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2cf3484726dmr15952155ad.2.1784273552420;
        Fri, 17 Jul 2026 00:32:32 -0700 (PDT)
X-Received: by 2002:a17:902:c401:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2cf3484726dmr15951625ad.2.1784273551875;
        Fri, 17 Jul 2026 00:32:31 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448fba7sm5882525ad.6.2026.07.17.00.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:32:31 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:01:49 +0530
Subject: [PATCH v8 05/10] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-eliza_mm_cc_v6-v8-5-5cca1bef2e48@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfXz1vQBbqT4ocG
 Mjw9zL+82Ibj8xlXuxuVKyOXO/pa4SAY4PaNtXipQ2FhE9bjsJPEO26uLXqbS8Bg2fYpMcKXZRK
 Clv1SG92OwX5MLC+YnVgz2gvTEN3MHOVd1x98rNk7RVsQ0ASXpnJGb93pIx68kozL32CEbSvMvw
 vinyLyd6SZUbefePXSNRla+j0M4cFKz6zSLbI6Euw6KBC/ZZwOxQmE1rIYWH6NwxTCn1tRZIcbx
 wU5p7866rKJ0LlIAQ2atxqJWhrpWkBaUpG9E/pB9miH8LKsNDMSp5laWJtMEIDbbE1pgIVKUpXa
 w8wGyqd07b5Q5HH1zWwCb6yJavOdgcEjsH9QZ4tE0S0AkWzzlb2JSYW/HtXqhdly7q2z1cB4y8E
 EvHI0f2b3D3E9miG2xN99u42m8Edlz4nxPAFwJPYWJpjqjRw4z84MXP/BGtabuTOSNoHviKlPNx
 XHBDTNCRJ/aDsyWthJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfXxHHOVVzITjN8
 owCAAAr3XLW43hY3KwHywU2ntVEapKgrql2Cef+3ECRg9631kX9MPALu9xRH7zuVmkCxa3SNlIX
 0siswLLf8WC2dan7R8ltbZNRzJvIr2w=
X-Authority-Analysis: v=2.4 cv=KZfidwYD c=1 sm=1 tr=0 ts=6a59da91 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=eqSiwPykCNIpSPSkj8oA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: VeC8XLsJXVWE7F6423ILFYhxwiY7TlT3
X-Proofpoint-ORIG-GUID: VeC8XLsJXVWE7F6423ILFYhxwiY7TlT3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_003233_771857_BA4B8333 
X-CRM114-Status: GOOD (  14.57  )
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


