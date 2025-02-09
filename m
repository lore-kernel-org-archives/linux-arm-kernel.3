Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBF2C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 12:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZHdp5Nr9tpYEZfm6hk3g26pMU4twGreOws503+v7ZY=; b=krctpR1REA3kQMpGN7Kn2Si5h9
	FCsXC9NQU6ncjzjrMMJkhlqYlEN7v9QdugcQ6GHA7f482Vsni8Aclt8uYvIJajPX61hk33baFndhl
	8wMctoLQYMILz0IMvD3GePwA/z5E/X8P7YgerPoySsY92RTBV/1/DU0tedNt4liU0xcgfNB4O37AI
	NRou/3uVk56hb81L95alhWg1coXVH6zIUMUm/GhKqk2AJ3w7Xdh/TyOBKVpIQYI49H6bgATv5pXjz
	kkSAyEngPD5Kubwcu05RX848ysb1Wz9Y05vth4KYg5Mr39xDY5Pma5PWaMP2Wx7ktdknHDjIz32y1
	7ZC+6a0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th6Ue-0000000Erjq-45cD;
	Sun, 09 Feb 2025 12:33:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th68I-0000000EnjO-0TxV;
	Sun, 09 Feb 2025 12:09:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A983AA400A7;
	Sun,  9 Feb 2025 12:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84588C4CEE2;
	Sun,  9 Feb 2025 12:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739102993;
	bh=bGoyXY6We520lNEfDX0QPxA2F1231s68QjfLe3Ly2HY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d74gv283ED0FtwDRBoPT1/WJ9+QspchMTPL6wCkTAVVnwKn6eiIytv/cv/pqZ9G7W
	 Y4Ks5f70cVPgpO2/JggI6KQuNC5UQhzwlFUOifDe+wrqS8c5ZrSzfpNl1PkdImMha6
	 Ailrzp7FR3hUPy+M1T7v3lcxSUur+Vg1i3QDW+6uX9Vp6vcxAi9Asa5A1uygDd4LaQ
	 TmAMnNoVeLBNd0qX3NOCB2InqsgZO6Tk2C21QHNnlA1t+isVB4jewrS4QTl2bhSQTe
	 ao5qVtLZaGlfRHIX+tqBJdpP/PTDBxViBOEN2KqcCu9LlPwavitalLyJjUo+EgSWFI
	 EmFSQz+ltXH5A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 09 Feb 2025 13:09:05 +0100
Subject: [PATCH net-next v3 12/16] dt-bindings: net: airoha: Add airoha,npu
 phandle property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-airoha-en7581-flowtable-offload-v3-12-dba60e755563@kernel.org>
References: <20250209-airoha-en7581-flowtable-offload-v3-0-dba60e755563@kernel.org>
In-Reply-To: <20250209-airoha-en7581-flowtable-offload-v3-0-dba60e755563@kernel.org>
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
 upstream@airoha.com
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_040954_212603_0547728A 
X-CRM114-Status: UNSURE (   9.36  )
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

Introduce the airoha,npu property for the NPU node available on
EN7581 SoC. The airoha Network Processor Unit (NPU) is used to
offload network traffic forwarded between Packet Switch Engine
(PSE) ports.

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


