Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D04CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 09:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJGhy7KxPfdS+64xVDyHXlvPcLaaDSPwNZ283/2YnMk=; b=gBP45uiPcIG1DhIUs0RZTGeD61
	aPYZ2+EI/K/6KZcM11+v9eDIuFNueNNfwb5q0A8H1w/LhylKylC9YDCs1qCsW+fhgx+8EaClqGz13
	wNwANFX9ld3EGAcggCME6mwSKycWmOlBcbfSgTf3JHswFguy4FwkaT/VkUjaKT9YKNWMLPDtgUW+o
	WzAB+x6VNzMjMmi0SO9GVDIhh91H+c4DvRHtiAzVRbcH3XKPyGvZrtsc+YKh+d9Rj2oaVlyZ6Ba2J
	i43N0DpyThLlveM4tcTJLMbEBzDIXTr2luT9EC7tYuODGyzMnfWpMTUrHYRaZYh3b5gyLG+XTgXyw
	LtiUPYXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBrlk-00000005kEE-1mC4;
	Thu, 23 Oct 2025 09:38:04 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBrli-00000005kBC-1gbz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 09:38:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IJGhy7KxPfdS+64xVDyHXlvPcLaaDSPwNZ283/2YnMk=; b=zouN61j2Rf8Y9hgeNCSs53gPCo
	FtiBQ+w4r8SfR0Dfk3L7aAH8XR20oQNAcQAqyozJS+zGvDdY6ce88CCkT5w5cFoqep9IK9yexSmqF
	wXIYUxDQk64mz/2YKPEez97Ps0cxVg3DlkbwM1CaNUx95FeaZwjg5FJq7l8ettXaJpxQStCQCOsqD
	JC593jEbkUZ6hYSdLZ8XCAFXFGsR4l8PI+EOUKTlc4NZEEnod7yQ5zYPmX32CyX1S43NEiST56bJs
	83ConPvkQvRZRbO7w+VQ/JCycx5jgaTfQNw6Lc9aCMO9VZRHv3NgOQsjyR5va9ERKvM+jpx7ihlo6
	VvxXMBiw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50836 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vBrlb-0000000066X-3Pr3;
	Thu, 23 Oct 2025 10:37:55 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vBrla-0000000BMQM-462M;
	Thu, 23 Oct 2025 10:37:55 +0100
In-Reply-To: <aPn3MSQvjUWBb92P@shell.armlinux.org.uk>
References: <aPn3MSQvjUWBb92P@shell.armlinux.org.uk>
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
	Richard Cochran <richardcochran@gmail.com>
Subject: [PATCH net-next 7/8] net: stmmac: use != rather than ^ for comparing
 dev_id
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vBrla-0000000BMQM-462M@rmk-PC.armlinux.org.uk>
Date: Thu, 23 Oct 2025 10:37:54 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_023802_454499_7A6219D8 
X-CRM114-Status: UNSURE (   9.84  )
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

Use the more usual not-equals rather than exclusive-or operator when
comparing the dev_id in stmmac_hwif_find().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 6c5429f37cae..187ae582a933 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -314,7 +314,7 @@ stmmac_hwif_find(enum dwmac_core_type core_type, u8 snpsver, u8 dev_id)
 		if (snpsver < entry->min_id)
 			continue;
 		if (core_type == DWMAC_CORE_XGMAC &&
-		    (dev_id ^ entry->dev_id))
+		    dev_id != entry->dev_id)
 			continue;
 
 		return entry;
-- 
2.47.3


