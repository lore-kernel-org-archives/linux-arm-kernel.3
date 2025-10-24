Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D16CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 08:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=INvMVooO337546WBguBwEmHdVGb0IwYfhojlYECLG8g=; b=Jc7xACL5sUaZ8juZ7lMWFp+y9q
	UYqxOcQOzMJ5bBr5Ls2k0wrBioP132jVRmWTAjgoke8PYS4ZPdhCvjcNUFrKfWa3DuZK8rbwcw+fg
	ErOHAjogatEkrdXREQMWx3krzGMCOEaja7vgLGlYZCKnfjBMttkBoE7ZV1lCkOvfCFv6JlDEHsRBt
	f8p2MZ9WzYh/abUkBP7fqJ0eBrjnVZ8mLbYQQ6/JKOB6ULFQWJIEyJ1y1OboApOGQg/2CejVGzi/Z
	sMmE0QNEH3VoNr6S2Bs8D0YmJb5NHxMzp3/My5NmdvaKwXBkgMfqsWxhKYmF5fVSmPX9zUpT0Vkcf
	pcxbko+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDFb-00000008iGn-09E1;
	Fri, 24 Oct 2025 08:34:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDEp-00000008hHc-2bap;
	Fri, 24 Oct 2025 08:33:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761294808;
	bh=Y2h/i9vmXSirUwONakbB3cZIqXs0dK3R7Y5HuTICkCk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eSABCDECYKxjUgcslxlJlrkXeS3ccq5ZkiZkx8zOuZraGoCRwG0vDQuihD9u91g0u
	 Pu+Q2/UnHXXBU00UvYzjETNeW37ZoYVl3g+49/6BfMBhfdXZOp/pxPn9J6Nbg2cJU2
	 kzSWG5A6PoCBYh+tYw6klmyiXpBhLoY2Rs7xdy8r3qfmrH6Q/953VqavOJAS+lIObw
	 0EvcCLEyN8EkHGeOBXidAaHWjILbWmpPuISATGj6mJiT9YRTtKMJ/rGbi77cRtUgYH
	 KhKwWJ0/Y2ksfhmx2sNyydD0mIsY7UPXgkCNBVWXl6nAFzr1lT7mA8gABPdxRiluSk
	 rJ7pvoSDl+qfA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5C7F717E1310;
	Fri, 24 Oct 2025 10:33:28 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: alexandre.belloni@bootlin.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 1/2] dt-bindings: rtc: Add MediaTek MT6685 PM/Clock IC Real Time Clock
Date: Fri, 24 Oct 2025 10:33:17 +0200
Message-ID: <20251024083318.25890-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024083318.25890-1-angelogioacchino.delregno@collabora.com>
References: <20251024083318.25890-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_013331_956081_42866E50 
X-CRM114-Status: GOOD (  11.12  )
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

The MediaTek MT6685 PM / Clock IC contains various SPMI sub
devices, of which two are Real Time Clock IPs, one usually
reserved for the secure world and one for the unsecured one,
reachable at different SPMI addresses.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

NOTE: This does not contain any example because the MT6685 RTC
      will be added to the mfd binding for MediaTek SPMI PMICs
      and examples will be there.

** For reviewing purposes, this is how the example will look like: **

  - |
    #include <dt-bindings/interrupt-controller/irq.h>
    #include <dt-bindings/spmi/spmi.h>

    spmi {
      #address-cells = <2>;
      #size-cells = <0>;

      pmic@9 {
        compatible = "mediatek,mt6363";
        reg = <0x9 SPMI_USID>;
        interrupts = <9 1 IRQ_TYPE_LEVEL_HIGH>;
        interrupt-controller;
        #address-cells = <1>;
        #interrupt-cells = <3>;
        #size-cells = <0>;

        clock-controller@514 {
          compatible = "mediatek,mt6685-sck-top";
          reg = <0x514>;
          #clock-cells = <1>;
        };

        rtc@580 {
          compatible = "mediatek,mt6685-rtc";
          reg = <0x580>;
          interrupts = <9 0 IRQ_TYPE_LEVEL_HIGH>;
        };
      };
    };

 .../bindings/rtc/mediatek,mt6685-rtc.yaml     | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/mediatek,mt6685-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/mediatek,mt6685-rtc.yaml b/Documentation/devicetree/bindings/rtc/mediatek,mt6685-rtc.yaml
new file mode 100644
index 000000000000..1aec163b251a
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/mediatek,mt6685-rtc.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/mediatek,mt6685-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6685 PM/Clock IC Real Time Clock
+
+allOf:
+  - $ref: rtc.yaml#
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+properties:
+  compatible:
+    const: mediatek,mt6685-rtc
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
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
-- 
2.51.1


