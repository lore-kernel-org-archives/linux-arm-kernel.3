Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E1FCDC198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 09:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fffkGVCzEeTlGXV+NA8q2hgDOX5MJ1TUXnLYVSq/nF8=; b=CRWa8Wo7kpsp87mSzkiual/Krs
	zzsgGWiOQ9d8lQvmXX+bvfD4yuOaV+BIfXx6UMTtqaZmWQ9Ss2/kSm4C84qIIvrcjMOcRoPvJvexX
	7M7xNUpQ9k0lUenW+WPmGFTGVkXTMszMTRw/U3iqtgTPZHdOnPaq3pD5eHtz2YGNN66eeyw9eQlqH
	/fyjQyC5K/46P6ORmVwTbKilakW7kBLMckvOwMwmKqXA/wVL8j4wKgF0207M+XfrVlbfUD2KtTxxv
	Hhz0TiQJ3moifePSwye5anscWT45iEaA21nTHJHdNEPFVKuQ7inzFUgV1k6jaY4Bb2GpvT7Z5xLid
	KoTyL3XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQ5K-0000000EZPR-09TB;
	Wed, 07 Jan 2026 09:44:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQ5D-0000000EZJY-3nxY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 09:44:07 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6076tNVJ2379144
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Jan 2026 09:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fffkGVCzEeTlGXV+NA8q2hgDOX5MJ1TUXnLYVSq/nF8=; b=aF3TKZEJ6v73HHqG
	d05iyFZX60Wm1hxG0Ew1f9lRKKvuVtYpiKraE2mOV5U2l+3eIfiWGrzYbxIgfkNI
	W+0l+kMZjwrEAWwcNZqESmUpbq1DBfN27Mt/hYqpHT3Mt6lyVs1puP7eC4ADj11G
	+Dr4cheiY6IC8DmmT24D+W/db3kwlM4m92stsDFJqK4T8to+aOZneIhTBYa/mChm
	Nyzp1oAuMo9Wgl8FtpjEuUZG0/5Q4bkawVX2PXEq0M+AUfeovPimd1z24BTygkY+
	wZV6bFpkrgY4Tsudt0wtnDeXSwAi4WHYDEtqJXjQ9YDCcvKMhrXqyVQslNEZEnGr
	tgtkYg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhjn4rhsa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 09:44:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-bce224720d8so2326379a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 01:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767779042; x=1768383842; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fffkGVCzEeTlGXV+NA8q2hgDOX5MJ1TUXnLYVSq/nF8=;
        b=hC8Y4bl/xWAhWi5/ahmsraZifw+Ho9ldDF94hplzEtQ6fpP57kPzbHiEyp8MwOGH1f
         PDpSCpwgT4un47QBMCkO3erp7ukLmYlP1Tq6RdlSapOn2LG5IsahT4QaK41w3WQs2lfU
         1Sgk1WZrebzPkiXRsr9YOmxpVbVJUZGT4zZXXvrqvIQzLOOPyGJmrlUpjSboA8KXCSms
         l7QgLuDz+fptNJscYUrOKVcJ+weLscoe6nSCsIzomnVj1gBphoerULZXDzVif4CKeZHE
         y7AvWHwOPr47T6Tc1uzBFP0PUmhhEr8n6QOPrbqUI+wCHJw7CGne7qROUEMxT8KGX7E9
         aViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779042; x=1768383842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fffkGVCzEeTlGXV+NA8q2hgDOX5MJ1TUXnLYVSq/nF8=;
        b=qjBnVVICHB1KCzE71pLKkmpnNIWtMV9/OQR7UFr081VvPBp50afRvSf8vPIsFAYoAI
         rIWlxwOC7XTTO3qdTJYR0l+8V5RooEYVxrwG7doUrW2rUgVxcijozkVs6rODdd/saVrg
         4eQNKWORXZxSg9H9346g8kzXnEjMxAqHPWNuHlcpgd/z3Kfl+j5Gn64xgJCGcExnfzjs
         ff2egafsTTwbJCmGxASL3hJJ4uZg41o/syD+leQWIqOyV2LiizbuEUIB6ZpUPnY5bZV7
         ECp0gl02KHRT1uS5bKCP1KYREBc47hbJay04cVSVbDWl3LUKNQrw8yZfXo9Wxvtzoko8
         J7lw==
