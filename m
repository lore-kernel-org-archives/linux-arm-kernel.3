Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8D9CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 11:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zERQqIOAvgWcPG79Z0IWHMdjY2LRw3PnoLgmwYlpneU=; b=j0iNkouW1qwm+2RIWu2OSeKkF6
	RYjiV8ZL3w0uIkA5M5gYJpDB3G8qPdUfemFzfI/cKfmpfu9jtkuDry87YfTeDJu/fTHylm/kPrt5u
	N80rKNeT6RZ5Ndn4mF2g6E8rSoyxY4j0G6ahPD7gh6LViRgNYLQy98ypcQHyxXCMFq4fG+sOvanUX
	5SIdw2HLILZN2mN6qEegQrMnMZ0s3yVE/0sNkT2icr/aSpnyXd0CxwSNcSVQsghxIHHTWaHCwphzr
	R/hmqWGFfjB9ULxrmuvEe9fcXJiEP32pPFJ+QBfEd0CIMbEGwtgXp3bHWdL3+bx67xhgth15c8S95
	mt6Dmk+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDL2t-0000000Di30-3qCj;
	Mon, 27 Oct 2025 11:05:51 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDL2j-0000000DhrW-0gwR;
	Mon, 27 Oct 2025 11:05:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761563139;
	bh=mqw9kCJ+8Ey5rH6QLQN9d4RvkYy5a8MGknzprq/c6Dk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rl40TsGAFWZnOjbM6NldaVoZ6R5xh0e62jc280/drIJQfM2Oam8HKRCVmm5NQV3Q4
	 JOPiH1lgNw6d47/nOzuqu6ZFgor/94XLqnY8hwxX3+stCvHy7jNy07U/J7V7LIyI2v
	 1X5Zi1alvUHLbY/AG/soo2Em+RF5WCGP5dCw3hdjifW00VGLGVfl8quOfafOd5NXzc
	 afVxavrk7szbIr3uUL/NDuUdAeNiu2g62sNv2YCu8ft1hA5r4w4ztLo37ZqBO+Cg/E
	 78OCGkt83FhBjNL+GmmOC5bY7Kd6slnE60Me5+dccdidnMLYTyUNCnOnE+dJm97kZN
	 kflQkH0An7UTA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5EB4A17E1276;
	Mon, 27 Oct 2025 12:05:38 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v11 7/9] dt-bindings: iio: adc: mt6359: Allow reg for SPMI PMICs AuxADC
Date: Mon, 27 Oct 2025 12:05:25 +0100
Message-ID: <20251027110527.21002-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027110527.21002-1-angelogioacchino.delregno@collabora.com>
References: <20251027110527.21002-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_040541_450875_B8899592 
X-CRM114-Status: UNSURE (   7.43  )
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

When one or multiple Auxiliary ADC IPs are embedded in a SPMI PMIC
it is reachable at a specific address.

Allow specifying the `reg` property and make it a required one for
MediaTek MT6363/6373 PMICs as those communicate over SPMI and also
disallow it for the others (as it wouldn't be applicable).

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../iio/adc/mediatek,mt6359-auxadc.yaml         | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
index 5d4ab701f51a..e685e5ee224a 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
@@ -25,6 +25,9 @@ properties:
       - mediatek,mt6363-auxadc
       - mediatek,mt6373-auxadc
 
+  reg:
+    maxItems: 1
+
   "#io-channel-cells":
     const: 1
 
@@ -33,3 +36,17 @@ required:
   - "#io-channel-cells"
 
 additionalProperties: false
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - mediatek,mt6363-auxadc
+          - mediatek,mt6373-auxadc
+then:
+  required:
+    - reg
+else:
+  properties:
+    reg: false
-- 
2.51.1


