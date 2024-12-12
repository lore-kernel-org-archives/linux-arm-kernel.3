Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB78AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 14:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhEyC7HO5fHCfdZVGeJzs1scEWoOc88nyzztYwzbS2M=; b=jjwdLvmvZ4ap180isuyBdadqDE
	0Mp78lk0ZZd6KTMqwTgq06k73G/vW2/g7nx/AdhHKZyb2o8TJd6B7evoL2gnavHb3zWt/UWeDnTby
	34XPU2FCt03Y1SAbvLVRMZiRXYJPcY26wifeMfSl/FL5MOTJTt6DefsFf2kgGYAhIdQHwRVUxkEP/
	KLyroGqIn71tFL2Av3isCTU0B3VqA2Y1L/HbRutO9lMqMkYvflbsQQXBVgEq8ZR+/34pDkpBFnAsW
	jmpnkL8jcvVQxQJpM30MTuREq1ZfRX8c9fq09IRcGLl11JPxaoGW6AcTrTcJo/W+Le0gAaQOYxKnr
	DKZNN6dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLkYc-00000000flq-2zqN;
	Thu, 12 Dec 2024 14:52:50 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLkSz-00000000ewj-1GRI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 14:47:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NhEyC7HO5fHCfdZVGeJzs1scEWoOc88nyzztYwzbS2M=; b=pvS98ATWeE+8/EbP7WYDbMfdYH
	nVN0vHEThTNwibGZqYW8YqEtk3ObWAhGeuxuMTxw+kdlEOeyK4He3ZTkrTBIVt285T5i3t5KSsEr1
	mIf9N21H5N/GwzmPXm2G7UPPNXsEhxGKUYm7eXuO3zPQjvzmFYiH6vIP+sJuZn1YMDjvuP6mYXRNq
	lo9/v4S98JLX77xXY9cYdvNGkR8i2ENdf0PekGxzACLgjMY2o+EZpmYk/5TDCHPl5+a2nE1a3dzXS
	GvaOHKyI+oVXUe8mrcWmuwAvp6v6Q7W4qtjgB5ak06BCKtsRgFmJlQKTS7Bgv5pmZjl9unwBaiTOw
	V8pTgMNA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41430 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tLkSu-0005Lk-16;
	Thu, 12 Dec 2024 14:46:56 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tLkSs-006qfr-AN; Thu, 12 Dec 2024 14:46:54 +0000
In-Reply-To: <Z1r3MWZOt36SgGxf@shell.armlinux.org.uk>
References: <Z1r3MWZOt36SgGxf@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 6/7] net: stmmac: report EEE error statistics if EEE
 is supported
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tLkSs-006qfr-AN@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Dec 2024 14:46:54 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_064701_335737_202BC778 
X-CRM114-Status: GOOD (  12.27  )
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

Report the number of EEE error statistics in the xstats even when EEE
is not enabled in hardware, but is supported. The PHY maintains this
counter even when EEE is not enabled.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 3a10788bb210..a33d7db810f0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -654,7 +654,7 @@ static void stmmac_get_ethtool_stats(struct net_device *dev,
 					     (*(u32 *)p);
 			}
 		}
-		if (priv->eee_enabled) {
+		if (priv->dma_cap.eee) {
 			int val = phylink_get_eee_err(priv->phylink);
 			if (val)
 				priv->xstats.phy_eee_wakeup_error_n = val;
-- 
2.30.2


