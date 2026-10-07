Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078F4CA6002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 18:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xdjR4cIqCHUalaWjA8soq/724MM3zNfgUxqkTZB9L0=; b=kN+QdaXohDwD5R1IW52LmyxVqh
	W0VtICstnDcwsta6LEFjc9Gf6zoMxU0ka3OdCVIghCU064vZvafA5c36xuoh3mniZiQDuQol9uMZJ
	/qRVKWChkzIFUyP+ApS0Hsz3mVIteEjbL0A6i0nnCwdu5/UFFHv1pE8KVZjDuulFhUYf/jd+FYkJp
	9CNM2qbpaMOYD7D1SMlyCzlLs3irPbKBHJDiMd+4i+CvBTARPHjcBE+Rg6Ey6Y8MoqRJ6b632SBtA
	AmV3ijpOfMT9PhKLkDtWNrPurUa9y7YPnUC5vTf6pRnXb7E+SQNTMuD35w/RbH9eJ+hsRRV2f2BTQ
	wUbi2Wsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEWOj-00000002wuH-1vkX;
	Wed, 07 Oct 2026 18:29:49 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEWOd-00000002wsG-2tGI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 18:29:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7A38BA0EC1;
	Wed,  7 Oct 2026 20:29:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1791397778; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6xdjR4cIqCHUalaWjA8soq/724MM3zNfgUxqkTZB9L0=;
	b=mUu1OA0bVsQB0Nr20IUq4JJQ/eDF6KI5F+miE8dM3w1NlglPiK4PGIfwiNdNbhttbJwjag
	eRfz3sUgD5PQfyCeLqHcZY3RUBCuA9kVNlAH91sxfbNNPCAXB+rKM/wl/RIh43mARbziJ1
	udke/3gOtdFk3+LyfKtRRW+bu7nVz0QfF92OCYuk9+IKKwh+G6pqy2weX/UN7DFg3ceirE
	q8drULbl/kFwDvMwSIEAMywAA3wNqnV1eRok9zEUQAexqiaJNqYOdo2CZpE7sygN1F25tP
	h53hokc0S0Z0CeRR8UgadSxa2AJz9Bf0FlOAM1tUQEbadBAVf3GfJB2LWFFUbA==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Wed, 07 Oct 2026 20:29:22 +0200
Subject: [PATCH net-next 1/3] net: selftests: use skb_share_check() in the
 loopback receive hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-nb-net-selftest-shared-net-v1-1-458369bfa1ba@tipi-net.de>
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
X-CRM114-CacheID: sfid-20261007_112944_440819_7816CC4F 
X-CRM114-Status: GOOD (  10.31  )
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

Fixes: 3e1e58d64c3d ("net: add generic selftest support")
Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 net/core/selftests.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/selftests.c b/net/core/selftests.c
index 36b949ae520b..80029a67b2d2 100644
--- a/net/core/selftests.c
+++ b/net/core/selftests.c
@@ -170,7 +170,7 @@ static int net_test_loopback_validate(struct sk_buff *skb,
 	struct tcphdr *thdr;
 	struct iphdr *ihdr;
 
-	skb = skb_unshare(skb, GFP_ATOMIC);
+	skb = skb_share_check(skb, GFP_ATOMIC);
 	if (!skb)
 		goto out;
 

-- 
2.53.0


