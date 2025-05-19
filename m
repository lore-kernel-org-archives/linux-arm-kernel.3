Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB7EC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 17:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tp7lW86The2c8AadmFVNop04Os7Gp46mqLTvQFnTBhc=; b=pLfA6wF9ix0d3nFoJ9+lWkIa0L
	K2/RX8FXcDxziwy59/QWqxm2tWvmjmPrVjWQQLwcZOyb81MI67GVRiLaZr1k1LTQp0An9kkcjbb6C
	Iu38cCtNpTvIG/VHJnJXQtydzCDhFzxY0n8H3Ub0d8sefm80BHfPQUM5TDsq7rrB2nZOG/sBJ059U
	Ok7ydLVLxkqMdWENBPOFE9mFiiMGK3xRaJ66BVwMpbuIIXVL9VK6sNypRXQq0CENfnEfYoUSE1Nrg
	NdfchR8J5GFVg5wMiTcj+SGHZc6Pmnj/cGX+M0J4mGzg0nwtgqYD8SMPmt+HNyz7DNI1Svz4KaCCa
	hnJ4LPqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3xx-00000009umu-3ftp;
	Mon, 19 May 2025 17:07:53 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3As-00000009lyv-1rBo;
	Mon, 19 May 2025 16:17:11 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2A38525DD1;
	Mon, 19 May 2025 18:17:09 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQj-dnGyjT1V; Mon, 19 May 2025 18:17:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747671428; bh=qix+OvYYBGYJs/RdxED7CyEKdjy+sVGm+qlAvrdCj9s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=L/AQeyLYCkkrWa7u/SJbNROUccMT7dUmBlJ3vi97jgMgoz2r934Brf0ee6cxTcuol
	 d3lcZVG0am3Q8hiVVJkhJMyawxX90pyyLoncAstVu8qxFqnfmLRKvXyDnaVMhqEEza
	 3pief1R4xM/aZhP6qbv0hPZgX1fQ+U0N0WSCK7SzCpexZzK2bK/HVUUO3JRbXSab4C
	 2V1KtEwVvx83YX/iCzs9fSotCsXrsiyLg0qQJkcgmX8vUoAPlg0+JgLxib8FMuTAj3
	 0kWU59YRoAhGTC7ZGzr+FAp7PHIAiI3J7lWaMHboBbmjIcy7/K37KS4XBZLQvQVrG8
	 PnfivGNA8Iz+w==
From: Yao Zi <ziyao@disroot.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Yao Zi <ziyao@disroot.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] dt-bindings: phy: rockchip: naneng-combphy: Add RK3528 variant
Date: Mon, 19 May 2025 16:16:08 +0000
Message-ID: <20250519161612.14261-3-ziyao@disroot.org>
In-Reply-To: <20250519161612.14261-1-ziyao@disroot.org>
References: <20250519161612.14261-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_091710_613320_4C31AFC0 
X-CRM114-Status: UNSURE (   8.07  )
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

Rockchip RK3528 ships one naneng-combphy which operates in either PCIe
or USB 3 mode. Document its compatible string.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 .../devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
index 888e6b2aac5a..969d7b1850d6 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
@@ -12,6 +12,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - rockchip,rk3528-naneng-combphy
       - rockchip,rk3562-naneng-combphy
       - rockchip,rk3568-naneng-combphy
       - rockchip,rk3576-naneng-combphy
@@ -102,7 +103,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: rockchip,rk3588-naneng-combphy
+            enum:
+              - rockchip,rk3528-naneng-combphy
+              - rockchip,rk3588-naneng-combphy
     then:
       properties:
         resets:
-- 
2.49.0


