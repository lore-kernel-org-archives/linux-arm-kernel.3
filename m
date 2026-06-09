Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B184CD8CAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 15:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6VA02CrdopqkVJ+OxTePh/p8WTcJpa5AIIK2SzS983k=; b=b5X/xDkMdTcNbK3eXexfmd53WZ
	AjbG5+Usse2JxeD8iYKrfyt4q0m35CkGU1GJchmRfp3Q2Sv3VQGUMuqQW5KwmDyrVe1SpHXEm4ReA
	FlZESefgOm8qhtsqnb+KLEXCdGf6gCeyp1WX4VxFK3jkusg5BDDgmO47uwJOlJSEdm+uevlEBCr58
	X1JsWFWfs5Yy0csNz0Ct0ihXYhKDeL0wdCniGlxzmNascf9XnafwQgqFvnq+PDV13ay6W+rmyb4Dx
	Sf9LJhdccTBGFsNP79QuXhbkKv3yCSxW54nl+OIXXGI84bhqmJpvkpSwf/j12iUNTuvSLcikOAfua
	gY25zS9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxz8-00000005qYi-0B1x;
	Tue, 09 Jun 2026 15:03:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxz5-00000005qXp-1RDp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 15:03:20 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CmgVj2700856
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 15:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6VA02CrdopqkVJ+OxTePh/p8WTcJpa5AIIK2SzS983k=; b=IcVwrW9o+NfapYtv
	CIAduC32ao1/tkLzpvjHCzTlXH1LQoIDE2Kir3Y/F2/ruJFFTJCVaGVzPIc+bMNt
	mTDc9YqfKZygjfDv6dRHAEUN5sOcGsiifl6Cc9hgm1oyPivNdWaWEofrdmc5SzMA
	dRmcY/ACmZeYKnFc9v8NuZ5uxiS2IoT/1m2v6jKoHgVHq9QFpO8IquibhlV4oRNt
	i9rovs3QjjDPCAANZG/gyJ1A9+rqPjt/7phkFPkarTL1inAF8cPeKjKNcb9XScS7
	ZNShJaAGC37mxHklK8aiGIIQXKUWz2VkDpDbN7vToIBNi0iuTVQq5LD6F6R1aRP/
	djV17A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeeat328-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 15:03:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84245e2bb00so5112505b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 08:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781017397; x=1781622197; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6VA02CrdopqkVJ+OxTePh/p8WTcJpa5AIIK2SzS983k=;
        b=T4qpCrlfcQaekjrUNu6bDf0+rtNWr9FdfA/V1h7g+yhrZeqr6tUD/Q8vUuM2baLZzq
         ydBepG4/nCH2DMrGF+84u8g5dnSUWHmAHzB1aVoW4MyDNFpBCqhZNBafP2EB9cFAxiMw
         yuGlNumOQMbJDa+eghn3FUmUbMkJZorX9iDFP3e4neBjwY6pg7jj053rUW9L/lztk64j
         m3hMPpuRmc3LHlvfJNY01NxclsTK+qM3LTBtOsBhgTKePGdvy/En1XXHsmVJolRBY9x3
         UzRMb6fVQHMlCrm0dMsBQJ+1Vtjvt6FO9Qy1QOO2DDCfjRUt1z/RruSZQi585dJGmZW3
         tozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017397; x=1781622197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6VA02CrdopqkVJ+OxTePh/p8WTcJpa5AIIK2SzS983k=;
        b=rMkGe1/4EZjwqJLFIcMA8ay78lOLDgehmpVPYsrKnluXVfYYkNlDTpCwFPN1OHGu90
         QGtYhkUiv5IunHl+Mp2yrW/sfJH5z9iXn7h3RAnV5fx26aIx9TXBZUekuN/TmtoQ/aPE
         Ff5VltPlGY0bWlrqmPq5xRMUxmoGSk5NoDRtkTTVavDappNGQkl+QVwchMBSBRMnf8dl
         pA1vdicex0m/3gwu/8fAnj8vftJ0VaVy+ICLUF/yIqXL97k7/APcdnybC57UKK11Sptc
         tUGg6bdCHe0Y+cYE5Wm2P2rvowwPcmmhM4DeAKXvEi9ju8LYK+nYnG/xGkuvaUhbu3w+
         DMog==
X-Forwarded-Encrypted: i=1; AFNElJ98QqBH4foLY1QZAk4396w2VpNIypRYDlAz6mOrDg6j16qR5fAoJGh+HOcAPli7gZmfjQODf1UXiWBUBms6sKmn@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk2966nBzc4SLUoCu/zaxWNlJ4YZHVLI7CvpQ4j0uQ61FdSNJP
	EI7H5JrLkIurerlhxsTfe9CmwkqNSMNLfAA8PYVP1gnKrAOmGUedOcgoGojQ08UrIkywjrSJ2MM
	8W52RHMGQKDPy/5kIYqLPdYE3HFrn1nWDjfmb3Y3QmLbaeu4fWxUJbAr9WU2ulVmBPQ84outqZj
	rUQQ==
