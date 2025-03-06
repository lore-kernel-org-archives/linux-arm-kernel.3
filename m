Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D701C28B24
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 21:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6VW3CJR3YgKXxnut+qsI9aD1jITQWnOV71qJ1GMseJA=; b=vAo6cPfbeHFn+3ZoxNyqkKLkTd
	n5HOrMQWZazA07d5NaEgeBGiLSG/YaPp/YmGlkUM0iVYYKOBEGuYxXGpSwZKmg0vK63AvAXKHLrZY
	FjyKor9RrpTJLIz5k1cTidcPASRUOTAplxaKUczxIf+njRKg0zuG8Kfp5Ig5SuaWphN3VCxXBKz8m
	dPQ670x82ZPfk61wqTY1mv6LQcyeJtLjG2SpAtJUJsR6HSnA1exuAQJeIVBP4kyFzCBAQ2z8TZQhS
	E+fxGQOglGVZqd0qpgueDwIGWzvNPlP/zVG551P/ib3V6OzCrRhrKlgfbEiJj+5bMw5w22JECky3V
	o/EdGjDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqIXk-0000000CEmG-3DXM;
	Thu, 06 Mar 2025 21:14:12 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqITo-0000000CDtl-2jxM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 21:10:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1741295408; bh=6VW3CJR3YgKXxnut+qsI9aD1jITQWnOV71qJ1GMseJA=;
 b=Sjx5FjwiDGwDQyq3bkQuBbfTHp4ZxBQzioYegid2PtrJZMJ3zBl5ZTfj4v1s7ueCOEUfXX0Ct
 eUXdqhwsRtMnJU1pGXE3eJVz3T0o6JF52taKfwzi8N9Q5dRA4NWnzpLImJlcbn0AkbcozmNBN4b
 EyEMrDnuNhyW+5azMz8DDJNnYRsCbLL7AKSVL1+6oR61GvYFHx6Pd3CxGtlUDhJ8gXTh5QwsiqA
 YZzOeprk+vn8bM35HeGnkxgo80Fn0/xqXnnamP8ASNVbfXQZwgvjExhTE42P9CHjjaZxyjLYI5u
 JAUQK7vo/CDMBOxgn3gWUMOJbkHJSkB7rsVWhz/u2A0Q==
X-Forward-Email-ID: 67ca0f28ad3e70e1cd99d807
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Wu <david.wu@rock-chips.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 1/2] dt-bindings: net: rockchip-dwmac: Require rockchip,grf and rockchip,php-grf
Date: Thu,  6 Mar 2025 21:09:45 +0000
Message-ID: <20250306210950.1686713-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306210950.1686713-1-jonas@kwiboo.se>
References: <20250306210950.1686713-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_131008_725950_73ED0C0C 
X-CRM114-Status: UNSURE (   8.51  )
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

All Rockchip GMAC variants require writing to GRF to configure e.g.
interface mode and MAC rx/tx delay.

Change binding to require rockchip,grf and rockchip,php-grf to reflect
that GRF (and PHP-GRF for RK3576/RK3588) control part of GMAC.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
---
 .../devicetree/bindings/net/rockchip-dwmac.yaml | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index f8a576611d6c..05a5605f1b51 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -32,9 +32,6 @@ select:
   required:
     - compatible
 
-allOf:
-  - $ref: snps,dwmac.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -114,6 +111,20 @@ required:
   - compatible
   - clocks
   - clock-names
+  - rockchip,grf
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3576-gmac
+              - rockchip,rk3588-gmac
+    then:
+      required:
+        - rockchip,php-grf
 
 unevaluatedProperties: false
 
-- 
2.48.1


