Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D995AD0C851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 10:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i2O+ICvJOvqFIrMEVsuBmNNVxd9PD5RyBiEWFT9yHBo=; b=UyK8qkENn4DCoHlMEamXNhgF0y
	fEpgNdfBhjrbhMfLqPDwq2TOhFu98i6b/GjFmmIoxhGAdMbyRXIcmuPhQwMwlUztea82TF97G1kwC
	bG+ZIPOOwsRiXNCLqluSVfCgTIfMs8aAxiTh5aI5xEMPQ+lkV4QihICF0JaPxeEGwSqY3+z+YJRFV
	QgtZ3bTHbQOHWJ7xgN9/caMmMHy6VVKwub+vzxiO8ZgPgcU6Nd9jz5qXuUQVRY9kztQ0mgSbwmbo6
	2buLvtapcsHgpUQaRAiM0X2+DHbFSeR4Xv3E0xaMnamXEwWnkHtfggp+vU5k2POfcdFpVjvAUksXH
	deMLh3AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc7d-00000006wai-2U06;
	Tue, 13 Jan 2026 10:59:40 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc7a-00000006wYN-0LV7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 10:59:35 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-43246af170aso3564027f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 02:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768301972; x=1768906772; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i2O+ICvJOvqFIrMEVsuBmNNVxd9PD5RyBiEWFT9yHBo=;
        b=jAu/Qcag6P2MlrMMXGaXX9xjIA7EypKgGNNaKPawrDlv0GlXj/rbfYdiHhL3RJiPtb
         r7WhgqgE1NMlyN2kDUwh7XVOzGGJl0DjtTnD/TV+NVNZwe2FuB1KnQ4qmH1GzMwMz9/f
         s4t2VYRWlkN6gc5NYgepcBRFJmv7aYl7zSeARxuUY8Gph4N4hCOSystz2xGqapN/m3wb
         Xhz9SCdxEaAKfj1qM8ebpdD8AHXDnBky1XabnTjmfy9rxcYg9BHUGB1V7tehjvUByPfl
         mhqPmsRTbmxpPFjc/1LL1mY5gox80zUbT4vr2Rb5Vj4KhkJXoK6bF91xF1RK8CU3s3rJ
         owwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768301972; x=1768906772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i2O+ICvJOvqFIrMEVsuBmNNVxd9PD5RyBiEWFT9yHBo=;
        b=SR6MftbzSMcb/d4cgS4c0PBxcTkdXiCyXwhNdGoD07Dr1ayXY7iogg6Qqnzckh/ltE
         TaktF8Y3gO46jW+/b0YJCjwOuoF84mcTmm9PTaYxqXX/xpgYAaZ4jnBpUwXzjAH+2sA/
         +3TJFfIVnfFr/RFX682vFORQlFiCmvT0DoPC2jGSPdn5KGPbPoG9uAdrfe6xxnHEZZT5
         7K/KShbhppY69x+j3rtbgv5LLpbfaCsR9B+Eia2Z1nuo63rpMe7cylLMyjFH60R1roj+
         0xEcUD38b40nLmJyXrx/NxIc0mwXVbXCQb0FWAqHX2/8NnxeoVR5iycAIfiqu9QKXc9t
         4tWg==
X-Gm-Message-State: AOJu0YyTOykdcBZJ99aTyyqTPIR4NDYudFRPZZ36jFXg5+jDOgiB2j4x
	DGlGlkph7cPHDD/o/2IaZJmdTjNYxdjjOo8jxf7DrvfXsEvhTeULHg5w+vAAkQd4rI8=
