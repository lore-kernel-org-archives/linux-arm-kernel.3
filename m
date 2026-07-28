Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E4FC54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 04:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AhrsuWpXTmIa68Ke5EmX7LuRDSSBsZsJCI2m9X/7Jck=; b=qzWzP0tBDVo1P1PnDUxFx0ri3h
	yLYlPHlGNJTWHFeaP6WpXJDdhHaSXSxWfLEuWys1J84fvfW3TZMMlvZptpFgxnaYcggsnmv57x3sf
	3wFujdd+uBar7y2ndKeuIQsJh39AM2V2LUdi4WbbRA95f+HgmJBZCYmGyy5Zxd4FN2gdYv9Jeb8W6
	oUHBUNXgTej04q8JqybvqJdyAziBX8/ErAF8QOORMaQlyJSVNQwNVADkkFa2j9UkdDCBdbm7kXVAb
	V2rKUI00AZ/FOG1rllHlTfZX164GfmZUQEk1q1vzsdUKtsl77AglAqh7bIZt+awbU3u9eZ9pICts4
	RUytUkmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woZno-00000004PSP-1noD;
	Tue, 28 Jul 2026 04:52:28 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woZnm-00000004PRd-1aS5;
	Tue, 28 Jul 2026 04:52:27 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1woZnd-000000004wV-1vuB;
	Tue, 28 Jul 2026 04:52:17 +0000
Date: Tue, 28 Jul 2026 05:52:14 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net 1/3] net: dsa: mt7530: check bus->read() errors in the
 MDIO regmap backend
Message-ID: <3c628e48276c2e5522c8795a6be60d11c7a76a7d.1785213071.git.daniel@makrotopia.org>
References: <cover.1785213071.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1785213071.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_215226_414630_DEF0DEC9 
X-CRM114-Status: GOOD (  12.84  )
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

bus->read() returns a negative errno on failure, but
mt7530_regmap_read() assigns it to a u16, truncating e.g. -ETIMEDOUT
into 0xff92, and returns success. The garbage word is then consumed as
register data, and read-modify-write cycles write it back to the
switch. Check both reads and propagate their errors.

The same defect existed in mt7530_mii_read() since the driver was
introduced and moved into the regmap backend unchanged.

Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530-mdio.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530-mdio.c b/drivers/net/dsa/mt7530-mdio.c
index 11ea924a9f35..784dd58a7158 100644
--- a/drivers/net/dsa/mt7530-mdio.c
+++ b/drivers/net/dsa/mt7530-mdio.c
@@ -55,8 +55,15 @@ mt7530_regmap_read(void *context, unsigned int reg, unsigned int *val)
 	if (ret < 0)
 		return ret;
 
-	lo = bus->read(bus, priv->mdiodev->addr, r);
-	hi = bus->read(bus, priv->mdiodev->addr, 0x10);
+	ret = bus->read(bus, priv->mdiodev->addr, r);
+	if (ret < 0)
+		return ret;
+	lo = ret;
+
+	ret = bus->read(bus, priv->mdiodev->addr, 0x10);
+	if (ret < 0)
+		return ret;
+	hi = ret;
 
 	*val = (hi << 16) | (lo & 0xffff);
 
-- 
2.55.0

