Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36513C9EC94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fm9LC7Q6pHM3iIznNKKU/85q/p2bv2RihVpSb7jGoVU=; b=zEnkySxVFlHwZLWcCcsCPTzDUd
	vNtDQpDJnzuTfuJlI7dmpgFVJZpVP2Zvi1MVc+W4c2uzrGD5d234vGEiiJ5od007nXnMUU2Bay9tF
	duYV1R9CqMqoB9ig8u1qIBRvT16aFyJgzS3vbsE2SI5vYgCgIvifiUyi586Py6842DpPcNBv/IqYV
	ehPEHfj1mUN2hEdfpmQx2nPUVf0FBtahG7jVpHfqCcWyOct0nWulXcGKzbLGAIL3LiiwUKkQH2h40
	jrCQtfGmdNIo9KzTziMlBmkObAeoUGUVVVyBt/m+e2VlhMP8AAWct9wzvDoAmJomzdXNEdtpYQgaF
	PziB9g7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIjD-00000005VJV-1ErG;
	Mon, 12 Jan 2026 14:17:07 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIjA-00000005VHe-12RB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 14:17:05 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-430fbb6012bso5188608f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 06:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768227422; x=1768832222; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fm9LC7Q6pHM3iIznNKKU/85q/p2bv2RihVpSb7jGoVU=;
        b=xypl7Bzom7sjVcQ7jwSBmQ2iKmSZB+TKCmTMGWEBy04zZ/Vf824d1wKzhvo6+bSdqT
         3NqoHO72FhdBqPImtvAwyntnTtEjQ5+VepBnce/LL3cgOk96mvROrOCH67bAWozFX6vi
         +SYyyT20E8V4J6eid4Vn13qZXZ78Qc1t59ZKcStm7Xt7ZSvLxVdD0tsGiKfdvA3JM5Ho
         dRPBG9zqe9+smzmy0hkFA/L6NXICt53zAH34InPM9eESwSczW2XzU5949DJlAWAWzQAA
         nLnJCCiZd4f87vE70jt6Kpc+l7BJDt6aei1RbdOTzGl5i68QrTjD/RerOo+n9B4drv/g
         Ngew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768227422; x=1768832222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fm9LC7Q6pHM3iIznNKKU/85q/p2bv2RihVpSb7jGoVU=;
        b=h/MLZdT7Px3ESIl5fd+RC0cJlo+fssWlU3TRR7HZNHm6f6MYW3eqp9uTO4Z53vJ0Qa
         A5u/0MwhS4E1FNPA6/E11Lwv24NrTJYkqHGkykkjnRR6mPzZPkrg6NaQCAy1QSW16mdr
         /CtY3De5KgHX7J4OtZT6YcoeKlSL9cSJq3yyNWLBSx5K7a9RN2x3eSTia3JsgOVB9jgr
         Mk16TZmc44vflCH8zwIEpbzkZAjH5gtB9jkeU9WJtWeRCof2v+RQUjIXqJjnLf1dk+2d
         JMVceXcFdNT4Ai1ls/T8vpc/n8vs9Qeg7ocuWnLM+zT1EOO1tvff2uOyIent9r2RL2Gi
         iR2g==
X-Gm-Message-State: AOJu0Ywv6NGpthqbjJgc69wnLwcPWLAq26bID7boNyU/EZAWQPkw5j+1
	apvAwnY5/Dg06UYOBCCBxNWXjVGt98HX+IPFEP9472R4fsU4G/6pvs9itjjaiGSq0qE=
X-Gm-Gg: AY/fxX6Xsh9ZZBlTyOianqkVURCNS5CHzSbrokikRJDc0SDqIVVPvB7wJllx/u6ZbNb
	f8O8lVKIlUgxI2yX05rk7zF5xmAKiyOXhaV++SypYMA2SKWfWI3OC19KdKzQ3pY3SoHtR8EzWem
	hVXGzCfyAL1J/PX1mSGIvfCcQTVJSHg2lb5yPPmXH+QcJf27QuA4NNkgKtY4znq0vN/YNfb89tt
	sYfkubzxmYQn46h2GtrELxrzm+KN/v4Cu+8O9QyPEdMQRkzjuciHy8xy6fi2AuYeLVB0uh/O4Si
	73u31QJmIxGBMgIhP9Ne/t2EX/Th4832vHyUdvx2HjlrIpWGalIjNqX1kmX/mzhpqJj8i0CMtDF
	n3r/p9YRCyX6XRth+JE1bFZsUPD31fwhqLrqFTpCjXAJI2J/lqZ0dMWgVyuwKK3tds2GR3dVW22
	00sdxFwGtfEuzvOy0MKnUqyWMZ5wNYKsKYVU0a7DTfkzz7
