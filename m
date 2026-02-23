Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876A5EA4FB5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 12:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WlXYakfMf+ynG/+XvFLVLTMU3fE1qwrOnQf6HbLOsMw=; b=4iX4YpZ3ngjJkLssfCKquqAo1E
	5ngvcwTlX41uvtaw/ArN3LaWqSD+OdCre3pnBQ0v8WOO5a1ofUQLTsknDFtF1oI5bx18g9A/ZOPam
	k2Uc0GYtzoTZFvcN/Tu8OrCSswIyUPg2Z2OFX3EDX3F2wsDdjUBXMY/ZoU9W25r/CXA7Ku1Rz6NxH
	1zqg99uom4kCE/6AYluH3VU0X5bdB7FXNo/E6Q4OGQ37y0ZzAHyRidedjQiLazdxHnSyz9c6PaOAl
	YFEMz7MRgmt7+geaX+hMhrl3GoqABxPM2gEnOCud1Of3Jkj7myRjVADUcD46xEYTOwZQvZF9jYMx1
	kOpwepHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUvo-00000000Gfu-1rd8;
	Mon, 23 Feb 2026 12:20:56 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUvl-00000000GfX-2Fcy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 12:20:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WlXYakfMf+ynG/+XvFLVLTMU3fE1qwrOnQf6HbLOsMw=; b=X6C/85+Nwi1gOJWplZ32FYoSY5
	TDVf8Feo1ixuSE67TSMw0cTbesCppzibNmxdC5pWPcFd1gFoUhBAp1DaTfzbjoC1FTjV3bMNlj7uJ
	4RlfLj3XtWxkyqlOuDanF/VAtZ4f2a0pV2pEPvM9fRrunJ9RGrYuBqP7AdfjpujiMet5AyvYkG0iA
	wMe5V0D4dmsdajd+dP2rvioxi/TpjNObB1DlbjWnxAQanpDPfUUpBIILLBt3c/DeLu0u7+wyAGq/g
	TRKZCXog6espy1uvkC2Sq+HkK9BcP0C3NqqdS4P6bUUqvBq9uEzmxnpsVrz9XsgjRyndujc+3LPFA
	qapvn5BA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41386 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vuUvf-0000000043Q-3ja9;
	Mon, 23 Feb 2026 12:20:47 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vuUvf-0000000AfhS-0lJR;
	Mon, 23 Feb 2026 12:20:47 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next] net: stmmac: ptp: limit n_per_out
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vuUvf-0000000AfhS-0lJR@rmk-PC.armlinux.org.uk>
Date: Mon, 23 Feb 2026 12:20:47 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_042053_599234_C96E11AE 
X-CRM114-Status: GOOD (  16.72  )
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

ptp_clock_ops.n_per_out sets the number of PPS outputs, which the PTP
subsystem uses to validate userspace input, such as the index number
used in a PTP_CLK_REQ_PEROUT request.

stmmac_enable() uses this to index the priv->pps array, which is an
array of size STMMAC_PPS_MAX. ptp_clock_ops.n_per_out is initialised
using priv->dma_cap.pps_out_num, which is a three bit field read from
hardware.

Documentation that I've checked suggests that values >= 5 are reserved,
but that doesn't mean such values won't appear, and if they do, we
can overrun the priv->pps array in stmmac_enable().

stmmac_ptp_register() has protection against this in its loop, but it
doesn't act to limit ptp_clock_ops.n_per_out.

Fix this by introducing a local variable, pps_out_num which is limited
to STMMAC_PPS_MAX, and use that when initialising the array and setting
priv->ptp_clock_ops.n_per_out.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---

This could be a user exploitable bug (although one has to be root
so the gun is already pointing at one's foot.) This is the commit
which introduced the problem:

Fixes: 9a8a02c9d46d ("net: stmmac: Add Flexible PPS support")

 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 3e30172fa129..cf5506bf2198 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -334,13 +334,14 @@ const struct ptp_clock_info dwmac1000_ptp_clock_ops = {
  */
 void stmmac_ptp_register(struct stmmac_priv *priv)
 {
+	unsigned int pps_out_num = priv->dma_cap.pps_out_num;
 	int i;
 
-	for (i = 0; i < priv->dma_cap.pps_out_num; i++) {
-		if (i >= STMMAC_PPS_MAX)
-			break;
+	if (pps_out_num > STMMAC_PPS_MAX)
+		pps_out_num = STMMAC_PPS_MAX;
+
+	for (i = 0; i < pps_out_num; i++)
 		priv->pps[i].available = true;
-	}
 
 	/* Calculate the clock domain crossing (CDC) error if necessary */
 	priv->plat->cdc_error_adj = 0;
@@ -350,8 +351,8 @@ void stmmac_ptp_register(struct stmmac_priv *priv)
 	/* Update the ptp clock parameters based on feature discovery, when
 	 * available
 	 */
-	if (priv->dma_cap.pps_out_num)
-		priv->ptp_clock_ops.n_per_out = priv->dma_cap.pps_out_num;
+	if (pps_out_num)
+		priv->ptp_clock_ops.n_per_out = pps_out_num;
 
 	if (priv->dma_cap.aux_snapshot_n)
 		priv->ptp_clock_ops.n_ext_ts = priv->dma_cap.aux_snapshot_n;
-- 
2.47.3


