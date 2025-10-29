Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B63CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 21:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iqao3OAOLCFcHU/rHJrP0WoCHPf0PW0UwACU02JLSpY=; b=eYYtJEikj6fui0RcvmBa2Ftshz
	DQL6fTUD85Yp43OoEYtQbGRPCJBKZjX+JR8jGPjHlniUBS+yhbm6wEILXGmD3jDoQyc7D0UYyALUE
	UMSJEHuNHgPbRisDXakMWzyN3CiaV5GdZNLopxjBSadalk9m/7S8TI5Fp0/TAkudJvx0SVAg1sRkT
	zHPHtrbHgFQNvFGqFqZPKr5qJ1tpj0zewJDvYjKmEpR/mYQGD1K9DAn8VgLYKXlo9VYf4MWcThpD5
	+o0Ho6uv5k1MpP849nlt2rbMu9omvCd1py7trCe6C8413qkcwmr3Y1DLZ56Otv3U3MCEZQw6bHhFw
	iRYlowZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEDkl-00000002xyu-230B;
	Wed, 29 Oct 2025 21:30:47 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEDkd-00000002xwU-2AFE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 21:30:40 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4770c2cd96fso2278595e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 14:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761773438; x=1762378238; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iqao3OAOLCFcHU/rHJrP0WoCHPf0PW0UwACU02JLSpY=;
        b=d9cqJ2E4Myh7FoMlDweXJsMYCYP1CPJyrgyKlD8yXGByAAH19i772NDAWguRWNDs+4
         HLkFvW0kz+bi/ICF1q99TzK0+JVOyfFhcdefBNTxn9iL9SgaFOwr7JOe2M81Nm94NI3p
         oDr8hVRba16I6x/wGft2HECBtRwNB2ZuWu4fKKHpExvTtRM8luebgZFIaDMhDwLC3n1n
         s+uppAhZXhZtXOywTrhiHcn5ZYdVv4ZpAAKE/e1m/80aYiv/Dw4mtbV3X/r0KvXJsN/Y
         2X6B6k1piuAQpLkWMaJdBOWfPb4KXU5nr3ia/VSYg89zD8lIrLKTCjOzBVG6tfaZe6mf
         oS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761773438; x=1762378238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqao3OAOLCFcHU/rHJrP0WoCHPf0PW0UwACU02JLSpY=;
        b=uEURcvgrHz+R/+H5AiN9z9i5chQQlzFpAYyb1s0WZ92/kxMp8IKFJBGy+jrJ1E9QR5
         IZYtXRoGe4AbY5JIhWWbi8N/j+L698xP5+am/2o0q2erqhCMm6qjdSpUpk8zTYT+TX06
         keByCeysCc1Nfafa19E04r7fWlo4LIpikt8lGNAMsrNSuZMuLxcmHFQ7UrJfZWSqYR64
         nrGpeGFU9sctKgbjkmt1BAk5dfhI8gTZMBAGF1E/gS5AxjRNVLI5ETiJFQIr9OT2CpZt
         ZVtb3BhMkXpx7+/pj8JaoPf/bOB6kMQYnBchH+GDpVs3Pw730Wy55g1c2DoG+Ipz0uAt
         d/Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWokmF1h0bIgNsKoFU0REyuQzC5ALtLaPrzrCN1qdJP8xiB54uo9z1oZ3jjaFRUGEKQhwTCMAjrOWllzs2yBrVI@lists.infradead.org
X-Gm-Message-State: AOJu0YwPx6u3n0eLCkHCf7eq+viujWVi93E2Zt69rhxBA3SnxIkjZw8v
	5uKLxFe7cjenYPLUU6k4+rM8kyQlGE4JLpnVoRMT/rn7nBTEyy4MnTWr6SNS5KOdAmg=
X-Gm-Gg: ASbGncsZ7UZ3oqh4JYe3aIeoV7yhwlvtxD2m5YUERfm6B+Kc3NsS4fuxm1PZjnNBBfO
	vm5uMyDiCIWErVALA1Ou7jAvwGs0SLHbvjiwXbX6940dCv1knSN8Sg+RYsEtJtzPf5rzHbatb8y
	2CGRKUx3OlubaLFzwZuZI2lPLYCspCpN4y24L4SocS8LoDsxSZvqDEB+KeFk9NEd4GojaZTdIeV
	regBDE2RsOiWAiuawV6d7qa5vgX1jD2oaNLd0U9e3HUq8udWmL2bAC+gw3jN9EYdEfTCunVgLby
	s5+To84uaZloL9koYWVQKz72+U/DaHmUq74clIu7FnENxbtXyoPC2PEWQy9gKoC929VUM6JOXYl
	T2jJ31++jOQAK8KsHy0E40E89jPJf/iQ0DJ7tjnLBfx1DhoCn7U12m4er1G1Dv1kLWdgfAjaxeO
	dvtbwYYlelX0d3Nkgepot8YmIopL7Wsg==
