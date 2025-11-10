Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C3DCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 14:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZY1J2OCEXaFSYKftIBdHCuhEGEDWy75TTPwxAO8hqL8=; b=1LmAUvlbHj9i/lndmntvBUhEJD
	g/lqLL2sJG1Gp0iSG8lbWYBlHv+4ZKyz9MlGzm6qTqVPq3+iS5BufvH0yD3u9ZPaGyljFNgiKLaXg
	MBD8k+BM1Bm69vx55eu1xzP91325RiBbPzOrIUt/1y2seFsrAVE8YCe0diPBL3CNiw+06tVCuUbQ+
	By8Nh8M4w+zUsXq0Suy0iQOIe99NVymEyfFkm2S9pAXkzY5vqKLK7i9xz0nVQdmGfwePVCEexuVO8
	DtXO5wLkW2tb6G9dZ5xDz1dUolASaWVIsUJekCgGslZP+3RALo0e75bLKGwvmiS+goXXmqdSSwmHw
	oqOPifzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISmL-00000005ZPE-41B7;
	Mon, 10 Nov 2025 14:21:57 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISmI-00000005ZNl-2TlX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 14:21:55 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso15588035e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 06:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762784513; x=1763389313; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZY1J2OCEXaFSYKftIBdHCuhEGEDWy75TTPwxAO8hqL8=;
        b=whZwYLeBOZTtbyCCCNu55jRK9Dl+JURtyToBDzNDvfUm9vzxd7xXkEI0KcZlcBdeXH
         ZIspWmvakN373CAn++TqQyRvzhqZ/2KpGBDpKxka2k7yMzBMrVFY/yqsFQT02HFskaoS
         ZXZT5kX8N4AqI/lfjjKKTsaQfTWJkZg6Rh6TQkmMzfcM1cCwyP2SqpCW5Xqm7GSDrmc8
         RbRUZP8hYVnvnlqTO9zRX+ToIhBJbD/ox8P9mu2nrLYst48qd+Wqira8o077lkNt1BLQ
         c9UE23vog0qU+a73GcXmtBqNVb87d9GcqxPCkGO71mLsd9QY4pGkJnq5C8KhyFyFXW5n
         EC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762784513; x=1763389313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZY1J2OCEXaFSYKftIBdHCuhEGEDWy75TTPwxAO8hqL8=;
        b=fuVxlXhOFMFpFztuAhvxOXommmiU98NyKsKNyGi8SOhNLdiit7Z3vRhFks3B+9t8he
         OwG2yGzLf6zoXEm7MUqkfzpnSJOSXkOu90Rzxz9aunuQY+AKdekBs11MzUKJh4BvVO9r
         BoviA/eEaKq0J5kExmEROvO2DyIYCy4AEGqwDC//QmtVu7scdjTyXmINYBkhBpBehxkt
         P9PdbiuWblBzQ1Y89D8+FLzhtm8fToOPPuDm5eGRRKV9F2w0zKQLKxIF+IzNJEqTVWCC
         KmMJ5aZtjytoOrZM4lBx/kLmT6r0Aur5U3nvg+G5ABbHg/2MTrGd030/HX6h7ox/ddR5
         vA2A==
X-Forwarded-Encrypted: i=1; AJvYcCVXNhO7kqPf76FdebDwo4gQoPv1yluYnffWkNhi0MvyUJN0BBfaCv8X9JQpE7X8zUhnBW5/CrhwaXJEBhKRnv/S@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8ddvBFlczM7eecg1PJJxwpMejDu4k+9pv/Q+B5lieHJW6Chsk
	/ZvjFtr5z/21yQ34OjUBYF8cfuEHe23Bl0QkY8itX6UhXDERLhHH2BTc98XVytjCgmA=
X-Gm-Gg: ASbGncukR0RbNHaGzdCl6eUBb++mipb+G93aZIW38UtxSd/fFDsJlvRFVPFtE2bu1jg
	TWl6GRDjq6CNL0ACpn2jOGXgwa+UXtR4WlV64+dkL5ANb53x8Bi5KGzRzXFBz1LCyehK7LL464H
	no1gRlcyjfnaL2yLqEZun8GbgflABqtvmeHX/Py0wKPFADf5Rd4IMjDTBibZH56PJYwWn5yZB3T
	reocoqJTXTLSgj0F6Z4t/79PBxXaUh3kv2TQjcPjhenJMFqpHUE6qsbg0cqOfTJG1ksM9QgdQMF
	vHqlSP/oBVf/tSZa3trwFMusIkaIVjwlgbbbnDfDK7uULOgU2b1sAKgiaVyu6J3cnebTiMySw5Q
	6bvgR9WoRMoDKDQ8ST/kr61GwuIanEBMjK+INvPD0RhmAFiFpTfcSaphICKux4maJodpGsfpdH/
	9zbsXt9rq90IGNiKDvn1ulixTyOFzAEA==
