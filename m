Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD82C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 21:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=alhSdTU+WSc1RGEtM98aWp0kuu26VmSDDIWj2jWxOk4=; b=EDBf/lix1GyUYwz1HwswyN7DZd
	hMa0f3wxtwAxpRB0xsnRIep7yupsLvfdcaax2mlYlRjULqk/db/9JZ8GVfOFqpO/703qZFMBfSXN1
	m682HLdcwmJ+8+rWDeaOm2DTfi+2XNb0DwXqvDu0/Hd2tavx+gAZM+71t1KOY/QmF7iwe//e+BK29
	/laTW2jNXZC5Id4BvdsSlPLu+js3pLoqTT0dPJctmuVmBeO322yEsXVyNSSBXejuRdq6S2Y8EgJs5
	+6/9K1PgPSQdroFu/FLWBcKmrjgQErIY9RfkLYQSQRO/qGO84WrYR00Fa8TbSo3Rg1pEdsMvPdvRj
	caaaLajg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x58gC-000000009jZ-31Nv;
	Fri, 11 Sep 2026 21:21:04 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x58g9-000000009iE-2vKv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 21:21:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8D9CB1A0226;
	Fri, 11 Sep 2026 21:20:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A4E4601A3;
	Fri, 11 Sep 2026 21:20:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B16EB11C7A9DC;
	Fri, 11 Sep 2026 23:20:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789161652; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=alhSdTU+WSc1RGEtM98aWp0kuu26VmSDDIWj2jWxOk4=;
	b=tBMMVrjGExTfza6tHxixi2E+c8uLvUSDYTqcN156DvKYWt5NUSaZLSzWtVj8EYtH/oBCUJ
	9JbUbrKqPo1l0DaAJbHGqwXt/0IK2NROJmg0MS35VcYP5AssMC+FikufJ4uTUSi3tkSOMw
	41NLKgQEqi7/A9mAJ53odWu7KMMhtkr4qZ92kKScgScyXKOZKKogRYZUmj7VQto9XvsH0Z
	npzqg5vD6Ft4wP+UtQW2mzaopqWe7yIlmrY6mrNqvmEErJbyd4aeRcKW4mUFcGr+JeMRbs
	mJAxdXr0JAJLcE1h6eK/ywakOGkcEyVQD9HKCwEQIe4wtGUZP2GNUmDBdwKeBw==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Minda Chen <minda.chen@starfivetech.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Jose.Abreu@synopsys.com,
	Nicolai Buchwitz <nb@tipi-net.de>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	PKneuper@dspace.de,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH net v3 1/6] net: stmmac: selftests: Support running selftests on DSA conduits
Date: Fri, 11 Sep 2026 23:20:21 +0200
Message-ID: <20260911212028.1497613-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911212028.1497613-1-maxime.chevallier@bootlin.com>
References: <20260911212028.1497613-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_142101_885471_B30F8870 
X-CRM114-Status: GOOD (  17.04  )
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

Most stmmac selftests rely on dev_add_pack() to add custom handlers,
that validate the packets sent to ourselves through MAC loopback.

However, when the stmmac-driven interface is a DSA CPU conduit, all
frames that are received have ETH_P_XDSA as a protocol, even though they
don't actually contain any tag as they come from the loopback and not
the switch.

This will prevent any incoming packet to match our packet handlers.

Let's register a ETH_P_ALL packet handler when we detect that we're a
DSA conduit, and use a proxy packet handler to filter the h_proto.

Note that we may still receive incoming packets from the switch, but
these frames shouldn't interfere with the very specific frames used for
selftests, and stmmac selftests in general aren't safe against external
traffic interferences.

This was validated on a WPQ864 devkit for IPQ8064, that has the SoC
connected to a QCA8k switch.

The ARP offload's packet handler is left alone, this feature is just not
implemented in stmmac and due for removal.

Fixes: 091810dbded9 ("net: stmmac: Introduce selftests support")
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 .../stmicro/stmmac/stmmac_selftests.c         | 68 ++++++++++++++++---
 1 file changed, 58 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index 6372ec7c3f31..6503678b646e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -12,6 +12,7 @@
 #include <linux/ethtool.h>
 #include <linux/ip.h>
 #include <linux/udp.h>
+#include <net/dsa.h>
 #include <net/pkt_cls.h>
 #include <net/pkt_sched.h>
 #include <net/tcp.h>
