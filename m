Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DFFE77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 12:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YaIwfo3a3xNY9w0lpoJEGzMt05JFAo3+kHqFGw6dWEM=; b=hxoffkMoJqPZ5fUOMZAzlXbQlg
	ASbLmClFD8ht5Yp2y4A+bnMj91XXAsGfWluMqsP1fwlpYipaucGmG55em3bJDOd+EYKBTN+X6j+tV
	QZ0KlK0lmKu8Qe0R5lHYIJz7v8kGK+S3oBsLhIGdX15dpZw8MBgIfqAqpKTKRSqu4mtJdac72AAP1
	nLpN269RhB+VpYXE377h36sgND5u8xQiJz/u4MY8fK+D6A8QGlaeME/ksduJgsl/hy0JFXzWm77qO
	faC9A/WUiMF3cS4kC3jMV1pNqixLeW+P6GNXk36+wbHUOtML4SGl84VbGO/HmtfKO2WAZf28hOd5V
	hRRvnZLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUlsO-000000018fc-3hiv;
	Mon, 06 Jan 2025 12:06:32 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUln0-0000000176x-2916;
	Mon, 06 Jan 2025 12:00:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YaIwfo3a3xNY9w0lpoJEGzMt05JFAo3+kHqFGw6dWEM=; b=0CUjRiDBpeqq/aRdQ3h3jjBwGv
	JPXREV5M/ICLFd9KhbVLmn5pAp4jSjJ3V/z/0tZDrrFYtnY/NpCAj1jGhlCu9qL4V7mw911t1sVzW
	le+sTBmQde2oGEB7/ZamT03HtypDCt56x3hFkItNsE+9nr8pUtyPSnFO4iBovXXPuKHuHqRrp3bpV
	j5JalkxjZLFJEwJfPxrYkvtKvW0FusHtbtbdD5F36dw8BYacB8G6Khi7Iy8au11ByWSuDZsf1VBev
	f0hNr73BdPO1EB+3MtEBvw04WB8UHJlMYzhiPuenxUMUFixZKt5HX2+uCORaX4d4N2I/P3yiNKE2r
	Tg8NV7tw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35618 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tUlks-0005k3-2E;
	Mon, 06 Jan 2025 11:58:46 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tUlkp-007UyW-OR; Mon, 06 Jan 2025 11:58:43 +0000
In-Reply-To: <Z3vDwwsHSxH5D6Pm@shell.armlinux.org.uk>
References: <Z3vDwwsHSxH5D6Pm@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Ar__n__ __NAL" <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	UNGLinuxDriver@microchip.com,
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: [PATCH net-next 1/9] net: dsa: ksz: remove setting of tx_lpi
 parameters
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tUlkp-007UyW-OR@rmk-PC.armlinux.org.uk>
Date: Mon, 06 Jan 2025 11:58:43 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_040058_552835_28C8CCD2 
X-CRM114-Status: GOOD (  10.72  )
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

dsa_user_get_eee() calls the DSA switch get_mac_eee() method followed
by phylink_ethtool_get_eee(), which goes on to call
phy_ethtool_get_eee(). This overwrites all members of the passed
ethtool_keee, which means anything written by the DSA switch
get_mac_eee() method will be discarded.

Remove setting any members in ksz_get_mac_eee().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/dsa/microchip/ksz_common.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/net/dsa/microchip/ksz_common.c b/drivers/net/dsa/microchip/ksz_common.c
index e3512e324572..60a4630dd7ba 100644
--- a/drivers/net/dsa/microchip/ksz_common.c
+++ b/drivers/net/dsa/microchip/ksz_common.c
@@ -3492,14 +3492,6 @@ static bool ksz_support_eee(struct dsa_switch *ds, int port)
 static int ksz_get_mac_eee(struct dsa_switch *ds, int port,
 			   struct ethtool_keee *e)
 {
-	/* There is no documented control of Tx LPI configuration. */
-	e->tx_lpi_enabled = true;
-
-	/* There is no documented control of Tx LPI timer. According to tests
-	 * Tx LPI timer seems to be set by default to minimal value.
-	 */
-	e->tx_lpi_timer = 0;
-
 	return 0;
 }
 
-- 
2.30.2


