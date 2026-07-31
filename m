Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F1AC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 15:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4lJnn4e7C9hE6wEWtqXYdtrs6SZibcqzJoHLR3d96n8=; b=m7L2xm++jftsBG9c5sLAT0n0eE
	KWh1B29BHXril2D2jYV6uY7R1nh+/gK5zdd/gBlfaWLzdEC+8/zqTZjxRPpwMnuDURUz3aDIge1Gt
	LJoxXHSBO42PXRY32O6D6zNjxD2LEWhFCEeQd997mKNBFQ0T8VcNkLDM/RuyDVgxalBHh043UwwUb
	2QCjT7lIKyMLVqUcTybyVxOMQWV8RYy+OMNwffHbBvffAEY5QORxWhi5TxPbmcYWSqq9ar3eOiLXy
	MSx5qSsAk7uMjvfIpcdfeEj11ZWzWUHJj3q5Cl17xan8GBbpV/ebWMLKblLxLY8SCqpwrJfnPLYno
	MBG7EWyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppSz-0000000Cvdy-0OTI;
	Fri, 31 Jul 2026 15:48:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppSy-0000000Cvdp-0Ww4;
	Fri, 31 Jul 2026 15:48:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 25F856004E;
	Fri, 31 Jul 2026 15:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5989B1F000E9;
	Fri, 31 Jul 2026 15:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785512886;
	bh=4lJnn4e7C9hE6wEWtqXYdtrs6SZibcqzJoHLR3d96n8=;
	h=From:Date:Subject:To:Cc;
	b=nnoasHzsDdLvEN2QpeRX1ph5kHse9vG8b5v0LLU9Pgf+Jij8GtrLXweeDr0HICtJ5
	 cMDJZHdbE0vlsdQRmKbergVjSarNn3ymSq7iG64hsibhPaY/usqwMhE77E+QlWhjrx
	 RNuf0VS0RWAJMTybz8zNMcoHVOpGsCnUuwZPsEp209gn25zqw+91vdD2jMkvrS/WNM
	 +3XQhojPT0nWmtDo0CHtqudif05HiW35HoIVSAUFNT9ih1q4RrOiJvMd+4jHY95tUG
	 +XdDWuZMArvbjWOEpFzw0pVq1ibZX+3Ipx1mMljhIBadglr6hb0p+U1II4sQ85F7Fm
	 0aeNbqh5flXSw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 31 Jul 2026 17:47:38 +0200
Subject: [PATCH net-next] net: airoha: fix ARRAY_SIZE() division by zero on
 UP builds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-airoha-spinlock-array-fix-v1-1-863a7e239a5f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqDQAwAvyI5N+CuUm2/UjzENdagZCUrxSL+3
 cXjDMwckNiEE7yLA4x/kiRqBvcoIEykX0YZMoMv/bNsKockFifCtIouMcxIZvTHUXYcfPUam7Z
 2oW8h96tx1vf7A8obKu8bdOd5ARE5m6x1AAAA
X-Change-ID: 20260731-airoha-spinlock-array-fix-d239f7841cb8
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Simon Horman <horms@kernel.org>, 
 Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 llvm@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>, 
 kernel test robot <lkp@intel.com>, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3
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

airoha_alloc_gdm_device() initializes the txq_lock[] array iterating
over ARRAY_SIZE(dev->txq_lock). ARRAY_SIZE() expands to
sizeof(dev->txq_lock) / sizeof((dev->txq_lock)[0]), but on UP builds
(CONFIG_SMP unset, CONFIG_DEBUG_SPINLOCK unset) arch_spinlock_t is an
empty struct, so sizeof(spinlock_t) is zero and the expression is a
compile-time division by zero (undefined behavior), reported by clang
as "division by zero is undefined [-Wdivision-by-zero]".

Since the array is statically sized with AIROHA_NUM_NETDEV_TX_RINGS,
use the named constant as loop bound instead of ARRAY_SIZE().

Fixes: 78a35725e533 ("net: airoha: defer GDM3/GDM4 WAN mode and GDM2 loopback to QoS offload")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202607311850.6p0ZUVq4-lkp@intel.com/
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index dba7c52c0896..64619e9a704d 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -3467,7 +3467,7 @@ static int airoha_alloc_gdm_device(struct airoha_eth *eth,
 	netdev->dev.of_node = of_node_get(np);
 	dev = netdev_priv(netdev);
 	u64_stats_init(&dev->stats.syncp);
-	for (i = 0; i < ARRAY_SIZE(dev->txq_lock); i++)
+	for (i = 0; i < AIROHA_NUM_NETDEV_TX_RINGS; i++)
 		spin_lock_init(&dev->txq_lock[i]);
 	dev->port = port;
 	dev->eth = eth;

---
base-commit: 2fbade66245059c78daeaccfce13ecf499fffb51
change-id: 20260731-airoha-spinlock-array-fix-d239f7841cb8

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


