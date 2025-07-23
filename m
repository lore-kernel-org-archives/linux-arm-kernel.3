Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07380C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 17:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIOrWGXMRNL667biqy07Fg/ivWHA4Pq+HGgkii053wo=; b=lXcJnEExsiexZKekKWMH2Y4OP/
	IHAf7oNFSwaCvO8HEneTzTGo0Pcx/OxPz3WRTTRE5MHHOwo6CUJzF75YAylj9bqdzxbPmt1ZmZ3Mi
	NjQgTx61p/TvVXk8E5T23+W6M1bdfiHWEXV2ZeiGWTLA+Xcp0syJzbx2GCjhkVJRhxMmGJyUmoRrD
	Pym+Rwl/k7JwppUHRfYzR2ORA3+Yyatq9LIgm3DpZTLQnO8L6DFt3sfrHVuno9Ay7ceCS7DLufq1Y
	rUsp2QguZb44Q+ZOi1NC54jnm9W6Y1zgqsr9KUIDCNt9S4oXXMYFtZpgEUDBfRwZxTwct3bkXObO4
	b0i64e0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uedDI-00000005azj-2sMl;
	Wed, 23 Jul 2025 17:25:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ued8S-00000005a4I-2PaS;
	Wed, 23 Jul 2025 17:20:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 029365C4B5E;
	Wed, 23 Jul 2025 17:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50322C4CEE7;
	Wed, 23 Jul 2025 17:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753291207;
	bh=+GGAMF7MuMhiA/+l9JWL1k4u4nOfRTZzdne1gu79CMg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=anByd8HOVyrenPDIceA5B8DQX2JkYDbKyEi1BB6YnlBv/P60GAwP4p5EhveI1Fk5A
	 0T+yJ948atcQtzuVTWdr0ecIDOUrv8JF4G72Z9OfZTV/erBuKCPOHzpZGazU7f704Y
	 6J3gjaehfaHCquAdUCVtSsbKO7Q86V2dSPTD2yQpPo0YEIVwYFEd0u5LG/Ai5UNVn/
	 I8Hrz+mkn0ocxtJT3f0l3P7zhx+wjQvQ8oSnuZY4kis2d03dt614Bh2/xlDwXBYBBI
	 fwDqE3YGTULluS1IB7kMuA624+iPFjSVBNL6otmDvnwnDjmOVCUlZG0lec1Q/16Rvn
	 1XqixUEuiIinw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 23 Jul 2025 19:19:50 +0200
Subject: [PATCH net-next v5 1/7] dt-bindings: net: airoha: npu: Add memory
 regions used for wlan offload
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-airoha-en7581-wlan-offlaod-v5-1-da92e0f8c497@kernel.org>
References: <20250723-airoha-en7581-wlan-offlaod-v5-0-da92e0f8c497@kernel.org>
In-Reply-To: <20250723-airoha-en7581-wlan-offlaod-v5-0-da92e0f8c497@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_102008_658942_DAB1ED22 
X-CRM114-Status: UNSURE (   8.75  )
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
offloading. The brand new added memory regions do not introduce any
backward compatibility issues since they will be used just to offload
traffic to/from the MT76 wireless NIC and the MT76 probing will not fail
if these memory regions are not provide, it will just disable offloading
via the NPU module.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../devicetree/bindings/net/airoha,en7581-npu.yaml    | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
index 76dd97c3fb4004674dc30a54c039c1cc19afedb3..f99d60f75bb03931a1c4f35066c72c709e337fd2 100644
--- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
+++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
@@ -41,9 +41,18 @@ properties:
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
+      - const: firmware
+      - const: pkt
+      - const: tx-pkt
+      - const: tx-bufid
 
 required:
   - compatible
@@ -79,6 +88,8 @@ examples:
                      <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
                      <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
                      <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
-        memory-region = <&npu_binary>;
+        memory-region = <&npu_firmware>, <&npu_pkt>, <&npu_txpkt>,
+                        <&npu_txbufid>;
+        memory-region-names = "firmware", "pkt", "tx-pkt", "tx-bufid";
       };
     };

-- 
2.50.1


