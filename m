Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE464CFA448
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 21:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4P55c+msKlLldk8RQlFeWnhvqXv9aJ+FbKMuCPpgPH4=; b=a2W8qUh9qCTshToosOxuTUodzG
	IaPaAP/DOEZ4vvS8fnik5EeI0toNUdhZ4bx/ppgpI4S1421kSxaJvgETymGgcHtQ+AEEE6Io4Kkne
	YBg08eis4Q0uOzrGK46fmGPtSgM1Hwe4DfM6hZR1J+j9teWzVuV25dEweeJ05HAq5rHrOA+e1YMBC
	HttJCnPJCyWjxmMTAQEB9o0eO5USDU0rh5dABQAm0VMEKt+m006jfeC7a8E3qipgl6fnuNErH+sEV
	MWJi+p+yYD9N9O+YxqpaPxAye0SBRna4znMOf1SiyGxJmzeNPF3XQQLZ9X7rpTGcWoWpEB7YaYGCA
	A1bAGPhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMBrM-00000007OtG-42Z1;
	Thu, 20 Nov 2025 21:06:32 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMBrG-00000007Oqe-0UTY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 21:06:27 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-42b3d4d9ca6so1184854f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 13:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763672784; x=1764277584; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4P55c+msKlLldk8RQlFeWnhvqXv9aJ+FbKMuCPpgPH4=;
        b=d00nJtWtl1v9le09HEdmO3Z11rCrMaiNq1+xNK00uGDPsPEx85CgbKaqnCCsOKxSH0
         F4eLpkSb+WQAi4iwgSTBAriAmxp1joQxgr9Ns40qXFVpvmOdIOOITSvcGoz1admrjeD8
         mPuK4vpeVec86/B6qBNxojZng2pvMycj7oZdQ8rycrasEZ9+oXB4x7YNvZLpZatDtW9J
         Aico6Ahhks6ncUlrkTLKVOyfEf1Gc5NUmFWxditChtPixaZ7mRiwdmEQd3PG2fxOK0NF
         lE86S0YMmC4aG6JAIVwtfcnMv8AMT0z9FrtRAlVsNlCVLOs9QeSrKKfDygnmY8g1MYwL
         WFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763672784; x=1764277584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4P55c+msKlLldk8RQlFeWnhvqXv9aJ+FbKMuCPpgPH4=;
        b=vDyuf1vT1t6PexdFLXGfUdH1PJhcqEsTp1WArpV3MFc8toV+9cznNFT7gP7B09H7Pz
         oihvcVZhalGR5PJwQ8Lov1R8YOV/DP6mKmlDIzVWdbYDezXwIU4yoFJDZdIUykb58wf5
         h8WPFWqaD6/pdo/vdy+alm6Berd6rIyth9bVjN8OM7imPtoEZbIa/VvAYNHnxJ3LpDgG
         e2lN+a7L02Pkbo6jA2GJX5IRMdJ/kKzBx6kcfVZ7vaNi0Lecm5GjY0B3xuv/0esaCUZd
         DJiJIPHjzNldcuPbHUufHUKOyjpjC3TKZa/5a3yS8ivJhHu7BjU7plmdd/2jmEvdWuYD
         m8Iw==
X-Gm-Message-State: AOJu0YxgUglulTi+uqsf6CyG4ub46Ab2fn/OVeXpwmhCmt9mWI6ylFm5
	xp8th29F7OJO8Cko0Om5AFfoiMtqP8H4fPKwYJq3ECPD4M6yMXDDgH69dGOJi2mL4IU=
X-Gm-Gg: ASbGncvYJepl1HFUCXPgYzaU6zbuBf/BjBjflmJvATiBK3zKFJ5OQ5RSZ21jE4jvJ1p
	ZQZOOPAEA/L8wK+bXXYaLbWLTCwoaARmA56GZKkekgwskCyYjGJgnvNvYeWVYTLuPmB2pmk7sTh
	+gK5M9iL/218GgIGviKjjHgd0ZgkZRoyPoyMoPS8Hvwv1CXanTywetDcVl3eYndnHiTB8sRfBPv
	jGJ4rn8E+WOuF+ExuRhAgm/xvDvfNrAhMmmHjtqOCDKXNWo9aCCSDsMcGOZlL6tj7G7ZnKLkit4
	0+GDza9MblNgoTuAfzsxr+24MtWHYC6m6eT+6UtUjIki08fYhbLbip4IuX5abc2KakQ+c//xRzS
	X0jDCMZv4p5vSPnyV8mxApziaM3137/wbCi+1YcxnzXdbvlzbpQMd24K293jmUmBCR3B4ndltsg
	PItDs+JxE6GNgJfF218xchaJDqlb2/huTcALvi074=
