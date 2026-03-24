Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F5DE9A746
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jl+zv1qJmZXW+mDeB3W8k/7HhcPBhRwvYFxrgAInSP8=; b=E6CV321fXOZh4WqFyRsVHGyx+A
	oP3B0AayvSjONaO/MGUSPKNzJB6APTAF8am2c9/YMPX7xcnTRHWlC0vDwAyrBA0DuQ0qE6gPIdiJe
	NYIvu+Rv2nZ4AMeEDQEcDEcOKCCGls7939kx5w+6I7KvArmodP/HGA8dob0a7qjgstjYH9j7YgmNn
	BhnuhId6IqUhNRLfHMt/kQIOmNT6Ieyr2FswN3NwlKywO3BdVh5SwuoX8oSSuuwzVIuqc7dIDSCHc
	qCZhLwf1+WlyEyIf3m1/F46o+kfB5Vde3dL4t/NqEdAnwS1u48vySOVWAzYsK00vyr2GGwOzOdjL1
	WRYFmV0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xxI-0000000158q-1EZD;
	Tue, 24 Mar 2026 09:21:44 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xx5-00000001534-0MN7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:21:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C6ABCC58099;
	Tue, 24 Mar 2026 09:21:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 924EC6011D;
	Tue, 24 Mar 2026 09:21:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 567DA104511A9;
	Tue, 24 Mar 2026 10:21:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774344088; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Jl+zv1qJmZXW+mDeB3W8k/7HhcPBhRwvYFxrgAInSP8=;
	b=cxA/kf5gpYbIex+CoaokBYA+SpEs39Fk0Abby5TD9YNoriShrrsVtUp4oduIQKNmDzkhVR
	yQov/qovYmCdF4P0vzkg/1A5Gtv4fUqHxlzY5W/mDotlcE0dE+ydZPyBJobSJjcx+un4BB
	/CihzzaD7aJ8XJIjmENAla3P1ZBlqey5zPOPg+OStaIQ54G3US32OhZZThESznk9ASxJF7
	jt8yBw9h9krOyXbz+atMvCWOxz+lhbQqy4EO685O1VYOWmYHSFqJhk5BqDWgwsFiHLZo8R
	nBv0EtFyWCd80DmPiLZFgAEXfF1l+5WkDfHeCYb1edSpI1U4I3Mhtdq9lJ/W5A==
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
Subject: [PATCH net-next 3/5] net: stmmac: dwmac-socfpga: Use the correct type for interface modes
Date: Tue, 24 Mar 2026 10:20:58 +0100
Message-ID: <20260324092102.687082-4-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260324092102.687082-1-maxime.chevallier@bootlin.com>
References: <20260324092102.687082-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_022131_265256_B050951A 
X-CRM114-Status: GOOD (  11.34  )
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

The internal helper socfpga_get_plat_phymode() returns an int where we
actually return a PHY_INTERFACE_MODE_xxx, use the correct type for this.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index ed6448c0ad2a..629074dbbc15 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -72,7 +72,7 @@ struct socfpga_dwmac {
 	const struct socfpga_dwmac_ops *ops;
 };
 
-static int socfpga_get_plat_phymode(struct socfpga_dwmac *dwmac)
+static phy_interface_t socfpga_get_plat_phymode(struct socfpga_dwmac *dwmac)
 {
 	return dwmac->plat_dat->phy_interface;
 }
@@ -386,7 +386,7 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 static int socfpga_gen5_set_phy_mode(struct socfpga_dwmac *dwmac)
 {
 	struct regmap *sys_mgr_base_addr = dwmac->sys_mgr_base_addr;
-	int phymode = socfpga_get_plat_phymode(dwmac);
+	phy_interface_t phymode = socfpga_get_plat_phymode(dwmac);
 	u32 reg_offset = dwmac->reg_offset;
 	u32 reg_shift = dwmac->reg_shift;
 	u32 ctrl, val, module;
@@ -444,7 +444,7 @@ static int socfpga_gen5_set_phy_mode(struct socfpga_dwmac *dwmac)
 static int socfpga_gen10_set_phy_mode(struct socfpga_dwmac *dwmac)
 {
 	struct regmap *sys_mgr_base_addr = dwmac->sys_mgr_base_addr;
-	int phymode = socfpga_get_plat_phymode(dwmac);
+	phy_interface_t phymode = socfpga_get_plat_phymode(dwmac);
 	u32 reg_offset = dwmac->reg_offset;
 	u32 reg_shift = dwmac->reg_shift;
 	u32 ctrl, val, module;
-- 
2.49.0


