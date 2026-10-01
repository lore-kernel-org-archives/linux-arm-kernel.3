Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A669CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuBDExO74epIRwSfRIAR1akFv1FLKuzGN3ASIp3+PmI=; b=suhyXpL5jAtn/6ivqV/Sj2Vwjj
	t4Q4tyZriWJ0BTZFc855qmX8lYpG062omUtXkoqNXYrwfeZrVssaz9iwp5Yu9pkeQmP/Xqh2L0g7X
	120JWVcCZ3qaoUJVteIE2VyUYrDUMAy956DLiLqnn6q7kGHdmOIQeKekO25IIYhzWIFAQVLAhV0q5
	wVdjeFi892JIbipAYXDRZxKHdnZ67St+xMBvQWJ9fuYEPS2IumQcvlQzaY9geIOsnLLoTek+AZCep
	FJUkjbgUVdrULOO4c27QQX8lVd83ipe7r8ZBCwNrmdP8xqJfYKU1tpIgjwZYkrpuR+goSebrjGPqb
	HPyuYcEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGQY-00000009AFK-41UK;
	Thu, 01 Oct 2026 13:02:22 +0000
Received: from mail-wr2-x24.google.com ([2a00:1450:4864:30::24])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGQW-00000009ABF-3K7r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 13:02:21 +0000
Received: by mail-wr2-x24.google.com with SMTP id ffacd0b85a97d-482f63546c3so5056327f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 06:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790859739; x=1791464539; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BuBDExO74epIRwSfRIAR1akFv1FLKuzGN3ASIp3+PmI=;
        b=ZsVbRxTQotIOqCFJWrK926RoquuDm1EXOgtBBu01OjRYD/fmFrIbaiFGAJW5xHOZlM
         L4Iz4BmXvQ36HcQ/Yr9h8VoPzaJOUtGXu33R7Xx9elJLXRXltNdeQevHQ/vM/htoKMwb
         aXwCN+YDlXJYgSZUF5p6ZWPzHVLA0xJoMBOzDdwWStrMVI6DNz6XXbs8tWSxLXEvo8PZ
         QVdkkvc46e137bH5xQyswJYxEm+7H/dzwmuWBw35gz/04PYGeOiSq/SYzP5BVHFB97G5
         KQ9z03lx0PAl5yqKW35t26opWwRmpaZJJjMj4pP/jolsaB+Ubp+h05LfNR1K3c6Fb8ba
         ZPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859739; x=1791464539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BuBDExO74epIRwSfRIAR1akFv1FLKuzGN3ASIp3+PmI=;
        b=0HcwlUyrxE6h2FFdBex+elpoqBTJSNQI7dhezchC2tb2AaedyOj1MK5+bvLnSo9W7z
         AoNuSDWHpn/CnvWZhYkhBCq6/B7cal9SyfP65Ku/wnJ9mIs+Oe3yZ3NMd4pZOXQtZ+aP
         5/kE0zBql0GPejXAnPpsneIfHrWHiDdNgpZJpytCUIccCqJdYjV2E7rx/mNy+mwq5JKe
         uU/c9Yj/wrB+0G88W5XYYL2IJcPs5BVZhlfD7WKX3o7VQLY0Maf3BDPHWodhfHSODkqO
         RIkAlzu6LhVY2k9y3iML8uWdOBmzLg0GQ9H2AtnunO+phhb75+E13h0/QXtJo60w/CSl
         SQZQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3dn+anSqfVItSndi7xv4mB9f4Lx7sMZNbgMEflBbb/+vqgxE5gcLBB//F2J30Vz0hAml5+oi+mwlZBIhOytJe@lists.infradead.org
X-Gm-Message-State: AFq9FYLbRPQ+dPiSSs+BHiz0TeWzznSvPez0j94LRr5alsJoQwBhbIhT
	flqmY0TBOaKMwzUEa1uLYFy5RzPwQfzA2V3qzhRmOndOW6hNwEgTdEhetGd+CiS2K47nZy9FFCf
	NmXuxJPoKce4VVqU=
