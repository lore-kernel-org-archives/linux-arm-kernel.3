Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34FDCA6004
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 02:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6416T0r2C8uo23gUqa11GtkyI4w0JCXupvvSe9G6koA=; b=Fq1U+P0NyfQKY7O3mBB9mkmnO0
	kFcVCVhOQZ01BZhewS41FaFdWgxDGTuziZ4E1heVhh1yUUHBon3Ghr+TsQHl03L5FF1hQhbTJdNWy
	+IdVNTeik/jzxvIyjelZDZ7bbMNH5UoqRHrZLg91kuwGdEwewx5GeWFSBy7gyrdF2I6QAG0COubwL
	JFzZYscu3edqf4YBUsjNAVas0D0gvsWtTktA2Xlc/h1jQkYjaVik1B4tl6SQfjT4qb5WOv7pTuF4O
	t2cUvdIJZ51L3HjcQ1uERlKUKVGUuh6lmXgZqWnAqns5mzoeCMxdlmPvyBfsHe70QGkKDhXEL4OaZ
	jsW1kqew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEdso-00000003OdR-2os2;
	Thu, 08 Oct 2026 02:29:22 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEdsm-00000003Ocj-1Q46
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 02:29:21 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2e608cd460eso9137175ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 19:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791426559; x=1792031359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6416T0r2C8uo23gUqa11GtkyI4w0JCXupvvSe9G6koA=;
        b=a59898T5eN+kdNwIGEegxFuPFOaAjSiXe0dGnDESLKAshHjXrL2M54uENCZD61eizx
         ZRAge2sl4Or7dQiLFSnZn+0yy7UN/WJbXf5fP14YZ8a0Pn3AwZFzhTEbNse7qn9blCou
         2uIKj460xF4WYMInKYckbMncrz23GONgaHN58m8HRWWa0NOBJrqyNxficmfNhKDR9S9e
         /J+wIBcV0wxl9ykXYXTAWSGx9nMDiXmFXyU5BFcL0R7IrhjNAbqhbSzLcJzXjcGOZfOP
         Znkyj3zNf+K+tFVe8C4ir+hQY4UYjYBF4I5I/8u1dU/GkFpWZjNba1ASeEBnrJkcDZYh
         lAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791426559; x=1792031359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6416T0r2C8uo23gUqa11GtkyI4w0JCXupvvSe9G6koA=;
        b=sqIhMscXiwDq0eDsKfhUFnK7jWXX2PwqQqTJb1s9Bg6OYc2otLWKgWKUcUMXZIFEKH
         pMCmBdVwGy2tkwd1uSarCjS6XkRPFxZnBDCN8LPgsPVrazkwRjOjWEnBqEunAQL1GMJX
         2iLwaqvFS46uhS+Bo7m/5xKjYJeubV+zORT1m/LhDilZsuJgdUX236e3eSmmJfPSurHL
         LbnSsWPttme6fXZsqGoel9wG7SJy0cMskBsXo9Ut+wSuDMRpjEzqyJk4TMI/2cBjDwIs
         Jbky+maaWj1ZE5kcD2K6fl96MVU/U1ihWiyLaKl5yLMO7/BtMaxGyl/RXWY2HqLNxjJQ
         LH7w==
X-Forwarded-Encrypted: i=1; AKwUvBxJ0FYk0CK5BoPd3rJWrNFBgXzSiJeYw6mltmtgpHqOgU3VggiABv8ICwBFiLii2xQkM4s1k6Zk3vZlxs5TZhd9@lists.infradead.org
X-Gm-Message-State: AFq9FYKcQaFh+gzyPCsBo8g3jM4eDDmwUJbujdAOmFltS/GKjLjcpN4l
	etIRGJZ0F7usO8ZCiV1UlclLiGQ+GHwwDCZE1oHKzOFirL7+HoLhP4lZ
X-Gm-Gg: AYBFou32c4cCGJCcusbKZ8VNMRTrgd5jqVenMA7NTLY1oJbXidnA4A0XLJ1bvfr/suA
	saMQFEJsxc9jO850CbjllFlP4UDqr2AzMozGRLaEd2dYiMeIr2Jom1eMGu5JaMlODW+RKmJtLP+
	67Ng1TLmvgLikK5UQwL/fshP9KWOrstGM/fBeBNutMuVL0+sR6VEr2KesYPchEiTIUqwsMzsMG+
	jvnYfuJmcVfYi0Y9ynQicQfWi+BxobzDr1SDeY/mg/8AYILNEn2sapc/O8Q1EuxKOW4eOX9ZT1s
	rgQJ9UFAnQkT2QY87PqO17+c8qeysjqR2V9jr1tcEkVKwXShZ+I6LIy3xA8gWx77Gg5iZjcS5e4
	HipOHYptNBXx2icEVKune82iNViIIsZuLnPoDSq6MvJPbqrYjLBErVZhkcr6V8LscXBv+HBzD1A
	l4fvfTntnc4wLZ9Sc1sW5yQci/PI+Xdxjtc8Ppj0+SEhkb/QqP9Hn3oWjlTPWkUp27Bpd1MDIYe
	DB48vCdCZ2J3a3nq84/Naw2gQ==
X-Received: by 2002:a17:903:388f:b0:2df:69e3:7395 with SMTP id d9443c01a7336-2e60036c465mr33848495ad.18.1791426559405;
        Wed, 07 Oct 2026 19:29:19 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60482cab0sm18045865ad.50.2026.10.07.19.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 19:29:18 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	MD Danish Anwar <danishanwar@ti.com>,
	Parvathi Pudi <parvathi@couthit.com>,
	Roger Quadros <rogerq@kernel.org>,
	Mohan Reddy Putluru <pmohan@couthit.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 09/10] net: ti: icssm-prueth: Move setting of netops to fix crash
Date: Thu,  8 Oct 2026 10:26:51 +0800
Message-ID: <20261008022656.3592191-10-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261008022656.3592191-1-mmyangfl@gmail.com>
References: <20261008022656.3592191-1-mmyangfl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_192920_377789_F72FED8F 
X-CRM114-Status: GOOD (  12.77  )
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

icssm_prueth_netdev_init() calls of_phy_get_and_connect() before
ndev->netdev_ops is assigned. phy_attach_direct() ->
phy_link_topo_add_phy() reads dev->netdev_ops through
netdev_need_ops_lock() since the commit in question, so probing crashes
with a NULL pointer dereference when CONFIG_NET_SHAPER is enabled.

Assign netdev_ops before the PHY attach, as was done for emac in commit
7c9f391ec89c ("net: emac: move setting of netops to fix crash").

Fixes: ded86da4bbb7 ("net: ethtool: relax ethnl_req_get_phydev() locking assertion")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/ti/icssm/icssm_prueth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
index b7e94244355a..b42c98e861e0 100644
--- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
+++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
@@ -1563,6 +1563,8 @@ static int icssm_prueth_netdev_init(struct prueth *prueth,
 	}
 	ether_addr_copy(emac->mac_addr, ndev->dev_addr);
 
+	ndev->netdev_ops = &emac_netdev_ops;
+
 	/* connect PHY */
 	emac->phydev = of_phy_get_and_connect(ndev, eth_node,
 					      icssm_emac_adjust_link);
@@ -1590,7 +1592,6 @@ static int icssm_prueth_netdev_init(struct prueth *prueth,
 	}
 
 	ndev->dev.of_node = eth_node;
-	ndev->netdev_ops = &emac_netdev_ops;
 
 	netif_napi_add(ndev, &emac->napi, icssm_emac_napi_poll);
 
-- 
2.53.0


