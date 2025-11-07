Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76B4CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 14:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKZiK1dHIewBur5mGc5ojMPJZbRXpMlmQem14quHfpM=; b=oyN1fpzPtSNCPityG0c/UxGK4p
	Q/AzS9ocoECTJ8JfOGUJ3iUax5l/nJd8wTGmaru9+/STadkRL3k5C+p0jD3coi/PxWNvGXdplV2QJ
	AuB7mdn4DrX+arqMVpmyAihhU52DFwtHa8UMwLX8mOVXZBQNeu2a3EU7DqHe66Rt+1XFCx8GCvF/1
	MoNv1dR6zWlPkrzBTiO4I7sJpRv3WPnkYDvvPo/cyFuqfh+i+TGw1TVnWplNShRLphB+ppsBJn1o+
	PZr8LjLSIUEFmr6qSqo+R10uEuZtLNaQIl2t3/v7UUkA/+0BplU5jFjhmbz+1qcoWRUAK+bOL1jmG
	5vQX7Bng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHNSr-0000000HUn3-24B1;
	Fri, 07 Nov 2025 14:29:21 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHNSm-0000000HUep-1Jqz;
	Fri, 07 Nov 2025 14:29:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DKZiK1dHIewBur5mGc5ojMPJZbRXpMlmQem14quHfpM=; b=qFUpRxXURs31DgQG/63S4J/KUf
	zKIuAnPnPxt0T0Uthe0lPTzMkEi8SsrHCF7Er5OO6rR/H8Y2sD3bFKOh38bdhccuKvhmYTBW+xfaP
	8qJi2ssSYOR5E6dOFtjX0n9OlLcBcIsVBnAQA8IY2F2oK+eS7DpIBL6FtyJnkCH2Bf5BD5x59oL2V
	4rbhfIV8QyKvqq3uC4VZLiCydlJd7vHVkCN5TcGlhqUrYeVrCmH/E4kL7GxSnsk49kfeiWlyzEyJS
	MvNnx2drqoKQwGiyt8iAXCK0O8bCHuBgFlajLXSwKqXGwV68Js+6eHCJEkiKhpfJ2MP1kcXcIJ6uS
	5Dg2JOiQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43236 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vHNSQ-000000006i4-0FkI;
	Fri, 07 Nov 2025 14:28:54 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vHNSM-0000000DkSn-0Seo;
	Fri, 07 Nov 2025 14:28:50 +0000
In-Reply-To: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 10/16] net: stmmac: starfive: use PHY_INTF_SEL_xxx to
 select PHY interface
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vHNSM-0000000DkSn-0Seo@rmk-PC.armlinux.org.uk>
Date: Fri, 07 Nov 2025 14:28:50 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_062916_367991_93D8B80A 
X-CRM114-Status: UNSURE (   8.47  )
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

Use the common dwmac definitions for the PHY interface selection field.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
index 6938dd2a79b7..1ef72576c6f1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
@@ -15,8 +15,8 @@
 
 #include "stmmac_platform.h"
 
-#define STARFIVE_DWMAC_PHY_INFT_RGMII		0x1
-#define STARFIVE_DWMAC_PHY_INFT_RMII		0x4
+#define STARFIVE_DWMAC_PHY_INFT_RGMII		PHY_INTF_SEL_RGMII
+#define STARFIVE_DWMAC_PHY_INFT_RMII		PHY_INTF_SEL_RMII
 #define STARFIVE_DWMAC_PHY_INFT_FIELD		0x7U
 
 #define JH7100_SYSMAIN_REGISTER49_DLYCHAIN	0xc8
-- 
2.47.3


