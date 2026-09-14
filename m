Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C5DC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 15:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2SohUjq7PjiqTtPPk0xhVnoINci+7I7nPB9Q5MsHbSk=; b=IH5EPRcjf+rxERwN2nlxcQDTlB
	hoOW/y0bHn+sheygsLXERMxSyFIhhWXHaljCEW5F+2j2+RMONfLYFFuokS1g/OzJDX/09M2iUSRiB
	sXSHVsZ8Vp2QBUJHwkcku+bl+h9TVVh0lxkNhKdz+pQwzBe+gm4umsZUqAQNmq6F6N2/hS4qnclDX
	9nYGNIb9YfApyuEaOqFLZqO35BwfVax+65sRqrzLXdTToDDgMTeq68I/yOY1O6BMrnsvYm8vNIBa6
	LJ0Xuu4KyQnA2iykMWsFaLXKC2xl3C3xq/faiIhXuodko9ow7kyJPjxEeAim6Q9pBVL5QzWabAiGz
	jzY+gXEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68Gv-000000046Yj-1MNB;
	Mon, 14 Sep 2026 15:07:05 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68Gk-000000046SA-3k3Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 15:06:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=2S
	ohUjq7PjiqTtPPk0xhVnoINci+7I7nPB9Q5MsHbSk=; b=IlsxCCB+yHcnMCoBuV
	FCVP6bCgIsougS4IAxqSPRaG/ZUiow5X5HWDfvFCaxlRsw42oplGQuXSn2dtWzIO
	hD27VtRotpg9aJkEpSavZ+hwNnC4ldfjOyK467ZhlQNTWO9+YTOvCfVSvqM1jPrM
	lpvS+Y0JigLcLO1PT9KXkZ0rI=
Received: from hpl-VMware-Virtual-Platform.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDn_3pkDahqCSeIAg--.42971S3;
	Mon, 14 Sep 2026 23:06:13 +0800 (CST)
From: peilinhe2020@163.com
To: netdev@vger.kernel.org
Cc: alexandre.torgue@foss.st.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	he.peilin@zte.com.cn,
	jiang.kun2@zte.com.cn,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	maxime.chevallier@bootlin.com,
	mcoquelin.stm32@gmail.com,
	pabeni@redhat.com,
	vbridgers2013@gmail.com,
	xu.xin16@zte.com.cn
Subject: [PATCH net v7 1/2] net: stmmac: selftests: Prevent RXC from being disabled in LPI
Date: Mon, 14 Sep 2026 23:06:11 +0800
Message-ID: <20260914150612.9798-2-peilinhe2020@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914150612.9798-1-peilinhe2020@163.com>
References: <20260914150612.9798-1-peilinhe2020@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDn_3pkDahqCSeIAg--.42971S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFy7Cr1rAw4UJrWDZF1xuFg_yoW8AF4kpa
	97Ca4j9wn7JF17J3Z8Jr48ZFy5Wa90yF47Cw12ywnavayUtFWIqrWS9FyrX3WUXrWDWFy3
	ZFsFka43uan8ArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j5cTPUUUUU=
X-CM-SenderInfo: xshlzxhqkhjiisq6il2tof0z/xtbC8gUh0mqoDWVC2QAA31
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_080655_591249_E835CB47 
X-CRM114-Status: GOOD (  10.74  )
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

As the NETIF_F_VLAN_FEATURES may be empty on some platforms once the
software vlan stripping is removed, the phylink config attribute
'eee_rx_clk_stop_enable' may no longer be inconditionnally set to
true, hence allowing RXC to be disabled during LPI on platforms
that don't have any VLAN features.

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


