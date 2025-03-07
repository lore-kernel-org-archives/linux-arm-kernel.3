Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EC9C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 00:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6aEgnpw6gQBxCmSgxUBsuH9P0cxS5+KhOP2L7j4QauA=; b=z2Q97dkcjQ7BvV5IYx97JluBh7
	i0TMDNjKhVbjJC80KiJvS2IHnvAnc4ArcD3TbIoTwP3eDeY30q+p3t0sqyRWdzEJ+ecpJC4cdGUGO
	OXELgdur6D/yL44Bq85Thg5BuLycsz3B5ECXZu8eqTCHD3/cakpwKAo5ElqLwRW9rOHkpGqzckeg4
	tF+Fxu3ap3sfGKAbPtSCmyNsc1a3h22qyBE+gRgqy32Qk+wfHUmENfU7yG2Ym/kDA8sNskQ2OuV+2
	s5d6yuOvCoeEZnW31tpldC8dKvo65h1NOFPqUJ4Ame9vNYNs77M8UQ10Cb58BcKbLQj5Y1/5xSu6q
	9JWHjdEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqLQ7-0000000CcAZ-1nZK;
	Fri, 07 Mar 2025 00:18:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqLJo-0000000Cahc-050r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 00:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6aEgnpw6gQBxCmSgxUBsuH9P0cxS5+KhOP2L7j4QauA=; b=yoxavBy9uMeaqY5Luix2nzWH9K
	jSgO1V/jHBPZ65NR7Fk5R+2DTz30tS2MJUgN16e2mn6pUy1DxEWnUW+nW+hrVsHpJMT/MqrN0OD9h
	Zhr40BaND0BIuUZVZc4VwsLYASrglP1gWGmeQqytogdFtVSXHrhVWs2GmMFjgsS6oKXad9NoabOpP
	rTU97JRvvHe46czyKVpBCt52PDxcAKSW66e1+J4Bt0I2pRo8hgh4r8N8xlImqMQhfI7Tjvgwf6tuO
	1K8tLtoFqE7QjNbWknn/kRWwJmkpo2ZHXtu+svmOKa/aHIp/Y1jBlQwi2n+XIxzWK3rQUZoohsaNa
	kZpcF4CA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43876 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tqLJd-0006ft-2l;
	Fri, 07 Mar 2025 00:11:49 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tqLJJ-005aQm-Mv; Fri, 07 Mar 2025 00:11:29 +0000
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
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next] net: stmmac: remove write-only priv->speed
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tqLJJ-005aQm-Mv@rmk-PC.armlinux.org.uk>
Date: Fri, 07 Mar 2025 00:11:29 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_161200_064260_FD15D702 
X-CRM114-Status: UNSURE (   9.95  )
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

priv->speed is only ever written to in two locations, but never
read. Therefore, it serves no useful purpose. Remove this unnecessary
struct member.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 04197496ee87..bddfa0f4aa21 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -282,7 +282,6 @@ struct stmmac_priv {
 	/* Generic channel for NAPI */
 	struct stmmac_channel channel[STMMAC_CH_MAX];
 
-	int speed;
 	unsigned int pause_time;
 	struct mii_bus *mii;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 2ce18f52b717..982b7d82fd53 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1029,8 +1029,6 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 		}
 	}
 
-	priv->speed = speed;
-
 	if (priv->plat->fix_mac_speed)
 		priv->plat->fix_mac_speed(priv->plat->bsp_priv, speed, mode);
 
@@ -7859,7 +7857,6 @@ int stmmac_suspend(struct device *dev)
 	if (stmmac_fpe_supported(priv))
 		timer_shutdown_sync(&priv->fpe_cfg.verify_timer);
 
-	priv->speed = SPEED_UNKNOWN;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(stmmac_suspend);
-- 
2.30.2


