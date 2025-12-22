Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D91D711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 10:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gV3ODo6F13X1bXwo/uKA4praO9ZfNmVtiFryiaGb6Gs=; b=bJvfqw7+HjehMguBaL/Kn3qgOT
	Guc7vJ+2U0owQ82NJ6EHT7e8bF9hfHw/CXAHDwYc0jOe0L+kSPR2xvwP/140hsTVG8TJbqvex72W4
	p5Ifo49nX8Dgjwm9+khJUWHVfosffuE3Ai8AcFz+7VuJak4pvTF1a9HSJXcmtp7QvHjtNsx6H4UQG
	F9SQX8ptgEgOrfYo8DMmk27lTCx/DMcyyN7EWpN87qEUjfEcxqv0jIsyCkyxpaHYmH45OD+M9fuMt
	YeOJxgGg5fguupL/lXHxSCidK2tMkwnKfmQh9+GZWq2A47EHGnVCG1gPn3TsaSphYzA6t0S3AUmeV
	KwHp+8zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXd3e-0000000DbwU-0rpu;
	Mon, 22 Dec 2025 10:22:30 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXd3b-0000000Dbuj-3BEL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 10:22:29 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-430f3ef2d37so2838491f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 02:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766398946; x=1767003746; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gV3ODo6F13X1bXwo/uKA4praO9ZfNmVtiFryiaGb6Gs=;
        b=DdLei5MDMreyJDaAHEUW5QFD+VrhFYSN7a+lANSzVhx+5rnfZllGNkyBk7/E9F+WwD
         zvhMKdU+vTW+UgLWF9wBi3O2NSckyPcyEp9lsxuFL1XiH+4OfgDgk4iIw7Xu+2++1GOJ
         Plcal4flL1gXVgnzfflNoR5yHh98H1MYoeA49bgE/0NM+8Jxe3PbH2M/cVzjZ3ZkHX31
         FJF6EWLsjz4p3MwGdgKf8DcJfpCYcGUFEQR+RZfJynzVbndzrZOi+2jg5IoM2pmNhL9X
         yfHy8r3t4w/ETQxJyZIN+3QOnr9C167SZguMDnaCJWFRlUN3BNGavE4qU146zhD65Lu5
         k1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766398946; x=1767003746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gV3ODo6F13X1bXwo/uKA4praO9ZfNmVtiFryiaGb6Gs=;
        b=Wt9Eit1TGfN/AicB/i6C95ZbtcnqURqzt+f2QkaDkNzY4W8LDdORoa99BXBOFKyscy
         F/BUvNa1aCE5rKSDX6wEQ8VxT+Ga0eKcruqb9Ouo7Dv+aHZdjG2lg9ZseAd2OE8TFYYm
         ktmuyxt8vxsbYUiGuVkYyJZ1ziN0h9zLQ3XJl2/ZYUFyKvN5CEFwu3VYst146CQ8uxq5
         nCyuFdkNtZBvwG/V4fOZZx5dAw/YkmnvSVB6MF/chIYuxAMClWhUFR7lhdF9caVIXoF7
         avsTn5vdFOgyXtF+eJ/j1/8IsDO+O3UatS1iRHFE4Dt+wi/z5kkr2gig0DVMSRShj6WF
         j7kA==
X-Forwarded-Encrypted: i=1; AJvYcCX9wWfyloN71Q7susFPiix0w8x+iZ49wq2ICtVVsT/CZu49WJzh336X31jGLwErMe6xPagZpY7wlfOMAl9kxhzK@lists.infradead.org
X-Gm-Message-State: AOJu0YwGOTXSHZaexBnSloO2s6CEHfFm+jZvkGyQBoFH7puypOooRVDr
	E+KWOrBUSEBryjwTRgSvcXtkDKODsCmenbz7AYOmEAkS2wKgeDjilrBkdc7DDHFB39c=
X-Gm-Gg: AY/fxX4YRCvBc3w2fCi4YcyTIvfRlj5qtw3i1DpVYTCmB5QnIaZKtqdCCblS8MKMjGs
	rI9dbMR/7f2vKeSygcyj7HXQPRJwA9rLowR33SpOgSODiSDkQuH5T9M8bTV/yYdJYb0MhehjyCi
	E+gLbvaGio+fDCUjBJspmcMmD4DluBVPLY9M+bql5KzQYcrdW3gOYMNwmjf17jFgbM4a6/qBHQR
	HXJKzCeBkxxDZB4tCh/RSyxW3CDz3hYUnq+7uaTpDaROclVerLxb0CXVNbVNlXYPIgcoAzk28Tc
	32ilaTXoMg6HC/qJZPjkm/9zHmSFQFXEs8ylR/1OL2aXB9tRZgi22Veev1gX49jZkDYe4p1lZoO
	1EKub6keSMuGHKEaCIGwyG4A0oZzDiIokz7mc1EnuBCbELhXifENyB45ksg6kqTmhjoC3IlzaFM
	gUszBysP+rhz5szz9ZEAYfE4zlB8gqVEnh5SCNTNA=
