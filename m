Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD38C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 21:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/ujcC5nq+Y57EaiIBIvtCu4qYPsR76utxdU3XJmP/Y=; b=EbrmcolJIfW/ecNmbPSyx/pLpo
	FHXxQmjrYXKFtydnm04F5MkZJW/pG0QRGEWKHJdW46kCqIpKgpCeIwkBt9UB8a6vGjLX4l0bm2zzd
	q8P9U9R0q01Cuilzw40fnO9hDUihtsTLb0cYHaCZAxxB1JzgbyNpqSJpFtXTU4X3e1suft10c5A3L
	7lM3lKJJj6EOwscbhh9pB7DaVZGp+cFHS3b+MokhXkp+Epl0W4nuioj4V2ltkVzHWrmJN0+9ra0mU
	naQOZpRStOwwg4+uwmfpMMbknAwr2Rb+tWNLUy9cBYZlnNpwJ+F95oB04obNqqpl51mgqJepTkvLW
	fnrNstGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tr1y4-0000000HFA3-08sQ;
	Sat, 08 Mar 2025 21:44:24 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tr1rd-0000000HDCN-1G9T
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 21:37:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1741469863; bh=I/ujcC5nq+Y57EaiIBIvtCu4qYPsR76utxdU3XJmP/Y=;
 b=W4MY27T5NAdRkMCZ/mdz/kY0Objmk9kCcM93gkL5KG+HNtyU6nvgmEI01iDrvy2mgi9sUUBe4
 bEhzS5qIU+RBEvF8HfrTJDM9RKTampO3mm62gcDIGdeF0GxOGWtb1kRG5Q4VohcX5Op8zqW2lDs
 QPoCcneEPdSSA7jCSCJCRghYu0EAe5sf5dVj+fvFSIhFmKd4RbceUyeFM74eo4ayjZPEeXs1wuu
 cxHffXgSYk4H8Yw0RqyweLI0oG6WV9jxPrE3hq0F4zWAYny2hMO/CfBWLUceN0niLbzOQVyPzlj
 pw5XIkfgjkOupVIsZeBJWJdSN1OaGS77nQfCrkPKsHTw==
X-Forward-Email-ID: 67ccb89cbfe70eb1bfc13b09
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
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 1/3] dt-bindings: net: rockchip-dwmac: Require rockchip,grf and rockchip,php-grf
Date: Sat,  8 Mar 2025 21:37:13 +0000
Message-ID: <20250308213720.2517944-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308213720.2517944-1-jonas@kwiboo.se>
References: <20250308213720.2517944-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_133745_383862_399FEDE7 
X-CRM114-Status: GOOD (  11.51  )
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

All Rockchip GMAC variants typically write to GRF regs to control e.g.
interface mode, speed and MAC rx/tx delay. Newer SoCs such as RK3562,
RK3576 and RK3588 use a mix of GRF and peripheral GRF regs.

Prior to the commit b331b8ef86f0 ("dt-bindings: net: convert
rockchip-dwmac to json-schema") the property rockchip,grf was listed
under "Required properties". During the conversion this was lost and
rockchip,grf has since then incorrectly been treated as optional and
not as required.

Similarly, when rockchip,php-grf was added to the schema in the
commit a2b77831427c ("dt-bindings: net: rockchip-dwmac: add rk3588 gmac
compatible") it also incorrectly has been treated as optional for all
GMAC variants, when it should have been required for RK3588, and later
also for RK3576.

Update this binding to require rockchip,grf and rockchip,php-grf to
properly reflect that GRF (and peripheral GRF for RK3576/RK3588) is
required to control part of GMAC.

This should not introduce any breakage as all Rockchip GMAC nodes have
been added together with a rockchip,grf phandle (and rockchip,php-grf
where required) in their initial commit.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
- Reword the commit message
- Disable rockchip,php-grf for other GMACs than RK3576 and RK3588

The pending rockchip,rk3562-gmac compatible [1] must also be added to
the list of compatible that require rockchip,php-grf.

[1] https://lore.kernel.org/r/20250227110652.2342729-1-kever.yang@rock-chips.com/
---
 .../bindings/net/rockchip-dwmac.yaml          | 21 ++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index f8a576611d6c..8dd870f0214d 100644
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
@@ -114,6 +111,24 @@ required:
   - compatible
   - clocks
   - clock-names
+  - rockchip,grf
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
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
+    else:
+      properties:
+        rockchip,php-grf: false
 
 unevaluatedProperties: false
 
-- 
2.48.1


