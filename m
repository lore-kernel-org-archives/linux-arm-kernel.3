Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8BFCCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 20:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VqwzmV8ucm9ZpizFb4InEfSGE/OBpMLcQ1DSFma1Oj8=; b=iWRlPiAN2gmDE84B8UmqlUlScb
	gR7aoIzZrasjXrHgKRDvkJHxgNLlh6conjMJiEvFaOHnW+o0rKua1ghq2BoAU5Ao55kV454g7QAiJ
	8YFDc429LmE72hMIlzrbv+BUPY7q8JL4vHQ2Wh+nKFPLpSajezol5oc8burGMQ0qXn/nAgOckBbnV
	M/qdPglWoJPUvFsqi4ExuOrAVlEhCe4GsbW3+CbAZmJJ/FvXlhozol93dP3GuIbBuEA79xLalXSWn
	3pyOa/wamH3osNTHkNXK2gajfYT+ycpL3SoJFPnGy/xNdlMY2LzOxRsQrQgcq90uWGTm3pxj6kO7p
	JMGlOdAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFefm-00000008ntU-1acm;
	Sun, 02 Nov 2025 20:27:34 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFefj-00000008nsM-0iz1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Nov 2025 20:27:32 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-471191ac79dso42461345e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Nov 2025 12:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762115249; x=1762720049; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VqwzmV8ucm9ZpizFb4InEfSGE/OBpMLcQ1DSFma1Oj8=;
        b=Bo/AJu4B3qn6Tebt3i7E01EyK2bXBpyJEsRPcov6whMwrP53A3YElMnI62wDwUgn1O
         qrTxX0HJ5OyfBStLLBHXJSAwZdFoSgzDsBP/Y7Ok6ey/UUCMkeoNeHSXKn7WIWU7whEE
         sw7WkO0+t8yNPOM/qNB7e1iTQAe0z6c5vmcEIwQ6SdY7o7hBVn+07jRo3t8Fo9a/VFpW
         s77PbB70YshWPgakaVmgtTS7xHzigBm+tcxaVSNMRBj3OjhrucRw9e6Pcv91i/05OR3v
         zU4ZgIdkmZ2xY2E1UuTuQq2wVz3jh0LAA4xkpDKCpqZLLbadYb+7Z7arfO3Iw08oitre
         dw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762115249; x=1762720049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VqwzmV8ucm9ZpizFb4InEfSGE/OBpMLcQ1DSFma1Oj8=;
        b=SlZf5duB6P3vmgY20t2EtgCr8TMMYWkH4GIE7aIAU2rT1V0V+bLfW28d47lLxd7YTJ
         oWxNy0YV6FJQFsMVFqA/1NEWpevoyf41K+cbRj52UJ+lLcPuWTBL/DDiC2h6VLd3kdOm
         Wvt6fSn7JxomRRu5OT+3SPMxye57yR0K5b1PVqgNZB4afrZGll+/SxpxuASF0HGsEpBA
         ToKwzh82CbPL+/rx2vg8affHaosZsPdkMBID7EZHQqxGHRH0n2cXz51cDlnolHDt7mxl
         odNhFgZ7KH9Ht+qt+yI3Z7jqIleHzrh7hcIWkC/njXmX7OEizvGIqNE3p7ttlDjRPRJk
         SPYg==
X-Forwarded-Encrypted: i=1; AJvYcCU22d+gg5FEAiGQoazleFkZM7D1wCRfcSVy8sx4XFvRpO+6gnE3s4jln6MBd6zjZStYLAs1YB0eAwVxcQhi/iyo@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6vHkV4f8ThMC+Q2TI5QsjcS8+oS+UX7JIQZpvsv3LAsEAW61R
	KPw2D5H9qOpmuGVulqT6gXwLQXGM65mpIGDibptYYW7tg/i8iZr0oLu+c0EVvCPUCfs=
