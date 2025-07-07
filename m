Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D762C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 11:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CyiFSzXt+wwMwb6ZVnfCoX5gQO5MmW6evOyRdWlnlCc=; b=MpAykcc9oglQD6AaDRMj6qS9jo
	rv4WxAiwjzuEKg9amG1RVb+7BSv9sZRQTFmZBYQjyF0g4hEwjBhtIDt8DRwa5P8748md7F83qv2DM
	LK2Lf8br4jVqqejJvtoniYINjDoJ9TjyGpSfbUh8aCERr5H4tvLHUdWfGafR5e1MSYru1LwmFFSkw
	FP3kBkfOZxMhAfkc0S/xQK2eu31HgeUdph93UUp3JqIwvYpGqfY0Njrm+6ujMhH/ngaFUK+wyNREL
	P1XIg52dyGpe3t61OYCSZ22YxchhkrI1S7AWTsZQcWlzpCYkQHlzFzuLTQpGJ9KxmGfWJ+LenetF9
	Z2HX9N9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjzE-00000002H3q-2wwR;
	Mon, 07 Jul 2025 11:26:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjWD-00000002DAB-45Ev;
	Mon, 07 Jul 2025 10:56:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751885776;
	bh=KHr4A5nG0FU7osUHbAlxCjMzJS9aprXshutzewcPyjI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gUXl0ElYdw1eO6ewpMWumjDgKHXeIxg9jAQu97kgZ8/B3VOxoMaVj3Hn4yVipnFlz
	 rqw8e+0tevEqCCGenOvbXymjP5dAmA/1ca6MgJI6wQ2Xzi7rN900EaDSt+jfS0w7Nh
	 TyYEWFK07bJ21IFfLqxjqyhd0AJXRnQ3bSRa+y9f4EUQ+A0T2oikH3t1uwXZgS5uTy
	 SWrS73PA8A7O6BGZbCNC5/twH/dWwSealJ0RTM7pd0cokSne+lEUGE99AT0Hhr09oH
	 +nS+IKq6ZQTivkTnRHu6liMVpNfa8Tf5/S+wM/+H3bFrQVbRwixW4JRvwP6kRHwmu1
	 eS1oBIJuAjusQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2437F17E053B;
	Mon,  7 Jul 2025 12:56:15 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ulf.hansson@linaro.org,
	y.oudjana@protonmail.com,
	fshao@chromium.org,
	wenst@chromium.org,
	lihongbo22@huawei.com,
	mandyjh.liu@mediatek.com,
	mbrugger@suse.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH v2 01/10] dt-bindings: memory: mtk-smi: Document #access-controller-cells
Date: Mon,  7 Jul 2025 12:55:56 +0200
Message-ID: <20250707105605.98248-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707105605.98248-1-angelogioacchino.delregno@collabora.com>
References: <20250707105605.98248-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_035618_156558_D7A21423 
X-CRM114-Status: UNSURE (   8.50  )
X-CRM114-Notice: Please train this message.
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

Some of the SMI Common HW provides access control to at least
the power controller: document the #access-controller-cells
property and allow specifying it only for MT8183 and MT8365
as those are the only known SoCs with an SMI acting as access
controller.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../memory-controllers/mediatek,smi-common.yaml  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
index 0762e0ff66ef..74b355a08493 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
@@ -74,6 +74,9 @@ properties:
     minItems: 2
     maxItems: 4
 
+  '#access-controller-cells':
+    const: 0
+
   mediatek,smi:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: a phandle to the smi-common node above. Only for sub-common.
@@ -168,6 +171,19 @@ allOf:
             - const: apb
             - const: smi
 
+  - if:  # for SMI providing access control
+      properties:
+        compatible:
+          enum:
+            - mediatek,mt8183-smi-common
+            - mediatek,mt8365-smi-common
+    then:
+      properties:
+        '#access-controller-cells': true
+    else:
+      properties:
+        '#access-controller-cells': false
+
 additionalProperties: false
 
 examples:
-- 
2.49.0


