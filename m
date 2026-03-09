Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4606FEFCD99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 11:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDZWyRUOmwSxEJ8NSDbK8w5frKrjb03mKJAu6i0DDIo=; b=dU5tvBr9x+xIO8Mdvg5hPUwRAO
	lrGdosSNW8w0v5JoXICdgORDbeGcraEUP+M79f8BEmfWalnRCvCBdSmCedW0UJa+bGLRpeX4AFlDJ
	GcmPm/ODlwGOKu+sEZSwrcJwZE7de0RFIXwnXHYc2gVn4skTmnn7Z8hWAPpxj5sitUlsHIaA10J+y
	ZiMxXyRVazDceI3oYUQDdZ//99cy11Qd6jPD1cStVx41/N9P86akxye76QdpVTj5xochdPpnTJhjk
	ipdZcWqo+rRCtQ6yYArffzKmGLcUmAWs1N1Ox54zsP/YnvAJI3/oS+3xbHfAkrNBJv6T5zQVrwmuq
	yYO/r0Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYfT-00000007AwB-1uLN;
	Mon, 09 Mar 2026 11:20:59 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYfP-00000007Atq-3Qj8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 11:20:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bDZWyRUOmwSxEJ8NSDbK8w5frKrjb03mKJAu6i0DDIo=; b=mWMHAMT0ILBrbK43jA10uck3iG
	A8WfXml9b6JjDH7Iy59XHi00iWDwp25ysY5XbzXuq442DH1Ftq7w5RSlkOmCsVtKukGxpf72VTmoc
	AjQ88SjtGcW6QZUiXJHPVDETe8vVc1KfbYLtmiDVhqhWaitCn6iYfyy1zS1SgoD8xqSX3cjfV1dAE
	mqv1yV4yKgzs+T+zTs+cwK3Dn0ZczzAFKf8yV7ROW0TyuIfJK3+BRAWzE5zlMeVQgL3niitkR844H
	NVilXj/lu2GBgyeMaCd9jjTqk1uroF32fwSZywT7vTvpjUeb2XAsFAa1Ols72xPHMBEVTB0H9gATG
	BKLh04fQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49960 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vzYfJ-000000003gi-08au;
	Mon, 09 Mar 2026 11:20:49 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vzYfH-0000000CZyt-2mMs;
	Mon, 09 Mar 2026 11:20:47 +0000
In-Reply-To: <aa6sofjFxyi2nkpr@shell.armlinux.org.uk>
References: <aa6sofjFxyi2nkpr@shell.armlinux.org.uk>
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
Subject: [PATCH RFC net-next v3 5/8] net: stmmac: qcom-ethqos: enable
 2500BASE-X
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vzYfH-0000000CZyt-2mMs@rmk-PC.armlinux.org.uk>
Date: Mon, 09 Mar 2026 11:20:47 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_042055_859859_ACBD4AB9 
X-CRM114-Status: UNSURE (   9.32  )
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

Enable 2500BASE-X support in qcom-ethqos to support the 2.5G speed with
the integrated PCS.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index cb1c074c2053..f4b63544895e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -828,6 +828,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ethqos->serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
+		plat_dat->flags |= STMMAC_FLAG_SERDES_SUPPORTS_2500M;
 	}
 
 	/* Enable TSO on queue0 and enable TBS on rest of the queues */
-- 
2.47.3


