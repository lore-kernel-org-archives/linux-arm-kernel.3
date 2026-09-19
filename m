Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F74C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 12:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9amai/fCedQ3sHwz5sdKcEJq4hBV8gzILMhbJO3+SBs=; b=fRxWDv4xOXRHNUxtwlr55cqFRk
	c2MNms3fm+WyxF3QPoM7FK29kBpyLj64GKUAvR9nhaB/xt6MK3gJHRrRFfy+qm+1QLICicro8OHDN
	l1fB8PrXq2uYyQOQI0AmPIIJN+GO8m6yvX05ovHoq3WhcOzu9kz11wrLIVe6+LSdTXetnojkSRhos
	HHsBOIDXaHglToHDFZkQfrwGqCxgIcn/d71EqY5Ly7ZMU0wtoM2R+DSS3Fwyn+gHMK+WytZTivavb
	ICu7JoNGw+zC5LmidujiAEOVNh1YV+Sb+X1jkZcUGDlm1ydgyUeP56CXD8pYmuSHsetmJdv0zNRzP
	j6CxGP5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uej-0000000GIX1-3uN8;
	Sat, 19 Sep 2026 12:59:01 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ueg-0000000GIWM-1dNM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 12:59:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=9a
	mai/fCedQ3sHwz5sdKcEJq4hBV8gzILMhbJO3+SBs=; b=fy4lTE0rS3nxNjt4yZ
	9TLv9BGIXW/1Ao761kWE4dv5n0/g9Dzjosg6C/S9XIxVEMsSyc4LDUPUL6VkFY4K
	Qwl2AH0c0nRsbsALFYZ0tnxyChAav28R87tbiGr5FjeT25juKLEPcc6ftlNBxCQt
	y9CamrVitNDyzrywYN8JDEKzw=
Received: from hpl-VMware-Virtual-Platform.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wA3Rprlhq5qpMqHBg--.54511S3;
	Sat, 19 Sep 2026 20:58:14 +0800 (CST)
From: peilinhe2020@163.com
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peilin He <he.peilin@zte.com.cn>
Subject: [PATCH net v8 1/2] net: stmmac: selftests: Prevent RXC from being disabled in LPI
Date: Sat, 19 Sep 2026 20:54:12 +0800
Message-ID: <20260919125413.18058-2-peilinhe2020@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260919125413.18058-1-peilinhe2020@163.com>
References: <20260919125413.18058-1-peilinhe2020@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wA3Rprlhq5qpMqHBg--.54511S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFy7Cr1rAw4UJrWDZF1xuFg_yoW8Cr1xpa
	97Aa4jkrn7XF1xJan8Jr48ZFy5Wa90yFW7Cw12ywnav3yUtFWSqrWS9FyrZa4UWrWDXFy3
	ZFsF9a43uan8ArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jweOJUUUUU=
X-CM-SenderInfo: xshlzxhqkhjiisq6il2tof0z/xtbC8gYh0mquhub-1gAA3K
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_055858_817019_518898CA 
X-CRM114-Status: GOOD (  11.73  )
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

From: Maxime Chevallier <maxime.chevallier@bootlin.com>

RXC is critical to the RX path and some register banks in stmmac, so
it is blocked from being disabled in LPI when we know we're going
to need that clock.

During selftests, we're in MAC loopback so the PHY may enter LPI and
stop its RXC. This will prevent the RX path from properly receiving
the looped-back packets, hence failing the selftests.

As NETIF_F_VLAN_FEATURES may be empty on some platforms once the
software VLAN stripping is removed, the phylink config attribute
'eee_rx_clk_stop_enable' may no longer be unconditionally set to
false, hence allowing RXC to be disabled during LPI on platforms
that don't have any VLAN features. This is already the case for
CONFIG_VLAN_8021Q=n builds.

Fixes: 091810dbded9 ("net: stmmac: Introduce selftests support")
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Peilin He <he.peilin@zte.com.cn>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index 664d7cfde2f1..4f4d61a9c098 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -1847,12 +1847,14 @@ void stmmac_selftest_run(struct net_device *dev,
 		return;
 	}
 
+	phylink_rx_clk_stop_block(priv->phylink);
 	for (i = 0; i < count; i++) {
 		ret = stmmac_selftests[i].fn(priv);
 		if (ret && (ret != -EOPNOTSUPP))
 			etest->flags |= ETH_TEST_FL_FAILED;
 		buf[i] = ret;
 	}
+	phylink_rx_clk_stop_unblock(priv->phylink);
 
 	stmmac_set_mac_loopback(priv, priv->ioaddr, false);
 }
-- 
2.43.0


