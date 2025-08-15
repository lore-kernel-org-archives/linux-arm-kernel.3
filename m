Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B97CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 02:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=18Y2FqPHGv9yTsq2i+bvrkK1Nwx8p+K4AcbHDTl42W4=; b=0NWazFCtGCRrlgspzCkcvZ0zoT
	dY4PFN1IlaxGSQ+vO0XVbENFA8cdLHGeP+ZkEXiuO6Tw2oANjobS7N4KXlvTunTw7W7wcmVrIVmug
	gQz0+c7Swbb0LGWdmYv1NzmJvdYOyq+xSJB5/tgZ+lwBkQU7LnbU1Y7g+bkv+VFmAj9+GguFFDibW
	w/azmHMHCm08aUlIGTpaxJas02H9+6KwwOkh93inPboEtNxFFq7UgD1h5QM8e/q0SfeHY/slmcjTt
	HbeLLMfiQ1a1aejvDVYMfXHrasVPQD4lU6CDy5fATXDMClczEpuLXJBISdXEC3ALuJWjAGxMvMeGz
	WjoDXKEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umkOX-00000001Crd-1gcy;
	Fri, 15 Aug 2025 02:42:17 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umkJa-00000001BeL-0rFB;
	Fri, 15 Aug 2025 02:37:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1755225324;
	bh=18Y2FqPHGv9yTsq2i+bvrkK1Nwx8p+K4AcbHDTl42W4=;
	h=From:To:Subject:Date:Message-Id;
	b=PETpp5hCLUcbcER3obgNFK4HJ4dRfaiQY5neZxAyGWT9oHS6C7TNOk8NGLY3YwNm2
	 WrgWK6Xu5ak/FzdeixmMXUoY9bgcZsjX+CvwnnWAaG3ycTlY77pHz0ofnlrdtFu+Zz
	 vk6GXv5IWZPTCjMsLxl+xFTyEhsJkQt/Nv8kFHkI=
X-QQ-mid: zesmtpgz1t1755225322taec13901
X-QQ-Originating-IP: EIRDYySQ/vTVoXNlfnhjpk64A+oYYEctZ9g7jsLXhaQ=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 15 Aug 2025 10:35:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7637992239138858937
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
Subject: [PATCH net-next v3] net: ethernet: stmmac: dwmac-rk: Make the clk_phy could be used for external phy
Date: Fri, 15 Aug 2025 10:35:15 +0800
Message-Id: <20250815023515.114-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MACXe2l6e7j9tHvQXME93TKuhbr1DWEBKVr6kPuKBNVbXJSTkZ+/mvNz
	FTuSXoReifaDWkVW/3Ceh7Zo7x1UgzyfwMB3F1sV6c1hFfa365Xz4qc9rKBNpnbWqmmy28x
	InABhI8CvjAupL16kqYCtSW1DuQnbq/F7FXUieBfn3u8WvT4OGayKdxG4OBaZ/vZK2dc/cN
	AB7Y2K2geRvldtryWJxvgXKyZ5dm4ndOgE/qx+pp1jgpDaFiy36aVnZS4JgMru1HjbG8X4j
	TWnEJLxmRA7RiPWuxZAQKBYHCDlyr/XgqODOdy8DtPHYFcOFsWETgSTB8PbffbeGzMkr2Zn
	HZoMnDZXQtU+GlWswzJe5JnIDzJ6eL+RVzK1zaHvzpUrkgR/jdSbtuEvNX2VC+JFbuUT29s
	dU10zw11d8FIr7gcYkzyqc1UtlVAQHEfcKlcR8a2iN/MDKu5mpCqKyB9nwNkarrwjlKaU6b
	gxtDEY6lSd4AdbZ4NcWkZG4cfCz7nTaafUAhtWBgCUlXL8dH23Z7iGnqpXKDo4YRJuifz1v
	vB0gMoajL4nNwmPnG1NdzT8wAlXXY3fDGyVEAMNThTcssfx0RFJ5IaAhzPtVuYS5WjEB1iG
	KDIZvYJWL9MFMqNlI/Jay6gyJngEtdGQsLzPISKVFx6cszM/7OiFx+brfX/n3jqIvoQUW9S
	VdLjcYEbfe9/xhiJ/zrFbw1tzZCd0wbEmA8KrmANDFjk8aXRgz671qhW7KtBfIk4t4p4DOK
	i/0UBuW7BOFOG13TG6n2RnB8m9tTxLSD5VeQR2MGM/gwFc9aL0pLnrNjThMsB9kYojfzY3t
	zLoZkIbq+Bbeq5Ir3XYE5c5xfw20LHUqu3xCdtw7hVcABP3LX4fMCofh8ZqI1/FfGeGIU9+
	qxOiu8TnWKqqb23iq6qW3vCvfLtNRnaFbBW4fPEAVGPfmSKCzcD7uxrcQ8uJBa92wLLPgsC
	PHdnMiyg5xdjFmNDrXQ4WswPE0vf2/Kdh/GJvhHnRKQul1K4V2TlC0sgc
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_193710_913719_7F27B2B7 
X-CRM114-Status: GOOD (  12.36  )
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

Changes in v3:
- Link to V2: https://lore.kernel.org/netdev/20250812012127.197-1-kernel@airkyi.com/
- Rebase to net-next/main

Changes in v2:
- Link to V1: https://lore.kernel.org/netdev/20250806011405.115-1-kernel@airkyi.com/
- Remove get clock frequency from DT prop

 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index ac8288301994..5d921e62c2f5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1412,12 +1412,15 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
 		clk_set_rate(plat->stmmac_clk, 50000000);
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


