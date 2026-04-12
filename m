Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89BCE64001
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 08:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E32ka6Ina3nUMd7OiXM3vjZodFi1Ttwt14xZB74DKOU=; b=3/9xNg9NrTQ7eqcTxrexosnNed
	h4gd8k+kOPu/xJ1ai7Tjj+NcJgjP4XEausJSlOOitjPChaJFik8qeyALkrQCakgkJhVPp1mJa2RmT
	OoaL9ic04cxwMhSlhBHDEoDjclfrAtpehhdGXd7DiGZh7tYNL65OMtuOi5OhtMGDQUFM/IioeCHWQ
	TZdLwhBNxwlU/ta77bxzugWPKSxf2wY2cai9YOHZ6DE5RD/fzbiorg2v92aHfxtq5viJluw1TJy2m
	GutLjReHdxaQXZbCEQjC7gf+7unaOEvMbynjYJrdh3WzDd1gluopJ/NSKHtHDB3BjwSzPbAOdvEgr
	NJcf3HOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBptW-0000000E8sr-3GRc;
	Sun, 12 Apr 2026 08:10:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBptV-0000000E8si-2zQ7;
	Sun, 12 Apr 2026 08:10:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 290D460008;
	Sun, 12 Apr 2026 08:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5731CC19424;
	Sun, 12 Apr 2026 08:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775981411;
	bh=36H48P9hjoQUXkzENXR+4KOVxVLh08Uk+rBggeOjamo=;
	h=From:Date:Subject:To:Cc:From;
	b=fjziGkTO/dy4HMECql4anEfWbo8cHbp0IkS9s42ZvcrWSt6akH3InZQ5hmsQpP5Ut
	 W9g/lCICDlqUbWKxCtpqmCFMhgp+FDMs327ptDG3KeVQsVp5N5f3T1lG0VDU7AeO5c
	 Z6j2wvqnTRkTFHghQrRr4rOEB0Uu9TP+z1FQ/eIeA0e/rhQKA1UhFhdNzjYHK5bBKG
	 i9bpQ7YHPnwCpjJpJix4/0Oqy/ag2kKFXZ6q2gzLG+AhVbYmqF+j80jub4x3hAa3Y3
	 zfjJcK7a7WemazFtqjSUzyidz/yG3eHTRm3Kknd3jFdgZh8Vl4ESM6JHXgCcmh14RK
	 2oVtNaJOPHkKA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 12 Apr 2026 10:09:41 +0200
Subject: [PATCH net] net: airoha: Fix max TX packet length configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-airoha-fix-max-mtu-v1-1-333030d0a564@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MOwqAQAwFryKpDWgUf1cRi7BGTeEquyqCeHeDx
 RTD8N4DUYJKhC55IMilUTdvkqcJuIX9LKijOVBGVVbmhKxhWxgnvXFl4zhxal3dUOGEmMCGexD
 L/2kPXg4Y3vcDABmZzGkAAAA=
X-Change-ID: 20260412-airoha-fix-max-mtu-f9c7823ce2a2
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
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

According to the Airoha documentation, REG_GDM_LEN_CFG() register does not
include FCS length. Fix MTU configuration removing ETH_FCS_LEN from
maximum TX packet length configuration.

Fixes: 54d989d58d2ac ("net: airoha: Move min/max packet len configuration in airoha_dev_open()")
Fixes: 03b1b69f0662c ("net: airoha: Introduce airoha_dev_change_mtu callback")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index c14cdce588a7..a81ffda72b39 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1629,9 +1629,9 @@ static void airoha_update_hw_stats(struct airoha_gdm_port *port)
 
 static int airoha_dev_open(struct net_device *dev)
 {
-	int err, len = ETH_HLEN + dev->mtu + ETH_FCS_LEN;
 	struct airoha_gdm_port *port = netdev_priv(dev);
 	struct airoha_qdma *qdma = port->qdma;
+	int err, len = ETH_HLEN + dev->mtu;
 
 	netif_tx_start_all_queues(dev);
 	err = airoha_set_vip_for_gdm_port(port, true);
@@ -1833,7 +1833,7 @@ static int airoha_dev_change_mtu(struct net_device *dev, int mtu)
 {
 	struct airoha_gdm_port *port = netdev_priv(dev);
 	struct airoha_eth *eth = port->qdma->eth;
-	u32 len = ETH_HLEN + mtu + ETH_FCS_LEN;
+	u32 len = ETH_HLEN + mtu;
 
 	airoha_fe_rmw(eth, REG_GDM_LEN_CFG(port->id),
 		      GDM_LONG_LEN_MASK,

---
base-commit: 02f72964395911e7a09bb2ea2fe6f79eda4ea2c2
change-id: 20260412-airoha-fix-max-mtu-f9c7823ce2a2

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


