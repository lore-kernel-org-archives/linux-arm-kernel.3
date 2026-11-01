Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51D5606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 04:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Aw3XNhA;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=PjO9korU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5wKNpBs2J26ByKRc9aOZS7O7R2Kjv3Zvh9P1Rri0a20=; b=0Aw3XNhAer1a8I
	Y9LDZckD825g5bH/JiqeyXuBPYZvNvBkMsvCMHj5ok9208mYCTcmcGy4BAragCX/y5kj2h+0xmWz9
	kaxskWT0b0MQYbNZqCVgRqN6K+5zKvO55M+z0s2KOuSQ6geUyaes3MNqBQ8dWrNeYXwg56cUlVpr0
	OGC02QQJZSbywyxF9v91TGYV7FdnPs5W+ptKylp8qrDoo8V++4k3BZriwTzvZ90/iOWW8rCiC/Lry
	nJEOcniIIC/Ohpg7m7hrdxn6sKO4qV9FJX/q6U2AwJpKVRatHIsyr3+QLTdNRtjDrlh0sMJKtxNIm
	+PQzOLtmdnsOM5lktgaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNMln-0000000Dr6w-2WCx;
	Sun, 01 Nov 2026 04:02:11 +0000
Received: from mail-m93243.xmail.ntesmail.com ([103.126.93.243])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNMld-0000000Dr1g-1RTz;
	Sun, 01 Nov 2026 04:02:04 +0000
Received: from 5950x.tail741d0a.ts.net (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 530d84144;
	Sun, 1 Nov 2026 12:01:52 +0800 (GMT+08:00)
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
Subject: [PATCH v1 3/6] ASoC: dt-bindings: rk3308-codec: describe ADC routing and jack detection
Date: Sun,  1 Nov 2026 12:01:22 +0800
Message-Id: <20261101040125.1864141-4-zhengxing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101040125.1864141-1-zhengxing@rock-chips.com>
References: <20261101040125.1864141-1-zhengxing@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa195455a8603a8kunm8fccdc7416d2aa
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQk5IVh9MTU1CQkhKTxhKTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=PjO9korUbULQWdWwMJtqpHHF5S0BM6IRU4dLNro65Hf++GRScd+vgPOd0/cPrjqS6e9nbldhKRkElzgHmnIDMOCP81pw3Ty0RHmyw93Z4yFH+62bC/wag+wB+1IdaEddK0O3/1n28qfkbiysCgvLq6Yl/Fcfr85lzwQkgMCHYRE=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=5wKNpBs2J26ByKRc9aOZS7O7R2Kjv3Zvh9P1Rri0a20=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_210201_625351_EEB36BD9 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
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

Describe the internal ADC stereo-group mapping to I2S2 SDI inputs and
constrain it to a permutation of the four hardware groups.

Document the detection GRF, codec and headphone interrupts, and the
board-specific detection wiring for codec revisions B and C. Keep these
resources optional for existing device trees.

Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
---
 .../bindings/sound/rockchip,rk3308-codec.yaml | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
index 2cf229a076f0..68859c64b72b 100644
--- a/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
@@ -36,6 +36,46 @@ properties:
     description:
       Phandle to the General Register Files (GRF)
 
+  rockchip,detect-grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the detection GRF used for headphone insertion and
+      removal interrupts on codec revisions B and C.
+
+  interrupts:
+    items:
+      - description: Codec interrupt
+      - description: Detection GRF headphone interrupt for revisions B and C
+
+  interrupt-names:
+    items:
+      - const: codec
+      - const: hpdet
+
+  rockchip,no-hp-det:
+    type: boolean
+    description: The internal headphone detection input is not connected.
+
+  rockchip,hp-jack-reversed:
+    type: boolean
+    description: The headphone detection input has inverted insertion polarity.
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
@@ -72,6 +112,14 @@ properties:
 
     enum: [ 50, 55, 60, 65, 70, 75, 80, 85 ]
 
+dependentRequired:
+  rockchip,detect-grf:
+    - interrupts
+  interrupt-names:
+    - interrupts
+  rockchip,hp-jack-reversed:
+    - rockchip,detect-grf
+
 required:
   - compatible
   - reg
@@ -85,11 +133,17 @@ additionalProperties: false
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

