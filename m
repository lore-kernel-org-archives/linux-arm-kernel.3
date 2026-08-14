Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC72C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EG4tGMO6kvaIZbaI3ajfRrdIAplElSjZ8UgSgWuKV70=; b=JcJuL3nzagpVJM5ti9DJWNjE16
	Ng2k/Ud7iO3Cz3rapri4OJaNB4sumVhVt9lJk8nvKa47vJ9idwpiSvSYx009l60kfnKhA94Z5mIbE
	Ek/GJzItRZZSrnxS3nC6MKRPuBJ4GVoosL2lHc0///DVVF7nVHMparLSZBoD71AG4itJGHuEA2gQ8
	XGelu5cBHWKY9gKBx2wSMCgl+Iyw76k440MzPkxGfyEcKF3Ixsdj8r5i4YthBEiQROninTjy1WDdm
	6rndEhlpF/kc3hVCiCIvmnxJfddRS6YcUtk1YTCuNkgAQpOZSl1EEaTj+rGusEkd5BQfwyhwChKNF
	GW60jiYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumQ2-00000002Apk-0TZz;
	Fri, 14 Aug 2026 07:33:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumPw-00000002AkP-2HaZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:33:33 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4Qgiq510470
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EG4tGMO6kvaIZbaI3ajfRrdIAplElSjZ8UgSgWuKV70=; b=gpi8KKqn25/uo+Jf
	BIPShBBH/LpHdwg/dXkV101E4hpWYBAsqbzH08bh057VNJAMOVl/vbtGTr0RwPLh
	FS62tdzCYo8X7qDQF4cU9fJM9bNyGFL3NUZ3i/yFVTQV6Tb/3935Qu9icnEvCV1R
	IK8tLBzw2uIjHZsLp0Wg4SJOF9o7X1KXv3iz/y/yusncpQSEo6qDRg4uHVWRF/CW
	Gy5mROfW3NUstgHchmPLxAEB8upxb0gX7hSWCWa935NHxYCbBEeIrrqKPsr1OqMf
	vuLxwX6jlWd7nJaUMJIDNXH1ZsVCHVOOw8o3lymVoDskN9RghD+ZtFpEcQE81Kif
	wrNJeQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1fg3ushg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:33:27 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c89704da8c7so911112a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 00:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692806; x=1787297606; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EG4tGMO6kvaIZbaI3ajfRrdIAplElSjZ8UgSgWuKV70=;
        b=RfRIFTYvDEquBrv7WkeagbXK3xKGSCdEqo3xucdL7eeADaAaGYuW9xwyc3ZE1UDs3I
         mSi+4/dAoALfNPWr5vvMXnKnNrWGHmP6iJMat8nCew72nGsTTooqbmVB3A16ie5YHrRa
         6cAi/s2NfnKVdM6j6JavtDjA4iV2jLSbx2u3PQwYuQ5xPw6eff2HeO85vuuFTslEr+zW
         tOgxpD+HrcgoEtsuRRlWh2wbyHS5Pv79GqDBoTFtlHwyx/8uSQtnVnzWCcu8cRhpXYVp
         JJb7XGL+u6yPP5SRrFDCU1PPnE8g2xa1Yw4PCTbluLz8kAEWT3IIeIzPVK0Fhuci86PB
         R9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692806; x=1787297606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EG4tGMO6kvaIZbaI3ajfRrdIAplElSjZ8UgSgWuKV70=;
        b=oxajAKRQPL+lCc6lI78TmNNPCh25RsU5uLsmeNyFC+fvzxwR0/c8S2S2jlso5t8qII
         rRE85tY2d8P5RdUaulBzTRJf+ImQfegdR3RwStt/Xlt74rXavQrv0vS0+I9vstYLgj6l
         xjVuuE+dGu36/GzRT1Gg9Z0v9krz5mWTsTz9e0ZMiB8U5K6iJZNw6gH6WoH13SCZ794Y
         Y/1P41aO/VoVj0x6zIsYVGmfF0SH2ay4zNoO8v0xX9Z8P+699J4LxNTrT2sxRneDm3NH
         wIg5sht+EfuFuV3e125Ow+/c14paL6PBUPZ7ULi3ixit8pTqrUW9i1vF0bCyOHCFzPrr
         PDmQ==
X-Forwarded-Encrypted: i=1; AHgh+RqHE73jO+S77EFdcJLkoiNNhIJCYbwt5CzNbh8yUI2oekAkSSpSd9X7Hck4XceKVVAC4vD5mm6ACdnZDQLHz0iX@lists.infradead.org
X-Gm-Message-State: AOJu0YygjdLocgVQFJ8Lh1JTmbXn3M+4fODtvJ2YHCJbbEJRGAnCWXKc
	VYnQCVP7mMTAvkzl9R6EhHAVZmgui6q9MNZgtlJro388JJMZA4gKKlopE7aXNu2mGeil8D28nfB
	gx2pRBtfyqYhyg+nq93OCmP9yjJ7ujMGUrQ3XMKdBPhGCCC+yucZtJQBwxKtbRp2faY53yWEvOc
	hRbg==
