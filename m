Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FFAE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 17:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qm2Cf1BaSz15K4PsGl3xyn8XApkKB5nwZMBaIeywDjc=; b=ACqq4jZi7FwLCnuFI1+hRstp5W
	CmSgsYmET8hSt39u6CcERxZSCwemxoyDRFblz00SiIYezUxoAVH39QtB+aZzStKVDrg/6RdQ0TIrn
	C78Drnzb3N15/E3KkkuImpsBqsScAYXZWiaX0jngp5c3xV9+QTwg8T/zR+B7OZjESwe3+q/ZPv9b9
	pBHQurS4iG5q8p6IZKWjwcwU0GwnTz6xu84dYiMxYlQ8Ezmu5ys0BI5ca7F7tmVIuw1EZwP9jMCtn
	5eVWTPGFTJStPRxO0Dt7w4Yxfuifa1YlLqJcqXkJpH/tSXKO2Xzc2V9eslSf3TPHA30yCZ+ep03eU
	3UyD+u7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCw0-00000005k83-3gNf;
	Tue, 07 Jan 2025 17:00:04 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCSg-00000005dg2-39oy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 16:29:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qm2Cf1BaSz15K4PsGl3xyn8XApkKB5nwZMBaIeywDjc=; b=BftMc+tDMdP13nYTQJ+MD6pNQ6
	h0c0M1qARwtVqPx8zfyKwTQ9yc+jEN9KgqKPLTJq2nKYWbYKDxKvcWfhxDW41QNy5+2TZiXy8InQq
	3bIyOggB8xnH21xsVs3FJPX2/qX7fhvvVfoG5QohY9KI+Kxm0ywRanbHg1rkv99NZcryp0rpAhNwp
	XjM5i5AQYiijyENWy0dqMNXVQCK+xb2DlXOalMYQk3PkYXSg1QdfI+4l0kCl+XrxtT32lvp1tm1E+
	zZ84TaIZeptyxoruxnGvlrqOn2OX+LVr/Mnjr4bzRjo/FdYod+SaksxTZLDKioEi5zEL5W/PrFyXG
	WetQSx4w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42170 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tVCSb-0007oY-2G;
	Tue, 07 Jan 2025 16:29:41 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tVCSY-007Y4F-Mz; Tue, 07 Jan 2025 16:29:38 +0000
In-Reply-To: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
References: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v3 14/18] net: stmmac: use boolean for eee_enabled
 and eee_active
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tVCSY-007Y4F-Mz@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Jan 2025 16:29:38 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_082946_801777_8022C6D4 
X-CRM114-Status: UNSURE (   9.49  )
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

priv->eee_enabled and priv->eee_active are both assigned using boolean
values. Type them as bool rather than int.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 1556804cca38..25ad3f92e14d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -305,9 +305,9 @@ struct stmmac_priv {
 	int clk_csr;
 	struct timer_list eee_ctrl_timer;
 	int lpi_irq;
-	int eee_enabled;
-	int eee_active;
 	u32 tx_lpi_timer;
+	bool eee_enabled;
+	bool eee_active;
 	bool eee_sw_timer_en;
 	unsigned int mode;
 	unsigned int chain_mode;
-- 
2.30.2


