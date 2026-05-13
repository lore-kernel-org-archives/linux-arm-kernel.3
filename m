Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2690CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 15:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0DMstAAzIVUNxAkb64PoVNpFX/uqMB+3Ui+l/OkLYE=; b=MNqqWGdI/iR8VunLdHdGMB40rN
	whgxkkaRs7GxofPh+CWqFWWMVRin9MrzcCEtfBSrFLl1VbPyI4gwhm0yCHAO8Bvzw0ESNaYQ1dlb8
	CqCfozCJOPncys6xRiNaKWFoh9xSkxCCbEC1jXYGlVAjOQLOtspCSFD8m1557q958U1lhptboCyI+
	qglEb8I1TTTC2/uQpYiaUCI0ef9+lXpyXo9nRSaX/OLCSJJzGXxBZSvZNu0gMXt8F8wjxAJZOGF5x
	DYX+sM7bEKzJh5qOkjwEfCEA3+Yhq+JeD2QReMEjWn1V3bBJ8/iymCUEol3Hgs8+5WJeOu7PTow/J
	kndJ1dSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNBV9-00000003486-3kYC;
	Wed, 13 May 2026 15:27:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNBV7-0000000346y-3SoB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 15:27:58 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DBgxFw2965206
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 15:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v0DMstAAzIVUNxAkb64PoVNpFX/uqMB+3Ui+l/OkLYE=; b=oWAJH0gGoeGqe/Py
	fAD/C3e8SbEle4ssf6zo+mvxdSdzpNfH7oHhbgyZY7wyk4N8fyALr9ziwv74uCVQ
	iPSCl2vxel3ZrKhW2MODSopZ5GWcUB9cKMb4UGKohtThZmPpoYbXOan8M/mPWSlE
	jhJzdU5aaaEFaYDUZk0qphJWHZEPW67VXeowqw3pqOa0VN9Xbxzfga6YtjHZBBof
	WO95rbqud1VtfkBXHcw4YOX5MlKtTnK/5qETGfRcHNCGe/D9doV0b+0m9q69t/73
	UXo5XNqazeGD8/aqTW2/zeDJXl8MGzDYAWi3L4Odf9P7P/q2So62g9kVqsS8Lvig
	NMnjIA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma5a2be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 15:27:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba86e35aa1so107591225ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 08:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778686076; x=1779290876; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v0DMstAAzIVUNxAkb64PoVNpFX/uqMB+3Ui+l/OkLYE=;
        b=NDG0p1+SRiOjtaQvlhNLRF7aHdwl72pi2N3T9uZZJlMPD2O0d4OhZyzRBwBUSL4jO6
         8WGxWalypKTb2eUhd0Ek6a0yljXdgBS96c+thjvKjY0mPfILbEUapdmE16V/T/RhSJMO
         sxMaahNjmFC8jsYOOf2y5js8ZgTXmfP0/7+mv2BHvusOeJWkW23u76n1Y3ZBI3j8ZV+4
         7pw5thO1AiUOrMy//UoedkXXEvtnTmCuz2BgCqRIM+lEnZoLQN0voBRJGi294IlNkymh
         iK4KwBYOEhq3IEPf8Y6ZNmrfD6Cp7ZaemOSDiY+c3hRb4YxowySVKikf0rsSayaeCHFD
         QgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686076; x=1779290876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v0DMstAAzIVUNxAkb64PoVNpFX/uqMB+3Ui+l/OkLYE=;
        b=W70bBZJkKLHjePJtN7DL3Mo+b4+cUrvR3genb9fA8KO6GujlPNs0aNQtKPclx1spLa
         N+7fFu0grTQq7oqO3Jt1I96pDzsGKZfrrpyISY7a5twep/cYtc2X0KjejO6ZP5D5pJAK
         LQHgKlq78h4DwR9yvbezVPgODAdv1adSd1UaTN6TEOa2c5tpQ5ITz/zH1NaWDnNSWSFQ
         ZeIIQhW3wEINOJO6v1SxTRCWDz/LRFCL544EjfZgLaqluFp9Su55f07cN0/XnzL34GB/
         dH5ywgLRm6XLm0U8OyJUye6UOGzEpVBkTJs5fn1DV6IoAitmL1gcko7kdPDhE1gYeSKQ
         qS+w==
