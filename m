Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4023CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 18:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1Ro5YtAH5k0RzlV6b5zRfbYmbqU6rbBkIaQU5ZM84o=; b=zIKqICOY5KCYzt5ffq1m2JTd/T
	UrFBEPrE/QK3uWhU7af2Nt6ZFsgkGJK7xb1MoWFJ3jlL5JWsZwWW7tlvX6L6nTddt4exBe2Y2b/6m
	TZOZmahawe8yASfyUz/OVb/+fXIwtLp56H/knEYx5Js0E68dsLmOMGJ1cV63wpwHqRj/zIzEQ6Y9/
	m81JpCjn2wfGYBUMv43HT/kDMQ3vTqbrtU4yJb3M7bbdC4tx4aMYsGenf9gz784LNStxN2sBwyF1i
	0k5gnZ0VdVMSd5C7hV2itq62mKILeZMdmiVR6I7G1dFplkjftg6pviqe3792Icb3fCxcseqz62zlp
	gU8hs+Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulX5M-00000008ktV-2Rdi;
	Mon, 11 Aug 2025 18:17:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUVO-00000008Cyz-2cYY;
	Mon, 11 Aug 2025 15:32:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2E2525C5531;
	Mon, 11 Aug 2025 15:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D3BC4CEF4;
	Mon, 11 Aug 2025 15:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754926329;
	bh=Xm87dAvHgr64si5BCruI649fUNe+2Ev1eMQ1d5E6VVE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HgFn+kyED/UcHzrW8hAmrKVvxJwo+QGtPd5TdszPD18pFoaRKDCVyiV2rDfzSKkZz
	 sjsWQ7KW98MoLPKxOqse3G4Bhhbr/qnhI98XSEfEIMIBr62dQ01rLXccgaYcHrrTK7
	 Z1d3Q8zvQQ0foKt84TXDQAD18h1ccm1QaHnvAFDN0y2YXjmiQ/pYX4DXwCNNOEtHXM
	 QlHZyAiR6hU4HvGwm1WHzY8SN1zXAqCIXrNAnucaEZd3qIb6g+VvX/G1DuoyxcNksY
	 D7GFGAUrt6fJJzkTl7IeIIp1bLI+csnXpNApx+nsw5z+CLw85eViaApJfDgBb3nzuh
	 WkCqB/BjV2rMQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 11 Aug 2025 17:31:36 +0200
Subject: [PATCH net-next v7 1/7] dt-bindings: net: airoha: npu: Add memory
 regions used for wlan offload
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-airoha-en7581-wlan-offlaod-v7-1-58823603bb4e@kernel.org>
References: <20250811-airoha-en7581-wlan-offlaod-v7-0-58823603bb4e@kernel.org>
In-Reply-To: <20250811-airoha-en7581-wlan-offlaod-v7-0-58823603bb4e@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_083210_755557_5A5EC56E 
X-CRM114-Status: UNSURE (   9.17  )
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../devicetree/bindings/net/airoha,en7581-npu.yaml | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
index 76dd97c3fb4004674dc30a54c039c1cc19afedb3..c7644e6586d329d8ec2f0a0d8d8e4f4490429dcc 100644
--- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
+++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
@@ -41,9 +41,21 @@ properties:
       - description: wlan irq line5
 
   memory-region:
-    maxItems: 1
-    description:
-      Memory used to store NPU firmware binary.
+    oneOf:
+      - items:
+          - description: NPU firmware binary region
+      - items:
+          - description: NPU firmware binary region
+          - description: NPU wlan offload RX buffers region
+          - description: NPU wlan offload TX buffers region
+          - description: NPU wlan offload TX packet identifiers region
+
+  memory-region-names:
+    items:
+      - const: firmware
+      - const: pkt
+      - const: tx-pkt
+      - const: tx-bufid
 
 required:
   - compatible
@@ -79,6 +91,8 @@ examples:
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