X-Gm-Gg: AY/fxX5TQ27mhEUXFQskQ28+8LYf1GzGb2UpDHr0g74bope3kq2Vna1638nbi9rSy1c
	+szVHa1AnQi7UIMfI5ciNb2wnl/i/Na1NhxtAj4YVHkOzGVr0/lSPiM65CGUWW5LTbp7kAUfH8x
	zO/S7l50fdGbmzjgQG/EMqCLAxKE/aG8uXWoDSVgzzFDAB8FN8NkWFMpt2QJX49hSnAeoTAtsgT
	17qLTCYrw18lqLo50P8csSmzCJucSPEMr9obE6KSQse70J11dv19vkMRzKTVkI/47l+4xR1y90q
	qq8kS0CKOvCgrwrspLZ/bhVGvnvqA/MesCYrm4ISnqqA+lHygK9fcwFn5rycjrd6oAwGJ3T4r8j
	4PfDDPgi0jXk30vrZVikvLaPHNK9TwrqHaC2smR1AhxiQ2fyRTTV7M8hEMPB50RSFpu/A8O1eip
	yXkZ/OmAjqQgb2ckPm6kEjgea/Wr3ut+Uskfa+FD1ZTGw=
X-Received: by 2002:a05:6000:1862:b0:432:5b18:2cc3 with SMTP id ffacd0b85a97d-43423e7458dmr3411889f8f.4.1768301972016;
        Tue, 13 Jan 2026 02:59:32 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3122:c601:3454:384:9eef:8e29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm43729881f8f.31.2026.01.13.02.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:59:31 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 13 Jan 2026 10:58:59 +0000
Subject: [PATCH v3 2/5] dt-bindings: clock: google,gs101-clock: Add DPU
 clock management unit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-dpu-clocks-v3-2-cb85424f2c72@linaro.org>
References: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
In-Reply-To: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 kernel-team@android.com, Will McVicker <willmcvicker@google.com>, 
 Juan Yescas <jyescas@google.com>, Doug Anderson <dianders@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3729;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=2yubVwhwO7ns8FZQYj8MKduIIlis7alJ8q+O1SQ6y/c=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpZiWOE3nOy29Cjg+ucJWaFXVn+xlXgJc+sb9Yx
 oBWrDqH0GyJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaWYljgAKCRDO6LjWAjRy
 ugTlD/9NkVH/qEv0c/R6L8J1N386xpJvXJ4ZWLMUvx103TNRGX8cpOZTDA81xch3tj2qyam6OGE
 pxcoUYH6SMoXuiCGb/SpiF2EbtZSV4wWHn4DaeX7KjIGwbBOanMVstVMDNBNJnQiHyODT347Wq+
 LxHO0WRSf8WGhZiHPQIkdGXw5wRTqMLQviyLFmg1f8DpQO/vUuKsJHHVrkiARSvnREj/YztvV+u
 EjPFDCTQ9kojSCduthNhE42DcfdD+QOiSj8mUsh9z4YfenGtz+C53RTA1V8FxJdW/KfYLUMGyhU
 LWOfo8YOBgjGqPKHa7YXXFVXkWJ+w7oHhedfeLiRg+gZ20/FtJ9Hev++WrN60wmubxuSenKoy4P
 mFAC72neP2rpiqRwXAHPdv+y4xfqq/06Yfjgv2tPbzlBoXeOVjKxPJLYDqhMvLP7CmRgxZpd2p4
 qFppyKsolpBsedaYne/JSqDLLs8ekCUIhnBaUECa/cpsJ+JosOYIukgfPkRoXGWJLkPFBUFxI5D
 8KOO2vQTbwQDFWZOWACjTONcSwfyNoXQRvvbA0M78O2ITYCM/96rXA749a5hxiDRB+7TRQtQu30
 wrQz2ZIALpR99tRvznwM7o9bv7Tm6otahymTRAwmB7GJidt7vYtcAsJo2YNXfkckCTzD6tGK8is
 nEnOE7heVyTB/2A==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_025934_152226_645D1A6A 
X-CRM114-Status: GOOD (  10.13  )
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

Add dt schema documentation and clock IDs for the Display Process Unit
(DPU) clock management unit (CMU). This CMU feeds IPs such as image scaler,
enhancer and compressor.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v3
 - alphanumeric in gs101.h header (Andre)
Changes in v2
 - alphanumeric placement (Krzysztof)
---
 .../bindings/clock/google,gs101-clock.yaml         | 19 ++++++++++++
 include/dt-bindings/clock/google,gs101.h           | 36 ++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
