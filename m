Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4733DD0EE0D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 17:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fffkGVCzEeTlGXV+NA8q2hgDOX5MJ1TUXnLYVSq/nF8=; b=P8B50qVwGmNV0Bz9gu7VJL85Wk
	fScNcm6OMDnrM+XvY/C/gauBCS1O+9W5Fr9ZpzHKLSLsion/zCTQ2lNLa5HZK8ElBpJoeke9xsRiJ
	x5iMTdFX5tuWjlnIEHzld01+kBbWvlAq76u3CngsFI56xR7+DTAQEWzvjBaKOc4maPTEHYOLU3b3V
	que7WfoXikeARrTLLKscC8k05wiVw0gB0pR7bCMinU9XX33oDDj4syDSb3DbFzEe4f9vMP1qau+fX
	6MFaFCBSs9e3uQFq502nYyUGVzEcQ5xv0DtyS7uLM4/zjaZW7+91z5V9/7jxZVw3KzepOgd3mT0Kc
	IHHhOmUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNx7D-0000000Dgpr-1dRh;
	Tue, 25 Nov 2025 17:46:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNx7A-0000000Dgnb-3dtZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 17:46:10 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APE0Y2X3706643
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 17:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fffkGVCzEeTlGXV+NA8q2hgDOX5MJ1TUXnLYVSq/nF8=; b=KUmBiX5HvuclJ4i8
	bnEL8nT4vq5b/zVcOcxbjKLOQQPtSiVeOAT1iZ6LM8w8G2uos2FqJD2ZYYU/9WoH
	E0WADa1TZOSQ2cZy4FBszvG3JbXleKXxEFJ0Fy4AwBr+4CPZeLK7rYYVNe2qeEV/
	HIUEpYGEoxkeGJ/YMS4osdC2WFQJ0op4HfVLGzsPeSCW+Ealq9uhGek35o+3huqh
	8ZqdP7oWTlAmZqr+Pg069QwEsHfUFhUuPeaBZYQa1/Qd07TR+7jjXTk2gxgwZBI4
	1hnUQEvSXVtbIGlpUQASLQYJL91YgQBhYoudgzK/0RbJQx+Agqhze5u+ItK5UW3j
	jM5DlA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4andufrq2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 17:46:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297df52c960so147724105ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 09:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764092767; x=1764697567; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fffkGVCzEeTlGXV+NA8q2hgDOX5MJ1TUXnLYVSq/nF8=;
        b=NXr6Jwx0QcZVzMC6RZJyhFt/Ka3Tbu1ezHsCHD48HFVDHUOooXo08QC22+fqnyJc3A
         vJz3Hq/OJCXaoZIVyFZBDZSuLBzm7LFa2bKeQj/+/iINqSzGxtkWWNvdxE4Bg+ytSWod
         90lV2dm+tXESrdo/15bBBpb6JuUmX9N33G/KUOxcgf9SBPzor3hm/YbXrcTMHh/I5ORA
         FMHylgzpm8wN/uDYtR5JeiRO1IhFRIPbk9UpITAOm1gFXMJu2nPNgUbwHK3nsTm+ZY2l
         zCU7jUAU+dsx0O07hDByuOjWZlfLE8b7Qkok5U1P2ViiKut07uMmOxqRwrvtOCOuH3FE
         PQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764092767; x=1764697567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fffkGVCzEeTlGXV+NA8q2hgDOX5MJ1TUXnLYVSq/nF8=;
        b=t0Gvwf2VNRon17u1clF3iL0UKZ+rf0offKEbOOJTaPlIIA5Y1cy/EymQTE+rVDJK5V
         9OyWTkNswqLGuM1akAfaobrDcjtK03JF80x7kszkU18PXuHgSsWVYMmVjaJ0nHat+6a9
         onWlFrN+g/0dL9bOysDJPJSOV3BCRtXcSAJBhJLw7R4D9EICOqMO+//N4OTa8Kwl4e79
         3ecIjIahrk31sxuAsuEubZELUSPYYbwNiAXYsXybgxkFDX90GCX8bTLtz9gnKx5qbF9R
         2SFqUCfJE9F/r0ETrPZKz/EKdmm7szHA2qzJaSXzN/J2Pc0w39qa4aHanyIRNfR++plK
         kYYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrV2Xr236MzILrEHodgLRABLMjYWhKh7V1lInpz0AyhAEoHM51h7nyZ/TGtddABA5uQDUtoXx4vTjSotA5T2zN@lists.infradead.org
