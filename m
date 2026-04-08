Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB78F1073C85
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 09:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FhdQTZ4PjxdShoN2GRJESKI6NUEw1EHbjw1nk/1gbzU=; b=k/m3xxofG3NUQDifNuDZ9XXcg2
	do1XGFviKSRCd0nfwIaxIc926nk8KWX9fRyhb49Q7uLo948r04Yok5b6tgQlqeUPkVnktIouhRCOS
	JCJz/NU7JQwwOQC/uhRFo+TEVzMtDCK0sw8THCw61S9wXtHgW2i7cpOrD0MjkfnGPSR2+AVvFRWJ6
	B0ZNlY7se5FF70IC32Lr7+RUyxo+13zRJxF4R27LeveFolwCSnufwxun5UeDNO73qow3fZpOWSziu
	hMkfy6KAvj1dLOfZyskU1wHDA9YhuE3+JFRDPtdfKyun/w5vMu/Qb6L9Tu4g4OB9XifP2zKYP/zjy
	L/CZOImw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPRk-00000008dKl-23v8;
	Wed, 08 Apr 2026 09:43:40 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPRg-00000008dGD-1zhu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 09:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FhdQTZ4PjxdShoN2GRJESKI6NUEw1EHbjw1nk/1gbzU=; b=LWVCNGgRtCTuIthGvixb61A+O8
	C2GNvXJWZ6kxkTafqTGqfuUL71asdjM1C2FYgZxL8iRhdtav91LuRpZsj/TXI9qZZBkvHrFk1Vj5i
	kbivRDeMv+KpkJm01SUtrvuMNbIS0+Q59yHymN4CAfKBoRgix4wOLmcW7+2gZmX5BimGmv+F8PV3t
	UcIubeLHH3CpwG9f2+lrHiAvC4NNr0YGeCUycptUVkDaa91iXSLScagfulUk1LMfd9H2SE24BsKZI
	x+b+iwzDfF8xqRZ3f6q7CB7HOycps5zd8x/ajUNl0ypsIUIjcAPyFbE5v2f1MlEVu7IzzR6F+syg1
	S+e4yaew==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33750 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1wAPC8-00000000246-3oVx;
	Wed, 08 Apr 2026 10:27:33 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1wAPC1-0000000F7kl-15YL;
	Wed, 08 Apr 2026 10:27:25 +0100
In-Reply-To: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
References: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH RFC net-next 09/10] net: stmmac: clean up test for rx_coe
 debug printing
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1wAPC1-0000000F7kl-15YL@rmk-PC.armlinux.org.uk>
Date: Wed, 08 Apr 2026 10:27:25 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_024336_513281_76E602C7 
X-CRM114-Status: GOOD (  18.45  )
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

The test for printing rx_coe as opposed to rx_coe_type[12] and
rxfifo_over_2048 has checked for an XGMAC core or the Synopssys IP
version (snpsver) >= v4.0.

Since the Synopsys IP version depends on the core type, avoid using it.

The GMAC4 core type uses dwmac4_get_hw_feature(), which populates
rx_coe but not rx_coe_type[12] or rxfifo_over_2048. XGMAC is the same
but via dwxgmac2_get_hw_feature().

dwmac-motorcomm populates rx_coe but not the others, and sets the core
type to GMAC4. The Synopsys IP version is likely >= 4, but in any case
printing rx_coe is clearly more correct.

Lastly, dwmac-sun8i is an oddball - it sets rx_coe, but does not set
core_type, leaving it as the defeault DWMAC_CORE_MAC100 since as far
as I can see, none of the .dtsi files for this platform use any of the
versioned snps,gmac-* compatibles. Moreover, sun8i_dwmac_setup() sets
snpsver to zero (which stmmac_get_version() will have already done) so
this has always used the rx_coe_type[12] path.

Change the test to check for GMAC4 or XGMAC which covers the cases
where rx_coe is set from the core hardware features.

Also add a comment for the GMAC to GMAC4+ rx_coe feature translation in
stmmac_hw_init(), and document rx_coe in struct plat_stmmacenet_data.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++++++++--
 include/linux/stmmac.h                            |  7 +++++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index e47321119c83..93c031b3cfd5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6624,11 +6624,15 @@ static int stmmac_dma_cap_show(struct seq_file *seq, void *v)
 	seq_printf(seq, "\tAV features: %s\n", (priv->dma_cap.av) ? "Y" : "N");
 	seq_printf(seq, "\tChecksum Offload in TX: %s\n",
 		   (priv->dma_cap.tx_coe) ? "Y" : "N");
-	if (priv->snpsver >= DWMAC_CORE_4_00 ||
-	    priv->plat->core_type == DWMAC_CORE_XGMAC) {
+	if (dwmac_is_xmac(priv->plat->core_type)) {
+		/* gmac4, xgmac, and motorcomm populate this. */
 		seq_printf(seq, "\tIP Checksum Offload in RX: %s\n",
 			   (priv->dma_cap.rx_coe) ? "Y" : "N");
 	} else {
+		/* only dwmac1000 has these three. sun8i sets rx_coe, but
+		 * sets snpsver to zero and leaves core_Type as MAC100, so
+		 * uses this path.
+		 */
 		seq_printf(seq, "\tIP Checksum Offload (type1) in RX: %s\n",
 			   (priv->dma_cap.rx_coe_type1) ? "Y" : "N");
 		seq_printf(seq, "\tIP Checksum Offload (type2) in RX: %s\n",
@@ -7441,6 +7445,9 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 		/* In case of GMAC4 rx_coe is from HW cap register. */
 		priv->plat->rx_coe = priv->dma_cap.rx_coe;
 
+		/* GMAC (dwmac1000) has separate bits for the Rx COE type.
+		 * Translate to the GMAC4/XGMAC rx_coe feature code.
+		 */
 		if (priv->dma_cap.rx_coe_type2)
 			priv->plat->rx_coe = STMMAC_RX_COE_TYPE2;
 		else if (priv->dma_cap.rx_coe_type1)
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 4430b967abde..c80d45de0067 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -256,6 +256,13 @@ struct plat_stmmacenet_data {
 	bool force_sf_dma_mode;
 	bool force_thresh_dma_mode;
 	bool riwt_off;
+	/* rx_coe:
+	 * for dwmac100, rx_coe does not appear to be defined.
+	 * for dwmac1000, rx_coe takes one of the STMMAC_RX_COE_* constants,
+	 *  which will be derived from the RXTYP[12]COE hardware feature bits.
+	 * for dwmac4 and xgmac, rx_coe is a boolean from the RXCOESEL hardware
+	 *  feature bit.
+	 */
 	int rx_coe;
 	int max_speed;
 	int maxmtu;
-- 
2.47.3