X-Google-Smtp-Source: AGHT+IEH4+AQIaWKbE5EvSCIFcmC8+p5tN348VBTlGoPy1JRkvFmx0rN/o2SvoWUsZH+gxPapwjxjg==
X-Received: by 2002:a05:600c:4f12:b0:477:7d94:5d28 with SMTP id 5b1f17b1804b1-4777d945e9amr28381465e9.7.1762784512660;
        Mon, 10 Nov 2025 06:21:52 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776a953414sm104369435e9.0.2025.11.10.06.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 06:21:52 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 10 Nov 2025 14:21:40 +0000
Subject: [PATCH v4 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-automatic-clocks-v4-1-8f46929f50b7@linaro.org>
References: <20251110-automatic-clocks-v4-0-8f46929f50b7@linaro.org>
In-Reply-To: <20251110-automatic-clocks-v4-0-8f46929f50b7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2969;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=DYAmFEfeuAP/0kFyWrWK4qPN9NiVgcwUSbl++/cpyfM=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpEfT7cuxMR4Qavzcu+MI7MsZdjT2P9P9540K2u
 AVlNT15fnKJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaRH0+wAKCRDO6LjWAjRy
 urAED/45BejlCepbVCDe+A7TfLtxoX5YhABGdmn/AlqD2O6gyF+MbOS9CyyANOF83DbYgaCsKKF
 YYxOFPla+2sN9Bnv/2VwVjspMZJwYVevFqcizD60X15lQnDPKfzoazm9sfrHVBDT9Urt9KWR5sV
 ljKnOsdCF8PMecF0wCqRkCWr2TD0qMbTGDRgeSeaA9+e21MQJDMeG8RGetEOLbukXXBLa/CxT5b
 FQtVjQVr/B7R96scArWknrdhlo3UWW1A26h0xe1dPKx/C576IkL+BAjUeFhJPKcfagE/QM6/eN9
 u28znk9aQrKHH+641HL0QP+vnatOncd1eeek2rcTxptVoH2fEt9EomkSTUt50AyyUAOkOgSpYJd
 MtXNSLeFawKI9Mzi/CF4PipaK9GWaxD7Rv/XaA2I4CLVv4UQchW7042U/ET1NqKvRIeH5/K7iwV
 9kBvh0wnZgrwQh9cyrxwMRrPf/ilkbU/Zo+1RG91Hh8Y8TsFGi0MXDKSCdS4Y52+sKJSGsqdoZ+
 x+sD7HTizvoMDY4g/A5Zqxpqvq2CO4RiJlnLMunM8yOYdNzU3YuyLQWljcAoVI+rQNLsNH8dLww
 o+XtvEJmoxgg0tRWyH2TWbRjgHNwTyBr8BxnexvXHbG1D84gkV2BY3Nj//BvkX05xgpQ5itnxVU
 QwHqT1nFB0pvxTA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_062154_660578_5C082CE6 
X-CRM114-Status: GOOD (  14.11  )
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
that contains the BUSCOMPONENT_DRCG_EN and optional MEMCLK registers.
The BUSCOMPONENT_DRCG_EN register enables dynamic root clock gating of
bus components and MEMCLK gates the sram clock.

Now the clock driver supports automatic clock mode, to fully enable dynamic
root clock gating it is required to configure these registers. Update the
bindings documentation so that all CMUs (with the exception of
gs101-cmu-top) have samsung,sysreg as a required property.

Note this is NOT an ABI break, as if the property isn't specified the
clock driver will fallback to the current behaviour of not initializing
the registers. The system still boots, but bus components won't benefit
from dynamic root clock gating and dynamic power will be higher (which has
been the case until now anyway).

Additionally update the DT example to included the correct CMU size as
registers in that region are used for automatic clock mode.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v4
- Update commit description with additional requested details (Krzysztof)

Changes in v3:
- Update commit description as to why the sysreg is required (Krzysztof)

Changes in v2:
- Update commit description regarding updated example (Andre)
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
2.51.2.1041.gc1ab5b90ca-goog


