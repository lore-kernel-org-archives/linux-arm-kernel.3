Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE57C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 14:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/AfBAViuiiShxRn5tvhy+MIoAVsDTEFudHOG/uiVGc=; b=NIXPnSrIL5cXFZLkFRv39NHqOs
	iXTxAZe+9TI+dzZoinyIV2tcg4b/qt2aZIbx36InDD6d/EkX+Ke5aW0em0bcruN0tG13tEqyQakTv
	4W+WlRj/qn7icdafqpkoQH9wBN7U8EYXJ6woR92bzMamPc20JR9Z4H7s7mNS3EK0p+jLRdKxaavnO
	D57xBWNW4Sd/CQbx2QhyUjyNlNk6ZKDEa+jLFsMWo8nn/t4fJzmZ+fDziFhQJqntfIYhphb5pUhZ5
	pW8MqwvGiMnrJkoLM1b6uXxbfCtHyokVSwxqYcWA1cU6SoXWnk4IoLEzEJK6BBiQ8yjs37PB4tqXo
	gATNxI3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiEJ-0000000340T-3OU3;
	Mon, 23 Jun 2025 14:33:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfrj-00000002awm-2Nn2;
	Mon, 23 Jun 2025 12:01:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680094;
	bh=Gs8IvznRVgT9QfG9eZ/tmPi3BniOH2KnrQJ6DGc6zRc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iYYPAhYBcEdWr2Pxq7RQr0NcnTAzg8eNQ3Lj+CKpm1G8aQueLVHP7a6Df41JAMuEt
	 URG8wwmsX1EIRPagkUkfnlF/YzCMOAB2bKnjxgTYySeUCg+VfO+M1hb7xsO7EzGLzk
	 etorfcCnmjlCwqzwh6SnhW/82GTNSE7ejCA5hhsQQj767em6vdi+7TPH/G2e4yob53
	 1Y9AjtswGVbgmvZBNvQsOKKc0a2zaAbM01hpUIFI5/d5FX5OqdzHf8zmc6+gw4rVhp
	 nAfc7rll6eRC0P0RIrW+P84YwLDiXqH/t0xe5hN6IZqLIb5qjy8T6SaH/zFvVpZqNp
	 g8ayy4k5RE+MQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 69F3817E0EC0;
	Mon, 23 Jun 2025 14:01:33 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jassisinghbrar@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 1/2] dt-bindings: mailbox: Add MediaTek TinySYS MHU mailbox
Date: Mon, 23 Jun 2025 14:01:26 +0200
Message-ID: <20250623120127.109237-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120127.109237-1-angelogioacchino.delregno@collabora.com>
References: <20250623120127.109237-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050135_825721_01373DEF 
X-CRM114-Status: GOOD (  12.58  )
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

Add a binding for the MediaTek TinySYS MHU mailbox, used for IPC
with the TinySYS hardware integrated in various MediaTek SoCs.

This mailbox handles a custom MHU enabling communication through
the TinySYS SCMI protocol.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek,mt6985-tinysys-mhu-mbox.yaml     | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,mt6985-tinysys-mhu-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,mt6985-tinysys-mhu-mbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,mt6985-tinysys-mhu-mbox.yaml
new file mode 100644
index 000000000000..20fa5cb0ca0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,mt6985-tinysys-mhu-mbox.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/mediatek,mt6985-tinysys-mhu-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek TinySYS MHU mailbox
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  This mailbox is used for Inter-Processor Communication (IPC) with the
+  TinySYS hardware integrated in various MediaTek SoCs and handles custom
+  Message Handling Unit (MHU) enabling communication through the TinySYS
+  SCMI protocol.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6985-tinysys-mhu-mbox
+      - mediatek,mt6989-tinysys-mhu-mbox
+      - mediatek,mt8196-tinysys-mhu-mbox
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#mbox-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    tinysys_mbox0: mailbox@1c351000 {
+        compatible = "mediatek,mt6985-tinysys-mhu-mbox";
+        reg = <0x1c351000 0x1000>;
+        interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH 0>;
+        #mbox-cells = <0>;
+    };
-- 
2.49.0


