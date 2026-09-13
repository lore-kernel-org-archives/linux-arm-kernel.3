Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7604AC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 19:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJZ0PecvDJzl0BEu7eLa+JMyHq2Op9t0/swrRCuqxn8=; b=o1dN5BO6+UHAMR8NhZYV1afi4v
	fubs/BObqkCI8caOyl1wQis/8BX/1lDyCF3ec5mHe9woG72uEhwt2Z45OWOYQ0QVq3PJJv6cXxjdM
	l0P4tnrXP2UbgY0f7TiD8iho+/mtrwHwCGJP7XEa+FcwjgFrEgsdynUPpGnTg0UmvTR51cvLL4LS/
	t53ezzwsLPUDAZFdfmWDnSo51118tWFO6YnMuBvI3A1KmpCLDr/i8DNMkTI+IDnQ8a3NFuBrHfUXH
	worcy+6pXS2FbjkmsZCw7jeFbX+1euzfSMTzeEi4orU4ZVnQTKpbY+t2ZpqqEjMswWcoCKHFoq1W2
	ep0EFioQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5pRh-00000001xgw-1Da0;
	Sun, 13 Sep 2026 19:00:57 +0000
Received: from mail-pj2-x03.google.com ([2607:f8b0:4864:39::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5pRd-00000001xbo-1qn1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 19:00:56 +0000
Received: by mail-pj2-x03.google.com with SMTP id d9443c01a7336-2db39df9c51so9594385ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 12:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789326053; x=1789930853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJZ0PecvDJzl0BEu7eLa+JMyHq2Op9t0/swrRCuqxn8=;
        b=iNaCGrcCmh/O60TbvEcUmhW5IlNcxomNzos7RtGteVEDrrgScUsaVq2whTyFM9lxix
         5OcXWuOfbs13wt4lWLOIv6uSIxOlHnRjF/DwD4CPyD2rGBrU64VryktdYbIcuKajVGcU
         ce226bUrnJ6HM9pFZOQBI27vdXjqIkKYDDb8b7Aj0jkQL6/u39nrV09jYeciDHQXI+KF
         ClWJnR8lH2uoTqRxC1W8vPZe00++QIjLuawU9agf0NKMnE7IvUvO7vRvuoUoUh/BfqH7
         D6W32JvXM9ZcQNCLNnUOIYuK/Zd/UpnRMo2Vc+iuQYtroL7WQzKrVul9funtehv8QXT3
         2uoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789326053; x=1789930853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TJZ0PecvDJzl0BEu7eLa+JMyHq2Op9t0/swrRCuqxn8=;
        b=JuKHVv/xCzJ6f6RzVpsUJFEldL+PxxKDmq1k2JSO+gIs4p50/z972zPXE/upbQOSyX
         B7u7NsZkSYc4omzRDich2tznbmR47YdQg2uXUNwA8BhWypUGFGGB4pIvnnrbhcUdFyI/
         S3lcZd8MwhRzYcO/ZR+/NndJed8y4NgVLmxPerIqRD8yoliyHubJb6pTMO+DPeGt1hVI
         FAxaJEpdI6Q5+QF0KqvAzDYA7m53/tLB7+gLWUmH+7JFGQxWJT1bSTsWYIsJYHunoMuq
         huWvh77rOmReScBLer3Ctxn/nP15sL+Me/r11owJ/VO1tYM2kh9fxGVsi4a2a2cOZf34
         TssA==
X-Forwarded-Encrypted: i=1; AKwUvBxFcyOWCX6hG6BVZElnbYB+fc4sSxSZYjfj+3AkS6SPr4otTuo+d5gwAEr7mnT15gqwioQWEHZoOcbSKtG6tmhw@lists.infradead.org
X-Gm-Message-State: AFuF++m8gMUmx+QadY83YehUfpLi3E8IYKg8dTTxiI6su7zTHz9S4RdI
	QVqhotQ0n3RisjvL/WwZHNL6ijmljR9DDUBAUjp931MkpywCwid+ftao
X-Gm-Gg: AYBFou0S6b6GwQJ5mtJv25FM/3fKDqG8lBOJpcD1uuzLwVDs0t9A4hyz9Auq5r2L3cQ
	jxkjIhmECEBoSs1Kiu/Y1XRlG3Uq9vnsFdPd3lBC4rp4WrEKoHfnGq09ghrNN/aD2aKen9ELeDR
	oPkPKpcFyOZpIlXU/7vIwY88xyyQPBbodVrePNpbZMndxMUwuOquON6PN9Na+fCEXDITYnDraxC
	HR7glMPP6eSLZIa22cYqlktwtT4+P9Qc7Y9YcpzwyJ/0V70suXPsMVXXaO3SHJlngMHBQo6Z/Sn
	/aq80n29iZ6nJkhrHZmRkr6CbjWwZhSYQz5pv4TEGnauEagxHtnRR4WeUR9kyc8a0dEwIMRdYXt
	oGxLL64QM7Zi0D/hhyt74kYYf7KkKj/yKVAjTerS4l8rT8hjJg8PEzxyztuOhy2F027pXn056iW
	ztUA1qy6JPv9ZSlBatAo9u2JFlCJHneqKfMRcCIpcYbZy/FTK1+WXJXXHlrCLbF0c6XR7WwQ==
X-Received: by 2002:a17:902:ea0f:b0:2dd:319:c9ef with SMTP id d9443c01a7336-2dd2a1c41camr232853065ad.3.1789326052648;
        Sun, 13 Sep 2026 12:00:52 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca6b7bsm36808655ad.3.2026.09.13.12.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 12:00:52 -0700 (PDT)
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
Subject: [PATCH net-next v5 08/11] dt-bindings: net: rockchip-dwmac: document pcs-handle
Date: Mon, 14 Sep 2026 02:58:43 +0800
Message-ID: <20260913185849.907479-9-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260913185849.907479-1-coiaprant@gmail.com>
References: <20260913185849.907479-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_120053_512677_62FE41B9 
X-CRM114-Status: GOOD (  10.13  )
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

The Rockchip dwmac glue driver now supports SGMII on RK3568 and
requires a PCS, referenced through the "pcs-handle" property.  The
property is parsed by rk_pcs_init() and a missing phandle fails the
probe, so describe it in the binding and require it when phy-mode
is "sgmii".

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../devicetree/bindings/net/rockchip-dwmac.yaml   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index 80c252845349c..67b21ea77ec96 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -120,6 +120,12 @@ properties:
     maximum: 0x7F
     default: 0x10
 
+  pcs-handle:
+    description:
+      Specifies a reference to a node representing the PCS device
+      connected to this GMAC. Required when phy-mode is "sgmii".
+    maxItems: 1
+
   phy-supply:
     description: PHY regulator
 
@@ -159,6 +165,15 @@ allOf:
         clocks:
           minItems: 5
 
+  - if:
+      properties:
+        phy-mode:
+          contains:
+            const: sgmii
+    then:
+      required:
+        - pcs-handle
+
 unevaluatedProperties: false
 
 examples:
-- 
2.47.3


