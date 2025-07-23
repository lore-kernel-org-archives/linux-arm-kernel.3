Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC269C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 12:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VrGCDldEDfJlmA3L8IBuQRXGokqWnwHgnzli9QRW/iI=; b=0P+z3+CZ8YvP98Zw+2c8Pcdxif
	WUF0s7V9BA9NNkXXRIYfaMXwKrnBHiipu5SkyXXKn/LIxqm31814mckOj/eevFPj15tA9pOpqE9Fy
	JDTT+f5A8FphJYz9w6Y0MnXMalOHwdileCZx9aVE03P0m/pl7cdAsEAclkZNvzPTxki1pBzQv++3L
	OBXouc/w/MrHucY+GWlBMxH+E3kKEl//CnVVYzf17QQgzJLNZF4TtvBj/AlsIGDrt65lhDHN1bSdQ
	dKz6yD1YaeOQUB2HD9BbtFIOhqi+D+gloGmFEscjB6vZ4A8dqB5WtB4Nw5t677C4aKBHcQV9FobNd
	j8V5xZJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueYaU-00000004uWr-3Al4;
	Wed, 23 Jul 2025 12:28:46 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueYVY-00000004tfR-3y9n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 12:23:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1753273420; bh=VrGCDldEDfJlmA3L8IBuQRXGokqWnwHgnzli9QRW/iI=;
 b=bGqLeoVIsWCpUhF8VOl7qj18QNauZVQGugMhTpm8a8JxvlAZ+0gytwHunS0XgZXymuhuXJlQz
 m87QTc1SHHOdaXoVIxpxyd+vBfyNL3/0hh5KmgIbKDZOEt61yuj8tZ9qtS6E5PJB2wwIpbEdc3d
 OZ8NnSu4gh0EvSEecb5OHHIEn9fCiVj/gXxd2EbVz2hbPzXqIBxTi5Bt+W8od5AP+/148V87U1m
 xQLJjbzGexApgf2FLQs8tpN0/DkVz+Q3/Aa8DzrwmIF/6m7ErElIbr87HZXJWqZR4cjTNqGaKSo
 IVsuZHiuOxUeweiehypZkXogIicim+I6ywZjUkvSJEdw==
X-Forward-Email-ID: 6880d445cb0ee86f9731a05b
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.1.6
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 01/11] dt-bindings: phy: rockchip,inno-usb2phy: Require GRF for RK3568/RV1108
Date: Wed, 23 Jul 2025 12:22:59 +0000
Message-ID: <20250723122323.2344916-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723122323.2344916-1-jonas@kwiboo.se>
References: <20250723122323.2344916-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_052341_014868_D39614EC 
X-CRM114-Status: UNSURE (   9.31  )
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
2.50.1