X-Forwarded-Encrypted: i=1; AFNElJ9wPbHBLu7lqu3mPBrcIMyfrjLanIbJa/ApRvP3rGG7VIZ95H4qIZlJuKkPNxYZKddmYMbLVn/3hoaoILNKUhVD@lists.infradead.org
X-Gm-Message-State: AOJu0YxA5HgXEMg34h2OlGbGtqF48x8m8/xfj8A/hzVvf876sVGdOsnN
	K2CdPCFRv0OXHBJS5hiFIH2Tp72NEl52qAgu/miilRtvCD5OGjbeNcH9/UwY2Ie0gPidFhvCRjR
	WJQyndIzD3G+2xaoYJXC6a9sLiGmhTsuyV1E/xS/JuvjC1d16CgpB/te+W9+PSIQrJhjllhpEqN
	C7OQ==
X-Gm-Gg: Acq92OEWpKaGv6O8LRFboMvd+sX8QB1vijIkr7S/FgW4gfAoLMeskx9fxV81ARlWhM7
	GNhF7wDPyjhHaBjRxb6aXWfv2sExxV4zVZcmnLrZZl9ll7D2G6QufKqHpF88EfoC8liSDSRrsQw
	es2xtDTy8dZAsPV5NVJhKKnTgM8lIqgxCb6R6f97hE4SbpyQmy3wrgBOKMleZOS2XbT65C9DLQE
	eoRlqs4h969clQwRBfdoYzpGc6LYAeFOG/hy9CE41+80V3b7gVsbJ8XTvlrrCah0V4iqa569XVQ
	vOpcSihJ/YTvsqnJrcexEd2woAiDm7XAu1GNoU+ErVXiX9c9pLDNZoKSBP+3p+2Mm6yifDFLsd+
	mSmam1ujuje5VYyevKKKWo0mUoqK3U8NgLcbNnU0G4XyL5A==
X-Received: by 2002:a17:902:e545:b0:2bc:7c62:187 with SMTP id d9443c01a7336-2bd276e6e53mr46132255ad.29.1778686075610;
        Wed, 13 May 2026 08:27:55 -0700 (PDT)
X-Received: by 2002:a17:902:e545:b0:2bc:7c62:187 with SMTP id d9443c01a7336-2bd276e6e53mr46131805ad.29.1778686074996;
        Wed, 13 May 2026 08:27:54 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eafa62sm185042375ad.74.2026.05.13.08.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:27:54 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 May 2026 20:57:36 +0530
Subject: [PATCH v4 1/7] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza_mm_cc_v2-v4-1-e61b5434e8d9@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
In-Reply-To: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OCBTYWx0ZWRfXwJW+nooaJ5K7
 VRE/OAaSsa0OYzbA5H5yDXQltMNofj9E9na9f0DJ0/fw6CA6qNc2Ho+P3+uTUidtXtI5Y36L/SG
 l+vhk/d1QeDQBx2q5MzyG8Ye++GHgRF3JAn6vPI7Ph99gD0WgMhG7iSSS/UdTW8P25aDJ40NmCb
 ixyMi9lNNaAf7i8f8Lop2YZM2sKz48kQ6GNLuTElUWuWokkwKDrJrJcjrG56CUT9Nc+6lHtgXjM
 5+iVbUN7SsvLVfebgNzoCZL2xdZMDFHydQx0EjFAM3+Uoc/JcuPgdQnl8yotTl4AV8l9kn0hVWC
 CgO8H43oxt/BDNpm32OcPROI528Fbjay5XAsEo1HHaGPR2Mer2HnLgYxhEUlXssLrZ/XVbfuyWB
 BUACej5j9PxuMBs4f5E4IsAGm9YyBtN7zqj+K/vCsxrYpS5n2JHPn/swfvQm53kGDiR+XWiyfp3
 T2JnUpN2vSI8iVZY/tQ==
X-Proofpoint-ORIG-GUID: YnEUaJKD49sQAnLxEQVLFKy3hWtqyU4H
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a04987c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=YkJq1ijSw-fIvXJVljYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: YnEUaJKD49sQAnLxEQVLFKy3hWtqyU4H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_082757_877086_BAAE1247 
X-CRM114-Status: GOOD (  17.56  )
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

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,milos-videocc.yaml         |  9 ++++--
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
 2 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 14c31efe1308aadbea61eb7be7e56039a923aec5..6e3e4424af78a93f6366378a66f2944a3bfdccee 100644
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


