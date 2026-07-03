Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3ECC44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 18:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khvfuJEaaha0Gbhqzk7oBTqt7kcqR77N8chwpGirGwc=; b=hYg0f/JtiDDmqgHvW8aZqFoEtB
	wTnUXZF8uaVub0Zn2/9zPRzYSHQC8GyjNSmr8+SRowgm2IdvvY7CL1envsdKAFLGqJKi6e9j6dm2Q
	fL8V+I9Ux67YKDRdVXN+sHMp1lleTGnWplG96clC9Gu06pXN3r8Ns+i/C+TORf/xAmX17K0qAP7ol
	8vJUjZAM2XWbvAB+u/vv8VtLILKQj/PgX8XWcDcEKylAK7ouYjjFHSAiFdNXnLY7IUNImaBvZIKJV
	NOI2n40oM5rnk95pkEdCDURMSZU7Uzf3OfRCvlsJ1T+PFf2v65ruPr/ctICiwAFXe8qghpsIuN6kc
	salsfEXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiOV-00000007doe-0t9v;
	Fri, 03 Jul 2026 18:13:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiOP-00000007dfT-096Z;
	Fri, 03 Jul 2026 18:13:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102412;
	bh=XvXrGJcEW1jcrIx0OQCk1jq6kZj7fXlWBKjmt8bxgrM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZKvd9Q7ftVKAi7wzX3B/zIzYYWugrmpK8/4StXZa/49cWnml/2HeFCLF/pZwqZqx9
	 oOOif10qnrv4krV1yHjbLPBdococ14NGLhEsO6b/maDP0gkSBPBOooOGKgrfqnBmIR
	 cSLmEA9yxVpKhob5yhtn1HfRnx5Za5OVLDV0lWaPPfOMzRMq4WjKFwtGgntez8LdCh
	 l/djOqiF/+iuIrlU6e/kIC3AeSgJS7213hWe0CorQXLdp3VUIi+QmIvG2IMqVczDNJ
	 a5f6PWBYSsqK9wAAQNtuCjnJ0evp4eyJD5CUiAKU1rqM8cprOH8wAJb7n0UGGjdkjq
	 Nv20WqAzwlx6w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C43BE17E0FD0;
	Fri,  3 Jul 2026 20:13:32 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 7A4E0480027; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:17 +0200
Subject: [PATCH v10 01/36] dt-bindings: phy: rockchip-usbdp: add improved
 ports scheme
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-1-a392711ca8a9@collabora.com>
References: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
In-Reply-To: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2404;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=XvXrGJcEW1jcrIx0OQCk1jq6kZj7fXlWBKjmt8bxgrM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8siRwD0U2bZ9ZSm9fV6LotqMU/quVnF+
 PFEgB+OcwEb34kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vLAAoJENju1/PI
 O/qaFjMP/2edLYw3akpB0xq95GESBNkhtEErZo92maEhRHjJ3Kv3QglWodbekbId/8UyUMpu9vm
 99i0hnu1T+K3BSN2clT/GTGp4R7p3h1w0T2OcBkcUX1nRWD1EzxXjftJjNp3P2qxvRwYmbfzrmI
 NNhNjTVyC2Rqqk8pxBofBLr1dVhJ78dimZ6jKIgpRLGD/pUoI7UXPZ5+bX4awat1t9ZHcRWnPt0
 qAG+QEBJfflwaA561hpjomMREbcoRinDKnC3/ueDwLsscyZZj54ok+veIHxivuF5tgaGCxKORNg
 uW66cmChO7peJrGQAXnb8MQqzTVd4lrlwKp0SGvjNE8Dp6DDFWOI7hSf6Qgz1SpBYb2guAvxTdP
 H03emq+x2qeV9O/vnpi3F+NoQ3cRTZ/lf7drZdP8vsb4/daEb1+fg67yd/9CnOQJRUp6B8KD/m9
 8VAWz1X3El2v1RMpZI6W77ncrguAay911DLPt7uXDEgWP1gZAEVkTYQ7m16xyCeok+CBsLyEzDp
 Nk6eM35BwYsI3OK2v/A8XpAFYZ/TJ2viOQsGzIMvWw6vFmWqSp6mMOjGc6rh26YE/bMdHUF2xjR
 79gwlomfpf9OX2Z+colEuBDUcXajI2/U1eIovALRSU88uyqyRYYE16Eh0bfTZJwluzIlxm+qP0a
 sgejK8mxexGfQPXz2+J887Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_111337_922853_A37487EB 
X-CRM114-Status: GOOD (  12.64  )
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
 .../bindings/phy/phy-rockchip-usbdp.yaml           | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
index 8b7059d5b182..35d6717b9cc9 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
@@ -110,10 +110,34 @@ properties:
 
   port:
     $ref: /schemas/graph.yaml#/properties/port
+    depreated: true
     description:
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
+          Output endpoint of the PHY for DP Auxiliary, which should either point to
+          the SBU port of a USB-C connector or a DisplayPort connector input port.
+
 required:
   - compatible
   - reg

-- 
2.53.0


