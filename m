Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05421C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 16:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EFg3uLajH2uqZ4TKBpJ9slpQUapZBgJWZv1F9yK5ENs=; b=RPocBZt1p7Jwn6v4dYieuFQkb2
	WHfQ9CXsUPXqMguZXwxxzW9YBB8/9aO9VzsR5SYVV6i49lVDY81gBwLCBCJu9ITW8w1caiNff8P1V
	NCOff8KkGz7BQ77O6Hhfe1jKKnLOPsj3GktqzAoYWKW/ltaWiswaB9N0CdEq9gQggC0xCneBX8Xat
	DJ560WGU5pSj6vO53nFAvSruhCqAnFGDAL6p/pIyIY0YGrHNAL0cIHco+8vP2wRc4e21/3QxFZC4G
	XRbSCjsnMV/CCya9TzEQWy5fWlDPFLEMLPzLEfdKc1WFwcZz4IfTC6rC0ksiVNETV0UaiOqAV8qfm
	Lgupc7+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugR2B-0000000F1fd-0LW3;
	Mon, 28 Jul 2025 16:49:07 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQ3h-0000000EsHp-37yH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 15:46:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EFg3uLajH2uqZ4TKBpJ9slpQUapZBgJWZv1F9yK5ENs=; b=Qzwc7S0VycqeOc+t408LTLOl8h
	c+MVlUxp/4w2bRoJgU4Jl3Ms91XIDSupkEiryHS7eBJP3WADGnScqsAwI9ZIf4uA54qagZg7bEdpL
	NOOJ2KOma/q4P5Ohi5p5zfphH9JnDkyn/he7pZuVUDSO6T/Mny8ncQTR6DSVzRfskKuOiPhj9W/cF
	dYYL25LoOlwyrA2h1pipcYW5HAapldhauF70TgWj5JX2PrHwswpCLmtkxjvlfKEWEhV1R01GpvT8S
	pTL1ISE66e2IxHRmLaCgm2An7/OK4bVjoZ8+tY491Wj63H/2Y5NzhPp+/Hv9rt2Onu4E4Vifk4ih3
	D1Q8v/Vw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37882 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1ugQ3b-0000Ua-36;
	Mon, 28 Jul 2025 16:46:32 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1ugQ2t-006KDF-H8; Mon, 28 Jul 2025 16:45:47 +0100
In-Reply-To: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
References: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
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
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RFC net-next 4/7] net: stmmac: remove unnecessary "stmmac:
 wakeup enable" print
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1ugQ2t-006KDF-H8@rmk-PC.armlinux.org.uk>
Date: Mon, 28 Jul 2025 16:45:47 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_084637_782700_1C48645C 
X-CRM114-Status: UNSURE (   9.64  )
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

Printing "stmmac: wakeup enable" to the kernel log isn't useful - it
doesn't identify the adapter, and is effectively nothing more than a
debugging print. This information can be discovered by looking at
/sys/device.../power/wakeup as the device_set_wakeup_enable() call
updates this sysfs file.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index cd2fb92ac84c..58542b72cc01 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -816,7 +816,6 @@ static int stmmac_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 	}
 
 	if (wol->wolopts) {
-		pr_info("stmmac: wakeup enable\n");
 		device_set_wakeup_enable(priv->device, 1);
 		/* Avoid unbalanced enable_irq_wake calls */
 		if (priv->wol_irq_disabled)
-- 
2.30.2


