Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7721CEB26E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 16:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ag+Cq1k6g10bvY3OzWqdpR/d9e2z2DN2pf65+hTvlr8=; b=atIND3sKA4cTActcM8Z2KKoLz7
	6a9nkcUGXhwOuJE8XPffF61cE9lV8RXoH+sTNLMMMLLVJXsythhDPdN8iNraogfTzBjQnR99NXu3z
	hyWil7ocE/Axi20dVkzh3EAvQQg2HLn7C2YdrS8g4+ERWvzk27SRTh01D+w99ayZIFUygcs6GHPwQ
	Y7lXX8sPAcOr5LjXrkfAeKSxwe+3j8QBqDujfhB4PYO/dD3ZZjWuhwDL0SCxG7hekEovUbuQzwdHT
	vTqA1qVLDN0EmntJMQhbyEnclr41LqjH0S3RAprc5J34+5T293cma3BjCiNk5ywui4uR/9Xx5fgn/
	/kJ/7ouw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqbG-0000000HEgD-0sus;
	Tue, 10 Feb 2026 16:28:30 +0000
Received: from mta-64-228.siemens.flowmailer.net ([185.136.64.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqbB-0000000HEd6-1lQC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 16:28:28 +0000
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202602101628207ad371bdf4000207bc
        for <linux-arm-kernel@lists.infradead.org>;
        Tue, 10 Feb 2026 17:28:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Ag+Cq1k6g10bvY3OzWqdpR/d9e2z2DN2pf65+hTvlr8=;
 b=BD7WBtmGTpMp/fh+Fk4hZkgs9F6Gdlr/YcgQZmHQ4Q3t3VX5lBMhVZx3gCpfsZVzDItC4A
 zUSp7INR5ACKSAIcl7U0qvgh49ZGs2FezZJVjgKyOKjd01tMCWBE3ybIygkx/QlvnU9aNBaT
 zL9V5H7fnqOjVrA3Yt8vrB8Yejteh9IfXkyA0hEyjDJAh+4xBDYuWDj0VGScuwnF8d3L6fbl
 cU5sF7atUCAnPsv9psAksHFSaf2w0mFiS0kwY0EItrpwDMZglGhm9cfnDPuYtPQHJe8+Y3We
 r09oKlSiKT0jqodCne1qWXoWJJvzcuzEfDhTQh/SeZi4pVPZ6sgcGt7A==;
From: Florian Bezdeka <florian.bezdeka@siemens.com>
Date: Tue, 10 Feb 2026 17:28:14 +0100
Subject: [PATCH net-next 1/2] net: stmmac: intel: Fix IRQ vector leak
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-flo-net-stmmac-default-affinity-core-v1-1-4e76612444e1@siemens.com>
References: <20260210-flo-net-stmmac-default-affinity-core-v1-0-4e76612444e1@siemens.com>
In-Reply-To: <20260210-flo-net-stmmac-default-affinity-core-v1-0-4e76612444e1@siemens.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Voon Weifeng <weifeng.voon@intel.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Florian Bezdeka <florian.bezdeka@siemens.com>
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-68982:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_082826_078518_BB450B7A 
X-CRM114-Status: UNSURE (   9.02  )
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

The IRQ vectors allocated in stmmac_config_multi_msi() or
stmmac_config_single_msi() where never cleaned up.

Fixes: b42446b9b37b ("stmmac: intel: add support for multi-vector msi and msi-x")
Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index aad1be1ec4c11c3da8a1f56cdc200250b7f2d1d9..48e6d61064bd57afe90d3b83cbb3f2fe5351166a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -1327,6 +1327,7 @@ static int intel_eth_pci_probe(struct pci_dev *pdev,
 err_alloc_irq:
 	clk_disable_unprepare(plat->stmmac_clk);
 	clk_unregister_fixed_rate(plat->stmmac_clk);
+	pci_free_irq_vectors(pdev);
 	return ret;
 }
 
@@ -1346,6 +1347,7 @@ static void intel_eth_pci_remove(struct pci_dev *pdev)
 
 	clk_disable_unprepare(priv->plat->stmmac_clk);
 	clk_unregister_fixed_rate(priv->plat->stmmac_clk);
+	pci_free_irq_vectors(pdev);
 }
 
 #define PCI_DEVICE_ID_INTEL_QUARK		0x0937

-- 
2.53.0


