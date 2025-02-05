Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B302C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 18:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lbRt6Y31OGoiPxGLoEnZwlzlRYqRacF0C5Z4khHJ6mU=; b=Mu4iP7dMfmYW6eyPz1FXoN0D2c
	zxiluKYqGdgyY4WueKVQn/JRNt+gAfU9AAM3SFZsTI26dslLWu7BPdsN/fGt6Hjlsf9Ehs2jLq9EP
	yLlaXt0FeRhSm22VvEVVg2/C2L/lB/uLHLBaGg9ye13oIkZR++N57y16wOlHCvNDwmXn3es63mfjZ
	7mhRq5QSiNHlkY7xxOS6NFM/A9XmlFidh4ZYi+E6z5NSOS2HEHNpAbk5KSbpFUt8kIhRR8LPHNwpV
	G4ZSOHA2lRXi6YlL0QkMzc4dtz5wpxBVd1DhPh/dlx9pvwZm35oxkvd+cuibef/OFV3LFoOipKe4x
	l9I+K1uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkFg-00000004Hcu-0jyO;
	Wed, 05 Feb 2025 18:35:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfk2e-00000004Ecm-1oWY;
	Wed, 05 Feb 2025 18:22:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 25B2D5C077F;
	Wed,  5 Feb 2025 18:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 413D5C4CED1;
	Wed,  5 Feb 2025 18:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738779747;
	bh=zTdTUW0dwrafTX4itj2ohGtbrJbqJHnQvGtwFC7cl2g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DLGbUfrjnmGg9dZdE579scDaj5f+/erqucRWaAd9TkBgkj7b6EU4T7nslZ5vlL6Hj
	 wQNjU7RWK8v55s4XzTvK+SAx4IQuU0qGHPNayuwibRmmF8HDZZqqRkIrek+mvwtM8n
	 luFYDhKOBCBAAHqxJAVX+WN1ArgSocG5wYkG0aIzv/4LX1bTTbBJHClpJwK1FsVJDk
	 vkYv0Y9VNVySkUN9NFl4Js6A7VLO5GKK47C637yQcYGmEPkQdZM81ihfdiQxIpSkHE
	 ocm0iHXdYWcMlzBUZgNk68ImdLfosItzmUv+4u8MN0Goy3ci2rMclkAyHAi+gOyX2C
	 bnj6SB4kdxK2A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 05 Feb 2025 19:21:28 +0100
Subject: [PATCH net-next 09/13] dt-bindings: net: airoha: Add airoha,npu
 phandle property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-airoha-en7581-flowtable-offload-v1-9-d362cfa97b01@kernel.org>
References: <20250205-airoha-en7581-flowtable-offload-v1-0-d362cfa97b01@kernel.org>
In-Reply-To: <20250205-airoha-en7581-flowtable-offload-v1-0-d362cfa97b01@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 upstream@airoha.com
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_102228_517722_799C9009 
X-CRM114-Status: UNSURE (   9.30  )
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

Introduce the airoha,npu property for the npu syscon node available on
EN7581 SoC. The airoha Network Processor Unit (NPU) is used to offload
network traffic forwarded between Packet Switch Engine (PSE) ports.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
index c578637c5826db4bf470a4d01ac6f3133976ae1a..6388afff64e990a20230b0c4e58534aa61f984da 100644
--- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
+++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
@@ -63,6 +63,12 @@ properties:
   "#size-cells":
     const: 0
 
+  airoha,npu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the syscon node used to configure the NPU module
+      used for traffic offloading.
+
 patternProperties:
   "^ethernet@[1-4]$":
     type: object
@@ -132,6 +138,8 @@ examples:
                      <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
                      <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
 
+        airoha,npu = <&npu>;
+
         #address-cells = <1>;
         #size-cells = <0>;
 

-- 
2.48.1


