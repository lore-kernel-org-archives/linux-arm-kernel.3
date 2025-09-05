Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324F1CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=28hWbwauwaaUzRKE5Rn+QofWKCrZmo0Z+fU+KOp7vb4=; b=26FFA8oVmyIHWdZyVL03rS0+WX
	ZndLcmKTITsaHxbjbVNAiynf2ApOUQb5eJ0r3uoTaH7ak+73G7i2sfx/7/ozLW3jZKOZJjilAkQTr
	pzmSNY0hD01htOSyHzwKe7z6sRAjQo8ndnu48yIwCQtNdlsFVZEkSuNWWES5ugPIV2P8hMlY8SG11
	J/goG59PS02qjtvDnBtgrlP8quOydPkYTDg+IRSmSBwF/9+YQIfQJDGjeEykYEhFpKGD3gHE60Z7T
	mYHYinmceu15JxO0dbvaAOEB4r+2DgN2rgwxRs1Jn23+AKmK+8RhAaO2PhKOpZWrpwDJ+avEsjzvH
	hgmI9zow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXXg-00000002Niz-3Y4m;
	Fri, 05 Sep 2025 14:35:56 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuTc7-000000012Aa-223k;
	Fri, 05 Sep 2025 10:24:17 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1757067840; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hfGlNTvaNfyjc7EUprihGHziCko/dyeAG0KhFB9+bcFFP32qZp+sZLwN/ZZu5yQ8HA+cbOYCi2fjL8tMXPZBAnZFzBsVIMlOAC7ocMa9oXC4oN5dr+2ltvkAWrMI+IHQ+If6hVFpRpmq+pet80MJdCxLXtrA0X61I9ZIUfFmJuE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757067840; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=28hWbwauwaaUzRKE5Rn+QofWKCrZmo0Z+fU+KOp7vb4=; 
	b=fRAtYjYE1HZUDBdUduTBLgTjIGgSa8d2R3AfVu1Tdrh5Vvj52313olGIBEQXj2QV+Qm63DL6XlslM9bJIfa5fU+FzHR0ll6PPUGUozWHr66U06oe7iRVFXGnsiiqTNquDyGxGMkLuISAmkaaJ4m7ZoY7RVhoUQtxKf93ct+uLI4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757067840;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=28hWbwauwaaUzRKE5Rn+QofWKCrZmo0Z+fU+KOp7vb4=;
	b=Hldl4bd6STxNyqkR5U1l/1OGA2b+HBhwp9EuJ057EXjMDyFLGajTZ57A3Ponm3z5
	OhZ77KKk2vMpmEEDEWEjKKgkV737SFGo3Z2WoWgamA70ZxR8g6YS9TdaKmxpNbEInSr
	YG5PYBoPHu3y/3LmMw4XriI3fdFB5Rgb2I+HoRi8=
Received: by mx.zohomail.com with SMTPS id 1757067839865275.92172227990136;
	Fri, 5 Sep 2025 03:23:59 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 05 Sep 2025 12:23:00 +0200
Subject: [PATCH RFC 04/10] dt-bindings: mailbox: Add MT8196 GPUEB Mailbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-mt8196-gpufreq-v1-4-7b6c2d6be221@collabora.com>
References: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
In-Reply-To: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_032415_558096_A0A2E0D3 
X-CRM114-Status: GOOD (  13.39  )
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

The MediaTek MT8196 SoC includes an embedded MCU referred to as "GPUEB",
acting as glue logic to control power and frequency of the Mali GPU.
This MCU runs proprietary firmware for this purpose, and the main
application processor communicates with it through a mailbox.

Add a binding that describes this mailbox.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../mailbox/mediatek,mt8196-gpueb-mbox.yaml        | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,mt8196-gpueb-mbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,mt8196-gpueb-mbox.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..506723d54ae0a429b462914f3666184c24c4fc5a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,mt8196-gpueb-mbox.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/mediatek,mt8196-gpueb-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MFlexGraphics GPUEB Mailbox Controller
+
+maintainers:
+  - Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8196-gpueb-mbox
+
+  reg:
+    items:
+      - description: mailbox data registers
+      - description: mailbox control registers
+
+  reg-names:
+    items:
+      - const: mbox
+      - const: mbox_ctl
+
+  clocks:
+    items:
+      - description: main clock of the GPUEB MCU
+
+  interrupts:
+    items:
+      - description: fires when a new message is received
+
+  "#mbox-cells":
+    const: 1
+    description:
+      The number of the mailbox channel.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - interrupts
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mediatek,mt8196-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    gpueb_mbox: mailbox@4b09fd80 {
+        compatible = "mediatek,mt8196-gpueb-mbox";
+        reg = <0x4b09fd80 0x280>,
+              <0x4b170000 0x7c>;
+        reg-names = "mbox", "mbox_ctl";
+        clocks = <&topckgen CLK_TOP_MFG_EB>;
+        interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH 0>;
+        #mbox-cells = <1>;
+    };

-- 
2.51.0


