Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A6DC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 23:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TBCMpP++xTIE1VGQILxkhLBlbX6f9b2G688bs9uqXW0=; b=tqErrWtaYPiED1JKkdf9ElnU9+
	AbgSy/qpuoJACzcCpVVULFwtwTa3DWYNXpL9FsvREtWAMgK7gI+Ndz9hWM+curRkltk5/bB2MDdOQ
	MrwPYQFTeCS5ZTMBSEd7pItM/3nBOT1RaN4nSJ5RsBGodKnymJy/3a3WBH4h03O2hrDH6+C/D8Oru
	Uh2p817ZlHVJgzePNu6AxrGotqgwJFW847kugfwCKC0ZuLjnxifaBIw4otOva3DXGd0VGptbqs3A+
	hg4gOfjkWJzINrInNOk6MR4H1NJxFCDI30LPiJ+LxNCdBsDAyhtKTXRH0CRpnJIfsOxft4ID01l4e
	57DBVyHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Sya-00000003rX5-3TlJ;
	Mon, 14 Apr 2025 23:12:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Sh5-00000003mep-2fuN;
	Mon, 14 Apr 2025 22:54:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E2656114C;
	Mon, 14 Apr 2025 22:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA22C4CEE2;
	Mon, 14 Apr 2025 22:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744671262;
	bh=ghPGn+DUPYc+Jh9QH/Xyzy1W+UjOc9wYqcXMeDG62fc=;
	h=From:To:Cc:Subject:Date:From;
	b=oM1Vx58jytipBJXdWNnXqHQgB+IyN8/IWkn7e7XxhtZ0cNBmkyRL0kqlCL0Oa0Rxf
	 YuZbA1sr3oYTR2Njig+Y6mXtjpbgz+u0WquK/pkdrsfpQpPdIPf29r7YPwtcEZnqos
	 cV9eD+XIlu/O/TeTmh/H1jndfWnQnyw2JyMB2TeEbhytmCKauDeHprNhWuMCY+dsql
	 FtAPHXhLhA0ISG3XN2sf1eidEp+rcvW4QxirSCllqDgDCDI/xPHKT8kk0i8xGWTHtS
	 1KyMqMBJ0K0Y6wMM9BlwxA2qp04E7j5outt1hz9cA1NqRlLySWCwe1r27stHG3gdYF
	 yi12Pu8rU9ZbA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: phy: rockchip: Convert RK3399 PCIe PHY to schema
Date: Mon, 14 Apr 2025 17:53:09 -0500
Message-ID: <20250414225311.1913480-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
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

Convert the Rockchip RK3399 PCIe PHY to DT schema format. Move the
example to the GRF binding as that has the complete block.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/phy/rockchip-pcie-phy.txt        | 36 -------------------
 .../devicetree/bindings/soc/rockchip/grf.yaml | 13 +++++--
 2 files changed, 11 insertions(+), 38 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt b/Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt
deleted file mode 100644
index b496042f1f44..000000000000
--- a/Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-Rockchip PCIE PHY
------------------------
-
-Required properties:
- - compatible: rockchip,rk3399-pcie-phy
- - clocks: Must contain an entry in clock-names.
-	See ../clocks/clock-bindings.txt for details.
- - clock-names: Must be "refclk"
- - resets: Must contain an entry in reset-names.
-	See ../reset/reset.txt for details.
- - reset-names: Must be "phy"
-
-Required properties for legacy PHY mode (deprecated):
- - #phy-cells: must be 0
-
-Required properties for per-lane PHY mode (preferred):
- - #phy-cells: must be 1
-
-Example:
-
-grf: syscon@ff770000 {
-	compatible = "rockchip,rk3399-grf", "syscon", "simple-mfd";
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	...
-
-	pcie_phy: pcie-phy {
-		compatible = "rockchip,rk3399-pcie-phy";
-		#phy-cells = <0>;
-		clocks = <&cru SCLK_PCIEPHY_REF>;
-		clock-names = "refclk";
-		resets = <&cru SRST_PCIEPHY>;
-		reset-names = "phy";
-	};
-};
diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 2f61c1b95fea..fc328c4a35e4 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -201,8 +201,8 @@ allOf:
 
         pcie-phy:
           type: object
-          description:
-            Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt
+          $ref: /schemas/phy/rockchip,rk3399-pcie-phy.yaml#
+          unevaluatedProperties: false
 
       patternProperties:
         "^phy@[0-9a-f]+$":
@@ -326,6 +326,15 @@ examples:
         #phy-cells = <0>;
       };
 
+      pcie-phy {
+        compatible = "rockchip,rk3399-pcie-phy";
+        #phy-cells = <1>;
+        clocks = <&cru SCLK_PCIEPHY_REF>;
+        clock-names = "refclk";
+        resets = <&cru SRST_PCIEPHY>;
+        reset-names = "phy";
+      };
+
       phy@f780 {
         compatible = "rockchip,rk3399-emmc-phy";
         reg = <0xf780 0x20>;
-- 
2.47.2


