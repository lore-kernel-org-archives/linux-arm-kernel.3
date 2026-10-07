Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B73FCA6002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 18:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SDkbcKEg56Hg163LutOTCLb1IktY/aVEl/Io7G5PV78=; b=V06/dSP9h8xgMy
	6Nix7rcHZHtkMuoVfMJySt+CTIS3XSS2zPr2cTInCKHjllC/m+pymWJNpOD00n1PRK4Wmb8xe3ZLB
	9d472oG+VoW+HVkiiHARi+nNYYsH1XzPxB34EC2yhVfpA+/pGztKBGz19lhmNF1Txklm4X+bCdYtX
	9NVmKzEAK4JQWrD/CcgxRrstvwMOnzfwbvK8bDyyC7/AEdi78d1rettpJJBVnepJXC62LnbF9Tbmi
	f0e1DFhlFMBUS52V5HZmKL5IBxwZZC/EO33o3XsdF0zJ2W5Z+y+VHDt+aQStsAMoMQ+56K744XfRR
	1zWM0Q8nVeveaVzEiibw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEWOh-00000002wth-1LPC;
	Wed, 07 Oct 2026 18:29:47 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEWOd-00000002wsE-2khb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 18:29:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A7906A05A5;
	Wed,  7 Oct 2026 20:29:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1791397776; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=SDkbcKEg56Hg163LutOTCLb1IktY/aVEl/Io7G5PV78=;
	b=uyz4eUp9ohF/ZZk0czJGYV9mwV2vkj6EBQeljHKPvD6HA+Xq8NffbjfykVavvpW7xGvAlS
	prXUHs9fygmzq0JEzpdYTKF9NOIGeyR9DDD7c9aFBqtmXfFCMQwaf81BfqPCrH4IHQXAAX
	5N+NaDGU8xnLCMtzqHSsNkR93PHDrkIBB6kEZ3E9vY/Ry8lmVg8iX9vKzF3UujXI5wi+D7
	hS+J38JK/VeQNUWZ0EHOWAheD9l/pStKfQBAWW4vMEoeM8TBSdbRfKTjXJ7od6FFkK1dbz
	0kt2cqhepQIjIadJe4Fy0vy2pf7VJEhG3ECJUlLtl3FZioIIb+I9MNAygW5+ZQ==
From: Nicolai Buchwitz <nb@tipi-net.de>
Subject: [PATCH net-next 0/3] net: use skb_share_check() in loopback
 selftest hooks
Date: Wed, 07 Oct 2026 20:29:21 +0200
Message-Id: <20261007-nb-net-selftest-shared-net-v1-0-458369bfa1ba@tipi-net.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM2wrCMBBEf6Xss4Ek4vVXpA9NMrErsko2SqH03
 03r25yZ4cykKAylazdTwZeVX9LA7TqK4yB3GE6NyVt/dNaejAQjqEbxzBXawjgUpK07+32KF4d
 0CJma4F2QedrkN1oPgqlS/1/0Ex6IdXXTsvwAFEg6IIgAAAA=
X-Change-ID: 20261007-nb-net-selftest-shared-net-823dc91ed5bf
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
X-CRM114-CacheID: sfid-20261007_112944_440843_3B68E12E 
X-CRM114-Status: UNSURE (   8.48  )
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

The loopback selftest hooks can get a shared skb when another handler
is bound to the device. Linearizing a non-linear frame then hits
BUG_ON(skb_shared()) in pskb_expand_head().

Stumbled over this on RPi CM4 (bcmgenet, with jumbo series applied +
WIP selftest patches) with a packet socket open at the same time as
running ethtool -t.

stmmac and mlx5 seem to have the same pattern, xgbe already handles
shared skbs. Patches 2 and 3 are compile tested only.

As the impact is pretty limited and doesn't seem to bother anyone in
the wild, I've chosen net-next, but kept the Fixes tags. That matches
what Paolo suggested during the LPC track.

Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
Nicolai Buchwitz (3):
      net: selftests: use skb_share_check() in the loopback receive hook
      net: stmmac: selftests: use skb_share_check() in the loopback receive hook
      net/mlx5e: use skb_share_check() in the loopback selftest hook

 drivers/net/ethernet/mellanox/mlx5/core/en_selftest.c  | 4 ++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c | 2 +-
 net/core/selftests.c                                   | 2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)
---
base-commit: 45ad84d2800e4a092fb8d96006a533b2d0ab13f6
change-id: 20261007-nb-net-selftest-shared-net-823dc91ed5bf

Best regards,
--  
Nicolai Buchwitz <nb@tipi-net.de>


