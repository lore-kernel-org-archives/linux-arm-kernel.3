Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7B4C61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 12:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TfBamOBMdgFDLlZC37nZvSYpxKYZZF6KSv3Lu11CekI=; b=fV5YYP+1vmAh3ngk8DIASyC5P1
	FoEQZiTae8taeEOk9w6g0T7zt1mBWTr017OZBwei0gISL/Mz6GJlAlbXolDrY1A7t1V/030pzFd58
	JpwHoGl3NlIHNZcrXURHibcTzq0Q+8MezrvWl20uVh5NEmvlTZauJWeRHu2olWeElcHfKT1ylL0Y6
	iRHQGsiOr1PDFG/RCMyY4ZfKGlkTIvzvRV/fvQtYwAB3bDdfjJNfxeZviZ3nbcB+lw33d1E5bXizd
	FWgfWJmStwRjbnEfBJQm8bFT8Ca7C88w14Fqdh4i3CMNIJwStQVTwX2SYsuBnUZBGn+OzH+ps+1hu
	342oRHtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZ7H-00000003x7f-22Ak;
	Thu, 27 Aug 2026 12:21:59 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZ74-00000003x38-1ITz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 12:21:47 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso11794905e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 05:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787833304; x=1788438104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TfBamOBMdgFDLlZC37nZvSYpxKYZZF6KSv3Lu11CekI=;
        b=FtGM4X9WDha2Laid1vZSE+5DbkLrJrb1GFCMifkOcSvgDbhUrUmwncwukCLji8iT8p
         Symfm5Sf1dhsjje1nBvsSzbEvXAd8/9Uq5D+fZhInAoG/ZDE78zTdkqxQis1nF0wTul2
         m9ZsVVnxhrnecVlPcap+FY8iviZ2vkXA0+1FYJ41gViDn2275wxCzrbtpDUfB5fB2lXU
         VDmxNrlODprBdp6KmOJ2BMelSI8YnRTLNX+sFhSCmiM0h1sGu3E3l5MtxdWkufBJZBG2
         RofsLQqoxwOGolUeXIr8W0sjV3swdJSyqhgD+5DGEtPrngbwnmHe8fKuqX+E0K4V6xXj
         Ey6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787833304; x=1788438104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TfBamOBMdgFDLlZC37nZvSYpxKYZZF6KSv3Lu11CekI=;
        b=HHIZyGJubtQIRXkStasbjKUgtWuY2fks34xT+SgYdfGc0dvUGr6XKGC/wTqntUh+Pw
         5lzCxuy201e0rw4B12EUwwSF5JJ72cnACTgcLpVATokfAViQRcV/dmFK0yv7B4lnqw3b
         P3w/Z4UxJM/Cnhx7CE1uYmkFuOIc8v4cb9YCdHkBfhwIxGGWpF1Cs05cZaK3Fd+PzLWl
         6/IFnlXoxTEpklCKaxeiBErTpL6amF82hDDnTBQ5sTTRvEfeRfjLo1BcJiDduJ7fl1Y1
         buuvZs77jmyJDvz0UYYoN4WireYjbIOVcxMBwX9zQkZj854B4Hv+i3nZNGil5hPO21HP
         U1Ig==
X-Forwarded-Encrypted: i=1; AHgh+Ro81x2pdZ14L2PpDUAW7aAEXZo30RwKD9QMZQIvgJrU69C0bYmSlTOW1oL3DQSPc4llFgZtWyc0z/wpegUM3mU0@lists.infradead.org
X-Gm-Message-State: AFuF++nZGjCFPvY+4+LoNiqUmFCucaXZ05PyQIIgFWNZh+rDwUYfQrgC
	ay+/tJMYe9FAADWDiWs6CNEUHRMbvdsfr6Gl+ahJ+qQYI8Y/unzLFLBy
X-Gm-Gg: AR+sD13DWaLyRkBbgcTfuANWL9VIqm3HVt51lJ92TtwRT4l63eNY3koiAcT05kRC3HQ
	/gTfm7WGPSVWT2rwM5CEmA0TH7axTmwFFz2knQNB+ucHOtBgISIDTFWI/s8UUqwd4DK6I2I/b0Z
	j+gFy/u8aRUI1QnJDP6JTw8k/5hGkI7Zuam4yAZhi3oth8P5FtYBpbml3HiX/dvN6XsMx0FRtK/
	B5yxfVreDGGaQOcZ/hDupWOgKJfHTDXA5a98oWcLa7FadYl9+pPTa9/5Zez6tZFxoAN4hPmBjxn
	+ZRbENaXufx7uglBAXe7teevDlrHLBWHPw+mbbKU+StKA8/DYUJxG1CRmulrXcuppWfsAuEKU1A
	H581FERfGWfaIGnmVyARgvV7ACss8dyP15aXmTiNTpZj7ECSOWpv0oZkRlnDd08TyT2F7pRbtyx
	GlBBJ4Cf78niJDgKC4/6afBlNkxExjxaUdOlRfcNMf/gjlFoZn0TDS96OiOG9YTjWUtUdDsv8jH
	/CzuZ+OfmokIKVMOMl5ApRiehFgf+3vtlf7uTrAskBikHufEud5yc0=
X-Received: by 2002:a05:600c:c48f:b0:499:dbc0:370d with SMTP id 5b1f17b1804b1-499dc6eaca4mr142110795e9.2.1787833304197;
        Thu, 27 Aug 2026 05:21:44 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49b465226d8sm50099535e9.0.2026.08.27.05.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 05:21:43 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: phy: airoha: Document support for AN7583 Gen3 PCIe PHY
Date: Thu, 27 Aug 2026 14:21:20 +0200
Message-ID: <20260827122127.18874-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827122127.18874-1-ansuelsmth@gmail.com>
References: <20260827122127.18874-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_052146_364800_C6322762 
X-CRM114-Status: GOOD (  14.45  )
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

Document support for AN7583 PCIe PHY used to make the Gen3 PCIe port
work. Add the required register to configure the PCIe PHY and provide an
example for it.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../phy/airoha,an7583-pcie-gen3-phy.yaml      | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
new file mode 100644
index 000000000000..07bb20152c0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7583-pcie-gen3-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7583 PCI-Express PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  The PCIe PHY supports physical layer functionality for PCIe Gen2/Gen3 port.
+
+properties:
+  compatible:
+    const: airoha,an7583-pcie-gen3-phy
+
+  reg:
+    items:
+      - description: PCIE G3 analog base address
+      - description: PCIE G3 PMA base address
+      - description: PCIE detection time base address
+      - description: PCIE Rx AEQ base address
+
+  reg-names:
+    items:
+      - const: g3-ana
+      - const: g3-pma
+      - const: xr-dtime
+      - const: rx-aeq
+
+  phys:
+    items:
+      - description: phandle to QPHY phy for Gen2 support
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - phys
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/phy/phy.h>
+
+    phy@1fc7f000 {
+        compatible = "airoha,an7583-pcie-gen3-phy";
+        reg = <0x1fc7f000 0xfff>,
+              <0x1fc7e000 0xfff>,
+              <0x1fc30044 0x4>,
+              <0x1fc35030 0x4>;
+        reg-names = "g3-ana", "g3-pma",
+                    "xr-dtime", "rx-aeq";
+
+        phys = <&pcie1_phy PHY_TYPE_PCIE>;
+
+        #phy-cells = <0>;
+    };
-- 
2.53.0


