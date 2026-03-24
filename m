Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7029F54AAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmTfS/i7ohF2whVbYhIg8vu61LN1L33aVbBqUbHSb1w=; b=2ZTOUwZcZs1yQf2KZmWkF0iJp8
	zhxdM51CtlrZc+R2WD6aiohSQGQeYNH5/+i+/jFvGlCO2WCm1IpPVExp+2hx8JSkc43XrVG7sihwW
	OoAKtLbX/lDN68mPRpmWA4MEJNBSG8upo5xCL4EFzMWJUkLbIpVsrvBSCfLFgvmeDASzQ7Xi02kFy
	VAz4ZY9+h1VMVWG8eqyTwtNxNCrYtDi9C0J97cLmYoQBaQBX7aPloDdWnetQlKxY3O71P9wOuGtr/
	3nBmGBor+Utf+FHqYWMLZ8tQ5XlNwwqNw49aV2ilFw/GSPEKdIPRzmqiGFNfL1NXo1aZci63yph2Y
	RbsN9SJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51YK-00000001VDf-3NL7;
	Tue, 24 Mar 2026 13:12:12 +0000
Received: from pandora.armlinux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51YI-00000001V9R-3KhG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 13:12:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OmTfS/i7ohF2whVbYhIg8vu61LN1L33aVbBqUbHSb1w=; b=HuslBnk9TtezSI9W+3x29XYqjs
	yLlKK0YgHTO2n2EAAJnlmkFGGWtgpGK+cXeO686EcK/ZcG5qL67WNIm1bdTvD3ld0UIkZ9e1Wd8bT
	y2fyRYvNFvNIegHAFIBb5f+5wtL/Dne0gHhoYOEHhds37FckB0ULP7oYd6jRq0fwLW7UrmGFTINVL
	HG3aerTOzQwwF+OTsVUfjS4cP633Qu8SGDsbJOPiv2fWv8SlGxOphogAJHVs0xlAnT/cUTgajWc18
	KA8fiJLhryiVoy1f06nqlPt4z+8JkU+wP565VyHMp3HVHItedHNnBXA0KpcuJ5atpuNHEY8m4rcu3
	ChAdnK/A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38012 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w51Y4-0000000023d-2NUB;
	Tue, 24 Mar 2026 13:11:57 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w51Y2-0000000DwVh-3aq1;
	Tue, 24 Mar 2026 13:11:54 +0000
In-Reply-To: <acKNcX5PqtWYf8m3@shell.armlinux.org.uk>
References: <acKNcX5PqtWYf8m3@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 05/15] net: stmmac: qcom-ethqos: move
 RGMII_CONFIG_DDR_MODE
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w51Y2-0000000DwVh-3aq1@rmk-PC.armlinux.org.uk>
Date: Tue, 24 Mar 2026 13:11:54 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_061210_855699_367043A8 
X-CRM114-Status: UNSURE (   9.14  )
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

RGMII_CONFIG_DDR_MODE is always set irrespective of the speed. Move
this out of the switch.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 7e389db40e8b..3540471ff272 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -402,10 +402,10 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		return -EINVAL;
 	}
 
+	rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
+
 	switch (speed) {
 	case SPEED_1000:
-		rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE,
-			      RGMII_IO_MACRO_CONFIG);
 		rgmii_clrmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN,
 			      RGMII_IO_MACRO_CONFIG);
 		rgmii_setmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL,
@@ -443,8 +443,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		break;
 
 	case SPEED_100:
-		rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE,
-			      RGMII_IO_MACRO_CONFIG);
 		rgmii_setmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN,
 			      RGMII_IO_MACRO_CONFIG);
 		rgmii_clrmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL,
@@ -481,8 +479,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		break;
 
 	case SPEED_10:
-		rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE,
-			      RGMII_IO_MACRO_CONFIG);
 		rgmii_setmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN,
 			      RGMII_IO_MACRO_CONFIG);
 		rgmii_clrmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL,
-- 
2.47.3


