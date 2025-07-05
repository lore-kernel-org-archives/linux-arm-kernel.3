Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7559EC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 21:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8N/D+LNjM6joi2PRLZ3bneXJiGAN7loEAF6AHLXxyg=; b=Otit0s0PJophttQke+qu8hErTa
	+gqwignpuC12NhwXf7ZLPKI7JXU3Z4SdWbKDTJ8fhC7b9g6fA87glvwDIqaTDaiY7yE5LaJrHl7Ne
	3FxiG9NkSJkIxRBmqXfo6CbW/UA+/8O3GQu1jeyrUWe6lY2yqDpVQlZdJyObWYKIa2w7C5ZxFVQXM
	stHQcyFFJZpv6Y+cHniGOiupmwozhtY8Y+0uC68P0uwJ7MuHu1EquNawde1fFZGQlmglyqZc9SD+g
	M/brEIiEpSRBUXt1SRUBDXt3Gb1uMRBVev00vDeXmHBW0pTNO2ECS5kUIybl5KIXLL3c8kmTPWdn6
	n3qfQROQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYADj-0000000H10b-3Ul7;
	Sat, 05 Jul 2025 21:14:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYA9A-0000000H0cD-2DG7;
	Sat, 05 Jul 2025 21:10:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 838ECA4F1A9;
	Sat,  5 Jul 2025 21:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D87EFC4CEE7;
	Sat,  5 Jul 2025 21:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751749807;
	bh=YNrA+5MDqsLBZeG4SVefmSXufeWSQS+ZGzYEQ0yDjm8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kXc2UQ3wlyUfLvJ1Gx05eau5xlxa+DYqTEUHEmjSR142/kYIQAzaZkggW8W/2QGE8
	 XcCI8nvPFZhV1/W4s1aPOaAkoee0TfwxPW1K22NKRxkLcR6Y2/h9kgubL96V+OukLj
	 2ojU0W+AW5A+gBY8nkWtxCmOZN0t+ED6B/sfi1NSDVi5SZU9AcFMN/YerrKJzKQ+m4
	 TbooZAJ/12X7KIud8hLMVlkXN8F6JTIT51S94VHM/aVQ2+hWk+u+4h325Qm3ZkYoTc
	 25QBjEzAyM7sqAgKr8mmsB8UZryPpvwajWUbHOJUIdUK9DMnARGK9dPR+JcwQ2iJZK
	 at6/9KAvH0OMA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 05 Jul 2025 23:09:45 +0200
Subject: [PATCH net-next v2 1/7] dt-bindings: net: airoha: npu: Add memory
 regions used for wlan offload
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-airoha-en7581-wlan-offlaod-v2-1-3cf32785e381@kernel.org>
References: <20250705-airoha-en7581-wlan-offlaod-v2-0-3cf32785e381@kernel.org>
In-Reply-To: <20250705-airoha-en7581-wlan-offlaod-v2-0-3cf32785e381@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_141008_634908_0980C413 
X-CRM114-Status: UNSURE (   7.93  )
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

Document memory regions used by Airoha EN7581 NPU for wlan traffic
offloading.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../devicetree/bindings/net/airoha,en7581-npu.yaml   | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
index 76dd97c3fb4004674dc30a54c039c1cc19afedb3..db9269d1801bafa9be3b6c199a9e30cd23f4aea9 100644
--- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
+++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
@@ -41,15 +41,25 @@ properties:
       - description: wlan irq line5
 
   memory-region:
-    maxItems: 1
-    description:
-      Memory used to store NPU firmware binary.
+    items:
+      - description: NPU firmware binary region
+      - description: NPU wlan offload RX buffers region
+      - description: NPU wlan offload TX buffers region
+      - description: NPU wlan offload TX packet identifiers region
+
+  memory-region-names:
+    items:
+      - const: binary
+      - const: pkt
+      - const: tx-pkt
+      - const: tx-bufid
 
 required:
   - compatible
   - reg
   - interrupts
   - memory-region
+  - memory-region-names
 
 additionalProperties: false
 
@@ -79,6 +89,8 @@ examples:
                      <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
                      <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
                      <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
-        memory-region = <&npu_binary>;
+        memory-region = <&npu_binary>, <&npu_pkt>, <&npu_txpkt>,
+                        <&npu_txbufid>;
+        memory-region-names = "binary", "pkt", "tx-pkt", "tx-bufid";
       };
     };

-- 
2.50.0


