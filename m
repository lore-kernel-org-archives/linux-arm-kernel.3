Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79073C55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 14:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=; b=qy2h+Fq0YzAfTyVy3v3RrI3yNj
	j1Q8VrENoTOh0qPZKfby2iBLrlcRRBvq5KaTtMCIunKqaKXqUICw0BcBzjTLW23oTc+CeXhgWwn4S
	NWVw5uqf6BC6nCV1+INAoes7Zvdt49w0ITOsrEpQi6V6pz7dUTOcGYQFxROzIdvlfyWH79srRvB/9
	9l1yf/E2h3GgSU2EEQciGL4nV4VmzmEa67yi/uhhogXIzk1GO04I9yJvTCyAF+OIgRLOGZV9f861q
	e/Dab+kWtCEQyLWQsUt+CEvmURp6WPG9my39g6sOqQq+f9DTJyxCgGIr9cAIdBD0g6E3aTtQjoTot
	vbRi1NXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqAcd-0000000EiQu-0iZG;
	Sat, 01 Aug 2026 14:23:31 +0000
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqAcZ-0000000EiOQ-46zX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 14:23:29 +0000
Received: by mail-pj2-x04.google.com with SMTP id d9443c01a7336-2ccc2e84048so11250335ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 07:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785594207; x=1786199007; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=R14Vfh+uQ0GDS0HAgCXKR+B7G++p39WpQU0dEr9n4cA3jV+HI17AyPphkqokH+/FRX
         4l+f7BzXXHGbqCyxv8HF6PcdNJtmZLSdPVdwTLd/Lh34WoLKToJUScmKt2m568XrLl6H
         l10b+m8aCkm+iG2+BcGvIGR/pRTNVXP96CqC+elsZ5XP7Qs8nICHsx8cL0afsHbL0wMt
         ebgo3jqtIzJPaK2uZzxjuA2aO4OERyIxor4VnVGPSRZfoSjZvF9cTizdXL9Bqp6hhZ9B
         N+y8ysQA0HEbKSYgI0Hx8+dF671XZj8t8jVSTFFZR5epv5LGrQLJ5sksma7N4UP1I3Ob
         Q7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785594207; x=1786199007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=B+EDSaaKlE1UVx0aeCD1Wx8hFkKUJPCY7mDdR8veJnmeefIAxOkIonPF3Ib4yzTD7Z
         pVCA0Hd3SBIjXPNZm7ZxMFHIcg3PUYe1DMi0d+VqfY/LjOYd+HP1WdKmXXXNBrTdSCoN
         4FjOO51Q+ioUh3YZ+f3/0XBaWppwrED1kX4+5tpf9dMsWH45+YfSGC9zUo6d26/8/QTJ
         WqRdYI6UzZWS2zt3QezxgJTEAmfqEU0AMoQ4XbCTQjwzNsrI7HMHBvBus1oIBSVCbcIz
         j60EhGRQsBy8s3MMyTVIq5qmNc872s74sOuLI59gW2H4kJj4Om4VeZhSo+zBHa1IkxX6
         hpRw==
X-Forwarded-Encrypted: i=1; AHgh+RpN7rZAWNnLzDdSXU+pCHY0IkfWq3v2P9u7Buus9UdFYrq26+u310gfAGASFLzYW3VKODl78mf0x43sHDFmMPn9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1soq/BlMj31CYg2brdnNwmrObVadMQd6mTV7s1YX4IFa4HP9V
	c0sZSp7Y/qKRq2csexW2dKs0rVxVgRJ8a9gylENre9afYirWMgCUYIX1
X-Gm-Gg: AR+sD10vP5DpXwcWRc4EsZTmwrf0TeiIeNplhgJyzOWKfn/1zLT/wSlL0xtxVmC9hlA
	gAh4LhDH5IvIEwtdyWqOLfU2K9kMxxpXUHZn7Qoh6K7nZtrRKJj1DmPIy0OJsoMXzfWfvmD33Ii
	+nQDb3aakuXTpXzbk209Nmu7xIi45orln7x5vLiuIYldImd9c2P5Epj+TUyqEHIUhOfU3/Pixxr
	X4t3uQnOWvBy+jedufCd9nnICtZAH242b0sE14s2oDv7aSN71/vCgJ5apmbolzAUZ7U3Q2DW6w1
	OsSjACigG++wImspbd5wZ4AuODKvk9X/Mv+DTAkCJFw2Ve3t2PDB8qbBoRstuPhZYgUEVLXAG/W
	ozeBdu3eUbHO77EHduqmup1lKEpKCEnCDEDwJwmo8XPlPn+FgT7O80fCOMCTJkDs7d96QQKxIoL
	AE7tQidnYwdVxVcta+0pKP/RsxFoL73hAFvZwIh2UnVm+x9uquaNs7yjLm7L9rIbVCww==
X-Received: by 2002:a17:903:2b07:b0:2cf:a5da:705e with SMTP id d9443c01a7336-2d052494227mr37113295ad.41.1785594206913;
        Sat, 01 Aug 2026 07:23:26 -0700 (PDT)
Received: from server.lan ([103.213.4.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae5ac3dsm18043845ad.23.2026.08.01.07.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 07:23:26 -0700 (PDT)
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
Subject: [PATCH v2 02/10] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Sat,  1 Aug 2026 22:22:26 +0800
Message-ID: <20260801142244.679437-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260801142244.679437-2-coiaprant@gmail.com>
References: <20260801142244.679437-2-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_072328_029930_725D7BE0 
X-CRM114-Status: GOOD (  14.77  )
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


