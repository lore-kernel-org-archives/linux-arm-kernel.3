Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0234E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 11:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOdrpZAmSqRk7KcSBI8gGwUZGDxOvGDd/H3Zqd4B98k=; b=PWzShlz+6SEd/gP9WX3a+sy0eD
	4lm1ex3cyW4afe9IGBPzgbqcV/gnpLpgsbMHEg68ppUhcSp7JkCYo8jBSVZtVaBs4qdtjYszVuHeL
	o2Xm6mNX8nq/gKgirjKtDu/Q93RDsnFjQ6LIxYHb5X0Du6rex+MF7HhDWVJ7+iqCub1/FeT5nXq9p
	PXTjFU6Sp7wac9I9L3ewqqVMD8K6NsjpvBsoZAx3sC4T54Y+o+405DJk1BhGHRfouI0fMvCnZIH5X
	NX+W2ZBHehp5tL0QiN5+PctaDWdCsZg/ORtJH9Vu4cYFL7qAOyLLV3cG57qIqhknGQuF93EiE7ai+
	AiAQR/Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIyP-00000004zdS-2Bc6;
	Mon, 13 Jan 2025 11:51:13 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXItb-00000004yeX-3Qw3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 11:46:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hOdrpZAmSqRk7KcSBI8gGwUZGDxOvGDd/H3Zqd4B98k=; b=j00IdBCfKR/wGmZxAJzkeUg4bb
	CZ0lU6ZzRKt6fvWLNS+BdXQ3P9thS8ZKaGuGxqTc9G5gg0pb2o3gJ2vtGjYobsB+o2tq/RQ6offB/
	0z0XgeQwLFF9XPyPv/OblcLDH+T+ZUPC0TNLSOS6Z3NVV0yokCphg2MduP1C/6ieoWiKXrx2ORN4w
	ldD9jA+cHAY1mix6C3xOH5yUkqsTRN80a/cS9OCX/UnZT2c4WG8wD7Y91tPzH/VPhY25d/nz0g3cF
	XQjKDe/C69TChJhKZwWv1beMdzqB/sqma8cj9f1mrSoJGEbLe58E+zUQS6pWjNvF2cHEi8Y3qE0Pb
	eCGBzmgA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48036 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tXItV-0006VQ-0K;
	Mon, 13 Jan 2025 11:46:09 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tXItC-000MB6-54; Mon, 13 Jan 2025 11:45:50 +0000
In-Reply-To: <Z4T84SbaC4D-fN5y@shell.armlinux.org.uk>
References: <Z4T84SbaC4D-fN5y@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Eric Woudstra <ericwouds@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 3/9] net: stmmac: simplify TX cleanup decision for
 ending sw LPI mode
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tXItC-000MB6-54@rmk-PC.armlinux.org.uk>
Date: Mon, 13 Jan 2025 11:45:50 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_034615_853556_2315D78E 
X-CRM114-Status: GOOD (  11.89  )
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

As mentioned in "net: stmmac: correct priv->eee_sw_timer_en setting",
we can simplify some fast-path tests.

The transmit cleaning path checks whether EEE is enabled, the transmit
path is not in LPI mode, and that we're using software timed mode.
Since the above mentioned commit, checking whether EEE is enabled is
no longer necessary as priv->eee_sw_timer_en will be false when EEE is
disabled. Simplify this test.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f1e416b03349..e8667848e0ee 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2782,8 +2782,7 @@ static int stmmac_tx_clean(struct stmmac_priv *priv, int budget, u32 queue,
 			xmits = budget;
 	}
 
-	if (priv->eee_enabled && !priv->tx_path_in_lpi_mode &&
-	    priv->eee_sw_timer_en) {
+	if (priv->eee_sw_timer_en && !priv->tx_path_in_lpi_mode) {
 		if (stmmac_enable_eee_mode(priv))
 			mod_timer(&priv->eee_ctrl_timer, STMMAC_LPI_T(priv->tx_lpi_timer));
 	}
-- 
2.30.2


