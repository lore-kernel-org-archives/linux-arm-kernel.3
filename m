Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8E7E9A744
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0H4SZ3DlYEVqlzu6JJsZInSW5jEBx0hElRQGDXixpQ=; b=EHaKPip84k0pPYYqFZIXzVA6dM
	cbSq160J7T2ZE20z2xlo7xSacvMqL23bDDkx9bp2tJSfhFSQCWc4CgdY2LiCePK+rM1UXkd35m7+U
	TJJecxQtdE2w0y4kS3XOxjsytoRb696zVMN6dp3pLrxcZknkyd2P2ABUvJRd3ld1krOer94mDVPxC
	0xxQI+M7yPcmqdg1NljZquICArjICYIMPo/CvdYsEp+2oU0P1w0vAtAN+P0navD2mBQ7/CEMbPjUs
	s4KYKwr6hNjNH2DEUmQ6PFS8fCpHfLuL38IFlYh1JivE1wzvaIyLgAzN2+ugrmlZtFeUfpTKZ1dRV
	AF40WJbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xxL-000000015B0-35lx;
	Tue, 24 Mar 2026 09:21:47 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xx9-0000000155E-2eu3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:21:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 53C6CC5809B;
	Tue, 24 Mar 2026 09:22:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 217826011D;
	Tue, 24 Mar 2026 09:21:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 572B9104511A8;
	Tue, 24 Mar 2026 10:21:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774344093; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=E0H4SZ3DlYEVqlzu6JJsZInSW5jEBx0hElRQGDXixpQ=;
	b=VYEdNHVvZITYjJxp+4w6ZHknWDgFyGHrKUuXfDFyQ/1eR/CXJ2M4JdSFABSwxtSEeDjrVH
	mIsjeTUysEzm19uEMT6hr69dbUrpmVQ6oRtJ4CO9ZNOB0R4c95R9tDbRx6H9tN0ZSCPcOP
	/FJExyqWh+lqxlw6RRjFeVaOcvsQzXMxrG9Jb6NeD+g0TH/eOVSPWU3mTobdX4J+gQuEgT
	6i4y85EFRH4wkXZVGQDeWDRu/RreMOVxlFvm5lpViKtR7ziRVfUoM/9zDq0X2sR4Xtwqj1
	1sjlfyKgE7TRWz3CPcOD6X6zLPotfFPmtVX/kAWkAjzc7jBJ+u+M+XP67BYAuQ==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	Mun Yew Tham <mun.yew.tham@altera.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net-next 5/5] net: stmmac: dwmac-sofcpga: Drop the struct device reference
Date: Tue, 24 Mar 2026 10:21:00 +0100
Message-ID: <20260324092102.687082-6-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260324092102.687082-1-maxime.chevallier@bootlin.com>
References: <20260324092102.687082-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_022135_992350_D0D166A0 
X-CRM114-Status: GOOD (  13.71  )
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

We keep a reference to our the struct device in the socfpga_dwmac priv
structure, but now it's only ever used to produce logs in the
.set_phy_mode() ops, that are specific to this driver.

When we call that ops, we always have a ref to the struct device around,
so let's pass it to .set_phy_mode(). We can now discard that reference
from struct socfpga_dwmac.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c   | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index ae40de2ed8eb..1d7f0a57d288 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -53,14 +53,14 @@
 
 struct socfpga_dwmac;
 struct socfpga_dwmac_ops {
-	int (*set_phy_mode)(struct socfpga_dwmac *dwmac_priv);
+	int (*set_phy_mode)(struct socfpga_dwmac *dwmac_priv,
+			    struct device *dev);
 	void (*setup_plat_dat)(struct socfpga_dwmac *dwmac_priv);
 };
 
 struct socfpga_dwmac {
 	u32	reg_offset;
 	u32	reg_shift;
-	struct	device *dev;
 	struct plat_stmmacenet_data *plat_dat;
 	struct regmap *sys_mgr_base_addr;
 	struct reset_control *stmmac_rst;
@@ -243,7 +243,6 @@ static int socfpga_dwmac_parse_data(struct socfpga_dwmac *dwmac, struct device *
 	dwmac->reg_offset = reg_offset;
 	dwmac->reg_shift = reg_shift;
 	dwmac->sys_mgr_base_addr = sys_mgr_base_addr;
-	dwmac->dev = dev;
 	of_node_put(np_sgmii_adapter);
 
 	return 0;
@@ -382,7 +381,8 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 	return 0;
 }
 
-static int socfpga_gen5_set_phy_mode(struct socfpga_dwmac *dwmac)
+static int socfpga_gen5_set_phy_mode(struct socfpga_dwmac *dwmac,
+				     struct device *dev)
 {
 	struct regmap *sys_mgr_base_addr = dwmac->sys_mgr_base_addr;
 	phy_interface_t phymode = socfpga_get_plat_phymode(dwmac);
@@ -391,7 +391,7 @@ static int socfpga_gen5_set_phy_mode(struct socfpga_dwmac *dwmac)
 	u32 ctrl, val, module;
 
 	if (socfpga_set_phy_mode_common(phymode, &val)) {
-		dev_err(dwmac->dev, "bad phy mode %d\n", phymode);
+		dev_err(dev, "bad phy mode %d\n", phymode);
 		return -EINVAL;
 	}
 
@@ -440,7 +440,8 @@ static int socfpga_gen5_set_phy_mode(struct socfpga_dwmac *dwmac)
 	return 0;
 }
 
-static int socfpga_gen10_set_phy_mode(struct socfpga_dwmac *dwmac)
+static int socfpga_gen10_set_phy_mode(struct socfpga_dwmac *dwmac,
+				      struct device *dev)
 {
 	struct regmap *sys_mgr_base_addr = dwmac->sys_mgr_base_addr;
 	phy_interface_t phymode = socfpga_get_plat_phymode(dwmac);
@@ -552,7 +553,7 @@ static int socfpga_dwmac_init(struct device *dev, void *bsp_priv)
 {
 	struct socfpga_dwmac *dwmac = bsp_priv;
 
-	return dwmac->ops->set_phy_mode(dwmac);
+	return dwmac->ops->set_phy_mode(dwmac, dev);
 }
 
 static void socfpga_gen5_setup_plat_dat(struct socfpga_dwmac *dwmac)
-- 
2.49.0


