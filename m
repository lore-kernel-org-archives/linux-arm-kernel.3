Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856DAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 14:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qCsV/vqShpGar2CdE6+oSzfHojJA4x7ZwJRazSD1MM=; b=yJhPj3TtwVBKMYkOKhM65QWom8
	ANdX6GbJFaI/9JiWWh3Uz5Q5k7eLCwIgn1YSTB2psgMlhv36iSWRs4CXgEp/K+q/LN3oCwjEPaWPe
	4crRvNeokkpNINRHINCRHEi/8jW7o38OAJRDY+g79b5pKvVKxX+E4C5ieaEFSP8MC5Gb0zlMw1WBu
	MnipYETg/EmfAsy9PwJ1J0g/txDohBzp4RbBTVbNprKJ0yR16vx8MStjTzztmm4tMqnOVePB46OCY
	Sq8qK4UFb0m/Z02uOhv9Ktaos7CbVb99aqR1MfgPGZnm86/wnqbrhA4K+eSrAONIKfTMtza9yANo3
	mu1D/oZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiYFY-00000006alC-1Kc7;
	Sat, 11 Jul 2026 14:00:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiYFW-00000006akG-2Suo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 14:00:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C21976111A;
	Sat, 11 Jul 2026 14:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 448421F00A3A;
	Sat, 11 Jul 2026 14:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783778409;
	bh=/qCsV/vqShpGar2CdE6+oSzfHojJA4x7ZwJRazSD1MM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TqvoZmeZyNYpuRTxFcr+p7IlzfKrp8ktfhRLiYx8FXlxphTNrhBwtEeqHQzYUQiMj
	 xcZhlr3iQUZUz5qABbz0wINEVdNk+mTswo/3Qn+hcMcaaanE+6JzWOpKTYiHpZ4iea
	 hDWL42FmBHmN8cyMJdmVQgsjxyfqk7ip3laU1gr8tS07RyJg1SojK7keUXdoLyZkxm
	 +r454dde6PU+UVXApe9oTRlHNtk1GxCBJ4VO7LiHfxC3iUoh/BOjWkO/XHQZ2qQvwU
	 c8sVz9OU3xJry2ap5uM4jskFww9Z2pbiw1DBZqcbLAV7uj84Kgq1UWBpeZ2jRXxu3N
	 oGw08pHFxVRMQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 2E5B060194; Sat, 11 Jul 2026 22:00:06 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 1/7] dt-bindings: media: sun4i-a10-video-engine: Fix IOMMU count for H6
Date: Sat, 11 Jul 2026 21:59:52 +0800
Message-ID: <20260711135959.3616919-2-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260711135959.3616919-1-wens@kernel.org>
References: <20260711135959.3616919-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On the H6 SoC, the Video Engine has two memory ports, thus two IOMMU
connections. The secondary one that is missing is likely used for
reading reference frames. The newer H616 is the same. On the other
hand, the D1 only has one memory port.

Add the missing IOMMU connection for the Video Engine.

Fixes: 62a8ccf3a248 ("arm64: dts: allwinner: h6: Fix Cedrus IOMMU usage")
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../allwinner,sun4i-a10-video-engine.yaml     | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
index 01f2afa023f0..932043d7f0cc 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
@@ -55,7 +55,10 @@ properties:
     description: Phandle to the device SRAM
 
   iommus:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: VE port on IOMMU
+      - description: VE_R port on IOMMU
 
   memory-region:
     maxItems: 1
@@ -82,6 +85,22 @@ required:
   - resets
   - allwinner,sram
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun50i-h6-video-engine
+    then:
+      properties:
+        iommus:
+          minItems: 2
+    else:
+      properties:
+        iommus:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.47.3


