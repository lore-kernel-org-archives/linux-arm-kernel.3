Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFD0EEF305
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 06:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gPeJxyuGY5/8F9b5AqNdyg2EFBWflmTDpqYPujzuFU=; b=algkI+6OC3IJa6//Rnztz65l1j
	ZvEBKZO7JXxFGU1HIetEbGaE53D8TFJRcBIa8RzMDhkrB3LWVycmMEffIHP/x0jtTSuW94xKT/Hcz
	eqwv5uyH7V2RF87Vi4O5EnMHTgByVnFEnU34aT0JehRvFM3zuAILCjpkNjY1suZgXRtkx+oGDw0r6
	KZVcNn+YeZZLwLvflg0Msvr9FVHMXWty7wealsW+yfLkbbpkozNCODo5orE15l4Em7nluxuh+YegD
	NCyqgO0Wxm2IldfhdOeK8u8rS5lhwZ0cTSchoSBEFNx36lcvZYIc51SwxxMn/CbcNpKg+fPkL8lbF
	c0Ai5cmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy1wD-00000000yXA-3k7h;
	Thu, 05 Mar 2026 06:11:57 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy1wB-00000000yVx-2xqc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 06:11:57 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b904e1cd038so1027048966b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 22:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772691113; x=1773295913; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gPeJxyuGY5/8F9b5AqNdyg2EFBWflmTDpqYPujzuFU=;
        b=O4zhJjrNnBhLoTi6491HzPqMf5GXSnjnrLUzRrr3ClbdNo9luP2ITJV9gKYjtOM6G9
         L/x3IMrpirTwu/b7ObC3UDNxjsjRirTlJm3AXj4C+vdEBB2UMUPbVj9DhH1KcfDrwVAp
         3MZwLTLAcuVFmAlx+8/nKbpeXlE9PjtQf70vsw9HJynT84zigGEOkWzjSvhWW6I7/WJg
         MusdFfJZ7TSIa1bU15QSdffWVKriSuntanBWGjcd7mhqvhiepXiDVkgUxnSvGqcFhqA4
         mTzs8NCUwgPAzeJQyyi1s3iT8MFgcD6q/TkpFuCAK8+CI1p+p0budcfRimeC95yMqcBV
         vHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691113; x=1773295913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4gPeJxyuGY5/8F9b5AqNdyg2EFBWflmTDpqYPujzuFU=;
        b=X0jhAM3hxuK6d6OgJI20X95uV8RDVriqYOg1ARAISxWvlAYZ5w6QV/tfS8Dqy/6L86
         6r05NWHx7gdgVw55lc2IO1P3G7waEzws3bnUOW/n9SG6yGSvW0/vJPfDvmuagfaVp2uB
         1moKKJQL/xoqYgP22gSluKxPEHCaN8ufHXTaU9LqkjIkRYYqKAJpCRt6EE7c9Z38Mq9l
         e57IChgbSiRZhkOA3nT5dWoW++D8cxyMl+bUJmhJjcoWlUyscEzkHDehpwB6ctn7Hpx5
         8QqkBfPyWUhK3AE/jsDXeWylwuwJJ0bTXlidYuY2KkUy++l9kY2+5k55V/9UvW3kHNYo
         ZiUg==
X-Forwarded-Encrypted: i=1; AJvYcCVRZD/uK2rO11Gi+WTmV11+CqHqPbOamMWxFWy8JSH7xJcACbXKb0+y8Bk5wiZOUG575a82eklgdsuNoGuRK58d@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6OOUKQO64Ml+t40SiPtn7cQ3JFZaXH/asonG1nmVvAumMd22E
	XAlHEMLJFicFD6NjdtjW/zcXr6pxmAvniaHoVYptNujy6MTXZRjYAEGoDhIF39RIcME=
X-Gm-Gg: ATEYQzyV5q4OD2Yiq9tA7+LicflPVsUtDwBfvsA/ZhgFa9f/P/J93Mj/1JIQay2ndGq
	iPgr2SUheoIN5QJb4ZIWtjR60blycm2fYKM5FZz7TbVtl3v27q27txVYRJdFF4is9Mao4odrNGC
	CHKP6S7/eafGWrJhbUTDwgQdkKiw6S3WMim3wlQ45HW8Qtot5ruy4s0KvDnXtNvLVECrIMJNUBv
	DHR8b2AE9/12jaPCCBeZo9zWJu8coXN6wCz8irBWDNEI+kWHX4nrfM+AzESZ4JcS/EMo8+ZL7Lr
	7UEBgrOa7JleMQgGT4xXJB2DYfP5MMamz0EMsX058r4N21XKHyQnH68OJWrwGpoRO3b3x3KE/RR
	DlrRpVm4DEuJH6a03RAMMrTqF0ym+c4JUrmCrOw/Kt+EVWOEbaFZOvegCT0ka9KRqxPfsAho3Tx
	1G/rFIGkS06KXsQ+GXG3Ay1/A1I58HVgFKeugHSMdoWbAsVgeXME0WlI0eI4cDl3VNBS2j8jjAs
	n/AsqPpz2CFBBk=
X-Received: by 2002:a17:907:6d28:b0:b88:47b4:7626 with SMTP id a640c23a62f3a-b93f11c65e4mr280686866b.27.1772691113364;
        Wed, 04 Mar 2026 22:11:53 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec3243sm849355966b.53.2026.03.04.22.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 22:11:53 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Mar 2026 06:11:50 +0000
Subject: [PATCH v6 01/10] dt-bindings: soc: google: add google,gs101-dtzpc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260305-gs101-pd-v6-1-8cb953c1a723@linaro.org>
References: <20260305-gs101-pd-v6-0-8cb953c1a723@linaro.org>
In-Reply-To: <20260305-gs101-pd-v6-0-8cb953c1a723@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_221155_767588_23761DFF 
X-CRM114-Status: GOOD (  13.60  )
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

The Exynos Distributed TruztZone Protection Control (D_TZPC) provides
an interface to the protection bits that are included in the TrustZone
design in a secure system. It configures each area of the memory as
secure or non-secure.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../bindings/soc/google/google,gs101-dtzpc.yaml    | 42 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
new file mode 100644
index 000000000000..a8c61ce069d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/google/google,gs101-dtzpc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos Distributed TruztZone Protection Control.
+
+description:
+  Distributed TrustZone Protection Control (D_TZPC) provides an interface to the
+  protection bits that are included in the TrustZone design in a secure system.
+  It configures each area of the memory as secure or non-secure.
+
+maintainers:
+  - André Draszik <andre.draszik@linaro.org>
+
+properties:
+  compatible:
+    const: google,gs101-dtzpc
+
+  clocks:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/google,gs101.h>
+
+    dtzpc_hsi0: dtzpc@11010000 {
+      compatible = "google,gs101-dtzpc";
+      reg = <0x11010000 0x10000>;
+      clocks = <&cmu_hsi0 CLK_GOUT_HSI0_D_TZPC_HSI0_PCLK>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f0b879760b6e..611fa8fb9f8f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10883,6 +10883,7 @@ P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
+F:	Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/

-- 
2.53.0.473.g4a7958ca14-goog