index c41043c7d25200fe947a2ca5b2780e4dd50ad433..5122c5827718a3e3defbbecd926ec40e16574529 100644
--- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -29,6 +29,7 @@ properties:
     enum:
       - google,gs101-cmu-top
       - google,gs101-cmu-apm
+      - google,gs101-cmu-dpu
       - google,gs101-cmu-hsi0
       - google,gs101-cmu-hsi2
       - google,gs101-cmu-misc
@@ -82,6 +83,24 @@ allOf:
           items:
             - const: oscclk
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-cmu-dpu
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (24.576 MHz)
+            - description: DPU bus clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bindings/clock/google,gs101.h
index 442f9e9037dc33198a1cee20af62fc70bbd96605..7a14dcb9f17b1e95d792b0c29fc6b8bfdc78213d 100644
--- a/include/dt-bindings/clock/google,gs101.h
+++ b/include/dt-bindings/clock/google,gs101.h
@@ -313,6 +313,42 @@
 #define CLK_APM_PLL_DIV4_APM				70
 #define CLK_APM_PLL_DIV16_APM				71
 
+/* CMU_DPU */
+#define CLK_MOUT_DPU_BUS_USER				1
+#define CLK_DOUT_DPU_BUSP				2
+#define CLK_GOUT_DPU_PCLK				3
+#define CLK_GOUT_DPU_CLK_DPU_OSCCLK_CLK			4
+#define CLK_GOUT_DPU_AD_APB_DPU_DMA_PCLKM		5
+#define CLK_GOUT_DPU_DPUF_ACLK_DMA			6
+#define CLK_GOUT_DPU_DPUF_ACLK_DPP			7
+#define CLK_GOUT_DPU_D_TZPC_DPU_PCLK			8
+#define CLK_GOUT_DPU_GPC_DPU_PCLK			9
+#define CLK_GOUT_DPU_LHM_AXI_P_DPU_I_CLK		10
+#define CLK_GOUT_DPU_LHS_AXI_D0_DPU_I_CLK		11
+#define CLK_GOUT_DPU_LHS_AXI_D1_DPU_I_CLK		12
+#define CLK_GOUT_DPU_LHS_AXI_D2_DPU_I_CLK		13
+#define CLK_GOUT_DPU_PPMU_DPUD0_ACLK			14
+#define CLK_GOUT_DPU_PPMU_DPUD0_PCLK			15
+#define CLK_GOUT_DPU_PPMU_DPUD1_ACLK			16
+#define CLK_GOUT_DPU_PPMU_DPUD1_PCLK			17
+#define CLK_GOUT_DPU_PPMU_DPUD2_ACLK			18
+#define CLK_GOUT_DPU_PPMU_DPUD2_PCLK			19
+#define CLK_GOUT_DPU_CLK_DPU_BUSD_CLK			20
+#define CLK_GOUT_DPU_CLK_DPU_BUSP_CLK			21
+#define CLK_GOUT_DPU_SSMT_DPU0_ACLK			22
+#define CLK_GOUT_DPU_SSMT_DPU0_PCLK			23
+#define CLK_GOUT_DPU_SSMT_DPU1_ACLK			24
+#define CLK_GOUT_DPU_SSMT_DPU1_PCLK			25
+#define CLK_GOUT_DPU_SSMT_DPU2_ACLK			26
+#define CLK_GOUT_DPU_SSMT_DPU2_PCLK			27
+#define CLK_GOUT_DPU_SYSMMU_DPUD0_CLK_S1		28
+#define CLK_GOUT_DPU_SYSMMU_DPUD0_CLK_S2		29
+#define CLK_GOUT_DPU_SYSMMU_DPUD1_CLK_S1		30
+#define CLK_GOUT_DPU_SYSMMU_DPUD1_CLK_S2		31
+#define CLK_GOUT_DPU_SYSMMU_DPUD2_CLK_S1		32
+#define CLK_GOUT_DPU_SYSMMU_DPUD2_CLK_S2		33
+#define CLK_GOUT_DPU_SYSREG_DPU_PCLK			34
+
 /* CMU_HSI0 */
 #define CLK_FOUT_USB_PLL					1
 #define CLK_MOUT_PLL_USB					2

-- 
2.52.0.457.g6b5491de43-goog


