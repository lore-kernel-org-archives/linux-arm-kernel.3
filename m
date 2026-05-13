Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECCBCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 14:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=; b=SaNKWeEiTQA8iCgK0gHlXFsuAI
	Z74I54QyJXY3+STnnJS/ntzcLSwnZrPBExw8KEqRT8rg9HL7VkqOwOtRYkch47qRp6LtmHjPwNbLg
	nmBmCBQPr+oPdjyq42r7oexVBLcFOh0LZJK63CxchFXp1sulF22v8qOO+Y21XuBXpH4zfHlWeYDhh
	HMTChMhrMkNiGvLZV1afpt2KosLYr9J9KLxuggIOEUcrrg/0V2KPOAPuygcEa9dpqpccDf9hRhRiI
	SZYrvhyFHxTk6LnJd++OUeqSUAc0EaEcrfg9fu0KuJ5DudncHi63Renr03t6fiiMBVrCiNcMbuds0
	JOXay+HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAUt-00000002uDQ-1kTe;
	Wed, 13 May 2026 14:23:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAUq-00000002uBa-1xQz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 14:23:37 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D9jgkp3007378
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 14:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=; b=T7keGP9PZUy06gHb
	PBF4WB/ZORJ69mjF3HZqt6D7ndoN4RMfXxuvK6ti2/qIf2ElSSt6bsepvRx8WaRD
	l0Qdtq6hhOjDoRAK2DPk5h4nsVJdDqPTPItZGp2ZfRk/N5wQFfiRGuFXAAcJLFIe
	CCqoW+zn5rt+T+Z2IAOTuBD0s8a9AlQGMxznCFrB1DZq5pEZlLDpQ9dYVPNG5Xuh
	sjZZud8RwRANjL+2GM+snCZE5j6YEBpI8TwtRYSwqom5BuMeGSFGG69VvZJd0Hi9
	4SugpZx14bK8ZWGpu3EFkLxxJ4EOZh8PxT23OGSfYOzCdzQykqHPgrEnXLSeZlFg
	Ve2xoA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0h0kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 14:23:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba86e35aa1so106364465ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 07:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682214; x=1779287014; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=;
        b=GXOj3N0b+RN2PmQVrUxEFikpa6zrnHrmdS3aEtaTYT8GLWgKMTPjwrzYiBeZ6XXpR3
         WXR695nfNVK/+VpvZLXHeVWsw53rjmQMYxYHidVSJh5TPiSikuB+znfxdAD5dOnH3qcM
         mbgsE/v/xkg6aBQwUkBjzD3Mt5K1RvIiCSEPURmJfNK6ZorNiGAwiYPQVyrTC0SSeirW
         cJVbE8WStQhVeXau0gg5Wql41sJI0+xD7Ubwkt4QdGXqhuUMV6yrBWh0GvtgdEOkkhPH
         e3telzEL3+9LNg8SdV3QG53pG8habGqfsEvAm5L9QUwQ31JdIrJfvVEazaSgkfqpZGCK
         m/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682214; x=1779287014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=;
        b=cSz7QmxGMKXQaJXIbztth81Q4t5L60rU2jAp0/AQF0AY55iNJmESmaksyNapbpy/PB
         IWGN/185QSey74Y6QsDwsM9kS+0P/L02Vt6ETae8xE1it6hcqxeQKWkUGdmF8vWc7LsV
         eVfNLR0USq1FwNxZ1ZZreekd7quxTCZ8uuHyQGTeHiKEBMhF1ocAQIk+aHNPRTKCTTMX
         MyJsXqCtLfS6qbzSkdpcGl7PtkaT6NT4cpZDhXJxNaSlS+pKyUtf1Q1Au5C9F/aycvF/
         rXJLMO0U07P/9h1t9fyKsKjIHfC1RtDEblcLSkB8+fGK419AshY7LjlAL/jvzxgkvC2A
         FaLw==
X-Forwarded-Encrypted: i=1; AFNElJ+vNO3aeYV1tRIpUOGiUfV/yNsrENfQrlw+GPQnvcReyb798d7KwrgT6mFBMIj/I6ScBQkIgfTVtz0eTDDewTr/@lists.infradead.org
X-Gm-Message-State: AOJu0YzJp4br/L315wI1wCFWsK9pd7dlTCns7BEyVmRR7Ty/6NbewnO2
	hoC2Na+aTpP25NC1gW7tACAjYg5Ni/kpYOXgqVtzFBf+uCytjcCLioPK4pGcN7GJPd+hZ3RBVid
	Nend4MsR4gqhSTMJaE48GIX8ljxjZvxoJiUnQqUCxOEm3TSnhT9/6cHlfSLdTsEC4aFa50u63q1
	48dA==
