Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE56CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 16:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tfEpnPPX806gGAT1vDmLicnTjJZMCA1iEnGz+aQZSNc=; b=EkXnnl3kkhFN06TqptJ/VyLQp0
	igNTlHm3XqaDo8+RJa9voVWtuAMepUiu9VjAQNxloyajQYi7Bu0Dz4W9oOnyuAaEjE1T8FMTWSVCJ
	dK5QJ3QPqvOIFqRDTxwn5uSp6rrteEvGupBCbZWEojEBKftGv0deq0dScHKJvlCfE9cNvJ4GDx45z
	yrZgL8n6oi6xEqQBSwE/kd+6ZBuh2f8c8rVFyVJvYVjhqP75bTuruUepM8xUmrySpLEv2CfLEmlvy
	cXCmC9RzFAl/xBXm/hoASCX7ApoqIgdQNcrcy0dV22Ho1Lyr1kONKybX1tZIqndFk81Qm6gZj/XYw
	3obZAF0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolX2-0000000ENNR-43PU;
	Wed, 20 Aug 2025 16:19:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojse-0000000E4Dw-0X5R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 14:33:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tfEpnPPX806gGAT1vDmLicnTjJZMCA1iEnGz+aQZSNc=; b=gsLXXZKTmzn67jwPEK8Sj0SaAV
	MFte2Pv70kKISWgw+gC5shRJmuqEoheNHGzwps+3LkNUwZe7tUxTyGCWQx483tOkmQvTyZL41NEZY
	jYyQF7bTKypZTIB9aTguBQmXlCdqt7yVqqMcOjqR7PRcMgClxd4ISdsSi0NdAtwqTMG4G65T0C4xD
	YcPoylgT6L6dQdkUuKHdURzNhWXNjWKWXwwSKe2toulViTjxUX4kfWWZtiKVA0bPAt6+S0NhDmFXZ
	YJFPj44hEorc/g3COAkzy4DXIDfmHo7Yj03BkMUQYGDg73bQs2Rd8i+fQdARMb81xRg7bcnHPt1tP
	ZyrlHlgA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45032 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uojqW-0004sM-1c;
	Wed, 20 Aug 2025 15:31:25 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uojpo-00BMoL-4W; Wed, 20 Aug 2025 15:30:40 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next] net: stmmac: fix stmmac_simple_pm_ops build errors
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uojpo-00BMoL-4W@rmk-PC.armlinux.org.uk>
Date: Wed, 20 Aug 2025 15:30:40 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_073336_157866_F5223FF2 
X-CRM114-Status: GOOD (  10.50  )
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

The kernel test robot reports that various drivers have an undefined
reference to stmmac_simple_pm_ops. This is caused by
EXPORT_SYMBOL_GPL_SIMPLE_DEV_PM_OPS() defining the struct as static
and omitting the export when CONFIG_PM=n, unlike DEFINE_SIMPLE_PM_OPS()
which still defines the struct non-static.

Switch to using DEFINE_SIMPLE_PM_OPS() + EXPORT_SYMBOL_GPL(), which
means we always define stmmac_simple_pm_ops, and it will always be
visible for dwmac-* to reference whether modular or built-in.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508132051.a7hJXkrd-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202508132158.dEwQdick-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202508140029.V6tDuUxc-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202508161406.RwQuZBkA-lkp@intel.com/
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a55e43804670..fa3d26c28502 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -8024,8 +8024,9 @@ int stmmac_resume(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(stmmac_resume);
 
-EXPORT_GPL_SIMPLE_DEV_PM_OPS(stmmac_simple_pm_ops, stmmac_suspend,
-			     stmmac_resume);
+/* This is not the same as EXPORT_GPL_SIMPLE_DEV_PM_OPS() when CONFIG_PM=n */
+DEFINE_SIMPLE_DEV_PM_OPS(stmmac_simple_pm_ops, stmmac_suspend, stmmac_resume);
+EXPORT_SYMBOL_GPL(stmmac_simple_pm_ops);
 
 #ifndef MODULE
 static int __init stmmac_cmdline_opt(char *str)
-- 
2.30.2


