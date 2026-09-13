Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A219C88E63
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 19:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=; b=ud213few7r/tDDm45mW4jwwTKM
	QAx4hKyPMMKKaekyIwVoP3Cv8ndMArYU+MfmMB4lRKzdlYzVUVVD/OFeZlTBBahE+gXVXIdxJCpl6
	/x3Wp4OBR+NQ7pxB6yULbR2RXOBITJ5gQbPCtW7YPT0xj+cciMz/4y5yfmtkUjlUnPAGBOPASZprO
	qFRhlfQJ0M+lYIBFyiLxGNhzf96cnrUV+XIcS31kNmUdcc1CxoWWXteMi05V8t57n2OoMiYVsCe35
	1u93CM/8YzhuTW/qD0efKd+maEYBugjv7UlZhFZww1Er8mzfSdLBOZAfT8NxSDdACRocdp3KB3QPC
	IbX8cElw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5pQl-00000001wkR-1BIT;
	Sun, 13 Sep 2026 18:59:59 +0000
Received: from mail-pj2-x08.google.com ([2607:f8b0:4864:39::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5pQe-00000001wg6-2r5s
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 18:59:57 +0000
Received: by mail-pj2-x08.google.com with SMTP id d9443c01a7336-2db33361b2fso18525075ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 11:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789325992; x=1789930792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=N2DsRkli4aC48ssaTM+JS3ZMEYnoVDPLrBldYLLduNNe8HyalXW74XFiSDLnZFIpGn
         gaDxHcBKdjzj3qCbdItf69xOLYxYz1ihDPEKOGQkolc3Vhb6DitIorlh+JWSaRWxcy6u
         3QZ0iZyr12s5dNpz1crq9nWAgLgbUDRczlYxhcQOz1Q2b7txrD+Hq1b8Tl85OJ5ueBff
         1hQe95xgMjdN4Vhuzcs9rg4jxCo06ztX5KbJMblStmkPhooNX/iBY5HqI1WjzRYmHjvO
         mHOyDU6Rb+zLUOESMYo/mUqNgEmiIsj2fXnBMqPBfl9vjJba0bldntN0HoUXAJVMy9Cn
         sf1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789325992; x=1789930792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=D2FcXEk9hOOUHfkYFJ0EK9i7Ao96bhTGCfkEQgHMFtbzmu2cSHGP9AY5yIWlG1rcpt
         8JdtqnHMy0lQedW+DxyC3hom+V/Mp07qToYYoDMKiJI3CfK6/b92I/dDWv5V1AkYg1pX
         FqvvU6W8Ax3uZfaps8wdR8byBhxdgcs272i/97jBgo4mwPv4FaCfJBsdvMD39CrK6lGW
         P0bVils00ebJ21JOumenQMZstJDjrT0CxX7rlWLjhOv11UPvuKIOz1WHRqL3zl0/573t
         Y7uqKtREEhYB1RiawNHaQ/OAW5DkTP1x0c+bERx/MZLAcp+uPKs9AvHGlF0OcAdFpTmk
         ezKQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8ndzVBlSWwNp+OB0DusxkMKZIwjzlRQFl6Soy8fFzGDtp5VFyvnXWdSliQz5Cz8w9n276LNO+XUeN2s7ncFvH@lists.infradead.org
X-Gm-Message-State: AFuF++n9GyHUeh/Qgyw63102ha6DSTlHJiUAO0sQJmDLIp8UckIBn05k
	YhF5DZbkjnEnSJJ9UqSLnTOC/6QRJ2VbDoSOimYFhggasBmFKyQgsjYj
X-Gm-Gg: AYBFou1PEHM/oCX5Lpd2jgpZ29shHysCkCgjYCsL8mObGTKVbXwMgQVYLkTwEz3S1Rm
	9zDWEDuZKVPp3ilx4zkZFeimK3HyqD/apUbn7VrMwiFOEOGF4NU5nMJQPvlG+QY4fd5QYUss8dz
	+g9zIrYjxh155/XqnfJPBZIb3ojlzd/lFofwkItECnYe2eGwGpNiLijtsH+38Lm9Jdg4C8xSn3f
	Y3Rppysji2VeBqcusK8RRAklLAs7kpiEh3NU00cbEDicwJNjFQsRoBpjDq7s9Nm7exsalmfBK3q
	pkEGaFCagKUvCqoKqDgLbrVVC+PNSFagAZhwo/3jiktbr50P/gl8j13muIEalCCn0+CEw5ONQB8
	140e+Tpnpyg3wLWUfeyG9hN/22OYZ0HPwFnPQRp0WMYRRazhvPXDx8IV9P6390p+eoUFOpwIb0w
	wXvWsVp0vqPS6oZ9MOkgxUrxrV5ZLM5hDavQdG094gG4OD22WC+Liwo2qEfsqHSmv+7iqNMQ==
X-Received: by 2002:a17:902:f54b:b0:2da:f1b1:56c4 with SMTP id d9443c01a7336-2dd2a1c9d19mr243912565ad.3.1789325991655;
        Sun, 13 Sep 2026 11:59:51 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca6b7bsm36808655ad.3.2026.09.13.11.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:59:50 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v5 02/11] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Mon, 14 Sep 2026 02:58:37 +0800
Message-ID: <20260913185849.907479-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260913185849.907479-1-coiaprant@gmail.com>
References: <20260913185849.907479-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_115952_721573_71CD3027 
X-CRM114-Status: GOOD (  14.44  )
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

On RK3568, the SGMII interface can be routed to either GMAC0 or
GMAC1 via the pipe_sgmii_mac_sel bit in the pipe GRF registers.

Add the optional "rockchip,sgmii-mac-sel" property to allow the
device tree to select which GMAC controller is used for SGMII.

The property takes a value of 0 (GMAC0) or 1 (GMAC1). The hardware
reset value is 1 (GMAC1), but this can be overridden by setting the
property to 0 for boards where SGMII is connected to GMAC0.

This is necessary for boards such as the Ariaboard Photonicat, where
the SGMII interface is connected to GMAC0 and needs to be explicitly
configured.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/phy/phy-rockchip-naneng-combphy.yaml   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
index 379b08bd9e97a..8e898bce9af73 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
@@ -80,6 +80,15 @@ properties:
     description:
       Some additional pipe settings are accessed through GRF regs.
 
+  rockchip,sgmii-mac-sel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    default: 1
+    description:
+      Select gmac0 or gmac1 to be used as SGMII controller.
+      The hardware reset value is GMAC1 (1). Set this to 0 to route
+      SGMII to GMAC0.
+
   "#phy-cells":
     const: 1
 
@@ -105,6 +114,10 @@ allOf:
           maxItems: 1
         reset-names:
           maxItems: 1
+        rockchip,sgmii-mac-sel: true
+    else:
+      properties:
+        rockchip,sgmii-mac-sel: false
   - if:
       properties:
         compatible:
-- 
2.47.3


