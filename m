Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A52C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 18:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6+Ptm0oRwTnL3Ocb32TjntW1tAXUnQly4a1T7oh0b/g=; b=tf80mgCOIltwaQGX/D0Nskjs4M
	2qOi0PyXgjNTymmI+MIUi/GQGx8+Hlv+W6SGoDGkagTXm6VJ5DIgfbu+DgJzbvqDWLGZuHslDCCkE
	1ap+kh1EEvFlWBJVmCbOX5/Z40QBNpmi3H+G9h6FmvBMPZjSxPjYnhi8rWGbv8UN2Z/wZbtbSLOs8
	Qtgf5WOx9xgubbxgPUHdlyENxkpHEU+nsGNuYKPicyVhUqZjW/ig9rGn6FzX7zFmMaFEuOPBDJcfQ
	shVm4wg3dqtEBc+QUiFoIvc1NOM1dLFN7X51B8Sk4LuIKr6x5Vaa1hfg91Pl44RYv3qgGe+2gmPPy
	tu3WadXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg6JL-000000076Tt-0BNc;
	Thu, 06 Feb 2025 18:09:11 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg6Ds-000000075CG-3h63
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 18:03:34 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4361f796586so14563325e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 10:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1738865011; x=1739469811; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+Ptm0oRwTnL3Ocb32TjntW1tAXUnQly4a1T7oh0b/g=;
        b=bIOc+hHDPS+45UrFvHO7eFfN5U1T8OkhdGvB8WL9oIqRlZ1QJEeKzIw8P43+oeXA5T
         3cD4kYmyumdm8j4skuj4e2TAnfEsC48rRLyZixq1LfOVu+VJvHxUjI4JQyBRjLz93v0u
         Jn2N6QGAOcweGYM2kHh8KbxMDh4pprLFieP3qT88E2KVt/24iRVfI184P2d13dDtJNwJ
         PSLboSQwUopdBpKX/eDKxWBuMPLkEzv3p28mLvQLkvfNbGG2NcgzFOZMVTOiQQzmUv6f
         a5F/9XfoN17uGaZv0CQBpRlbnzB75t0FIbnv1ozIP66lLwyfzchPTdjUVC9v0KvZJqAy
         NCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865011; x=1739469811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+Ptm0oRwTnL3Ocb32TjntW1tAXUnQly4a1T7oh0b/g=;
        b=wdtHZN3wIuMZK7OngOxODzRvNVv6pbH8F4FLbfiCz//hUs8ZtqZJVYg3XnouncpabM
         +QKwwyc4EoDV1Dnbq8bdYxmOZ24OG6sOwHyUiXmpl8aERRmFzQjIILrPwp4VVrqA5lf9
         pzV57ZQv5qDqxySRgD9Ot8paamN2oVmRmf0wld9MEcHQQ8ihpwIatuJmUjDD8utRXyUY
         pEvEGURZELrxSOIm7TM/NomTR63zcEl/rd7ikykr0+XMPq3SVS20Ew7Cv8WFRHEVBc92
         cSc5Fo/zjhi9L3vOBnegHcLkMheBoyIyT87NpfjR4M8Ll4W33WrJKZcrqtDRB/ENb+Gx
         znxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBAed08kF1sBLSaNwfR0e90hHxiUQh2PoJR8anFMmrfL32lj6Q6YhAyQzBZBSWQaV0dzAcHFm21IkCCxy15NLe@lists.infradead.org
X-Gm-Message-State: AOJu0YzQydd6d7epvLfNkkbpXhSM/Aqqx/WzYki6FwCt6c47C4SuooJ7
	LCEKLYTQhjyPM9vInW5nxw793OlXUD2UGa4fz3Q6iM0P8GEAW+3wHePmB+ih97Q=
X-Gm-Gg: ASbGncs6K8xT6NbMeA2f724zTwZCikhGs1j3cKqq7Cl2l+M5EX0ius5DVXor5DHEfHg
	xli8fBfIDP+eneXMP0ARHzF0mpk3t3YZ2oerEdjidAa1ZezJEiVATFTGt68thjnH4yg3IMMZWMn
	U1izeAuAXZdHblJjNE5SX4/Ra4K0z0fQY5u77J8jPIAsaO9pXeEyHrJ4LKaxn8uRuqMp8ais6z8
	RaLOUYYlI8tIgRlXtGwqYYgK1u2K157eIfwk6LZcsXBtvuXYf26MjMkBBRA+kx3YrBvRM3HtYan
	rCQAGuE=
X-Google-Smtp-Source: AGHT+IEc40ueYLTteR1KlQ3fnrgzcK1xfXxwFu0xmwqnVwELnnEw0h737ayS1xCS2yNyZ8/F36GDAA==
X-Received: by 2002:a05:600c:4f91:b0:436:916b:aaf4 with SMTP id 5b1f17b1804b1-4392498a1b5mr4704265e9.10.1738865010000;
        Thu, 06 Feb 2025 10:03:30 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dbdd3856fsm2278858f8f.28.2025.02.06.10.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 10:03:29 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 06 Feb 2025 18:02:36 +0000
Subject: [PATCH v2 3/5] media: dt-bindings: media: Add binding for the
 Raspberry Pi HEVC decoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-media-rpi-hevc-dec-v2-3-69353c8805b2@raspberrypi.com>
References: <20250206-media-rpi-hevc-dec-v2-0-69353c8805b2@raspberrypi.com>
In-Reply-To: <20250206-media-rpi-hevc-dec-v2-0-69353c8805b2@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_100332_928964_A2D5B6B7 
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

Adds a binding for the HEVC decoder found on the BCM2711 / Raspberry Pi 4,
and BCM2712 / Raspberry Pi 5.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../bindings/media/raspberrypi,hevc-dec.yaml       | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
new file mode 100644
index 000000000000..06db7004c765
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/raspberrypi,hevc-dec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi HEVC Decoder
+
+maintainers:
+  - John Cox <john.cox@raspberrypi.com>
+  - Dom Cobley <dom@raspberrypi.com>
+  - Dave Stevenson <dave.stevenson@raspberrypi.com>
+  - Raspberry Pi internal review list <kernel-list@raspberrypi.com>
+
+description:
+  The Raspberry Pi HEVC decoder is a hardware video decode accelerator block
+  found in the BCM2711 and BCM2712 processors used on Raspberry Pi 4 and 5
+  boards respectively.
+
+properties:
+  compatible:
+    enum:
+      - raspberrypi,hevc-dec
+
+  reg:
+    items:
+      - description: The HEVC main register region
+      - description: The Interrupt control register region
+
+  reg-names:
+    items:
+      - const: hevc
+      - const: intc
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The HEVC block clock
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    video-codec@7eb10000 {
+        compatible = "raspberrypi,hevc-dec";
+        reg = <0x7eb00000 0x10000>, /* HEVC */
+              <0x7eb10000 0x1000>;  /* INTC */
+        reg-names = "hevc",
+                    "intc";
+
+        interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&clk 0>;
+    };
+
+...

-- 
2.34.1


