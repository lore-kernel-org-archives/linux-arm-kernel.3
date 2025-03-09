Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7B4C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 23:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fvsg997oISgjqp0W2TJFAP7RLXkppIq9T5s0bg5qC1I=; b=mOtCPsAm5H+UaMExFbKvf2Tbl6
	9VMcbdzrgkImy6fVhNeZUf+gyKlOgHxdtbFyu0kxZwVMwi/rMATpjWnMY7FDXpl5a7/+ENqrYtbGU
	Li7pF02vPthwUuSNM0254kZTFh5jXe3YtUP5cmMoJ1g+rGK/eXSE9Dw+iGkM0FvRbGHnh1A5ywPEU
	JeACRUTY4LGVk2lINAXqYAQjIpYLsdz0gJ1H+rmBDjKXmD8rx5jVqtPgoUV9U/lkO08tokuGZKV8G
	VO+Oapw6Qtw/lrpgDmo9c8cGP9zCItPyLGzEpH4ufsRxyTRCKyC9hy2IdJKI/nGflTqGZxqRbF7i5
	gtAtgX0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trQ82-00000001H8V-2rUF;
	Sun, 09 Mar 2025 23:32:18 +0000
Received: from [2a02:6ea0:d71e::9] (helo=smtp.forwardemail.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trQ3A-00000001GI3-1Vm2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 23:27:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1741562799; bh=Fvsg997oISgjqp0W2TJFAP7RLXkppIq9T5s0bg5qC1I=;
 b=ZP3k8g5CnkvMERwpex+A6htbkz3Q/a6RHjeGo5KljlciPmmXwvNNZJTtSdWM1JxmOFkoPvsJQ
 3o2mZxPUyb80ItQUEAxvVHr1LRt2gKAB/bp/14naELRuI+c8yGDccikDq3/45Yr9qgDQpgLZ7c2
 fOoiGs/gCyszNJZO08CeqUu/Msbtbf1gux75A0Jq5nE3tvtl+3Optu71gahHe2ofYO1aY1ZXG49
 UbJZC4ywQyVqREiaGZJOe0TLuwpSQMaDdbqlz/TECmYyNakjQaLame+Pj85IR6hSXNEAEPCij1B
 0aOqTXbse6SAAJM2Z0U9nUrjqST8aVtdQKa40f/Ua1Mw==
X-Forward-Email-ID: 67ce23a95209992d7c670e6e
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
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
Cc: Yao Zi <ziyao@disroot.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 1/5] dt-bindings: net: rockchip-dwmac: Add compatible string for RK3528
Date: Sun,  9 Mar 2025 23:26:11 +0000
Message-ID: <20250309232622.1498084-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309232622.1498084-1-jonas@kwiboo.se>
References: <20250309232622.1498084-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_162716_805079_4141E67A 
X-CRM114-Status: UNSURE (   9.81  )
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

Rockchip RK3528 has two Ethernet controllers based on Synopsys DWC
Ethernet QoS IP.

Add compatible string for the RK3528 variant.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
- Restrict the minItems: 4 change to rockchip,rk3528-gmac

The enum will be extended in a future patch, Pending RK3562 and a future
RK3506 variant also only have 4 clocks.

Because snps,dwmac-4.20a is already listed in snps,dwmac.yaml adding the
rockchip,rk3528-gmac compatible did not seem necessary.
---
 .../devicetree/bindings/net/rockchip-dwmac.yaml  | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index 8dd870f0214d..fe417c19b597 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -24,6 +24,7 @@ select:
           - rockchip,rk3366-gmac
           - rockchip,rk3368-gmac
           - rockchip,rk3399-gmac
+          - rockchip,rk3528-gmac
           - rockchip,rk3568-gmac
           - rockchip,rk3576-gmac
           - rockchip,rk3588-gmac
@@ -49,6 +50,7 @@ properties:
               - rockchip,rv1108-gmac
       - items:
           - enum:
+              - rockchip,rk3528-gmac
               - rockchip,rk3568-gmac
               - rockchip,rk3576-gmac
               - rockchip,rk3588-gmac
@@ -56,7 +58,7 @@ properties:
           - const: snps,dwmac-4.20a
 
   clocks:
-    minItems: 5
+    minItems: 4
     maxItems: 8
 
   clock-names:
@@ -130,6 +132,18 @@ allOf:
       properties:
         rockchip,php-grf: false
 
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - rockchip,rk3528-gmac
+    then:
+      properties:
+        clocks:
+          minItems: 5
+
 unevaluatedProperties: false
 
 examples:
-- 
2.48.1