X-Gm-Gg: Acq92OEELj9PFFU25U4tZL5hSOIn7O0LwTss+kbdDrs9QTlBrlX9rd4aDHhYgMii9SQ
	58k0vDWPlTdSzu/YcX2nQ5vVK9felEjrHBLA9kwfiruW9CdKPnzNnrTZWEeVd9czfDxA5A+sblR
	u+HI3Y2rw71n+kho/Dh1PQZJQzbpqIwvIRA8N6ue4bKZhIkkQ6gDs7shWPqq4YBvNoLiBij0vfi
	+HWKNkJUlhyb0+DKj3PUJKtYHGsvG0sApcvYY9Q2VT/TMRPcj8taFGIW+gTbkom9yDIhK9NMnFK
	fiwzf4ynTZd95ccbgYZByuC+PaCd9R5togbp8lUB1l8DygA1C5gmft6775RS93LZBgxiuR6/VoD
	Q5PgFdUCIMZ3ntQN9k+Cp960c0N1g4DnN7IbD0nTg8NLjfmczjAubxGkB
X-Received: by 2002:a05:6a00:90a7:b0:842:432e:b7ff with SMTP id d2e1a72fcca58-842b0e82357mr21917317b3a.17.1781017396726;
        Tue, 09 Jun 2026 08:03:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:90a7:b0:842:432e:b7ff with SMTP id d2e1a72fcca58-842b0e82357mr21917178b3a.17.1781017395816;
        Tue, 09 Jun 2026 08:03:15 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bd1sm26987659b3a.44.2026.06.09.08.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:03:15 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 20:32:52 +0530
Subject: [PATCH v6 1/7] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-b4-eliza_mm_cc_v6-v6-1-17df09e5940c@oss.qualcomm.com>
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
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: 9WoGYV_GyEfcTfC8J-gyC-5LBBV89X1L
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a282b36 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=hPke8q22Y-dA_sy_I1MA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0MiBTYWx0ZWRfX71JbC2WoTV5X
 uHj46/hclOVo1p2QJSdHQmEGIWbxiudTWM2drdMyofPgkjXWFkA2hogFTf8B84rhwr6/qFpmb6x
 61aEb+rUx9pUKHQTw9shX0E108nWKRe44z+dY9BZqXpPLNCDXaBxRiWnOAdY/GwfJgh0QDhNrsv
 VkGWC5opB9WEI3GsZtAaYP/Fx3qM4N8KDpCXj00teT8brS++g/u+BfqJtveYtFEeeOnBMEGKfLP
 TRC118uR/M/3n/qTMiy180/p8IC4nthMtQYbVMbriYkzxStG8xSYbJ2vYH6lvxhi050qxENvO10
 KxoNJWbSXIJ1lFZL5GqDSgi1R86KJpBcQB+ZMuNdvyZvU3mIGO2icCNZRKRF4cBNSO404a4Ovj8
 qqAeh3U1pQLB1/yNmSyqyNeJrT8TEEjpw2lcZ/FKH+7kBFvUMoRL0FbmhD6/4bQRBcQ7im7HG4G
 sKdgiqhnlKwD6YHHzjA==
X-Proofpoint-GUID: 9WoGYV_GyEfcTfC8J-gyC-5LBBV89X1L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_080319_506539_727F19DD 
X-CRM114-Status: GOOD (  18.23  )
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

Eliza Video clock controller is on CX and MX rails similar to Milos.
Add compatible string for Eliza video clock controller to the existing
Milos videocc binding and add the dt-bindings header for Eliza.

The video clock controller exposes power domains, so '#power-domain-cells'
must be present in the device node. Add it to the required properties list
to enforce this in binding validation.

There is no ABI breakage and no impact to the existing devices, since the
nodes using this binding already specify the '#power-domain-cells' property
for videocc.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,milos-videocc.yaml         | 10 ++++--
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 14c31efe1308aadbea61eb7be7e56039a923aec5..c0c9e450b8cda53625b6f6bdb1bdfe5f2bfbee25 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -8,16 +8,21 @@ title: Qualcomm Video Clock & Reset Controller on Milos
 
 maintainers:
   - Luca Weiss <luca.weiss@fairphone.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm video clock control module provides the clocks, resets and power
   domains on Milos.
 
-  See also: include/dt-bindings/clock/qcom,milos-videocc.h
+  See also:
+    include/dt-bindings/clock/qcom,eliza-videocc.h
+    include/dt-bindings/clock/qcom,milos-videocc.h
 
 properties:
   compatible:
-    const: qcom,milos-videocc
+    enum:
+      - qcom,eliza-videocc
+      - qcom,milos-videocc
 
   clocks:
     items:
@@ -29,6 +34,7 @@ properties:
 required:
   - compatible
   - clocks
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/include/dt-bindings/clock/qcom,eliza-videocc.h b/include/dt-bindings/clock/qcom,eliza-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..1e922250a7fae77f5c996208d50ff372b252aa51
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-videocc.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0C_CLK					6
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				7
+#define VIDEO_CC_MVS0C_SHIFT_CLK				8
+#define VIDEO_CC_PLL0						9
+#define VIDEO_CC_SLEEP_CLK					10
+#define VIDEO_CC_SLEEP_CLK_SRC					11
+#define VIDEO_CC_XO_CLK						12
+#define VIDEO_CC_XO_CLK_SRC					13
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_CLK_ARES					1
+#define VIDEO_CC_MVS0_BCR					2
+#define VIDEO_CC_MVS0C_CLK_ARES					3
+#define VIDEO_CC_MVS0C_BCR					4
+#define VIDEO_CC_XO_CLK_ARES					5
+
+#endif

-- 
2.34.1


