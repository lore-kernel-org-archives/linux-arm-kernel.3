Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044C4C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jyQcQVEYc4YcgbrTjUYsZd7Ll8XlgXUrnGVBuSQPQao=; b=FRLEnt0pEjIeLVQMRJ++zS8yDB
	VkU3pRlcmJ5QFGAmLxpc7UYrAFz3OIhS1699S3dKC4xH05+LIRl8VpZfepf2ylMSiHoynhMZ9ia+d
	Jd1uTPvdctckEHk/N/b4BmoTf7KhDOWRhTdWozWUQ+GjPGU2qcYkV1ALDNT0S/Xkq60CiPqnNbnGj
	ZivfvFev93YkyLS0JbkDl4uxRo9/oX072N+vJUMzkPOwqKM63b4lO76wUSzUr6HCnmBAL5w0AuGCd
	jQg6mX7wjsUhoNchbUYkAXaq8CptoE0XYxZ7VvkCx4FhvEiZbID2NjzDHi/SddXH7gTEZCEGxwP/i
	pg9Zv/Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokBv-00000005kUl-2Tvo;
	Tue, 28 Jul 2026 15:58:03 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokBo-00000005kRZ-3hLd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:57:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9CC691A12D2;
	Tue, 28 Jul 2026 15:57:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 70953601BF;
	Tue, 28 Jul 2026 15:57:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC7BB11C142E5;
	Tue, 28 Jul 2026 17:57:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785254269; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=jyQcQVEYc4YcgbrTjUYsZd7Ll8XlgXUrnGVBuSQPQao=;
	b=Hu9xi964mhyQM3RUVCc6uZl+A+ASS5/KkYbL8xFs7PqJuzs6WCNbfiS72oaMnTUBDdgh1R
	exBLVJNF92OnVWvK37jeyQpR0bmRfDEutzJlLmkNRRw2QwnG5MVlYBRm649WR6hpzVBf/Z
	72k9BaafvbJKoL2VPPXKdt49y9KJ1HTBKPaPEFTbe0U0bn6jfvjCRnOnj1ps7WQfklH7/g
	Sd3dL67DTjte/jQUz2veH0Zzh3nhiuyg+O7mziJIeccJIh+m6BQjBQTMsScPKNcF4EY20G
	L85RLwyXHiWogUR2/22L9AjoWKdDDcjsQrtk213+eMRu/VJ8xddwx93C+BFJ0g==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Zxyan Zhu <zxyan0222@gmail.com>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net-next 2/2] net: stmmac: Don't rely on the PHY for flow-control testing
Date: Tue, 28 Jul 2026 17:57:27 +0200
Message-ID: <20260728155728.1193169-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728155728.1193169-1-maxime.chevallier@bootlin.com>
References: <20260728155728.1193169-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_085757_087055_252215A0 
X-CRM114-Status: GOOD (  12.05  )
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

For flow-control testing in loopback mode, we don't need to ask what the
PHY is currently using as pause/asym settings. The PHY is no longer
involved in selftest, we rely strictly on MAC loopback. We therefore
only need to know if the MAC supports Symmetric pause for the test, as
we exercise both TX and RX pause support in the selftest.

Remove phydev requirement for flowcontrol selftest as well as the
AsymPause requirement.

With that, we can also drop the linux/phy.h include.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index c0e5dee86451..1df26c217f9a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -11,7 +11,6 @@
 #include <linux/crc32.h>
 #include <linux/ethtool.h>
 #include <linux/ip.h>
-#include <linux/phy.h>
 #include <linux/udp.h>
 #include <net/pkt_cls.h>
 #include <net/pkt_sched.h>
@@ -716,13 +715,13 @@ static int stmmac_test_flowctrl_validate(struct sk_buff *skb,
 static int stmmac_test_flowctrl(struct stmmac_priv *priv)
 {
 	unsigned char paddr[ETH_ALEN] = {0x01, 0x80, 0xC2, 0x00, 0x00, 0x01};
-	struct phy_device *phydev = priv->dev->phydev;
 	u32 rx_cnt = priv->plat->rx_queues_to_use;
+	struct mac_device_info *mac = priv->hw;
 	struct stmmac_test_priv *tpriv;
 	unsigned int pkt_count;
 	int i, ret = 0;
 
-	if (!phydev || (!phydev->pause && !phydev->asym_pause))
+	if (!(mac->link.caps & MAC_SYM_PAUSE))
 		return -EOPNOTSUPP;
 
 	tpriv = kzalloc_obj(*tpriv);
-- 
2.55.0


