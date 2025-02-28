Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17700C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 11:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EotvCmIg76eD5bu40Jq0Nke6pVYu8L5NVdcYEJafa9E=; b=IvRQ/2P2zCXC7Sl50l3khMGEOk
	G0IeHCuP4z1gI+4ckX2rEIpe3R4EehYX+vdnjVRqERx9YagNwyTQscho6OKnpKr3O4+Xv9mc0KR99
	u6Lma+aHgXUum7eeweg7uB1gx2fdaC/OxSbdfpAHC8d06+5f2lfyOM48E+c+bU0pbclAZ7YI9Em5R
	ys3oHLtxvHBFy789dmvAdei4JvgYw6z+IIHZvC5ocR2c4St5Wn9/RLm/nF82Q4EVokZUdWsbK6gHP
	5qv+M9E8sYec5LtjnkHS2/iLuCOX8TaWLE6ga3EGclFIJGgaR/P0oKb4PL2BG4ssjRQRvdBEdMRhJ
	aRuElodw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnyjX-0000000AmXx-31Ts;
	Fri, 28 Feb 2025 11:40:47 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tny1D-0000000AfFK-15s5;
	Fri, 28 Feb 2025 10:54:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1BF9561F64;
	Fri, 28 Feb 2025 10:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA35C4CEE5;
	Fri, 28 Feb 2025 10:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740740098;
	bh=JZDiAKKeX0eSnGFkmKTsrRKkLXrlYR1V8xaHJKtSw9k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nebcMuLEq9KYe/hlqls83NIyHoC4dwhaCJwxe4rkNymL+3yC5ZTyhKDw3CGHZRFK+
	 XT7Gx6sUiJl6KNEI7rLSQjrv6dV8Wdg0DRyYIYqgw8GgZm9hGX/xHDfC2SrPPgVEBF
	 Ww6iRvZHo5l+L6axlcfibY/lLeK0CBa9iXNfzwQnReskUGxJbWLKgIuSWCkn5SlNyq
	 kFXVzlhNE6f0hL9WZYEcdfZhD2g+i3J8CB19FGZmKCd04sH2sVup1VgV1yiTMObirO
	 HuVIQK5P2mda8xDopTx1dDMU22q5h+bwhSrO9Ets04jNnimuA/de9Q6sOge9NgI0fm
	 xJzH7/ju1fd6Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 28 Feb 2025 11:54:19 +0100
Subject: [PATCH net-next v8 11/15] dt-bindings: net: airoha: Add airoha,npu
 phandle property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-airoha-en7581-flowtable-offload-v8-11-01dc1653f46e@kernel.org>
References: <20250228-airoha-en7581-flowtable-offload-v8-0-01dc1653f46e@kernel.org>
In-Reply-To: <20250228-airoha-en7581-flowtable-offload-v8-0-01dc1653f46e@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 "Chester A. Unal" <chester.a.unal@arinc9.com>, 
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 upstream@airoha.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
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

Introduce the airoha,npu property for the NPU node available on
EN7581 SoC. The airoha Network Processor Unit (NPU) is used to
offload network traffic forwarded between Packet Switch Engine
(PSE) ports.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
index c578637c5826db4bf470a4d01ac6f3133976ae1a..0fdd1126541774acacc783d98e4c089b2d2b85e2 100644
--- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
+++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
@@ -63,6 +63,14 @@ properties:
   "#size-cells":
     const: 0
 
+  airoha,npu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the node used to configure the NPU module.
+      The Airoha Network Processor Unit (NPU) provides a configuration
+      interface to implement hardware flow offloading programming Packet
+      Processor Engine (PPE) flow table.
+
 patternProperties:
   "^ethernet@[1-4]$":
     type: object
@@ -132,6 +140,8 @@ examples:
                      <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
                      <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
 
+        airoha,npu = <&npu>;
+
         #address-cells = <1>;
         #size-cells = <0>;
 

-- 
2.48.1


