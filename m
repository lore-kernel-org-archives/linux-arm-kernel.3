Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFEFEFCD71
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 09:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+H0FEWCF1UemM/WizaowF59Zs24Cxl63eiclBzeUMEo=; b=THnyQuSFtiPsDJKtS+6+CB1l85
	8eM4FzDD2/zq3a3g3o06WGFmdejWUdTw7Chl8269KZh4V5BxMHKZQaFYlQHSf6LRCE8nst67vPhGF
	Y00HOIQgD5+H3Ha8uF6s9aZdHxcVWF7i17R3NtqnF+3Lcel/gr6m5sAMtzCUdSLUtJCwX0cSH4nSm
	DfxguHqtrzx2Y/cSXAez1tm5T44Go9Gz9EPx/bWwNzrFAvWPzrGL/H+alVZCfiiKxFbep1FhpWQCc
	5m+93/eAYZm0YuGqF11KxFotCgjbk5JyPQiwpjiW6gt5WppPHt9UC7zfwMAiZ1/daOTPEjeUyD9mv
	6mnmKEdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzX6A-00000006zqU-0f34;
	Mon, 09 Mar 2026 09:40:26 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzX66-00000006zm0-2zMa;
	Mon, 09 Mar 2026 09:40:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+H0FEWCF1UemM/WizaowF59Zs24Cxl63eiclBzeUMEo=; b=A0iR6F56E1sUXW79EfEFSfC8bY
	XXBYA2FwF6k95++IWIG05RYbVgVIE5zoQ8tKUGsW+Df16Cqj3Ycz6sThucEt30Xp2SqWlN3n7wPz7
	Oi32fM1a6EyGU1bv+wVKd+tIuhHlDi/6deo6DLLKi3JeJ/o9Ao4vMszxnxsC4VjBeblGB0bm3f30K
	kQ2QQisvOEZkxxClpBbCWMA+B+Zn5a5wTzP4hCHyUGWp2HXLT72+uiJGGJEIgPh3O9al1oYEHyiYG
	tAd8WZO9GDri0QDGr1lXwIH9gVN8fsh1b6QK5ELnmJmkaLINP5sRavgk5cchOjr1xNyr5VlsQzf2n
	LmfYovlA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60976 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vzX5Y-000000003VK-0PPK;
	Mon, 09 Mar 2026 09:39:48 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vzX5U-0000000CVsQ-162V;
	Mon, 09 Mar 2026 09:39:44 +0000
In-Reply-To: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	s32@nxp.com,
	Samuel Holland <samuel@sholland.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Yao Zi <me@ziyao.cc>
Subject: [PATCH net-next v2 6/7] net: stmmac: add documentation for
 stmmac_dma_cfg members
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vzX5U-0000000CVsQ-162V@rmk-PC.armlinux.org.uk>
Date: Mon, 09 Mar 2026 09:39:44 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_024022_753740_EC6D92F5 
X-CRM114-Status: GOOD (  10.98  )
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

Add documentation of each of the struct stmmac_dma_cfg members. dche
remains undocumented as I don't have documentation that covers this.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 include/linux/stmmac.h | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 11886189bf51..1af3a5e197c9 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -93,16 +93,37 @@ struct stmmac_mdio_bus_data {
 };
 
 struct stmmac_dma_cfg {
+	/* pbl: programmable burst limit
+	 * txpbl: transmit programmable burst limit
+	 * rxpbl: receive programmable burst limit
+	 * If txpbl or rxpbl are zero, the value of pbl will be substituted.
+	 * Range 0 - 63.
+	 */
 	int pbl;
 	int txpbl;
 	int rxpbl;
+	/* pblx8: multiplies pbl, txpbl, rxpbl by a factor of 8 for dwmac >=
+	 * 3.50a, or a factor of 4 for previous versions.
+	 */
 	bool pblx8;
+	/* fixed_burst:
+	 *  when set, AXI bursts defined by axi_blen_regval are permitted.
+	 *   AHB uses SINGLE, INCR4, INCR8 or INCR16 during burst transfers.
+	 *  when clear, AXI and AHB use SINGLE or INCR bursts.
+	 */
 	bool fixed_burst;
+	/* mixed_burst:
+	 *  when set and fixed_burst is clear, AHB uses INCR for bursts > 16
+	 *  and SINGLE or INCRx for bursts <= 16.
+	 */
 	bool mixed_burst;
+	/* aal: address aligned bursts for AHB and AXI master interface */
 	bool aal;
+	bool dche;
 	bool eame;
+	/* multi_msi_en: stmmac core internal */
 	bool multi_msi_en;
-	bool dche;
+	/* atds: stmmac core internal */
 	bool atds;
 };
 
-- 
2.47.3


