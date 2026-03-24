Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9764E9A75C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 10:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3g5KTX0Q2AFHsAU+7YicmbMQNdPcyctIgRz2EbTmeA8=; b=nkzgJO0M0HmC8TyMb2PRyNzhFy
	TwYGd2I7orTL2SfQmG6Herm9R8FjCYH5jJMS4TX/LUTYfaajVXkQviclYmFcBtbbEHYs4hbjAmZ0Q
	xD9A5CUVf90z2CW4RPyYpHt/NWEXcMZYtCayCUfvgL2mokMu7d9Sc+GLJ+7Nxz34borvIyAVR3DQf
	2+jRo0Sh1lZNUuAng69j4zQ0PbS6UdpPPpIknSk5w2OefPfq8+Lusal4ByEPI3ldiSSQssJo1I3uP
	RUHSgnAm4f6SB7PrYFo4Lax9LHlMyJySs8hsrNsM+e3lUGHlEpUVzMfDVecBlVNM4efq+rFdNJLa7
	0VjAcnWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ye6-00000001Av4-3krd;
	Tue, 24 Mar 2026 10:05:58 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ye4-00000001At3-1Bnh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 10:05:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3g5KTX0Q2AFHsAU+7YicmbMQNdPcyctIgRz2EbTmeA8=; b=lJYJ5QrdV7XIS2OPLXc3EzJy/L
	f3mgDuvzCRUKO9hjNo3O6oMrdcPVOObK/E3+CzmS5iVw2ieN8z6wn4qKW+QiNd1QCpBB9rOMHuMcb
	a5ViJCnKEoqX5wz2vtXR22eFUnJALP8EM/oe+ckb9TmfuCQEg7Qlzi6k+HfHwccbPlUYpz/LQyDDk
	eboC5A7tsFAt1kXaxu2RTBbRPP94mZ91CMUyCWYRwv/Nj6MDoJJtyrn2ncivlonDXAgB9AR1h0I13
	HMbUrcNd/IySd+0xOmZqhuoOtl36U+MRPMLtNYw9FE9J/3IuCrK0Jq7ZV5S9KKcIZdzJez2LRz5PA
	qvzv9oZg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58178 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w4ydp-000000001lL-2DMD;
	Tue, 24 Mar 2026 10:05:41 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w4ydo-0000000Dlpb-34jd;
	Tue, 24 Mar 2026 10:05:40 +0000
In-Reply-To: <acJh4z3pRKkeaFbR@shell.armlinux.org.uk>
References: <acJh4z3pRKkeaFbR@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Yao Zi <me@ziyao.cc>
Subject: [PATCH net-next 1/2] net: stmmac: remove axi_kbbe, axi_mb and axi_rb
 members
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w4ydo-0000000Dlpb-34jd@rmk-PC.armlinux.org.uk>
Date: Tue, 24 Mar 2026 10:05:40 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_030556_321371_39762B14 
X-CRM114-Status: GOOD (  10.19  )
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

axi_kbbe, axi_mb and axi_rb are all written, but nothing ever reads
their values. Remove the code that sets these and the struct members.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c | 1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 3 ---
 include/linux/stmmac.h                                | 3 ---
 3 files changed, 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
index d245546b90db..02c786ce5dd4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
@@ -231,7 +231,6 @@ motorcomm_default_plat_data(struct pci_dev *pdev)
 
 	plat->axi->axi_wr_osr_lmt	= 1;
 	plat->axi->axi_rd_osr_lmt	= 1;
-	plat->axi->axi_mb		= true;
 	plat->axi->axi_blen_regval	= DMA_AXI_BLEN4 | DMA_AXI_BLEN8 |
 					  DMA_AXI_BLEN16 | DMA_AXI_BLEN32;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 545b8a3425eb..5cae2aa72906 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -109,10 +109,7 @@ static struct stmmac_axi *stmmac_axi_setup(struct platform_device *pdev)
 
 	axi->axi_lpi_en = of_property_read_bool(np, "snps,lpi_en");
 	axi->axi_xit_frm = of_property_read_bool(np, "snps,xit_frm");
-	axi->axi_kbbe = of_property_read_bool(np, "snps,kbbe");
 	axi->axi_fb = of_property_read_bool(np, "snps,fb");
-	axi->axi_mb = of_property_read_bool(np, "snps,mb");
-	axi->axi_rb =  of_property_read_bool(np, "snps,rb");
 
 	if (of_property_read_u32(np, "snps,wr_osr_lmt", &axi->axi_wr_osr_lmt))
 		axi->axi_wr_osr_lmt = 1;
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 5b2bece81448..eaaee329ef9d 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -133,10 +133,7 @@ struct stmmac_axi {
 	u32 axi_blen_regval;
 	bool axi_lpi_en;
 	bool axi_xit_frm;
-	bool axi_kbbe;
 	bool axi_fb;
-	bool axi_mb;
-	bool axi_rb;
 };
 
 struct stmmac_rxq_cfg {
-- 
2.47.3


