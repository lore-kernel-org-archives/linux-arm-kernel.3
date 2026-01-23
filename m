Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C153BD72373
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 11:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GamwrlE4kbWXbVmsCSXFe4eZD99Qm0XYDs293oUnm2E=; b=LwxfK4rumqJP9x01jk08RhdCvp
	RQgC1ulJXZ+rtIdS2DGJSXGfOSff3vrunpHjvWAuO2+rc3ymIVFVCdPoDMzt3F0JLbK2/s93Gis1P
	r2b0vUv55NGqVsxL/NfnytKsNjP5tRhG0RkyFa2sinfugZKSVbKjfiXOQEM4dbXqgfgWsAs0LnAzC
	sTf67JPufZ+7JqdyUvMzgBujjQkoG2vF/nVSpBZBnR5C5+q7hOIzECh/9REH+TIjM5L722baY4ja4
	yravaZpe6vwbHRV/hPW97BNJY+/dxAJ6L441hNZ7iaN9Nl1o93ShjnG0j4dAGbgc3N6XHKUt7n3KC
	1ob2c89Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEvc-00000008n0C-0ths;
	Fri, 23 Jan 2026 11:02:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEvW-00000008mtf-0AWB;
	Fri, 23 Jan 2026 11:02:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=GamwrlE4kbWXbVmsCSXFe4eZD99Qm0XYDs293oUnm2E=; b=dI3uKwYQA3GO5dmzmuzXBT9Qa/
	aMoX6h/amIgq78Uk9FClG+aQ1Gl5i52qDdom2wxpi7FxzysA0y7hevBMMbK3lO33h5MJVsjDLDmHQ
	VN1JtV1pE9XfA0d8dvXURAqn3hkzLCz9lZyEU05lhLaOY6/Gus8kGxEX3/ubnI+wc1dxRAHzBE6bu
	FF/uDEzDB3tV+GY9ccfetWfsXwDNh1E8UAe8P6NeDd/Nnu0PeGkBlr16WLEaIrmRv2UPFwuovc2jF
	zk8gzFpyH39fIE4nRV71H527pj1C+0IEMfxdrpdo4m6KpgtsIB/0HWaWq1zxb1+mm5YR/Pbx9dGq9
	zgFkhfVQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEvT-00000002DZY-1Wn7;
	Fri, 23 Jan 2026 11:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GamwrlE4kbWXbVmsCSXFe4eZD99Qm0XYDs293oUnm2E=; b=mzr+Cp38XW7y0YAMiAtkaWjKVe
	g6azLfr8gVY7Wbv9hYQuDXWiN0XbOnpIec8njLmjuZSJU3goFmgX1dMlnBCK2+yJQ3PweH2SU/pO7
	ekgoivm9fSf2RuGPux6rYjk11mqWGYEitpL867UM2DZ3wZMte0d9SWvq98HjkAG2M8psmTu8+guBw
	dcjBtuUE4Q7ScRVvej3W6KfPy0qe0USDSq2CWEnBRG0GO5tXmtfcU/LFWF5T8IpXXDfy/tg12XWgi
	G4+THa2xF223ebwnXwAkP6HGn7zAAChDiwirn22T03z3s0XtFPMn6LmllCzrIuguqXmM6DS0MEboJ
	KCxfyjCQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42302 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vjEvH-000000001rI-44w8;
	Fri, 23 Jan 2026 11:01:52 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vjEvF-00000005ghI-3CYC;
	Fri, 23 Jan 2026 11:01:49 +0000
In-Reply-To: <aXNUlVZilT-CTgph@shell.armlinux.org.uk>
References: <aXNUlVZilT-CTgph@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 18/21] net: stmmac: rk: rk3328: gmac2phy only
 supports RMII
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vjEvF-00000005ghI-3CYC@rmk-PC.armlinux.org.uk>
Date: Fri, 23 Jan 2026 11:01:49 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_110203_481993_04DF1FCD 
X-CRM114-Status: UNSURE (   8.43  )
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

As detailed in a previous commit ("net: stmmac: rk: convert rk3328 to
use bsp_priv->id") rk3328 gmac2phy only supports RMII, whereas gmac2io
supports both RMII and RGMII. Clear supports_rgmii for gmac2phy.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 2d464ecb0e8f..109ed62fb04c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -452,6 +452,7 @@ static int rk3328_init(struct rk_priv_data *bsp_priv)
 	case 1: /* gmac2phy */
 		bsp_priv->gmac_grf_reg = RK3328_GRF_MAC_CON2;
 		bsp_priv->clock_grf_reg = RK3328_GRF_MAC_CON2;
+		bsp_priv->supports_rgmii = false;
 		return 0;
 
 	default:
-- 
2.47.3