X-Google-Smtp-Source: AGHT+IHNlPFBKNz+2ZRZZ9t05QHLsdHn/WFsZVu8yHrex7JrSPt24YIUeOWyhidmhFu/ilHAQpsbhQ==
X-Received: by 2002:a05:6000:420f:b0:430:fc0f:8f9f with SMTP id ffacd0b85a97d-432c37982f5mr20564928f8f.37.1768227422147;
        Mon, 12 Jan 2026 06:17:02 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3122:c601:4c43:39e0:348c:a72e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5dfa07sm38705096f8f.25.2026.01.12.06.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:17:00 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 12 Jan 2026 14:16:49 +0000
Subject: [PATCH v2 2/5] dt-bindings: clock: google,gs101-clock: Add DPU
 clock management unit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-dpu-clocks-v2-2-bd00903fdeb9@linaro.org>
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
In-Reply-To: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3650;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=7vYnFiBkpwExnJ92QT9aN8nzk29pJDjHrcs5omHTLbU=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpZQJYMRh2zG+s19zqzkFlElB/8ggLdROb0DWf3
 IZY50tM8MWJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaWUCWAAKCRDO6LjWAjRy
 upf/D/9HyZdUMWgp/w6iAfYCSSZNOiTE9Iz9XR2ivysdHXnMX5se8DERFKYE4ahcwyOy1sHcoHv
 suvx7LBNBJLMthfV212t0qqnpn8caU8aB5APStGflaU/Fl2oe46L7EeLx72ZzHgLqbIyE2vkSdA
 v8zZScvfTtAw5Z6HnxATM5CmqeJ4H9ar7nz1isKJe2iIOh6KQEtUhuUyozDgtN9s3gHUHSip99s
 kqHj2lE59O9G+kUSGAH2xUEusGhsxQaHrTCUUx0pOF0WilGHYNWWR/xkXo9b+9CMP2wc/8Uhgsw
 m05GuDzN5GTRXX6wmNZ0c9iw0FXlr47h5HJxks3QBVENp9ogB/FNR9EO9DT1jnbi5HW6WCFaHCp
 AURti+0o8r7UNSgUfbkrH7yLpBG28HkwlWdtcxaGUpe3HbXMcWjnqU+l7mi15+JrrNRiFbIGVvl
 lFUFdSj5MmXKcVgYs27YguKBtK9KI2fqjBgH2ihHfSTs4FSxClMPVl6JGyVbfZiulqKbUZIwjJO
 0EtGiqvV1Cg0a3cJ3UG4jqeVQjCfhADTON9RSqx2XRmw/jCqqZwLIiKFDBNXr7OliUuZ5Nk6jCx
 W3Hj5qOsNg78WOGwsoKH97fItIXpFNWtINrya6M1tcU2HwMZRZ7s9mNL3E04Tdzu0+pRPlNerfi
 nczmTY7IJyb73mg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_061704_314913_2C65CC32 
X-CRM114-Status: GOOD (  10.47  )
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
Changes in v2
 - alphanumeric placement (Krzysztof)
---
 .../bindings/clock/google,gs101-clock.yaml         | 19 ++++++++++++
 include/dt-bindings/clock/google,gs101.h           | 36 ++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
index a8176687bb773ae90800b9c256bcccebfdef2e49..00620ab1872db0489dce1823ab500c0062b651f0 100644
--- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -28,6 +28,7 @@ properties:
   compatible:
     enum:
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
index 442f9e9037dc33198a1cee20af62fc70bbd96605..4ee46503663c1f8d9463536c347de5d991474145 100644
--- a/include/dt-bindings/clock/google,gs101.h
+++ b/include/dt-bindings/clock/google,gs101.h
@@ -634,4 +634,40 @@
 #define CLK_GOUT_PERIC1_CLK_PERIC1_USI9_USI_CLK		45
 #define CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK		46
 
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
 #endif /* _DT_BINDINGS_CLOCK_GOOGLE_GS101_H */

-- 
2.52.0.457.g6b5491de43-goog


