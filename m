Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460F1E83070
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 10:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MYFlSK6uEYjArH0tobsWoO8ZoSVzbZj76ucnVVcsoLM=; b=3SNoWf8vDIqJE7Od528HIVUSCG
	2Ap+ZWAJhYaGWivFdRU7waF/UB7WywQSmguVEjrpysks0VRKQcfX4kjo0lh+IjI5hd+JVZQiSEVOT
	Kc4X8XNMF68Pe+o8dplRO6+rWQC4WW57D9jw28ptC/IHUanlHlw3fFDRKOunEdxCXaswR90Ck8SU5
	orXoAqs0gkW76t300QivWr7N6DCKnpcL01kwPCzga1AwVItwF4TLC3iCyPIF8kcRjddf6L3oa1Hgp
	gaX4daqkFSR6IdUxPkQFSUh9+94ifsb+ZS1SOzLtC9dd44snTyGDVq+YVHRwNKEPemLhhj1aeejUf
	S86gqgNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDDq-00000006QyU-44x1;
	Tue, 03 Feb 2026 10:01:26 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDDp-00000006Qxj-0rAi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 10:01:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MYFlSK6uEYjArH0tobsWoO8ZoSVzbZj76ucnVVcsoLM=; b=mV6aF2timT0QAo7ORy2SYdYhR3
	wUgUSHNRG56ABCdbtQIrmcrOLqoGc8g1VY5oXPd1OgxndubvjKLnakB4EdFrEo+e4DdUCGWXI8lxi
	eGrQLd9KO51hrcz+M6g1jlIjEF0M2oX6bjRZep5p6CnS0ckT/uHob25KQ6ePjVgm0lX0C9ZcjroJF
	Vyo9n28Rkm8jogPGoJrL37numtpayNAob2jwl9Jwf5XTSTOfvIHtYjKWXL0YLcsaNZG1nFnvZDCKF
	OC9E8k4IhYiDmz5jSpgwiF+7l11ZtvJByVLZl0STq/WPzGhXR+3TIiPq1xnbYUAKIs4TD02uIsf9s
	ws5iR2pQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40614 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vnDDk-000000004ww-1sEp;
	Tue, 03 Feb 2026 10:01:20 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vnDDj-00000007Xx3-2xZ0;
	Tue, 03 Feb 2026 10:01:19 +0000
In-Reply-To: <aYHHWm5UkD1JVa7D@shell.armlinux.org.uk>
References: <aYHHWm5UkD1JVa7D@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 2/4] net: stmmac: add state tracking for legacy
 serdes power state
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vnDDj-00000007Xx3-2xZ0@rmk-PC.armlinux.org.uk>
Date: Tue, 03 Feb 2026 10:01:19 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_020125_244478_B6E33750 
X-CRM114-Status: GOOD (  12.74  )
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

Avoid calling the serdes_powerdown() method if we have not had a
preceeding successful call to the serdes_powerup() method. This
avoids unbalancing refcounted resources that may be used in the
these platform glue serdes methods.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 012b0a477255..5bd97aaaba86 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -303,6 +303,7 @@ struct stmmac_priv {
 	bool eee_enabled;
 	bool eee_active;
 	bool eee_sw_timer_en;
+	bool legacy_serdes_is_powered;
 	unsigned int mode;
 	unsigned int chain_mode;
 	int extend_desc;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 93d18709bc13..9efdde915229 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -884,8 +884,10 @@ static void stmmac_release_ptp(struct stmmac_priv *priv)
 
 static void stmmac_legacy_serdes_power_down(struct stmmac_priv *priv)
 {
-	if (priv->plat->serdes_powerdown)
+	if (priv->plat->serdes_powerdown && priv->legacy_serdes_is_powered)
 		priv->plat->serdes_powerdown(priv->dev, priv->plat->bsp_priv);
+
+	priv->legacy_serdes_is_powered = false;
 }
 
 static int stmmac_legacy_serdes_power_up(struct stmmac_priv *priv)
@@ -898,6 +900,8 @@ static int stmmac_legacy_serdes_power_up(struct stmmac_priv *priv)
 	ret = priv->plat->serdes_powerup(priv->dev, priv->plat->bsp_priv);
 	if (ret < 0)
 		netdev_err(priv->dev, "SerDes powerup failed\n");
+	else
+		priv->legacy_serdes_is_powered = true;
 
 	return ret;
 }
-- 
2.47.3


