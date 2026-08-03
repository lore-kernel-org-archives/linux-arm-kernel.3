Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481B3C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1n71ajjkf4Cbl3nr7BNmyFDi4OKejtAlF/ZRqRv99g=; b=tfK7jC2xJi0ioZNkZ67mXyWs5/
	ZkaPCHNMfB9j8GZMa1k5NvH3DqqxdJTd4GAUYJ2/6I2TFa6Bofj0N4RoX2EFRUOWK/O4p3bwwT1fm
	ouByaNL2+uIbBEAXTaFRfpcOxfkkf4TIn+5qaPAhTci9WAQF5mrnu5465IQ5mVy6yni5q17HA+ynO
	EbvwbMbSCXBsdZz2miwsCX+SwU2HKNcLJ18lsFC0OQQvzbwyeLM0AQZpZu2vKUFWv2SEw1dXBkxfh
	q7bryBk5/P5MZ1ezip0R2IAc6ErSg63eQ0nYLz/AEQGkTas55yV+CHdCpOkpQk1B6AxlSDLI8gq+y
	ydAZmPjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqphN-0000000Gouk-3jIA;
	Mon, 03 Aug 2026 10:15:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqphL-0000000Goti-2jMC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:15:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EDB81476;
	Mon,  3 Aug 2026 03:15:02 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22A633F632;
	Mon,  3 Aug 2026 03:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785752106; bh=VDCFDjjzMueT3uC3KTWgxQYVR++dcRtmQp4VgUJgJnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c2Fm56IHDW776AjxEwkEjJlr6yeoqh9t4NrATKRW0HPew47HNVW+d3aVw98NGOVSG
	 mUWTWK8ohP0FGpaP7JYvEbrlDMHHnklUwdo5zhxg5TJ2PrG4dSad8a+uWCoyl2y1ut
	 kwYPVOw2g7KwHReAshZZfGQ8CoL73f9K218Enoq0=
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
Subject: [PATCH 1/6] net: phy: maxio: prepare for more DT properties
Date: Mon,  3 Aug 2026 12:14:47 +0200
Message-ID: <20260803101452.2993721-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803101452.2993721-1-andre.przywara@arm.com>
References: <20260803101452.2993721-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_031507_734730_2DEBCF35 
X-CRM114-Status: GOOD (  11.20  )
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

The probe routine for the Maxio PHY returns early if the optional
maxio,clk-out-frequency-hz property is not found. That prevents looking
for other properties.

Refactor the routine to handle the property in an if-clause, to allow
more actions in the probe routine later.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/net/phy/maxio.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/maxio.c b/drivers/net/phy/maxio.c
index d2cb23895646..95a2169f25df 100644
--- a/drivers/net/phy/maxio.c
+++ b/drivers/net/phy/maxio.c
@@ -43,18 +43,18 @@ static int maxio_mae0621a_probe(struct phy_device *phydev)
 
 	ret = device_property_read_u32(dev, "maxio,clk-out-frequency-hz",
 				       &frequency);
-	if (ret == -EINVAL)
-		return 0;
-	if (ret)
+	if (!ret) {
+		if (frequency != 125000000) {
+			phydev_err(phydev, "invalid CLKOUT frequency %u\n",
+				   frequency);
+			return -EINVAL;
+		}
+
+		priv->clk_out_125m = true;
+	} else if (ret != -EINVAL) {
 		return ret;
-
-	if (frequency != 125000000) {
-		phydev_err(phydev, "invalid CLKOUT frequency %u\n", frequency);
-		return -EINVAL;
 	}
 
-	priv->clk_out_125m = true;
-
 	return 0;
 }
 
-- 
2.43.0


