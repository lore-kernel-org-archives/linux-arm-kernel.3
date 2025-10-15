Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C32BCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 10:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFHqEMv9Ms4KjKDEGNbMoEMnbx63tPMi8GTPSWp0mEA=; b=GWxE8GGXPV/dnvogCgf3Y76oYZ
	dFgYCVJ22DhqWVWnAlRaayBw2Qev3QPczBJZnGAtOTrIqd+7NeE4PJcm/d1mdVvjEzGDHyZe8I+Bq
	d3hLgWoVMguEE8VON7/29jnJZ/NIe089btQwIxT3WEfYSgniVJIsVIldAjdquC8vnK5g5AvyMqZOx
	KVzQP5MTQUmqgtGCVAh9m3cjBeyDP8nFa8AakP1NH2MugO3Jg/21jXF06/BTcnu9Joj3+txuEy7kj
	pSGV7oPZj5tXtwkXKYlCRT9erKN/MBj3wB4DX2AqVHCpRhLHxYeMHQOyRxN2/uJ8zLxMEQ5TzG+sT
	gZYEn4Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8yjl-00000001H5w-0ENX;
	Wed, 15 Oct 2025 10:28:05 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8yje-00000001H0o-0rTG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 10:28:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2EF5FC09FAE;
	Wed, 15 Oct 2025 10:27:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4B668606F9;
	Wed, 15 Oct 2025 10:27:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5353E102F22CB;
	Wed, 15 Oct 2025 12:27:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760524075; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=DFHqEMv9Ms4KjKDEGNbMoEMnbx63tPMi8GTPSWp0mEA=;
	b=g/kJj2pldVwGsy3HTNK+CfxIaQftqhqjjPw9zXYU7nMDWyzmW9QuV9lGgRhbQO745GWzzz
	pWddzTodIjPOw5dtDadZu863Ejlyvx/sfeVsxSZkRreC3TwJEe7Lo92aV0zAKzp7ub5oNl
	70slry/Hx0VxdpsfVFbvBcQvx2RXvZSCy32iS4Qa39W+8v3lWln52rDqeAK8/gG29onnZf
	+Ddqcj65+/QEr39etjg54TqlsftV88y14o+F4j9HRfuMpW5JDCPskaTNN8QyQ7NkkXIAYc
	2S+hgyfpWSWbz7W5wWrndlltWfjWVRehPYBuDq3714Yn6xbWuuyC86RZonrpXA==
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
Subject: [PATCH net-next 2/3] net: stmmac: Allow supporting coarse adjustment mode
Date: Wed, 15 Oct 2025 12:27:22 +0200
Message-ID: <20251015102725.1297985-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_032758_610499_8771C59A 
X-CRM114-Status: GOOD (  17.79  )
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

The DWMAC1000 supports 2 timestamping configurations to configure how
frequency adjustments are made to the ptp_clock, as well as the reported
timestamp values.

There was a previous attempt at upstreaming support for configuring this
mode by Olivier Dautricourt and Julien Beraud a few years back [1]

In a nutshell, the timestamping can be either set in fine mode or in
coarse mode.

In fine mode, which is the default, we use the overflow of an accumulator to
trigger frequency adjustments, but by doing so we lose precision on the
timetamps that are produced by the timestamping unit. The main drawback
is that the sub-second increment value, used to generate timestamps, can't be
set to lower than (2 / ptp_clock_freq).

The "fine" qualification comes from the frequent frequency adjustments we are
able to do, which is perfect for a PTP follower usecase.

In Coarse mode, we don't do frequency adjustments based on an
accumulator overflow. We can therefore have very fine subsecond
increment values, allowing for better timestamping precision. However
this mode works best when the ptp clock frequency is adjusted based on
an external signal, such as a PPS input produced by a GPS clock. This
mode is therefore perfect for a Grand-master usecase.

We therefore attempt to map these 2 modes with the newly introduced
hwtimestamp qualifiers (precise and approx).

Precise mode is mapped to stmmac fine mode, and is the expected default,
suitable for all cases and perfect for follower mode

Approx mode is mapped to coarse mode, suitable for Grand-master.

Changing between these modes is done using ethtool :

 - Fine mode

   ethtool --set-hwtimestamp-cfg eth0 index 0 qualifier precise

 - Coarse mode

   ethtool --set-hwtimestamp-cfg eth0 index 0 qualifier approx

[1] : https://lore.kernel.org/netdev/20200514102808.31163-1-olivier.dautricourt@orolia.com/

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 39fa1ec92f82..0594acbc0ead 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -1192,6 +1192,8 @@ static void stmmac_get_mm_stats(struct net_device *ndev,
 static const struct ethtool_ops stmmac_ethtool_ops = {
 	.supported_coalesce_params = ETHTOOL_COALESCE_USECS |
 				     ETHTOOL_COALESCE_MAX_FRAMES,
+	.supported_hwtstamp_qualifiers = BIT(HWTSTAMP_PROVIDER_QUALIFIER_PRECISE) |
+					 BIT(HWTSTAMP_PROVIDER_QUALIFIER_APPROX),
 	.get_drvinfo = stmmac_ethtool_getdrvinfo,
 	.get_msglevel = stmmac_ethtool_getmsglevel,
 	.set_msglevel = stmmac_ethtool_setmsglevel,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3f79b61d64b9..4859aba10aa3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -675,6 +675,14 @@ static int stmmac_hwtstamp_set(struct net_device *dev,
 
 	priv->systime_flags = STMMAC_HWTS_ACTIVE;
 
+	/* This is the "coarse" mode, where we get lower frequency adjustment
+	 * precision, but better timestamping precision. This is useful when
+	 * acting as a grand-master, as we usually sync with a hgh-previcision
+	 * clock through PPS input. We default to "fine" mode.
+	 */
+	if (config->qualifier == HWTSTAMP_PROVIDER_QUALIFIER_APPROX)
+		priv->systime_flags &= ~PTP_TCR_TSCFUPDT;
+
 	if (priv->hwts_tx_en || priv->hwts_rx_en) {
 		priv->systime_flags |= tstamp_all | ptp_v2 |
 				       ptp_over_ethernet | ptp_over_ipv6_udp |
@@ -684,6 +692,12 @@ static int stmmac_hwtstamp_set(struct net_device *dev,
 
 	stmmac_config_hw_tstamping(priv, priv->ptpaddr, priv->systime_flags);
 
+	/* Switching between coarse/fine mode also requires updating the
+	 * subsecond increment
+	 */
+	if (priv->plat->clk_ptp_rate)
+		stmmac_update_subsecond_increment(priv);
+
 	priv->tstamp_config = *config;
 
 	return 0;
-- 
2.49.0


