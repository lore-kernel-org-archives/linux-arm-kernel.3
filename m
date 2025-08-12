Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05D6CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 01:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DXt1l6NWEaWvzzRNmToj4TiWvhp///AcGoYhD9MVs5s=; b=5BxYDO3oS2bpvbasM1o1in+XVM
	xrqtWN3G/EcetQnlRzfQGV2RzWF+mh9e3hJDyNXmLPvgV/zjrc9XzMaZ61vjc1yeEu//Fmw5yiNki
	KrIDTOuCa2hsZsBaC3e3cIourzXk3rLR/fXkyVsxov2xUcnAJpARptF7l5FAFC+Kkc27SUlJI+Vd8
	Oe6Oky1Z8mBtXISaUjNK8L+cKuEnUH7gd5vREzT4uAK6x5jCNKpHp4s3Fr6TBzMedK4tcatricO3C
	rFqdmnwKtgP/QiYycDsk6kLcMMWYhfzGVisdi3eiKb3Q01E6MvIXDbbeBsYedF/RUbR1Rdb3z7IW2
	X165TfLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uldml-00000009Vsa-1nP8;
	Tue, 12 Aug 2025 01:26:43 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uldk3-00000009VfM-0VTH;
	Tue, 12 Aug 2025 01:24:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1754961696;
	bh=DXt1l6NWEaWvzzRNmToj4TiWvhp///AcGoYhD9MVs5s=;
	h=From:To:Subject:Date:Message-Id;
	b=Nof0oMhKtKmIn/22ZAPux75Kuq2h0QAuobVGpPP5iXsQV68LNB7HhKw+TckXvNQdP
	 XihKIHpOYuaPjQxVeNJzShx7DORpTyijMxxv1+CoSLcXu6ZLIRVKqMEmUdK5bh0jYK
	 /UTqHQt853NGqlEBJHadmeYhKjLfz/06WzA+0tgk=
X-QQ-mid: zesmtpgz1t1754961694t7321c736
X-QQ-Originating-IP: AO0T0YrLnu0VCFmyG0tj5tjzd+Lt/0si4Io9f5QdS7Y=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 12 Aug 2025 09:21:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6442695282303422714
From: Chaoyi Chen <kernel@airkyi.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Jonas Karlman <jonas@kwiboo.se>,
	David Wu <david.wu@rock-chips.com>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH net-next v2] net: ethernet: stmmac: dwmac-rk: Make the clk_phy could be used for external phy
Date: Tue, 12 Aug 2025 09:21:27 +0800
Message-Id: <20250812012127.197-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NDtUtlvFer7vL/LwNb66aZx212cHM6dJ1xjRA4cdyvzhuJuCX+C9MsbB
	W9x3fsdJJm9HrrRKW2NNVwwnIN/ypLxk/2rCCLA/T4seAPfJQlMVUb/o17VeCh2P5b6gAjw
	YalVsAfWw6i9PuVscUiJWR4+Rq3SDvyuojUmBsptyFGJv+6Vwt5wzCUZGaAaB8BdECcpyaW
	t4eZ13s9NJOuqR/ZWgTnc0X39ASrDWZ5fGZFHK5XIaoSbJYU7xyHZZBkxOsL0U/en6uYPH+
	zO1yWODu9n5aZNaEhyMx47XOki2d4OwH2t6sisf0Ogzm5rDeJjgXLlyR4PQJloLA41X2KD6
	qiTN1DRqwB+L6yoihMiD2XtEghBC1mrgG7Ew7TCdNQgznlzBSTwIQjzhdcV1ZcPX88Tak8X
	cLCES4g7/EdTO2mA3YlKtAtRf2T9yRh5l7tXZq73s6L8htZE6UkxFWsfzCMz+oNdrDUXN73
	dYjrylIW8bDIJLPVwo/dm1pkReRxIO+J/B+4pFLlikP1CpiIFhovp6QubjlhM/aykK5NU/c
	Kfm4DU89oOF1yqyNBzvB+BUwPIwabbwIrIvKJ2pkQCKd8wn5Q8VDQxlnVUcweuMAZJYHZ03
	XkFmOiEsW7FbL36IZumxISHD4MNq89sN2arJRc5nelpTkTujT84w2vWof8KJHBZTHafvQhA
	ojqAc0UVEcazLutJRudHNCsOsOCXgFfNkTNbwUyWmdcCGppZ42kPhPj4pPTrFylHp2FYPfE
	8t/Qm0grWB8N4K9d1Ou44VI6uRyD4SsUQ6HV2i5BkFgPKsv3VhP+R5OUVwye6TwQEbBigKN
	XkUE7HxqFD47TheCI+IEor6eIOoygNXwaK7fP5FnRJtQUDkFZ7x/CCyICJVWeNL/M7opr78
	zJsM/eTsssDgmT6Qtb7w2OPQJLLSXLoUKo9/0f0cODk+NjbRvpa2yFf4cwGhAhBSyQnQKIq
	tF/A/9pmhG43tCvMFpRKUUqATFiUYnvDGEeOAI3gd2USzWdqnrE0diF+0UJXViOnDim8=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_182355_685406_F6BF72E8 
X-CRM114-Status: GOOD (  13.01  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

For external phy, clk_phy should be optional, and some external phy
need the clock input from clk_phy. This patch adds support for setting
clk_phy for external phy.

Signed-off-by: David Wu <david.wu@rock-chips.com>
Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

Changes in v2:
- Link to V1: https://lore.kernel.org/netdev/20250806011405.115-1-kernel@airkyi.com/
- Remove get clock frequency from DT prop

 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 700858ff6f7c..36fab70283de 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1595,12 +1595,15 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
 		clk_set_rate(bsp_priv->clk_mac, 50000000);
 	}
 
-	if (plat->phy_node && bsp_priv->integrated_phy) {
+	if (plat->phy_node) {
 		bsp_priv->clk_phy = of_clk_get(plat->phy_node, 0);
 		ret = PTR_ERR_OR_ZERO(bsp_priv->clk_phy);
-		if (ret)
-			return dev_err_probe(dev, ret, "Cannot get PHY clock\n");
-		clk_set_rate(bsp_priv->clk_phy, 50000000);
+		/* If it is not integrated_phy, clk_phy is optional */
+		if (bsp_priv->integrated_phy) {
+			if (ret)
+				return dev_err_probe(dev, ret, "Cannot get PHY clock\n");
+			clk_set_rate(bsp_priv->clk_phy, 50000000);
+		}
 	}
 
 	return 0;
-- 
2.49.0


