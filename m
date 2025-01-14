Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B761E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 09:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=siX7FCTD0wixOLRdc1jnWvPAPiYOmQR7y0biY9ez4Ss=; b=ZwOWi9WCcCDhem/oDY7gNuxLgO
	qiG2qQ6kM9YEeF7/vRJ+3W76KWc9CUvAATd+rdan0FDnQVFpr2oTgG60IyE6s1bnAUHu3MwWNRKz+
	9OuAYgfgoh+h5MpzpwwjI6VtUWBVNr92Xr4ZEVVz1hOdzF1gkHYgQ1j5t5SEGcka+0q9QIfL8LAbL
	5xxzRitzHjAkmtDtyvAma5Dmsl5AQNjL4qcTauEi5DihMXRL5J+mriIH9PqxL1Z//kSZNVDBTb7mI
	xgiR06Lw88jxBH2xBXKLPd+QijpHizEmLr50pZqW62t8Hx88OcS1B6tzAKA09qbqiW2+ElDcOPuJq
	x2eJMfmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXd2h-00000007vkn-0mgl;
	Tue, 14 Jan 2025 09:16:59 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXcxV-00000007v1S-0fNH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 09:11:38 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d437235769so9065743a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 01:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736845896; x=1737450696; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siX7FCTD0wixOLRdc1jnWvPAPiYOmQR7y0biY9ez4Ss=;
        b=Chju3VbtMf5RL1xb632kuUWRUYZ4o4tMxAz9P1+Ozp9SSxzCqnjiVUtFhOjDZN1VVG
         kddPO+53MVk31xeNZBcnpKrpIeWaJcR2FdnKS/hhNGBbGFnlFprigzED4va/NgNcizym
         WPSlLdDKmi9hrZ7IhTteq2GngdkwA5fKb+d9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736845896; x=1737450696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siX7FCTD0wixOLRdc1jnWvPAPiYOmQR7y0biY9ez4Ss=;
        b=JKqvVNNmX5/eWjLkjnim1Y5lMEoHU92RnOiaRBhU+ae7leG55+yJnlAxLf4p2yGK0N
         7tnmWby/gQOPLz6XVM27O2iL5uP6N9tFa7FpQXfc17uw7n5ZVKOu1KrQCf0ew1VFZf2F
         IAGs3ME1r56hX6TJJfUIZkTSx15Ftca65UjEzCinQRhKndvj1aQB4dutl+r+2EjL6O4W
         Hn4Y41YPGdPQ/38dlwvwVOvk4J9A86N8oDzZRLStynub52rDSzYj20j1Z0hnktwjKlQ2
         BCxs3HcHPFrxrvUiUDz7A+JA3TFE4fe6utC+2DzyUB4uCP0Pa/sNbtwkNvwzQnIszF0h
         b0Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWy77TQ4MBKUtTkrzXqpIqBTQm+rQAaaTbUfvt33kgvWjzPCesx5+T8nI5842NA9/iMb+vLnrkfJkIDnGd0MUwx@lists.infradead.org
X-Gm-Message-State: AOJu0YyXqbAlvqqUnco5crXjb0Scv8xLKVHf4SHxHbwowOhRq7zIPi7Y
	+ESTG6/F/CbEhJOtdguJieOb5kqKDH2f+VUTAeJbKAtlTqGwPoFI6vOehJzum3c=
X-Gm-Gg: ASbGncv69CWQkTUR55TI1AMxlMEuHBdYorhJWR1b3ylNKbGLjd3RLL2IfC47bDH2f//
	boAz6xfRiKhq6cpZAcBGrGak1Btws4v5GUg5DFigokW4fiii7D3bO/ipLdF0W30Xi2hbijPFjVN
	yiQ6w1x7uPxRbvUq89upqi4Q0NRZKcZbruujtJBNi7I3gTe06em3sEoDVwJ6U7/F0/8rPEvrAdm
	7oZ4bWKLlHM8ttopAicg/X85HJTYBrV14lSZuokE/zVVrsoFW8NwdcjJBx5nyiR0MpkQ1xw2cup
	BzrymNweL9z9wtXMUv1kWQ==
X-Google-Smtp-Source: AGHT+IEv+eCR9PUfncvDs0wzTMLxOKsmlNsAPus1k4vRWAgjsSpUPjW9jboACPYNr+RGKV19oiU74w==
X-Received: by 2002:a17:907:704:b0:aa6:a87e:f2e1 with SMTP id a640c23a62f3a-ab2abcb198emr2288992866b.56.1736845895670;
        Tue, 14 Jan 2025 01:11:35 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95b7317sm599640766b.154.2025.01.14.01.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 01:11:35 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v3 2/4] dt-bindings: clock: st,stm32-rcc: support spread spectrum clocking
Date: Tue, 14 Jan 2025 10:11:14 +0100
Message-ID: <20250114091128.528757-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
References: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_011137_193937_FF3A2854 
X-CRM114-Status: GOOD (  12.09  )
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

The addition of DT bindings for enabling and tuning spread spectrum
clocking generation is available only for the main PLL of stm32f{4,7}
platforms.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
- Add 'Reviewed-by' tag of Krzysztof Kozlowski

Changes in v2:
- Update the commit message
- Change st,ssc-modmethod type from non-unique-string-array to string

 .../bindings/clock/st,stm32-rcc.yaml          | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
index 779e547700be..628bbbcf2875 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
@@ -56,6 +56,26 @@ properties:
       Phandle to system configuration controller. It can be used to control the
       power domain circuitry.
 
+  st,ssc-modfreq-hz:
+    description:
+      The modulation frequency for main PLL (in Hz)
+
+  st,ssc-moddepth-permyriad:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The modulation rate for main PLL (in permyriad, i.e. 0.01%)
+    minimum: 25
+    maximum: 200
+
+  st,ssc-modmethod:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      The modulation techniques for main PLL.
+    items:
+      enum:
+        - center-spread
+        - down-spread
+
 required:
   - compatible
   - reg
@@ -81,6 +101,10 @@ allOf:
             - description: high speed external (HSE) clock input
             - description: low speed external (LSE) clock input
             - description: Inter-IC sound (I2S) clock input
+        st,ssc-modfreq-hz: false
+        st,ssc-moddepth-permyriad: false
+        st,ssc-modmethod: false
+
     else:
       properties:
         '#clock-cells':
@@ -98,6 +122,18 @@ additionalProperties: false
 
 examples:
   # Reset and Clock Control Module node:
+  - |
+    clock-controller@40023800 {
+        compatible = "st,stm32f42xx-rcc", "st,stm32-rcc";
+        reg = <0x40023800 0x400>;
+        #clock-cells = <2>;
+        #reset-cells = <1>;
+        clocks = <&clk_hse>, <&clk_i2s_ckin>;
+        st,syscfg = <&pwrcfg>;
+        st,ssc-modfreq-hz = <10000>;
+        st,ssc-moddepth-permyriad = <200>;
+        st,ssc-modmethod = "center-spread";
+    };
   - |
     clock-controller@58024400 {
         compatible = "st,stm32h743-rcc", "st,stm32-rcc";
-- 
2.43.0


