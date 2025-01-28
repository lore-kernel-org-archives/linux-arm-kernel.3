Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE70C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 15:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JoLZ33LNKwoAa71fKGzvEpEXOzJfCAkJh5baBBKZatA=; b=jPUaG0iycIBOAkLzANf7Aa074f
	2V/zdxi2wfv70Y24Wa0Zao3zTo3RUXpj7n6Vu7vlB2QW1bQsiTa8jcVc018r2XuN3ZjW7esHmcAY3
	hXB0Kg2Fy2Zc+n8u+Eu3K0r5UHBDXe8qBSSW3gd4Iw7M3RUF3I5Tmceew7wd+6WV/0NJeQcccqn6P
	f9O0I+a+uShNNqvf2AhLpkidgvMsTEgWeojJTis920J6VIm9b6EAbCQo9rjGTytrbmmTVTXfhZo0P
	cO/rP10+CDtOiAh8qihZiQvv/4AN/M5sUBB8eAv5boU6KXYpsR7xLPLTiRRCDG7gj9HPwriPFxQm7
	0qlXy8SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnqW-00000005Cjc-3ZpE;
	Tue, 28 Jan 2025 15:49:48 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcno8-00000005C0T-1NCO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 15:47:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JoLZ33LNKwoAa71fKGzvEpEXOzJfCAkJh5baBBKZatA=; b=iXi2056j0eNW1rMUPL/5DviVLD
	hYmXJaxUnw5pqu415V0u7DVXT6dhWUQ4eHwdn7xOecxV+CUclkNfNC0/cLXjzGab6R4MNB1293iLy
	TyvH6FifIgJS82vrQbzmLvv+P6795fSR3KrbH8vZAr4sBSIke2iy3aakvXX6jMAKMfgRnXg+zXs49
	1Oizn8GpJXQaoQyKfmjC87sBRQMqVcvol5WXk8l/N0HPMA7si9+S0/St47SNADXfTiPqGku1Ixhy8
	n67OJJFNgSbq3SZNKlHnR1UlCt2i2jl+8znfQCuxtHsewggRZaG780e1S6jmKWn2ebFXoo+heUuTS
	qfhiH0XA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49224 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tcno2-0007T3-1O;
	Tue, 28 Jan 2025 15:47:14 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tcnnj-0037GE-3X; Tue, 28 Jan 2025 15:46:55 +0000
In-Reply-To: <Z5j7yCYSsQ7beznD@shell.armlinux.org.uk>
References: <Z5j7yCYSsQ7beznD@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	 Vladimir Oltean <olteanv@gmail.com>,
	 Jiawen Wu <jiawenwu@trustnetic.com>
Subject: [PATCH RFC net-next 02/22] net: stmmac: ensure LPI is disabled when
 disabling EEE
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tcnnj-0037GE-3X@rmk-PC.armlinux.org.uk>
Date: Tue, 28 Jan 2025 15:46:55 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_074720_364476_44350AEF 
X-CRM114-Status: UNSURE (   8.99  )
X-CRM114-Notice: Please train this message.
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

When EEE is disabled, we call stmmac_set_eee_lpi_timer(..., 0).

For dwmac4, this will result in LPIATE being cleared, but LPIEN and
LPITXA being set, causing LPI mode to be signalled (if it wasn't
before).

For others MACs, stmmac_set_eee_lpi_timer() does nothing, which means
that LPI mode will continue to be signalled despite the expectation
for it to be disabled.

In both cases, LPI mode will be terminated when the transmitter has
a packet to send, and LPIEN will be cleared by hardware.

Call stmmac_reset_eee_mode() to ensure that LPI mode is disabled when
EEE mode is requested to be disabled.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a1a788bbc75a..7480825389e9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -494,6 +494,7 @@ static void stmmac_eee_init(struct stmmac_priv *priv, bool active)
 			priv->eee_sw_timer_en = false;
 			del_timer_sync(&priv->eee_ctrl_timer);
 			stmmac_disable_hw_lpi_timer(priv);
+			stmmac_reset_eee_mode(priv, priv->hw);
 			stmmac_set_eee_timer(priv, priv->hw, 0,
 					     STMMAC_DEFAULT_TWT_LS);
 			if (priv->hw->xpcs)
-- 
2.30.2


