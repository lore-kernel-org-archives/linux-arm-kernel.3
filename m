Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8BDCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 17:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YX6ZPm2D502cqZx4/+zrPYcRnZ97EQtYMDg4SYAmRws=; b=1loZWfW1nXvZJuM40q/vLyaz02
	Z/htBYiGYujLXJlT9jITPYSTyZiRnWpgQRaFP230gLgkGzJcXrG7nhxUuenzs/UL/POSFsmct7tFg
	Ri0UjP2VEMCPQ3XE6qLOvRdzzf7OYDpNvtn9/tJVGp/B0xEs4qLpN+/OlS5rfQA/w1kbPWfvd7lFs
	z33MxdpXy2webcw+zhIWVn0hYRnpGvkHKsQ4oc4pLqPM932u0OTTosTVnBf9VQywO6DR0or7l//ej
	IefRmv4xVObTL1SQVPT8ijaYI5B80Xxuwmp1E+AXNSzSsk5cE9rFSotRh2Jnw/FscNy79DZnYc+lr
	aIFRJDbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0QM-000000068M6-37GO;
	Tue, 09 Jun 2026 17:39:39 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0QH-000000068JV-2oPH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 17:39:35 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-490b8a97b11so64458705e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 10:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781026772; x=1781631572; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YX6ZPm2D502cqZx4/+zrPYcRnZ97EQtYMDg4SYAmRws=;
        b=ItjX15qb8i+yAhFFAS0U7fdTgWZB/IzXKwK705Od3e+O2Yhf9S7c5lVoUBiS0TxkL4
         f5J2uHAeqVghG11cvpYux8a0FvpClMHXf+lvlNO37feTwj+HyNjReEpuylb7pC6hx81G
         Jio4c77fxfnQFZ+Y674UeK0VMFw572yYJ49+jEX6g4yhaStEPpSqawwPVNKUF6IDDHLI
         dPhOuTBAOl5pzRUlx2DZCQ5kQGVrLnN/DfUM0ibyDcrfwENCtjlgtbeHKgOnLBVbqE8c
         zXP5QnkG0wpAmFgQf03NHx/uDwpILxLUuDXATQfRys3okKj3ZB5AqeTI5SKML9nsRKRw
         M2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781026772; x=1781631572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YX6ZPm2D502cqZx4/+zrPYcRnZ97EQtYMDg4SYAmRws=;
        b=hXMSVY72dvrwXjJ3i6vVm67VkyrCyP7YqSuPHiD8QDOkMpzupmmdW1YzWQeyeTGCnv
         93z5nIuOp7lSejZDAR+VSr9LIe4LvayQ5wk3Oq9KAD1vBteThuHtSnkayBLiittZgrJx
         lvWtx9dSk9Q5uOuIJe5ltWyahkI28KjKTiwYTBYXNh/fALBGsD4LgfUoHPtVtgYRScAI
         Jejywc+V2GD9qqlhFWFfXXgC5dhDn2VfUOXjZVCB/pAIRF6pj6MAdy4DEVEzjBruIX7V
         PvA/CoZ5OxvDspSDYSbourRLpSElLj+VJj1E3rXVQhPADvUUi6I3JsEXNf+Krkgm+61l
         n8VA==
X-Forwarded-Encrypted: i=1; AFNElJ9ruUKGUNAWVJf78aUY+4t5cVLIHSlp6pMoAnjUU5V2ARaP6bAECtAmafAM1HZFdmvb9rEloLedoKk8hwie9MOg@lists.infradead.org
X-Gm-Message-State: AOJu0YyMrt1wr6sftDlwvh/n5E4/FGrVFjYHkiFVWC13ewt4zKH4t80X
	YXQ8brVuUtaQWXCqMK89hSDwCRAHT2pjMGwTwQfhoD3EpGPIY4/ZL4r7FhjryiKKBMNdEsHlqCW
	BmRZrxJ0=
