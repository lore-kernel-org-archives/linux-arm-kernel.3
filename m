Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF45C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 21:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PqO2+J9Z7bBGP0DE5otZbmHoa/PTQlqNyzWUh78TH74=; b=qdUbQGN9KWNED/53ijCvmqtuMV
	O0ZdU5fCRJ15zcc7Pi7h3pa1mvx0W/Rk1y8QOYYF1g9PLAkfjHLg3ALrlzQS4HymvxoXFekutRTfP
	JbdrP6utL46cuVAKFqOC6oDu/EoHpbokfI2KVtv3jXMyDtpuT4uhDzGOj4KvBMQ0La/Q/CajDjLwX
	+S1OjjEyh8D9MJHiC2riliF5KoBNQMHnfXv60Rh0m05HvUTrZsgip5Ea7zU4bwEsQwP/BQkCV5IzU
	YRBMVZP/fLuyKECb3LYfRJxEJsxdMy5aIaRa7J+GPvuCXir2CKesV7OON6nK0ftDNMrLPeLTRTFp5
	xoAZPzIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0onW-0000000CuOn-3jJm;
	Fri, 04 Apr 2025 21:41:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0olo-0000000CuFD-0GxS;
	Fri, 04 Apr 2025 21:40:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C551361137;
	Fri,  4 Apr 2025 21:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE372C4CEDD;
	Fri,  4 Apr 2025 21:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743802809;
	bh=V7d848cHNhzJZA8J34hAk1R4MXTjSl/J46lsLRCUZLI=;
	h=From:To:Cc:Subject:Date:From;
	b=hPb3K7THrk0kK7YYelaNc6usDlkTX8U1HVosa9n7RRJttA6XP8jWcUd+a7yOD+4A4
	 CdhsxbCSsKYir16I1n68gswuryZKYdO5StbndqcCcnyHjnfU9XlytH9hj3nMNPMGO1
	 ig5pNZDJiR7kjrxbyrNyut9i1aORKxP0g0i2g/ARCSR63Qb0f8QIiv9DZ1fCqTTdqs
	 3Z80xb+fgG3tqw4mPsL7MEPkpFpvnHDNjDAiya2rui69gQRowHdz0mu0FSBqZLtw5S
	 aCFBnpVa6gYJuWMx60Z0OKnZiltLo0+VXpHoabzK87aAq+Szh+lHQeS342QhxRpJfh
	 3aMmgTMK0NBoA==
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
Subject: [PATCH] dt-bindings: phy: rockchip: Add missing "phy-supply" property
Date: Fri,  4 Apr 2025 16:39:57 -0500
Message-ID: <20250404213958.400852-1-robh@kernel.org>
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

Several Rockchip PHYs use the "phy-supply" property, but don't
document it. Add it to the current known users.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml   | 3 +++
 Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml  | 3 +++
 Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml  | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
index 888e6b2aac5a..5c09cdd98f0a 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
@@ -42,6 +42,9 @@ properties:
       - const: phy
       - const: apb
 
+  phy-supply:
+    maxItems: 1
+
   rockchip,enable-ssc:
     type: boolean
     description:
diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
index b42f1272903d..bed12849ff06 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
@@ -47,6 +47,9 @@ properties:
       - const: pcs_apb
       - const: pma_apb
 
+  phy-supply:
+    maxItems: 1
+
   rockchip,dp-lane-mux:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 2
diff --git a/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
index ba67dca5a446..0b3bab4c436b 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
@@ -46,6 +46,9 @@ properties:
   reset-names:
     const: phy
 
+  phy-supply:
+    maxItems: 1
+
   rockchip,phy-grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: phandle to the syscon managing the phy "general register files"
-- 
2.47.2


