Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F86D1076361
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 04:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4XnAKFPVmyYTHO+P1XBUrrMd2S0zggRsNHe39W700w=; b=rj9oR7hI3Z3aBFoi134SRMXYXK
	nNSXiRNXjeRGB4xHU2RHzJHOt7p0EPyW8SRt8LAhw+jYM4Yp7ZUx/2YEDf/ZixWPLYigQzjU1B9gj
	J1VfNVg2uIeRZ/jwRQqqXIFRb4EmrMO5wMYRdl0dSKco/MtlBm+7pY0kVM1kRCyHLyIxSxPj8HSxw
	2yacrQWVI7THxv1+ib494DDDg2V2OJFwzyjLMMvU7Utdu2aYUt3Gr3lpb3E5e4UG0jboU4zWs1CNK
	2nPBiWg+TYkjpSH1Voct/ON3opo1kyp0Hq+WGWdq32MS393Wc4Z8ouMAf4TuFLwrr+sacFI4+puou
	dXwxlApQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7nYg-0000000DxNW-13uL;
	Wed, 01 Apr 2026 04:52:02 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7nYd-0000000DxLp-1Wjs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 04:52:00 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48541edecf9so77118495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 21:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775019117; x=1775623917; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4XnAKFPVmyYTHO+P1XBUrrMd2S0zggRsNHe39W700w=;
        b=QZudz1Yxes5wcw5UhPitav1FMIiwwmsN7GEKE3ccrr66ns1IJfcYSvl4ctkp0Ayek4
         YJ8CTEKGFVtADAvgQlIAYQr2bzRQLIBSkRObuDpTItRP2y2X7ljK0HOO1PZ1oH1ZfwUp
         WMM2yO8s6RSBrZlO0GQVzoUU3FUmSH0FlCaZSQL1JRpHjJ+y3UZ+84XORwzhdzWJSvyJ
         gqF9NdnR8assat/3jxSCOjAwz7QM6VXUTKebYxHQg545kKPHqvRO8Xwii27saXgig/Q6
         +Hfv3Nx+cXS7qzZRKF9zZNIMYxvU4sCW5J+9Sk+hhu9szDXlkgRxTVJHwsmOHafpbZFf
         r4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775019117; x=1775623917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U4XnAKFPVmyYTHO+P1XBUrrMd2S0zggRsNHe39W700w=;
        b=CAyq457Hce3c0XbDfpGRuVg9yOGZLSawojkG8hKUKjv69qNAVsmDvL2XnigqqD0tA0
         jp4n/771i7HLqN6yzxj9kF5tLiQIfr3z+b5b3bHPkzGcbY5i18hmU79bKABqq2VENIt3
         yXtDwb6SOYqcjJtG/+fE5uiZqesXgFqu7fygw840lssQR/Jsqhj6hb4p+S/Xf7AwWjmz
         FqK24fmBqXJv22ueqZRbEfFCgQly5rStJQwItCyvRGje4FDVC7MwAzqJ0f0qqKYfUQrY
         dSu+WXKEtxfJBSP46o0JhsazO7ircT9Drv7+nCtPZNnwMZwOUOglg8YL9yfWEm5VjX7A
         C3sw==
X-Forwarded-Encrypted: i=1; AJvYcCWqWMw5tSrMhiWWr4j6QrvddVCbhLKhMPY08wgcdJF/4B0hdR6bvYOuzCHM4I6FjrNEKxgirrBvwpS7a+1U+weR@lists.infradead.org
X-Gm-Message-State: AOJu0YwN9FlOeThdVbaHB1kBxTh7lG8WWdmf6b0EdJnVUQKddeIIIe6Z
	BdN0UUXLCogWGw5yfImhYRGgW+IWl32WJ1N0gYRsPA5ScLlcCU+LFgToC+Rx13Jwlqg=
X-Gm-Gg: ATEYQzzfGx7ZsZLM/ZqAQ2GcAcsr9XgxQQQch3OuOYo64a2S7YXEfCkK05OWTLvx1ju
	cKd0pFuL4kRWgXf1L6A6ZzQZmkxW980fyRX5mQIhDDOQ82BwaUOPIvv2G5y2xH/CqLJOR0oGnVu
	jD3WqWxWUkL+GcicGEwWmxf3/Gd4+yIo5bKLH/YEDd49e0LnwzKxvbu1YX6dOYAey3WBWYJpVwh
	NRqNkMBQxzQwpjLOwv7FgJfT51g0i6nn/8IJj5jYe8byOhhZ+7BwM2xA/siDL3oZRFoQMlO7Mm+
	bPrTDrDNlw+GTTQM3tIQFZlYZtNfdRMGIYv15t6jzF+GkR6QIijGmYE9z/PkghRoqtALleaTAg5
	aGSlFhG9gEC8wlezXkqpkq2iUSsdbuLXPThltorF/LVINCS89fmgxuPIfSm6TqHlP6z/JgJdm5q
	vaxmhI4+lJbF1tu3eo2XEp3lzBFhxosLgK9vWmY4V4qb/AN2c9w5TNXknxv/z1bQAA1zUwqXk0H
	au249E661QswsIe
X-Received: by 2002:a05:600c:c04a:b0:483:7903:c3b1 with SMTP id 5b1f17b1804b1-488835b2f54mr22338195e9.20.1775019117430;
        Tue, 31 Mar 2026 21:51:57 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2463dc2sm32986442f8f.23.2026.03.31.21.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 21:51:56 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 01 Apr 2026 05:51:54 +0100
Subject: [PATCH v2 1/7] dt-bindings: soc: move,rename
 google,gs101-pmu-intr-gen and add exynos850
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-exynos850-cpuhotplug-v2-1-c5a760a3e259@linaro.org>
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
In-Reply-To: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
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
X-CRM114-CacheID: sfid-20260331_215159_427075_6C5D3AD5 
X-CRM114-Status: GOOD (  14.17  )
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
index ff935e197c21..e14e6f874e05 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10947,7 +10947,6 @@ P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
-F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
@@ -23606,6 +23605,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
+F:	Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h

-- 
2.51.0


