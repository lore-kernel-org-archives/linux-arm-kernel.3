Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18893CF65DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 11:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWSu8t1grXWZnE44t3iliOt1I5glo/3cWtFBkyNFJo8=; b=LWXaNl4xOoNrZWeONRHdxiXZmZ
	6MnNSQ132bbLhMkA4WGeq4POBcKzEai2EEdYe1ihD7jjtdKCu0aXnrtMCuorqHIbCeyDG559/WjiZ
	7fEUjZ8ChFW3X44p9j2jEwaWl2H9l/wj+22FNLBuWrJutDieN7iJPTxl0Vzttnc5GoB1LBTrhkVYJ
	kiDE4PYRyTBewS1YrI/iZVInfkqZzZKhygwd0mrUmR01TpKNYEOe8CFsT5uJz+GLONpaEUE0IIMvX
	4oC2uvygJHnjhzwcwEvM3nhSTARlJwVPtc9M152fe+VV3Du70s8esS1mIThAoQs5cXpM1qy1GJ9Z5
	d9/Cxwvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL3c-0000000CSEz-0GJO;
	Mon, 26 Jan 2026 11:47:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL3R-0000000CS2f-12hn;
	Mon, 26 Jan 2026 11:46:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=DWSu8t1grXWZnE44t3iliOt1I5glo/3cWtFBkyNFJo8=; b=SY4qZxBU91MDIOkhHkU3tgE7Fk
	MupvkwAM92+Xv2DlvtxzqQFeVAuALs/r+l824PfeiULZmT11AnLwGYBQ09vGrq6CiKPRCzzLMIR7G
	J/b2I2JB3t2FMJ3s2n5WTRf5OawkhkDwTp2MBiqIcBVmgOVyGvM98Ha7MxNbcKCIg7WZfBrhdBT3l
	r5MaDSvSU6IqL0d6wj6EatkXjcQhldHSstaKrLR4PBm9VsKc5pNNUa2AySFBSVSuecxIMS/NyxjDe
	GePIeeKQEsiSU7VUuRb8IxpT+9NTOeSLTtag5eR4Nw0x3RJY7nyK7lU8Ubtr/OolX+CltJEvGyOAx
	oN9ei6Pg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL3M-000000058hN-3LgN;
	Mon, 26 Jan 2026 11:46:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DWSu8t1grXWZnE44t3iliOt1I5glo/3cWtFBkyNFJo8=; b=D5tWiv8NGW6ODyKZICJ1J0JzF/
	jQmoouKbhJfGnpeTP0TOq90zJ9F2+Ep+vqPjvlPLP+7Yxc7X+Uz4QfzhCSqMddH8otg8zVkB+3Wlz
	fZ2xSc0YItmsvXGsdSXl/pQfcmoJZb1OJo/kFCTISWaOl1jNcBGQMJqL+qfSGU/hbRQPcpApjQuGW
	o1N17Suy9mbGWqL+Z3Wxo3ZUiHUQAF4+8AbxYzHHe8lkMIaGcs7mnIc32vRe1+t7II/p38b6EDUvb
	9UKyq04VUXm1Q9foNXwSwfVYt5H2s+YySA0Wi8pZiaOrUWwOaxIrarZZfT4ttuhHsW/aMK1KE1N7c
	/d7QUUXw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:55412 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vkL3F-000000004j2-2tHH;
	Mon, 26 Jan 2026 11:46:37 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vkL3D-00000005uty-1GZM;
	Mon, 26 Jan 2026 11:46:35 +0000
In-Reply-To: <aXdTi4ViCkhhXvFI@shell.armlinux.org.uk>
References: <aXdTi4ViCkhhXvFI@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 19/22] net: stmmac: rk: rk3328: gmac2phy only
 supports RMII
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vkL3D-00000005uty-1GZM@rmk-PC.armlinux.org.uk>
Date: Mon, 26 Jan 2026 11:46:35 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_114644_958205_9D252251 
X-CRM114-Status: UNSURE (   9.06  )
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

As detailed in a previous commit ("net: stmmac: rk: convert rk3328 to
use bsp_priv->id") rk3328 gmac2phy only supports RMII, whereas gmac2io
supports both RMII and RGMII. Clear supports_rgmii for gmac2phy.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 4f9b3705d264..ae9df91a018d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -465,6 +465,7 @@ static int rk3328_init(struct rk_priv_data *bsp_priv)
 	case 1: /* gmac2phy */
 		bsp_priv->gmac_grf_reg = RK3328_GRF_MAC_CON2;
 		bsp_priv->clock_grf_reg = RK3328_GRF_MAC_CON2;
+		bsp_priv->supports_rgmii = false;
 		return 0;
 
 	default:
-- 
2.47.3