X-Google-Smtp-Source: AGHT+IGgiHPoZfvEvLMMkvb40+kGv1VyoyONqoU2+qFBxEmmPGJZxre1hXPXFrJ0WJGq4sn/Equgjw==
X-Received: by 2002:a05:6000:4202:b0:430:fd9f:e6e2 with SMTP id ffacd0b85a97d-4324e4c3e3cmr11605703f8f.9.1766398945842;
        Mon, 22 Dec 2025 02:22:25 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([150.228.9.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82feasm21082813f8f.24.2025.12.22.02.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 02:22:25 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 22 Dec 2025 10:22:12 +0000
Subject: [PATCH v7 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251222-automatic-clocks-v7-1-fec86fa89874@linaro.org>
References: <20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org>
In-Reply-To: <20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3035;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=HBZKxM+L4XbIj/0bVAaLELAMW01kR1SncGYaCmbhxbc=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpSRvdg60hfuVcDiZdNu950EdMWZySiihRxtyx3
 EfLG5mp+eOJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaUkb3QAKCRDO6LjWAjRy
 utr3EACTGOAhJ1hCnCIVqJuSlu7QQ6AwrTPxufUoAzWVwcfqf8wjAG8/xe1khihoZz9SZ3O0RwG
 wEphnvoXD2NDEPUIteALxG5wUbu+3ottY+wRK4JU3jGRZeJ3TLaCNdJ5CKMElRVNVejVz9glVgw
 6VE9bux7U+ZF3c6m4HwxqhXJhK0b92xnyKg9+dxB9qtbDvtoNMr8G8SXKsZvzFEbpNBCmeJLsUP
 YBcrVOLcavMFiEDVRox0BTXLOJjGezKsstV7NcHAcdSkQwwHvl8AlW50ezGh2W3nzs+I6l9zbxG
 AwiW713NWeb1h17mFZnKzLAlVG+JZnZxz4Qxv6AMmfnjxno5PxHoh9w7k4hpMJwg5oTwNfSrpTu
 dHjbL2xqwfKPLAj3Wy/gEcjgchqy8BZs33rbyvyScai7Hmv7SqBFyPOIoDVNAD4fWstsgxg7ME7
 yvMe5IenPbHfF/hc28u4u+SYySU8DqLpyY9fHD7Ca0XW383DwC3aBKYKt04eVHB4jBanfN1pEEj
 HRjFpGHCRsOgGgfWUhS1jITkKYf8UHNslBftN3etW7HLW+dVre3CErFb7cdeGADIpek3EaaVuA8
 YHUOEpsPCL5gvHQAybewVbWL71RipmUH7EyWPU5lIFABMrF5ZwFIhj9UvK3qSc+pbQ8p1qsfHKt
 FHwMq1yGPZZB5dw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_022227_821151_9C2CBE6D 
X-CRM114-Status: GOOD (  13.14  )
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

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: André Draszik <andre.draszik@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v5:
- Invert the test for google,gs101-cmu-top (Andre)

Changes in v4
- Update commit description with additional requested details (Krzysztof)

Changes in v3:
- Update commit description as to why the sysreg is required (Krzysztof)

Changes in v2:
- Update commit description regarding updated example (Andre)
---
 .../devicetree/bindings/clock/google,gs101-clock.yaml | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
index 31e106ef913dead9a038b3b6d8b43b950587f6aa..09e679c1a9def03d53b8b493929911ea902a1763 100644
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
@@ -166,6 +171,18 @@ allOf:
             - const: bus
             - const: ip
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-cmu-top
+    then:
+      properties:
+        samsung,sysreg: false
+    else:
+      required:
+        - samsung,sysreg
+
 additionalProperties: false
 
 examples:
@@ -175,7 +192,7 @@ examples:
 
     cmu_top: clock-controller@1e080000 {
         compatible = "google,gs101-cmu-top";
-        reg = <0x1e080000 0x8000>;
+        reg = <0x1e080000 0x10000>;
         #clock-cells = <1>;
         clocks = <&ext_24_5m>;
         clock-names = "oscclk";

-- 
2.52.0.351.gbe84eed79e-goog


