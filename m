Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC36AC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Tyz76o1+uLfLWPYmlz4v/JzF2IAk89yIS/ygF8RAos=; b=MToxIO3rr29bYwRXnz9yaFQWN9
	wjj+wA/wnL3PeDva4zSGJwj8wcGdsdDFy6DdQUy2WeVml8/C4Er8KnkHoVHW49CWIQGKt+I5Vwwl4
	i/3bcwTbK3y4rUeEsKZvoYtbY7y8J0HIjELI4H7+15Qhm6CvMPejbteXuhVVCmzQCzZa8MQxjpvtc
	ieUMk9V2tEWv3PAGpXZrE6CZ3pJ7+5Tk7hCmZLNsqBfINjS5jK6gTy4xsBFD4+DBvYJNI5vjWBMD2
	AsIImCS5DHSdn4lmMvBars4X9mqxqqIuM68cXW5lZRjjDQOCUX2yPmRupW8EOTyFyVfYf2YC+uWG4
	lhuTjcSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqphS-0000000GoxR-0OG9;
	Mon, 03 Aug 2026 10:15:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqphP-0000000Govr-27fL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:15:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 525631595;
	Mon,  3 Aug 2026 03:15:06 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA30F3F632;
	Mon,  3 Aug 2026 03:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785752110; bh=JZrZ65rYM8tLXtMMEeRF1Po3l4gxMqcIvdVNOlz/RbI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e5hk1uuD+1XmiLWjy/1AzfBHfSEAPlO/RIT6Hf5hLgWgIM9whs/nI81iOv07CTtRq
	 q1ERnp9EXCRobQaNNIzrEAnRMJ0tTHJ3uRh2WvStA9dcghYWTyDJ1Ex/XmVN9b4diA
	 YaxNYd9EzdNV7pA5M/GizmaRcHejHYH3EjwJmRNE=
From: Andre Przywara <andre.przywara@arm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Liu Changjie <liucj1228@outlook.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/6] net: phy: maxio: parse and enable PHY clock from generic DT binding
Date: Mon,  3 Aug 2026 12:14:48 +0200
Message-ID: <20260803101452.2993721-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803101452.2993721-1-andre.przywara@arm.com>
References: <20260803101452.2993721-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_031511_597823_15277390 
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

The generic PHY DT binding features a clocks property, which describes
the clock input to the PHY. Typically this is a crystal oscillator, so
it works without software interaction. But some boards want to save some
pennies on that part, and let a clock fanout pin from the SoC provide this
clock signal. In this case the PHY probe routine needs to enable this
clock explicitly.

Look for a "clocks" property inside the PHY node and enable that clock,
if one is provided.

This allows boards with a SoC-driven PHY clock to use the PHY. Please
note that without the clock enabled, the PHY will not be detected on the
MDIO bus, so the PHY-ID needs to be explicitly named in the PHY
compatible string:
	compatible = "ethernet-phy-id7b74.4411";

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/net/phy/maxio.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/phy/maxio.c b/drivers/net/phy/maxio.c
index 95a2169f25df..5fabf99fb90f 100644
--- a/drivers/net/phy/maxio.c
+++ b/drivers/net/phy/maxio.c
@@ -2,6 +2,7 @@
 /* Driver for Maxio Ethernet PHYs. */
 
 #include <linux/bitops.h>
+#include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/phy.h>
 #include <linux/property.h>
@@ -15,6 +16,7 @@
 #define MAXIO_MAE0621A_CLKOUT_ENABLE	BIT(0)
 
 struct maxio_priv {
+	struct clk *clk;
 	bool clk_out_125m;
 };
 
@@ -55,6 +57,11 @@ static int maxio_mae0621a_probe(struct phy_device *phydev)
 		return ret;
 	}
 
+	/* PHY clock from the generic PHY binding */
+	priv->clk = devm_clk_get_optional_enabled(&phydev->mdio.dev, NULL);
+	if (IS_ERR(priv->clk))
+		return PTR_ERR(priv->clk);
+
 	return 0;
 }
 
-- 
2.43.0


