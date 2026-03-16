Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF062EFCBBB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 06:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7xf70jF6KOg/SiWMlOWjk6atZ2ryfC9YUcEG9Wm/SIo=; b=S0PvYvvbrYI5+y0jp1flbyTI7w
	HvMunEDdetTjfC0Nmy4S8YSm6CwXRMVZsCNwJthVy068C6R4x+1qb3EsBWlgLQWLnHCQCU5hrwSS1
	1dvicEymLSCKu1dwE0dA4zZ6MapOPw1G+5Bhcm4gXqyBlPTF2KSUq5xExy3sgc04Iu/ofYhABRvvp
	T3bLmQfs8+AuSqDFQjUeDdFkgGSm8kTzKxX7pOnmL+bnxfrhE694mBsHY6xQQdEEjHEVcPfgUbRfE
	FvbmlZgigagnhUshNrxvaT/ujmzR+EZhuVrrXZAQtgYlTxrUtufRzWUad448/znJXlQy2MDQnfVro
	Cpca2UuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w21aL-00000003QhC-0K76;
	Mon, 16 Mar 2026 06:37:53 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w21aG-00000003QfS-12sx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 06:37:49 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c73d7c8d2daso1021473a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 23:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773643067; x=1774247867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xf70jF6KOg/SiWMlOWjk6atZ2ryfC9YUcEG9Wm/SIo=;
        b=mdv7E4ml/y9cfuYpEd93Q5G1sVIFXjh8SNeJXehfWtUCEMQqX6XCAdLYHpnuoFihiI
         7ilV7p3v4Qm4jg1+eYqsgF6HT8irqH8VQ0/N6luuDLRc/14tzQW2O9Po4AuDzY7zpWSz
         Kx+OuVOu6iTmrWftCqf0xuj7nA/DbLn/dIwSInbFlJ/vkZiDfbPhu6pBZePfYKch8LT6
         WuFQkEOSi+UyyJi24kYvk3TViryV3EIDP2iqhRqYTutkhjaZUpR58lVVQhqidnb0SBmp
         ieRvXcJbfRMMslGYWkmHWJ8H5JLi8grWI1dnwnx+LG0Lkxi/pGWXATfgsqFBtWCJafgA
         KAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773643067; x=1774247867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7xf70jF6KOg/SiWMlOWjk6atZ2ryfC9YUcEG9Wm/SIo=;
        b=G+9ZebGxsIkzfBFaO0xKZo816uC0xnAW/Daz5fat3WkH5m6sm8oKbGbvZcJZxvPyW9
         VyyXFI2f3SyD4DGqb4TuNORm7vfPlUH7ukgbFXqAvx0jkOSRzu10zvScZZWWHAbJlnhf
         XnaKqmyUzsit9WSskC4snQHzXwZSnbIEykQZ9x8zp42E+jmxpsyOo8Ay1Vb1Cvhi9J6r
         f5+779qgjOYgGvIppizCFx0uI9eXgjOSBbjKTlEcCyGa0dP4VVDKS5HzqplLD4fKaEgA
         HbHbvCdVbuTCxHHbrl/XFRXx3t60dVre4GGfXoe4v2RfU+kSv0bhkUhnqCFmse+Twxe0
         kQNw==
X-Forwarded-Encrypted: i=1; AJvYcCVMWC9SXv/zjK8aY9kpidw8iXr2oukuB/xmtDigeGTlHfUFc7CeNTm1qUeUcCx7GQYeY7B01diEwAuRRtY3ZDEH@lists.infradead.org
X-Gm-Message-State: AOJu0YzI1RzheIHMTE+LeKpy64JMLbBYZP76E41HR6pTt7/x1Dt4Xhc4
	wpAOAN7LC9d5VmzFKMe0Ppen3llTRUqf9c3zrL+WBAuLEKuoK2X68mdA
X-Gm-Gg: ATEYQzz+kOvG+tzcxFcW6E6qxkuh8wXqBuwuiiyS5nkZc4ysUsIMMlz3bFPJ8edxOgY
	VlgO7Wjr2+efyDnlrJrovqUGjiuOwvCIw21mC+YY5UDTWUydieuypnUwlPfvOugYEE102pB4pm8
	p8up6NLssJ3V/U+cp4HnYGHoB7L5EzJcjoeWpuzOwIe9nbeHJXvwVlhts09HBbtz8puUmrS4g0t
	n63tuqXjBp1kTCnV62N2j36Kqn5w53dWvqdj1fgqhqj4hdLdGJyP7ofA7CczJIaTbO76Hd8HRq/
	DjF/ESQPIBRs2V/Q49sdivHVucUWsxqMFYx2pSUWVkp1UwicpNDYSo58JDz09PGBvykXk1eap9a
	jxj9Kho8p202AZhgIvDSGO6fdZUabQcEdd9YgrVhD2yUdoAsRhz1FvO9YgyNk+cSwNHGQ9P/Ch4
	d93ynhpfMWIh1cA0GXb35cROKfwQ86zFlYKgXm3bpfBiSi2xo6yartLr2NpGw+pr4IHlLLvkGon
	SpXgnHSZezRy98ekAiF
X-Received: by 2002:a17:902:d50e:b0:2ae:47c9:68aa with SMTP id d9443c01a7336-2aecac9da99mr123353785ad.52.1773643067321;
        Sun, 15 Mar 2026 23:37:47 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece56cdf4sm122845295ad.8.2026.03.15.23.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 23:37:47 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: andi.shyti@kernel.org,
	ychuang3@nuvoton.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	zychennvt@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C controller
Date: Mon, 16 Mar 2026 06:37:24 +0000
Message-Id: <20260316063726.41048-2-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260316063726.41048-1-zychennvt@gmail.com>
References: <20260316063726.41048-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_233748_290347_73FD76E6 
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

Add device tree binding documentation for the I2C controller
found in the Nuvoton MA35D1 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../bindings/i2c/nuvoton,ma35d1-i2c.yaml      | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
new file mode 100644
index 000000000000..f2c004049d86
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/nuvoton,ma35d1-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 I2C Controller
+
+maintainers:
+  - Zi-Yu Chen <zychennvt@gmail.com>
+
+description:
+  The Nuvoton MA35D1 I2C controller supports controller and optional target mode.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency:
+    description:
+      Desired I2C bus clock frequency in Hz. The absence of this property
+      indicates the default frequency 100 kHz.
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    i2c0: i2c@40800000 {
+      compatible = "nuvoton,ma35d1-i2c";
+      reg = <0x40800000 0x1000>;
+      interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&clk I2C0_GATE>;
+      clock-frequency = <100000>;
+      resets = <&sys MA35D1_RESET_I2C0>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+    };
-- 
2.34.1


