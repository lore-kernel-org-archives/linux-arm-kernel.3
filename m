Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E028FEB7EB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 08:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9W0bh9pzsIi/vOkBmQhG/GUPdU1OE7zm0Z0RCZHa8gk=; b=IumGiuZX6z8Nmp0HYclLvhNDSv
	wJimFnXC0QaSl+yeMhcovTVinwbhIihOL1cMwgxjZDtgktAMPM2kxTvUZZONz9Fk1kZCRXy+EzJ5I
	RVAL/YzbYWN7Fp9Pd6czvJbmyv59VQhhJBrfe/QT80Ead91vwQokEOFwDLMG8jD1kco+MYWBESARp
	g6uQQ4dzWFj1WKj+6XxaetTluakBJVTtqKE5REeIkeibmVEH9DCw/Wmmf3ye6YPGgAM4FNZzoXoGS
	y50JjcNjhdYJFdfeXsj6xLA0ES26waCJr9LFbUfOCdWO+gN6IYOb2K4hjO5HAz0szJz42m2G4Mle0
	k0j0tQ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhur-0000000GmGb-0Jjv;
	Wed, 04 Mar 2026 08:49:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhuq-0000000GmGK-19zG
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Mar 2026 08:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=9W0bh9pzsIi/vOkBmQhG/GUPdU1OE7zm0Z0RCZHa8gk=; b=FUsdM6sLtXXmljm4dc4Jj8Mv5p
	CDw/xK4L41q3MZkgKIDth1mGAf8u0xDVe+od8XL9bGKRo6G92rCe3q3ezURJ2tjEWn4IYry86E9hV
	heE3AgmB063zUCc9SFrtpgVgn3h5EkZhpF39eUY0fXTycmZjL7XxiDhpeK8kjw8BicSLATEWgfOrB
	u8PQ+oEIzMqG0ztqP5L363CPQ2Q9GEE1ujTV6JloNPbUSznaL9VADJm0JSTIt5aTZqbmPzEH7dkYm
	Pq+x5YLpoXUocAHNELyJkMtWElRZTrCsV9Jv+/TIG246awSUd8j7rtRKvsTb4R0F73vPGHuFFNAoD
	+eENQclg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhun-00000004AT3-1LsV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 08:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9W0bh9pzsIi/vOkBmQhG/GUPdU1OE7zm0Z0RCZHa8gk=; b=AfoTj4lS/LuzQBgxm/Y93b16f1
	gQwW0fzHR+9My8IgxtrsoVF3L6gDHpth+ZwDWvZ014oqiHtbc1INpoB7KBEJNdDNtqDl90HiMxaxZ
	+NGCZ8zYUrR7RXkjZeG2dkH/Ye03Dfbh3yXuzXCMA8L8vYYXtTooB8tk0YafBUwet/0Cj1zTajECs
	uc2Fq4U5XhRKtFc7lkQ/LldyeHhMNfZR3bwi3Zv+CO4CM0P0QvYLxZ5lzaW9a2j4VKj2sKVFgOZoE
	/K3SIzrBPNLQ5iK2Y75FJG1p1Qpv8eaqHTehq9vx1WQKdPONSppjWaUQgBIwfaL74lgqQutAUF3mI
	GPtYZTLw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58856 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vxhuj-0000000069C-3I5o;
	Wed, 04 Mar 2026 08:49:05 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vxhui-0000000BqGQ-47ml;
	Wed, 04 Mar 2026 08:49:05 +0000
In-Reply-To: <aafxqCvJ_XY4YbWw@shell.armlinux.org.uk>
References: <aafxqCvJ_XY4YbWw@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RFC net-next v2 2/7] net: stmmac: qcom-ethqos: enable
 2500BASE-X
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vxhui-0000000BqGQ-47ml@rmk-PC.armlinux.org.uk>
Date: Wed, 04 Mar 2026 08:49:04 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_084909_622108_F62B311D 
X-CRM114-Status: UNSURE (   9.10  )
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

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index cb1c074c2053..f4b63544895e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -828,6 +828,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ethqos->serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
+		plat_dat->flags |= STMMAC_FLAG_SERDES_SUPPORTS_2500M;
 	}
 
 	/* Enable TSO on queue0 and enable TBS on rest of the queues */
-- 
2.47.3


