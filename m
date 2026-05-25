Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94B2CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 10:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAGiRZXZQtrxqIY50PmQ+yjP1cs4RScr9Q+YrQrcqkg=; b=ENV/Ea1FAJW7Z8ASw48U3uGzYn
	lwdYFwdAGxpeMlE0u59LM4v7axBho5Jq0Kwmv1CVdrroBhUigeAtgCTI0BX0DFuczv6HeVJlu0As+
	UrF95hShw/ka4IA1AqOb6liVP5G+dXFHaBba34Exg5pYN1kZg5INpLuzAETniSLu6TAYQ3cSTwViv
	zpREOGKqg6jwkAd2UhHUcsN8ZE02IsWSfGXIpqFMbHe/bZAfrcvk5HuBsQXP4mpy/EuqjT3L0JK4P
	IGBVFdhwGgWxsz225Ev6WoivlZcaH36NMm56bOV3NWA6V7QwSLyjZ/k1C2li+wFm7dOlgdgHecFTg
	A+xC/anQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRSpE-0000000GyOw-2DQu;
	Mon, 25 May 2026 10:46:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRSpC-0000000GyNd-2LZu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 10:46:24 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9cwPu1802808
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 10:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iAGiRZXZQtrxqIY50PmQ+yjP1cs4RScr9Q+YrQrcqkg=; b=iWUOeg4ViKLcqOYz
	3tqo9umiPdnH+cYBOwSmQQSW6cjcSp9VmNGiUK9QGqNz614/qpLq8e4W4pSid+uZ
	NGqsmNHkl5wVLnqhI20GRUQ3CSSYp1iEi9ilusfKmx+xIlNEYcItVIBMeRPpTzzP
	M1AG2JaDixtQ6MrXFFDDrL61/JD+cIJxk9gF3wNnfCXYgAyuTb5vdBrEkzc/XPzB
	tMGydYH8QNZqjjjuJN8e17idzjFKmeNslgsA+dLcHKVOx2aEj1i3oO5BYgaeqoWv
	gX70VFyhUfLUm/U+Eih83QgcWvoFpz0fH2PzFPMfjMaxeiDRublf7iwvQ0DeKLvd
	Po3IDA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckyqg7t3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 10:46:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd1dbcccf6so19545275ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 03:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779705980; x=1780310780; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iAGiRZXZQtrxqIY50PmQ+yjP1cs4RScr9Q+YrQrcqkg=;
        b=T4Ae6xwYrk4aS1X0Vm3YvdoaghlIE20/ajAjrqscA3YOs+Atz4qSjmZsnwJ6YV9T3f
         /g77xwCWb+B/nBeoIRfv7T5hJxvVZvXzXSi056e5GKfkVgVBad9q6PCSlznuGYLSotQB
         bF/cS3+YfT0a9qJC3FaJAruQdgCBVesmJd8pZ7/F/OMmGsQ5GJETg+ycAuGrsa0x7ChC
         zN4VOrJwRoEfoX2WPeO6DwPja0p2oPBabGi4r37w0Ez0Lx/nXzlQ7pIrquVX/wpM0z3I
         N20M+0p4GWUxlmN1EJ463myiMhnVcVK6ioz23EuQ8NRrwQk0yIpJnhH0yFTpcI5hq2xR
         fzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779705980; x=1780310780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iAGiRZXZQtrxqIY50PmQ+yjP1cs4RScr9Q+YrQrcqkg=;
        b=rLKYePrWQ0YWPS2elGH0cZK+/aOQ0TWmVSZa87SbwwsjlSVRT/+qwWxDrDupcZF2Vw
         8Ypwihyas5uAf4/6TkbT8kjt8C8cAIPuiOOSN//NYpb0cujxDZP2XGjy7W2RYL1iS+d2
         ZFfeesYOKktKCnX9YKF7i6F5mj3vehcigsnjxrtpRpFH7OtvquU3SAr0ogmJ0MW9h0lZ
         5sLMfXm5mrUBMQRbWXWE7S7wE/Y1Ms0qDXGxZ+nsUVkqlJt2YXuumzhueIe6i7qHGt4o
         mKhY3wVx1zWSxwOC0q903yecDN0whGwhlSxf9k2X5XFEn9yHTyo+jCg49sQBmt3V4olX
         20PQ==
