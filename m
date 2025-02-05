Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9100BC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 14:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDvCujIEp/SdELCYe35PqbWkz1VVUTMUDBCM2w2Hyqo=; b=xJnjlBxuDt3+AgtzyOeiYmitEg
	if/cXi4jPV76vX5peRtyDsbS959zHGYJspB4PtiEfzhZsUoQG5lL6iJGl31Ie9oJRf5wbYf6ccYRk
	hOQfJ6uZBpkJp8lkZZaSysU3hFiZuBbfYpFQhQT/BklWk84rDN3rTEizXxqyegXQXEKJdhW/xVC/0
	ylTMpPOF+Uppg31UcexpmfkGWR0QeEJAQPj4EXBcN9F45CrcBVcBLH09Aj+yTOQJNglEBvOZMOfD5
	HWNNkXFZ/0jJBZEzCr2jW3auJQM/IZfke36I0fX5qycNkefkgUMIUnwdNygL0mvpzCB6JGbPcOl+T
	CXEXci0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgfL-00000003dJo-0BmU;
	Wed, 05 Feb 2025 14:46:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tffdc-00000003Q7W-14ko
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Feb 2025 13:40:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=FDvCujIEp/SdELCYe35PqbWkz1VVUTMUDBCM2w2Hyqo=; b=AOh8A21F4rgxr5OQUobKZXRogI
	xeZjIUqhURiKoKq4CUTViBqE+s2nMupmpnclcAHcQkBrMl9qt0pmpEk3UBPf1+eBrfFRuER2bujxo
	g+4ZDqYRDYX5UdnnGcDLXmVKcq6cx/f8RQpQrr7qyaJ/9hqCL46C9UN1WK/NUJbEIYt+Cw7sjTFk+
	j1VEoxJ603rDoBU8HuC5weqFOWqL6WPPA683EsrnYqlnc289D3eLcLCh6FwAA+w3ifVUh7wGA+Ac1
	USsg9lj2ppH6Qjnbr+oJaOTiYOm4/s6zZhrldDA7+qG/usV48TkNrJwsZIo0i5Sqt+ulO1BVOKSw7
	ld2/dPsw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tffdZ-0000000GeRm-1NOX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 13:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FDvCujIEp/SdELCYe35PqbWkz1VVUTMUDBCM2w2Hyqo=; b=toDTZCjEt1Z1payNKwdOEoU4Rz
	RSLl7VWBADFbs5REecXoleFlzhnewJAar3lwKGOUY+aChvvyiqUdX+gHARNvjWalMHTidPCaGTE2b
	/Cku0w4aTqAbpbEbOR2bJynFNF/QacJFFkmYCClGhoXjfFKW9No5mwyryzO4xLeSp3tfgVxpuHL98
	NnJX/ZlJWWKhc1KTtILvXTG8KzJJgE+9/QQE+FBbRSM/tzuA5d4fddX/mKFY+6TOMlvyUhojjxEq4
	x+IECyrHuVQdwPuqiM7i8FVxQmWKgvM1m3QpK6KkrshkU8nwzws9amcPonBaNWQOiGPA9xzOKAZEf
	kVg/Xcqw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47366 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tffdR-0007A6-2g;
	Wed, 05 Feb 2025 13:40:09 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tffd8-003ZHb-AX; Wed, 05 Feb 2025 13:39:50 +0000
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
Subject: [PATCH net-next 02/14] net: stmmac: ensure LPI is disabled when
 disabling EEE
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tffd8-003ZHb-AX@rmk-PC.armlinux.org.uk>
Date: Wed, 05 Feb 2025 13:39:50 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_134017_505317_8485446B 
X-CRM114-Status: UNSURE (   9.16  )
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

When EEE is disabled, we call stmmac_set_eee_lpi_timer(..., 0).

For dwmac4, this will result in LPIATE being cleared, but LPIEN and
LPITXA being set, causing LPI mode to be signalled (if it wasn't
before).

For others MACs, stmmac_set_eee_lpi_timer() does nothing, which means
that LPI mode will continue to be signalled despite the expectation
for it to be disabled.

In both cases, LPI mode will be terminated when the transmitter has
a packet to send, and LPIEN will be cleared by hardware.

Call stmmac_reset_eee_mode() to ensure that LPI mode is disabled when
EEE mode is requested to be disabled.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 9b44f4a8b7af..fecf9e8b29bf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -494,6 +494,7 @@ static void stmmac_eee_init(struct stmmac_priv *priv, bool active)
 			priv->eee_sw_timer_en = false;
 			del_timer_sync(&priv->eee_ctrl_timer);
 			stmmac_disable_hw_lpi_timer(priv);
+			stmmac_reset_eee_mode(priv, priv->hw);
 			stmmac_set_eee_timer(priv, priv->hw, 0,
 					     STMMAC_DEFAULT_TWT_LS);
 			if (priv->hw->xpcs)
-- 
2.30.2


