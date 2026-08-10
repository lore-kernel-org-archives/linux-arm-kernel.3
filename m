Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD862C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 13:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1K5nMdBJ3F0LWFyBOgVo9wQEt2vYV/K/0BEbypgk2Ok=; b=tnGO/1vsYQhPDvzp470Bpg6z6k
	h8jhmAPKzIoBZWHPG+zIiVnjlBfqp7UMuwVEkOge3BB/tkId+uf0Y2QMGZwuNbosY+LALsEN8DG3i
	M9+r+gzZ6PGQvVMubzM8ng5eK7eGvnue3w84215X7rVQtxJbGfwirFIHo92sD0z+1IcYzKXv8b/Pq
	PRhs1asxTHWEBxJEO50M5IniTtiFEZv2k8G6rKje6omAV84OlNa5HvsAS7Y3VtDeGyzmHkmKtQutb
	3mGMqTNwuanGK18pMjq6dajUI3gnsSdz77OTD3413J+I3CfXOBWfA1d3TecZAd8bg8HpbPBTtrDoN
	TSDz8Cjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPuc-0000000BtMp-1HzI;
	Mon, 10 Aug 2026 13:19:30 +0000
Received: from mta-65-228.siemens.flowmailer.net ([185.136.65.228])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPuY-0000000BtMA-1wEY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 13:19:29 +0000
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202608101319180f0d3663790002077a
        for <linux-arm-kernel@lists.infradead.org>;
        Mon, 10 Aug 2026 15:19:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=1K5nMdBJ3F0LWFyBOgVo9wQEt2vYV/K/0BEbypgk2Ok=;
 b=ASZFePPVed4fX53qu+qLG0Qkkyld7u75e9Sq5Nw9EsL5g0+b5XKPA/u4Mh1HLbbztmNwtk
 3VfmwbH+NMGhrGeOSDHeP9BQPPJRD0QoSGYErRhvfsHqSpIQZj3c50sWyAVgvLkCOVSWwutr
 j70BZA4It/i7ea7A8+Q4gK6p5KAZq/mc8P/GSbQkVTVLWH3GyoJTk9SaFhiIUW3BKxZ8PTw3
 QtYdwV6+lemXt0lVV1t7Yb+EaddtdF23Sqp3twbHT/PyxQ0gGNuUmG/eAC0S1Ob6hy1yQDls
 01AnM1JW3qbej+dVYoSgxxSRu9cRx0cOv0zjt+v/L7FyUYWMDr5BNhzA==;
From: Florian Bezdeka <florian.bezdeka@siemens.com>
Date: Mon, 10 Aug 2026 15:19:17 +0200
Subject: [PATCH net-next v2] net: stmmac: intel: Add missing
 pci_free_irq_vectors() calls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-flo-net-stmmac-default-affinity-core-v2-1-d2105780b8ca@siemens.com>
X-B4-Tracking: v=1; b=H4sIANTPeWoC/42OQQ6CMBBFr2Jm7RhaS42uvIdhUcpUJoHWtIVAC
 He3cgKX///kvb9BosiU4HHaINLMiYMvQZ5PYHvj34TclQyykroS4o5uCOgpY8rjaCx25Mw0ZDT
 Osee8og2R0NbKGVU70tcOCqo1ibCNxtu+wPw0DKX8RHK8HO4X/JCelgxNWXpOOcT1ODWLYz/8U
 lT/+WeBFSq6aS2kUorEMzGN5NPFhhGafd+/Ep+10PkAAAA=
X-Change-ID: 20260119-flo-net-stmmac-default-affinity-core-c54fa45fe63d
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_061928_015272_09F4BC7A 
X-CRM114-Status: GOOD (  12.88  )
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
stmmac_config_single_msi() where never explicitly cleaned up. As
pcim_enable_device() is used, all sorts of other functions are switched
to managed mode. The missing cleanup here isn't actually missing, it's
buried in the depths of PCI code.

But: There are some ongoing activities to remove that cleanup magic.
See the linked discussions below.

This patch prepares the dwmac-intel code for the removal.

Link: https://lore.kernel.org/netdev/27fec7d0ed633218a7787be3edce63c3038c63e2.camel@mailbox.org/
Link: https://lore.kernel.org/netdev/7e024db2557a4d5822a0dd409ae678d10d815d9c.camel@mailbox.org/
Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
Hi all,

This are some fallouts of a quick stmmac "review", while trying to
understand some issues that we have around the IRQ spreading implemented
by stmmac.

The root cause turned out to be something more generic, so not limited
to stmmac. I will try to prepare a discussion starting point later. This
is more a RT specific problem, so I have to bring in more people.
---
Changes in v2:
- Patch 1: Rework patch description as suggested by Russell
- Patch 2: Drop, will be handled separately
- Link to v1: https://lore.kernel.org/r/20260210-flo-net-stmmac-default-affinity-core-v1-0-4e76612444e1@siemens.com
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 4d207f41a43b3eac64b6ae269765590107f1b30b..f5f9fa67ecd77f6b8a9b5ad5b39f338c4ba49a5f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -1348,6 +1348,7 @@ static int intel_eth_pci_probe(struct pci_dev *pdev,
 err_alloc_irq:
 	clk_disable_unprepare(plat->stmmac_clk);
 	clk_unregister_fixed_rate(plat->stmmac_clk);
+	pci_free_irq_vectors(pdev);
 	return ret;
 }
 
@@ -1367,6 +1368,7 @@ static void intel_eth_pci_remove(struct pci_dev *pdev)
 
 	clk_disable_unprepare(priv->plat->stmmac_clk);
 	clk_unregister_fixed_rate(priv->plat->stmmac_clk);
+	pci_free_irq_vectors(pdev);
 }
 
 #define PCI_DEVICE_ID_INTEL_QUARK		0x0937

---
base-commit: aa2e13ae8d3cbe2c15ef4f7e971b2de0832794aa
change-id: 20260119-flo-net-stmmac-default-affinity-core-c54fa45fe63d

Best regards,
-- 
Florian Bezdeka <florian.bezdeka@siemens.com>