X-Gm-Gg: AR+sD11IpBmRjg9bFpMwmva41dvr3Gwqmmjvkn58QaoM6rZSryqeZOZMbujTP8BAvcz
	gEWxosyNnaA19pK0283bIrSlGcDd/wydsaZ57nqubLPAdXsJYunTZ6+bP5UX/mcQqGGWFqPQHo/
	NvM3GYENzixYaJn9+ErY2ze+13FwJxXZLjvxmWes7PiyPODBMFeI0SinRaSAXlxzv+W5B4msJLJ
	NUuQzwZCqTwaz/ietpVeFEOA11Sl+v45uQGxG9zDBWnCzRQia99BeAkgxPF1eG+d9VUNJyeMMnu
	F3NID7Ot1IvOnV0JuVHaYGDLVE4h71O/exg4FXTPBFkuy9IXZyHdd2eA6ehylB4Gnz+7K96KzdR
	FZdfsn/CmIUFgPiso+FuwrBo+gP7dMlTnMRH/64DNbgzrpL5RVBmqvqPiQlZQiR3LVbQXh+sYqT
	RDqxL8CImcZiFZMzTaq3nePKU=
X-Received: by 2002:a05:6a21:7316:b0:3c4:de3:816c with SMTP id adf61e73a8af0-3cc71ed56f7mr4073890637.37.1786692806222;
        Fri, 14 Aug 2026 00:33:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:7316:b0:3c4:de3:816c with SMTP id adf61e73a8af0-3cc71ed56f7mr4073819637.37.1786692805793;
        Fri, 14 Aug 2026 00:33:25 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:33:25 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:41 +0530
Subject: [PATCH v2 10/15] dt-bindings: clock: qcom: Add Kuno Global Clock
 Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-10-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692714; l=5559;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=RDAyPUHQMKd0UCR0T2UhbFhR2yIFwf1uGVlsiEAfgzI=;
 b=UtRhbW+tGvbmJCG5ZtNLc/4AeeCek33ST2p1FOR5EXuF62dWA6YOgpMZXUiPfLfuKFzWtpf0z
 e5E/P+JXspLAq+QNE/gdi706COkQcU044BcOLZXRJSjdCOjr+Z/4A7T
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=NsfhtcdJ c=1 sm=1 tr=0 ts=6a7ec4c7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=55wsOiQBk-PRjUXo0ZkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX6tAEs9PJaJRW
 aMyIn7aQDhCJN82gC7ECC7ThPlpLmc6wUREdnVDPjDF64Q1i0gGqMz07/YL1DJs8jvSt+wSONEs
 6sMVm0thilEXcSWy3DeBKdp70moMNN+wbZStZGbelu3JAJKpRp+TIqxzUTwgIxmVC/xt/uYWi4q
 ZiWDLq9zZ/e6Q+0wc5Ool59S5uPvfRS8bgATPJdjnP+IXLVHRptNiAheO499A5U7BMmFcxeGnB2
 lNQgmRgpj/dSUWcU3TxW3X2W6wDuQJw3QHTUhjjB+dgAxpw0EybZcxTEQi/IniqKTFNq78gBpAy
 GSp66svj+S0/7DKptGEKMveGx0tSMatSrkHjVRnk0vYwPNabCr0TBMbpcl6lmjDKUxD3nCWIvf5
 f75d/8yDue2u2Ijx+WzWtKG4VxvhvoVAas+fBtwaRsgYLEJoj3Az9kGlgnubeUb7siWY1DucatC
 FJ8QDfyRyqj+cfMGksg==
X-Proofpoint-ORIG-GUID: dgt16pS01PhAhw-ImOrqbSRAl5tkF0Yn
X-Proofpoint-GUID: dgt16pS01PhAhw-ImOrqbSRAl5tkF0Yn
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX8i7ZF2YwPAXV
 P47XTKfS53m5Xvf30RQgOCVA9S2bLEgE52Ds4LqvrEeLFTyColyIjfB7clA577w2vJNBWBGLh0H
 dDM+4852Iu4qxQ9cXDll9uo1ssLe8jU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_003328_733197_6CD2EAEA 
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

Document the Global Clock Controller (GCC) binding and associated
clock/reset IDs for the Qualcomm Kuno SoC.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,kuno-gcc.yaml   | 50 ++++++++++++
 include/dt-bindings/clock/qcom,kuno-gcc.h          | 95 ++++++++++++++++++++++
 2 files changed, 145 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml
