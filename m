Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD1DC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 12:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HWO0yYxZDPAwCYSgicIL5MDEtp9MsL193ldKBirIieA=; b=NTEBBidQ13SJy1W9FrEE+ftg/p
	ibN7C4zZoX+anjJyI/8XrhZWLowd1z7lemGdhoQ/0AfrDU2S6/B9jd8Lq6m/mXevKe3E77i5vizAu
	ymhJjXyMHT63Q3nU0mzsFChNFswpvL3iuecFVRXmiVaW92AO6aZjjr6V/7ViGYTHKLiUV3jH47wpR
	yM6ou5c/LRrlh9vk5Dm32cUy8IN+C7Z+MOnDz/ozcRr0v0byXVJM2q/dks9op6YBw/pBFwkfz6+Pz
	Fn3lT72XRz/jmAx3xFxRPXeTJmud5JeSVJUMPBPbCFsB2GSVbbc6NMbl8Vszduly2VgVn4dF5rwwv
	zJ1lFEDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uYo-0000000GHgo-13Yp;
	Sat, 19 Sep 2026 12:52:54 +0000
Received: from mail-pz2-x09.google.com ([2607:f8b0:4864:3b::9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uYj-0000000GHbl-2QgI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 12:52:52 +0000
Received: by mail-pz2-x09.google.com with SMTP id 41be03b00d2f7-cc1ddb3ba3eso836607a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 05:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789822369; x=1790427169; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HWO0yYxZDPAwCYSgicIL5MDEtp9MsL193ldKBirIieA=;
        b=Y8moyQ+nPriRmjlpSoSkyos8faFnmEDvS52TJOYK+1HMYls8BVVKlRVdW1e8tdOC+V
         7REIRihLJPIFHhO5zydqmYYSRQQvRn6zwNN8NDx1sm4Eo7VcRkfrSXwwyioMix+B0unh
         BtNLnEYHHQuthYF7TfUVAxZDAgKNajJPidFwSH+jV6Ra6glN03ksBoyhSnS0y3g1zSp0
         mXDbaSj2F5vraK7g/lBa7MiMYX65DX0RkfyLHTVbFwcHTWn2g7T9UFushhFkOU/unjAF
         mHrhcOWTGtB+8Dwin2o6jnrewOSINQQ78j2JnSb16FsWACSa1ku0UE5rJVqqLIE9IWd5
         fcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789822369; x=1790427169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HWO0yYxZDPAwCYSgicIL5MDEtp9MsL193ldKBirIieA=;
        b=AltptxT04Ts+Vq8XZ+59b0n0Y5lA9OUFls4ErY3kIiUFVLygYMze6oXezAVnQLYsYb
         6a5mHEEBnyfNd4tlUeOQV5rWgBysuMq5x/9kptwIYAxNYfg79VwlQkJFm+NruVRs8Dps
         pQ/atWOw0TNwX+1exh7Ww2VlWIhc4qnsv1cgkq7FxuyGSDEvGuZTrb7bDOu/GgPiYaeY
         Jqebin2xTf2OOVolUopKgv7ApPyzlNzu6Y5kqn1wmESt1RKE467uzdeaMW8ViBDQlLud
         VvIc0flkNxiRJYmv19JDKdmv8R8qGHbqjT1RqO/xJ4zczWNjf/VDUXUcgneYznwVZeIx
         r96g==
X-Forwarded-Encrypted: i=1; AKwUvBxA38ADl8ycbDtgWYya9uf7bahgLSynR+KC+L44dsk+5wMOP0677mBamNUIuJfgdyccjQTcluMgNMaPfVqaTv2i@lists.infradead.org
X-Gm-Message-State: AFuF++k2Vx2GWZNOe8mcwmP7Zh82qE35NI0ZRlWJf6W7YXnu+IbCiihG
	/mDTdX4ZQDXATQKlLKQA5oE56dOaWYbAWPcy8uhuvGzhKnSypITdM/zS
X-Gm-Gg: AYBFou2hGaAoMUW42MCu1WE/bwK/cygBNec85wV8ND6pAbKaCJcacyCQlu/eedgaAW9
	XjILmm5r0JCpvmF0pGyKaRyZ4UuNpfltQw7Yu+egaEXRM/ObqP/TMhNG5WmzPlONwjDUaIYiCFX
	QmxS1bfyGRp6UnYn+wx8Lx0zQINhbMx2M+06g0BrSgMT5EhPgKmT4CX3uLnIRjQAnJfhBOSk19J
	yFArjHM+J7u0hGqmGe3yxVrNAOSZWYH/eHw/vwm+ceDGsRFvCNL8hYsA8wLIwnhvybyqkPx7vw+
	lhNcZLxEOjcnH50vfgUNWPylTMiuBvFJOrS0PeR6pErj73zAuTW2CjOrI9h53zkk2+HLmuAVTuU
	dhNXnoyIWSS67tvsKo6z9btXIJ/6g4A7RphQNEzUe9cYJmioP/XhJZOPA+V/8YsM4+H5p0RS30m
	DapJyJJW5KwY35W62O5yx1+Cm+DvHLLxHSMqie157eCeov1h2pR0ZBURdllHEn60IlrKDmYNSl2
	7fkPg2u
X-Received: by 2002:a05:6a00:2990:b0:869:9298:ba59 with SMTP id d2e1a72fcca58-874d84a6257mr9842225b3a.0.1789822368852;
        Sat, 19 Sep 2026 05:52:48 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa0026b2sm991805b3a.44.2026.09.19.05.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 05:52:48 -0700 (PDT)
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
Subject: [PATCH net-next v8 08/11] dt-bindings: net: rockchip-dwmac: document pcs-handle
Date: Sat, 19 Sep 2026 20:51:15 +0800
Message-ID: <20260919125119.2107089-9-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919125119.2107089-1-coiaprant@gmail.com>
References: <20260919125119.2107089-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_055249_654239_F4906137 
X-CRM114-Status: GOOD (  11.86  )
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

The Rockchip GMAC binding needs to describe the PCS reference used by
the SGMII support added later in this series. The property will be
parsed by rk_pcs_init(), and a missing phandle fails the probe. Add it
and require it when phy-mode is "sgmii" on rockchip,rk3568-gmac, the
only SoC in this binding that has SGMII support.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/net/rockchip-dwmac.yaml           | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index 80c252845349c..bb7540e838033 100644
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
 
@@ -159,6 +165,18 @@ allOf:
         clocks:
           minItems: 5
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-gmac
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


