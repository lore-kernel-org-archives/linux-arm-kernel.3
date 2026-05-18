Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3049BCD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 18:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fYmxPzn2Z9iehS0fAf63Ttmw7rvgQXUScT2oAp7xhm8=; b=WjJsIIcY01NOuHYPqmGU0Bs/Z/
	KhNr6dlzAkUMQgpTzPZ36LL6LiudCuyvTHzGnioUPANYnG1MKIzhZH+39YG6WM8OHldW8HxXwiyZr
	3IpaUIrQueZYKyXJ1O9RUEMpXcdxVLMS+lMLXpF0OUXMCmhqUk8A9W+uuizqxzuhXJYgFyTHPdUS/
	pEDOK7U0llY6Ay+brLqDX2ymBxOBQGCkUp7NtEgeuDe4ZEk3nDc//GjY3vr+52gy4Ol8pTCyjum9+
	KCQLlNI7G1fy9mNPqR2QfxlW8gH0LAVIDChv5M1VxX9V9aL12sp4KuaQPKsQnC3Fp6KIUUoT5yZci
	K8RB7HMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2Jc-0000000GUSf-0bdm;
	Mon, 18 May 2026 18:03:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2JZ-0000000GULb-0EpU
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 18:03:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fYmxPzn2Z9iehS0fAf63Ttmw7rvgQXUScT2oAp7xhm8=; b=n9Ja2z8Z8J3/4HdbuWF6qsn1ON
	g7IXbfc6XBIJQIt4toR91zouA7yeu7Hwz/KmlAc8taDrdRftwhLEkXmyZkBow4mKwEp/ZRWvYwGtm
	QBs/Fzs9nq9oSM9TfM1OjEwX3UCcda0foE9w/vY/F9pHPzk4G5r/vrODRVD4fjl85s/uzSL7YG+74
	gAWzjLecm8cQrIXiL8RQjTSXHBmyqTiB5/BpLlch64qxJS+WJwcg7OFT54tLTgYnRH1Hx+EDIT9qO
	nacDwuVGMOhRaAixiMNOeUiibt1JIII4oin97BwtVR8kenKrqsQ+zv5xribe9euHWMV4wWuJ6sRhJ
	7cYkwz8g==;
Received: from smtp.forwardemail.net ([149.28.215.223])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2JP-0000000Bzrv-2zv6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 18:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779127398; bh=fYmxPzn2Z9iehS0fAf63Ttmw7rvgQXUScT2oAp7xhm8=;
 b=PGId3RV/6fjfo/Tj4KK2HqiWW8L/iqov7gV0HXa93iAU8QGoXw8iFd4EqooLvmOA/b7DoS7f4
 lEqIyk3cBVCHY+g/u+rZxR30scM87OquVTCMG4QICUMB0pZElwCIdiSAa0+Ow7LRMrJGqZulADB
 CW5nbaH++t1Ya11yYU1bjpgBZzraVgEMSapzDPqv7RmpeBC3HdajSic1LkJ8R2z0ZaPJn5zCra4
 xe8EezQ8G5zuqWps3HyH/+9/wltEW4J9tztMTjHL1kaZa4qYDtZ/ZMCQkS5NQ0iJrMEy/9tNg4Z
 tUAHFzB9flFva1WztmtHX9ttq8X5TSUovMXaLgzPGr1A==
X-Forward-Email-ID: 6a0b542db84dbc72d2274dca
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Lucas Stach <l.stach@pengutronix.de>
Cc: Liu Ying <victor.liu@nxp.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 02/23] drm: bridge: dw_hdmi: Only notify connected status on HPD interrupt
Date: Mon, 18 May 2026 18:01:38 +0000
Message-ID: <20260518180206.2480119-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518180206.2480119-1-jonas@kwiboo.se>
References: <20260518180206.2480119-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_190338_258322_109453E6 
X-CRM114-Status: GOOD (  14.69  )
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

drm_helper_hpd_irq_event() and drm_bridge_hpd_notify() may incorrectly
be called with a connected status when HPD is high and RX sense is
changed. This typically happens when the HDMI cable is unplugged,
shortly before the HPD is changed to low.

The original intent of commit da09daf88108 ("drm: bridge: dw_hdmi: only
trigger hotplug event on link change") was to signal hotplug event at
correct interrupt states.

Based on the commit message the intent was to trigger hotplug event:
- when HPD goes high (plugin)
- when both HPD and RX sense has gone low (plugout)

However, following interrupt state changes can typically be observed
when the HDMI cable is unplugged:
- RX interrupt:  HPD=high RX=low  -> triggers a connected event
- HPD interrupt: HPD=low  RX=low  -> triggers a disconnected event

Fix this by only notify connected status on the HPD interrupt when HPD
is going high, not on the RX sense interrupt when RX sense is changed.

After this a connected event should be triggered when HPD=high at HPD
interrupt, and a disconnected event should be triggered when both
HPD=low and RX=low at either HPD or RX interrupt.

Fixes: da09daf88108 ("drm: bridge: dw_hdmi: only trigger hotplug event on link change")
Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v7: No change
v6: Collect t-b tag
v5: No change
v4: Collect r-b tag
v3: Update commit message
v2: New patch
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index d3e6a6562870..b7bfc0e9a6b2 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3157,7 +3157,8 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 			mutex_unlock(&hdmi->cec_notifier_mutex);
 		}
 
-		if (phy_stat & HDMI_PHY_HPD)
+		if ((intr_stat & HDMI_IH_PHY_STAT0_HPD) &&
+		    (phy_stat & HDMI_PHY_HPD))
 			status = connector_status_connected;
 
 		if (!(phy_stat & (HDMI_PHY_HPD | HDMI_PHY_RX_SENSE)))
-- 
2.54.0