new file mode 100644
index 000000000000..c4919b518693
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,kuno-gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on Kuno
+
+maintainers:
+  - Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
+
+description: |
+  Qualcomm global clock control module provides the clocks and resets on Kuno.
+
+  See also: include/dt-bindings/clock/qcom,kuno-gcc.h
+
+properties:
+  compatible:
+    const: qcom,kuno-gcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board active-only XO source
+      - description: Sleep clock source
+      - description: PCIe pipe clock source
+
+required:
+  - compatible
+  - clocks
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@80000 {
+        compatible = "qcom,kuno-gcc";
+        reg = <0x00080000 0x1f4200>;
+        clocks = <&rpmhcc RPMH_CXO_CLK>,
+                 <&rpmhcc RPMH_CXO_CLK_A>,
+                 <&sleep_clk>,
+                 <&pcie_pipe_clk>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,kuno-gcc.h b/include/dt-bindings/clock/qcom,kuno-gcc.h
new file mode 100644
index 000000000000..bbaf1799590f
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,kuno-gcc.h
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_KUNO_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_KUNO_H
+
+/* GCC clocks */
+#define GPLL0							0
+#define GPLL0_OUT_EVEN						1
+#define GPLL2							2
+#define GPLL3							3
+#define GPLL4							4
+#define GPLL4_OUT_EVEN						5
+#define GCC_EMAC0_AXI_CLK					7
+#define GCC_EMAC0_PHY_AUX_CLK					8
+#define GCC_EMAC0_PHY_AUX_CLK_SRC				9
+#define GCC_EMAC0_PTP_CLK					10
+#define GCC_EMAC0_PTP_CLK_SRC					11
+#define GCC_EMAC0_RGMII_CLK					12
+#define GCC_EMAC0_RGMII_CLK_SRC					13
+#define GCC_EMAC0_SLV_AHB_CLK					14
+#define GCC_EMAC_0_CLKREF_EN					15
+#define GCC_GP1_CLK						16
+#define GCC_GP1_CLK_SRC						17
+#define GCC_GP2_CLK						18
+#define GCC_GP2_CLK_SRC						19
+#define GCC_GP3_CLK						20
+#define GCC_GP3_CLK_SRC						21
+#define GCC_PCIE_0_CLKREF_EN					22
+#define GCC_PCIE_AUX_CLK					23
+#define GCC_PCIE_AUX_CLK_SRC					24
+#define GCC_PCIE_AUX_PHY_CLK_SRC				25
+#define GCC_PCIE_CFG_AHB_CLK					26
+#define GCC_PCIE_MSTR_AXI_CLK					27
+#define GCC_PCIE_PIPE_CLK					28
+#define GCC_PCIE_PIPE_CLK_SRC					29
+#define GCC_PCIE_RCHNG_PHY_CLK					30
+#define GCC_PCIE_RCHNG_PHY_CLK_SRC				31
+#define GCC_PCIE_SLEEP_CLK					32
+#define GCC_PCIE_SLV_AXI_CLK					33
+#define GCC_PCIE_SLV_Q2A_AXI_CLK				34
+#define GCC_PDM2_CLK						35
+#define GCC_PDM2_CLK_SRC					36
+#define GCC_PDM_AHB_CLK						37
+#define GCC_PDM_XO4_CLK						38
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK				39
+#define GCC_QUPV3_WRAP0_CORE_CLK				40
+#define GCC_QUPV3_WRAP0_S0_CLK					41
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC				42
+#define GCC_QUPV3_WRAP0_S1_CLK					43
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC				44
+#define GCC_QUPV3_WRAP0_S2_CLK					45
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC				46
+#define GCC_QUPV3_WRAP0_S3_CLK					47
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC				48
+#define GCC_QUPV3_WRAP0_S4_CLK					49
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC				50
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK				51
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK				52
+#define GCC_SDCC4_AHB_CLK					53
+#define GCC_SDCC4_APPS_CLK					54
+#define GCC_SDCC4_APPS_CLK_SRC					55
+#define GCC_SNOC_CNOC_USB3_CLK					56
+#define GCC_SYS_NOC_USB_SF_AXI_CLK				57
+#define GCC_USB20_MASTER_CLK					58
+#define GCC_USB20_MASTER_CLK_SRC				59
+#define GCC_USB20_MOCK_UTMI_CLK					60
+#define GCC_USB20_MOCK_UTMI_CLK_SRC				61
+#define GCC_USB20_MOCK_UTMI_POSTDIV_CLK_SRC			62
+#define GCC_USB20_SLEEP_CLK					63
+#define GCC_USB2_CLKREF_EN					64
+#define GCC_USB3_PRIM_CLKREF_EN					65
+#define GCC_USB_PHY_CFG_AHB2PHY_CLK				66
+#define GCC_BOOT_ROM_AHB_CLK					68
+
+/* GCC resets */
+#define GCC_EMAC0_BCR						0
+#define GCC_PCIE_BCR						1
+#define GCC_PCIE_LINK_DOWN_BCR					2
+#define GCC_PCIE_NOCSR_COM_PHY_BCR				3
+#define GCC_PCIE_PHY_BCR					4
+#define GCC_PCIE_PHY_CFG_AHB_BCR				5
+#define GCC_PCIE_PHY_COM_BCR					6
+#define GCC_PCIE_PHY_NOCSR_COM_PHY_BCR				7
+#define GCC_PDM_BCR						8
+#define GCC_QUPV3_WRAPPER_0_BCR					9
+#define GCC_QUSB2PHY_BCR					10
+#define GCC_SDCC4_BCR						11
+#define GCC_TCSR_PCIE_BCR					12
+#define GCC_USB20_BCR						13
+#define GCC_USB_PHY_CFG_AHB2PHY_BCR				14
+
+#endif

-- 
2.43.0


