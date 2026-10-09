Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C50CA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 20:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9tr1qtc6LQ+b+juOf6dlKhYQBymxbiy4xJ9ony0p3rw=; b=dcoVnaU0akEjl9ykan2qIIlB4c
	51ukqQXlbj5/5pp6ZPr4SF5IbKuNMx/fHuf/IyNlGgTSiN58AtyCxf5BDmeuglC6BU184WVAgsNRJ
	25UENBFiDlnp8HfqyXs0u538PntoF+LChx0i6Zj8ecP5S7B3B0j2bYxx1n+JeLBfSAHODU7yiHh7j
	5JDBaZTaP++yuWRfxHuBCXSSLn+wrl/n28U7Mf5hKcEZ7HqKWakNTq1P5yN+uL3QgjDfxJPgL1htL
	T3f5PsOtD4UrF/cCkd9zeWszZVwhEzu4jMXdPj+J79O+VR8IwnMd8DxEp/NSTVyO6chL2RUCKRIPx
	ZLxbfijg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFH29-000000079PD-3Q6C;
	Fri, 09 Oct 2026 20:17:37 +0000
Received: from sender-op-o17.zoho.eu ([136.143.169.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFH27-000000079Ol-0QlJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 20:17:36 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1791577032; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=ejswQMwcCIuxTynSM/R7VtRL2iNOwvKb+oTkzE6EQA/MdziqfQ2tavoMANZLrY05Ys1iMGsgoaQ5bqst6UvUQ5MKie6E2nnTBlORblHJWuVFgCBFDvDDKHh/FqRpAZ/4iVKCK/dBc+fdwWEwH6IEI1pWJW7dUYwKLL3uzRhiS/M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1791577032; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9tr1qtc6LQ+b+juOf6dlKhYQBymxbiy4xJ9ony0p3rw=; 
	b=PO+2Yg5szwDxFAvi3fvfrfv3bEIkVv9uDu8lHHFxd787eMavdsVMSV5oZk5TGWdQq3TVzvFqZBamxGPTZ5jbAti8HFlodo3utrJg02FnjiPnU6UJl2EFGD27Og4cvw4CZSgSDPIdc4JRAsCn8TFVM4T8/MLehkYU8uSz3ULkpBI=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791577032;
	s=zoho; d=iav.lv; i=iav@iav.lv;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=9tr1qtc6LQ+b+juOf6dlKhYQBymxbiy4xJ9ony0p3rw=;
	b=O42Xts5jKPqc50mKotumhwirNkCnz2A2NOUKUWqBnxrNUq2JMZpJHVkwCUHnEMI2
	4Ei7D6JWfJZqLlGFWOp4bc09ZYNDyq9jM3FfxsJVh8181hwowCXQA8aCrMhh1x6OLOx
	dVUgIrW3IE9AKZeRHIDikefYxMwnzEodo8/ySPxY=
Received: by smtp.zoho.eu with SMTPS id 1791577031212158.22971136146714;
	Fri, 9 Oct 2026 22:17:11 +0200 (CEST)
From: Igor Velkov <iav@iav.lv>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Daniel Machon <daniel.machon@microchip.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Igor Velkov <iav@iav.lv>
Subject: [PATCH net v4] net: stmmac: dwmac1000: clear the RGMII status interrupt
Date: Fri,  9 Oct 2026 23:17:09 +0300
Message-ID: <20261009201709.1917585-1-iav@iav.lv>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_131735_415016_C8A6F50A 
X-CRM114-Status: GOOD (  13.05  )
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

Since commit 2e2c878a3141 ("net: stmmac: remove SGMII/RGMII/SMII
interrupt handling") nothing on the RGMII path reads GMAC_RGSMIIIS, so
RGSMIIIS stays pending behind GMAC_INT_MASK from the first link change
on. stmmac_resume() resets the MAC in stmmac_hw_setup(); the reset sets
GMAC_INT_MASK to 0 until dwmac1000_core_init() writes the mask again,
and the pending status storms the line:

  dwmac_dma_interrupt: unexpected status 04000000

A register dump at the first message on ODROID-HC4 showed it:

  core int_status 00000001 int_mask 00000000 pmt 00000000 rgsmiiis 0000000d

When the resume thread runs on the CPU that takes the MAC interrupt,
the storm starves it: a soft lockup, then a watchdog reset or a hang.

Read GMAC_RGSMIIIS in dwmac1000_irq_status() when the status is not
masked, as the driver did before 2e2c878a3141; the read clears it.

Wake-on-LAN resume from s2idle with the resume thread and the MAC
interrupt on one CPU: Helios64 (dwmac-rk), 7.3-rc6, soft-locked in 3 of
3 resumes without a fix and in 0 of 10 with this patch; it ran with an
out-of-tree dwmac-rk change that keeps the GMAC powered across suspend.
ODROID-HC4 (dwmac-meson8b): 0 of 10 with this patch, 2 of 2 without a
fix on a 7.3-rc5 build. irq_rgmii_n went up by one per resume.

Fixes: 2e2c878a3141 ("net: stmmac: remove SGMII/RGMII/SMII interrupt handling")
Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
v4:
- Clear RGSMIIIS in dwmac1000_irq_status() instead of disabling the
  interrupt line around stmmac_hw_setup() in stmmac_resume(), after
  Daniel Machon asked about a dwmac1000-only fix.
- Link to v3: https://lore.kernel.org/r/20261007031438.3179966-1-iav@iav.lv

 drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index d4ace3924891..66337cfd9824 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -312,6 +312,12 @@ static int dwmac1000_irq_status(struct stmmac_priv *priv,
 	if (intr_status & (PCS_ANE_IRQ | PCS_LINK_IRQ))
 		stmmac_integrated_pcs_irq(priv, intr_status, x);
 
+	/* Reading RGSMIIIS clears the interrupt the MAC reset unmasks. */
+	if (intr_status & PCS_RGSMIIIS_IRQ) {
+		readl(ioaddr + GMAC_RGSMIIIS);
+		x->irq_rgmii_n++;
+	}
+
 	return ret;
 }
 
-- 
2.43.0


