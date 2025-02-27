Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBF6C282C8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PgMRekuM6/wN27KKXDqw9MR6fLL7vwR1VpZwGH+P4Y8=; b=jETvxr6+ybRVsjXRG4ybLjr9CR
	EwJI/kp36s+Z5HDyMV8YCbO294hTP3QlNbwqXWkezUvwtQ0/wHfOWiGZWVRHDka8xk746h+vuhIlg
	5s3GdodjFJBZe1snAcX14SMpW5YKestEXZsLW5aqXco6nn6IWRQtNXKAdgJkQvP3YW0FVrgkIX4Ue
	Xz4J3e2siRIcNK0ETfwEImSVqWo25ka4I9JRw7R7PeF+OaMng7nLr1wka5/MkIakx8MqXdOggOgqb
	KDtPMFiLjPLSazZMDzyGMW2tlwyIBa5ehFFcg1cY5VqmTUAKoOS99RHWBrlSw83o8IPS7TcjKnRpv
	TF21+sSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjhL-00000008U79-08Ka;
	Thu, 27 Feb 2025 19:37:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnfNM-00000007qiq-3NrO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 15:00:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PgMRekuM6/wN27KKXDqw9MR6fLL7vwR1VpZwGH+P4Y8=; b=a9KJOkrzhoferwAPNCQyMPdkU2
	qZq3mkWYyvs6Z4TJGj35fJVHCiby0eopRMzZYQ5xd0L6GlUXgF3/QPA/AOsBkurMLKePFqo0iHFLK
	AlGAlRAPdSiZj5m+yHUBbsES7QgzC4r2bJWRb1u3BBTEWgDJmFIaG+xLeVwlj4uq51q+kNwyV7M2M
	hvvLTPAUWPEK9XJIhQ7+N7rxB2Xao20o/RB+zNLhcu6qspur//+lo795Ax+Eml/Iu6IdgnV55xvp5
	qqytsHGLIeT7+mWIjr5Z9FQ7vmG9AR/49sH9HCIfxFKxHUzsMhkIe6f6DRcz/cyq8++/4JGaST5wZ
	xogKCMyg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54178)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tnfNH-0007Vv-0H;
	Thu, 27 Feb 2025 15:00:31 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tnfNE-0008EE-31;
	Thu, 27 Feb 2025 15:00:28 +0000
Date: Thu, 27 Feb 2025 15:00:28 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH RFC 0/5] net: stmmac: fix setting RE and TE inappropriately
Message-ID: <Z8B-DPGhuibIjiA7@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_070036_842425_5A69B4A1 
X-CRM114-Status: GOOD (  12.29  )
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

Hi,

Note: this series depends on "net: stmmac: fix resume failures due to
RX clock".

This series addresses inappropriate setting of the receive and transmit
enables in the GMAC control register.

The databook is clear for the receive enable, that this should not be
set until the initialisation of the MAC and DMA has been completed.
The previous RFC patch series ("net: stmmac: fix resume failures due to
RX clock") which moves phylink_resume() solves that, but we are left
with these enables being set when the link is down. This is not correct.

Sadly, when XDP support was added, new calls to netif_carrier_on() and
netif_carrier_off() were added, which are incorrect in drivers that
make use of phylink - by doing so, the driver has no guarantee that
the .mac_link_up() and .mac_link_down() methods will be called in
sequence anymore.

Solving this requires a number of changes. First, fixing XDP to call
into phylink to bring the link down. This removes a source of
phylink method de-sync mentioned above.

Then we remove the racy teardown in the driver's remove method -
nothing should be torn down while userspace still has access to the
netdev.

Then we remove an unnecessary call to disable the enable bits in
the .ndo_stop() method.

Finally, we remove manipulation of the RE and TE bits from the
start_tx(), stop_tx(), start_rx() and stop_rx() methods.

 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c   |  8 --------
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 12 ------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 22 ++++++----------------
 3 files changed, 6 insertions(+), 36 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

