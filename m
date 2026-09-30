Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369ABCA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RylIL5PtKoKSEB6fKFx6teI8foZIXlgeBAHnwrC12eE=; b=3eRyxh5RRSfkrfgas+eEyyXb/A
	ohf7iZz+QelW5htt73qYJLntcCqnlBGz6vfnH3NE6X0vNDJcZZyDNILo+yhFu0Wu7uTwI0PO2NMAb
	3rsCV0G5c+PbgSN0sPeX2oPGuP1Y3WjF+rriYW2UzZnATo7R43Wg7xTb9JNzCK4FfFlYD/62jyvlz
	+T7Lui+dtiwS7Xd5pqhzf7TlkSe7HCK3YzGwCwrEH0kyitsgXdnZmCuVancZyC7aNC2aOA+hQMcf1
	1cQVbFpVsLsJH7wLiVHWFijbpmHGbu8D2jE9n6uAGLv91JANEuP918GfcKVUxny0y/sRCQaOFULv1
	ufZD8hTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwYD-00000006ZXa-2nTH;
	Wed, 30 Sep 2026 15:48:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwY8-00000006ZV9-2cOB
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 15:48:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RylIL5PtKoKSEB6fKFx6teI8foZIXlgeBAHnwrC12eE=; b=WKZAs7mVNjTbCETnrhj+vMv42Z
	NsKq1nroOZT3NxpK6T27eX2gXs1Pxa8nlpgVHWDZ0EvEG6EDQjyLt8ceLNhhIidp4AbJeJ8+2pidU
	gidVqQuvh66xNea8NmMvzEZmzGX9yMBHhLpNCA/RBLHRs5TSUE8bTH0RukRlhMZwYSpjNXPejjmM5
	humZDJaPTayhqdbb2Pjx9A1V0rP6+1OIVSdANm17AKahjt525UK0gJt0ek/r1XYpaf7ze5HF4CCgo
	p4Lu1lnhO9NZmzFkVfdkLRa1ewGDN6lKfDqgPHtZWUfJtW+mjjsXrB5sacDYmoIHQ4BRXeWL6KDH1
	rUJCx94A==;
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBwY5-000000041Wd-1qjM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 15:48:51 +0000
Received: by mail-pj2-x0b.google.com with SMTP id 98e67ed59e1d1-39569e136f9so2101146a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 08:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790783327; x=1791388127; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RylIL5PtKoKSEB6fKFx6teI8foZIXlgeBAHnwrC12eE=;
        b=Sn4zoGI2i+f4/lZgCxDRAb6j3Ko73y9oGdofeZ4M7TS0IyvSybYEkCRmw0XyQqWYlQ
         kkMJCu4n9/pQ/QgZG84tDuSy5XUuOLZnb6Xe8CD6Bt9um8B9zQePSlwvSYPOoiQsSng6
         bNbAbSX3If61R4bkkBj74Pthcouhtt8SqqOwXZweOsymnPCBwouhyyzByhlz79jA+lJd
         kyEKqNy26iCV3GZPpGSFNb8Zd1Z1NXqIVD3tzkK61hUzKpaHXBmA+vn71DjugTPeOLcr
         zkSBTjKp8XynMqUY0aQm2ftuXXZhoubD4AIGsdZXC0CtE8ycDEJNnY4lX1+wsrUU6+JV
         yCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790783327; x=1791388127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RylIL5PtKoKSEB6fKFx6teI8foZIXlgeBAHnwrC12eE=;
        b=phEUVFdvN0gSXaaqgG5ju+enzELK9YxXk7ymFfAmQqOPrkfuP2lpDw8lW4rrlr7c/p
         dOq/EOjGYw8GpOGTJhT1gi5yjl/pFg1Li6Ww1CSnpWzIjSgJLeUbTBpNNUvrVneDxWMR
         1p593/WwPClbWYRCsCrk8NhQ3alnf/ee9HoG9DdKHgtHbNERzP7YcwI/raz1JWAzsWAN
         lmENciax1HXevoBulaCbkGPOob1xVr62DBe+Z403b3IkBDUd7MWNvfRgNN16cCEsYLe8
         J0OZ1cRzq6OZI9cNwsh11PDCnWNMMcuX00WUYXVUwv0so/DWxOz7tz4nLB/dPQ4ByHCW
         21nA==
X-Forwarded-Encrypted: i=1; AKwUvBwiUvk426OgKP2gi+1WwP72S9gJO5Vs3q7U68GrYwKfj2yZZHvUs19kglWHcDWHmomkv3JDZ+le6d7qEdV0REJT@lists.infradead.org
X-Gm-Message-State: AFq9FYI1rqfXuQe06GukC2kr/6mfZ1unjC4t4SDNfMSt6OXoUIotDv/T
	APGuQxgfkoqF9cvYDhCdzAN3ThpoEuBBWx7mPdzggMoEowjW+K5PaUK7GEcJnX7ZfXGQ