X-Gm-Gg: Acq92OHTvyBkestnKrDB1BymSOoLQWsuMvRQV6E+4IoBAtGSRC8bzzba5crNOeBIBBT
	7Fntfm6Xc8BLT6khZYKrTNiaSUSwgfrbULTvVQRk5js753QdEFg/JV+qZyzQ4Fb4XG1gdww97JQ
	fuFkik8h21RLQrRSugjLAPuxsvEjBoNghN+vzl4naQ6FOQsAkYxHkqhvndeL9CQPlJluASqXIxJ
	10yIjx6+mJIpXjKJXZw3biZlWzueSM0Z/b2yvISHrzCBIFbgaAZnckt0i+6Ck1sS5xx0ugOZeRt
	XwHMCBFe4P3aJ3w3VpUJ9b/IrOsvGdQxLjFtTQ+//tC4Uo5q8ni1AVDQfGbqOkejaeZNG1SdSJ9
	HvWocmIi4KD7nHuLC7QjwpwjgWhlHikd+3+VSglN6YH10fQ==
X-Received: by 2002:a17:903:2910:b0:2bd:2439:25fc with SMTP id d9443c01a7336-2bd27147127mr22226185ad.7.1778682214384;
        Wed, 13 May 2026 07:23:34 -0700 (PDT)
X-Received: by 2002:a17:903:2910:b0:2bd:2439:25fc with SMTP id d9443c01a7336-2bd27147127mr22225835ad.7.1778682213847;
        Wed, 13 May 2026 07:23:33 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d40427sm179296105ad.24.2026.05.13.07.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:23:33 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:53:07 +0530
Subject: [PATCH v3 2/7] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza_mm_cc_v2-v3-2-b59c370dc281@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NyBTYWx0ZWRfX+Bac6r8JUn7s
 UFiVw7Ku9/yagf0VAZUb776aG2MUvtrgMH55lSQxvdnloUz3mR0ZckdurOib7t7ONii+GkdA3kO
 NGSSIg37vbfelNmCNOhQ93T4KcsKov8tlNCNXYqOxPpgdrEf2LBZWDNZG/2x9gUHbTYYB/aNrzc
 yc0EQji39wmCwErPKU+meLAL6EU7HNiZ7HMPRFS1RDRDS2wCNoLSMYOSJCD9kZRQSKGxglfoMDj
 fCbn3disBnHPT4hw/KmSU5VrkhkECqoYI6WUtRhICp1EX6g8/2O3E9cEgz4lOKnA0XgYapTBhbY
 vlF4JNTEXUFuHHfqt/vOoNHBsCKM2Ay+giTeRHydpgTUBLOmHmRAEOK7Nv1WxzOj0h71k2t6E/y
 n08HzY+pOySOPawG0SaL6KYY4wIM1rPJaIN0GLjh0i6ZfQhZSaTzHrwlY8yUlGUS4m/jUnCCaGO
 UP/aSwCMGN8dOupVYXA==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a048967 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=eqSiwPykCNIpSPSkj8oA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: F4ngw_bNd0EJyvnvsLnKX132tfCuKPQd
X-Proofpoint-GUID: F4ngw_bNd0EJyvnvsLnKX132tfCuKPQd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_072336_639810_D0254291 
X-CRM114-Status: GOOD (  15.62  )
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

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  3 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       | 52 ++++++++++++++++++++++
 2 files changed, 55 insertions(+)

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
index 0000000000000000000000000000000000000000..706e1c93240a8234dd8017ee181d19e58091fd6d
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-gpucc.h
@@ -0,0 +1,52 @@
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
+#define GPU_CC_GPU_SMMU_VOTE_CLK				12
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK				13
+#define GPU_CC_HUB_AON_CLK					14
+#define GPU_CC_HUB_CLK_SRC					15
+#define GPU_CC_HUB_CX_INT_CLK					16
+#define GPU_CC_MEMNOC_GFX_CLK					17
+#define GPU_CC_MND1X_0_GFX3D_CLK				18
+#define GPU_CC_MND1X_1_GFX3D_CLK				19
+#define GPU_CC_PLL0						20
+#define GPU_CC_PLL1						21
+#define GPU_CC_SLEEP_CLK					22
+#define GPU_CC_XO_CLK_SRC					23
+#define GPU_CC_XO_DIV_CLK_SRC					24
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


