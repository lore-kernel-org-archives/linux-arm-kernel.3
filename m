Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF205E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 19:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HdDCxRaTUX9FGCD245j20jXl1EXkrNlD8Fe9FHouQUM=; b=yUua8BHSgJ0MuHlDjGEZtExo1P
	XpGcx+LSIxi8WdxGWRjzNIcFmiaAC3MFowwM/cZ4arFN+xpLzY7BMyhcJsiXeCho4PAdv/xfhPj3P
	hF3wHPmMI6eEmrqtvIIl7FJAV7ZylvJmSIidxsEB2kg+G11y4YImOS45soOjeTYoL575CMmnlT9So
	0ViuZ5aNfDmG5Mn4ANMHFJ/AC+MrLEUzXZBGilQF236UF4aUAKFqcx2uMb5VCcKSJ05Ih+JU75gcG
	s7oXN5pfad12BN48hquAq/PXCY1S0RjgCyQXW1AqkkoqNzai1GTFwSHLTHyNgwsHvrl/eWMsWYB3k
	aUZzbO5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMBWk-00000004qCo-2MtV;
	Fri, 13 Dec 2024 19:40:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMBTK-00000004o1J-3enl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 19:37:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HdDCxRaTUX9FGCD245j20jXl1EXkrNlD8Fe9FHouQUM=; b=t3BbWIbt0mNjNv/q72K2ziPS/i
	AY/p8nVScTMol5dSAKTKnfdtkXLXZPGh89Cj3mjEhdCu0Nfc3BV028PdJeGK+WNwZsawUIdkm/mO0
	735oeSHWCV2/tVwzV7lG7WmVzojiIxqhMya7f9MOq1HqMlRHfQRsIDOB4eaN9k9NYjIjDuHEQz7vQ
	H7VvT5e6gw2ZC8LAnuRPjAo2bnTqElRdzxRtlFqXeu78z/tdWNQUeXlUDvjWUZv0Lcvn/dWzTqpl1
	4GnVWcgUh96ugv0dLl25WqOdyvtr079spbDDFisw9pJOa6KwxxLQdhPEkpq679IHPwIMpPmBoseFq
	8Kb+LFCA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:32846 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tMBRC-0007DD-2v;
	Fri, 13 Dec 2024 19:34:58 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tMBRA-006vaY-Sv; Fri, 13 Dec 2024 19:34:56 +0000
In-Reply-To: <Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
References: <Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	 Jose Abreu <joabreu@synopsys.com>,
	 Andrew Lunn <andrew+netdev@lunn.ch>,
	 davem@davemloft.net,
	 Eric Dumazet <edumazet@google.com>,
	 Jakub Kicinski <kuba@kernel.org>,
	 Paolo Abeni <pabeni@redhat.com>,
	 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
	 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	 netdev@vger.kernel.org,
	 linux-stm32@st-md-mailman.stormreply.com,
	 linux-arm-kernel@lists.infradead.org,
	 linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/5] net: pcs: xpcs: fill in PCS supported_interfaces
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tMBRA-006vaY-Sv@rmk-PC.armlinux.org.uk>
Date: Fri, 13 Dec 2024 19:34:56 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_113710_900010_CC42BDAF 
X-CRM114-Status: UNSURE (   8.94  )
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

Fill in the new PCS supported_interfaces member with the interfaces
that XPCS supports.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-xpcs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index f70ca39f0905..cf41dc5e74e8 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -1446,6 +1446,8 @@ static struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev)
 	if (ret)
 		goto out_clear_clks;
 
+	xpcs_get_interfaces(xpcs, xpcs->pcs.supported_interfaces);
+
 	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID)
 		xpcs->pcs.poll = false;
 	else
-- 
2.30.2


