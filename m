Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80CBE77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 11:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kyd6MbcXMFtlIUsTtNqssgB/X6VbWEfGClpfYsSSoZU=; b=RHltanRvRSBxNEkLSq1WLW6vJI
	x/AS6y63DulHSbtBDKY+tvGOrajPlZ+ycMQw6FbJceqR9YBlHfXL7ogVcPTYA7kcnKu3FFULWCfSS
	G7eUzUKI09amX3oRj3UEUr7J2Ip3jQIUzMIq1nkbn2iswxlyju20V3Df2+tR9DIf+DKSpk8/vUiwT
	a6pJtsEhYc/zPH8SXj3pnC9zVxWU81TzeUXWVIEWYU5rG/fZD7d1+ZWzu8Jd9lpKVbTUqTIzYsLP8
	trQWTd8f87llMSFWf8nqAUGNJ0mFIuchlXmL96tEUwLZlDRe63E0qUnnWmqcHqantEXjZcjlbOH7W
	0ofT/tbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUNk-00000008FIG-0Z0A;
	Wed, 08 Jan 2025 11:37:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUEO-00000008CDO-3yiU;
	Wed, 08 Jan 2025 11:28:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736335689;
	bh=hwSVoiVrEcxOlc7YT2Izw9w3RSFzFJ5UporHevK7NJQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kj5IYNnI/D5CJBsEuRYBflKm9idQByhMZlaSxv18iKgfId7khdRh9azeK6ADKLxrQ
	 IGkhcWOn0JcSBnSfmlVrYDEuGPbIjJr3a2Cf1UuF1wBdx4iJ5OIyMTIn1J96F4G97E
	 Trd+zTIM9AFjEp5mXZtS+9gaQFMme5MmbG3UIAMrKyhXOVJZLUyo9lIEs6H2EiQN7O
	 7ZBZSjt79hMBBnMTR8aZ/aoeU2emTETZETD0Vx2kTYtwoC0UfGmc/X/WLNNWxDiuR9
	 A+iEmOOQwgkRVEXnuXyO0cLLlurRbrjlE2oWstaKnhErpjvfu+iaapgdDWhydY5EJM
	 YLEouw2c4gnuA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A0AB317E1573;
	Wed,  8 Jan 2025 12:28:07 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	jie.qiu@mediatek.com,
	junzhi.zhao@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	dmitry.baryshkov@linaro.org,
	lewis.liao@mediatek.com,
	ives.chenjh@mediatek.com,
	tommyyl.chen@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v4 07/34] dt-bindings: display: mediatek: Add binding for HDMIv2 DDC
Date: Wed,  8 Jan 2025 12:27:17 +0100
Message-ID: <20250108112744.64686-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250108112744.64686-1-angelogioacchino.delregno@collabora.com>
References: <20250108112744.64686-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_032813_161611_9730DD5E 
X-CRM114-Status: GOOD (  11.56  )
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

Add a binding for the Display Data Channel (DDC) IP in MediaTek
SoCs with version 2 HDMI TX IP.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../mediatek/mediatek,mt8195-hdmi-ddc.yaml    | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
new file mode 100644
index 000000000000..d85e8ed2ffa7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek HDMI Display Data Channel (DDC) v2
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+  - CK Hu <ck.hu@mediatek.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: mediatek,mt8195-hdmi-ddc
+      - items:
+          - const: mediatek,mt8188-hdmi-ddc
+          - const: mediatek,mt8195-hdmi-ddc
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    hdmi {
+        hdmi_ddc: i2c {
+            compatible = "mediatek,mt8195-hdmi-ddc";
+            clocks = <&clk26m>;
+        };
+    };
+...
-- 
2.47.0


