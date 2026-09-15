Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C5CC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 13:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=; b=Xl3/sbHVU414OadE4M3CX7an3h
	BoY+oJNifT8p5sO3K6onnespwYDjusdXY0MceE6pk0wnKqj39i21+S5erli3PXPIKUjlM/Z4zbT6o
	OAmxK9K4DcDsTvhLeNtrCGMCmsVD3af5o5Z9n4Wsmck++KcKre0yk5hx4nfJfRePFL3HVn2uJyPec
	oqAOIjXjPnSVg8+E3nEoeb8FfjMzepS5IkxRnUi0jb0G7WF5yEHqyWL8inBxLtxIAxuPr+fPwpX1X
	l2hY19+fltHxurAuisk/4uzOuMLNHLEG4ITKZGm7u6T2+ESC9LYC6wPQlIJx5E/KYoYT5qKGSRCrl
	e6SZ5tcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SRF-00000006XG4-2PXo;
	Tue, 15 Sep 2026 12:39:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SQw-00000006WpE-3kI3
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 12:38:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=; b=pWcMdLMDM15kTn3mO5GwUyuXXM
	q36CfPaqq1XuS427LJ8rDhHPXZGkk4ek/tys7b+4glzrb5kP1oheF7mEL5adjf+Mlg6hTsnN9FyJA
	OwvL9OFYbKtcI6+f6motBa5X+XkNJIgQln6Wi9hjaXUJkZ2rE5AthR88a5YLKMA7YeY2fO25RW/zJ
	i5j5ALmR6fGlLyhn6zenRmlJBG8JwXHuj3fWNgjB2wUoiV/XgrgVmr12rKx1tIUZfZ0dDbWYFTmTv
	hnSKCUS3i/b8oeA4UaZ5bDNg/Y5jJS65I8UD6G7+KZwvNR1yyHiOjLSg0osNzvwZdmUhSa2VrA2pR
	9pxgQMtw==;
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6SQt-00000006kGf-48ZO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:38:45 +0000
Received: by mail-pj2-x01.google.com with SMTP id d9443c01a7336-2dae660f31bso31612205ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 05:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475922; x=1790080722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=Dn3gv86bCSuq8TjgCq1iRrWSrcSaX/dlLU5s9P8sr2pqW9+f3MDtIW3t2DAKlQGM3N
         bAW/Ja4PODCaT4T265xFJGOgCIsWjVY+B/v+fvk2lBRd1UE7quKPZwIzzTzF6TQvvLma
         DcS4EStbmTFQYKRzdZjb3KbC5b+OvtrR2Pb3Xie8U1tGU1F5p489Ed7InmvWhvgEffkF
         1S8y85qP0zrHqLfatOzDUfVUMQeYvuG/f9oQQ93sTwdoY8IdjtGjp53JjJt+zVd+tFLo
         LrkFsrxxeceqn+iPUBtPxorUkf+DmCOlQtL6jSECRcL1rvZOlnsf56AVZxI/7z1VaM2/
         ri4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475922; x=1790080722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=hv5ZQp1Lh0Gbm/g2WUSxZs1MBBPKemefuOraDi0SXvpeZD9pj15tpnnmMoGRlr5PB3
         fxuoHHKrNV7cXyjpUcw7Ujk2tK4K9Ac1s71frn0ZNGJZkbhb2WWNiQ30psemZJuTXQ1N
         dO/KBbk3dXn24ALJPUQbkgNds3/uugGB1xxygGm86NzlISRdOV8P+qi7tRrVxElBP0be
         mjMZs1sVpPS+dElI1FMoxZymKQcSeoML1SQ15Ss3blA8sYmJoBank64eH30uQ4j6wiwV
         hkLAj0p0XoBjOiPteG1q9WBb4r8prDjLX6GTEuQT8+AMyEyz03PeSrw/wTkO37xdmOQg
         RPCw==
X-Forwarded-Encrypted: i=1; AKwUvBxQbIuptWzlm9LwVbh/rUXPDPyQexr4iHPYuL5cf9Dk82c65Lc30WPSaF4G5+BmhcWJRbTm9+BUbMrZ687xvxcM@lists.infradead.org
X-Gm-Message-State: AFuF++lHmKgF5fNu86IWzAincllTBdgW0rX96JwvRIe8Nw4A5OHwVbr1
	cwGpoW2Pk6SDyKmvHKMiqcHIQabX8fYSa8qwM0u277WqLGbUcOcFt+0S
X-Gm-Gg: AYBFou2aYNqv/tGvoGBHLbhuQrOIVDQUITe8EzHm/RHr9L0GRXfEIX/ZDvMEbzp3gXk
	OVfHE1ADtNfSY4j3eM5Qn2Ipxgw14VkaqEuZ79wJuCP5MyMDF/YPxHR+keZr5rd+0VitmU6D5ZN
	Yw81YcZHSl5qK+aHDmeGCuY/cXtaJh7nPHjGqm+j2efAkZbZhb+jDvMIt3RaRnzq2obDLMwXsnd
	ANMwfiIBJbTK/PUcqQRJfB2/e7BfUQcIvEKIk+ww+Y698TckYvyxyfbprqz+mPMkvafUCqTRUFh
	U32YxIpLIoPOKPmXA/HYQTkwDHLYLuFAxkOeFKEwZ/BpmTLg8gkkIwcFajSFa/2aX6ApgXR+qeR
	rQm9nR+m/h5hJEqeeyjnmrUCmG4HpAj0nwM82Znm3sk5wD5x6fDzoGuc6nF8T2Q9yS0zk1Sr60b
	lmZD+h8CMPoTlWnTwmu8bqU3m4W8FDQzb/eMtn4MP2mqNKe1V8SO+D1WwEMwykDPvfd5LKcZz04
	yFlXjZ0
X-Received: by 2002:a17:90b:39cc:b0:39d:e54c:8658 with SMTP id 98e67ed59e1d1-39debf547abmr16493286a91.5.1789475921598;
        Tue, 15 Sep 2026 05:38:41 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd28acbsm5307259a91.10.2026.09.15.05.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:38:40 -0700 (PDT)
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
Subject: [PATCH net-next v6 02/11] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Tue, 15 Sep 2026 20:37:51 +0800
Message-ID: <20260915123802.1561724-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915123802.1561724-1-coiaprant@gmail.com>
References: <20260915123802.1561724-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_133844_118337_3F4FEA2A 
X-CRM114-Status: GOOD (  14.88  )
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