X-Gm-Gg: AYBFou2+UtzXFAbgUqu2kuTmnPIp9daRHLHK5D7Ye3kJQbYmBs5NHQMyTy0iO/hMlSv
	F/By8DMcAiVVPPZdMCsjuQdMmd8LHjS1pJyidHA22Hf1QENKnjHARtPn/296mGmxOrl/erNeNi0
	0gL3MxVyIoNRnARYgOltGIxL6QP07ls1ttSlVXoK/fB2XA1xH7u9iZI5a4SNvQQeAHehJ/mNSTv
	8+q33GgOFDa4v3WIDHuEE45a5socdMMD4loKTWFRVQQRCZcTYpQjnCsIW7ebpNV9OqimseDIYqV
	MeMwrWJpzqtuL8/UbnLVTmr8Kpem7qqXdv83LhoCVg/xhbEpMW8mYEgXlC5pw2J9oIOtBiwJqzI
	gp83Vmxe3/Tw2gY/ewC9570wgIscpmR5+rw2tRLOGygSrV286Cz3C7s2eE30+zwQhL+gru5FotN
	gI7OaVQLoYpeOSmCVOs2zSQVonMZ+4BUgXl5F/4FoNQipGXCWukQ==
X-Received: by 2002:a05:6000:29c3:b0:48b:10af:f85a with SMTP id ffacd0b85a97d-48b10b000e3mr1098553f8f.42.1790859738771;
        Thu, 01 Oct 2026 06:02:18 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b06a2cd0fsm5568155f8f.30.2026.10.01.06.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:02:18 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v5 3/3] net: dsa: let user ports wait for a PHY that probes late
Date: Thu,  1 Oct 2026 16:02:08 +0300
Message-ID: <20261001130208.105558-4-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001130208.105558-1-f@lex.la>
References: <20261001130208.105558-1-f@lex.la>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_060220_848304_944B5426 
X-CRM114-Status: GOOD (  16.92  )
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

A user port connects its PHY once, when the switch sets up its ports.
If that PHY needs firmware from the host and its driver is a module not
loaded yet, the port gets no working PHY for the rest of the uptime.

Let a switch driver opt its user ports in to phylink waiting for such a
PHY, and opt in mt7530. Until the PHY attaches, .port_enable sees a NULL
phy, so the opt-in is per driver: qca8k dereferences that argument, and
gswip programs the PHY address from it at open, so a late attach leaves
it wrong until the next open. mt7530 does not use it. Shared ports are
left out.

Found on a Keenetic KN-1012 (MT7981B with an MT7531 switch), where the
EN8811H behind lan4 has its driver on the root filesystem and lan4 was
lost for the uptime.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
New in v5.

 drivers/net/dsa/mt7530.c | 1 +
 include/net/dsa.h        | 5 +++++
 net/dsa/user.c           | 1 +
 3 files changed, 7 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 7781a63b4e6f..e4c155605e27 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3548,6 +3548,7 @@ mt7530_probe_common(struct mt7530_priv *priv)
 	priv->ds->priv = priv;
 	priv->ds->ops = &mt7530_switch_ops;
 	priv->ds->phylink_mac_ops = &mt753x_phylink_mac_ops;
+	priv->ds->phy_may_probe_late = true;
 	mutex_init(&priv->reg_mutex);
 	spin_lock_init(&priv->stats_lock);
 	INIT_DELAYED_WORK(&priv->stats_work, mt7530_stats_poll);
diff --git a/include/net/dsa.h b/include/net/dsa.h
index 5d12191b6f6f..f7e78c3a123d 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -455,6 +455,11 @@ struct dsa_switch {
 	 */
 	u32			dscp_prio_mapping_is_global:1;
 
+	/* Drivers whose .port_enable copes with a NULL phy may set this to
+	 * let user ports wait for a PHY that needs host firmware.
+	 */
+	u32			phy_may_probe_late:1;
+
 	/* Listener for switch fabric events */
 	struct notifier_block	nb;
 
diff --git a/net/dsa/user.c b/net/dsa/user.c
index 041f9060c8ef..41075bb74193 100644
--- a/net/dsa/user.c
+++ b/net/dsa/user.c
@@ -2661,6 +2661,7 @@ static int dsa_user_phy_setup(struct net_device *user_dev)
 
 	dp->pl_config.dev = &user_dev->dev;
 	dp->pl_config.type = PHYLINK_NETDEV;
+	dp->pl_config.phy_may_probe_late = ds->phy_may_probe_late;
 
 	/* The get_fixed_state callback takes precedence over polling the
 	 * link GPIO in PHYLINK (see phylink_get_fixed_state).  Only set
-- 
2.53.0


