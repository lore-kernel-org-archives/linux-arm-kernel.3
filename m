Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6566CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 10:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHVnsSy8bd4MBHdkXAoKW/zEg8SUtl8twOZfbMKVdIg=; b=v9ssRWjNPgeoZQVYScN2+VIZku
	eDkodz7MYoJofJQ0M/ZbudyJ2wOrHeuesGQND+nwB2EtVGIcQMeABK3D0jDu9EWyT7eJGn7D/Wycj
	FhBVC6oT40mcNW8BvNSupCbrvNB69kzGy6diU1u6HdWRa5gE+XEotwgmdAJ170UqXAG0YZnrqYl13
	y1ZT7UzUf2k2ql7txj/F06Hc49ZdQ1Edy00ykCimKIS/w7Ow9SRP177t3DeeVZ1gdYgaBNOS85fYO
	d4b5jPJFApspT+/65KEihvkQ5uEnYgBTp1h/JE1KBN+ErFTicUnlBbwxYla/dA8tWLiwjekGMdN46
	g0vCcoQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8yjf-00000001H2w-3H1B;
	Wed, 15 Oct 2025 10:27:59 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8yjc-00000001GyM-2wwn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 10:27:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 18A0C4E410C8;
	Wed, 15 Oct 2025 10:27:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1B5E606F9;
	Wed, 15 Oct 2025 10:27:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 02430102F22B6;
	Wed, 15 Oct 2025 12:27:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760524072; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=QHVnsSy8bd4MBHdkXAoKW/zEg8SUtl8twOZfbMKVdIg=;
	b=XSBuRolCicBkNJm8OH1Xd8R5w3Q8ZF5Tt5gZJzjGi5wmyvKOA7n7zpn+oEpXRd0ZOGotmB
	zVbgUqeZYcrpTXDcm4FUe/M+ZNzceoKZV7HEdOwYruNARjNQGZ+ECPR7veLInMp/bP7sOq
	RtJHttX25uC4rB3OmIiTZyAhFWzJzxH5CIlacffkU2/cLNRu2FVqjlXOuk+Y9BbovwwYe2
	t08dlaBqLA1OkfVVGAWW/Z8oP1J1Allq4tM9ptcGExAeYN64SwQTxWz68ita3Rlw0A0Hxa
	fe21oratbSDiLL7OtW592xBPYSMqecFEnNBVx5yHkO98kdkkWR88GX3rsarHug==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	=?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/3] net: stmmac: Move subsecond increment configuration in dedicated helper
Date: Wed, 15 Oct 2025 12:27:21 +0200
Message-ID: <20251015102725.1297985-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_032756_875041_9B7ECD3D 
X-CRM114-Status: GOOD (  11.20  )
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

In preparation for fine/coarse support, let's move the subsecond increment
and addend configuration in a dedicated helper.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 48 +++++++++++--------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 650d75b73e0b..3f79b61d64b9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -463,6 +463,33 @@ static void stmmac_get_rx_hwtstamp(struct stmmac_priv *priv, struct dma_desc *p,
 	}
 }
 
+static void stmmac_update_subsecond_increment(struct stmmac_priv *priv)
+{
+	bool xmac = priv->plat->has_gmac4 || priv->plat->has_xgmac;
+	u32 sec_inc = 0;
+	u64 temp = 0;
+
+	stmmac_config_hw_tstamping(priv, priv->ptpaddr, priv->systime_flags);
+
+	/* program Sub Second Increment reg */
+	stmmac_config_sub_second_increment(priv, priv->ptpaddr,
+					   priv->plat->clk_ptp_rate,
+					   xmac, &sec_inc);
+	temp = div_u64(1000000000ULL, sec_inc);
+
+	/* Store sub second increment for later use */
+	priv->sub_second_inc = sec_inc;
+
+	/* calculate default added value:
+	 * formula is :
+	 * addend = (2^32)/freq_div_ratio;
+	 * where, freq_div_ratio = 1e9ns/sec_inc
+	 */
+	temp = (u64)(temp << 32);
+	priv->default_addend = div_u64(temp, priv->plat->clk_ptp_rate);
+	stmmac_config_addend(priv, priv->ptpaddr, priv->default_addend);
+}
+
 /**
  *  stmmac_hwtstamp_set - control hardware timestamping.
  *  @dev: device pointer.
@@ -696,10 +723,7 @@ static int stmmac_hwtstamp_get(struct net_device *dev,
 static int stmmac_init_tstamp_counter(struct stmmac_priv *priv,
 				      u32 systime_flags)
 {
-	bool xmac = priv->plat->has_gmac4 || priv->plat->has_xgmac;
 	struct timespec64 now;
-	u32 sec_inc = 0;
-	u64 temp = 0;
 
 	if (!priv->plat->clk_ptp_rate) {
 		netdev_err(priv->dev, "Invalid PTP clock rate");
@@ -709,23 +733,7 @@ static int stmmac_init_tstamp_counter(struct stmmac_priv *priv,
 	stmmac_config_hw_tstamping(priv, priv->ptpaddr, systime_flags);
 	priv->systime_flags = systime_flags;
 
-	/* program Sub Second Increment reg */
-	stmmac_config_sub_second_increment(priv, priv->ptpaddr,
-					   priv->plat->clk_ptp_rate,
-					   xmac, &sec_inc);
-	temp = div_u64(1000000000ULL, sec_inc);
-
-	/* Store sub second increment for later use */
-	priv->sub_second_inc = sec_inc;
-
-	/* calculate default added value:
-	 * formula is :
-	 * addend = (2^32)/freq_div_ratio;
-	 * where, freq_div_ratio = 1e9ns/sec_inc
-	 */
-	temp = (u64)(temp << 32);
-	priv->default_addend = div_u64(temp, priv->plat->clk_ptp_rate);
-	stmmac_config_addend(priv, priv->ptpaddr, priv->default_addend);
+	stmmac_update_subsecond_increment(priv);
 
 	/* initialize system time */
 	ktime_get_real_ts64(&now);
-- 
2.49.0