X-Forwarded-Encrypted: i=1; AFNElJ/j5yvR07EMfqZY0noZTPnbi7FiYv5aLt7biKKYoWwPxFhAqX9v3VH/ohm7iAIAgKY5qHakGBpTxiFfBFD4NZGX@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7VC+k6lD0AQCicedul+enmfI6nbWNdlk5NdK7VSF0NdgqH2TA
	Y2wy1Z7R09uxWQOUHTFJC6RhsTa+BadRCMK2aaUsXV3gTJ7DL8Tq5TDXrHvU/D6M4mU3PxCEipo
	TXwb2U6m6iBZG+CIkCzrwaUjUnM94sIFc1cYRjKT8s1cZFr09nly8TsArrvsagWAqxNy7U1kXGT
	ObYQ==
X-Gm-Gg: Acq92OEgqg5fIFnDdvfEm4Tr0ebY7tuHTR2oqQ9eotdzdnmUOxQQLYtTybopIqk6gwi
	g8jUOrkotMbpodH2tXZtfrI2qQOd4WoIIKx7d0OCufhDWnL7xJcdbetQpTKvtVIBr5EdOlICRZG
	pN4IVeiEhTpKubSTahN7XqWo4LN4Mmr8jwRhVobuz7xU8KK4bK0jR3Pi5WRV3mf8gyMJBal7Fd8
	NKiA4PdfzWmtz///pBHnS+4SOdwptp3aCmoa/ZEVbEEiOczfaxong3VDu0pyfjROG24dTBI1YE9
	8+5p3sFN5xZDK1X/WuPkt7794mZbQFEGLhLOzJObnlxPQYu/i57vV82xcuB1WCDsfTOJK47uILy
	QVtkw89tty5zWlyZ5+Z0u9FzRh8rNorwGaGVPeZdjycXgbg==
X-Received: by 2002:a17:903:2381:b0:2bc:ac76:c1c9 with SMTP id d9443c01a7336-2beb05e8633mr145799505ad.16.1779705980475;
        Mon, 25 May 2026 03:46:20 -0700 (PDT)
X-Received: by 2002:a17:903:2381:b0:2bc:ac76:c1c9 with SMTP id d9443c01a7336-2beb05e8633mr145799125ad.16.1779705980019;
        Mon, 25 May 2026 03:46:20 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb591f63dsm118666175ad.83.2026.05.25.03.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:46:19 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 25 May 2026 16:16:03 +0530
Subject: [PATCH v5 1/7] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-eliza_mm_cc_v2-v5-1-a1d125619a5a@oss.qualcomm.com>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=RMyD2Yi+ c=1 sm=1 tr=0 ts=6a14287d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=p7IodTP_qeDR1Assq60A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: a7nIS889OmjaZWcV3-wrhv-OhWbSrSZP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwOSBTYWx0ZWRfXy8jVB03IpuxF
 g5dOp9rCoJjrEdDswa/902YVjyMzxjfQt2ucWyJDvj7TuCQS2SVWO2SkOTJdiA7LLSCDQHR7K07
 sruUck3nxJZvduz/xmyOyGZI60M0m0tUvgnokm+ny/uVYlIJH+T4aOc2KccttNrWf5ZI5WbSwNB
 MkcN7mEjOcrg0aJjCYTt/Wzn6QFvXeIS+pI9ndC0K8tvu22ARX8Fn5M+3W9VJy9cSpQ+bvIQBgr
 Lty4Ii8lPbh/2pipLxDojfA29XUyKEOi3YolSUBrv55+a6jiaB5GyP+8bJxrcZhIn9XTBJZuWOc
 5RdAT7YXV7lmnffPzc5vF5sjX2ktV0wW+DEuTQFJ7+7Vsrx+R6pDJc5S4+cgQNkOiXKiKoOWSsj
 NXwrYzOaaJ2UM5iT1lYc4Itz/6AfKJ4zCDp8emb7qEPkBZmuEELSLrbeTcVfg7ogE2rNdkGhhPF
 NFS/h0vO6EzArP389RQ==
X-Proofpoint-GUID: a7nIS889OmjaZWcV3-wrhv-OhWbSrSZP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_034622_729027_73B90910 
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

Eliza Video clock controller is on CX and MX rails similar to Milos.
Add compatible string for Eliza video clock controller to the existing
Milos videocc binding and add the dt-bindings header for Eliza.

The video clock controller exposes power domains, so '#power-domain-cells'
must be present in the device node. Add it to the required properties list
to enforce this in binding validation.

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


