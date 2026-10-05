Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B8CCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 22:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=; b=ult16iKM5PwBAfm+jCnCqe5x8E
	giZPR9Q4unWDp5NSSc5ddgA3gIxmQvpqrzvDraPyDC3LulS1NLTYJ3XJRH7tGbpWXmuOyFieIWG5a
	Q2KHsM17b3HnOxcsxuHY+GW4ThNGDGN2+Ufl78OSedq8+d8xzCuGU29h3SAAh1jMzW0aD7OHukPGO
	IhAMEPs6XDol9VYUHKsGV3myvEDZUBSI8B+TKTIVvfAIqMp5gWUSWTkEYC84Vdyc24ozwTjAKLfO3
	dTpz8wj25O65piCm2sG90tRxWQXR6+ZyrUpaTZfFIgXynijEilNp7r/eQBtwfNbIT/Lz6fZjTxg7a
	yQsUiNiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDqvg-0000000HEnV-1YhZ;
	Mon, 05 Oct 2026 22:13:04 +0000
Received: from mail-pj2-x00.google.com ([2607:f8b0:4864:39::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDqvc-0000000HEl2-1eIy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 22:13:03 +0000
Received: by mail-pj2-x00.google.com with SMTP id 98e67ed59e1d1-39e501442e2so790696a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 15:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791238379; x=1791843179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=eje9N0samQoieiDRU1lAn9D0M6E8SVOhWF6Brg8MZtt0XSUVm67sT9kOIeC3ZWP1UL
         vHVYP3anM2rfZ/est0v+RtFeIrBEhEzbCahOB0lSp74RublHO+3sVI0P0MIDcq5+UkiN
         EYCW6/rnGyTIdCr1XPDxgdwOR5PgZRaBC9mh3ovKAiNIJJugJc0BUMVZKeBXvYIcPoST
         RQNhTlSbQ9xyKgQ2glA1tF5coPxZMMcocblaWfG78q7/vH+4S3uljnegzNqWSTyNQY4J
         HAVUeZ1/I7ovYrIvu0f9RwGS05B9qv5ldtp9LBWEfJy/N0c4rqw/5IzQgkbSzvPKDEZ0
         oMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791238379; x=1791843179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=scEx7Cwly2DiJ54NFXfQAdIknymKBBI3b2cebw/1NL9lk1JepcwEdtX8vsfA7p+/Cu
         OnfteuBUdkUfUH8M9MO2SyFJFPWRG68V4rBh3tvdbBkUsOhad4ql1VeUAQMhj3ybDD+2
         HgnWiChf1ZngWRDxVhltEQJ9f0s8DRGmWazYe1GO/1s93l3bNlZcQzS9HcG02w0Rd66q
         nHeywAYHeVYlFwEllkNwFQx7roSHkkNZNJPGRX/gfykGhIClWwpyR2dQ3H3DBz4Yb2wr
         1dt5K6z+wTO74rKWbqecXuHLMC/GZ6SoSarKm//U+v5V0qsd+eDlx1YsL1Y/x/0ekq6T
         lVFg==
X-Forwarded-Encrypted: i=1; AKwUvBzFz6ySHjPF5rTqe9kDTOMO/8UUMSEVXt8hpSQNb9upxfOqayua3z3NCo/Fq27BbrlKPna3NhICcpvv0wGAiidh@lists.infradead.org
X-Gm-Message-State: AFq9FYLZGra3N/iCOqVVNZVIGt6mcxMWS0C8wWm+uQQhKsYaM8+UEFxp
	McBLStEh9qpVO4iXTI2CzKdiZ6LEiOc7RC7XzSuNZENR/zOySnsSoK2H
X-Gm-Gg: AYBFou1UjF82UAuMDsfN1zd78QOFtiXBk6UHAHqOt7W1oFJ359X+5EElf6ppu2LMuSE
	iEPoCV0fbizZWgFoW9qabBz7bIQ2svnY12gE+bnkHeraC0fc6jmUDVS7EElJ7MrXNk2wTKOku5v
	OlB7lqMFzwAllKItWPMNNWX/MoZ0f9w/ZxkWA+nCJgt/SDDmeKYxaZ8w2RjLVBUTaCVbqWUks4J
	ywtMnIyjt8wZrzFLH/N7R/O3NL2vvg5ghSvykhJptX7WrCGOBTB3d3RG/IbZ1vA2cls4NQSzkx5
	0QMxSrcfhQHugWVIt95O9GfFxc/+18G0yioEhllKLVUXHqvsMkd4mZJMo6TPVxX4qnVDu/aUXTZ
	K9S3oq13dN5adQK864laqqWKkRdqfrlG/5dIRilC/sdmSyMhG6IHoX75WuODpOdB9dZuCoWFWJo
	AoMnW3GVJXMOOPVrMPDx7I8vV11j5+AwkkG0LzHmQ6i1OYR4d6FydVPgSYYUhoftI2atod
X-Received: by 2002:a17:90b:518d:b0:3a4:b418:94cf with SMTP id 98e67ed59e1d1-3a6cec143d7mr10688007a91.14.1791238379236;
        Mon, 05 Oct 2026 15:12:59 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm1719425a91.2.2026.10.05.15.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:12:58 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v10 1/2] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Tue,  6 Oct 2026 06:12:28 +0800
Message-ID: <20261005221229.1095843-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005221229.1095843-1-coiaprant@gmail.com>
References: <20261005221229.1095843-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_151301_083868_463BF120 
X-CRM114-Status: GOOD (  13.68  )
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