X-Google-Smtp-Source: AGHT+IGp/EK/XdKFzXP6oeVl2/r7JHS0fvkT2KmtT02FgLGepcMP0rkpaLkN8Wts6sL/irg9mBZrSw==
X-Received: by 2002:a05:6000:1ace:b0:427:9d7:86f9 with SMTP id ffacd0b85a97d-429aefca833mr3622435f8f.47.1761773437650;
        Wed, 29 Oct 2025 14:30:37 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b43sm28573457f8f.6.2025.10.29.14.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 14:30:36 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 29 Oct 2025 21:29:22 +0000
Subject: [PATCH v2 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-automatic-clocks-v2-1-f8edd3a2d82b@linaro.org>
References: <20251029-automatic-clocks-v2-0-f8edd3a2d82b@linaro.org>
In-Reply-To: <20251029-automatic-clocks-v2-0-f8edd3a2d82b@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2314;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=LZlI+SfH2hRW7IEmiRIC6Wm5gYA1XEvv2huR7APCMnc=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpAod3/hjW6JkpLI91/1F2pv5Yk5g8WxPvDM225
 Z9qWHYzybqJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaQKHdwAKCRDO6LjWAjRy
 uraFD/9gcT510rus+j0Qwf85erYOI8NExBts88NnHeq2TsV5BroIjNQqqB2b5LnQjEQM4oylJHT
 CMTJAIIfJ5z/6bCamCq/NuCVjLI3vLJnKVTNaByO2kcvUpHz1Fg71I8XzEAdqkhECDZYqFEPeAT
 atVq5LQi9DRfjH3PzTrhQROICxcEoWSKQFPlrT85bdS6zHWUHAkW8jM0KWemy8JUuV0ke3GLVxS
 a4bkBgM/xXJ4fFD3IbOkQ/vH6wvYgBt/zL72tuVuJHUmIjT1cqp11Wp578oudpLnLDC/9FxO/7V
 LLYWtXfSFIe35m9Mmh4J3TASKoAULUI5QPuR3vS6ZwxaNU0iPXvIZWCoLtvTKzN3Q+m57DIEO4p
 JkfMCqM2OCEyFBJLxAmlCaWGSLE11l2GnT/+/cUHlBaywJoQPzK0A0dSeExxJDqFYlfPcF5ikjq
 iH+yft53TkF8/aizlyA8g16Odgx/399UY2axj3STLfmVly2dfwREuR06g59h3qO1Q+/I31KuYDJ
 TuEmdjq8/LnUXgJ6ud6PMmztXP2w2DnjKyBfd4JrQhsETlpkN0YuXDFdcOBcGjylQMIPJIYbafn
 BeHWnCY9dXPAqGSnLKz/uJDSCkFLfukdTxqagbWd0wikEDoT58tKiVQFhCWr1DXLnzrqgo6WZTa
 PrVYt8q/hJjDlHw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_143039_588989_389B8373 
X-CRM114-Status: GOOD (  12.62  )
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

Each CMU (with the exception of cmu_top) has a corresponding sysreg bank
that contains the BUSCOMPONENT_DRCG_EN and MEMCLK registers.

If present these registers need to be initialised in the clock driver.
Update the bindings documentation so that all CMUs (with the exception of
gs101-cmu-top) have samsung,sysreg as a required property.

Additionally update the DT example to included the correct CMU size as
registers in that region are used for auto clock mode.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
v2:
* Update commit description as to why the sysreg is required (Krzysztof)
* Update commit description regarding updated example (Andre)
---
 .../bindings/clock/google,gs101-clock.yaml         | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
index 31e106ef913dead9a038b3b6d8b43b950587f6aa..5ce5ba523110af3a2a7740b8ba28e2271c76bddb 100644
--- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -52,6 +52,11 @@ properties:
   reg:
     maxItems: 1
 
+  samsung,sysreg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to system registers interface.
+
 required:
   - compatible
   - "#clock-cells"
@@ -166,6 +171,22 @@ allOf:
             - const: bus
             - const: ip
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - google,gs101-cmu-apm
+              - google,gs101-cmu-misc
+              - google,gs101-hsi0
+              - google,gs101-cmu-hsi2
+              - google,gs101-cmu-peric0
+              - google,gs101-cmu-peric1
+
+    then:
+      required:
+        - samsung,sysreg
+
 additionalProperties: false
 
 examples:
@@ -175,7 +196,7 @@ examples:
 
     cmu_top: clock-controller@1e080000 {
         compatible = "google,gs101-cmu-top";
-        reg = <0x1e080000 0x8000>;
+        reg = <0x1e080000 0x10000>;
         #clock-cells = <1>;
         clocks = <&ext_24_5m>;
         clock-names = "oscclk";

-- 
2.51.1.851.g4ebd6896fd-goog


