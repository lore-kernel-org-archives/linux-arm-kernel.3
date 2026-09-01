Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB258C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 15:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=; b=X3S2ScjTDZY+xvvupyeOnEBjtF
	OSXTDEtzaD3wEEjAyryHLyqaQ0cX5nZzMVYmHbNVbnLAnb0rNyxEIyZe0xzsZkdtosTIN7dbzgSkP
	w+qHvBJJgL9+zdTtERSbNyRnwsp4LDX23HyfDzqFgJZYUa4jdRVWK30Gy4wgPvsZk1aoM2hvByso7
	LQ5JUVaaZX/Tecmr4w2himOw1OsvU1X43RnKX1e5eeH0rC1lWX4Yf5FnWJaRgoHJ7G1K3ulcFKgq6
	i0ARjHDm2Nr1RgZnRDy0TruWyZ73MXh3xY387QmU16RnoopvxwisaItpzbFPGgLcSV+6U4AWBiwcP
	GgeQgcMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Q0E-0000000CPJb-30hD;
	Tue, 01 Sep 2026 15:02:22 +0000
Received: from mail-pz2-x0b.google.com ([2607:f8b0:4864:3b::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Q0A-0000000CPGn-0uUF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 15:02:20 +0000
Received: by mail-pz2-x0b.google.com with SMTP id 41be03b00d2f7-cc1631a57d2so2430833a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 08:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788274937; x=1788879737; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=V+/dGm9L6Lz0MjNHzEsD34z/nhQxwSU4Fs5hQpZABZywyDkBU2f7UyF8ZO0S6PuwNQ
         4w7TpqyTbJKR6WxCpIm6zcxDmpbVG9UGrqOelR9wngDnksTT20WhnXLvqEiFpUM9p5i1
         u1q56kYTqXge1OreG/3/aV3hs26LekrMr9b35YAnv3eXoxbRIC0uSthkzD9WvTNBOuv7
         1IEfQTqDGmaJSxOGr8W+PxhGRULflK/GZ3nGeukuJg6XKWpE/Ezrga0b8k8wiYoMKfkf
         kIC273eJyke55+pm2RR4cDiYiankw6Drfj/2ZMBEulV8PzhGm1dvqfzGKdL4VM8xY945
         Dn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274937; x=1788879737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=FgrtmMWubPB8HPfiWybCwQUy0s42Be5VgBLcmcNwNjmkflhzUV8VB3gKzo1jwpZLtx
         FVsdhU/6FDtJLHtJmTZf+A+sDrjpQ5zJznUsOkPq5LRhglAypwFgzhtOmWejBdxcVBQ4
         6d+0m0Rb/opBOf0Bea/suCoWZ9V8123hw4MkFHx0HvL8lt1QyTMSFWCtoGJGNHhbGGA4
         kZIUvir3ECrgden/F3XldSfgTowqRAnDQGwaQVsKU8pag4qZmqdhc8JamcBhpx8N0u1X
         DU0Mz/NcbgkKy44zOgfKTnoo5P9Ec0q8mzCX157osj6aWVpg0m8r8IuBIXU9wP634pHn
         /13g==
X-Forwarded-Encrypted: i=1; AHgh+Rpso/7shwoBXJDEcssYT6ECtze6mo9sl2eCKI/PwwLQ/ZuL6XZLjY/AgVwQltW5CIHqZwqnPvZ73Xr5WYvcn3dU@lists.infradead.org
X-Gm-Message-State: AFuF++kdxL5z7PWAKtAX5kADfP6v7agZG67sY2UyQwtyrG5nALiOushF
	IY/itliA5iKR0QFYlyBTWvCXHoLi2eMsnQWN97X4rQuf7fPbRSXjP7BB
X-Gm-Gg: AR+sD11WE9BsilBdcTH73Ve1X+QKURt37n+VYVVQS6MdkiZuYtUdx6HmfeUnR3D/9lx
	FF3JglcnMLuaWeqhory+VHoYxWfnKrR+EpbBVzNZUmpVmnAhNzEl4JN1Jt65c0Juw+2YGwQSrTa
	SHDxDBGTI/EP2U0tEpqgzNYlWxfwhkPWO6j4Eg7lQWimjP8N0QXDcMJl9KEdcBwjB5mgNZo7dV7
	kkNX63EEDRA83cbgrGL98NSJwlRKCuAbXhTz8m1gXxHNcdKMplDCtTRTX0xreE+RnBKCUyerCHs
	ar6l3EWhj23ce+ggWXyVyG/Knrmt98SstzqGn8G8i+niQfFs3/SMi9XIEwCrV5L8JTtfQ/YRVto
	uk2hJLADSarwv+XC1rU2EmM+mT1SkbGDnF33OHAIbMf9YOnBC2/oAnp8I6WtAm3l7ut8RF7B2b6
	usTVB5Ad2ni/e8qZ72Md9QVanGCArXWdp0TFIf2ulUQGsZm4y/+F6f1t5rXtM=
X-Received: by 2002:a05:6a00:3397:b0:85b:cf16:597 with SMTP id d2e1a72fcca58-85bcf1605c8mr9714948b3a.19.1788274935860;
        Tue, 01 Sep 2026 08:02:15 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc0716846sm27914b3a.45.2026.09.01.08.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:02:14 -0700 (PDT)
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
Subject: [PATCH net-next v3 02/10] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Tue,  1 Sep 2026 23:01:02 +0800
Message-ID: <20260901150111.141037-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901150111.141037-1-coiaprant@gmail.com>
References: <20260901150111.141037-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_080218_279570_CBBDF911 
X-CRM114-Status: GOOD (  15.15  )
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


