Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E06C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 06:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7GaqLnSbBrIEhdw7ERwjg1ICgmS4Mg1QhxztBP8zNGQ=; b=nulbq9lWbQt7YZ9OAHTqrOloPL
	0EShMPlgWKMt433nFcT8SkV2QQuFAZCHOzt1vf4afZE7tQiaV+9FWvtoDl5Z6DaVgzcDhSknSJTHY
	QCg8iM1MyeiZSOCCQGM8y/zQ+O3Gc8y8rewJjQQWjGCwK33kgowsK3OL7ZODsKdCeRgGIvJDwGq7Y
	4w7dNp1iHJyhNCmeNIVufu9ZM0uD8PJIm7yoCMbxpEpvyfuqZvvuAJRfmCQfKZFglIVs+RASua0l5
	Nfqj6XdMnAnrmiVuiqmd+Dv/BTTUCz/NMvH0gOhfkk2cbTUYcHmyMEpQfNandGs7wokq9cd2eQZnE
	b+d7TwbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu2Si-0000000FWP2-1WpR;
	Wed, 12 Aug 2026 06:29:16 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu2Sg-0000000FWOP-3AEz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 06:29:15 +0000
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786516148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7GaqLnSbBrIEhdw7ERwjg1ICgmS4Mg1QhxztBP8zNGQ=;
	b=dVJCNhGRy5PI14/WAZq7Bb9TeBkNhcfN1v0FIuCSbTS77WtewzHb7zlRubHEiDY0f6sLVS
	DC/LCso3+6i3uxZDYb/ISyjulBGGkEpX/Lmn/AwxMFVt/BAGOSeJf74Pf8GRZwxuu1tTKi
	Il7CbmTm0Lz2w9hll5Xad950ERRRzuAFfgCZ1ON/OTg5SKfZsuxxHzDw+VMtzJaVfTsqlq
	FlX4KXeIdjfyd0qsWIK+1FyCYAqGjYTQgz2LE5T1pO5DPBwKlORGPy0vDEED0A6QTXofDq
	uPlIp+c1AucTXUZCv9NLQUhEZjpaq7uvheVWpiotp8Fhx2cJ/OawbXhh4XiYqA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786516148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7GaqLnSbBrIEhdw7ERwjg1ICgmS4Mg1QhxztBP8zNGQ=;
	b=OpttTfp0RHCqBCkO3e6XCeWzoo+tzhuW9e2EJSplyFYckpbifC6wsNRSERkuuQETA8ePoA
	XpbA0Aep2q9Iy/DA==
Date: Wed, 12 Aug 2026 08:28:57 +0200
Subject: [PATCH net-next] net: stmmac: stm32: Set TSO/TBS Tx queues default
 settings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-stm32mp2_txtime-v1-1-f9e2462cc85d@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAKgSfGoC/yWMUQrCMBAFr1L220ASIbReRURs+qorJJbsKoHSu
 zfq5zDMrCQoDKFTt1LBh4VfuYE7dBQft3yH4akxeeuD7Z0zouno0+KvWpUTTBjnAdbFIfSgVi0
 FM9ff8UwZajKq0uVv5D0+EfU7pG3bATJ5BV19AAAA
X-Change-ID: 20260811-stm32mp2_txtime-6bf9e01c968e
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, Kurt Kanzenbach <kurt@linutronix.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290; i=kurt@linutronix.de;
 h=from:subject:message-id; bh=6bijNBhw3aiffq9wLuwoxzUhFfX+Pj76uZzim767l9I=;
 b=owEBbQKS/ZANAwAKAcGT0fKqRnOCAcsmYgBqfBK050VvGZByWEuk5r4XnRppzVePJljR44eKB
 XfXoMwKsGWJAjMEAAEKAB0WIQS8ub+yyMN909/bWZLBk9HyqkZzggUCanwStAAKCRDBk9HyqkZz
 ghzxD/48XbfLYKwUibZn/F6uNLcpUJjJLDQ+FYEGF37bSCUs0jVKo15GQwwWPFZszeZeCz0w5gU
 NOgPH/qzbfq5r6eG4FMfXrJ74Iuvwd315Tc6jVOaeOj1gZbSDIWPCKM9odz3UNNoxHf/Q8WsOan
 Z0JuIyM4Rg/IKboP1zwbITT87ugY03KX5cjrW1ySkKWHLhCN+59fONrpb4fQ5mW5dfMZ9Z76oYg
 BR54KOhiRpbNHZLOo2bX8bE0ADBXXXK68pyEkEpm7MTqHsS6x0nTHr+MnT8HCO1LbNbwPL4Jvek
 k1yn2fEgpzd3ZvpwIWVxd4fbRqZ9b2Y+FodwP0SR6t8QPQgqFl6cJ5ZJU6l0du6JTsOMjTqKQYc
 fxo80jscYqzuDr94kMv4Scbtb/y8OPwV0v1pyBbP1A/3HAVxTfIKTGy01s7hk1lwXtjfW8mSRc/
 EQlfEKYZaCs9nif5aYVPFyZiGzFPpPItAyZuZQfk5qiEnOLuL/rkaoQAW+QKQ+fP3tQzd2otgeG
 aZ4T+JQPGqWlKiYydoCvAocXQoNolK8alSjy3olG52F9t8T1V5lDZsCMyb7+QaPW/OPnI0HgE1B
 rj6b2NP5huR2YMaj1ccuJj4o1lmqLVUmLPUmiiQsbpo4Phc4woh9Ut1kqlN3cajJV6o27GJypxq
 4Z+p8HGF58V3IPw==
X-Developer-Key: i=kurt@linutronix.de; a=openpgp;
 fpr=BCB9BFB2C8C37DD3DFDB5992C193D1F2AA467382
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_232914_961225_47E392A2 
X-CRM114-Status: UNSURE (   9.15  )
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

TSO and TBS cannot coexist. Use the first queue with TSO and the rest for
TBS. Tx queues with TBS can support etf qdisc hw offload. This is done
similar to dwmac-imx and dwmac-intel.

Tested on stm32mp257f-dk with AF_XDP and Tx Launch Time on queue 1.

Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index e1b260ed4790..8e15094eeab9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -557,6 +557,12 @@ static int stm32_dwmac_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/* Default TX Q0 to use TSO and rest TXQ for TBS */
+	if (dwmac->ops->is_mp2) {
+		for (int i = 1; i < plat_dat->tx_queues_to_use; i++)
+			plat_dat->tx_queues_cfg[i].tbs_en = 1;
+	}
+
 	plat_dat->flags |= STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP;
 	plat_dat->bsp_priv = dwmac;
 	plat_dat->suspend = stm32_dwmac_suspend;

---
base-commit: ac155a26750a595703e7dadff84735456d75a479
change-id: 20260811-stm32mp2_txtime-6bf9e01c968e

Best regards,
--  
Kurt Kanzenbach <kurt@linutronix.de>


