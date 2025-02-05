Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E14C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 13:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VqQ9wOEeNNoSXc7LFs7yK01bxEBFYf/myvKZXQahAvs=; b=WXoKOhjq3iBluYV0Kr1VG+vV+e
	wvXZEeoxiGfLkaJ/HfNfgxbkorxgrpFRTGjwvgsoRYTqbpTmPsjlnmSVGhSoYZMkSDxBRyCoMrAVu
	OxmB1vekW6X8kYcPUiIhjUXw/v/SPXyDEHZ6T+ioVcrHc8/ami426IfGHKK81Ugm5xNEZjw3oJTrd
	mIh4VeTsmE9xnvX6MZV1AYY1s52z4Ue/drq6s8x/hWCERQ66r5rBhz1/4SxiNsDRc8+ym6JXnG7RY
	2fIXwI6IjO04kgf4qkcZqqfK0kJ+hVeKjZ5oYp/sOY28eawT09eAW09dO+v7eDBiR+xYu3l5oxEEJ
	s4U3XYXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tffoI-00000003Rmr-11qj;
	Wed, 05 Feb 2025 13:51:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tffe6-00000003QAs-04Dl
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Feb 2025 13:40:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=VqQ9wOEeNNoSXc7LFs7yK01bxEBFYf/myvKZXQahAvs=; b=kCTTwd1YoD5s4szso8pzyAc/vy
	NZ5KfN111JWH3FhXiKHOe64kyPV/XTwgjI5O+q2GrsW9B8KUO/4BTIzZEVpiS3kcuj4CjwhLN2Vz0
	0EUfE1ped9lQNWNqwakYyAUFB2BHdHIkMeJdYzZ7Gw6gVtlsn0+gEBRKmcyrZaIm5pwO5K05BeYRJ
	Ag1A7GiNl7AxgX0D05+RwQHb7JYfk3XwvOwAp0y5ph9o/k607C3EfILJ6OGZwjcoHg1SW6r8qun1D
	DzSYBAPZlSabzmw3qwxxnxf/E5l0nbGTGGrIXhcxjX3aZjyCJdSoPt+cQUM0/h5fOjYd47PJ7Aoh9
	9HeywblQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tffe3-0000000GeVP-1CeP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 13:40:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VqQ9wOEeNNoSXc7LFs7yK01bxEBFYf/myvKZXQahAvs=; b=OdP9VR1n3lyYx8tbk029AvOhUM
	4+8N7SDwhuYRZkItwrwvjBS/bcJO8xN12H1pLf0NL+TnzZ9SmPqL4lREYvmEHurBEvB4TQigTlwaG
	wwfW/u2zUrdM8yGhlq2OIy3rkskjw8hdMfpPiC5ngmKpOAvUPvS817I+vrLz0gr6n8lft9VHd1JpJ
	r0685XRvvdrRq8f62tdxeVyJojCOdo5e9OQ/wIzme8h0eJNBNdkeeB/DERxB53/9Odl39tUVljUHk
	jR9srBQ6C668XhoWv36FGedEZ11b4dWRUlVQGTnd1elYUTY9vMCK1O+KhkJtnbNV6VoeelNbEJDdz
	LL8arbqQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60764 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tffdw-0007Bg-2E;
	Wed, 05 Feb 2025 13:40:40 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tffdd-003ZIB-22; Wed, 05 Feb 2025 13:40:21 +0000
In-Reply-To: <Z6NqGnM2yL7Ayo-T@shell.armlinux.org.uk>
References: <Z6NqGnM2yL7Ayo-T@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 08/14] net: stmmac: clear priv->tx_path_in_lpi_mode
 when disabling LPI
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tffdd-003ZIB-22@rmk-PC.armlinux.org.uk>
Date: Wed, 05 Feb 2025 13:40:21 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_134047_421475_CEB1AD6C 
X-CRM114-Status: UNSURE (   9.03  )
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

As other code paths do, clear priv->tx_path_in_lpi_mode when disabling
LPI. This is done after the software timer has been deleted and
hardware LPI has been disabled.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 695e75de41b3..3cb5645673cb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1052,6 +1052,8 @@ static void stmmac_mac_disable_tx_lpi(struct phylink_config *config)
 	priv->eee_sw_timer_en = false;
 	del_timer_sync(&priv->eee_ctrl_timer);
 	stmmac_reset_eee_mode(priv, priv->hw);
+	priv->tx_path_in_lpi_mode = false;
+
 	stmmac_set_eee_timer(priv, priv->hw, 0, STMMAC_DEFAULT_TWT_LS);
 	if (priv->hw->xpcs)
 		xpcs_config_eee(priv->hw->xpcs, priv->plat->mult_fact_100ns,
-- 
2.30.2