X-Gm-Gg: Acq92OGEGPwgKU8sEBF/eD12ny79fTbZ+4iOQKUb471VZxbBgewN8S798n3cs7iZUuA
	E4huPdVMFUATb6yLM24BIOE7p2ykuBUL7s7FGSUIOTg458jl5w8WY7gDEkW7zc0czkPx8lk9wvy
	6BXkI0HN2o0kWy0THNi4qJ9DYyWD5JYs+Fzi/lDT+HfucPaUmM183xjUE/qbIoTL9vuo7o1lt+7
	D9riDyFD5cOH4+jnM3NqKegg7IlcmXnqMc3JVLu2lDlXWzETvY8RJEeI5X3krGFxTTWXYrLgJRE
	KZI3W8+xm+wLbnKwISVMhxtpCek8nZo1c0aFhIq4hO7bytYJxYAE5InUb25I74Zhp3ylJ26U3eh
	oM9xwuBA29BUF60whRwEEFTHQ0lTtwhsuOPEZqZHpZ0lt0s+OhBd9rVjyBAUWyp7cRwLUMs72oi
	rZZXrxri4yAIJ9ucMA4H9ExiYZAzYmmWp5SgP0Yxcxn05hJcpHG4gM3+0o78taRyPpRAxM2EVRN
	Ja2GmEL+y1S2AsoVnPlNd5X32s=
X-Received: by 2002:a05:600c:1396:b0:490:d946:47cf with SMTP id 5b1f17b1804b1-490d94647e9mr41460835e9.4.1781026771736;
        Tue, 09 Jun 2026 10:39:31 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fcf5bsm593605215e9.9.2026.06.09.10.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 10:39:31 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 09 Jun 2026 18:39:23 +0100
Subject: [PATCH v5 1/6] dt-bindings: soc: move,rename
 google,gs101-pmu-intr-gen and add exynos850
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-exynos850-cpuhotplug-v5-1-8422cf80d43b@linaro.org>
References: <20260609-exynos850-cpuhotplug-v5-0-8422cf80d43b@linaro.org>
In-Reply-To: <20260609-exynos850-cpuhotplug-v5-0-8422cf80d43b@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_103933_740833_1E0A7CDD 
X-CRM114-Status: GOOD (  13.49  )
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

The PMU interrupt generation block introduced for the Google GS101 is
actually a standard Samsung Exynos IP block found in older SoCs, such
as the Exynos850, and is not exclusive to Google SoCs. To accurately
reflect its origin, move the schema file to under soc/samsung/
directory and rename it.
Concurrently, add the new "samsung,exynos850-pmu-intr-gen" compatible
string to the bindings. Support for this block is required to enable
power management features like CPU hotplug and idle states on Exynos850
platforms.
Also, move this file under Exynos850 SoC in MAINTAINERS entry.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../samsung,exynos850-pmu-intr-gen.yaml}                          | 8 +++++---
 MAINTAINERS                                                       | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
similarity index 70%
rename from Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
rename to Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
index 2be022ca6a7d..df23467d0e0e 100644
--- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/soc/google/google,gs101-pmu-intr-gen.yaml#
+$id: http://devicetree.org/schemas/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Google Power Management Unit (PMU) Interrupt Generation
+title: Samsung Power Management Unit (PMU) Interrupt Generation
 
 description: |
   PMU interrupt generator for handshaking between PMU through interrupts.
@@ -15,7 +15,9 @@ maintainers:
 properties:
   compatible:
     items:
-      - const: google,gs101-pmu-intr-gen
+      - enum:
+          - google,gs101-pmu-intr-gen
+          - samsung,exynos850-pmu-intr-gen
       - const: syscon
 
   reg:
diff --git a/MAINTAINERS b/MAINTAINERS
index 86ca9297edab..498ca30a00c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10952,7 +10952,6 @@ P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
-F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
@@ -23652,6 +23651,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
+F:	Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h

-- 
2.51.0


