Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFAAC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kUw5s0es5oFO/TpdBwZO6q9Zko7b0Q3JT+ATmXX861Q=; b=j5RsmRJ42jvpZ+L9n4s3StgyPi
	vskPJCKRhWVs+7LIj9xWiw3pOhdv2095JS6VZgaQ922QMYKZQDZ/8Bpuo+3rC3pCVcfVIghpUBDBt
	TcKETYXYTVjrDmCe5D3gdIFFqV91xVj5a4amiTX+KAh8wlNIkzGMVT5mW9gs9t43/R+FBu+o8rAu9
	N+Mg2A5o9MqS4vT5qhtWUMwUXZF/y1j+ooL+Nj11Yn/q/j9dwAs/FABsO5tjFHidyAgTeB/TjJzSR
	2FB9e73PIvk9heAh5T2vNj3PO7KdOsZtwX0TbmjgfB6dHOTQP1OoVmwMNIvN/mp2QuhyEYWxkG4MC
	g3WdNI7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rYm-00000001ddX-3Mua;
	Mon, 07 Apr 2025 18:51:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1plf-00000001IBT-24qr;
	Mon, 07 Apr 2025 16:56:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 01826A479D0;
	Mon,  7 Apr 2025 16:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2712CC4CEDD;
	Mon,  7 Apr 2025 16:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744044974;
	bh=ymohgFDi4LwP6+Gv1CbYrCj/hTTJ8VYbtY7mVpem+4I=;
	h=From:To:Cc:Subject:Date:From;
	b=pYgofEh3AKidigQiwzejSdSQLNcVkNiLqs1Jia4hB1g8iPGht4pKtBvKEie3ph6Sd
	 tSAvqQviln4Vz7K/7QG98uQiIMrDex6OJlzU11WhZT6HXOuTP+K77RPQUndUS2eJwm
	 qLtv3r2BJi1AKxHzspdtxHCu1BhQi66xvj/DUOQ9SrLzpTcyPYOC9LRuIDjen1kEZw
	 ZrjfbroFM2LCB0dT1J8EzKX45Dpkbtj7/4r/YoiAuwsdKHx8ygLx0cBbS4/YNKBCV9
	 JJFIYHO6XOv+NXJHhaEXwcnohZB89tg6AfP56DxdKM81pd+/xNyTZmkxgOWYKc4g8v
	 Idf/+cd1WnqAA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Frank Wang <frank.wang@rock-chips.com>,
	Zhang Yubing <yubing.zhang@rock-chips.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: phy: rockchip: Add missing "phy-supply" property
Date: Mon,  7 Apr 2025 11:56:06 -0500
Message-ID: <20250407165607.2937088-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_095615_595534_873CD3C6 
X-CRM114-Status: UNSURE (   7.65  )
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

Several Rockchip PHYs use the "phy-supply" property, but don't
document it. Add it to the current known users.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Drop maxItems
---
 .../devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml   | 3 +++
 Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml  | 3 +++
 Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml  | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
index 888e6b2aac5a..3e101c3c5ea9 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
@@ -42,6 +42,9 @@ properties:
       - const: phy
       - const: apb
 
+  phy-supply:
+    description: Single PHY regulator
+
   rockchip,enable-ssc:
     type: boolean
     description:
diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
index b42f1272903d..8b7059d5b182 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
@@ -47,6 +47,9 @@ properties:
       - const: pcs_apb
       - const: pma_apb
 
+  phy-supply:
+    description: Single PHY regulator
+
   rockchip,dp-lane-mux:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 2
diff --git a/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
index ba67dca5a446..d7de8b527c5c 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
@@ -46,6 +46,9 @@ properties:
   reset-names:
     const: phy
 
+  phy-supply:
+    description: Single PHY regulator
+
   rockchip,phy-grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: phandle to the syscon managing the phy "general register files"
-- 
2.47.2


