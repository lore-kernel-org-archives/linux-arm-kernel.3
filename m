Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE38FD5327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 09:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kho+T4pB8cv+vYpSQaKdyOQtMZDJQnvD+jvbZwcTao=; b=MRyEibICdQJ7hQyXeTnqv695RR
	AN6vlN1mIIZH96k2JILuOi26RpS0YwCN93YMu/bXVXaz67xALIyF1qJIEYV8Pp1pmtgEIGKG71Fk6
	HwluPw5gPjM6HbjQZFuZhwICc+vdb1+h4Drr7kxV/iGJUzb3RCviNLkM9SIVIvv0oobSWMLrxoLvO
	T94cFGQ9uHuWSGszAR1IoO11fUmaMoGfXLFoqHBifhFgeEo+d0Q4V/cf/ZSe+QWfg6hOfTvvbjeLu
	oC1fsuNwUq4Fy3ZwBv76Sv6amsX6hf7EQ7ysmuI7BOfNzuEK1LLYe0LlKKLxWx4a9Kwu7046Uk6iw
	smV1laBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuYB-00000008Bjs-3DaW;
	Fri, 27 Feb 2026 09:54:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuY7-00000008BfA-1OWH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 09:54:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6kho+T4pB8cv+vYpSQaKdyOQtMZDJQnvD+jvbZwcTao=; b=KBULIJm9VA8MYAefHp/vSThrAx
	V8GWElB+2MqeYurSe7W44GzIst9yjOmhthTTQ7/cdQeRfLJdH/NK/H8e9nvA8SIgDcEPuKeirI2rv
	F4WRLxufwnOJZGVD5T3LZtmaWiHqgkep+GSqPwC9mO7xfmeKtvmjKCL8Eso6a5wbEHMzh/O3MPV/X
	lF/sYQwdgM1Rb4VA37nWsFUrnzAUb6fA0DwweHhMYit+bxsJS3+3VDF13FjTylicfI4QE/amp/XZv
	3JsyiV4HUCwE+F2XS9o9AvWNUXyNmyJqhfN2QhmOF/gMnbzD6ye4fq778T+eOsDXg6MxQEjm/5S5s
	SyNSKUGA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51756 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvuXx-000000000en-1MNL;
	Fri, 27 Feb 2026 09:54:09 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvuXt-0000000Avnc-0UYC;
	Fri, 27 Feb 2026 09:54:05 +0000
In-Reply-To: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
References: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 12/14] net: stmmac: move initialisation of
 dma_cfg->atds
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvuXt-0000000Avnc-0UYC@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Feb 2026 09:54:05 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_015419_442828_A61D09BC 
X-CRM114-Status: GOOD (  13.94  )
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

Move the initialisation of priv->plat->dma_cfg->atds, which indicates
that 8 32-bit word descriptors are being used for pre-v4.0 cores, after
the call to stmmac_hwif_init(), which will initialise priv->extend_desc
and priv->mode (the descriptor mode.)

We don't need to re-evaluate this in stmmac_init_dma_engine() - as the
state that it depends on only changes in stmmac_hwif_init() which is
only called in the probe path. Also, once set, no code clears this
flag.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index be144b946fd5..38f6b890ec37 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3254,9 +3254,6 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
 		return -EINVAL;
 	}
 
-	if (priv->extend_desc && (priv->mode == STMMAC_RING_MODE))
-		priv->plat->dma_cfg->atds = 1;
-
 	ret = stmmac_prereset_configure(priv);
 	if (ret)
 		return ret;
@@ -7449,6 +7446,13 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 			return ret;
 	}
 
+	/* Set alternate descriptor size (which tells the hardware that
+	 * descriptors are 8 32-bit words) when using extended descriptors
+	 * with ring mode. Only applicable for pre-v4.0 cores.
+	 */
+	if (priv->extend_desc && priv->mode == STMMAC_RING_MODE)
+		priv->plat->dma_cfg->atds = 1;
+
 	/* Rx Watchdog is available in the COREs newer than the 3.40.
 	 * In some case, for example on bugged HW this feature
 	 * has to be disable and this can be done by passing the
-- 
2.47.3


