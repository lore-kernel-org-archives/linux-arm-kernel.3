Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23ABCA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 14:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dP1eeIRdgAKrNInxQcJ7Mw+F+kiwB9f8L/y86StvccQ=; b=C7IqKYGYwdjMvPUyXGVVfZqGAn
	JF0wQUVuFVNYTORUCaVH0s8YzWbxuu51u1MolJscF4zi4qLS9N0232zAYurgBPPz234DuiPJYQgp2
	p9+nPtxjQ2sQYQJApQ+ijn4E6AMipEYF1qhf7rPCbzzLLHRyug5JCq0g7oiAuDpqRVqQOGBAR14yX
	7YFJJw90pQmSsRPrLxXrQ4E7U2oEtogRv+IdAph1xRLLIedVL1gplJbPgXiawa1jXh982LAJiinjS
	OsT/EULz6idwdy7ebuSCcSaJYM5NCkVVA1QiwCqpioT+vqy5ypCgXOIV0CqGSMLTq+Wb2B/s3sY1x
	2s18DDYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCeFZ-0000000Bm5R-3PPP;
	Fri, 02 Oct 2026 14:28:37 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCeFV-0000000Bm30-3f1Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 14:28:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A0E8F4E4110E;
	Fri,  2 Oct 2026 14:28:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 75730603DC;
	Fri,  2 Oct 2026 14:28:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3EABC103281DB;
	Fri,  2 Oct 2026 16:28:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790951309; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=dP1eeIRdgAKrNInxQcJ7Mw+F+kiwB9f8L/y86StvccQ=;
	b=uhePkbQpdN5JkCW9kBo+watSBdXekjsklNW4QG0QPPUfyemg54kHCyI56uuSl3vcKzFXUq
	LMafXsTShZpKv0tCv1TGGY5H7dFZ1ylU7kZLbz170BUFWdbu42UBZ1uXFU5tBDgFPYEvsh
	j8SouckInuHxpI875eR1fb6t7Elt/vUN1vuEUedNVm/EEQkqO8VemFqi5Gbk7l8yZJcgSX
	qZ4jzQPSWTFS5tIWGRUwe4+tq2XoSQXQzR182Yqugl8dHkRl2tDBKWuy3v+38nqINQkxLl
	qY88wNUaf2RH94zn/6YG3PXx5OCl0fRInZ38qlunSDfC7Pg1/UE2Nnd9WmhiUg==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Peter Robinson <pbrobinson@gmail.com>,
	Joe Damato <joe@dama.to>
Subject: [PATCH net-next v3 3/3] net: stmmac: Don't set or get RSS parameters when not supported
Date: Fri,  2 Oct 2026 16:28:03 +0200
Message-ID: <20261002142806.1299041-4-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002142806.1299041-1-maxime.chevallier@bootlin.com>
References: <20261002142806.1299041-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_072834_076496_254598DE 
X-CRM114-Status: GOOD (  10.14  )
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

The RSS kselftests fail on stmmac, and this is partly due to the driver
reporting bogus data for the RSS ops :

 - ethtool -x reports an indirection table and a key while the hardware
   doesn't have any of that
 - ethtool -X fails with -EINVAL.

Return a 0 indir size and key size when rss isn't supported, effectively
meaning we don't support RSS here.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 1cf0f8820b33..7f2a70575b83 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -927,6 +927,9 @@ static u32 stmmac_get_rxfh_key_size(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 
+	if (!stmmac_rss_is_supported(priv))
+		return 0;
+
 	return sizeof(priv->rss.key);
 }
 
@@ -934,6 +937,9 @@ static u32 stmmac_get_rxfh_indir_size(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 
+	if (!stmmac_rss_is_supported(priv))
+		return 0;
+
 	return ARRAY_SIZE(priv->rss.table);
 }
 
-- 
2.55.0


