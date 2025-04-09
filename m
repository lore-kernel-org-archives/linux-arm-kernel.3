Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A1AC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 08:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6nvcOJ++NOB/Y9LYXH1TIQKqdDOujyb+N4hlkpNcJ4=; b=z2vncYMrzW4tsekkaDjhJsABPn
	krVa3eAvwvrNN1xTU3KSKQJLOnx8DHMf1A+R/cjKPslM243KP7csp0uW7BJfW+DpQyafvaWBB58Lf
	5C5GAGOAaPFJu8Vhgsc4rJKFKIaGLgjne6nUvMV0ey3Ezsm/G/lZ3XSX/jwg02OGFZLm7gK4LXFfV
	P0RQjpQ2MGRogiFlLCWMTB7MONXj4vDVp/bKQDoLJA4+1T07dpRQd2ji9rCTJbprNLuLY818BVQzb
	u2tom1WZ8wZ2mqsQSrBebcYVhwXLENaRziV8VRYbevP7YT3lcvr/D6SpTG+o9sMIhPCd6nfCW5wjw
	BzBifqAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Qda-00000006YKT-1SnU;
	Wed, 09 Apr 2025 08:18:22 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QQf-00000006Vo7-2zlz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 08:05:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+6nvcOJ++NOB/Y9LYXH1TIQKqdDOujyb+N4hlkpNcJ4=; b=dQpPFdfhbTOOkVqVQwaKv8AQmf
	BXG7XsHG1p8sgePhIRkqhafUnFjSTbQWugzIxEREYTJ16OTWqZE8yA5PhCJLU7fKHUWfowkjACkbs
	vT2cWXTOjcbiniyqm6Dj2dNJRgSi2tpCrEtAgi8mvWDvGlKw7WhRVl56+TSZpePyOaGhDuF+lWASV
	YIiGEvEyeIcR8qcCmtSdv+ZIOiH/cKJ0hlDA0i1HPZfzfB7xFw6lHl0kD9HKVIETE5M735VS8RtvS
	YStAAqNHHYQl3c/bm76lA5UFL7q+kcUx3L99qj4Cnzev13TMdJgGggrWfVSoMD/JJ8qPvD7BJVHAK
	CagUnSjA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39190 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u2QOa-0000Cd-1j;
	Wed, 09 Apr 2025 09:02:52 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u2QO4-001Rp2-Dy; Wed, 09 Apr 2025 09:02:20 +0100
In-Reply-To: <Z_Yn3dJjzcOi32uU@shell.armlinux.org.uk>
References: <Z_Yn3dJjzcOi32uU@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH net-next v2 1/2] net: stmmac: provide stmmac_pltfr_find_clk()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u2QO4-001Rp2-Dy@rmk-PC.armlinux.org.uk>
Date: Wed, 09 Apr 2025 09:02:20 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_010501_748982_CA715CD2 
X-CRM114-Status: GOOD (  10.33  )
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

Provide a generic way to find a clock in the bulk data.

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 11 +++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index c73eff6a56b8..43c869f64c39 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -709,6 +709,17 @@ devm_stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 #endif /* CONFIG_OF */
 EXPORT_SYMBOL_GPL(devm_stmmac_probe_config_dt);
 
+struct clk *stmmac_pltfr_find_clk(struct plat_stmmacenet_data *plat_dat,
+				  const char *name)
+{
+	for (int i = 0; i < plat_dat->num_clks; i++)
+		if (strcmp(plat_dat->clks[i].id, name) == 0)
+			return plat_dat->clks[i].clk;
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(stmmac_pltfr_find_clk);
+
 int stmmac_get_platform_resources(struct platform_device *pdev,
 				  struct stmmac_resources *stmmac_res)
 {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
index 72dc1a32e46d..6e6561e29d6e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
@@ -14,6 +14,9 @@
 struct plat_stmmacenet_data *
 devm_stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac);
 
+struct clk *stmmac_pltfr_find_clk(struct plat_stmmacenet_data *plat_dat,
+				  const char *name);
+
 int stmmac_get_platform_resources(struct platform_device *pdev,
 				  struct stmmac_resources *stmmac_res);
 
-- 
2.30.2


