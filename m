Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65390CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 18:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vwzImBllyc3KkMfgkhrOwCBUwVrLqdZ+ruuZlAUn4g=; b=f9Bp12xvPei2YFvtU1xQHBPtG3
	vwSqLt0MG1XE9VTdI65H0dayH3Bj/AhuFa3JDKMUZXYCWZREH4QrAuctO9i0lmv/dhD5/7TsFMvFQ
	tzMq6wo+3TgxkKYvVE4Ebpnjr0PCatwPAupE1R2I3rbJED+gUEnMcA0m/8W3VwcYKag/nwI9P/fsw
	glyAj9HT9mVVBt9nIwRZipijqd8UgR701hXZqnVssmldoJeYmSOqVULrOpq9RPhc6IoWpB3l+/kOf
	czGwEiqd62ka8DhbJI+VcKSlObmmt7v4QE/dYjm5/8GmZ7zgfiBxP0VY5MRnWXX9pzbiB9PAyG6WV
	LUmrjcZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEWOj-00000002wui-3XpM;
	Wed, 07 Oct 2026 18:29:49 +0000
Received: from mail.tipi-net.de ([194.13.80.246])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEWOe-00000002wsN-3q8G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 18:29:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2101EA154E;
	Wed,  7 Oct 2026 20:29:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1791397783; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+vwzImBllyc3KkMfgkhrOwCBUwVrLqdZ+ruuZlAUn4g=;
	b=LwzuGWoNsgTkxuu+VoKQ2EDZKSS4AXl1JK/uAQ7DmkdAgXNErOy9H2t1+mSO6fqWGwzesb
	hlfHio3Lolq8R69IG/jBZEAF8jgRHBktf1HHA31KxMti4X+vyc+3arr2OmYKrfRB3/iM5I
	Gh+Y1j3gRBrbWuaPf64nqp5XInEiYy/7eK0sUVkNkIJPz9MLspsQCj2sDOm4V0CLUV732N
	YiyLxnvWcLLlN67YRiHSbRyReJnAH5fZESJcandycRY63SKtPl1C9r2ECzvU6WVJ3aDf9g
	f0t6PoCh+T4CHtcBTmHU+vsBHpsLeCIdk30ZuSqAV/7XnH6UXI96+nY0BMIh6g==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Wed, 07 Oct 2026 20:29:24 +0200
Subject: [PATCH net-next 3/3] net/mlx5e: use skb_share_check() in the
 loopback selftest hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-nb-net-selftest-shared-net-v1-3-458369bfa1ba@tipi-net.de>
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
X-CRM114-CacheID: sfid-20261007_112945_244539_9C1A0B75 
X-CRM114-Status: UNSURE (   8.83  )
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

The loopback hook gets a shared skb when another ETH_P_IP handler is
bound to the device. skb_linearize() on a non-linear frame then hits
BUG_ON(skb_shared()).

Call skb_share_check() before linearizing the skb.

Fixes: 95b9606b15bb ("net/mlx5: Extend Ethtool loopback selftest to support non-linear SKB")
Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 drivers/net/ethernet/mellanox/mlx5/core/en_selftest.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_selftest.c b/drivers/net/ethernet/mellanox/mlx5/core/en_selftest.c
index 1dcdb86690bb..8eb9a9469549 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_selftest.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_selftest.c
@@ -166,6 +166,10 @@ mlx5e_test_loopback_validate(struct sk_buff *skb,
 	struct udphdr *udph;
 	struct iphdr *iph;
 
+	skb = skb_share_check(skb, GFP_ATOMIC);
+	if (!skb)
+		goto out;
+
 	if (skb_linearize(skb))
 		goto out;
 

-- 
2.53.0


