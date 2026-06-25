Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD085CDE00B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 17:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdtMGS69O9FQnvlMP/DHFOAlWIBmP1hs5y27IdCIClM=; b=j3xSaDW/7q74BSWd+rgK3yjmVt
	4UZyYzyjTlrjWAD3yUpvG8FHxhppnEYW/w/dJJiuyDbZZyPXYPIIqk8DHTAuBhzXXjn+PYErZgEjV
	IsggxxWKqOUl0ZLMikzLuvrkiwSaH/7EVwi/vwqM2wyAn0FOqZEJJNzMweDZBMBliBiBjN7UzpqVZ
	DWY95zhiY8rfiF5R+VRGN+YJX7STw3AjBY5ssk7GLD9kjdeyspexFFqmB+vkRBV4Ox5BFBXyFsyy1
	uiZwJhf8PpSs8abZM8BPom58D+X52dhrZ/zHInqaiQ5IReZbojHuZbzQITCjpflZqwPD3IirL9gZ4
	dU/wnlTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco3Q-00000009Zhr-23vF;
	Thu, 25 Jun 2026 17:39:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco3E-00000009ZSw-0Odq;
	Thu, 25 Jun 2026 17:39:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409180;
	bh=hH0QGrmLbuu/B4YZadFae3inm/JzWTkz0OQ7ld9Btpc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=g7KTFmJoVZrrmt8Sl5IvK/1xHnXU4BnfoEqetQPGDW3urlkocvISrxi+6dW3rSXES
	 vv4MKpBaT7hSFQcIMR0y0Krjh4HIGiHRazRoOG/WMyf9eNQ/JlTgZw5vo4jLihrDa0
	 S5WvfEy0yPmEuRSoSombwEzJf/v3ResglkWudfgliLu7NWLQbKh7/YOr5/AzwukzEr
	 /2CyoLAvy5o7KjGpNDHyzJLGrrRfVj9cz1qJfCG/d8oMTpitZ7Hh6qUyvM0ipvaUSG
	 GMy0Bu8r+lMK2H9k6Hfj7KgH12FZP28mnxdCesabddEJhoT0ZIr2P9EYLqUkVo+MT4
	 DEetmZ5xBza/A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4AED017E0E48;
	Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id EF322480026; Thu, 25 Jun 2026 19:39:39 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:28 +0200
Subject: [PATCH v7 01/27] dt-bindings: phy: rockchip-usbdp: add improved
 ports scheme
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-1-38eb3cf654fd@collabora.com>
References: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
In-Reply-To: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9reyMTFUIg1Cuf1KZHLtJp+/nPH+em1/
 Uq2JLs5HZa3i4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfaAAoJENju1/PI
 O/qaZU4P/3A+HLpbQV0NbP9rNYCBiCsNt7xqKR9H2U7hydHlT+B86Da7omdza/OJeGKjhRSi79a
 kePO2N8aFlK8VVR9nt8MnqoxcnU33XmQU5S4iK9gbPf9kcfN723fa1h8j6UXDZ3LXFrf1d0rmXB
 5snQkBYDlCmSxMrs2nbt2DC3IxhVngh6ETy8cKSwEJR4jBlk/38sLVE+UETaOKYTXMOnw3C5Gxy
 /NUpEU8EDvcTfWpYiV8MnIpXug8M+qsfxytYd/LfElT7TKAXhTLFP2hC/qkcAsJSIJRYpg4Pktw
 Y5wksQChZLtBN9qWh0rQR0MZxRoWoeGW0VNdbjXl5sKnLqmEkbsenAu79z/PJRzjrlorgqpfx69
 AFN2dAtjzGQ+ANIClgyPTzucki2kDdIkKxKslbzdALvpEEnXoE6HhjqhQs0d4x3/IlNx1OmvTl9
 8V7MGWprYvY45Ch01UemrI6spFLmP05MHzSznDJfFpg7m78QngQJPze7tTMTMd+llYKLxiLgYNP
 wu9HQR3AlimN4hg3Jv2EYGI/PyV64/INsF/V7bklTP3+Wpk6K4FM9dh8X2cYh6yQAmwegOXMJtS
 KvMzo62C3U1UjF4iKF7STqYogCwyIwylKnVGvv4njMB/1QndFf12HKq+elKi9BJclyxzHXS9/gD
 i7k54cnyv3FGiJffp9nkr0Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_103944_283977_95985C96 
X-CRM114-Status: GOOD (  12.62  )
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