X-Google-Smtp-Source: AGHT+IGIJwaSzwyO+MTFf7E/UmXMY9JoeBa+FWmaF27jX5h2wNx7Xs7QpA0f1RkN48GTo1rGH2syUA==
X-Received: by 2002:a05:6000:228a:b0:42b:3090:2680 with SMTP id ffacd0b85a97d-42cb9a0c90emr4361812f8f.10.1763672784217;
        Thu, 20 Nov 2025 13:06:24 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([150.228.9.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e5b6sm7321287f8f.1.2025.11.20.13.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 13:06:23 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 20 Nov 2025 21:06:11 +0000
Subject: [PATCH 1/4] dt-bindings: clock: google,gs101-clock: Add DPU clock
 management unit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-dpu-clocks-v1-1-11508054eab8@linaro.org>
References: <20251120-dpu-clocks-v1-0-11508054eab8@linaro.org>
In-Reply-To: <20251120-dpu-clocks-v1-0-11508054eab8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3579;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=AEAW1zkV8OeqaCPbh6SWv6MdSofvSEdgd3/hIrLWqaw=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpH4LKxot89zhu24NNYx1+eiy+Zwr9lORhgN/Jz
 xQZOkSi7H+JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaR+CygAKCRDO6LjWAjRy
 uo3aD/9g9k0zz3UXUDo7aMqJSONMZmDHvPz/woh+qQn2TNuKjaDa146nRp9NPCQVUIwKcDx6aRU
 pChHevHf+p7y3yDwltHYJenGXOth8wgzZKHFnIUiehTSnqMC2tPuCv7mEbDYCpYfEUrql2NQX4M
 BdvAJZs0AFMQzRijdxZyBJi5awaVcg5+jRqinP/EnCYM28jTGlSn7zWDdbrehJQ9YJSCcUyjTUg
 FtkaKbzJ9XNnbBuO56V0MamL3YVb4gwJLt8Ajv/2RiWvl7b/nFl/ByXfApCLBYYjjhq+7PJEx8s
 RcJ5OvrRGyyzd2m39Ix6Lng7/F9XbmuDfPi2lq1LkG7uEqeIXOyL2GYDSMTzOj/EdRMfSjL8Stm
 Bh8p+ZYAHin9iW/SSfSiqzzwzDkjfDUR0Nj1uBRfEv9KfSUCqKuTNda3Rgx1f0JUv6AiAx5zPls
 udrSZqPNh0mN3adzPUamcGaAKOa7Khlhewh2kFhimdhYo2zziABZiyIM0Co8Q3QABOCuG9MxT0X
 bxJsEJKopm/ZVPcKEh8UAiH7QRZc9CFLonoNvVQ2xCZcS72LIiijR1BSjSuXfFvQ2hUXgoJd+xx
 E4KXBF2E9fAIN9Rvi7Y1Pgh30pT8SWTMTLkKwps2dWL1Sb8Ovv22FHNQQpWOAxATgUmswVnhDrP
 uxGprmJfFeMEtww==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_130626_185604_99E72273 
X-CRM114-Status: GOOD (  10.17  )
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
 .../bindings/clock/google,gs101-clock.yaml         | 19 ++++++++++++
 include/dt-bindings/clock/google,gs101.h           | 36 ++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
index 09e679c1a9def03d53b8b493929911ea902a1763..1257be9c54a42ea2387e1112e53b5ee1f03e09f5 100644
--- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -34,6 +34,7 @@ properties:
       - google,gs101-cmu-hsi2
       - google,gs101-cmu-peric0
       - google,gs101-cmu-peric1
+      - google,gs101-cmu-dpu
 
   clocks:
     minItems: 1
@@ -171,6 +172,24 @@ allOf:
             - const: bus
             - const: ip
 
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
2.52.0.rc2.455.g230fcf2819-goog


