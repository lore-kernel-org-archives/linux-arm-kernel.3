Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0C0C44511
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 06:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Mime-Version:Message-Id:Cc:Subject:Date:From:To:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YEZA28DCAkovTIOKhUBwjAgpO1kMhVmk8JXg7hYn5rw=; b=H1zib/XSVW1dCtH58AShtC2B4m
	K9eW2s6GgOHa4szI1rNrgpqK3Q3OuSI9CkMD7PZfMERNcvIcSZXINeHwnVNEfWeItdArokhqM6aVn
	mOiPT7bs+339lDnWLxUOgVXxdWm4U9aDD+Hbb85N43ULbnjGxi/QGLnrydkFupsmn1v21XEI2L6VO
	ucrGx9qhhiIzrx75cQAmHyejOMhqvq6eD0w0n4WOECDtW0D/pfBz3ZwNbDmSnF5DzWfFF9Dt8WY2i
	DhF8li6GV925VV3GnifUGjHNM+S9w1AkewRCAf+r0LanALG2LJFghkNjvBFcyAljx5VWIELBnQV6j
	QdLnUQ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkG11-0000000GahR-2vVY;
	Thu, 16 Jul 2026 06:56:15 +0000
Received: from gz.d.sender-sib.com ([77.32.148.26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkG0z-0000000GaP1-27Hm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 06:56:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
 q=dns/txt; s=brevo2; bh=YEZA28DCAkovTIOKhUBwjAgpO1kMhVmk8JXg7hYn5rw=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=VXHr6vrzk8YphwJxyu34udAHxGeYRKyI9mJNKmzPbWZxQoq6PKIXMdKyJ54d/4u2h+CQgbl+5cqt
        F3/oS1g/9p7FlMq6Av/jUIiCs0SKjqoHzj2E3Tdiv8nZmorXJ7U7xGn7AboOB/2VnLmXt9qAS4R0
        uKLB52qN8xt9HPk1xgCI29T5COxvM3PwqtRc/mfvIEVkmK4BAFF2IIX7Fzsu0a+hpFtkQRZM4w/q
        psxdbN6lp6mFYyT5aRU5XHxJuMNQwZ7Bi5Cm9uWN1poXuwSwbcYFDguneiIYGM2Ylx608ROpNiXq
        /K1ABmAvaofCGpifx9qJBr3qKNyyZujGCMNCcw==
X-Mailin-EID: NDg1NjE3NDAyfmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZ348MjAyNjA3MTYwNjU2MDYuMjQ2NjI2Ny0xLWdhaGluZ0BnYWhpbmd3b28uY29tPn5nei5kLnNlbmRlci1zaWIuY29t
To: <andrew+netdev@lunn.ch>,<davem@davemloft.net>,<edumazet@google.com>,<kuba@kernel.org>,<pabeni@redhat.com>,<heiko@sntech.de>,<mcoquelin.stm32@gmail.com>,<alexandre.torgue@foss.st.com>
Feedback-ID: 77.32.148.26:11677070_-1:11677070:Sendinblue
From: "Jiaxing Hu" <gahing@gahingwoo.com>
X-CSA-Complaints: csa-complaints@eco.de
Date: Thu, 16 Jul 2026 18:56:06 +1200
Subject: [PATCH net-next] net: stmmac: dwmac-rk: enable the reference clock for output mode
X-sib-id: PMqrOYvZPI-6Av0PtrL3kAFsSjkYLndBFIG97PYGqRPZp-d-XcyAbAx-HQjOss87f1M03ZkWKKwYbsMFqbOhOz0IGMyg2-V_ZBGer3y8s8XyVaLMHuIcoWNSqR3s0qCRhhS_-ZV_To3p6_vVXoF8WaXRSAPpH_sMbC_vmj6vOxHZYNE5Uedh_A2BlFMEsPM-v4-W
Cc: <netdev@vger.kernel.org>,  <linux-rockchip@lists.infradead.org>,  <linux-arm-kernel@lists.infradead.org>,  <linux-stm32@st-md-mailman.stormreply.com>,  <linux-kernel@vger.kernel.org>
Message-Id: <ae21e239-6657-4413-b574-8f417c800d91@smtp-relay.sendinblue.com>
Origin-messageId: <20260716065606.2466267-1-gahing@gahingwoo.com>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_235613_695872_868EE8C5 
X-CRM114-Status: UNSURE (   9.71  )
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


rk_gmac_clk_init() only requests the refout clock group for RMII. The
ArmSoM CM5 has an on-module YT8531 RGMII PHY with no crystal that needs
the SoC 25 MHz reference (clk_mac_refout), so in RGMII the clock was
never enabled and the PHY did not respond on MDIO.

Request the group whenever the SoC drives the clock (clock_in_out =3D
"output"), not just for RMII. The clocks are optional, so other boards
are unaffected.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/e=
thernet/stmicro/stmmac/dwmac-rk.c
index 8d7042e68..dd060e4b8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1112,7 +1112,7 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_da=
ta *plat)
 	bsp_priv->clk_enabled =3D false;
=20
 	bsp_priv->num_clks =3D ARRAY_SIZE(rk_clocks);
-	if (phy_iface =3D=3D PHY_INTERFACE_MODE_RMII)
+	if (phy_iface =3D=3D PHY_INTERFACE_MODE_RMII || !bsp_priv->clock_input)
 		bsp_priv->num_clks +=3D ARRAY_SIZE(rk_rmii_clocks);
=20
 	bsp_priv->clks =3D devm_kcalloc(dev, bsp_priv->num_clks,
@@ -1123,7 +1123,7 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_da=
ta *plat)
 	for (i =3D 0; i < ARRAY_SIZE(rk_clocks); i++)
 		bsp_priv->clks[i].id =3D rk_clocks[i];
=20
-	if (phy_iface =3D=3D PHY_INTERFACE_MODE_RMII) {
+	if (phy_iface =3D=3D PHY_INTERFACE_MODE_RMII || !bsp_priv->clock_input) {
 		for (j =3D 0; j < ARRAY_SIZE(rk_rmii_clocks); j++)
 			bsp_priv->clks[i++].id =3D rk_rmii_clocks[j];
 	}
--=20
2.43.0