X-Forwarded-Encrypted: i=1; AJvYcCWelOVCifaRvHlJAKB2IRf9z6/5avYUnDyJa6rQwUfcdAIAJaWHVdz7H+HqH1M/ZGfhEjJLpINgxeSdJNs0qN43@lists.infradead.org
X-Gm-Message-State: AOJu0YztawT0pi5A5bQJMD7pBRmJgfnoN0Zn4rrer3J3KE4Orr8Lj6I/
	Rf4QT3q1uuWnPXRTGnOcQeBOemsO038r2HWDxnGok3mLfMnN62sprFAiWZcKLNE8jYboy3pnNII
	M1uWTQ+lnzIp1c+sL9q/27b2ypv38duZsA0iVvU2FCuPCN51HzBLw9CMamRTNtRwC1L0Lxwcn6u
	ABxgPlIh7msQ==
X-Gm-Gg: AY/fxX4qbV3THlSpE2ZTe3IlG14G6bSmtSF1sYp3KukWNaxLcvduAkV4OTjB7IohrNn
	+q7TNofvb6qW5A6uGNt1f7TpAhB1IKkL9LBAzWAIZqg1ec8/6dImkviZtRDFNrjYjb2hpmvf/YJ
	0jSbZA0Q5YgZhHxghdUjV9KkQCH9AAd/MEPj5Wqbv6bbJhx2DHgcfWzVxFpxEg72/G7CUf2wqAe
	jX9Iv9tMnHY0CEsiPNEZQauxNQOcxmBFFN+yqpValj1u5Y4YNdyc1+UvD0pIbQNSIbwSWdf0H0c
	Oqo9flQVdZJTkXWDbl5Tqwu/+0hKW0OKa1OJeR/udTQ+Qgyu2pARdhUBcje4Es9w8bV82HHutUV
	MbaSqcjKzZtkLb/omIiQ0ldXl/JPrSxNkfA==
X-Received: by 2002:a05:6a20:2588:b0:244:d3d0:962a with SMTP id adf61e73a8af0-3898f91d2e5mr1676328637.22.1767779042373;
        Wed, 07 Jan 2026 01:44:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIH4Z2Oahxy0UxkXkDyW/3P3Ci/gp4BIgoLAtCTUiDQ8zlt5KFUGw+C/ySvBhCDKkSEmp+cw==
X-Received: by 2002:a05:6a20:2588:b0:244:d3d0:962a with SMTP id adf61e73a8af0-3898f91d2e5mr1676298637.22.1767779041824;
        Wed, 07 Jan 2026 01:44:01 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9568sm4472944b3a.15.2026.01.07.01.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:44:01 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 15:13:09 +0530
Subject: [PATCH v3 06/11] dt-bindings: clock: qcom: Add Kaanapali video
 clock controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-kaanapali-mmcc-v3-v3-6-8e10adc236a8@oss.qualcomm.com>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=LJhrgZW9 c=1 sm=1 tr=0 ts=695e2ae3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=_xnZC5tmkvlqoiR1VIgA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3OCBTYWx0ZWRfX5NMxsTIvZBw4
 3MNrxBQnf5jjqKCsNXOeZDgBLxPTh7/FkPCWTszS+1Als0T+8BtZa6WY1syOHKrqzsKSC0Ml0HL
 ijsFeS8gcPGDHvUVr7EHUBxbNIfBAff552R+rG5Wvi/UtNx2Jdcqi8YvF+iUccFonLZZ7kbwLyQ
 SE8pgBJ8xyoFaMA+PZsnzPHeeM2Vl3M7y61puJRjRhhbuWnUa1TacyWobnsgPo3Q2jczgD93G4+
 OonrRfJEDaHTjt5sG7zfBkyG8jJ+giUoAsLB0bCAr/M17LwA6XGTbqYPHkWBgUuKnvdAe0FWpsi
 VTMz3AWt8B80qoE3ZQ4sIOTLCBm16nqFyyIuy1Ak8GpRDwqLjHCT5sdGI+kUBM1iPvcCkT1nYf3
 Cj89kOAl4pcKQqBE7MqZiLSnPlVSyBivdt+TIWX8x3EqhguVrndQNzQSYPTlwi89RqH9krXaJ5X
 IPN4xoY8SOVILoIGWWw==
X-Proofpoint-GUID: sos3hR8k4NPK06YXzQi3rb65TQnPLb2V
X-Proofpoint-ORIG-GUID: sos3hR8k4NPK06YXzQi3rb65TQnPLb2V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_014403_983056_C7D7454A 
X-CRM114-Status: GOOD (  15.51  )
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


