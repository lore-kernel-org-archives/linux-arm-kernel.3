Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C7DFF887E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 01:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YX6ZPm2D502cqZx4/+zrPYcRnZ97EQtYMDg4SYAmRws=; b=VWnXNvu981nAguGCTnzH8/xiAD
	Z21j65ZTJ9bnuNBF3OSFdsQaF3mpAI/c4gG/VfNApCDZS89ARK7VlgMMozG8D3X26GQ2il85FeBcf
	DW1OarmJni7/mmWNI2VjbebBkEHv87MlOzuHtrQuNVdu7IrvBK+IpcSFx3mVfO2ukdupuUzTUBdSf
	PO8os4pbBaWn4pKDkjOgatS1m+AB1bCySfrkPrhwb9RnETpciHvoV6N8/8bo9Yo5Kn6tS8WuXkPvT
	TG5Z5aIDrfZJhiJazviD/1icdITf5OgJlDI+bc+1IiElVt0G8/egVIWH1kMKIipKKPKTQP5o8pQl0
	LtwojdLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIGeC-00000004OmQ-2Yef;
	Thu, 30 Apr 2026 01:57:00 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIGe9-00000004Okf-1egl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 01:56:58 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so4742385e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 18:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777514215; x=1778119015; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YX6ZPm2D502cqZx4/+zrPYcRnZ97EQtYMDg4SYAmRws=;
        b=eXkZLuCJXgLgDE02IXn1DGUFQPFNRapa1d45iRkRFuS9qxjA1PViAgav9A7FHnwQMs
         sBHndkK7sd5hFl5TsmcmD6B3VuHB0GYiXwEq6LBEboVSlnRsD0LLiNZlMLt2Z7UvtF9N
         LH5z5RvLe5dipVUp11bDPePHc+wBgAlDK7FZm3F+S7eZYFGkL6tp0jb6w6VWIXC5CxaR
         0JRW9Gz0BldFDD5HNrMmix+2P2CE4cw8XSVHJyAev5sSwZDdRV0/nAZIgK9CC2yLUAVh
         X9FnLmgWZTMZmwg9F6lGzzV6ePucxSx1KlbivxkCDJYdDmPo+vfGUdDYwwS7X+SX88cY
         JKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777514215; x=1778119015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YX6ZPm2D502cqZx4/+zrPYcRnZ97EQtYMDg4SYAmRws=;
        b=szkAbX+KLFfBEuN7QbamTaAjspfkAW4viseMYhBZJyfOInJgYM/TfCnP2Ywa7Jdqs5
         qCbPDWrkz8srduFB+i92cJ+qzDPd79ZlBSQ5D36XHXVyHZW/bs/vVOib28wsjw3W8sZf
         yhE7wTWK7yhxjRbVVmy8Yu7UqtPgehVVwILqAeU5XBi2G+VfHhCGJzvXCibqduOo7U2j
         nXLKT3LqdOrSvv9e9A0qndRCxgZ4qOwghO7w+7bPXIylTfNVjfrqZ6D6W/+iqU/h+2WF
         sNH9emQC0w2UF5HUssn7yziKI44nvnEpY4GKuciIyawp6WR4T2PzPuDJdjpsDmxVnnAL
         5Hsw==
X-Forwarded-Encrypted: i=1; AFNElJ8s6qrV3vtW85/dl+ufFqN/coWLbbxXF+7BjONulXNZKbwikbaABx7JWfSEk+nKiEn02o3eg1g2NsY1eVmncmMN@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6cYY+vrLtFE5Pzqq17BeGtYm3n+53BV/zONjQcms5OzziyO6I
	UhcEMae2J+MVByaWJGGW3oNLHHX3//U5DYHrcktRQkmtisrHQWdrE7cie6Nm3UyrkCRwsDjli+D
	aTVdKTK8=
X-Gm-Gg: AeBDiesv/PAf7YZft+6rN/Qj9MiNDTxDhHXXODzLxHfJtg2Ji4AuBRLWe3gWrfUyT6Q
	bMHTx17d7ztlaHvOYXeJUNtTqSAIwLZWzsgqWtqByqfxMygpBzYmz63Fw3nj326x8naEjZADs9+
	Rfi9dEjhzU2Erxs2venZ6S01aFVwlcUaUV/b29WyNBQLlofpK6/hy7zgxuffWFz5EoM4CAkw/8z
	YBLWGACaO6dKMwLPK6WSqZLWp6drdChaRJzS0Tp0ttTDKpcULL6OgLTLutx9GXNDv3xT86X99ed
	ZR+l8yq48vpHAYwEbq4a6+A+urKsMLf4v+auK07oKx0wmsoPLW9dzg/1cxwf6sBk1el2AVUInGu
	WhrNaaYL4pCuU3qZA0o9F37t6vaMQCbTBWU7sAHBZr0JXoNRW8G8MKw5kTYPU/DFEfIXYzrnBJ2
	KzBPobQp5TP+lhrHJp/yby7cxcakXfY9pZZAMPJBf+fMnP0nUzhtFJJCf2IJUJTITYdzJKPNFUn
	XX6oJaSYbGpUx0TnXD8R5r4elA=
X-Received: by 2002:a05:600c:1e0f:b0:48a:7b55:12a6 with SMTP id 5b1f17b1804b1-48a83d0222emr16301435e9.0.1777514215291;
        Wed, 29 Apr 2026 18:56:55 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5bf2sm9915013f8f.27.2026.04.29.18.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 18:56:54 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 30 Apr 2026 02:56:51 +0100
Subject: [PATCH v3 1/6] dt-bindings: soc: move,rename
 google,gs101-pmu-intr-gen and add exynos850
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-exynos850-cpuhotplug-v3-1-fd6251d02a17@linaro.org>
References: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
In-Reply-To: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_185657_463910_87D4107B 
X-CRM114-Status: GOOD (  13.78  )
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