X-Gm-Message-State: AOJu0YxZHBCGIbcWDPPhFXF1oCEEIM2sgste3zgXZNxZ4ELtT31kpYjM
	wqy/oxMWPR01mEIHQ5GE5hHSFWlQe7LIglVv+oVpshT7SNC2l+wCp3WXLm0VqreS9VAZDjgamfT
	YDZoZLkb6IeGWPvQmyEfSWmP0L9ZGHHaBltYh9FoATooCHwwqTbnnsx0ou7RTr891+OU/iwePCO
	osKw==
X-Gm-Gg: ASbGncvH69icIrP5NK4bUAQIrdvEq6/jXYxOU6wNsrKmyZ/j0aH+OW/KFzXeHUg7EuG
	a59iCw8OgGlb94J+Z+v1G6kmbWjNXpD7A+k5pW6wgTYLEXOpdSpRWhLSgwuiAyecIAzkl9NoVB+
	G5PqqtBVN9RNK/JoapmNhz4ObbaDTmlEtZI9RKGtMkmzoHerESplljyg2l+mfQzWrKmvrvjiNvQ
	uqP/9ool1y9Owvhm4GhEOCcRLEvzW3aCf/oYJni8FUgPqOmRqJwk4cYhjJwapk7pa6QsdfiKLq+
	oQzdC5YOEhziHWkU3FVQT8jTlmMmW6FzvbpmmLK4PBXcrO8lDqIvSCqn/x6fpS2pMOoiFIEUbCd
	HleqpsPSjMEO57LJoATwOrheX7FNBXsyPlw==
X-Received: by 2002:a17:902:f647:b0:262:cd8c:bfa8 with SMTP id d9443c01a7336-29b6bf35a2dmr205850125ad.34.1764092766834;
        Tue, 25 Nov 2025 09:46:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+KSJB2xWtxVZ8oAlfa5za4pbJa3L620mPjdtau84L8l44CqGBLK2ZdHQZmtGTniP8opeA4A==
X-Received: by 2002:a17:902:f647:b0:262:cd8c:bfa8 with SMTP id d9443c01a7336-29b6bf35a2dmr205849675ad.34.1764092766316;
        Tue, 25 Nov 2025 09:46:06 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13964dsm174500785ad.38.2025.11.25.09.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 09:46:05 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 23:15:15 +0530
Subject: [PATCH v2 06/11] dt-bindings: clock: qcom: Add Kaanapali video
 clock controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-kaanapali-mmcc-v2-v2-6-fb44e78f300b@oss.qualcomm.com>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=C53kCAP+ c=1 sm=1 tr=0 ts=6925eb5f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=_xnZC5tmkvlqoiR1VIgA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE0OCBTYWx0ZWRfXxnQrkutf/wDH
 du61TGIWBbWg3M7u3lvFlxwRQwV76I/ASgcbnEvzhRT6oPEfKxhyTsGCmnKRzo8m17m7X82Uzkm
 g25mBBGCBp6qoCS6Bemsj2Dgl4+Arp7QzSmZNcsi29BN/SgqmWsKiOC5ZO/KzP0AwdfT0bygOy4
 gbWBIr1ey3oETx2Db27RM/DOwM5YpQ6m7A7yPep4zoDfgIi8KlGPgiD8s2Ff0SEpaaeVAJxs7jS
 nUt6Zwv0BPoAAFAlUln2iGy9N/4cRZcbdgc7aA02wqCBCdtRv5gmS7m7UsRpckYBtLWd1/j+h/H
 FTd6nBBGzWuCD/IUrFYui9LfcTA6QDQlw4BGqwrWppSYsPgCnzF4OxAJVMdpHIoCVNzWoPAXxUe
 kp3usXykISvPVNjlpWi1t07zekNR/w==
X-Proofpoint-ORIG-GUID: 60XQVHAlvhHnr6gyU8klFe1uAUq_k8C8
X-Proofpoint-GUID: 60XQVHAlvhHnr6gyU8klFe1uAUq_k8C8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_094609_059132_5ADCB02A 
X-CRM114-Status: GOOD (  15.68  )
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

Add device tree bindings for the video clock controller on Qualcomm
Kaanapali SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 ++
 include/dt-bindings/clock/qcom,kaanapali-videocc.h | 58 ++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index b31bd833552937fa896f69966cfe5c79d9cfdd21..e6beebd6a36ee1ce213a816f60df8a76fa5c44d6 100644
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
index 0000000000000000000000000000000000000000..cc0d41b895c92e1d0b84067093d2d7220c671a91
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
2.34.1


