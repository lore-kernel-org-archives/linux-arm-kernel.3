Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94B8C282C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4I0f1PHQaAjjm2hMikqLDrqSEQ1EPe1JRRvpJJihO7c=; b=uPdSucYH0FpD3vVCZ/BJE3R6SR
	nWjU2fICrpNYst5x/gO3n86hPt8SlxHbBDW6xx16ZEslKR/iUcoBp2Pn/D096JPOG+Rt6BG/3aIwy
	LkhVWdsf7FB0jW8YWDNcbOO8yvL5zClSt/RiUpyWmu/ghCBsjpJaKuHivAtA5SB+2iorsaD6gCny1
	v37KMzKC7NPqlQir/lqo4u4JHtTun3ssvan5tchtR7PABUHZ6i4pNXWcQPQx2/CgQh6Rc5aqQDxvg
	0CBqalyDjfpPRrtZb5USyY9HkMdksVXE94XM/CGmLK0mUx66XRH4fMTvNQvtirMHTyni+qPSr4D3s
	qN/PQVVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjh0-00000008Tdb-1W1r;
	Thu, 27 Feb 2025 19:37:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf1p-00000007lav-1rPC
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 27 Feb 2025 14:38:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=4I0f1PHQaAjjm2hMikqLDrqSEQ1EPe1JRRvpJJihO7c=; b=BGEg8rg5YrzKPQxqwv5LMx5DzQ
	J9LE4r4EKr6PS/RH6qmXXG/pHaX+jEF1kHtrz2geBLWyDoE6FIskcX7a3N2E6x+8fOCA+zdQSJ77r
	bEk6u7WlWq7vdTwtVR7xzUW57ElXi8ANZKccVfdEzu8WMVLDbrbt6YnAzQu77lnVFdhUPC0QZCzMi
	IOpezncGZG6HCcnS1xFz5erDaHtJFLwGjEwn4bVooo3eV1USNWJKjT4fi5iPCOzWcwCHkscekTLBe
	Wp8ekwDnBuyNAk1AB81duj+jVzfQTkNJLiStoRN9cgOP+dJeCf/Gbwl5pvulO5DdXuNXsUVsrgQIm
	cyUtbOlA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf1m-00000003oRd-2354
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 14:38:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4I0f1PHQaAjjm2hMikqLDrqSEQ1EPe1JRRvpJJihO7c=; b=RbDq/Og3xnnNmeI8ijSBQHIQDv
	zfpsWLuMyPmLKtjvbDxrRweXy6wXBx9ZAUAYmSEs3yZegSq7RNrxj748BMMFVVGmuII113WURS30/
	l8OvSXyl/KpBj8A9wWBH18ZFyMS794Zus7mSLsToCCGjN9BGfuUWDp94vEhevuxExLNHWIFj8+dn+
	/VSiRC3wv/6qENtfFRj70Q75QQghb0+S293qbUg4qWCm+8GKFRxjgabHHPc+dXBz3EWHsoHH9Dr/v
	Z5m2yGFqzdb251CWXonPxh398UB2+FMokmrwRbozZLct70qlRsa+cKf10YuIRFFQhkQjSr9BjGZcT
	BQpmhzbw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40470 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tnf1h-0007QM-04;
	Thu, 27 Feb 2025 14:38:13 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tnf1N-0056L5-2X; Thu, 27 Feb 2025 14:37:53 +0000
In-Reply-To: <Z8B4tVd4nLUKXdQ4@shell.armlinux.org.uk>
References: <Z8B4tVd4nLUKXdQ4@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH RFC net-next 2/5] net: phylink: add phylink_prepare_resume()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tnf1N-0056L5-2X@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Feb 2025 14:37:53 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_143818_676139_62544CDF 
X-CRM114-Status: GOOD (  11.07  )
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

Add a resume preparation function, which will ensure that the receive
clock from the PHY is appropriately configured while resuming.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 24 ++++++++++++++++++++++++
 include/linux/phylink.h   |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 0aae0bb2a254..976e569feb70 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2636,6 +2636,30 @@ void phylink_suspend(struct phylink *pl, bool mac_wol)
 }
 EXPORT_SYMBOL_GPL(phylink_suspend);
 
+/**
+ * phylink_prepare_resume() - prepare to resume a network device
+ * @pl: a pointer to a &struct phylink returned from phylink_create()
+ *
+ * Optional, thus must be called prior to phylink_resume().
+ *
+ * Prepare to resume a network device, preparing the PHY as necessary.
+ */
+void phylink_prepare_resume(struct phylink *pl)
+{
+	ASSERT_RTNL();
+
+	/* If the MAC requires the receive clock, but receive clock
+	 * stop was enabled at the PHY, we need to ensure that the
+	 * receive clock is running. Disable receive clock stop.
+	 * phylink_resume() will re-enable it if necessary.
+	 */
+	if (pl->mac_supports_eee_ops && pl->phydev &&
+	    pl->config->mac_requires_rxc &&
+	    pl->config->eee_rx_clk_stop_enable)
+		phy_eee_rx_clock_stop(pl->phydev, false);
+}
+EXPORT_SYMBOL_GPL(phylink_prepare_resume);
+
 /**
  * phylink_resume() - handle a network device resume event
  * @pl: a pointer to a &struct phylink returned from phylink_create()
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 08df65f6867a..071ed4683c8c 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -699,6 +699,7 @@ void phylink_start(struct phylink *);
 void phylink_stop(struct phylink *);
 
 void phylink_suspend(struct phylink *pl, bool mac_wol);
+void phylink_prepare_resume(struct phylink *pl);
 void phylink_resume(struct phylink *pl);
 
 void phylink_ethtool_get_wol(struct phylink *, struct ethtool_wolinfo *);
-- 
2.30.2


