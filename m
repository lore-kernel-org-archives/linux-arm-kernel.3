Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB66CCD18A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 19:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tw4U5ow5h6FPqPQ3p8BSDeHqWyCqOyJva3sSK1gq9wU=; b=s9Qa0kAAmhEzEnF4CC7xZRQtnM
	arbF/T4CZSalBEKlpT4KUA6r1/u73mwavBl7ixrEAyX8fupwG1dLk08zT/x6xjrFGKVI3SsRo6JqX
	gyCpmtbFDlC1Ur0kMlWGQguJSb5QyRo1p6KELik1RkhBtiSiDvCj8w4+jE38w9mHerJg8HfnLLv+V
	UkZMEylLlRGASo6gZmmcqREuBMhFCNiPy901wxOG6BzyFKxC4f8rg6Vr4XFqSVeu9tkRG2rjXefwl
	XsJrt2Iu1eze+dMRlW/xKHVYCsGIcywAILyJR9gZH3QJlM98XiYXV2PisQ+23LryeN42LBOSF/ala
	BlyvgFpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6wM8-000000071H6-3nDa;
	Thu, 09 Oct 2025 19:31:16 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6wM5-000000071GL-3IwL;
	Thu, 09 Oct 2025 19:31:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=tw4U5ow5h6FPqPQ3p8BSDeHqWyCqOyJva3sSK1gq9wU=; b=Rrpy17nByDvTXKcuvVcCQjnAxY
	f9ogDmNV3bsmRAENNWoDza9zFVKIH67/47SuVb5HpoNwc7vaANXPbKlE4nB3qdZGbF1smYFADF0qI
	6r18qMIVLMEvXN2gYVo24ogGgEp4+L98xTY03FAY9WuYazvY/73mxctrf7jfsj8jG3eJvbEzuJl69
	CkM9cd++SdDajDgT36qFIaSEi0+mS3ehzX/lc+4unZHys3//PsDXh2GdrF4LXovYFTJiu60ziXn98
	KgEbfX+wh5FI6fUYcXKrR9KzJrOkcFyrwtsixT6f8GC05B4kQxd0p1wWMFYIsRxXuCnPXv0QH/lR3
	dVCaodVw==;
Received: from i53875bdd.versanet.de ([83.135.91.221] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v6wLW-000644-3I; Thu, 09 Oct 2025 21:30:38 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: damon.ding@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com
Cc: m.szyprowski@samsung.com,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH] drm/bridge: analogix_dp: Fix connector status detection for bridges
Date: Thu,  9 Oct 2025 21:30:28 +0200
Message-ID: <20251009193028.4952-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_123113_870833_E463A5F3 
X-CRM114-Status: GOOD (  17.50  )
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

Right now if there is a next bridge attached to the analogix-dp controller
the driver always assumes this bridge is connected to something, but this
is of course not always true, as that bridge could also be a hotpluggable
dp port for example.

On the other hand, as stated in commit cb640b2ca546 ("drm/bridge: display-
connector: don't set OP_DETECT for DisplayPorts"), "Detecting the monitor
for DisplayPort targets is more complicated than just reading the HPD pin
level" and we should be "letting the actual DP driver perform detection."

So use drm_bridge_detect() to detect the next bridge's state but ignore
that bridge if the analogix-dp is handling the hpd-gpio.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
As this patch stands, it would go on top of v6 of Damon's bridge-connector
work, but could very well be also integrated into one of the changes there.

I don't know yet if my ordering and/or reasoning is the correct one or if
a better handling could be done, but with that change I do get a nice
hotplug behaviour on my rk3588-tiger-dp-carrier board, where the
Analogix-DP ends in a full size DP port.

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index c04b5829712b..cdc56e83b576 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -983,8 +983,12 @@ analogix_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *conne
 	struct analogix_dp_device *dp = to_dp(bridge);
 	enum drm_connector_status status = connector_status_disconnected;
 
-	if (dp->plat_data->next_bridge)
-		return connector_status_connected;
+	/*
+	 * An optional next bridge should be in charge of detection the
+	 * connection status, except if we manage a actual hpd gpio.
+	 */
+	if (dp->plat_data->next_bridge && !dp->hpd_gpiod)
+		return drm_bridge_detect(dp->plat_data->next_bridge, connector);
 
 	if (!analogix_dp_detect_hpd(dp))
 		status = connector_status_connected;
-- 
2.47.2


