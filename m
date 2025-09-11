Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80F3CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 11:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9b3//ARVpkHYjlQHOj5QLrD/YhlzfhZeBDi+nhBNlxA=; b=PpFJzsd2by8D9DGYg9ZhoA8pmK
	tf+vbTDkVnISXdFbPum5x7YLddz5klDaLT07bLS8EZF5nY2h9u1B19nxBqI/xcaLSk/d/+EqQmTex
	HMA61kS+xO7MZGOBrWTpi/a76n4qI1tGM8ZnXMkYLhZrplBjigTADBsEXmSRRLiJb6STYKzwhwkPb
	DOecK3xsIfm+zqDoy/mHdfMvinrMCgo7mE1+x5ImCyAE3/efe4bX6oMCC8etOWsFFa9aXvSimO8Gp
	rYKyUdPLFR5NBtOhCb3nYkf+yDXV2Az9Z9sFhrMLYtoh+t7q5ciVbh6swfJOLj1zKbvdc+Y/ICiyP
	TEDEVYow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwfCE-00000002ZPT-2fEJ;
	Thu, 11 Sep 2025 11:10:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwfCB-00000002ZJb-2dn5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 11:10:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9b3//ARVpkHYjlQHOj5QLrD/YhlzfhZeBDi+nhBNlxA=; b=OnJM/tr7uvOtI8LIoe96orHO/U
	ZHhXIlzSuI28gUdueBPnlhiAJJ0waR4da+huO965Tzn0L9k2Fu9WWba86DxgnRNZKDr1GBYTjKqR4
	RreCb3YPGxCAhQZZwQSHbvua/a3SK9kk7BmiQggGBbWJNFzHk1nu0zjVnlHONvCoYrmssoyOfqs6o
	dle3njvggjxgNpP8UTpXPMONR1CfyDeghjLotnrJJx3u/+joehXUbi37Uac8Cj2pjNiRGxwIzpq9q
	fSGVAsoy9On7c0/DfKJWAxyFtV0nR0IiZxESccwohLVoYA6P5YOGqDs4TWKwaMYrMXWIL5OUtOyss
	j5mdSCnw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51882 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uwfBu-000000002uB-1zMM;
	Thu, 11 Sep 2025 12:10:14 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uwfBt-00000004j98-0Tio;
	Thu, 11 Sep 2025 12:10:13 +0100
In-Reply-To: <aMKtV6O0WqlmJFN4@shell.armlinux.org.uk>
References: <aMKtV6O0WqlmJFN4@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: [PATCH net-next v2 08/11] net: stmmac: rename stmmac_init_ptp()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uwfBt-00000004j98-0Tio@rmk-PC.armlinux.org.uk>
Date: Thu, 11 Sep 2025 12:10:13 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_041031_706999_9A27CE7D 
X-CRM114-Status: GOOD (  13.86  )
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

Changes to the stmmac driver to fix various issues with PTP have made
stmmac_init_ptp() less about initialising the entire PTP block, and
now primarily deals with the packet timestamping support. The exception
to this is ptp_clk_freq_config(), which is an odditiy. It remains
as stmmac_init_ptp() is used both at .ndo_open() time and in the
resume paths.

However, restructuring this code to make it more easily readable makes
the continued use of "init_ptp" confusing.

In preparation to cleaning up the (re-)initialisation of timestamping,
rename the existing stmmac_init_ptp() to stmmac_init_timestamping()
which better reflects its functionality.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 716c7e21baf1..7cbac3ac2a9d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -773,13 +773,13 @@ static int stmmac_init_tstamp_counter(struct stmmac_priv *priv,
 }
 
 /**
- * stmmac_init_ptp - init PTP
+ * stmmac_init_timestamping - initialise timestamping
  * @priv: driver private structure
  * Description: this is to verify if the HW supports the PTPv1 or PTPv2.
  * This is done by looking at the HW cap. register.
  * This function also registers the ptp driver.
  */
-static int stmmac_init_ptp(struct stmmac_priv *priv)
+static int stmmac_init_timestamping(struct stmmac_priv *priv)
 {
 	bool xmac = priv->plat->has_gmac4 || priv->plat->has_xgmac;
 	int ret;
@@ -3502,7 +3502,7 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 				    ERR_PTR(ret));
 	}
 
-	if (stmmac_init_ptp(priv) == 0 && ptp_register)
+	if (stmmac_init_timestamping(priv) == 0 && ptp_register)
 		stmmac_ptp_register(priv);
 
 	if (priv->use_riwt) {
-- 
2.47.3


