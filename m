Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD05C982CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 11:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L/dQxRg/kROy8iG4mRPU8BaUTlLittQMl1h6HbieP18=; b=XEpZwH+lyssmv7Wq0e8q+RuGX7
	KzRMbsr+8U69QnwIY5+YOjJ/3zM506vTPpzkxj8K/eI81tnGNoBWSpxyqK9MZgMvRXU6DdfpV7N2z
	eNMnG0JoPjR/55GDJFlFHLOZme2aD0RAWLZ3eFQedTmC/RubvBR03okOKMkOsESUi7CkF8oxuL/8D
	t7zrvmlWciEuqnL1Q3W3/h20kY5TA0nxbeCQkeA2pI1UXebf9OGlgn0nAcvahmmgXJUQeVNVqIHJE
	MD8DS7PtAKmC2YI1iyjS+GwGQVNvF7ZeE6GT10KuJZHXsmFYKWfCHrJBGX9GjbJnOcP2RyGaghS1D
	sAN4/X7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7AQK-0000000BC8J-0ycp;
	Thu, 17 Sep 2026 11:37:04 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7AQH-0000000BC7J-1ecg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 11:37:03 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAAHKkPW0Ktqj7F_CA--.42390S2;
	Thu, 17 Sep 2026 19:36:54 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: alexandre.torgue@foss.st.com
Cc: andrew+netdev@lunn.ch,
	clabbe.montjoie@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	jernej.skrabec@gmail.com,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	samuel@sholland.org,
	wens@kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] net: stmmac: dwmac-sun8i: Fix EPHY clock leak in get_ephy_nodes()
Date: Thu, 17 Sep 2026 11:36:54 +0000
Message-Id: <20260917113654.2149268-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAHKkPW0Ktqj7F_CA--.42390S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF45tF4rKFW8AFW8Jry5Jwb_yoW8Aryfpr
	Z7uFyYv34fArWSg3Z8tr1UZF98Zay2qF4rGr1ftan3Canayayjv34a9Fy5XFn8AF4rWa4a
	qr48G3Z3C3WDArUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPvb7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxV
	W0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7
	v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0E0s8F02x267IIx4CEVc8vx2IErcIFxwAC
	I402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrw
	CF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E
	5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZV
	WrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY
	1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r4UJVWxJr1lIxAIcVC2z280aVCY1x0267AKxVW0oVCq3bIYCTnIWIevJa73UjIFyTuY
	vjxUVpBTUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRINA2qrq016GgAAsS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_043701_902699_0827975B 
X-CRM114-Status: GOOD (  10.43  )
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

get_ephy_nodes() stores the clock returned by of_clk_get() directly in
gmac->ephy_clk before the reset control is obtained. When the reset
lookup fails, the loop continues or returns without releasing that
clock, and sun8i_dwmac_probe() then jumps to dwmac_remove, which does
not call clk_put(). Keep the clock in a local variable and release it
on the error paths.

Fixes: 634db83b8265 ("net: stmmac: dwmac-sun8i: Handle integrated/external MDIOs")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 48c52eb96233..38d7e71de925 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -783,18 +783,22 @@ static int get_ephy_nodes(struct stmmac_priv *priv)
 
 	/* Seek for internal PHY */
 	for_each_child_of_node_scoped(mdio_internal, iphynode) {
-		gmac->ephy_clk = of_clk_get(iphynode, 0);
-		if (IS_ERR(gmac->ephy_clk))
+		struct clk *ephy_clk;
+
+		ephy_clk = of_clk_get(iphynode, 0);
+		if (IS_ERR(ephy_clk))
 			continue;
 		gmac->rst_ephy = of_reset_control_get_exclusive(iphynode, NULL);
 		if (IS_ERR(gmac->rst_ephy)) {
 			ret = PTR_ERR(gmac->rst_ephy);
+			clk_put(ephy_clk);
 			if (ret == -EPROBE_DEFER) {
 				of_node_put(mdio_internal);
 				return ret;
 			}
 			continue;
 		}
+		gmac->ephy_clk = ephy_clk;
 		dev_info(priv->device, "Found internal PHY node\n");
 		of_node_put(mdio_internal);
 		return 0;
-- 
2.34.1