X-Gm-Gg: AYBFou2S0NIxby/50nEcpsgkyVb/Z25VBOJGQ00sVLH/fiI7Vmo1jC6oGoxb+lMygmS
	HA+nCAdHFcgfyEWRvqMh4x7HgZXGBBlwmf5p39Oe63dCqgjqt1+fP6jhpeRLiTATVzxaRz92c5L
	IsyDw574ABjurXakpdl1QduZeTzPRvLBy2Z0JWX3gsU+Zj4rax/AbAxd6cjAec1y+Z6gLKtBLxv
	RYQJHoBUFBhm9k+CCjln3APJ/lLJyN0JX+tDEEm8BNOW49XgJAV3PsE7EsvZCUHfR+p9s2wcR1K
	Ar/ElLOw0AO8b6PvJJsSjx5LFm/m+U8XvDrre46PMJP7w2m9ldxfIiaBNP2Hr+hHUYMUj7ErSUS
	va6QgI4ZJu5DLnkeDdfRuT82cF6KWx2rAkKrAisQ0TJ03t6ayntO+mCAWHJlvJf8KbNHiUywijr
	jPOuBYu4nYyrI/N3LU9ntI1vYNe5yGmebs9vTyMt3iNJkLLwmJ95RW7Aa7aFSZwHd2CQdJdYvzk
	fC2dTSK
X-Received: by 2002:a17:90b:2888:b0:3a2:b465:fb8a with SMTP id 98e67ed59e1d1-3a4d1ddc911mr1860992a91.67.1790783327152;
        Wed, 30 Sep 2026 08:48:47 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ee4d0af2sm308136a91.2.2026.09.30.08.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:48:46 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: media: Add Allwinner D1 CSIC
Date: Wed, 30 Sep 2026 22:48:33 +0700
Message-Id: <20260930154835.402684-2-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930154835.402684-1-tien.nguyenminh@embeddedlinux.blog>
References: <20260930154835.402684-1-tien.nguyenminh@embeddedlinux.blog>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_164849_647240_20542939 
X-CRM114-Status: GOOD (  19.85  )
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

Add a binding for the camera interface (CSIC) of the Allwinner D1, D1s
and T113. It is not the A31 CSI: its parser and DMA engines are separate
blocks. Only the 8-bit parallel input is pinned out on these SoCs.

Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
 .../media/allwinner,sun20i-d1-csi.yaml        | 111 ++++++++++++++++++
 MAINTAINERS                                   |   7 ++
 2 files changed, 118 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun20i-d1-csi.yaml

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun20i-d1-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun20i-d1-csi.yaml
new file mode 100644
index 0000000000..2bfe2cc9af
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/allwinner,sun20i-d1-csi.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/allwinner,sun20i-d1-csi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner D1 CMOS Sensor Interface Controller (CSIC)
+
+maintainers:
+  - Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
+
+description:
+  The CSIC found in the Allwinner D1, D1s and T113 receives video from a
+  parallel camera interface and writes it to memory. It contains a parser for
+  the camera bus and two DMA engines.
+
+properties:
+  compatible:
+    const: allwinner,sun20i-d1-csi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: DMA engine 0
+      - description: DMA engine 1
+      - description: Parser 0
+      - description: Top-level block (CSI_TOP_PKT)
+
+  clocks:
+    items:
+      - description: Bus clock
+      - description: Module clock
+      - description: DRAM clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: mod
+      - const: ram
+
+  resets:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    description: Parallel input port, connect to a parallel sensor
+    unevaluatedProperties: false
+
+    properties:
+      endpoint:
+        $ref: video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          bus-width:
+            const: 8
+
+          pclk-sample: true
+          hsync-active: true
+          vsync-active: true
+
+        required:
+          - bus-width
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun20i-d1-ccu.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/sun20i-d1-ccu.h>
+
+    csi@5800000 {
+        compatible = "allwinner,sun20i-d1-csi";
+        reg = <0x05800000 0x400000>;
+        interrupts = <111 IRQ_TYPE_LEVEL_HIGH>,
+                     <112 IRQ_TYPE_LEVEL_HIGH>,
+                     <116 IRQ_TYPE_LEVEL_HIGH>,
+                     <122 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&ccu CLK_BUS_CSI>,
+                 <&ccu CLK_CSI_TOP>,
+                 <&ccu CLK_MBUS_CSI>;
+        clock-names = "bus", "mod", "ram";
+        resets = <&ccu RST_BUS_CSI>;
+
+        port {
+            endpoint {
+                remote-endpoint = <&ov5640_ep>;
+                bus-width = <8>;
+                hsync-active = <1>; /* Active high */
+                vsync-active = <0>; /* Active low */
+                pclk-sample = <1>;  /* Rising */
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index f5eff489a8..f4c45c4678 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -905,6 +905,13 @@ L:	linux-crypto@vger.kernel.org
 S:	Maintained
 F:	drivers/crypto/allwinner/
 
+ALLWINNER D1 CSIC DRIVER
+M:	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media.git
+F:	Documentation/devicetree/bindings/media/allwinner,sun20i-d1-csi.yaml
+
 ALLWINNER DMIC DRIVERS
 M:	Ban Tao <fengzheng923@gmail.com>
 L:	linux-sound@vger.kernel.org
-- 
2.34.1


