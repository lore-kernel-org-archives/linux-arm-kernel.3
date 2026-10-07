Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0A7CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 18:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mpp+rwnsNyKfxHdHUlAB8nvSuXAVIMHmY8/y4443xPI=; b=ogcPNFWGFoYukf/x6jqgPOfAi2
	LaUD/VcSW7qd6glHwkaxHbNMq6haNfQxpK7vrSpsSUdJBgzcNuIZtKL6dwskVLturFaDzqPt9bBrg
	6P4yDy/epymlQImLei8iKsWIoxngEcx3wrGm/WsN+pCLHYGtKrJjqqKHgDJTY+8t+fbO7qjziPbW4
	gkSC1XyUubbWgXEvqIYAw506yYaqr2ylxCCxbby00PBiyC7IT34aSnhnM9mlET0FX0pZ7n5Ze1Ff9
	4utMCz5BBnTtKVil6Q1cvZNFMd9KdbKSF/xipP/fR0rfHxPPn9L9Kiw/fhahHsBT8Cg8zqVMtw2uI
	O7R7Rt4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEWOj-00000002wuX-2iMQ;
	Wed, 07 Oct 2026 18:29:49 +0000
Received: from mail.tipi-net.de ([194.13.80.246])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEWOe-00000002wsM-3jBF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 18:29:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4EC5A154D;
	Wed,  7 Oct 2026 20:29:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1791397780; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Mpp+rwnsNyKfxHdHUlAB8nvSuXAVIMHmY8/y4443xPI=;
	b=doV851CbkIgU/9FY1AehSM+L+Mv7bINiYDMomw8Ltq8sN+80RWajOMQTojDScGN6Ny+Qmf
	AXcMJyoO6dHh6hvsN5IjvVZ/SnXrC2K73CfwigpQhfK4UE2GZXhv9nQplOogwP5b4aAofz
	Iun6OocKTMBuQQUfYlFVrqYyZg8Jzw6QnRxvZ5VWWRXdOs8jqr7YS3t84ICnNffECh6pEz
	T0qPZNy7nMlB8aU8KbFOZ878kIitGZQ1zutkiqG9mB+MJ551XnkGQcyZYnbscVYgXGIDnQ
	0iLhyPJtEBBhmuGr9pdsaoMmkG7k+d930mP2N2IheFIydxjJfQtKuw5exh11dw==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Wed, 07 Oct 2026 20:29:23 +0200
Subject: [PATCH net-next 2/3] net: stmmac: selftests: use skb_share_check()
 in the loopback receive hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-nb-net-selftest-shared-net-v1-2-458369bfa1ba@tipi-net.de>
References: <20261007-nb-net-selftest-shared-net-v1-0-458369bfa1ba@tipi-net.de>
In-Reply-To: <20261007-nb-net-selftest-shared-net-v1-0-458369bfa1ba@tipi-net.de>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <Jose.Abreu@synopsys.com>, Saeed Mahameed <saeedm@nvidia.com>, 
 Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, 
 Leon Romanovsky <leon@kernel.org>, Dragos Tatulea <dtatulea@nvidia.com>, 
 Alexei Lazar <alazar@nvidia.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org, 
 Nicolai Buchwitz <nb@tipi-net.de>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_112945_232050_29CC0CEB 
X-CRM114-Status: GOOD (  10.13  )
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

The loopback hook gets a shared skb when another ETH_P_IP handler is
bound to the device. skb_unshare() does not unshare it, so
skb_linearize() on a non-linear frame hits BUG_ON(skb_shared()).

Use skb_share_check() instead.

Fixes: 091810dbded9 ("net: stmmac: Introduce selftests support")
Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index 6097f312fce4..c910675a9d9b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -244,7 +244,7 @@ static int stmmac_test_loopback_validate(struct sk_buff *skb,
 	struct tcphdr *thdr;
 	struct iphdr *ihdr;
 
-	skb = skb_unshare(skb, GFP_ATOMIC);
+	skb = skb_share_check(skb, GFP_ATOMIC);
 	if (!skb)
 		goto out;
 

-- 
2.53.0


