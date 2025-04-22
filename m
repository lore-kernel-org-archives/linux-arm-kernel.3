Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E39C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 03:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SDYeWIcghDPOUTBi+oeQBs8DGHA2nvFig8sm3B/SHMY=; b=igBFNZjGLhZfXiREprmWxkZoNG
	Kxq+NiOpfynCrWcXQf/XsgQ5L1qqqTiIDzDWuxq/NZ8GoLzD6gxaD/wyPcr5acdnyuwlmyRnxiR2I
	g22JtZUR7eK6OTaZQSuZxLCh27hwwLjLi2IcMukMnIqmeshlWP/A548QeSHsVNxq1/DUVuO89T3fX
	RoDSfKFQLiYkRbNNjvYdHnOnfQx7cS6ezyEyfgqGf5y1Wmi1JI25ciazyOX8o8adXb47L1iQ/dw7O
	Xf5FQ+Zr6mczXxTlptR6LXAeUXK0WP5xj6vzwC5h4RmIWZsu39Cmiv2USqz0RxFgdchayzvbVzCzf
	KHVUaZiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7441-00000005iKE-06Lo;
	Tue, 22 Apr 2025 03:12:49 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7428-00000005iCu-1vho;
	Tue, 22 Apr 2025 03:10:53 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1u73zC-000000005M0-0aoj;
	Tue, 22 Apr 2025 03:10:28 +0000
Date: Tue, 22 Apr 2025 04:10:20 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>, Neal Yen <neal.yen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net] net: dsa: mt7530: sync driver-specific behavior of
 MT7531 variants
Message-ID: <89ed7ec6d4fa0395ac53ad2809742bb1ce61ed12.1745290867.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_201052_500324_857AD2B3 
X-CRM114-Status: GOOD (  10.04  )
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

MT7531 standalone and MMIO variants found in MT7988 and EN7581 share
most basic properties. Despite that, assisted_learning_on_cpu_port and
mtu_enforcement_ingress were only applied for MT7531 but not for MT7988
or EN7581, causing the expected issues on MMIO devices.

Apply both settings equally also for MT7988 and EN7581 by moving both
assignments form mt7531_setup() to mt7531_setup_common().

This fixes unwanted flooding of packets due to unknown unicast
during DA lookup, as well as issues with heterogenous MTU settings.

Fixes: 7f54cc9772ce ("net: dsa: mt7530: split-off common parts from mt7531_setup")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
See also https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/b4204fb062d60ac57791c90a11d05cf75269dcbd

 drivers/net/dsa/mt7530.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index d70399bce5b9..c5d6628d7980 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2419,6 +2419,9 @@ mt7531_setup_common(struct dsa_switch *ds)
 	struct mt7530_priv *priv = ds->priv;
 	int ret, i;
 
+	ds->assisted_learning_on_cpu_port = true;
+	ds->mtu_enforcement_ingress = true;
+
 	mt753x_trap_frames(priv);
 
 	/* Enable and reset MIB counters */
@@ -2571,9 +2574,6 @@ mt7531_setup(struct dsa_switch *ds)
 	if (ret)
 		return ret;
 
-	ds->assisted_learning_on_cpu_port = true;
-	ds->mtu_enforcement_ingress = true;
-
 	return 0;
 }
 
-- 
2.49.0


