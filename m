Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED41C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 17:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmpfi7iCfFn66XJdVNniJdsS7m26ms/0t09dSMCzjIc=; b=FDfxA1RGdJwJYUMhYfveyXK0QP
	AcH4GgpmSvr7KmveKTzj4RdLcXED8c0fCQEIgfuAgxMeyLwSsSWj/MYoWaz8x5WXvBCknHzmJlEY7
	I2h0DvU5AS0pQWbFR/tei5KVXce8pIYFKblGUlP8VK4p51qyVZR4gp/mYgPpKjPawFooBY+7dC9tC
	QtmsMzuulKxbF2KbFpcNvxlaj9fSKngKffsfopGTQPxaIj3Xww7QW4I1itiyVvU/A0AepfUxExUjK
	dSkiJKdrJ8df7n202GRzkjHo8dJHjA5b/H5SFgNKLRf4PFs8HkWDzPzWE09hFMycFfk+tHjBGGyN8
	q8sWZmwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWf3Q-00000006GTn-1KlP;
	Tue, 01 Jul 2025 17:46:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWceN-00000005qUC-3rTS;
	Tue, 01 Jul 2025 15:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751382718;
	bh=6txTiD2AyRmqoHCYxbM4ZdaNUVF5YvLjBexLwl7V0VY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NSrmJhYmpSjO8ICnCSznoFE0fP08fy0Myz3r6LBMqvtOqhke1eUYtn6+RGOHww5Hb
	 MhkFecnO1JRvmfcKPzk7Qhgpll6jY/DSlsSj51cGLDL74JAJZ42c3LaacIBzjRBt3d
	 2jkjqVIqAby4yGSzikc2WgK/TmyrJw7bTQ/Iqw/JxTOoRNixErkGfC7/JlvBKfgwhK
	 Ryiv3b3aR3vW8wotuoIltmY2DKiVHbaU0KCt6aq5v9istkArIQWKZrtZ+XNL/3BHPJ
	 qKQ5f1elYeB2u1Pgz+XrT8WRSiR4Nrv43TeFW1mc+P71pBhnDxthnQwQVL4lcRSCGT
	 NuWUJDMbzzDhA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 616C017E0676;
	Tue,  1 Jul 2025 17:11:57 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: krzk@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ulf.hansson@linaro.org,
	arnd@arndb.de,
	m.wilczynski@samsung.com,
	nm@ti.com,
	khilman@baylibre.com,
	kabel@kernel.org,
	quic_hyiwei@quicinc.com,
	pjp@fedoraproject.org,
	tudor.ambarus@linaro.org,
	drew@pdp7.com,
	u.kleine-koenig@baylibre.com,
	gregkh@linuxfoundation.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	laura.nao@collabora.com,
	kernel@collabora.com
Subject: [RFC PATCH 2/3] dt-bindings: firmware: Document the MediaTek Hardware Voter (HWV)
Date: Tue,  1 Jul 2025 17:11:48 +0200
Message-ID: <20250701151149.136365-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701151149.136365-1-angelogioacchino.delregno@collabora.com>
References: <20250701151149.136365-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_081200_103165_3C490E75 
X-CRM114-Status: GOOD (  16.21  )
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

Add documentation for the new MediaTek Hardware Voter, found in
MediaTek SoCs like the MT8196 Kompanio Ultra for Chromebooks and
the MT6991 Dimensity 9400 for Smartphones.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek,mt6991-hardware-voter.yaml       | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.yaml

diff --git a/Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.yaml b/Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.yaml
new file mode 100644
index 000000000000..173b74c23a91
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2025 Collabora Ltd
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/mediatek,mt6991-hardware-voter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Hardware Voter (HWV)
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek Hardware Voter (HWV) is a SoC-internal fixed-function MCU
+  used to collect votes from both the Application Processor and from the
+  various other remote processors present in the SoC, and transparently
+  turn on or off various hardware resources (for example, power domains
+  or system clocks) based on aggregation of votes done in the HWV MCU's
+  internal state machine, therefore guaranteeing synchronization of the
+  hardware resource requests between all components of the SoC and hence
+  avoiding, for example, unclocked or unpowered access to the hardware.
+
+properties:
+  $nodename:
+    pattern: "^system-controller@[0-9a-f]+$"
+
+  compatible:
+    const: mediatek,mt6991-hardware-voter
+
+  reg:
+    items:
+      - description: Address and size of the Hardware Voter MMIO
+
+  power-controller:
+    $ref: /schemas/power/mediatek,power-controller.yaml
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: true
+
+examples:
+ - |
+   scp_hwv: system-controller@14500000 {
+     compatible = "mediatek,mt6991-hardware-voter";
+     reg = <0 0x14500000 0 0x3000>;
+
+     power-controller {
+       compatible = "mediatek,mt8196-hwv-scp-power-controller";
+       #address-cells = <1>;
+       #size-cells = <0>;
+       #power-domain-cells = <1>;
+     };
+   };
+
+   /*
+    * For RFC patch only, this will be removed at patch v1
+    * Note 1: Clock controllers have more than 90 registers in HWV
+    * Note 2: The HWV integrates the power controller, so that's why
+    *         that is a child node of HWV, but the clock controllers
+    *         are completely separated (in hardware) from the HWV's
+    *         physical location (other than address space)... so it
+    *         would be wrong to place those as children of HWV I think.
+    */
+   clock-controller@16640000 {
+     comaptible = "mediatek,mt8196-pericfg-ao";
+     mediatek,hardware-voter = <&scp_hwv>;
+     #clock-cells = <1>;
+   };
-- 
2.49.0