X-Gm-Gg: ASbGncu7JZre1ZdyVxXy2WlJ6UNkaRkT/8crKSMAY36PqqsSYFdR+cr/pAyKnymeUvS
	d3jMqnRabg/Je1rC8BRw3v5/3ISHKFcoqUP5zJU9f/d6EyBTlksbtKYin+I2Ijb81HVbhGlaEDW
	MzKBCwJOaSdzMHRoQ2L7deKWrmlk/jKhcI24zQ9uTuqBOdWnbqdj5nS4nq2ozfQm9Ry8DZ6NdPG
	9oFjutqn1TOGHZCa3oZiWOIEWGpY9Dmxu/j+VLOCRyrpMVYqjx3zpL13k1b5VJzi+l3Rj0JPTBC
	xKgoFDhyiX8c01IgWXck4e3TSm8TM68OCfCtbWuHlHXONrmB6K5e0SFpdXg2+HsIjjwx0enrT3v
	nF7SS4XVvTvQIEXuXeHKUyMTF1TqJMVotYn/nulOY2el0piS6bSJe0EL/QEM5VrLQd4W2Hv7Hud
	eE4Hpe7ehq8RZPblYo+mKQO6Mn6f1ShNX0jGtlNW/rBA==
X-Google-Smtp-Source: AGHT+IHO6Kj16XZq6wFeuaf1RbffW2vio8belueyNJjXBAP6hwWK/ytmja/cRAdCXN2PlNhsCr1t1g==
X-Received: by 2002:a05:600c:190e:b0:471:168f:717a with SMTP id 5b1f17b1804b1-477308599b4mr87271515e9.16.1762115249274;
        Sun, 02 Nov 2025 12:27:29 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c374f84sm114664165e9.0.2025.11.02.12.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 12:27:28 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 02 Nov 2025 20:27:14 +0000
Subject: [PATCH v3 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251102-automatic-clocks-v3-1-ff10eafe61c8@linaro.org>
References: <20251102-automatic-clocks-v3-0-ff10eafe61c8@linaro.org>
In-Reply-To: <20251102-automatic-clocks-v3-0-ff10eafe61c8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2325;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=rW93Hlr4vcum+GKJgXc1ajFfnfWqcxUHYUOR3Zmf44g=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpB76svQKBqYy4GDQ/oR5w5NFCQd80R2RbT/sW6
 cO1sayfIrKJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaQe+rAAKCRDO6LjWAjRy
 un7MD/9tdkOyjZlhnamX0fDBgvsMJET6LH8N8JPdTmn7dkF7GI4cvOuhDF0DKY24mkl1k1t+Ihs
 ynh39V1v15ZLyrpKTDjD3mTCEWxJjHRdF2WcHeXr0w7Oi+yuqjZaVcnMFa/hWoFP0kstG4NpApi
 jliMamJwva3OATI1hqBH08xqxqlyTSztEr79ZOhVR+7ugOcVREUNP+D16BSObwDHjhwJSN3QQU5
 MacwZsMYrD6R6Ym/qMH3MDnjj4TqcuLCzNwaAl0D+/UsgZ+wUIXBRLB/0OkTMOrwhuySjw60yPM
 vzJF4IXTtPUygBa+75pAPGUhnHtMrCD/MQkXTPlahGD6knkYwPnALiif3neHHcpNdEytS9cBGx1
 //Q4tvT53ZaPER/CbhFZMvkwWv+EiMvgnn4uyS/zCD/Lgt8vaHmCpBvxUpb5DkjNKUger87dwoa
 LjICe7n3KKwbVNrd20GQdk5MVmUBucaQ34jDCJMJOCtU5DYUGPccAvlvDhVONyHhe1ocTkSTz8g
 9/7o+kOtywqhAdi11O31sc9s2SO9m2oA0wUgEfWgY9Jp6F1VkoAz4BrT9yRskKJIjAmrRuRe24j
 2Havbr/MOjzlFvNvgqXHx97qAyvrYsMt9p3Ck29WQ2muZ5JZb1soWDVffEKo2CQmJmb+Lx7namy
 /7yR4IgeWDLaRog==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_122731_243540_D226C42A 
X-CRM114-Status: GOOD (  12.47  )
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
Changes in v2:
- Update commit description as to why the sysreg is required (Krzysztof)
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
2.51.1.930.gacf6e81ea2-goog


