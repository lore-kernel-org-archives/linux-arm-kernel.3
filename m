Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0927C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 20:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=; b=JnImQN5/0e9Irvl04Srak5Qzmv
	1cO+Co/wa4vgKrddxYHcpiNL2WXNJusOwhaomguee43o3axMcZfwghevMc1FhoUpsGIlssjkF2uTE
	zz6mACP4gT07dzDxbKKV7xLEPK4H4qyav+lM7dYRLksxENfUdr0ytFum50yofXjxB7NFS/R+ms3p9
	Ps2/xob6d9vhPUNfH84QDeqHaSjLOdsOLFvtgeBCTVsfr9IjkoItvVBmK0+Tm8vIe7E5eECaa6cKV
	463k2FBc39v7YxCdNelOccMsRs4QzjadtTEcf5u6/MXckmDhEIc6VmulUY9AA15EFF2oEPjbMhXZC
	GqChQcFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96im-00000006TqN-31eB;
	Tue, 22 Sep 2026 20:04:08 +0000
Received: from mail-pj2-x05.google.com ([2607:f8b0:4864:39::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96ii-00000006TmU-0PCH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 20:04:06 +0000
Received: by mail-pj2-x05.google.com with SMTP id d9443c01a7336-2d952ac253dso1213285ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 13:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790107443; x=1790712243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=jNJp3jVlce8ea2G5GzlTtotwzkdiaTsg7eHrS5JfGjtUJv4TtsO/Bpru4yoDAQRy5b
         EDambP9SH6FXRGOozzKhsK+1/0YaFZTebEcBqIxPvsvIu815P/O4ghDX/k9oGsYkhXFw
         Tz0NBc7imlqXvTg5Pc9CqwrR17yguALxKPeCX/H7l1dLwAnwno+Ha6qBq/q3+QiFv8z2
         pe4IibOcvqFten99ojQbSdo8lINRcDYEEVXsS/77bqBkKnxr1+h86LLqxnilSCeCpIK4
         P96H/wcnyH9VM6Xhq5x5uJi5hLL7KqoYN8B3FrGoXQ/e4cHRts8cVPdsBMHPBy8mO5jc
         BlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107443; x=1790712243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=E2t8+HeOczwOXW23heBjNVzFHK8zEU9DoWBcirLCdiPsR8vtWSMSXYP48mZ0PtZlx/
         xu1fclWx46ks2pYpeMprXo+sInJAHe5XwKJUsjenr/Ul2BkQ4jM4HiLzLD09N5WbRcCW
         Er/zj5pY406K1LFgGuYN5T5yTJikFgvd/4xJSIeGsRpWxs9I3qPhrIqG52zqnpkEghOW
         PeMB+5CSfjDj0mmQVqgQs+FLYZobZy99B1u1Eh1eal9Yy0jeTwu/iAvxg6gQE0i7BxmR
         Co666Poo7+tBsSrt4Q/p4frfMv1yaS39T5nBHU3DPYdn1KBeBPjL7DJ8NaoKOZ0x9Zb/
         W1sg==
X-Forwarded-Encrypted: i=1; AKwUvBzvp1vp0ulVlzCHiadVBM5QbX+QOiToy1KvFjUmrJu2XwIJGAoOF9cV2W1jN3ti8qa3Ka35I8aP8sFipyXwhShV@lists.infradead.org
X-Gm-Message-State: AFuF++nE+Yxma6vQkc66jMCA7B1jhgRSf9heJjAIa4Djhs7120R7zCCp
	SxHCjN9q5L/wsfCwPnJkdFrPdz7rkeWOgfr4XONomekhbD/MnUSojw5+
X-Gm-Gg: AYBFou2oCHc4SIIZquA1+T9Npv2TewvJKj2ATyMslX4RMs6msCTP43abZv/BNUkNj6f
	esfwwc3Td/rtETjOv+cPzYnaMrmalUuufzcRmHKZVXMT7lNk/Bohr5+iXXfGy0WWKWUv/S8ByAk
	XhkJ2MKmGu4d3Q8LmjXPWd1yJhKQoc0ul0i/lB42sFJEr5AipyDOl0PoQFUirflmz2Q25OwaefI
	lspmmkL0ZGCegkGABwyJbG4w7Mx8yVxo78IqanE3rr3XT2cTreE7F6hvnddPoqiMs8r2786PmFV
	Z/XGWFUjbGwjyeR4TnQUD7bBDIU4QX/jv/Z9nrPedqMJsy5eFJoKB7qp+wwBduPXv8Mfs9PtNk9
	5KDk4sOHe8yq361z8ycY+AdD5horUh1e6aXeY1iFx30yqxBwVYJ86RRUjL1/klY84q5pxQB3OG0
	Jzq1rJOkLJ8Q70lQTVtv5fMIHn5WJssdh+mwgthtN7tEeRyLHv5kvC0jK4KsbzNiUfxecNvw==
X-Received: by 2002:a17:902:d4c5:b0:2d9:68b7:c324 with SMTP id d9443c01a7336-2df69d368e1mr4567765ad.3.1790107443277;
        Tue, 22 Sep 2026 13:04:03 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5eea15sm654515ad.64.2026.09.22.13.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:04:02 -0700 (PDT)
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
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v10 02/11] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Wed, 23 Sep 2026 04:03:26 +0800
Message-ID: <20260922200336.2201212-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922200336.2201212-1-coiaprant@gmail.com>
References: <20260922200336.2201212-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_130404_135416_43E62BCA 
X-CRM114-Status: GOOD (  14.74  )
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


