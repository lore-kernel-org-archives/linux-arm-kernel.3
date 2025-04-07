Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7166C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 19:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hsk96FSguk/Ky1tsPSxd4I1gk9mUryoWRi27TGtLokQ=; b=rN0hBdAZfHGJwy9lkdmwouplB6
	gGRyzeki300QUZp2eu+K0ZC1x8RB2dXfKhCu6YTKxolP/a55z1uJh9tRo0XdhftSnd8Y5agGBBvOZ
	i5iMUqyDEFvk3gjY0jJ0dFuvKm5K8yUbNkMeVl35VQ0bgr3OLXIQmcYB7jjvZEKEPGpZzyty2tgcz
	UKwkirUS1M30tO6jAtao6EnRnWSQwslli2OPUZ7U5N8KgX+xuhBDrGsUox3pKoK9LqqIpMB3Ab5U6
	ffYZWVhS/Cnon2f7m7Rc+fsnA7OWVRXsopOJFb/WaGzP0PMvXUGBb2O3bjTp+99oeynklaIyinnIP
	sFvND8EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1s2I-00000001nSM-0Y6R;
	Mon, 07 Apr 2025 19:21:34 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1quz-00000001Tga-3nZ8;
	Mon, 07 Apr 2025 18:09:59 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1744049386; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SRDEYS6j7qhew185kGpHfxeaN4cvGqAabO/XZ/1tkRb6AGo9vfk+FnKWZvX+jzWjRkYmsDv2G1Osl/9YHzsbul1rGCP1SRutcB5TkJIdJH1gto3fNjW5vWcQ7PbU0NTngFrDg7FkI2v+K4386sEAoRwEAqFKQ/y1S0bCMYarIY8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744049386; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Hsk96FSguk/Ky1tsPSxd4I1gk9mUryoWRi27TGtLokQ=; 
	b=ddnwQZSeCMBZzuXQSpkEIVK7rEE1SzrACFBi2Xkif1UW3cOOXt61RQBDvDyRJx+k04qI7PXVTXPRK8zw+H0NWDCJpy0IRwUCuuRFiFNWWk+w/F7aTFfz6ShkX8X7sL7BOk3GB5pUvuLGiIAAnCcYbkwu6/1yaYhMKLyZ/FKEY4U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744049386;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Hsk96FSguk/Ky1tsPSxd4I1gk9mUryoWRi27TGtLokQ=;
	b=ivoK+cH/E3m7x3WDEoPCvqr/fH9WPvYqfA4ggDfOCrchVl6Wb+YFCM6VWnPIhuIY
	rJSmK1axaj6w6jWu+GQXPemHEka0uTYf3UhUVSNXdG230dwT5BiO8x1gpFSAiTDO8X6
	p2MwAmrGGlgOnwfNwFcdGomYKDgi0Rel2Cmyhq5g=
Received: by mx.zohomail.com with SMTPS id 1744049384577926.4016780097427;
	Mon, 7 Apr 2025 11:09:44 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 07 Apr 2025 20:09:14 +0200
Subject: [PATCH 1/4] dt-bindings: phy: rockchip,inno-usb2phy: add port
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-rk3576-sige5-usb-v1-1-67eec166f82f@collabora.com>
References: <20250407-rk3576-sige5-usb-v1-0-67eec166f82f@collabora.com>
In-Reply-To: <20250407-rk3576-sige5-usb-v1-0-67eec166f82f@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_110958_006090_E2BA0630 
X-CRM114-Status: GOOD (  10.54  )
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

USB connectors like to have OF graph connections to high-speed related
nodes to do various things. In the case of the RK3576, we can make use
of a port in the usb2 PHY to detect whether the OTG controller is
connected to a type C port and apply some special behaviour accordingly.

The usefulness of having different bits of a fully functioning USB stack
point to each other is more general though, and not constrained to
RK3576 at all, even for this use-case.

Add a port property to the binding.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
index 6a7ef556414cebad63c10de754778f84fd4486ee..3a662bfc353250a8ad9386ebb5575d1e84c1b5ba 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
@@ -78,6 +78,11 @@ properties:
       When set the driver will request its phandle as one companion-grf
       for some special SoCs (e.g rv1108).
 
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node to link the PHY to a USB connector's "high-speed" port.
+
   host-port:
     type: object
     additionalProperties: false

-- 
2.49.0