@@ -237,6 +238,9 @@ struct stmmac_test_priv {
 	struct stmmac_packet_attrs *packet;
 	struct packet_type pt;
 	struct completion comp;
+	__be16 packet_type;
+	int (*func)(struct sk_buff *skb, struct net_device *ndev,
+		    struct packet_type *pt, struct net_device *orig_ndev);
 	int double_vlan;
 	int vlan_id;
 	int ok;
@@ -316,6 +320,50 @@ static int stmmac_test_loopback_validate(struct sk_buff *skb,
 	return 0;
 }
 
+static int stmmac_sft_filter(struct sk_buff *skb, struct net_device *ndev,
+			     struct packet_type *pt,
+			     struct net_device *orig_ndev)
+{
+	struct stmmac_test_priv *tpriv = pt->af_packet_priv;
+	struct ethhdr *hdr = eth_hdr(skb);
+	int ret = 0;
+
+	if (hdr->h_proto == tpriv->packet_type) {
+		struct sk_buff *nskb = skb_clone(skb, GFP_ATOMIC);
+
+		if (nskb)
+			ret = tpriv->func(nskb, ndev, pt, orig_ndev);
+	}
+
+	kfree_skb(skb);
+	return ret;
+}
+
+static void stmmac_sft_add_pack(struct packet_type *pt)
+{
+	struct stmmac_test_priv *tpriv = pt->af_packet_priv;
+
+	if (netdev_uses_dsa(tpriv->pt.dev)) {
+		tpriv->packet_type = tpriv->pt.type;
+		tpriv->func = tpriv->pt.func;
+
+		/* DSA conduit will report ETH_P_XDSA, so our packet handler
+		 * won't match. Let's register a ETH_P_ALL match and filter
+		 * manually in stmmac_sft_filter.
+		 */
+		tpriv->pt.type = htons(ETH_P_ALL);
+		tpriv->pt.func = stmmac_sft_filter;
+		tpriv->pt.ignore_outgoing = true;
+	}
+
+	dev_add_pack(pt);
+}
+
+static void stmmac_sft_remove_pack(struct packet_type *pt)
+{
+	dev_remove_pack(pt);
+}
+
 static int __stmmac_test_loopback(struct stmmac_priv *priv,
 				  struct stmmac_packet_attrs *attr)
 {
@@ -337,7 +385,7 @@ static int __stmmac_test_loopback(struct stmmac_priv *priv,
 	tpriv->packet = attr;
 
 	if (!attr->dont_wait)
-		dev_add_pack(&tpriv->pt);
+		stmmac_sft_add_pack(&tpriv->pt);
 
 	skb = stmmac_test_get_udp_skb(priv, attr);
 	if (!skb) {
@@ -360,7 +408,7 @@ static int __stmmac_test_loopback(struct stmmac_priv *priv,
 
 cleanup:
 	if (!attr->dont_wait)
-		dev_remove_pack(&tpriv->pt);
+		stmmac_sft_remove_pack(&tpriv->pt);
 	kfree(tpriv);
 	return ret;
 }
@@ -767,7 +815,7 @@ static int stmmac_test_flowctrl(struct stmmac_priv *priv)
 	tpriv->pt.func = stmmac_test_flowctrl_validate;
 	tpriv->pt.dev = priv->dev;
 	tpriv->pt.af_packet_priv = tpriv;
-	dev_add_pack(&tpriv->pt);
+	stmmac_sft_add_pack(&tpriv->pt);
 
 	/* Compute minimum number of packets to make FIFO full */
 	pkt_count = rx_fifo_size;
@@ -823,7 +871,7 @@ static int stmmac_test_flowctrl(struct stmmac_priv *priv)
 cleanup:
 	dev_mc_del(priv->dev, paddr);
 	dev_set_promiscuity(priv->dev, -1);
-	dev_remove_pack(&tpriv->pt);
+	stmmac_sft_remove_pack(&tpriv->pt);
 	kfree(tpriv);
 	return ret;
 }
@@ -928,7 +976,7 @@ static int __stmmac_test_vlanfilt(struct stmmac_priv *priv)
 	 * HASH values.
 	 */
 	tpriv->vlan_id = 0x123;
-	dev_add_pack(&tpriv->pt);
+	stmmac_sft_add_pack(&tpriv->pt);
 
 	ret = vlan_vid_add(priv->dev, htons(ETH_P_8021Q), tpriv->vlan_id);
 	if (ret)
@@ -968,7 +1016,7 @@ static int __stmmac_test_vlanfilt(struct stmmac_priv *priv)
 vlan_del:
 	vlan_vid_del(priv->dev, htons(ETH_P_8021Q), tpriv->vlan_id);
 cleanup:
-	dev_remove_pack(&tpriv->pt);
+	stmmac_sft_remove_pack(&tpriv->pt);
 	kfree(tpriv);
 	return ret;
 }
@@ -1022,7 +1070,7 @@ static int __stmmac_test_dvlanfilt(struct stmmac_priv *priv)
 	 * HASH values.
 	 */
 	tpriv->vlan_id = 0x123;
-	dev_add_pack(&tpriv->pt);
+	stmmac_sft_add_pack(&tpriv->pt);
 
 	ret = vlan_vid_add(priv->dev, htons(ETH_P_8021AD), tpriv->vlan_id);
 	if (ret)
@@ -1062,7 +1110,7 @@ static int __stmmac_test_dvlanfilt(struct stmmac_priv *priv)
 vlan_del:
 	vlan_vid_del(priv->dev, htons(ETH_P_8021AD), tpriv->vlan_id);
 cleanup:
-	dev_remove_pack(&tpriv->pt);
+	stmmac_sft_remove_pack(&tpriv->pt);
 	kfree(tpriv);
 	return ret;
 }
@@ -1293,7 +1341,7 @@ static int stmmac_test_vlanoff_common(struct stmmac_priv *priv, bool svlan)
 	tpriv->pt.af_packet_priv = tpriv;
 	tpriv->packet = &attr;
 	tpriv->vlan_id = 0x123;
-	dev_add_pack(&tpriv->pt);
+	stmmac_sft_add_pack(&tpriv->pt);
 
 	ret = vlan_vid_add(priv->dev, htons(proto), tpriv->vlan_id);
 	if (ret)
@@ -1320,7 +1368,7 @@ static int stmmac_test_vlanoff_common(struct stmmac_priv *priv, bool svlan)
 vlan_del:
 	vlan_vid_del(priv->dev, htons(proto), tpriv->vlan_id);
 cleanup:
-	dev_remove_pack(&tpriv->pt);
+	stmmac_sft_remove_pack(&tpriv->pt);
 	kfree(tpriv);
 	return ret;
 }
-- 
2.55.0


