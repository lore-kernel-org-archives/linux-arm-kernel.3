Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4BC60A2602
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 04:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sEmmZNIZ;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=DZYz7dae
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1mF7Lz7IBagatGyxODZlzpHu7wr/RsOzyw+BwhJT0/k=; b=sEmmZNIZGZmoJo
	TgQ+Cb9ROQCKdPB1h2j26WxIpJDkE3/2sHAJkF3r+l5j6BrNU/wbaWYMsu7UtKTl+gJb8PFOHbbnd
	P4Hu8kek6967yYUaMkTr/qVLN6ZrAHYHnZ/1cpVCr0NEK7oATQ5+IGeuQMQFeMC0E4Orm0pyh1zbx
	dKgQfWgE8dhcXp1U/eDu7xYcZyuHwrQrQkee4fst1c0LIeaKYJBHm35lOIFaVqR2F6OKQN5z40gpj
	6Ux+t/Xf/Wqd/tVGhsMzNwJSInGTv8F+sm+KEkvI5ZT8XUuVKM+Lbh8uUwDZ9BIfpt7ndSbN8zK6/
	BVwLJRgmcQKrZZNkoj0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNNOL-0000000DsrV-1nYN;
	Sun, 01 Nov 2026 04:42:01 +0000
Received: from mail-m12852.netease.com ([103.209.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNNOJ-0000000DsqL-05se;
	Sun, 01 Nov 2026 04:42:00 +0000
Received: from 5950x.tail741d0a.ts.net (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 530dcc2cb;
	Sun, 1 Nov 2026 12:41:55 +0800 (GMT+08:00)
From: Xing Zheng <zhengxing@rock-chips.com>
To: broonie@kernel.org,
	heiko@sntech.de,
	linux-sound@vger.kernel.org
Cc: luca.ceresoli@bootlin.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	huangtao@rock-chips.com,
	sugar.zhang@rock-chips.com,
	lxt@rock-chips.com,
	xing.zheng@rock-chips.com
Subject: [PATCH v2 1/3] ASoC: dt-bindings: rk3308-codec: describe detection and ADC routing
Date: Sun,  1 Nov 2026 12:41:47 +0800
Message-Id: <20261101044149.2018744-2-zhengxing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101044149.2018744-1-zhengxing@rock-chips.com>
References: <20261101040125.1864141-1-zhengxing@rock-chips.com>
 <20261101044149.2018744-1-zhengxing@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1956a037103a8kunmda3ed7c817160b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSkIdVkIZTRoeGRkfSkpDS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=DZYz7dae+TXlq1ldUaqpW2cEH5GfABvLiIGYNIy1MGEno4FbMWU1a0tJGI2pb/PSsI9hUx2r3OOU8cXxCATWLlHBnAAhVER2huRAHK5Oc9DXkR8b2OOSjvbAJuA7TNvoQjb2JVWImUb70GNE+zydg0X+Dee1WOOntiXZ8rYX3rA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=1mF7Lz7IBagatGyxODZlzpHu7wr/RsOzyw+BwhJT0/k=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_214159_304197_4B12C1D2 
X-CRM114-Status: GOOD (  10.50  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe the optional detect-GRF phandle and named interrupt resources
used by the B/C headphone detector. Retain the legacy interrupt order
and index-based lookup when names are absent. Document the detector
disable and reversed-jack properties and their resource dependencies.

Describe the ADC stereo-group routing consumed by the codec driver.
Require four unique group IDs in the range 0-3, in I2S2 SDI order,
matching the driver's validation. Leave GRF routing unchanged when
the property is absent.

Extend the example with headphone-detection resources and ADC routing.
Keep machine-driver amplifier GPIOs and debug interfaces outside this
codec binding.

Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
---
Changes in v2:
- Retain the original detection descriptions and legacy IRQ ordering.
- Keep the binding change in its own patch before the codec change.

 .../bindings/sound/rockchip,rk3308-codec.yaml | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
index 2cf229a076f0..60c6140dc5df 100644
--- a/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
@@ -36,6 +36,49 @@ properties:
     description:
       Phandle to the General Register Files (GRF)
 
+  rockchip,detect-grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the detection GRF used for headphone insertion and
+      removal interrupts on codec revisions B and C.
+
+  interrupts:
+    description:
+      Keep the legacy interrupt order. If interrupt-names is omitted,
+      the driver uses the second interrupt for B/C headphone detection.
+    items:
+      - description: Legacy codec headphone detection interrupt
+      - description: Detection GRF headphone interrupt for revisions B and C
+
+  interrupt-names:
+    items:
+      - const: codec
+      - const: hpdet
+
+  rockchip,no-hp-det:
+    type: boolean
+    description: Disable the internal headphone detector.
+
+  rockchip,hp-jack-reversed:
+    type: boolean
+    description: Reverse the headphone detection polarity.
+
+  rockchip,adc-grps-route:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      ADC stereo-group mapping to the four I2S2 SDI inputs. Each entry
+      selects the ADC group connected to the corresponding SDI input,
+      in SDI0 through SDI3 order. Group IDs 0 through 3 represent
+      MIC1/MIC2, MIC3/MIC4, MIC5/MIC6 and MIC7/MIC8 respectively.
+      All four groups must appear exactly once. For example, <1 2 3 0>
+      connects groups 1, 2, 3 and 0 to SDI0, SDI1, SDI2 and SDI3.
+      If omitted, the GRF routing is left unchanged.
+    minItems: 4
+    maxItems: 4
+    uniqueItems: true
+    items:
+      enum: [ 0, 1, 2, 3 ]
+
   clocks:
     items:
       - description: clock for TX
@@ -72,6 +115,12 @@ properties:
 
     enum: [ 50, 55, 60, 65, 70, 75, 80, 85 ]
 
+dependentRequired:
+  rockchip,detect-grf:
+    - interrupts
+  interrupt-names:
+    - interrupts
+
 required:
   - compatible
   - reg
@@ -85,11 +134,17 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/rk3308-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     audio_codec: audio-codec@ff560000 {
         compatible = "rockchip,rk3308-codec";
         reg = <0xff560000 0x10000>;
         rockchip,grf = <&grf>;
+        rockchip,detect-grf = <&detect_grf>;
+        interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "codec", "hpdet";
+        rockchip,adc-grps-route = <1 2 3 0>;
         clock-names = "mclk_tx", "mclk_rx", "hclk";
         clocks = <&cru SCLK_I2S2_8CH_TX_OUT>,
                  <&cru SCLK_I2S2_8CH_RX_OUT>,

