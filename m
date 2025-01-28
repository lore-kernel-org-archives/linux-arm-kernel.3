Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0413C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 16:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOsTTbEIKnn1lDtoP6teYS5Q0yZvLkrVNJM/olKSH7k=; b=cFGRLJ18BxUT8u4GVQuyHlreHS
	rcdoeWJ+yGCN5r4kn9lLgJO4Wf6gBT8ySFiv4ioc6/ObevqVjWH3EQz/yQihC/YT4lycBjUHKH7Id
	+u6VnymKI0SKUz2Zu8ZwvUFNAHwtAk9VyqITURSZKWEcU0XP1ZE4Dn5P9252OOKT6ZLdyWaSqGhrp
	w+8SfhYThB5McSlTFyWLmpTwQgzOxErFeJfbsQ4ziCbmHVwka6FjbMt0gm88TzzIm9gOtnw+5rRUS
	fsLDg1AbCn8HUzksgbsqtIQpxXHX3oi6A130chrurvlH7ToDFJgE/yIXuXwEIPcRMlccNqrqY92cX
	RvWXfxGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tco3f-00000005FxB-2XSh;
	Tue, 28 Jan 2025 16:03:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnov-00000005CEt-1ymR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 15:48:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KOsTTbEIKnn1lDtoP6teYS5Q0yZvLkrVNJM/olKSH7k=; b=jf5RPJXm7QPeusxBSDM96GLvKP
	aaFex/REZNch/cfb9BENRZXIbOoIZH818x7HEhrpCxVrHj184z71pAFTjIomidNTN/ARIRGhOU+Pg
	WHg9V5IRVKwNbd5+nJB7ebHBLuJguE0MZOtVFaJAxZU/Ma9KpCEgooPg8U1MiUxbGGvaLP7IpsFfQ
	mrAuVWEeQrPusg0H0NCN01MGeYn+gOBcOrZehlm7K92JXeGg8+yhOqFRGQ+GsYyGipEqQBQC5YoMh
	kOVgt6G/GDQnSfE9EJ+tN3kuDPmkrIGijfow4PDvJuCtJo+G6E7gw0sE0AwKsHEE3fD//swjzwcoD
	a7UkPLtQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50182 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tcnor-0007Vr-21;
	Tue, 28 Jan 2025 15:48:05 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tcnoY-0037HE-A6; Tue, 28 Jan 2025 15:47:46 +0000
In-Reply-To: <Z5j7yCYSsQ7beznD@shell.armlinux.org.uk>
References: <Z5j7yCYSsQ7beznD@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	 Vladimir Oltean <olteanv@gmail.com>,
	 Jiawen Wu <jiawenwu@trustnetic.com>
Subject: [PATCH RFC net-next 12/22] net: stmmac: dwmac4: clear
 LPI_CTRL_STATUS_LPITCSE too
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tcnoY-0037HE-A6@rmk-PC.armlinux.org.uk>
Date: Tue, 28 Jan 2025 15:47:46 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_074809_508237_91948DBF 
X-CRM114-Status: UNSURE (   9.99  )
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

Ensure that LPI_CTRL_STATUS_LPITCSE is also appropriately cleared when
disabling LPI or enabling LPI without TX clock gating.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index dc2d8c096fa3..ed42e1477cf8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -410,7 +410,7 @@ static int dwmac4_set_lpi_mode(struct mac_device_info *hw,
 	}
 
 	mask = LPI_CTRL_STATUS_LPIATE | LPI_CTRL_STATUS_LPIEN |
-	       LPI_CTRL_STATUS_LPITXA;
+	       LPI_CTRL_STATUS_LPITXA | LPI_CTRL_STATUS_LPITCSE;
 
 	value |= readl(ioaddr + GMAC4_LPI_CTRL_STATUS) & ~mask;
 	writel(value, ioaddr + GMAC4_LPI_CTRL_STATUS);
-- 
2.30.2


