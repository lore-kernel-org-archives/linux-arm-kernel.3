Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66B8CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 13:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=piB6olxsDjTKBBKWtT/80MoIuyo/txOuxpczb55KJIY=; b=rQ8Av45uMYXgNwCsYVNj/OIVMT
	9cf1E6iT770rzW6UzSsd0saYAzHEnU7Pe0JSRWYu1X6AfjcTFoPWLd1AodWn1LWIgZHF8GSqTZqqK
	wOtl4xGwNwybyx9wVuBg23DVK+v+9ITn6w3ome4p3KpjpnJCmF1rJz0DfMLhjM9+bDOzfAYcRZixM
	929lRTOInevFotqV/yJ0IUql42liUzai3Z6TEGEVzAJbp583t/yRdTHfCIGF2OjymKPGArJ6VEpFE
	WzwHi7vW7qbHbozyCI6tFCW8I+SqjM7TagS4M9qGYa3E9BKL23RNXtNK0G4Ghlxmn/4lhpwKk4Nw1
	61wYvWiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBpW-00000000iU4-1qJV;
	Mon, 28 Sep 2026 13:55:42 +0000
Received: from mail-ej2-x0e.google.com ([2a00:1450:4864:34::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBpK-00000000iNg-1mSD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 13:55:34 +0000
Received: by mail-ej2-x0e.google.com with SMTP id a640c23a62f3a-c2c996fd607so8303966b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 06:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790603729; x=1791208529; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=piB6olxsDjTKBBKWtT/80MoIuyo/txOuxpczb55KJIY=;
        b=g/3Wzi5C0cCJZwm2a6XQMYpkF/YvgmWpc/RW3ia/e560aYJcoDqHpBPkzZ/9ZdMq5u
         7wdqOvnhdxpHQyc78EgDlhzc6qt5TvwbUjO8uj7k480QIf5XHDPYeoh6xhvHnstQmgDa
         G8hNtxuHsz0wHGW5ZSwK6rIAzuhKvpiV2AZcbPQ1tE7MtsCQSZuqD7BRgdsBxBEo8+hC
         U2uCw6VYBZnA+j+i+s5xknh5bgYKTksGFheK1LPbfwxkh19KP8d7bHYNl7vIGyq9Ppws
         tfuJIQFyp97hpf8J2rzTB0BrEj1pdoBL+2gl7y4jUKxTQ2tcD/tEbZk9b8xLjCg4omQx
         Fffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790603729; x=1791208529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=piB6olxsDjTKBBKWtT/80MoIuyo/txOuxpczb55KJIY=;
        b=aKJlcwsqkeBntUknjRPv8lfnb+5+CbYOc5kb9fa+LcFDjG8ZPEd5dMtHKx6ohXiSHN
         Lv41F0mn+TGe6uE0u3iF9vIyl/V0Jmd4DMkj5Fm7kiX6IYPZR5NBbVlFLEmAY1KT4b23
         Vo8Cj0Ya5V0XDQwmiaHqb9/gOQiNL5hFOQnmlGVaHO6L0UMFyZ0o12qd4i9wgTH6FIN4
         NAdpGkhzRHP7ZEVp68RMpJAVlM6A0urajMw4fs7Uc2y+uXdfrezFFNuO7ftM2LeIo2bP
         s6FQSLMZTZZjb4lopX15sGEhOzcYU14E74caulLkflq7XOPsAhIJM6mfBbzf7JODunra
         q+zA==
X-Forwarded-Encrypted: i=1; AKwUvBzFr/YMcWhGcHgQ2/XyFPCY+Onv9xlVc+sVzISdjhm/aX52+sVyeubmtdF4ICLGd23NkYUQSem1TehvCDU94UdF@lists.infradead.org
X-Gm-Message-State: AFuF++mWWp3uDn8uKR1vsCBdvIl/FKzCIhtRCW/i+b3mTx9YAWi2HGSI
	WRv9/hCb/xlRtCIeiSqOm89l+u2eGiMW7vn5h3cCF47sCH0LzzvMq/blCAfRdB2VFVc=
X-Gm-Gg: AYBFou0GiqyU8rQI6L61VCyUbMgs1RnMr9C0Z2neacWHoPhe5ABpwkJfUZhPAOrBoT5
	/dnQtkSc64jL8ScHGor7iQOzM40Pz7wTCO2O95fDPtYJA2X82FaAhDLiE0iviqvatRP8kzrydUz
	8TjR1EZbQfsKSkJMigHEK/UjfOOuny7d+BVApUQaTYQbpxLZVxBEdYXsxJjcP9KQmLdMGFNLYvz
	jZvXtIKs03bzEvk+a4NLkuc6Ru0cgAc5ZWs6VKST9gFNqPsBlBgxOUiI6QUsDjoEcsiTUUEGw+H
	kXpJXhtVSMiwxPsjxW2UEsvMVGDctDoCvzb4z5Iu3/LFMPbHI0KGGZPgZE8Y5aqTjQ0g49EFq0n
	8UqRnhqIcJYFE4e3wAfqZDZj+N91zkNNZCIqcNPXLglKsB4qxn5NmX07H0WRU6VwiVY2a7ct6T7
	VjkkeWdVCI48xutQTsqqm0g6HPaS9JpRIqGmZMgf+VcSNNR041AvYXTgagNVYoTXDnXwvD0Q==
X-Received: by 2002:a17:907:c589:b0:c2d:c80e:8366 with SMTP id a640c23a62f3a-c2dc80e8413mr372966366b.0.1790603728763;
        Mon, 28 Sep 2026 06:55:28 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dde41e1f0sm139221066b.11.2026.09.28.06.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:55:28 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com,
	Sean Young <sean@mess.org>,
	Julian Braha <julianbraha@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v10 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Date: Mon, 28 Sep 2026 15:59:00 +0200
Message-ID: <ee0aa89faa14e0073f1271693bae28678652998b.1790603500.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1790603500.git.andrea.porta@suse.com>
References: <cover.1790603500.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_065530_481640_434275DF 
X-CRM114-Status: GOOD (  15.96  )
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

From: Naushir Patuck <naush@raspberrypi.com>

Add the devicetree binding documentation for the PWM
controller found in the Raspberry Pi RP1 chipset.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
new file mode 100644
index 0000000000000..be020583fd0ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/raspberrypi,rp1-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi RP1 PWM controller
+
+maintainers:
+  - Naushir Patuck <naush@raspberrypi.com>
+  - Andrea della Porta <andrea.porta@suse.com>
+  - Stanimir Varbanov <svarbanov@suse.de>
+
+allOf:
+  - $ref: pwm.yaml#
+
+description: |
+  The PWM peripheral is a flexible waveform generator with a
+  variety of operational modes. It has the following features:
+   - four independent output channels
+   - 32-bit counter widths
+   - Seven output generation modes
+   - Optional per-channel output inversion
+   - Optional duty-cycle data FIFO with DMA support
+   - Optional sigma-delta noise shaping engine
+  Serves as a fan speed provider to other nodes for a PWM-connected
+  fan.
+
+properties:
+  compatible:
+    const: raspberrypi,rp1-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+  dmas:
+    maxItems: 1
+    description: |
+      Phandle to the DMA controller and the channel specifier for
+      the duty-cycle FIFO.
+
+  dma-names:
+    items:
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pwm@98000 {
+      compatible = "raspberrypi,rp1-pwm";
+      reg = <0x98000 0x100>;
+      clocks = <&rp1_clocks 17>;
+      #pwm-cells = <3>;
+    };
-- 
2.35.3


