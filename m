Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848EBC55182
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 03:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o3B8Lsv9izbrzVJxPU72oGWCHJ7Jn7HHfG35XgAytRE=; b=yhCpGpU/Ui+ayLEJa1T3uOvbDu
	anals/dHkx3fdzUyX835ZxkgOJxahVQQk0rjauIswfj9pZrL8VDtwIiQ+BHus13hiQUm2w8K+3pel
	1TtSxrm2sg7RyVt2hi9KXZPMJ8V9AX/SROXEDVPXCNy0TWxd939g6NCfVhae7QpsL7peulebuCLaZ
	PPgx/ANkUrDkNsSHmGfjzhf8Mie4OV803GW/UrtmFWMr+J6GoXDh9orcXGZBOoOhOI+CH+PIuxehE
	jnOUD+2S2TxACsshzXE2290zyGK/64t/dF47XKUxP2vZmsCBKQA/OWbuxY1YWTtj97vnndFS/CyP5
	4Ucg+vQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5YX-00000000tj1-1nA0;
	Tue, 04 Aug 2026 03:11:05 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5YU-00000000tgE-1CvU;
	Tue, 04 Aug 2026 03:11:04 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wr5YO-00000000471-1sJf;
	Tue, 04 Aug 2026 03:10:56 +0000
Date: Tue, 4 Aug 2026 04:10:53 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net v2 5/6] net: dsa: mt7530: check command register writes
 in fdb and vlan cmd
Message-ID: <0e5d65a672313286e5a8ce28a9faba9c8972dbb6.1785811140.git.daniel@makrotopia.org>
References: <cover.1785811140.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1785811140.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_201102_330263_06C99345 
X-CRM114-Status: GOOD (  11.96  )
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

mt7530_fdb_cmd() and mt7530_vlan_cmd() start a command by writing the
BUSY bit to MT7530_ATC / MT7530_VTCR, then poll for it to clear.
mt7530_write() discards the write's return value, so a failed command
write leaves BUSY unset and the poll succeeds on its first read,
reporting a command that never ran as done -- returning stale FDB data
or silently dropping a VLAN table update.

Return mt7530_mii_write()'s error from mt7530_write() and check it in
both command helpers.

Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: new patch

 drivers/net/dsa/mt7530.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 69cee61564cb..c0437273270b 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -185,14 +185,18 @@ mt7530_mii_read(struct mt7530_priv *priv, u32 reg)
 	return val;
 }
 
-static void
+static int
 mt7530_write(struct mt7530_priv *priv, u32 reg, u32 val)
 {
+	int ret;
+
 	mt7530_mutex_lock(priv);
 
-	mt7530_mii_write(priv, reg, val);
+	ret = mt7530_mii_write(priv, reg, val);
 
 	mt7530_mutex_unlock(priv);
+
+	return ret;
 }
 
 static u32
@@ -249,7 +253,9 @@ mt7530_fdb_cmd(struct mt7530_priv *priv, enum mt7530_fdb_cmd cmd, u32 *rsp)
 
 	/* Set the command operating upon the MAC address entries */
 	val = ATC_BUSY | ATC_MAT(0) | cmd;
-	mt7530_write(priv, MT7530_ATC, val);
+	ret = mt7530_write(priv, MT7530_ATC, val);
+	if (ret)
+		return ret;
 
 	mt7530_mutex_lock(priv);
 
@@ -1632,7 +1638,9 @@ mt7530_vlan_cmd(struct mt7530_priv *priv, enum mt7530_vlan_cmd cmd, u16 vid)
 	int ret;
 
 	val = VTCR_BUSY | VTCR_FUNC(cmd) | vid;
-	mt7530_write(priv, MT7530_VTCR, val);
+	ret = mt7530_write(priv, MT7530_VTCR, val);
+	if (ret)
+		return ret;
 
 	mt7530_mutex_lock(priv);
 
-- 
2.55.0

