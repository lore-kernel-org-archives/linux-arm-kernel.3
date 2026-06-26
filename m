Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1558AC43327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 20:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdtMGS69O9FQnvlMP/DHFOAlWIBmP1hs5y27IdCIClM=; b=nJHABg5eo38wOYVRekYYCiSsA8
	Wh4c3gV3hz0m2scm1jibcCpgnpwz6WarqTNxMy8kvoN7LiJ4RuB8oe6xHBU5wO3Nspu/Kyq2CHkvI
	4POAB2YYdhqPNxMmJRjC2fCH2PHmVHt6wKDGFuOPJTG8vuBJS9788ros5np3PFp5CDddq9YJRpUL+
	K5HXXwZIvnD9w/qmeQysD72bff+hxNplTF1BtMGhsc8R61jVFjpDwD9DOQTvxbzJ1xuxDDmboqQjv
	dqd5bsfCtKhS28aIQWGkLrbTFUM72snmxHFJng7UVtIzcKis1Lvz6ZpaMQlRQXY5wOgTfTSWQgrZT
	dI5G+tJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDaF-0000000BpwX-1raJ;
	Fri, 26 Jun 2026 20:55:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDZs-0000000BpZP-0kjb;
	Fri, 26 Jun 2026 20:55:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507302;
	bh=hH0QGrmLbuu/B4YZadFae3inm/JzWTkz0OQ7ld9Btpc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eyxiluI+UcnfAdFgxkj9ULNGsKuka3AlbcKJBQOEWUUGAcDkP6GjrqTGTjzxIjIs1
	 5g3Ui+bETqg7TdSCZd+7sy5tnLs4hTeWcgjQCsgUvPpGkwDMbMbUTOlVGF5mx+zsLr
	 wnBWJTKAlHJ2UNleDkE2X71ZMGAEqLSgLfk0/bJ215soSt233khGfzbWdabMZ38nq3
	 C8B2YxLWYK+hsVvTKQmPVFSaAaq+G0o3TqL/xeDxm6xq0DbfDgE/VG6HRffsHuzG7e
	 hfSJKOSbuPLc7voh49mNoBxM5ZrEVEsqxnCJcyQrWOvmfiKkhgeKTQxo3+g9ZdVcy1
	 AiXfMO0n/A7jA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 64A6A17E1164;
	Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0CE02480026; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:54:54 +0200
Subject: [PATCH v8 01/29] dt-bindings: phy: rockchip-usbdp: add improved
 ports scheme
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-1-47f682987895@collabora.com>
References: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
In-Reply-To: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2290;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=hH0QGrmLbuu/B4YZadFae3inm/JzWTkz0OQ7ld9Btpc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5ySZkUc+unG/FSLMgqRkl6iB8fnAY/wuo
 pXDZZjk/5BATokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuckAAoJENju1/PI
 O/qaQ3IQAKhnBIq35/VZ++v20D+qCemm+EYfG3bzd4r7xOrhH0Hk3D9nWTFB4s8WoHQUSinqQHJ
 gxtTGCSEOki/OHkZEIcMO4b0xq0nGz+l2ApBRNU2QS/5+93JVUEVSigPiYrw2DBHoZ9Dpbp5q/d
 b1ouVQaSOOkrNg2kxD5DnB26s1Ms9+IgqSq9AegEk/4SI3mZje50luKCfrMtsyuuBGJzffinOx9
 L/IBzoeEJMmiefqwi4Uij/d5e8uaac6DpUZc3nCT2qStDnLHQVOV2Dw8X1/cYkbd9tsGNliqmog
 35HDc3a9NeVBT3nVT3xs5oHas9wKWTNs3dXrOAgDy46F6poo6nreEjcdmfHQ9QUu0XtWQyxIK/7
 SIMPZTIAqJagnOTDyFO4mqHs2lwX9KnuE3tybEa3SokzA/gTenTEjdqBQAM/O8jnKtKolVIcwyU
 JqIc9CP54ggyd4AjeVdDYJ/sLj62NenOuD4nhM+Ss5aeazni20itAeRTFmj981nyhABBPcvjuXg
 CDqWoZKoXED3BB9Q6sWvPDdYmSfl4XlGy0nF0OUyOD3wZ4PpI5mKWOpbswub9WqMnZiYzRF2tYy
 BGygIZT+kOtqaUevNMQKXv0l5NtgNG0+I2zIT+uVd7rfEBx4pFlFQX8YYwIGQrI15TkpMBoaf3b
 TCB31JI1Q8xCohaNnj3AonQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_135508_635816_1D1A0AA7 
X-CRM114-Status: GOOD (  12.33  )
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

Currently the Rockchip USBDP PHY is missing a documented port scheme.
Meanwhile upstream RK3588 DTS files are a bit messy and use different
port schemes. The upstream USBDP PHY Linux kernel driver does not yet
parse the ports at all and thus does not create any implicit ABI either.

But with the current mess it is not possible to properly support USB-C
DP AltMode. Thus this introduces a proper port scheme following roughly
the ports design of the Qualcomm QMP USB4-USB3-DP PHY controller binding
with a slight difference that there is an additional port for the
USB-C SBU port as the Rockchip USB-DP PHY also contains the SBU mux.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../bindings/phy/phy-rockchip-usbdp.yaml           | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
index 8b7059d5b182..f728acf057e4 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
@@ -114,6 +114,29 @@ properties:
       A port node to link the PHY to a TypeC controller for the purpose of
       handling orientation switching.
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output endpoint of the PHY for USB (or DP when configured into 4 lane
+          mode), which should point to the superspeed port of a USB connector.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the USB controller
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the DisplayPort controller
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output endpoint of the PHY for DP, which should either point to the
+          SBU port of a USB-C connector or a DisplayPort connector input port.
+
 required:
   - compatible
   - reg

-- 
2.53.0


