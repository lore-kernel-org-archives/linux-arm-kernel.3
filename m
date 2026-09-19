Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9FBC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 12:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=; b=yOF/VG2ClJB8Ys8LUdsDbej6xm
	fMTyuOc1A5JXfW7YgW9dNTwEYq8Oxr+Uh7R+33xi6FcEoDixX/jQrkvLWcayMWJ6KgoGTdQrf4Z0f
	kIqp4NkMwW0RmOEWHhfI3R6XDFeNRuvgT7IWrQ+a+Ltvgzy8w8YF7ZIzzGPjBgMbTYBmdqAlDXMI8
	tDvpT5r7GbCK3iRiFye1M0mZ2UVo4J1kEceajh1upi5t/lTi+hM/N21MsE4Wod2+RxYyeY3+yU9Vk
	YB1JrH1Dm1EwE9ZJiB+nsFpEXsGbnynrLg+1xhA1xm6WQkMRXLNjPF/sbZcgNoqyZreCnTiWxy0fi
	R4YjvbOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uY0-0000000GGrU-1cWU;
	Sat, 19 Sep 2026 12:52:04 +0000
Received: from mail-pz2-x06.google.com ([2607:f8b0:4864:3b::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uXx-0000000GGog-315F
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 12:52:03 +0000
Received: by mail-pz2-x06.google.com with SMTP id 41be03b00d2f7-cc4b14f0364so608662a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 05:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789822321; x=1790427121; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=WG0ZlNh2tVttLThqTlkqbuQ2iF2YklFJllKmdQb5WXnnjPbWT7nVQCnj6j9GnEdWxI
         KdxqNJ95nYOf1w5nIq8Wu+/X3L92ETDGy2h1+EXoqHxcEuy7NwrYVcLrgUSF/XFis8Rr
         c5P9oB6JW0sx+OZiRh0BJ+msNNiV/8BnqV5UCIO9neM1/0iKyuUdlUCnPYNBUihWK7by
         CZTsOIjrE90OFJR+LUDtINq0XqKt6cPN19AdSb0jIOwqxkK3qaeRQ/WREzSOXxAnwkd8
         +UWTx6katJqevn2sYBYcqiQ+c4fupMEdPFn/hboKiv0KCinxFyy9TSYpXnTb861lAgiO
         ZOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789822321; x=1790427121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=SFe6/UbcAl/FafC/izSYjs26aQnTju0ViCTq32OVVzI7ve3ZXZ1S4W5MHfjAcyjAIf
         fXNs2DUTcZMVCORc81c+BY0PvDrsZ6/x/xj/4iUGz2IBTXig5ExUkFn1mWLrtnYAovwm
         0a/fA0VyrYlvyvadGn08Zk4OGVtPm3wEFTxLAq4T1bGg/TsCfRHIseG9saXUYDhgO2f9
         pRpQP3CTpOc4U3q0XO1WwoDlxo7dWOeAxxdHo8AEhCnOUwQjQES3QOAhYBryPYl9b45/
         gBmvGrews3OgqCR093tmp5283ocGDEiu4+fkxYsF9bJ8wezKkrvOn9iqaPo7yQYsZi8P
         9HFA==
X-Forwarded-Encrypted: i=1; AKwUvBy96tvcLr4qS2daLBwsEbnb3tNJnJLzw4/DTWfwvYhtycYpnB09wWwFd3EL4rSA3m79Zy+saBqSJydy4aB4pv1E@lists.infradead.org
X-Gm-Message-State: AFuF++mgHU7rtfVi9U5at+K2v6DI14sFNAwzN65lCN9TejaKwRtauy9v
	pLI8nHWr4Fz2tatqGL6sIIQqPJAAi5rq0x2SvSkq1Ozkhgt8ywUWO4W7
X-Gm-Gg: AYBFou1xzMF05excy9IR9L4c56G8mYRo4Gr8RBAkS3SCntK6+Wycgm7cab2KFWbsxAO
	imZTNw3mnlCvP45tEG2Ptuu9qT0oeq4CV3WhqK8lAMKlengBkU2nu4s6yy9v8ZWCXGlh3iNqRpe
	2tWe+NlrbG8rmUxjREa5vb4aEG+kXyoPwO/jGewnxyTi1JmD52H+jukKJmWJoygQD5v5XseUDHp
	niRQuNjrk5xA+58FMZnGISHCS0nzBqIAeM6UBAUo1cOqyder2VB/YO0hVBJtyDgDUM2D7t53SlS
	ahZnopqDgTKmOo9SRhEylM+U5IDIwokAIfhNxIF3tv/nVy9tZwwayAi2dyptR7CgSps1DwjhN02
	KZbaxT7u0H514L+S+vyOEKtsQfztih9DvKPUstp9mnA5kAeUPX+XRNTsdrxnB4bbF8e9tMbyz5C
	Q9/9O5lpmqc/x8cR8tg/DLSheHbdptqeT2EvdXF5gEUtsh5hOWzdjzYyS1wjCeynish+mFNg==
X-Received: by 2002:a05:6a00:9086:b0:878:3783:8a82 with SMTP id d2e1a72fcca58-8783783932bmr1483263b3a.52.1789822320744;
        Sat, 19 Sep 2026 05:52:00 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa0026b2sm991805b3a.44.2026.09.19.05.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 05:51:59 -0700 (PDT)
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
Subject: [PATCH net-next v8 02/11] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Sat, 19 Sep 2026 20:51:09 +0800
Message-ID: <20260919125119.2107089-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919125119.2107089-1-coiaprant@gmail.com>
References: <20260919125119.2107089-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_055201_760941_F53114EB 
X-CRM114-Status: GOOD (  14.71  )
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


