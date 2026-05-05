Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991D1CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 17:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8q2IZq6215HQoBX7glbcRLyovR5wi8eLtrWHqEETf9E=; b=AtFhmKKrD7jMsRRCOQqwFwRYoJ
	tRv+ABgE+svgc4V1tRwEjR0G9UpPqBnSSYlh7sPbGkK+VaWHTkSadJYdnEBDpXntRI7u7+XCpVAXy
	YNv0wLmE5GmOkb9HWqGWSYU3mnoIeNdExpwE/796f4C3MFyuxMT0BXvPwJiqV0HAMEq6N82wD4ysV
	lelgSrkJwjRizo9Mg9tdpIYt1SrWL+tDUyvsGtwHB+hQnK8cya6h12XD8WBRY4lv753srui7iS/7N
	cQkub/B+KXz2NT54V8gyprMu+dZLE9zR4oiFiXxJITMYVoU7y2BNsKqa8XOjUPG74U67xkpDvBdv3
	HNI4V6DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJC3-0000000Gz29-210S;
	Tue, 05 May 2026 17:04:23 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJC0-0000000Gz06-1r6n;
	Tue, 05 May 2026 17:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=8q2IZq6215HQoBX7glbcRLyovR5wi8eLtrWHqEETf9E=; b=1NOlqDw6rTwmiPp3P/3is+4Cbi
	fnNd7WWSsTFRJAHmCrTtJT9WIfYL6ZtM4+ydiHyJ+EmOg+K5nlNcxag88C1I/XXrvnrjnmuGTaKI7
	0gWhxtecMq0gEnkb2JEEDStfIWU8njd4EdE/7DRy0IhO2ifsIak1VJvwuXXzYc4V2D4ouI9pglwmI
	/mW/KnArWeZStq/8G2jLM6ugbrwo7knHzT2lSVpG+L6tqEqKBYOGbxBuJ4G401SM/njKjh7nhO8hz
	mdCBx7veyMwrE/6jXnUiopOR2BOmvWuQ/EoXx6F7HMU7i8zUrnHDogWGGzFmwr++p8YaKlXRFwczq
	5pDrEyxw==;
From: Heiko Stuebner <heiko@sntech.de>
To: vkoul@kernel.org
Cc: neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jonas@kwiboo.se
Subject: [PATCH v2 1/5] dt-bindings: phy: rockchip,inno-usb2phy: Require GRF for RK3568/RV1108
Date: Tue,  5 May 2026 19:04:06 +0200
Message-ID: <20260505170410.3265305-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505170410.3265305-1-heiko@sntech.de>
References: <20260505170410.3265305-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_100420_479514_CAF5F068 
X-CRM114-Status: GOOD (  10.20  )
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

From: Jonas Karlman <jonas@kwiboo.se>

Typically these Rockchip USB2 PHYs are fully contained within a single
GRF. However, for RK3568 and RV1108 regs to control the USB2 PHY is
located in a different GRF compared to the base address.

Update this binding to require rockchip,usbgrf for RK3568 and RV1108 to
properly reflect that the USB GRF is required to control the USB2 PHYs
on these variants. Also disable use of rockchip,usbgrf for variants
where it is not required.

This should not introduce any breakage as the affected usb2phy nodes for
RK3568 and RV1108 were added together with a rockchip,usbgrf phandle in
their initial commit.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../bindings/phy/rockchip,inno-usb2phy.yaml        | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
index 58e735b5dd05..b95c9e3e44fe 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
@@ -145,6 +145,20 @@ anyOf:
       - host-port
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3568-usb2phy
+              - rockchip,rv1108-usb2phy
+    then:
+      required:
+        - rockchip,usbgrf
+    else:
+      properties:
+        rockchip,usbgrf: false
+
   - if:
       properties:
         compatible:
-- 
2.47.3


