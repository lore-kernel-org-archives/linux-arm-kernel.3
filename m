Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4CEE8536F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 14:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ItvUs7qnYuRhfo9MnKht/hLCIFj2PmkiwnfJhnbvcpk=; b=Mp+4QQN0z5U8Qrd2+d1BFSuuxv
	o0LZBW+PpBA6pwmxYlXgGN5I925dRWtR3mHtnERF9wkNQN6YjpCcbGid/hsLvWodk4xdbFT/iM7z3
	dQ4LvU0QqS2szvu1pvcnysT/A+EXKZYa6qT1iY0RW4tl8iO5pFYhiEciUqGhvP+fXMFAWiw37821d
	TgI9BwCe9s0ZuJexZB/bIPAjUSnNvAlp4TvD/u25be/Vbp916ZIy8fp9QDkDp8gFPOQFperiLOEpw
	K4cG3OcaPyq9wk7vpJNyZKqig/hQgBGDnsZzj1FBUMR/wbvgHdxETV2Yo3FjIJRfjyMNHvJOD36eB
	+Py4H5OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fWD-000000028q8-2Sd4;
	Fri, 03 Apr 2026 14:29:05 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fW8-000000028n3-1ih4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 14:29:03 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so17177555e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 07:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775226538; x=1775831338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ItvUs7qnYuRhfo9MnKht/hLCIFj2PmkiwnfJhnbvcpk=;
        b=W75ODqyBv02DyyS3ggGV15w6EGh1xLZuWRT3qNEwjB//ET39Jdu3AyNoGJRkNIM/sE
         aPMwpETjKA7siN7BH8f/PDYXtqcMNLDASVzwZV7jOtPP5zl/wKtnbUNj8X7lHRkvI523
         0OasHpPqxEDemTdf4uEVp2FbmcYhoej5/05+mu+0r+j1D46eYq/xmlFz5DxaGXBX1EQB
         b69GqwG8h1AsNO7K5nhd+Mo7e7MgXCAk73RSa9zSanf6MKFf66b1FLGMeJ6llsgQDsTR
         rry3iWjNk+LaJzUjzhfhpKdDHnSLMXFo5ne2bVokfJ0amhpmhCWQlQhEmrWKA/9H+8en
         fo2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775226538; x=1775831338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ItvUs7qnYuRhfo9MnKht/hLCIFj2PmkiwnfJhnbvcpk=;
        b=BDN/MwlueQOWHWZfow/uupnrGa2Itx66uTjcOJWXPlkHuOx9sjKOCKs0G9miSYk05J
         OXjFFmR1H+FoJUHJN1Ape9Zj1kxaXfRbW6TWcRpo9yIq3ab1hmRdfHoy0xWntH/C0nwF
         tj/L05aqg9VmVDCzEDZA7DOYwZzEaTwoaISYSWOxofLPx/F6J+TJtftpFElNeiUskdUX
         UmzHweRCt4sNrfNFeefUqOJCWSyM1c0hL166L9w8l13mU8i3WS/ZMruu6y2YIDV4vVVJ
         jhLxL07g/XyKK9X8moXj/TUU4KYJJ/g4xpXU3Zgz1FBMfPWj/WjsVacHJW5xYt4cKZ0R
         KipQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqJVUk17btwWdBSdPYNg70nR60jxpob41Ijigy98CahyUmFDj06cNOIWx1Q7L9UhwNedLeX/MCM6s7iWmmhQy9@lists.infradead.org
X-Gm-Message-State: AOJu0YzioxZdQolKkYI/m/rK06x86FYE+w7T4F/k7hY4Nv3OuEsc5qjL
	1CsOkfWYt4mhSg4G1YCDd8U65CRIkVST+kO5mPunpkyGBE0Qupys5pY4fCiy7cqxZqQ=
X-Gm-Gg: ATEYQzzPFKXrx8hGMRpZ/epVsRfcrg+PdFy0mpXECKHBWRAXUdnYR+2AF6KVVxRwcUk
	Oxx0Ohxvc07+4DnFxXEzzn3zqld9J4vSsioHyI4Oa9TbRQ8oVS4UhGItaddrs48uMLblGpquFwb
	aXAGBP6bJoCBB6n3mQ7Zmc8k6VaBkr0j2KfxmIbdR7AqCXDQtRFP0JeWAkhkbBqzKMnu8BEUGQT
	DWz9J1vLNE+Xej8jcJO+nDB71qjpT7GjZUgjPHhlckOBQeY0p4ZsYojNWSOSnFF2no7RPzEi+nG
	i1oObDMZwrhIyOZpJlnN0mFpkXuhwE61xnGBCnnMrFoR7hZ8OGd/Fo4sNzlEZOEcfHiZr+JjPLF
	yIkyDu5cbTHl9wuawPDcp79oAphPJf/vBjx+uQR3sJAR3OLQlOZ1MJNwYvcb/1JoXibe+hrFPVO
	ny6YCyqiMYG92at1aMhghLJEBQ2hjsvX7Hi/3Ci1YWryT9wqfl/rZzFutfB/VIGkPS/2mY
X-Received: by 2002:a05:600c:45cb:b0:486:ffa3:584 with SMTP id 5b1f17b1804b1-488997853damr44739285e9.15.1775226538384;
        Fri, 03 Apr 2026 07:28:58 -0700 (PDT)
Received: from localhost (host-79-33-140-232.retail.telecomitalia.it. [79.33.140.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4889cb46adcsm44349515e9.4.2026.04.03.07.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:28:58 -0700 (PDT)
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
	Stanimir Varbanov <svarbanov@suse.de>
Subject: [PATCH 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Date: Fri,  3 Apr 2026 16:31:54 +0200
Message-ID: <11b5eee3c22cfd034bb4b425d28a5a3ff2a71828.1775223441.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1775223441.git.andrea.porta@suse.com>
References: <cover.1775223441.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_072900_477391_EF81295C 
X-CRM114-Status: GOOD (  14.69  )
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
---
 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
new file mode 100644
index 0000000000000..d6b3f52561636
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
@@ -0,0 +1,52 @@
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
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
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


