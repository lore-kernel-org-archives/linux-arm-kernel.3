Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DF1CF65E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 11:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jVLFfVd3X1JU5vZWQqTSvIV4WWcbPJ1JZLcb+HxFgbA=; b=Ap+A57sMGHW9ll0Ks4s7UIJ4uN
	oPlh/D8nMmhi9r/pTNtg4LG95jVAwbPVk37VzxaQ6XQPN6hEspWdknRUEOFI+eK4RQARwrawMlYUo
	JeuoSL8MXdLvEnzR3uLoYkHazwsUOV1RGdyGOaFoCwTiyjML2eI7Pntn5qYb5tWSYndLr/UBfYFRD
	SSmfxPsGfbelB9bHDGwm2WLCXJ1gq9b1LMI7PwZZbwhwaGjmjnxPsBRYg6Vj2QJebZLrzOHiuvTY5
	aRm8MjCEijMchkyye8t4tzEd2/oYue3W+cmoY7mxjk2lj8K6IcLQvwnMIamJmjiZ0yA4ifZUhSil5
	CtaxCZSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL29-0000000CQim-3cJb;
	Mon, 26 Jan 2026 11:45:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL25-0000000CQeC-2rkQ;
	Mon, 26 Jan 2026 11:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jVLFfVd3X1JU5vZWQqTSvIV4WWcbPJ1JZLcb+HxFgbA=; b=n5vf8hGGLLDEyvMmJc3tiY6EQS
	Pbp6+qtBxcY65cSY9Z4Z397dQVe9a1MZF4jApZIO3XCWCPV5GheC4skN/QNMQEX7TGGnGYfbDN9XI
	7C36v+NbC0fih7hihhDgs0ABnWzI4eX2id5Pq5vWrGteqsZ4tV3P+wWBjPu0uJltWjUrSRq3Mjz6n
	8a2SShUKUWEsqH6kkGVjvrEpW0BTecHJwRy54Yzu18o2v50IBD9jNSR69K5kUzcLh1EZvs7hkLMJ5
	uFFlN1Imvg/njHEkdlfKaEDces97SeDp+k894bNUyJMdAbcfpKEjYmCBx7N13gCmK19r5SUrw0EP+
	LcgoLesA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37956 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vkL1z-000000004eM-1jJZ;
	Mon, 26 Jan 2026 11:45:19 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vkL1y-00000005usW-1TKX;
	Mon, 26 Jan 2026 11:45:18 +0000
In-Reply-To: <aXdTi4ViCkhhXvFI@shell.armlinux.org.uk>
References: <aXdTi4ViCkhhXvFI@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 04/22] net: stmmac: rk: group MACPHY register
 offset and fields together
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vkL1y-00000005usW-1TKX@rmk-PC.armlinux.org.uk>
Date: Mon, 26 Jan 2026 11:45:18 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_034525_726067_85444330 
X-CRM114-Status: GOOD (  10.06  )
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

Group the MACPHY register offsets and associated bitfields together
to become self-documenting which definitions are associated with
which register.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index c8b49ed2064a..5f8d2031b97c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -162,15 +162,17 @@ static int rk_set_clk_mac_speed(struct rk_priv_data *bsp_priv,
 	 ((rx) ? soc##_GMAC_RXCLK_DLY_ENABLE : soc##_GMAC_RXCLK_DLY_DISABLE))
 
 #define RK_GRF_MACPHY_CON0		0xb00
-#define RK_GRF_MACPHY_CON1		0xb04
-#define RK_GRF_MACPHY_CON2		0xb08
-#define RK_GRF_MACPHY_CON3		0xb0c
-
 #define RK_MACPHY_ENABLE		GRF_BIT(0)
 #define RK_MACPHY_DISABLE		GRF_CLR_BIT(0)
 #define RK_MACPHY_CFG_CLK_50M		GRF_BIT(14)
 #define RK_GMAC2PHY_RMII_MODE		GRF_FIELD(7, 6, 1)
+
+#define RK_GRF_MACPHY_CON1		0xb04
+
+#define RK_GRF_MACPHY_CON2		0xb08
 #define RK_GRF_CON2_MACPHY_ID		GRF_FIELD(15, 0, 0x1234)
+
+#define RK_GRF_MACPHY_CON3		0xb0c
 #define RK_GRF_CON3_MACPHY_ID		GRF_FIELD(5, 0, 0x35)
 
 static void rk_gmac_integrated_ephy_powerup(struct rk_priv_data *priv)
-- 
2.47.3


